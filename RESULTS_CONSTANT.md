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
| hive-router | v0.0.49 | 2,905 | 3,047 | 2,835 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,166 | 2,223 | 2,159 | 1.0% |  |
| grafbase | 0.53.3 | 2,021 | 2,089 | 1,996 | 1.5% |  |
| cosmo | 0.307.0 | 1,280 | 1,300 | 1,269 | 0.9% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 530 | 541 | 527 | 0.9% |  |
| apollo-router | v2.13.1 | 431 | 440 | 427 | 1.0% |  |
| hive-gateway | 2.5.25 | 255 | 260 | 254 | 0.7% |  |
| apollo-gateway | 2.13.3 | 244 | 247 | 244 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,392 | 2,531 | 2,364 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,975 | 2,023 | 1,957 | 1.1% |  |
| grafbase | 0.53.3 | 1,511 | 1,554 | 1,492 | 1.4% |  |
| cosmo | 0.307.0 | 1,168 | 1,192 | 1,158 | 0.9% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 521 | 534 | 516 | 1.2% |  |
| apollo-router | v2.13.1 | 384 | 391 | 381 | 1.0% |  |
| hive-gateway | 2.5.25 | 246 | 251 | 243 | 1.0% |  |
| apollo-gateway | 2.13.3 | 234 | 237 | 233 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1047354     ✗ 0     
     data_received..................: 31 GB   255 MB/s
     data_sent......................: 420 MB  3.5 MB/s
     http_req_blocked...............: avg=3.42µs  min=992ns   med=2.33µs  max=26.2ms   p(90)=3.57µs   p(95)=4.24µs   p(99.9)=36.57µs
     http_req_connecting............: avg=309ns   min=0s      med=0s      max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.94ms min=1.61ms  med=16.02ms max=317.79ms p(90)=24.94ms  p(95)=28.76ms  p(99.9)=52.61ms
       { expected_response:true }...: avg=16.94ms min=1.61ms  med=16.02ms max=317.79ms p(90)=24.94ms  p(95)=28.76ms  p(99.9)=52.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 349218
     http_req_receiving.............: avg=137.5µs min=27.47µs med=51.68µs max=39.97ms  p(90)=104.04µs p(95)=288.67µs p(99.9)=13.14ms
     http_req_sending...............: avg=64.83µs min=5.23µs  med=9.63µs  max=310.71ms p(90)=16.54µs  p(95)=128.31µs p(99.9)=12.13ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.74ms min=1.53ms  med=15.86ms max=309.71ms p(90)=24.65ms  p(95)=28.35ms  p(99.9)=51.06ms
     http_reqs......................: 349218  2905.015023/s
     iteration_duration.............: avg=17.17ms min=2.13ms  med=16.22ms max=335.67ms p(90)=25.17ms  p(95)=29.02ms  p(99.9)=54.05ms
     iterations.....................: 349118  2904.18316/s
     success_rate...................: 100.00% ✓ 349118      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 781542      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.16µs   min=981ns   med=2.31µs   max=12.35ms  p(90)=3.51µs   p(95)=4.14µs   p(99.9)=34.36µs 
     http_req_connecting............: avg=390ns    min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.79ms  min=2.43ms  med=14.71ms  max=392.69ms p(90)=50.1ms   p(95)=68.68ms  p(99.9)=170.87ms
       { expected_response:true }...: avg=22.79ms  min=2.43ms  med=14.71ms  max=392.69ms p(90)=50.1ms   p(95)=68.68ms  p(99.9)=170.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260614
     http_req_receiving.............: avg=668.99µs min=48.83µs med=103.68µs max=335.25ms p(90)=961.97µs p(95)=1.51ms   p(99.9)=60.86ms 
     http_req_sending...............: avg=45.74µs  min=5.33µs  med=9.44µs   max=46.01ms  p(90)=15.79µs  p(95)=112.28µs p(99.9)=3.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.07ms  min=2.34ms  med=14.19ms  max=368.02ms p(90)=48.74ms  p(95)=67.21ms  p(99.9)=166.41ms
     http_reqs......................: 260614  2166.349004/s
     iteration_duration.............: avg=23.02ms  min=3.13ms  med=14.92ms  max=392.9ms  p(90)=50.35ms  p(95)=68.95ms  p(99.9)=172.26ms
     iterations.....................: 260514  2165.517756/s
     success_rate...................: 100.00% ✓ 260514      ✗ 0     
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

     checks.........................: 100.00% ✓ 729030      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.3µs    min=941ns  med=2.39µs  max=6.66ms   p(90)=3.92µs   p(95)=4.7µs    p(99.9)=39.63µs
     http_req_connecting............: avg=460ns    min=0s     med=0s      max=4.69ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.44ms  min=2.03ms med=24.2ms  max=314.73ms p(90)=29.31ms  p(95)=31.5ms   p(99.9)=53.86ms
       { expected_response:true }...: avg=24.44ms  min=2.03ms med=24.2ms  max=314.73ms p(90)=29.31ms  p(95)=31.5ms   p(99.9)=53.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 243110
     http_req_receiving.............: avg=110.98µs min=29.7µs med=59.41µs max=78.12ms  p(90)=102.33µs p(95)=200.59µs p(99.9)=8.25ms 
     http_req_sending...............: avg=44.07µs  min=4.9µs  med=10.22µs max=181.73ms p(90)=17.41µs  p(95)=114.23µs p(99.9)=2.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.29ms  min=1.93ms med=24.09ms max=312.77ms p(90)=29.13ms  p(95)=31.25ms  p(99.9)=52.84ms
     http_reqs......................: 243110  2021.606547/s
     iteration_duration.............: avg=24.68ms  min=3.5ms  med=24.41ms max=354.47ms p(90)=29.53ms  p(95)=31.74ms  p(99.9)=54.39ms
     iterations.....................: 243010  2020.774987/s
     success_rate...................: 100.00% ✓ 243010      ✗ 0     
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

     checks.........................: 100.00% ✓ 461679      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.38µs  min=1µs     med=2.45µs  max=3.91ms   p(90)=3.84µs  p(95)=4.48µs   p(99.9)=34.57µs
     http_req_connecting............: avg=633ns   min=0s      med=0s      max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.74ms min=2.15ms  med=38.16ms max=303.31ms p(90)=54.59ms p(95)=59.55ms  p(99.9)=84.23ms
       { expected_response:true }...: avg=38.74ms min=2.15ms  med=38.16ms max=303.31ms p(90)=54.59ms p(95)=59.55ms  p(99.9)=84.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153993
     http_req_receiving.............: avg=83.99µs min=27.66µs med=60.58µs max=231.21ms p(90)=97.23µs p(95)=116.14µs p(99.9)=1.99ms 
     http_req_sending...............: avg=29.21µs min=5.1µs   med=10.85µs max=218.94ms p(90)=16.66µs p(95)=20.75µs  p(99.9)=1.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.62ms min=2.05ms  med=38.06ms max=302.77ms p(90)=54.48ms p(95)=59.42ms  p(99.9)=83.61ms
     http_reqs......................: 153993  1280.423008/s
     iteration_duration.............: avg=38.98ms min=4.21ms  med=38.37ms max=345.77ms p(90)=54.8ms  p(95)=59.76ms  p(99.9)=84.75ms
     iterations.....................: 153893  1279.591526/s
     success_rate...................: 100.00% ✓ 153893      ✗ 0     
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

     checks.........................: 100.00% ✓ 191754     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   638 kB/s
     http_req_blocked...............: avg=4.73µs  min=1.17µs  med=2.83µs  max=4.27ms   p(90)=4.35µs   p(95)=4.96µs   p(99.9)=44.57µs 
     http_req_connecting............: avg=1.57µs  min=0s      med=0s      max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.51ms min=4.14ms  med=91.62ms max=347.64ms p(90)=114.56ms p(95)=126.32ms p(99.9)=218.02ms
       { expected_response:true }...: avg=93.51ms min=4.14ms  med=91.62ms max=347.64ms p(90)=114.56ms p(95)=126.32ms p(99.9)=218.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64018
     http_req_receiving.............: avg=86.66µs min=31.08µs med=76.34µs max=139.16ms p(90)=110.7µs  p(95)=123.33µs p(99.9)=822.22µs
     http_req_sending...............: avg=24.77µs min=5.3µs   med=12.84µs max=222.59ms p(90)=19.18µs  p(95)=21.44µs  p(99.9)=673.65µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.4ms  min=4ms     med=91.52ms max=346.76ms p(90)=114.46ms p(95)=126.19ms p(99.9)=217.65ms
     http_reqs......................: 64018   530.913981/s
     iteration_duration.............: avg=93.88ms min=35.53ms med=91.85ms max=368.63ms p(90)=114.81ms p(95)=126.6ms  p(99.9)=219.54ms
     iterations.....................: 63918   530.084661/s
     success_rate...................: 100.00% ✓ 63918      ✗ 0    
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

     checks.........................: 100.00% ✓ 155901     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   518 kB/s
     http_req_blocked...............: avg=5.61µs   min=1.15µs  med=3.33µs   max=4.64ms   p(90)=4.77µs   p(95)=5.33µs   p(99.9)=234.49µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=4.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115ms    min=5.53ms  med=114.76ms max=345.29ms p(90)=138.93ms p(95)=145.93ms p(99.9)=181.57ms
       { expected_response:true }...: avg=115ms    min=5.53ms  med=114.76ms max=345.29ms p(90)=138.93ms p(95)=145.93ms p(99.9)=181.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52067
     http_req_receiving.............: avg=159.24µs min=31.29µs med=82.87µs  max=169.91ms p(90)=114.57µs p(95)=126.59µs p(99.9)=1.69ms  
     http_req_sending...............: avg=26.66µs  min=5.79µs  med=15.36µs  max=188.25ms p(90)=20.6µs   p(95)=22.46µs  p(99.9)=556.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.81ms min=5.41ms  med=114.64ms max=201.46ms p(90)=138.79ms p(95)=145.78ms p(99.9)=175.11ms
     http_reqs......................: 52067   431.425528/s
     iteration_duration.............: avg=115.47ms min=6.79ms  med=115.04ms max=376.35ms p(90)=139.18ms p(95)=146.21ms p(99.9)=182.61ms
     iterations.....................: 51967   430.596931/s
     success_rate...................: 100.00% ✓ 51967      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 92268      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   306 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.3µs   med=3.72µs   max=4.93ms   p(90)=5.25µs   p(95)=5.9µs    p(99.9)=1.6ms   
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=4.89ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=194.26ms min=6.4ms   med=175.94ms max=605.99ms p(90)=231.11ms p(95)=408.16ms p(99.9)=528.91ms
       { expected_response:true }...: avg=194.26ms min=6.4ms   med=175.94ms max=605.99ms p(90)=231.11ms p(95)=408.16ms p(99.9)=528.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30856
     http_req_receiving.............: avg=107.68µs min=35.5µs  med=99.62µs  max=62.62ms  p(90)=132.33µs p(95)=145.54µs p(99.9)=704.69µs
     http_req_sending...............: avg=33.57µs  min=6.25µs  med=18.17µs  max=77.95ms  p(90)=23.29µs  p(95)=25.3µs   p(99.9)=728.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.12ms min=6.27ms  med=175.81ms max=605.79ms p(90)=230.98ms p(95)=408.02ms p(99.9)=528.78ms
     http_reqs......................: 30856   255.216482/s
     iteration_duration.............: avg=195.2ms  min=64.33ms med=176.28ms max=606.27ms p(90)=231.62ms p(95)=409.31ms p(99.9)=529.2ms 
     iterations.....................: 30756   254.389361/s
     success_rate...................: 100.00% ✓ 30756      ✗ 0    
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

     checks.........................: 100.00% ✓ 88485      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=7.13µs   min=1.18µs  med=3.24µs   max=4.2ms    p(90)=4.46µs   p(95)=4.97µs   p(99.9)=2.06ms  
     http_req_connecting............: avg=3.73µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=2.03ms  
     http_req_duration..............: avg=202.59ms min=8.38ms  med=203.21ms max=431.57ms p(90)=214.63ms p(95)=221.34ms p(99.9)=287.73ms
       { expected_response:true }...: avg=202.59ms min=8.38ms  med=203.21ms max=431.57ms p(90)=214.63ms p(95)=221.34ms p(99.9)=287.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29595
     http_req_receiving.............: avg=101.99µs min=32.66µs med=88.14µs  max=152.23ms p(90)=119.41µs p(95)=130.56µs p(99.9)=677.21µs
     http_req_sending...............: avg=29.61µs  min=6.04µs  med=15.6µs   max=157.95ms p(90)=20.33µs  p(95)=21.95µs  p(99.9)=500.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.46ms min=8.26ms  med=203.1ms  max=410.47ms p(90)=214.52ms p(95)=221.23ms p(99.9)=287.49ms
     http_reqs......................: 29595   244.509227/s
     iteration_duration.............: avg=203.53ms min=44.18ms med=203.72ms max=438.63ms p(90)=214.88ms p(95)=221.64ms p(99.9)=289.37ms
     iterations.....................: 29495   243.683043/s
     success_rate...................: 100.00% ✓ 29495      ✗ 0    
     vus............................: 28      min=28       max=50 
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

     checks.........................: 100.00% ✓ 862494      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.82µs   min=932ns  med=2.14µs  max=16.17ms  p(90)=3.56µs   p(95)=4.38µs   p(99.9)=33.16µs
     http_req_connecting............: avg=156ns    min=0s     med=0s      max=2.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.63ms  min=1.87ms med=20.13ms max=310.5ms  p(90)=28.48ms  p(95)=31.54ms  p(99.9)=54.01ms
       { expected_response:true }...: avg=20.63ms  min=1.87ms med=20.13ms max=310.5ms  p(90)=28.48ms  p(95)=31.54ms  p(99.9)=54.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287598
     http_req_receiving.............: avg=121.46µs min=27.7µs med=53.64µs max=171.8ms  p(90)=101.87µs p(95)=251.82µs p(99.9)=9.14ms 
     http_req_sending...............: avg=51.7µs   min=5µs    med=9.57µs  max=114.73ms p(90)=17.54µs  p(95)=121.48µs p(99.9)=5.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.45ms  min=1.75ms med=19.99ms max=148.85ms p(90)=28.29ms  p(95)=31.27ms  p(99.9)=53.32ms
     http_reqs......................: 287598  2392.00918/s
     iteration_duration.............: avg=20.86ms  min=2.9ms  med=20.34ms max=353.76ms p(90)=28.7ms   p(95)=31.77ms  p(99.9)=54.58ms
     iterations.....................: 287498  2391.177461/s
     success_rate...................: 100.00% ✓ 287498      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 712479      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 286 MB  2.4 MB/s
     http_req_blocked...............: avg=2.97µs  min=952ns   med=2.13µs   max=17.36ms  p(90)=3.6µs   p(95)=4.34µs   p(99.9)=38.14µs 
     http_req_connecting............: avg=300ns   min=0s      med=0s       max=3.26ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.01ms min=1.88ms  med=17.15ms  max=573.17ms p(90)=52.17ms p(95)=69.55ms  p(99.9)=203.99ms
       { expected_response:true }...: avg=25.01ms min=1.88ms  med=17.15ms  max=573.17ms p(90)=52.17ms p(95)=69.55ms  p(99.9)=203.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237593
     http_req_receiving.............: avg=677.7µs min=50.74µs med=103.66µs max=281.7ms  p(90)=1.13ms  p(95)=1.79ms   p(99.9)=59.4ms  
     http_req_sending...............: avg=45.72µs min=5.15µs  med=9.47µs   max=299.23ms p(90)=17.82µs p(95)=108.31µs p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.29ms min=1.76ms  med=16.61ms  max=567.09ms p(90)=50.86ms p(95)=68.07ms  p(99.9)=200.19ms
     http_reqs......................: 237593  1975.806997/s
     iteration_duration.............: avg=25.25ms min=2.75ms  med=17.37ms  max=573.35ms p(90)=52.4ms  p(95)=69.81ms  p(99.9)=209.99ms
     iterations.....................: 237493  1974.975404/s
     success_rate...................: 100.00% ✓ 237493      ✗ 0     
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

     checks.........................: 100.00% ✓ 545232      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.4µs    min=971ns   med=2.25µs  max=4.35ms   p(90)=4.51µs   p(95)=5.73µs   p(99.9)=44.83µs
     http_req_connecting............: avg=539ns    min=0s      med=0s      max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.74ms  min=2.28ms  med=31.78ms max=326.22ms p(90)=43.37ms  p(95)=48.19ms  p(99.9)=89.21ms
       { expected_response:true }...: avg=32.74ms  min=2.28ms  med=31.78ms max=326.22ms p(90)=43.37ms  p(95)=48.19ms  p(99.9)=89.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181844
     http_req_receiving.............: avg=109.81µs min=27.43µs med=61.53µs max=201.94ms p(90)=130.92µs p(95)=257.06µs p(99.9)=4.93ms 
     http_req_sending...............: avg=47.84µs  min=5.26µs  med=10.2µs  max=279.29ms p(90)=23.34µs  p(95)=129.01µs p(99.9)=3.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.58ms  min=2.21ms  med=31.66ms max=325.2ms  p(90)=43.18ms  p(95)=47.97ms  p(99.9)=88.3ms 
     http_reqs......................: 181844  1511.60007/s
     iteration_duration.............: avg=33ms     min=5.49ms  med=32.02ms max=351.04ms p(90)=43.61ms  p(95)=48.44ms  p(99.9)=90.55ms
     iterations.....................: 181744  1510.768808/s
     success_rate...................: 100.00% ✓ 181744      ✗ 0     
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

     checks.........................: 100.00% ✓ 421374      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.07µs   min=1.01µs  med=2.45µs  max=2.97ms   p(90)=3.99µs   p(95)=4.64µs  p(99.9)=36.08µs
     http_req_connecting............: avg=263ns    min=0s      med=0s      max=2.06ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=42.47ms  min=2.25ms  med=41.95ms max=342.42ms p(90)=59.78ms  p(95)=65.13ms p(99.9)=91.03ms
       { expected_response:true }...: avg=42.47ms  min=2.25ms  med=41.95ms max=342.42ms p(90)=59.78ms  p(95)=65.13ms p(99.9)=91.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140558
     http_req_receiving.............: avg=116.34µs min=28.42µs med=64.94µs max=256.43ms p(90)=102.12µs p(95)=120µs   p(99.9)=1.78ms 
     http_req_sending...............: avg=24.48µs  min=5.25µs  med=11.19µs max=23.98ms  p(90)=17.25µs  p(95)=20.93µs p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=42.33ms  min=2.13ms  med=41.85ms max=126.57ms p(90)=59.67ms  p(95)=65.01ms p(99.9)=88.56ms
     http_reqs......................: 140558  1168.427073/s
     iteration_duration.............: avg=42.71ms  min=2.92ms  med=42.16ms max=351.71ms p(90)=59.98ms  p(95)=65.35ms p(99.9)=91.5ms 
     iterations.....................: 140458  1167.595796/s
     success_rate...................: 100.00% ✓ 140458      ✗ 0     
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

     checks.........................: 100.00% ✓ 188214     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   626 kB/s
     http_req_blocked...............: avg=5.06µs  min=1.04µs  med=3.2µs   max=3.97ms   p(90)=4.78µs   p(95)=5.39µs   p(99.9)=61.29µs 
     http_req_connecting............: avg=1.61µs  min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.24ms min=4.23ms  med=92.93ms max=340.33ms p(90)=116.26ms p(95)=128.71ms p(99.9)=225.78ms
       { expected_response:true }...: avg=95.24ms min=4.23ms  med=92.93ms max=340.33ms p(90)=116.26ms p(95)=128.71ms p(99.9)=225.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62838
     http_req_receiving.............: avg=93.4µs  min=31.98µs med=81.51µs max=217.44ms p(90)=115.33µs p(95)=127.41µs p(99.9)=829.61µs
     http_req_sending...............: avg=19.49µs min=5.65µs  med=13.99µs max=22.12ms  p(90)=20.32µs  p(95)=22.5µs   p(99.9)=615.27µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.13ms min=4.11ms  med=92.83ms max=339.22ms p(90)=116.16ms p(95)=128.59ms p(99.9)=225.43ms
     http_reqs......................: 62838   521.034847/s
     iteration_duration.............: avg=95.65ms min=17.97ms med=93.17ms max=378.35ms p(90)=116.52ms p(95)=129.05ms p(99.9)=228.22ms
     iterations.....................: 62738   520.205675/s
     success_rate...................: 100.00% ✓ 62738      ✗ 0    
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

     checks.........................: 100.00% ✓ 139011     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 56 MB   462 kB/s
     http_req_blocked...............: avg=5.82µs   min=1.06µs  med=3.42µs   max=4.53ms   p(90)=4.92µs   p(95)=5.52µs   p(99.9)=497.01µs
     http_req_connecting............: avg=2.19µs   min=0s      med=0s       max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=473.59µs
     http_req_duration..............: avg=128.96ms min=5.94ms  med=126.38ms max=360.69ms p(90)=171.18ms p(95)=185.02ms p(99.9)=235.4ms 
       { expected_response:true }...: avg=128.96ms min=5.94ms  med=126.38ms max=360.69ms p(90)=171.18ms p(95)=185.02ms p(99.9)=235.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 46437
     http_req_receiving.............: avg=96.62µs  min=31.19µs med=88.05µs  max=88.17ms  p(90)=119.95µs p(95)=132.75µs p(99.9)=670.58µs
     http_req_sending...............: avg=31.58µs  min=5.96µs  med=16.72µs  max=183.24ms p(90)=21.87µs  p(95)=23.78µs  p(99.9)=585.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.84ms min=5.86ms  med=126.27ms max=360.41ms p(90)=171.07ms p(95)=184.9ms  p(99.9)=234.3ms 
     http_reqs......................: 46437   384.571407/s
     iteration_duration.............: avg=129.52ms min=20.69ms med=126.71ms max=371.44ms p(90)=171.49ms p(95)=185.31ms p(99.9)=237.35ms
     iterations.....................: 46337   383.743249/s
     success_rate...................: 100.00% ✓ 46337      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 89133      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=5.17µs   min=1.26µs  med=3.47µs   max=3.46ms   p(90)=4.79µs   p(95)=5.33µs   p(99.9)=625.66µs
     http_req_connecting............: avg=1.45µs   min=0s      med=0s       max=2.24ms   p(90)=0s       p(95)=0s       p(99.9)=578.6µs 
     http_req_duration..............: avg=201.16ms min=6.53ms  med=184.99ms max=619.56ms p(90)=237.56ms p(95)=404.74ms p(99.9)=536.77ms
       { expected_response:true }...: avg=201.16ms min=6.53ms  med=184.99ms max=619.56ms p(90)=237.56ms p(95)=404.74ms p(99.9)=536.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29811
     http_req_receiving.............: avg=115.97µs min=35.73µs med=94.57µs  max=118.39ms p(90)=125.94µs p(95)=138.77µs p(99.9)=813.26µs
     http_req_sending...............: avg=27.28µs  min=5.75µs  med=17.33µs  max=124.55ms p(90)=22.1µs   p(95)=23.84µs  p(99.9)=518.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.02ms min=6.35ms  med=184.87ms max=619.44ms p(90)=237.34ms p(95)=404.64ms p(99.9)=536.63ms
     http_reqs......................: 29811   246.137537/s
     iteration_duration.............: avg=202.09ms min=40.33ms med=185.35ms max=619.84ms p(90)=238.04ms p(95)=405.66ms p(99.9)=537.22ms
     iterations.....................: 29711   245.311877/s
     success_rate...................: 100.00% ✓ 29711      ✗ 0    
     vus............................: 9       min=9        max=50 
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

     checks.........................: 100.00% ✓ 84915      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   282 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.18µs  med=3.47µs   max=4.16ms   p(90)=4.77µs   p(95)=5.29µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=3.62µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=211.11ms min=8.92ms  med=212.36ms max=456.31ms p(90)=222.54ms p(95)=229.49ms p(99.9)=302.61ms
       { expected_response:true }...: avg=211.11ms min=8.92ms  med=212.36ms max=456.31ms p(90)=222.54ms p(95)=229.49ms p(99.9)=302.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28405
     http_req_receiving.............: avg=262.51µs min=34.1µs  med=94.29µs  max=255.88ms p(90)=126.04µs p(95)=139.1µs  p(99.9)=62.47ms 
     http_req_sending...............: avg=35.86µs  min=6.02µs  med=17µs     max=243.45ms p(90)=21.6µs   p(95)=23.29µs  p(99.9)=640.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.81ms min=8.8ms   med=212.15ms max=302.85ms p(90)=222.33ms p(95)=229.26ms p(99.9)=297.38ms
     http_reqs......................: 28405   234.519374/s
     iteration_duration.............: avg=212.12ms min=41.76ms med=212.73ms max=464.75ms p(90)=222.84ms p(95)=229.77ms p(99.9)=312.39ms
     iterations.....................: 28305   233.693747/s
     success_rate...................: 100.00% ✓ 28305      ✗ 0    
     vus............................: 44      min=44       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

