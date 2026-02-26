#!/usr/bin/env python3
"""Generate RESULTS_CONSTANT.md and RESULTS_RAMPING.md from benchmark artifacts."""

import json
import os
import sys
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
    notes = "✅"
    if sr_fails > 0:
        notes = f"❌ non-compatible response structure ({sr_fails})"
    elif failed > 0:
        notes = f"❌ {failed} failed requests"

    return {
        "rps": int(rps),
        "total": total,
        "failed": failed,
        "avg_ms": avg_ms,
        "p95_ms": p95_ms,
        "notes": notes,
    }


def select_median_runs(results):
    """Group runs by gateway, pick the median run by RPS for each gateway."""
    from collections import defaultdict

    groups = defaultdict(list)
    for r in results:
        gateway = r["metadata"]["gateway"]
        metrics = extract_metrics(r["summary"])
        groups[gateway].append({
            "result": r,
            "metrics": metrics,
        })

    selected = []
    for gateway, runs in groups.items():
        # Sort by RPS and pick the middle one
        runs.sort(key=lambda x: x["metrics"]["rps"])
        median_idx = len(runs) // 2
        median_run = runs[median_idx]
        total_runs = len(runs)
        all_rps = [r["metrics"]["rps"] for r in runs]
        print(f"  {gateway}: {total_runs} run(s), RPS=[{', '.join(str(r) for r in all_rps)}], "
              f"selected median RPS={median_run['metrics']['rps']}")
        selected.append({
            "gateway": gateway,
            "metrics": median_run["metrics"],
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
    entries.sort(key=lambda e: e["metrics"]["rps"], reverse=True)

    first = mode_results[0]["summary"]
    vus = first.get("vus", 50 if mode == "constant" else 500)
    duration = first.get("duration", "60s")

    lines = []

    SCENARIO_DESCRIPTION = (
        "Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested "
        "query that exercises federation/composition capabilities. The benchmarks cover two "
        "schema composition approaches:\n"
        "\n"
        "- **Apollo Federation** — subgraphs are built with Rust "
        "([async-graphql](https://github.com/async-graphql/async-graphql) + axum)\n"
        "- **Composite Schema** — subgraphs are built with .NET "
        "([HotChocolate](https://github.com/ChilliCream/graphql-platform))\n"
        "\n"
        "Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS)."
    )

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
        "| Gateway                     | RPS ⬇️ |        Requests        "
        "|        Duration        | Notes                                    |"
    )
    lines.append(
        "| :-------------------------- | :----: | :--------------------: "
        "| :--------------------: | :--------------------------------------- |"
    )

    for entry in entries:
        m = entry["metrics"]
        gw = entry["gateway"]
        rps = m["rps"]
        reqs = f"{m['total']} total, {m['failed']} failed"
        dur = f"avg: {m['avg_ms']:.0f}ms, p95: {m['p95_ms']:.0f}ms"
        notes = m["notes"]
        lines.append(f"| {gw:<27} | {rps:>4}  | {reqs:^22} | {dur:^22} | {notes:<40} |")

    lines.append("")
    lines.append("")

    # Expandable details per gateway
    for entry in entries:
        gw = entry["gateway"]
        k6_txt = entry["k6_txt"].strip()

        lines.append("<details>")
        lines.append(f"  <summary>Summary for: {gw}</summary>")
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
