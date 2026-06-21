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
| hive-router | v0.0.72 | 2,685 | 2,796 | 2,622 | 2.2% |  |
| fusion-nightly | 16.3.0-p.1 | 2,092 | 2,139 | 2,083 | 0.9% |  |
| fusion | 16.2.2 | 2,038 | 2,092 | 2,018 | 1.2% |  |
| cosmo | 0.324.0 | 1,100 | 1,119 | 1,089 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 522 | 527 | 518 | 0.5% |  |
| hive-gateway | 2.9.0 | 222 | 224 | 221 | 0.4% |  |
| apollo-gateway | 2.14.1 | 203 | 206 | 202 | 0.6% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (10506 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (475682 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,159 | 2,257 | 2,124 | 2.0% |  |
| fusion-nightly | 16.3.0-p.1 | 1,952 | 1,997 | 1,940 | 1.0% |  |
| fusion | 16.2.2 | 1,921 | 1,966 | 1,904 | 1.0% |  |
| cosmo | 0.324.0 | 1,038 | 1,063 | 1,029 | 1.0% |  |
| hive-gateway-router-runtime | 2.9.0 | 495 | 502 | 491 | 0.7% |  |
| hive-gateway | 2.9.0 | 223 | 227 | 221 | 0.8% |  |
| apollo-gateway | 2.14.1 | 207 | 210 | 207 | 0.5% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (31495 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (335691 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 495519      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=40.91µs  min=1.05µs med=2.65µs  max=142.43ms p(90)=4.26µs   p(95)=5.37µs   p(99.9)=11.35ms 
     http_req_connecting............: avg=37.29µs  min=0s     med=0s      max=142.29ms p(90)=0s       p(95)=0s       p(99.9)=11.23ms 
     http_req_duration..............: avg=85.47ms  min=1.47ms med=77.95ms max=297.44ms p(90)=167.83ms p(95)=186.34ms p(99.9)=244.81ms
       { expected_response:true }...: avg=85.47ms  min=1.47ms med=77.95ms max=297.44ms p(90)=167.83ms p(95)=186.34ms p(99.9)=244.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166173
     http_req_receiving.............: avg=475.86µs min=28.1µs med=57.02µs max=123.28ms p(90)=241.01µs p(95)=437.85µs p(99.9)=58.6ms  
     http_req_sending...............: avg=94.53µs  min=5.2µs  med=10.22µs max=121.02ms p(90)=19.46µs  p(95)=139.05µs p(99.9)=15.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.9ms   min=1.42ms med=77.49ms max=286.07ms p(90)=167ms    p(95)=184.6ms  p(99.9)=240.08ms
     http_reqs......................: 166173  2685.362807/s
     iteration_duration.............: avg=86.3ms   min=2.46ms med=78.81ms max=313.83ms p(90)=168.35ms p(95)=187.05ms p(99.9)=247.13ms
     iterations.....................: 165173  2669.202764/s
     success_rate...................: 100.00% ✓ 165173      ✗ 0     
     vus............................: 51      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 390279      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=21.9µs   min=1.07µs  med=2.66µs   max=69.06ms  p(90)=4.16µs   p(95)=5.26µs   p(99.9)=6.16ms  
     http_req_connecting............: avg=18.62µs  min=0s      med=0s       max=68.84ms  p(90)=0s       p(95)=0s       p(99.9)=6.02ms  
     http_req_duration..............: avg=108.52ms min=2.29ms  med=101.66ms max=594.75ms p(90)=209.38ms p(95)=235.96ms p(99.9)=420.6ms 
       { expected_response:true }...: avg=108.52ms min=2.29ms  med=101.66ms max=594.75ms p(90)=209.38ms p(95)=235.96ms p(99.9)=420.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 131093
     http_req_receiving.............: avg=2.15ms   min=53.15µs med=277.06µs max=251.11ms p(90)=3.04ms   p(95)=6.97ms   p(99.9)=129.74ms
     http_req_sending...............: avg=69.58µs  min=5.49µs  med=10.23µs  max=88.92ms  p(90)=19.33µs  p(95)=126.9µs  p(99.9)=9.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.29ms min=2.19ms  med=99.82ms  max=587.41ms p(90)=206.51ms p(95)=231.89ms p(99.9)=373.7ms 
     http_reqs......................: 131093  2092.427205/s
     iteration_duration.............: avg=109.64ms min=3.32ms  med=102.89ms max=603.49ms p(90)=210.03ms p(95)=236.64ms p(99.9)=421.8ms 
     iterations.....................: 130093  2076.465809/s
     success_rate...................: 100.00% ✓ 130093      ✗ 0     
     vus............................: 86      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 380607      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.4 MB/s
     http_req_blocked...............: avg=20.7µs   min=992ns   med=2.63µs  max=128.85ms p(90)=4.17µs   p(95)=5.21µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=17.36µs  min=0s      med=0s      max=128.81ms p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=111.29ms min=2.37ms  med=98.57ms max=687.68ms p(90)=224.35ms p(95)=267.19ms p(99.9)=478.53ms
       { expected_response:true }...: avg=111.29ms min=2.37ms  med=98.57ms max=687.68ms p(90)=224.35ms p(95)=267.19ms p(99.9)=478.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127869
     http_req_receiving.............: avg=3.48ms   min=51.92µs med=146.8µs max=352.62ms p(90)=4.53ms   p(95)=12.14ms  p(99.9)=180.97ms
     http_req_sending...............: avg=76.85µs  min=5.52µs  med=10.29µs max=100.18ms p(90)=18.65µs  p(95)=120.78µs p(99.9)=11.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.73ms min=2.27ms  med=96.53ms max=680.05ms p(90)=217.15ms p(95)=255.46ms p(99.9)=442.39ms
     http_reqs......................: 127869  2038.549157/s
     iteration_duration.............: avg=112.47ms min=3.32ms  med=99.83ms max=687.9ms  p(90)=225.37ms p(95)=267.9ms  p(99.9)=479.48ms
     iterations.....................: 126869  2022.606676/s
     success_rate...................: 100.00% ✓ 126869      ✗ 0     
     vus............................: 91      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 203388      ✗ 0    
     data_received..................: 6.0 GB  97 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=6.9µs    min=1.15µs  med=2.57µs   max=18.75ms  p(90)=4.12µs   p(95)=5.03µs   p(99.9)=649.54µs
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=18.69ms  p(90)=0s       p(95)=0s       p(99.9)=584.7µs 
     http_req_duration..............: avg=207.49ms min=2.05ms  med=208.41ms max=634.75ms p(90)=387.97ms p(95)=416.88ms p(99.9)=534.91ms
       { expected_response:true }...: avg=207.49ms min=2.05ms  med=208.41ms max=634.75ms p(90)=387.97ms p(95)=416.88ms p(99.9)=534.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68796
     http_req_receiving.............: avg=81.38µs  min=30.76µs med=65.09µs  max=77.17ms  p(90)=99.43µs  p(95)=114.04µs p(99.9)=1.75ms  
     http_req_sending...............: avg=35.37µs  min=5.73µs  med=11.09µs  max=150.13ms p(90)=16.98µs  p(95)=20.56µs  p(99.9)=4.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.37ms min=1.99ms  med=208.31ms max=634.64ms p(90)=387.88ms p(95)=416.77ms p(99.9)=534.86ms
     http_reqs......................: 68796   1100.874554/s
     iteration_duration.............: avg=210.79ms min=5.75ms  med=211.94ms max=634.97ms p(90)=389ms    p(95)=417.48ms p(99.9)=536.09ms
     iterations.....................: 67796   1084.87254/s
     success_rate...................: 100.00% ✓ 67796       ✗ 0    
     vus............................: 80      min=0         max=495
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98433      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   627 kB/s
     http_req_blocked...............: avg=11.26µs  min=1.21µs  med=3.15µs   max=52.73ms  p(90)=5.08µs   p(95)=6.27µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=7.01µs   min=0s      med=0s       max=52.65ms  p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=424.49ms min=3.89ms  med=397.37ms max=1.48s    p(90)=839.41ms p(95)=912.56ms p(99.9)=1.28s   
       { expected_response:true }...: avg=424.49ms min=3.89ms  med=397.37ms max=1.48s    p(90)=839.41ms p(95)=912.56ms p(99.9)=1.28s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33811
     http_req_receiving.............: avg=93.52µs  min=34.04µs med=79.11µs  max=126.12ms p(90)=117.31µs p(95)=132.23µs p(99.9)=864.83µs
     http_req_sending...............: avg=39.55µs  min=6.06µs  med=13.93µs  max=210.72ms p(90)=22µs     p(95)=25.68µs  p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=424.36ms min=3.82ms  med=397.28ms max=1.48s    p(90)=839.26ms p(95)=912.42ms p(99.9)=1.28s   
     http_reqs......................: 33811   522.323272/s
     iteration_duration.............: avg=437.67ms min=11.83ms med=411.32ms max=1.49s    p(90)=843.41ms p(95)=915.46ms p(99.9)=1.29s   
     iterations.....................: 32811   506.874948/s
     success_rate...................: 100.00% ✓ 32811      ✗ 0    
     vus............................: 89      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42705     ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   268 kB/s
     http_req_blocked...............: avg=17.08µs  min=1.32µs  med=4.02µs   max=8.55ms   p(90)=6.1µs    p(95)=7.79µs   p(99.9)=2.64ms  
     http_req_connecting............: avg=10.89µs  min=0s      med=0s       max=5.67ms   p(90)=0s       p(95)=0s       p(99.9)=2.6ms   
     http_req_duration..............: avg=919.95ms min=6.7ms   med=824.42ms max=21.79s   p(90)=1.55s    p(95)=1.74s    p(99.9)=19.16s  
       { expected_response:true }...: avg=919.95ms min=6.7ms   med=824.42ms max=21.79s   p(90)=1.55s    p(95)=1.74s    p(99.9)=19.16s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 15235
     http_req_receiving.............: avg=134.72µs min=33.94µs med=105.13µs max=186.79ms p(90)=145.06µs p(95)=159.78µs p(99.9)=882.97µs
     http_req_sending...............: avg=56.88µs  min=6.5µs   med=19.74µs  max=165.9ms  p(90)=26.26µs  p(95)=31.55µs  p(99.9)=4.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=919.76ms min=6.58ms  med=824.29ms max=21.79s   p(90)=1.55s    p(95)=1.74s    p(99.9)=19.16s  
     http_reqs......................: 15235   222.06674/s
     iteration_duration.............: avg=984.57ms min=63.86ms med=896.44ms max=21.79s   p(90)=1.58s    p(95)=1.75s    p(99.9)=19.18s  
     iterations.....................: 14235   207.49065/s
     success_rate...................: 100.00% ✓ 14235     ✗ 0    
     vus............................: 95      min=0       max=500
     vus_max........................: 500     min=500     max=500
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

     checks.........................: 100.00% ✓ 42408     ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=14.45µs  min=1.26µs  med=3.56µs   max=3.96ms p(90)=5.33µs   p(95)=7.17µs   p(99.9)=2.32ms
     http_req_connecting............: avg=9.02µs   min=0s      med=0s       max=3.88ms p(90)=0s       p(95)=0s       p(99.9)=2.3ms 
     http_req_duration..............: avg=422.14ms min=8.56ms  med=459.55ms max=1.32s  p(90)=745.28ms p(95)=819.93ms p(99.9)=1.15s 
       { expected_response:true }...: avg=422.14ms min=8.56ms  med=459.55ms max=1.32s  p(90)=745.28ms p(95)=819.93ms p(99.9)=1.15s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 15136
     http_req_receiving.............: avg=115.12µs min=35.55µs med=92.72µs  max=40ms   p(90)=132.2µs  p(95)=146.29µs p(99.9)=1.95ms
     http_req_sending...............: avg=28.63µs  min=5.95µs  med=16.94µs  max=9.93ms p(90)=23.29µs  p(95)=28.17µs  p(99.9)=2.94ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=422ms    min=8.46ms  med=459.45ms max=1.32s  p(90)=745.17ms p(95)=819.82ms p(99.9)=1.15s 
     http_reqs......................: 15136   203.23123/s
     iteration_duration.............: avg=451.83ms min=8.93ms  med=480.66ms max=1.32s  p(90)=752.53ms p(95)=825.28ms p(99.9)=1.16s 
     iterations.....................: 14136   189.80422/s
     success_rate...................: 100.00% ✓ 14136     ✗ 0    
     vus............................: 73      min=0       max=497
     vus_max........................: 500     min=500     max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 399435      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=18.64µs  min=1.05µs med=2.71µs   max=52.36ms  p(90)=4.51µs   p(95)=5.7µs    p(99.9)=1.2ms   
     http_req_connecting............: avg=15µs     min=0s     med=0s       max=52.29ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=106.03ms min=1.68ms med=100.52ms max=334.35ms p(90)=204.85ms p(95)=222.11ms p(99.9)=273.53ms
       { expected_response:true }...: avg=106.03ms min=1.68ms med=100.52ms max=334.35ms p(90)=204.85ms p(95)=222.11ms p(99.9)=273.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134145
     http_req_receiving.............: avg=214.65µs min=29.3µs med=62.05µs  max=207.51ms p(90)=167.64µs p(95)=416.31µs p(99.9)=27.16ms 
     http_req_sending...............: avg=78.05µs  min=5.45µs med=11.32µs  max=242.1ms  p(90)=21.38µs  p(95)=140.05µs p(99.9)=10.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.74ms min=1.63ms med=100.24ms max=297.31ms p(90)=204.42ms p(95)=221.56ms p(99.9)=270.91ms
     http_reqs......................: 134145  2159.520993/s
     iteration_duration.............: avg=107.12ms min=3.25ms med=101.73ms max=426ms    p(90)=205.39ms p(95)=222.62ms p(99.9)=274.77ms
     iterations.....................: 133145  2143.422585/s
     success_rate...................: 100.00% ✓ 133145      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 360843      ✗ 0     
     data_received..................: 11 GB   171 MB/s
     data_sent......................: 146 MB  2.3 MB/s
     http_req_blocked...............: avg=16.95µs  min=1.04µs  med=2.74µs   max=52.84ms  p(90)=4.44µs   p(95)=5.64µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=13.55µs  min=0s      med=0s       max=52.78ms  p(90)=0s       p(95)=0s       p(99.9)=2.15ms  
     http_req_duration..............: avg=117.36ms min=1.69ms  med=111.04ms max=526.38ms p(90)=225.92ms p(95)=249.96ms p(99.9)=380.36ms
       { expected_response:true }...: avg=117.36ms min=1.69ms  med=111.04ms max=526.38ms p(90)=225.92ms p(95)=249.96ms p(99.9)=380.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 121281
     http_req_receiving.............: avg=1.89ms   min=53.94µs med=324.7µs  max=229.67ms p(90)=3.17ms   p(95)=6.43ms   p(99.9)=101.4ms 
     http_req_sending...............: avg=65.81µs  min=5.39µs  med=10.83µs  max=62.42ms  p(90)=20.81µs  p(95)=126.64µs p(99.9)=9.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.4ms  min=1.59ms  med=108.99ms max=526.24ms p(90)=223.4ms  p(95)=246.41ms p(99.9)=370.52ms
     http_reqs......................: 121281  1952.570122/s
     iteration_duration.............: avg=118.62ms min=3.18ms  med=112.45ms max=526.59ms p(90)=226.62ms p(95)=250.63ms p(99.9)=382.31ms
     iterations.....................: 120281  1936.470567/s
     success_rate...................: 100.00% ✓ 120281      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 355365      ✗ 0     
     data_received..................: 11 GB   168 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=17.12µs  min=1.04µs  med=2.75µs   max=64.18ms  p(90)=4.46µs   p(95)=5.62µs   p(99.9)=2.21ms  
     http_req_connecting............: avg=13.19µs  min=0s      med=0s       max=64.03ms  p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=119.16ms min=1.77ms  med=108.69ms max=803.64ms p(90)=230.44ms p(95)=265.48ms p(99.9)=515.98ms
       { expected_response:true }...: avg=119.16ms min=1.77ms  med=108.69ms max=803.64ms p(90)=230.44ms p(95)=265.48ms p(99.9)=515.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119455
     http_req_receiving.............: avg=2.66ms   min=53.28µs med=141.79µs max=461.8ms  p(90)=3.5ms    p(95)=8.69ms   p(99.9)=189.71ms
     http_req_sending...............: avg=63.11µs  min=5.39µs  med=10.89µs  max=134.88ms p(90)=20.3µs   p(95)=118.34µs p(99.9)=8.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.43ms min=1.69ms  med=106.63ms max=644.26ms p(90)=226.04ms p(95)=257.55ms p(99.9)=450.52ms
     http_reqs......................: 119455  1921.461409/s
     iteration_duration.............: avg=120.47ms min=2.87ms  med=110.16ms max=805.64ms p(90)=231.13ms p(95)=266.44ms p(99.9)=516.38ms
     iterations.....................: 118455  1905.376177/s
     success_rate...................: 100.00% ✓ 118455      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 192309      ✗ 0    
     data_received..................: 5.7 GB  91 MB/s
     data_sent......................: 78 MB   1.2 MB/s
     http_req_blocked...............: avg=6.24µs   min=1.05µs  med=2.38µs   max=6.99ms   p(90)=4.1µs    p(95)=5.11µs   p(99.9)=617.11µs
     http_req_connecting............: avg=3.14µs   min=0s      med=0s       max=6.93ms   p(90)=0s       p(95)=0s       p(99.9)=545.1µs 
     http_req_duration..............: avg=219.29ms min=2.18ms  med=220.87ms max=675.92ms p(90)=407.04ms p(95)=436.7ms  p(99.9)=541.58ms
       { expected_response:true }...: avg=219.29ms min=2.18ms  med=220.87ms max=675.92ms p(90)=407.04ms p(95)=436.7ms  p(99.9)=541.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 65103
     http_req_receiving.............: avg=84.74µs  min=31.17µs med=69.22µs  max=37.97ms  p(90)=108.39µs p(95)=124.5µs  p(99.9)=1.55ms  
     http_req_sending...............: avg=27.58µs  min=5.56µs  med=11.1µs   max=31.12ms  p(90)=17.79µs  p(95)=21.27µs  p(99.9)=3.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=219.18ms min=2.12ms  med=220.75ms max=675.85ms p(90)=406.95ms p(95)=436.57ms p(99.9)=541.49ms
     http_reqs......................: 65103   1038.100781/s
     iteration_duration.............: avg=222.96ms min=4.84ms  med=224.76ms max=676.1ms  p(90)=408.16ms p(95)=437.61ms p(99.9)=542.38ms
     iterations.....................: 64103   1022.155267/s
     success_rate...................: 100.00% ✓ 64103       ✗ 0    
     vus............................: 91      min=0         max=499
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93705      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   594 kB/s
     http_req_blocked...............: avg=11.56µs  min=1.21µs  med=3.43µs   max=46.13ms  p(90)=5.37µs   p(95)=6.43µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=7.08µs   min=0s      med=0s       max=46.05ms  p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=445.43ms min=4.11ms  med=412.75ms max=1.71s    p(90)=879.54ms p(95)=959.55ms p(99.9)=1.37s   
       { expected_response:true }...: avg=445.43ms min=4.11ms  med=412.75ms max=1.71s    p(90)=879.54ms p(95)=959.55ms p(99.9)=1.37s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32235
     http_req_receiving.............: avg=102.09µs min=32.82µs med=84.61µs  max=143.99ms p(90)=122.02µs p(95)=137.32µs p(99.9)=931.89µs
     http_req_sending...............: avg=32.88µs  min=6.11µs  med=15.61µs  max=89.56ms  p(90)=23.24µs  p(95)=26.93µs  p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=445.3ms  min=4.04ms  med=412.65ms max=1.7s     p(90)=879.44ms p(95)=959.44ms p(99.9)=1.37s   
     http_reqs......................: 32235   495.045013/s
     iteration_duration.............: avg=459.94ms min=35.86ms med=430.43ms max=1.71s    p(90)=884.1ms  p(95)=963.23ms p(99.9)=1.38s   
     iterations.....................: 31235   479.687637/s
     success_rate...................: 100.00% ✓ 31235      ✗ 0    
     vus............................: 61      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42819      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   269 kB/s
     http_req_blocked...............: avg=15.75µs  min=1.13µs  med=4.03µs   max=4.37ms p(90)=6.08µs   p(95)=7.85µs   p(99.9)=2.57ms
     http_req_connecting............: avg=9.87µs   min=0s      med=0s       max=4.28ms p(90)=0s       p(95)=0s       p(99.9)=2.54ms
     http_req_duration..............: avg=955.93ms min=6.41ms  med=863.95ms max=5.51s  p(90)=1.9s     p(95)=2.14s    p(99.9)=5.1s  
       { expected_response:true }...: avg=955.93ms min=6.41ms  med=863.95ms max=5.51s  p(90)=1.9s     p(95)=2.14s    p(99.9)=5.1s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15273
     http_req_receiving.............: avg=114.37µs min=34.68µs med=104.13µs max=30.8ms p(90)=142.89µs p(95)=156.33µs p(99.9)=1.02ms
     http_req_sending...............: avg=31.89µs  min=5.97µs  med=19.22µs  max=9.57ms p(90)=25.53µs  p(95)=31.44µs  p(99.9)=3.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=955.78ms min=6.25ms  med=863.84ms max=5.51s  p(90)=1.9s     p(95)=2.14s    p(99.9)=5.1s  
     http_reqs......................: 15273   223.754169/s
     iteration_duration.............: avg=1.02s    min=25.17ms med=942.62ms max=5.52s  p(90)=1.92s    p(95)=2.16s    p(99.9)=5.12s 
     iterations.....................: 14273   209.10386/s
     success_rate...................: 100.00% ✓ 14273      ✗ 0    
     vus............................: 71      min=0        max=500
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

     checks.........................: 100.00% ✓ 40626      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   249 kB/s
     http_req_blocked...............: avg=13.76µs  min=1.28µs  med=3.65µs   max=9.96ms  p(90)=5.48µs   p(95)=7.45µs   p(99.9)=1.4ms 
     http_req_connecting............: avg=8.05µs   min=0s      med=0s       max=9.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.33ms
     http_req_duration..............: avg=1s       min=8.86ms  med=908.35ms max=4.21s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.71s 
       { expected_response:true }...: avg=1s       min=8.86ms  med=908.35ms max=4.21s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.71s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14542
     http_req_receiving.............: avg=116.02µs min=32.51µs med=96.08µs  max=86.62ms p(90)=137.54µs p(95)=149.96µs p(99.9)=1.31ms
     http_req_sending...............: avg=52.79µs  min=6.06µs  med=18.02µs  max=87.27ms p(90)=24.08µs  p(95)=29.86µs  p(99.9)=3.2ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=8.75ms  med=908.24ms max=4.21s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.71s 
     http_reqs......................: 14542   207.460669/s
     iteration_duration.............: avg=1.07s    min=75.67ms med=991.66ms max=4.21s   p(90)=2.06s    p(95)=2.19s    p(99.9)=3.72s 
     iterations.....................: 13542   193.19436/s
     success_rate...................: 100.00% ✓ 13542      ✗ 0    
     vus............................: 60      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

