## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,682 | 2,779 | 2,658 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,106 | 2,149 | 2,080 | 1.0% |  |
| cosmo | 0.307.0 | 1,206 | 1,206 | 1,182 | 1.4% | non-compatible response (9 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 496 | 501 | 494 | 0.5% |  |
| hive-gateway | 2.5.25 | 230 | 234 | 222 | 1.6% |  |
| apollo-gateway | 2.13.3 | 203 | 208 | 202 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (31852 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (461224 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,174 | 2,284 | 2,140 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,919 | 1,964 | 1,713 | 3.8% |  |
| cosmo | 0.307.0 | 1,111 | 1,131 | 1,031 | 4.8% | non-compatible response (14 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 482 | 490 | 478 | 0.8% |  |
| hive-gateway | 2.5.25 | 227 | 230 | 226 | 0.7% |  |
| apollo-gateway | 2.13.3 | 208 | 211 | 207 | 0.6% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (20232 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (238084 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 495258      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=28.58µs  min=1µs     med=2.2µs   max=84.34ms  p(90)=3.59µs   p(95)=4.65µs   p(99.9)=3.73ms  
     http_req_connecting............: avg=25.61µs  min=0s      med=0s      max=84.29ms  p(90)=0s       p(95)=0s       p(99.9)=3.56ms  
     http_req_duration..............: avg=85.51ms  min=1.58ms  med=80.42ms max=320.39ms p(90)=163.5ms  p(95)=180.76ms p(99.9)=245.16ms
       { expected_response:true }...: avg=85.51ms  min=1.58ms  med=80.42ms max=320.39ms p(90)=163.5ms  p(95)=180.76ms p(99.9)=245.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166086
     http_req_receiving.............: avg=298.07µs min=28.36µs med=55.45µs max=119.79ms p(90)=204.98µs p(95)=402.43µs p(99.9)=36.89ms 
     http_req_sending...............: avg=86.46µs  min=5.26µs  med=9.82µs  max=141.91ms p(90)=18.18µs  p(95)=132.01µs p(99.9)=13.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.12ms  min=1.53ms  med=80.12ms max=283.67ms p(90)=162.84ms p(95)=179.72ms p(99.9)=242.88ms
     http_reqs......................: 166086  2682.638442/s
     iteration_duration.............: avg=86.36ms  min=2.67ms  med=81.31ms max=351.12ms p(90)=164.1ms  p(95)=181.48ms p(99.9)=246.77ms
     iterations.....................: 165086  2666.486338/s
     success_rate...................: 100.00% ✓ 165086      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 393162      ✗ 0     
     data_received..................: 12 GB   185 MB/s
     data_sent......................: 159 MB  2.5 MB/s
     http_req_blocked...............: avg=14.84µs  min=972ns  med=2.22µs   max=40.83ms  p(90)=3.54µs   p(95)=4.5µs    p(99.9)=1.67ms  
     http_req_connecting............: avg=12.01µs  min=0s     med=0s       max=40.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=107.78ms min=2.39ms med=100.25ms max=723.88ms p(90)=208.4ms  p(95)=243.32ms p(99.9)=434.8ms 
       { expected_response:true }...: avg=107.78ms min=2.39ms med=100.25ms max=723.88ms p(90)=208.4ms  p(95)=243.32ms p(99.9)=434.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 132054
     http_req_receiving.............: avg=1.97ms   min=52.7µs med=111.47µs max=337.49ms p(90)=1.28ms   p(95)=4.65ms   p(99.9)=139.34ms
     http_req_sending...............: avg=70.97µs  min=5.37µs med=9.67µs   max=144.51ms p(90)=17.46µs  p(95)=120.2µs  p(99.9)=10.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.73ms min=2.29ms med=99.03ms  max=723.79ms p(90)=205.17ms p(95)=235.52ms p(99.9)=400.33ms
     http_reqs......................: 132054  2106.528354/s
     iteration_duration.............: avg=108.86ms min=3.63ms med=101.59ms max=724.03ms p(90)=209.09ms p(95)=244.1ms  p(99.9)=435.38ms
     iterations.....................: 131054  2090.576332/s
     success_rate...................: 100.00% ✓ 131054      ✗ 0     
     vus............................: 91      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 223083      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 91 MB   1.4 MB/s
     http_req_blocked...............: avg=5.03µs   min=1.08µs  med=2.37µs   max=9.59ms   p(90)=3.85µs   p(95)=4.66µs   p(99.9)=385.86µs
     http_req_connecting............: avg=1.98µs   min=0s      med=0s       max=9.52ms   p(90)=0s       p(95)=0s       p(99.9)=293.05µs
     http_req_duration..............: avg=189.32ms min=2.03ms  med=190.77ms max=645.38ms p(90)=349.28ms p(95)=373.95ms p(99.9)=552.79ms
       { expected_response:true }...: avg=189.32ms min=2.03ms  med=190.77ms max=645.38ms p(90)=349.28ms p(95)=373.95ms p(99.9)=552.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75361
     http_req_receiving.............: avg=146.09µs min=28.76µs med=59.62µs  max=268.14ms p(90)=91.71µs  p(95)=104.5µs  p(99.9)=3.41ms  
     http_req_sending...............: avg=26.84µs  min=5.17µs  med=10.44µs  max=24.38ms  p(90)=15.91µs  p(95)=19.34µs  p(99.9)=3.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.15ms min=1.95ms  med=190.56ms max=645.31ms p(90)=349.12ms p(95)=373.81ms p(99.9)=552.73ms
     http_reqs......................: 75361   1206.413087/s
     iteration_duration.............: avg=192.1ms  min=4.57ms  med=193.81ms max=645.54ms p(90)=349.97ms p(95)=374.63ms p(99.9)=554.43ms
     iterations.....................: 74361   1190.404633/s
     success_rate...................: 100.00% ✓ 74361       ✗ 0    
     vus............................: 79      min=0         max=493
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 93765      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   596 kB/s
     http_req_blocked...............: avg=9.29µs   min=1.2µs   med=3.04µs   max=17.21ms  p(90)=4.81µs   p(95)=5.88µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=5.17µs   min=0s      med=0s       max=17.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=445.43ms min=4.11ms  med=414.15ms max=1.84s    p(90)=878.48ms p(95)=956.02ms p(99.9)=1.43s   
       { expected_response:true }...: avg=445.43ms min=4.11ms  med=414.15ms max=1.84s    p(90)=878.48ms p(95)=956.02ms p(99.9)=1.43s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32255
     http_req_receiving.............: avg=90.87µs  min=32.71µs med=77.18µs  max=141.75ms p(90)=113.7µs  p(95)=127.22µs p(99.9)=758.99µs
     http_req_sending...............: avg=34.44µs  min=5.68µs  med=13.38µs  max=184.03ms p(90)=20.9µs   p(95)=24.2µs   p(99.9)=2.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=445.3ms  min=4.03ms  med=414.01ms max=1.84s    p(90)=878.4ms  p(95)=955.85ms p(99.9)=1.43s   
     http_reqs......................: 32255   496.831286/s
     iteration_duration.............: avg=459.9ms  min=22.64ms med=432.15ms max=1.85s    p(90)=883.01ms p(95)=959.49ms p(99.9)=1.43s   
     iterations.....................: 31255   481.428053/s
     success_rate...................: 100.00% ✓ 31255      ✗ 0    
     vus............................: 55      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 44064      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=14.46µs  min=1.18µs  med=3.67µs   max=24.97ms p(90)=5.55µs   p(95)=7.28µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=9.18µs   min=0s      med=0s       max=24.91ms p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=910.01ms min=6.23ms  med=780.81ms max=18.29s  p(90)=1.54s    p(95)=1.68s    p(99.9)=16.98s  
       { expected_response:true }...: avg=910.01ms min=6.23ms  med=780.81ms max=18.29s  p(90)=1.54s    p(95)=1.68s    p(99.9)=16.98s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15688
     http_req_receiving.............: avg=103.48µs min=36.44µs med=98.04µs  max=7.1ms   p(90)=136.58µs p(95)=149.72µs p(99.9)=815.84µs
     http_req_sending...............: avg=28.26µs  min=6.15µs  med=18.1µs   max=20.01ms p(90)=24.41µs  p(95)=29.49µs  p(99.9)=2.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=909.88ms min=6.13ms  med=780.59ms max=18.29s  p(90)=1.54s    p(95)=1.68s    p(99.9)=16.98s  
     http_reqs......................: 15688   230.318145/s
     iteration_duration.............: avg=971.95ms min=58.71ms med=852.18ms max=18.29s  p(90)=1.55s    p(95)=1.7s     p(99.9)=17.08s  
     iterations.....................: 14688   215.636979/s
     success_rate...................: 100.00% ✓ 14688      ✗ 0    
     vus............................: 59      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 42327      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=15.58µs  min=1.19µs  med=3.39µs   max=6.4ms   p(90)=5.1µs    p(95)=6.64µs   p(99.9)=2.63ms  
     http_req_connecting............: avg=10.36µs  min=0s      med=0s       max=6.33ms  p(90)=0s       p(95)=0s       p(99.9)=2.58ms  
     http_req_duration..............: avg=467.22ms min=8.41ms  med=534.57ms max=1.31s   p(90)=786.13ms p(95)=835.81ms p(99.9)=1.19s   
       { expected_response:true }...: avg=467.22ms min=8.41ms  med=534.57ms max=1.31s   p(90)=786.13ms p(95)=835.81ms p(99.9)=1.19s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15109
     http_req_receiving.............: avg=102.31µs min=33.35µs med=91.1µs   max=56.38ms p(90)=131.18µs p(95)=143.71µs p(99.9)=836.06µs
     http_req_sending...............: avg=36.58µs  min=5.8µs   med=16.35µs  max=56.75ms p(90)=22.59µs  p(95)=27.07µs  p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=467.09ms min=8.31ms  med=534.45ms max=1.31s   p(90)=786.04ms p(95)=835.72ms p(99.9)=1.19s   
     http_reqs......................: 15109   203.246766/s
     iteration_duration.............: avg=500.2ms  min=14.53ms med=560.12ms max=1.32s   p(90)=791.29ms p(95)=843.1ms  p(99.9)=1.2s    
     iterations.....................: 14109   189.794733/s
     success_rate...................: 100.00% ✓ 14109      ✗ 0    
     vus............................: 59      min=0        max=494
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 402651      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=20.85µs  min=1.05µs  med=2.7µs    max=117.42ms p(90)=4.53µs   p(95)=5.84µs   p(99.9)=2.33ms  
     http_req_connecting............: avg=17.4µs   min=0s      med=0s       max=117.33ms p(90)=0s       p(95)=0s       p(99.9)=2.26ms  
     http_req_duration..............: avg=105.2ms  min=1.64ms  med=100.33ms max=403.47ms p(90)=201.63ms p(95)=219.8ms  p(99.9)=276.53ms
       { expected_response:true }...: avg=105.2ms  min=1.64ms  med=100.33ms max=403.47ms p(90)=201.63ms p(95)=219.8ms  p(99.9)=276.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135217
     http_req_receiving.............: avg=250.06µs min=29.17µs med=61.76µs  max=290.55ms p(90)=167.7µs  p(95)=411.04µs p(99.9)=29.19ms 
     http_req_sending...............: avg=72.69µs  min=5.36µs  med=11.07µs  max=232.88ms p(90)=20.7µs   p(95)=137.26µs p(99.9)=9.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.88ms min=1.59ms  med=100.12ms max=319.48ms p(90)=201.25ms p(95)=219.09ms p(99.9)=273.89ms
     http_reqs......................: 135217  2174.545147/s
     iteration_duration.............: avg=106.27ms min=3.46ms  med=101.54ms max=413.54ms p(90)=202.2ms  p(95)=220.34ms p(99.9)=279.34ms
     iterations.....................: 134217  2158.463255/s
     success_rate...................: 100.00% ✓ 134217      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 355236      ✗ 0     
     data_received..................: 11 GB   168 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=13.19µs  min=1.01µs  med=2.34µs   max=34.89ms  p(90)=3.97µs   p(95)=5.08µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=10.22µs  min=0s      med=0s       max=34.74ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=119.27ms min=1.8ms   med=111.75ms max=935.81ms p(90)=226.89ms p(95)=256ms    p(99.9)=628.36ms
       { expected_response:true }...: avg=119.27ms min=1.8ms   med=111.75ms max=935.81ms p(90)=226.89ms p(95)=256ms    p(99.9)=628.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119412
     http_req_receiving.............: avg=1.38ms   min=51.98µs med=112.99µs max=284ms    p(90)=1.53ms   p(95)=3.75ms   p(99.9)=119.85ms
     http_req_sending...............: avg=61.41µs  min=5.28µs  med=10.12µs  max=320.24ms p(90)=20.29µs  p(95)=121.12µs p(99.9)=8.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.82ms min=1.71ms  med=110.61ms max=932.9ms  p(90)=225.04ms p(95)=252.6ms  p(99.9)=627.09ms
     http_reqs......................: 119412  1919.222743/s
     iteration_duration.............: avg=120.55ms min=2.67ms  med=113.24ms max=936.1ms  p(90)=227.53ms p(95)=256.71ms p(99.9)=628.7ms 
     iterations.....................: 118412  1903.150466/s
     success_rate...................: 100.00% ✓ 118412      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 205821      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7µs      min=1.13µs med=2.8µs    max=53.06ms  p(90)=4.56µs   p(95)=5.53µs   p(99.9)=470.93µs
     http_req_connecting............: avg=3.51µs   min=0s     med=0s       max=52.99ms  p(90)=0s       p(95)=0s       p(99.9)=423.98µs
     http_req_duration..............: avg=205.04ms min=2.11ms med=206.64ms max=653.28ms p(90)=378.14ms p(95)=406.03ms p(99.9)=546.52ms
       { expected_response:true }...: avg=205.04ms min=2.11ms med=206.64ms max=653.28ms p(90)=378.14ms p(95)=406.03ms p(99.9)=546.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69607
     http_req_receiving.............: avg=90.48µs  min=31.1µs med=69.01µs  max=109.67ms p(90)=106.98µs p(95)=123.96µs p(99.9)=2.09ms  
     http_req_sending...............: avg=35.11µs  min=5.48µs med=12.06µs  max=185.08ms p(90)=19.03µs  p(95)=23.16µs  p(99.9)=3.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.91ms min=2.05ms med=206.51ms max=653.19ms p(90)=378.05ms p(95)=405.91ms p(99.9)=546.38ms
     http_reqs......................: 69607   1111.205756/s
     iteration_duration.............: avg=208.28ms min=5.06ms med=210.19ms max=653.46ms p(90)=379.16ms p(95)=406.65ms p(99.9)=548.95ms
     iterations.....................: 68607   1095.241762/s
     success_rate...................: 100.00% ✓ 68607       ✗ 0    
     vus............................: 88      min=0         max=498
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 91416      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   579 kB/s
     http_req_blocked...............: avg=10.66µs  min=1.11µs  med=3.3µs    max=5.64ms   p(90)=5.12µs   p(95)=6.23µs   p(99.9)=2.4ms 
     http_req_connecting............: avg=6.13µs   min=0s      med=0s       max=5.56ms   p(90)=0s       p(95)=0s       p(99.9)=2.15ms
     http_req_duration..............: avg=456.54ms min=4.19ms  med=425.8ms  max=1.8s     p(90)=901.59ms p(95)=980.85ms p(99.9)=1.43s 
       { expected_response:true }...: avg=456.54ms min=4.19ms  med=425.8ms  max=1.8s     p(90)=901.59ms p(95)=980.85ms p(99.9)=1.43s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31472
     http_req_receiving.............: avg=100.06µs min=32.07µs med=82.9µs   max=168.73ms p(90)=120.91µs p(95)=134.98µs p(99.9)=1.03ms
     http_req_sending...............: avg=36.87µs  min=5.78µs  med=15.1µs   max=105.68ms p(90)=22.73µs  p(95)=26.09µs  p(99.9)=3.55ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=456.41ms min=4.11ms  med=425.71ms max=1.8s     p(90)=901.42ms p(95)=980.67ms p(99.9)=1.43s 
     http_reqs......................: 31472   482.191711/s
     iteration_duration.............: avg=471.76ms min=29.31ms med=441.69ms max=1.8s     p(90)=905.72ms p(95)=983.43ms p(99.9)=1.44s 
     iterations.....................: 30472   466.870419/s
     success_rate...................: 100.00% ✓ 30472      ✗ 0    
     vus............................: 69      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 43401      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   273 kB/s
     http_req_blocked...............: avg=17.1µs   min=1.15µs  med=3.65µs   max=9.45ms   p(90)=5.48µs   p(95)=6.99µs   p(99.9)=2.57ms  
     http_req_connecting............: avg=11.48µs  min=0s      med=0s       max=9.29ms   p(90)=0s       p(95)=0s       p(99.9)=2.46ms  
     http_req_duration..............: avg=943.74ms min=6.27ms  med=869.25ms max=5.28s    p(90)=1.85s    p(95)=2.06s    p(99.9)=4.83s   
       { expected_response:true }...: avg=943.74ms min=6.27ms  med=869.25ms max=5.28s    p(90)=1.85s    p(95)=2.06s    p(99.9)=4.83s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15467
     http_req_receiving.............: avg=109.82µs min=34.44µs med=99.08µs  max=46.19ms  p(90)=138.15µs p(95)=150.58µs p(99.9)=855.97µs
     http_req_sending...............: avg=39.12µs  min=5.66µs  med=17.79µs  max=156.84ms p(90)=23.89µs  p(95)=28.51µs  p(99.9)=4.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=943.6ms  min=6.17ms  med=869.18ms max=5.28s    p(90)=1.85s    p(95)=2.06s    p(99.9)=4.83s   
     http_reqs......................: 15467   227.068335/s
     iteration_duration.............: avg=1s       min=38.83ms med=943.78ms max=5.29s    p(90)=1.87s    p(95)=2.07s    p(99.9)=4.86s   
     iterations.....................: 14467   212.387509/s
     success_rate...................: 100.00% ✓ 14467      ✗ 0    
     vus............................: 66      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40800      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=16.11µs  min=1.27µs  med=3.5µs    max=6ms     p(90)=5.25µs   p(95)=6.92µs  p(99.9)=2.81ms  
     http_req_connecting............: avg=10.74µs  min=0s      med=0s       max=5.94ms  p(90)=0s       p(95)=0s      p(99.9)=2.79ms  
     http_req_duration..............: avg=998.35ms min=8.67ms  med=919.31ms max=3.94s   p(90)=2.02s    p(95)=2.16s   p(99.9)=3.52s   
       { expected_response:true }...: avg=998.35ms min=8.67ms  med=919.31ms max=3.94s   p(90)=2.02s    p(95)=2.16s   p(99.9)=3.52s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14600
     http_req_receiving.............: avg=107.23µs min=39.17µs med=94.69µs  max=53.75ms p(90)=135.68µs p(95)=148.3µs p(99.9)=879.78µs
     http_req_sending...............: avg=30.43µs  min=5.97µs  med=17.5µs   max=26.86ms p(90)=23.36µs  p(95)=28.68µs p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=998.21ms min=8.55ms  med=919.2ms  max=3.94s   p(90)=2.02s    p(95)=2.16s   p(99.9)=3.52s   
     http_reqs......................: 14600   208.862323/s
     iteration_duration.............: avg=1.07s    min=32.11ms med=1s       max=3.95s   p(90)=2.03s    p(95)=2.17s   p(99.9)=3.54s   
     iterations.....................: 13600   194.556685/s
     success_rate...................: 100.00% ✓ 13600      ✗ 0    
     vus............................: 16      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

