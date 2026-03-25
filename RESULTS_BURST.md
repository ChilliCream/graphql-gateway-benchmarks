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
| hive-router | v0.0.42 | 2,782 | 2,917 | 2,706 | 2.3% |  |
| cosmo | 0.295.0 | 1,181 | 1,183 | 1,175 | 0.4% | non-compatible response (20 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 562 | 565 | 554 | 0.6% |  |
| hive-gateway | 2.5.11 | 245 | 248 | 240 | 1.1% |  |
| apollo-gateway | 2.13.3 | 217 | 222 | 214 | 1.1% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (41810 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (452667 across 9/9 runs) |
| hotchocolate | 16.0.0-rc.1.14 | — | — | — | — | non-compatible response (57 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.42 | 2,248 | 2,363 | 2,208 | 2.3% |  |
| hotchocolate | 16.0.0-rc.1.14 | 1,796 | 1,796 | 1,796 | 0.0% | non-compatible response (38 across 8/9 runs) |
| cosmo | 0.295.0 | 1,098 | 1,098 | 1,097 | 0.1% | non-compatible response (11 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 532 | 542 | 529 | 0.9% |  |
| hive-gateway | 2.5.11 | 246 | 250 | 244 | 0.9% |  |
| apollo-gateway | 2.13.3 | 203 | 206 | 202 | 0.6% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (25883 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (262728 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 513444      ✗ 0     
     data_received..................: 15 GB   244 MB/s
     data_sent......................: 207 MB  3.3 MB/s
     http_req_blocked...............: avg=27.94µs min=1.02µs  med=2.39µs  max=69.23ms  p(90)=3.83µs   p(95)=4.86µs   p(99.9)=4.07ms  
     http_req_connecting............: avg=24.4µs  min=0s      med=0s      max=69.07ms  p(90)=0s       p(95)=0s       p(99.9)=2.95ms  
     http_req_duration..............: avg=82.49ms min=1.56ms  med=76.97ms max=431.74ms p(90)=160.73ms p(95)=175.96ms p(99.9)=229.65ms
       { expected_response:true }...: avg=82.49ms min=1.56ms  med=76.97ms max=431.74ms p(90)=160.73ms p(95)=175.96ms p(99.9)=229.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 172148
     http_req_receiving.............: avg=459.5µs min=28.77µs med=55.68µs max=279.19ms p(90)=259.23µs p(95)=420.6µs  p(99.9)=39.94ms 
     http_req_sending...............: avg=87.13µs min=5.41µs  med=9.96µs  max=324.79ms p(90)=18.36µs  p(95)=130.7µs  p(99.9)=13.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.94ms min=1.48ms  med=76.53ms max=260.74ms p(90)=159.97ms p(95)=174.59ms p(99.9)=225.14ms
     http_reqs......................: 172148  2782.757233/s
     iteration_duration.............: avg=83.29ms min=2.25ms  med=77.89ms max=443.86ms p(90)=161.25ms p(95)=176.51ms p(99.9)=232.3ms 
     iterations.....................: 171148  2766.592321/s
     success_rate...................: 100.00% ✓ 171148      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 218676      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=10.74µs  min=1.01µs  med=2.59µs   max=12.82ms  p(90)=4.18µs   p(95)=5.08µs   p(99.9)=553.4µs 
     http_req_connecting............: avg=7.39µs   min=0s      med=0s       max=12.78ms  p(90)=0s       p(95)=0s       p(99.9)=489.82µs
     http_req_duration..............: avg=193.07ms min=2.04ms  med=194.01ms max=619.73ms p(90)=355.53ms p(95)=383.01ms p(99.9)=506.9ms 
       { expected_response:true }...: avg=193.07ms min=2.04ms  med=194.01ms max=619.73ms p(90)=355.53ms p(95)=383.01ms p(99.9)=506.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 73892
     http_req_receiving.............: avg=77.16µs  min=30.16µs med=61.32µs  max=95.08ms  p(90)=96.57µs  p(95)=111.77µs p(99.9)=1.35ms  
     http_req_sending...............: avg=29.82µs  min=5.64µs  med=10.95µs  max=16.45ms  p(90)=17.05µs  p(95)=20.71µs  p(99.9)=4.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.97ms min=1.99ms  med=193.93ms max=619.63ms p(90)=355.44ms p(95)=382.91ms p(99.9)=506.67ms
     http_reqs......................: 73892   1181.694092/s
     iteration_duration.............: avg=195.97ms min=4.82ms  med=197.03ms max=619.97ms p(90)=356.38ms p(95)=383.68ms p(99.9)=507.41ms
     iterations.....................: 72892   1165.701913/s
     success_rate...................: 100.00% ✓ 72892       ✗ 0    
     vus............................: 84      min=0         max=495
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 105663     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 44 MB   676 kB/s
     http_req_blocked...............: avg=8.95µs   min=1.16µs  med=3.12µs   max=5.49ms  p(90)=4.93µs   p(95)=6.06µs   p(99.9)=1.22ms
     http_req_connecting............: avg=4.89µs   min=0s      med=0s       max=5.43ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms
     http_req_duration..............: avg=395.89ms min=3.61ms  med=367ms    max=1.57s   p(90)=780.96ms p(95)=852.01ms p(99.9)=1.28s 
       { expected_response:true }...: avg=395.89ms min=3.61ms  med=367ms    max=1.57s   p(90)=780.96ms p(95)=852.01ms p(99.9)=1.28s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36221
     http_req_receiving.............: avg=148.66µs min=33.27µs med=77.72µs  max=162.1ms p(90)=114.96µs p(95)=128.97µs p(99.9)=4.91ms
     http_req_sending...............: avg=23.35µs  min=5.86µs  med=13.73µs  max=18.75ms p(90)=21.16µs  p(95)=24.24µs  p(99.9)=2.74ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=395.72ms min=3.55ms  med=366.87ms max=1.57s   p(90)=780.85ms p(95)=851.93ms p(99.9)=1.28s 
     http_reqs......................: 36221   562.431176/s
     iteration_duration.............: avg=407.36ms min=9ms     med=382.32ms max=1.57s   p(90)=785.45ms p(95)=855.22ms p(99.9)=1.28s 
     iterations.....................: 35221   546.903411/s
     success_rate...................: 100.00% ✓ 35221      ✗ 0    
     vus............................: 79      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 46662      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=16.31µs  min=1.28µs  med=3.5µs    max=26.34ms p(90)=5.32µs   p(95)=6.6µs    p(99.9)=2.63ms
     http_req_connecting............: avg=11.18µs  min=0s      med=0s       max=26.26ms p(90)=0s       p(95)=0s       p(99.9)=2.59ms
     http_req_duration..............: avg=806.1ms  min=5.63ms  med=754.7ms  max=18.04s  p(90)=1.41s    p(95)=1.55s    p(99.9)=16.14s
       { expected_response:true }...: avg=806.1ms  min=5.63ms  med=754.7ms  max=18.04s  p(90)=1.41s    p(95)=1.55s    p(99.9)=16.14s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16554
     http_req_receiving.............: avg=115.05µs min=35.19µs med=95.31µs  max=90.7ms  p(90)=137.14µs p(95)=150.95µs p(99.9)=1.18ms
     http_req_sending...............: avg=30.31µs  min=6.07µs  med=16.86µs  max=19.92ms p(90)=23.34µs  p(95)=27.87µs  p(99.9)=2.95ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=805.96ms min=5.53ms  med=754.51ms max=18.04s  p(90)=1.41s    p(95)=1.55s    p(99.9)=16.14s
     http_reqs......................: 16554   245.849913/s
     iteration_duration.............: avg=858.01ms min=48.77ms med=806.55ms max=18.04s  p(90)=1.43s    p(95)=1.56s    p(99.9)=16.23s
     iterations.....................: 15554   230.998522/s
     success_rate...................: 100.00% ✓ 15554      ✗ 0    
     vus............................: 81      min=0        max=500
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

     checks.........................: 100.00% ✓ 42321      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 19 MB   267 kB/s
     http_req_blocked...............: avg=17.81µs  min=1.34µs  med=3.36µs   max=22.04ms  p(90)=5.07µs   p(95)=6.6µs    p(99.9)=2.58ms
     http_req_connecting............: avg=12.8µs   min=0s      med=0s       max=21.98ms  p(90)=0s       p(95)=0s       p(99.9)=2.55ms
     http_req_duration..............: avg=469.21ms min=8.29ms  med=551ms    max=1.33s    p(90)=803.05ms p(95)=853.73ms p(99.9)=1.18s 
       { expected_response:true }...: avg=469.21ms min=8.29ms  med=551ms    max=1.33s    p(90)=803.05ms p(95)=853.73ms p(99.9)=1.18s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15107
     http_req_receiving.............: avg=108.7µs  min=35.09µs med=91.5µs   max=100.29ms p(90)=132.72µs p(95)=146.09µs p(99.9)=1.09ms
     http_req_sending...............: avg=32.87µs  min=6.06µs  med=16.51µs  max=79.3ms   p(90)=23.02µs  p(95)=27.78µs  p(99.9)=2.84ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=469.06ms min=8.2ms   med=550.9ms  max=1.33s    p(90)=802.95ms p(95)=853.61ms p(99.9)=1.18s 
     http_reqs......................: 15107   217.812698/s
     iteration_duration.............: avg=502.32ms min=14.45ms med=576.39ms max=1.34s    p(90)=810.02ms p(95)=863.13ms p(99.9)=1.21s 
     iterations.....................: 14107   203.3947/s
     success_rate...................: 100.00% ✓ 14107      ✗ 0    
     vus............................: 114     min=0        max=498
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 415710      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=22.26µs  min=1.1µs   med=2.9µs   max=61.64ms  p(90)=4.64µs   p(95)=5.96µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=18.42µs  min=0s      med=0s      max=61.59ms  p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=101.87ms min=1.6ms   med=96.15ms max=343.03ms p(90)=196.17ms p(95)=212.84ms p(99.9)=263.8ms 
       { expected_response:true }...: avg=101.87ms min=1.6ms   med=96.15ms max=343.03ms p(90)=196.17ms p(95)=212.84ms p(99.9)=263.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139571
     http_req_receiving.............: avg=233.42µs min=29.72µs med=63.52µs max=246.39ms p(90)=178.35µs p(95)=425.55µs p(99.9)=22.68ms 
     http_req_sending...............: avg=81.32µs  min=5.41µs  med=11.6µs  max=46.57ms  p(90)=21.79µs  p(95)=142.76µs p(99.9)=12.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.55ms min=1.55ms  med=95.88ms max=294.13ms p(90)=195.57ms p(95)=212.22ms p(99.9)=261.42ms
     http_reqs......................: 139571  2248.067066/s
     iteration_duration.............: avg=102.91ms min=2.48ms  med=97.37ms max=392.58ms p(90)=196.75ms p(95)=213.37ms p(99.9)=266.58ms
     iterations.....................: 138570  2231.94398/s
     success_rate...................: 100.00% ✓ 138570      ✗ 0     
     vus............................: 61      min=0         max=497 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 332193      ✗ 0     
     data_received..................: 9.8 GB  157 MB/s
     data_sent......................: 134 MB  2.2 MB/s
     http_req_blocked...............: avg=19.29µs  min=972ns   med=2.45µs   max=122.77ms p(90)=4.03µs   p(95)=5.09µs   p(99.9)=2.56ms 
     http_req_connecting............: avg=15.97µs  min=0s      med=0s       max=122.61ms p(90)=0s       p(95)=0s       p(99.9)=2.27ms 
     http_req_duration..............: avg=127.66ms min=1.83ms  med=74.16ms  max=3.63s    p(90)=292.34ms p(95)=414.98ms p(99.9)=1.67s  
       { expected_response:true }...: avg=127.66ms min=1.83ms  med=74.16ms  max=3.63s    p(90)=292.34ms p(95)=414.98ms p(99.9)=1.67s  
     http_req_failed................: 0.00%   ✓ 0           ✗ 111731
     http_req_receiving.............: avg=7.19ms   min=51.75µs med=110.66µs max=1.25s    p(90)=4.66ms   p(95)=19.33ms  p(99.9)=536.5ms
     http_req_sending...............: avg=65.24µs  min=5.3µs   med=9.9µs    max=130.62ms p(90)=18.36µs  p(95)=99.72µs  p(99.9)=9.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=120.41ms min=1.74ms  med=72.42ms  max=3.63s    p(90)=269.24ms p(95)=369.95ms p(99.9)=1.63s  
     http_reqs......................: 111731  1796.222382/s
     iteration_duration.............: avg=129.11ms min=2.74ms  med=75.37ms  max=3.63s    p(90)=294.18ms p(95)=416.71ms p(99.9)=1.67s  
     iterations.....................: 110731  1780.14607/s
     success_rate...................: 100.00% ✓ 110731      ✗ 0     
     vus............................: 68      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 203463      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=7.61µs   min=1.16µs  med=2.81µs   max=56.1ms   p(90)=4.58µs   p(95)=5.55µs   p(99.9)=550.91µs
     http_req_connecting............: avg=4.07µs   min=0s      med=0s       max=56.04ms  p(90)=0s       p(95)=0s       p(99.9)=498.84µs
     http_req_duration..............: avg=207.38ms min=2.14ms  med=208.07ms max=638.46ms p(90)=381.47ms p(95)=411.87ms p(99.9)=560.46ms
       { expected_response:true }...: avg=207.38ms min=2.14ms  med=208.07ms max=638.46ms p(90)=381.47ms p(95)=411.87ms p(99.9)=560.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68821
     http_req_receiving.............: avg=87.09µs  min=31.36µs med=68.39µs  max=137.58ms p(90)=106.55µs p(95)=122.2µs  p(99.9)=1.7ms   
     http_req_sending...............: avg=33.6µs   min=5.55µs  med=11.95µs  max=206.7ms  p(90)=18.55µs  p(95)=22.18µs  p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.26ms min=2.06ms  med=207.95ms max=638.39ms p(90)=381.31ms p(95)=411.79ms p(99.9)=560.39ms
     http_reqs......................: 68821   1098.079833/s
     iteration_duration.............: avg=210.69ms min=5.68ms  med=211.44ms max=638.69ms p(90)=382.5ms  p(95)=412.71ms p(99.9)=560.98ms
     iterations.....................: 67821   1082.124241/s
     success_rate...................: 100.00% ✓ 67821       ✗ 0    
     vus............................: 91      min=0         max=500
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 100440     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   640 kB/s
     http_req_blocked...............: avg=13.44µs  min=1.18µs  med=3.25µs   max=175.04ms p(90)=5.02µs   p(95)=5.97µs   p(99.9)=981.66µs
     http_req_connecting............: avg=4.2µs    min=0s      med=0s       max=6.04ms   p(90)=0s       p(95)=0s       p(99.9)=873.43µs
     http_req_duration..............: avg=415.91ms min=3.85ms  med=384.69ms max=1.93s    p(90)=825.36ms p(95)=901.88ms p(99.9)=1.26s   
       { expected_response:true }...: avg=415.91ms min=3.85ms  med=384.69ms max=1.93s    p(90)=825.36ms p(95)=901.88ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34480
     http_req_receiving.............: avg=93.23µs  min=32.12µs med=81.23µs  max=137.77ms p(90)=118.03µs p(95)=131.17µs p(99.9)=1.03ms  
     http_req_sending...............: avg=28.89µs  min=5.75µs  med=14.46µs  max=80.89ms  p(90)=21.5µs   p(95)=24.85µs  p(99.9)=2.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=415.79ms min=3.78ms  med=384.59ms max=1.93s    p(90)=825.24ms p(95)=901.78ms p(99.9)=1.26s   
     http_reqs......................: 34480   532.315279/s
     iteration_duration.............: avg=428.57ms min=21.93ms med=399.85ms max=1.93s    p(90)=828.98ms p(95)=905.07ms p(99.9)=1.27s   
     iterations.....................: 33480   516.8769/s
     success_rate...................: 100.00% ✓ 33480      ✗ 0    
     vus............................: 97      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 46927      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=14.64µs  min=1.31µs  med=3.65µs   max=15.54ms p(90)=5.55µs   p(95)=7.15µs   p(99.9)=2.22ms  
     http_req_connecting............: avg=9.33µs   min=0s      med=0s       max=15.47ms p(90)=0s       p(95)=0s       p(99.9)=2.19ms  
     http_req_duration..............: avg=859.14ms min=5.84ms  med=780.35ms max=3.94s   p(90)=1.73s    p(95)=1.96s    p(99.9)=3.31s   
       { expected_response:true }...: avg=859.14ms min=5.84ms  med=780.35ms max=3.94s   p(90)=1.73s    p(95)=1.96s    p(99.9)=3.31s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16643
     http_req_receiving.............: avg=104.49µs min=33.21µs med=97.76µs  max=18.39ms p(90)=138.31µs p(95)=151.32µs p(99.9)=963.28µs
     http_req_sending...............: avg=35.41µs  min=6.31µs  med=18.16µs  max=43.57ms p(90)=24.23µs  p(95)=28.58µs  p(99.9)=3.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=859ms    min=5.74ms  med=780.22ms max=3.94s   p(90)=1.73s    p(95)=1.96s    p(99.9)=3.31s   
     http_reqs......................: 16643   246.924093/s
     iteration_duration.............: avg=914.15ms min=44.17ms med=858.17ms max=3.95s   p(90)=1.75s    p(95)=1.97s    p(99.9)=3.36s   
     iterations.....................: 15642   232.072743/s
     success_rate...................: 100.00% ✓ 15642      ✗ 0    
     vus............................: 84      min=0        max=500
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

     checks.........................: 100.00% ✓ 39615      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=17µs    min=1.3µs   med=3.62µs   max=34.8ms   p(90)=5.4µs    p(95)=7.04µs   p(99.9)=1.97ms
     http_req_connecting............: avg=11.62µs min=0s      med=0s       max=34.72ms  p(90)=0s       p(95)=0s       p(99.9)=1.94ms
     http_req_duration..............: avg=1s      min=8.78ms  med=919.31ms max=3.66s    p(90)=2.06s    p(95)=2.18s    p(99.9)=3.28s 
       { expected_response:true }...: avg=1s      min=8.78ms  med=919.31ms max=3.66s    p(90)=2.06s    p(95)=2.18s    p(99.9)=3.28s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14205
     http_req_receiving.............: avg=249.5µs min=37.35µs med=98.77µs  max=165.81ms p(90)=140.48µs p(95)=153.61µs p(99.9)=66.4ms
     http_req_sending...............: avg=30.15µs min=6.29µs  med=17.9µs   max=20.34ms  p(90)=23.74µs  p(95)=28.46µs  p(99.9)=3.49ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s      min=8.68ms  med=919.19ms max=3.66s    p(90)=2.06s    p(95)=2.18s    p(99.9)=3.28s 
     http_reqs......................: 14205   203.530683/s
     iteration_duration.............: avg=1.08s   min=19.09ms med=1s       max=3.67s    p(90)=2.07s    p(95)=2.18s    p(99.9)=3.33s 
     iterations.....................: 13205   189.202581/s
     success_rate...................: 100.00% ✓ 13205      ✗ 0    
     vus............................: 107     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

