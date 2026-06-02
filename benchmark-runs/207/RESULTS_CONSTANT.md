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
| hive-router | v0.0.49 | 2,986 | 3,170 | 2,957 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,123 | 2,211 | 2,103 | 1.6% |  |
| grafbase | 0.53.3 | 1,973 | 2,043 | 1,943 | 1.6% |  |
| cosmo | 0.307.0 | 1,270 | 1,291 | 1,265 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 539 | 548 | 534 | 0.9% |  |
| apollo-router | v2.13.1 | 432 | 442 | 428 | 1.1% |  |
| apollo-gateway | 2.13.3 | 246 | 248 | 245 | 0.5% |  |
| hive-gateway | 2.5.25 | 240 | 244 | 238 | 1.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,384 | 2,515 | 2,355 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,959 | 2,012 | 1,932 | 1.3% |  |
| grafbase | 0.53.3 | 1,536 | 1,575 | 1,528 | 1.1% |  |
| cosmo | 0.307.0 | 1,202 | 1,226 | 1,197 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 516 | 529 | 511 | 1.2% |  |
| apollo-router | v2.13.1 | 372 | 384 | 368 | 1.5% |  |
| apollo-gateway | 2.13.3 | 237 | 240 | 235 | 0.8% |  |
| hive-gateway | 2.5.25 | 236 | 240 | 233 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1076556     ✗ 0     
     data_received..................: 32 GB   262 MB/s
     data_sent......................: 431 MB  3.6 MB/s
     http_req_blocked...............: avg=3.29µs   min=1.06µs  med=2.45µs  max=21.92ms  p(90)=3.64µs   p(95)=4.28µs   p(99.9)=35.47µs
     http_req_connecting............: avg=285ns    min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.47ms  min=1.6ms   med=15.47ms max=305.72ms p(90)=24.55ms  p(95)=28.51ms  p(99.9)=52.31ms
       { expected_response:true }...: avg=16.47ms  min=1.6ms   med=15.47ms max=305.72ms p(90)=24.55ms  p(95)=28.51ms  p(99.9)=52.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 358952
     http_req_receiving.............: avg=142.23µs min=28.08µs med=51.59µs max=153.76ms p(90)=102.47µs p(95)=288.53µs p(99.9)=12.56ms
     http_req_sending...............: avg=63.51µs  min=5.38µs  med=9.62µs  max=245.03ms p(90)=16.11µs  p(95)=126.27µs p(99.9)=11.26ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.27ms  min=1.55ms  med=15.31ms max=178.22ms p(90)=24.26ms  p(95)=28.11ms  p(99.9)=50.45ms
     http_reqs......................: 358952  2986.320565/s
     iteration_duration.............: avg=16.7ms   min=2.12ms  med=15.68ms max=356.03ms p(90)=24.78ms  p(95)=28.78ms  p(99.9)=53.73ms
     iterations.....................: 358852  2985.488609/s
     success_rate...................: 100.00% ✓ 358852      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 766047      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 307 MB  2.6 MB/s
     http_req_blocked...............: avg=2.81µs  min=1µs     med=2.21µs   max=13.16ms  p(90)=3.37µs   p(95)=3.94µs   p(99.9)=31.33µs 
     http_req_connecting............: avg=177ns   min=0s      med=0s       max=2.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.25ms min=2.36ms  med=14.83ms  max=310.72ms p(90)=51.76ms  p(95)=70.52ms  p(99.9)=169.61ms
       { expected_response:true }...: avg=23.25ms min=2.36ms  med=14.83ms  max=310.72ms p(90)=51.76ms  p(95)=70.52ms  p(99.9)=169.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 255449
     http_req_receiving.............: avg=651.9µs min=50.91µs med=106.64µs max=253.69ms p(90)=957.88µs p(95)=1.49ms   p(99.9)=59.55ms 
     http_req_sending...............: avg=44.59µs min=5.33µs  med=9.53µs   max=133.62ms p(90)=15.78µs  p(95)=109.23µs p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.55ms min=2.27ms  med=14.32ms  max=310.4ms  p(90)=50.48ms  p(95)=69.1ms   p(99.9)=166.63ms
     http_reqs......................: 255449  2123.754076/s
     iteration_duration.............: avg=23.48ms min=3.16ms  med=15.05ms  max=328.27ms p(90)=52.01ms  p(95)=70.78ms  p(99.9)=170.73ms
     iterations.....................: 255349  2122.922695/s
     success_rate...................: 100.00% ✓ 255349      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 711714      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=3.46µs   min=1.07µs  med=2.57µs  max=16.01ms  p(90)=3.96µs   p(95)=4.67µs   p(99.9)=36.69µs
     http_req_connecting............: avg=442ns    min=0s      med=0s      max=4.78ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.04ms  min=1.98ms  med=24.77ms max=324.78ms p(90)=30.06ms  p(95)=32.31ms  p(99.9)=54.87ms
       { expected_response:true }...: avg=25.04ms  min=1.98ms  med=24.77ms max=324.78ms p(90)=30.06ms  p(95)=32.31ms  p(99.9)=54.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237338
     http_req_receiving.............: avg=110.58µs min=29.85µs med=60.68µs max=185.86ms p(90)=102.31µs p(95)=183.72µs p(99.9)=8.32ms 
     http_req_sending...............: avg=46.52µs  min=5.52µs  med=10.89µs max=188.4ms  p(90)=17.47µs  p(95)=113.54µs p(99.9)=3.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.88ms  min=1.92ms  med=24.65ms max=317.71ms p(90)=29.89ms  p(95)=32.06ms  p(99.9)=53.55ms
     http_reqs......................: 237338  1973.720632/s
     iteration_duration.............: avg=25.28ms  min=4.12ms  med=24.99ms max=334.13ms p(90)=30.29ms  p(95)=32.55ms  p(99.9)=55.31ms
     iterations.....................: 237238  1972.889025/s
     success_rate...................: 100.00% ✓ 237238      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458082      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.01µs  min=1.05µs med=2.4µs   max=4.05ms   p(90)=3.74µs  p(95)=4.37µs   p(99.9)=35.21µs
     http_req_connecting............: avg=244ns   min=0s     med=0s      max=2.12ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.05ms min=2.17ms med=38.46ms max=326.04ms p(90)=55.18ms p(95)=60.28ms  p(99.9)=86.17ms
       { expected_response:true }...: avg=39.05ms min=2.17ms med=38.46ms max=326.04ms p(90)=55.18ms p(95)=60.28ms  p(99.9)=86.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152794
     http_req_receiving.............: avg=82.49µs min=29.2µs med=60.35µs max=232.06ms p(90)=95.65µs p(95)=114.01µs p(99.9)=2.15ms 
     http_req_sending...............: avg=26.41µs min=5.45µs med=10.67µs max=210.29ms p(90)=16.15µs p(95)=20.34µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.94ms min=2.07ms med=38.36ms max=316.68ms p(90)=55.07ms p(95)=60.15ms  p(99.9)=85.74ms
     http_reqs......................: 152794  1270.418841/s
     iteration_duration.............: avg=39.28ms min=3.44ms med=38.67ms max=336.92ms p(90)=55.38ms p(95)=60.48ms  p(99.9)=86.79ms
     iterations.....................: 152694  1269.587382/s
     success_rate...................: 100.00% ✓ 152694      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 194766     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   648 kB/s
     http_req_blocked...............: avg=4.8µs    min=1.01µs  med=2.79µs  max=4.1ms    p(90)=4.32µs   p(95)=4.95µs   p(99.9)=52.15µs 
     http_req_connecting............: avg=1.66µs   min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.06ms  min=4.23ms  med=88.96ms max=372.78ms p(90)=114.1ms  p(95)=128.26ms p(99.9)=221.66ms
       { expected_response:true }...: avg=92.06ms  min=4.23ms  med=88.96ms max=372.78ms p(90)=114.1ms  p(95)=128.26ms p(99.9)=221.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65022
     http_req_receiving.............: avg=146.09µs min=30.65µs med=76.32µs max=218.49ms p(90)=110.18µs p(95)=122.93µs p(99.9)=1.12ms  
     http_req_sending...............: avg=28.33µs  min=5.75µs  med=13.16µs max=155.7ms  p(90)=19.63µs  p(95)=22.01µs  p(99.9)=677.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.88ms  min=4.06ms  med=88.84ms max=249.46ms p(90)=113.96ms p(95)=127.98ms p(99.9)=218.42ms
     http_reqs......................: 65022   539.376794/s
     iteration_duration.............: avg=92.43ms  min=6.27ms  med=89.2ms  max=391.35ms p(90)=114.33ms p(95)=128.54ms p(99.9)=223.73ms
     iterations.....................: 64922   538.547264/s
     success_rate...................: 100.00% ✓ 64922      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 156297     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   519 kB/s
     http_req_blocked...............: avg=4.77µs   min=1.17µs  med=3.22µs   max=3.2ms    p(90)=4.68µs   p(95)=5.22µs   p(99.9)=155.71µs
     http_req_connecting............: avg=1.29µs   min=0s      med=0s       max=3.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.72ms min=5.32ms  med=114.39ms max=341.67ms p(90)=138.48ms p(95)=145.45ms p(99.9)=179.48ms
       { expected_response:true }...: avg=114.72ms min=5.32ms  med=114.39ms max=341.67ms p(90)=138.48ms p(95)=145.45ms p(99.9)=179.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52199
     http_req_receiving.............: avg=90.98µs  min=31.61µs med=81.88µs  max=98.22ms  p(90)=113.03µs p(95)=125.16µs p(99.9)=668.5µs 
     http_req_sending...............: avg=23.06µs  min=5.58µs  med=15.36µs  max=74.96ms  p(90)=21.01µs  p(95)=22.89µs  p(99.9)=784.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.61ms min=5.21ms  med=114.28ms max=340.67ms p(90)=138.38ms p(95)=145.32ms p(99.9)=179.16ms
     http_reqs......................: 52199   432.503642/s
     iteration_duration.............: avg=115.2ms  min=35.43ms med=114.67ms max=352.95ms p(90)=138.75ms p(95)=145.73ms p(99.9)=182.99ms
     iterations.....................: 52099   431.675075/s
     success_rate...................: 100.00% ✓ 52099      ✗ 0    
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

     checks.........................: 100.00% ✓ 89322      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=6.89µs   min=1.25µs  med=3.19µs   max=4.68ms   p(90)=4.41µs   p(95)=4.91µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=4.63ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=200.73ms min=8.22ms  med=221.49ms max=418.58ms p(90)=249.71ms p(95)=257.85ms p(99.9)=328.06ms
       { expected_response:true }...: avg=200.73ms min=8.22ms  med=221.49ms max=418.58ms p(90)=249.71ms p(95)=257.85ms p(99.9)=328.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29874
     http_req_receiving.............: avg=168.54µs min=31.94µs med=88.32µs  max=141.5ms  p(90)=118.87µs p(95)=130.03µs p(99.9)=9.33ms  
     http_req_sending...............: avg=29.02µs  min=6.23µs  med=16.36µs  max=175.67ms p(90)=20.87µs  p(95)=22.62µs  p(99.9)=532.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.53ms min=8.13ms  med=221.37ms max=347.28ms p(90)=249.61ms p(95)=257.67ms p(99.9)=318.31ms
     http_reqs......................: 29874   246.757249/s
     iteration_duration.............: avg=201.66ms min=17.55ms med=221.77ms max=434.07ms p(90)=250.06ms p(95)=258.19ms p(99.9)=333.74ms
     iterations.....................: 29774   245.931256/s
     success_rate...................: 100.00% ✓ 29774      ✗ 0    
     vus............................: 30      min=30       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86958      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=5.23µs   min=1.3µs   med=3.63µs   max=2.21ms   p(90)=5.19µs   p(95)=5.86µs   p(99.9)=526.98µs
     http_req_connecting............: avg=1.32µs   min=0s      med=0s       max=2.17ms   p(90)=0s       p(95)=0s       p(99.9)=502.18µs
     http_req_duration..............: avg=206.08ms min=6.62ms  med=185.92ms max=760.17ms p(90)=246.69ms p(95)=456.25ms p(99.9)=586.01ms
       { expected_response:true }...: avg=206.08ms min=6.62ms  med=185.92ms max=760.17ms p(90)=246.69ms p(95)=456.25ms p(99.9)=586.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29086
     http_req_receiving.............: avg=119.03µs min=32.94µs med=99.02µs  max=35.45ms  p(90)=131.35µs p(95)=145.27µs p(99.9)=1.32ms  
     http_req_sending...............: avg=43.4µs   min=6.76µs  med=18.41µs  max=160.06ms p(90)=23.75µs  p(95)=25.66µs  p(99.9)=647.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.92ms min=6.47ms  med=185.79ms max=760.08ms p(90)=246.47ms p(95)=456.13ms p(99.9)=585.9ms 
     http_reqs......................: 29086   240.549592/s
     iteration_duration.............: avg=207.1ms  min=23.99ms med=186.35ms max=760.36ms p(90)=247.28ms p(95)=456.79ms p(99.9)=586.33ms
     iterations.....................: 28986   239.722563/s
     success_rate...................: 100.00% ✓ 28986      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 859593      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.44µs   min=1.02µs  med=2.55µs  max=11.22ms  p(90)=4µs      p(95)=4.79µs   p(99.9)=37.58µs
     http_req_connecting............: avg=398ns    min=0s      med=0s      max=5.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.69ms  min=1.79ms  med=20.19ms max=300.48ms p(90)=28.71ms  p(95)=31.82ms  p(99.9)=54.3ms 
       { expected_response:true }...: avg=20.69ms  min=1.79ms  med=20.19ms max=300.48ms p(90)=28.71ms  p(95)=31.82ms  p(99.9)=54.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 286631
     http_req_receiving.............: avg=116.09µs min=28.36µs med=56.91µs max=116.81ms p(90)=108.18µs p(95)=271.28µs p(99.9)=8.58ms 
     http_req_sending...............: avg=55.49µs  min=5.15µs  med=10.65µs max=149.82ms p(90)=19.19µs  p(95)=129.41µs p(99.9)=5.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.52ms  min=1.69ms  med=20.04ms max=288.14ms p(90)=28.5ms   p(95)=31.53ms  p(99.9)=53.28ms
     http_reqs......................: 286631  2384.01427/s
     iteration_duration.............: avg=20.93ms  min=3.7ms   med=20.41ms max=350.89ms p(90)=28.94ms  p(95)=32.06ms  p(99.9)=54.98ms
     iterations.....................: 286531  2383.182534/s
     success_rate...................: 100.00% ✓ 286531      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 706716      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 283 MB  2.4 MB/s
     http_req_blocked...............: avg=3.1µs    min=1µs     med=2.51µs   max=14.99ms  p(90)=3.87µs  p(95)=4.58µs   p(99.9)=37.42µs 
     http_req_connecting............: avg=148ns    min=0s      med=0s       max=1.71ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.22ms  min=1.83ms  med=17.15ms  max=569.2ms  p(90)=53.23ms p(95)=70.8ms   p(99.9)=193.12ms
       { expected_response:true }...: avg=25.22ms  min=1.83ms  med=17.15ms  max=569.2ms  p(90)=53.23ms p(95)=70.8ms   p(99.9)=193.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 235672
     http_req_receiving.............: avg=719.28µs min=51.69µs med=109.09µs max=273.75ms p(90)=1.12ms  p(95)=1.78ms   p(99.9)=64.87ms 
     http_req_sending...............: avg=43.02µs  min=5.34µs  med=10.24µs  max=40.68ms  p(90)=18.18µs p(95)=111.37µs p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.46ms  min=1.72ms  med=16.59ms  max=569.11ms p(90)=51.94ms p(95)=69.27ms  p(99.9)=187.83ms
     http_reqs......................: 235672  1959.908394/s
     iteration_duration.............: avg=25.46ms  min=2.47ms  med=17.37ms  max=569.38ms p(90)=53.47ms p(95)=71.05ms  p(99.9)=194.64ms
     iterations.....................: 235572  1959.076769/s
     success_rate...................: 100.00% ✓ 235572      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 554193      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 222 MB  1.8 MB/s
     http_req_blocked...............: avg=3.54µs   min=952ns   med=2.36µs  max=9.45ms   p(90)=4.64µs   p(95)=5.8µs    p(99.9)=47.62µs
     http_req_connecting............: avg=453ns    min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.2ms   min=2.45ms  med=31.17ms max=317.15ms p(90)=42.9ms   p(95)=47.91ms  p(99.9)=87.92ms
       { expected_response:true }...: avg=32.2ms   min=2.45ms  med=31.17ms max=317.15ms p(90)=42.9ms   p(95)=47.91ms  p(99.9)=87.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184831
     http_req_receiving.............: avg=116.96µs min=29.01µs med=62.22µs max=280.31ms p(90)=132.74µs p(95)=267.15µs p(99.9)=6.29ms 
     http_req_sending...............: avg=46.92µs  min=5.26µs  med=10.43µs max=189.63ms p(90)=23.62µs  p(95)=132.76µs p(99.9)=3.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.04ms  min=2.3ms   med=31.03ms max=302.27ms p(90)=42.7ms   p(95)=47.71ms  p(99.9)=87.4ms 
     http_reqs......................: 184831  1536.441047/s
     iteration_duration.............: avg=32.47ms  min=4.62ms  med=31.41ms max=344.21ms p(90)=43.15ms  p(95)=48.15ms  p(99.9)=88.66ms
     iterations.....................: 184731  1535.609779/s
     success_rate...................: 100.00% ✓ 184731      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433767      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.56µs   min=972ns   med=2.51µs  max=4.27ms   p(90)=4.03µs   p(95)=4.7µs    p(99.9)=37.1µs 
     http_req_connecting............: avg=735ns    min=0s      med=0s      max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.24ms  min=2.25ms  med=40.71ms max=337.97ms p(90)=58.04ms  p(95)=63.36ms  p(99.9)=89.28ms
       { expected_response:true }...: avg=41.24ms  min=2.25ms  med=40.71ms max=337.97ms p(90)=58.04ms  p(95)=63.36ms  p(99.9)=89.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144689
     http_req_receiving.............: avg=109.53µs min=29.15µs med=65.57µs max=197.01ms p(90)=104.42µs p(95)=123.24µs p(99.9)=2.04ms 
     http_req_sending...............: avg=32.37µs  min=5.35µs  med=11.49µs max=251.4ms  p(90)=18.24µs  p(95)=22.18µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.1ms   min=2.14ms  med=40.6ms  max=141.34ms p(90)=57.91ms  p(95)=63.21ms  p(99.9)=88.17ms
     http_reqs......................: 144689  1202.742911/s
     iteration_duration.............: avg=41.49ms  min=4.17ms  med=40.92ms max=357.43ms p(90)=58.25ms  p(95)=63.57ms  p(99.9)=89.9ms 
     iterations.....................: 144589  1201.91165/s
     success_rate...................: 100.00% ✓ 144589      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 186510     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   620 kB/s
     http_req_blocked...............: avg=8.07µs  min=1.12µs  med=3.02µs  max=164.11ms p(90)=4.57µs   p(95)=5.2µs    p(99.9)=48.68µs 
     http_req_connecting............: avg=2.06µs  min=0s      med=0s      max=4.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.12ms min=4.37ms  med=94.2ms  max=378.56ms p(90)=119.22ms p(95)=132.33ms p(99.9)=230.25ms
       { expected_response:true }...: avg=96.12ms min=4.37ms  med=94.2ms  max=378.56ms p(90)=119.22ms p(95)=132.33ms p(99.9)=230.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62270
     http_req_receiving.............: avg=88.24µs min=30.9µs  med=80.69µs max=12.14ms  p(90)=115.9µs  p(95)=129.57µs p(99.9)=929.52µs
     http_req_sending...............: avg=31.6µs  min=5.74µs  med=13.92µs max=134.55ms p(90)=20.35µs  p(95)=22.45µs  p(99.9)=874.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96ms    min=4.26ms  med=94.09ms max=372.09ms p(90)=119.1ms  p(95)=132.16ms p(99.9)=230.13ms
     http_reqs......................: 62270   516.367961/s
     iteration_duration.............: avg=96.52ms min=17.73ms med=94.47ms max=388.72ms p(90)=119.47ms p(95)=132.66ms p(99.9)=232.76ms
     iterations.....................: 62170   515.53872/s
     success_rate...................: 100.00% ✓ 62170      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 134775     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   448 kB/s
     http_req_blocked...............: avg=5.94µs   min=1.21µs  med=3.29µs   max=4.1ms    p(90)=4.78µs   p(95)=5.37µs   p(99.9)=439.41µs
     http_req_connecting............: avg=2.32µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=267.66µs
     http_req_duration..............: avg=133.03ms min=5.97ms  med=130.49ms max=364.54ms p(90)=175.92ms p(95)=189.34ms p(99.9)=243.03ms
       { expected_response:true }...: avg=133.03ms min=5.97ms  med=130.49ms max=364.54ms p(90)=175.92ms p(95)=189.34ms p(99.9)=243.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45025
     http_req_receiving.............: avg=95.92µs  min=30.63µs med=86.49µs  max=170.62ms p(90)=118.02µs p(95)=129.47µs p(99.9)=575.82µs
     http_req_sending...............: avg=27.96µs  min=6.26µs  med=16.1µs   max=105.34ms p(90)=21.44µs  p(95)=23.23µs  p(99.9)=642.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.9ms  min=5.83ms  med=130.38ms max=363.76ms p(90)=175.8ms  p(95)=189.21ms p(99.9)=241.6ms 
     http_reqs......................: 45025   372.871019/s
     iteration_duration.............: avg=133.59ms min=42.75ms med=130.82ms max=381.88ms p(90)=176.25ms p(95)=189.71ms p(99.9)=245.04ms
     iterations.....................: 44925   372.042877/s
     success_rate...................: 100.00% ✓ 44925      ✗ 0    
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

     checks.........................: 100.00% ✓ 85821      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.15µs  med=3.3µs    max=4.09ms   p(90)=4.62µs   p(95)=5.13µs   p(99.9)=1.93ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=208.88ms min=8.57ms  med=207.26ms max=441.96ms p(90)=235.66ms p(95)=241.41ms p(99.9)=325.26ms
       { expected_response:true }...: avg=208.88ms min=8.57ms  med=207.26ms max=441.96ms p(90)=235.66ms p(95)=241.41ms p(99.9)=325.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28707
     http_req_receiving.............: avg=98.86µs  min=33.75µs med=92.56µs  max=49.9ms   p(90)=123.63µs p(95)=136.66µs p(99.9)=524.24µs
     http_req_sending...............: avg=38.05µs  min=5.81µs  med=16.91µs  max=148.39ms p(90)=21.69µs  p(95)=23.54µs  p(99.9)=626.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.74ms min=8.43ms  med=207.14ms max=441.21ms p(90)=235.55ms p(95)=241.31ms p(99.9)=324.1ms 
     http_reqs......................: 28707   237.043367/s
     iteration_duration.............: avg=209.88ms min=50.07ms med=207.62ms max=459.85ms p(90)=235.93ms p(95)=241.75ms p(99.9)=328.15ms
     iterations.....................: 28607   236.217633/s
     success_rate...................: 100.00% ✓ 28607      ✗ 0    
     vus............................: 44      min=44       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85488      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=6.61µs   min=1.28µs  med=3.61µs   max=3.85ms   p(90)=5.08µs   p(95)=5.68µs   p(99.9)=1.11ms  
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=984.28µs
     http_req_duration..............: avg=209.69ms min=6.58ms  med=190.65ms max=759.87ms p(90)=241.12ms p(95)=460.47ms p(99.9)=611.55ms
       { expected_response:true }...: avg=209.69ms min=6.58ms  med=190.65ms max=759.87ms p(90)=241.12ms p(95)=460.47ms p(99.9)=611.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28596
     http_req_receiving.............: avg=105.91µs min=34.77µs med=97.55µs  max=92.64ms  p(90)=128.84µs p(95)=142.21µs p(99.9)=781.24µs
     http_req_sending...............: avg=23.8µs   min=6.19µs  med=18.2µs   max=27.67ms  p(90)=23.09µs  p(95)=24.81µs  p(99.9)=739.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.56ms min=6.46ms  med=190.52ms max=759.76ms p(90)=241.01ms p(95)=460.36ms p(99.9)=611.43ms
     http_reqs......................: 28596   236.396258/s
     iteration_duration.............: avg=210.69ms min=30.52ms med=191.04ms max=760.12ms p(90)=241.63ms p(95)=462.33ms p(99.9)=611.8ms 
     iterations.....................: 28496   235.569582/s
     success_rate...................: 100.00% ✓ 28496      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

