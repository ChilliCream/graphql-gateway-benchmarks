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
| hive-router | v0.0.42 | 2,873 | 2,974 | 2,838 | 1.7% |  |
| hotchocolate | 16.0.0-rc.1.21 | 2,059 | 2,112 | 2,042 | 1.1% |  |
| hive-gateway-router-runtime | 2.5.11 | 555 | 562 | 550 | 0.8% |  |
| hive-gateway | 2.5.11 | 253 | 255 | 251 | 0.5% |  |
| apollo-gateway | 2.13.3 | 199 | 203 | 197 | 0.9% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (46056 across 9/9 runs) |
| cosmo | 0.295.0 | — | — | — | — | non-compatible response (12 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (484018 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.42 | 2,397 | 2,474 | 2,355 | 1.7% |  |
| hotchocolate | 16.0.0-rc.1.21 | 1,825 | 1,873 | 1,815 | 1.1% |  |
| cosmo | 0.295.0 | 1,120 | 1,134 | 1,115 | 0.6% | non-compatible response (9 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 523 | 535 | 517 | 1.2% |  |
| hive-gateway | 2.5.11 | 250 | 251 | 247 | 0.6% |  |
| apollo-gateway | 2.13.3 | 210 | 213 | 210 | 0.5% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (45897 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (324760 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 530223      ✗ 0     
     data_received..................: 16 GB   252 MB/s
     data_sent......................: 214 MB  3.5 MB/s
     http_req_blocked...............: avg=36.48µs  min=1.07µs  med=2.62µs  max=110.39ms p(90)=4.24µs   p(95)=5.38µs   p(99.9)=12.14ms 
     http_req_connecting............: avg=32.14µs  min=0s      med=0s      max=84.14ms  p(90)=0s       p(95)=0s       p(99.9)=11.75ms 
     http_req_duration..............: avg=79.85ms  min=1.54ms  med=73.56ms max=283.05ms p(90)=156ms    p(95)=176.29ms p(99.9)=238.34ms
       { expected_response:true }...: avg=79.85ms  min=1.54ms  med=73.56ms max=283.05ms p(90)=156ms    p(95)=176.29ms p(99.9)=238.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177741
     http_req_receiving.............: avg=475.69µs min=29.04µs med=57.02µs max=98.37ms  p(90)=259.17µs p(95)=438.83µs p(99.9)=46.42ms 
     http_req_sending...............: avg=105.62µs min=4.75µs  med=10.25µs max=202.7ms  p(90)=19.86µs  p(95)=138.45µs p(99.9)=18.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.27ms  min=1.47ms  med=73ms    max=282.99ms p(90)=155.08ms p(95)=174.63ms p(99.9)=235.39ms
     http_reqs......................: 177741  2873.174215/s
     iteration_duration.............: avg=80.66ms  min=2.1ms   med=74.39ms max=413.97ms p(90)=156.58ms p(95)=177.13ms p(99.9)=241.11ms
     iterations.....................: 176741  2857.009266/s
     success_rate...................: 100.00% ✓ 176741      ✗ 0     
     vus............................: 46      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 384303      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=42.91µs  min=961ns   med=2.6µs    max=117.45ms p(90)=4.04µs   p(95)=5.03µs   p(99.9)=2.89ms  
     http_req_connecting............: avg=39.53µs  min=0s      med=0s       max=117.3ms  p(90)=0s       p(95)=0s       p(99.9)=2.8ms   
     http_req_duration..............: avg=110.2ms  min=2.38ms  med=104.72ms max=555.09ms p(90)=209.66ms p(95)=232.44ms p(99.9)=364.57ms
       { expected_response:true }...: avg=110.2ms  min=2.38ms  med=104.72ms max=555.09ms p(90)=209.66ms p(95)=232.44ms p(99.9)=364.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129101
     http_req_receiving.............: avg=1.48ms   min=51.75µs med=149.22µs max=285.2ms  p(90)=1.43ms   p(95)=3.77ms   p(99.9)=115.07ms
     http_req_sending...............: avg=68.68µs  min=5.14µs  med=10.41µs  max=109.84ms p(90)=19.43µs  p(95)=127.33µs p(99.9)=9.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.65ms min=2.29ms  med=102.95ms max=554.94ms p(90)=207.71ms p(95)=229.1ms  p(99.9)=357.64ms
     http_reqs......................: 129101  2059.216958/s
     iteration_duration.............: avg=111.36ms min=3.42ms  med=105.97ms max=555.32ms p(90)=210.24ms p(95)=233.06ms p(99.9)=365.29ms
     iterations.....................: 128101  2043.266524/s
     success_rate...................: 100.00% ✓ 128101      ✗ 0     
     vus............................: 89      min=0         max=497 
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

     checks.........................: 100.00% ✓ 104379     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   667 kB/s
     http_req_blocked...............: avg=9.12µs   min=1.15µs  med=2.9µs    max=44.53ms  p(90)=4.64µs   p(95)=5.66µs   p(99.9)=1.07ms  
     http_req_connecting............: avg=5.22µs   min=0s      med=0s       max=44.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=400.65ms min=3.7ms   med=375.14ms max=1.68s    p(90)=784.54ms p(95)=850.16ms p(99.9)=1.22s   
       { expected_response:true }...: avg=400.65ms min=3.7ms   med=375.14ms max=1.68s    p(90)=784.54ms p(95)=850.16ms p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35793
     http_req_receiving.............: avg=83.4µs   min=32.75µs med=76.09µs  max=10.13ms  p(90)=111.16µs p(95)=124.05µs p(99.9)=743.76µs
     http_req_sending...............: avg=37.35µs  min=5.54µs  med=13.5µs   max=165.65ms p(90)=20.71µs  p(95)=23.99µs  p(99.9)=2.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=400.53ms min=3.64ms  med=375.05ms max=1.68s    p(90)=784.4ms  p(95)=850.08ms p(99.9)=1.22s   
     http_reqs......................: 35793   555.209228/s
     iteration_duration.............: avg=412.42ms min=29.42ms med=390.87ms max=1.69s    p(90)=788.84ms p(95)=852.78ms p(99.9)=1.23s   
     iterations.....................: 34793   539.697558/s
     success_rate...................: 100.00% ✓ 34793      ✗ 0    
     vus............................: 82      min=0        max=498
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

     checks.........................: 100.00% ✓ 48255      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   304 kB/s
     http_req_blocked...............: avg=14.57µs  min=1.33µs  med=3.66µs   max=5.51ms  p(90)=5.59µs   p(95)=7.37µs   p(99.9)=2.73ms 
     http_req_connecting............: avg=9.31µs   min=0s      med=0s       max=5.45ms  p(90)=0s       p(95)=0s       p(99.9)=2.71ms 
     http_req_duration..............: avg=844.77ms min=5.87ms  med=752.35ms max=14.13s  p(90)=1.58s    p(95)=1.74s    p(99.9)=12.35s 
       { expected_response:true }...: avg=844.77ms min=5.87ms  med=752.35ms max=14.13s  p(90)=1.58s    p(95)=1.74s    p(99.9)=12.35s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17085
     http_req_receiving.............: avg=255.05µs min=36.86µs med=100.41µs max=185.9ms p(90)=139.97µs p(95)=153.17µs p(99.9)=62.46ms
     http_req_sending...............: avg=27.97µs  min=6.24µs  med=18.51µs  max=7.06ms  p(90)=24.65µs  p(95)=29.16µs  p(99.9)=2.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=844.49ms min=5.77ms  med=752.24ms max=14.13s  p(90)=1.58s    p(95)=1.74s    p(99.9)=12.35s 
     http_reqs......................: 17085   253.210248/s
     iteration_duration.............: avg=897.38ms min=37.72ms med=816.15ms max=14.13s  p(90)=1.6s     p(95)=1.76s    p(99.9)=12.51s 
     iterations.....................: 16085   238.38963/s
     success_rate...................: 100.00% ✓ 16085      ✗ 0    
     vus............................: 85      min=0        max=500
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

     checks.........................: 100.00% ✓ 41748      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   245 kB/s
     http_req_blocked...............: avg=15.06µs  min=1.17µs  med=3.34µs   max=17.21ms p(90)=4.99µs   p(95)=6.55µs   p(99.9)=2.15ms  
     http_req_connecting............: avg=9.84µs   min=0s      med=0s       max=17.16ms p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=478.64ms min=8.66ms  med=552.81ms max=1.4s    p(90)=813.65ms p(95)=881.33ms p(99.9)=1.19s   
       { expected_response:true }...: avg=478.64ms min=8.66ms  med=552.81ms max=1.4s    p(90)=813.65ms p(95)=881.33ms p(99.9)=1.19s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14916
     http_req_receiving.............: avg=103.67µs min=30.96µs med=90.47µs  max=97.02ms p(90)=130.45µs p(95)=144.47µs p(99.9)=866.23µs
     http_req_sending...............: avg=37.13µs  min=5.63µs  med=16.57µs  max=88.08ms p(90)=22.62µs  p(95)=27.55µs  p(99.9)=3.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=478.5ms  min=8.53ms  med=552.72ms max=1.4s    p(90)=813.56ms p(95)=881.22ms p(99.9)=1.19s   
     http_reqs......................: 14916   199.41803/s
     iteration_duration.............: avg=512.92ms min=9.15ms  med=586.97ms max=1.41s   p(90)=822.93ms p(95)=887.9ms  p(99.9)=1.2s    
     iterations.....................: 13916   186.048626/s
     success_rate...................: 100.00% ✓ 13916      ✗ 0    
     vus............................: 85      min=0        max=500
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

     checks.........................: 100.00% ✓ 443067      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=31.1µs   min=1.06µs med=3.02µs  max=78.83ms  p(90)=4.99µs   p(95)=6.36µs   p(99.9)=5.7ms   
     http_req_connecting............: avg=26.89µs  min=0s     med=0s      max=78.65ms  p(90)=0s       p(95)=0s       p(99.9)=4.97ms  
     http_req_duration..............: avg=95.54ms  min=1.61ms med=88.72ms max=354.96ms p(90)=185.02ms p(95)=203.69ms p(99.9)=268.18ms
       { expected_response:true }...: avg=95.54ms  min=1.61ms med=88.72ms max=354.96ms p(90)=185.02ms p(95)=203.69ms p(99.9)=268.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148689
     http_req_receiving.............: avg=355.64µs min=29.9µs med=63.26µs max=128.13ms p(90)=213.74µs p(95)=453.54µs p(99.9)=42.3ms  
     http_req_sending...............: avg=95.08µs  min=5.38µs med=11.84µs max=298.95ms p(90)=23.17µs  p(95)=147.71µs p(99.9)=14.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.09ms  min=1.55ms med=88.45ms max=354.31ms p(90)=184.35ms p(95)=202.62ms p(99.9)=263.28ms
     http_reqs......................: 148689  2397.216355/s
     iteration_duration.............: avg=96.53ms  min=3.58ms med=89.79ms max=387.02ms p(90)=185.68ms p(95)=204.37ms p(99.9)=271.28ms
     iterations.....................: 147689  2381.094003/s
     success_rate...................: 100.00% ✓ 147689      ✗ 0     
     vus............................: 59      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 338097      ✗ 0     
     data_received..................: 10 GB   160 MB/s
     data_sent......................: 137 MB  2.2 MB/s
     http_req_blocked...............: avg=12.68µs  min=981ns   med=2.42µs   max=38.2ms   p(90)=3.99µs   p(95)=5.01µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=9.57µs   min=0s      med=0s       max=38.13ms  p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=125.23ms min=1.81ms  med=118.75ms max=768.22ms p(90)=234.14ms p(95)=260.2ms  p(99.9)=620.6ms 
       { expected_response:true }...: avg=125.23ms min=1.81ms  med=118.75ms max=768.22ms p(90)=234.14ms p(95)=260.2ms  p(99.9)=620.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 113699
     http_req_receiving.............: avg=1.38ms   min=52.44µs med=163.23µs max=282.16ms p(90)=1.63ms   p(95)=3.42ms   p(99.9)=108.46ms
     http_req_sending...............: avg=54.57µs  min=5.36µs  med=10.38µs  max=131.66ms p(90)=19.43µs  p(95)=116.79µs p(99.9)=7.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.79ms min=1.72ms  med=117.47ms max=767.21ms p(90)=231.95ms p(95)=256.79ms p(99.9)=617.8ms 
     http_reqs......................: 113699  1825.147112/s
     iteration_duration.............: avg=126.6ms  min=3.38ms  med=120.45ms max=768.42ms p(90)=234.77ms p(95)=260.87ms p(99.9)=621.88ms
     iterations.....................: 112699  1809.094665/s
     success_rate...................: 100.00% ✓ 112699      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 207408     ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.83µs   min=1.13µs  med=2.93µs   max=25.98ms  p(90)=4.72µs   p(95)=5.7µs    p(99.9)=541.83µs
     http_req_connecting............: avg=3.18µs   min=0s      med=0s       max=25.91ms  p(90)=0s       p(95)=0s       p(99.9)=440.07µs
     http_req_duration..............: avg=203.47ms min=2.07ms  med=203.57ms max=663.39ms p(90)=378.57ms p(95)=407.49ms p(99.9)=564.67ms
       { expected_response:true }...: avg=203.47ms min=2.07ms  med=203.57ms max=663.39ms p(90)=378.57ms p(95)=407.49ms p(99.9)=564.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70136
     http_req_receiving.............: avg=94.54µs  min=31.08µs med=70.31µs  max=233.46ms p(90)=108.71µs p(95)=126.44µs p(99.9)=2.09ms  
     http_req_sending...............: avg=36.77µs  min=5.58µs  med=12.38µs  max=88.78ms  p(90)=19.57µs  p(95)=23.6µs   p(99.9)=4.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.34ms min=2.01ms  med=203.42ms max=663.32ms p(90)=378.44ms p(95)=407.35ms p(99.9)=564.55ms
     http_reqs......................: 70136   1120.39104/s
     iteration_duration.............: avg=206.67ms min=4.56ms  med=207.13ms max=663.53ms p(90)=379.51ms p(95)=408.34ms p(99.9)=565ms   
     iterations.....................: 69136   1104.41649/s
     success_rate...................: 100.00% ✓ 69136      ✗ 0    
     vus............................: 84      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 98784      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   628 kB/s
     http_req_blocked...............: avg=12.76µs  min=1.29µs  med=3.12µs   max=28.63ms p(90)=4.84µs   p(95)=5.85µs   p(99.9)=1.88ms 
     http_req_connecting............: avg=7.92µs   min=0s      med=0s       max=28.56ms p(90)=0s       p(95)=0s       p(99.9)=1.67ms 
     http_req_duration..............: avg=422.97ms min=3.91ms  med=386.52ms max=1.75s   p(90)=840.96ms p(95)=915.14ms p(99.9)=1.37s  
       { expected_response:true }...: avg=422.97ms min=3.91ms  med=386.52ms max=1.75s   p(90)=840.96ms p(95)=915.14ms p(99.9)=1.37s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 33928
     http_req_receiving.............: avg=93.89µs  min=32.81µs med=81.09µs  max=80.65ms p(90)=117.39µs p(95)=131.07µs p(99.9)=948.1µs
     http_req_sending...............: avg=33.93µs  min=5.47µs  med=14.43µs  max=98.01ms p(90)=21.69µs  p(95)=25.05µs  p(99.9)=3.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=422.85ms min=3.78ms  med=386.35ms max=1.75s   p(90)=840.87ms p(95)=914.88ms p(99.9)=1.37s  
     http_reqs......................: 33928   523.178686/s
     iteration_duration.............: avg=436.05ms min=14.44ms med=404.15ms max=1.76s   p(90)=844.94ms p(95)=918.73ms p(99.9)=1.38s  
     iterations.....................: 32928   507.758423/s
     success_rate...................: 100.00% ✓ 32928      ✗ 0    
     vus............................: 2       min=0        max=500
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

     checks.........................: 100.00% ✓ 47985      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=16.3µs   min=1.37µs  med=3.7µs    max=27.49ms  p(90)=5.61µs   p(95)=7.05µs   p(99.9)=2.44ms 
     http_req_connecting............: avg=10.89µs  min=0s      med=0s       max=27.42ms  p(90)=0s       p(95)=0s       p(99.9)=2.41ms 
     http_req_duration..............: avg=855.17ms min=5.97ms  med=792.34ms max=4.83s    p(90)=1.7s     p(95)=1.89s    p(99.9)=3.77s  
       { expected_response:true }...: avg=855.17ms min=5.97ms  med=792.34ms max=4.83s    p(90)=1.7s     p(95)=1.89s    p(99.9)=3.77s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16995
     http_req_receiving.............: avg=276.13µs min=38.52µs med=99.17µs  max=177.08ms p(90)=138.96µs p(95)=152.65µs p(99.9)=83.17ms
     http_req_sending...............: avg=44.66µs  min=6.25µs  med=18.51µs  max=114.92ms p(90)=24.5µs   p(95)=29.62µs  p(99.9)=3.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=854.85ms min=5.87ms  med=792.24ms max=4.83s    p(90)=1.7s     p(95)=1.89s    p(99.9)=3.77s  
     http_reqs......................: 16995   250.743418/s
     iteration_duration.............: avg=908.74ms min=7.75ms  med=845.53ms max=4.83s    p(90)=1.72s    p(95)=1.9s     p(99.9)=3.8s   
     iterations.....................: 15995   235.989466/s
     success_rate...................: 100.00% ✓ 15995      ✗ 0    
     vus............................: 95      min=0        max=500
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

     checks.........................: 100.00% ✓ 41142      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   253 kB/s
     http_req_blocked...............: avg=16.57µs  min=1.3µs   med=3.74µs   max=30.04ms p(90)=5.64µs   p(95)=7.27µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=10.99µs  min=0s      med=0s       max=29.98ms p(90)=0s       p(95)=0s       p(99.9)=1.95ms  
     http_req_duration..............: avg=991.03ms min=8.64ms  med=898.78ms max=3.89s   p(90)=2.01s    p(95)=2.15s    p(99.9)=3.55s   
       { expected_response:true }...: avg=991.03ms min=8.64ms  med=898.78ms max=3.89s   p(90)=2.01s    p(95)=2.15s    p(99.9)=3.55s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14714
     http_req_receiving.............: avg=116.84µs min=37.26µs med=102.13µs max=91.17ms p(90)=142.49µs p(95)=156.64µs p(99.9)=936.89µs
     http_req_sending...............: avg=39.02µs  min=6.25µs  med=18.86µs  max=64.63ms p(90)=25.09µs  p(95)=30.68µs  p(99.9)=3.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=990.87ms min=8.5ms   med=898.66ms max=3.89s   p(90)=2.01s    p(95)=2.15s    p(99.9)=3.55s   
     http_reqs......................: 14714   210.674918/s
     iteration_duration.............: avg=1.06s    min=46.99ms med=967.56ms max=3.89s   p(90)=2.03s    p(95)=2.16s    p(99.9)=3.57s   
     iterations.....................: 13714   196.356928/s
     success_rate...................: 100.00% ✓ 13714      ✗ 0    
     vus............................: 2       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

