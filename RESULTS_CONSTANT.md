## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Comparison

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% |
| :------ | :------ | ---------: | -------: | --------: | --: |
| cosmo | 0.291.0 | 600 | 607 | 595 | 0.7% |
| apollo-router | v2.12.0 | 592 | 594 | 590 | 0.3% |
| grafbase | 0.53.2 | 588 | 593 | 581 | 0.7% |


<details>
  <summary>Summary for: cosmo (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 216747     ✗ 0    
     data_received..................: 6.3 GB  53 MB/s
     data_sent......................: 87 MB   721 kB/s
     http_req_blocked...............: avg=4.98µs  min=882ns   med=2.67µs  max=5.63ms   p(90)=4.64µs   p(95)=5.98µs   p(99.9)=51.23µs 
     http_req_connecting............: avg=1.86µs  min=0s      med=0s      max=5.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=82.73ms min=4.39ms  med=82.46ms max=374.95ms p(90)=99.81ms  p(95)=104.86ms p(99.9)=137.23ms
       { expected_response:true }...: avg=82.73ms min=4.39ms  med=82.46ms max=374.95ms p(90)=99.81ms  p(95)=104.86ms p(99.9)=137.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 72349
     http_req_receiving.............: avg=71.07µs min=25.26µs med=57.01µs max=161.38ms p(90)=102.4µs  p(95)=118.86µs p(99.9)=639.49µs
     http_req_sending...............: avg=27.16µs min=4.43µs  med=11.09µs max=180.03ms p(90)=20.78µs  p(95)=25.3µs   p(99.9)=1.06ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.63ms min=4.29ms  med=82.36ms max=366.01ms p(90)=99.73ms  p(95)=104.76ms p(99.9)=136.08ms
     http_reqs......................: 72349   600.248884/s
     iteration_duration.............: avg=83.04ms min=16.22ms med=82.68ms max=382.52ms p(90)=100.02ms p(95)=105.07ms p(99.9)=137.51ms
     iterations.....................: 72249   599.419227/s
     success_rate...................: 100.00% ✓ 72249      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214017     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   712 kB/s
     http_req_blocked...............: avg=4.94µs  min=941ns   med=2.73µs  max=5.16ms   p(90)=4.7µs    p(95)=6.15µs   p(99.9)=63.31µs 
     http_req_connecting............: avg=1.72µs  min=0s      med=0s      max=5.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.79ms min=4.35ms  med=83.45ms max=380.69ms p(90)=101.1ms  p(95)=106.29ms p(99.9)=138.16ms
       { expected_response:true }...: avg=83.79ms min=4.35ms  med=83.45ms max=380.69ms p(90)=101.1ms  p(95)=106.29ms p(99.9)=138.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71439
     http_req_receiving.............: avg=69.8µs  min=25.64µs med=58.47µs max=13.66ms  p(90)=103.67µs p(95)=119.58µs p(99.9)=653.19µs
     http_req_sending...............: avg=31.37µs min=4.25µs  med=11.21µs max=243.51ms p(90)=20.79µs  p(95)=25.13µs  p(99.9)=1.03ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.69ms min=4.3ms   med=83.36ms max=379.99ms p(90)=101ms    p(95)=106.2ms  p(99.9)=134.23ms
     http_reqs......................: 71439   592.634551/s
     iteration_duration.............: avg=84.11ms min=12.23ms med=83.67ms max=388.06ms p(90)=101.31ms p(95)=106.51ms p(99.9)=142.39ms
     iterations.....................: 71339   591.804983/s
     success_rate...................: 100.00% ✓ 71339      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 212682     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 85 MB   707 kB/s
     http_req_blocked...............: avg=5.03µs  min=872ns   med=2.65µs  max=5.62ms   p(90)=4.63µs   p(95)=6.07µs   p(99.9)=49.12µs 
     http_req_connecting............: avg=1.9µs   min=0s      med=0s      max=5.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.32ms min=4.31ms  med=83.96ms max=371.3ms  p(90)=101.79ms p(95)=107.05ms p(99.9)=139.59ms
       { expected_response:true }...: avg=84.32ms min=4.31ms  med=83.96ms max=371.3ms  p(90)=101.79ms p(95)=107.05ms p(99.9)=139.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70994
     http_req_receiving.............: avg=68.61µs min=25.97µs med=56.56µs max=19.14ms  p(90)=101.52µs p(95)=117.69µs p(99.9)=627.32µs
     http_req_sending...............: avg=23.33µs min=4.7µs   med=11.2µs  max=138.89ms p(90)=20.54µs  p(95)=24.89µs  p(99.9)=958.13µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.23ms min=4.22ms  med=83.86ms max=370.62ms p(90)=101.7ms  p(95)=106.95ms p(99.9)=139.48ms
     http_reqs......................: 70994   588.8833/s
     iteration_duration.............: avg=84.64ms min=13.06ms med=84.18ms max=381.77ms p(90)=102ms    p(95)=107.27ms p(99.9)=139.91ms
     iterations.....................: 70894   588.053817/s
     success_rate...................: 100.00% ✓ 70894      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

