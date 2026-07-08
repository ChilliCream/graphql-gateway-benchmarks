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
| hive-router | v0.0.78 | 2,987 | 3,258 | 2,931 | 3.6% |  |
| fusion-nightly | 16.5.0-p.5 | 2,381 | 2,461 | 2,371 | 1.4% |  |
| fusion | 16.4.0 | 2,377 | 2,453 | 2,370 | 1.2% |  |
| fusion-nightly-net11 | 16.5.0-p.5 | 2,333 | 2,424 | 2,312 | 1.6% |  |
| grafbase | 0.53.5 | 2,166 | 2,282 | 2,151 | 2.0% |  |
| cosmo | 0.329.0 | 1,289 | 1,312 | 1,265 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.2 | 618 | 641 | 616 | 1.5% |  |
| apollo-router | v2.16.0 | 494 | 511 | 492 | 1.5% |  |
| apollo-gateway | 2.14.2 | 281 | 285 | 279 | 0.7% |  |
| hive-gateway | 2.10.2 | 281 | 290 | 280 | 1.3% |  |
| feddi | 77271dc84a06 | — | — | — | — | non-compatible response (1497 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,433 | 2,591 | 2,368 | 3.2% |  |
| fusion-nightly-net11 | 16.5.0-p.5 | 2,290 | 2,367 | 2,284 | 1.3% |  |
| fusion | 16.4.0 | 2,255 | 2,338 | 2,249 | 1.4% |  |
| fusion-nightly | 16.5.0-p.5 | 2,187 | 2,279 | 2,168 | 1.7% |  |
| fusion-nightly-fed | 16.5.0-p.5 | 2,107 | 2,190 | 2,103 | 1.4% |  |
| grafbase | 0.53.5 | 1,655 | 1,713 | 1,645 | 1.4% |  |
| cosmo | 0.329.0 | 1,189 | 1,236 | 1,176 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.2 | 580 | 598 | 572 | 1.4% |  |
| apollo-router | v2.16.0 | 449 | 470 | 446 | 2.0% |  |
| apollo-gateway | 2.14.2 | 271 | 274 | 268 | 0.6% |  |
| hive-gateway | 2.10.2 | 267 | 275 | 265 | 1.3% |  |
| feddi | 77271dc84a06 | 21 | 22 | 20 | 2.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1076946     ✗ 0     
     data_received..................: 32 GB   262 MB/s
     data_sent......................: 432 MB  3.6 MB/s
     http_req_blocked...............: avg=2.58µs  min=862ns   med=1.92µs  max=4.94ms   p(90)=3.16µs  p(95)=3.77µs   p(99.9)=31.05µs
     http_req_connecting............: avg=281ns   min=0s      med=0s      max=3.6ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.5ms  min=1.49ms  med=15.84ms max=281.88ms p(90)=24.07ms p(95)=27.1ms   p(99.9)=46.71ms
       { expected_response:true }...: avg=16.5ms  min=1.49ms  med=15.84ms max=281.88ms p(90)=24.07ms p(95)=27.1ms   p(99.9)=46.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 359082
     http_req_receiving.............: avg=82.16µs min=25.12µs med=45.94µs max=112.21ms p(90)=81.45µs p(95)=132.41µs p(99.9)=6.45ms 
     http_req_sending...............: avg=43.27µs min=4.56µs  med=8.18µs  max=80.74ms  p(90)=13.99µs p(95)=84.36µs  p(99.9)=4.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.38ms min=1.44ms  med=15.73ms max=281.5ms  p(90)=23.91ms p(95)=26.9ms   p(99.9)=45.92ms
     http_reqs......................: 359082  2987.5995/s
     iteration_duration.............: avg=16.7ms  min=2.01ms  med=16.02ms max=306.13ms p(90)=24.26ms p(95)=27.32ms  p(99.9)=47.36ms
     iterations.....................: 358982  2986.767489/s
     success_rate...................: 100.00% ✓ 358982      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 858966      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.66µs   min=872ns   med=1.9µs   max=13.93ms  p(90)=3.06µs  p(95)=3.63µs  p(99.9)=27.58µs 
     http_req_connecting............: avg=295ns    min=0s      med=0s      max=3.28ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.74ms  min=2.11ms  med=17.65ms max=309.4ms  p(90)=33.68ms p(95)=41.07ms p(99.9)=144.62ms
       { expected_response:true }...: avg=20.74ms  min=2.11ms  med=17.65ms max=309.4ms  p(90)=33.68ms p(95)=41.07ms p(99.9)=144.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286422
     http_req_receiving.............: avg=605.09µs min=49.27µs med=89.89µs max=251.26ms p(90)=1.09ms  p(95)=1.93ms  p(99.9)=28.02ms 
     http_req_sending...............: avg=38.82µs  min=4.54µs  med=8.12µs  max=171.01ms p(90)=13.83µs p(95)=54.14µs p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.1ms   min=1.98ms  med=17.12ms max=308.79ms p(90)=32.71ms p(95)=39.84ms p(99.9)=142.96ms
     http_reqs......................: 286422  2381.45453/s
     iteration_duration.............: avg=20.94ms  min=3.26ms  med=17.85ms max=321.36ms p(90)=33.89ms p(95)=41.31ms p(99.9)=144.92ms
     iterations.....................: 286322  2380.623081/s
     success_rate...................: 100.00% ✓ 286322      ✗ 0     
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

     checks.........................: 100.00% ✓ 857541      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.56µs   min=851ns   med=1.85µs  max=15.07ms  p(90)=3.03µs  p(95)=3.61µs  p(99.9)=26.61µs 
     http_req_connecting............: avg=332ns    min=0s      med=0s      max=3.7ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.77ms  min=2.06ms  med=17.73ms max=287.67ms p(90)=33.68ms p(95)=40.87ms p(99.9)=142.36ms
       { expected_response:true }...: avg=20.77ms  min=2.06ms  med=17.73ms max=287.67ms p(90)=33.68ms p(95)=40.87ms p(99.9)=142.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285947
     http_req_receiving.............: avg=591.47µs min=51.06µs med=90.28µs max=189.07ms p(90)=1.07ms  p(95)=1.89ms  p(99.9)=27.27ms 
     http_req_sending...............: avg=36.67µs  min=4.51µs  med=8.09µs  max=105.25ms p(90)=14.15µs p(95)=31.96µs p(99.9)=2.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.14ms  min=1.95ms  med=17.2ms  max=287.58ms p(90)=32.69ms p(95)=39.74ms p(99.9)=140.39ms
     http_reqs......................: 285947  2377.751936/s
     iteration_duration.............: avg=20.98ms  min=3.25ms  med=17.92ms max=307.56ms p(90)=33.9ms  p(95)=41.09ms p(99.9)=143.23ms
     iterations.....................: 285847  2376.9204/s
     success_rate...................: 100.00% ✓ 285847      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 841698      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=3.02µs   min=1µs     med=2.39µs   max=11.85ms  p(90)=3.64µs  p(95)=4.22µs  p(99.9)=34.57µs
     http_req_connecting............: avg=202ns    min=0s      med=0s       max=2.69ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=21.16ms  min=2.01ms  med=20.22ms  max=297.23ms p(90)=30.86ms p(95)=34.65ms p(99.9)=55.84ms
       { expected_response:true }...: avg=21.16ms  min=2.01ms  med=20.22ms  max=297.23ms p(90)=30.86ms p(95)=34.65ms p(99.9)=55.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280666
     http_req_receiving.............: avg=795.27µs min=51.69µs med=160.67µs max=262.95ms p(90)=1.83ms  p(95)=2.72ms  p(99.9)=20.76ms
     http_req_sending...............: avg=39.13µs  min=4.82µs  med=9.06µs   max=73.65ms  p(90)=15.08µs p(95)=79.88µs p(99.9)=3.03ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=20.33ms  min=1.91ms  med=19.41ms  max=143.7ms  p(90)=29.9ms  p(95)=33.61ms p(99.9)=53.05ms
     http_reqs......................: 280666  2333.88166/s
     iteration_duration.............: avg=21.37ms  min=3.2ms   med=20.42ms  max=313.43ms p(90)=31.07ms p(95)=34.87ms p(99.9)=56.43ms
     iterations.....................: 280566  2333.050109/s
     success_rate...................: 100.00% ✓ 280566      ✗ 0     
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

     checks.........................: 100.00% ✓ 781158      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.43µs  min=1.03µs  med=2.59µs  max=15.22ms  p(90)=4.11µs  p(95)=4.84µs   p(99.9)=38.18µs
     http_req_connecting............: avg=331ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.81ms min=1.7ms   med=22.59ms max=287.81ms p(90)=27.16ms p(95)=28.96ms  p(99.9)=48.12ms
       { expected_response:true }...: avg=22.81ms min=1.7ms   med=22.59ms max=287.81ms p(90)=27.16ms p(95)=28.96ms  p(99.9)=48.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260486
     http_req_receiving.............: avg=90.85µs min=26.82µs med=56.67µs max=134.46ms p(90)=94.16µs p(95)=121.13µs p(99.9)=6.17ms 
     http_req_sending...............: avg=37.12µs min=4.98µs  med=10.13µs max=116.27ms p(90)=16.61µs p(95)=30.29µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.69ms min=1.64ms  med=22.48ms max=287.2ms  p(90)=27.03ms p(95)=28.77ms  p(99.9)=47.1ms 
     http_reqs......................: 260486  2166.741485/s
     iteration_duration.............: avg=23.03ms min=3.76ms  med=22.78ms max=307.61ms p(90)=27.37ms p(95)=29.17ms  p(99.9)=48.82ms
     iterations.....................: 260386  2165.909678/s
     success_rate...................: 100.00% ✓ 260386      ✗ 0     
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

     checks.........................: 100.00% ✓ 464895      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=4.04µs  min=922ns   med=1.94µs  max=8.66ms   p(90)=3.25µs  p(95)=3.84µs   p(99.9)=25.39µs 
     http_req_connecting............: avg=1.77µs  min=0s      med=0s      max=8.09ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.48ms min=2.03ms  med=38.1ms  max=290.75ms p(90)=53.95ms p(95)=58.69ms  p(99.9)=81.51ms 
       { expected_response:true }...: avg=38.48ms min=2.03ms  med=38.1ms  max=290.75ms p(90)=53.95ms p(95)=58.69ms  p(99.9)=81.51ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 155065
     http_req_receiving.............: avg=66.61µs min=27.04µs med=56.27µs max=16.32ms  p(90)=89.37µs p(95)=103.68µs p(99.9)=731.21µs
     http_req_sending...............: avg=22.83µs min=4.69µs  med=9.27µs  max=150.55ms p(90)=15.1µs  p(95)=18.86µs  p(99.9)=904.5µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.39ms min=1.97ms  med=38.02ms max=289.79ms p(90)=53.86ms p(95)=58.59ms  p(99.9)=81ms    
     http_reqs......................: 155065  1289.289824/s
     iteration_duration.............: avg=38.71ms min=3.39ms  med=38.3ms  max=308.56ms p(90)=54.14ms p(95)=58.88ms  p(99.9)=82.07ms 
     iterations.....................: 154965  1288.458372/s
     success_rate...................: 100.00% ✓ 154965      ✗ 0     
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

     checks.........................: 100.00% ✓ 223308     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 90 MB   743 kB/s
     http_req_blocked...............: avg=3.38µs  min=1.04µs med=2.4µs   max=2.85ms   p(90)=3.93µs   p(95)=4.53µs   p(99.9)=46.82µs 
     http_req_connecting............: avg=658ns   min=0s     med=0s      max=2.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.28ms min=3.6ms  med=78.16ms max=286.56ms p(90)=99.49ms  p(95)=109.52ms p(99.9)=189.52ms
       { expected_response:true }...: avg=80.28ms min=3.6ms  med=78.16ms max=286.56ms p(90)=99.49ms  p(95)=109.52ms p(99.9)=189.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74536
     http_req_receiving.............: avg=80.7µs  min=28.8µs med=67.37µs max=96.99ms  p(90)=103.96µs p(95)=117.17µs p(99.9)=616.04µs
     http_req_sending...............: avg=23.8µs  min=5.05µs med=12.14µs max=112.01ms p(90)=19.37µs  p(95)=21.39µs  p(99.9)=559.73µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.17ms min=3.54ms med=78.06ms max=270.24ms p(90)=99.39ms  p(95)=109.4ms  p(99.9)=189.22ms
     http_reqs......................: 74536   618.667864/s
     iteration_duration.............: avg=80.62ms min=18.5ms med=78.41ms max=297.93ms p(90)=99.74ms  p(95)=109.79ms p(99.9)=191.56ms
     iterations.....................: 74436   617.837838/s
     success_rate...................: 100.00% ✓ 74436      ✗ 0    
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

     checks.........................: 100.00% ✓ 178704     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 72 MB   594 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.29µs  med=3.54µs   max=6.08ms   p(90)=5.02µs   p(95)=5.61µs   p(99.9)=55.7µs  
     http_req_connecting............: avg=1.73µs   min=0s      med=0s       max=6.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=100.32ms min=4.62ms  med=100.16ms max=304.81ms p(90)=120.82ms p(95)=127.11ms p(99.9)=155.45ms
       { expected_response:true }...: avg=100.32ms min=4.62ms  med=100.16ms max=304.81ms p(90)=120.82ms p(95)=127.11ms p(99.9)=155.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59668
     http_req_receiving.............: avg=88.41µs  min=34.16µs med=79.96µs  max=88.77ms  p(90)=111.96µs p(95)=125.09µs p(99.9)=594.71µs
     http_req_sending...............: avg=25.79µs  min=5.34µs  med=16.59µs  max=124.4ms  p(90)=22.07µs  p(95)=24.09µs  p(99.9)=635.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.2ms  min=4.45ms  med=100.05ms max=304.15ms p(90)=120.71ms p(95)=127ms    p(99.9)=155.13ms
     http_reqs......................: 59668   494.867772/s
     iteration_duration.............: avg=100.74ms min=24.27ms med=100.45ms max=317.94ms p(90)=121.09ms p(95)=127.39ms p(99.9)=156.77ms
     iterations.....................: 59568   494.038403/s
     success_rate...................: 100.00% ✓ 59568      ✗ 0    
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

     checks.........................: 100.00% ✓ 101949     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   338 kB/s
     http_req_blocked...............: avg=5.4µs    min=1.08µs  med=2.79µs   max=3.3ms    p(90)=3.99µs   p(95)=4.48µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=2.44µs   min=0s      med=0s       max=3.26ms   p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=175.88ms min=7.41ms  med=175.63ms max=399.12ms p(90)=185.67ms p(95)=189.69ms p(99.9)=258.85ms
       { expected_response:true }...: avg=175.88ms min=7.41ms  med=175.63ms max=399.12ms p(90)=185.67ms p(95)=189.69ms p(99.9)=258.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34083
     http_req_receiving.............: avg=85.05µs  min=28.24µs med=77.42µs  max=93.85ms  p(90)=106.55µs p(95)=118.09µs p(99.9)=545.46µs
     http_req_sending...............: avg=27.17µs  min=5.2µs   med=14.63µs  max=81.19ms  p(90)=18.9µs   p(95)=20.37µs  p(99.9)=519.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.77ms min=7.26ms  med=175.52ms max=399.03ms p(90)=185.57ms p(95)=189.56ms p(99.9)=258.39ms
     http_reqs......................: 34083   281.849922/s
     iteration_duration.............: avg=176.65ms min=57.13ms med=175.97ms max=405.43ms p(90)=185.92ms p(95)=189.95ms p(99.9)=267.25ms
     iterations.....................: 33983   281.02297/s
     success_rate...................: 100.00% ✓ 33983      ✗ 0    
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

     checks.........................: 100.00% ✓ 101883     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   338 kB/s
     http_req_blocked...............: avg=6.72µs   min=1.52µs  med=3.61µs   max=3.71ms   p(90)=5.04µs   p(95)=5.67µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=2.83µs   min=0s      med=0s       max=3.66ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=176ms    min=5.8ms   med=161.19ms max=751.34ms p(90)=209.93ms p(95)=246.87ms p(99.9)=593.21ms
       { expected_response:true }...: avg=176ms    min=5.8ms   med=161.19ms max=751.34ms p(90)=209.93ms p(95)=246.87ms p(99.9)=593.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34061
     http_req_receiving.............: avg=94.99µs  min=35.75µs med=90.41µs  max=37.28ms  p(90)=120.38µs p(95)=132.12µs p(99.9)=511.42µs
     http_req_sending...............: avg=30.98µs  min=6.2µs   med=18.27µs  max=78.32ms  p(90)=22.98µs  p(95)=24.76µs  p(99.9)=477.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.88ms min=5.66ms  med=161.08ms max=751.22ms p(90)=209.81ms p(95)=246.78ms p(99.9)=593.11ms
     http_reqs......................: 34061   281.385514/s
     iteration_duration.............: avg=176.79ms min=33.91ms med=161.58ms max=751.61ms p(90)=210.3ms  p(95)=248.08ms p(99.9)=593.55ms
     iterations.....................: 33961   280.559392/s
     success_rate...................: 100.00% ✓ 33961      ✗ 0    
     vus............................: 6       min=6        max=50 
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

     checks.........................: 100.00% ✓ 877398      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=3.29µs  min=1.05µs  med=2.6µs   max=4.88ms   p(90)=4.14µs  p(95)=4.87µs   p(99.9)=39.53µs
     http_req_connecting............: avg=300ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.28ms min=1.66ms  med=19.98ms max=257.34ms p(90)=28.3ms  p(95)=30.84ms  p(99.9)=50.25ms
       { expected_response:true }...: avg=20.28ms min=1.66ms  med=19.98ms max=257.34ms p(90)=28.3ms  p(95)=30.84ms  p(99.9)=50.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292566
     http_req_receiving.............: avg=91.56µs min=26.29µs med=53.94µs max=26.3ms   p(90)=93.96µs p(95)=130.16µs p(99.9)=6.82ms 
     http_req_sending...............: avg=43.06µs min=4.79µs  med=10.29µs max=207.38ms p(90)=17.36µs p(95)=84.58µs  p(99.9)=2.9ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.15ms min=1.57ms  med=19.86ms max=255.15ms p(90)=28.15ms p(95)=30.64ms  p(99.9)=49.24ms
     http_reqs......................: 292566  2433.526472/s
     iteration_duration.............: avg=20.5ms  min=3.29ms  med=20.18ms max=340.96ms p(90)=28.52ms p(95)=31.06ms  p(99.9)=50.82ms
     iterations.....................: 292466  2432.694685/s
     success_rate...................: 100.00% ✓ 292466      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 825783      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 331 MB  2.8 MB/s
     http_req_blocked...............: avg=2.96µs   min=901ns   med=2.03µs   max=23.13ms  p(90)=3.65µs  p(95)=4.41µs  p(99.9)=34.03µs
     http_req_connecting............: avg=299ns    min=0s      med=0s       max=3.23ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=21.57ms  min=1.58ms  med=20.72ms  max=275.89ms p(90)=31.08ms p(95)=34.76ms p(99.9)=55.59ms
       { expected_response:true }...: avg=21.57ms  min=1.58ms  med=20.72ms  max=275.89ms p(90)=31.08ms p(95)=34.76ms p(99.9)=55.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 275361
     http_req_receiving.............: avg=819.91µs min=51.32µs med=158.39µs max=128.55ms p(90)=2.01ms  p(95)=2.91ms  p(99.9)=19.35ms
     http_req_sending...............: avg=38.94µs  min=4.67µs  med=8.56µs   max=74.65ms  p(90)=18.41µs p(95)=66.55µs p(99.9)=2.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=20.71ms  min=1.51ms  med=19.85ms  max=275.33ms p(90)=30.08ms p(95)=33.68ms p(99.9)=54.06ms
     http_reqs......................: 275361  2290.66941/s
     iteration_duration.............: avg=21.78ms  min=3.55ms  med=20.93ms  max=293.6ms  p(90)=31.3ms  p(95)=34.99ms p(99.9)=55.95ms
     iterations.....................: 275261  2289.837532/s
     success_rate...................: 100.00% ✓ 275261      ✗ 0     
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

     checks.........................: 100.00% ✓ 813150      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 326 MB  2.7 MB/s
     http_req_blocked...............: avg=2.87µs   min=891ns   med=2.06µs  max=11.67ms  p(90)=3.68µs  p(95)=4.4µs   p(99.9)=33.79µs 
     http_req_connecting............: avg=332ns    min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.91ms  min=1.62ms  med=18.09ms max=437.56ms p(90)=36.1ms  p(95)=44.71ms p(99.9)=170.33ms
       { expected_response:true }...: avg=21.91ms  min=1.62ms  med=18.09ms max=437.56ms p(90)=36.1ms  p(95)=44.71ms p(99.9)=170.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 271150
     http_req_receiving.............: avg=622.01µs min=49.96µs med=96.52µs max=214.47ms p(90)=1.14ms  p(95)=1.95ms  p(99.9)=29.36ms 
     http_req_sending...............: avg=41.19µs  min=4.57µs  med=8.93µs  max=171.42ms p(90)=18.16µs p(95)=50.08µs p(99.9)=2.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.24ms  min=1.54ms  med=17.53ms max=437.47ms p(90)=35.02ms p(95)=43.47ms p(99.9)=167.2ms 
     http_reqs......................: 271150  2255.499676/s
     iteration_duration.............: avg=22.12ms  min=2.74ms  med=18.29ms max=437.8ms  p(90)=36.32ms p(95)=44.94ms p(99.9)=170.88ms
     iterations.....................: 271050  2254.667849/s
     success_rate...................: 100.00% ✓ 271050      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 788616      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 316 MB  2.6 MB/s
     http_req_blocked...............: avg=2.77µs   min=812ns  med=2.05µs   max=11.25ms  p(90)=3.51µs  p(95)=4.21µs  p(99.9)=28.35µs 
     http_req_connecting............: avg=317ns    min=0s     med=0s       max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.6ms   min=1.7ms  med=18.45ms  max=496.47ms p(90)=37.35ms p(95)=46.49ms p(99.9)=189.88ms
       { expected_response:true }...: avg=22.6ms   min=1.7ms  med=18.45ms  max=496.47ms p(90)=37.35ms p(95)=46.49ms p(99.9)=189.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262972
     http_req_receiving.............: avg=671.01µs min=51.5µs med=102.22µs max=247.21ms p(90)=1.18ms  p(95)=1.99ms  p(99.9)=30.94ms 
     http_req_sending...............: avg=36.27µs  min=4.57µs med=8.55µs   max=200.48ms p(90)=16.24µs p(95)=35.84µs p(99.9)=2.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.89ms  min=1.59ms med=17.86ms  max=495.04ms p(90)=36.17ms p(95)=45.07ms p(99.9)=188.04ms
     http_reqs......................: 262972  2187.476323/s
     iteration_duration.............: avg=22.81ms  min=2.66ms med=18.65ms  max=496.69ms p(90)=37.57ms p(95)=46.71ms p(99.9)=191.44ms
     iterations.....................: 262872  2186.644495/s
     success_rate...................: 100.00% ✓ 262872      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 760014      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.14µs  min=861ns   med=2.24µs  max=9.82ms   p(90)=4.06µs  p(95)=4.79µs  p(99.9)=35.1µs  
     http_req_connecting............: avg=353ns   min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.44ms min=2.06ms  med=19.43ms max=367.26ms p(90)=38.13ms p(95)=47.5ms  p(99.9)=172.33ms
       { expected_response:true }...: avg=23.44ms min=2.06ms  med=19.43ms max=367.26ms p(90)=38.13ms p(95)=47.5ms  p(99.9)=172.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253438
     http_req_receiving.............: avg=611.3µs min=50.09µs med=99.39µs max=218.05ms p(90)=1.13ms  p(95)=1.89ms  p(99.9)=29.8ms  
     http_req_sending...............: avg=38.93µs min=4.61µs  med=9.46µs  max=250.04ms p(90)=20.02µs p(95)=34.08µs p(99.9)=2.14ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.79ms min=1.92ms  med=18.87ms max=367.14ms p(90)=37.08ms p(95)=46.24ms p(99.9)=169.56ms
     http_reqs......................: 253438  2107.436592/s
     iteration_duration.............: avg=23.67ms min=3.22ms  med=19.64ms max=367.54ms p(90)=38.36ms p(95)=47.73ms p(99.9)=174.28ms
     iterations.....................: 253338  2106.605053/s
     success_rate...................: 100.00% ✓ 253338      ✗ 0     
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

     checks.........................: 100.00% ✓ 597162      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 239 MB  2.0 MB/s
     http_req_blocked...............: avg=3.3µs   min=872ns  med=2.2µs   max=5.44ms   p(90)=4.42µs   p(95)=5.52µs   p(99.9)=45.97µs
     http_req_connecting............: avg=459ns   min=0s     med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.89ms min=2.27ms med=29.27ms max=306.48ms p(90)=39ms     p(95)=42.34ms  p(99.9)=63.87ms
       { expected_response:true }...: avg=29.89ms min=2.27ms med=29.27ms max=306.48ms p(90)=39ms     p(95)=42.34ms  p(99.9)=63.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199154
     http_req_receiving.............: avg=94.46µs min=28.5µs med=56.65µs max=83.87ms  p(90)=124.97µs p(95)=192.08µs p(99.9)=3.76ms 
     http_req_sending...............: avg=43.02µs min=4.6µs  med=9.64µs  max=129.28ms p(90)=24.09µs  p(95)=102.28µs p(99.9)=3.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.75ms min=2.15ms med=29.14ms max=306.2ms  p(90)=38.84ms  p(95)=42.17ms  p(99.9)=63.06ms
     http_reqs......................: 199154  1655.741221/s
     iteration_duration.............: avg=30.13ms min=6.05ms med=29.48ms max=323.83ms p(90)=39.21ms  p(95)=42.57ms  p(99.9)=64.39ms
     iterations.....................: 199054  1654.909834/s
     success_rate...................: 100.00% ✓ 199054      ✗ 0     
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

     checks.........................: 100.00% ✓ 428787      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=5.13µs  min=1.2µs   med=3.05µs  max=11.26ms  p(90)=4.68µs   p(95)=5.4µs    p(99.9)=37.7µs  
     http_req_connecting............: avg=1.73µs  min=0s      med=0s      max=11.06ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.71ms min=2.17ms  med=41.32ms max=273.07ms p(90)=57.99ms  p(95)=63.03ms  p(99.9)=87.96ms 
       { expected_response:true }...: avg=41.71ms min=2.17ms  med=41.32ms max=273.07ms p(90)=57.99ms  p(95)=63.03ms  p(99.9)=87.96ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143029
     http_req_receiving.............: avg=81.62µs min=27.23µs med=69µs    max=96.92ms  p(90)=108.76µs p(95)=125.88µs p(99.9)=870.88µs
     http_req_sending...............: avg=27.58µs min=5.28µs  med=13.03µs max=142.22ms p(90)=19.89µs  p(95)=23.62µs  p(99.9)=931.8µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.6ms  min=2.09ms  med=41.22ms max=272.57ms p(90)=57.88ms  p(95)=62.91ms  p(99.9)=87.39ms 
     http_reqs......................: 143029  1189.061954/s
     iteration_duration.............: avg=41.97ms min=4.61ms  med=41.55ms max=301.55ms p(90)=58.22ms  p(95)=63.25ms  p(99.9)=88.51ms 
     iterations.....................: 142929  1188.23061/s
     success_rate...................: 100.00% ✓ 142929      ✗ 0     
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

     checks.........................: 100.00% ✓ 209475     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   697 kB/s
     http_req_blocked...............: avg=4.31µs  min=1.02µs  med=2.7µs   max=3.51ms   p(90)=4.16µs   p(95)=4.78µs   p(99.9)=48.21µs 
     http_req_connecting............: avg=1.34µs  min=0s      med=0s      max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.58ms min=3.9ms   med=82.42ms max=302.13ms p(90)=110.36ms p(95)=122.92ms p(99.9)=204.13ms
       { expected_response:true }...: avg=85.58ms min=3.9ms   med=82.42ms max=302.13ms p(90)=110.36ms p(95)=122.92ms p(99.9)=204.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69925
     http_req_receiving.............: avg=81.84µs min=28.96µs med=73.1µs  max=50.86ms  p(90)=109.85µs p(95)=122.89µs p(99.9)=650.71µs
     http_req_sending...............: avg=24.04µs min=4.81µs  med=13.62µs max=128.11ms p(90)=20.13µs  p(95)=22.26µs  p(99.9)=632.48µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.48ms min=3.76ms  med=82.32ms max=301.32ms p(90)=110.27ms p(95)=122.82ms p(99.9)=203.69ms
     http_reqs......................: 69925   580.102175/s
     iteration_duration.............: avg=85.94ms min=20.14ms med=82.68ms max=324.69ms p(90)=110.62ms p(95)=123.19ms p(99.9)=206.08ms
     iterations.....................: 69825   579.272569/s
     success_rate...................: 100.00% ✓ 69825      ✗ 0    
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

     checks.........................: 100.00% ✓ 162366     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   540 kB/s
     http_req_blocked...............: avg=5µs      min=1.05µs  med=3.18µs   max=3.83ms   p(90)=4.65µs   p(95)=5.23µs   p(99.9)=104.56µs
     http_req_connecting............: avg=1.6µs    min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.41ms min=5.06ms  med=108.24ms max=307.77ms p(90)=146.48ms p(95)=157.38ms p(99.9)=201.06ms
       { expected_response:true }...: avg=110.41ms min=5.06ms  med=108.24ms max=307.77ms p(90)=146.48ms p(95)=157.38ms p(99.9)=201.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54222
     http_req_receiving.............: avg=85.98µs  min=28.4µs  med=80.77µs  max=116.71ms p(90)=111.81µs p(95)=124.07µs p(99.9)=583.3µs 
     http_req_sending...............: avg=22.3µs   min=5.39µs  med=16.8µs   max=79.03ms  p(90)=22.16µs  p(95)=23.98µs  p(99.9)=512.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.3ms  min=4.98ms  med=108.13ms max=307.55ms p(90)=146.36ms p(95)=157.29ms p(99.9)=200.52ms
     http_reqs......................: 54222   449.403752/s
     iteration_duration.............: avg=110.88ms min=28.12ms med=108.56ms max=317.42ms p(90)=146.77ms p(95)=157.72ms p(99.9)=204.64ms
     iterations.....................: 54122   448.57493/s
     success_rate...................: 100.00% ✓ 54122      ✗ 0    
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

     checks.........................: 100.00% ✓ 98304      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   326 kB/s
     http_req_blocked...............: avg=6.81µs   min=1.29µs  med=3.63µs   max=3.68ms   p(90)=5.12µs   p(95)=5.73µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=2.88µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=182.37ms min=7.76ms  med=183.8ms  max=388.81ms p(90)=217.28ms p(95)=222.62ms p(99.9)=290.31ms
       { expected_response:true }...: avg=182.37ms min=7.76ms  med=183.8ms  max=388.81ms p(90)=217.28ms p(95)=222.62ms p(99.9)=290.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32868
     http_req_receiving.............: avg=97.08µs  min=31.13µs med=90.51µs  max=97.82ms  p(90)=121.48µs p(95)=133.9µs  p(99.9)=494.76µs
     http_req_sending...............: avg=30.2µs   min=5.2µs   med=18.61µs  max=74.96ms  p(90)=23.67µs  p(95)=25.78µs  p(99.9)=577.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.24ms min=7.66ms  med=183.68ms max=388.71ms p(90)=217.14ms p(95)=222.5ms  p(99.9)=289.82ms
     http_reqs......................: 32868   271.686086/s
     iteration_duration.............: avg=183.21ms min=39.82ms med=184.22ms max=394.5ms  p(90)=217.58ms p(95)=222.91ms p(99.9)=297.11ms
     iterations.....................: 32768   270.859489/s
     success_rate...................: 100.00% ✓ 32768      ✗ 0    
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

     checks.........................: 100.00% ✓ 96771      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.65µs   min=1.17µs  med=3.71µs   max=3.6ms    p(90)=5.18µs   p(95)=5.8µs    p(99.9)=1.29ms  
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=185.29ms min=5.88ms  med=170.74ms max=589.23ms p(90)=215.49ms p(95)=260.15ms p(99.9)=546.98ms
       { expected_response:true }...: avg=185.29ms min=5.88ms  med=170.74ms max=589.23ms p(90)=215.49ms p(95)=260.15ms p(99.9)=546.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32357
     http_req_receiving.............: avg=157.08µs min=31.98µs med=91.26µs  max=154.4ms  p(90)=122.07µs p(95)=134.94µs p(99.9)=2.99ms  
     http_req_sending...............: avg=28.44µs  min=5.68µs  med=18.95µs  max=76.71ms  p(90)=23.71µs  p(95)=25.75µs  p(99.9)=601.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.11ms min=5.78ms  med=170.64ms max=589.11ms p(90)=215.21ms p(95)=257.78ms p(99.9)=546.84ms
     http_reqs......................: 32357   267.445099/s
     iteration_duration.............: avg=186.14ms min=45.09ms med=171.1ms  max=589.47ms p(90)=215.87ms p(95)=262.85ms p(99.9)=547.3ms 
     iterations.....................: 32257   266.618555/s
     success_rate...................: 100.00% ✓ 32257      ✗ 0    
     vus............................: 1       min=1        max=50 
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

     checks.........................: 100.00% ✓ 7683      ✗ 0   
     data_received..................: 255 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=105.41µs min=1.63µs   med=3.82µs  max=9.35ms  p(90)=5.46µs  p(95)=6.45µs   p(99.9)=8.2ms 
     http_req_connecting............: avg=99.91µs  min=0s       med=0s      max=9.32ms  p(90)=0s      p(95)=0s       p(99.9)=8.16ms
     http_req_duration..............: avg=2.27s    min=26.64ms  med=2.32s   max=4.45s   p(90)=3.09s   p(95)=3.3s     p(99.9)=4.18s 
       { expected_response:true }...: avg=2.27s    min=26.64ms  med=2.32s   max=4.45s   p(90)=3.09s   p(95)=3.3s     p(99.9)=4.18s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2661
     http_req_receiving.............: avg=120.29µs min=35.45µs  med=96.32µs max=24.53ms p(90)=137.8µs p(95)=156.76µs p(99.9)=1.41ms
     http_req_sending...............: avg=80.63µs  min=7.06µs   med=19.88µs max=36.58ms p(90)=25.64µs p(95)=29.7µs   p(99.9)=7.93ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.27s    min=26.47ms  med=2.32s   max=4.45s   p(90)=3.09s   p(95)=3.3s     p(99.9)=4.18s 
     http_reqs......................: 2661    21.175563/s
     iteration_duration.............: avg=2.35s    min=442.24ms med=2.35s   max=4.45s   p(90)=3.1s    p(95)=3.3s     p(99.9)=4.18s 
     iterations.....................: 2561    20.379788/s
     success_rate...................: 100.00% ✓ 2561      ✗ 0   
     vus............................: 27      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

