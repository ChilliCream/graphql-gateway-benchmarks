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
| hive-router | v0.0.83 | 2,890 | 3,158 | 2,820 | 4.0% |  |
| fusion-nightly-net11 | 16.5.1-p.1 | 2,575 | 2,684 | 2,565 | 1.7% |  |
| fusion | 16.5.0 | 2,545 | 2,656 | 2,539 | 1.6% |  |
| fusion-nightly | 16.5.1-p.1 | 2,497 | 2,624 | 2,458 | 2.3% |  |
| grafbase | 0.53.5 | 2,169 | 2,284 | 2,155 | 2.1% |  |
| cosmo | 0.331.1 | 1,332 | 1,372 | 1,328 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.4 | 609 | 630 | 608 | 1.3% |  |
| apollo-router | v2.16.0 | 489 | 499 | 480 | 1.1% |  |
| apollo-gateway | 2.14.2 | 284 | 288 | 283 | 0.6% |  |
| hive-gateway | 2.10.4 | 280 | 287 | 278 | 1.2% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1200 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,580 | 2,753 | 2,560 | 2.5% |  |
| fusion-nightly | 16.5.1-p.1 | 2,423 | 2,521 | 2,414 | 1.6% |  |
| fusion | 16.5.0 | 2,385 | 2,495 | 2,377 | 1.7% |  |
| fusion-nightly-net11 | 16.5.1-p.1 | 2,371 | 2,487 | 2,360 | 1.9% |  |
| fusion-nightly-fed | 16.5.1-p.1 | 2,217 | 2,316 | 2,210 | 1.7% |  |
| grafbase | 0.53.5 | 1,632 | 1,687 | 1,630 | 1.2% |  |
| cosmo | 0.331.1 | 1,230 | 1,280 | 1,226 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.4 | 572 | 594 | 570 | 1.6% |  |
| apollo-router | v2.16.0 | 449 | 467 | 447 | 1.7% |  |
| apollo-gateway | 2.14.2 | 272 | 276 | 271 | 0.6% |  |
| hive-gateway | 2.10.4 | 268 | 276 | 266 | 1.1% |  |
| feddi | 5ff8b6165878 | 24 | 25 | 23 | 2.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1042014     ✗ 0     
     data_received..................: 31 GB   254 MB/s
     data_sent......................: 418 MB  3.5 MB/s
     http_req_blocked...............: avg=2.62µs  min=922ns   med=1.92µs  max=16.28ms  p(90)=3.19µs  p(95)=3.82µs   p(99.9)=28.45µs
     http_req_connecting............: avg=244ns   min=0s      med=0s      max=3.29ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.06ms min=1.5ms   med=16.48ms max=283.58ms p(90)=24.63ms p(95)=27.58ms  p(99.9)=46.97ms
       { expected_response:true }...: avg=17.06ms min=1.5ms   med=16.48ms max=283.58ms p(90)=24.63ms p(95)=27.58ms  p(99.9)=46.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 347438
     http_req_receiving.............: avg=81.37µs min=25.32µs med=46.56µs max=72.8ms   p(90)=82.33µs p(95)=126.68µs p(99.9)=6.22ms 
     http_req_sending...............: avg=44.79µs min=4.56µs  med=8.26µs  max=101.77ms p(90)=14.21µs p(95)=83.61µs  p(99.9)=5.75ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.93ms min=1.44ms  med=16.38ms max=283.03ms p(90)=24.47ms p(95)=27.37ms  p(99.9)=45.86ms
     http_reqs......................: 347438  2890.598382/s
     iteration_duration.............: avg=17.26ms min=2.14ms  med=16.67ms max=307.52ms p(90)=24.83ms p(95)=27.8ms   p(99.9)=47.65ms
     iterations.....................: 347338  2889.766407/s
     success_rate...................: 100.00% ✓ 347338      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 928539      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=3.16µs   min=852ns   med=1.85µs   max=19.06ms  p(90)=2.99µs  p(95)=3.55µs  p(99.9)=27.54µs
     http_req_connecting............: avg=875ns    min=0s      med=0s       max=8.55ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.17ms  min=1.88ms  med=18.3ms   max=309.73ms p(90)=27.65ms p(95)=31.17ms p(99.9)=51.03ms
       { expected_response:true }...: avg=19.17ms  min=1.88ms  med=18.3ms   max=309.73ms p(90)=27.65ms p(95)=31.17ms p(99.9)=51.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309613
     http_req_receiving.............: avg=682.73µs min=50.12µs med=111.15µs max=119.37ms p(90)=1.68ms  p(95)=2.45ms  p(99.9)=19.62ms
     http_req_sending...............: avg=39.41µs  min=4.54µs  med=7.92µs   max=187.24ms p(90)=13.61µs p(95)=76.24µs p(99.9)=2.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.44ms  min=1.81ms  med=17.58ms  max=234.65ms p(90)=26.8ms  p(95)=30.25ms p(99.9)=49.49ms
     http_reqs......................: 309613  2575.075909/s
     iteration_duration.............: avg=19.37ms  min=3.07ms  med=18.49ms  max=323.08ms p(90)=27.86ms p(95)=31.4ms  p(99.9)=51.51ms
     iterations.....................: 309513  2574.244201/s
     success_rate...................: 100.00% ✓ 309513      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 918051      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=2.59µs   min=871ns  med=1.85µs  max=18.46ms  p(90)=2.98µs  p(95)=3.56µs  p(99.9)=26.97µs 
     http_req_connecting............: avg=270ns    min=0s     med=0s      max=3.16ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.39ms  min=2.07ms med=16.68ms max=300.18ms p(90)=31.41ms p(95)=38.01ms p(99.9)=119.72ms
       { expected_response:true }...: avg=19.39ms  min=2.07ms med=16.68ms max=300.18ms p(90)=31.41ms p(95)=38.01ms p(99.9)=119.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306117
     http_req_receiving.............: avg=548.71µs min=50.1µs med=88.76µs max=161.66ms p(90)=1.04ms  p(95)=1.83ms  p(99.9)=24.59ms 
     http_req_sending...............: avg=39.94µs  min=4.22µs med=8.03µs  max=49.71ms  p(90)=14.1µs  p(95)=74.95µs p(99.9)=3.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.8ms   min=1.93ms med=16.17ms max=299.62ms p(90)=30.47ms p(95)=36.97ms p(99.9)=117.95ms
     http_reqs......................: 306117  2545.462861/s
     iteration_duration.............: avg=19.59ms  min=3.15ms med=16.87ms max=347.01ms p(90)=31.63ms p(95)=38.24ms p(99.9)=120.52ms
     iterations.....................: 306017  2544.631328/s
     success_rate...................: 100.00% ✓ 306017      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 900699      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=2.58µs   min=881ns   med=1.9µs   max=6.34ms   p(90)=3.08µs  p(95)=3.65µs  p(99.9)=29.63µs 
     http_req_connecting............: avg=313ns    min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.77ms  min=2.03ms  med=17.02ms max=283.58ms p(90)=32.02ms p(95)=38.8ms  p(99.9)=128.28ms
       { expected_response:true }...: avg=19.77ms  min=2.03ms  med=17.02ms max=283.58ms p(90)=32.02ms p(95)=38.8ms  p(99.9)=128.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300333
     http_req_receiving.............: avg=578.61µs min=50.61µs med=90.47µs max=136.07ms p(90)=1.09ms  p(95)=1.91ms  p(99.9)=26.53ms 
     http_req_sending...............: avg=39.91µs  min=4.49µs  med=8.2µs   max=169.05ms p(90)=14.18µs p(95)=69.96µs p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.15ms  min=1.93ms  med=16.48ms max=283.03ms p(90)=31.05ms p(95)=37.62ms p(99.9)=127.13ms
     http_reqs......................: 300333  2497.462573/s
     iteration_duration.............: avg=19.97ms  min=3.06ms  med=17.21ms max=296.71ms p(90)=32.24ms p(95)=39.03ms p(99.9)=128.89ms
     iterations.....................: 300233  2496.631009/s
     success_rate...................: 100.00% ✓ 300233      ✗ 0     
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

     checks.........................: 100.00% ✓ 782310      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=3.14µs  min=851ns   med=2.46µs  max=11.1ms   p(90)=4.02µs  p(95)=4.76µs   p(99.9)=36.27µs
     http_req_connecting............: avg=270ns   min=0s      med=0s      max=2.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.78ms min=1.68ms  med=22.56ms max=289.23ms p(90)=26.97ms p(95)=28.61ms  p(99.9)=47.94ms
       { expected_response:true }...: avg=22.78ms min=1.68ms  med=22.56ms max=289.23ms p(90)=26.97ms p(95)=28.61ms  p(99.9)=47.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260870
     http_req_receiving.............: avg=88.46µs min=27.34µs med=56.31µs max=188.83ms p(90)=94.91µs p(95)=121.12µs p(99.9)=4.85ms 
     http_req_sending...............: avg=34.52µs min=4.59µs  med=10.15µs max=213.86ms p(90)=17.14µs p(95)=27.45µs  p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.66ms min=1.6ms   med=22.46ms max=288.48ms p(90)=26.84ms p(95)=28.45ms  p(99.9)=46.69ms
     http_reqs......................: 260870  2169.942366/s
     iteration_duration.............: avg=22.99ms min=4.04ms  med=22.76ms max=307.54ms p(90)=27.17ms p(95)=28.83ms  p(99.9)=48.52ms
     iterations.....................: 260770  2169.110556/s
     success_rate...................: 100.00% ✓ 260770      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 480552      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.06µs  med=2.55µs  max=3.48ms   p(90)=4.06µs  p(95)=4.72µs   p(99.9)=32.44µs 
     http_req_connecting............: avg=543ns   min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.22ms min=2.01ms  med=36.84ms max=301.58ms p(90)=51.98ms p(95)=56.55ms  p(99.9)=77.77ms 
       { expected_response:true }...: avg=37.22ms min=2.01ms  med=36.84ms max=301.58ms p(90)=51.98ms p(95)=56.55ms  p(99.9)=77.77ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 160284
     http_req_receiving.............: avg=74.42µs min=26.68µs med=60.01µs max=127.28ms p(90)=96.46µs p(95)=112.85µs p(99.9)=915.13µs
     http_req_sending...............: avg=24.5µs  min=4.85µs  med=10.7µs  max=166.04ms p(90)=16.79µs p(95)=20.81µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.12ms min=1.92ms  med=36.74ms max=290.1ms  p(90)=51.87ms p(95)=56.43ms  p(99.9)=77.57ms 
     http_reqs......................: 160284  1332.821363/s
     iteration_duration.............: avg=37.44ms min=3.56ms  med=37.04ms max=312.15ms p(90)=52.19ms p(95)=56.74ms  p(99.9)=78.48ms 
     iterations.....................: 160184  1331.989826/s
     success_rate...................: 100.00% ✓ 160184      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 219990     ✗ 0    
     data_received..................: 6.4 GB  54 MB/s
     data_sent......................: 88 MB   732 kB/s
     http_req_blocked...............: avg=4.83µs  min=1.14µs  med=2.85µs  max=7.13ms   p(90)=4.29µs   p(95)=4.91µs   p(99.9)=49.3µs  
     http_req_connecting............: avg=1.66µs  min=0s      med=0s      max=6.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.49ms min=3.68ms  med=80.06ms max=295.87ms p(90)=101.07ms p(95)=110.73ms p(99.9)=195.68ms
       { expected_response:true }...: avg=81.49ms min=3.68ms  med=80.06ms max=295.87ms p(90)=101.07ms p(95)=110.73ms p(99.9)=195.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73430
     http_req_receiving.............: avg=77.65µs min=28.27µs med=67.22µs max=70.7ms   p(90)=102.77µs p(95)=115.8µs  p(99.9)=644.02µs
     http_req_sending...............: avg=23.4µs  min=5.27µs  med=13.07µs max=103.74ms p(90)=19.83µs  p(95)=22.12µs  p(99.9)=699.91µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.39ms min=3.58ms  med=79.97ms max=272.58ms p(90)=100.97ms p(95)=110.63ms p(99.9)=195.57ms
     http_reqs......................: 73430   609.460036/s
     iteration_duration.............: avg=81.83ms min=18.61ms med=80.3ms  max=311.91ms p(90)=101.33ms p(95)=110.99ms p(99.9)=197.6ms 
     iterations.....................: 73330   608.630048/s
     success_rate...................: 100.00% ✓ 73330      ✗ 0    
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

     checks.........................: 100.00% ✓ 176919     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   588 kB/s
     http_req_blocked...............: avg=5.2µs    min=1.27µs  med=3.31µs   max=4.04ms   p(90)=4.73µs   p(95)=5.34µs   p(99.9)=54.38µs 
     http_req_connecting............: avg=1.66µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.33ms min=4.39ms  med=100.95ms max=338ms    p(90)=122.24ms p(95)=128.5ms  p(99.9)=160.73ms
       { expected_response:true }...: avg=101.33ms min=4.39ms  med=100.95ms max=338ms    p(90)=122.24ms p(95)=128.5ms  p(99.9)=160.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59073
     http_req_receiving.............: avg=84.58µs  min=32.11µs med=74.19µs  max=224.38ms p(90)=106.65µs p(95)=119.46µs p(99.9)=515.21µs
     http_req_sending...............: avg=23.82µs  min=6.2µs   med=15.82µs  max=98.58ms  p(90)=21.65µs  p(95)=23.61µs  p(99.9)=556.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.23ms min=4.33ms  med=100.85ms max=337.88ms p(90)=122.13ms p(95)=128.38ms p(99.9)=160.2ms 
     http_reqs......................: 59073   489.892532/s
     iteration_duration.............: avg=101.76ms min=18.31ms med=101.23ms max=348.65ms p(90)=122.52ms p(95)=128.75ms p(99.9)=163.55ms
     iterations.....................: 58973   489.063232/s
     success_rate...................: 100.00% ✓ 58973      ✗ 0    
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

     checks.........................: 100.00% ✓ 103056     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=6.42µs   min=1.3µs   med=3.56µs   max=4.25ms   p(90)=4.98µs   p(95)=5.55µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=2.62µs   min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=173.95ms min=7.64ms  med=176.01ms max=389.78ms p(90)=195.44ms p(95)=200.71ms p(99.9)=256.26ms
       { expected_response:true }...: avg=173.95ms min=7.64ms  med=176.01ms max=389.78ms p(90)=195.44ms p(95)=200.71ms p(99.9)=256.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34452
     http_req_receiving.............: avg=94.57µs  min=32.34µs med=84.67µs  max=100.49ms p(90)=114.7µs  p(95)=125.46µs p(99.9)=458.92µs
     http_req_sending...............: avg=30.17µs  min=6.25µs  med=17.72µs  max=90.43ms  p(90)=22.31µs  p(95)=24.09µs  p(99.9)=542.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.82ms min=7.46ms  med=175.9ms  max=389.68ms p(90)=195.32ms p(95)=200.61ms p(99.9)=255.81ms
     http_reqs......................: 34452   284.892692/s
     iteration_duration.............: avg=174.74ms min=28.25ms med=176.68ms max=403.86ms p(90)=195.73ms p(95)=201.02ms p(99.9)=263.75ms
     iterations.....................: 34352   284.065766/s
     success_rate...................: 100.00% ✓ 34352      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 101445     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.08µs   min=1.13µs  med=3.2µs    max=4.01ms   p(90)=4.59µs   p(95)=5.14µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=2.68µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=176.74ms min=5.6ms   med=163.47ms max=751.04ms p(90)=208.71ms p(95)=254.82ms p(99.9)=619.65ms
       { expected_response:true }...: avg=176.74ms min=5.6ms   med=163.47ms max=751.04ms p(90)=208.71ms p(95)=254.82ms p(99.9)=619.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33915
     http_req_receiving.............: avg=89.57µs  min=30.46µs med=87.61µs  max=10.79ms  p(90)=117.38µs p(95)=129.02µs p(99.9)=579.37µs
     http_req_sending...............: avg=23.64µs  min=5.08µs  med=17.31µs  max=74.19ms  p(90)=21.71µs  p(95)=23.4µs   p(99.9)=526.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.63ms min=5.47ms  med=163.36ms max=750.94ms p(90)=208.61ms p(95)=254.62ms p(99.9)=619.54ms
     http_reqs......................: 33915   280.433062/s
     iteration_duration.............: avg=177.53ms min=17.31ms med=163.83ms max=751.37ms p(90)=209.13ms p(95)=256.2ms  p(99.9)=620.01ms
     iterations.....................: 33815   279.606191/s
     success_rate...................: 100.00% ✓ 33815      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 930591      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.99µs  min=852ns   med=2.34µs  max=11.87ms  p(90)=3.98µs  p(95)=4.72µs  p(99.9)=37.54µs
     http_req_connecting............: avg=210ns   min=0s      med=0s      max=3.57ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.11ms min=1.73ms  med=18.85ms max=277.5ms  p(90)=26.4ms  p(95)=28.84ms p(99.9)=47.47ms
       { expected_response:true }...: avg=19.11ms min=1.73ms  med=18.85ms max=277.5ms  p(90)=26.4ms  p(95)=28.84ms p(99.9)=47.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310297
     http_req_receiving.............: avg=89.89µs min=26.08µs med=50.96µs max=67.35ms  p(90)=92.86µs p(95)=140.1µs p(99.9)=6.55ms 
     http_req_sending...............: avg=44.36µs min=4.58µs  med=9.68µs  max=167.45ms p(90)=17.72µs p(95)=92.45µs p(99.9)=3.9ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.98ms min=1.63ms  med=18.73ms max=276.98ms p(90)=26.25ms p(95)=28.62ms p(99.9)=46.71ms
     http_reqs......................: 310297  2580.993132/s
     iteration_duration.............: avg=19.33ms min=2.99ms  med=19.04ms max=326.37ms p(90)=26.61ms p(95)=29.05ms p(99.9)=48.38ms
     iterations.....................: 310197  2580.161351/s
     success_rate...................: 100.00% ✓ 310197      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 873816      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=2.75µs   min=851ns   med=1.97µs  max=15.15ms  p(90)=3.37µs  p(95)=4.04µs  p(99.9)=32.68µs 
     http_req_connecting............: avg=351ns    min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.38ms  min=1.62ms  med=17.16ms max=399.49ms p(90)=33.35ms p(95)=40.76ms p(99.9)=145.25ms
       { expected_response:true }...: avg=20.38ms  min=1.62ms  med=17.16ms max=399.49ms p(90)=33.35ms p(95)=40.76ms p(99.9)=145.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291372
     http_req_receiving.............: avg=564.12µs min=51.38µs med=92.34µs max=152.25ms p(90)=1.07ms  p(95)=1.85ms  p(99.9)=26.77ms 
     http_req_sending...............: avg=40.45µs  min=4.41µs  med=8.56µs  max=105.89ms p(90)=16.57µs p(95)=65.59µs p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.77ms  min=1.51ms  med=16.64ms max=392.69ms p(90)=32.38ms p(95)=39.65ms p(99.9)=143.55ms
     http_reqs......................: 291372  2423.892543/s
     iteration_duration.............: avg=20.59ms  min=2.64ms  med=17.36ms max=399.67ms p(90)=33.57ms p(95)=40.99ms p(99.9)=145.99ms
     iterations.....................: 291272  2423.060654/s
     success_rate...................: 100.00% ✓ 291272      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 859998      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=2.93µs   min=862ns   med=2.07µs  max=15.06ms  p(90)=3.58µs  p(95)=4.34µs  p(99.9)=30.59µs 
     http_req_connecting............: avg=297ns    min=0s      med=0s      max=3.47ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.7ms   min=1.6ms   med=17.32ms max=365.83ms p(90)=33.84ms p(95)=41.51ms p(99.9)=152.49ms
       { expected_response:true }...: avg=20.7ms   min=1.6ms   med=17.32ms max=365.83ms p(90)=33.84ms p(95)=41.51ms p(99.9)=152.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286766
     http_req_receiving.............: avg=583.88µs min=51.76µs med=95.88µs max=176.58ms p(90)=1.1ms   p(95)=1.88ms  p(99.9)=28.04ms 
     http_req_sending...............: avg=43.69µs  min=4.79µs  med=8.9µs   max=194.56ms p(90)=17.77µs p(95)=78.48µs p(99.9)=3.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.07ms  min=1.49ms  med=16.78ms max=365.73ms p(90)=32.82ms p(95)=40.32ms p(99.9)=150.79ms
     http_reqs......................: 286766  2385.552563/s
     iteration_duration.............: avg=20.92ms  min=2.91ms  med=17.53ms max=366.01ms p(90)=34.07ms p(95)=41.74ms p(99.9)=153.29ms
     iterations.....................: 286666  2384.720682/s
     success_rate...................: 100.00% ✓ 286666      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 854679      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.8 MB/s
     http_req_blocked...............: avg=3.26µs  min=851ns   med=1.92µs   max=9.46ms   p(90)=3.4µs   p(95)=4.11µs  p(99.9)=33.28µs
     http_req_connecting............: avg=867ns   min=0s      med=0s       max=9.02ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.83ms min=1.52ms  med=19.98ms  max=273.36ms p(90)=30.14ms p(95)=33.78ms p(99.9)=54.76ms
       { expected_response:true }...: avg=20.83ms min=1.52ms  med=19.98ms  max=273.36ms p(90)=30.14ms p(95)=33.78ms p(99.9)=54.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284993
     http_req_receiving.............: avg=805.9µs min=52.54µs med=142.16µs max=174.24ms p(90)=1.96ms  p(95)=2.9ms   p(99.9)=21.71ms
     http_req_sending...............: avg=40.05µs min=4.55µs  med=8.2µs    max=192.79ms p(90)=17.14µs p(95)=75.38µs p(99.9)=3.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.98ms min=1.43ms  med=19.13ms  max=273.04ms p(90)=29.14ms p(95)=32.72ms p(99.9)=52.59ms
     http_reqs......................: 284993  2371.022018/s
     iteration_duration.............: avg=21.05ms min=3.22ms  med=20.18ms  max=294.26ms p(90)=30.35ms p(95)=34ms    p(99.9)=55.44ms
     iterations.....................: 284893  2370.19006/s
     success_rate...................: 100.00% ✓ 284893      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 799581      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 320 MB  2.7 MB/s
     http_req_blocked...............: avg=3.42µs   min=932ns   med=2.58µs   max=14.83ms  p(90)=4.34µs  p(95)=5.11µs  p(99.9)=38.38µs 
     http_req_connecting............: avg=345ns    min=0s      med=0s       max=4.12ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.27ms  min=2.04ms  med=18.84ms  max=336.09ms p(90)=35.7ms  p(95)=43.89ms p(99.9)=153.65ms
       { expected_response:true }...: avg=22.27ms  min=2.04ms  med=18.84ms  max=336.09ms p(90)=35.7ms  p(95)=43.89ms p(99.9)=153.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266627
     http_req_receiving.............: avg=573.47µs min=49.78µs med=101.62µs max=183.06ms p(90)=1.12ms  p(95)=1.9ms   p(99.9)=27.36ms 
     http_req_sending...............: avg=42.5µs   min=4.7µs   med=10.51µs  max=179.23ms p(90)=20.45µs p(95)=84.42µs p(99.9)=2.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.65ms  min=1.93ms  med=18.29ms  max=335.88ms p(90)=34.7ms  p(95)=42.74ms p(99.9)=151.98ms
     http_reqs......................: 266627  2217.185084/s
     iteration_duration.............: avg=22.5ms   min=3.16ms  med=19.05ms  max=336.31ms p(90)=35.93ms p(95)=44.13ms p(99.9)=154.99ms
     iterations.....................: 266527  2216.353516/s
     success_rate...................: 100.00% ✓ 266527      ✗ 0     
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

     checks.........................: 100.00% ✓ 588804      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 236 MB  2.0 MB/s
     http_req_blocked...............: avg=3.19µs  min=841ns   med=2.16µs  max=3.44ms   p(90)=4.34µs   p(95)=5.4µs    p(99.9)=43.32µs
     http_req_connecting............: avg=423ns   min=0s      med=0s      max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.32ms min=2.16ms  med=29.85ms max=289.77ms p(90)=40.31ms  p(95)=43.63ms  p(99.9)=66.87ms
       { expected_response:true }...: avg=30.32ms min=2.16ms  med=29.85ms max=289.77ms p(90)=40.31ms  p(95)=43.63ms  p(99.9)=66.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196368
     http_req_receiving.............: avg=94.09µs min=26.83µs med=52.73µs max=107.43ms p(90)=120.81µs p(95)=194.65µs p(99.9)=4.72ms 
     http_req_sending...............: avg=40.33µs min=4.7µs   med=9.12µs  max=111.53ms p(90)=23.59µs  p(95)=103.71µs p(99.9)=2.9ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.18ms min=2.09ms  med=29.73ms max=289.16ms p(90)=40.15ms  p(95)=43.47ms  p(99.9)=65.88ms
     http_reqs......................: 196368  1632.495921/s
     iteration_duration.............: avg=30.56ms min=4.25ms  med=30.07ms max=301.52ms p(90)=40.53ms  p(95)=43.86ms  p(99.9)=67.2ms 
     iterations.....................: 196268  1631.664576/s
     success_rate...................: 100.00% ✓ 196268      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443907      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.88µs  min=1.15µs  med=2.89µs  max=4.09ms   p(90)=4.52µs   p(95)=5.24µs  p(99.9)=37.04µs
     http_req_connecting............: avg=644ns   min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=40.28ms min=2.11ms  med=39.89ms max=300.42ms p(90)=56.07ms  p(95)=61.03ms p(99.9)=84.17ms
       { expected_response:true }...: avg=40.28ms min=2.11ms  med=39.89ms max=300.42ms p(90)=56.07ms  p(95)=61.03ms p(99.9)=84.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148069
     http_req_receiving.............: avg=83.43µs min=27.39µs med=71.16µs max=68.52ms  p(90)=109.58µs p(95)=125.7µs p(99.9)=1.01ms 
     http_req_sending...............: avg=26.79µs min=5.18µs  med=12.97µs max=115.31ms p(90)=19.83µs  p(95)=23.9µs  p(99.9)=1ms    
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=40.17ms min=2ms     med=39.79ms max=300.05ms p(90)=55.96ms  p(95)=60.91ms p(99.9)=83.72ms
     http_reqs......................: 148069  1230.852059/s
     iteration_duration.............: avg=40.54ms min=4.26ms  med=40.12ms max=310.83ms p(90)=56.3ms   p(95)=61.25ms p(99.9)=84.57ms
     iterations.....................: 147969  1230.02079/s
     success_rate...................: 100.00% ✓ 147969      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 206529     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   687 kB/s
     http_req_blocked...............: avg=4.84µs  min=1.29µs  med=3.19µs  max=3.56ms   p(90)=4.67µs   p(95)=5.33µs   p(99.9)=47.39µs 
     http_req_connecting............: avg=1.35µs  min=0s      med=0s      max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.79ms min=3.91ms  med=84.69ms max=320.2ms  p(90)=105.56ms p(95)=115.61ms p(99.9)=204.75ms
       { expected_response:true }...: avg=86.79ms min=3.91ms  med=84.69ms max=320.2ms  p(90)=105.56ms p(95)=115.61ms p(99.9)=204.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68943
     http_req_receiving.............: avg=86.07µs min=30.49µs med=77.32µs max=73.22ms  p(90)=112.52µs p(95)=126.19µs p(99.9)=686.89µs
     http_req_sending...............: avg=25.17µs min=5.49µs  med=14.77µs max=142.65ms p(90)=21.31µs  p(95)=23.65µs  p(99.9)=629.1µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.68ms min=3.79ms  med=84.59ms max=319.6ms  p(90)=105.45ms p(95)=115.47ms p(99.9)=204.43ms
     http_reqs......................: 68943   572.05872/s
     iteration_duration.............: avg=87.17ms min=22.45ms med=84.94ms max=347.81ms p(90)=105.82ms p(95)=115.93ms p(99.9)=206.94ms
     iterations.....................: 68843   571.228964/s
     success_rate...................: 100.00% ✓ 68843      ✗ 0    
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

     checks.........................: 100.00% ✓ 162318     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=5.8µs    min=1.28µs  med=3.81µs   max=3.68ms   p(90)=5.41µs   p(95)=6.02µs   p(99.9)=72.43µs 
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.45ms min=5.27ms  med=108.23ms max=328.69ms p(90)=145.72ms p(95)=156.92ms p(99.9)=198.53ms
       { expected_response:true }...: avg=110.45ms min=5.27ms  med=108.23ms max=328.69ms p(90)=145.72ms p(95)=156.92ms p(99.9)=198.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54206
     http_req_receiving.............: avg=90.47µs  min=32.23µs med=84.13µs  max=88.47ms  p(90)=114.92µs p(95)=127.2µs  p(99.9)=591.44µs
     http_req_sending...............: avg=27.43µs  min=6.3µs   med=17.78µs  max=149.07ms p(90)=23.13µs  p(95)=25.16µs  p(99.9)=574.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.33ms min=5.13ms  med=108.12ms max=328.34ms p(90)=145.6ms  p(95)=156.8ms  p(99.9)=198.13ms
     http_reqs......................: 54206   449.235829/s
     iteration_duration.............: avg=110.92ms min=21.5ms  med=108.57ms max=349.29ms p(90)=146.04ms p(95)=157.27ms p(99.9)=199.42ms
     iterations.....................: 54106   448.407073/s
     success_rate...................: 100.00% ✓ 54106      ✗ 0    
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

     checks.........................: 100.00% ✓ 98571      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.44µs   min=1.14µs  med=3.3µs    max=4.11ms   p(90)=4.67µs   p(95)=5.22µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=181.88ms min=7.71ms  med=183.29ms max=363.46ms p(90)=204.57ms p(95)=210.25ms p(99.9)=275.49ms
       { expected_response:true }...: avg=181.88ms min=7.71ms  med=183.29ms max=363.46ms p(90)=204.57ms p(95)=210.25ms p(99.9)=275.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32957
     http_req_receiving.............: avg=94.18µs  min=30.47µs med=90.1µs   max=89.07ms  p(90)=120.26µs p(95)=131.75µs p(99.9)=462.61µs
     http_req_sending...............: avg=24.68µs  min=5.13µs  med=17.13µs  max=62.21ms  p(90)=21.56µs  p(95)=23.45µs  p(99.9)=541.17µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.76ms min=7.54ms  med=183.17ms max=362.34ms p(90)=204.46ms p(95)=210.14ms p(99.9)=275.27ms
     http_reqs......................: 32957   272.465438/s
     iteration_duration.............: avg=182.71ms min=40.98ms med=184.63ms max=379.76ms p(90)=204.85ms p(95)=210.55ms p(99.9)=277.12ms
     iterations.....................: 32857   271.638708/s
     success_rate...................: 100.00% ✓ 32857      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96912      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   322 kB/s
     http_req_blocked...............: avg=5.7µs    min=1.13µs  med=3.73µs   max=3.36ms   p(90)=5.2µs    p(95)=5.83µs   p(99.9)=467.24µs
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=448.73µs
     http_req_duration..............: avg=185.01ms min=5.97ms  med=170.39ms max=744.78ms p(90)=216.08ms p(95)=264.63ms p(99.9)=607.27ms
       { expected_response:true }...: avg=185.01ms min=5.97ms  med=170.39ms max=744.78ms p(90)=216.08ms p(95)=264.63ms p(99.9)=607.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32404
     http_req_receiving.............: avg=97.15µs  min=29.32µs med=90.21µs  max=59.57ms  p(90)=121.29µs p(95)=133.83µs p(99.9)=927.52µs
     http_req_sending...............: avg=23.52µs  min=5.81µs  med=18.4µs   max=47.81ms  p(90)=23.27µs  p(95)=25.26µs  p(99.9)=613.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.89ms min=5.84ms  med=170.28ms max=744.65ms p(90)=215.94ms p(95)=264.51ms p(99.9)=607.16ms
     http_reqs......................: 32404   268.111335/s
     iteration_duration.............: avg=185.85ms min=48.88ms med=170.75ms max=745.02ms p(90)=216.48ms p(95)=266.71ms p(99.9)=607.69ms
     iterations.....................: 32304   267.283933/s
     success_rate...................: 100.00% ✓ 32304      ✗ 0    
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

     checks.........................: 100.00% ✓ 8916      ✗ 0   
     data_received..................: 294 MB  2.3 MB/s
     data_sent......................: 3.7 MB  29 kB/s
     http_req_blocked...............: avg=31.92µs  min=1.47µs   med=3.81µs  max=3.46ms  p(90)=5.51µs   p(95)=6.37µs   p(99.9)=3.19ms  
     http_req_connecting............: avg=27.55µs  min=0s       med=0s      max=3.42ms  p(90)=0s       p(95)=0s       p(99.9)=3.16ms  
     http_req_duration..............: avg=1.97s    min=24.9ms   med=1.99s   max=3.88s   p(90)=2.79s    p(95)=2.99s    p(99.9)=3.65s   
       { expected_response:true }...: avg=1.97s    min=24.9ms   med=1.99s   max=3.88s   p(90)=2.79s    p(95)=2.99s    p(99.9)=3.65s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 3072
     http_req_receiving.............: avg=113.42µs min=32.51µs  med=99.9µs  max=23.81ms p(90)=142.22µs p(95)=160.36µs p(99.9)=882.25µs
     http_req_sending...............: avg=42.78µs  min=6.61µs   med=20.32µs max=10.15ms p(90)=25.96µs  p(95)=30.21µs  p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.97s    min=24.74ms  med=1.99s   max=3.88s   p(90)=2.79s    p(95)=2.99s    p(99.9)=3.65s   
     http_reqs......................: 3072    24.522216/s
     iteration_duration.............: avg=2.03s    min=266.54ms med=2.01s   max=3.88s   p(90)=2.8s     p(95)=2.99s    p(99.9)=3.65s   
     iterations.....................: 2972    23.723967/s
     success_rate...................: 100.00% ✓ 2972      ✗ 0   
     vus............................: 29      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

