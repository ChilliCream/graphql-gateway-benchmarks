## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| apollo-gateway | — | — | — | — | — | benchmark run failed |
| apollo-router | — | — | — | — | — | benchmark run failed |
| cosmo | — | — | — | — | — | benchmark run failed |
| feddi | — | — | — | — | — | benchmark run failed |
| fusion | — | — | — | — | — | benchmark run failed |
| fusion-nightly | — | — | — | — | — | benchmark run failed |
| grafbase | — | — | — | — | — | benchmark run failed |
| hive-gateway | — | — | — | — | — | benchmark run failed |
| hive-gateway-router-runtime | — | — | — | — | — | benchmark run failed |
| hive-router | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-gateway | 2.10.0 | 213 | 218 | 211 | 1.0% |  |
| apollo-gateway | — | — | — | — | — | benchmark run failed |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (7459 across 9/9 runs) |
| cosmo | — | — | — | — | — | benchmark run failed |
| feddi | — | — | — | — | — | benchmark run failed |
| fusion | — | — | — | — | — | benchmark run failed |
| fusion-nightly | — | — | — | — | — | benchmark run failed |
| grafbase | — | — | — | — | — | benchmark run failed |
| hive-gateway-router-runtime | — | — | — | — | — | benchmark run failed |
| hive-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41085      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   257 kB/s
     http_req_blocked...............: avg=19.7µs   min=1.22µs  med=3.61µs   max=36.16ms p(90)=5.42µs   p(95)=7.27µs   p(99.9)=2.99ms  
     http_req_connecting............: avg=14.33µs  min=0s      med=0s       max=36.09ms p(90)=0s       p(95)=0s       p(99.9)=2.96ms  
     http_req_duration..............: avg=993.49ms min=6.76ms  med=896.62ms max=5.99s   p(90)=1.97s    p(95)=2.25s    p(99.9)=5.47s   
       { expected_response:true }...: avg=993.49ms min=6.76ms  med=896.62ms max=5.99s   p(90)=1.97s    p(95)=2.25s    p(99.9)=5.47s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14695
     http_req_receiving.............: avg=106.7µs  min=34.42µs med=99.24µs  max=37.72ms p(90)=139.06µs p(95)=152.32µs p(99.9)=807.74µs
     http_req_sending...............: avg=36.18µs  min=5.88µs  med=18.34µs  max=57.34ms p(90)=24.4µs   p(95)=29.75µs  p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=993.35ms min=6.67ms  med=896.51ms max=5.99s   p(90)=1.97s    p(95)=2.25s    p(99.9)=5.47s   
     http_reqs......................: 14695   213.652037/s
     iteration_duration.............: avg=1.06s    min=25.41ms med=990.19ms max=6s      p(90)=1.99s    p(95)=2.28s    p(99.9)=5.49s   
     iterations.....................: 13695   199.112939/s
     success_rate...................: 100.00% ✓ 13695      ✗ 0    
     vus............................: 97      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

