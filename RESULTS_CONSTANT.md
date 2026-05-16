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
| hive-router | v0.0.49 | 2,962 | 3,147 | 2,900 | 2.6% |  |
| grafbase | 0.53.3 | 2,091 | 2,152 | 2,045 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,091 | 2,144 | 2,079 | 1.0% |  |
| cosmo | 0.307.0 | 1,240 | 1,257 | 1,230 | 0.7% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 536 | 549 | 533 | 1.1% |  |
| apollo-router | v2.13.1 | 400 | 412 | 396 | 1.4% |  |
| apollo-gateway | 2.13.3 | 250 | 251 | 248 | 0.3% |  |
| hive-gateway | 2.5.25 | 246 | 251 | 243 | 1.1% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,376 | 2,523 | 2,358 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,918 | 1,961 | 1,902 | 1.0% |  |
| grafbase | 0.53.3 | 1,527 | 1,568 | 1,520 | 1.1% |  |
| cosmo | 0.307.0 | 1,217 | 1,232 | 1,210 | 0.7% | non-compatible response (5 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 522 | 534 | 514 | 1.3% |  |
| apollo-router | v2.13.1 | 371 | 382 | 367 | 1.4% |  |
| hive-gateway | 2.5.25 | 245 | 250 | 243 | 0.9% |  |
| apollo-gateway | 2.13.3 | 230 | 233 | 229 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1067853     ✗ 0     
     data_received..................: 31 GB   260 MB/s
     data_sent......................: 428 MB  3.6 MB/s
     http_req_blocked...............: avg=2.78µs   min=992ns   med=1.99µs  max=23.9ms   p(90)=3.1µs   p(95)=3.72µs   p(99.9)=29.92µs
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.62ms  min=1.64ms  med=15.64ms max=369.51ms p(90)=24.63ms p(95)=28.59ms  p(99.9)=51.44ms
       { expected_response:true }...: avg=16.62ms  min=1.64ms  med=15.64ms max=369.51ms p(90)=24.63ms p(95)=28.59ms  p(99.9)=51.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 356051
     http_req_receiving.............: avg=151.51µs min=27.83µs med=48.79µs max=297.46ms p(90)=95.29µs p(95)=273.06µs p(99.9)=15.66ms
     http_req_sending...............: avg=58.4µs   min=5.21µs  med=8.93µs  max=36.18ms  p(90)=14.9µs  p(95)=119.79µs p(99.9)=12.61ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.41ms  min=1.59ms  med=15.49ms max=73.94ms  p(90)=24.35ms p(95)=28.18ms  p(99.9)=50.27ms
     http_reqs......................: 356051  2962.193367/s
     iteration_duration.............: avg=16.84ms  min=2.2ms   med=15.84ms max=397.71ms p(90)=24.86ms p(95)=28.86ms  p(99.9)=52.65ms
     iterations.....................: 355951  2961.361409/s
     success_rate...................: 100.00% ✓ 355951      ✗ 0     
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

     checks.........................: 100.00% ✓ 754368      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 302 MB  2.5 MB/s
     http_req_blocked...............: avg=2.98µs   min=972ns   med=2.24µs  max=13.26ms  p(90)=3.77µs   p(95)=4.58µs   p(99.9)=45.88µs
     http_req_connecting............: avg=176ns    min=0s      med=0s      max=2.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.61ms  min=1.86ms  med=23.36ms max=314.2ms  p(90)=28.37ms  p(95)=30.63ms  p(99.9)=53.5ms 
       { expected_response:true }...: avg=23.61ms  min=1.86ms  med=23.36ms max=314.2ms  p(90)=28.37ms  p(95)=30.63ms  p(99.9)=53.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 251556
     http_req_receiving.............: avg=107.96µs min=29.14µs med=57.07µs max=37.35ms  p(90)=100.92µs p(95)=190.44µs p(99.9)=8.41ms 
     http_req_sending...............: avg=47.4µs   min=4.7µs   med=9.91µs  max=191.15ms p(90)=17.38µs  p(95)=113.48µs p(99.9)=3.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.46ms  min=1.81ms  med=23.25ms max=314.05ms p(90)=28.2ms   p(95)=30.37ms  p(99.9)=52.23ms
     http_reqs......................: 251556  2091.913857/s
     iteration_duration.............: avg=23.85ms  min=3.62ms  med=23.57ms max=340.27ms p(90)=28.59ms  p(95)=30.87ms  p(99.9)=53.88ms
     iterations.....................: 251456  2091.082268/s
     success_rate...................: 100.00% ✓ 251456      ✗ 0     
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

     checks.........................: 100.00% ✓ 754380      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 302 MB  2.5 MB/s
     http_req_blocked...............: avg=2.83µs   min=972ns   med=2.13µs  max=4.08ms   p(90)=3.26µs   p(95)=3.84µs   p(99.9)=31.73µs 
     http_req_connecting............: avg=398ns    min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.62ms  min=2.4ms   med=14.65ms max=302.23ms p(90)=53.9ms   p(95)=72.38ms  p(99.9)=170.27ms
       { expected_response:true }...: avg=23.62ms  min=2.4ms   med=14.65ms max=302.23ms p(90)=53.9ms   p(95)=72.38ms  p(99.9)=170.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 251560
     http_req_receiving.............: avg=646.99µs min=51.48µs med=113.4µs max=193.98ms p(90)=941.13µs p(95)=1.43ms   p(99.9)=59.56ms 
     http_req_sending...............: avg=41.34µs  min=5.18µs  med=9.33µs  max=180.61ms p(90)=15.33µs  p(95)=102.87µs p(99.9)=2.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.93ms  min=2.3ms   med=14.15ms max=301.63ms p(90)=52.6ms   p(95)=71.13ms  p(99.9)=167.35ms
     http_reqs......................: 251560  2091.378324/s
     iteration_duration.............: avg=23.85ms  min=3.42ms  med=14.86ms max=332.94ms p(90)=54.14ms  p(95)=72.61ms  p(99.9)=171.64ms
     iterations.....................: 251460  2090.54696/s
     success_rate...................: 100.00% ✓ 251460      ✗ 0     
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

     checks.........................: 100.00% ✓ 447501      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.46µs  min=1.05µs  med=2.38µs  max=4.21ms   p(90)=3.61µs  p(95)=4.18µs   p(99.9)=33.93µs
     http_req_connecting............: avg=782ns   min=0s      med=0s      max=4.19ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.98ms min=2.14ms  med=39.45ms max=340.06ms p(90)=56.29ms p(95)=61.48ms  p(99.9)=85.71ms
       { expected_response:true }...: avg=39.98ms min=2.14ms  med=39.45ms max=340.06ms p(90)=56.29ms p(95)=61.48ms  p(99.9)=85.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149267
     http_req_receiving.............: avg=82.48µs min=28.41µs med=61.34µs max=138.86ms p(90)=97.06µs p(95)=115.68µs p(99.9)=1.92ms 
     http_req_sending...............: avg=24.75µs min=5.29µs  med=10.22µs max=139.61ms p(90)=15.23µs p(95)=19.3µs   p(99.9)=1.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.87ms min=2.05ms  med=39.35ms max=328.01ms p(90)=56.19ms p(95)=61.37ms  p(99.9)=85.18ms
     http_reqs......................: 149267  1240.990403/s
     iteration_duration.............: avg=40.21ms min=3.66ms  med=39.65ms max=347.56ms p(90)=56.5ms  p(95)=61.68ms  p(99.9)=86.24ms
     iterations.....................: 149167  1240.159014/s
     success_rate...................: 100.00% ✓ 149167      ✗ 0     
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

     checks.........................: 100.00% ✓ 193842     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   645 kB/s
     http_req_blocked...............: avg=3.88µs  min=1.09µs  med=2.61µs  max=3.11ms   p(90)=4.09µs   p(95)=4.67µs   p(99.9)=44.53µs 
     http_req_connecting............: avg=988ns   min=0s      med=0s      max=3.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.5ms  min=4.03ms  med=89.29ms max=346.21ms p(90)=114.29ms p(95)=127.87ms p(99.9)=219.74ms
       { expected_response:true }...: avg=92.5ms  min=4.03ms  med=89.29ms max=346.21ms p(90)=114.29ms p(95)=127.87ms p(99.9)=219.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64714
     http_req_receiving.............: avg=81.93µs min=30.9µs  med=73.87µs max=12.07ms  p(90)=108.28µs p(95)=120.46µs p(99.9)=1.01ms  
     http_req_sending...............: avg=27.97µs min=5.58µs  med=12.02µs max=219.42ms p(90)=18.33µs  p(95)=20.62µs  p(99.9)=767.89µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.39ms min=3.96ms  med=89.19ms max=345.87ms p(90)=114.17ms p(95)=127.75ms p(99.9)=219.5ms 
     http_reqs......................: 64714   536.854552/s
     iteration_duration.............: avg=92.87ms min=21.66ms med=89.52ms max=358.17ms p(90)=114.52ms p(95)=128.18ms p(99.9)=222.45ms
     iterations.....................: 64614   536.024972/s
     success_rate...................: 100.00% ✓ 64614      ✗ 0    
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

     checks.........................: 100.00% ✓ 144654     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   481 kB/s
     http_req_blocked...............: avg=5.51µs   min=1.1µs   med=3.24µs   max=4.43ms   p(90)=4.6µs    p(95)=5.12µs   p(99.9)=204.2µs 
     http_req_connecting............: avg=2.06µs   min=0s      med=0s       max=4.39ms   p(90)=0s       p(95)=0s       p(99.9)=140.75µs
     http_req_duration..............: avg=123.95ms min=5.52ms  med=123.6ms  max=338.82ms p(90)=150.1ms  p(95)=158.15ms p(99.9)=195.61ms
       { expected_response:true }...: avg=123.95ms min=5.52ms  med=123.6ms  max=338.82ms p(90)=150.1ms  p(95)=158.15ms p(99.9)=195.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48318
     http_req_receiving.............: avg=90.06µs  min=30.3µs  med=82.45µs  max=137.64ms p(90)=114.42µs p(95)=125.96µs p(99.9)=652.44µs
     http_req_sending...............: avg=26.44µs  min=5.73µs  med=14.89µs  max=129.66ms p(90)=20.38µs  p(95)=22.31µs  p(99.9)=725.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.83ms min=5.4ms   med=123.5ms  max=337.46ms p(90)=149.99ms p(95)=158.03ms p(99.9)=194.82ms
     http_reqs......................: 48318   400.318886/s
     iteration_duration.............: avg=124.46ms min=32.79ms med=123.89ms max=373.2ms  p(90)=150.35ms p(95)=158.41ms p(99.9)=198.52ms
     iterations.....................: 48218   399.490377/s
     success_rate...................: 100.00% ✓ 48218      ✗ 0    
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

     checks.........................: 100.00% ✓ 90780      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   301 kB/s
     http_req_blocked...............: avg=5.28µs   min=1.33µs  med=3.44µs   max=2.82ms   p(90)=4.74µs   p(95)=5.27µs   p(99.9)=580.77µs
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=2.78ms   p(90)=0s       p(95)=0s       p(99.9)=511.13µs
     http_req_duration..............: avg=197.49ms min=8.38ms  med=200.06ms max=341.99ms p(90)=206.93ms p(95)=212.28ms p(99.9)=275.63ms
       { expected_response:true }...: avg=197.49ms min=8.38ms  med=200.06ms max=341.99ms p(90)=206.93ms p(95)=212.28ms p(99.9)=275.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30360
     http_req_receiving.............: avg=111.37µs min=34.81µs med=93.68µs  max=85.8ms   p(90)=125.06µs p(95)=137.81µs p(99.9)=946.43µs
     http_req_sending...............: avg=33.9µs   min=6.07µs  med=16.91µs  max=143.45ms p(90)=21.57µs  p(95)=23.39µs  p(99.9)=621.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.35ms min=8.23ms  med=199.93ms max=341.81ms p(90)=206.81ms p(95)=212.13ms p(99.9)=274.88ms
     http_reqs......................: 30360   250.800622/s
     iteration_duration.............: avg=198.39ms min=46.85ms med=200.47ms max=357.64ms p(90)=207.19ms p(95)=212.56ms p(99.9)=277.02ms
     iterations.....................: 30260   249.974533/s
     success_rate...................: 100.00% ✓ 30260      ✗ 0    
     vus............................: 32      min=32       max=50 
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

     checks.........................: 100.00% ✓ 89073      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=6.81µs   min=1.3µs   med=3.47µs   max=3.68ms   p(90)=4.87µs   p(95)=5.51µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=3.09µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=201.28ms min=6.39ms  med=183.86ms max=661.15ms p(90)=239.11ms p(95)=411.34ms p(99.9)=539.14ms
       { expected_response:true }...: avg=201.28ms min=6.39ms  med=183.86ms max=661.15ms p(90)=239.11ms p(95)=411.34ms p(99.9)=539.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29791
     http_req_receiving.............: avg=147.14µs min=33.91µs med=95.52µs  max=202.07ms p(90)=128.18µs p(95)=141.24µs p(99.9)=977.5µs 
     http_req_sending...............: avg=25.77µs  min=6.47µs  med=17.17µs  max=42.4ms   p(90)=22.42µs  p(95)=24.33µs  p(99.9)=710.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.11ms min=6.23ms  med=183.72ms max=661.05ms p(90)=238.95ms p(95)=411.24ms p(99.9)=539.01ms
     http_reqs......................: 29791   246.269552/s
     iteration_duration.............: avg=202.25ms min=30ms    med=184.22ms max=661.39ms p(90)=239.71ms p(95)=411.93ms p(99.9)=539.41ms
     iterations.....................: 29691   245.442894/s
     success_rate...................: 100.00% ✓ 29691      ✗ 0    
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

     checks.........................: 100.00% ✓ 857016      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=2.8µs    min=962ns   med=2.16µs  max=10.13ms  p(90)=3.54µs   p(95)=4.32µs   p(99.9)=31.25µs
     http_req_connecting............: avg=218ns    min=0s      med=0s      max=3.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.76ms  min=1.78ms  med=20.31ms max=311.28ms p(90)=28.68ms  p(95)=31.7ms   p(99.9)=52.86ms
       { expected_response:true }...: avg=20.76ms  min=1.78ms  med=20.31ms max=311.28ms p(90)=28.68ms  p(95)=31.7ms   p(99.9)=52.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285772
     http_req_receiving.............: avg=109.72µs min=27.66µs med=54.98µs max=141.2ms  p(90)=101.91µs p(95)=251.25µs p(99.9)=8.49ms 
     http_req_sending...............: avg=52.08µs  min=5.17µs  med=9.77µs  max=106.7ms  p(90)=17.96µs  p(95)=123.04µs p(99.9)=5.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.6ms   min=1.72ms  med=20.17ms max=310.83ms p(90)=28.48ms  p(95)=31.41ms  p(99.9)=51.65ms
     http_reqs......................: 285772  2376.898651/s
     iteration_duration.............: avg=20.99ms  min=3.87ms  med=20.52ms max=336.32ms p(90)=28.9ms   p(95)=31.94ms  p(99.9)=53.53ms
     iterations.....................: 285672  2376.066904/s
     success_rate...................: 100.00% ✓ 285672      ✗ 0     
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

     checks.........................: 100.00% ✓ 691938      ✗ 0     
     data_received..................: 20 GB   168 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=3.01µs   min=1.01µs  med=2.17µs   max=5.64ms   p(90)=3.61µs  p(95)=4.3µs    p(99.9)=30.76µs 
     http_req_connecting............: avg=431ns    min=0s      med=0s       max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.76ms  min=1.99ms  med=17.43ms  max=576.55ms p(90)=54.9ms  p(95)=72.66ms  p(99.9)=196.31ms
       { expected_response:true }...: avg=25.76ms  min=1.99ms  med=17.43ms  max=576.55ms p(90)=54.9ms  p(95)=72.66ms  p(99.9)=196.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230746
     http_req_receiving.............: avg=687.44µs min=50.33µs med=110.06µs max=154.13ms p(90)=1.12ms  p(95)=1.76ms   p(99.9)=59.59ms 
     http_req_sending...............: avg=43.66µs  min=5.09µs  med=9.47µs   max=231.2ms  p(90)=17.23µs p(95)=106.25µs p(99.9)=2.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=25.03ms  min=1.89ms  med=16.87ms  max=546.2ms  p(90)=53.66ms p(95)=71.09ms  p(99.9)=193.99ms
     http_reqs......................: 230746  1918.916225/s
     iteration_duration.............: avg=26ms     min=2.66ms  med=17.65ms  max=576.73ms p(90)=55.13ms p(95)=72.9ms   p(99.9)=198.62ms
     iterations.....................: 230646  1918.084611/s
     success_rate...................: 100.00% ✓ 230646      ✗ 0     
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

     checks.........................: 100.00% ✓ 550890      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.58µs   min=942ns   med=2.33µs  max=6.21ms   p(90)=4.66µs   p(95)=5.83µs   p(99.9)=43.13µs
     http_req_connecting............: avg=581ns    min=0s      med=0s      max=4.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.4ms   min=2.36ms  med=31.5ms  max=326.31ms p(90)=43.11ms  p(95)=47.85ms  p(99.9)=89.89ms
       { expected_response:true }...: avg=32.4ms   min=2.36ms  med=31.5ms  max=326.31ms p(90)=43.11ms  p(95)=47.85ms  p(99.9)=89.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183730
     http_req_receiving.............: avg=111.81µs min=28.84µs med=60.38µs max=142.78ms p(90)=134.73µs p(95)=276.08µs p(99.9)=5.75ms 
     http_req_sending...............: avg=46.01µs  min=5.45µs  med=10.39µs max=181.75ms p(90)=24.31µs  p(95)=133.51µs p(99.9)=3.31ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.24ms  min=2.23ms  med=31.37ms max=325.84ms p(90)=42.92ms  p(95)=47.62ms  p(99.9)=89.71ms
     http_reqs......................: 183730  1527.135467/s
     iteration_duration.............: avg=32.66ms  min=3.86ms  med=31.74ms max=356.2ms  p(90)=43.35ms  p(95)=48.09ms  p(99.9)=90.55ms
     iterations.....................: 183630  1526.304283/s
     success_rate...................: 100.00% ✓ 183630      ✗ 0     
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

     checks.........................: 100.00% ✓ 439167      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 176 MB  1.5 MB/s
     http_req_blocked...............: avg=3.45µs  min=972ns   med=2.52µs  max=4.21ms   p(90)=4.08µs   p(95)=4.75µs   p(99.9)=36.92µs
     http_req_connecting............: avg=592ns   min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.72ms min=2.17ms  med=40.18ms max=317.49ms p(90)=57.27ms  p(95)=62.5ms   p(99.9)=87.1ms 
       { expected_response:true }...: avg=40.72ms min=2.17ms  med=40.18ms max=317.49ms p(90)=57.27ms  p(95)=62.5ms   p(99.9)=87.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 146489
     http_req_receiving.............: avg=85.32µs min=27.84µs med=64.9µs  max=249.69ms p(90)=103.81µs p(95)=123.58µs p(99.9)=1.8ms  
     http_req_sending...............: avg=27.66µs min=5.09µs  med=11.27µs max=165.82ms p(90)=17.69µs  p(95)=21.74µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.61ms min=2.08ms  med=40.07ms max=309.22ms p(90)=57.15ms  p(95)=62.38ms  p(99.9)=86.85ms
     http_reqs......................: 146489  1217.823827/s
     iteration_duration.............: avg=40.98ms min=4.28ms  med=40.39ms max=353.59ms p(90)=57.48ms  p(95)=62.72ms  p(99.9)=87.64ms
     iterations.....................: 146389  1216.992486/s
     success_rate...................: 100.00% ✓ 146389      ✗ 0     
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

     checks.........................: 100.00% ✓ 188697     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   627 kB/s
     http_req_blocked...............: avg=4.98µs  min=1.1µs   med=3.29µs   max=4.24ms   p(90)=4.78µs   p(95)=5.41µs   p(99.9)=53.67µs 
     http_req_connecting............: avg=1.46µs  min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.01ms min=4.55ms  med=100.19ms max=354.44ms p(90)=126.47ms p(95)=140.03ms p(99.9)=243.4ms 
       { expected_response:true }...: avg=95.01ms min=4.55ms  med=100.19ms max=354.44ms p(90)=126.47ms p(95)=140.03ms p(99.9)=243.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 62999
     http_req_receiving.............: avg=92.7µs  min=31.78µs med=83.93µs  max=37.25ms  p(90)=119.64µs p(95)=134.25µs p(99.9)=962.09µs
     http_req_sending...............: avg=28.27µs min=5.98µs  med=14.8µs   max=93.33ms  p(90)=21.25µs  p(95)=23.48µs  p(99.9)=858.51µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.89ms min=4.44ms  med=100.08ms max=353.81ms p(90)=126.37ms p(95)=139.91ms p(99.9)=243.3ms 
     http_reqs......................: 62999   522.359581/s
     iteration_duration.............: avg=95.41ms min=22.3ms  med=100.45ms max=365.98ms p(90)=126.7ms  p(95)=140.41ms p(99.9)=245.41ms
     iterations.....................: 62899   521.530426/s
     success_rate...................: 100.00% ✓ 62899      ✗ 0    
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

     checks.........................: 100.00% ✓ 134319     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   446 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.21µs  med=3.43µs   max=4.05ms   p(90)=4.88µs   p(95)=5.43µs   p(99.9)=515.61µs
     http_req_connecting............: avg=2.34µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=355.77µs
     http_req_duration..............: avg=133.5ms  min=5.84ms  med=130.7ms  max=349.72ms p(90)=177.78ms p(95)=191.53ms p(99.9)=245.57ms
       { expected_response:true }...: avg=133.5ms  min=5.84ms  med=130.7ms  max=349.72ms p(90)=177.78ms p(95)=191.53ms p(99.9)=245.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44873
     http_req_receiving.............: avg=92.83µs  min=31.49µs med=88.65µs  max=4.8ms    p(90)=119.65µs p(95)=132µs    p(99.9)=736µs   
     http_req_sending...............: avg=28.68µs  min=6.29µs  med=16.11µs  max=114.38ms p(90)=21.33µs  p(95)=23.18µs  p(99.9)=632.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.37ms min=5.71ms  med=130.59ms max=349.04ms p(90)=177.67ms p(95)=191.42ms p(99.9)=245.45ms
     http_reqs......................: 44873   371.581266/s
     iteration_duration.............: avg=134.05ms min=34.71ms med=131.03ms max=363.22ms p(90)=178.1ms  p(95)=191.83ms p(99.9)=246.59ms
     iterations.....................: 44773   370.753192/s
     success_rate...................: 100.00% ✓ 44773      ✗ 0    
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

     checks.........................: 100.00% ✓ 88848      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=5.5µs    min=1.24µs  med=3.51µs   max=2.73ms   p(90)=4.89µs   p(95)=5.48µs   p(99.9)=654.91µs
     http_req_connecting............: avg=1.77µs   min=0s      med=0s       max=2.69ms   p(90)=0s       p(95)=0s       p(99.9)=587.11µs
     http_req_duration..............: avg=201.77ms min=6.45ms  med=190.98ms max=686.98ms p(90)=247.17ms p(95)=400.43ms p(99.9)=552.24ms
       { expected_response:true }...: avg=201.77ms min=6.45ms  med=190.98ms max=686.98ms p(90)=247.17ms p(95)=400.43ms p(99.9)=552.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29716
     http_req_receiving.............: avg=112.55µs min=34.72µs med=96.49µs  max=48.78ms  p(90)=128.64µs p(95)=141.93µs p(99.9)=935.44µs
     http_req_sending...............: avg=26.84µs  min=6.18µs  med=17.5µs   max=66.07ms  p(90)=22.38µs  p(95)=24.1µs   p(99.9)=721.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.63ms min=6.35ms  med=190.83ms max=686.85ms p(90)=246.93ms p(95)=400.34ms p(99.9)=552.12ms
     http_reqs......................: 29716   245.722041/s
     iteration_duration.............: avg=202.71ms min=47.4ms  med=191.45ms max=687.25ms p(90)=247.59ms p(95)=401.37ms p(99.9)=552.53ms
     iterations.....................: 29616   244.89514/s
     success_rate...................: 100.00% ✓ 29616      ✗ 0    
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

     checks.........................: 100.00% ✓ 83463      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 34 MB   277 kB/s
     http_req_blocked...............: avg=7.23µs   min=1.23µs  med=3.37µs   max=4.52ms   p(90)=4.65µs   p(95)=5.19µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=3.61µs   min=0s      med=0s       max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=214.79ms min=8.73ms  med=194.85ms max=406.28ms p(90)=277.02ms p(95)=287.08ms p(99.9)=352.45ms
       { expected_response:true }...: avg=214.79ms min=8.73ms  med=194.85ms max=406.28ms p(90)=277.02ms p(95)=287.08ms p(99.9)=352.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27921
     http_req_receiving.............: avg=106.33µs min=33.65µs med=93.83µs  max=92.18ms  p(90)=125.01µs p(95)=137.46µs p(99.9)=733.52µs
     http_req_sending...............: avg=31.6µs   min=6.26µs  med=17µs     max=123.34ms p(90)=21.6µs   p(95)=23.46µs  p(99.9)=551.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.65ms min=8.59ms  med=194.71ms max=397.19ms p(90)=276.89ms p(95)=286.94ms p(99.9)=352.35ms
     http_reqs......................: 27921   230.501413/s
     iteration_duration.............: avg=215.83ms min=77.14ms med=196.37ms max=426.1ms  p(90)=277.34ms p(95)=287.52ms p(99.9)=354.62ms
     iterations.....................: 27821   229.675864/s
     success_rate...................: 100.00% ✓ 27821      ✗ 0    
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

