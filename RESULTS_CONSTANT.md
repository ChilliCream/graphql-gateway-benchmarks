## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,894 | 3,082 | 2,811 | 3.0% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,107 | 2,175 | 2,079 | 1.5% |  |
| grafbase | 0.53.2 | 1,967 | 2,039 | 1,949 | 1.6% |  |
| cosmo | 0.298.0 | 1,256 | 1,274 | 1,237 | 1.2% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 611 | 621 | 606 | 0.9% |  |
| apollo-router | v2.12.1 | 394 | 406 | 390 | 1.4% |  |
| hive-gateway | 2.5.14 | 272 | 276 | 269 | 0.9% |  |
| apollo-gateway | 2.13.3 | 243 | 246 | 241 | 0.7% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,391 | 2,516 | 2,361 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,920 | 1,962 | 1,901 | 1.2% |  |
| grafbase | 0.53.2 | 1,512 | 1,543 | 1,502 | 0.9% |  |
| cosmo | 0.298.0 | 1,199 | 1,199 | 1,181 | 1.1% | non-compatible response (5715827 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 579 | 598 | 573 | 1.4% |  |
| apollo-router | v2.12.1 | 382 | 393 | 378 | 1.3% |  |
| hive-gateway | 2.5.14 | 273 | 279 | 271 | 1.0% |  |
| apollo-gateway | 2.13.3 | 234 | 236 | 232 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1043298     ✗ 0     
     data_received..................: 31 GB   254 MB/s
     data_sent......................: 418 MB  3.5 MB/s
     http_req_blocked...............: avg=3.25µs   min=1.07µs  med=2.42µs  max=20.67ms  p(90)=3.66µs  p(95)=4.31µs   p(99.9)=34.02µs
     http_req_connecting............: avg=306ns    min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17ms     min=1.57ms  med=16.1ms  max=331.97ms p(90)=25.16ms p(95)=29.25ms  p(99.9)=53.3ms 
       { expected_response:true }...: avg=17ms     min=1.57ms  med=16.1ms  max=331.97ms p(90)=25.16ms p(95)=29.25ms  p(99.9)=53.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 347866
     http_req_receiving.............: avg=152.61µs min=27.18µs med=49.78µs max=245.24ms p(90)=99.05µs p(95)=278.53µs p(99.9)=16.77ms
     http_req_sending...............: avg=60.95µs  min=5.16µs  med=9.39µs  max=242.44ms p(90)=16.13µs p(95)=122.43µs p(99.9)=11.98ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.79ms  min=1.47ms  med=15.95ms max=97.48ms  p(90)=24.86ms p(95)=28.78ms  p(99.9)=51.47ms
     http_reqs......................: 347866  2894.118065/s
     iteration_duration.............: avg=17.24ms  min=2.04ms  med=16.31ms max=354.96ms p(90)=25.39ms p(95)=29.53ms  p(99.9)=54.9ms 
     iterations.....................: 347766  2893.286102/s
     success_rate...................: 100.00% ✓ 347766      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 760131      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.24µs   min=1.07µs  med=2.47µs   max=6.59ms   p(90)=3.72µs   p(95)=4.36µs   p(99.9)=37.14µs 
     http_req_connecting............: avg=396ns    min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.44ms  min=2.52ms  med=15.04ms  max=368.66ms p(90)=52.2ms   p(95)=70.77ms  p(99.9)=171.8ms 
       { expected_response:true }...: avg=23.44ms  min=2.52ms  med=15.04ms  max=368.66ms p(90)=52.2ms   p(95)=70.77ms  p(99.9)=171.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 253477
     http_req_receiving.............: avg=709.59µs min=51.36µs med=109.79µs max=291.36ms p(90)=991.85µs p(95)=1.54ms   p(99.9)=64.18ms 
     http_req_sending...............: avg=43.92µs  min=5.35µs  med=9.63µs   max=135.33ms p(90)=15.82µs  p(95)=107.02µs p(99.9)=3.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.68ms  min=2.41ms  med=14.51ms  max=282.99ms p(90)=50.75ms  p(95)=69.23ms  p(99.9)=167.02ms
     http_reqs......................: 253477  2107.007067/s
     iteration_duration.............: avg=23.67ms  min=3.28ms  med=15.25ms  max=392.14ms p(90)=52.44ms  p(95)=71.04ms  p(99.9)=173.04ms
     iterations.....................: 253377  2106.175825/s
     success_rate...................: 100.00% ✓ 253377      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 709662      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=3.43µs   min=1.01µs  med=2.77µs  max=8.87ms   p(90)=4.28µs   p(95)=5.04µs   p(99.9)=39.37µs
     http_req_connecting............: avg=165ns    min=0s      med=0s      max=1.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.11ms  min=1.87ms  med=24.84ms max=337.3ms  p(90)=30.19ms  p(95)=32.5ms   p(99.9)=54.64ms
       { expected_response:true }...: avg=25.11ms  min=1.87ms  med=24.84ms max=337.3ms  p(90)=30.19ms  p(95)=32.5ms   p(99.9)=54.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236654
     http_req_receiving.............: avg=114.56µs min=28.38µs med=61.11µs max=170.6ms  p(90)=103.38µs p(95)=169.32µs p(99.9)=10.15ms
     http_req_sending...............: avg=43.34µs  min=5.4µs   med=10.95µs max=72.23ms  p(90)=17.74µs  p(95)=90.37µs  p(99.9)=2.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.95ms  min=1.78ms  med=24.73ms max=336.69ms p(90)=30.02ms  p(95)=32.25ms  p(99.9)=53.42ms
     http_reqs......................: 236654  1967.988081/s
     iteration_duration.............: avg=25.35ms  min=3.7ms   med=25.06ms max=359.14ms p(90)=30.42ms  p(95)=32.75ms  p(99.9)=55.26ms
     iterations.....................: 236554  1967.156492/s
     success_rate...................: 100.00% ✓ 236554      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453078      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 182 MB  1.5 MB/s
     http_req_blocked...............: avg=3.39µs   min=1.09µs  med=2.49µs  max=3.87ms   p(90)=3.84µs  p(95)=4.45µs  p(99.9)=34.61µs
     http_req_connecting............: avg=571ns    min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=39.49ms  min=2.08ms  med=38.91ms max=304.2ms  p(90)=55.77ms p(95)=60.81ms p(99.9)=85.04ms
       { expected_response:true }...: avg=39.49ms  min=2.08ms  med=38.91ms max=304.2ms  p(90)=55.77ms p(95)=60.81ms p(99.9)=85.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151126
     http_req_receiving.............: avg=110.42µs min=28.27µs med=60.23µs max=190.97ms p(90)=94.93µs p(95)=113µs   p(99.9)=2.67ms 
     http_req_sending...............: avg=29.61µs  min=5.28µs  med=10.37µs max=220.49ms p(90)=15.61µs p(95)=19.74µs p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=39.35ms  min=1.99ms  med=38.81ms max=118.21ms p(90)=55.64ms p(95)=60.69ms p(99.9)=83.48ms
     http_reqs......................: 151126  1256.532794/s
     iteration_duration.............: avg=39.72ms  min=3.71ms  med=39.12ms max=353.61ms p(90)=55.97ms p(95)=61.02ms p(99.9)=85.54ms
     iterations.....................: 151026  1255.701346/s
     success_rate...................: 100.00% ✓ 151026      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 220593     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 88 MB   734 kB/s
     http_req_blocked...............: avg=4.83µs   min=1.14µs  med=3.04µs  max=4.68ms   p(90)=4.62µs   p(95)=5.24µs   p(99.9)=51.52µs 
     http_req_connecting............: avg=1.49µs   min=0s      med=0s      max=4.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.26ms  min=3.86ms  med=78.89ms max=376.43ms p(90)=98.47ms  p(95)=108.06ms p(99.9)=200.29ms
       { expected_response:true }...: avg=81.26ms  min=3.86ms  med=78.89ms max=376.43ms p(90)=98.47ms  p(95)=108.06ms p(99.9)=200.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73631
     http_req_receiving.............: avg=160.61µs min=30.86µs med=76.07µs max=265.46ms p(90)=110.04µs p(95)=122.64µs p(99.9)=1.22ms  
     http_req_sending...............: avg=21.14µs  min=5.27µs  med=13.34µs max=42.31ms  p(90)=19.92µs  p(95)=22.27µs  p(99.9)=727.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.08ms  min=3.74ms  med=78.78ms max=225.58ms p(90)=98.35ms  p(95)=107.93ms p(99.9)=196.51ms
     http_reqs......................: 73631   611.150872/s
     iteration_duration.............: avg=81.6ms   min=7.97ms  med=79.12ms max=383.2ms  p(90)=98.71ms  p(95)=108.35ms p(99.9)=201.27ms
     iterations.....................: 73531   610.320853/s
     success_rate...................: 100.00% ✓ 73531      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 142605     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   474 kB/s
     http_req_blocked...............: avg=5.84µs   min=1.2µs   med=3.3µs    max=4.67ms   p(90)=4.72µs   p(95)=5.27µs   p(99.9)=906.63µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=4.61ms   p(90)=0s       p(95)=0s       p(99.9)=876.01µs
     http_req_duration..............: avg=125.73ms min=5.54ms  med=125.46ms max=378.06ms p(90)=152.1ms  p(95)=159.95ms p(99.9)=200.39ms
       { expected_response:true }...: avg=125.73ms min=5.54ms  med=125.46ms max=378.06ms p(90)=152.1ms  p(95)=159.95ms p(99.9)=200.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47635
     http_req_receiving.............: avg=90.66µs  min=31.22µs med=80.68µs  max=106.04ms p(90)=112.38µs p(95)=124.6µs  p(99.9)=700.52µs
     http_req_sending...............: avg=23.92µs  min=5.51µs  med=14.5µs   max=151.5ms  p(90)=20.09µs  p(95)=21.91µs  p(99.9)=504.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.61ms min=5.47ms  med=125.36ms max=377.84ms p(90)=151.99ms p(95)=159.83ms p(99.9)=199.94ms
     http_reqs......................: 47635   394.64847/s
     iteration_duration.............: avg=126.25ms min=24.68ms med=125.73ms max=393.86ms p(90)=152.36ms p(95)=160.23ms p(99.9)=206.15ms
     iterations.....................: 47535   393.819986/s
     success_rate...................: 100.00% ✓ 47535      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98394      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=5.74µs   min=1.32µs  med=3.85µs   max=3.01ms   p(90)=5.44µs   p(95)=6.13µs   p(99.9)=508.79µs
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=2.98ms   p(90)=0s       p(95)=0s       p(99.9)=430.64µs
     http_req_duration..............: avg=182.2ms  min=5.9ms   med=164.71ms max=621.31ms p(90)=214.88ms p(95)=395.15ms p(99.9)=512.36ms
       { expected_response:true }...: avg=182.2ms  min=5.9ms   med=164.71ms max=621.31ms p(90)=214.88ms p(95)=395.15ms p(99.9)=512.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32898
     http_req_receiving.............: avg=161.74µs min=33.11µs med=100.01µs max=158.96ms p(90)=136.77µs p(95)=150.83µs p(99.9)=1.11ms  
     http_req_sending...............: avg=39.81µs  min=6.29µs  med=18.6µs   max=159.85ms p(90)=23.74µs  p(95)=25.68µs  p(99.9)=759.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182ms    min=5.79ms  med=164.58ms max=621.21ms p(90)=214.46ms p(95)=395ms    p(99.9)=512.26ms
     http_reqs......................: 32898   272.255437/s
     iteration_duration.............: avg=183.05ms min=52.66ms med=165.07ms max=621.57ms p(90)=215.42ms p(95)=395.69ms p(99.9)=512.68ms
     iterations.....................: 32798   271.427862/s
     success_rate...................: 100.00% ✓ 32798      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88122      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7.3µs    min=1.28µs  med=3.4µs    max=4.26ms   p(90)=4.63µs   p(95)=5.16µs   p(99.9)=1.95ms  
     http_req_connecting............: avg=3.71µs   min=0s      med=0s       max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=203.42ms min=8.35ms  med=207.87ms max=433.59ms p(90)=220.4ms  p(95)=229.76ms p(99.9)=291.88ms
       { expected_response:true }...: avg=203.42ms min=8.35ms  med=207.87ms max=433.59ms p(90)=220.4ms  p(95)=229.76ms p(99.9)=291.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29474
     http_req_receiving.............: avg=92.35µs  min=32.46µs med=87.69µs  max=12.34ms  p(90)=119.23µs p(95)=130.63µs p(99.9)=494.18µs
     http_req_sending...............: avg=32.68µs  min=6.26µs  med=15.66µs  max=231.14ms p(90)=20.67µs  p(95)=22.56µs  p(99.9)=463.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.3ms  min=8.23ms  med=207.75ms max=433.19ms p(90)=220.28ms p(95)=229.64ms p(99.9)=291.45ms
     http_reqs......................: 29474   243.502321/s
     iteration_duration.............: avg=204.39ms min=42.31ms med=208.19ms max=445.81ms p(90)=220.68ms p(95)=230.03ms p(99.9)=295.88ms
     iterations.....................: 29374   242.676161/s
     success_rate...................: 100.00% ✓ 29374      ✗ 0    
     vus............................: 26      min=26       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 862407      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.33µs   min=1.01µs  med=2.46µs  max=17.51ms  p(90)=3.97µs   p(95)=4.77µs   p(99.9)=36.09µs
     http_req_connecting............: avg=345ns    min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.62ms  min=1.84ms  med=20.15ms max=339.45ms p(90)=28.51ms  p(95)=31.64ms  p(99.9)=54.05ms
       { expected_response:true }...: avg=20.62ms  min=1.84ms  med=20.15ms max=339.45ms p(90)=28.51ms  p(95)=31.64ms  p(99.9)=54.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287569
     http_req_receiving.............: avg=132.75µs min=27.75µs med=54.21µs max=265.37ms p(90)=104.12µs p(95)=264.76µs p(99.9)=9.29ms 
     http_req_sending...............: avg=53.42µs  min=5.27µs  med=10.04µs max=32.82ms  p(90)=18.33µs  p(95)=125.75µs p(99.9)=6.03ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.44ms  min=1.75ms  med=20ms    max=89.08ms  p(90)=28.31ms  p(95)=31.35ms  p(99.9)=53.08ms
     http_reqs......................: 287569  2391.712794/s
     iteration_duration.............: avg=20.86ms  min=3.11ms  med=20.36ms max=370.75ms p(90)=28.74ms  p(95)=31.88ms  p(99.9)=54.62ms
     iterations.....................: 287469  2390.881094/s
     success_rate...................: 100.00% ✓ 287469      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 692424      ✗ 0     
     data_received..................: 20 GB   168 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=3.58µs  min=1.06µs  med=2.5µs    max=10.92ms  p(90)=3.97µs  p(95)=4.72µs   p(99.9)=37.73µs 
     http_req_connecting............: avg=671ns   min=0s      med=0s       max=6.5ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.74ms min=1.84ms  med=17.58ms  max=581.64ms p(90)=54.43ms p(95)=72.22ms  p(99.9)=194.9ms 
       { expected_response:true }...: avg=25.74ms min=1.84ms  med=17.58ms  max=581.64ms p(90)=54.43ms p(95)=72.22ms  p(99.9)=194.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 230908
     http_req_receiving.............: avg=730.6µs min=51.58µs med=110.32µs max=295.4ms  p(90)=1.16ms  p(95)=1.86ms   p(99.9)=62.76ms 
     http_req_sending...............: avg=43.79µs min=4.93µs  med=10.04µs  max=141.95ms p(90)=18.34µs p(95)=111.06µs p(99.9)=2.71ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.97ms min=1.72ms  med=17ms     max=581.52ms p(90)=53.06ms p(95)=70.6ms   p(99.9)=186.05ms
     http_reqs......................: 230908  1920.263069/s
     iteration_duration.............: avg=25.98ms min=2.45ms  med=17.8ms   max=581.87ms p(90)=54.67ms p(95)=72.46ms  p(99.9)=197.79ms
     iterations.....................: 230808  1919.431456/s
     success_rate...................: 100.00% ✓ 230808      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 545712      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.85µs   min=1.02µs  med=2.47µs  max=13.14ms  p(90)=4.88µs   p(95)=6.03µs   p(99.9)=44.34µs
     http_req_connecting............: avg=685ns    min=0s      med=0s      max=5.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.71ms  min=2.37ms  med=31.88ms max=322.49ms p(90)=43.15ms  p(95)=47.61ms  p(99.9)=87.75ms
       { expected_response:true }...: avg=32.71ms  min=2.37ms  med=31.88ms max=322.49ms p(90)=43.15ms  p(95)=47.61ms  p(99.9)=87.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182004
     http_req_receiving.............: avg=112.35µs min=30.46µs med=62.64µs max=38.21ms  p(90)=136.94µs p(95)=289.57µs p(99.9)=5.44ms 
     http_req_sending...............: avg=47.15µs  min=5.34µs  med=10.41µs max=192.64ms p(90)=24.55µs  p(95)=137.11µs p(99.9)=3.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.55ms  min=2.29ms  med=31.74ms max=321.61ms p(90)=42.97ms  p(95)=47.4ms   p(99.9)=87.5ms 
     http_reqs......................: 182004  1512.855651/s
     iteration_duration.............: avg=32.97ms  min=4.19ms  med=32.12ms max=343.79ms p(90)=43.39ms  p(95)=47.86ms  p(99.9)=88.62ms
     iterations.....................: 181904  1512.02443/s
     success_rate...................: 100.00% ✓ 181904      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432684      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.23µs  min=1.02µs  med=2.34µs  max=3.85ms   p(90)=3.73µs  p(95)=4.31µs   p(99.9)=36.87µs
     http_req_connecting............: avg=569ns   min=0s      med=0s      max=3.81ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.36ms min=2.15ms  med=40.84ms max=312.72ms p(90)=58.13ms p(95)=63.36ms  p(99.9)=88.17ms
       { expected_response:true }...: avg=41.36ms min=2.15ms  med=40.84ms max=312.72ms p(90)=58.13ms p(95)=63.36ms  p(99.9)=88.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144328
     http_req_receiving.............: avg=79.4µs  min=28.96µs med=62.05µs max=169.48ms p(90)=96.26µs p(95)=112.32µs p(99.9)=1.77ms 
     http_req_sending...............: avg=24.98µs min=5.18µs  med=10.62µs max=144.4ms  p(90)=15.99µs p(95)=19.14µs  p(99.9)=968µs  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.26ms min=2.03ms  med=40.74ms max=311.66ms p(90)=58.03ms p(95)=63.25ms  p(99.9)=87.73ms
     http_reqs......................: 144328  1199.954267/s
     iteration_duration.............: avg=41.59ms min=4.54ms  med=41.04ms max=349.35ms p(90)=58.33ms p(95)=63.56ms  p(99.9)=88.44ms
     iterations.....................: 144228  1199.122859/s
     success_rate...................: 100.00% ✓ 144228      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 209163     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   696 kB/s
     http_req_blocked...............: avg=5.05µs   min=1.22µs  med=3.38µs  max=3.77ms   p(90)=4.94µs   p(95)=5.55µs   p(99.9)=43.94µs 
     http_req_connecting............: avg=1.42µs   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.71ms  min=4.06ms  med=82.52ms max=360.26ms p(90)=106.71ms p(95)=118.78ms p(99.9)=213.96ms
       { expected_response:true }...: avg=85.71ms  min=4.06ms  med=82.52ms max=360.26ms p(90)=106.71ms p(95)=118.78ms p(99.9)=213.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69821
     http_req_receiving.............: avg=161.31µs min=31.82µs med=81.67µs max=237.47ms p(90)=115.14µs p(95)=127.89µs p(99.9)=1.26ms  
     http_req_sending...............: avg=22.69µs  min=6.02µs  med=14.13µs max=137.98ms p(90)=20.51µs  p(95)=22.67µs  p(99.9)=665.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.52ms  min=3.94ms  med=82.41ms max=243.26ms p(90)=106.59ms p(95)=118.64ms p(99.9)=209.15ms
     http_reqs......................: 69821   579.212956/s
     iteration_duration.............: avg=86.07ms  min=9.64ms  med=82.78ms max=377.25ms p(90)=106.96ms p(95)=119.07ms p(99.9)=215.11ms
     iterations.....................: 69721   578.383388/s
     success_rate...................: 100.00% ✓ 69721      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 138381     ✗ 0    
     data_received..................: 4.0 GB  34 MB/s
     data_sent......................: 56 MB   460 kB/s
     http_req_blocked...............: avg=6.2µs    min=1.21µs  med=3.65µs   max=4.45ms   p(90)=5.18µs   p(95)=5.74µs   p(99.9)=1.05ms  
     http_req_connecting............: avg=2.38µs   min=0s      med=0s       max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=129.57ms min=6.01ms  med=126.91ms max=341.06ms p(90)=172.4ms  p(95)=185.44ms p(99.9)=236.77ms
       { expected_response:true }...: avg=129.57ms min=6.01ms  med=126.91ms max=341.06ms p(90)=172.4ms  p(95)=185.44ms p(99.9)=236.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46227
     http_req_receiving.............: avg=95.83µs  min=31.71µs med=88.19µs  max=72.71ms  p(90)=119.68µs p(95)=131.92µs p(99.9)=661.54µs
     http_req_sending...............: avg=28.19µs  min=5.84µs  med=16.85µs  max=87.99ms  p(90)=22.01µs  p(95)=23.78µs  p(99.9)=565.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.45ms min=5.87ms  med=126.8ms  max=340.84ms p(90)=172.29ms p(95)=185.3ms  p(99.9)=235.99ms
     http_reqs......................: 46227   382.787713/s
     iteration_duration.............: avg=130.11ms min=29.11ms med=127.23ms max=348.63ms p(90)=172.71ms p(95)=185.74ms p(99.9)=238.28ms
     iterations.....................: 46127   381.959652/s
     success_rate...................: 100.00% ✓ 46127      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98817      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.22µs  med=3.87µs   max=4.67ms   p(90)=5.38µs   p(95)=5.98µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=3.18µs   min=0s      med=0s       max=4.63ms   p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=181.46ms min=5.95ms  med=182.27ms max=711.54ms p(90)=249.13ms p(95)=324.87ms p(99.9)=570.26ms
       { expected_response:true }...: avg=181.46ms min=5.95ms  med=182.27ms max=711.54ms p(90)=249.13ms p(95)=324.87ms p(99.9)=570.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33039
     http_req_receiving.............: avg=199.4µs  min=31.16µs med=98.77µs  max=238.61ms p(90)=130.98µs p(95)=144.65µs p(99.9)=19.49ms 
     http_req_sending...............: avg=24.67µs  min=5.7µs   med=18.25µs  max=45.13ms  p(90)=23.21µs  p(95)=24.94µs  p(99.9)=558.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.24ms min=5.85ms  med=182.04ms max=711.28ms p(90)=248.88ms p(95)=322.79ms p(99.9)=570.15ms
     http_reqs......................: 33039   273.191526/s
     iteration_duration.............: avg=182.29ms min=38.35ms med=182.98ms max=711.82ms p(90)=249.55ms p(95)=327.53ms p(99.9)=570.52ms
     iterations.....................: 32939   272.36465/s
     success_rate...................: 100.00% ✓ 32939      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84900      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   282 kB/s
     http_req_blocked...............: avg=7.06µs   min=1.35µs  med=3.71µs   max=3.72ms   p(90)=5.09µs   p(95)=5.65µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=3.07µs   min=0s      med=0s       max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=211.08ms min=8.59ms  med=218.61ms max=401.96ms p(90)=236.49ms p(95)=244.09ms p(99.9)=304.11ms
       { expected_response:true }...: avg=211.08ms min=8.59ms  med=218.61ms max=401.96ms p(90)=236.49ms p(95)=244.09ms p(99.9)=304.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28400
     http_req_receiving.............: avg=110.51µs min=33.17µs med=95.44µs  max=94.15ms  p(90)=127.37µs p(95)=140.48µs p(99.9)=538.66µs
     http_req_sending...............: avg=44.53µs  min=6.07µs  med=17.73µs  max=111.73ms p(90)=22.7µs   p(95)=24.49µs  p(99.9)=930.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.93ms min=8.44ms  med=218.37ms max=401.04ms p(90)=236.36ms p(95)=243.91ms p(99.9)=303.91ms
     http_reqs......................: 28400   234.54052/s
     iteration_duration.............: avg=212.11ms min=51.55ms med=219.37ms max=429.35ms p(90)=236.79ms p(95)=244.51ms p(99.9)=306.47ms
     iterations.....................: 28300   233.714673/s
     success_rate...................: 100.00% ✓ 28300      ✗ 0    
     vus............................: 38      min=38       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

