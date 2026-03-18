#!/usr/bin/env python3
"""Generate RESULTS_CONSTANT.md and RESULTS_BURST.md from benchmark artifacts."""

import json
import os
import statistics
import sys
from collections import defaultdict
from pathlib import Path


def find_results(artifacts_dir):
    """Find all k6_summary.json files and their associated metadata."""
    results = []
    for summary_path in Path(artifacts_dir).rglob("k6_summary.json"):
        result_dir = summary_path.parent
        metadata_path = result_dir / "metadata.json"
        if not metadata_path.exists():
            print(f"  Skipping {summary_path} (no metadata.json)")
            continue

        with open(metadata_path) as f:
            metadata = json.load(f)
        with open(summary_path) as f:
            summary = json.load(f)

        txt_path = result_dir / "k6_summary.txt"
        k6_txt = txt_path.read_text() if txt_path.exists() else ""

        results.append({
            "metadata": metadata,
            "summary": summary,
            "k6_txt": k6_txt,
        })
    return results


def extract_rps(summary):
    """Extract RPS from k6 summary JSON."""
    return int(summary.get("metrics", {}).get("http_reqs", {}).get("values", {}).get("rate", 0))


def extract_metrics(summary):
    """Extract key metrics from k6 summary JSON."""
    metrics = summary.get("metrics", {})

    http_reqs = metrics.get("http_reqs", {}).get("values", {})
    http_duration = metrics.get("http_req_duration", {}).get("values", {})
    http_failed = metrics.get("http_req_failed", {}).get("values", {})
    success_rate = metrics.get("success_rate", {}).get("values", {})

    rps = http_reqs.get("rate", 0)
    total = int(http_reqs.get("count", 0))
    failed = int(http_failed.get("passes", 0))  # passes = matched "failed" condition
    avg_ms = http_duration.get("avg", 0)
    p95_ms = http_duration.get("p(95)", 0)

    # Determine notes from success_rate and check failures
    sr_fails = int(success_rate.get("fails", 0))
    notes = ""
    if sr_fails > 0:
        notes = f"non-compatible response structure ({sr_fails})"
    elif failed > 0:
        notes = f"{failed} failed requests"

    return {
        "rps": int(rps),
        "total": total,
        "failed": failed,
        "sr_fails": sr_fails,
        "has_error": (sr_fails > 0 or failed > 0),
        "avg_ms": avg_ms,
        "p95_ms": p95_ms,
        "notes": notes,
    }


def normalize_subgraph_tech(value):
    """Normalize subgraph technology labels for stable grouping keys."""
    tech = str(value or "").strip().lower()
    if tech in {"rust", ".net", "net"}:
        return ".net" if tech in {"net", ".net"} else "rust"
    return tech or "unknown"


def get_gateway_name(metadata):
    """Get gateway identifier."""
    return metadata.get("gateway", metadata.get("display_name", "unknown"))


def get_subgraph_tech(metadata):
    """Get subgraph technology label."""
    tech = normalize_subgraph_tech(metadata.get("subgraph_tech", ""))
    if tech in {"rust", ".net"}:
        return tech

    variant = str(metadata.get("subgraphs", "")).strip().lower()
    if variant == "subgraphs-rust":
        return "rust"
    if variant == "subgraphs-net":
        return ".net"

    display_name = str(metadata.get("display_name", "")).lower()
    if "(.net subgraphs)" in display_name or "(net subgraphs)" in display_name:
        return ".net"
    if "(rust subgraphs)" in display_name:
        return "rust"

    return "unknown"


def get_version(metadata):
    """Get version string."""
    return metadata.get("version", "")


def collect_hardware_profiles(results):
    """Collect unique benchmark hardware profiles from metadata."""
    profiles = defaultdict(int)
    for r in results:
        metadata = r.get("metadata", {})
        profile = (
            str(metadata.get("machine_hostname", "")).strip(),
            str(metadata.get("machine_os", "")).strip(),
            str(metadata.get("machine_cpu", "")).strip(),
            str(metadata.get("machine_cores", "")).strip(),
            str(metadata.get("machine_ram", "")).strip(),
        )
        if any(profile):
            profiles[profile] += 1
    return sorted(profiles.items(), key=lambda item: item[1], reverse=True)


def parse_expected_gateways_env(var_name):
    """Parse expected gateway list from environment variable JSON."""
    raw = os.environ.get(var_name, "").strip()
    if not raw:
        return []
    try:
        parsed = json.loads(raw)
    except json.JSONDecodeError as exc:
        print(f"Warning: failed to parse {var_name}: {exc}")
        return []
    if not isinstance(parsed, list):
        print(f"Warning: {var_name} is not a list, ignoring.")
        return []
    return parsed


def to_expected_gateway_entry(item):
    """Convert matrix entry into normalized expected gateway descriptor."""
    name = str(item.get("name", "")).strip()
    base_name = str(item.get("base_name", "")).strip()
    gateway = base_name or name

    subgraph_tech = normalize_subgraph_tech(item.get("subgraph_tech", ""))
    if subgraph_tech == "unknown":
        if name.endswith("-rust"):
            subgraph_tech = "rust"
        elif name.endswith("-net"):
            subgraph_tech = ".net"

    if not gateway and name.endswith("-rust"):
        gateway = name[:-5]
    elif not gateway and name.endswith("-net"):
        gateway = name[:-4]

    display_name = str(item.get("display_name", "")).strip()
    if not display_name and gateway:
        display_name = f"{gateway} ({subgraph_tech} subgraphs)"

    if not gateway:
        return None

    return {
        "gateway": gateway,
        "subgraph_tech": subgraph_tech,
        "display_name": display_name or gateway,
    }


def dedupe_expected_gateways(entries):
    """Drop duplicate expected gateways by (gateway, subgraph_tech)."""
    deduped = []
    seen = set()
    for entry in entries:
        if not entry:
            continue
        key = (entry["gateway"], entry["subgraph_tech"])
        if key in seen:
            continue
        seen.add(key)
        deduped.append(entry)
    return deduped


def load_expected_gateways_by_mode():
    """Load expected gateways for each benchmark mode from env."""
    expected_all_raw = parse_expected_gateways_env("EXPECTED_GATEWAYS_JSON")
    expected_net_raw = parse_expected_gateways_env("EXPECTED_GATEWAYS_NET_JSON")

    expected_all = dedupe_expected_gateways(
        [to_expected_gateway_entry(item) for item in expected_all_raw]
    )
    expected_net = dedupe_expected_gateways(
        [to_expected_gateway_entry(item) for item in expected_net_raw]
    )

    if not expected_net and expected_all:
        expected_net = [e for e in expected_all if e["subgraph_tech"] == ".net"]

    return {
        "constant": expected_all,
        "burst": expected_all,
        "ramping": expected_all,
        "constant-latency": expected_net,
    }


def merge_failed_expected_entries(entries, expected_entries):
    """Append placeholders for gateways with no successful result artifact."""
    existing_keys = {(e["gateway"], e["subgraph_tech"]) for e in entries}
    merged = list(entries)

    missing = [
        expected for expected in expected_entries
        if (expected["gateway"], expected["subgraph_tech"]) not in existing_keys
    ]
    missing.sort(key=lambda e: e["gateway"])

    for expected in missing:
        merged.append({
            "gateway": expected["gateway"],
            "subgraph_tech": expected["subgraph_tech"],
            "version": "",
            "median_rps": None,
            "best_rps": None,
            "worst_rps": None,
            "cv_pct": None,
            "notes": "benchmark run failed",
            "metrics": {},
            "k6_txt": "",
            "summary": {},
            "display_name": expected.get("display_name", expected["gateway"]),
            "failed_run": True,
        })
    return merged


def has_any_expected_gateways(expected_by_mode):
    """Check whether any mode has expected gateways configured."""
    return any(expected_by_mode.get(mode) for mode in expected_by_mode)


def sort_entries(entries):
    """Sort successful entries by performance and failed placeholders last."""
    return sorted(
        entries,
        key=lambda e: (
            1 if e.get("failed_run") or e.get("median_rps") is None else 0,
            -(e["median_rps"] or 0),
            e["gateway"],
        ),
    )


def format_metric(value):
    """Format numeric table cells or emit em dash for unavailable values."""
    if value is None:
        return "—"
    return f"{int(value):,}"


def format_cv(value):
    """Format CV% table cells or emit em dash for unavailable values."""
    if value is None:
        return "—"
    return f"{float(value):.1f}%"


def select_median_runs(results):
    """Group runs by gateway, compute aggregate stats (median, best, worst, CV%)."""
    groups = defaultdict(list)
    for r in results:
        metadata = r["metadata"]
        name = get_gateway_name(metadata)
        subgraph_tech = get_subgraph_tech(metadata)
        version = get_version(r["metadata"])
        rps = extract_rps(r["summary"])
        metrics = extract_metrics(r["summary"])
        groups[(name, subgraph_tech)].append({
            "result": r,
            "rps": rps,
            "version": version,
            "metrics": metrics,
            "display_name": metadata.get("display_name", f"{name} ({subgraph_tech} subgraphs)"),
        })

    selected = []
    for (gateway, subgraph_tech), runs in groups.items():
        total_run_count = len(runs)
        successful_runs = [r for r in runs if not r["metrics"]["has_error"]]
        errored_runs = [r for r in runs if r["metrics"]["has_error"]]
        successful_run_count = len(successful_runs)

        median_run = None
        median_rps = None
        best_rps = None
        worst_rps = None
        cv_pct = None

        if successful_runs:
            successful_runs.sort(key=lambda x: x["rps"])
            successful_rps = [r["rps"] for r in successful_runs]
            n_success = len(successful_rps)
            median_idx = n_success // 2
            median_run = successful_runs[median_idx]
            median_rps = median_run["rps"]
            best_rps = max(successful_rps)
            worst_rps = min(successful_rps)

            if n_success > 1 and median_rps > 0:
                stdev = statistics.stdev(successful_rps)
                cv_pct = round(stdev / median_rps * 100, 1)
            else:
                cv_pct = 0.0

        version = runs[0]["version"]

        # Aggregate errors across ALL runs.
        total_failed = sum(r["metrics"]["failed"] for r in runs)
        total_sr_fails = sum(r["metrics"]["sr_fails"] for r in runs)
        runs_with_errors = len(errored_runs)

        notes = ""
        if total_sr_fails > 0:
            notes = f"non-compatible response ({total_sr_fails} across {runs_with_errors}/{total_run_count} runs)"
        elif total_failed > 0:
            notes = f"{total_failed} failed requests across {runs_with_errors}/{total_run_count} runs"

        if successful_runs:
            successful_rps_str = ", ".join(str(r["rps"]) for r in successful_runs)
            print(
                f"  {gateway} [{subgraph_tech}]: total={total_run_count}, successful={successful_run_count}, "
                f"errors={runs_with_errors}, successful RPS=[{successful_rps_str}], "
                f"median={median_rps}, best={best_rps}, worst={worst_rps}, CV={cv_pct}%"
            )
            selected.append({
                "gateway": gateway,
                "subgraph_tech": subgraph_tech,
                "version": version,
                "median_rps": median_rps,
                "best_rps": best_rps,
                "worst_rps": worst_rps,
                "cv_pct": cv_pct,
                "notes": notes,
                "metrics": median_run["metrics"],
                "k6_txt": median_run["result"]["k6_txt"],
                "summary": median_run["result"]["summary"],
                "display_name": runs[0]["display_name"],
            })
        else:
            print(
                f"  {gateway} [{subgraph_tech}]: total={total_run_count}, successful=0, errors={runs_with_errors} "
                f"(reporting as failed row)"
            )
            selected.append({
                "gateway": gateway,
                "subgraph_tech": subgraph_tech,
                "version": version,
                "median_rps": None,
                "best_rps": None,
                "worst_rps": None,
                "cv_pct": None,
                "notes": notes or "benchmark run failed",
                "metrics": {},
                "k6_txt": "",
                "summary": {},
                "display_name": runs[0]["display_name"],
                "failed_run": True,
            })

    return selected


def generate_markdown(mode, results, expected_by_mode):
    """Generate results markdown for a given mode."""
    mode_results = [r for r in results if r["metadata"]["mode"] == mode]
    expected_mode_gateways = expected_by_mode.get(mode, [])
    if not mode_results and not expected_mode_gateways:
        return None

    entries = []
    if mode_results:
        print(f"\nSelecting median runs for mode '{mode}':")
        entries = select_median_runs(mode_results)
    else:
        print(f"\nNo successful result artifacts for mode '{mode}', generating failure placeholders.")

    entries = merge_failed_expected_entries(entries, expected_mode_gateways)
    entries = sort_entries(entries)

    if mode_results:
        first = mode_results[0]["summary"]
        first_metadata = mode_results[0].get("metadata", {})
        vus = first.get("vus", 50 if mode == "constant" else 500)
        duration = first.get("duration", "120s")
        try:
            measured_runs = int(first_metadata.get("total_runs", 9))
        except (TypeError, ValueError):
            measured_runs = 9
        measured_runs = max(1, measured_runs)
    else:
        vus = 50 if mode in {"constant", "constant-latency"} else 500
        duration = "120s"
        measured_runs = 9

    total_runs = measured_runs + 1

    lines = []

    SCENARIO_DESCRIPTION = (
        "Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested "
        "query that exercises federation/composition capabilities.\n"
        "\n"
        "Results are split by subgraph technology:\n"
        "- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum\n"
        "- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)\n"
        "\n"
        "**Methodology:** Each gateway executes {total_runs} runs of {duration} each. The first run is a "
        "full-duration warmup (discarded). The remaining {measured_runs} runs are measured. Results are ranked "
        "by **median RPS** across the {measured_runs} measured runs, with best/worst/CV% reported for "
        "transparency."
    ).format(duration=duration, total_runs=total_runs, measured_runs=measured_runs)

    if mode == "constant":
        lines.append("## Overview for: `constant-vus-over-time`")
        lines.append("")
        lines.append(SCENARIO_DESCRIPTION)
        lines.append("")
        lines.append(
            f"This scenario executes a constant load of **{vus} VUs** over **{duration}**."
        )
    elif mode == "constant-latency":
        lines.append("## Overview for: `constant-vus-with-latency`")
        lines.append("")
        lines.append(SCENARIO_DESCRIPTION)
        lines.append("")
        lines.append(
            f"This scenario executes a constant load of **{vus} VUs** over **{duration}** "
            f"with a simulated **4ms IO delay** on each subgraph request. "
            f"Only .NET subgraphs are used."
        )
    else:
        lines.append("## Overview for: `burst-vus`")
        lines.append("")
        lines.append(SCENARIO_DESCRIPTION)
        lines.append("")
        lines.append(
            f"This scenario is a burst stress test with peaks up to **{vus} VUs** over **{duration}**."
        )

    # Split entries by subgraph technology
    rust_entries = [e for e in entries if e["subgraph_tech"] == "rust"]
    net_entries = [e for e in entries if e["subgraph_tech"] == ".net"]
    other_entries = [e for e in entries if e["subgraph_tech"] not in ("rust", ".net")]

    subgraph_groups = []
    if rust_entries:
        subgraph_groups.append(("Rust Subgraphs", rust_entries))
    if net_entries:
        subgraph_groups.append((".NET Subgraphs", net_entries))
    if other_entries:
        subgraph_groups.append(("Other Subgraphs", other_entries))

    # Emit comparison tables (no details yet)
    for group_title, group_entries in subgraph_groups:
        lines.append("")
        lines.append("")
        lines.append(f"### {group_title}")
        lines.append("")

        # Table header (no Subgraphs column — implicit from heading)
        lines.append(
            "| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |"
        )
        lines.append(
            "| :------ | :------ | ---------: | -------: | --------: | --: | :---- |"
        )

        for entry in group_entries:
            gw = entry["gateway"]
            ver = entry["version"] or "—"
            notes = entry.get("notes", "")
            lines.append(
                f"| {gw} | {ver} | {format_metric(entry.get('median_rps'))} | "
                f"{format_metric(entry.get('best_rps'))} | {format_metric(entry.get('worst_rps'))} | "
                f"{format_cv(entry.get('cv_pct'))} | {notes} |"
            )

    # Expandable details — all at the bottom, grouped by subgraph tech
    lines.append("")
    lines.append("")
    lines.append("### Details")
    lines.append("")

    has_detail_entries = False
    for group_title, group_entries in subgraph_groups:
        for entry in group_entries:
            if entry.get("failed_run"):
                continue
            has_detail_entries = True
            gw = entry["gateway"]
            ver = entry["version"]
            display_name = entry.get("display_name", gw)
            gw_label = f"{display_name} ({ver})" if ver else display_name
            k6_txt = entry["k6_txt"].strip()

            lines.append("<details>")
            lines.append(f"  <summary>Summary for: {gw_label}</summary>")
            lines.append("")
            lines.append("  **K6 Output**")
            lines.append("")
            lines.append("")
            lines.append("```")
            lines.append(k6_txt)
            lines.append("```")
            lines.append("")
            lines.append("")
            lines.append("  **Performance Overview**")
            lines.append("")
            lines.append("")
            lines.append("  **no-image-available**")
            lines.append("")
            lines.append("")
            lines.append("")
            lines.append("  **HTTP Overview**")
            lines.append("")
            lines.append("")
            lines.append("  **no-image-available**")
            lines.append("")
            lines.append("")
            lines.append("</details>")
            lines.append("")

    if not has_detail_entries:
        lines.append("No successful benchmark runs available for detailed output.")
        lines.append("")

    lines.append("### Footnotes")
    lines.append("")
    hardware_profiles = collect_hardware_profiles(mode_results)
    if hardware_profiles:
        for idx, (profile, count) in enumerate(hardware_profiles, 1):
            host, os_name, cpu, cores, ram = profile
            parts = []
            if host:
                parts.append(f"host={host}")
            if os_name:
                parts.append(f"os={os_name}")
            if cpu:
                parts.append(f"cpu={cpu}")
            if cores:
                parts.append(f"cores={cores}")
            if ram:
                parts.append(f"ram={ram}")
            suffix = f" (observed in {count} run metadata entries)" if len(hardware_profiles) > 1 else ""
            lines.append(f"- Benchmark hardware #{idx}: " + ", ".join(parts) + suffix)
    else:
        lines.append("- Benchmark hardware: unavailable in metadata.")

    lines.append("")

    return "\n".join(lines)


def main():
    if len(sys.argv) < 2:
        print("Usage: generate-results.py <artifacts-dir> [output-dir]")
        sys.exit(1)

    artifacts_dir = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else "."
    expected_by_mode = load_expected_gateways_by_mode()
    requested_modes = {
        mode.strip() for mode in os.environ.get("RESULT_MODES", "").split(",")
        if mode.strip()
    }

    if requested_modes:
        print(f"Generating only requested modes: {', '.join(sorted(requested_modes))}")

    print(f"Scanning {artifacts_dir} for results...")
    results = find_results(artifacts_dir)

    if not results:
        if not has_any_expected_gateways(expected_by_mode):
            print("No results found!")
            sys.exit(1)
        print("No result artifacts found. Proceeding with expected gateway matrix only.")
    else:
        print(f"Found {len(results)} result(s)")

    os.makedirs(output_dir, exist_ok=True)

    for mode, filename in [
        ("constant", "RESULTS_CONSTANT.md"),
        ("ramping", "RESULTS_BURST.md"),       # legacy metadata value
        ("burst", "RESULTS_BURST.md"),
        ("constant-latency", "RESULTS_CONSTANT_LATENCY.md"),
    ]:
        if requested_modes and mode not in requested_modes:
            continue
        md = generate_markdown(mode, results, expected_by_mode)
        if md:
            output_path = os.path.join(output_dir, filename)
            with open(output_path, "w") as f:
                f.write(md + "\n")
            print(f"Generated {output_path}")
        else:
            print(f"No results for mode '{mode}', skipping {filename}")


if __name__ == "__main__":
    main()
