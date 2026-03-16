## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Subgraph technology is reported in the `Subgraphs` column for each row:
- `rust` = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- `.net` = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Comparison

| Gateway | Subgraphs | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :-------- | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate-aot | rust | 16.0.0-p.11.46-aot | 1,594 | 1,594 | 1,594 | 0.0% |  |
| hotchocolate-aot | .net | 16.0.0-p.11.46-aot | 1,461 | 1,461 | 1,461 | 0.0% |  |

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

<details>
  <summary>Summary for: hotchocolate-aot (rust subgraphs) (16.0.0-p.11.46-aot)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 575394      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.15µs   min=1.08µs med=2.26µs   max=5.08ms   p(90)=3.31µs   p(95)=3.82µs  p(99.9)=31.7µs  
     http_req_connecting............: avg=557ns    min=0s     med=0s       max=4.74ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=31.04ms  min=3.1ms  med=19.47ms  max=401.45ms p(90)=71.25ms  p(95)=94.28ms p(99.9)=217.27ms
       { expected_response:true }...: avg=31.04ms  min=3.1ms  med=19.47ms  max=401.45ms p(90)=71.25ms  p(95)=94.28ms p(99.9)=217.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 191898
     http_req_receiving.............: avg=693.51µs min=51µs   med=130.66µs max=257.76ms p(90)=941.18µs p(95)=1.42ms  p(99.9)=68.67ms 
     http_req_sending...............: avg=29.46µs  min=5.37µs med=9.68µs   max=274.72ms p(90)=14.52µs  p(95)=19.63µs p(99.9)=1.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=30.32ms  min=2.97ms med=18.87ms  max=401.07ms p(90)=69.93ms  p(95)=92.94ms p(99.9)=214.58ms
     http_reqs......................: 191898  1594.388857/s
     iteration_duration.............: avg=31.27ms  min=3.98ms med=19.69ms  max=401.67ms p(90)=71.47ms  p(95)=94.54ms p(99.9)=219.5ms 
     iterations.....................: 191798  1593.558005/s
     success_rate...................: 100.00% ✓ 191798      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate-aot (.net subgraphs) (16.0.0-p.11.46-aot)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 527280      ✗ 0     
     data_received..................: 15 GB   128 MB/s
     data_sent......................: 211 MB  1.8 MB/s
     http_req_blocked...............: avg=3.53µs   min=1.04µs  med=2.52µs  max=4.94ms   p(90)=3.77µs  p(95)=4.34µs  p(99.9)=35.58µs 
     http_req_connecting............: avg=699ns    min=0s      med=0s      max=4.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=33.86ms  min=2.25ms  med=23.38ms max=682.68ms p(90)=72.06ms p(95)=94.82ms p(99.9)=242.68ms
       { expected_response:true }...: avg=33.86ms  min=2.25ms  med=23.38ms max=682.68ms p(90)=72.06ms p(95)=94.82ms p(99.9)=242.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175860
     http_req_receiving.............: avg=656.93µs min=50.29µs med=120.7µs max=230.98ms p(90)=1.01ms  p(95)=1.56ms  p(99.9)=67.12ms 
     http_req_sending...............: avg=33.36µs  min=5.28µs  med=10.64µs max=243.78ms p(90)=16.9µs  p(95)=22.47µs p(99.9)=1.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=33.17ms  min=2.14ms  med=22.79ms max=682.58ms p(90)=70.83ms p(95)=93.58ms p(99.9)=239.79ms
     http_reqs......................: 175860  1461.956578/s
     iteration_duration.............: avg=34.13ms  min=3.49ms  med=23.63ms max=682.95ms p(90)=72.34ms p(95)=95.1ms  p(99.9)=246.99ms
     iterations.....................: 175760  1461.125259/s
     success_rate...................: 100.00% ✓ 175760      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

