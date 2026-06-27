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
| hive-router | v0.0.72 | 2,621 | 2,739 | 2,588 | 1.9% |  |
| fusion | 16.3.0 | 2,050 | 2,097 | 2,003 | 1.4% |  |
| cosmo | 0.326.0 | 1,104 | 1,122 | 1,092 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 501 | 508 | 496 | 0.8% |  |
| hive-gateway | 2.9.0 | 219 | 224 | 216 | 1.2% |  |
| apollo-gateway | 2.14.1 | 198 | 203 | 196 | 1.1% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (13107 across 9/9 runs) |
| fusion-nightly | — | — | — | — | — | benchmark run failed |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (474309 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,247 | 2,324 | 2,182 | 2.3% |  |
| fusion | 16.3.0 | 1,910 | 1,973 | 1,894 | 1.4% |  |
| cosmo | 0.326.0 | 1,053 | 1,072 | 1,044 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 479 | 492 | 475 | 1.2% |  |
| hive-gateway | 2.9.0 | 215 | 220 | 212 | 1.0% |  |
| apollo-gateway | 2.14.1 | 201 | 206 | 199 | 1.0% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (30541 across 9/9 runs) |
| fusion-nightly | — | — | — | — | — | benchmark run failed |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (357514 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 483972      ✗ 0     
     data_received..................: 14 GB   230 MB/s
     data_sent......................: 195 MB  3.1 MB/s
     http_req_blocked...............: avg=27.75µs  min=962ns  med=2.17µs  max=216.41ms p(90)=3.54µs   p(95)=4.58µs   p(99.9)=5.79ms  
     http_req_connecting............: avg=24.78µs  min=0s     med=0s      max=213.77ms p(90)=0s       p(95)=0s       p(99.9)=5.72ms  
     http_req_duration..............: avg=87.52ms  min=1.58ms med=80.93ms max=335.13ms p(90)=169.6ms  p(95)=184.57ms p(99.9)=239.66ms
       { expected_response:true }...: avg=87.52ms  min=1.58ms med=80.93ms max=335.13ms p(90)=169.6ms  p(95)=184.57ms p(99.9)=239.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162324
     http_req_receiving.............: avg=302.29µs min=28.6µs med=56.88µs max=116.98ms p(90)=191.43µs p(95)=396.23µs p(99.9)=39.77ms 
     http_req_sending...............: avg=78.64µs  min=5.1µs  med=9.73µs  max=157.88ms p(90)=17.52µs  p(95)=128.46µs p(99.9)=11ms    
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.14ms  min=1.52ms med=80.61ms max=273.84ms p(90)=169ms    p(95)=183.82ms p(99.9)=236.97ms
     http_reqs......................: 162324  2621.133514/s
     iteration_duration.............: avg=88.37ms  min=2.81ms med=81.94ms max=375.3ms  p(90)=170.12ms p(95)=185.13ms p(99.9)=241.86ms
     iterations.....................: 161324  2604.985973/s
     success_rate...................: 100.00% ✓ 161324      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 382710      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=17.27µs  min=1µs     med=2.29µs   max=92.62ms  p(90)=3.73µs   p(95)=4.72µs   p(99.9)=2.04ms  
     http_req_connecting............: avg=14.28µs  min=0s      med=0s       max=92.46ms  p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=110.68ms min=2.33ms  med=98.9ms   max=918.34ms p(90)=221.26ms p(95)=264.46ms p(99.9)=530.16ms
       { expected_response:true }...: avg=110.68ms min=2.33ms  med=98.9ms   max=918.34ms p(90)=221.26ms p(95)=264.46ms p(99.9)=530.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128570
     http_req_receiving.............: avg=3.36ms   min=52.08µs med=149.19µs max=340.65ms p(90)=4.42ms   p(95)=12.18ms  p(99.9)=152.83ms
     http_req_sending...............: avg=64.29µs  min=5.24µs  med=9.67µs   max=172.9ms  p(90)=17.59µs  p(95)=112.3µs  p(99.9)=8.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.25ms min=2.24ms  med=96.54ms  max=914.64ms p(90)=214.89ms p(95)=252.61ms p(99.9)=500.26ms
     http_reqs......................: 128570  2050.692183/s
     iteration_duration.............: avg=111.83ms min=3.44ms  med=100.34ms max=918.47ms p(90)=222.22ms p(95)=265.47ms p(99.9)=532.94ms
     iterations.....................: 127570  2034.742178/s
     success_rate...................: 100.00% ✓ 127570      ✗ 0     
     vus............................: 91      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 204240      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=8.9µs    min=1.06µs  med=2.53µs   max=59.47ms  p(90)=4.1µs    p(95)=5.02µs   p(99.9)=803.46µs
     http_req_connecting............: avg=5.65µs   min=0s      med=0s       max=59.42ms  p(90)=0s       p(95)=0s       p(99.9)=718.6µs 
     http_req_duration..............: avg=206.61ms min=2.05ms  med=205.96ms max=611.29ms p(90)=382.34ms p(95)=409.38ms p(99.9)=509.54ms
       { expected_response:true }...: avg=206.61ms min=2.05ms  med=205.96ms max=611.29ms p(90)=382.34ms p(95)=409.38ms p(99.9)=509.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69080
     http_req_receiving.............: avg=83.69µs  min=30.06µs med=66.12µs  max=146.1ms  p(90)=101.95µs p(95)=116.69µs p(99.9)=1.63ms  
     http_req_sending...............: avg=32.9µs   min=5.62µs  med=11.08µs  max=125.23ms p(90)=17.06µs  p(95)=20.6µs   p(99.9)=3.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.49ms min=1.94ms  med=205.81ms max=611.21ms p(90)=382.24ms p(95)=409.27ms p(99.9)=509.43ms
     http_reqs......................: 69080   1104.919681/s
     iteration_duration.............: avg=209.89ms min=4.93ms  med=209.8ms  max=611.49ms p(90)=383.31ms p(95)=410.25ms p(99.9)=510.44ms
     iterations.....................: 68080   1088.924897/s
     success_rate...................: 100.00% ✓ 68080       ✗ 0    
     vus............................: 81      min=0         max=495
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

     checks.........................: 100.00% ✓ 94545      ✗ 0    
     data_received..................: 2.9 GB  44 MB/s
     data_sent......................: 39 MB   602 kB/s
     http_req_blocked...............: avg=8.86µs   min=1.2µs   med=2.76µs   max=6.25ms  p(90)=4.52µs   p(95)=5.48µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=5.1µs    min=0s      med=0s       max=6.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=441.38ms min=3.88ms  med=409.32ms max=2.2s    p(90)=868.26ms p(95)=938.84ms p(99.9)=1.42s   
       { expected_response:true }...: avg=441.38ms min=3.88ms  med=409.32ms max=2.2s    p(90)=868.26ms p(95)=938.84ms p(99.9)=1.42s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32515
     http_req_receiving.............: avg=87.8µs   min=33.24µs med=75.95µs  max=68.58ms p(90)=112.4µs  p(95)=125.63µs p(99.9)=979.46µs
     http_req_sending...............: avg=27.85µs  min=5.59µs  med=12.83µs  max=79.97ms p(90)=19.81µs  p(95)=23.31µs  p(99.9)=1.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=441.27ms min=3.83ms  med=409.22ms max=2.2s    p(90)=868.09ms p(95)=938.72ms p(99.9)=1.42s   
     http_reqs......................: 32515   501.799605/s
     iteration_duration.............: avg=455.59ms min=31.31ms med=427.59ms max=2.21s   p(90)=872.37ms p(95)=942.18ms p(99.9)=1.42s   
     iterations.....................: 31515   486.36674/s
     success_rate...................: 100.00% ✓ 31515      ✗ 0    
     vus............................: 94      min=0        max=500
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

     checks.........................: 100.00% ✓ 42237      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   264 kB/s
     http_req_blocked...............: avg=17.81µs  min=1.38µs  med=3.64µs   max=28.62ms p(90)=5.5µs    p(95)=7.36µs   p(99.9)=3.09ms  
     http_req_connecting............: avg=12.45µs  min=0s      med=0s       max=28.55ms p(90)=0s       p(95)=0s       p(99.9)=3.07ms  
     http_req_duration..............: avg=937.46ms min=6.79ms  med=809.55ms max=21.39s  p(90)=1.59s    p(95)=1.75s    p(99.9)=20.57s  
       { expected_response:true }...: avg=937.46ms min=6.79ms  med=809.55ms max=21.39s  p(90)=1.59s    p(95)=1.75s    p(99.9)=20.57s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15079
     http_req_receiving.............: avg=105µs    min=34.21µs med=96.49µs  max=24.13ms p(90)=136.12µs p(95)=148.82µs p(99.9)=939.47µs
     http_req_sending...............: avg=29.17µs  min=6.6µs   med=17.38µs  max=23.3ms  p(90)=23.7µs   p(95)=29.01µs  p(99.9)=3.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=937.32ms min=6.67ms  med=809.45ms max=21.39s  p(90)=1.59s    p(95)=1.75s    p(99.9)=20.57s  
     http_reqs......................: 15079   219.168216/s
     iteration_duration.............: avg=1s       min=67.85ms med=895.88ms max=21.39s  p(90)=1.61s    p(95)=1.77s    p(99.9)=20.6s   
     iterations.....................: 14079   204.633551/s
     success_rate...................: 100.00% ✓ 14079      ✗ 0    
     vus............................: 113     min=0        max=500
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

     checks.........................: 100.00% ✓ 41382      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   244 kB/s
     http_req_blocked...............: avg=15.37µs  min=1.28µs  med=3.16µs   max=33.01ms  p(90)=4.76µs   p(95)=6.29µs   p(99.9)=1.89ms 
     http_req_connecting............: avg=10.11µs  min=0s      med=0s       max=32.95ms  p(90)=0s       p(95)=0s       p(99.9)=1.72ms 
     http_req_duration..............: avg=440.16ms min=8.67ms  med=451.4ms  max=1.31s    p(90)=777.14ms p(95)=836.32ms p(99.9)=1.17s  
       { expected_response:true }...: avg=440.16ms min=8.67ms  med=451.4ms  max=1.31s    p(90)=777.14ms p(95)=836.32ms p(99.9)=1.17s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14794
     http_req_receiving.............: avg=173.29µs min=35.18µs med=87.66µs  max=99.55ms  p(90)=126.2µs  p(95)=139.74µs p(99.9)=33.46ms
     http_req_sending...............: avg=37.8µs   min=6.04µs  med=15.38µs  max=145.15ms p(90)=21.73µs  p(95)=25.91µs  p(99.9)=2.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=439.94ms min=8.55ms  med=451.28ms max=1.31s    p(90)=777.01ms p(95)=836.19ms p(99.9)=1.17s  
     http_reqs......................: 14794   198.697187/s
     iteration_duration.............: avg=471.98ms min=9.24ms  med=479.14ms max=1.31s    p(90)=782.19ms p(95)=843.26ms p(99.9)=1.19s  
     iterations.....................: 13794   185.266257/s
     success_rate...................: 100.00% ✓ 13794      ✗ 0    
     vus............................: 72      min=0        max=495
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 416208      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=28.11µs  min=982ns   med=2.44µs  max=70.99ms  p(90)=4.26µs   p(95)=5.58µs   p(99.9)=3.03ms  
     http_req_connecting............: avg=24.8µs   min=0s      med=0s      max=70.8ms   p(90)=0s       p(95)=0s       p(99.9)=2.95ms  
     http_req_duration..............: avg=101.74ms min=1.71ms  med=97.02ms max=388.84ms p(90)=193.76ms p(95)=212.2ms  p(99.9)=273.3ms 
       { expected_response:true }...: avg=101.74ms min=1.71ms  med=97.02ms max=388.84ms p(90)=193.76ms p(95)=212.2ms  p(99.9)=273.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139736
     http_req_receiving.............: avg=300.87µs min=30.57µs med=61.53µs max=282.99ms p(90)=197.57µs p(95)=433.19µs p(99.9)=30.2ms  
     http_req_sending...............: avg=82.07µs  min=5.44µs  med=10.92µs max=273.88ms p(90)=21.93µs  p(95)=140.78µs p(99.9)=11.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.35ms min=1.67ms  med=96.78ms max=306.24ms p(90)=193.1ms  p(95)=211.47ms p(99.9)=269.44ms
     http_reqs......................: 139736  2247.597113/s
     iteration_duration.............: avg=102.79ms min=3.44ms  med=98.22ms max=405.36ms p(90)=194.36ms p(95)=212.88ms p(99.9)=276.34ms
     iterations.....................: 138736  2231.512517/s
     success_rate...................: 100.00% ✓ 138736      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 353397      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=16.59µs  min=1.04µs  med=2.73µs   max=46.66ms  p(90)=4.49µs   p(95)=5.65µs   p(99.9)=2.04ms  
     http_req_connecting............: avg=13.13µs  min=0s      med=0s       max=46.49ms  p(90)=0s       p(95)=0s       p(99.9)=1.95ms  
     http_req_duration..............: avg=119.83ms min=1.77ms  med=107.12ms max=1.16s    p(90)=237.14ms p(95)=275.68ms p(99.9)=677.97ms
       { expected_response:true }...: avg=119.83ms min=1.77ms  med=107.12ms max=1.16s    p(90)=237.14ms p(95)=275.68ms p(99.9)=677.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118799
     http_req_receiving.............: avg=2.66ms   min=53.59µs med=154.83µs max=763.17ms p(90)=4.12ms   p(95)=8.78ms   p(99.9)=148.53ms
     http_req_sending...............: avg=67.27µs  min=5.26µs  med=10.75µs  max=93.5ms   p(90)=20.34µs  p(95)=121.36µs p(99.9)=9.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.1ms  min=1.67ms  med=105.18ms max=1.16s    p(90)=232.62ms p(95)=266.8ms  p(99.9)=632.77ms
     http_reqs......................: 118799  1910.198658/s
     iteration_duration.............: avg=121.13ms min=2.6ms   med=108.59ms max=1.16s    p(90)=237.96ms p(95)=276.38ms p(99.9)=680.47ms
     iterations.....................: 117799  1894.119409/s
     success_rate...................: 100.00% ✓ 117799      ✗ 0     
     vus............................: 68      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 195402      ✗ 0    
     data_received..................: 5.8 GB  92 MB/s
     data_sent......................: 79 MB   1.3 MB/s
     http_req_blocked...............: avg=6.24µs   min=1.11µs  med=2.43µs   max=32.2ms   p(90)=4.13µs   p(95)=5.08µs   p(99.9)=566.56µs
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=32.12ms  p(90)=0s       p(95)=0s       p(99.9)=476.87µs
     http_req_duration..............: avg=215.89ms min=2.16ms  med=218.61ms max=575.8ms  p(90)=397.09ms p(95)=425.64ms p(99.9)=516.56ms
       { expected_response:true }...: avg=215.89ms min=2.16ms  med=218.61ms max=575.8ms  p(90)=397.09ms p(95)=425.64ms p(99.9)=516.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 66134
     http_req_receiving.............: avg=89.33µs  min=29.77µs med=70.12µs  max=129.83ms p(90)=109.19µs p(95)=124.98µs p(99.9)=1.72ms  
     http_req_sending...............: avg=31.29µs  min=5.25µs  med=11.47µs  max=107.1ms  p(90)=18.38µs  p(95)=22.09µs  p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.77ms min=2.06ms  med=218.47ms max=575.69ms p(90)=396.95ms p(95)=425.55ms p(99.9)=516.32ms
     http_reqs......................: 66134   1053.867747/s
     iteration_duration.............: avg=219.45ms min=5.16ms  med=222.61ms max=576.02ms p(90)=398.16ms p(95)=426.44ms p(99.9)=517.57ms
     iterations.....................: 65134   1037.932407/s
     success_rate...................: 100.00% ✓ 65134       ✗ 0    
     vus............................: 92      min=0         max=500
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

     checks.........................: 100.00% ✓ 90975      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 38 MB   576 kB/s
     http_req_blocked...............: avg=9.44µs   min=1.17µs  med=3.35µs   max=11.8ms   p(90)=5.22µs   p(95)=6.21µs   p(99.9)=1.2ms 
     http_req_connecting............: avg=5.03µs   min=0s      med=0s       max=11.73ms  p(90)=0s       p(95)=0s       p(99.9)=1.13ms
     http_req_duration..............: avg=458.59ms min=4.07ms  med=429.14ms max=1.77s    p(90)=909.24ms p(95)=985.37ms p(99.9)=1.52s 
       { expected_response:true }...: avg=458.59ms min=4.07ms  med=429.14ms max=1.77s    p(90)=909.24ms p(95)=985.37ms p(99.9)=1.52s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31325
     http_req_receiving.............: avg=103.49µs min=33.64µs med=84.29µs  max=123.99ms p(90)=121.57µs p(95)=136.16µs p(99.9)=1.22ms
     http_req_sending...............: avg=34.86µs  min=5.9µs   med=14.77µs  max=144.33ms p(90)=22.03µs  p(95)=25.45µs  p(99.9)=3.59ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=458.45ms min=4.01ms  med=429.07ms max=1.77s    p(90)=909.13ms p(95)=985.25ms p(99.9)=1.52s 
     http_reqs......................: 31325   479.717542/s
     iteration_duration.............: avg=473.94ms min=20.58ms med=446.6ms  max=1.78s    p(90)=913.62ms p(95)=988.8ms  p(99.9)=1.52s 
     iterations.....................: 30325   464.403335/s
     success_rate...................: 100.00% ✓ 30325      ✗ 0    
     vus............................: 71      min=0        max=496
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

     checks.........................: 100.00% ✓ 41205      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   259 kB/s
     http_req_blocked...............: avg=18.14µs  min=1.15µs  med=3.88µs   max=22.73ms p(90)=5.81µs   p(95)=7.5µs    p(99.9)=2.52ms
     http_req_connecting............: avg=12.45µs  min=0s      med=0s       max=22.65ms p(90)=0s       p(95)=0s       p(99.9)=2.49ms
     http_req_duration..............: avg=990.45ms min=6.4ms   med=896.8ms  max=6.59s   p(90)=2.01s    p(95)=2.2s     p(99.9)=5.71s 
       { expected_response:true }...: avg=990.45ms min=6.4ms   med=896.8ms  max=6.59s   p(90)=2.01s    p(95)=2.2s     p(99.9)=5.71s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14735
     http_req_receiving.............: avg=128.97µs min=35.07µs med=102.1µs  max=44.1ms  p(90)=141.15µs p(95)=153.19µs p(99.9)=2.47ms
     http_req_sending...............: avg=29.74µs  min=6.14µs  med=18.81µs  max=8.92ms  p(90)=25.19µs  p(95)=30.6µs   p(99.9)=3.24ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=990.29ms min=6.29ms  med=896.45ms max=6.59s   p(90)=2.01s    p(95)=2.2s     p(99.9)=5.71s 
     http_reqs......................: 14735   215.372708/s
     iteration_duration.............: avg=1.06s    min=49.53ms med=982.72ms max=6.6s    p(90)=2.03s    p(95)=2.22s    p(99.9)=5.89s 
     iterations.....................: 13735   200.756304/s
     success_rate...................: 100.00% ✓ 13735      ✗ 0    
     vus............................: 81      min=0        max=500
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

     checks.........................: 100.00% ✓ 39279      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   242 kB/s
     http_req_blocked...............: avg=17.34µs  min=1.25µs  med=3.53µs   max=4.17ms  p(90)=5.34µs   p(95)=7.14µs   p(99.9)=2.7ms  
     http_req_connecting............: avg=11.86µs  min=0s      med=0s       max=4.13ms  p(90)=0s       p(95)=0s       p(99.9)=2.67ms 
     http_req_duration..............: avg=1.03s    min=8.77ms  med=956.58ms max=4.48s   p(90)=2.1s     p(95)=2.22s    p(99.9)=4.13s  
       { expected_response:true }...: avg=1.03s    min=8.77ms  med=956.58ms max=4.48s   p(90)=2.1s     p(95)=2.22s    p(99.9)=4.13s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14093
     http_req_receiving.............: avg=110.89µs min=33.24µs med=96.56µs  max=88.37ms p(90)=136.33µs p(95)=148.33µs p(99.9)=835.3µs
     http_req_sending...............: avg=34.35µs  min=6.13µs  med=17.28µs  max=57.03ms p(90)=23.12µs  p(95)=28.01µs  p(99.9)=2.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=1.03s    min=8.63ms  med=956.49ms max=4.48s   p(90)=2.1s     p(95)=2.22s    p(99.9)=4.13s  
     http_reqs......................: 14093   201.290938/s
     iteration_duration.............: avg=1.11s    min=58.8ms  med=1.04s    max=4.49s   p(90)=2.11s    p(95)=2.24s    p(99.9)=4.15s  
     iterations.....................: 13093   187.007894/s
     success_rate...................: 100.00% ✓ 13093      ✗ 0    
     vus............................: 55      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

