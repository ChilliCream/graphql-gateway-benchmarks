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
| hive-router | v0.0.84 | 3,046 | 3,311 | 3,027 | 3.3% |  |
| fusion | 16.6.0 | 2,508 | 2,643 | 2,492 | 2.1% |  |
| grafbase | 0.53.5 | 2,216 | 2,338 | 2,196 | 2.1% |  |
| cosmo | 0.334.0 | 1,281 | 1,330 | 1,273 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 611 | 632 | 604 | 1.4% |  |
| apollo-router | v2.16.1 | 454 | 474 | 436 | 3.3% |  |
| apollo-gateway | 2.14.3 | 280 | 284 | 278 | 0.6% |  |
| hive-gateway | 2.10.8 | 279 | 285 | 277 | 0.9% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,425 | 2,614 | 2,379 | 3.2% |  |
| fusion | 16.6.0 | 2,379 | 2,508 | 2,367 | 2.1% |  |
| grafbase | 0.53.5 | 1,611 | 1,673 | 1,606 | 1.4% |  |
| cosmo | 0.334.0 | 1,203 | 1,245 | 1,189 | 1.8% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 598 | 572 | 1.5% |  |
| apollo-router | v2.16.1 | 439 | 448 | 407 | 3.0% |  |
| hive-gateway | 2.10.8 | 265 | 272 | 264 | 1.1% |  |
| apollo-gateway | 2.14.3 | 261 | 267 | 260 | 0.9% |  |
| feddi | 5ff8b6165878 | 26 | 26 | 25 | 1.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1098207     ✗ 0     
     data_received..................: 32 GB   267 MB/s
     data_sent......................: 440 MB  3.7 MB/s
     http_req_blocked...............: avg=2.66µs  min=841ns   med=1.96µs  max=7.3ms    p(90)=3.31µs  p(95)=3.99µs  p(99.9)=31.93µs
     http_req_connecting............: avg=253ns   min=0s      med=0s      max=3.31ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=16.17ms min=1.56ms  med=15.42ms max=292.74ms p(90)=23.95ms p(95)=27.23ms p(99.9)=46.81ms
       { expected_response:true }...: avg=16.17ms min=1.56ms  med=15.42ms max=292.74ms p(90)=23.95ms p(95)=27.23ms p(99.9)=46.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 366169
     http_req_receiving.............: avg=87.31µs min=24.76µs med=44.16µs max=160.3ms  p(90)=82.41µs p(95)=147µs   p(99.9)=7.5ms  
     http_req_sending...............: avg=47.92µs min=4.38µs  med=8.18µs  max=93.75ms  p(90)=15.01µs p(95)=91.6µs  p(99.9)=7.49ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=16.04ms min=1.48ms  med=15.31ms max=292.3ms  p(90)=23.77ms p(95)=26.98ms p(99.9)=45.6ms 
     http_reqs......................: 366169  3046.0974/s
     iteration_duration.............: avg=16.38ms min=1.92ms  med=15.61ms max=329.07ms p(90)=24.16ms p(95)=27.46ms p(99.9)=47.53ms
     iterations.....................: 366069  3045.265517/s
     success_rate...................: 100.00% ✓ 366069      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 904728      ✗ 0     
     data_received..................: 26 GB   220 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=2.72µs   min=902ns   med=2µs     max=14.54ms  p(90)=3.22µs  p(95)=3.78µs  p(99.9)=29.45µs 
     http_req_connecting............: avg=279ns    min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.67ms  min=2.01ms  med=16.82ms max=303.77ms p(90)=32.04ms p(95)=38.93ms p(99.9)=132.04ms
       { expected_response:true }...: avg=19.67ms  min=2.01ms  med=16.82ms max=303.77ms p(90)=32.04ms p(95)=38.93ms p(99.9)=132.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301676
     http_req_receiving.............: avg=589.67µs min=51.42µs med=93.16µs max=179.17ms p(90)=1.08ms  p(95)=1.94ms  p(99.9)=27.23ms 
     http_req_sending...............: avg=41.83µs  min=4.54µs  med=8.34µs  max=163.76ms p(90)=14.18µs p(95)=78.31µs p(99.9)=3.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.04ms  min=1.92ms  med=16.27ms max=303.23ms p(90)=31.07ms p(95)=37.77ms p(99.9)=130.54ms
     http_reqs......................: 301676  2508.703713/s
     iteration_duration.............: avg=19.88ms  min=3.06ms  med=17.01ms max=303.98ms p(90)=32.26ms p(95)=39.15ms p(99.9)=133.17ms
     iterations.....................: 301576  2507.872124/s
     success_rate...................: 100.00% ✓ 301576      ✗ 0     
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

     checks.........................: 100.00% ✓ 799095      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 320 MB  2.7 MB/s
     http_req_blocked...............: avg=3.83µs   min=1.15µs  med=2.84µs  max=15.81ms  p(90)=4.49µs  p(95)=5.3µs    p(99.9)=40.67µs
     http_req_connecting............: avg=367ns    min=0s      med=0s      max=3.52ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.29ms  min=1.64ms  med=22.04ms max=302.81ms p(90)=26.6ms  p(95)=28.59ms  p(99.9)=49.26ms
       { expected_response:true }...: avg=22.29ms  min=1.64ms  med=22.04ms max=302.81ms p(90)=26.6ms  p(95)=28.59ms  p(99.9)=49.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266465
     http_req_receiving.............: avg=100.45µs min=26.96µs med=56.08µs max=180.68ms p(90)=96.85µs p(95)=131.22µs p(99.9)=7.43ms 
     http_req_sending...............: avg=42.17µs  min=4.66µs  med=10.61µs max=187.99ms p(90)=17.54µs p(95)=61.21µs  p(99.9)=2.93ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.15ms  min=1.59ms  med=21.94ms max=294.98ms p(90)=26.46ms p(95)=28.39ms  p(99.9)=48.27ms
     http_reqs......................: 266465  2216.447335/s
     iteration_duration.............: avg=22.51ms  min=3.28ms  med=22.24ms max=312.76ms p(90)=26.81ms p(95)=28.81ms  p(99.9)=49.77ms
     iterations.....................: 266365  2215.615538/s
     success_rate...................: 100.00% ✓ 266365      ✗ 0     
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

     checks.........................: 100.00% ✓ 461982      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.43µs  min=1.08µs  med=2.52µs  max=3.87ms   p(90)=3.93µs  p(95)=4.55µs   p(99.9)=36.4µs  
     http_req_connecting............: avg=596ns   min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.72ms min=1.98ms  med=38.29ms max=299.41ms p(90)=54.2ms  p(95)=59.06ms  p(99.9)=81.78ms 
       { expected_response:true }...: avg=38.72ms min=1.98ms  med=38.29ms max=299.41ms p(90)=54.2ms  p(95)=59.06ms  p(99.9)=81.78ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 154094
     http_req_receiving.............: avg=73.59µs min=26.71µs med=60.21µs max=102.53ms p(90)=95.35µs p(95)=110.79µs p(99.9)=881.82µs
     http_req_sending...............: avg=23.95µs min=5.28µs  med=10.87µs max=74.16ms  p(90)=16.51µs p(95)=20.29µs  p(99.9)=993.98µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.62ms min=1.86ms  med=38.2ms  max=299.26ms p(90)=54.1ms  p(95)=58.95ms  p(99.9)=81.61ms 
     http_reqs......................: 154094  1281.183931/s
     iteration_duration.............: avg=38.95ms min=3.62ms  med=38.5ms  max=326.01ms p(90)=54.41ms p(95)=59.28ms  p(99.9)=82.31ms 
     iterations.....................: 153994  1280.3525/s
     success_rate...................: 100.00% ✓ 153994      ✗ 0     
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

     checks.........................: 100.00% ✓ 220608     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 88 MB   734 kB/s
     http_req_blocked...............: avg=4.49µs  min=1.12µs  med=3.04µs  max=3.55ms   p(90)=4.53µs   p(95)=5.21µs   p(99.9)=46.6µs  
     http_req_connecting............: avg=1.18µs  min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.25ms min=3.62ms  med=80.43ms max=325.14ms p(90)=102.83ms p(95)=112.58ms p(99.9)=191.6ms 
       { expected_response:true }...: avg=81.25ms min=3.62ms  med=80.43ms max=325.14ms p(90)=102.83ms p(95)=112.58ms p(99.9)=191.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 73636
     http_req_receiving.............: avg=81.78µs min=30.16µs med=69.59µs max=127.7ms  p(90)=104.92µs p(95)=117.74µs p(99.9)=643.1µs 
     http_req_sending...............: avg=27.4µs  min=4.97µs  med=13.19µs max=175.33ms p(90)=20.06µs  p(95)=22.37µs  p(99.9)=617.2µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.14ms min=3.51ms  med=80.33ms max=324.47ms p(90)=102.71ms p(95)=112.44ms p(99.9)=191.07ms
     http_reqs......................: 73636   611.164073/s
     iteration_duration.............: avg=81.6ms  min=24.06ms med=80.67ms max=335.33ms p(90)=103.08ms p(95)=112.85ms p(99.9)=192.63ms
     iterations.....................: 73536   610.334093/s
     success_rate...................: 100.00% ✓ 73536      ✗ 0    
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

     checks.........................: 100.00% ✓ 164292     ✗ 0    
     data_received..................: 4.8 GB  40 MB/s
     data_sent......................: 66 MB   546 kB/s
     http_req_blocked...............: avg=4.57µs   min=1.08µs  med=2.77µs   max=3.34ms   p(90)=4.1µs    p(95)=4.62µs   p(99.9)=105.51µs
     http_req_connecting............: avg=1.61µs   min=0s      med=0s       max=3.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=109.14ms min=4.51ms  med=108.83ms max=325.88ms p(90)=132.31ms p(95)=139.61ms p(99.9)=173.53ms
       { expected_response:true }...: avg=109.14ms min=4.51ms  med=108.83ms max=325.88ms p(90)=132.31ms p(95)=139.61ms p(99.9)=173.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54864
     http_req_receiving.............: avg=75.46µs  min=28.91µs med=70.65µs  max=2.83ms   p(90)=102.36µs p(95)=115.27µs p(99.9)=525.28µs
     http_req_sending...............: avg=22.55µs  min=4.96µs  med=13.9µs   max=165.01ms p(90)=19.61µs  p(95)=21.31µs  p(99.9)=482.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.04ms min=4.41ms  med=108.74ms max=325.42ms p(90)=132.21ms p(95)=139.51ms p(99.9)=172.45ms
     http_reqs......................: 54864   454.986243/s
     iteration_duration.............: avg=109.58ms min=23.64ms med=109.1ms  max=334.8ms  p(90)=132.54ms p(95)=139.88ms p(99.9)=175.21ms
     iterations.....................: 54764   454.156945/s
     success_rate...................: 100.00% ✓ 54764      ✗ 0    
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

     checks.........................: 100.00% ✓ 101490     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.36µs   min=1.19µs  med=3.35µs   max=3.51ms   p(90)=4.62µs   p(95)=5.15µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=176.63ms min=7.53ms  med=174.43ms max=384.52ms p(90)=189.45ms p(95)=193.72ms p(99.9)=260.5ms 
       { expected_response:true }...: avg=176.63ms min=7.53ms  med=174.43ms max=384.52ms p(90)=189.45ms p(95)=193.72ms p(99.9)=260.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33930
     http_req_receiving.............: avg=99.31µs  min=34.32µs med=82.72µs  max=158.14ms p(90)=112.36µs p(95)=123.44µs p(99.9)=620.45µs
     http_req_sending...............: avg=30.62µs  min=6.14µs  med=16.92µs  max=105.62ms p(90)=21.26µs  p(95)=22.99µs  p(99.9)=470.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.5ms  min=7.45ms  med=174.32ms max=366.47ms p(90)=189.33ms p(95)=193.59ms p(99.9)=259.87ms
     http_reqs......................: 33930   280.577895/s
     iteration_duration.............: avg=177.44ms min=30.57ms med=175.21ms max=394.63ms p(90)=189.73ms p(95)=194ms    p(99.9)=262.22ms
     iterations.....................: 33830   279.750964/s
     success_rate...................: 100.00% ✓ 33830      ✗ 0    
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

     checks.........................: 100.00% ✓ 101028     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=6.75µs   min=1.36µs  med=3.59µs   max=3.56ms   p(90)=4.96µs   p(95)=5.59µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=2.72µs   min=0s      med=0s       max=3.26ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=177.47ms min=5.85ms  med=162.38ms max=635.51ms p(90)=210.01ms p(95)=256.37ms p(99.9)=542.82ms
       { expected_response:true }...: avg=177.47ms min=5.85ms  med=162.38ms max=635.51ms p(90)=210.01ms p(95)=256.37ms p(99.9)=542.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33776
     http_req_receiving.............: avg=89.72µs  min=35.06µs med=86.65µs  max=5.99ms   p(90)=116.31µs p(95)=127.89µs p(99.9)=635.38µs
     http_req_sending...............: avg=31.55µs  min=6.43µs  med=17.82µs  max=117.15ms p(90)=22.74µs  p(95)=24.56µs  p(99.9)=477.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.35ms min=5.75ms  med=162.26ms max=635.4ms  p(90)=209.89ms p(95)=256.08ms p(99.9)=542.7ms 
     http_reqs......................: 33776   279.557757/s
     iteration_duration.............: avg=178.26ms min=27.5ms  med=162.75ms max=635.75ms p(90)=210.41ms p(95)=257.18ms p(99.9)=543.2ms 
     iterations.....................: 33676   278.730075/s
     success_rate...................: 100.00% ✓ 33676      ✗ 0    
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
data_received..................: 9.0 MB 150 kB/s
     data_sent......................: 114 kB 1.9 kB/s
     http_req_blocked...............: avg=5.24µs   min=2.31µs  med=3.27µs   max=175.07µs p(90)=4.37µs   p(95)=4.73µs   p(99.9)=159.33µs
     http_req_connecting............: avg=1.08µs   min=0s      med=0s       max=102.3µs  p(90)=0s       p(95)=0s       p(99.9)=92.78µs 
     http_req_duration..............: avg=355.23ms min=25.87ms med=35.73ms  max=30.02s   p(90)=44.1ms   p(95)=46.11ms  p(99.9)=27.23s  
       { expected_response:true }...: avg=355.23ms min=25.87ms med=35.73ms  max=30.02s   p(90)=44.1ms   p(95)=46.11ms  p(99.9)=27.23s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 94  
     http_req_receiving.............: avg=123.82µs min=68.09µs med=128.48µs max=317.02µs p(90)=154.21µs p(95)=175.39µs p(99.9)=315.8µs 
     http_req_sending...............: avg=21.35µs  min=13.28µs med=18.15µs  max=144.99µs p(90)=21.49µs  p(95)=28.22µs  p(99.9)=143.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=355.08ms min=25.71ms med=35.6ms   max=30.02s   p(90)=43.94ms  p(95)=45.97ms  p(99.9)=27.23s  
     http_reqs......................: 94     1.566643/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
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

     checks.........................: 100.00% ✓ 874416      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=2.9µs   min=902ns   med=2.11µs  max=12.77ms  p(90)=3.59µs  p(95)=4.32µs   p(99.9)=34.99µs
     http_req_connecting............: avg=291ns   min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.36ms min=1.5ms   med=20.19ms max=289.35ms p(90)=28.22ms p(95)=30.54ms  p(99.9)=49.47ms
       { expected_response:true }...: avg=20.36ms min=1.5ms   med=20.19ms max=289.35ms p(90)=28.22ms p(95)=30.54ms  p(99.9)=49.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291572
     http_req_receiving.............: avg=87.3µs  min=26.37µs med=51.65µs max=120.93ms p(90)=90.11µs p(95)=119.98µs p(99.9)=6.48ms 
     http_req_sending...............: avg=38.9µs  min=4.79µs  med=9.36µs  max=192.73ms p(90)=16.58µs p(95)=30.45µs  p(99.9)=2.55ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.24ms min=1.45ms  med=20.08ms max=288.78ms p(90)=28.07ms p(95)=30.38ms  p(99.9)=48.29ms
     http_reqs......................: 291572  2425.78564/s
     iteration_duration.............: avg=20.57ms min=3.29ms  med=20.39ms max=300.76ms p(90)=28.42ms p(95)=30.75ms  p(99.9)=50.06ms
     iterations.....................: 291472  2424.953672/s
     success_rate...................: 100.00% ✓ 291472      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 857994      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.58µs   min=1.06µs  med=2.62µs   max=20.67ms  p(90)=4.07µs  p(95)=4.75µs  p(99.9)=37.02µs 
     http_req_connecting............: avg=325ns    min=0s      med=0s       max=4.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.74ms  min=1.55ms  med=17.38ms  max=417.34ms p(90)=34.04ms p(95)=41.65ms p(99.9)=153.62ms
       { expected_response:true }...: avg=20.74ms  min=1.55ms  med=17.38ms  max=417.34ms p(90)=34.04ms p(95)=41.65ms p(99.9)=153.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286098
     http_req_receiving.............: avg=621.48µs min=52.26µs med=100.98µs max=226.94ms p(90)=1.14ms  p(95)=2.03ms  p(99.9)=29.25ms 
     http_req_sending...............: avg=46.68µs  min=4.93µs  med=9.83µs   max=230.86ms p(90)=17.2µs  p(95)=92.08µs p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.07ms  min=1.46ms  med=16.81ms  max=413.79ms p(90)=32.97ms p(95)=40.42ms p(99.9)=151.38ms
     http_reqs......................: 286098  2379.855653/s
     iteration_duration.............: avg=20.97ms  min=2.58ms  med=17.59ms  max=417.55ms p(90)=34.28ms p(95)=41.89ms p(99.9)=154.76ms
     iterations.....................: 285998  2379.023821/s
     success_rate...................: 100.00% ✓ 285998      ✗ 0     
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

     checks.........................: 100.00% ✓ 581109      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=4.17µs   min=1.05µs  med=3.09µs  max=3.84ms   p(90)=5.39µs  p(95)=6.49µs   p(99.9)=47.64µs
     http_req_connecting............: avg=517ns    min=0s      med=0s      max=3.79ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.7ms   min=2.31ms  med=30.16ms max=301.38ms p(90)=40.82ms p(95)=44.38ms  p(99.9)=65.83ms
       { expected_response:true }...: avg=30.7ms   min=2.31ms  med=30.16ms max=301.38ms p(90)=40.82ms p(95)=44.38ms  p(99.9)=65.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193803
     http_req_receiving.............: avg=105.74µs min=30.02µs med=61.85µs max=76.87ms  p(90)=135.5µs p(95)=228.57µs p(99.9)=4.81ms 
     http_req_sending...............: avg=46.87µs  min=5.14µs  med=11.4µs  max=187.73ms p(90)=25.48µs p(95)=124.37µs p(99.9)=3.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.54ms  min=2.21ms  med=30.02ms max=285.92ms p(90)=40.65ms p(95)=44.18ms  p(99.9)=64.81ms
     http_reqs......................: 193803  1611.17311/s
     iteration_duration.............: avg=30.96ms  min=6.46ms  med=30.4ms  max=311.82ms p(90)=41.06ms p(95)=44.61ms  p(99.9)=66.53ms
     iterations.....................: 193703  1610.341764/s
     success_rate...................: 100.00% ✓ 193703      ✗ 0     
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

     checks.........................: 100.00% ✓ 433881      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=4.02µs  min=1.16µs  med=3.07µs  max=3.66ms   p(90)=4.74µs   p(95)=5.47µs   p(99.9)=38.83µs 
     http_req_connecting............: avg=652ns   min=0s      med=0s      max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.21ms min=2.28ms  med=40.8ms  max=312.74ms p(90)=57.25ms  p(95)=62.23ms  p(99.9)=86.16ms 
       { expected_response:true }...: avg=41.21ms min=2.28ms  med=40.8ms  max=312.74ms p(90)=57.25ms  p(95)=62.23ms  p(99.9)=86.16ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144727
     http_req_receiving.............: avg=85.66µs min=29.79µs med=72.84µs max=69.59ms  p(90)=113.28µs p(95)=130.86µs p(99.9)=953.59µs
     http_req_sending...............: avg=28.26µs min=5.34µs  med=13.05µs max=166.18ms p(90)=20.12µs  p(95)=23.98µs  p(99.9)=1.06ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.09ms min=2.15ms  med=40.69ms max=273.82ms p(90)=57.13ms  p(95)=62.12ms  p(99.9)=86.02ms 
     http_reqs......................: 144727  1203.119279/s
     iteration_duration.............: avg=41.47ms min=3.76ms  med=41.03ms max=323.19ms p(90)=57.47ms  p(95)=62.45ms  p(99.9)=86.74ms 
     iterations.....................: 144627  1202.287977/s
     success_rate...................: 100.00% ✓ 144627      ✗ 0     
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

     checks.........................: 100.00% ✓ 208074     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 83 MB   692 kB/s
     http_req_blocked...............: avg=5.97µs  min=990ns   med=2.46µs  max=7.28ms   p(90)=3.93µs   p(95)=4.53µs   p(99.9)=47.38µs 
     http_req_connecting............: avg=3.16µs  min=0s      med=0s      max=7.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.15ms min=3.79ms  med=83.97ms max=309.34ms p(90)=107.18ms p(95)=118.16ms p(99.9)=198.69ms
       { expected_response:true }...: avg=86.15ms min=3.79ms  med=83.97ms max=309.34ms p(90)=107.18ms p(95)=118.16ms p(99.9)=198.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69458
     http_req_receiving.............: avg=83.59µs min=28.97µs med=70.02µs max=131.4ms  p(90)=105.09µs p(95)=117.86µs p(99.9)=632.46µs
     http_req_sending...............: avg=25.12µs min=4.58µs  med=12.51µs max=93.66ms  p(90)=19.17µs  p(95)=21.17µs  p(99.9)=1.18ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.05ms min=3.72ms  med=83.88ms max=292.53ms p(90)=107.08ms p(95)=118.01ms p(99.9)=198.26ms
     http_reqs......................: 69458   576.339784/s
     iteration_duration.............: avg=86.51ms min=28.32ms med=84.21ms max=329.56ms p(90)=107.44ms p(95)=118.43ms p(99.9)=200.54ms
     iterations.....................: 69358   575.510017/s
     success_rate...................: 100.00% ✓ 69358      ✗ 0    
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

     checks.........................: 100.00% ✓ 158940     ✗ 0    
     data_received..................: 4.6 GB  39 MB/s
     data_sent......................: 64 MB   528 kB/s
     http_req_blocked...............: avg=5.1µs    min=992ns   med=3.18µs   max=3.54ms   p(90)=4.69µs   p(95)=5.28µs   p(99.9)=92.36µs 
     http_req_connecting............: avg=1.71µs   min=0s      med=0s       max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.8ms  min=5.35ms  med=110.55ms max=342.74ms p(90)=148.99ms p(95)=160.09ms p(99.9)=205.88ms
       { expected_response:true }...: avg=112.8ms  min=5.35ms  med=110.55ms max=342.74ms p(90)=148.99ms p(95)=160.09ms p(99.9)=205.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53080
     http_req_receiving.............: avg=87.3µs   min=27.81µs med=80.83µs  max=95.57ms  p(90)=111.57µs p(95)=124.12µs p(99.9)=535.7µs 
     http_req_sending...............: avg=26.4µs   min=5.06µs  med=17.14µs  max=82.22ms  p(90)=22.13µs  p(95)=23.96µs  p(99.9)=549µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.68ms min=5.24ms  med=110.45ms max=342.18ms p(90)=148.85ms p(95)=159.95ms p(99.9)=205.77ms
     http_reqs......................: 53080   439.87564/s
     iteration_duration.............: avg=113.28ms min=26.78ms med=110.87ms max=353.66ms p(90)=149.28ms p(95)=160.41ms p(99.9)=208.32ms
     iterations.....................: 52980   439.046937/s
     success_rate...................: 100.00% ✓ 52980      ✗ 0    
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

     checks.........................: 100.00% ✓ 95787      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=7µs      min=1.29µs  med=3.7µs    max=3.58ms   p(90)=5.17µs   p(95)=5.8µs    p(99.9)=1.63ms  
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=187.12ms min=5.77ms  med=171.49ms max=672.44ms p(90)=219.23ms p(95)=270.38ms p(99.9)=563.63ms
       { expected_response:true }...: avg=187.12ms min=5.77ms  med=171.49ms max=672.44ms p(90)=219.23ms p(95)=270.38ms p(99.9)=563.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32029
     http_req_receiving.............: avg=105.28µs min=37.97µs med=92.55µs  max=81.66ms  p(90)=123.66µs p(95)=136.59µs p(99.9)=730.18µs
     http_req_sending...............: avg=23.06µs  min=6.79µs  med=18.69µs  max=26.42ms  p(90)=23.5µs   p(95)=25.37µs  p(99.9)=451.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187ms    min=5.68ms  med=171.37ms max=672.3ms  p(90)=219.11ms p(95)=270.26ms p(99.9)=563.52ms
     http_reqs......................: 32029   265.136709/s
     iteration_duration.............: avg=187.99ms min=43.27ms med=171.87ms max=672.76ms p(90)=219.75ms p(95)=271.26ms p(99.9)=564.02ms
     iterations.....................: 31929   264.308907/s
     success_rate...................: 100.00% ✓ 31929      ✗ 0    
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

     checks.........................: 100.00% ✓ 94719      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.02µs   min=1.15µs med=2.98µs   max=3.61ms   p(90)=4.25µs   p(95)=4.76µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.86µs   min=0s     med=0s       max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=189.33ms min=7.86ms med=178.34ms max=362.07ms p(90)=244.46ms p(95)=249.26ms p(99.9)=315ms   
       { expected_response:true }...: avg=189.33ms min=7.86ms med=178.34ms max=362.07ms p(90)=244.46ms p(95)=249.26ms p(99.9)=315ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31673
     http_req_receiving.............: avg=89.42µs  min=31.5µs med=84.85µs  max=39.88ms  p(90)=113.95µs p(95)=124.58µs p(99.9)=377.36µs
     http_req_sending...............: avg=30.39µs  min=5.41µs med=16.49µs  max=56.19ms  p(90)=20.76µs  p(95)=22.56µs  p(99.9)=473.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.21ms min=7.76ms med=178.17ms max=359.56ms p(90)=244.35ms p(95)=249.14ms p(99.9)=314.9ms 
     http_reqs......................: 31673   261.726663/s
     iteration_duration.............: avg=190.17ms min=51.5ms med=180.53ms max=377.68ms p(90)=244.75ms p(95)=249.55ms p(99.9)=317.66ms
     iterations.....................: 31573   260.900323/s
     success_rate...................: 100.00% ✓ 31573      ✗ 0    
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

     checks.........................: 100.00% ✓ 9654      ✗ 0   
     data_received..................: 318 MB  2.6 MB/s
     data_sent......................: 4.0 MB  32 kB/s
     http_req_blocked...............: avg=17.55µs min=1.1µs   med=3.49µs   max=2.15ms  p(90)=5.09µs   p(95)=5.93µs   p(99.9)=1.95ms  
     http_req_connecting............: avg=13.32µs min=0s      med=0s       max=2.12ms  p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=1.81s   min=21.9ms  med=1.81s    max=3.75s   p(90)=2.63s    p(95)=2.86s    p(99.9)=3.64s   
       { expected_response:true }...: avg=1.81s   min=21.9ms  med=1.81s    max=3.75s   p(90)=2.63s    p(95)=2.86s    p(99.9)=3.64s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 3318
     http_req_receiving.............: avg=107µs   min=35.07µs med=100.88µs max=3.04ms  p(90)=143.37µs p(95)=163.62µs p(99.9)=947.19µs
     http_req_sending...............: avg=34.34µs min=5.68µs  med=19.75µs  max=21.09ms p(90)=24.47µs  p(95)=27.61µs  p(99.9)=1.09ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.81s   min=21.74ms med=1.81s    max=3.75s   p(90)=2.63s    p(95)=2.86s    p(99.9)=3.64s   
     http_reqs......................: 3318    26.735725/s
     iteration_duration.............: avg=1.87s   min=65.23ms med=1.84s    max=3.75s   p(90)=2.64s    p(95)=2.87s    p(99.9)=3.64s   
     iterations.....................: 3218    25.929946/s
     success_rate...................: 100.00% ✓ 3218      ✗ 0   
     vus............................: 17      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

