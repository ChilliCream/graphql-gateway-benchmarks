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
| hotchocolate | 16.0.0-p.11.47 | 1,664 | 1,664 | 1,526 | 5.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.0.0-p.11.47 | 1,575 | 1,575 | 1,549 | 1.2% | non-compatible response (1 across 1/2 runs) |


### Details

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 611997      ✗ 0     
     data_received..................: 18 GB   146 MB/s
     data_sent......................: 246 MB  2.0 MB/s
     http_req_blocked...............: avg=9.54µs   min=1µs    med=2.08µs   max=76.95ms  p(90)=3.26µs   p(95)=4µs      p(99.9)=222.07µs
     http_req_connecting............: avg=6.95µs   min=0s     med=0s       max=76.81ms  p(90)=0s       p(95)=0s       p(99.9)=164.51µs
     http_req_duration..............: avg=137.34ms min=2.7ms  med=64.23ms  max=2.94s    p(90)=354.07ms p(95)=507ms    p(99.9)=1.66s   
       { expected_response:true }...: avg=137.34ms min=2.7ms  med=64.23ms  max=2.94s    p(90)=354.07ms p(95)=507ms    p(99.9)=1.66s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 204999
     http_req_receiving.............: avg=5.27ms   min=51.2µs med=107.48µs max=1.32s    p(90)=2.59ms   p(95)=8.8ms    p(99.9)=422.55ms
     http_req_sending...............: avg=44.73µs  min=5.15µs med=9.45µs   max=106.47ms p(90)=15.01µs  p(95)=20.35µs  p(99.9)=6.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.02ms min=2.61ms med=62.86ms  max=2.94s    p(90)=337.33ms p(95)=477.65ms p(99.9)=1.62s   
     http_reqs......................: 204999  1664.507048/s
     iteration_duration.............: avg=138.25ms min=3.71ms med=65.17ms  max=2.94s    p(90)=355.58ms p(95)=508.44ms p(99.9)=1.66s   
     iterations.....................: 203999  1656.387462/s
     success_rate...................: 100.00% ✓ 203999      ✗ 0     
     vus............................: 62      min=0         max=495 
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

     checks.........................: 100.00% ✓ 576108      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=12.3µs   min=1.02µs  med=2.46µs   max=87.43ms  p(90)=4.02µs   p(95)=4.9µs    p(99.9)=299.62µs
     http_req_connecting............: avg=9.31µs   min=0s      med=0s       max=87.37ms  p(90)=0s       p(95)=0s       p(99.9)=220.09µs
     http_req_duration..............: avg=148.11ms min=1.88ms  med=81.3ms   max=2.47s    p(90)=371.25ms p(95)=504.14ms p(99.9)=1.27s   
       { expected_response:true }...: avg=148.11ms min=1.88ms  med=81.3ms   max=2.47s    p(90)=371.25ms p(95)=504.14ms p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 193036
     http_req_receiving.............: avg=5.79ms   min=53.23µs med=110.49µs max=857.58ms p(90)=2.7ms    p(95)=9.52ms   p(99.9)=414.91ms
     http_req_sending...............: avg=50.69µs  min=5.32µs  med=10.26µs  max=95.37ms  p(90)=17.43µs  p(95)=23.12µs  p(99.9)=8.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=142.26ms min=1.78ms  med=79.69ms  max=2.46s    p(90)=355.18ms p(95)=474.75ms p(99.9)=1.2s    
     http_reqs......................: 193036  1575.759026/s
     iteration_duration.............: avg=149.15ms min=3.34ms  med=82.42ms  max=2.47s    p(90)=372.5ms  p(95)=505.59ms p(99.9)=1.27s   
     iterations.....................: 192036  1567.595994/s
     success_rate...................: 100.00% ✓ 192036      ✗ 0     
     vus............................: 68      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

