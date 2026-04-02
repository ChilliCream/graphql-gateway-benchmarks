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
| hive-router | v0.0.43 | 2,799 | 2,937 | 2,760 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,975 | 2,022 | 1,961 | 0.9% |  |
| cosmo | 0.298.0 | 1,164 | 1,176 | 1,146 | 1.1% | non-compatible response (14 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 574 | 578 | 571 | 0.5% |  |
| hive-gateway | 2.5.14 | 252 | 255 | 249 | 0.8% |  |
| apollo-gateway | 2.13.3 | 199 | 206 | 196 | 1.5% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (26039 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (446497 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,182 | 2,287 | 2,147 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,850 | 1,898 | 1,841 | 1.2% |  |
| cosmo | 0.298.0 | 1,135 | 1,151 | 1,135 | 0.6% | non-compatible response (5 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 549 | 555 | 540 | 0.9% |  |
| hive-gateway | 2.5.14 | 250 | 251 | 248 | 0.4% |  |
| apollo-gateway | 2.13.3 | 210 | 212 | 209 | 0.5% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (31510 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (325374 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 516297      ✗ 0     
     data_received..................: 15 GB   246 MB/s
     data_sent......................: 208 MB  3.4 MB/s
     http_req_blocked...............: avg=32.78µs min=1.03µs  med=2.74µs  max=67ms     p(90)=4.41µs   p(95)=5.65µs   p(99.9)=6.66ms  
     http_req_connecting............: avg=28.51µs min=0s      med=0s      max=66.93ms  p(90)=0s       p(95)=0s       p(99.9)=6.34ms  
     http_req_duration..............: avg=81.98ms min=1.6ms   med=75.06ms max=309.77ms p(90)=159.51ms p(95)=178.53ms p(99.9)=251.65ms
       { expected_response:true }...: avg=81.98ms min=1.6ms   med=75.06ms max=309.77ms p(90)=159.51ms p(95)=178.53ms p(99.9)=251.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173099
     http_req_receiving.............: avg=462.3µs min=28.08µs med=57.24µs max=87.15ms  p(90)=245.83µs p(95)=429.79µs p(99.9)=55.72ms 
     http_req_sending...............: avg=98.22µs min=5.24µs  med=10.55µs max=147.86ms p(90)=20.15µs  p(95)=135.97µs p(99.9)=16.43ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.42ms min=1.54ms  med=74.68ms max=309.3ms  p(90)=158.57ms p(95)=176.67ms p(99.9)=241.51ms
     http_reqs......................: 173099  2799.016159/s
     iteration_duration.............: avg=82.82ms min=2.18ms  med=75.97ms max=370ms    p(90)=160.17ms p(95)=179.22ms p(99.9)=253.3ms 
     iterations.....................: 172099  2782.846128/s
     success_rate...................: 100.00% ✓ 172099      ✗ 0     
     vus............................: 23      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 368601      ✗ 0     
     data_received..................: 11 GB   173 MB/s
     data_sent......................: 149 MB  2.4 MB/s
     http_req_blocked...............: avg=10.71µs  min=1µs     med=2.23µs   max=41.04ms  p(90)=3.52µs   p(95)=4.43µs   p(99.9)=823.07µs
     http_req_connecting............: avg=7.88µs   min=0s      med=0s       max=40.86ms  p(90)=0s       p(95)=0s       p(99.9)=776.91µs
     http_req_duration..............: avg=114.92ms min=2.38ms  med=111.2ms  max=504.96ms p(90)=217.42ms p(95)=239.78ms p(99.9)=364.08ms
       { expected_response:true }...: avg=114.92ms min=2.38ms  med=111.2ms  max=504.96ms p(90)=217.42ms p(95)=239.78ms p(99.9)=364.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 123867
     http_req_receiving.............: avg=1.19ms   min=52.85µs med=158.92µs max=217.27ms p(90)=1.36ms   p(95)=3.1ms    p(99.9)=98.17ms 
     http_req_sending...............: avg=57.87µs  min=5.47µs  med=9.63µs   max=167.89ms p(90)=17.01µs  p(95)=118.3µs  p(99.9)=7.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.67ms min=2.3ms   med=110.08ms max=504.78ms p(90)=215.75ms p(95)=237.35ms p(99.9)=362.03ms
     http_reqs......................: 123867  1975.222427/s
     iteration_duration.............: avg=116.12ms min=3.81ms  med=112.52ms max=531.09ms p(90)=217.91ms p(95)=240.39ms p(99.9)=366.87ms
     iterations.....................: 122867  1959.276111/s
     success_rate...................: 100.00% ✓ 122867      ✗ 0     
     vus............................: 88      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 215241      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.62µs   min=1.06µs  med=2.35µs   max=10.31ms  p(90)=3.75µs   p(95)=4.5µs    p(99.9)=481.16µs
     http_req_connecting............: avg=3.64µs   min=0s      med=0s       max=10.24ms  p(90)=0s       p(95)=0s       p(99.9)=430.51µs
     http_req_duration..............: avg=196.14ms min=2.05ms  med=193.22ms max=571.68ms p(90)=367.49ms p(95)=393.27ms p(99.9)=488.7ms 
       { expected_response:true }...: avg=196.14ms min=2.05ms  med=193.22ms max=571.68ms p(90)=367.49ms p(95)=393.27ms p(99.9)=488.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 72747
     http_req_receiving.............: avg=77.46µs  min=29.96µs med=60.2µs   max=115.51ms p(90)=91.7µs   p(95)=104.13µs p(99.9)=1.88ms  
     http_req_sending...............: avg=28.13µs  min=5.25µs  med=10.41µs  max=187.11ms p(90)=15.72µs  p(95)=19.07µs  p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.04ms min=1.99ms  med=193.1ms  max=571.62ms p(90)=367.35ms p(95)=393.16ms p(99.9)=488.56ms
     http_reqs......................: 72747   1164.036939/s
     iteration_duration.............: avg=199.11ms min=3.69ms  med=196.33ms max=571.84ms p(90)=368.32ms p(95)=393.83ms p(99.9)=489.1ms 
     iterations.....................: 71747   1148.035771/s
     success_rate...................: 100.00% ✓ 71747       ✗ 0    
     vus............................: 82      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 108006     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   689 kB/s
     http_req_blocked...............: avg=9.22µs   min=1.15µs  med=2.98µs   max=10.78ms  p(90)=4.83µs   p(95)=5.92µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=5.32µs   min=0s      med=0s       max=10.62ms  p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=387.67ms min=3.63ms  med=359.24ms max=1.34s    p(90)=767.96ms p(95)=825.49ms p(99.9)=1.16s   
       { expected_response:true }...: avg=387.67ms min=3.63ms  med=359.24ms max=1.34s    p(90)=767.96ms p(95)=825.49ms p(99.9)=1.16s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 37002
     http_req_receiving.............: avg=95.61µs  min=32.61µs med=76.41µs  max=148.76ms p(90)=112.68µs p(95)=127.44µs p(99.9)=957.96µs
     http_req_sending...............: avg=26.9µs   min=5.86µs  med=13.63µs  max=44.75ms  p(90)=21.54µs  p(95)=25.01µs  p(99.9)=2.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.55ms min=3.57ms  med=359.12ms max=1.34s    p(90)=767.85ms p(95)=825.37ms p(99.9)=1.16s   
     http_reqs......................: 37002   574.264673/s
     iteration_duration.............: avg=398.69ms min=21.6ms  med=374.67ms max=1.35s    p(90)=771.64ms p(95)=828.23ms p(99.9)=1.17s   
     iterations.....................: 36002   558.744845/s
     success_rate...................: 100.00% ✓ 36002      ✗ 0    
     vus............................: 77      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48300      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   304 kB/s
     http_req_blocked...............: avg=14.36µs  min=1.29µs  med=3.5µs    max=4.61ms   p(90)=5.2µs    p(95)=6.75µs   p(99.9)=2.41ms 
     http_req_connecting............: avg=9.26µs   min=0s      med=0s       max=4.57ms   p(90)=0s       p(95)=0s       p(99.9)=2.26ms 
     http_req_duration..............: avg=835.51ms min=5.82ms  med=742.36ms max=21.5s    p(90)=1.44s    p(95)=1.56s    p(99.9)=19.4s  
       { expected_response:true }...: avg=835.51ms min=5.82ms  med=742.36ms max=21.5s    p(90)=1.44s    p(95)=1.56s    p(99.9)=19.4s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17100
     http_req_receiving.............: avg=264.77µs min=36.63µs med=90.34µs  max=193.76ms p(90)=129.46µs p(95)=144.36µs p(99.9)=86.72ms
     http_req_sending...............: avg=32.79µs  min=6.55µs  med=16.74µs  max=37.35ms  p(90)=23.25µs  p(95)=27.93µs  p(99.9)=3.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=835.21ms min=5.72ms  med=742.28ms max=21.5s    p(90)=1.44s    p(95)=1.56s    p(99.9)=19.4s  
     http_reqs......................: 17100   252.340761/s
     iteration_duration.............: avg=887.47ms min=20.34ms med=799.98ms max=21.5s    p(90)=1.46s    p(95)=1.57s    p(99.9)=19.5s  
     iterations.....................: 16100   237.583992/s
     success_rate...................: 100.00% ✓ 16100      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 41481      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   245 kB/s
     http_req_blocked...............: avg=17.25µs  min=1.31µs  med=3.31µs   max=22.6ms   p(90)=4.96µs   p(95)=6.39µs   p(99.9)=2.8ms 
     http_req_connecting............: avg=12.32µs  min=0s      med=0s       max=22.54ms  p(90)=0s       p(95)=0s       p(99.9)=2.76ms
     http_req_duration..............: avg=494.14ms min=8.31ms  med=551.17ms max=1.42s    p(90)=878.6ms  p(95)=937.86ms p(99.9)=1.24s 
       { expected_response:true }...: avg=494.14ms min=8.31ms  med=551.17ms max=1.42s    p(90)=878.6ms  p(95)=937.86ms p(99.9)=1.24s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14827
     http_req_receiving.............: avg=114.68µs min=37.72µs med=89.61µs  max=119.77ms p(90)=130.01µs p(95)=143.52µs p(99.9)=1.16ms
     http_req_sending...............: avg=47.57µs  min=5.87µs  med=16.9µs   max=99.18ms  p(90)=23.08µs  p(95)=28.02µs  p(99.9)=1.89ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=493.98ms min=8.22ms  med=551.05ms max=1.42s    p(90)=878.48ms p(95)=937.76ms p(99.9)=1.24s 
     http_reqs......................: 14827   199.88636/s
     iteration_duration.............: avg=529.81ms min=8.78ms  med=582.98ms max=1.43s    p(90)=885.28ms p(95)=946.7ms  p(99.9)=1.25s 
     iterations.....................: 13827   186.405119/s
     success_rate...................: 100.00% ✓ 13827      ✗ 0    
     vus............................: 55      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403728      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=22.89µs  min=1.05µs  med=2.89µs   max=59.14ms  p(90)=4.65µs   p(95)=5.9µs    p(99.9)=4.28ms  
     http_req_connecting............: avg=18.83µs  min=0s      med=0s       max=49.96ms  p(90)=0s       p(95)=0s       p(99.9)=4.08ms  
     http_req_duration..............: avg=104.9ms  min=1.68ms  med=99.34ms  max=311.57ms p(90)=202.14ms p(95)=218.93ms p(99.9)=275.82ms
       { expected_response:true }...: avg=104.9ms  min=1.68ms  med=99.34ms  max=311.57ms p(90)=202.14ms p(95)=218.93ms p(99.9)=275.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135576
     http_req_receiving.............: avg=231.18µs min=30.04µs med=62.68µs  max=114.28ms p(90)=178.31µs p(95)=425.95µs p(99.9)=30.87ms 
     http_req_sending...............: avg=80.58µs  min=5.41µs  med=11.4µs   max=171.18ms p(90)=21.67µs  p(95)=141µs    p(99.9)=10.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.59ms min=1.59ms  med=99.11ms  max=311.22ms p(90)=201.66ms p(95)=218.4ms  p(99.9)=273.78ms
     http_reqs......................: 135576  2182.400944/s
     iteration_duration.............: avg=105.98ms min=4.26ms  med=100.62ms max=341.84ms p(90)=202.75ms p(95)=219.59ms p(99.9)=277.07ms
     iterations.....................: 134576  2166.303693/s
     success_rate...................: 100.00% ✓ 134576      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 342972      ✗ 0     
     data_received..................: 10 GB   162 MB/s
     data_sent......................: 139 MB  2.2 MB/s
     http_req_blocked...............: avg=10.85µs  min=1µs     med=2.28µs   max=71.3ms   p(90)=3.7µs    p(95)=4.7µs    p(99.9)=1.29ms  
     http_req_connecting............: avg=7.88µs   min=0s      med=0s       max=71.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.1ms   
     http_req_duration..............: avg=123.51ms min=1.87ms  med=119.23ms max=556.82ms p(90)=232.77ms p(95)=255.64ms p(99.9)=442.38ms
       { expected_response:true }...: avg=123.51ms min=1.87ms  med=119.23ms max=556.82ms p(90)=232.77ms p(95)=255.64ms p(99.9)=442.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 115324
     http_req_receiving.............: avg=1.4ms    min=51.95µs med=160.01µs max=211.56ms p(90)=1.63ms   p(95)=3.39ms   p(99.9)=110.34ms
     http_req_sending...............: avg=50.88µs  min=5.16µs  med=9.92µs   max=52.13ms  p(90)=18.64µs  p(95)=113.29µs p(99.9)=6.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.06ms min=1.78ms  med=117.31ms max=551.02ms p(90)=230.91ms p(95)=252.31ms p(99.9)=440.48ms
     http_reqs......................: 115324  1850.017986/s
     iteration_duration.............: avg=124.85ms min=3.05ms  med=120.67ms max=557.04ms p(90)=233.36ms p(95)=256.25ms p(99.9)=443.27ms
     iterations.....................: 114324  1833.97607/s
     success_rate...................: 100.00% ✓ 114324      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 210438      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=8.37µs   min=1.13µs  med=2.87µs   max=32.88ms  p(90)=4.77µs   p(95)=5.81µs   p(99.9)=594.49µs
     http_req_connecting............: avg=4.75µs   min=0s      med=0s       max=32.81ms  p(90)=0s       p(95)=0s       p(99.9)=520.12µs
     http_req_duration..............: avg=200.54ms min=2.12ms  med=201.21ms max=591.39ms p(90)=370.62ms p(95)=397.76ms p(99.9)=504.44ms
       { expected_response:true }...: avg=200.54ms min=2.12ms  med=201.21ms max=591.39ms p(90)=370.62ms p(95)=397.76ms p(99.9)=504.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71146
     http_req_receiving.............: avg=132.77µs min=29.02µs med=68.5µs   max=225.77ms p(90)=107.65µs p(95)=124.07µs p(99.9)=3.34ms  
     http_req_sending...............: avg=31.23µs  min=5.7µs   med=12.22µs  max=10.33ms  p(90)=19.73µs  p(95)=23.74µs  p(99.9)=3.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.38ms min=2.04ms  med=200.84ms max=591.32ms p(90)=370.51ms p(95)=397.67ms p(99.9)=504.39ms
     http_reqs......................: 71146   1135.568222/s
     iteration_duration.............: avg=203.7ms  min=4.42ms  med=204.92ms max=591.55ms p(90)=371.8ms  p(95)=398.55ms p(99.9)=504.7ms 
     iterations.....................: 70146   1119.607125/s
     success_rate...................: 100.00% ✓ 70146       ✗ 0    
     vus............................: 90      min=0         max=499
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103722     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 43 MB   660 kB/s
     http_req_blocked...............: avg=9.51µs   min=1.19µs  med=3.38µs   max=9.49ms   p(90)=5.27µs   p(95)=6.32µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=5.14µs   min=0s      med=0s       max=9.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.56ms  
     http_req_duration..............: avg=403.43ms min=3.81ms  med=373.78ms max=1.63s    p(90)=803.35ms p(95)=868.52ms p(99.9)=1.26s   
       { expected_response:true }...: avg=403.43ms min=3.81ms  med=373.78ms max=1.63s    p(90)=803.35ms p(95)=868.52ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35574
     http_req_receiving.............: avg=94.06µs  min=33.37µs med=81.3µs   max=106.16ms p(90)=118.18µs p(95)=131.59µs p(99.9)=847.08µs
     http_req_sending...............: avg=34.28µs  min=5.78µs  med=14.75µs  max=126.93ms p(90)=22.49µs  p(95)=25.6µs   p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=403.31ms min=3.69ms  med=373.52ms max=1.62s    p(90)=803.27ms p(95)=868.4ms  p(99.9)=1.26s   
     http_reqs......................: 35574   549.473903/s
     iteration_duration.............: avg=415.34ms min=36.45ms med=388.16ms max=1.65s    p(90)=806.77ms p(95)=870.55ms p(99.9)=1.26s   
     iterations.....................: 34574   534.027962/s
     success_rate...................: 100.00% ✓ 34574      ✗ 0    
     vus............................: 90      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47808      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=17.73µs  min=1.34µs  med=3.91µs   max=23.48ms p(90)=5.94µs   p(95)=7.43µs   p(99.9)=2.6ms 
     http_req_connecting............: avg=11.92µs  min=0s      med=0s       max=23.44ms p(90)=0s       p(95)=0s       p(99.9)=2.53ms
     http_req_duration..............: avg=859.88ms min=5.83ms  med=777.94ms max=4.75s   p(90)=1.72s    p(95)=1.9s     p(99.9)=3.76s 
       { expected_response:true }...: avg=859.88ms min=5.83ms  med=777.94ms max=4.75s   p(90)=1.72s    p(95)=1.9s     p(99.9)=3.76s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16936
     http_req_receiving.............: avg=114.62µs min=38.43µs med=101.65µs max=40.15ms p(90)=142.33µs p(95)=156.33µs p(99.9)=1.15ms
     http_req_sending...............: avg=43.41µs  min=6.65µs  med=19.66µs  max=56.15ms p(90)=25.74µs  p(95)=30.85µs  p(99.9)=3.62ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=859.72ms min=5.73ms  med=777.84ms max=4.75s   p(90)=1.72s    p(95)=1.9s     p(99.9)=3.76s 
     http_reqs......................: 16936   250.054627/s
     iteration_duration.............: avg=913.94ms min=66.62ms med=855.36ms max=4.76s   p(90)=1.74s    p(95)=1.92s    p(99.9)=3.8s  
     iterations.....................: 15936   235.289946/s
     success_rate...................: 100.00% ✓ 15936      ✗ 0    
     vus............................: 88      min=0        max=500
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

     checks.........................: 100.00% ✓ 41031      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   252 kB/s
     http_req_blocked...............: avg=17.72µs  min=1.31µs  med=3.53µs   max=19.41ms p(90)=5.32µs   p(95)=6.86µs   p(99.9)=2.42ms
     http_req_connecting............: avg=12.4µs   min=0s      med=0s       max=19.1ms  p(90)=0s       p(95)=0s       p(99.9)=2.38ms
     http_req_duration..............: avg=993.67ms min=8.68ms  med=895.94ms max=4.14s   p(90)=2.03s    p(95)=2.17s    p(99.9)=3.64s 
       { expected_response:true }...: avg=993.67ms min=8.68ms  med=895.94ms max=4.14s   p(90)=2.03s    p(95)=2.17s    p(99.9)=3.64s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14677
     http_req_receiving.............: avg=102.89µs min=38.58µs med=95.18µs  max=16.07ms p(90)=135.84µs p(95)=148.77µs p(99.9)=1ms   
     http_req_sending...............: avg=27.64µs  min=6.17µs  med=18.34µs  max=17.92ms p(90)=23.96µs  p(95)=29.41µs  p(99.9)=1.96ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=993.54ms min=8.57ms  med=895.84ms max=4.14s   p(90)=2.03s    p(95)=2.17s    p(99.9)=3.64s 
     http_reqs......................: 14677   210.103237/s
     iteration_duration.............: avg=1.06s    min=34.59ms med=995.19ms max=4.14s   p(90)=2.06s    p(95)=2.18s    p(99.9)=3.66s 
     iterations.....................: 13677   195.788102/s
     success_rate...................: 100.00% ✓ 13677      ✗ 0    
     vus............................: 3       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

