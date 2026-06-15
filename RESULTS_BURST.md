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
| hive-router | v0.0.65 | 2,723 | 2,823 | 2,671 | 2.1% |  |
| hotchocolate | 16.1.3 | 2,080 | 2,119 | 2,049 | 1.2% |  |
| cosmo | 0.321.1 | 1,137 | 1,140 | 1,115 | 0.8% | non-compatible response (6 across 3/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 518 | 524 | 510 | 0.9% |  |
| hive-gateway | 2.8.2 | 218 | 219 | 213 | 1.0% |  |
| apollo-gateway | 2.14.1 | 198 | 203 | 198 | 0.9% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (6884 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (493672 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,223 | 2,335 | 2,197 | 2.2% |  |
| hotchocolate | 16.1.3 | 1,873 | 1,929 | 1,853 | 1.4% |  |
| cosmo | 0.321.1 | 1,088 | 1,095 | 1,069 | 1.0% | non-compatible response (10 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 483 | 494 | 473 | 1.4% |  |
| hive-gateway | 2.8.2 | 215 | 219 | 212 | 1.1% |  |
| apollo-gateway | 2.14.1 | 205 | 208 | 205 | 0.5% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (18505 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (141060 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 503145      ✗ 0     
     data_received..................: 15 GB   239 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=36.68µs  min=1.11µs med=2.82µs  max=107.7ms  p(90)=4.53µs   p(95)=5.73µs   p(99.9)=7.36ms  
     http_req_connecting............: avg=32.86µs  min=0s     med=0s      max=107.56ms p(90)=0s       p(95)=0s       p(99.9)=7.14ms  
     http_req_duration..............: avg=84.07ms  min=1.57ms med=75.47ms max=333.48ms p(90)=166.25ms p(95)=185.68ms p(99.9)=249.99ms
       { expected_response:true }...: avg=84.07ms  min=1.57ms med=75.47ms max=333.48ms p(90)=166.25ms p(95)=185.68ms p(99.9)=249.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168715
     http_req_receiving.............: avg=503.09µs min=29.7µs med=59.47µs max=95.48ms  p(90)=269.41µs p(95)=455.01µs p(99.9)=64.18ms 
     http_req_sending...............: avg=100.42µs min=5.38µs med=10.76µs max=176.85ms p(90)=20.89µs  p(95)=144.61µs p(99.9)=16.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.47ms  min=1.52ms med=75.05ms max=288.41ms p(90)=165.29ms p(95)=184.26ms p(99.9)=245.21ms
     http_reqs......................: 168715  2723.706115/s
     iteration_duration.............: avg=85ms     min=2.47ms med=76.57ms max=421.86ms p(90)=166.93ms p(95)=186.52ms p(99.9)=251.72ms
     iterations.....................: 167715  2707.562286/s
     success_rate...................: 100.00% ✓ 167715      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 388206      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=16.65µs  min=1.06µs  med=2.72µs   max=100.28ms p(90)=4.21µs   p(95)=5.24µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=13.12µs  min=0s      med=0s       max=100.09ms p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=109.15ms min=2.37ms  med=97.54ms  max=629.41ms p(90)=214.32ms p(95)=250.6ms  p(99.9)=481.86ms
       { expected_response:true }...: avg=109.15ms min=2.37ms  med=97.54ms  max=629.41ms p(90)=214.32ms p(95)=250.6ms  p(99.9)=481.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130402
     http_req_receiving.............: avg=2.04ms   min=52.76µs med=114.57µs max=325.81ms p(90)=1.43ms   p(95)=5.31ms   p(99.9)=147.21ms
     http_req_sending...............: avg=70.48µs  min=5.58µs  med=10.46µs  max=220.98ms p(90)=19.14µs  p(95)=124.24µs p(99.9)=9.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.04ms min=2.28ms  med=96.67ms  max=608.9ms  p(90)=210.46ms p(95)=242.62ms p(99.9)=438.82ms
     http_reqs......................: 130402  2080.208398/s
     iteration_duration.............: avg=110.27ms min=3.75ms  med=98.74ms  max=629.63ms p(90)=215.05ms p(95)=251.5ms  p(99.9)=482.35ms
     iterations.....................: 129402  2064.256124/s
     success_rate...................: 100.00% ✓ 129402      ✗ 0     
     vus............................: 91      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 210438      ✗ 0    
     data_received..................: 6.2 GB  100 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=16.39µs  min=1.15µs  med=2.74µs   max=37.1ms   p(90)=4.29µs   p(95)=5.13µs   p(99.9)=529.01µs
     http_req_connecting............: avg=12.97µs  min=0s      med=0s       max=37.04ms  p(90)=0s       p(95)=0s       p(99.9)=468.27µs
     http_req_duration..............: avg=200.61ms min=2.09ms  med=198.25ms max=539.47ms p(90)=374.12ms p(95)=401.24ms p(99.9)=481.77ms
       { expected_response:true }...: avg=200.61ms min=2.09ms  med=198.25ms max=539.47ms p(90)=374.12ms p(95)=401.24ms p(99.9)=481.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71146
     http_req_receiving.............: avg=77.79µs  min=31.24µs med=62.52µs  max=46.9ms   p(90)=96.26µs  p(95)=109.78µs p(99.9)=1.37ms  
     http_req_sending...............: avg=46.29µs  min=5.68µs  med=11.14µs  max=214.16ms p(90)=17.23µs  p(95)=20.61µs  p(99.9)=5.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.48ms min=2.01ms  med=198.13ms max=539.4ms  p(90)=374.03ms p(95)=401.15ms p(99.9)=481.69ms
     http_reqs......................: 71146   1137.450745/s
     iteration_duration.............: avg=203.73ms min=5.29ms  med=201.69ms max=539.68ms p(90)=374.99ms p(95)=401.93ms p(99.9)=483.31ms
     iterations.....................: 70146   1121.463188/s
     success_rate...................: 100.00% ✓ 70146       ✗ 0    
     vus............................: 84      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97794      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 40 MB   623 kB/s
     http_req_blocked...............: avg=8.56µs   min=1.12µs  med=3.36µs   max=6.67ms   p(90)=5.2µs    p(95)=6.32µs   p(99.9)=750.14µs
     http_req_connecting............: avg=4.21µs   min=0s      med=0s       max=6.61ms   p(90)=0s       p(95)=0s       p(99.9)=719.98µs
     http_req_duration..............: avg=427.3ms  min=3.88ms  med=399.47ms max=1.75s    p(90)=843.12ms p(95)=918.38ms p(99.9)=1.34s   
       { expected_response:true }...: avg=427.3ms  min=3.88ms  med=399.47ms max=1.75s    p(90)=843.12ms p(95)=918.38ms p(99.9)=1.34s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33598
     http_req_receiving.............: avg=171.91µs min=32.62µs med=80.36µs  max=193.07ms p(90)=117.44µs p(95)=132.36µs p(99.9)=3.49ms  
     http_req_sending...............: avg=26.39µs  min=5.67µs  med=14.43µs  max=86.75ms  p(90)=22.2µs   p(95)=25.66µs  p(99.9)=2.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=427.1ms  min=3.8ms   med=399.39ms max=1.75s    p(90)=842.98ms p(95)=918.29ms p(99.9)=1.34s   
     http_reqs......................: 33598   518.740044/s
     iteration_duration.............: avg=440.65ms min=9.3ms   med=413.48ms max=1.75s    p(90)=847.51ms p(95)=921.2ms  p(99.9)=1.35s   
     iterations.....................: 32598   503.300433/s
     success_rate...................: 100.00% ✓ 32598      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41901      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   263 kB/s
     http_req_blocked...............: avg=18.09µs  min=1.33µs  med=3.72µs   max=39ms    p(90)=5.56µs   p(95)=7.47µs   p(99.9)=1.98ms
     http_req_connecting............: avg=12.25µs  min=0s      med=0s       max=38.93ms p(90)=0s       p(95)=0s       p(99.9)=1.95ms
     http_req_duration..............: avg=967.75ms min=6.57ms  med=854.32ms max=16.18s  p(90)=1.84s    p(95)=2.03s    p(99.9)=13.05s
       { expected_response:true }...: avg=967.75ms min=6.57ms  med=854.32ms max=16.18s  p(90)=1.84s    p(95)=2.03s    p(99.9)=13.05s
     http_req_failed................: 0.00%   ✓ 0          ✗ 14967
     http_req_receiving.............: avg=121.12µs min=36.49µs med=97.39µs  max=97.66ms p(90)=136.74µs p(95)=149.05µs p(99.9)=1.22ms
     http_req_sending...............: avg=32.16µs  min=6.16µs  med=17.8µs   max=34.3ms  p(90)=24.23µs  p(95)=29.24µs  p(99.9)=2.23ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=967.59ms min=6.47ms  med=854.09ms max=16.18s  p(90)=1.84s    p(95)=2.03s    p(99.9)=13.05s
     http_reqs......................: 14967   218.340413/s
     iteration_duration.............: avg=1.03s    min=60.85ms med=957.23ms max=16.18s  p(90)=1.87s    p(95)=2.05s    p(99.9)=13.07s
     iterations.....................: 13967   203.752291/s
     success_rate...................: 100.00% ✓ 13967      ✗ 0    
     vus............................: 85      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41277      ✗ 0    
     data_received..................: 1.3 GB  17 MB/s
     data_sent......................: 18 MB   243 kB/s
     http_req_blocked...............: avg=17.39µs  min=1.18µs  med=3.64µs   max=11.95ms p(90)=5.34µs   p(95)=6.97µs   p(99.9)=3.02ms  
     http_req_connecting............: avg=11.52µs  min=0s      med=0s       max=11.89ms p(90)=0s       p(95)=0s       p(99.9)=2.88ms  
     http_req_duration..............: avg=469.7ms  min=8.43ms  med=550.5ms  max=1.31s   p(90)=789.82ms p(95)=843ms    p(99.9)=1.18s   
       { expected_response:true }...: avg=469.7ms  min=8.43ms  med=550.5ms  max=1.31s   p(90)=789.82ms p(95)=843ms    p(99.9)=1.18s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14759
     http_req_receiving.............: avg=100.48µs min=35.04µs med=93.76µs  max=6.96ms  p(90)=133.74µs p(95)=146.12µs p(99.9)=977.42µs
     http_req_sending...............: avg=32.34µs  min=5.96µs  med=17.41µs  max=30.42ms p(90)=23.2µs   p(95)=28.35µs  p(99.9)=3.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=469.56ms min=8.33ms  med=550.41ms max=1.31s   p(90)=789.58ms p(95)=842.88ms p(99.9)=1.18s   
     http_reqs......................: 14759   198.049239/s
     iteration_duration.............: avg=503.66ms min=11.53ms med=572.98ms max=1.31s   p(90)=796.35ms p(95)=850.03ms p(99.9)=1.19s   
     iterations.....................: 13759   184.630359/s
     success_rate...................: 100.00% ✓ 13759      ✗ 0    
     vus............................: 69      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 410685      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=24.75µs  min=1.16µs  med=3.18µs  max=71.11ms  p(90)=5.09µs   p(95)=6.42µs   p(99.9)=3.2ms   
     http_req_connecting............: avg=20.7µs   min=0s      med=0s      max=70.35ms  p(90)=0s       p(95)=0s       p(99.9)=3ms     
     http_req_duration..............: avg=103.12ms min=1.64ms  med=96.63ms max=422.51ms p(90)=202.73ms p(95)=221.37ms p(99.9)=275.15ms
       { expected_response:true }...: avg=103.12ms min=1.64ms  med=96.63ms max=422.51ms p(90)=202.73ms p(95)=221.37ms p(99.9)=275.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137895
     http_req_receiving.............: avg=295.27µs min=29.78µs med=64.44µs max=326.53ms p(90)=192.76µs p(95)=446.29µs p(99.9)=31.99ms 
     http_req_sending...............: avg=84.32µs  min=5.66µs  med=11.92µs max=47.18ms  p(90)=22.97µs  p(95)=147.73µs p(99.9)=12.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.74ms min=1.59ms  med=96.23ms max=318.04ms p(90)=202.22ms p(95)=220.73ms p(99.9)=271.69ms
     http_reqs......................: 137895  2223.246541/s
     iteration_duration.............: avg=104.17ms min=3.17ms  med=97.9ms  max=435.76ms p(90)=203.35ms p(95)=221.87ms p(99.9)=275.88ms
     iterations.....................: 136895  2207.123792/s
     success_rate...................: 100.00% ✓ 136895      ✗ 0     
     vus............................: 59      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 346914      ✗ 0     
     data_received..................: 10 GB   164 MB/s
     data_sent......................: 140 MB  2.2 MB/s
     http_req_blocked...............: avg=23.07µs  min=1.08µs med=2.95µs   max=81.61ms  p(90)=4.6µs    p(95)=5.7µs    p(99.9)=5.99ms  
     http_req_connecting............: avg=19.21µs  min=0s     med=0s       max=81.43ms  p(90)=0s       p(95)=0s       p(99.9)=5.92ms  
     http_req_duration..............: avg=122.04ms min=1.79ms med=113.36ms max=830.22ms p(90)=237.89ms p(95)=268.05ms p(99.9)=516.14ms
       { expected_response:true }...: avg=122.04ms min=1.79ms med=113.36ms max=830.22ms p(90)=237.89ms p(95)=268.05ms p(99.9)=516.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 116638
     http_req_receiving.............: avg=1.94ms   min=53.2µs med=120.51µs max=479.82ms p(90)=1.73ms   p(95)=4.72ms   p(99.9)=166.46ms
     http_req_sending...............: avg=65.55µs  min=5.52µs med=11.2µs   max=181.08ms p(90)=20.36µs  p(95)=122.83µs p(99.9)=8.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.03ms min=1.7ms  med=112.03ms max=810.71ms p(90)=234.78ms p(95)=262.04ms p(99.9)=465.68ms
     http_reqs......................: 116638  1873.170495/s
     iteration_duration.............: avg=123.41ms min=2.91ms med=114.92ms max=863.4ms  p(90)=238.73ms p(95)=269.03ms p(99.9)=516.65ms
     iterations.....................: 115638  1857.110801/s
     success_rate...................: 100.00% ✓ 115638      ✗ 0     
     vus............................: 71      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 201750      ✗ 0    
     data_received..................: 6.0 GB  95 MB/s
     data_sent......................: 82 MB   1.3 MB/s
     http_req_blocked...............: avg=6.55µs   min=1.12µs  med=3.02µs   max=15.85ms  p(90)=4.82µs   p(95)=5.82µs   p(99.9)=507.82µs
     http_req_connecting............: avg=2.77µs   min=0s      med=0s       max=15.78ms  p(90)=0s       p(95)=0s       p(99.9)=437.68µs
     http_req_duration..............: avg=209.12ms min=2.14ms  med=208.57ms max=601.87ms p(90)=387.22ms p(95)=417.69ms p(99.9)=515.18ms
       { expected_response:true }...: avg=209.12ms min=2.14ms  med=208.57ms max=601.87ms p(90)=387.22ms p(95)=417.69ms p(99.9)=515.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68250
     http_req_receiving.............: avg=131.99µs min=29.17µs med=69.19µs  max=178.84ms p(90)=107.55µs p(95)=123.58µs p(99.9)=3.56ms  
     http_req_sending...............: avg=29.36µs  min=5.36µs  med=12.61µs  max=16.61ms  p(90)=19.89µs  p(95)=23.53µs  p(99.9)=3.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.96ms min=2.07ms  med=208.2ms  max=601.81ms p(90)=387.09ms p(95)=417.58ms p(99.9)=515.11ms
     http_reqs......................: 68250   1088.456826/s
     iteration_duration.............: avg=212.49ms min=5.77ms  med=212.39ms max=602.07ms p(90)=388.21ms p(95)=418.57ms p(99.9)=515.76ms
     iterations.....................: 67250   1072.508741/s
     success_rate...................: 100.00% ✓ 67250       ✗ 0    
     vus............................: 92      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 91545      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   581 kB/s
     http_req_blocked...............: avg=10.64µs  min=1.34µs  med=3.5µs    max=43.75ms  p(90)=5.32µs   p(95)=6.37µs   p(99.9)=1.29ms
     http_req_connecting............: avg=6.09µs   min=0s      med=0s       max=43.67ms  p(90)=0s       p(95)=0s       p(99.9)=1.22ms
     http_req_duration..............: avg=455.94ms min=4.01ms  med=422.6ms  max=1.8s     p(90)=891.71ms p(95)=984.02ms p(99.9)=1.43s 
       { expected_response:true }...: avg=455.94ms min=4.01ms  med=422.6ms  max=1.8s     p(90)=891.71ms p(95)=984.02ms p(99.9)=1.43s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31515
     http_req_receiving.............: avg=101.54µs min=33.21µs med=85.08µs  max=103.34ms p(90)=122.2µs  p(95)=136.9µs  p(99.9)=1.16ms
     http_req_sending...............: avg=29.31µs  min=6.19µs  med=15.4µs   max=75.22ms  p(90)=22.58µs  p(95)=26.04µs  p(99.9)=2.67ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=455.81ms min=3.94ms  med=422.5ms  max=1.8s     p(90)=891.64ms p(95)=983.92ms p(99.9)=1.43s 
     http_reqs......................: 31515   483.800871/s
     iteration_duration.............: avg=471.11ms min=19.85ms med=442.05ms max=1.8s     p(90)=897.48ms p(95)=987.23ms p(99.9)=1.44s 
     iterations.....................: 30515   468.449423/s
     success_rate...................: 100.00% ✓ 30515      ✗ 0    
     vus............................: 62      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41355      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   259 kB/s
     http_req_blocked...............: avg=16.77µs  min=1.42µs med=3.93µs   max=4.21ms   p(90)=5.82µs   p(95)=7.58µs   p(99.9)=2.89ms 
     http_req_connecting............: avg=10.77µs  min=0s     med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=2.85ms 
     http_req_duration..............: avg=987.61ms min=6.44ms med=883.47ms max=5.72s    p(90)=1.94s    p(95)=2.21s    p(99.9)=5.5s   
       { expected_response:true }...: avg=987.61ms min=6.44ms med=883.47ms max=5.72s    p(90)=1.94s    p(95)=2.21s    p(99.9)=5.5s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14785
     http_req_receiving.............: avg=299.35µs min=32.4µs med=101.61µs max=116.54ms p(90)=140.64µs p(95)=153.81µs p(99.9)=93.68ms
     http_req_sending...............: avg=29.19µs  min=6.5µs  med=18.92µs  max=8.64ms   p(90)=25.13µs  p(95)=30.85µs  p(99.9)=2.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=987.29ms min=6.34ms med=883.34ms max=5.72s    p(90)=1.94s    p(95)=2.21s    p(99.9)=5.5s   
     http_reqs......................: 14785   215.571986/s
     iteration_duration.............: avg=1.05s    min=12.3ms med=965.63ms max=5.73s    p(90)=1.96s    p(95)=2.23s    p(99.9)=5.51s  
     iterations.....................: 13785   200.991533/s
     success_rate...................: 100.00% ✓ 13785      ✗ 0    
     vus............................: 80      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 40149      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=18.18µs  min=1.28µs  med=3.69µs   max=18.22ms  p(90)=5.52µs   p(95)=7.24µs   p(99.9)=2.71ms
     http_req_connecting............: avg=12.15µs  min=0s      med=0s       max=18.18ms  p(90)=0s       p(95)=0s       p(99.9)=2.51ms
     http_req_duration..............: avg=1.01s    min=8.68ms  med=925.64ms max=4.24s    p(90)=2.08s    p(95)=2.21s    p(99.9)=3.86s 
       { expected_response:true }...: avg=1.01s    min=8.68ms  med=925.64ms max=4.24s    p(90)=2.08s    p(95)=2.21s    p(99.9)=3.86s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14383
     http_req_receiving.............: avg=127.04µs min=38µs    med=98.27µs  max=155.28ms p(90)=139.08µs p(95)=151.76µs p(99.9)=1.11ms
     http_req_sending...............: avg=32.48µs  min=6.27µs  med=18.16µs  max=47.54ms  p(90)=24.03µs  p(95)=29.3µs   p(99.9)=2.78ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.57ms  med=925.49ms max=4.24s    p(90)=2.07s    p(95)=2.21s    p(99.9)=3.86s 
     http_reqs......................: 14383   205.699951/s
     iteration_duration.............: avg=1.09s    min=40.26ms med=1s       max=4.25s    p(90)=2.09s    p(95)=2.23s    p(99.9)=3.92s 
     iterations.....................: 13383   191.398348/s
     success_rate...................: 100.00% ✓ 13383      ✗ 0    
     vus............................: 27      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

