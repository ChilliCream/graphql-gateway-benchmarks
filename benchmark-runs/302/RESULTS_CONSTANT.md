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
| hive-router | v0.0.84 | 3,026 | 3,273 | 2,953 | 3.3% |  |
| fusion-nightly-net11 | 16.6.0-p.7 | 2,707 | 2,830 | 2,695 | 1.7% |  |
| fusion-nightly | 16.6.0-p.7 | 2,632 | 2,742 | 2,626 | 1.6% |  |
| fusion | 16.5.1 | 2,495 | 2,609 | 2,474 | 1.9% |  |
| grafbase | 0.53.5 | 2,225 | 2,335 | 2,209 | 2.0% |  |
| cosmo | 0.334.0 | 1,315 | 1,359 | 1,310 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 621 | 640 | 619 | 1.3% |  |
| apollo-router | v2.16.1 | 484 | 493 | 473 | 1.5% |  |
| apollo-gateway | 2.14.3 | 278 | 282 | 276 | 0.6% |  |
| hive-gateway | 2.10.8 | 276 | 284 | 275 | 1.2% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1228 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,607 | 2,786 | 2,579 | 2.6% |  |
| fusion-nightly-net11 | 16.6.0-p.7 | 2,427 | 2,541 | 2,411 | 1.8% |  |
| fusion-nightly | 16.6.0-p.7 | 2,364 | 2,535 | 2,352 | 3.2% |  |
| fusion | 16.5.1 | 2,334 | 2,443 | 2,322 | 1.9% |  |
| fusion-nightly-fed | 16.6.0-p.7 | 2,256 | 2,359 | 2,249 | 1.7% |  |
| grafbase | 0.53.5 | 1,664 | 1,723 | 1,659 | 1.4% |  |
| cosmo | 0.334.0 | 1,225 | 1,270 | 1,215 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 596 | 611 | 590 | 1.0% |  |
| apollo-router | v2.16.1 | 407 | 429 | 402 | 2.3% |  |
| hive-gateway | 2.10.8 | 271 | 279 | 269 | 1.3% |  |
| apollo-gateway | 2.14.3 | 266 | 270 | 264 | 0.7% |  |
| feddi | 5ff8b6165878 | 22 | 22 | 21 | 2.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1090797     ✗ 0     
     data_received..................: 32 GB   265 MB/s
     data_sent......................: 437 MB  3.6 MB/s
     http_req_blocked...............: avg=3.09µs  min=951ns   med=2.34µs  max=18.75ms  p(90)=3.75µs  p(95)=4.4µs    p(99.9)=36µs   
     http_req_connecting............: avg=245ns   min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.28ms min=1.42ms  med=15.71ms max=289.16ms p(90)=23.62ms p(95)=26.77ms  p(99.9)=46.59ms
       { expected_response:true }...: avg=16.28ms min=1.42ms  med=15.71ms max=289.16ms p(90)=23.62ms p(95)=26.77ms  p(99.9)=46.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 363699
     http_req_receiving.............: avg=88.26µs min=24.83µs med=45.73µs max=171.53ms p(90)=86.27µs p(95)=165.7µs  p(99.9)=6.88ms 
     http_req_sending...............: avg=49.82µs min=4.56µs  med=8.97µs  max=165.44ms p(90)=15.77µs p(95)=100.29µs p(99.9)=6.46ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.14ms min=1.34ms  med=15.6ms  max=288.41ms p(90)=23.46ms p(95)=26.53ms  p(99.9)=45.51ms
     http_reqs......................: 363699  3026.373982/s
     iteration_duration.............: avg=16.49ms min=1.91ms  med=15.89ms max=301.46ms p(90)=23.83ms p(95)=27ms     p(99.9)=47.61ms
     iterations.....................: 363599  3025.541873/s
     success_rate...................: 100.00% ✓ 363599      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 976398      ✗ 0     
     data_received..................: 29 GB   237 MB/s
     data_sent......................: 391 MB  3.3 MB/s
     http_req_blocked...............: avg=3.29µs   min=1µs     med=2.47µs   max=16.17ms  p(90)=3.88µs  p(95)=4.51µs  p(99.9)=35.7µs 
     http_req_connecting............: avg=285ns    min=0s      med=0s       max=3.33ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.2ms   min=1.88ms  med=17.26ms  max=294.74ms p(90)=26.21ms p(95)=29.88ms p(99.9)=51.24ms
       { expected_response:true }...: avg=18.2ms   min=1.88ms  med=17.26ms  max=294.74ms p(90)=26.21ms p(95)=29.88ms p(99.9)=51.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 325566
     http_req_receiving.............: avg=652.31µs min=51.24µs med=101.93µs max=226.13ms p(90)=1.66ms  p(95)=2.54ms  p(99.9)=20.26ms
     http_req_sending...............: avg=47.5µs   min=4.52µs  med=9.15µs   max=236.46ms p(90)=16.65µs p(95)=97.39µs p(99.9)=4.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.5ms   min=1.8ms   med=16.57ms  max=289.46ms p(90)=25.37ms p(95)=28.96ms p(99.9)=49.14ms
     http_reqs......................: 325566  2707.778505/s
     iteration_duration.............: avg=18.42ms  min=2.99ms  med=17.46ms  max=304.73ms p(90)=26.43ms p(95)=30.12ms p(99.9)=52.15ms
     iterations.....................: 325466  2706.946791/s
     success_rate...................: 100.00% ✓ 325466      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 949437      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=2.72µs   min=901ns   med=1.99µs  max=16.36ms  p(90)=3.22µs  p(95)=3.8µs   p(99.9)=31.3µs  
     http_req_connecting............: avg=292ns    min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.74ms  min=2ms     med=16.19ms max=302.72ms p(90)=30.31ms p(95)=36.58ms p(99.9)=121.64ms
       { expected_response:true }...: avg=18.74ms  min=2ms     med=16.19ms max=302.72ms p(90)=30.31ms p(95)=36.58ms p(99.9)=121.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 316579
     http_req_receiving.............: avg=535.56µs min=50.54µs med=90.05µs max=183.01ms p(90)=1.04ms  p(95)=1.81ms  p(99.9)=24.01ms 
     http_req_sending...............: avg=43.24µs  min=4.65µs  med=8.27µs  max=137.6ms  p(90)=14.5µs  p(95)=82.41µs p(99.9)=4.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.16ms  min=1.89ms  med=15.7ms  max=302.41ms p(90)=29.44ms p(95)=35.56ms p(99.9)=119.83ms
     http_reqs......................: 316579  2632.675444/s
     iteration_duration.............: avg=18.94ms  min=2.93ms  med=16.39ms max=312.96ms p(90)=30.53ms p(95)=36.82ms p(99.9)=123.38ms
     iterations.....................: 316479  2631.843843/s
     success_rate...................: 100.00% ✓ 316479      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 900153      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=2.9µs   min=922ns   med=2.2µs   max=10.5ms   p(90)=3.48µs  p(95)=4.04µs  p(99.9)=29.38µs 
     http_req_connecting............: avg=341ns   min=0s      med=0s      max=4.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.78ms min=2.04ms  med=16.99ms max=315.68ms p(90)=32.06ms p(95)=38.8ms  p(99.9)=124.51ms
       { expected_response:true }...: avg=19.78ms min=2.04ms  med=16.99ms max=315.68ms p(90)=32.06ms p(95)=38.8ms  p(99.9)=124.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300151
     http_req_receiving.............: avg=574.8µs min=52.58µs med=93.29µs max=197.94ms p(90)=1.08ms  p(95)=1.93ms  p(99.9)=25.63ms 
     http_req_sending...............: avg=40.71µs min=4.68µs  med=8.59µs  max=120.74ms p(90)=14.54µs p(95)=78.17µs p(99.9)=3.59ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.16ms min=1.94ms  med=16.46ms max=315.6ms  p(90)=31.09ms p(95)=37.74ms p(99.9)=123.09ms
     http_reqs......................: 300151  2495.571345/s
     iteration_duration.............: avg=19.98ms min=3.18ms  med=17.19ms max=315.87ms p(90)=32.28ms p(95)=39.01ms p(99.9)=125.24ms
     iterations.....................: 300051  2494.739906/s
     success_rate...................: 100.00% ✓ 300051      ✗ 0     
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

     checks.........................: 100.00% ✓ 802482      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 322 MB  2.7 MB/s
     http_req_blocked...............: avg=3.91µs  min=952ns   med=2.17µs  max=24.43ms  p(90)=3.71µs  p(95)=4.5µs    p(99.9)=36.82µs
     http_req_connecting............: avg=1.09µs  min=0s      med=0s      max=24.41ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.21ms min=1.71ms  med=21.97ms max=293.81ms p(90)=26.46ms p(95)=28.34ms  p(99.9)=46.96ms
       { expected_response:true }...: avg=22.21ms min=1.71ms  med=21.97ms max=293.81ms p(90)=26.46ms p(95)=28.34ms  p(99.9)=46.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267594
     http_req_receiving.............: avg=84.54µs min=26.37µs med=51.07µs max=187.7ms  p(90)=90.35µs p(95)=120.52µs p(99.9)=5.54ms 
     http_req_sending...............: avg=43.67µs min=4.75µs  med=9.3µs   max=214.3ms  p(90)=16.62µs p(95)=30.28µs  p(99.9)=3.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.08ms min=1.62ms  med=21.87ms max=232.75ms p(90)=26.33ms p(95)=28.15ms  p(99.9)=46.03ms
     http_reqs......................: 267594  2225.841481/s
     iteration_duration.............: avg=22.42ms min=3.54ms  med=22.16ms max=333.71ms p(90)=26.66ms p(95)=28.55ms  p(99.9)=47.44ms
     iterations.....................: 267494  2225.009683/s
     success_rate...................: 100.00% ✓ 267494      ✗ 0     
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

     checks.........................: 100.00% ✓ 474375      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=3.47µs  min=1.04µs  med=2.59µs  max=3.91ms   p(90)=4.02µs  p(95)=4.66µs   p(99.9)=35.72µs 
     http_req_connecting............: avg=572ns   min=0s      med=0s      max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.71ms min=2.03ms  med=37.36ms max=294.74ms p(90)=52.77ms p(95)=57.41ms  p(99.9)=80.25ms 
       { expected_response:true }...: avg=37.71ms min=2.03ms  med=37.36ms max=294.74ms p(90)=52.77ms p(95)=57.41ms  p(99.9)=80.25ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 158225
     http_req_receiving.............: avg=73.14µs min=25.95µs med=60.29µs max=27.99ms  p(90)=96.24µs p(95)=112.16µs p(99.9)=957.94µs
     http_req_sending...............: avg=26.78µs min=4.87µs  med=10.73µs max=190.35ms p(90)=16.76µs p(95)=20.82µs  p(99.9)=979.46µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.61ms min=1.97ms  med=37.27ms max=284.19ms p(90)=52.67ms p(95)=57.3ms   p(99.9)=79.96ms 
     http_reqs......................: 158225  1315.5973/s
     iteration_duration.............: avg=37.93ms min=3.84ms  med=37.57ms max=303.7ms  p(90)=52.97ms p(95)=57.61ms  p(99.9)=80.85ms 
     iterations.....................: 158125  1314.765828/s
     success_rate...................: 100.00% ✓ 158125      ✗ 0     
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

     checks.........................: 100.00% ✓ 224181     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   746 kB/s
     http_req_blocked...............: avg=4.69µs  min=1.21µs  med=3.14µs  max=3.84ms   p(90)=4.65µs   p(95)=5.3µs    p(99.9)=46.56µs 
     http_req_connecting............: avg=1.28µs  min=0s      med=0s      max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.95ms min=3.61ms  med=78.57ms max=318.35ms p(90)=101.06ms p(95)=111.28ms p(99.9)=187.45ms
       { expected_response:true }...: avg=79.95ms min=3.61ms  med=78.57ms max=318.35ms p(90)=101.06ms p(95)=111.28ms p(99.9)=187.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74827
     http_req_receiving.............: avg=83.48µs min=26.33µs med=69.99µs max=199.14ms p(90)=105.34µs p(95)=118.79µs p(99.9)=644.57µs
     http_req_sending...............: avg=22.87µs min=4.79µs  med=13.55µs max=121.04ms p(90)=20.14µs  p(95)=22.46µs  p(99.9)=606.65µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.84ms min=3.5ms   med=78.46ms max=318.06ms p(90)=100.95ms p(95)=111.15ms p(99.9)=187.01ms
     http_reqs......................: 74827   621.133115/s
     iteration_duration.............: avg=80.3ms  min=16.93ms med=78.82ms max=326.31ms p(90)=101.31ms p(95)=111.57ms p(99.9)=189.16ms
     iterations.....................: 74727   620.303023/s
     success_rate...................: 100.00% ✓ 74727      ✗ 0    
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

     checks.........................: 100.00% ✓ 175089     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   582 kB/s
     http_req_blocked...............: avg=5.14µs   min=1.31µs  med=3.39µs   max=3.72ms   p(90)=4.84µs   p(95)=5.41µs   p(99.9)=58.81µs 
     http_req_connecting............: avg=1.53µs   min=0s      med=0s       max=3.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.39ms min=4.68ms  med=102.17ms max=328.67ms p(90)=123.38ms p(95)=129.75ms p(99.9)=158.32ms
       { expected_response:true }...: avg=102.39ms min=4.68ms  med=102.17ms max=328.67ms p(90)=123.38ms p(95)=129.75ms p(99.9)=158.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58463
     http_req_receiving.............: avg=85.08µs  min=31.6µs  med=76.96µs  max=98.51ms  p(90)=109.6µs  p(95)=122.37µs p(99.9)=561.16µs
     http_req_sending...............: avg=26.39µs  min=6.04µs  med=16.52µs  max=166.33ms p(90)=22.17µs  p(95)=24.07µs  p(99.9)=678.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.28ms min=4.55ms  med=102.06ms max=327.82ms p(90)=123.27ms p(95)=129.63ms p(99.9)=158.16ms
     http_reqs......................: 58463   484.787727/s
     iteration_duration.............: avg=102.82ms min=13.61ms med=102.45ms max=337.8ms  p(90)=123.65ms p(95)=130.02ms p(99.9)=159.32ms
     iterations.....................: 58363   483.958505/s
     success_rate...................: 100.00% ✓ 58363      ✗ 0    
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

     checks.........................: 100.00% ✓ 100617     ✗ 0    
     data_received..................: 3.0 GB  24 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.38µs  med=3.31µs   max=3.46ms   p(90)=4.54µs   p(95)=5.06µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=2.51µs   min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=178.2ms  min=7.4ms   med=171.61ms max=365.83ms p(90)=199.68ms p(95)=204.79ms p(99.9)=271.5ms 
       { expected_response:true }...: avg=178.2ms  min=7.4ms   med=171.61ms max=365.83ms p(90)=199.68ms p(95)=204.79ms p(99.9)=271.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33639
     http_req_receiving.............: avg=94.43µs  min=36µs    med=84.49µs  max=117.32ms p(90)=114.01µs p(95)=124.48µs p(99.9)=547.96µs
     http_req_sending...............: avg=31.6µs   min=6.08µs  med=16.3µs   max=107.74ms p(90)=20.48µs  p(95)=22.18µs  p(99.9)=547.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.08ms min=7.32ms  med=171.51ms max=360.73ms p(90)=199.55ms p(95)=204.67ms p(99.9)=271.27ms
     http_reqs......................: 33639   278.19315/s
     iteration_duration.............: avg=178.98ms min=25.98ms med=171.87ms max=373.16ms p(90)=199.96ms p(95)=205.08ms p(99.9)=272.05ms
     iterations.....................: 33539   277.366154/s
     success_rate...................: 100.00% ✓ 33539      ✗ 0    
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

     checks.........................: 100.00% ✓ 99909      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   332 kB/s
     http_req_blocked...............: avg=5.99µs   min=1.07µs  med=3.17µs   max=3.83ms   p(90)=4.5µs    p(95)=5.03µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=2.61µs   min=0s      med=0s       max=3.78ms   p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=179.43ms min=5.58ms  med=164.85ms max=714.57ms p(90)=212.85ms p(95)=257.57ms p(99.9)=593.3ms 
       { expected_response:true }...: avg=179.43ms min=5.58ms  med=164.85ms max=714.57ms p(90)=212.85ms p(95)=257.57ms p(99.9)=593.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33403
     http_req_receiving.............: avg=96.41µs  min=31.47µs med=89.76µs  max=59.24ms  p(90)=118.87µs p(95)=130.37µs p(99.9)=620.11µs
     http_req_sending...............: avg=21.86µs  min=5.55µs  med=17.12µs  max=28.62ms  p(90)=21.24µs  p(95)=22.88µs  p(99.9)=486.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.32ms min=5.46ms  med=164.75ms max=714.47ms p(90)=212.72ms p(95)=257.45ms p(99.9)=593.22ms
     http_reqs......................: 33403   276.557213/s
     iteration_duration.............: avg=180.24ms min=19.98ms med=165.21ms max=714.82ms p(90)=213.27ms p(95)=258.91ms p(99.9)=593.63ms
     iterations.....................: 33303   275.729272/s
     success_rate...................: 100.00% ✓ 33303      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 940215      ✗ 0     
     data_received..................: 27 GB   228 MB/s
     data_sent......................: 377 MB  3.1 MB/s
     http_req_blocked...............: avg=3.45µs  min=911ns   med=2.55µs  max=17.09ms  p(90)=4.16µs  p(95)=4.91µs   p(99.9)=37.27µs
     http_req_connecting............: avg=288ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=18.91ms min=1.72ms  med=18.51ms max=294.43ms p(90)=26.33ms p(95)=28.85ms  p(99.9)=48.35ms
       { expected_response:true }...: avg=18.91ms min=1.72ms  med=18.51ms max=294.43ms p(90)=26.33ms p(95)=28.85ms  p(99.9)=48.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 313505
     http_req_receiving.............: avg=92.28µs min=24.37µs med=51.23µs max=29.09ms  p(90)=96.31µs p(95)=157.41µs p(99.9)=6.81ms 
     http_req_sending...............: avg=48.03µs min=4.6µs   med=10.56µs max=114.39ms p(90)=19.35µs p(95)=101.3µs  p(99.9)=4.46ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.77ms min=1.67ms  med=18.39ms max=293.8ms  p(90)=26.17ms p(95)=28.65ms  p(99.9)=47.53ms
     http_reqs......................: 313505  2607.737422/s
     iteration_duration.............: avg=19.13ms min=2.9ms   med=18.72ms max=306ms    p(90)=26.54ms p(95)=29.07ms  p(99.9)=48.74ms
     iterations.....................: 313405  2606.905621/s
     success_rate...................: 100.00% ✓ 313405      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 875013      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=3.57µs   min=992ns   med=2.63µs  max=19.46ms  p(90)=4.15µs  p(95)=4.84µs  p(99.9)=37.28µs
     http_req_connecting............: avg=338ns    min=0s      med=0s      max=4.32ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.33ms  min=1.51ms  med=19.45ms max=316.03ms p(90)=29.38ms p(95)=33ms    p(99.9)=54.11ms
       { expected_response:true }...: avg=20.33ms  min=1.51ms  med=19.45ms max=316.03ms p(90)=29.38ms p(95)=33ms    p(99.9)=54.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291771
     http_req_receiving.............: avg=802.07µs min=51.01µs med=120µs   max=209.65ms p(90)=2.02ms  p(95)=3.05ms  p(99.9)=21.31ms
     http_req_sending...............: avg=46.41µs  min=4.93µs  med=9.93µs  max=199.38ms p(90)=18.23µs p(95)=93.27µs p(99.9)=4.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.48ms  min=1.42ms  med=18.59ms max=254.23ms p(90)=28.37ms p(95)=31.97ms p(99.9)=52.02ms
     http_reqs......................: 291771  2427.325962/s
     iteration_duration.............: avg=20.56ms  min=2.47ms  med=19.66ms max=336.97ms p(90)=29.6ms  p(95)=33.23ms p(99.9)=55.04ms
     iterations.....................: 291671  2426.494034/s
     success_rate...................: 100.00% ✓ 291671      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 852360      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=4.08µs   min=1.03µs  med=2.55µs  max=16.91ms  p(90)=4µs     p(95)=4.67µs  p(99.9)=35.38µs 
     http_req_connecting............: avg=935ns    min=0s      med=0s      max=13.94ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.88ms  min=1.59ms  med=17.38ms max=501.39ms p(90)=34.55ms p(95)=42.39ms p(99.9)=154.3ms 
       { expected_response:true }...: avg=20.88ms  min=1.59ms  med=17.38ms max=501.39ms p(90)=34.55ms p(95)=42.39ms p(99.9)=154.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 284220
     http_req_receiving.............: avg=616.59µs min=52.42µs med=98.91µs max=440.64ms p(90)=1.13ms  p(95)=2.03ms  p(99.9)=28.91ms 
     http_req_sending...............: avg=46.36µs  min=5.06µs  med=9.57µs  max=125.2ms  p(90)=16.84µs p(95)=87.64µs p(99.9)=4.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.22ms  min=1.47ms  med=16.82ms max=501.29ms p(90)=33.49ms p(95)=41.16ms p(99.9)=152.85ms
     http_reqs......................: 284220  2364.505259/s
     iteration_duration.............: avg=21.1ms   min=2.69ms  med=17.59ms max=501.62ms p(90)=34.79ms p(95)=42.63ms p(99.9)=155.57ms
     iterations.....................: 284120  2363.673331/s
     success_rate...................: 100.00% ✓ 284120      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 841572      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=3.27µs   min=881ns   med=2.57µs  max=8.39ms   p(90)=3.98µs  p(95)=4.63µs  p(99.9)=34.45µs 
     http_req_connecting............: avg=345ns    min=0s      med=0s      max=3.6ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.15ms  min=1.57ms  med=17.62ms max=369.97ms p(90)=34.73ms p(95)=42.55ms p(99.9)=159.74ms
       { expected_response:true }...: avg=21.15ms  min=1.57ms  med=17.62ms max=369.97ms p(90)=34.73ms p(95)=42.55ms p(99.9)=159.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280624
     http_req_receiving.............: avg=613.76µs min=52.51µs med=99.56µs max=207.03ms p(90)=1.14ms  p(95)=1.98ms  p(99.9)=29.06ms 
     http_req_sending...............: avg=42.21µs  min=4.89µs  med=9.71µs  max=168.35ms p(90)=16.66µs p(95)=86.15µs p(99.9)=2.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.5ms   min=1.5ms   med=17.06ms max=369.86ms p(90)=33.64ms p(95)=41.28ms p(99.9)=157.67ms
     http_reqs......................: 280624  2334.610077/s
     iteration_duration.............: avg=21.37ms  min=2.72ms  med=17.83ms max=370.19ms p(90)=34.95ms p(95)=42.79ms p(99.9)=161.31ms
     iterations.....................: 280524  2333.778142/s
     success_rate...................: 100.00% ✓ 280524      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 813744      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 326 MB  2.7 MB/s
     http_req_blocked...............: avg=3.33µs   min=942ns  med=2.48µs   max=12.44ms  p(90)=4.42µs  p(95)=5.2µs   p(99.9)=36.46µs 
     http_req_connecting............: avg=304ns    min=0s     med=0s       max=3.41ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.88ms  min=2.05ms med=18.59ms  max=347.72ms p(90)=35.01ms p(95)=42.85ms p(99.9)=146.41ms
       { expected_response:true }...: avg=21.88ms  min=2.05ms med=18.59ms  max=347.72ms p(90)=35.01ms p(95)=42.85ms p(99.9)=146.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 271348
     http_req_receiving.............: avg=572.18µs min=49.5µs med=102.14µs max=133.45ms p(90)=1.12ms  p(95)=1.91ms  p(99.9)=26.17ms 
     http_req_sending...............: avg=42.13µs  min=4.53µs med=10.07µs  max=138.6ms  p(90)=20.78µs p(95)=83.07µs p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.26ms  min=1.89ms med=18.05ms  max=347.28ms p(90)=34.07ms p(95)=41.75ms p(99.9)=145.38ms
     http_reqs......................: 271348  2256.422094/s
     iteration_duration.............: avg=22.1ms   min=2.92ms med=18.8ms   max=347.92ms p(90)=35.24ms p(95)=43.09ms p(99.9)=147.88ms
     iterations.....................: 271248  2255.590534/s
     success_rate...................: 100.00% ✓ 271248      ✗ 0     
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

     checks.........................: 100.00% ✓ 600294      ✗ 0     
     data_received..................: 18 GB   146 MB/s
     data_sent......................: 241 MB  2.0 MB/s
     http_req_blocked...............: avg=3.33µs  min=912ns   med=2.25µs  max=3.52ms   p(90)=4.53µs   p(95)=5.6µs    p(99.9)=40.27µs
     http_req_connecting............: avg=454ns   min=0s      med=0s      max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.73ms min=2.24ms  med=29.14ms max=306.22ms p(90)=39.15ms  p(95)=42.5ms   p(99.9)=64.54ms
       { expected_response:true }...: avg=29.73ms min=2.24ms  med=29.14ms max=306.22ms p(90)=39.15ms  p(95)=42.5ms   p(99.9)=64.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 200198
     http_req_receiving.............: avg=96.55µs min=26.85µs med=55.89µs max=165.67ms p(90)=125.56µs p(95)=196.68µs p(99.9)=4.17ms 
     http_req_sending...............: avg=42.56µs min=4.54µs  med=9.49µs  max=151.87ms p(90)=23.86µs  p(95)=103.27µs p(99.9)=3.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.59ms min=2.14ms  med=29.03ms max=305.76ms p(90)=38.99ms  p(95)=42.31ms  p(99.9)=63.58ms
     http_reqs......................: 200198  1664.436855/s
     iteration_duration.............: avg=29.97ms min=6.6ms   med=29.36ms max=316.41ms p(90)=39.37ms  p(95)=42.71ms  p(99.9)=65.01ms
     iterations.....................: 200098  1663.60546/s
     success_rate...................: 100.00% ✓ 200098      ✗ 0     
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

     checks.........................: 100.00% ✓ 441822      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3.79µs  min=1.12µs  med=3µs     max=2.81ms   p(90)=4.61µs   p(95)=5.34µs   p(99.9)=37.54µs
     http_req_connecting............: avg=476ns   min=0s      med=0s      max=2.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.48ms min=2.17ms  med=40.06ms max=307.28ms p(90)=56.34ms  p(95)=61.38ms  p(99.9)=85.68ms
       { expected_response:true }...: avg=40.48ms min=2.17ms  med=40.06ms max=307.28ms p(90)=56.34ms  p(95)=61.38ms  p(99.9)=85.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147374
     http_req_receiving.............: avg=82.23µs min=28.18µs med=68.41µs max=26.34ms  p(90)=107.86µs p(95)=125.29µs p(99.9)=1.1ms  
     http_req_sending...............: avg=27.41µs min=5.13µs  med=12.65µs max=145.32ms p(90)=19.51µs  p(95)=23.44µs  p(99.9)=1.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.37ms min=2.06ms  med=39.95ms max=306.46ms p(90)=56.23ms  p(95)=61.24ms  p(99.9)=85.32ms
     http_reqs......................: 147374  1225.253127/s
     iteration_duration.............: avg=40.73ms min=4.08ms  med=40.29ms max=318.54ms p(90)=56.56ms  p(95)=61.59ms  p(99.9)=86.28ms
     iterations.....................: 147274  1224.421736/s
     success_rate...................: 100.00% ✓ 147274      ✗ 0     
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

     checks.........................: 100.00% ✓ 215439     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   717 kB/s
     http_req_blocked...............: avg=4.91µs  min=1.29µs  med=3.3µs   max=4.11ms   p(90)=4.91µs   p(95)=5.6µs    p(99.9)=44.05µs 
     http_req_connecting............: avg=1.33µs  min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.19ms min=3.79ms  med=80.54ms max=321.75ms p(90)=104.87ms p(95)=116.29ms p(99.9)=197.84ms
       { expected_response:true }...: avg=83.19ms min=3.79ms  med=80.54ms max=321.75ms p(90)=104.87ms p(95)=116.29ms p(99.9)=197.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71913
     http_req_receiving.............: avg=85.44µs min=29.42µs med=76.02µs max=85.49ms  p(90)=112.95µs p(95)=127.14µs p(99.9)=670.55µs
     http_req_sending...............: avg=27.41µs min=5.57µs  med=15.57µs max=168.04ms p(90)=22.49µs  p(95)=24.93µs  p(99.9)=611.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.07ms min=3.68ms  med=80.44ms max=321.4ms  p(90)=104.76ms p(95)=116.17ms p(99.9)=197.57ms
     http_reqs......................: 71913   596.711355/s
     iteration_duration.............: avg=83.56ms min=23.85ms med=80.81ms max=333.05ms p(90)=105.13ms p(95)=116.58ms p(99.9)=199.67ms
     iterations.....................: 71813   595.881586/s
     success_rate...................: 100.00% ✓ 71813      ✗ 0    
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

     checks.........................: 100.00% ✓ 147345     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   490 kB/s
     http_req_blocked...............: avg=5.15µs   min=1.08µs  med=3.1µs    max=3.81ms   p(90)=4.54µs   p(95)=5.12µs   p(99.9)=572.03µs
     http_req_connecting............: avg=1.86µs   min=0s      med=0s       max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=538.83µs
     http_req_duration..............: avg=121.69ms min=5.06ms  med=119.17ms max=305.72ms p(90)=160.97ms p(95)=173.47ms p(99.9)=222.73ms
       { expected_response:true }...: avg=121.69ms min=5.06ms  med=119.17ms max=305.72ms p(90)=160.97ms p(95)=173.47ms p(99.9)=222.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49215
     http_req_receiving.............: avg=86.3µs   min=29.84µs med=80.74µs  max=76.64ms  p(90)=110.69µs p(95)=123.34µs p(99.9)=578.15µs
     http_req_sending...............: avg=23.5µs   min=5.56µs  med=16.46µs  max=83.4ms   p(90)=21.48µs  p(95)=23.27µs  p(99.9)=542.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.58ms min=4.98ms  med=119.06ms max=305.59ms p(90)=160.87ms p(95)=173.35ms p(99.9)=222.39ms
     http_reqs......................: 49215   407.826653/s
     iteration_duration.............: avg=122.19ms min=25.71ms med=119.48ms max=319.52ms p(90)=161.25ms p(95)=173.8ms  p(99.9)=225.03ms
     iterations.....................: 49115   406.99799/s
     success_rate...................: 100.00% ✓ 49115      ✗ 0    
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

     checks.........................: 100.00% ✓ 97998      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   326 kB/s
     http_req_blocked...............: avg=6.75µs   min=1.32µs  med=3.88µs   max=3.35ms   p(90)=5.4µs    p(95)=6.03µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=2.61µs   min=0s      med=0s       max=3.31ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=182.93ms min=5.78ms  med=166.76ms max=685.36ms p(90)=213.75ms p(95)=250.78ms p(99.9)=601.33ms
       { expected_response:true }...: avg=182.93ms min=5.78ms  med=166.76ms max=685.36ms p(90)=213.75ms p(95)=250.78ms p(99.9)=601.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32766
     http_req_receiving.............: avg=97.12µs  min=36.6µs  med=92.66µs  max=17.31ms  p(90)=124.08µs p(95)=137.13µs p(99.9)=609.48µs
     http_req_sending...............: avg=31.92µs  min=6.51µs  med=18.99µs  max=172.4ms  p(90)=23.76µs  p(95)=25.71µs  p(99.9)=594.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.8ms  min=5.65ms  med=166.64ms max=685.29ms p(90)=213.65ms p(95)=250.66ms p(99.9)=601.21ms
     http_reqs......................: 32766   271.192933/s
     iteration_duration.............: avg=183.78ms min=44.25ms med=167.13ms max=685.54ms p(90)=214.17ms p(95)=251.66ms p(99.9)=601.7ms 
     iterations.....................: 32666   270.365267/s
     success_rate...................: 100.00% ✓ 32666      ✗ 0    
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

     checks.........................: 100.00% ✓ 96321      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.7µs    min=1.39µs  med=3.57µs   max=3.91ms   p(90)=4.95µs   p(95)=5.51µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=2.89µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=186.13ms min=7.77ms  med=190.83ms max=395.18ms p(90)=198.24ms p(95)=201.85ms p(99.9)=280.26ms
       { expected_response:true }...: avg=186.13ms min=7.77ms  med=190.83ms max=395.18ms p(90)=198.24ms p(95)=201.85ms p(99.9)=280.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32207
     http_req_receiving.............: avg=121.48µs min=35.57µs med=86.94µs  max=174.02ms p(90)=117.52µs p(95)=129.12µs p(99.9)=788.21µs
     http_req_sending...............: avg=31.75µs  min=6.01µs  med=17.79µs  max=103.88ms p(90)=22.57µs  p(95)=24.51µs  p(99.9)=552.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.98ms min=7.63ms  med=190.72ms max=394.65ms p(90)=198.12ms p(95)=201.72ms p(99.9)=278.32ms
     http_reqs......................: 32207   266.179185/s
     iteration_duration.............: avg=186.98ms min=29.23ms med=191.11ms max=403.89ms p(90)=198.51ms p(95)=202.15ms p(99.9)=282.19ms
     iterations.....................: 32107   265.352721/s
     success_rate...................: 100.00% ✓ 32107      ✗ 0    
     vus............................: 8       min=8        max=50 
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

     checks.........................: 100.00% ✓ 8055      ✗ 0   
     data_received..................: 267 MB  2.1 MB/s
     data_sent......................: 3.3 MB  27 kB/s
     http_req_blocked...............: avg=100.26µs min=1.54µs   med=3.75µs  max=9.03ms  p(90)=5.4µs    p(95)=6.36µs   p(99.9)=8.52ms  
     http_req_connecting............: avg=94.27µs  min=0s       med=0s      max=8.99ms  p(90)=0s       p(95)=0s       p(99.9)=8.48ms  
     http_req_duration..............: avg=2.17s    min=26.78ms  med=2.21s   max=4.39s   p(90)=2.98s    p(95)=3.25s    p(99.9)=4.12s   
       { expected_response:true }...: avg=2.17s    min=26.78ms  med=2.21s   max=4.39s   p(90)=2.98s    p(95)=3.25s    p(99.9)=4.12s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2785
     http_req_receiving.............: avg=106.54µs min=33.77µs  med=93.96µs max=23.08ms p(90)=133.18µs p(95)=150.01µs p(99.9)=413.46µs
     http_req_sending...............: avg=80.74µs  min=7.17µs   med=19.72µs max=29.27ms p(90)=25.4µs   p(95)=28.72µs  p(99.9)=12.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.17s    min=26.68ms  med=2.2s    max=4.39s   p(90)=2.98s    p(95)=3.25s    p(99.9)=4.12s   
     http_reqs......................: 2785    22.19231/s
     iteration_duration.............: avg=2.25s    min=247.15ms med=2.24s   max=4.39s   p(90)=3s       p(95)=3.25s    p(99.9)=4.13s   
     iterations.....................: 2685    21.395458/s
     success_rate...................: 100.00% ✓ 2685      ✗ 0   
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

