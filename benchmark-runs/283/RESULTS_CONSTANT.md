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
| hive-router | v0.0.78 | 3,050 | 3,271 | 2,943 | 3.5% |  |
| fusion-nightly | 16.5.0-p.18 | 2,487 | 2,597 | 2,474 | 1.6% |  |
| fusion-nightly-net11 | 16.5.0-p.18 | 2,483 | 2,608 | 2,465 | 2.0% |  |
| fusion | 16.4.0 | 2,370 | 2,451 | 2,359 | 1.4% |  |
| grafbase | 0.53.5 | 2,155 | 2,281 | 2,145 | 2.2% |  |
| cosmo | 0.329.0 | 1,292 | 1,337 | 1,275 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 625 | 648 | 623 | 1.3% |  |
| apollo-router | v2.16.0 | 448 | 468 | 445 | 1.9% |  |
| apollo-gateway | 2.14.2 | 284 | 287 | 280 | 0.7% |  |
| hive-gateway | 2.10.2 | 280 | 289 | 278 | 1.2% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (912 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,580 | 2,731 | 2,549 | 2.5% |  |
| fusion-nightly | 16.5.0-p.18 | 2,433 | 2,538 | 2,423 | 1.6% |  |
| fusion-nightly-net11 | 16.5.0-p.18 | 2,425 | 2,518 | 2,417 | 1.5% |  |
| fusion | 16.4.0 | 2,221 | 2,318 | 2,169 | 2.0% |  |
| fusion-nightly-fed | 16.5.0-p.18 | 2,141 | 2,247 | 2,130 | 1.8% |  |
| grafbase | 0.53.5 | 1,654 | 1,715 | 1,645 | 1.4% |  |
| cosmo | 0.329.0 | 1,236 | 1,274 | 1,231 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.2 | 595 | 617 | 592 | 1.4% |  |
| apollo-router | v2.16.0 | 448 | 467 | 441 | 1.7% |  |
| hive-gateway | 2.10.2 | 264 | 272 | 263 | 1.1% |  |
| apollo-gateway | 2.14.2 | 261 | 266 | 260 | 0.7% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1099536     ✗ 0     
     data_received..................: 32 GB   268 MB/s
     data_sent......................: 441 MB  3.7 MB/s
     http_req_blocked...............: avg=2.49µs  min=882ns  med=1.87µs  max=15.64ms  p(90)=3.02µs  p(95)=3.59µs   p(99.9)=30.46µs
     http_req_connecting............: avg=258ns   min=0s     med=0s      max=3.86ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.16ms min=1.39ms med=15.46ms max=289.88ms p(90)=23.86ms p(95)=26.95ms  p(99.9)=46.23ms
       { expected_response:true }...: avg=16.16ms min=1.39ms med=15.46ms max=289.88ms p(90)=23.86ms p(95)=26.95ms  p(99.9)=46.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 366612
     http_req_receiving.............: avg=82.35µs min=24.1µs med=44.53µs max=108.96ms p(90)=77.5µs  p(95)=128.29µs p(99.9)=6.87ms 
     http_req_sending...............: avg=43.65µs min=4.54µs med=8.11µs  max=101.49ms p(90)=13.65µs p(95)=83.14µs  p(99.9)=5.56ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.03ms min=1.34ms med=15.35ms max=289.59ms p(90)=23.69ms p(95)=26.73ms  p(99.9)=45.37ms
     http_reqs......................: 366612  3050.460159/s
     iteration_duration.............: avg=16.36ms min=1.79ms med=15.64ms max=300.19ms p(90)=24.06ms p(95)=27.17ms  p(99.9)=47.05ms
     iterations.....................: 366512  3049.628092/s
     success_rate...................: 100.00% ✓ 366512      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 897135      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 360 MB  3.0 MB/s
     http_req_blocked...............: avg=3.18µs   min=902ns   med=1.98µs  max=8.45ms   p(90)=3.12µs  p(95)=3.66µs  p(99.9)=27.52µs 
     http_req_connecting............: avg=848ns    min=0s      med=0s      max=8.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.85ms  min=2.05ms  med=16.94ms max=307.82ms p(90)=32.24ms p(95)=39.12ms p(99.9)=136.37ms
       { expected_response:true }...: avg=19.85ms  min=2.05ms  med=16.94ms max=307.82ms p(90)=32.24ms p(95)=39.12ms p(99.9)=136.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299145
     http_req_receiving.............: avg=670.56µs min=51.97µs med=92.44µs max=294.52ms p(90)=1.15ms  p(95)=2.26ms  p(99.9)=29.2ms  
     http_req_sending...............: avg=38.46µs  min=4.62µs  med=8.31µs  max=161.78ms p(90)=13.92µs p(95)=68.6µs  p(99.9)=2.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.14ms  min=1.93ms  med=16.35ms max=303.54ms p(90)=31.03ms p(95)=37.71ms p(99.9)=134.62ms
     http_reqs......................: 299145  2487.484448/s
     iteration_duration.............: avg=20.05ms  min=3.11ms  med=17.13ms max=321.95ms p(90)=32.45ms p(95)=39.35ms p(99.9)=137.55ms
     iterations.....................: 299045  2486.652917/s
     success_rate...................: 100.00% ✓ 299045      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 895719      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=2.54µs  min=881ns   med=1.92µs   max=9.71ms   p(90)=3.07µs  p(95)=3.63µs  p(99.9)=26.23µs
     http_req_connecting............: avg=217ns   min=0s      med=0s       max=3.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.88ms min=1.99ms  med=19.04ms  max=301.39ms p(90)=28.64ms p(95)=32.17ms p(99.9)=53.22ms
       { expected_response:true }...: avg=19.88ms min=1.99ms  med=19.04ms  max=301.39ms p(90)=28.64ms p(95)=32.17ms p(99.9)=53.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298673
     http_req_receiving.............: avg=728.1µs min=49.64µs med=134.42µs max=157.77ms p(90)=1.76ms  p(95)=2.61ms  p(99.9)=18.41ms
     http_req_sending...............: avg=38.45µs min=4.58µs  med=8.16µs   max=98.65ms  p(90)=14.57µs p(95)=68.53µs p(99.9)=2.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.11ms min=1.89ms  med=18.27ms  max=282.61ms p(90)=27.74ms p(95)=31.21ms p(99.9)=51.64ms
     http_reqs......................: 298673  2483.901596/s
     iteration_duration.............: avg=20.08ms min=3.56ms  med=19.23ms  max=310.4ms  p(90)=28.84ms p(95)=32.39ms p(99.9)=53.62ms
     iterations.....................: 298573  2483.069951/s
     success_rate...................: 100.00% ✓ 298573      ✗ 0     
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

     checks.........................: 100.00% ✓ 855111      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.8 MB/s
     http_req_blocked...............: avg=2.57µs   min=862ns   med=1.91µs  max=4.09ms   p(90)=3.21µs  p(95)=3.82µs  p(99.9)=31.04µs 
     http_req_connecting............: avg=314ns    min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.83ms  min=2.17ms  med=17.76ms max=408.13ms p(90)=33.74ms p(95)=41.13ms p(99.9)=143.26ms
       { expected_response:true }...: avg=20.83ms  min=2.17ms  med=17.76ms max=408.13ms p(90)=33.74ms p(95)=41.13ms p(99.9)=143.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285137
     http_req_receiving.............: avg=597.17µs min=49.46µs med=92.57µs max=203ms    p(90)=1.09ms  p(95)=1.9ms   p(99.9)=26.93ms 
     http_req_sending...............: avg=39.17µs  min=4.5µs   med=8.25µs  max=136.63ms p(90)=15.02µs p(95)=64.34µs p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.19ms  min=2.09ms  med=17.23ms max=407.83ms p(90)=32.71ms p(95)=39.98ms p(99.9)=141.5ms 
     http_reqs......................: 285137  2370.808248/s
     iteration_duration.............: avg=21.04ms  min=3.32ms  med=17.96ms max=408.26ms p(90)=33.95ms p(95)=41.35ms p(99.9)=145.35ms
     iterations.....................: 285037  2369.976785/s
     success_rate...................: 100.00% ✓ 285037      ✗ 0     
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

     checks.........................: 100.00% ✓ 777111      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=3.3µs   min=1.13µs med=2.67µs  max=11.81ms  p(90)=4.18µs  p(95)=4.91µs   p(99.9)=37.62µs
     http_req_connecting............: avg=184ns   min=0s     med=0s      max=2.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.93ms min=1.7ms  med=22.67ms max=292.45ms p(90)=27.35ms p(95)=29.32ms  p(99.9)=49.65ms
       { expected_response:true }...: avg=22.93ms min=1.7ms  med=22.67ms max=292.45ms p(90)=27.35ms p(95)=29.32ms  p(99.9)=49.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259137
     http_req_receiving.............: avg=95.53µs min=28µs   med=58.51µs max=128.7ms  p(90)=98.11µs p(95)=129.44µs p(99.9)=6.81ms 
     http_req_sending...............: avg=39.29µs min=5.23µs med=10.95µs max=97.72ms  p(90)=17.76µs p(95)=47.24µs  p(99.9)=2.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.79ms min=1.63ms med=22.57ms max=282.18ms p(90)=27.21ms p(95)=29.13ms  p(99.9)=48.6ms 
     http_reqs......................: 259137  2155.442908/s
     iteration_duration.............: avg=23.15ms min=4.17ms med=22.88ms max=304.94ms p(90)=27.56ms p(95)=29.54ms  p(99.9)=50.23ms
     iterations.....................: 259037  2154.611131/s
     success_rate...................: 100.00% ✓ 259037      ✗ 0     
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

     checks.........................: 100.00% ✓ 466215      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 187 MB  1.6 MB/s
     http_req_blocked...............: avg=3.36µs  min=921ns   med=2.48µs  max=4.13ms   p(90)=3.89µs  p(95)=4.51µs   p(99.9)=34.98µs 
     http_req_connecting............: avg=573ns   min=0s      med=0s      max=4.09ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.37ms min=2.08ms  med=37.93ms max=300.87ms p(90)=53.65ms p(95)=58.43ms  p(99.9)=80.87ms 
       { expected_response:true }...: avg=38.37ms min=2.08ms  med=37.93ms max=300.87ms p(90)=53.65ms p(95)=58.43ms  p(99.9)=80.87ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 155505
     http_req_receiving.............: avg=72.83µs min=26.02µs med=59.46µs max=20.35ms  p(90)=95.23µs p(95)=111.02µs p(99.9)=967.53µs
     http_req_sending...............: avg=26.14µs min=4.89µs  med=10.63µs max=166.46ms p(90)=16.94µs p(95)=21.06µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.27ms min=1.99ms  med=37.84ms max=299.56ms p(90)=53.55ms p(95)=58.32ms  p(99.9)=80.42ms 
     http_reqs......................: 155505  1292.940654/s
     iteration_duration.............: avg=38.6ms  min=3.5ms   med=38.13ms max=310.91ms p(90)=53.84ms p(95)=58.63ms  p(99.9)=81.33ms 
     iterations.....................: 155405  1292.109208/s
     success_rate...................: 100.00% ✓ 155405      ✗ 0     
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

     checks.........................: 100.00% ✓ 225882     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   752 kB/s
     http_req_blocked...............: avg=3.95µs  min=1µs     med=2.37µs  max=3.55ms   p(90)=3.99µs   p(95)=4.63µs   p(99.9)=43.56µs 
     http_req_connecting............: avg=1.23µs  min=0s      med=0s      max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.37ms min=3.57ms  med=85.01ms max=317.22ms p(90)=108.6ms  p(95)=118.41ms p(99.9)=202.24ms
       { expected_response:true }...: avg=79.37ms min=3.57ms  med=85.01ms max=317.22ms p(90)=108.6ms  p(95)=118.41ms p(99.9)=202.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75394
     http_req_receiving.............: avg=74.48µs min=29.14µs med=64.55µs max=60.39ms  p(90)=102µs    p(95)=115.04µs p(99.9)=595.57µs
     http_req_sending...............: avg=21.76µs min=4.99µs  med=11.6µs  max=101.46ms p(90)=19.15µs  p(95)=21.33µs  p(99.9)=574.95µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.27ms min=3.51ms  med=84.92ms max=316.85ms p(90)=108.5ms  p(95)=118.29ms p(99.9)=202.13ms
     http_reqs......................: 75394   625.753533/s
     iteration_duration.............: avg=79.69ms min=16.98ms med=85.25ms max=334.83ms p(90)=108.83ms p(95)=118.66ms p(99.9)=203.38ms
     iterations.....................: 75294   624.923555/s
     success_rate...................: 100.00% ✓ 75294      ✗ 0    
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

     checks.........................: 100.00% ✓ 162087     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=4.52µs   min=1.11µs  med=2.64µs   max=3.36ms   p(90)=4.02µs   p(95)=4.53µs   p(99.9)=78.44µs 
     http_req_connecting............: avg=1.67µs   min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.65ms min=4.68ms  med=110.45ms max=332.37ms p(90)=133.66ms p(95)=140.43ms p(99.9)=170.33ms
       { expected_response:true }...: avg=110.65ms min=4.68ms  med=110.45ms max=332.37ms p(90)=133.66ms p(95)=140.43ms p(99.9)=170.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54129
     http_req_receiving.............: avg=80.44µs  min=30.19µs med=72.46µs  max=88.71ms  p(90)=103.94µs p(95)=116.34µs p(99.9)=521.21µs
     http_req_sending...............: avg=21.08µs  min=4.91µs  med=13.47µs  max=117.99ms p(90)=19.32µs  p(95)=20.94µs  p(99.9)=529.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.55ms min=4.57ms  med=110.36ms max=331.92ms p(90)=133.56ms p(95)=140.32ms p(99.9)=169.64ms
     http_reqs......................: 54129   448.826923/s
     iteration_duration.............: avg=111.09ms min=16.89ms med=110.71ms max=337.7ms  p(90)=133.92ms p(95)=140.68ms p(99.9)=171.97ms
     iterations.....................: 54029   447.997743/s
     success_rate...................: 100.00% ✓ 54029      ✗ 0    
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

     checks.........................: 100.00% ✓ 102828     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   341 kB/s
     http_req_blocked...............: avg=5.24µs   min=1.46µs  med=3.56µs   max=2.43ms   p(90)=4.9µs    p(95)=5.48µs   p(99.9)=531µs   
     http_req_connecting............: avg=1.31µs   min=0s      med=0s       max=2.39ms   p(90)=0s       p(95)=0s       p(99.9)=395.63µs
     http_req_duration..............: avg=174.36ms min=7.29ms  med=167.2ms  max=336.28ms p(90)=207.84ms p(95)=213.09ms p(99.9)=277.13ms
       { expected_response:true }...: avg=174.36ms min=7.29ms  med=167.2ms  max=336.28ms p(90)=207.84ms p(95)=213.09ms p(99.9)=277.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34376
     http_req_receiving.............: avg=89.37µs  min=34.8µs  med=85.63µs  max=34.58ms  p(90)=115.63µs p(95)=126.23µs p(99.9)=511.5µs 
     http_req_sending...............: avg=23.08µs  min=6.21µs  med=17.17µs  max=33.76ms  p(90)=21.65µs  p(95)=23.4µs   p(99.9)=455.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.24ms min=7.21ms  med=167.09ms max=336.1ms  p(90)=207.72ms p(95)=212.98ms p(99.9)=276.64ms
     http_reqs......................: 34376   284.292446/s
     iteration_duration.............: avg=175.13ms min=41.05ms med=167.47ms max=344.26ms p(90)=208.14ms p(95)=213.38ms p(99.9)=278.42ms
     iterations.....................: 34276   283.465437/s
     success_rate...................: 100.00% ✓ 34276      ✗ 0    
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

     checks.........................: 100.00% ✓ 101259     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=7µs      min=1.17µs  med=3.73µs   max=3.68ms   p(90)=5.2µs    p(95)=5.83µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=2.99µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=177.06ms min=5.57ms  med=162.22ms max=651.33ms p(90)=204.16ms p(95)=243.91ms p(99.9)=570.93ms
       { expected_response:true }...: avg=177.06ms min=5.57ms  med=162.22ms max=651.33ms p(90)=204.16ms p(95)=243.91ms p(99.9)=570.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33853
     http_req_receiving.............: avg=98.15µs  min=33.66µs med=89.33µs  max=131.01ms p(90)=119.71µs p(95)=132.44µs p(99.9)=789.33µs
     http_req_sending...............: avg=38.67µs  min=6.56µs  med=18.74µs  max=91.23ms  p(90)=23.65µs  p(95)=25.54µs  p(99.9)=638.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.92ms min=5.43ms  med=162.11ms max=651.22ms p(90)=204.03ms p(95)=243.74ms p(99.9)=570.83ms
     http_reqs......................: 33853   280.139306/s
     iteration_duration.............: avg=177.86ms min=36.01ms med=162.58ms max=651.6ms  p(90)=204.48ms p(95)=245.17ms p(99.9)=571.21ms
     iterations.....................: 33753   279.311789/s
     success_rate...................: 100.00% ✓ 33753      ✗ 0    
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

     checks.........................: 100.00% ✓ 930441      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.96µs  min=911ns   med=2.12µs  max=16.19ms  p(90)=3.68µs  p(95)=4.45µs   p(99.9)=33.8µs 
     http_req_connecting............: avg=277ns   min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.12ms min=1.79ms  med=18.83ms max=284.18ms p(90)=26.31ms p(95)=28.66ms  p(99.9)=47.74ms
       { expected_response:true }...: avg=19.12ms min=1.79ms  med=18.83ms max=284.18ms p(90)=26.31ms p(95)=28.66ms  p(99.9)=47.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310247
     http_req_receiving.............: avg=85.32µs min=25.45µs med=49.63µs max=113.8ms  p(90)=91.33µs p(95)=131.57µs p(99.9)=6.18ms 
     http_req_sending...............: avg=43.14µs min=4.56µs  med=9.26µs  max=199.81ms p(90)=17.33µs p(95)=80.38µs  p(99.9)=3.6ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.99ms min=1.71ms  med=18.72ms max=283.62ms p(90)=26.17ms p(95)=28.46ms  p(99.9)=46.44ms
     http_reqs......................: 310247  2580.506216/s
     iteration_duration.............: avg=19.33ms min=2.98ms  med=19.02ms max=301.01ms p(90)=26.51ms p(95)=28.87ms  p(99.9)=48.17ms
     iterations.....................: 310147  2579.674458/s
     success_rate...................: 100.00% ✓ 310147      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 877350      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=2.8µs    min=912ns  med=2.03µs  max=15.83ms  p(90)=3.51µs  p(95)=4.22µs  p(99.9)=34.54µs 
     http_req_connecting............: avg=288ns    min=0s     med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.29ms  min=1.53ms med=16.88ms max=319.08ms p(90)=33.38ms p(95)=41.3ms  p(99.9)=152.21ms
       { expected_response:true }...: avg=20.29ms  min=1.53ms med=16.88ms max=319.08ms p(90)=33.38ms p(95)=41.3ms  p(99.9)=152.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292550
     http_req_receiving.............: avg=680.11µs min=52.3µs med=93.22µs max=211.63ms p(90)=1.12ms  p(95)=2.15ms  p(99.9)=34.74ms 
     http_req_sending...............: avg=41.81µs  min=4.62µs med=8.72µs  max=171.45ms p(90)=16.72µs p(95)=78.98µs p(99.9)=3.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.57ms  min=1.42ms med=16.3ms  max=318.98ms p(90)=32.16ms p(95)=39.81ms p(99.9)=150.21ms
     http_reqs......................: 292550  2433.825508/s
     iteration_duration.............: avg=20.5ms   min=2.45ms med=17.08ms max=319.28ms p(90)=33.61ms p(95)=41.54ms p(99.9)=153.27ms
     iterations.....................: 292450  2432.993573/s
     success_rate...................: 100.00% ✓ 292450      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 874413      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=2.89µs   min=881ns   med=2.11µs   max=15.96ms  p(90)=3.76µs  p(95)=4.53µs  p(99.9)=29.59µs
     http_req_connecting............: avg=246ns    min=0s      med=0s       max=3.16ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.35ms  min=1.49ms  med=19.5ms   max=302.4ms  p(90)=29.28ms p(95)=32.86ms p(99.9)=54.36ms
       { expected_response:true }...: avg=20.35ms  min=1.49ms  med=19.5ms   max=302.4ms  p(90)=29.28ms p(95)=32.86ms p(99.9)=54.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291571
     http_req_receiving.............: avg=798.66µs min=51.45µs med=126.95µs max=228.31ms p(90)=2.02ms  p(95)=3.03ms  p(99.9)=20.9ms 
     http_req_sending...............: avg=43.36µs  min=4.73µs  med=8.97µs   max=135.81ms p(90)=19.48µs p(95)=85.96µs p(99.9)=3.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.51ms  min=1.42ms  med=18.66ms  max=277.29ms p(90)=28.27ms p(95)=31.8ms  p(99.9)=52.5ms 
     http_reqs......................: 291571  2425.781952/s
     iteration_duration.............: avg=20.57ms  min=2.88ms  med=19.71ms  max=313.55ms p(90)=29.5ms  p(95)=33.09ms p(99.9)=54.9ms 
     iterations.....................: 291471  2424.949982/s
     success_rate...................: 100.00% ✓ 291471      ✗ 0     
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

     checks.........................: 100.00% ✓ 800961      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=3.07µs   min=892ns   med=2.14µs  max=13.62ms  p(90)=3.79µs  p(95)=4.52µs  p(99.9)=36.08µs 
     http_req_connecting............: avg=357ns    min=0s      med=0s      max=3.73ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.24ms  min=1.63ms  med=18.09ms max=419.59ms p(90)=36.75ms p(95)=45.99ms p(99.9)=181.94ms
       { expected_response:true }...: avg=22.24ms  min=1.63ms  med=18.09ms max=419.59ms p(90)=36.75ms p(95)=45.99ms p(99.9)=181.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267087
     http_req_receiving.............: avg=651.27µs min=50.62µs med=99.8µs  max=257.84ms p(90)=1.16ms  p(95)=1.97ms  p(99.9)=32.24ms 
     http_req_sending...............: avg=40.64µs  min=4.74µs  med=8.94µs  max=300.62ms p(90)=18.05µs p(95)=60.36µs p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.55ms  min=1.52ms  med=17.52ms max=419.51ms p(90)=35.65ms p(95)=44.62ms p(99.9)=179.08ms
     http_reqs......................: 267087  2221.769004/s
     iteration_duration.............: avg=22.46ms  min=2.86ms  med=18.29ms max=419.76ms p(90)=36.97ms p(95)=46.23ms p(99.9)=182.79ms
     iterations.....................: 266987  2220.937152/s
     success_rate...................: 100.00% ✓ 266987      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 772143      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.08µs   min=911ns  med=2.14µs   max=15.3ms   p(90)=3.71µs  p(95)=4.44µs  p(99.9)=32.5µs  
     http_req_connecting............: avg=367ns    min=0s     med=0s       max=3.87ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.08ms  min=2.04ms med=19.14ms  max=563.45ms p(90)=37.34ms p(95)=46.74ms p(99.9)=174.78ms
       { expected_response:true }...: avg=23.08ms  min=2.04ms med=19.14ms  max=563.45ms p(90)=37.34ms p(95)=46.74ms p(99.9)=174.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257481
     http_req_receiving.............: avg=670.12µs min=51.5µs med=102.49µs max=180.95ms p(90)=1.16ms  p(95)=2.02ms  p(99.9)=34.25ms 
     http_req_sending...............: avg=36.42µs  min=4.77µs med=9.18µs   max=139.81ms p(90)=17.12µs p(95)=31.65µs p(99.9)=2.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.37ms  min=1.91ms med=18.54ms  max=563.36ms p(90)=36.18ms p(95)=45.27ms p(99.9)=172.44ms
     http_reqs......................: 257481  2141.118269/s
     iteration_duration.............: avg=23.3ms   min=3.31ms med=19.35ms  max=563.66ms p(90)=37.56ms p(95)=46.96ms p(99.9)=175.91ms
     iterations.....................: 257381  2140.286706/s
     success_rate...................: 100.00% ✓ 257381      ✗ 0     
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

     checks.........................: 100.00% ✓ 596820      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 239 MB  2.0 MB/s
     http_req_blocked...............: avg=3.4µs   min=862ns   med=2.19µs  max=13.65ms  p(90)=4.31µs   p(95)=5.38µs   p(99.9)=43.13µs
     http_req_connecting............: avg=503ns   min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.91ms min=2.28ms  med=29.28ms max=283.16ms p(90)=39.39ms  p(95)=42.81ms  p(99.9)=64.17ms
       { expected_response:true }...: avg=29.91ms min=2.28ms  med=29.28ms max=283.16ms p(90)=39.39ms  p(95)=42.81ms  p(99.9)=64.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199040
     http_req_receiving.............: avg=93.32µs min=27.02µs med=55.42µs max=90.64ms  p(90)=123.38µs p(95)=190.36µs p(99.9)=3.64ms 
     http_req_sending...............: avg=38.67µs min=4.78µs  med=9.32µs  max=227.17ms p(90)=23.38µs  p(95)=97.7µs   p(99.9)=2.62ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.78ms min=2.19ms  med=29.16ms max=282.93ms p(90)=39.25ms  p(95)=42.65ms  p(99.9)=63.17ms
     http_reqs......................: 199040  1654.744393/s
     iteration_duration.............: avg=30.15ms min=6.01ms  med=29.49ms max=340.24ms p(90)=39.61ms  p(95)=43.03ms  p(99.9)=64.44ms
     iterations.....................: 198940  1653.91303/s
     success_rate...................: 100.00% ✓ 198940      ✗ 0     
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

     checks.........................: 100.00% ✓ 445818      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.5µs   min=992ns   med=2.61µs  max=3.52ms   p(90)=4.33µs   p(95)=5.03µs   p(99.9)=33.57µs 
     http_req_connecting............: avg=573ns   min=0s      med=0s      max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.12ms min=2.1ms   med=39.73ms max=303.9ms  p(90)=55.9ms   p(95)=60.94ms  p(99.9)=84.28ms 
       { expected_response:true }...: avg=40.12ms min=2.1ms   med=39.73ms max=303.9ms  p(90)=55.9ms   p(95)=60.94ms  p(99.9)=84.28ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148706
     http_req_receiving.............: avg=77.27µs min=26.81µs med=64.35µs max=76.64ms  p(90)=102.56µs p(95)=117.87µs p(99.9)=876.65µs
     http_req_sending...............: avg=22.76µs min=4.87µs  med=11.46µs max=100.88ms p(90)=18.84µs  p(95)=22.54µs  p(99.9)=912.72µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.02ms min=2ms     med=39.63ms max=300.44ms p(90)=55.8ms   p(95)=60.83ms  p(99.9)=83.71ms 
     http_reqs......................: 148706  1236.352646/s
     iteration_duration.............: avg=40.36ms min=3.95ms  med=39.94ms max=315.54ms p(90)=56.11ms  p(95)=61.14ms  p(99.9)=85.3ms  
     iterations.....................: 148606  1235.521239/s
     success_rate...................: 100.00% ✓ 148606      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 215055     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   715 kB/s
     http_req_blocked...............: avg=4.86µs  min=1.05µs  med=3.26µs  max=4.01ms   p(90)=4.87µs   p(95)=5.57µs   p(99.9)=48.17µs 
     http_req_connecting............: avg=1.35µs  min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.33ms min=4.04ms  med=81.57ms max=318.52ms p(90)=101.07ms p(95)=110.72ms p(99.9)=192.45ms
       { expected_response:true }...: avg=83.33ms min=4.04ms  med=81.57ms max=318.52ms p(90)=101.07ms p(95)=110.72ms p(99.9)=192.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71785
     http_req_receiving.............: avg=82.21µs min=27.85µs med=75.74µs max=5.32ms   p(90)=111.99µs p(95)=125.38µs p(99.9)=632.83µs
     http_req_sending...............: avg=21.7µs  min=5.32µs  med=15.4µs  max=97.48ms  p(90)=22.19µs  p(95)=24.57µs  p(99.9)=626.66µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.22ms min=3.96ms  med=81.47ms max=318.33ms p(90)=100.96ms p(95)=110.59ms p(99.9)=192.36ms
     http_reqs......................: 71785   595.438667/s
     iteration_duration.............: avg=83.71ms min=15.6ms  med=81.83ms max=333.51ms p(90)=101.34ms p(95)=111.04ms p(99.9)=194.42ms
     iterations.....................: 71685   594.609192/s
     success_rate...................: 100.00% ✓ 71685      ✗ 0    
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

     checks.........................: 100.00% ✓ 162198     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=5.7µs    min=1.39µs  med=3.86µs   max=3.67ms   p(90)=5.39µs   p(95)=6.01µs   p(99.9)=72.08µs 
     http_req_connecting............: avg=1.58µs   min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.51ms min=5.28ms  med=108.33ms max=312.91ms p(90)=145.84ms p(95)=156.86ms p(99.9)=203.78ms
       { expected_response:true }...: avg=110.51ms min=5.28ms  med=108.33ms max=312.91ms p(90)=145.84ms p(95)=156.86ms p(99.9)=203.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54166
     http_req_receiving.............: avg=92.68µs  min=27.27µs med=86.86µs  max=64.86ms  p(90)=118.68µs p(95)=131.43µs p(99.9)=620.72µs
     http_req_sending...............: avg=28.13µs  min=6.36µs  med=18.83µs  max=131.44ms p(90)=24.16µs  p(95)=26.2µs   p(99.9)=731.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.39ms min=5.18ms  med=108.22ms max=312.12ms p(90)=145.7ms  p(95)=156.74ms p(99.9)=202.99ms
     http_reqs......................: 54166   448.928761/s
     iteration_duration.............: avg=111ms    min=23.11ms med=108.67ms max=330.24ms p(90)=146.14ms p(95)=157.17ms p(99.9)=205.39ms
     iterations.....................: 54066   448.099959/s
     success_rate...................: 100.00% ✓ 54066      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 95637      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   318 kB/s
     http_req_blocked...............: avg=6.92µs   min=1.57µs  med=3.89µs   max=3.89ms   p(90)=5.39µs   p(95)=6.03µs   p(99.9)=1.09ms  
     http_req_connecting............: avg=2.75µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=187.47ms min=6.21ms  med=172.77ms max=684.49ms p(90)=218.75ms p(95)=272.27ms p(99.9)=549ms   
       { expected_response:true }...: avg=187.47ms min=6.21ms  med=172.77ms max=684.49ms p(90)=218.75ms p(95)=272.27ms p(99.9)=549ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31979
     http_req_receiving.............: avg=100.08µs min=36.33µs med=91.01µs  max=108.51ms p(90)=122.7µs  p(95)=135.57µs p(99.9)=697.82µs
     http_req_sending...............: avg=32.97µs  min=7.28µs  med=19.41µs  max=87.58ms  p(90)=24.24µs  p(95)=26.27µs  p(99.9)=646.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.33ms min=6.06ms  med=172.65ms max=684.38ms p(90)=218.64ms p(95)=271.86ms p(99.9)=548.89ms
     http_reqs......................: 31979   264.461955/s
     iteration_duration.............: avg=188.34ms min=20.62ms med=173.17ms max=684.78ms p(90)=219.24ms p(95)=274.65ms p(99.9)=549.5ms 
     iterations.....................: 31879   263.634968/s
     success_rate...................: 100.00% ✓ 31879      ✗ 0    
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

     checks.........................: 100.00% ✓ 94647      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.98µs   min=1.49µs  med=3.58µs   max=4.16ms   p(90)=4.93µs   p(95)=5.51µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=189.41ms min=8.11ms  med=189.04ms max=363.84ms p(90)=211.62ms p(95)=216.61ms p(99.9)=282.94ms
       { expected_response:true }...: avg=189.41ms min=8.11ms  med=189.04ms max=363.84ms p(90)=211.62ms p(95)=216.61ms p(99.9)=282.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31649
     http_req_receiving.............: avg=91.61µs  min=34.56µs med=87.98µs  max=11.29ms  p(90)=118.1µs  p(95)=128.85µs p(99.9)=489.25µs
     http_req_sending...............: avg=23.17µs  min=5.98µs  med=17.51µs  max=34.85ms  p(90)=22.12µs  p(95)=23.94µs  p(99.9)=517.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.29ms min=7.97ms  med=188.94ms max=363.56ms p(90)=211.51ms p(95)=216.49ms p(99.9)=282.85ms
     http_reqs......................: 31649   261.515342/s
     iteration_duration.............: avg=190.27ms min=71.76ms med=189.88ms max=371.71ms p(90)=211.91ms p(95)=216.89ms p(99.9)=284.05ms
     iterations.....................: 31549   260.689043/s
     success_rate...................: 100.00% ✓ 31549      ✗ 0    
     vus............................: 12      min=12       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 6438      ✗ 0   
     data_received..................: 215 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=50.42µs min=1.49µs  med=3.56µs  max=4.69ms   p(90)=5.07µs  p(95)=5.88µs   p(99.9)=4.38ms 
     http_req_connecting............: avg=42.87µs min=0s      med=0s      max=4.48ms   p(90)=0s      p(95)=0s       p(99.9)=4.14ms 
     http_req_duration..............: avg=2.69s   min=32.88ms med=2.77s   max=4.88s    p(90)=3.47s   p(95)=3.65s    p(99.9)=4.52s  
       { expected_response:true }...: avg=2.69s   min=32.88ms med=2.77s   max=4.88s    p(90)=3.47s   p(95)=3.65s    p(99.9)=4.52s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2246
     http_req_receiving.............: avg=95.84µs min=34.54µs med=91.07µs max=696.34µs p(90)=134.9µs p(95)=157.89µs p(99.9)=317.5µs
     http_req_sending...............: avg=66.35µs min=6.96µs  med=18.35µs max=21.62ms  p(90)=23.82µs p(95)=27.67µs  p(99.9)=14.43ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.69s   min=32.71ms med=2.77s   max=4.88s    p(90)=3.47s   p(95)=3.65s    p(99.9)=4.52s  
     http_reqs......................: 2246    17.725803/s
     iteration_duration.............: avg=2.82s   min=1.01s   med=2.8s    max=4.88s    p(90)=3.48s   p(95)=3.66s    p(99.9)=4.53s  
     iterations.....................: 2146    16.936586/s
     success_rate...................: 100.00% ✓ 2146      ✗ 0   
     vus............................: 33      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

