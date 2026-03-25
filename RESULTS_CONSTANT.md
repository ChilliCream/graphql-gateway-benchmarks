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
| hive-router | v0.0.42 | 2,992 | 3,197 | 2,951 | 2.6% |  |
| hotchocolate | 16.0.0-rc.1.14 | 2,077 | 2,133 | 2,056 | 1.1% |  |
| grafbase | 0.53.2 | 2,018 | 2,087 | 1,999 | 1.4% |  |
| cosmo | 0.295.0 | 1,290 | 1,307 | 1,281 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 599 | 613 | 595 | 1.1% |  |
| apollo-router | v2.12.0 | 431 | 440 | 427 | 1.0% |  |
| hive-gateway | 2.5.11 | 270 | 275 | 269 | 0.8% |  |
| apollo-gateway | 2.13.3 | 243 | 246 | 243 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.42 | 2,387 | 2,520 | 2,370 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.14 | 1,890 | 1,939 | 1,877 | 1.0% |  |
| grafbase | 0.53.2 | 1,519 | 1,568 | 1,501 | 1.4% |  |
| cosmo | 0.295.0 | 1,184 | 1,205 | 1,173 | 0.9% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 577 | 593 | 573 | 1.2% |  |
| apollo-router | v2.12.0 | 400 | 410 | 397 | 1.1% |  |
| hive-gateway | 2.5.11 | 268 | 274 | 266 | 0.9% |  |
| apollo-gateway | 2.13.3 | 237 | 239 | 235 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1078944     ✗ 0     
     data_received..................: 32 GB   263 MB/s
     data_sent......................: 432 MB  3.6 MB/s
     http_req_blocked...............: avg=3.04µs   min=1.07µs  med=2.33µs  max=19.96ms  p(90)=3.47µs  p(95)=4.08µs   p(99.9)=33.47µs
     http_req_connecting............: avg=269ns    min=0s      med=0s      max=3.89ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.43ms  min=1.58ms  med=15.38ms max=246.16ms p(90)=24.58ms p(95)=28.75ms  p(99.9)=52.06ms
       { expected_response:true }...: avg=16.43ms  min=1.58ms  med=15.38ms max=246.16ms p(90)=24.58ms p(95)=28.75ms  p(99.9)=52.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 359748
     http_req_receiving.............: avg=153.46µs min=27.63µs med=49.81µs max=190.95ms p(90)=97.67µs p(95)=283.3µs  p(99.9)=13.7ms 
     http_req_sending...............: avg=65µs     min=5.09µs  med=9.23µs  max=188.58ms p(90)=15.42µs p(95)=123.58µs p(99.9)=16.6ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.21ms  min=1.53ms  med=15.22ms max=83.66ms  p(90)=24.25ms p(95)=28.28ms  p(99.9)=50.65ms
     http_reqs......................: 359748  2992.962318/s
     iteration_duration.............: avg=16.67ms  min=2.11ms  med=15.59ms max=377.12ms p(90)=24.82ms p(95)=29.04ms  p(99.9)=53.91ms
     iterations.....................: 359648  2992.130358/s
     success_rate...................: 100.00% ✓ 359648      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 749514      ✗ 0     
     data_received..................: 22 GB   182 MB/s
     data_sent......................: 300 MB  2.5 MB/s
     http_req_blocked...............: avg=3.19µs   min=1.06µs  med=2.42µs   max=11.64ms  p(90)=3.6µs    p(95)=4.21µs   p(99.9)=36.32µs 
     http_req_connecting............: avg=376ns    min=0s      med=0s       max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.77ms  min=2.53ms  med=14.95ms  max=328.78ms p(90)=53.99ms  p(95)=72.35ms  p(99.9)=170.03ms
       { expected_response:true }...: avg=23.77ms  min=2.53ms  med=14.95ms  max=328.78ms p(90)=53.99ms  p(95)=72.35ms  p(99.9)=170.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 249938
     http_req_receiving.............: avg=653.42µs min=50.94µs med=113.59µs max=256.66ms p(90)=992.38µs p(95)=1.53ms   p(99.9)=58.29ms 
     http_req_sending...............: avg=42.75µs  min=5.25µs  med=9.79µs   max=196.92ms p(90)=16.06µs  p(95)=107.52µs p(99.9)=2.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.07ms  min=2.41ms  med=14.43ms  max=296.99ms p(90)=52.68ms  p(95)=71.06ms  p(99.9)=168.54ms
     http_reqs......................: 249938  2077.30329/s
     iteration_duration.............: avg=24ms     min=3.42ms  med=15.17ms  max=334.72ms p(90)=54.22ms  p(95)=72.61ms  p(99.9)=171.65ms
     iterations.....................: 249838  2076.472162/s
     success_rate...................: 100.00% ✓ 249838      ✗ 0     
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

     checks.........................: 100.00% ✓ 728004      ✗ 0     
     data_received..................: 21 GB   177 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.46µs   min=990ns  med=2.49µs  max=11.76ms  p(90)=3.91µs   p(95)=4.63µs   p(99.9)=43.09µs
     http_req_connecting............: avg=474ns    min=0s     med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.47ms  min=2.02ms med=24.22ms max=332.03ms p(90)=29.46ms  p(95)=31.85ms  p(99.9)=55.45ms
       { expected_response:true }...: avg=24.47ms  min=2.02ms med=24.22ms max=332.03ms p(90)=29.46ms  p(95)=31.85ms  p(99.9)=55.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 242768
     http_req_receiving.............: avg=113.96µs min=28.8µs med=59.76µs max=80.72ms  p(90)=102.29µs p(95)=190.48µs p(99.9)=9.34ms 
     http_req_sending...............: avg=48.94µs  min=5.44µs med=10.43µs max=97.92ms  p(90)=17.32µs  p(95)=116.52µs p(99.9)=4.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.31ms  min=1.95ms med=24.1ms  max=289.47ms p(90)=29.29ms  p(95)=31.56ms  p(99.9)=54.5ms 
     http_reqs......................: 242768  2018.72112/s
     iteration_duration.............: avg=24.71ms  min=4.03ms med=24.43ms max=348.23ms p(90)=29.69ms  p(95)=32.1ms   p(99.9)=56.04ms
     iterations.....................: 242668  2017.889577/s
     success_rate...................: 100.00% ✓ 242668      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 465309      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 187 MB  1.6 MB/s
     http_req_blocked...............: avg=3.36µs  min=1.05µs  med=2.37µs  max=4.11ms   p(90)=3.72µs  p(95)=4.32µs   p(99.9)=34.32µs
     http_req_connecting............: avg=675ns   min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.44ms min=2.09ms  med=37.91ms max=326.39ms p(90)=54.25ms p(95)=59.21ms  p(99.9)=83.03ms
       { expected_response:true }...: avg=38.44ms min=2.09ms  med=37.91ms max=326.39ms p(90)=54.25ms p(95)=59.21ms  p(99.9)=83.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155203
     http_req_receiving.............: avg=83.47µs min=28.32µs med=60.6µs  max=135.69ms p(90)=96.77µs p(95)=115.92µs p(99.9)=2.16ms 
     http_req_sending...............: avg=29.31µs min=5.21µs  med=10.64µs max=150.13ms p(90)=16.32µs p(95)=20.43µs  p(99.9)=1.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.33ms min=1.99ms  med=37.8ms  max=325.77ms p(90)=54.12ms p(95)=59.08ms  p(99.9)=82.56ms
     http_reqs......................: 155203  1290.39717/s
     iteration_duration.............: avg=38.67ms min=3.4ms   med=38.11ms max=351.83ms p(90)=54.45ms p(95)=59.42ms  p(99.9)=83.69ms
     iterations.....................: 155103  1289.565745/s
     success_rate...................: 100.00% ✓ 155103      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 216357     ✗ 0    
     data_received..................: 6.3 GB  53 MB/s
     data_sent......................: 87 MB   720 kB/s
     http_req_blocked...............: avg=4.56µs  min=1.23µs  med=2.84µs  max=4.1ms    p(90)=4.27µs   p(95)=4.85µs   p(99.9)=43.96µs 
     http_req_connecting............: avg=1.43µs  min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=82.85ms min=3.72ms  med=80.23ms max=361.54ms p(90)=101.79ms p(95)=112.32ms p(99.9)=209.67ms
       { expected_response:true }...: avg=82.85ms min=3.72ms  med=80.23ms max=361.54ms p(90)=101.79ms p(95)=112.32ms p(99.9)=209.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 72219
     http_req_receiving.............: avg=85.47µs min=30.7µs  med=74.9µs  max=69.26ms  p(90)=109.32µs p(95)=122.04µs p(99.9)=915.77µs
     http_req_sending...............: avg=22.72µs min=5.95µs  med=12.83µs max=169.42ms p(90)=18.59µs  p(95)=20.86µs  p(99.9)=658.22µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.74ms min=3.67ms  med=80.13ms max=320.15ms p(90)=101.67ms p(95)=112.18ms p(99.9)=209.38ms
     http_reqs......................: 72219   599.209112/s
     iteration_duration.............: avg=83.2ms  min=13.98ms med=80.46ms max=377.13ms p(90)=102.02ms p(95)=112.61ms p(99.9)=213.18ms
     iterations.....................: 72119   598.379401/s
     success_rate...................: 100.00% ✓ 72119      ✗ 0    
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

     checks.........................: 100.00% ✓ 155943     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   518 kB/s
     http_req_blocked...............: avg=4.34µs   min=1.16µs  med=3.42µs   max=2.15ms   p(90)=4.86µs   p(95)=5.41µs   p(99.9)=90.19µs 
     http_req_connecting............: avg=736ns    min=0s      med=0s       max=2.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.98ms min=5.29ms  med=114.72ms max=351.89ms p(90)=138.88ms p(95)=145.95ms p(99.9)=180.49ms
       { expected_response:true }...: avg=114.98ms min=5.29ms  med=114.72ms max=351.89ms p(90)=138.88ms p(95)=145.95ms p(99.9)=180.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52081
     http_req_receiving.............: avg=90.82µs  min=29.77µs med=85.69µs  max=16.63ms  p(90)=117.2µs  p(95)=129.74µs p(99.9)=676.96µs
     http_req_sending...............: avg=28.17µs  min=6.01µs  med=16.02µs  max=104.14ms p(90)=21.31µs  p(95)=23.14µs  p(99.9)=636.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.86ms min=5.23ms  med=114.6ms  max=340.97ms p(90)=138.76ms p(95)=145.83ms p(99.9)=180.06ms
     http_reqs......................: 52081   431.490891/s
     iteration_duration.............: avg=115.46ms min=11.27ms med=114.99ms max=358.48ms p(90)=139.15ms p(95)=146.25ms p(99.9)=183ms   
     iterations.....................: 51981   430.662392/s
     success_rate...................: 100.00% ✓ 51981      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97719      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=7.08µs   min=1.32µs  med=3.57µs   max=4.02ms   p(90)=5.08µs   p(95)=5.71µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=183.44ms min=5.78ms  med=166.29ms max=622.26ms p(90)=210.52ms p(95)=373.89ms p(99.9)=561.21ms
       { expected_response:true }...: avg=183.44ms min=5.78ms  med=166.29ms max=622.26ms p(90)=210.52ms p(95)=373.89ms p(99.9)=561.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32673
     http_req_receiving.............: avg=107.82µs min=35.17µs med=97.26µs  max=82.17ms  p(90)=129.97µs p(95)=143.92µs p(99.9)=614.91µs
     http_req_sending...............: avg=41.36µs  min=6.5µs   med=17.69µs  max=187.21ms p(90)=23.02µs  p(95)=24.93µs  p(99.9)=659.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.29ms min=5.69ms  med=166.17ms max=622.15ms p(90)=210.36ms p(95)=373.78ms p(99.9)=561.08ms
     http_reqs......................: 32673   270.221862/s
     iteration_duration.............: avg=184.29ms min=35.71ms med=166.64ms max=622.58ms p(90)=210.98ms p(95)=376.23ms p(99.9)=561.46ms
     iterations.....................: 32573   269.394813/s
     success_rate...................: 100.00% ✓ 32573      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88113      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7.03µs   min=1.22µs  med=3.2µs    max=4.44ms   p(90)=4.42µs   p(95)=4.98µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=203.48ms min=8.45ms  med=193.51ms max=520.54ms p(90)=344.69ms p(95)=361.22ms p(99.9)=440.11ms
       { expected_response:true }...: avg=203.48ms min=8.45ms  med=193.51ms max=520.54ms p(90)=344.69ms p(95)=361.22ms p(99.9)=440.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29471
     http_req_receiving.............: avg=93.27µs  min=31.46µs med=88.96µs  max=3.86ms   p(90)=119.94µs p(95)=131.72µs p(99.9)=658.54µs
     http_req_sending...............: avg=22.9µs   min=5.79µs  med=15.8µs   max=43.7ms   p(90)=20.58µs  p(95)=22.36µs  p(99.9)=719.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.37ms min=8.33ms  med=193.38ms max=520.43ms p(90)=344.57ms p(95)=361.12ms p(99.9)=440.03ms
     http_reqs......................: 29471   243.369763/s
     iteration_duration.............: avg=204.4ms  min=29.33ms med=194.34ms max=520.82ms p(90)=345.14ms p(95)=361.5ms  p(99.9)=440.36ms
     iterations.....................: 29371   242.543969/s
     success_rate...................: 100.00% ✓ 29371      ✗ 0    
     vus............................: 30      min=30       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 860769      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=2.96µs   min=982ns   med=2.17µs  max=15.23ms  p(90)=3.51µs   p(95)=4.29µs   p(99.9)=33.12µs
     http_req_connecting............: avg=286ns    min=0s      med=0s      max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.67ms  min=1.83ms  med=20.23ms max=323.3ms  p(90)=28.53ms  p(95)=31.47ms  p(99.9)=53.07ms
       { expected_response:true }...: avg=20.67ms  min=1.83ms  med=20.23ms max=323.3ms  p(90)=28.53ms  p(95)=31.47ms  p(99.9)=53.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287023
     http_req_receiving.............: avg=113.24µs min=28.34µs med=54.21µs max=279.53ms p(90)=101.22µs p(95)=255.05µs p(99.9)=8.38ms 
     http_req_sending...............: avg=49.28µs  min=5.06µs  med=9.63µs  max=123.51ms p(90)=17.28µs  p(95)=122.65µs p(99.9)=4.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.51ms  min=1.78ms  med=20.1ms  max=322.2ms  p(90)=28.34ms  p(95)=31.21ms  p(99.9)=52.03ms
     http_reqs......................: 287023  2387.266566/s
     iteration_duration.............: avg=20.9ms   min=3.07ms  med=20.44ms max=351.89ms p(90)=28.75ms  p(95)=31.7ms   p(99.9)=53.45ms
     iterations.....................: 286923  2386.434832/s
     success_rate...................: 100.00% ✓ 286923      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681615      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 273 MB  2.3 MB/s
     http_req_blocked...............: avg=3.61µs   min=1µs     med=2.53µs   max=7.73ms   p(90)=3.92µs  p(95)=4.6µs    p(99.9)=35.16µs 
     http_req_connecting............: avg=705ns    min=0s      med=0s       max=7.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=26.16ms  min=1.85ms  med=17.45ms  max=613.34ms p(90)=56.68ms p(95)=75.17ms  p(99.9)=195.49ms
       { expected_response:true }...: avg=26.16ms  min=1.85ms  med=17.45ms  max=613.34ms p(90)=56.68ms p(95)=75.17ms  p(99.9)=195.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227305
     http_req_receiving.............: avg=702.62µs min=51.84µs med=109.46µs max=204.42ms p(90)=1.14ms  p(95)=1.82ms   p(99.9)=63.98ms 
     http_req_sending...............: avg=45.22µs  min=5.35µs  med=9.94µs   max=115.86ms p(90)=17.64µs p(95)=100.39µs p(99.9)=3.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=25.41ms  min=1.77ms  med=16.9ms   max=612.61ms p(90)=55.29ms p(95)=73.63ms  p(99.9)=191.92ms
     http_reqs......................: 227305  1890.321094/s
     iteration_duration.............: avg=26.39ms  min=2.73ms  med=17.67ms  max=613.6ms  p(90)=56.91ms p(95)=75.41ms  p(99.9)=197.66ms
     iterations.....................: 227205  1889.48947/s
     success_rate...................: 100.00% ✓ 227205      ✗ 0     
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

     checks.........................: 100.00% ✓ 548163      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.57µs   min=992ns   med=2.52µs  max=5.5ms    p(90)=4.86µs   p(95)=5.99µs   p(99.9)=46.72µs
     http_req_connecting............: avg=364ns    min=0s      med=0s      max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.56ms  min=2.34ms  med=31.61ms max=352.07ms p(90)=43.27ms  p(95)=48.02ms  p(99.9)=84.71ms
       { expected_response:true }...: avg=32.56ms  min=2.34ms  med=31.61ms max=352.07ms p(90)=43.27ms  p(95)=48.02ms  p(99.9)=84.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182821
     http_req_receiving.............: avg=160.25µs min=29.73µs med=63.44µs max=317.23ms p(90)=137.19µs p(95)=287.2µs  p(99.9)=6.85ms 
     http_req_sending...............: avg=48.64µs  min=5.44µs  med=10.62µs max=255.67ms p(90)=23.96µs  p(95)=136.82µs p(99.9)=3.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.35ms  min=2.27ms  med=31.46ms max=131.44ms p(90)=43.06ms  p(95)=47.77ms  p(99.9)=81.59ms
     http_reqs......................: 182821  1519.682627/s
     iteration_duration.............: avg=32.82ms  min=5.16ms  med=31.85ms max=371.25ms p(90)=43.51ms  p(95)=48.26ms  p(99.9)=85.25ms
     iterations.....................: 182721  1518.851386/s
     success_rate...................: 100.00% ✓ 182721      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427137      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.58µs  min=992ns   med=2.51µs  max=4.99ms   p(90)=3.93µs   p(95)=4.59µs   p(99.9)=37.58µs
     http_req_connecting............: avg=716ns   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.88ms min=2.18ms  med=41.28ms max=329.6ms  p(90)=58.82ms  p(95)=64.12ms  p(99.9)=90.39ms
       { expected_response:true }...: avg=41.88ms min=2.18ms  med=41.28ms max=329.6ms  p(90)=58.82ms  p(95)=64.12ms  p(99.9)=90.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142479
     http_req_receiving.............: avg=87.64µs min=28.83µs med=65.88µs max=214.7ms  p(90)=103.67µs p(95)=122.45µs p(99.9)=1.89ms 
     http_req_sending...............: avg=26.74µs min=5.51µs  med=11.37µs max=148.04ms p(90)=17.5µs   p(95)=21.34µs  p(99.9)=1.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.77ms min=2.09ms  med=41.18ms max=328.92ms p(90)=58.7ms   p(95)=63.98ms  p(99.9)=89.83ms
     http_reqs......................: 142479  1184.509324/s
     iteration_duration.............: avg=42.13ms min=4.22ms  med=41.49ms max=341.23ms p(90)=59.03ms  p(95)=64.34ms  p(99.9)=90.82ms
     iterations.....................: 142379  1183.677967/s
     success_rate...................: 100.00% ✓ 142379      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 208410     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   693 kB/s
     http_req_blocked...............: avg=4.82µs  min=1.22µs  med=3.01µs  max=4.83ms   p(90)=4.5µs    p(95)=5.09µs   p(99.9)=43.52µs 
     http_req_connecting............: avg=1.56µs  min=0s      med=0s      max=4.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86ms    min=3.79ms  med=83.35ms max=355.77ms p(90)=103.85ms p(95)=113.56ms p(99.9)=218.61ms
       { expected_response:true }...: avg=86ms    min=3.79ms  med=83.35ms max=355.77ms p(90)=103.85ms p(95)=113.56ms p(99.9)=218.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69570
     http_req_receiving.............: avg=97.03µs min=31.05µs med=79.08µs max=248.45ms p(90)=114.09µs p(95)=127.27µs p(99.9)=1.01ms  
     http_req_sending...............: avg=22.37µs min=5.81µs  med=13.83µs max=68.25ms  p(90)=20.12µs  p(95)=22.34µs  p(99.9)=763.58µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.88ms min=3.73ms  med=83.25ms max=355.16ms p(90)=103.73ms p(95)=113.4ms  p(99.9)=218.21ms
     http_reqs......................: 69570   577.216965/s
     iteration_duration.............: avg=86.37ms min=20.4ms  med=83.59ms max=375.76ms p(90)=104.09ms p(95)=113.84ms p(99.9)=221.57ms
     iterations.....................: 69470   576.387272/s
     success_rate...................: 100.00% ✓ 69470      ✗ 0    
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

     checks.........................: 100.00% ✓ 144693     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   481 kB/s
     http_req_blocked...............: avg=5.99µs   min=1.12µs  med=3.57µs   max=4.37ms   p(90)=5.08µs   p(95)=5.67µs   p(99.9)=168.4µs 
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=104.11µs
     http_req_duration..............: avg=123.92ms min=5.91ms  med=121.3ms  max=360.29ms p(90)=164.48ms p(95)=177.29ms p(99.9)=227.53ms
       { expected_response:true }...: avg=123.92ms min=5.91ms  med=121.3ms  max=360.29ms p(90)=164.48ms p(95)=177.29ms p(99.9)=227.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48331
     http_req_receiving.............: avg=95.08µs  min=33.35µs med=88.16µs  max=66.41ms  p(90)=119.79µs p(95)=132.78µs p(99.9)=752.65µs
     http_req_sending...............: avg=26.1µs   min=6.05µs  med=16.75µs  max=57.47ms  p(90)=22µs     p(95)=23.9µs   p(99.9)=734.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.8ms  min=5.77ms  med=121.2ms  max=338ms    p(90)=164.36ms p(95)=177.16ms p(99.9)=227.39ms
     http_reqs......................: 48331   400.222761/s
     iteration_duration.............: avg=124.45ms min=22.7ms  med=121.63ms max=370.27ms p(90)=164.84ms p(95)=177.6ms  p(99.9)=230.61ms
     iterations.....................: 48231   399.394674/s
     success_rate...................: 100.00% ✓ 48231      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97137      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=7.41µs   min=1.25µs  med=3.73µs   max=4.73ms   p(90)=5.25µs   p(95)=5.87µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=4.69ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=184.57ms min=6.22ms  med=169.07ms max=617.14ms p(90)=216.59ms p(95)=360.12ms p(99.9)=526.48ms
       { expected_response:true }...: avg=184.57ms min=6.22ms  med=169.07ms max=617.14ms p(90)=216.59ms p(95)=360.12ms p(99.9)=526.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32479
     http_req_receiving.............: avg=107.25µs min=34.28µs med=99.7µs   max=70.85ms  p(90)=131.97µs p(95)=145.9µs  p(99.9)=664.92µs
     http_req_sending...............: avg=22.59µs  min=6.16µs  med=18.43µs  max=26.9ms   p(90)=23.52µs  p(95)=25.23µs  p(99.9)=514.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.44ms min=6.03ms  med=168.94ms max=616.99ms p(90)=216.45ms p(95)=360.01ms p(99.9)=526.38ms
     http_reqs......................: 32479   268.748429/s
     iteration_duration.............: avg=185.4ms  min=19.08ms med=169.43ms max=617.34ms p(90)=216.98ms p(95)=367.05ms p(99.9)=526.73ms
     iterations.....................: 32379   267.920976/s
     success_rate...................: 100.00% ✓ 32379      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85827      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.47µs   min=1.29µs  med=3.36µs   max=4.73ms   p(90)=4.63µs   p(95)=5.15µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.94µs   min=0s      med=0s       max=4.69ms   p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=208.87ms min=8.68ms  med=214.07ms max=452.07ms p(90)=237.26ms p(95)=244.26ms p(99.9)=311.4ms 
       { expected_response:true }...: avg=208.87ms min=8.68ms  med=214.07ms max=452.07ms p(90)=237.26ms p(95)=244.26ms p(99.9)=311.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28709
     http_req_receiving.............: avg=243.33µs min=33.44µs med=94.32µs  max=250.25ms p(90)=126.04µs p(95)=139.2µs  p(99.9)=18.9ms  
     http_req_sending...............: avg=30.89µs  min=6.28µs  med=17.04µs  max=45.6ms   p(90)=21.83µs  p(95)=23.75µs  p(99.9)=612.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.6ms  min=8.52ms  med=213.69ms max=317.59ms p(90)=237.08ms p(95)=243.94ms p(99.9)=308.84ms
     http_reqs......................: 28709   237.061091/s
     iteration_duration.............: avg=209.85ms min=42.79ms med=214.65ms max=460.71ms p(90)=237.54ms p(95)=244.59ms p(99.9)=317.3ms 
     iterations.....................: 28609   236.235353/s
     success_rate...................: 100.00% ✓ 28609      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

