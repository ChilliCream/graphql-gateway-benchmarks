#!/usr/bin/env python3
"""Generate RESULTS_CONSTANT.md and RESULTS_RAMPING.md from benchmark artifacts."""

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
        "avg_ms": avg_ms,
        "p95_ms": p95_ms,
        "notes": notes,
    }


def get_gateway_name(metadata):
    """Get display name without version."""
    return metadata.get("display_name", metadata["gateway"])


def get_version(metadata):
    """Get version string."""
    return metadata.get("version", "")


def select_median_runs(results):
    """Group runs by gateway, compute aggregate stats (median, best, worst, CV%)."""
    groups = defaultdict(list)
    for r in results:
        name = get_gateway_name(r["metadata"])
        version = get_version(r["metadata"])
        rps = extract_rps(r["summary"])
        groups[name].append({
            "result": r,
            "rps": rps,
            "version": version,
        })

    selected = []
    for gateway, runs in groups.items():
        runs.sort(key=lambda x: x["rps"])
        all_rps = [r["rps"] for r in runs]
        n = len(all_rps)

        median_idx = n // 2
        median_run = runs[median_idx]
        median_rps = median_run["rps"]
        best_rps = max(all_rps)
        worst_rps = min(all_rps)

        if n > 1 and median_rps > 0:
            stdev = statistics.stdev(all_rps)
            cv_pct = round(stdev / median_rps * 100, 1)
        else:
            cv_pct = 0.0

        version = runs[0]["version"]

        print(f"  {gateway}: {n} run(s), RPS=[{', '.join(str(r) for r in all_rps)}], "
              f"median={median_rps}, best={best_rps}, worst={worst_rps}, CV={cv_pct}%")

        selected.append({
            "gateway": gateway,
            "version": version,
            "median_rps": median_rps,
            "best_rps": best_rps,
            "worst_rps": worst_rps,
            "cv_pct": cv_pct,
            "metrics": extract_metrics(median_run["result"]["summary"]),
            "k6_txt": median_run["result"]["k6_txt"],
            "summary": median_run["result"]["summary"],
        })

    return selected


def generate_markdown(mode, results):
    """Generate results markdown for a given mode."""
    mode_results = [r for r in results if r["metadata"]["mode"] == mode]
    if not mode_results:
        return None

    print(f"\nSelecting median runs for mode '{mode}':")
    entries = select_median_runs(mode_results)
    entries.sort(key=lambda e: e["median_rps"], reverse=True)

    first = mode_results[0]["summary"]
    vus = first.get("vus", 50 if mode == "constant" else 500)
    duration = first.get("duration", "120s")

    lines = []

    SCENARIO_DESCRIPTION = (
        "Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested "
        "query that exercises federation/composition capabilities. The benchmarks cover two "
        "schema composition approaches:\n"
        "\n"
        "- **Apollo Federation** — subgraphs are built with Rust "
        "([async-graphql](https://github.com/async-graphql/async-graphql) + axum)\n"
        "- **Composite Schema** — subgraphs are built with .NET "
        "([HotChocolate](https://github.com/ChilliCream/graphql-platform)) "
        "or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)\n"
        "\n"
        "**Methodology:** Each gateway executes 11 runs of {duration} each. The first run is a "
        "full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked "
        "by **median RPS** across the 10 measured runs, with best/worst/CV% reported for "
        "transparency."
    ).format(duration=duration)

    if mode == "constant":
        lines.append("## Overview for: `constant-vus-over-time`")
        lines.append("")
        lines.append(SCENARIO_DESCRIPTION)
        lines.append("")
        lines.append(
            f"This scenario executes a constant load of **{vus} VUs** over **{duration}**."
        )
    else:
        lines.append("## Overview for: `ramping-vus`")
        lines.append("")
        lines.append(SCENARIO_DESCRIPTION)
        lines.append("")
        lines.append(
            f"This scenario is a stress test that ramps up to **{vus} VUs** over **{duration}**."
        )

    lines.append("")
    lines.append("")
    lines.append("### Comparison")
    lines.append("")

    # Table header
    lines.append(
        "| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% |"
    )
    lines.append(
        "| :------ | :------ | ---------: | -------: | --------: | --: |"
    )

    for entry in entries:
        gw = entry["gateway"]
        ver = entry["version"]
        lines.append(
            f"| {gw} | {ver} | {entry['median_rps']:,} | "
            f"{entry['best_rps']:,} | {entry['worst_rps']:,} | "
            f"{entry['cv_pct']:.1f}% |"
        )

    lines.append("")
    lines.append("")

    # Expandable details per gateway
    for entry in entries:
        gw = entry["gateway"]
        ver = entry["version"]
        gw_label = f"{gw} ({ver})" if ver else gw
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

    return "\n".join(lines)


def main():
    if len(sys.argv) < 2:
        print("Usage: generate-results.py <artifacts-dir> [output-dir]")
        sys.exit(1)

    artifacts_dir = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else "."

    print(f"Scanning {artifacts_dir} for results...")
    results = find_results(artifacts_dir)

    if not results:
        print("No results found!")
        sys.exit(1)

    print(f"Found {len(results)} result(s)")
    os.makedirs(output_dir, exist_ok=True)

    for mode, filename in [("constant", "RESULTS_CONSTANT.md"), ("ramping", "RESULTS_RAMPING.md")]:
        md = generate_markdown(mode, results)
        if md:
            output_path = os.path.join(output_dir, filename)
            with open(output_path, "w") as f:
                f.write(md + "\n")
            print(f"Generated {output_path}")
        else:
            print(f"No results for mode '{mode}', skipping {filename}")


if __name__ == "__main__":
    main()
