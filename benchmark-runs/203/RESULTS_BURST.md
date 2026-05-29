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
| hive-router | v0.0.49 | 2,656 | 2,794 | 2,611 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,099 | 2,152 | 2,078 | 1.1% |  |
| cosmo | 0.307.0 | 1,186 | 1,195 | 1,174 | 0.8% | non-compatible response (2674132 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 489 | 492 | 484 | 0.7% |  |
| hive-gateway | 2.5.25 | 220 | 223 | 219 | 0.7% |  |
| apollo-gateway | 2.13.3 | 204 | 209 | 203 | 0.9% | 5 failed requests across 1/9 runs |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (27964 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (474774 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,344 | 2,429 | 2,284 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,901 | 1,928 | 1,884 | 0.9% |  |
| cosmo | 0.307.0 | 1,110 | 1,135 | 1,107 | 1.4% | non-compatible response (10 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 472 | 480 | 469 | 0.8% |  |
| hive-gateway | 2.5.25 | 215 | 218 | 213 | 0.7% |  |
| apollo-gateway | 2.13.3 | 204 | 207 | 202 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (20314 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (238268 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 491079      ✗ 0     
     data_received..................: 14 GB   233 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=30.16µs  min=1.05µs  med=2.72µs  max=68.81ms  p(90)=4.29µs   p(95)=5.39µs   p(99.9)=6.18ms  
     http_req_connecting............: avg=26.72µs  min=0s      med=0s      max=68.65ms  p(90)=0s       p(95)=0s       p(99.9)=5.92ms  
     http_req_duration..............: avg=86.25ms  min=1.64ms  med=80.42ms max=316.68ms p(90)=166.34ms p(95)=182.95ms p(99.9)=241.91ms
       { expected_response:true }...: avg=86.25ms  min=1.64ms  med=80.42ms max=316.68ms p(90)=166.34ms p(95)=182.95ms p(99.9)=241.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164693
     http_req_receiving.............: avg=445.57µs min=28.67µs med=57.31µs max=167.66ms p(90)=223.13µs p(95)=428.35µs p(99.9)=51.5ms  
     http_req_sending...............: avg=92.01µs  min=5.34µs  med=10.51µs max=207.8ms  p(90)=19.16µs  p(95)=136.38µs p(99.9)=13.93ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.71ms  min=1.59ms  med=80.07ms max=275.12ms p(90)=165.44ms p(95)=181.74ms p(99.9)=232.85ms
     http_reqs......................: 164693  2656.01899/s
     iteration_duration.............: avg=87.08ms  min=2.29ms  med=81.37ms max=357.37ms p(90)=166.85ms p(95)=183.52ms p(99.9)=244.07ms
     iterations.....................: 163693  2639.891899/s
     success_rate...................: 100.00% ✓ 163693      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 392595      ✗ 0     
     data_received..................: 12 GB   184 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=20.36µs  min=1.03µs  med=2.35µs   max=62.63ms  p(90)=3.77µs   p(95)=4.73µs   p(99.9)=2.43ms  
     http_req_connecting............: avg=16.89µs  min=0s      med=0s       max=62.57ms  p(90)=0s       p(95)=0s       p(99.9)=2.4ms   
     http_req_duration..............: avg=107.89ms min=2.39ms  med=100.24ms max=663.67ms p(90)=211.78ms p(95)=243.64ms p(99.9)=413.68ms
       { expected_response:true }...: avg=107.89ms min=2.39ms  med=100.24ms max=663.67ms p(90)=211.78ms p(95)=243.64ms p(99.9)=413.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131865
     http_req_receiving.............: avg=1.64ms   min=53.53µs med=108.2µs  max=271.38ms p(90)=1.23ms   p(95)=4ms      p(99.9)=133.2ms 
     http_req_sending...............: avg=65.41µs  min=5.57µs  med=9.87µs   max=254.02ms p(90)=17.97µs  p(95)=122.78µs p(99.9)=8.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.18ms min=2.31ms  med=99.12ms  max=663.5ms  p(90)=208.21ms p(95)=237.94ms p(99.9)=399.26ms
     http_reqs......................: 131865  2099.532736/s
     iteration_duration.............: avg=109ms    min=3.36ms  med=101.51ms max=663.85ms p(90)=212.5ms  p(95)=244.38ms p(99.9)=414.81ms
     iterations.....................: 130865  2083.610901/s
     success_rate...................: 100.00% ✓ 130865      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 219324      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=6.83µs   min=1.11µs  med=2.5µs    max=39.72ms  p(90)=3.93µs   p(95)=4.71µs   p(99.9)=381.15µs
     http_req_connecting............: avg=3.71µs   min=0s      med=0s       max=39.64ms  p(90)=0s       p(95)=0s       p(99.9)=299.04µs
     http_req_duration..............: avg=192.54ms min=2.01ms  med=193.61ms max=524.66ms p(90)=356.34ms p(95)=382.7ms  p(99.9)=463.48ms
       { expected_response:true }...: avg=192.54ms min=2.01ms  med=193.61ms max=524.66ms p(90)=356.34ms p(95)=382.7ms  p(99.9)=463.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74108
     http_req_receiving.............: avg=75.41µs  min=30.81µs med=59.97µs  max=148.76ms p(90)=91.77µs  p(95)=104.32µs p(99.9)=1.42ms  
     http_req_sending...............: avg=26.76µs  min=5.23µs  med=10.52µs  max=70.3ms   p(90)=15.67µs  p(95)=18.82µs  p(99.9)=3.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.44ms min=1.96ms  med=193.51ms max=524.59ms p(90)=356.24ms p(95)=382.61ms p(99.9)=463.36ms
     http_reqs......................: 74108   1186.348936/s
     iteration_duration.............: avg=195.42ms min=5.2ms   med=196.75ms max=524.9ms  p(90)=357.2ms  p(95)=383.27ms p(99.9)=463.79ms
     iterations.....................: 73108   1170.340558/s
     success_rate...................: 100.00% ✓ 73108       ✗ 0    
     vus............................: 79      min=0         max=494
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

     checks.........................: 100.00% ✓ 92370      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   587 kB/s
     http_req_blocked...............: avg=10.3µs   min=1.16µs  med=3.17µs   max=16.66ms  p(90)=4.97µs   p(95)=6.04µs   p(99.9)=1.78ms 
     http_req_connecting............: avg=5.98µs   min=0s      med=0s       max=16.34ms  p(90)=0s       p(95)=0s       p(99.9)=1.6ms  
     http_req_duration..............: avg=451.72ms min=4.15ms  med=418.07ms max=2.32s    p(90)=894.41ms p(95)=970.93ms p(99.9)=1.44s  
       { expected_response:true }...: avg=451.72ms min=4.15ms  med=418.07ms max=2.32s    p(90)=894.41ms p(95)=970.93ms p(99.9)=1.44s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31790
     http_req_receiving.............: avg=170.95µs min=32.05µs med=79.37µs  max=166.36ms p(90)=115.69µs p(95)=131.03µs p(99.9)=21.32ms
     http_req_sending...............: avg=39.73µs  min=5.79µs  med=14.2µs   max=263.64ms p(90)=21.79µs  p(95)=25.48µs  p(99.9)=3.43ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=451.51ms min=4.07ms  med=417.98ms max=2.32s    p(90)=894.28ms p(95)=970.71ms p(99.9)=1.44s  
     http_reqs......................: 31790   489.075224/s
     iteration_duration.............: avg=466.62ms min=6.86ms  med=436.54ms max=2.32s    p(90)=899.32ms p(95)=973.73ms p(99.9)=1.46s  
     iterations.....................: 30790   473.690662/s
     success_rate...................: 100.00% ✓ 30790      ✗ 0    
     vus............................: 58      min=0        max=498
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

     checks.........................: 100.00% ✓ 42435      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   266 kB/s
     http_req_blocked...............: avg=16.07µs  min=1.34µs  med=3.74µs   max=9.58ms  p(90)=5.69µs   p(95)=7.59µs   p(99.9)=2.68ms
     http_req_connecting............: avg=10.41µs  min=0s      med=0s       max=9.51ms  p(90)=0s       p(95)=0s       p(99.9)=2.66ms
     http_req_duration..............: avg=942.6ms  min=6.38ms  med=845.52ms max=17.5s   p(90)=1.68s    p(95)=1.87s    p(99.9)=15.18s
       { expected_response:true }...: avg=942.6ms  min=6.38ms  med=845.52ms max=17.5s   p(90)=1.68s    p(95)=1.87s    p(99.9)=15.18s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15145
     http_req_receiving.............: avg=131.8µs  min=39.4µs  med=101.74µs max=41.07ms p(90)=141.43µs p(95)=154.91µs p(99.9)=6.74ms
     http_req_sending...............: avg=30.68µs  min=6.76µs  med=18.72µs  max=42.7ms  p(90)=25.05µs  p(95)=30.34µs  p(99.9)=2.32ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=942.43ms min=6.23ms  med=845.4ms  max=17.5s   p(90)=1.68s    p(95)=1.87s    p(99.9)=15.18s
     http_reqs......................: 15145   220.554374/s
     iteration_duration.............: avg=1s       min=59.61ms med=916.46ms max=17.5s   p(90)=1.69s    p(95)=1.88s    p(99.9)=15.64s
     iterations.....................: 14145   205.991524/s
     success_rate...................: 100.00% ✓ 14145      ✗ 0    
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

     checks.........................: 100.00% ✓ 42684      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   251 kB/s
     http_req_blocked...............: avg=17.29µs  min=1.27µs  med=3.45µs   max=28.47ms p(90)=5.13µs   p(95)=6.66µs   p(99.9)=2.6ms   
     http_req_connecting............: avg=12.13µs  min=0s      med=0s       max=28.42ms p(90)=0s       p(95)=0s       p(99.9)=2.58ms  
     http_req_duration..............: avg=461.54ms min=8.51ms  med=518.56ms max=1.35s   p(90)=788.87ms p(95)=835.1ms  p(99.9)=1.2s    
       { expected_response:true }...: avg=461.54ms min=8.51ms  med=518.56ms max=1.35s   p(90)=788.87ms p(95)=835.1ms  p(99.9)=1.2s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 15228
     http_req_receiving.............: avg=99.8µs   min=37.18µs med=92.35µs  max=6.22ms  p(90)=129.91µs p(95)=142.44µs p(99.9)=983.82µs
     http_req_sending...............: avg=41.52µs  min=6.3µs   med=17.31µs  max=61.83ms p(90)=23.27µs  p(95)=29.19µs  p(99.9)=3.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=461.4ms  min=8.39ms  med=518.44ms max=1.35s   p(90)=788.74ms p(95)=834.87ms p(99.9)=1.2s    
     http_reqs......................: 15228   204.585213/s
     iteration_duration.............: avg=493.9ms  min=12.88ms med=545.94ms max=1.36s   p(90)=792.57ms p(95)=841.85ms p(99.9)=1.2s    
     iterations.....................: 14228   191.150408/s
     success_rate...................: 100.00% ✓ 14228      ✗ 0    
     vus............................: 64      min=0        max=493
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

     checks.........................: 100.00% ✓ 433554      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=29.17µs  min=1.03µs  med=2.83µs  max=83.64ms  p(90)=4.7µs    p(95)=6.01µs   p(99.9)=5.97ms  
     http_req_connecting............: avg=25.47µs  min=0s      med=0s      max=83.57ms  p(90)=0s       p(95)=0s       p(99.9)=5.5ms   
     http_req_duration..............: avg=97.68ms  min=1.64ms  med=90.51ms max=299.13ms p(90)=190.12ms p(95)=210.98ms p(99.9)=271.48ms
       { expected_response:true }...: avg=97.68ms  min=1.64ms  med=90.51ms max=299.13ms p(90)=190.12ms p(95)=210.98ms p(99.9)=271.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145518
     http_req_receiving.............: avg=303.03µs min=29.18µs med=61.22µs max=147.26ms p(90)=196.23µs p(95)=435.57µs p(99.9)=36.11ms 
     http_req_sending...............: avg=85.38µs  min=5.45µs  med=11.29µs max=147.79ms p(90)=21.47µs  p(95)=141.65µs p(99.9)=12.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.29ms  min=1.57ms  med=90.25ms max=299.06ms p(90)=189.31ms p(95)=209.9ms  p(99.9)=268.36ms
     http_reqs......................: 145518  2344.338085/s
     iteration_duration.............: avg=98.67ms  min=5.01ms  med=91.64ms max=336.98ms p(90)=190.86ms p(95)=211.58ms p(99.9)=273.39ms
     iterations.....................: 144518  2328.227789/s
     success_rate...................: 100.00% ✓ 144518      ✗ 0     
     vus............................: 60      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 352032      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=17.1µs   min=1.04µs  med=2.79µs   max=59.48ms  p(90)=4.41µs   p(95)=5.48µs   p(99.9)=3.17ms  
     http_req_connecting............: avg=13.5µs   min=0s      med=0s       max=59.27ms  p(90)=0s       p(95)=0s       p(99.9)=3.12ms  
     http_req_duration..............: avg=120.33ms min=1.78ms  med=112.72ms max=876.75ms p(90)=232.02ms p(95)=264.87ms p(99.9)=576.5ms 
       { expected_response:true }...: avg=120.33ms min=1.78ms  med=112.72ms max=876.75ms p(90)=232.02ms p(95)=264.87ms p(99.9)=576.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 118344
     http_req_receiving.............: avg=1.92ms   min=53.21µs med=119.75µs max=392.57ms p(90)=1.7ms    p(95)=5.02ms   p(99.9)=140.41ms
     http_req_sending...............: avg=66.04µs  min=5.47µs  med=10.87µs  max=163.64ms p(90)=19.78µs  p(95)=124.18µs p(99.9)=8.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.34ms min=1.65ms  med=111.52ms max=864.43ms p(90)=228.88ms p(95)=259.09ms p(99.9)=570.4ms 
     http_reqs......................: 118344  1901.597374/s
     iteration_duration.............: avg=121.64ms min=3.08ms  med=114.4ms  max=876.96ms p(90)=232.83ms p(95)=265.81ms p(99.9)=576.91ms
     iterations.....................: 117344  1885.528985/s
     success_rate...................: 100.00% ✓ 117344      ✗ 0     
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

     checks.........................: 100.00% ✓ 205683      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.45µs   min=1.05µs  med=2.87µs   max=53.57ms  p(90)=4.63µs   p(95)=5.61µs   p(99.9)=567.49µs
     http_req_connecting............: avg=3.89µs   min=0s      med=0s       max=53.51ms  p(90)=0s       p(95)=0s       p(99.9)=495.87µs
     http_req_duration..............: avg=205.1ms  min=2.08ms  med=204.2ms  max=560.57ms p(90)=379.67ms p(95)=406.79ms p(99.9)=496.23ms
       { expected_response:true }...: avg=205.1ms  min=2.08ms  med=204.2ms  max=560.57ms p(90)=379.67ms p(95)=406.79ms p(99.9)=496.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69561
     http_req_receiving.............: avg=137.18µs min=29.36µs med=68.21µs  max=178.88ms p(90)=106.6µs  p(95)=123.61µs p(99.9)=3.76ms  
     http_req_sending...............: avg=35µs     min=5.33µs  med=12.22µs  max=274.59ms p(90)=19.31µs  p(95)=23.23µs  p(99.9)=3.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.92ms min=2ms     med=203.83ms max=560.45ms p(90)=379.55ms p(95)=406.66ms p(99.9)=496.03ms
     http_reqs......................: 69561   1110.798276/s
     iteration_duration.............: avg=208.4ms  min=5.75ms  med=207.72ms max=560.74ms p(90)=380.71ms p(95)=407.56ms p(99.9)=496.58ms
     iterations.....................: 68561   1094.829582/s
     success_rate...................: 100.00% ✓ 68561       ✗ 0    
     vus............................: 86      min=0         max=497
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

     checks.........................: 100.00% ✓ 89676      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   568 kB/s
     http_req_blocked...............: avg=8.86µs   min=1.18µs  med=3.29µs   max=17.18ms  p(90)=5.11µs   p(95)=6.13µs   p(99.9)=925.72µs
     http_req_connecting............: avg=4.29µs   min=0s      med=0s       max=16.94ms  p(90)=0s       p(95)=0s       p(99.9)=764.61µs
     http_req_duration..............: avg=465.07ms min=4.18ms  med=435.96ms max=2.33s    p(90)=915.04ms p(95)=993.96ms p(99.9)=1.48s   
       { expected_response:true }...: avg=465.07ms min=4.18ms  med=435.96ms max=2.33s    p(90)=915.04ms p(95)=993.96ms p(99.9)=1.48s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30892
     http_req_receiving.............: avg=181.76µs min=32.68µs med=82.28µs  max=173.87ms p(90)=119.12µs p(95)=133.89µs p(99.9)=28.63ms 
     http_req_sending...............: avg=26.98µs  min=5.87µs  med=14.76µs  max=66.98ms  p(90)=22.07µs  p(95)=25.22µs  p(99.9)=2.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=464.86ms min=4.11ms  med=435.85ms max=2.33s    p(90)=914.93ms p(95)=993.86ms p(99.9)=1.48s   
     http_reqs......................: 30892   472.726869/s
     iteration_duration.............: avg=480.84ms min=8.76ms  med=453.07ms max=2.34s    p(90)=920.11ms p(95)=996.52ms p(99.9)=1.48s   
     iterations.....................: 29892   457.424303/s
     success_rate...................: 100.00% ✓ 29892      ✗ 0    
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

     checks.........................: 100.00% ✓ 41289      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   258 kB/s
     http_req_blocked...............: avg=16.9µs   min=1.21µs  med=3.76µs   max=4.38ms  p(90)=5.61µs   p(95)=7.47µs   p(99.9)=2.58ms  
     http_req_connecting............: avg=11.27µs  min=0s      med=0s       max=4.34ms  p(90)=0s       p(95)=0s       p(99.9)=2.56ms  
     http_req_duration..............: avg=990.92ms min=6.44ms  med=864.14ms max=5.8s    p(90)=1.94s    p(95)=2.18s    p(99.9)=5.41s   
       { expected_response:true }...: avg=990.92ms min=6.44ms  med=864.14ms max=5.8s    p(90)=1.94s    p(95)=2.18s    p(99.9)=5.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14763
     http_req_receiving.............: avg=107.21µs min=32.27µs med=98.71µs  max=16.04ms p(90)=137.63µs p(95)=150.37µs p(99.9)=990.71µs
     http_req_sending...............: avg=38.71µs  min=6.1µs   med=18.09µs  max=72.21ms p(90)=24.16µs  p(95)=29.68µs  p(99.9)=2.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=990.77ms min=6.34ms  med=863.9ms  max=5.8s    p(90)=1.94s    p(95)=2.18s    p(99.9)=5.41s   
     http_reqs......................: 14763   215.09004/s
     iteration_duration.............: avg=1.06s    min=52.54ms med=975.69ms max=5.81s   p(90)=1.96s    p(95)=2.19s    p(99.9)=5.42s   
     iterations.....................: 13763   200.520505/s
     success_rate...................: 100.00% ✓ 13763      ✗ 0    
     vus............................: 80      min=0        max=500
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

     checks.........................: 100.00% ✓ 40002      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=15.46µs  min=1.25µs  med=3.38µs   max=16.47ms  p(90)=5.07µs   p(95)=6.97µs   p(99.9)=2.07ms 
     http_req_connecting............: avg=10.11µs  min=0s      med=0s       max=16.42ms  p(90)=0s       p(95)=0s       p(99.9)=1.93ms 
     http_req_duration..............: avg=1.01s    min=8.72ms  med=925.71ms max=4.12s    p(90)=2.05s    p(95)=2.19s    p(99.9)=3.45s  
       { expected_response:true }...: avg=1.01s    min=8.72ms  med=925.71ms max=4.12s    p(90)=2.05s    p(95)=2.19s    p(99.9)=3.45s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14334
     http_req_receiving.............: avg=242.31µs min=32.16µs med=92.63µs  max=156.37ms p(90)=134.05µs p(95)=146.34µs p(99.9)=61.25ms
     http_req_sending...............: avg=29.1µs   min=6.22µs  med=17.08µs  max=10.39ms  p(90)=23.23µs  p(95)=28.17µs  p(99.9)=2.76ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=1.01s    min=8.62ms  med=925.62ms max=4.12s    p(90)=2.05s    p(95)=2.19s    p(99.9)=3.45s  
     http_reqs......................: 14334   204.536787/s
     iteration_duration.............: avg=1.09s    min=16.73ms med=1.03s    max=4.13s    p(90)=2.07s    p(95)=2.2s     p(99.9)=3.48s  
     iterations.....................: 13334   190.267442/s
     success_rate...................: 100.00% ✓ 13334      ✗ 0    
     vus............................: 59      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

