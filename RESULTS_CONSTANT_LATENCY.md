## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 1,560 | 1,594 | 1,556 | 0.8% |  |
| fusion-nightly | 16.3.0-p.1 | 1,549 | 1,568 | 1,542 | 0.5% |  |
| fusion | 16.2.0 | 1,547 | 1,562 | 1,538 | 0.5% |  |
| grafbase | 0.53.5 | 1,110 | 1,130 | 1,104 | 0.8% |  |
| cosmo | 0.321.1 | 1,094 | 1,111 | 1,088 | 0.7% | non-compatible response (2 across 1/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 521 | 534 | 518 | 1.0% |  |
| apollo-router | v2.15.0 | 405 | 415 | 401 | 1.1% |  |
| apollo-gateway | 2.14.1 | 230 | 232 | 229 | 0.5% |  |
| hive-gateway | 2.8.2 | 230 | 235 | 228 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 570891      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.21µs  min=982ns   med=2.08µs  max=4.68ms   p(90)=4.01µs   p(95)=4.99µs   p(99.9)=28.41µs
     http_req_connecting............: avg=617ns   min=0s      med=0s      max=4.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.28ms min=14.62ms med=31ms    max=312.97ms p(90)=37.2ms   p(95)=39.11ms  p(99.9)=56.62ms
       { expected_response:true }...: avg=31.28ms min=14.62ms med=31ms    max=312.97ms p(90)=37.2ms   p(95)=39.11ms  p(99.9)=56.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190397
     http_req_receiving.............: avg=83.32µs min=27.97µs med=54µs    max=258.79ms p(90)=104.64µs p(95)=144.69µs p(99.9)=2.13ms 
     http_req_sending...............: avg=32.55µs min=4.87µs  med=9.45µs  max=195.06ms p(90)=20.16µs  p(95)=32.95µs  p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.17ms min=14.57ms med=30.9ms  max=312.72ms p(90)=37.08ms  p(95)=38.97ms  p(99.9)=55.79ms
     http_reqs......................: 190397  1560.020457/s
     iteration_duration.............: avg=31.52ms min=14.83ms med=31.22ms max=357.57ms p(90)=37.42ms  p(95)=39.32ms  p(99.9)=57.16ms
     iterations.....................: 190297  1559.201106/s
     success_rate...................: 100.00% ✓ 190297      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 566721      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 227 MB  1.9 MB/s
     http_req_blocked...............: avg=2.78µs   min=982ns   med=2.04µs   max=4.18ms   p(90)=3.78µs  p(95)=4.63µs  p(99.9)=34.24µs
     http_req_connecting............: avg=262ns    min=0s      med=0s       max=4.15ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=31.51ms  min=14.07ms med=30.95ms  max=320.25ms p(90)=38.69ms p(95)=41.23ms p(99.9)=61.61ms
       { expected_response:true }...: avg=31.51ms  min=14.07ms med=30.95ms  max=320.25ms p(90)=38.69ms p(95)=41.23ms p(99.9)=61.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189007
     http_req_receiving.............: avg=650.74µs min=51.66µs med=115.06µs max=228.52ms p(90)=1.79ms  p(95)=2.75ms  p(99.9)=14.46ms
     http_req_sending...............: avg=41.7µs   min=5.06µs  med=9.09µs   max=219.97ms p(90)=19.95µs p(95)=107.4µs p(99.9)=2.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.82ms  min=13.63ms med=30.3ms   max=319.21ms p(90)=37.83ms p(95)=40.32ms p(99.9)=57.58ms
     http_reqs......................: 189007  1549.018955/s
     iteration_duration.............: avg=31.75ms  min=14.35ms med=31.17ms  max=361.93ms p(90)=38.91ms p(95)=41.45ms p(99.9)=61.98ms
     iterations.....................: 188907  1548.199398/s
     success_rate...................: 100.00% ✓ 188907      ✗ 0     
     vus............................: 49      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 566349      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 227 MB  1.9 MB/s
     http_req_blocked...............: avg=3.03µs   min=992ns   med=2.01µs  max=3.95ms   p(90)=3.72µs  p(95)=4.58µs  p(99.9)=28.13µs
     http_req_connecting............: avg=528ns    min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=31.54ms  min=13.95ms med=30.98ms max=344.36ms p(90)=38.75ms p(95)=41.38ms p(99.9)=59.33ms
       { expected_response:true }...: avg=31.54ms  min=13.95ms med=30.98ms max=344.36ms p(90)=38.75ms p(95)=41.38ms p(99.9)=59.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188883
     http_req_receiving.............: avg=597.53µs min=51.02µs med=110.4µs max=311.27ms p(90)=1.6ms   p(95)=2.53ms  p(99.9)=14.14ms
     http_req_sending...............: avg=36.13µs  min=5.12µs  med=9.06µs  max=261.01ms p(90)=19.31µs p(95)=92.02µs p(99.9)=1.98ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.9ms   min=13.7ms  med=30.4ms  max=145.55ms p(90)=37.97ms p(95)=40.52ms p(99.9)=57.13ms
     http_reqs......................: 188883  1547.878114/s
     iteration_duration.............: avg=31.77ms  min=14.14ms med=31.2ms  max=377.03ms p(90)=38.97ms p(95)=41.59ms p(99.9)=59.9ms 
     iterations.....................: 188783  1547.058623/s
     success_rate...................: 100.00% ✓ 188783      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 406320      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=3.56µs  min=962ns   med=2.2µs   max=3.79ms   p(90)=4.62µs  p(95)=5.77µs   p(99.9)=41.25µs
     http_req_connecting............: avg=760ns   min=0s      med=0s      max=3.74ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.02ms min=15.62ms med=43.62ms max=352.58ms p(90)=53.54ms p(95)=56.82ms  p(99.9)=80.59ms
       { expected_response:true }...: avg=44.02ms min=15.62ms med=43.62ms max=352.58ms p(90)=53.54ms p(95)=56.82ms  p(99.9)=80.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135540
     http_req_receiving.............: avg=94.48µs min=29.93µs med=59.16µs max=27.84ms  p(90)=130.2µs p(95)=198.15µs p(99.9)=3.16ms 
     http_req_sending...............: avg=37.86µs min=4.85µs  med=9.83µs  max=254.48ms p(90)=23.89µs p(95)=106.74µs p(99.9)=2.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.89ms min=15.46ms med=43.49ms max=352.03ms p(90)=53.4ms  p(95)=56.65ms  p(99.9)=79.88ms
     http_reqs......................: 135540  1110.859241/s
     iteration_duration.............: avg=44.29ms min=18.83ms med=43.86ms max=374.35ms p(90)=53.77ms p(95)=57.06ms  p(99.9)=81.21ms
     iterations.....................: 135440  1110.03966/s
     success_rate...................: 100.00% ✓ 135440      ✗ 0     
     vus............................: 45      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 400530      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 161 MB  1.3 MB/s
     http_req_blocked...............: avg=3.68µs  min=1.04µs  med=2.5µs   max=4.41ms   p(90)=4.17µs   p(95)=4.94µs   p(99.9)=37.96µs
     http_req_connecting............: avg=790ns   min=0s      med=0s      max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.69ms min=18.21ms med=44.08ms max=349.63ms p(90)=54.31ms  p(95)=57.61ms  p(99.9)=75.34ms
       { expected_response:true }...: avg=44.69ms min=18.21ms med=44.08ms max=349.63ms p(90)=54.31ms  p(95)=57.61ms  p(99.9)=75.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133610
     http_req_receiving.............: avg=84.59µs min=27.37µs med=64.97µs max=76.42ms  p(90)=110.02µs p(95)=134.84µs p(99.9)=1.48ms 
     http_req_sending...............: avg=27.77µs min=5.33µs  med=10.85µs max=160.84ms p(90)=18.52µs  p(95)=23.05µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.57ms min=18.06ms med=43.98ms max=329.76ms p(90)=54.21ms  p(95)=57.5ms   p(99.9)=75.08ms
     http_reqs......................: 133610  1094.743534/s
     iteration_duration.............: avg=44.93ms min=20.66ms med=44.29ms max=367.26ms p(90)=54.51ms  p(95)=57.82ms  p(99.9)=75.82ms
     iterations.....................: 133510  1093.924177/s
     success_rate...................: 100.00% ✓ 133510      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 191175     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   626 kB/s
     http_req_blocked...............: avg=4.91µs  min=1.16µs  med=2.93µs  max=4.89ms   p(90)=4.62µs   p(95)=5.27µs   p(99.9)=55.6µs  
     http_req_connecting............: avg=1.7µs   min=0s      med=0s      max=4.84ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.8ms  min=18.79ms med=92.39ms max=369.29ms p(90)=114.99ms p(95)=124.17ms p(99.9)=227.02ms
       { expected_response:true }...: avg=93.8ms  min=18.79ms med=92.39ms max=369.29ms p(90)=114.99ms p(95)=124.17ms p(99.9)=227.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63825
     http_req_receiving.............: avg=100.7µs min=32.83µs med=77.27µs max=253.3ms  p(90)=114.89µs p(95)=129.36µs p(99.9)=985.55µs
     http_req_sending...............: avg=25.5µs  min=5.51µs  med=13.77µs max=171.42ms p(90)=21.09µs  p(95)=23.57µs  p(99.9)=700.1µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.68ms min=18.62ms med=92.28ms max=349.15ms p(90)=114.87ms p(95)=124.03ms p(99.9)=225.66ms
     http_reqs......................: 63825   521.434877/s
     iteration_duration.............: avg=94.16ms min=29.74ms med=92.64ms max=390.32ms p(90)=115.24ms p(95)=124.43ms p(99.9)=228.38ms
     iterations.....................: 63725   520.617901/s
     success_rate...................: 100.00% ✓ 63725      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 148704     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   487 kB/s
     http_req_blocked...............: avg=5.81µs   min=1.18µs  med=3.5µs    max=4.36ms   p(90)=5.08µs   p(95)=5.74µs   p(99.9)=191.46µs
     http_req_connecting............: avg=2.08µs   min=0s      med=0s       max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=67.03µs 
     http_req_duration..............: avg=120.58ms min=21.45ms med=118.73ms max=376.23ms p(90)=150.04ms p(95)=159.85ms p(99.9)=204.6ms 
       { expected_response:true }...: avg=120.58ms min=21.45ms med=118.73ms max=376.23ms p(90)=150.04ms p(95)=159.85ms p(99.9)=204.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 49668
     http_req_receiving.............: avg=94.62µs  min=30.31µs med=84.87µs  max=99.85ms  p(90)=118.85µs p(95)=131.73µs p(99.9)=867.28µs
     http_req_sending...............: avg=32.66µs  min=5.6µs   med=16.65µs  max=232.02ms p(90)=22.55µs  p(95)=24.67µs  p(99.9)=670.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.45ms min=21.32ms med=118.62ms max=364.7ms  p(90)=149.9ms  p(95)=159.69ms p(99.9)=203.38ms
     http_reqs......................: 49668   405.663482/s
     iteration_duration.............: avg=121.06ms min=46.74ms med=119.05ms max=387.3ms  p(90)=150.33ms p(95)=160.14ms p(99.9)=209.48ms
     iterations.....................: 49568   404.846732/s
     success_rate...................: 100.00% ✓ 49568      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84516      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   276 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.24µs  med=3.55µs   max=2.59ms   p(90)=5µs      p(95)=5.62µs   p(99.9)=577.11µs
     http_req_connecting............: avg=1.57µs   min=0s      med=0s       max=2.56ms   p(90)=0s       p(95)=0s       p(99.9)=532.37µs
     http_req_duration..............: avg=212.15ms min=24.46ms med=211.41ms max=375.83ms p(90)=228ms    p(95)=233.83ms p(99.9)=310.35ms
       { expected_response:true }...: avg=212.15ms min=24.46ms med=211.41ms max=375.83ms p(90)=228ms    p(95)=233.83ms p(99.9)=310.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28272
     http_req_receiving.............: avg=103.69µs min=34.61µs med=93µs     max=74.4ms   p(90)=127.13µs p(95)=140.81µs p(99.9)=904.57µs
     http_req_sending...............: avg=26.07µs  min=5.8µs   med=17.47µs  max=74.55ms  p(90)=22.95µs  p(95)=24.92µs  p(99.9)=642.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=212.02ms min=24.3ms  med=211.3ms  max=375.45ms p(90)=227.88ms p(95)=233.71ms p(99.9)=310.09ms
     http_reqs......................: 28272   230.011464/s
     iteration_duration.............: avg=213.12ms min=66.62ms med=211.76ms max=405.94ms p(90)=228.26ms p(95)=234.13ms p(99.9)=312.77ms
     iterations.....................: 28172   229.197898/s
     success_rate...................: 100.00% ✓ 28172      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84546      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   277 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.25µs  med=3.59µs   max=3.88ms   p(90)=5.03µs   p(95)=5.67µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=212.11ms min=18.85ms med=198.22ms max=724.68ms p(90)=245.32ms p(95)=282.35ms p(99.9)=625.99ms
       { expected_response:true }...: avg=212.11ms min=18.85ms med=198.22ms max=724.68ms p(90)=245.32ms p(95)=282.35ms p(99.9)=625.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28282
     http_req_receiving.............: avg=103.45µs min=35.96µs med=95.18µs  max=116.91ms p(90)=128.1µs  p(95)=141.7µs  p(99.9)=576.2µs 
     http_req_sending...............: avg=30.16µs  min=6.18µs  med=17.69µs  max=88.78ms  p(90)=22.87µs  p(95)=24.72µs  p(99.9)=559.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.98ms min=18.68ms med=198.11ms max=724.56ms p(90)=245.17ms p(95)=282.18ms p(99.9)=625.89ms
     http_reqs......................: 28282   230.728732/s
     iteration_duration.............: avg=213.11ms min=46.56ms med=198.64ms max=724.95ms p(90)=245.76ms p(95)=285.17ms p(99.9)=626.29ms
     iterations.....................: 28182   229.912917/s
     success_rate...................: 100.00% ✓ 28182      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

