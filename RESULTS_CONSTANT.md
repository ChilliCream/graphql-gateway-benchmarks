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
| hotchocolate | 16.0.0-p.11.47 | 1,913 | 1,913 | 1,900 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.0.0-p.11.47 | 1,747 | 1,747 | 1,741 | 0.2% |  |


### Details

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690522      ✗ 0     
     data_received..................: 20 GB   168 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.76µs   min=1.01µs med=2.26µs  max=2.65ms   p(90)=3.28µs   p(95)=3.8µs   p(99.9)=33.57µs 
     http_req_connecting............: avg=208ns    min=0s     med=0s      max=2.62ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.83ms  min=2.84ms med=14.12ms max=447.91ms p(90)=63.31ms  p(95)=84.55ms p(99.9)=193.23ms
       { expected_response:true }...: avg=25.83ms  min=2.84ms med=14.12ms max=447.91ms p(90)=63.31ms  p(95)=84.55ms p(99.9)=193.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230274
     http_req_receiving.............: avg=572.78µs min=50.7µs med=109.3µs max=187.12ms p(90)=709.02µs p(95)=1.04ms  p(99.9)=73.06ms 
     http_req_sending...............: avg=34.34µs  min=5.33µs med=9.53µs  max=217.73ms p(90)=14.52µs  p(95)=22.66µs p(99.9)=1.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.23ms  min=2.67ms med=13.68ms max=447.81ms p(90)=62.15ms  p(95)=83.33ms p(99.9)=190.53ms
     http_reqs......................: 230274  1913.575896/s
     iteration_duration.............: avg=26.05ms  min=3.42ms med=14.33ms max=448.08ms p(90)=63.55ms  p(95)=84.78ms p(99.9)=194.18ms
     iterations.....................: 230174  1912.744896/s
     success_rate...................: 100.00% ✓ 230174      ✗ 0     
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

     checks.........................: 100.00% ✓ 630420      ✗ 0     
     data_received..................: 18 GB   153 MB/s
     data_sent......................: 253 MB  2.1 MB/s
     http_req_blocked...............: avg=3.53µs   min=1.12µs  med=2.49µs   max=7.49ms   p(90)=3.68µs   p(95)=4.28µs  p(99.9)=36.01µs 
     http_req_connecting............: avg=694ns    min=0s      med=0s       max=6.66ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=28.3ms   min=2.13ms  med=17.82ms  max=948.23ms p(90)=63.52ms  p(95)=84.28ms p(99.9)=244.67ms
       { expected_response:true }...: avg=28.3ms   min=2.13ms  med=17.82ms  max=948.23ms p(90)=63.52ms  p(95)=84.28ms p(99.9)=244.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 210240
     http_req_receiving.............: avg=484.53µs min=51.44µs med=109.52µs max=308.93ms p(90)=696.04µs p(95)=1.08ms  p(99.9)=56.12ms 
     http_req_sending...............: avg=33.28µs  min=5.35µs  med=10.43µs  max=141.32ms p(90)=17.02µs  p(95)=23.86µs p(99.9)=1.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=27.79ms  min=2.04ms  med=17.38ms  max=948.12ms p(90)=62.62ms  p(95)=83.38ms p(99.9)=240.41ms
     http_reqs......................: 210240  1747.927938/s
     iteration_duration.............: avg=28.54ms  min=3.2ms   med=18.04ms  max=948.4ms  p(90)=63.75ms  p(95)=84.51ms p(99.9)=255.53ms
     iterations.....................: 210140  1747.096541/s
     success_rate...................: 100.00% ✓ 210140      ✗ 0     
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

