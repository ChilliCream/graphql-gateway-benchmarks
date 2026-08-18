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
| hive-router | v0.0.84 | 2,960 | 3,219 | 2,886 | 3.7% |  |
| fusion-nightly-net11 | 16.6.2-p.1 | 2,749 | 2,874 | 2,734 | 1.8% |  |
| fusion-nightly | 16.6.2-p.1 | 2,647 | 2,767 | 2,637 | 1.6% |  |
| fusion | 16.6.1 | 2,538 | 2,748 | 2,520 | 3.0% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 2,473 | 2,571 | 2,456 | 1.7% |  |
| grafbase | 0.53.5 | 2,135 | 2,245 | 2,118 | 2.0% |  |
| cosmo | 0.334.0 | 1,284 | 1,331 | 1,276 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 617 | 634 | 615 | 1.2% |  |
| apollo-router | v2.16.1 | 485 | 502 | 483 | 1.3% |  |
| apollo-gateway | 2.14.3 | 285 | 288 | 285 | 0.4% |  |
| hive-gateway | 2.10.8 | 279 | 288 | 278 | 1.3% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.1 | 2,588 | 2,700 | 2,569 | 1.7% |  |
| hive-router | v0.0.84 | 2,391 | 2,600 | 2,358 | 3.6% |  |
| fusion-nightly | 16.6.2-p.1 | 2,389 | 2,533 | 2,355 | 2.6% |  |
| fusion | 16.6.1 | 2,354 | 2,478 | 2,349 | 2.0% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 2,255 | 2,364 | 2,248 | 2.0% |  |
| grafbase | 0.53.5 | 1,614 | 1,672 | 1,609 | 1.5% |  |
| cosmo | 0.334.0 | 1,185 | 1,224 | 1,176 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 591 | 609 | 588 | 1.1% |  |
| apollo-router | v2.16.1 | 409 | 435 | 405 | 2.9% |  |
| hive-gateway | 2.10.8 | 271 | 278 | 270 | 1.1% |  |
| apollo-gateway | 2.14.3 | 269 | 272 | 268 | 0.5% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 4.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1067052     ✗ 0     
     data_received..................: 31 GB   260 MB/s
     data_sent......................: 428 MB  3.6 MB/s
     http_req_blocked...............: avg=2.71µs  min=861ns   med=1.99µs  max=17.83ms  p(90)=3.26µs  p(95)=3.81µs   p(99.9)=31.09µs
     http_req_connecting............: avg=258ns   min=0s      med=0s      max=4.01ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.66ms min=1.38ms  med=16ms    max=277.14ms p(90)=24.56ms p(95)=27.61ms  p(99.9)=46.57ms
       { expected_response:true }...: avg=16.66ms min=1.38ms  med=16ms    max=277.14ms p(90)=24.56ms p(95)=27.61ms  p(99.9)=46.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 355784
     http_req_receiving.............: avg=84.49µs min=25.63µs med=45.62µs max=78.27ms  p(90)=80.56µs p(95)=138.75µs p(99.9)=6.77ms 
     http_req_sending...............: avg=44.14µs min=4.43µs  med=8.1µs   max=214.02ms p(90)=13.89µs p(95)=87.68µs  p(99.9)=4.83ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.53ms min=1.34ms  med=15.89ms max=276.5ms  p(90)=24.4ms  p(95)=27.39ms  p(99.9)=45.32ms
     http_reqs......................: 355784  2960.336425/s
     iteration_duration.............: avg=16.86ms min=1.98ms  med=16.18ms max=289.38ms p(90)=24.76ms p(95)=27.83ms  p(99.9)=47.3ms 
     iterations.....................: 355684  2959.504365/s
     success_rate...................: 100.00% ✓ 355684      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 991431      ✗ 0     
     data_received..................: 29 GB   241 MB/s
     data_sent......................: 397 MB  3.3 MB/s
     http_req_blocked...............: avg=2.57µs   min=882ns   med=1.93µs  max=10.58ms  p(90)=3.14µs  p(95)=3.74µs  p(99.9)=30.98µs
     http_req_connecting............: avg=249ns    min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.93ms  min=1.88ms  med=17.09ms max=291.61ms p(90)=25.85ms p(95)=29.34ms p(99.9)=50.48ms
       { expected_response:true }...: avg=17.93ms  min=1.88ms  med=17.09ms max=291.61ms p(90)=25.85ms p(95)=29.34ms p(99.9)=50.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 330577
     http_req_receiving.............: avg=456.87µs min=50.55µs med=91.89µs max=156.47ms p(90)=1.13ms  p(95)=1.75ms  p(99.9)=16.67ms
     http_req_sending...............: avg=43.1µs   min=4.67µs  med=8.26µs  max=151.27ms p(90)=14.99µs p(95)=85.91µs p(99.9)=3.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.43ms  min=1.81ms  med=16.59ms max=269.67ms p(90)=25.25ms p(95)=28.69ms p(99.9)=48.97ms
     http_reqs......................: 330577  2749.478459/s
     iteration_duration.............: avg=18.14ms  min=2.71ms  med=17.28ms max=314.49ms p(90)=26.06ms p(95)=29.57ms p(99.9)=51.08ms
     iterations.....................: 330477  2748.646738/s
     success_rate...................: 100.00% ✓ 330477      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 954846      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 383 MB  3.2 MB/s
     http_req_blocked...............: avg=3.55µs   min=972ns   med=2.35µs  max=15.76ms  p(90)=3.59µs  p(95)=4.17µs  p(99.9)=32.69µs 
     http_req_connecting............: avg=739ns    min=0s      med=0s      max=8.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.63ms  min=1.99ms  med=16.12ms max=246.25ms p(90)=30.27ms p(95)=36.55ms p(99.9)=111.75ms
       { expected_response:true }...: avg=18.63ms  min=1.99ms  med=16.12ms max=246.25ms p(90)=30.27ms p(95)=36.55ms p(99.9)=111.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 318382
     http_req_receiving.............: avg=536.16µs min=50.55µs med=91.56µs max=156.99ms p(90)=1.04ms  p(95)=1.83ms  p(99.9)=24.09ms 
     http_req_sending...............: avg=43.2µs   min=4.73µs  med=8.78µs  max=212.1ms  p(90)=14.9µs  p(95)=89.04µs p(99.9)=4.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.05ms  min=1.92ms  med=15.61ms max=246.03ms p(90)=29.39ms p(95)=35.58ms p(99.9)=110.56ms
     http_reqs......................: 318382  2647.640869/s
     iteration_duration.............: avg=18.84ms  min=2.49ms  med=16.31ms max=347.44ms p(90)=30.48ms p(95)=36.79ms p(99.9)=112.68ms
     iterations.....................: 318282  2646.809276/s
     success_rate...................: 100.00% ✓ 318282      ✗ 0     
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

     checks.........................: 100.00% ✓ 915474      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 367 MB  3.0 MB/s
     http_req_blocked...............: avg=3.1µs    min=1.01µs  med=2.34µs  max=16.16ms  p(90)=3.61µs  p(95)=4.2µs   p(99.9)=33.12µs 
     http_req_connecting............: avg=197ns    min=0s      med=0s      max=3.32ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.44ms  min=2.1ms   med=16.63ms max=275.35ms p(90)=31.72ms p(95)=38.42ms p(99.9)=127.76ms
       { expected_response:true }...: avg=19.44ms  min=2.1ms   med=16.63ms max=275.35ms p(90)=31.72ms p(95)=38.42ms p(99.9)=127.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305258
     http_req_receiving.............: avg=589.55µs min=51.12µs med=94.28µs max=207.13ms p(90)=1.1ms   p(95)=2.02ms  p(99.9)=26.5ms  
     http_req_sending...............: avg=43.18µs  min=4.71µs  med=8.99µs  max=148.71ms p(90)=15.37µs p(95)=88.37µs p(99.9)=4.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.8ms   min=1.96ms  med=16.08ms max=274.66ms p(90)=30.74ms p(95)=37.25ms p(99.9)=125.45ms
     http_reqs......................: 305258  2538.182263/s
     iteration_duration.............: avg=19.65ms  min=3.08ms  med=16.83ms max=291.01ms p(90)=31.94ms p(95)=38.66ms p(99.9)=128.85ms
     iterations.....................: 305158  2537.350775/s
     success_rate...................: 100.00% ✓ 305158      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 891888      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=3.11µs   min=1µs     med=2.41µs  max=5.24ms   p(90)=3.8µs   p(95)=4.46µs  p(99.9)=33.59µs 
     http_req_connecting............: avg=328ns    min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.95ms  min=1.69ms  med=16.3ms  max=333.42ms p(90)=33.67ms p(95)=42.26ms p(99.9)=163.79ms
       { expected_response:true }...: avg=19.95ms  min=1.69ms  med=16.3ms  max=333.42ms p(90)=33.67ms p(95)=42.26ms p(99.9)=163.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297396
     http_req_receiving.............: avg=574.74µs min=51.85µs med=92.25µs max=193.1ms  p(90)=1.05ms  p(95)=1.91ms  p(99.9)=28.62ms 
     http_req_sending...............: avg=45.49µs  min=4.85µs  med=9.06µs  max=187.21ms p(90)=15.47µs p(95)=82.51µs p(99.9)=3.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.33ms  min=1.56ms  med=15.77ms max=331.2ms  p(90)=32.68ms p(95)=41.05ms p(99.9)=161.41ms
     http_reqs......................: 297396  2473.910097/s
     iteration_duration.............: avg=20.17ms  min=2.69ms  med=16.5ms  max=333.63ms p(90)=33.91ms p(95)=42.51ms p(99.9)=165.14ms
     iterations.....................: 297296  2473.07824/s
     success_rate...................: 100.00% ✓ 297296      ✗ 0     
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

     checks.........................: 100.00% ✓ 769794      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=2.79µs  min=862ns   med=2.07µs  max=9.29ms   p(90)=3.39µs  p(95)=4.07µs   p(99.9)=29.66µs
     http_req_connecting............: avg=347ns   min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.16ms min=1.75ms  med=22.93ms max=296.76ms p(90)=27.37ms p(95)=29.05ms  p(99.9)=47.99ms
       { expected_response:true }...: avg=23.16ms min=1.75ms  med=22.93ms max=296.76ms p(90)=27.37ms p(95)=29.05ms  p(99.9)=47.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256698
     http_req_receiving.............: avg=83.82µs min=27.93µs med=54.74µs max=146.8ms  p(90)=90.51µs p(95)=113.03µs p(99.9)=4.78ms 
     http_req_sending...............: avg=33.12µs min=4.63µs  med=9.32µs  max=154.16ms p(90)=15.69µs p(95)=23.27µs  p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.05ms min=1.7ms   med=22.84ms max=296.29ms p(90)=27.25ms p(95)=28.89ms  p(99.9)=46.88ms
     http_reqs......................: 256698  2135.091223/s
     iteration_duration.............: avg=23.37ms min=4.53ms  med=23.12ms max=322.99ms p(90)=27.57ms p(95)=29.25ms  p(99.9)=48.42ms
     iterations.....................: 256598  2134.259471/s
     success_rate...................: 100.00% ✓ 256598      ✗ 0     
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

     checks.........................: 100.00% ✓ 463062      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=3.3µs   min=1.02µs  med=2.5µs   max=3.15ms   p(90)=3.86µs  p(95)=4.47µs   p(99.9)=31.61µs 
     http_req_connecting............: avg=490ns   min=0s      med=0s      max=3.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.63ms min=2.05ms  med=38.24ms max=290.28ms p(90)=53.87ms p(95)=58.58ms  p(99.9)=82.13ms 
       { expected_response:true }...: avg=38.63ms min=2.05ms  med=38.24ms max=290.28ms p(90)=53.87ms p(95)=58.58ms  p(99.9)=82.13ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 154454
     http_req_receiving.............: avg=74.5µs  min=27.82µs med=60.31µs max=72.88ms  p(90)=94.89µs p(95)=110.28µs p(99.9)=962.89µs
     http_req_sending...............: avg=24.37µs min=5.18µs  med=10.56µs max=128.23ms p(90)=16.27µs p(95)=20.19µs  p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.53ms min=1.94ms  med=38.14ms max=276.49ms p(90)=53.77ms p(95)=58.47ms  p(99.9)=81.97ms 
     http_reqs......................: 154454  1284.199123/s
     iteration_duration.............: avg=38.86ms min=3.79ms  med=38.45ms max=312.56ms p(90)=54.07ms p(95)=58.78ms  p(99.9)=82.47ms 
     iterations.....................: 154354  1283.367678/s
     success_rate...................: 100.00% ✓ 154354      ✗ 0     
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

     checks.........................: 100.00% ✓ 222738     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   741 kB/s
     http_req_blocked...............: avg=4.12µs  min=1.14µs  med=2.91µs  max=3.17ms   p(90)=4.35µs   p(95)=4.98µs   p(99.9)=43.92µs 
     http_req_connecting............: avg=955ns   min=0s      med=0s      max=3.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.48ms min=3.57ms  med=78.65ms max=323.21ms p(90)=100.6ms  p(95)=110.91ms p(99.9)=186.14ms
       { expected_response:true }...: avg=80.48ms min=3.57ms  med=78.65ms max=323.21ms p(90)=100.6ms  p(95)=110.91ms p(99.9)=186.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74346
     http_req_receiving.............: avg=78.86µs min=30.11µs med=68.47µs max=67.75ms  p(90)=102.9µs  p(95)=115.45µs p(99.9)=624.83µs
     http_req_sending...............: avg=22.75µs min=5.57µs  med=12.93µs max=127.09ms p(90)=19.49µs  p(95)=21.89µs  p(99.9)=652.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.38ms min=3.51ms  med=78.56ms max=322.29ms p(90)=100.49ms p(95)=110.81ms p(99.9)=185.45ms
     http_reqs......................: 74346   617.078703/s
     iteration_duration.............: avg=80.82ms min=18.02ms med=78.91ms max=333.67ms p(90)=100.83ms p(95)=111.2ms  p(99.9)=187.67ms
     iterations.....................: 74246   616.248694/s
     success_rate...................: 100.00% ✓ 74246      ✗ 0    
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

     checks.........................: 100.00% ✓ 175170     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   583 kB/s
     http_req_blocked...............: avg=4.62µs   min=1.12µs  med=2.83µs   max=3.92ms   p(90)=4.19µs   p(95)=4.73µs   p(99.9)=45.28µs 
     http_req_connecting............: avg=1.6µs    min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.36ms min=4.59ms  med=102.12ms max=314.45ms p(90)=123.52ms p(95)=129.89ms p(99.9)=162.33ms
       { expected_response:true }...: avg=102.36ms min=4.59ms  med=102.12ms max=314.45ms p(90)=123.52ms p(95)=129.89ms p(99.9)=162.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58490
     http_req_receiving.............: avg=79.17µs  min=27.17µs med=72.9µs   max=79.15ms  p(90)=104.89µs p(95)=117.73µs p(99.9)=555.21µs
     http_req_sending...............: avg=24.91µs  min=5.08µs  med=14.79µs  max=132.03ms p(90)=20.63µs  p(95)=22.38µs  p(99.9)=557.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.25ms min=4.53ms  med=102.02ms max=314.06ms p(90)=123.43ms p(95)=129.77ms p(99.9)=161.88ms
     http_reqs......................: 58490   485.076881/s
     iteration_duration.............: avg=102.78ms min=30.71ms med=102.38ms max=334.92ms p(90)=123.77ms p(95)=130.14ms p(99.9)=163.28ms
     iterations.....................: 58390   484.247548/s
     success_rate...................: 100.00% ✓ 58390      ✗ 0    
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

     checks.........................: 100.00% ✓ 103215     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   343 kB/s
     http_req_blocked...............: avg=5.22µs   min=1.08µs  med=3.54µs   max=2.16ms   p(90)=4.87µs   p(95)=5.42µs   p(99.9)=546.3µs 
     http_req_connecting............: avg=1.43µs   min=0s      med=0s       max=2.14ms   p(90)=0s       p(95)=0s       p(99.9)=490.27µs
     http_req_duration..............: avg=173.7ms  min=7.3ms   med=175.54ms max=329.52ms p(90)=183.39ms p(95)=188.15ms p(99.9)=256.23ms
       { expected_response:true }...: avg=173.7ms  min=7.3ms   med=175.54ms max=329.52ms p(90)=183.39ms p(95)=188.15ms p(99.9)=256.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34505
     http_req_receiving.............: avg=92.59µs  min=34.11µs med=85.85µs  max=58.39ms  p(90)=116.2µs  p(95)=127.64µs p(99.9)=483.33µs
     http_req_sending...............: avg=26.79µs  min=5.19µs  med=16.97µs  max=83.59ms  p(90)=21.68µs  p(95)=23.41µs  p(99.9)=504.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.58ms min=7.22ms  med=175.43ms max=329.15ms p(90)=183.28ms p(95)=188.04ms p(99.9)=256.12ms
     http_reqs......................: 34505   285.412115/s
     iteration_duration.............: avg=174.46ms min=55.14ms med=175.97ms max=337.78ms p(90)=183.67ms p(95)=188.46ms p(99.9)=257.11ms
     iterations.....................: 34405   284.584953/s
     success_rate...................: 100.00% ✓ 34405      ✗ 0    
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

     checks.........................: 100.00% ✓ 101016     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=4.42µs   min=1.14µs  med=3.09µs   max=1.87ms   p(90)=4.47µs   p(95)=5.02µs   p(99.9)=406.02µs
     http_req_connecting............: avg=1.12µs   min=0s      med=0s       max=1.84ms   p(90)=0s       p(95)=0s       p(99.9)=386.15µs
     http_req_duration..............: avg=177.5ms  min=5.65ms  med=162.45ms max=623.78ms p(90)=206.58ms p(95)=243.95ms p(99.9)=550.52ms
       { expected_response:true }...: avg=177.5ms  min=5.65ms  med=162.45ms max=623.78ms p(90)=206.58ms p(95)=243.95ms p(99.9)=550.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33772
     http_req_receiving.............: avg=89.65µs  min=30.69µs med=86.7µs   max=45.45ms  p(90)=117.28µs p(95)=128.81µs p(99.9)=486.56µs
     http_req_sending...............: avg=23.18µs  min=5.72µs  med=17.47µs  max=35.15ms  p(90)=21.93µs  p(95)=23.71µs  p(99.9)=466.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.39ms min=5.57ms  med=162.34ms max=623.67ms p(90)=206.45ms p(95)=243.84ms p(99.9)=550.44ms
     http_reqs......................: 33772   279.475142/s
     iteration_duration.............: avg=178.28ms min=40.88ms med=162.78ms max=624.07ms p(90)=207.03ms p(95)=244.73ms p(99.9)=551ms   
     iterations.....................: 33672   278.647607/s
     success_rate...................: 100.00% ✓ 33672      ✗ 0    
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
data_received..................: 1.2 MB 21 kB/s
     data_sent......................: 17 kB  280 B/s
     http_req_blocked...............: avg=17.08µs  min=2.81µs  med=3.55µs  max=166.91µs p(90)=10.76µs  p(95)=73.8µs   p(99.9)=165.04µs
     http_req_connecting............: avg=6.49µs   min=0s      med=0s      max=84.37µs  p(90)=0s       p(95)=33.75µs  p(99.9)=83.36µs 
     http_req_duration..............: avg=2.34s    min=25.6ms  med=38.72ms max=30.03s   p(90)=46.21ms  p(95)=12.04s   p(99.9)=29.67s  
       { expected_response:true }...: avg=2.34s    min=25.6ms  med=38.72ms max=30.03s   p(90)=46.21ms  p(95)=12.04s   p(99.9)=29.67s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 13  
     http_req_receiving.............: avg=133.59µs min=71.98µs med=87.33µs max=362.01µs p(90)=287.76µs p(95)=336.48µs p(99.9)=361.5µs 
     http_req_sending...............: avg=25.61µs  min=15.95µs med=17.8µs  max=69.63µs  p(90)=45.02µs  p(95)=56.87µs  p(99.9)=69.37µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.34s    min=25.46ms med=38.63ms max=30.03s   p(90)=46.1ms   p(95)=12.04s   p(99.9)=29.67s  
     http_reqs......................: 13     0.216665/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 933060      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=2.81µs   min=862ns   med=2µs     max=15.96ms  p(90)=3.52µs  p(95)=4.28µs  p(99.9)=32.19µs
     http_req_connecting............: avg=281ns    min=0s      med=0s      max=3.51ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.06ms  min=1.49ms  med=18.25ms max=261.33ms p(90)=27.52ms p(95)=31ms    p(99.9)=51.97ms
       { expected_response:true }...: avg=19.06ms  min=1.49ms  med=18.25ms max=261.33ms p(90)=27.52ms p(95)=31ms    p(99.9)=51.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311120
     http_req_receiving.............: avg=530.63µs min=52.38µs med=96.58µs max=43.02ms  p(90)=1.34ms  p(95)=2.12ms  p(99.9)=18.77ms
     http_req_sending...............: avg=42.61µs  min=4.54µs  med=8.47µs  max=186.89ms p(90)=17.12µs p(95)=83.85µs p(99.9)=3.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.49ms  min=1.4ms   med=17.7ms  max=260.8ms  p(90)=26.84ms p(95)=30.23ms p(99.9)=50.02ms
     http_reqs......................: 311120  2588.503676/s
     iteration_duration.............: avg=19.28ms  min=2.72ms  med=18.45ms max=353.94ms p(90)=27.73ms p(95)=31.23ms p(99.9)=52.52ms
     iterations.....................: 311020  2587.67168/s
     success_rate...................: 100.00% ✓ 311020      ✗ 0     
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

     checks.........................: 100.00% ✓ 862335      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.62µs  min=942ns   med=2.08µs  max=4.67ms   p(90)=3.51µs  p(95)=4.2µs    p(99.9)=32.55µs
     http_req_connecting............: avg=142ns   min=0s      med=0s      max=2.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.65ms min=1.76ms  med=20.46ms max=294.81ms p(90)=28.79ms p(95)=31.16ms  p(99.9)=48.49ms
       { expected_response:true }...: avg=20.65ms min=1.76ms  med=20.46ms max=294.81ms p(90)=28.79ms p(95)=31.16ms  p(99.9)=48.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287545
     http_req_receiving.............: avg=83.79µs min=27.39µs med=51.26µs max=118.59ms p(90)=87.92µs p(95)=115.09µs p(99.9)=5.44ms 
     http_req_sending...............: avg=36.9µs  min=4.54µs  med=9.14µs  max=224.57ms p(90)=15.48µs p(95)=29.73µs  p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.53ms min=1.68ms  med=20.36ms max=294.51ms p(90)=28.66ms p(95)=31ms     p(99.9)=47.42ms
     http_reqs......................: 287545  2391.533069/s
     iteration_duration.............: avg=20.86ms min=3.21ms  med=20.66ms max=325.02ms p(90)=28.99ms p(95)=31.37ms  p(99.9)=48.92ms
     iterations.....................: 287445  2390.701361/s
     success_rate...................: 100.00% ✓ 287445      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 861273      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=3.31µs   min=951ns   med=2.56µs  max=20.32ms  p(90)=4.11µs  p(95)=4.81µs  p(99.9)=38.55µs 
     http_req_connecting............: avg=292ns    min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.66ms  min=1.58ms  med=17.33ms max=381.69ms p(90)=33.88ms p(95)=41.48ms p(99.9)=145.79ms
       { expected_response:true }...: avg=20.66ms  min=1.58ms  med=17.33ms max=381.69ms p(90)=33.88ms p(95)=41.48ms p(99.9)=145.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287191
     http_req_receiving.............: avg=589.39µs min=51.95µs med=98.62µs max=142.09ms p(90)=1.12ms  p(95)=1.95ms  p(99.9)=27.87ms 
     http_req_sending...............: avg=42.83µs  min=4.89µs  med=9.66µs  max=90.46ms  p(90)=17.92µs p(95)=89.25µs p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.03ms  min=1.46ms  med=16.79ms max=381.63ms p(90)=32.89ms p(95)=40.29ms p(99.9)=144.81ms
     http_reqs......................: 287191  2389.199279/s
     iteration_duration.............: avg=20.88ms  min=2.65ms  med=17.54ms max=381.82ms p(90)=34.1ms  p(95)=41.73ms p(99.9)=146.98ms
     iterations.....................: 287091  2388.367359/s
     success_rate...................: 100.00% ✓ 287091      ✗ 0     
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

     checks.........................: 100.00% ✓ 848946      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 340 MB  2.8 MB/s
     http_req_blocked...............: avg=3.36µs   min=951ns   med=2.59µs   max=15.26ms  p(90)=4.12µs  p(95)=4.82µs  p(99.9)=37.78µs 
     http_req_connecting............: avg=292ns    min=0s      med=0s       max=3.32ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.97ms  min=1.63ms  med=17.35ms  max=300.58ms p(90)=34.68ms p(95)=42.72ms p(99.9)=155.03ms
       { expected_response:true }...: avg=20.97ms  min=1.63ms  med=17.35ms  max=300.58ms p(90)=34.68ms p(95)=42.72ms p(99.9)=155.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 283082
     http_req_receiving.............: avg=628.87µs min=52.91µs med=100.71µs max=226.09ms p(90)=1.16ms  p(95)=2.02ms  p(99.9)=29.36ms 
     http_req_sending...............: avg=43.07µs  min=4.77µs  med=9.7µs    max=237.9ms  p(90)=17.51µs p(95)=87.87µs p(99.9)=3.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.3ms   min=1.51ms  med=16.78ms  max=300.25ms p(90)=33.67ms p(95)=41.51ms p(99.9)=152.12ms
     http_reqs......................: 283082  2354.95671/s
     iteration_duration.............: avg=21.19ms  min=2.4ms   med=17.56ms  max=300.8ms  p(90)=34.9ms  p(95)=42.98ms p(99.9)=156.43ms
     iterations.....................: 282982  2354.124811/s
     success_rate...................: 100.00% ✓ 282982      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 813156      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 326 MB  2.7 MB/s
     http_req_blocked...............: avg=2.84µs   min=862ns   med=2.19µs   max=6.19ms   p(90)=3.89µs  p(95)=4.65µs  p(99.9)=33.76µs 
     http_req_connecting............: avg=205ns    min=0s      med=0s       max=3ms      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.9ms   min=1.9ms   med=18.49ms  max=421.81ms p(90)=35.46ms p(95)=43.78ms p(99.9)=157.01ms
       { expected_response:true }...: avg=21.9ms   min=1.9ms   med=18.49ms  max=421.81ms p(90)=35.46ms p(95)=43.78ms p(99.9)=157.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 271152
     http_req_receiving.............: avg=594.33µs min=52.74µs med=101.16µs max=200ms    p(90)=1.14ms  p(95)=1.94ms  p(99.9)=27.69ms 
     http_req_sending...............: avg=40.56µs  min=4.75µs  med=9.26µs   max=132.03ms p(90)=19.12µs p(95)=72.48µs p(99.9)=2.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.27ms  min=1.81ms  med=17.94ms  max=421.44ms p(90)=34.48ms p(95)=42.59ms p(99.9)=155.04ms
     http_reqs......................: 271152  2255.041075/s
     iteration_duration.............: avg=22.12ms  min=2.74ms  med=18.7ms   max=422.01ms p(90)=35.69ms p(95)=44.02ms p(99.9)=157.45ms
     iterations.....................: 271052  2254.209423/s
     success_rate...................: 100.00% ✓ 271052      ✗ 0     
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

     checks.........................: 100.00% ✓ 582333      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=4.85µs   min=1.01µs  med=3.03µs  max=9.55ms   p(90)=5.2µs    p(95)=6.28µs  p(99.9)=48.86µs
     http_req_connecting............: avg=1.23µs   min=0s      med=0s      max=9.52ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.64ms  min=2.17ms  med=30.07ms max=291.04ms p(90)=40.6ms   p(95)=44.09ms p(99.9)=66.66ms
       { expected_response:true }...: avg=30.64ms  min=2.17ms  med=30.07ms max=291.04ms p(90)=40.6ms   p(95)=44.09ms p(99.9)=66.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194211
     http_req_receiving.............: avg=103.63µs min=26.36µs med=61.29µs max=250.78ms p(90)=131.99µs p(95)=220.7µs p(99.9)=4.39ms 
     http_req_sending...............: avg=43.31µs  min=5.08µs  med=11.31µs max=107.55ms p(90)=25.45µs  p(95)=116.2µs p(99.9)=3.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.5ms   min=2.1ms   med=29.94ms max=287.15ms p(90)=40.45ms  p(95)=43.9ms  p(99.9)=65.62ms
     http_reqs......................: 194211  1614.657906/s
     iteration_duration.............: avg=30.9ms   min=6.34ms  med=30.31ms max=307.13ms p(90)=40.83ms  p(95)=44.32ms p(99.9)=67.15ms
     iterations.....................: 194111  1613.826512/s
     success_rate...................: 100.00% ✓ 194111      ✗ 0     
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

     checks.........................: 100.00% ✓ 427554      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.87µs  min=1.03µs med=2.87µs  max=3.72ms   p(90)=4.46µs   p(95)=5.17µs   p(99.9)=36.5µs  
     http_req_connecting............: avg=696ns   min=0s     med=0s      max=3.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.84ms min=2.13ms med=41.41ms max=303.32ms p(90)=58.19ms  p(95)=63.19ms  p(99.9)=88.31ms 
       { expected_response:true }...: avg=41.84ms min=2.13ms med=41.41ms max=303.32ms p(90)=58.19ms  p(95)=63.19ms  p(99.9)=88.31ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142618
     http_req_receiving.............: avg=80.24µs min=26.5µs med=65.84µs max=181.52ms p(90)=104.83µs p(95)=122.08µs p(99.9)=858.74µs
     http_req_sending...............: avg=25.68µs min=4.92µs med=12.12µs max=151.44ms p(90)=18.39µs  p(95)=22.07µs  p(99.9)=912.34µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.73ms min=2.01ms med=41.31ms max=302.72ms p(90)=58.08ms  p(95)=63.09ms  p(99.9)=87.96ms 
     http_reqs......................: 142618  1185.577688/s
     iteration_duration.............: avg=42.09ms min=4.41ms med=41.63ms max=314.31ms p(90)=58.4ms   p(95)=63.41ms  p(99.9)=88.68ms 
     iterations.....................: 142518  1184.746392/s
     success_rate...................: 100.00% ✓ 142518      ✗ 0     
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

     checks.........................: 100.00% ✓ 213600     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 86 MB   711 kB/s
     http_req_blocked...............: avg=5.74µs  min=1.09µs  med=3.12µs  max=76.02ms  p(90)=4.63µs   p(95)=5.31µs   p(99.9)=45.34µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.91ms min=3.77ms  med=81.79ms max=325.59ms p(90)=102.76ms p(95)=113.18ms p(99.9)=198.67ms
       { expected_response:true }...: avg=83.91ms min=3.77ms  med=81.79ms max=325.59ms p(90)=102.76ms p(95)=113.18ms p(99.9)=198.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71300
     http_req_receiving.............: avg=85.46µs min=27.99µs med=75.46µs max=126.89ms p(90)=111.19µs p(95)=124.6µs  p(99.9)=624.05µs
     http_req_sending...............: avg=27.24µs min=4.97µs  med=14.89µs max=174.48ms p(90)=21.44µs  p(95)=23.61µs  p(99.9)=612.82µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.8ms  min=3.65ms  med=81.69ms max=321.17ms p(90)=102.65ms p(95)=113.06ms p(99.9)=198.33ms
     http_reqs......................: 71300   591.692018/s
     iteration_duration.............: avg=84.28ms min=28.44ms med=82.04ms max=336.95ms p(90)=103.04ms p(95)=113.49ms p(99.9)=200.24ms
     iterations.....................: 71200   590.862155/s
     success_rate...................: 100.00% ✓ 71200      ✗ 0    
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

     checks.........................: 100.00% ✓ 147963     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   492 kB/s
     http_req_blocked...............: avg=5.36µs   min=1.23µs  med=3.55µs   max=3.23ms   p(90)=5µs      p(95)=5.59µs   p(99.9)=91.06µs 
     http_req_connecting............: avg=1.56µs   min=0s      med=0s       max=3.21ms   p(90)=0s       p(95)=0s       p(99.9)=62.27µs 
     http_req_duration..............: avg=121.16ms min=5.28ms  med=118.93ms max=303.49ms p(90)=160.14ms p(95)=172.5ms  p(99.9)=221.51ms
       { expected_response:true }...: avg=121.16ms min=5.28ms  med=118.93ms max=303.49ms p(90)=160.14ms p(95)=172.5ms  p(99.9)=221.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49421
     http_req_receiving.............: avg=87.19µs  min=34.47µs med=82.83µs  max=17.73ms  p(90)=113.81µs p(95)=126.03µs p(99.9)=601.4µs 
     http_req_sending...............: avg=25.23µs  min=6.19µs  med=16.68µs  max=96.36ms  p(90)=21.93µs  p(95)=23.91µs  p(99.9)=568.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.04ms min=5.14ms  med=118.83ms max=302.72ms p(90)=160.04ms p(95)=172.4ms  p(99.9)=221.42ms
     http_reqs......................: 49421   409.575979/s
     iteration_duration.............: avg=121.67ms min=32.4ms  med=119.27ms max=312.66ms p(90)=160.45ms p(95)=172.8ms  p(99.9)=223.4ms 
     iterations.....................: 49321   408.74723/s
     success_rate...................: 100.00% ✓ 49321      ✗ 0    
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

     checks.........................: 100.00% ✓ 98061      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   326 kB/s
     http_req_blocked...............: avg=6.41µs   min=1.03µs  med=3.31µs   max=3.45ms   p(90)=4.73µs   p(95)=5.34µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=2.87µs   min=0s      med=0s       max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=182.83ms min=6.4ms   med=168.04ms max=664.26ms p(90)=212.61ms p(95)=264.74ms p(99.9)=544.84ms
       { expected_response:true }...: avg=182.83ms min=6.4ms   med=168.04ms max=664.26ms p(90)=212.61ms p(95)=264.74ms p(99.9)=544.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32787
     http_req_receiving.............: avg=98.46µs  min=31.86µs med=89.91µs  max=58.28ms  p(90)=120.46µs p(95)=132.91µs p(99.9)=789.57µs
     http_req_sending...............: avg=33.04µs  min=5.6µs   med=18.25µs  max=85.96ms  p(90)=22.73µs  p(95)=24.62µs  p(99.9)=417.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.7ms  min=6.26ms  med=167.93ms max=664.11ms p(90)=212.49ms p(95)=264.63ms p(99.9)=544.73ms
     http_reqs......................: 32787   271.221181/s
     iteration_duration.............: avg=183.67ms min=31.5ms  med=168.37ms max=664.55ms p(90)=213.08ms p(95)=265.9ms  p(99.9)=545.14ms
     iterations.....................: 32687   270.39396/s
     success_rate...................: 100.00% ✓ 32687      ✗ 0    
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

     checks.........................: 100.00% ✓ 97485      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=11.46µs  min=1.34µs  med=3.63µs   max=7.98ms   p(90)=5.07µs   p(95)=5.66µs   p(99.9)=4.65ms  
     http_req_connecting............: avg=7.01µs   min=0s      med=0s       max=7.93ms   p(90)=0s       p(95)=0s       p(99.9)=4.1ms   
     http_req_duration..............: avg=183.89ms min=7.67ms  med=183.06ms max=395.24ms p(90)=197.35ms p(95)=201.46ms p(99.9)=269.57ms
       { expected_response:true }...: avg=183.89ms min=7.67ms  med=183.06ms max=395.24ms p(90)=197.35ms p(95)=201.46ms p(99.9)=269.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32595
     http_req_receiving.............: avg=99.22µs  min=34.5µs  med=89.4µs   max=78.84ms  p(90)=120.51µs p(95)=132.37µs p(99.9)=580.43µs
     http_req_sending...............: avg=44.69µs  min=5.67µs  med=18.26µs  max=183.52ms p(90)=23.03µs  p(95)=24.95µs  p(99.9)=2.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.75ms min=7.53ms  med=182.94ms max=393.42ms p(90)=197.23ms p(95)=201.31ms p(99.9)=269.38ms
     http_reqs......................: 32595   269.460021/s
     iteration_duration.............: avg=184.75ms min=61.65ms med=183.37ms max=404.57ms p(90)=197.63ms p(95)=201.78ms p(99.9)=277.31ms
     iterations.....................: 32495   268.63333/s
     success_rate...................: 100.00% ✓ 32495      ✗ 0    
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

     checks.........................: 100.00% ✓ 7488      ✗ 0   
     data_received..................: 249 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=98.46µs  min=1.13µs   med=3.23µs  max=8.73ms  p(90)=4.81µs   p(95)=5.69µs   p(99.9)=7.66ms
     http_req_connecting............: avg=93.4µs   min=0s       med=0s      max=8.67ms  p(90)=0s       p(95)=0s       p(99.9)=7.63ms
     http_req_duration..............: avg=2.33s    min=26.38ms  med=2.36s   max=4.39s   p(90)=3.15s    p(95)=3.38s    p(99.9)=4.19s 
       { expected_response:true }...: avg=2.33s    min=26.38ms  med=2.36s   max=4.39s   p(90)=3.15s    p(95)=3.38s    p(99.9)=4.19s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2596
     http_req_receiving.............: avg=102.68µs min=30.21µs  med=95.03µs max=3.54ms  p(90)=137.34µs p(95)=154.98µs p(99.9)=1.46ms
     http_req_sending...............: avg=71.66µs  min=5.32µs   med=18.25µs max=27.82ms p(90)=23.47µs  p(95)=28.43µs  p(99.9)=4.47ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.33s    min=26.22ms  med=2.35s   max=4.39s   p(90)=3.15s    p(95)=3.38s    p(99.9)=4.19s 
     http_reqs......................: 2596    20.677882/s
     iteration_duration.............: avg=2.43s    min=716.16ms med=2.39s   max=4.39s   p(90)=3.16s    p(95)=3.38s    p(99.9)=4.2s  
     iterations.....................: 2496    19.881353/s
     success_rate...................: 100.00% ✓ 2496      ✗ 0   
     vus............................: 38      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

