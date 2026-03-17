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
| hotchocolate | 16.0.0-p.11.47 | 1,625 | 1,625 | 1,463 | 7.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.0.0-p.11.47 | 1,537 | 1,537 | 1,502 | 1.6% |  |


### Details

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 305133      ✗ 0     
     data_received..................: 9.0 GB  143 MB/s
     data_sent......................: 123 MB  2.0 MB/s
     http_req_blocked...............: avg=13.56µs  min=1.03µs  med=2.52µs   max=73.14ms p(90)=3.9µs    p(95)=4.88µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=10.41µs  min=0s      med=0s       max=72.98ms p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=138.95ms min=2.69ms  med=62.49ms  max=18.13s  p(90)=358.75ms p(95)=508.92ms p(99.9)=1.56s   
       { expected_response:true }...: avg=138.95ms min=2.69ms  med=62.49ms  max=18.13s  p(90)=358.75ms p(95)=508.92ms p(99.9)=1.56s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 102711
     http_req_receiving.............: avg=5.07ms   min=50.29µs med=109.64µs max=1.09s   p(90)=2.82ms   p(95)=10.25ms  p(99.9)=430.82ms
     http_req_sending...............: avg=54.73µs  min=5.38µs  med=10.14µs  max=62.12ms p(90)=17.07µs  p(95)=26.12µs  p(99.9)=7.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.82ms min=2.6ms   med=60.94ms  max=18.13s  p(90)=344.98ms p(95)=485.71ms p(99.9)=1.51s   
     http_reqs......................: 102711  1625.711829/s
     iteration_duration.............: avg=140.57ms min=3.49ms  med=64.04ms  max=18.17s  p(90)=361.29ms p(95)=511.47ms p(99.9)=1.57s   
     iterations.....................: 101711  1609.883809/s
     success_rate...................: 100.00% ✓ 101711      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 285360      ✗ 0    
     data_received..................: 8.4 GB  135 MB/s
     data_sent......................: 116 MB  1.8 MB/s
     http_req_blocked...............: avg=11.09µs  min=952ns   med=2.54µs  max=57.86ms  p(90)=4.04µs   p(95)=5µs      p(99.9)=939.47µs
     http_req_connecting............: avg=7.95µs   min=0s      med=0s      max=57.78ms  p(90)=0s       p(95)=0s       p(99.9)=889.51µs
     http_req_duration..............: avg=148.42ms min=1.91ms  med=86.34ms max=2.16s    p(90)=360.4ms  p(95)=487.57ms p(99.9)=1.47s   
       { expected_response:true }...: avg=148.42ms min=1.91ms  med=86.34ms max=2.16s    p(90)=360.4ms  p(95)=487.57ms p(99.9)=1.47s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 96120
     http_req_receiving.............: avg=4.04ms   min=53.09µs med=112.9µs max=870.04ms p(90)=2.92ms   p(95)=9.23ms   p(99.9)=317.63ms
     http_req_sending...............: avg=49.5µs   min=5.3µs   med=10.36µs max=94.31ms  p(90)=17.63µs  p(95)=23.72µs  p(99.9)=6.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=144.33ms min=1.82ms  med=84.66ms max=2.15s    p(90)=348.91ms p(95)=466.82ms p(99.9)=1.47s   
     http_reqs......................: 96120   1537.809797/s
     iteration_duration.............: avg=150.28ms min=2.54ms  med=88.37ms max=2.16s    p(90)=363.33ms p(95)=490.03ms p(99.9)=1.47s   
     iterations.....................: 95120   1521.810943/s
     success_rate...................: 100.00% ✓ 95120       ✗ 0    
     vus............................: 85      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

