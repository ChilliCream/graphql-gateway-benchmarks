## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.0.0-p.11.47 | 6,505 | 6,505 | 1,560 | 53.8% | non-compatible response (732235 across 1/2 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.0.0-p.11.47 | 5,824 | 5,824 | 1,568 | 51.7% | non-compatible response (632711 across 1/2 runs) |


### Details

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✗ response code was 200
      ↳  8% — ✓ 67281 / ✗ 732685
     ✓ no graphql errors
     ✗ valid response structure
      ↳  99% — ✓ 799516 / ✗ 450

     checks.........................: 69.45% ✓ 1666763     ✗ 733135
     data_received..................: 6.0 GB 49 MB/s
     data_sent......................: 82 MB  667 kB/s
     http_req_blocked...............: avg=366ns   min=0s       med=0s      max=4.58ms   p(90)=0s      p(95)=2.36µs  p(99.9)=8.09µs  
     http_req_connecting............: avg=124ns   min=0s       med=0s      max=4.54ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=2.27ms  min=0s       med=0s      max=416.33ms p(90)=0s      p(95)=12.23ms p(99.9)=129.75ms
       { expected_response:true }...: avg=26.41ms min=2.73ms   med=14.85ms max=401.23ms p(90)=64.15ms p(95)=85.15ms p(99.9)=206.2ms 
     http_req_failed................: 91.47% ✓ 732685      ✗ 68281 
     http_req_receiving.............: avg=45.02µs min=0s       med=0s      max=374.11ms p(90)=0s      p(95)=97.63µs p(99.9)=3.09ms  
     http_req_sending...............: avg=2.76µs  min=0s       med=0s      max=75.91ms  p(90)=0s      p(95)=10.09µs p(99.9)=317.16µs
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.22ms  min=0s       med=0s      max=410.55ms p(90)=0s      p(95)=11.83ms p(99.9)=128.07ms
     http_reqs......................: 800966 6505.014656/s
     iteration_duration.............: avg=29.99ms min=119.47µs med=25.11ms max=428.94ms p(90)=59.09ms p(95)=77.46ms p(99.9)=163.64ms
     iterations.....................: 799966 6496.893194/s
     success_rate...................: 8.41%  ✓ 67281       ✗ 732235
     vus............................: 54     min=0         max=496 
     vus_max........................: 500    min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✗ response code was 200
      ↳  11% — ✓ 79465 / ✗ 633084
     ✓ no graphql errors
     ✗ valid response structure
      ↳  99% — ✓ 712176 / ✗ 373

     checks.........................: 70.36% ✓ 1504190     ✗ 633457
     data_received..................: 7.1 GB 58 MB/s
     data_sent......................: 97 MB  790 kB/s
     http_req_blocked...............: avg=485ns   min=0s      med=0s      max=19.46ms  p(90)=1.78µs  p(95)=2.65µs   p(99.9)=10.14µs 
     http_req_connecting............: avg=150ns   min=0s      med=0s      max=19.36ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=3.71ms  min=0s      med=0s      max=862.39ms p(90)=8.09ms  p(95)=22.88ms  p(99.9)=184.81ms
       { expected_response:true }...: avg=32.19ms min=1.95ms  med=19.83ms max=600.96ms p(90)=72.35ms p(95)=97.86ms  p(99.9)=305.42ms
     http_req_failed................: 88.72% ✓ 633085      ✗ 80465 
     http_req_receiving.............: avg=75.81µs min=0s      med=0s      max=473.83ms p(90)=78.62µs p(95)=122.62µs p(99.9)=6.64ms  
     http_req_sending...............: avg=4.01µs  min=0s      med=0s      max=323.11ms p(90)=8.35µs  p(95)=11.48µs  p(99.9)=505.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=3.63ms  min=0s      med=0s      max=862.38ms p(90)=7.82ms  p(95)=22.34ms  p(99.9)=179.6ms 
     http_reqs......................: 713550 5824.026082/s
     iteration_duration.............: avg=33.67ms min=124.7µs med=28.6ms  max=862.47ms p(90)=63.36ms p(95)=81.17ms  p(99.9)=194.33ms
     iterations.....................: 712549 5815.855876/s
     success_rate...................: 11.15% ✓ 79465       ✗ 632711
     vus............................: 58     min=0         max=497 
     vus_max........................: 500    min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

