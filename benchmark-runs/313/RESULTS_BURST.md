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
| hive-router | v0.0.84 | 2,747 | 2,894 | 2,690 | 2.3% |  |
| fusion | 16.6.0 | 2,556 | 2,654 | 2,536 | 1.5% |  |
| cosmo | 0.334.0 | 1,182 | 1,225 | 1,177 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 574 | 586 | 572 | 1.0% |  |
| hive-gateway | 2.10.8 | 249 | 254 | 246 | 1.0% |  |
| apollo-gateway | 2.14.3 | 231 | 238 | 229 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (4105 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (535271 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,380 | 2,508 | 2,343 | 2.3% |  |
| fusion | 16.6.0 | 2,297 | 2,394 | 2,284 | 1.6% |  |
| cosmo | 0.334.0 | 1,159 | 1,189 | 1,152 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 546 | 554 | 544 | 0.6% |  |
| hive-gateway | 2.10.8 | 238 | 244 | 235 | 1.1% |  |
| apollo-gateway | 2.14.3 | 230 | 236 | 229 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (38654 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (283733 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 504738      ✗ 0     
     data_received..................: 15 GB   241 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=25.48µs min=882ns   med=2.45µs  max=56.76ms  p(90)=4.1µs    p(95)=5.19µs   p(99.9)=7.48ms  
     http_req_connecting............: avg=22.11µs min=0s      med=0s      max=56.69ms  p(90)=0s       p(95)=0s       p(99.9)=7.01ms  
     http_req_duration..............: avg=83.97ms min=1.37ms  med=78.74ms max=271.66ms p(90)=164.11ms p(95)=176.97ms p(99.9)=221.01ms
       { expected_response:true }...: avg=83.97ms min=1.37ms  med=78.74ms max=271.66ms p(90)=164.11ms p(95)=176.97ms p(99.9)=221.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 169246
     http_req_receiving.............: avg=152.3µs min=26.52µs med=53.5µs  max=59.15ms  p(90)=142.88µs p(95)=339.59µs p(99.9)=18.42ms 
     http_req_sending...............: avg=68.91µs min=4.37µs  med=9.6µs   max=211.41ms p(90)=18.14µs  p(95)=118.12µs p(99.9)=9.31ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.75ms min=1.32ms  med=78.52ms max=271.47ms p(90)=163.78ms p(95)=176.52ms p(99.9)=219.9ms 
     http_reqs......................: 169246  2747.1433/s
     iteration_duration.............: avg=84.73ms min=2.18ms  med=79.57ms max=311.45ms p(90)=164.52ms p(95)=177.37ms p(99.9)=222.35ms
     iterations.....................: 168246  2730.911642/s
     success_rate...................: 100.00% ✓ 168246      ✗ 0     
     vus............................: 84      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 475749     ✗ 0     
     data_received..................: 14 GB   224 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=17.65µs min=892ns  med=2.05µs  max=59.29ms  p(90)=3.39µs   p(95)=4.42µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=14.78µs min=0s     med=0s      max=59.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=89.13ms min=1.95ms med=77.09ms max=1.09s    p(90)=171.45ms p(95)=194.77ms p(99.9)=550.93ms
       { expected_response:true }...: avg=89.13ms min=1.95ms med=77.09ms max=1.09s    p(90)=171.45ms p(95)=194.77ms p(99.9)=550.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 159583
     http_req_receiving.............: avg=1.3ms   min=52µs   med=94.23µs max=492.24ms p(90)=1.53ms   p(95)=4.21ms   p(99.9)=81.02ms 
     http_req_sending...............: avg=60.97µs min=4.49µs med=8.67µs  max=150.09ms p(90)=16.04µs  p(95)=100.96µs p(99.9)=8.11ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.76ms min=1.87ms med=75.86ms max=1.09s    p(90)=169.54ms p(95)=192.32ms p(99.9)=542.69ms
     http_reqs......................: 159583  2556.28508/s
     iteration_duration.............: avg=89.94ms min=3.48ms med=78.1ms  max=1.09s    p(90)=172.01ms p(95)=195.35ms p(99.9)=551.54ms
     iterations.....................: 158583  2540.26655/s
     success_rate...................: 100.00% ✓ 158583     ✗ 0     
     vus............................: 77      min=0        max=493 
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 218688      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=5.45µs   min=1.06µs  med=2.48µs   max=10.1ms   p(90)=4µs      p(95)=4.84µs   p(99.9)=464.76µs
     http_req_connecting............: avg=2.33µs   min=0s      med=0s       max=9.95ms   p(90)=0s       p(95)=0s       p(99.9)=397.56µs
     http_req_duration..............: avg=193.1ms  min=1.93ms  med=192.88ms max=527.47ms p(90)=359.44ms p(95)=385.39ms p(99.9)=474.8ms 
       { expected_response:true }...: avg=193.1ms  min=1.93ms  med=192.88ms max=527.47ms p(90)=359.44ms p(95)=385.39ms p(99.9)=474.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 73896
     http_req_receiving.............: avg=72.01µs  min=28.89µs med=59.75µs  max=24.49ms  p(90)=94.99µs  p(95)=109.56µs p(99.9)=952.4µs 
     http_req_sending...............: avg=26.73µs  min=5.08µs  med=10.54µs  max=55.51ms  p(90)=16.38µs  p(95)=19.92µs  p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193ms    min=1.87ms  med=192.77ms max=527.39ms p(90)=359.33ms p(95)=385.29ms p(99.9)=474.21ms
     http_reqs......................: 73896   1182.659637/s
     iteration_duration.............: avg=195.98ms min=4.86ms  med=196.08ms max=527.63ms p(90)=360.35ms p(95)=386.09ms p(99.9)=475.41ms
     iterations.....................: 72896   1166.655258/s
     success_rate...................: 100.00% ✓ 72896       ✗ 0    
     vus............................: 79      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 107664     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   690 kB/s
     http_req_blocked...............: avg=7.09µs   min=1.21µs  med=3.16µs   max=6.6ms    p(90)=4.92µs   p(95)=5.94µs   p(99.9)=550.82µs
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=6.54ms   p(90)=0s       p(95)=0s       p(99.9)=519.41µs
     http_req_duration..............: avg=388.57ms min=3.49ms  med=361.64ms max=1.46s    p(90)=765.73ms p(95)=828.9ms  p(99.9)=1.2s    
       { expected_response:true }...: avg=388.57ms min=3.49ms  med=361.64ms max=1.46s    p(90)=765.73ms p(95)=828.9ms  p(99.9)=1.2s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 36888
     http_req_receiving.............: avg=83.14µs  min=31.36µs med=72.38µs  max=12.06ms  p(90)=112.18µs p(95)=127.97µs p(99.9)=1.02ms  
     http_req_sending...............: avg=31.06µs  min=5.44µs  med=14.47µs  max=103.72ms p(90)=22.22µs  p(95)=25.21µs  p(99.9)=2.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=388.46ms min=3.43ms  med=361.46ms max=1.46s    p(90)=765.63ms p(95)=828.83ms p(99.9)=1.2s    
     http_reqs......................: 36888   574.333319/s
     iteration_duration.............: avg=399.66ms min=20.02ms med=374.6ms  max=1.47s    p(90)=769.12ms p(95)=831.82ms p(99.9)=1.2s    
     iterations.....................: 35888   558.763668/s
     success_rate...................: 100.00% ✓ 35888      ✗ 0    
     vus............................: 67      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47445      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=14.8µs   min=1.38µs  med=3.59µs   max=14.13ms  p(90)=5.34µs   p(95)=6.81µs   p(99.9)=2.19ms
     http_req_connecting............: avg=9.48µs   min=0s      med=0s       max=14.06ms  p(90)=0s       p(95)=0s       p(99.9)=2.12ms
     http_req_duration..............: avg=851.13ms min=5.86ms  med=723.48ms max=18.23s   p(90)=1.46s    p(95)=1.64s    p(99.9)=17.54s
       { expected_response:true }...: avg=851.13ms min=5.86ms  med=723.48ms max=18.23s   p(90)=1.46s    p(95)=1.64s    p(99.9)=17.54s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16815
     http_req_receiving.............: avg=100.11µs min=36.07µs med=87.54µs  max=40.28ms  p(90)=126.14µs p(95)=141.76µs p(99.9)=1.87ms
     http_req_sending...............: avg=43.77µs  min=6.13µs  med=17.53µs  max=119.58ms p(90)=23.65µs  p(95)=28.04µs  p(99.9)=3.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=850.98ms min=5.74ms  med=723.11ms max=18.23s   p(90)=1.46s    p(95)=1.64s    p(99.9)=17.54s
     http_reqs......................: 16815   249.452725/s
     iteration_duration.............: avg=905.05ms min=21.59ms med=785.97ms max=18.23s   p(90)=1.48s    p(95)=1.65s    p(99.9)=17.56s
     iterations.....................: 15815   234.617594/s
     success_rate...................: 100.00% ✓ 15815      ✗ 0    
     vus............................: 78      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47697      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=24.59µs  min=1.17µs  med=2.89µs   max=8.96ms  p(90)=4.46µs   p(95)=5.71µs   p(99.9)=6.58ms  
     http_req_connecting............: avg=20µs     min=0s      med=0s       max=8.91ms  p(90)=0s       p(95)=0s       p(99.9)=6.44ms  
     http_req_duration..............: avg=403.5ms  min=7.49ms  med=463.76ms max=1.17s   p(90)=669.29ms p(95)=725.44ms p(99.9)=1s      
       { expected_response:true }...: avg=403.5ms  min=7.49ms  med=463.76ms max=1.17s   p(90)=669.29ms p(95)=725.44ms p(99.9)=1s      
     http_req_failed................: 0.00%   ✓ 0          ✗ 16899
     http_req_receiving.............: avg=86.18µs  min=35.33µs med=79.06µs  max=6ms     p(90)=116.45µs p(95)=129.26µs p(99.9)=888.48µs
     http_req_sending...............: avg=28.73µs  min=5µs     med=14.59µs  max=37.86ms p(90)=20.22µs  p(95)=24.48µs  p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=403.39ms min=7.41ms  med=463.7ms  max=1.17s   p(90)=669.21ms p(95)=725.37ms p(99.9)=1s      
     http_reqs......................: 16899   231.280144/s
     iteration_duration.............: avg=428.86ms min=8.56ms  med=483.49ms max=1.17s   p(90)=676.67ms p(95)=731.3ms  p(99.9)=1s      
     iterations.....................: 15899   217.594119/s
     success_rate...................: 100.00% ✓ 15899      ✗ 0    
     vus............................: 53      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438462      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=23.4µs   min=962ns  med=2.96µs  max=84.63ms  p(90)=4.87µs   p(95)=6.17µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=19.19µs  min=0s     med=0s      max=72.86ms  p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=96.62ms  min=1.46ms med=91.33ms max=312.19ms p(90)=187.95ms p(95)=204.83ms p(99.9)=268.01ms
       { expected_response:true }...: avg=96.62ms  min=1.46ms med=91.33ms max=312.19ms p(90)=187.95ms p(95)=204.83ms p(99.9)=268.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147154
     http_req_receiving.............: avg=158.48µs min=26.1µs med=58.26µs max=187.44ms p(90)=159.29µs p(95)=381.69µs p(99.9)=18.86ms 
     http_req_sending...............: avg=77.59µs  min=4.85µs med=11.85µs max=180.34ms p(90)=23.18µs  p(95)=136.62µs p(99.9)=9.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.38ms  min=1.39ms med=91.13ms max=312ms    p(90)=187.6ms  p(95)=204.36ms p(99.9)=266.41ms
     http_reqs......................: 147154  2380.830014/s
     iteration_duration.............: avg=97.56ms  min=4.08ms med=92.44ms max=350.96ms p(90)=188.51ms p(95)=205.43ms p(99.9)=269.05ms
     iterations.....................: 146154  2364.650841/s
     success_rate...................: 100.00% ✓ 146154      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423666      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=16.74µs  min=852ns   med=2.58µs   max=69.72ms  p(90)=4.36µs   p(95)=5.47µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=13.43µs  min=0s      med=0s       max=69.57ms  p(90)=0s       p(95)=0s       p(99.9)=1.1ms   
     http_req_duration..............: avg=100.02ms min=1.55ms  med=84.65ms  max=1.22s    p(90)=189.24ms p(95)=223.91ms p(99.9)=802.93ms
       { expected_response:true }...: avg=100.02ms min=1.55ms  med=84.65ms  max=1.22s    p(90)=189.24ms p(95)=223.91ms p(99.9)=802.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142222
     http_req_receiving.............: avg=2ms      min=53.42µs med=112.37µs max=927.65ms p(90)=1.94ms   p(95)=5.09ms   p(99.9)=207.67ms
     http_req_sending...............: avg=70.38µs  min=4.68µs  med=9.96µs   max=194.4ms  p(90)=19.81µs  p(95)=111.31µs p(99.9)=8.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.94ms  min=1.48ms  med=83.33ms  max=1.22s    p(90)=186.82ms p(95)=217.49ms p(99.9)=678.24ms
     http_reqs......................: 142222  2297.754094/s
     iteration_duration.............: avg=101.02ms min=2.98ms  med=85.7ms   max=1.22s    p(90)=189.95ms p(95)=224.9ms  p(99.9)=810.25ms
     iterations.....................: 141222  2281.597986/s
     success_rate...................: 100.00% ✓ 141222      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214962      ✗ 0    
     data_received..................: 6.4 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.14µs   min=971ns   med=2.51µs   max=9.21ms   p(90)=4.4µs    p(95)=5.38µs   p(99.9)=334.4µs 
     http_req_connecting............: avg=1.91µs   min=0s      med=0s       max=9.14ms   p(90)=0s       p(95)=0s       p(99.9)=305.06µs
     http_req_duration..............: avg=196.45ms min=2.06ms  med=196.07ms max=546.76ms p(90)=366.96ms p(95)=397.53ms p(99.9)=484.69ms
       { expected_response:true }...: avg=196.45ms min=2.06ms  med=196.07ms max=546.76ms p(90)=366.96ms p(95)=397.53ms p(99.9)=484.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72654
     http_req_receiving.............: avg=81.14µs  min=27.17µs med=63.86µs  max=148.9ms  p(90)=105.12µs p(95)=120.78µs p(99.9)=1.02ms  
     http_req_sending...............: avg=29.94µs  min=4.89µs  med=11.82µs  max=81.49ms  p(90)=20.27µs  p(95)=23.87µs  p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.34ms min=1.99ms  med=195.95ms max=546.67ms p(90)=366.85ms p(95)=397.42ms p(99.9)=484.31ms
     http_reqs......................: 72654   1159.68728/s
     iteration_duration.............: avg=199.43ms min=4.66ms  med=198.84ms max=546.94ms p(90)=367.92ms p(95)=398.38ms p(99.9)=485.04ms
     iterations.....................: 71654   1143.725498/s
     success_rate...................: 100.00% ✓ 71654       ✗ 0    
     vus............................: 86      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 102972     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   656 kB/s
     http_req_blocked...............: avg=6.93µs   min=932ns   med=2.66µs   max=11.45ms  p(90)=4.39µs   p(95)=5.42µs   p(99.9)=571.92µs
     http_req_connecting............: avg=3.31µs   min=0s      med=0s       max=11.38ms  p(90)=0s       p(95)=0s       p(99.9)=540.82µs
     http_req_duration..............: avg=406.28ms min=3.82ms  med=377.25ms max=1.54s    p(90)=805.6ms  p(95)=873.19ms p(99.9)=1.3s    
       { expected_response:true }...: avg=406.28ms min=3.82ms  med=377.25ms max=1.54s    p(90)=805.6ms  p(95)=873.19ms p(99.9)=1.3s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 35324
     http_req_receiving.............: avg=84.86µs  min=29.68µs med=73.29µs  max=11.95ms  p(90)=114.32µs p(95)=130.07µs p(99.9)=1.25ms  
     http_req_sending...............: avg=26.64µs  min=5.25µs  med=13.85µs  max=105.37ms p(90)=21.83µs  p(95)=24.82µs  p(99.9)=2.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=406.17ms min=3.73ms  med=377.13ms max=1.54s    p(90)=805.49ms p(95)=873.08ms p(99.9)=1.3s    
     http_reqs......................: 35324   546.364029/s
     iteration_duration.............: avg=418.35ms min=22.27ms med=392.23ms max=1.55s    p(90)=808.96ms p(95)=875.91ms p(99.9)=1.3s    
     iterations.....................: 34324   530.89681/s
     success_rate...................: 100.00% ✓ 34324      ✗ 0    
     vus............................: 85      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45465      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   286 kB/s
     http_req_blocked...............: avg=14.08µs  min=1.34µs  med=3.68µs   max=3.59ms  p(90)=5.41µs   p(95)=7.05µs   p(99.9)=2.19ms
     http_req_connecting............: avg=8.54µs   min=0s      med=0s       max=3.55ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms
     http_req_duration..............: avg=901.5ms  min=5.95ms  med=809.22ms max=5.08s   p(90)=1.8s     p(95)=2.03s    p(99.9)=4.58s 
       { expected_response:true }...: avg=901.5ms  min=5.95ms  med=809.22ms max=5.08s   p(90)=1.8s     p(95)=2.03s    p(99.9)=4.58s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16155
     http_req_receiving.............: avg=101.48µs min=38.31µs med=92.07µs  max=22.1ms  p(90)=130.44µs p(95)=146.54µs p(99.9)=1.15ms
     http_req_sending...............: avg=30.47µs  min=6.06µs  med=17.55µs  max=35.41ms p(90)=23.04µs  p(95)=28.37µs  p(99.9)=2.98ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=901.37ms min=5.82ms  med=809.12ms max=5.08s   p(90)=1.8s     p(95)=2.03s    p(99.9)=4.58s 
     http_reqs......................: 16155   238.484148/s
     iteration_duration.............: avg=960.97ms min=31.45ms med=879.94ms max=5.09s   p(90)=1.82s    p(95)=2.04s    p(99.9)=4.6s  
     iterations.....................: 15155   223.721898/s
     success_rate...................: 100.00% ✓ 15155      ✗ 0    
     vus............................: 90      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 44637      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=14.11µs  min=1.13µs  med=3.25µs   max=3.16ms   p(90)=5µs      p(95)=6.76µs   p(99.9)=2.27ms
     http_req_connecting............: avg=9.15µs   min=0s      med=0s       max=3.11ms   p(90)=0s       p(95)=0s       p(99.9)=2.21ms
     http_req_duration..............: avg=914.94ms min=7.93ms  med=845.43ms max=3.14s    p(90)=1.87s    p(95)=1.98s    p(99.9)=2.88s 
       { expected_response:true }...: avg=914.94ms min=7.93ms  med=845.43ms max=3.14s    p(90)=1.87s    p(95)=1.98s    p(99.9)=2.88s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15879
     http_req_receiving.............: avg=99.6µs   min=34.94µs med=90.48µs  max=33.15ms  p(90)=130.97µs p(95)=146.98µs p(99.9)=1.03ms
     http_req_sending...............: avg=46.31µs  min=5.44µs  med=17.32µs  max=137.08ms p(90)=23.01µs  p(95)=27.8µs   p(99.9)=4.35ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=914.79ms min=7.8ms   med=845.31ms max=3.14s    p(90)=1.87s    p(95)=1.98s    p(99.9)=2.88s 
     http_reqs......................: 15879   230.543931/s
     iteration_duration.............: avg=976.41ms min=28.11ms med=909.36ms max=3.14s    p(90)=1.88s    p(95)=1.98s    p(99.9)=2.92s 
     iterations.....................: 14879   216.025137/s
     success_rate...................: 100.00% ✓ 14879      ✗ 0    
     vus............................: 14      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

