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
| hive-router | v0.0.84 | 3,159 | 3,416 | 3,095 | 3.2% |  |
| fusion-nightly-net11 | 16.6.2-p.4 | 2,651 | 2,781 | 2,640 | 1.9% |  |
| fusion | 16.6.1 | 2,549 | 2,668 | 2,539 | 1.7% |  |
| fusion-nightly | 16.6.2-p.4 | 2,545 | 2,673 | 2,532 | 2.0% |  |
| fusion-nightly-fed | 16.6.2-p.4 | 2,441 | 2,488 | 2,387 | 1.4% |  |
| grafbase | 0.53.5 | 2,128 | 2,259 | 2,109 | 2.3% |  |
| cosmo | 0.334.0 | 1,322 | 1,365 | 1,318 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 624 | 641 | 622 | 1.0% |  |
| apollo-router | v2.16.1 | 486 | 503 | 484 | 1.3% |  |
| apollo-gateway | 2.14.3 | 281 | 285 | 279 | 0.6% |  |
| hive-gateway | 2.10.8 | 280 | 289 | 279 | 1.3% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1347 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.4 | 2,576 | 2,691 | 2,561 | 1.8% |  |
| hive-router | v0.0.84 | 2,559 | 2,693 | 2,514 | 2.0% |  |
| fusion | 16.6.1 | 2,444 | 2,578 | 2,425 | 2.0% |  |
| fusion-nightly | 16.6.2-p.4 | 2,392 | 2,519 | 2,384 | 2.0% |  |
| fusion-nightly-fed | 16.6.2-p.4 | 2,181 | 2,299 | 2,173 | 2.0% |  |
| grafbase | 0.53.5 | 1,593 | 1,656 | 1,589 | 1.4% |  |
| cosmo | 0.334.0 | 1,190 | 1,234 | 1,182 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 573 | 593 | 569 | 1.4% |  |
| apollo-router | v2.16.1 | 405 | 424 | 402 | 2.0% |  |
| apollo-gateway | 2.14.3 | 268 | 271 | 266 | 0.6% |  |
| hive-gateway | 2.10.8 | 265 | 273 | 264 | 1.2% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 3.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1138632     ✗ 0     
     data_received..................: 33 GB   277 MB/s
     data_sent......................: 456 MB  3.8 MB/s
     http_req_blocked...............: avg=3.06µs  min=982ns   med=2.35µs  max=16.38ms  p(90)=3.71µs  p(95)=4.35µs   p(99.9)=32.48µs
     http_req_connecting............: avg=237ns   min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.59ms min=1.39ms  med=14.9ms  max=292.67ms p(90)=22.86ms p(95)=25.95ms  p(99.9)=45.9ms 
       { expected_response:true }...: avg=15.59ms min=1.39ms  med=14.9ms  max=292.67ms p(90)=22.86ms p(95)=25.95ms  p(99.9)=45.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 379644
     http_req_receiving.............: avg=91.94µs min=24.53µs med=47.03µs max=191.3ms  p(90)=86.99µs p(95)=173.77µs p(99.9)=7.21ms 
     http_req_sending...............: avg=48.11µs min=4.43µs  med=8.97µs  max=89.17ms  p(90)=15.81µs p(95)=103.45µs p(99.9)=5.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.45ms min=1.34ms  med=14.78ms max=292.04ms p(90)=22.68ms p(95)=25.71ms  p(99.9)=44.74ms
     http_reqs......................: 379644  3159.06195/s
     iteration_duration.............: avg=15.79ms min=1.95ms  med=15.09ms max=302.09ms p(90)=23.06ms p(95)=26.17ms  p(99.9)=46.59ms
     iterations.....................: 379544  3158.229839/s
     success_rate...................: 100.00% ✓ 379544      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 956142      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 383 MB  3.2 MB/s
     http_req_blocked...............: avg=2.62µs   min=842ns   med=1.79µs  max=19.03ms  p(90)=2.89µs  p(95)=3.42µs  p(99.9)=25.24µs
     http_req_connecting............: avg=258ns    min=0s      med=0s      max=3.35ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.61ms  min=1.97ms  med=17.73ms max=283.41ms p(90)=27.01ms p(95)=30.51ms p(99.9)=51.68ms
       { expected_response:true }...: avg=18.61ms  min=1.97ms  med=17.73ms max=283.41ms p(90)=27.01ms p(95)=30.51ms p(99.9)=51.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 318814
     http_req_receiving.............: avg=488.44µs min=49.92µs med=90.93µs max=145.68ms p(90)=1.17ms  p(95)=1.82ms  p(99.9)=17.86ms
     http_req_sending...............: avg=41.17µs  min=4.45µs  med=7.77µs  max=218.01ms p(90)=13.6µs  p(95)=76.57µs p(99.9)=3.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.08ms  min=1.84ms  med=17.22ms max=282.8ms  p(90)=26.37ms p(95)=29.78ms p(99.9)=49.52ms
     http_reqs......................: 318814  2651.375376/s
     iteration_duration.............: avg=18.81ms  min=2.74ms  med=17.92ms max=293ms    p(90)=27.22ms p(95)=30.73ms p(99.9)=52.17ms
     iterations.....................: 318714  2650.543738/s
     success_rate...................: 100.00% ✓ 318714      ✗ 0     
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

     checks.........................: 100.00% ✓ 919650      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=3.17µs   min=1.02µs  med=2.37µs  max=14.46ms  p(90)=3.61µs  p(95)=4.17µs  p(99.9)=33.16µs 
     http_req_connecting............: avg=310ns    min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.35ms  min=2.02ms  med=16.65ms max=289.49ms p(90)=31.48ms p(95)=38.19ms p(99.9)=118.47ms
       { expected_response:true }...: avg=19.35ms  min=2.02ms  med=16.65ms max=289.49ms p(90)=31.48ms p(95)=38.19ms p(99.9)=118.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306650
     http_req_receiving.............: avg=581.75µs min=50.15µs med=93.15µs max=186.29ms p(90)=1.1ms   p(95)=1.99ms  p(99.9)=26.27ms 
     http_req_sending...............: avg=44.59µs  min=4.68µs  med=8.76µs  max=145.27ms p(90)=14.68µs p(95)=85.69µs p(99.9)=4.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.72ms  min=1.89ms  med=16.1ms  max=288.93ms p(90)=30.51ms p(95)=37.07ms p(99.9)=116.89ms
     http_reqs......................: 306650  2549.702396/s
     iteration_duration.............: avg=19.56ms  min=2.84ms  med=16.84ms max=308.74ms p(90)=31.69ms p(95)=38.44ms p(99.9)=119.42ms
     iterations.....................: 306550  2548.870927/s
     success_rate...................: 100.00% ✓ 306550      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 917955      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=3.15µs   min=861ns   med=1.9µs   max=17.75ms  p(90)=3.16µs  p(95)=3.74µs  p(99.9)=27.63µs 
     http_req_connecting............: avg=775ns    min=0s      med=0s      max=8.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.39ms  min=2.03ms  med=16.67ms max=322.62ms p(90)=31.49ms p(95)=38.23ms p(99.9)=124.45ms
       { expected_response:true }...: avg=19.39ms  min=2.03ms  med=16.67ms max=322.62ms p(90)=31.49ms p(95)=38.23ms p(99.9)=124.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306085
     http_req_receiving.............: avg=584.04µs min=49.87µs med=90.61µs max=144.11ms p(90)=1.11ms  p(95)=2ms     p(99.9)=25.71ms 
     http_req_sending...............: avg=40.85µs  min=4.6µs   med=8.16µs  max=152.72ms p(90)=14.44µs p(95)=74.99µs p(99.9)=3.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.77ms  min=1.89ms  med=16.12ms max=322.52ms p(90)=30.47ms p(95)=37.15ms p(99.9)=122.48ms
     http_reqs......................: 306085  2545.378208/s
     iteration_duration.............: avg=19.6ms   min=3.06ms  med=16.86ms max=334.75ms p(90)=31.7ms  p(95)=38.46ms p(99.9)=124.74ms
     iterations.....................: 305985  2544.546616/s
     success_rate...................: 100.00% ✓ 305985      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 880269      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=2.76µs   min=781ns   med=2µs     max=13.94ms  p(90)=3.25µs  p(95)=3.87µs  p(99.9)=31.83µs 
     http_req_connecting............: avg=297ns    min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.22ms  min=1.67ms  med=16.53ms max=350.73ms p(90)=34.02ms p(95)=42.8ms  p(99.9)=167.2ms 
       { expected_response:true }...: avg=20.22ms  min=1.67ms  med=16.53ms max=350.73ms p(90)=34.02ms p(95)=42.8ms  p(99.9)=167.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 293523
     http_req_receiving.............: avg=573.66µs min=50.87µs med=90.97µs max=162.29ms p(90)=1.05ms  p(95)=1.86ms  p(99.9)=28.99ms 
     http_req_sending...............: avg=40.03µs  min=4.58µs  med=8.48µs  max=154.74ms p(90)=15.16µs p(95)=72.53µs p(99.9)=2.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.61ms  min=1.6ms   med=16.01ms max=350.55ms p(90)=33.02ms p(95)=41.66ms p(99.9)=165.62ms
     http_reqs......................: 293523  2441.496472/s
     iteration_duration.............: avg=20.43ms  min=2.34ms  med=16.73ms max=350.93ms p(90)=34.24ms p(95)=43.03ms p(99.9)=168.45ms
     iterations.....................: 293423  2440.664682/s
     success_rate...................: 100.00% ✓ 293423      ✗ 0     
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

     checks.........................: 100.00% ✓ 767337      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=3.37µs  min=1.03µs  med=2.61µs  max=12.14ms  p(90)=4.21µs  p(95)=4.98µs  p(99.9)=36.61µs
     http_req_connecting............: avg=325ns   min=0s      med=0s      max=3.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=23.23ms min=1.77ms  med=23.01ms max=302.36ms p(90)=27.52ms p(95)=29.24ms p(99.9)=47.18ms
       { expected_response:true }...: avg=23.23ms min=1.77ms  med=23.01ms max=302.36ms p(90)=27.52ms p(95)=29.24ms p(99.9)=47.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 255879
     http_req_receiving.............: avg=86.53µs min=27.51µs med=56.2µs  max=180.62ms p(90)=94.72µs p(95)=120.3µs p(99.9)=5.01ms 
     http_req_sending...............: avg=38.42µs min=4.84µs  med=10.17µs max=192.26ms p(90)=16.87µs p(95)=27.27µs p(99.9)=1.71ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=23.1ms  min=1.68ms  med=22.91ms max=293.66ms p(90)=27.39ms p(95)=29.08ms p(99.9)=46.11ms
     http_reqs......................: 255879  2128.355271/s
     iteration_duration.............: avg=23.44ms min=4.16ms  med=23.21ms max=317.7ms  p(90)=27.72ms p(95)=29.45ms p(99.9)=47.7ms 
     iterations.....................: 255779  2127.523489/s
     success_rate...................: 100.00% ✓ 255779      ✗ 0     
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

     checks.........................: 100.00% ✓ 476736      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3.44µs  min=1.05µs  med=2.54µs  max=4.01ms   p(90)=4µs     p(95)=4.66µs   p(99.9)=35.97µs
     http_req_connecting............: avg=577ns   min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.51ms min=1.96ms  med=37.14ms max=303.54ms p(90)=52.3ms  p(95)=56.86ms  p(99.9)=79.36ms
       { expected_response:true }...: avg=37.51ms min=1.96ms  med=37.14ms max=303.54ms p(90)=52.3ms  p(95)=56.86ms  p(99.9)=79.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159012
     http_req_receiving.............: avg=75.03µs min=25.66µs med=60.71µs max=71.23ms  p(90)=97.74µs p(95)=114.17µs p(99.9)=1.09ms 
     http_req_sending...............: avg=27.55µs min=4.75µs  med=10.95µs max=207.01ms p(90)=17.4µs  p(95)=21.5µs   p(99.9)=1.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.41ms min=1.9ms   med=37.04ms max=302.87ms p(90)=52.19ms p(95)=56.74ms  p(99.9)=79.1ms 
     http_reqs......................: 159012  1322.154667/s
     iteration_duration.............: avg=37.74ms min=3.68ms  med=37.35ms max=312.97ms p(90)=52.51ms p(95)=57.07ms  p(99.9)=79.91ms
     iterations.....................: 158912  1321.323186/s
     success_rate...................: 100.00% ✓ 158912      ✗ 0     
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

     checks.........................: 100.00% ✓ 225273     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   750 kB/s
     http_req_blocked...............: avg=4.54µs  min=1.16µs  med=3.02µs  max=3.5ms    p(90)=4.5µs    p(95)=5.14µs   p(99.9)=42.39µs 
     http_req_connecting............: avg=1.25µs  min=0s      med=0s      max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.57ms min=3.57ms  med=77.73ms max=316.88ms p(90)=99.22ms  p(95)=109.14ms p(99.9)=188.82ms
       { expected_response:true }...: avg=79.57ms min=3.57ms  med=77.73ms max=316.88ms p(90)=99.22ms  p(95)=109.14ms p(99.9)=188.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75191
     http_req_receiving.............: avg=79.5µs  min=29.99µs med=70.51µs max=43.9ms   p(90)=105.58µs p(95)=118.13µs p(99.9)=632.84µs
     http_req_sending...............: avg=18.91µs min=5.42µs  med=13.45µs max=31.67ms  p(90)=20.35µs  p(95)=22.69µs  p(99.9)=609.75µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.47ms min=3.52ms  med=77.63ms max=316.34ms p(90)=99.13ms  p(95)=109.03ms p(99.9)=188.7ms 
     http_reqs......................: 75191   624.090896/s
     iteration_duration.............: avg=79.91ms min=20.02ms med=77.97ms max=327.48ms p(90)=99.45ms  p(95)=109.41ms p(99.9)=190.5ms 
     iterations.....................: 75091   623.260888/s
     success_rate...................: 100.00% ✓ 75091      ✗ 0    
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

     checks.........................: 100.00% ✓ 175719     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 71 MB   584 kB/s
     http_req_blocked...............: avg=5.24µs   min=1.27µs  med=3.43µs   max=3.79ms   p(90)=4.88µs   p(95)=5.48µs   p(99.9)=58.25µs 
     http_req_connecting............: avg=1.59µs   min=0s      med=0s       max=3.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.02ms min=4.69ms  med=101.85ms max=348.8ms  p(90)=122.97ms p(95)=129.29ms p(99.9)=159.8ms 
       { expected_response:true }...: avg=102.02ms min=4.69ms  med=101.85ms max=348.8ms  p(90)=122.97ms p(95)=129.29ms p(99.9)=159.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 58673
     http_req_receiving.............: avg=150.73µs min=30.93µs med=77.96µs  max=239.77ms p(90)=111.02µs p(95)=124.01µs p(99.9)=675.99µs
     http_req_sending...............: avg=25.26µs  min=5.44µs  med=15.58µs  max=82.79ms  p(90)=21.35µs  p(95)=23.29µs  p(99.9)=558.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.85ms min=4.56ms  med=101.75ms max=328.04ms p(90)=122.82ms p(95)=129.1ms  p(99.9)=154.79ms
     http_reqs......................: 58673   486.560662/s
     iteration_duration.............: avg=102.45ms min=10.82ms med=102.12ms max=362.81ms p(90)=123.22ms p(95)=129.57ms p(99.9)=161.37ms
     iterations.....................: 58573   485.731387/s
     success_rate...................: 100.00% ✓ 58573      ✗ 0    
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

     checks.........................: 100.00% ✓ 101805     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   338 kB/s
     http_req_blocked...............: avg=5.87µs   min=1.07µs  med=2.73µs   max=3.51ms   p(90)=3.94µs   p(95)=4.44µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=2.96µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=176.12ms min=7.46ms  med=177.34ms max=406.93ms p(90)=185.68ms p(95)=189.37ms p(99.9)=275.15ms
       { expected_response:true }...: avg=176.12ms min=7.46ms  med=177.34ms max=406.93ms p(90)=185.68ms p(95)=189.37ms p(99.9)=275.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34035
     http_req_receiving.............: avg=79.33µs  min=30.79µs med=74.46µs  max=20.8ms   p(90)=104.91µs p(95)=115.89µs p(99.9)=347.21µs
     http_req_sending...............: avg=37.01µs  min=5.19µs  med=14.24µs  max=126.9ms  p(90)=19.11µs  p(95)=20.65µs  p(99.9)=469.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.01ms min=7.34ms  med=177.24ms max=406.46ms p(90)=185.57ms p(95)=189.25ms p(99.9)=275.06ms
     http_reqs......................: 34035   281.474225/s
     iteration_duration.............: avg=176.89ms min=34.79ms med=177.64ms max=415.81ms p(90)=185.92ms p(95)=189.63ms p(99.9)=281.66ms
     iterations.....................: 33935   280.647211/s
     success_rate...................: 100.00% ✓ 33935      ✗ 0    
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

     checks.........................: 100.00% ✓ 101271     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.69µs   min=1.24µs  med=3.86µs   max=3.5ms    p(90)=5.35µs   p(95)=5.95µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=2.56µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=177.03ms min=5.67ms  med=162.28ms max=706.45ms p(90)=206.25ms p(95)=243.88ms p(99.9)=555.34ms
       { expected_response:true }...: avg=177.03ms min=5.67ms  med=162.28ms max=706.45ms p(90)=206.25ms p(95)=243.88ms p(99.9)=555.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33857
     http_req_receiving.............: avg=95.28µs  min=38.16µs med=91.64µs  max=10.4ms   p(90)=121.91µs p(95)=133.18µs p(99.9)=662.76µs
     http_req_sending...............: avg=28.18µs  min=6.12µs  med=19.04µs  max=59.49ms  p(90)=23.81µs  p(95)=25.7µs   p(99.9)=543.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.91ms min=5.49ms  med=162.17ms max=706.32ms p(90)=206.11ms p(95)=243.76ms p(99.9)=555.17ms
     http_reqs......................: 33857   280.274781/s
     iteration_duration.............: avg=177.83ms min=27.9ms  med=162.64ms max=706.74ms p(90)=206.63ms p(95)=244.72ms p(99.9)=555.67ms
     iterations.....................: 33757   279.446962/s
     success_rate...................: 100.00% ✓ 33757      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 928608      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=7.05µs   min=821ns   med=1.93µs  max=97.92ms  p(90)=3.45µs  p(95)=4.18µs  p(99.9)=33.58µs
     http_req_connecting............: avg=4.48µs   min=0s      med=0s      max=97.82ms  p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.15ms  min=1.57ms  med=18.34ms max=251.35ms p(90)=27.66ms p(95)=31.2ms  p(99.9)=51.37ms
       { expected_response:true }...: avg=19.15ms  min=1.57ms  med=18.34ms max=251.35ms p(90)=27.66ms p(95)=31.2ms  p(99.9)=51.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309636
     http_req_receiving.............: avg=523.96µs min=50.89µs med=97.67µs max=117.21ms p(90)=1.32ms  p(95)=2.06ms  p(99.9)=17.8ms 
     http_req_sending...............: avg=44.41µs  min=4.54µs  med=8.36µs  max=107.17ms p(90)=17.33µs p(95)=83.72µs p(99.9)=4.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.58ms  min=1.44ms  med=17.78ms max=207.35ms p(90)=26.98ms p(95)=30.46ms p(99.9)=49.73ms
     http_reqs......................: 309636  2576.03586/s
     iteration_duration.............: avg=19.37ms  min=2.55ms  med=18.54ms max=295.05ms p(90)=27.87ms p(95)=31.42ms p(99.9)=51.91ms
     iterations.....................: 309536  2575.203903/s
     success_rate...................: 100.00% ✓ 309536      ✗ 0     
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

     checks.........................: 100.00% ✓ 922701      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=3.62µs  min=962ns   med=2.77µs  max=16.34ms  p(90)=4.39µs  p(95)=5.15µs   p(99.9)=37.7µs 
     http_req_connecting............: avg=313ns   min=0s      med=0s      max=3.73ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.27ms min=1.54ms  med=18.86ms max=289.24ms p(90)=26.92ms p(95)=29.54ms  p(99.9)=49.29ms
       { expected_response:true }...: avg=19.27ms min=1.54ms  med=18.86ms max=289.24ms p(90)=26.92ms p(95)=29.54ms  p(99.9)=49.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307667
     http_req_receiving.............: avg=95.71µs min=25.99µs med=51.83µs max=217.66ms p(90)=96.07µs p(95)=155.75µs p(99.9)=7.24ms 
     http_req_sending...............: avg=46.7µs  min=5.04µs  med=10.8µs  max=124.67ms p(90)=18.96µs p(95)=103.51µs p(99.9)=3.65ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.13ms min=1.5ms   med=18.74ms max=289.04ms p(90)=26.76ms p(95)=29.32ms  p(99.9)=48.33ms
     http_reqs......................: 307667  2559.535086/s
     iteration_duration.............: avg=19.49ms min=2.92ms  med=19.07ms max=307.27ms p(90)=27.13ms p(95)=29.77ms  p(99.9)=49.95ms
     iterations.....................: 307567  2558.703169/s
     success_rate...................: 100.00% ✓ 307567      ✗ 0     
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

     checks.........................: 100.00% ✓ 881157      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=3.63µs  min=972ns   med=2.67µs  max=18.69ms  p(90)=4.2µs   p(95)=4.91µs  p(99.9)=36.6µs  
     http_req_connecting............: avg=290ns   min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.19ms min=1.64ms  med=16.9ms  max=307.56ms p(90)=33.23ms p(95)=40.82ms p(99.9)=149.29ms
       { expected_response:true }...: avg=20.19ms min=1.64ms  med=16.9ms  max=307.56ms p(90)=33.23ms p(95)=40.82ms p(99.9)=149.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293819
     http_req_receiving.............: avg=577.4µs min=51.35µs med=97.17µs max=199.45ms p(90)=1.09ms  p(95)=1.93ms  p(99.9)=27.56ms 
     http_req_sending...............: avg=44.47µs min=4.33µs  med=9.87µs  max=172.45ms p(90)=18.24µs p(95)=93.87µs p(99.9)=3.49ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.57ms min=1.52ms  med=16.36ms max=307.49ms p(90)=32.24ms p(95)=39.69ms p(99.9)=147.71ms
     http_reqs......................: 293819  2444.10137/s
     iteration_duration.............: avg=20.41ms min=2.12ms  med=17.1ms  max=307.73ms p(90)=33.47ms p(95)=41.06ms p(99.9)=150.27ms
     iterations.....................: 293719  2443.269531/s
     success_rate...................: 100.00% ✓ 293719      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 862572      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.99µs  min=882ns   med=2.02µs  max=13.76ms  p(90)=3.4µs   p(95)=4.06µs  p(99.9)=34.56µs 
     http_req_connecting............: avg=304ns   min=0s      med=0s      max=3.33ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.64ms min=1.6ms   med=17.26ms max=360.84ms p(90)=33.93ms p(95)=41.47ms p(99.9)=149.7ms 
       { expected_response:true }...: avg=20.64ms min=1.6ms   med=17.26ms max=360.84ms p(90)=33.93ms p(95)=41.47ms p(99.9)=149.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 287624
     http_req_receiving.............: avg=614.7µs min=51.79µs med=94.46µs max=316.44ms p(90)=1.11ms  p(95)=1.93ms  p(99.9)=28.39ms 
     http_req_sending...............: avg=40.6µs  min=4.69µs  med=8.63µs  max=28.63ms  p(90)=16.04µs p(95)=73.22µs p(99.9)=3.91ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.99ms min=1.5ms   med=16.72ms max=360.74ms p(90)=32.91ms p(95)=40.33ms p(99.9)=144.28ms
     http_reqs......................: 287624  2392.458786/s
     iteration_duration.............: avg=20.86ms min=2.74ms  med=17.46ms max=361.04ms p(90)=34.15ms p(95)=41.71ms p(99.9)=150.38ms
     iterations.....................: 287524  2391.626985/s
     success_rate...................: 100.00% ✓ 287524      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 786609      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=2.89µs   min=822ns   med=2.18µs  max=8.76ms   p(90)=3.97µs  p(95)=4.73µs  p(99.9)=33.69µs 
     http_req_connecting............: avg=245ns    min=0s      med=0s      max=2.81ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.65ms  min=1.92ms  med=18.97ms max=335.52ms p(90)=36.97ms p(95)=45.82ms p(99.9)=162.84ms
       { expected_response:true }...: avg=22.65ms  min=1.92ms  med=18.97ms max=335.52ms p(90)=36.97ms p(95)=45.82ms p(99.9)=162.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262303
     http_req_receiving.............: avg=624.53µs min=51.59µs med=102.7µs max=197.79ms p(90)=1.17ms  p(95)=2ms     p(99.9)=28.79ms 
     http_req_sending...............: avg=40.3µs   min=4.62µs  med=9.22µs  max=201.54ms p(90)=19.04µs p(95)=42.27µs p(99.9)=2.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.99ms  min=1.78ms  med=18.38ms max=335.39ms p(90)=35.93ms p(95)=44.57ms p(99.9)=161.14ms
     http_reqs......................: 262303  2181.338454/s
     iteration_duration.............: avg=22.87ms  min=2.83ms  med=19.18ms max=335.7ms  p(90)=37.19ms p(95)=46.05ms p(99.9)=163.68ms
     iterations.....................: 262203  2180.506843/s
     success_rate...................: 100.00% ✓ 262203      ✗ 0     
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

     checks.........................: 100.00% ✓ 574662      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 230 MB  1.9 MB/s
     http_req_blocked...............: avg=3.43µs  min=881ns   med=2.28µs  max=6.27ms   p(90)=4.47µs   p(95)=5.56µs   p(99.9)=42.79µs
     http_req_connecting............: avg=496ns   min=0s      med=0s      max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.07ms min=2.36ms  med=30.51ms max=307.29ms p(90)=41.17ms  p(95)=44.65ms  p(99.9)=65.33ms
       { expected_response:true }...: avg=31.07ms min=2.36ms  med=30.51ms max=307.29ms p(90)=41.17ms  p(95)=44.65ms  p(99.9)=65.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 191654
     http_req_receiving.............: avg=94.78µs min=27.87µs med=55.76µs max=27.7ms   p(90)=127.12µs p(95)=211.02µs p(99.9)=3.65ms 
     http_req_sending...............: avg=40.17µs min=4.79µs  med=9.53µs  max=132.93ms p(90)=24.54µs  p(95)=110.36µs p(99.9)=2.8ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.93ms min=2.23ms  med=30.39ms max=307.02ms p(90)=41.02ms  p(95)=44.49ms  p(99.9)=64.92ms
     http_reqs......................: 191654  1593.011304/s
     iteration_duration.............: avg=31.31ms min=6.34ms  med=30.74ms max=320.34ms p(90)=41.39ms  p(95)=44.87ms  p(99.9)=66.04ms
     iterations.....................: 191554  1592.180113/s
     success_rate...................: 100.00% ✓ 191554      ✗ 0     
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

     checks.........................: 100.00% ✓ 429162      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.76µs  min=1.12µs  med=2.79µs  max=4.18ms   p(90)=4.26µs   p(95)=4.92µs   p(99.9)=37.4µs  
     http_req_connecting............: avg=676ns   min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.68ms min=2.11ms  med=41.32ms max=293.17ms p(90)=57.95ms  p(95)=63.04ms  p(99.9)=86.49ms 
       { expected_response:true }...: avg=41.68ms min=2.11ms  med=41.32ms max=293.17ms p(90)=57.95ms  p(95)=63.04ms  p(99.9)=86.49ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143154
     http_req_receiving.............: avg=80.12µs min=27.43µs med=66.86µs max=179.18ms p(90)=104.77µs p(95)=121.48µs p(99.9)=831.59µs
     http_req_sending...............: avg=25.28µs min=5.38µs  med=12.42µs max=105.43ms p(90)=18.76µs  p(95)=22.67µs  p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.58ms min=2.04ms  med=41.22ms max=292.78ms p(90)=57.85ms  p(95)=62.93ms  p(99.9)=86.27ms 
     http_reqs......................: 143154  1190.209192/s
     iteration_duration.............: avg=41.93ms min=4.21ms  med=41.54ms max=322.74ms p(90)=58.17ms  p(95)=63.26ms  p(99.9)=86.98ms 
     iterations.....................: 143054  1189.377773/s
     success_rate...................: 100.00% ✓ 143054      ✗ 0     
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

     checks.........................: 100.00% ✓ 207036     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   689 kB/s
     http_req_blocked...............: avg=4.61µs  min=1.07µs  med=3µs     max=4.08ms   p(90)=4.52µs   p(95)=5.19µs   p(99.9)=47.79µs 
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.58ms min=3.81ms  med=84.13ms max=336.23ms p(90)=107.14ms p(95)=118.87ms p(99.9)=208ms   
       { expected_response:true }...: avg=86.58ms min=3.81ms  med=84.13ms max=336.23ms p(90)=107.14ms p(95)=118.87ms p(99.9)=208ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 69112
     http_req_receiving.............: avg=88.27µs min=28.62µs med=74.45µs max=94.22ms  p(90)=111.55µs p(95)=125.79µs p(99.9)=723.54µs
     http_req_sending...............: avg=19.43µs min=4.88µs  med=14.29µs max=21.58ms  p(90)=20.82µs  p(95)=23.18µs  p(99.9)=600.33µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.47ms min=3.75ms  med=84.03ms max=311.4ms  p(90)=107.03ms p(95)=118.76ms p(99.9)=207.58ms
     http_reqs......................: 69112   573.481509/s
     iteration_duration.............: avg=86.95ms min=23.13ms med=84.39ms max=348.81ms p(90)=107.4ms  p(95)=119.14ms p(99.9)=210.85ms
     iterations.....................: 69012   572.651723/s
     success_rate...................: 100.00% ✓ 69012      ✗ 0    
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

     checks.........................: 100.00% ✓ 146586     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   487 kB/s
     http_req_blocked...............: avg=5.48µs   min=1.37µs  med=3.43µs   max=3.97ms   p(90)=4.89µs   p(95)=5.48µs   p(99.9)=229.32µs
     http_req_connecting............: avg=1.79µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=101.84µs
     http_req_duration..............: avg=122.3ms  min=5.34ms  med=119.94ms max=327.08ms p(90)=161.5ms  p(95)=173.96ms p(99.9)=222.85ms
       { expected_response:true }...: avg=122.3ms  min=5.34ms  med=119.94ms max=327.08ms p(90)=161.5ms  p(95)=173.96ms p(99.9)=222.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48962
     http_req_receiving.............: avg=90.79µs  min=30.1µs  med=80.82µs  max=137.12ms p(90)=112.46µs p(95)=124.85µs p(99.9)=519.48µs
     http_req_sending...............: avg=26.96µs  min=5.75µs  med=16.69µs  max=112.28ms p(90)=22.33µs  p(95)=24.13µs  p(99.9)=579.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.18ms min=5.21ms  med=119.83ms max=326.99ms p(90)=161.38ms p(95)=173.87ms p(99.9)=222.5ms 
     http_reqs......................: 48962   405.767369/s
     iteration_duration.............: avg=122.81ms min=32.13ms med=120.26ms max=336.58ms p(90)=161.81ms p(95)=174.26ms p(99.9)=224.98ms
     iterations.....................: 48862   404.938629/s
     success_rate...................: 100.00% ✓ 48862      ✗ 0    
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

     checks.........................: 100.00% ✓ 96999      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   322 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.07µs  med=3.18µs   max=3.89ms   p(90)=4.49µs   p(95)=5.03µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=2.67µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=184.83ms min=7.81ms  med=191.2ms  max=395.89ms p(90)=200.23ms p(95)=204.59ms p(99.9)=282.84ms
       { expected_response:true }...: avg=184.83ms min=7.81ms  med=191.2ms  max=395.89ms p(90)=200.23ms p(95)=204.59ms p(99.9)=282.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32433
     http_req_receiving.............: avg=92.62µs  min=31.08µs med=85.95µs  max=96.7ms   p(90)=115.77µs p(95)=126.75µs p(99.9)=487.74µs
     http_req_sending...............: avg=38.9µs   min=5.4µs   med=16.54µs  max=220.91ms p(90)=21.02µs  p(95)=22.86µs  p(99.9)=536.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.7ms  min=7.7ms   med=191.09ms max=385.46ms p(90)=200.11ms p(95)=204.49ms p(99.9)=281.31ms
     http_reqs......................: 32433   268.065751/s
     iteration_duration.............: avg=185.67ms min=32.83ms med=191.5ms  max=405.73ms p(90)=200.51ms p(95)=204.89ms p(99.9)=285.31ms
     iterations.....................: 32333   267.239229/s
     success_rate...................: 100.00% ✓ 32333      ✗ 0    
     vus............................: 1       min=1        max=50 
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

     checks.........................: 100.00% ✓ 95784      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=7.59µs   min=1.56µs  med=3.66µs   max=4.16ms   p(90)=5.07µs   p(95)=5.7µs    p(99.9)=1.93ms  
     http_req_connecting............: avg=3.44µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=187.14ms min=5.97ms  med=173.43ms max=679.14ms p(90)=221.99ms p(95)=273.22ms p(99.9)=566.83ms
       { expected_response:true }...: avg=187.14ms min=5.97ms  med=173.43ms max=679.14ms p(90)=221.99ms p(95)=273.22ms p(99.9)=566.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32028
     http_req_receiving.............: avg=104.8µs  min=36.49µs med=93.4µs   max=75.6ms   p(90)=125.87µs p(95)=140.2µs  p(99.9)=833.62µs
     http_req_sending...............: avg=28.04µs  min=6.49µs  med=18.86µs  max=62.75ms  p(90)=23.44µs  p(95)=25.33µs  p(99.9)=513.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.01ms min=5.83ms  med=173.31ms max=679.01ms p(90)=221.85ms p(95)=272.54ms p(99.9)=566.7ms 
     http_reqs......................: 32028   265.00005/s
     iteration_duration.............: avg=188.02ms min=42.88ms med=173.79ms max=679.41ms p(90)=222.36ms p(95)=275.28ms p(99.9)=567.13ms
     iterations.....................: 31928   264.172648/s
     success_rate...................: 100.00% ✓ 31928      ✗ 0    
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

     checks.........................: 100.00% ✓ 6333      ✗ 0   
     data_received..................: 212 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=56.9µs  min=1.1µs    med=3.03µs  max=5.59ms   p(90)=4.39µs   p(95)=5.12µs  p(99.9)=4.06ms  
     http_req_connecting............: avg=52.86µs min=0s       med=0s      max=5.4ms    p(90)=0s       p(95)=0s      p(99.9)=4.03ms  
     http_req_duration..............: avg=2.73s   min=37.14ms  med=2.79s   max=5.61s    p(90)=3.66s    p(95)=3.96s   p(99.9)=5.04s   
       { expected_response:true }...: avg=2.73s   min=37.14ms  med=2.79s   max=5.61s    p(90)=3.66s    p(95)=3.96s   p(99.9)=5.04s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2211
     http_req_receiving.............: avg=88.87µs min=33.29µs  med=85.52µs max=676.32µs p(90)=124.87µs p(95)=141µs   p(99.9)=391.52µs
     http_req_sending...............: avg=43.86µs min=5.81µs   med=17.13µs max=5.07ms   p(90)=22.57µs  p(95)=27.75µs p(99.9)=2.42ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.73s   min=36.79ms  med=2.79s   max=5.61s    p(90)=3.66s    p(95)=3.96s   p(99.9)=5.04s   
     http_reqs......................: 2211    17.498162/s
     iteration_duration.............: avg=2.86s   min=493.96ms med=2.82s   max=5.61s    p(90)=3.67s    p(95)=3.97s   p(99.9)=5.04s   
     iterations.....................: 2111    16.706748/s
     success_rate...................: 100.00% ✓ 2111      ✗ 0   
     vus............................: 19      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

