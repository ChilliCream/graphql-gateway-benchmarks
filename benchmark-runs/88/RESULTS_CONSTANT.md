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
| hive-router | v0.0.41 | 2,831 | 2,992 | 2,768 | 2.5% |  |
| grafbase | 0.53.2 | 2,048 | 2,113 | 2,025 | 1.5% |  |
| hotchocolate | 16.0.0-rc.1.0 | 1,844 | 1,872 | 1,829 | 0.7% |  |
| cosmo | 0.291.0 | 1,254 | 1,269 | 1,253 | 0.6% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 534 | 546 | 530 | 1.0% |  |
| apollo-router | v2.12.0 | 424 | 428 | 413 | 1.4% |  |
| hive-gateway | 2.5.6 | 270 | 272 | 268 | 0.6% |  |
| apollo-gateway | 2.13.2 | 243 | 245 | 242 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,427 | 2,530 | 2,395 | 1.8% |  |
| hotchocolate | 16.0.0-rc.1.0 | 1,662 | 1,683 | 1,638 | 0.8% |  |
| grafbase | 0.53.2 | 1,531 | 1,569 | 1,520 | 1.0% |  |
| cosmo | 0.291.0 | 1,186 | 1,204 | 1,179 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 494 | 507 | 490 | 1.2% |  |
| apollo-router | v2.12.0 | 374 | 384 | 369 | 1.4% |  |
| hive-gateway | 2.5.6 | 267 | 271 | 264 | 0.9% |  |
| apollo-gateway | 2.13.2 | 234 | 237 | 233 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1020756     ✗ 0     
     data_received..................: 30 GB   248 MB/s
     data_sent......................: 409 MB  3.4 MB/s
     http_req_blocked...............: avg=3.37µs   min=1.06µs  med=2.39µs  max=26.04ms  p(90)=3.59µs  p(95)=4.22µs   p(99.9)=36.8µs 
     http_req_connecting............: avg=316ns    min=0s      med=0s      max=4.63ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.39ms  min=1.51ms  med=16.49ms max=337.35ms p(90)=25.76ms p(95)=29.63ms  p(99.9)=52.71ms
       { expected_response:true }...: avg=17.39ms  min=1.51ms  med=16.49ms max=337.35ms p(90)=25.76ms p(95)=29.63ms  p(99.9)=52.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 340352
     http_req_receiving.............: avg=132.56µs min=28.25µs med=51.33µs max=66.17ms  p(90)=98.93µs p(95)=277.1µs  p(99.9)=14.38ms
     http_req_sending...............: avg=59.44µs  min=5.21µs  med=9.38µs  max=195.65ms p(90)=15.91µs p(95)=123.75µs p(99.9)=8.14ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.2ms   min=1.45ms  med=16.34ms max=330.17ms p(90)=25.49ms p(95)=29.22ms  p(99.9)=51.46ms
     http_reqs......................: 340352  2831.911357/s
     iteration_duration.............: avg=17.62ms  min=1.93ms  med=16.7ms  max=350.03ms p(90)=25.98ms p(95)=29.89ms  p(99.9)=53.98ms
     iterations.....................: 340252  2831.079304/s
     success_rate...................: 100.00% ✓ 340252      ✗ 0     
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

     checks.........................: 100.00% ✓ 738684      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 296 MB  2.5 MB/s
     http_req_blocked...............: avg=3.19µs   min=1.05µs  med=2.51µs  max=15.13ms  p(90)=3.97µs   p(95)=4.71µs   p(99.9)=43.22µs
     http_req_connecting............: avg=161ns    min=0s      med=0s      max=2.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.12ms  min=1.98ms  med=23.85ms max=347.66ms p(90)=28.99ms  p(95)=31.34ms  p(99.9)=54.27ms
       { expected_response:true }...: avg=24.12ms  min=1.98ms  med=23.85ms max=347.66ms p(90)=28.99ms  p(95)=31.34ms  p(99.9)=54.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 246328
     http_req_receiving.............: avg=129.16µs min=29.23µs med=58.63µs max=215.95ms p(90)=102.03µs p(95)=209.51µs p(99.9)=10.86ms
     http_req_sending...............: avg=47.46µs  min=5.05µs  med=10.52µs max=233.24ms p(90)=18.06µs  p(95)=119.27µs p(99.9)=2.92ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.94ms  min=1.92ms  med=23.74ms max=134.04ms p(90)=28.8ms   p(95)=31.08ms  p(99.9)=53.15ms
     http_reqs......................: 246328  2048.415969/s
     iteration_duration.............: avg=24.35ms  min=3.75ms  med=24.06ms max=368.7ms  p(90)=29.21ms  p(95)=31.59ms  p(99.9)=54.72ms
     iterations.....................: 246228  2047.584388/s
     success_rate...................: 100.00% ✓ 246228      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 665589      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=3.17µs   min=1.03µs  med=2.39µs   max=5.72ms   p(90)=3.56µs   p(95)=4.14µs  p(99.9)=35.69µs 
     http_req_connecting............: avg=437ns    min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=26.8ms   min=2.76ms  med=15.01ms  max=340.02ms p(90)=65.33ms  p(95)=86.13ms p(99.9)=198.27ms
       { expected_response:true }...: avg=26.8ms   min=2.76ms  med=15.01ms  max=340.02ms p(90)=65.33ms  p(95)=86.13ms p(99.9)=198.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221963
     http_req_receiving.............: avg=588.69µs min=50.49µs med=110.16µs max=313ms    p(90)=731.95µs p(95)=1.09ms  p(99.9)=69.84ms 
     http_req_sending...............: avg=36.66µs  min=5.19µs  med=9.87µs   max=167.67ms p(90)=15.64µs  p(95)=27.02µs p(99.9)=1.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=26.17ms  min=2.62ms  med=14.55ms  max=324.77ms p(90)=64.2ms   p(95)=84.87ms p(99.9)=195.84ms
     http_reqs......................: 221963  1844.411504/s
     iteration_duration.............: avg=27.03ms  min=3.58ms  med=15.22ms  max=353.43ms p(90)=65.57ms  p(95)=86.37ms p(99.9)=200.05ms
     iterations.....................: 221863  1843.580549/s
     success_rate...................: 100.00% ✓ 221863      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 452301      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=3.86µs  min=1.03µs  med=2.42µs  max=87.42ms  p(90)=3.63µs  p(95)=4.21µs   p(99.9)=35.97µs
     http_req_connecting............: avg=581ns   min=0s      med=0s      max=3.81ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.55ms min=2.07ms  med=38.98ms max=324.42ms p(90)=55.76ms p(95)=60.9ms   p(99.9)=85.86ms
       { expected_response:true }...: avg=39.55ms min=2.07ms  med=38.98ms max=324.42ms p(90)=55.76ms p(95)=60.9ms   p(99.9)=85.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150867
     http_req_receiving.............: avg=82.82µs min=28.94µs med=61.66µs max=147.08ms p(90)=96.41µs p(95)=113.77µs p(99.9)=2.18ms 
     http_req_sending...............: avg=29.05µs min=5.53µs  med=10.44µs max=262.56ms p(90)=15.64µs p(95)=19.69µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.44ms min=2.01ms  med=38.88ms max=323.16ms p(90)=55.65ms p(95)=60.77ms  p(99.9)=85.18ms
     http_reqs......................: 150867  1254.374681/s
     iteration_duration.............: avg=39.79ms min=3.76ms  med=39.19ms max=341.47ms p(90)=55.96ms p(95)=61.1ms   p(99.9)=86.62ms
     iterations.....................: 150767  1253.543237/s
     success_rate...................: 100.00% ✓ 150767      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 192864     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 77 MB   641 kB/s
     http_req_blocked...............: avg=4.36µs  min=1.18µs  med=2.91µs  max=3.77ms   p(90)=4.43µs   p(95)=5.02µs   p(99.9)=45.79µs 
     http_req_connecting............: avg=1.14µs  min=0s      med=0s      max=3.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.97ms min=4.33ms  med=89.89ms max=351.2ms  p(90)=111.61ms p(95)=121.9ms  p(99.9)=216.46ms
       { expected_response:true }...: avg=92.97ms min=4.33ms  med=89.89ms max=351.2ms  p(90)=111.61ms p(95)=121.9ms  p(99.9)=216.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64388
     http_req_receiving.............: avg=87.73µs min=31.09µs med=78.1µs  max=102.4ms  p(90)=112.65µs p(95)=125.33µs p(99.9)=917.36µs
     http_req_sending...............: avg=25.79µs min=5.73µs  med=13.44µs max=139.23ms p(90)=20.17µs  p(95)=22.37µs  p(99.9)=844.02µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.86ms min=4.25ms  med=89.78ms max=350.2ms  p(90)=111.5ms  p(95)=121.78ms p(99.9)=216.08ms
     http_reqs......................: 64388   534.018164/s
     iteration_duration.............: avg=93.35ms min=21.76ms med=90.11ms max=361.77ms p(90)=111.86ms p(95)=122.16ms p(99.9)=218.49ms
     iterations.....................: 64288   533.188788/s
     success_rate...................: 100.00% ✓ 64288      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 153396     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   510 kB/s
     http_req_blocked...............: avg=5.72µs   min=1.29µs  med=3.38µs   max=4.09ms   p(90)=4.8µs    p(95)=5.38µs   p(99.9)=157.85µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.87ms min=5.63ms  med=116.58ms max=365.76ms p(90)=141.39ms p(95)=148.77ms p(99.9)=184.51ms
       { expected_response:true }...: avg=116.87ms min=5.63ms  med=116.58ms max=365.76ms p(90)=141.39ms p(95)=148.77ms p(99.9)=184.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51232
     http_req_receiving.............: avg=91.49µs  min=31.85µs med=83.95µs  max=71.72ms  p(90)=115.5µs  p(95)=127.38µs p(99.9)=799.89µs
     http_req_sending...............: avg=30.04µs  min=5.75µs  med=16.01µs  max=100.31ms p(90)=21.38µs  p(95)=23.19µs  p(99.9)=632.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.75ms min=5.52ms  med=116.46ms max=365.27ms p(90)=141.26ms p(95)=148.65ms p(99.9)=183.5ms 
     http_reqs......................: 51232   424.467369/s
     iteration_duration.............: avg=117.36ms min=35.8ms  med=116.86ms max=391.45ms p(90)=141.64ms p(95)=149.06ms p(99.9)=187.36ms
     iterations.....................: 51132   423.638849/s
     success_rate...................: 100.00% ✓ 51132      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97695      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=5.93µs   min=1.26µs  med=3.48µs   max=3.62ms   p(90)=4.94µs   p(95)=5.6µs    p(99.9)=594.9µs 
     http_req_connecting............: avg=2.22µs   min=0s      med=0s       max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=549.79µs
     http_req_duration..............: avg=183.52ms min=5.75ms  med=167.15ms max=582.23ms p(90)=212.86ms p(95)=286.27ms p(99.9)=533.13ms
       { expected_response:true }...: avg=183.52ms min=5.75ms  med=167.15ms max=582.23ms p(90)=212.86ms p(95)=286.27ms p(99.9)=533.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32665
     http_req_receiving.............: avg=103.85µs min=34.39µs med=95.49µs  max=80.59ms  p(90)=128.07µs p(95)=141.2µs  p(99.9)=754.46µs
     http_req_sending...............: avg=26.63µs  min=6.02µs  med=17.44µs  max=66.14ms  p(90)=22.6µs   p(95)=24.54µs  p(99.9)=659.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.39ms min=5.66ms  med=167.03ms max=581.83ms p(90)=212.73ms p(95)=285.96ms p(99.9)=533.01ms
     http_reqs......................: 32665   270.130926/s
     iteration_duration.............: avg=184.33ms min=28.79ms med=167.49ms max=582.63ms p(90)=213.26ms p(95)=295.06ms p(99.9)=533.47ms
     iterations.....................: 32565   269.303952/s
     success_rate...................: 100.00% ✓ 32565      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88041      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=5.3µs    min=1.29µs  med=3.35µs   max=4.96ms   p(90)=4.61µs   p(95)=5.14µs   p(99.9)=617.19µs
     http_req_connecting............: avg=1.53µs   min=0s      med=0s       max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=547.58µs
     http_req_duration..............: avg=203.64ms min=8.48ms  med=202.28ms max=370.12ms p(90)=219.48ms p(95)=228.98ms p(99.9)=288.14ms
       { expected_response:true }...: avg=203.64ms min=8.48ms  med=202.28ms max=370.12ms p(90)=219.48ms p(95)=228.98ms p(99.9)=288.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29447
     http_req_receiving.............: avg=105.03µs min=32.78µs med=91.09µs  max=162.02ms p(90)=121.35µs p(95)=133.41µs p(99.9)=790.59µs
     http_req_sending...............: avg=32.69µs  min=5.94µs  med=16.14µs  max=100.25ms p(90)=20.97µs  p(95)=22.65µs  p(99.9)=636.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.5ms  min=8.39ms  med=202.09ms max=369.92ms p(90)=219.32ms p(95)=228.8ms  p(99.9)=288.03ms
     http_reqs......................: 29447   243.181227/s
     iteration_duration.............: avg=204.58ms min=64.23ms med=203.35ms max=384.49ms p(90)=219.79ms p(95)=229.37ms p(99.9)=289.96ms
     iterations.....................: 29347   242.3554/s
     success_rate...................: 100.00% ✓ 29347      ✗ 0    
     vus............................: 37      min=37       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 875022      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=3.58µs   min=1.01µs  med=2.71µs  max=12.57ms  p(90)=4.28µs   p(95)=5.12µs   p(99.9)=40.52µs
     http_req_connecting............: avg=377ns    min=0s      med=0s      max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.32ms  min=1.71ms  med=19.77ms max=344.04ms p(90)=27.6ms   p(95)=30.56ms  p(99.9)=52.98ms
       { expected_response:true }...: avg=20.32ms  min=1.71ms  med=19.77ms max=344.04ms p(90)=27.6ms   p(95)=30.56ms  p(99.9)=52.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291774
     http_req_receiving.............: avg=118.36µs min=27.74µs med=56.75µs max=90.5ms   p(90)=111.44µs p(95)=278.39µs p(99.9)=8.94ms 
     http_req_sending...............: avg=56.04µs  min=5.18µs  med=10.99µs max=324.17ms p(90)=20.49µs  p(95)=133.37µs p(99.9)=4.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.14ms  min=1.61ms  med=19.63ms max=343.7ms  p(90)=27.4ms   p(95)=30.28ms  p(99.9)=51.42ms
     http_reqs......................: 291774  2427.162334/s
     iteration_duration.............: avg=20.56ms  min=3.33ms  med=19.99ms max=363.38ms p(90)=27.83ms  p(95)=30.8ms   p(99.9)=53.58ms
     iterations.....................: 291674  2426.33047/s
     success_rate...................: 100.00% ✓ 291674      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 599490      ✗ 0     
     data_received..................: 18 GB   146 MB/s
     data_sent......................: 240 MB  2.0 MB/s
     http_req_blocked...............: avg=3.47µs   min=1.03µs med=2.65µs   max=4ms      p(90)=4.02µs   p(95)=4.65µs  p(99.9)=35.26µs 
     http_req_connecting............: avg=489ns    min=0s     med=0s       max=3.97ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=29.77ms  min=2.27ms med=18.76ms  max=699.54ms p(90)=66.94ms  p(95)=89.05ms p(99.9)=241.55ms
       { expected_response:true }...: avg=29.77ms  min=2.27ms med=18.76ms  max=699.54ms p(90)=66.94ms  p(95)=89.05ms p(99.9)=241.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199930
     http_req_receiving.............: avg=561.28µs min=52.8µs med=115.28µs max=261.94ms p(90)=780.63µs p(95)=1.21ms  p(99.9)=66.56ms 
     http_req_sending...............: avg=35.2µs   min=5.18µs med=10.95µs  max=40.32ms  p(90)=18.17µs  p(95)=26.52µs p(99.9)=1.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=29.18ms  min=2.13ms med=18.26ms  max=699.38ms p(90)=65.93ms  p(95)=87.78ms p(99.9)=235.49ms
     http_reqs......................: 199930  1662.17373/s
     iteration_duration.............: avg=30.01ms  min=3.04ms med=18.98ms  max=699.75ms p(90)=67.16ms  p(95)=89.3ms  p(99.9)=243.67ms
     iterations.....................: 199830  1661.342353/s
     success_rate...................: 100.00% ✓ 199830      ✗ 0     
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

     checks.........................: 100.00% ✓ 552336      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.75µs   min=972ns   med=2.63µs  max=8.88ms   p(90)=4.98µs   p(95)=6.09µs   p(99.9)=48.56µs
     http_req_connecting............: avg=409ns    min=0s      med=0s      max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.31ms  min=2.35ms  med=31.39ms max=354.34ms p(90)=42.77ms  p(95)=47.37ms  p(99.9)=81.61ms
       { expected_response:true }...: avg=32.31ms  min=2.35ms  med=31.39ms max=354.34ms p(90)=42.77ms  p(95)=47.37ms  p(99.9)=81.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184212
     http_req_receiving.............: avg=144.08µs min=31.01µs med=65.26µs max=260.2ms  p(90)=138.84µs p(95)=292.26µs p(99.9)=7.37ms 
     http_req_sending...............: avg=48.17µs  min=5.32µs  med=11.13µs max=213.24ms p(90)=25.18µs  p(95)=138.33µs p(99.9)=3.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.12ms  min=2.22ms  med=31.25ms max=128.44ms p(90)=42.56ms  p(95)=47.12ms  p(99.9)=81.14ms
     http_reqs......................: 184212  1531.091621/s
     iteration_duration.............: avg=32.58ms  min=3.99ms  med=31.63ms max=373.94ms p(90)=43.01ms  p(95)=47.63ms  p(99.9)=82.74ms
     iterations.....................: 184112  1530.260463/s
     success_rate...................: 100.00% ✓ 184112      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427722      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.6µs   min=1.1µs  med=2.68µs  max=9.48ms   p(90)=4.12µs   p(95)=4.75µs   p(99.9)=36.52µs
     http_req_connecting............: avg=512ns   min=0s     med=0s      max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.82ms min=2.21ms med=41.27ms max=301.58ms p(90)=58.84ms  p(95)=64.13ms  p(99.9)=90.16ms
       { expected_response:true }...: avg=41.82ms min=2.21ms med=41.27ms max=301.58ms p(90)=58.84ms  p(95)=64.13ms  p(99.9)=90.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142674
     http_req_receiving.............: avg=90.32µs min=29.3µs med=68.04µs max=251.02ms p(90)=105.82µs p(95)=124.65µs p(99.9)=1.72ms 
     http_req_sending...............: avg=29.37µs min=5.47µs med=11.37µs max=218.67ms p(90)=17.51µs  p(95)=21.46µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.7ms  min=2.1ms  med=41.16ms max=300.92ms p(90)=58.72ms  p(95)=64ms     p(99.9)=89.69ms
     http_reqs......................: 142674  1186.13059/s
     iteration_duration.............: avg=42.07ms min=3.77ms med=41.48ms max=347.7ms  p(90)=59.05ms  p(95)=64.35ms  p(99.9)=90.95ms
     iterations.....................: 142574  1185.299233/s
     success_rate...................: 100.00% ✓ 142574      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 178557     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 72 MB   594 kB/s
     http_req_blocked...............: avg=5.1µs    min=1.2µs   med=3.1µs   max=4.35ms   p(90)=4.57µs   p(95)=5.13µs   p(99.9)=58.03µs 
     http_req_connecting............: avg=1.74µs   min=0s      med=0s      max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=100.42ms min=4.36ms  med=97.27ms max=386.4ms  p(90)=120.27ms p(95)=132.1ms  p(99.9)=233.73ms
       { expected_response:true }...: avg=100.42ms min=4.36ms  med=97.27ms max=386.4ms  p(90)=120.27ms p(95)=132.1ms  p(99.9)=233.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59619
     http_req_receiving.............: avg=192.69µs min=31.52µs med=82.24µs max=295.82ms p(90)=115.08µs p(95)=128.08µs p(99.9)=1.23ms  
     http_req_sending...............: avg=21.86µs  min=6µs     med=14.23µs max=29.31ms  p(90)=20.66µs  p(95)=22.67µs  p(99.9)=740.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.21ms min=4.27ms  med=97.13ms max=273.11ms p(90)=120.05ms p(95)=131.73ms p(99.9)=230.09ms
     http_reqs......................: 59619   494.415903/s
     iteration_duration.............: avg=100.82ms min=10.39ms med=97.51ms max=398.15ms p(90)=120.52ms p(95)=132.4ms  p(99.9)=234.63ms
     iterations.....................: 59519   493.586611/s
     success_rate...................: 100.00% ✓ 59519      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 135405     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 54 MB   450 kB/s
     http_req_blocked...............: avg=6.1µs    min=1.21µs  med=3.58µs   max=3.94ms   p(90)=5.02µs   p(95)=5.59µs   p(99.9)=513.3µs 
     http_req_connecting............: avg=2.34µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=487.59µs
     http_req_duration..............: avg=132.42ms min=5.89ms  med=129.93ms max=346.02ms p(90)=174.9ms  p(95)=187.99ms p(99.9)=238.82ms
       { expected_response:true }...: avg=132.42ms min=5.89ms  med=129.93ms max=346.02ms p(90)=174.9ms  p(95)=187.99ms p(99.9)=238.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45235
     http_req_receiving.............: avg=157.21µs min=32.22µs med=89.26µs  max=220.99ms p(90)=121.06µs p(95)=134.12µs p(99.9)=847.5µs 
     http_req_sending...............: avg=26.11µs  min=5.96µs  med=17.11µs  max=205.22ms p(90)=22.27µs  p(95)=24.09µs  p(99.9)=556.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.24ms min=5.81ms  med=129.77ms max=267.73ms p(90)=174.7ms  p(95)=187.79ms p(99.9)=234.73ms
     http_reqs......................: 45235   374.609977/s
     iteration_duration.............: avg=132.97ms min=30.38ms med=130.27ms max=373.91ms p(90)=175.22ms p(95)=188.3ms  p(99.9)=243.56ms
     iterations.....................: 45135   373.781835/s
     success_rate...................: 100.00% ✓ 45135      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96651      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=4.99µs   min=1.24µs  med=3.63µs   max=2.35ms   p(90)=5.08µs   p(95)=5.63µs   p(99.9)=444µs   
     http_req_connecting............: avg=1.18µs   min=0s      med=0s       max=2.3ms    p(90)=0s       p(95)=0s       p(99.9)=418.82µs
     http_req_duration..............: avg=185.49ms min=5.93ms  med=168.78ms max=600.57ms p(90)=220.29ms p(95)=344.54ms p(99.9)=541.58ms
       { expected_response:true }...: avg=185.49ms min=5.93ms  med=168.78ms max=600.57ms p(90)=220.29ms p(95)=344.54ms p(99.9)=541.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32317
     http_req_receiving.............: avg=103.76µs min=33.17µs med=95.35µs  max=49.72ms  p(90)=126.45µs p(95)=139.41µs p(99.9)=716.95µs
     http_req_sending...............: avg=29.24µs  min=5.94µs  med=18.09µs  max=66.17ms  p(90)=22.81µs  p(95)=24.57µs  p(99.9)=653.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.36ms min=5.81ms  med=168.66ms max=600.48ms p(90)=220.13ms p(95)=344.43ms p(99.9)=541.47ms
     http_reqs......................: 32317   267.212408/s
     iteration_duration.............: avg=186.34ms min=43.69ms med=169.15ms max=600.82ms p(90)=220.72ms p(95)=356.34ms p(99.9)=541.8ms 
     iterations.....................: 32217   266.385561/s
     success_rate...................: 100.00% ✓ 32217      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84951      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   282 kB/s
     http_req_blocked...............: avg=7.4µs    min=1.28µs  med=3.51µs   max=4.68ms   p(90)=4.84µs   p(95)=5.37µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=3.73µs   min=0s      med=0s       max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=211.03ms min=8.82ms  med=215.03ms max=432.79ms p(90)=226.7ms  p(95)=237.42ms p(99.9)=302.58ms
       { expected_response:true }...: avg=211.03ms min=8.82ms  med=215.03ms max=432.79ms p(90)=226.7ms  p(95)=237.42ms p(99.9)=302.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28417
     http_req_receiving.............: avg=103.65µs min=32.72µs med=95.13µs  max=109.03ms p(90)=126.19µs p(95)=139µs    p(99.9)=754.41µs
     http_req_sending...............: avg=31.12µs  min=6.26µs  med=17.72µs  max=62.61ms  p(90)=22.35µs  p(95)=24.12µs  p(99.9)=608.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.89ms min=8.7ms   med=214.91ms max=422.86ms p(90)=226.57ms p(95)=237.3ms  p(99.9)=301.36ms
     http_reqs......................: 28417   234.538596/s
     iteration_duration.............: avg=212.05ms min=46.41ms med=215.31ms max=454.71ms p(90)=226.99ms p(95)=237.86ms p(99.9)=306.97ms
     iterations.....................: 28317   233.71325/s
     success_rate...................: 100.00% ✓ 28317      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

