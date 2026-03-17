## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.0.0-p.11.47 | 1,913 | 1,913 | 1,894 | 0.7% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.0.0-p.11.47 | 1,718 | 1,718 | 1,684 | 1.4% |  |


### Details

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690357      ✗ 0     
     data_received..................: 20 GB   168 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.66µs   min=1.04µs  med=2.13µs  max=5.05ms   p(90)=3.15µs  p(95)=3.66µs  p(99.9)=30.74µs 
     http_req_connecting............: avg=232ns    min=0s      med=0s      max=2.82ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.84ms  min=2.79ms  med=14.21ms max=348.18ms p(90)=63.7ms  p(95)=84.24ms p(99.9)=193.98ms
       { expected_response:true }...: avg=25.84ms  min=2.79ms  med=14.21ms max=348.18ms p(90)=63.7ms  p(95)=84.24ms p(99.9)=193.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230219
     http_req_receiving.............: avg=600.85µs min=51.37µs med=109.1µs max=272.39ms p(90)=708.8µs p(95)=1.06ms  p(99.9)=70.83ms 
     http_req_sending...............: avg=31.32µs  min=5.1µs   med=9.32µs  max=88.56ms  p(90)=14.28µs p(95)=21.91µs p(99.9)=1.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.21ms  min=2.62ms  med=13.74ms max=348.09ms p(90)=62.4ms  p(95)=82.89ms p(99.9)=191.12ms
     http_reqs......................: 230219  1913.143755/s
     iteration_duration.............: avg=26.06ms  min=3.44ms  med=14.41ms max=348.33ms p(90)=63.92ms p(95)=84.48ms p(99.9)=195.33ms
     iterations.....................: 230119  1912.312744/s
     success_rate...................: 100.00% ✓ 230119      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 619872      ✗ 0     
     data_received..................: 18 GB   151 MB/s
     data_sent......................: 248 MB  2.1 MB/s
     http_req_blocked...............: avg=3.44µs   min=1.05µs  med=2.47µs   max=9.37ms   p(90)=3.63µs   p(95)=4.2µs   p(99.9)=36.54µs 
     http_req_connecting............: avg=511ns    min=0s      med=0s       max=4.45ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=28.8ms   min=2.09ms  med=17.99ms  max=750.31ms p(90)=65.51ms  p(95)=86.34ms p(99.9)=226.47ms
       { expected_response:true }...: avg=28.8ms   min=2.09ms  med=17.99ms  max=750.31ms p(90)=65.51ms  p(95)=86.34ms p(99.9)=226.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 206724
     http_req_receiving.............: avg=524.47µs min=52.64µs med=113.43µs max=283.73ms p(90)=717.24µs p(95)=1.08ms  p(99.9)=62.72ms 
     http_req_sending...............: avg=30.62µs  min=5.52µs  med=10.25µs  max=107.47ms p(90)=16.29µs  p(95)=22.96µs p(99.9)=1.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=28.24ms  min=1.97ms  med=17.55ms  max=749.56ms p(90)=64.51ms  p(95)=85.26ms p(99.9)=222.61ms
     http_reqs......................: 206724  1718.865703/s
     iteration_duration.............: avg=29.03ms  min=2.99ms  med=18.21ms  max=750.51ms p(90)=65.74ms  p(95)=86.58ms p(99.9)=230.77ms
     iterations.....................: 206624  1718.034225/s
     success_rate...................: 100.00% ✓ 206624      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

