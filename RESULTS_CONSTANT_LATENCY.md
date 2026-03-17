## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.0.0-p.11.47 | 1,054 | 1,054 | 1,051 | 0.2% |  |


### Details

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 391515      ✗ 0     
     data_received..................: 11 GB   92 MB/s
     data_sent......................: 157 MB  1.3 MB/s
     http_req_blocked...............: avg=3.43µs   min=992ns   med=2.29µs   max=3.96ms   p(90)=3.81µs  p(95)=4.47µs  p(99.9)=35.47µs 
     http_req_connecting............: avg=744ns    min=0s      med=0s       max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=45.73ms  min=29.5ms  med=44.43ms  max=480.81ms p(90)=52.33ms p(95)=55.53ms p(99.9)=171.34ms
       { expected_response:true }...: avg=45.73ms  min=29.5ms  med=44.43ms  max=480.81ms p(90)=52.33ms p(95)=55.53ms p(99.9)=171.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130605
     http_req_receiving.............: avg=429.96µs min=52.06µs med=112.92µs max=68.43ms  p(90)=1.17ms  p(95)=1.78ms  p(99.9)=8.94ms  
     http_req_sending...............: avg=26.8µs   min=5.21µs  med=9.86µs   max=63.33ms  p(90)=18.91µs p(95)=24.13µs p(99.9)=1.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=45.28ms  min=29.36ms med=44ms     max=480.49ms p(90)=51.74ms p(95)=54.92ms p(99.9)=170.31ms
     http_reqs......................: 130605  1054.175587/s
     iteration_duration.............: avg=45.97ms  min=29.74ms med=44.66ms  max=481.02ms p(90)=52.55ms p(95)=55.76ms p(99.9)=189.25ms
     iterations.....................: 130505  1053.368439/s
     success_rate...................: 100.00% ✓ 130505      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

