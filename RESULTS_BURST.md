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
| hive-router | v0.0.49 | 2,821 | 2,919 | 2,758 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,103 | 2,142 | 2,096 | 0.8% |  |
| cosmo | 0.307.0 | 1,188 | 1,209 | 1,184 | 1.1% | non-compatible response (12 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 506 | 514 | 500 | 1.0% |  |
| hive-gateway | 2.5.25 | 230 | 234 | 229 | 0.7% |  |
| apollo-gateway | 2.13.3 | 201 | 206 | 200 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16644 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (502962 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,252 | 2,327 | 2,165 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,916 | 1,960 | 1,884 | 1.1% |  |
| cosmo | 0.307.0 | 1,160 | 1,163 | 1,136 | 1.3% | non-compatible response (13 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 461 | 471 | 458 | 1.0% |  |
| hive-gateway | 2.5.25 | 227 | 231 | 225 | 1.0% |  |
| apollo-gateway | 2.13.3 | 208 | 212 | 207 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (13696 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (367857 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 520623      ✗ 0     
     data_received..................: 15 GB   248 MB/s
     data_sent......................: 210 MB  3.4 MB/s
     http_req_blocked...............: avg=30.65µs  min=1.02µs  med=2.23µs  max=69.97ms  p(90)=3.73µs   p(95)=4.82µs   p(99.9)=5.34ms  
     http_req_connecting............: avg=27.32µs  min=0s      med=0s      max=69.88ms  p(90)=0s       p(95)=0s       p(99.9)=5.06ms  
     http_req_duration..............: avg=81.36ms  min=1.58ms  med=74.96ms max=292.61ms p(90)=157.21ms p(95)=174.64ms p(99.9)=241.55ms
       { expected_response:true }...: avg=81.36ms  min=1.58ms  med=74.96ms max=292.61ms p(90)=157.21ms p(95)=174.64ms p(99.9)=241.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174541
     http_req_receiving.............: avg=458.48µs min=29.07µs med=55.09µs max=88.48ms  p(90)=254.94µs p(95)=425.88µs p(99.9)=48.82ms 
     http_req_sending...............: avg=96.7µs   min=5.24µs  med=9.78µs  max=187.57ms p(90)=18.47µs  p(95)=133.07µs p(99.9)=16.29ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.8ms   min=1.52ms  med=74.64ms max=273.96ms p(90)=156.11ms p(95)=172.8ms  p(99.9)=236.03ms
     http_reqs......................: 174541  2821.348473/s
     iteration_duration.............: avg=82.14ms  min=2.33ms  med=75.78ms max=418.3ms  p(90)=157.81ms p(95)=175.31ms p(99.9)=243.18ms
     iterations.....................: 173541  2805.184085/s
     success_rate...................: 100.00% ✓ 173541      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 392445      ✗ 0     
     data_received..................: 12 GB   184 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=19.16µs  min=1.02µs  med=2.48µs   max=85.31ms  p(90)=3.95µs   p(95)=4.93µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=15.59µs  min=0s      med=0s       max=85.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=107.99ms min=2.33ms  med=95ms     max=1.27s    p(90)=210.33ms p(95)=251.81ms p(99.9)=728.52ms
       { expected_response:true }...: avg=107.99ms min=2.33ms  med=95ms     max=1.27s    p(90)=210.33ms p(95)=251.81ms p(99.9)=728.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131815
     http_req_receiving.............: avg=2.09ms   min=50.28µs med=112.06µs max=1.03s    p(90)=1.37ms   p(95)=4.64ms   p(99.9)=156.27ms
     http_req_sending...............: avg=70.98µs  min=5.41µs  med=10.17µs  max=252.18ms p(90)=18.46µs  p(95)=123.7µs  p(99.9)=9.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.83ms min=2.24ms  med=93.81ms  max=1.25s    p(90)=206.59ms p(95)=243.17ms p(99.9)=725.05ms
     http_reqs......................: 131815  2103.837433/s
     iteration_duration.............: avg=109.1ms  min=3.74ms  med=96.31ms  max=1.27s    p(90)=211.03ms p(95)=252.65ms p(99.9)=733.13ms
     iterations.....................: 130815  2087.876901/s
     success_rate...................: 100.00% ✓ 130815      ✗ 0     
     vus............................: 87      min=0         max=496 
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

     checks.........................: 100.00% ✓ 219870      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=7.13µs   min=1.06µs  med=2.58µs   max=38.64ms  p(90)=4.19µs   p(95)=5.11µs   p(99.9)=508.93µs
     http_req_connecting............: avg=3.85µs   min=0s      med=0s       max=38.58ms  p(90)=0s       p(95)=0s       p(99.9)=434.05µs
     http_req_duration..............: avg=192.09ms min=2.08ms  med=192.58ms max=536.24ms p(90)=357.12ms p(95)=383.2ms  p(99.9)=464.85ms
       { expected_response:true }...: avg=192.09ms min=2.08ms  med=192.58ms max=536.24ms p(90)=357.12ms p(95)=383.2ms  p(99.9)=464.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74290
     http_req_receiving.............: avg=83.76µs  min=30.19µs med=63.04µs  max=142.7ms  p(90)=98.21µs  p(95)=112.66µs p(99.9)=1.76ms  
     http_req_sending...............: avg=34.11µs  min=5.39µs  med=11.23µs  max=186.43ms p(90)=17.42µs  p(95)=21.27µs  p(99.9)=3.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.97ms min=2.01ms  med=192.41ms max=536.15ms p(90)=357ms    p(95)=383.07ms p(99.9)=464.77ms
     http_reqs......................: 74290   1188.378255/s
     iteration_duration.............: avg=194.95ms min=5.38ms  med=195.89ms max=536.44ms p(90)=357.9ms  p(95)=383.83ms p(99.9)=465.91ms
     iterations.....................: 73290   1172.381778/s
     success_rate...................: 100.00% ✓ 73290       ✗ 0    
     vus............................: 82      min=0         max=494
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

     checks.........................: 100.00% ✓ 95529      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 39 MB   608 kB/s
     http_req_blocked...............: avg=13.21µs  min=1.11µs  med=2.89µs   max=9.6ms   p(90)=4.71µs   p(95)=5.73µs   p(99.9)=3.51ms
     http_req_connecting............: avg=9.23µs   min=0s      med=0s       max=9.57ms  p(90)=0s       p(95)=0s       p(99.9)=3.46ms
     http_req_duration..............: avg=437.04ms min=3.97ms  med=407.42ms max=1.71s   p(90)=865.63ms p(95)=937.2ms  p(99.9)=1.34s 
       { expected_response:true }...: avg=437.04ms min=3.97ms  med=407.42ms max=1.71s   p(90)=865.63ms p(95)=937.2ms  p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32843
     http_req_receiving.............: avg=100.37µs min=33.19µs med=77.33µs  max=81.16ms p(90)=113.76µs p(95)=126.94µs p(99.9)=1.05ms
     http_req_sending...............: avg=35.6µs   min=5.66µs  med=13.45µs  max=92.74ms p(90)=20.8µs   p(95)=24.08µs  p(99.9)=5.92ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=436.9ms  min=3.87ms  med=407.22ms max=1.71s   p(90)=865.51ms p(95)=937.1ms  p(99.9)=1.34s 
     http_reqs......................: 32843   506.601369/s
     iteration_duration.............: avg=450.97ms min=15.63ms med=423.7ms  max=1.71s   p(90)=868.8ms  p(95)=941.33ms p(99.9)=1.35s 
     iterations.....................: 31843   491.176427/s
     success_rate...................: 100.00% ✓ 31843      ✗ 0    
     vus............................: 96      min=0        max=500
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

     checks.........................: 100.00% ✓ 44118      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=14.02µs  min=1.18µs  med=3.46µs   max=4.97ms  p(90)=5.33µs   p(95)=6.92µs   p(99.9)=2.3ms 
     http_req_connecting............: avg=8.56µs   min=0s      med=0s       max=3.41ms  p(90)=0s       p(95)=0s       p(99.9)=2.22ms
     http_req_duration..............: avg=912.95ms min=6.09ms  med=818.33ms max=16.46s  p(90)=1.6s     p(95)=1.74s    p(99.9)=15.23s
       { expected_response:true }...: avg=912.95ms min=6.09ms  med=818.33ms max=16.46s  p(90)=1.6s     p(95)=1.74s    p(99.9)=15.23s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15706
     http_req_receiving.............: avg=104.14µs min=39.73µs med=95.87µs  max=27.17ms p(90)=135.65µs p(95)=149.51µs p(99.9)=1.16ms
     http_req_sending...............: avg=38.14µs  min=6.61µs  med=17.41µs  max=55.23ms p(90)=23.98µs  p(95)=29.25µs  p(99.9)=3.51ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=912.81ms min=5.98ms  med=818.23ms max=16.46s  p(90)=1.6s     p(95)=1.74s    p(99.9)=15.23s
     http_reqs......................: 15706   230.437679/s
     iteration_duration.............: avg=975.01ms min=40.76ms med=891.33ms max=16.47s  p(90)=1.62s    p(95)=1.75s    p(99.9)=15.36s
     iterations.....................: 14706   215.765727/s
     success_rate...................: 100.00% ✓ 14706      ✗ 0    
     vus............................: 61      min=0        max=499
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

     checks.........................: 100.00% ✓ 41862      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   247 kB/s
     http_req_blocked...............: avg=13.23µs  min=1.3µs   med=3.27µs   max=4.44ms   p(90)=4.98µs   p(95)=6.74µs   p(99.9)=1.92ms
     http_req_connecting............: avg=8.01µs   min=0s      med=0s       max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms
     http_req_duration..............: avg=498.06ms min=8.45ms  med=551.17ms max=1.43s    p(90)=877.08ms p(95)=929.03ms p(99.9)=1.3s  
       { expected_response:true }...: avg=498.06ms min=8.45ms  med=551.17ms max=1.43s    p(90)=877.08ms p(95)=929.03ms p(99.9)=1.3s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14954
     http_req_receiving.............: avg=109.93µs min=32.73µs med=91.2µs   max=83.4ms   p(90)=131.65µs p(95)=145.37µs p(99.9)=1.21ms
     http_req_sending...............: avg=38.73µs  min=6.14µs  med=16.44µs  max=101.61ms p(90)=22.73µs  p(95)=27.66µs  p(99.9)=2.45ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=497.92ms min=8.36ms  med=551.04ms max=1.43s    p(90)=876.98ms p(95)=928.93ms p(99.9)=1.3s  
     http_reqs......................: 14954   201.123121/s
     iteration_duration.............: avg=533.65ms min=9.2ms   med=583.16ms max=1.44s    p(90)=883.27ms p(95)=934.7ms  p(99.9)=1.31s 
     iterations.....................: 13954   187.673668/s
     success_rate...................: 100.00% ✓ 13954      ✗ 0    
     vus............................: 59      min=0        max=497
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

     checks.........................: 100.00% ✓ 416340      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=25.91µs  min=1.13µs  med=3.01µs  max=61.27ms  p(90)=4.91µs   p(95)=6.25µs   p(99.9)=4.15ms  
     http_req_connecting............: avg=21.68µs  min=0s      med=0s      max=61.2ms   p(90)=0s       p(95)=0s       p(99.9)=3.8ms   
     http_req_duration..............: avg=101.72ms min=1.61ms  med=95.7ms  max=380.12ms p(90)=196.21ms p(95)=212.67ms p(99.9)=272.06ms
       { expected_response:true }...: avg=101.72ms min=1.61ms  med=95.7ms  max=380.12ms p(90)=196.21ms p(95)=212.67ms p(99.9)=272.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139780
     http_req_receiving.............: avg=254.1µs  min=30.22µs med=63.55µs max=272.7ms  p(90)=199.03µs p(95)=442.83µs p(99.9)=28.47ms 
     http_req_sending...............: avg=88.48µs  min=5.54µs  med=11.75µs max=159.62ms p(90)=22.72µs  p(95)=148.29µs p(99.9)=13.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.37ms min=1.56ms  med=95.42ms max=377.17ms p(90)=195.65ms p(95)=211.88ms p(99.9)=270.38ms
     http_reqs......................: 139780  2252.733698/s
     iteration_duration.............: avg=102.75ms min=4.31ms  med=96.82ms max=390.76ms p(90)=196.81ms p(95)=213.25ms p(99.9)=274.23ms
     iterations.....................: 138780  2236.617418/s
     success_rate...................: 100.00% ✓ 138780      ✗ 0     
     vus............................: 60      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 354639      ✗ 0     
     data_received..................: 10 GB   168 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=14.01µs  min=1µs     med=2.38µs   max=66.16ms  p(90)=3.99µs   p(95)=5.02µs   p(99.9)=1.05ms  
     http_req_connecting............: avg=11.01µs  min=0s      med=0s       max=65.95ms  p(90)=0s       p(95)=0s       p(99.9)=1.01ms  
     http_req_duration..............: avg=119.42ms min=1.78ms  med=107.88ms max=882.43ms p(90)=230.78ms p(95)=265.75ms p(99.9)=636.66ms
       { expected_response:true }...: avg=119.42ms min=1.78ms  med=107.88ms max=882.43ms p(90)=230.78ms p(95)=265.75ms p(99.9)=636.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119213
     http_req_receiving.............: avg=1.82ms   min=52.58µs med=114.52µs max=288.18ms p(90)=1.87ms   p(95)=5.48ms   p(99.9)=129.92ms
     http_req_sending...............: avg=58µs     min=5.4µs   med=10.04µs  max=67.79ms  p(90)=19.31µs  p(95)=118.06µs p(99.9)=7.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.54ms min=1.66ms  med=106.61ms max=882.32ms p(90)=227.33ms p(95)=258.87ms p(99.9)=633.33ms
     http_reqs......................: 119213  1916.071593/s
     iteration_duration.............: avg=120.7ms  min=3.12ms  med=109.27ms max=882.67ms p(90)=231.56ms p(95)=266.55ms p(99.9)=636.93ms
     iterations.....................: 118213  1899.99892/s
     success_rate...................: 100.00% ✓ 118213      ✗ 0     
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

     checks.........................: 100.00% ✓ 214740      ✗ 0    
     data_received..................: 6.3 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=8.43µs   min=1.05µs  med=2.72µs   max=64.52ms  p(90)=4.46µs   p(95)=5.47µs   p(99.9)=540.83µs
     http_req_connecting............: avg=5.04µs   min=0s      med=0s       max=64.46ms  p(90)=0s       p(95)=0s       p(99.9)=492.42µs
     http_req_duration..............: avg=196.61ms min=2.09ms  med=196.97ms max=534.33ms p(90)=363.1ms  p(95)=389.4ms  p(99.9)=473.42ms
       { expected_response:true }...: avg=196.61ms min=2.09ms  med=196.97ms max=534.33ms p(90)=363.1ms  p(95)=389.4ms  p(99.9)=473.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72580
     http_req_receiving.............: avg=118.23µs min=29.59µs med=65.26µs  max=162.48ms p(90)=102.01µs p(95)=117.08µs p(99.9)=2.5ms   
     http_req_sending...............: avg=33.32µs  min=5.39µs  med=11.91µs  max=231.52ms p(90)=18.67µs  p(95)=22.39µs  p(99.9)=3.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.46ms min=2.02ms  med=196.72ms max=534.28ms p(90)=363ms    p(95)=389.33ms p(99.9)=473.34ms
     http_reqs......................: 72580   1160.436543/s
     iteration_duration.............: avg=199.61ms min=4.9ms   med=200.13ms max=534.53ms p(90)=363.94ms p(95)=390.28ms p(99.9)=474.1ms 
     iterations.....................: 71580   1144.448164/s
     success_rate...................: 100.00% ✓ 71580       ✗ 0    
     vus............................: 83      min=0         max=497
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

     checks.........................: 100.00% ✓ 87456      ✗ 0    
     data_received..................: 2.6 GB  40 MB/s
     data_sent......................: 36 MB   554 kB/s
     http_req_blocked...............: avg=11.22µs  min=1.16µs  med=2.91µs   max=42.68ms  p(90)=4.65µs   p(95)=5.63µs   p(99.9)=1.96ms
     http_req_connecting............: avg=7.28µs   min=0s      med=0s       max=42.62ms  p(90)=0s       p(95)=0s       p(99.9)=1.93ms
     http_req_duration..............: avg=476.61ms min=4.21ms  med=442.22ms max=1.87s    p(90)=941.23ms p(95)=1.01s    p(99.9)=1.53s 
       { expected_response:true }...: avg=476.61ms min=4.21ms  med=442.22ms max=1.87s    p(90)=941.23ms p(95)=1.01s    p(99.9)=1.53s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30152
     http_req_receiving.............: avg=104.03µs min=33.62µs med=80.33µs  max=249.62ms p(90)=116.5µs  p(95)=130.42µs p(99.9)=1.06ms
     http_req_sending...............: avg=34.94µs  min=5.78µs  med=14.11µs  max=156.83ms p(90)=21.16µs  p(95)=24.3µs   p(99.9)=2.38ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=476.47ms min=4.13ms  med=442.09ms max=1.87s    p(90)=941.12ms p(95)=1.01s    p(99.9)=1.53s 
     http_reqs......................: 30152   461.711377/s
     iteration_duration.............: avg=493.22ms min=24.17ms med=464.28ms max=1.87s    p(90)=944.79ms p(95)=1.02s    p(99.9)=1.53s 
     iterations.....................: 29152   446.398582/s
     success_rate...................: 100.00% ✓ 29152      ✗ 0    
     vus............................: 73      min=0        max=497
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

     checks.........................: 100.00% ✓ 43563      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   273 kB/s
     http_req_blocked...............: avg=16.96µs  min=1.23µs  med=3.71µs   max=5.86ms  p(90)=5.66µs   p(95)=7.35µs   p(99.9)=2.68ms 
     http_req_connecting............: avg=11.38µs  min=0s      med=0s       max=5.68ms  p(90)=0s       p(95)=0s       p(99.9)=2.65ms 
     http_req_duration..............: avg=940.27ms min=6.29ms  med=845.64ms max=5.09s   p(90)=1.86s    p(95)=2.06s    p(99.9)=4.87s  
       { expected_response:true }...: avg=940.27ms min=6.29ms  med=845.64ms max=5.09s   p(90)=1.86s    p(95)=2.06s    p(99.9)=4.87s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15521
     http_req_receiving.............: avg=144.17µs min=32.36µs med=101.21µs max=57.01ms p(90)=142.62µs p(95)=155.63µs p(99.9)=11.15ms
     http_req_sending...............: avg=36.69µs  min=5.87µs  med=18.14µs  max=98.67ms p(90)=24.58µs  p(95)=29.57µs  p(99.9)=2.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=940.09ms min=6.18ms  med=845.49ms max=5.09s   p(90)=1.86s    p(95)=2.06s    p(99.9)=4.87s  
     http_reqs......................: 15521   227.710412/s
     iteration_duration.............: avg=1s       min=12.15ms med=922.44ms max=5.1s    p(90)=1.88s    p(95)=2.09s    p(99.9)=4.89s  
     iterations.....................: 14521   213.039295/s
     success_rate...................: 100.00% ✓ 14521      ✗ 0    
     vus............................: 68      min=0        max=500
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

     checks.........................: 100.00% ✓ 40770      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=17.66µs  min=1.3µs   med=3.45µs   max=16.62ms  p(90)=5.32µs   p(95)=6.93µs   p(99.9)=2.58ms 
     http_req_connecting............: avg=12.33µs  min=0s      med=0s       max=16.55ms  p(90)=0s       p(95)=0s       p(99.9)=2.55ms 
     http_req_duration..............: avg=998.36ms min=8.69ms  med=928.77ms max=4.09s    p(90)=2.04s    p(95)=2.14s    p(99.9)=3.56s  
       { expected_response:true }...: avg=998.36ms min=8.69ms  med=928.77ms max=4.09s    p(90)=2.04s    p(95)=2.14s    p(99.9)=3.56s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14590
     http_req_receiving.............: avg=305.6µs  min=37.02µs med=97.99µs  max=151.88ms p(90)=138.53µs p(95)=152.21µs p(99.9)=76.83ms
     http_req_sending...............: avg=28.1µs   min=6.07µs  med=17.92µs  max=40.54ms  p(90)=24.06µs  p(95)=28.83µs  p(99.9)=1.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=998.03ms min=8.59ms  med=928.64ms max=4.09s    p(90)=2.04s    p(95)=2.14s    p(99.9)=3.56s  
     http_reqs......................: 14590   208.89841/s
     iteration_duration.............: avg=1.07s    min=11.28ms med=1s       max=4.09s    p(90)=2.05s    p(95)=2.16s    p(99.9)=3.59s  
     iterations.....................: 13590   194.580493/s
     success_rate...................: 100.00% ✓ 13590      ✗ 0    
     vus............................: 96      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

