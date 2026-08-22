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
| hive-router | v0.0.84 | 2,918 | 3,199 | 2,815 | 4.5% |  |
| fusion-nightly-net11 | 16.6.2-p.5 | 2,777 | 2,906 | 2,768 | 1.8% |  |
| fusion | 16.6.1 | 2,658 | 2,770 | 2,627 | 1.8% |  |
| fusion-nightly | 16.6.2-p.5 | 2,617 | 2,707 | 2,577 | 1.5% |  |
| fusion-nightly-fed | 16.6.2-p.5 | 2,373 | 2,469 | 2,353 | 1.6% |  |
| grafbase | 0.53.5 | 2,163 | 2,264 | 2,140 | 2.1% |  |
| cosmo | 0.334.0 | 1,312 | 1,358 | 1,306 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 625 | 641 | 623 | 0.9% |  |
| apollo-router | v2.16.1 | 487 | 505 | 483 | 1.4% |  |
| apollo-gateway | 2.14.3 | 285 | 288 | 284 | 0.4% |  |
| hive-gateway | 2.10.8 | 275 | 282 | 272 | 1.1% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% | non-compatible response (308 across 3/4 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.5 | 2,544 | 2,655 | 2,526 | 1.7% |  |
| hive-router | v0.0.84 | 2,484 | 2,655 | 2,423 | 2.9% |  |
| fusion | 16.6.1 | 2,475 | 2,582 | 2,455 | 1.7% |  |
| fusion-nightly | 16.6.2-p.5 | 2,460 | 2,561 | 2,388 | 2.3% |  |
| fusion-nightly-fed | 16.6.2-p.5 | 2,214 | 2,327 | 2,195 | 2.1% |  |
| grafbase | 0.53.5 | 1,638 | 1,690 | 1,628 | 1.3% |  |
| cosmo | 0.334.0 | 1,174 | 1,223 | 1,169 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 591 | 611 | 585 | 1.4% |  |
| apollo-router | v2.16.1 | 408 | 429 | 404 | 2.3% |  |
| apollo-gateway | 2.14.3 | 269 | 273 | 268 | 0.6% |  |
| hive-gateway | 2.10.8 | 266 | 275 | 264 | 1.4% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 20 | 2.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1052121     ✗ 0     
     data_received..................: 31 GB   256 MB/s
     data_sent......................: 422 MB  3.5 MB/s
     http_req_blocked...............: avg=2.87µs  min=852ns   med=2.1µs   max=17.84ms  p(90)=3.44µs  p(95)=4.04µs   p(99.9)=31.07µs
     http_req_connecting............: avg=267ns   min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.89ms min=1.5ms   med=16.35ms max=309.91ms p(90)=24.64ms p(95)=27.67ms  p(99.9)=47.12ms
       { expected_response:true }...: avg=16.89ms min=1.5ms   med=16.35ms max=309.91ms p(90)=24.64ms p(95)=27.67ms  p(99.9)=47.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 350807
     http_req_receiving.............: avg=85.87µs min=24.73µs med=47.52µs max=82.33ms  p(90)=83.35µs p(95)=141.91µs p(99.9)=6.72ms 
     http_req_sending...............: avg=44.5µs  min=4.56µs  med=8.51µs  max=266.19ms p(90)=14.52µs p(95)=90.24µs  p(99.9)=4.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.76ms min=1.45ms  med=16.24ms max=300.02ms p(90)=24.48ms p(95)=27.45ms  p(99.9)=45.85ms
     http_reqs......................: 350807  2918.690592/s
     iteration_duration.............: avg=17.09ms min=1.98ms  med=16.54ms max=328.73ms p(90)=24.84ms p(95)=27.89ms  p(99.9)=47.93ms
     iterations.....................: 350707  2917.858599/s
     success_rate...................: 100.00% ✓ 350707      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1001739     ✗ 0     
     data_received..................: 29 GB   244 MB/s
     data_sent......................: 401 MB  3.3 MB/s
     http_req_blocked...............: avg=2.55µs   min=822ns   med=1.84µs  max=7.09ms   p(90)=3.01µs  p(95)=3.58µs  p(99.9)=29.48µs
     http_req_connecting............: avg=295ns    min=0s      med=0s      max=3.71ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.75ms  min=1.93ms  med=16.9ms  max=285.76ms p(90)=25.64ms p(95)=29.09ms p(99.9)=50.1ms 
       { expected_response:true }...: avg=17.75ms  min=1.93ms  med=16.9ms  max=285.76ms p(90)=25.64ms p(95)=29.09ms p(99.9)=50.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 334013
     http_req_receiving.............: avg=457.96µs min=49.87µs med=87.92µs max=130.73ms p(90)=1.12ms  p(95)=1.74ms  p(99.9)=17.95ms
     http_req_sending...............: avg=43.32µs  min=4.36µs  med=7.99µs  max=154.42ms p(90)=14.53µs p(95)=85.72µs p(99.9)=4.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.25ms  min=1.8ms   med=16.41ms max=285.38ms p(90)=25.03ms p(95)=28.41ms p(99.9)=48.29ms
     http_reqs......................: 334013  2777.675438/s
     iteration_duration.............: avg=17.96ms  min=3.05ms  med=17.09ms max=297.37ms p(90)=25.84ms p(95)=29.31ms p(99.9)=50.57ms
     iterations.....................: 333913  2776.843831/s
     success_rate...................: 100.00% ✓ 333913      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 958800      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 384 MB  3.2 MB/s
     http_req_blocked...............: avg=2.65µs   min=882ns   med=1.92µs  max=16.09ms  p(90)=3.16µs  p(95)=3.76µs  p(99.9)=28.27µs 
     http_req_connecting............: avg=263ns    min=0s      med=0s      max=3.29ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.56ms  min=2.05ms  med=16.06ms max=286.52ms p(90)=30.08ms p(95)=36.36ms p(99.9)=112.31ms
       { expected_response:true }...: avg=18.56ms  min=2.05ms  med=16.06ms max=286.52ms p(90)=30.08ms p(95)=36.36ms p(99.9)=112.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 319700
     http_req_receiving.............: avg=540.57µs min=50.72µs med=87.93µs max=221.24ms p(90)=1.05ms  p(95)=1.9ms   p(99.9)=23.86ms 
     http_req_sending...............: avg=43.61µs  min=4.7µs   med=8.27µs  max=178.79ms p(90)=14.74µs p(95)=80.53µs p(99.9)=4.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=17.97ms  min=1.91ms  med=15.54ms max=285.3ms  p(90)=29.2ms  p(95)=35.3ms  p(99.9)=110.61ms
     http_reqs......................: 319700  2658.497068/s
     iteration_duration.............: avg=18.76ms  min=2.95ms  med=16.25ms max=294.58ms p(90)=30.3ms  p(95)=36.6ms  p(99.9)=113.19ms
     iterations.....................: 319600  2657.665508/s
     success_rate...................: 100.00% ✓ 319600      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 944244      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 378 MB  3.1 MB/s
     http_req_blocked...............: avg=2.53µs   min=841ns   med=1.9µs   max=13.38ms  p(90)=2.97µs  p(95)=3.49µs  p(99.9)=25.7µs  
     http_req_connecting............: avg=277ns    min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.85ms  min=2.01ms  med=16.13ms max=328.7ms  p(90)=30.5ms  p(95)=37.26ms p(99.9)=128.16ms
       { expected_response:true }...: avg=18.85ms  min=2.01ms  med=16.13ms max=328.7ms  p(90)=30.5ms  p(95)=37.26ms p(99.9)=128.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 314848
     http_req_receiving.............: avg=564.07µs min=50.17µs med=90.89µs max=246.85ms p(90)=1.06ms  p(95)=1.86ms  p(99.9)=25.31ms 
     http_req_sending...............: avg=41.37µs  min=4.5µs   med=8.09µs  max=171.18ms p(90)=13.67µs p(95)=77.86µs p(99.9)=2.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.24ms  min=1.89ms  med=15.61ms max=327.86ms p(90)=29.57ms p(95)=36.17ms p(99.9)=126.31ms
     http_reqs......................: 314848  2617.949023/s
     iteration_duration.............: avg=19.05ms  min=3.08ms  med=16.31ms max=328.85ms p(90)=30.71ms p(95)=37.48ms p(99.9)=128.91ms
     iterations.....................: 314748  2617.117526/s
     success_rate...................: 100.00% ✓ 314748      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 855600      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=3.17µs  min=1.03µs med=2.43µs  max=14.86ms  p(90)=3.77µs  p(95)=4.37µs  p(99.9)=35.19µs 
     http_req_connecting............: avg=298ns   min=0s     med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.81ms min=1.66ms med=16.94ms max=483.54ms p(90)=35.01ms p(95)=44.15ms p(99.9)=164.31ms
       { expected_response:true }...: avg=20.81ms min=1.66ms med=16.94ms max=483.54ms p(90)=35.01ms p(95)=44.15ms p(99.9)=164.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285300
     http_req_receiving.............: avg=594.5µs min=49.7µs med=94.51µs max=246.96ms p(90)=1.07ms  p(95)=1.91ms  p(99.9)=29.65ms 
     http_req_sending...............: avg=38.44µs min=4.67µs med=8.99µs  max=111.21ms p(90)=15.16µs p(95)=62.81µs p(99.9)=2.86ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.18ms min=1.58ms med=16.41ms max=483.41ms p(90)=33.97ms p(95)=42.94ms p(99.9)=162.11ms
     http_reqs......................: 285300  2373.22679/s
     iteration_duration.............: avg=21.02ms min=2.74ms med=17.14ms max=483.75ms p(90)=35.23ms p(95)=44.4ms  p(99.9)=165.21ms
     iterations.....................: 285200  2372.394954/s
     success_rate...................: 100.00% ✓ 285200      ✗ 0     
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

     checks.........................: 100.00% ✓ 780150      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.08µs  min=922ns   med=2.17µs  max=16.98ms  p(90)=3.67µs  p(95)=4.4µs    p(99.9)=32.28µs
     http_req_connecting............: avg=368ns   min=0s      med=0s      max=4.18ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.85ms min=1.74ms  med=22.62ms max=304.37ms p(90)=27.13ms p(95)=28.86ms  p(99.9)=47.31ms
       { expected_response:true }...: avg=22.85ms min=1.74ms  med=22.62ms max=304.37ms p(90)=27.13ms p(95)=28.86ms  p(99.9)=47.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260150
     http_req_receiving.............: avg=96.76µs min=26.59µs med=53.78µs max=184.5ms  p(90)=89.87µs p(95)=115.15µs p(99.9)=5.7ms  
     http_req_sending...............: avg=33.44µs min=4.83µs  med=9.17µs  max=95.46ms  p(90)=15.56µs p(95)=24.7µs   p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.72ms min=1.67ms  med=22.52ms max=241.63ms p(90)=27.01ms p(95)=28.69ms  p(99.9)=46.05ms
     http_reqs......................: 260150  2163.806773/s
     iteration_duration.............: avg=23.06ms min=4.19ms  med=22.81ms max=321.46ms p(90)=27.33ms p(95)=29.07ms  p(99.9)=47.82ms
     iterations.....................: 260050  2162.975019/s
     success_rate...................: 100.00% ✓ 260050      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 473454      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=2.93µs  min=962ns   med=2.01µs  max=4.05ms   p(90)=3.41µs  p(95)=4.05µs   p(99.9)=29.99µs 
     http_req_connecting............: avg=574ns   min=0s      med=0s      max=4.01ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.78ms min=2.03ms  med=37.42ms max=285.39ms p(90)=52.78ms p(95)=57.4ms   p(99.9)=80.04ms 
       { expected_response:true }...: avg=37.78ms min=2.03ms  med=37.42ms max=285.39ms p(90)=52.78ms p(95)=57.4ms   p(99.9)=80.04ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 157918
     http_req_receiving.............: avg=68.89µs min=26.65µs med=56.97µs max=21.05ms  p(90)=91.41µs p(95)=106.47µs p(99.9)=875.89µs
     http_req_sending...............: avg=22.29µs min=4.62µs  med=9.68µs  max=105.46ms p(90)=16.41µs p(95)=20.31µs  p(99.9)=971.77µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.69ms min=1.94ms  med=37.33ms max=284.97ms p(90)=52.68ms p(95)=57.31ms  p(99.9)=79.83ms 
     http_reqs......................: 157918  1312.988214/s
     iteration_duration.............: avg=38.01ms min=3.63ms  med=37.62ms max=300.54ms p(90)=52.98ms p(95)=57.59ms  p(99.9)=80.49ms 
     iterations.....................: 157818  1312.156777/s
     success_rate...................: 100.00% ✓ 157818      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 225672     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   751 kB/s
     http_req_blocked...............: avg=5.81µs  min=1.13µs  med=3.14µs  max=8.46ms   p(90)=4.67µs   p(95)=5.33µs   p(99.9)=49.22µs 
     http_req_connecting............: avg=2.18µs  min=0s      med=0s      max=8.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.41ms min=3.46ms  med=77.62ms max=306.22ms p(90)=97.79ms  p(95)=107.13ms p(99.9)=182.86ms
       { expected_response:true }...: avg=79.41ms min=3.46ms  med=77.62ms max=306.22ms p(90)=97.79ms  p(95)=107.13ms p(99.9)=182.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75324
     http_req_receiving.............: avg=83.13µs min=27.75µs med=69.01µs max=187.17ms p(90)=106.64µs p(95)=119.93µs p(99.9)=607.8µs 
     http_req_sending...............: avg=27.62µs min=5.32µs  med=13.75µs max=187.79ms p(90)=20.64µs  p(95)=22.9µs   p(99.9)=775.44µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.3ms  min=3.4ms   med=77.52ms max=305.58ms p(90)=97.67ms  p(95)=106.98ms p(99.9)=182.26ms
     http_reqs......................: 75324   625.313583/s
     iteration_duration.............: avg=79.76ms min=16.37ms med=77.87ms max=321.72ms p(90)=98.06ms  p(95)=107.41ms p(99.9)=184.39ms
     iterations.....................: 75224   624.483418/s
     success_rate...................: 100.00% ✓ 75224      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 175881     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   585 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.42µs  med=3.41µs   max=3.55ms   p(90)=4.82µs   p(95)=5.43µs   p(99.9)=56.55µs 
     http_req_connecting............: avg=1.68µs   min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.91ms min=4.66ms  med=101.79ms max=327.06ms p(90)=122.63ms p(95)=128.83ms p(99.9)=160.79ms
       { expected_response:true }...: avg=101.91ms min=4.66ms  med=101.79ms max=327.06ms p(90)=122.63ms p(95)=128.83ms p(99.9)=160.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58727
     http_req_receiving.............: avg=92.38µs  min=33.23µs med=81.25µs  max=133.27ms p(90)=114.2µs  p(95)=127.05µs p(99.9)=572.83µs
     http_req_sending...............: avg=30.3µs   min=6.45µs  med=17µs     max=173.64ms p(90)=22.54µs  p(95)=24.52µs  p(99.9)=588.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.79ms min=4.58ms  med=101.68ms max=326.55ms p(90)=122.51ms p(95)=128.7ms  p(99.9)=159.57ms
     http_reqs......................: 58727   487.009011/s
     iteration_duration.............: avg=102.36ms min=22.41ms med=102.09ms max=364.71ms p(90)=122.9ms  p(95)=129.11ms p(99.9)=163.25ms
     iterations.....................: 58627   486.179735/s
     success_rate...................: 100.00% ✓ 58627      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103293     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   343 kB/s
     http_req_blocked...............: avg=6.76µs   min=1.28µs  med=3.47µs   max=4.13ms   p(90)=4.84µs   p(95)=5.41µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=173.56ms min=7.46ms  med=174.03ms max=395.56ms p(90)=182.36ms p(95)=186.48ms p(99.9)=255.09ms
       { expected_response:true }...: avg=173.56ms min=7.46ms  med=174.03ms max=395.56ms p(90)=182.36ms p(95)=186.48ms p(99.9)=255.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34531
     http_req_receiving.............: avg=90.62µs  min=32.84µs med=85.02µs  max=98.86ms  p(90)=114.66µs p(95)=125.49µs p(99.9)=439.06µs
     http_req_sending...............: avg=32.11µs  min=5.56µs  med=17.56µs  max=166.73ms p(90)=22.29µs  p(95)=24µs     p(99.9)=532.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.44ms min=7.32ms  med=173.91ms max=395.37ms p(90)=182.24ms p(95)=186.35ms p(99.9)=253.85ms
     http_reqs......................: 34531   285.557848/s
     iteration_duration.............: avg=174.36ms min=48.55ms med=174.35ms max=406.54ms p(90)=182.64ms p(95)=186.77ms p(99.9)=261.8ms 
     iterations.....................: 34431   284.730887/s
     success_rate...................: 100.00% ✓ 34431      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99414      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   330 kB/s
     http_req_blocked...............: avg=5.9µs    min=1.11µs  med=2.99µs   max=3.48ms   p(90)=4.28µs   p(95)=4.81µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=180.36ms min=5.67ms  med=164.49ms max=654.27ms p(90)=211.76ms p(95)=255.86ms p(99.9)=555.32ms
       { expected_response:true }...: avg=180.36ms min=5.67ms  med=164.49ms max=654.27ms p(90)=211.76ms p(95)=255.86ms p(99.9)=555.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33238
     http_req_receiving.............: avg=90.05µs  min=31.93µs med=84.1µs   max=72.39ms  p(90)=113.79µs p(95)=125.89µs p(99.9)=527.23µs
     http_req_sending...............: avg=27.77µs  min=5.01µs  med=16.29µs  max=67.66ms  p(90)=20.9µs   p(95)=22.52µs  p(99.9)=543.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.24ms min=5.53ms  med=164.38ms max=654.15ms p(90)=211.65ms p(95)=255.75ms p(99.9)=555.21ms
     http_reqs......................: 33238   275.111072/s
     iteration_duration.............: avg=181.15ms min=28.84ms med=164.82ms max=654.54ms p(90)=212.2ms  p(95)=257.22ms p(99.9)=555.69ms
     iterations.....................: 33138   274.283372/s
     success_rate...................: 100.00% ✓ 33138      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
data_received..................: 3.4 MB 56 kB/s
     data_sent......................: 43 kB  719 B/s
     http_req_blocked...............: avg=8.55µs   min=2.6µs   med=3.11µs   max=173.91µs p(90)=4.83µs  p(95)=8.47µs   p(99.9)=168.38µs
     http_req_connecting............: avg=2.79µs   min=0s      med=0s       max=97.73µs  p(90)=0s      p(95)=0s       p(99.9)=94.4µs  
     http_req_duration..............: avg=895.53ms min=30.86ms med=39.14ms  max=30.02s   p(90)=44.09ms p(95)=45.75ms  p(99.9)=29.01s  
       { expected_response:true }...: avg=895.53ms min=30.86ms med=39.14ms  max=30.02s   p(90)=44.09ms p(95)=45.75ms  p(99.9)=29.01s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 35  
     http_req_receiving.............: avg=144.31µs min=77.24µs med=131.38µs max=380.08µs p(90)=173.1µs p(95)=236.32µs p(99.9)=378.74µs
     http_req_sending...............: avg=24.27µs  min=14.98µs med=18.81µs  max=136.65µs p(90)=24.5µs  p(95)=49.79µs  p(99.9)=134.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=895.36ms min=30.65ms med=38.95ms  max=30.02s   p(90)=43.93ms p(95)=45.45ms  p(99.9)=29.01s  
     http_reqs......................: 35     0.583325/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 917112      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=2.81µs  min=831ns   med=1.99µs   max=14.15ms  p(90)=3.65µs  p(95)=4.42µs  p(99.9)=32.18µs
     http_req_connecting............: avg=320ns   min=0s      med=0s       max=3.51ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.4ms  min=1.51ms  med=18.61ms  max=306.42ms p(90)=27.97ms p(95)=31.43ms p(99.9)=51.13ms
       { expected_response:true }...: avg=19.4ms  min=1.51ms  med=18.61ms  max=306.42ms p(90)=27.97ms p(95)=31.43ms p(99.9)=51.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305804
     http_req_receiving.............: avg=541.5µs min=51.69µs med=100.68µs max=74.56ms  p(90)=1.35ms  p(95)=2.12ms  p(99.9)=18.21ms
     http_req_sending...............: avg=41.84µs min=4.07µs  med=8.39µs   max=155.53ms p(90)=17.45µs p(95)=82.2µs  p(99.9)=3.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.81ms min=1.41ms  med=18.03ms  max=305.97ms p(90)=27.26ms p(95)=30.69ms p(99.9)=49.7ms 
     http_reqs......................: 305804  2544.248858/s
     iteration_duration.............: avg=19.61ms min=2.8ms   med=18.81ms  max=317.6ms  p(90)=28.17ms p(95)=31.65ms p(99.9)=51.69ms
     iterations.....................: 305704  2543.416871/s
     success_rate...................: 100.00% ✓ 305704      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 895785      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=3.45µs  min=932ns   med=2.1µs   max=17ms     p(90)=3.53µs  p(95)=4.23µs   p(99.9)=35.39µs
     http_req_connecting............: avg=709ns   min=0s      med=0s      max=8.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.87ms min=1.71ms  med=19.49ms max=248.78ms p(90)=27.97ms p(95)=30.51ms  p(99.9)=48.67ms
       { expected_response:true }...: avg=19.87ms min=1.71ms  med=19.49ms max=248.78ms p(90)=27.97ms p(95)=30.51ms  p(99.9)=48.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298695
     http_req_receiving.............: avg=83.46µs min=24.53µs med=48.12µs max=39.35ms  p(90)=85.84µs p(95)=118.74µs p(99.9)=6.35ms 
     http_req_sending...............: avg=39.4µs  min=4.79µs  med=9.19µs  max=27.87ms  p(90)=15.92µs p(95)=51.79µs  p(99.9)=2.93ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.75ms min=1.65ms  med=19.38ms max=247.95ms p(90)=27.83ms p(95)=30.34ms  p(99.9)=47.53ms
     http_reqs......................: 298695  2484.239985/s
     iteration_duration.............: avg=20.08ms min=2.88ms  med=19.69ms max=341.08ms p(90)=28.17ms p(95)=30.72ms  p(99.9)=49.33ms
     iterations.....................: 298595  2483.408287/s
     success_rate...................: 100.00% ✓ 298595      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 892536      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=3.57µs   min=1.03µs  med=2.58µs  max=20.75ms  p(90)=4.13µs  p(95)=4.85µs  p(99.9)=36.06µs 
     http_req_connecting............: avg=316ns    min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.93ms  min=1.64ms  med=16.82ms max=291.16ms p(90)=32.77ms p(95)=39.95ms p(99.9)=134.26ms
       { expected_response:true }...: avg=19.93ms  min=1.64ms  med=16.82ms max=291.16ms p(90)=32.77ms p(95)=39.95ms p(99.9)=134.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297612
     http_req_receiving.............: avg=560.08µs min=51.62µs med=97.36µs max=152.39ms p(90)=1.06ms  p(95)=1.92ms  p(99.9)=26.34ms 
     http_req_sending...............: avg=46.59µs  min=4.88µs  med=9.81µs  max=101.98ms p(90)=18.41µs p(95)=99.22µs p(99.9)=4.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.32ms  min=1.51ms  med=16.3ms  max=291.01ms p(90)=31.81ms p(95)=38.88ms p(99.9)=132.69ms
     http_reqs......................: 297612  2475.757548/s
     iteration_duration.............: avg=20.15ms  min=2.42ms  med=17.03ms max=300.13ms p(90)=33ms    p(95)=40.2ms  p(99.9)=135.71ms
     iterations.....................: 297512  2474.925674/s
     success_rate...................: 100.00% ✓ 297512      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 886980      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=2.97µs   min=902ns   med=2.05µs  max=17.53ms  p(90)=3.67µs  p(95)=4.45µs  p(99.9)=33.79µs 
     http_req_connecting............: avg=313ns    min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.07ms  min=1.62ms  med=16.9ms  max=476.92ms p(90)=32.73ms p(95)=40.06ms p(99.9)=142.99ms
       { expected_response:true }...: avg=20.07ms  min=1.62ms  med=16.9ms  max=476.92ms p(90)=32.73ms p(95)=40.06ms p(99.9)=142.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295760
     http_req_receiving.............: avg=557.81µs min=50.49µs med=92.92µs max=175.46ms p(90)=1.07ms  p(95)=1.85ms  p(99.9)=26.37ms 
     http_req_sending...............: avg=40.5µs   min=4.39µs  med=8.64µs  max=141.47ms p(90)=17.15µs p(95)=78.49µs p(99.9)=2.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.47ms  min=1.5ms   med=16.4ms  max=476.81ms p(90)=31.77ms p(95)=38.96ms p(99.9)=139.4ms 
     http_reqs......................: 295760  2460.258054/s
     iteration_duration.............: avg=20.28ms  min=2.65ms  med=17.1ms  max=477.07ms p(90)=32.95ms p(95)=40.28ms p(99.9)=143.76ms
     iterations.....................: 295660  2459.426211/s
     success_rate...................: 100.00% ✓ 295660      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 798438      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 320 MB  2.7 MB/s
     http_req_blocked...............: avg=2.88µs   min=862ns   med=2.06µs   max=14.35ms  p(90)=3.6µs   p(95)=4.32µs  p(99.9)=29.6µs  
     http_req_connecting............: avg=325ns    min=0s      med=0s       max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.31ms  min=1.82ms  med=18.64ms  max=365.77ms p(90)=36.6ms  p(95)=45.36ms p(99.9)=156.84ms
       { expected_response:true }...: avg=22.31ms  min=1.82ms  med=18.64ms  max=365.77ms p(90)=36.6ms  p(95)=45.36ms p(99.9)=156.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266246
     http_req_receiving.............: avg=629.48µs min=50.75µs med=100.25µs max=215.18ms p(90)=1.13ms  p(95)=1.96ms  p(99.9)=30.75ms 
     http_req_sending...............: avg=36.56µs  min=4.68µs  med=9.15µs   max=38.71ms  p(90)=18.32µs p(95)=43.72µs p(99.9)=2.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.65ms  min=1.69ms  med=18.08ms  max=365.68ms p(90)=35.55ms p(95)=44.14ms p(99.9)=151.73ms
     http_reqs......................: 266246  2214.282326/s
     iteration_duration.............: avg=22.53ms  min=2.93ms  med=18.84ms  max=365.9ms  p(90)=36.82ms p(95)=45.59ms p(99.9)=157.46ms
     iterations.....................: 266146  2213.450659/s
     success_rate...................: 100.00% ✓ 266146      ✗ 0     
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

     checks.........................: 100.00% ✓ 590847      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=3.27µs  min=952ns   med=2.24µs  max=4.13ms   p(90)=4.27µs   p(95)=5.48µs   p(99.9)=36.49µs
     http_req_connecting............: avg=488ns   min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.21ms min=2.25ms  med=29.72ms max=278.88ms p(90)=39.87ms  p(95)=43.24ms  p(99.9)=65.14ms
       { expected_response:true }...: avg=30.21ms min=2.25ms  med=29.72ms max=278.88ms p(90)=39.87ms  p(95)=43.24ms  p(99.9)=65.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 197049
     http_req_receiving.............: avg=93.72µs min=28.44µs med=55.69µs max=76.39ms  p(90)=124.74µs p(95)=199.29µs p(99.9)=3.91ms 
     http_req_sending...............: avg=39.67µs min=4.86µs  med=9.41µs  max=88.32ms  p(90)=23.17µs  p(95)=100.61µs p(99.9)=3ms    
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.08ms min=2.12ms  med=29.6ms  max=278.55ms p(90)=39.71ms  p(95)=43.07ms  p(99.9)=64.51ms
     http_reqs......................: 197049  1638.221472/s
     iteration_duration.............: avg=30.45ms min=5.1ms   med=29.94ms max=323.88ms p(90)=40.09ms  p(95)=43.47ms  p(99.9)=65.42ms
     iterations.....................: 196949  1637.390094/s
     success_rate...................: 100.00% ✓ 196949      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423609      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.2µs   min=902ns  med=2.25µs  max=4.08ms   p(90)=3.7µs    p(95)=4.37µs   p(99.9)=36.43µs 
     http_req_connecting............: avg=631ns   min=0s     med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.24ms min=2.14ms med=41.88ms max=309.37ms p(90)=58.84ms  p(95)=64.03ms  p(99.9)=88.54ms 
       { expected_response:true }...: avg=42.24ms min=2.14ms med=41.88ms max=309.37ms p(90)=58.84ms  p(95)=64.03ms  p(99.9)=88.54ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141303
     http_req_receiving.............: avg=79.58µs min=28.5µs med=65.35µs max=200.51ms p(90)=104.84µs p(95)=121.83µs p(99.9)=736.68µs
     http_req_sending...............: avg=25.88µs min=4.9µs  med=11.07µs max=178.91ms p(90)=17.94µs  p(95)=21.51µs  p(99.9)=908.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.13ms min=2.01ms med=41.78ms max=301.59ms p(90)=58.75ms  p(95)=63.92ms  p(99.9)=87.93ms 
     http_reqs......................: 141303  1174.636722/s
     iteration_duration.............: avg=42.48ms min=4.38ms med=42.09ms max=322.24ms p(90)=59.05ms  p(95)=64.25ms  p(99.9)=89.12ms 
     iterations.....................: 141203  1173.805432/s
     success_rate...................: 100.00% ✓ 141203      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 213417     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 86 MB   710 kB/s
     http_req_blocked...............: avg=4.33µs  min=1.07µs  med=2.72µs  max=3.51ms   p(90)=4.27µs   p(95)=4.89µs   p(99.9)=47.56µs 
     http_req_connecting............: avg=1.34µs  min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.99ms min=3.83ms  med=82.04ms max=320.06ms p(90)=104.2ms  p(95)=115.42ms p(99.9)=194.63ms
       { expected_response:true }...: avg=83.99ms min=3.83ms  med=82.04ms max=320.06ms p(90)=104.2ms  p(95)=115.42ms p(99.9)=194.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71239
     http_req_receiving.............: avg=80.75µs min=27.66µs med=72.64µs max=42.87ms  p(90)=110.17µs p(95)=123.66µs p(99.9)=630.66µs
     http_req_sending...............: avg=25.67µs min=4.83µs  med=13.38µs max=124.16ms p(90)=20.46µs  p(95)=22.58µs  p(99.9)=605.14µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.89ms min=3.74ms  med=81.94ms max=319.54ms p(90)=104.08ms p(95)=115.3ms  p(99.9)=194.51ms
     http_reqs......................: 71239   591.081602/s
     iteration_duration.............: avg=84.35ms min=38.67ms med=82.29ms max=334.2ms  p(90)=104.46ms p(95)=115.73ms p(99.9)=196.22ms
     iterations.....................: 71139   590.251885/s
     success_rate...................: 100.00% ✓ 71139      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 147771     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   491 kB/s
     http_req_blocked...............: avg=6.88µs   min=1.35µs  med=3.58µs   max=9.79ms   p(90)=5.04µs   p(95)=5.65µs   p(99.9)=154.28µs
     http_req_connecting............: avg=2.79µs   min=0s      med=0s       max=5.94ms   p(90)=0s       p(95)=0s       p(99.9)=76.17µs 
     http_req_duration..............: avg=121.33ms min=5.43ms  med=119.02ms max=304.4ms  p(90)=160.56ms p(95)=172.48ms p(99.9)=221.12ms
       { expected_response:true }...: avg=121.33ms min=5.43ms  med=119.02ms max=304.4ms  p(90)=160.56ms p(95)=172.48ms p(99.9)=221.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49357
     http_req_receiving.............: avg=82.45µs  min=30.92µs med=78.63µs  max=5.61ms   p(90)=110.08µs p(95)=122µs    p(99.9)=460.02µs
     http_req_sending...............: avg=28.17µs  min=5.82µs  med=16.87µs  max=108.78ms p(90)=22.49µs  p(95)=24.42µs  p(99.9)=663.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.22ms min=5.3ms   med=118.92ms max=304.05ms p(90)=160.47ms p(95)=172.34ms p(99.9)=220.98ms
     http_reqs......................: 49357   408.995358/s
     iteration_duration.............: avg=121.83ms min=29.19ms med=119.38ms max=317.37ms p(90)=160.89ms p(95)=172.79ms p(99.9)=222.49ms
     iterations.....................: 49257   408.166711/s
     success_rate...................: 100.00% ✓ 49257      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97632      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=5.95µs   min=1.06µs  med=3.13µs   max=3.45ms   p(90)=4.51µs   p(95)=5.07µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=2.58µs   min=0s      med=0s       max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=183.62ms min=7.8ms   med=188.73ms max=394.85ms p(90)=196.2ms  p(95)=201.33ms p(99.9)=280.51ms
       { expected_response:true }...: avg=183.62ms min=7.8ms   med=188.73ms max=394.85ms p(90)=196.2ms  p(95)=201.33ms p(99.9)=280.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32644
     http_req_receiving.............: avg=99.24µs  min=31.3µs  med=88.75µs  max=161.88ms p(90)=118.77µs p(95)=130.45µs p(99.9)=572.3µs 
     http_req_sending...............: avg=33.4µs   min=5.39µs  med=17.53µs  max=108.3ms  p(90)=22.17µs  p(95)=24.02µs  p(99.9)=597.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.49ms min=7.72ms  med=188.62ms max=393.16ms p(90)=196.09ms p(95)=201.2ms  p(99.9)=280.12ms
     http_reqs......................: 32644   269.828408/s
     iteration_duration.............: avg=184.46ms min=36.22ms med=189.01ms max=403.22ms p(90)=196.49ms p(95)=201.61ms p(99.9)=282.34ms
     iterations.....................: 32544   269.001829/s
     success_rate...................: 100.00% ✓ 32544      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96588      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=7.15µs   min=1.43µs  med=3.79µs   max=4.07ms   p(90)=5.28µs   p(95)=5.91µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=3.08µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=185.62ms min=6.14ms  med=171.81ms max=664.96ms p(90)=218.58ms p(95)=262.1ms  p(99.9)=563.25ms
       { expected_response:true }...: avg=185.62ms min=6.14ms  med=171.81ms max=664.96ms p(90)=218.58ms p(95)=262.1ms  p(99.9)=563.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32296
     http_req_receiving.............: avg=98.99µs  min=35.87µs med=92.87µs  max=19.39ms  p(90)=123.9µs  p(95)=137.07µs p(99.9)=891.95µs
     http_req_sending...............: avg=25.71µs  min=7.34µs  med=19.37µs  max=40.16ms  p(90)=24.37µs  p(95)=26.51µs  p(99.9)=518.39µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.5ms  min=6ms     med=171.68ms max=664.85ms p(90)=218.46ms p(95)=262.01ms p(99.9)=563.15ms
     http_reqs......................: 32296   266.958004/s
     iteration_duration.............: avg=186.48ms min=27.2ms  med=172.22ms max=665.24ms p(90)=219ms    p(95)=263.88ms p(99.9)=563.48ms
     iterations.....................: 32196   266.131406/s
     success_rate...................: 100.00% ✓ 32196      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 7311      ✗ 0   
     data_received..................: 243 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=60.24µs  min=1.59µs   med=3.65µs  max=6.21ms  p(90)=5.3µs    p(95)=6.1µs    p(99.9)=5.5ms   
     http_req_connecting............: avg=54.92µs  min=0s       med=0s      max=6.18ms  p(90)=0s       p(95)=0s       p(99.9)=5.46ms  
     http_req_duration..............: avg=2.38s    min=30ms     med=2.41s   max=17.39s  p(90)=3.28s    p(95)=3.53s    p(99.9)=14.98s  
       { expected_response:true }...: avg=2.38s    min=30ms     med=2.41s   max=17.39s  p(90)=3.28s    p(95)=3.53s    p(99.9)=14.98s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2537
     http_req_receiving.............: avg=100.77µs min=35.69µs  med=94.68µs max=1.53ms  p(90)=135.93µs p(95)=151.87µs p(99.9)=653.65µs
     http_req_sending...............: avg=69.93µs  min=7.26µs   med=19.26µs max=14.05ms p(90)=24.75µs  p(95)=29.1µs   p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.38s    min=29.84ms  med=2.41s   max=17.39s  p(90)=3.28s    p(95)=3.53s    p(99.9)=14.98s  
     http_reqs......................: 2537    20.089125/s
     iteration_duration.............: avg=2.48s    min=349.29ms med=2.43s   max=17.39s  p(90)=3.29s    p(95)=3.54s    p(99.9)=15.01s  
     iterations.....................: 2437    19.297279/s
     success_rate...................: 100.00% ✓ 2437      ✗ 0   
     vus............................: 13      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

