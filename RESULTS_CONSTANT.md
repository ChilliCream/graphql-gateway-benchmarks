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
| hotchocolate | 16.0.0-p.11.47 | 1,913 | 1,913 | 1,880 | 1.2% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.0.0-p.11.47 | 1,708 | 1,708 | 1,696 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690462      ✗ 0     
     data_received..................: 20 GB   168 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=1.09µs  med=2.3µs    max=4.49ms   p(90)=3.33µs  p(95)=3.86µs  p(99.9)=32.97µs 
     http_req_connecting............: avg=229ns    min=0s      med=0s       max=2.88ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.83ms  min=2.72ms  med=14.18ms  max=329.91ms p(90)=63.24ms p(95)=84.43ms p(99.9)=194.24ms
       { expected_response:true }...: avg=25.83ms  min=2.72ms  med=14.18ms  max=329.91ms p(90)=63.24ms p(95)=84.43ms p(99.9)=194.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230254
     http_req_receiving.............: avg=573.71µs min=51.78µs med=109.37µs max=175.28ms p(90)=703.4µs p(95)=1.05ms  p(99.9)=70.04ms 
     http_req_sending...............: avg=31.1µs   min=5.33µs  med=9.64µs   max=133.06ms p(90)=14.6µs  p(95)=24.04µs p(99.9)=1.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.23ms  min=2.6ms   med=13.71ms  max=329.45ms p(90)=62.01ms p(95)=83.12ms p(99.9)=191.78ms
     http_reqs......................: 230254  1913.440525/s
     iteration_duration.............: avg=26.06ms  min=3.38ms  med=14.39ms  max=360.35ms p(90)=63.47ms p(95)=84.65ms p(99.9)=195.22ms
     iterations.....................: 230154  1912.609512/s
     success_rate...................: 100.00% ✓ 230154      ✗ 0     
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

     checks.........................: 100.00% ✓ 615984      ✗ 0     
     data_received..................: 18 GB   150 MB/s
     data_sent......................: 247 MB  2.1 MB/s
     http_req_blocked...............: avg=3.49µs   min=1.07µs  med=2.43µs   max=33.94ms  p(90)=3.59µs   p(95)=4.14µs  p(99.9)=36.93µs 
     http_req_connecting............: avg=520ns    min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=28.97ms  min=2.17ms  med=18.22ms  max=787.04ms p(90)=65.11ms  p(95)=86.43ms p(99.9)=233.09ms
       { expected_response:true }...: avg=28.97ms  min=2.17ms  med=18.22ms  max=787.04ms p(90)=65.11ms  p(95)=86.43ms p(99.9)=233.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 205428
     http_req_receiving.............: avg=521.96µs min=52.27µs med=113.65µs max=229.15ms p(90)=732.06µs p(95)=1.13ms  p(99.9)=61.15ms 
     http_req_sending...............: avg=30.51µs  min=5.44µs  med=10.32µs  max=124.61ms p(90)=16.38µs  p(95)=23.28µs p(99.9)=1.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=28.42ms  min=2.03ms  med=17.76ms  max=786.92ms p(90)=64.17ms  p(95)=85.29ms p(99.9)=231.23ms
     http_reqs......................: 205428  1708.037553/s
     iteration_duration.............: avg=29.21ms  min=2.66ms  med=18.43ms  max=787.33ms p(90)=65.35ms  p(95)=86.66ms p(99.9)=238.18ms
     iterations.....................: 205328  1707.2061/s
     success_rate...................: 100.00% ✓ 205328      ✗ 0     
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

