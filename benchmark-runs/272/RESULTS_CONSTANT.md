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
| hive-router | v0.0.78 | 3,115 | 3,374 | 3,069 | 3.1% |  |
| fusion-nightly-net11 | 16.5.0-p.1 | 2,407 | 2,490 | 2,402 | 1.3% |  |
| fusion | 16.4.0 | 2,379 | 2,446 | 2,355 | 1.3% |  |
| fusion-nightly | 16.5.0-p.1 | 2,365 | 2,443 | 2,359 | 1.2% |  |
| grafbase | 0.53.5 | 2,152 | 2,274 | 2,139 | 2.3% |  |
| cosmo | 0.329.0 | 1,297 | 1,341 | 1,286 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 608 | 627 | 606 | 1.4% |  |
| apollo-router | v2.16.0 | 478 | 498 | 470 | 2.0% |  |
| apollo-gateway | 2.14.2 | 285 | 289 | 282 | 0.7% |  |
| hive-gateway | 2.10.2 | 281 | 289 | 280 | 1.1% |  |
| feddi | 77271dc84a06 | — | — | — | — | non-compatible response (1058 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,592 | 2,775 | 2,558 | 2.8% |  |
| fusion | 16.4.0 | 2,259 | 2,356 | 2,255 | 1.6% |  |
| fusion-nightly | 16.5.0-p.1 | 2,235 | 2,328 | 2,215 | 1.7% |  |
| fusion-nightly-net11 | 16.5.0-p.1 | 2,180 | 2,276 | 2,171 | 1.7% |  |
| fusion-nightly-fed | 16.5.0-p.1 | 2,041 | 2,124 | 2,030 | 1.6% |  |
| grafbase | 0.53.5 | 1,621 | 1,680 | 1,619 | 1.3% |  |
| cosmo | 0.329.0 | 1,170 | 1,219 | 1,167 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.2 | 576 | 598 | 574 | 1.4% |  |
| apollo-router | v2.16.0 | 449 | 467 | 448 | 1.7% |  |
| apollo-gateway | 2.14.2 | 271 | 272 | 268 | 0.5% |  |
| hive-gateway | 2.10.2 | 261 | 267 | 260 | 0.9% |  |
| feddi | 77271dc84a06 | 20 | 20 | 19 | 2.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1122972     ✗ 0     
     data_received..................: 33 GB   273 MB/s
     data_sent......................: 450 MB  3.7 MB/s
     http_req_blocked...............: avg=2.67µs  min=832ns   med=1.96µs  max=18.04ms  p(90)=3.23µs  p(95)=3.86µs   p(99.9)=31.64µs
     http_req_connecting............: avg=230ns   min=0s      med=0s      max=3.17ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.81ms min=1.4ms   med=15.07ms max=275.83ms p(90)=23.22ms p(95)=26.55ms  p(99.9)=47.01ms
       { expected_response:true }...: avg=15.81ms min=1.4ms   med=15.07ms max=275.83ms p(90)=23.22ms p(95)=26.55ms  p(99.9)=47.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 374424
     http_req_receiving.............: avg=89.94µs min=24.19µs med=43.58µs max=163.61ms p(90)=82.85µs p(95)=152.81µs p(99.9)=8.12ms 
     http_req_sending...............: avg=48.82µs min=4.26µs  med=8.04µs  max=151.9ms  p(90)=14.27µs p(95)=90.38µs  p(99.9)=7.84ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.67ms min=1.36ms  med=14.96ms max=275.35ms p(90)=23.05ms p(95)=26.27ms  p(99.9)=45.62ms
     http_reqs......................: 374424  3115.568721/s
     iteration_duration.............: avg=16.01ms min=1.99ms  med=15.25ms max=294.11ms p(90)=23.43ms p(95)=26.78ms  p(99.9)=47.65ms
     iterations.....................: 374324  3114.736625/s
     success_rate...................: 100.00% ✓ 374324      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 868170      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=2.6µs    min=831ns   med=1.9µs    max=13.52ms  p(90)=3.23µs  p(95)=3.87µs  p(99.9)=27.47µs
     http_req_connecting............: avg=307ns    min=0s      med=0s       max=3.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.51ms  min=1.98ms  med=19.68ms  max=283.13ms p(90)=29.53ms p(95)=33.12ms p(99.9)=53.7ms 
       { expected_response:true }...: avg=20.51ms  min=1.98ms  med=19.68ms  max=283.13ms p(90)=29.53ms p(95)=33.12ms p(99.9)=53.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 289490
     http_req_receiving.............: avg=725.07µs min=49.88µs med=142.24µs max=192.74ms p(90)=1.78ms  p(95)=2.57ms  p(99.9)=17.67ms
     http_req_sending...............: avg=39.12µs  min=4.44µs  med=8.16µs   max=99.26ms  p(90)=16.26µs p(95)=76.11µs p(99.9)=2.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.74ms  min=1.9ms   med=18.92ms  max=282.74ms p(90)=28.66ms p(95)=32.2ms  p(99.9)=52.19ms
     http_reqs......................: 289490  2407.664351/s
     iteration_duration.............: avg=20.72ms  min=3.58ms  med=19.87ms  max=296.41ms p(90)=29.74ms p(95)=33.34ms p(99.9)=54.42ms
     iterations.....................: 289390  2406.832659/s
     success_rate...................: 100.00% ✓ 289390      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 858336      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.6µs    min=902ns   med=1.94µs  max=4.2ms    p(90)=3.14µs  p(95)=3.7µs   p(99.9)=28.61µs 
     http_req_connecting............: avg=312ns    min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.75ms  min=2.01ms  med=17.68ms max=315.65ms p(90)=33.64ms p(95)=40.99ms p(99.9)=144.39ms
       { expected_response:true }...: avg=20.75ms  min=2.01ms  med=17.68ms max=315.65ms p(90)=33.64ms p(95)=40.99ms p(99.9)=144.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286212
     http_req_receiving.............: avg=594.91µs min=49.79µs med=91.97µs max=174.57ms p(90)=1.08ms  p(95)=1.85ms  p(99.9)=27.98ms 
     http_req_sending...............: avg=37.91µs  min=4.45µs  med=8.36µs  max=113.8ms  p(90)=14.99µs p(95)=64.97µs p(99.9)=2.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.12ms  min=1.93ms  med=17.15ms max=315.57ms p(90)=32.64ms p(95)=39.75ms p(99.9)=142.73ms
     http_reqs......................: 286212  2379.990939/s
     iteration_duration.............: avg=20.96ms  min=2.87ms  med=17.87ms max=315.84ms p(90)=33.85ms p(95)=41.22ms p(99.9)=145.63ms
     iterations.....................: 286112  2379.159391/s
     success_rate...................: 100.00% ✓ 286112      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 853179      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=2.47µs   min=872ns   med=1.92µs  max=4.86ms   p(90)=3.06µs  p(95)=3.62µs  p(99.9)=28.13µs 
     http_req_connecting............: avg=193ns    min=0s      med=0s      max=3.27ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.88ms  min=2.09ms  med=17.76ms max=404.41ms p(90)=34.07ms p(95)=41.42ms p(99.9)=141.75ms
       { expected_response:true }...: avg=20.88ms  min=2.09ms  med=17.76ms max=404.41ms p(90)=34.07ms p(95)=41.42ms p(99.9)=141.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284493
     http_req_receiving.............: avg=614.22µs min=50.92µs med=91.34µs max=178.94ms p(90)=1.1ms   p(95)=1.97ms  p(99.9)=28.18ms 
     http_req_sending...............: avg=38.07µs  min=4.8µs   med=8.21µs  max=140.48ms p(90)=13.82µs p(95)=41.49µs p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.23ms  min=1.96ms  med=17.22ms max=404.32ms p(90)=33ms    p(95)=40.19ms p(99.9)=139.83ms
     http_reqs......................: 284493  2365.815245/s
     iteration_duration.............: avg=21.08ms  min=3.12ms  med=17.95ms max=404.59ms p(90)=34.28ms p(95)=41.64ms p(99.9)=142.99ms
     iterations.....................: 284393  2364.983655/s
     success_rate...................: 100.00% ✓ 284393      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 776199      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=3.58µs  min=1.04µs  med=2.58µs  max=13.43ms  p(90)=4.08µs  p(95)=4.8µs    p(99.9)=39.23µs
     http_req_connecting............: avg=466ns   min=0s      med=0s      max=4.39ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.96ms min=1.73ms  med=22.73ms max=295.73ms p(90)=27.34ms p(95)=29.22ms  p(99.9)=49.04ms
       { expected_response:true }...: avg=22.96ms min=1.73ms  med=22.73ms max=295.73ms p(90)=27.34ms p(95)=29.22ms  p(99.9)=49.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258833
     http_req_receiving.............: avg=90.83µs min=28.31µs med=56.33µs max=243ms    p(90)=95.43µs p(95)=125.75µs p(99.9)=5.97ms 
     http_req_sending...............: avg=39.6µs  min=5.25µs  med=10.57µs max=154.04ms p(90)=17.08µs p(95)=29.94µs  p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.83ms min=1.66ms  med=22.62ms max=279.07ms p(90)=27.21ms p(95)=29.04ms  p(99.9)=47.97ms
     http_reqs......................: 258833  2152.911494/s
     iteration_duration.............: avg=23.18ms min=3.71ms  med=22.93ms max=305.25ms p(90)=27.54ms p(95)=29.44ms  p(99.9)=49.42ms
     iterations.....................: 258733  2152.079718/s
     success_rate...................: 100.00% ✓ 258733      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 467937      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 188 MB  1.6 MB/s
     http_req_blocked...............: avg=3.27µs  min=992ns   med=2.41µs  max=3.43ms   p(90)=3.85µs  p(95)=4.5µs   p(99.9)=33.99µs 
     http_req_connecting............: avg=559ns   min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=38.22ms min=1.92ms  med=37.85ms max=309.02ms p(90)=53.55ms p(95)=58.28ms p(99.9)=81.49ms 
       { expected_response:true }...: avg=38.22ms min=1.92ms  med=37.85ms max=309.02ms p(90)=53.55ms p(95)=58.28ms p(99.9)=81.49ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 156079
     http_req_receiving.............: avg=75.53µs min=27.02µs med=61.8µs  max=74.28ms  p(90)=97.41µs p(95)=112.8µs p(99.9)=889.49µs
     http_req_sending...............: avg=22.29µs min=4.67µs  med=10.69µs max=40.86ms  p(90)=16.95µs p(95)=20.93µs p(99.9)=924.2µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=38.13ms min=1.83ms  med=37.75ms max=282.08ms p(90)=53.43ms p(95)=58.17ms p(99.9)=81.41ms 
     http_reqs......................: 156079  1297.601548/s
     iteration_duration.............: avg=38.46ms min=3.72ms  med=38.06ms max=316.5ms  p(90)=53.75ms p(95)=58.49ms p(99.9)=81.78ms 
     iterations.....................: 155979  1296.770173/s
     success_rate...................: 100.00% ✓ 155979      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 219564     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 88 MB   731 kB/s
     http_req_blocked...............: avg=4.57µs  min=1.01µs  med=2.93µs  max=4.07ms   p(90)=4.42µs   p(95)=5.07µs   p(99.9)=43.89µs 
     http_req_connecting............: avg=1.35µs  min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.64ms min=3.64ms  med=79.14ms max=310.16ms p(90)=104.15ms p(95)=115.55ms p(99.9)=200.08ms
       { expected_response:true }...: avg=81.64ms min=3.64ms  med=79.14ms max=310.16ms p(90)=104.15ms p(95)=115.55ms p(99.9)=200.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73288
     http_req_receiving.............: avg=81.18µs min=31.33µs med=68.45µs max=130.73ms p(90)=102.89µs p(95)=115.79µs p(99.9)=643.56µs
     http_req_sending...............: avg=22.61µs min=5.38µs  med=13.66µs max=161.8ms  p(90)=19.77µs  p(95)=22.06µs  p(99.9)=600.38µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.53ms min=3.53ms  med=79.05ms max=309.87ms p(90)=104.06ms p(95)=115.45ms p(99.9)=199.39ms
     http_reqs......................: 73288   608.296185/s
     iteration_duration.............: avg=81.98ms min=16.86ms med=79.41ms max=325.79ms p(90)=104.41ms p(95)=115.84ms p(99.9)=201.43ms
     iterations.....................: 73188   607.466177/s
     success_rate...................: 100.00% ✓ 73188      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 172746     ✗ 0    
     data_received..................: 5.1 GB  42 MB/s
     data_sent......................: 69 MB   574 kB/s
     http_req_blocked...............: avg=5.47µs   min=1.4µs   med=3.51µs   max=4.14ms   p(90)=4.96µs   p(95)=5.56µs   p(99.9)=61.98µs 
     http_req_connecting............: avg=1.7µs    min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=103.76ms min=4.71ms  med=103.39ms max=333.28ms p(90)=125.41ms p(95)=131.8ms  p(99.9)=164.01ms
       { expected_response:true }...: avg=103.76ms min=4.71ms  med=103.39ms max=333.28ms p(90)=125.41ms p(95)=131.8ms  p(99.9)=164.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 57682
     http_req_receiving.............: avg=85.83µs  min=33.59µs med=80.72µs  max=32.29ms  p(90)=112.81µs p(95)=125.96µs p(99.9)=560.69µs
     http_req_sending...............: avg=28.71µs  min=5.8µs   med=16.63µs  max=138.58ms p(90)=22.16µs  p(95)=24.16µs  p(99.9)=604.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.65ms min=4.58ms  med=103.28ms max=332.25ms p(90)=125.29ms p(95)=131.71ms p(99.9)=163.72ms
     http_reqs......................: 57682   478.322321/s
     iteration_duration.............: avg=104.22ms min=32.32ms med=103.68ms max=359.37ms p(90)=125.66ms p(95)=132.09ms p(99.9)=165.79ms
     iterations.....................: 57582   477.493081/s
     success_rate...................: 100.00% ✓ 57582      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103329     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   343 kB/s
     http_req_blocked...............: avg=5.74µs   min=1.08µs  med=2.99µs   max=3.73ms   p(90)=4.26µs   p(95)=4.76µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=2.55µs   min=0s      med=0s       max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=173.5ms  min=7.38ms  med=165.78ms max=368.4ms  p(90)=209.23ms p(95)=215.61ms p(99.9)=279.4ms 
       { expected_response:true }...: avg=173.5ms  min=7.38ms  med=165.78ms max=368.4ms  p(90)=209.23ms p(95)=215.61ms p(99.9)=279.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34543
     http_req_receiving.............: avg=86.69µs  min=32.02µs med=84.09µs  max=31.25ms  p(90)=113.73µs p(95)=124.61µs p(99.9)=426.67µs
     http_req_sending...............: avg=30.78µs  min=5.59µs  med=16.34µs  max=102.3ms  p(90)=20.81µs  p(95)=22.54µs  p(99.9)=431.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.38ms min=7.26ms  med=165.68ms max=357.4ms  p(90)=209.13ms p(95)=215.51ms p(99.9)=279.18ms
     http_reqs......................: 34543   285.656866/s
     iteration_duration.............: avg=174.27ms min=46.23ms med=166.05ms max=375.93ms p(90)=209.55ms p(95)=215.91ms p(99.9)=282.06ms
     iterations.....................: 34443   284.829906/s
     success_rate...................: 100.00% ✓ 34443      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 101637     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.43µs   min=1.25µs  med=3.71µs   max=3.45ms   p(90)=5.23µs   p(95)=5.84µs   p(99.9)=1.12ms  
     http_req_connecting............: avg=2.48µs   min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.1ms   
     http_req_duration..............: avg=176.38ms min=5.49ms  med=161.8ms  max=718.59ms p(90)=208.03ms p(95)=244.36ms p(99.9)=610.65ms
       { expected_response:true }...: avg=176.38ms min=5.49ms  med=161.8ms  max=718.59ms p(90)=208.03ms p(95)=244.36ms p(99.9)=610.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33979
     http_req_receiving.............: avg=95.51µs  min=34.96µs med=91.07µs  max=19.45ms  p(90)=121.86µs p(95)=134.03µs p(99.9)=659.69µs
     http_req_sending...............: avg=22.06µs  min=5.7µs   med=18.58µs  max=13.9ms   p(90)=23.36µs  p(95)=25.26µs  p(99.9)=526.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.26ms min=5.36ms  med=161.69ms max=718.47ms p(90)=207.9ms  p(95)=244.29ms p(99.9)=610.53ms
     http_reqs......................: 33979   281.018401/s
     iteration_duration.............: avg=177.18ms min=33.03ms med=162.16ms max=718.92ms p(90)=208.42ms p(95)=245.24ms p(99.9)=610.92ms
     iterations.....................: 33879   280.191366/s
     success_rate...................: 100.00% ✓ 33879      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 934812      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=3.08µs  min=832ns   med=2.34µs  max=11.72ms  p(90)=4µs     p(95)=4.75µs   p(99.9)=35.22µs
     http_req_connecting............: avg=313ns   min=0s      med=0s      max=4.14ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.03ms min=1.79ms  med=18.7ms  max=290.99ms p(90)=26.29ms p(95)=28.71ms  p(99.9)=48.19ms
       { expected_response:true }...: avg=19.03ms min=1.79ms  med=18.7ms  max=290.99ms p(90)=26.29ms p(95)=28.71ms  p(99.9)=48.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311704
     http_req_receiving.............: avg=91.37µs min=24.88µs med=49.03µs max=59.86ms  p(90)=92.5µs  p(95)=150.82µs p(99.9)=7.09ms 
     http_req_sending...............: avg=45µs    min=4.68µs  med=9.66µs  max=130.38ms p(90)=17.86µs p(95)=96.05µs  p(99.9)=3.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.89ms min=1.7ms   med=18.59ms max=290.22ms p(90)=26.13ms p(95)=28.5ms   p(99.9)=46.94ms
     http_reqs......................: 311704  2592.594292/s
     iteration_duration.............: avg=19.24ms min=3.3ms   med=18.9ms  max=303.57ms p(90)=26.49ms p(95)=28.93ms  p(99.9)=48.72ms
     iterations.....................: 311604  2591.762544/s
     success_rate...................: 100.00% ✓ 311604      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 814644      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 326 MB  2.7 MB/s
     http_req_blocked...............: avg=2.99µs   min=892ns   med=2.24µs  max=13.51ms  p(90)=3.79µs  p(95)=4.47µs  p(99.9)=35.53µs 
     http_req_connecting............: avg=339ns    min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.86ms  min=1.63ms  med=18.08ms max=329.55ms p(90)=36ms    p(95)=44.46ms p(99.9)=165.28ms
       { expected_response:true }...: avg=21.86ms  min=1.63ms  med=18.08ms max=329.55ms p(90)=36ms    p(95)=44.46ms p(99.9)=165.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 271648
     http_req_receiving.............: avg=632.81µs min=49.97µs med=98.73µs max=299.86ms p(90)=1.16ms  p(95)=1.99ms  p(99.9)=31.13ms 
     http_req_sending...............: avg=39.16µs  min=4.84µs  med=9.34µs  max=203.78ms p(90)=18.51µs p(95)=73.09µs p(99.9)=2.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.19ms  min=1.5ms   med=17.52ms max=329.44ms p(90)=34.89ms p(95)=43.11ms p(99.9)=163.53ms
     http_reqs......................: 271648  2259.557915/s
     iteration_duration.............: avg=22.08ms  min=2.9ms   med=18.29ms max=335.79ms p(90)=36.22ms p(95)=44.7ms  p(99.9)=166.25ms
     iterations.....................: 271548  2258.726119/s
     success_rate...................: 100.00% ✓ 271548      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 805938      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 323 MB  2.7 MB/s
     http_req_blocked...............: avg=3.39µs   min=952ns   med=2.59µs   max=6.8ms    p(90)=4.06µs  p(95)=4.76µs  p(99.9)=38.57µs 
     http_req_connecting............: avg=381ns    min=0s      med=0s       max=4.19ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.1ms   min=1.58ms  med=18.13ms  max=525.72ms p(90)=36.54ms p(95)=45.21ms p(99.9)=173.34ms
       { expected_response:true }...: avg=22.1ms   min=1.58ms  med=18.13ms  max=525.72ms p(90)=36.54ms p(95)=45.21ms p(99.9)=173.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 268746
     http_req_receiving.............: avg=645.24µs min=52.77µs med=102.83µs max=174.71ms p(90)=1.16ms  p(95)=2.02ms  p(99.9)=30.39ms 
     http_req_sending...............: avg=41.71µs  min=4.82µs  med=9.73µs   max=92.83ms  p(90)=16.98µs p(95)=76.09µs p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.41ms  min=1.51ms  med=17.55ms  max=524.63ms p(90)=35.42ms p(95)=43.92ms p(99.9)=172.51ms
     http_reqs......................: 268746  2235.478249/s
     iteration_duration.............: avg=22.32ms  min=2.76ms  med=18.34ms  max=525.97ms p(90)=36.78ms p(95)=45.45ms p(99.9)=174.52ms
     iterations.....................: 268646  2234.646431/s
     success_rate...................: 100.00% ✓ 268646      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 786036      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=2.89µs   min=851ns  med=2.04µs   max=12.32ms  p(90)=3.66µs  p(95)=4.4µs   p(99.9)=35.25µs
     http_req_connecting............: avg=344ns    min=0s     med=0s       max=3.94ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=22.67ms  min=1.55ms med=21.77ms  max=278.82ms p(90)=32.88ms p(95)=36.76ms p(99.9)=57.5ms 
       { expected_response:true }...: avg=22.67ms  min=1.55ms med=21.77ms  max=278.82ms p(90)=32.88ms p(95)=36.76ms p(99.9)=57.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 262112
     http_req_receiving.............: avg=876.43µs min=51.3µs med=253.34µs max=251.74ms p(90)=2.03ms  p(95)=2.98ms  p(99.9)=19.62ms
     http_req_sending...............: avg=34.98µs  min=4.6µs  med=8.67µs   max=29.96ms  p(90)=17.61µs p(95)=37.94µs p(99.9)=2ms    
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=21.76ms  min=1.48ms med=20.87ms  max=191.56ms p(90)=31.85ms p(95)=35.67ms p(99.9)=54.91ms
     http_reqs......................: 262112  2180.483371/s
     iteration_duration.............: avg=22.89ms  min=3.17ms med=21.98ms  max=307.84ms p(90)=33.09ms p(95)=36.99ms p(99.9)=57.78ms
     iterations.....................: 262012  2179.651481/s
     success_rate...................: 100.00% ✓ 262012      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 736098      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 295 MB  2.5 MB/s
     http_req_blocked...............: avg=3.64µs   min=1.04µs  med=2.83µs   max=10.35ms  p(90)=4.45µs  p(95)=5.19µs  p(99.9)=41.55µs 
     http_req_connecting............: avg=383ns    min=0s      med=0s       max=4.23ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=24.21ms  min=2.01ms  med=19.94ms  max=369.41ms p(90)=39.48ms p(95)=49.22ms p(99.9)=181.23ms
       { expected_response:true }...: avg=24.21ms  min=2.01ms  med=19.94ms  max=369.41ms p(90)=39.48ms p(95)=49.22ms p(99.9)=181.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245466
     http_req_receiving.............: avg=672.07µs min=52.81µs med=109.36µs max=290.07ms p(90)=1.19ms  p(95)=2.04ms  p(99.9)=32.39ms 
     http_req_sending...............: avg=39.63µs  min=5.14µs  med=10.97µs  max=126.73ms p(90)=19.51µs p(95)=50.7µs  p(99.9)=2.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=23.5ms   min=1.91ms  med=19.33ms  max=368.73ms p(90)=38.25ms p(95)=47.8ms  p(99.9)=179.79ms
     http_reqs......................: 245466  2041.10205/s
     iteration_duration.............: avg=24.44ms  min=3.21ms  med=20.16ms  max=369.64ms p(90)=39.7ms  p(95)=49.46ms p(99.9)=183.17ms
     iterations.....................: 245366  2040.270529/s
     success_rate...................: 100.00% ✓ 245366      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 584973      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=4.09µs  min=1.01µs  med=3.01µs  max=6.91ms   p(90)=5.28µs   p(95)=6.4µs    p(99.9)=48.13µs
     http_req_connecting............: avg=467ns   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.5ms  min=2.33ms  med=29.86ms max=298.91ms p(90)=40.46ms  p(95)=44.03ms  p(99.9)=65.41ms
       { expected_response:true }...: avg=30.5ms  min=2.33ms  med=29.86ms max=298.91ms p(90)=40.46ms  p(95)=44.03ms  p(99.9)=65.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195091
     http_req_receiving.............: avg=105.7µs min=28.12µs med=61.84µs max=84.95ms  p(90)=135.31µs p(95)=236.15µs p(99.9)=4.51ms 
     http_req_sending...............: avg=46.81µs min=5.01µs  med=11.31µs max=188.01ms p(90)=25.86µs  p(95)=126.21µs p(99.9)=3.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.35ms min=2.2ms   med=29.72ms max=297.96ms p(90)=40.29ms  p(95)=43.81ms  p(99.9)=64.26ms
     http_reqs......................: 195091  1621.998098/s
     iteration_duration.............: avg=30.75ms min=5.84ms  med=30.09ms max=323.41ms p(90)=40.7ms   p(95)=44.27ms  p(99.9)=65.92ms
     iterations.....................: 194991  1621.166693/s
     success_rate...................: 100.00% ✓ 194991      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 422010     ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.29µs  min=992ns   med=2.34µs  max=4.1ms    p(90)=3.9µs   p(95)=4.56µs   p(99.9)=32.03µs 
     http_req_connecting............: avg=634ns   min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.4ms  min=2.13ms  med=42.01ms max=287.74ms p(90)=59.1ms  p(95)=64.25ms  p(99.9)=88.55ms 
       { expected_response:true }...: avg=42.4ms  min=2.13ms  med=42.01ms max=287.74ms p(90)=59.1ms  p(95)=64.25ms  p(99.9)=88.55ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 140770
     http_req_receiving.............: avg=79.02µs min=28.66µs med=64.21µs max=194.29ms p(90)=102.6µs p(95)=119.07µs p(99.9)=768.83µs
     http_req_sending...............: avg=23.95µs min=4.74µs  med=10.96µs max=160.42ms p(90)=17.58µs p(95)=21.1µs   p(99.9)=898.94µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.3ms  min=2ms     med=41.91ms max=285.59ms p(90)=59ms    p(95)=64.14ms  p(99.9)=88.27ms 
     http_reqs......................: 140770  1170.33342/s
     iteration_duration.............: avg=42.64ms min=4.34ms  med=42.22ms max=314.3ms  p(90)=59.31ms p(95)=64.45ms  p(99.9)=88.94ms 
     iterations.....................: 140670  1169.50204/s
     success_rate...................: 100.00% ✓ 140670     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 208188     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   693 kB/s
     http_req_blocked...............: avg=4.9µs   min=1.3µs   med=3.27µs  max=4.2ms    p(90)=4.78µs   p(95)=5.43µs   p(99.9)=50.73µs 
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.09ms min=3.8ms   med=84.5ms  max=326.81ms p(90)=105.81ms p(95)=116ms    p(99.9)=201.45ms
       { expected_response:true }...: avg=86.09ms min=3.8ms   med=84.5ms  max=326.81ms p(90)=105.81ms p(95)=116ms    p(99.9)=201.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69496
     http_req_receiving.............: avg=88.53µs min=30.53µs med=76.33µs max=124.66ms p(90)=111.93µs p(95)=124.91µs p(99.9)=714.5µs 
     http_req_sending...............: avg=23.9µs  min=5.74µs  med=15.14µs max=92.13ms  p(90)=21.65µs  p(95)=23.87µs  p(99.9)=623.57µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.98ms min=3.68ms  med=84.39ms max=326.07ms p(90)=105.69ms p(95)=115.87ms p(99.9)=201.07ms
     http_reqs......................: 69496   576.721829/s
     iteration_duration.............: avg=86.47ms min=20.54ms med=84.75ms max=333.29ms p(90)=106.08ms p(95)=116.29ms p(99.9)=204.3ms 
     iterations.....................: 69396   575.891966/s
     success_rate...................: 100.00% ✓ 69396      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 162474     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   540 kB/s
     http_req_blocked...............: avg=5.7µs    min=1.26µs  med=3.63µs   max=3.75ms   p(90)=5.17µs   p(95)=5.77µs   p(99.9)=164.27µs
     http_req_connecting............: avg=1.79µs   min=0s      med=0s       max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.32ms min=5.26ms  med=108.08ms max=326.71ms p(90)=145.32ms p(95)=156.61ms p(99.9)=200.53ms
       { expected_response:true }...: avg=110.32ms min=5.26ms  med=108.08ms max=326.71ms p(90)=145.32ms p(95)=156.61ms p(99.9)=200.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54258
     http_req_receiving.............: avg=88.91µs  min=31.97µs med=84.41µs  max=31.66ms  p(90)=116.44µs p(95)=129.54µs p(99.9)=557.21µs
     http_req_sending...............: avg=24.76µs  min=6.06µs  med=17.76µs  max=83.09ms  p(90)=23.47µs  p(95)=25.52µs  p(99.9)=588.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.21ms min=5.12ms  med=107.97ms max=326.4ms  p(90)=145.2ms  p(95)=156.5ms  p(99.9)=200.38ms
     http_reqs......................: 54258   449.714441/s
     iteration_duration.............: avg=110.81ms min=21.9ms  med=108.42ms max=334.98ms p(90)=145.62ms p(95)=156.93ms p(99.9)=202.78ms
     iterations.....................: 54158   448.885596/s
     success_rate...................: 100.00% ✓ 54158      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98070      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.6µs    min=1.49µs  med=3.59µs   max=3.38ms   p(90)=5.04µs   p(95)=5.64µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=182.78ms min=7.89ms  med=180.85ms max=407.1ms  p(90)=204.8ms  p(95)=209.82ms p(99.9)=280.28ms
       { expected_response:true }...: avg=182.78ms min=7.89ms  med=180.85ms max=407.1ms  p(90)=204.8ms  p(95)=209.82ms p(99.9)=280.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32790
     http_req_receiving.............: avg=97.41µs  min=32.3µs  med=89.01µs  max=115.94ms p(90)=120.62µs p(95)=132.69µs p(99.9)=686.22µs
     http_req_sending...............: avg=33.47µs  min=6.57µs  med=19.04µs  max=166.19ms p(90)=24.07µs  p(95)=26.25µs  p(99.9)=536.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.65ms min=7.75ms  med=180.62ms max=406.61ms p(90)=204.69ms p(95)=209.69ms p(99.9)=279.99ms
     http_reqs......................: 32790   271.021033/s
     iteration_duration.............: avg=183.63ms min=23.49ms med=183.45ms max=417.73ms p(90)=205.11ms p(95)=210.15ms p(99.9)=284.91ms
     iterations.....................: 32690   270.194497/s
     success_rate...................: 100.00% ✓ 32690      ✗ 0    
     vus............................: 1       min=1        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94398      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.14µs   min=1.18µs  med=3.16µs   max=3.83ms   p(90)=4.48µs   p(95)=5µs      p(99.9)=1.31ms  
     http_req_connecting............: avg=2.78µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=189.95ms min=6.31ms  med=174.64ms max=635.78ms p(90)=223.82ms p(95)=275.87ms p(99.9)=582.6ms 
       { expected_response:true }...: avg=189.95ms min=6.31ms  med=174.64ms max=635.78ms p(90)=223.82ms p(95)=275.87ms p(99.9)=582.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31566
     http_req_receiving.............: avg=93.35µs  min=30.89µs med=88.03µs  max=88.53ms  p(90)=117.77µs p(95)=129.63µs p(99.9)=731.23µs
     http_req_sending...............: avg=21.17µs  min=5.25µs  med=16.46µs  max=47.35ms  p(90)=20.74µs  p(95)=22.48µs  p(99.9)=445.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.84ms min=6.22ms  med=174.52ms max=635.67ms p(90)=223.71ms p(95)=275.75ms p(99.9)=582.43ms
     http_reqs......................: 31566   261.068795/s
     iteration_duration.............: avg=190.82ms min=42.97ms med=175.01ms max=636.02ms p(90)=224.23ms p(95)=277.46ms p(99.9)=582.93ms
     iterations.....................: 31466   260.241738/s
     success_rate...................: 100.00% ✓ 31466      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7287      ✗ 0   
     data_received..................: 242 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=39.92µs min=1.4µs    med=3.62µs  max=3.22ms  p(90)=5.19µs  p(95)=6.01µs   p(99.9)=2.97ms  
     http_req_connecting............: avg=35.68µs min=0s       med=0s      max=3.18ms  p(90)=0s      p(95)=0s       p(99.9)=2.94ms  
     http_req_duration..............: avg=2.38s   min=26.04ms  med=2.45s   max=4.26s   p(90)=3.21s   p(95)=3.4s     p(99.9)=4.23s   
       { expected_response:true }...: avg=2.38s   min=26.04ms  med=2.45s   max=4.26s   p(90)=3.21s   p(95)=3.4s     p(99.9)=4.23s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2529
     http_req_receiving.............: avg=93.48µs min=29.35µs  med=90.22µs max=1.23ms  p(90)=128.4µs p(95)=144.27µs p(99.9)=316.97µs
     http_req_sending...............: avg=53.5µs  min=5.3µs    med=18.64µs max=22.54ms p(90)=24.01µs p(95)=27.85µs  p(99.9)=8.44ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.38s   min=25.87ms  med=2.45s   max=4.26s   p(90)=3.21s   p(95)=3.4s     p(99.9)=4.23s   
     http_reqs......................: 2529    20.108457/s
     iteration_duration.............: avg=2.48s   min=598.58ms med=2.48s   max=4.26s   p(90)=3.22s   p(95)=3.42s    p(99.9)=4.23s   
     iterations.....................: 2429    19.313342/s
     success_rate...................: 100.00% ✓ 2429      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

