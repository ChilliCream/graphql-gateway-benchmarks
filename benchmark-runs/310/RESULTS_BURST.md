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
| hive-router | v0.0.84 | 2,914 | 3,067 | 2,873 | 2.4% |  |
| fusion | 16.6.0 | 2,522 | 2,598 | 2,508 | 1.2% |  |
| cosmo | 0.334.0 | 1,195 | 1,229 | 1,179 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 560 | 574 | 558 | 1.1% |  |
| hive-gateway | 2.10.8 | 247 | 255 | 246 | 1.1% |  |
| apollo-gateway | 2.14.3 | 229 | 237 | 227 | 1.3% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (7495 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (520284 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.0 | 2,393 | 2,489 | 2,380 | 1.6% |  |
| hive-router | v0.0.84 | 2,367 | 2,500 | 2,350 | 2.1% |  |
| cosmo | 0.334.0 | 1,163 | 1,201 | 1,159 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 520 | 539 | 516 | 1.7% |  |
| hive-gateway | 2.10.8 | 243 | 251 | 242 | 1.1% |  |
| apollo-gateway | 2.14.3 | 236 | 240 | 234 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (29680 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (463340 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 536061      ✗ 0     
     data_received..................: 16 GB   256 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=24.99µs  min=872ns   med=2.47µs  max=87.46ms  p(90)=4.23µs   p(95)=5.46µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=21.66µs  min=0s      med=0s      max=87.36ms  p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=79.05ms  min=1.38ms  med=73.27ms max=301.66ms p(90)=152.1ms  p(95)=169.05ms p(99.9)=226.51ms
       { expected_response:true }...: avg=79.05ms  min=1.38ms  med=73.27ms max=301.66ms p(90)=152.1ms  p(95)=169.05ms p(99.9)=226.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179687
     http_req_receiving.............: avg=160.67µs min=25.95µs med=51.41µs max=49.38ms  p(90)=153.72µs p(95)=344.09µs p(99.9)=21.27ms 
     http_req_sending...............: avg=76.42µs  min=4.51µs  med=9.67µs  max=91.43ms  p(90)=19.71µs  p(95)=121.72µs p(99.9)=10.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.82ms  min=1.34ms  med=73.04ms max=301.05ms p(90)=151.82ms p(95)=168.64ms p(99.9)=224.99ms
     http_reqs......................: 179687  2914.652001/s
     iteration_duration.............: avg=79.77ms  min=2.09ms  med=74.01ms max=343.89ms p(90)=152.56ms p(95)=169.56ms p(99.9)=228.55ms
     iterations.....................: 178687  2898.431284/s
     success_rate...................: 100.00% ✓ 178687      ✗ 0     
     vus............................: 86      min=0         max=494 
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

     checks.........................: 100.00% ✓ 468369      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 189 MB  3.0 MB/s
     http_req_blocked...............: avg=24µs    min=841ns   med=2.4µs   max=101.84ms p(90)=3.98µs   p(95)=5.05µs   p(99.9)=2.42ms  
     http_req_connecting............: avg=20.87µs min=0s      med=0s      max=101.76ms p(90)=0s       p(95)=0s       p(99.9)=2.37ms  
     http_req_duration..............: avg=90.48ms min=1.95ms  med=76.88ms max=1.34s    p(90)=173.38ms p(95)=203.75ms p(99.9)=610.23ms
       { expected_response:true }...: avg=90.48ms min=1.95ms  med=76.88ms max=1.34s    p(90)=173.38ms p(95)=203.75ms p(99.9)=610.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157123
     http_req_receiving.............: avg=1.51ms  min=52.07µs med=99.27µs max=407.29ms p(90)=1.53ms   p(95)=4.54ms   p(99.9)=110.7ms 
     http_req_sending...............: avg=72.67µs min=4.53µs  med=9.26µs  max=220.31ms p(90)=17.88µs  p(95)=114.98µs p(99.9)=10.6ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.89ms min=1.87ms  med=75.73ms max=1.34s    p(90)=171.13ms p(95)=200.09ms p(99.9)=606.87ms
     http_reqs......................: 157123  2522.91588/s
     iteration_duration.............: avg=91.36ms min=3.44ms  med=77.77ms max=1.34s    p(90)=174.02ms p(95)=204.67ms p(99.9)=610.84ms
     iterations.....................: 156123  2506.858931/s
     success_rate...................: 100.00% ✓ 156123      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 221289      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.61µs   min=1.03µs  med=2.65µs   max=14.34ms  p(90)=4.27µs   p(95)=5.15µs   p(99.9)=408.88µs
     http_req_connecting............: avg=2.23µs   min=0s      med=0s       max=8.58ms   p(90)=0s       p(95)=0s       p(99.9)=356.48µs
     http_req_duration..............: avg=190.89ms min=1.95ms  med=192.18ms max=533.31ms p(90)=355.76ms p(95)=381.52ms p(99.9)=465.81ms
       { expected_response:true }...: avg=190.89ms min=1.95ms  med=192.18ms max=533.31ms p(90)=355.76ms p(95)=381.52ms p(99.9)=465.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74763
     http_req_receiving.............: avg=75.05µs  min=28.26µs med=59.44µs  max=64.39ms  p(90)=95.62µs  p(95)=110.24µs p(99.9)=1.27ms  
     http_req_sending...............: avg=24.78µs  min=4.82µs  med=10.76µs  max=25.39ms  p(90)=16.88µs  p(95)=20.52µs  p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.79ms min=1.84ms  med=192.1ms  max=533.26ms p(90)=355.68ms p(95)=381.45ms p(99.9)=465.73ms
     http_reqs......................: 74763   1195.766222/s
     iteration_duration.............: avg=193.7ms  min=3.29ms  med=195.01ms max=533.51ms p(90)=356.64ms p(95)=382.26ms p(99.9)=466.13ms
     iterations.....................: 73763   1179.772131/s
     success_rate...................: 100.00% ✓ 73763       ✗ 0    
     vus............................: 79      min=0         max=494
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

     checks.........................: 100.00% ✓ 105063     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   672 kB/s
     http_req_blocked...............: avg=7.13µs   min=1.23µs  med=3.01µs   max=8.03ms   p(90)=4.68µs   p(95)=5.7µs    p(99.9)=623.33µs
     http_req_connecting............: avg=3.17µs   min=0s      med=0s       max=7.96ms   p(90)=0s       p(95)=0s       p(99.9)=595.35µs
     http_req_duration..............: avg=398.23ms min=3.61ms  med=369.01ms max=1.61s    p(90)=782.24ms p(95)=852.73ms p(99.9)=1.25s   
       { expected_response:true }...: avg=398.23ms min=3.61ms  med=369.01ms max=1.61s    p(90)=782.24ms p(95)=852.73ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36021
     http_req_receiving.............: avg=85.77µs  min=28.94µs med=69.09µs  max=97.7ms   p(90)=106.78µs p(95)=120.76µs p(99.9)=950.28µs
     http_req_sending...............: avg=28.98µs  min=5.43µs  med=13.37µs  max=103.43ms p(90)=20.44µs  p(95)=23.52µs  p(99.9)=2.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=398.12ms min=3.51ms  med=368.9ms  max=1.61s    p(90)=782.17ms p(95)=852.61ms p(99.9)=1.25s   
     http_reqs......................: 36021   560.061606/s
     iteration_duration.............: avg=409.82ms min=30.47ms med=384.88ms max=1.62s    p(90)=785.8ms  p(95)=856.03ms p(99.9)=1.26s   
     iterations.....................: 35021   544.513409/s
     success_rate...................: 100.00% ✓ 35021      ✗ 0    
     vus............................: 70      min=0        max=495
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

     checks.........................: 100.00% ✓ 47040      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   298 kB/s
     http_req_blocked...............: avg=10.91µs  min=1.05µs  med=3.03µs   max=14.97ms p(90)=4.64µs   p(95)=5.86µs   p(99.9)=1.11ms  
     http_req_connecting............: avg=6.37µs   min=0s      med=0s       max=14.91ms p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=861.65ms min=5.51ms  med=758.22ms max=16.49s  p(90)=1.52s    p(95)=1.73s    p(99.9)=15.45s  
       { expected_response:true }...: avg=861.65ms min=5.51ms  med=758.22ms max=16.49s  p(90)=1.52s    p(95)=1.73s    p(99.9)=15.45s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16680
     http_req_receiving.............: avg=101.08µs min=33.59µs med=87.45µs  max=63.47ms p(90)=124.33µs p(95)=137.41µs p(99.9)=988.11µs
     http_req_sending...............: avg=30.29µs  min=5.37µs  med=16.5µs   max=47.55ms p(90)=21.78µs  p(95)=26.23µs  p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=861.52ms min=5.42ms  med=758.1ms  max=16.49s  p(90)=1.52s    p(95)=1.73s    p(99.9)=15.45s  
     http_reqs......................: 16680   247.706629/s
     iteration_duration.............: avg=916.65ms min=27.56ms med=831.06ms max=16.49s  p(90)=1.54s    p(95)=1.74s    p(99.9)=15.48s  
     iterations.....................: 15680   232.856112/s
     success_rate...................: 100.00% ✓ 15680      ✗ 0    
     vus............................: 69      min=0        max=497
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

     checks.........................: 100.00% ✓ 47220      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   281 kB/s
     http_req_blocked...............: avg=13.71µs  min=1.17µs  med=2.94µs   max=4.55ms   p(90)=4.43µs   p(95)=5.68µs   p(99.9)=2.27ms
     http_req_connecting............: avg=9.19µs   min=0s      med=0s       max=4.49ms   p(90)=0s       p(95)=0s       p(99.9)=2.24ms
     http_req_duration..............: avg=385.36ms min=7.48ms  med=390.68ms max=1.2s     p(90)=686.65ms p(95)=737.22ms p(99.9)=1.02s 
       { expected_response:true }...: avg=385.36ms min=7.48ms  med=390.68ms max=1.2s     p(90)=686.65ms p(95)=737.22ms p(99.9)=1.02s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16740
     http_req_receiving.............: avg=97.12µs  min=32.25µs med=79.51µs  max=120.39ms p(90)=120.12µs p(95)=133.42µs p(99.9)=1.15ms
     http_req_sending...............: avg=35.77µs  min=5.33µs  med=16.04µs  max=73.48ms  p(90)=21.03µs  p(95)=24.95µs  p(99.9)=3.18ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=385.23ms min=7.35ms  med=390.58ms max=1.2s     p(90)=686.53ms p(95)=737.11ms p(99.9)=1.02s 
     http_reqs......................: 16740   229.081886/s
     iteration_duration.............: avg=409.87ms min=8.38ms  med=412.56ms max=1.21s    p(90)=690.7ms  p(95)=741.85ms p(99.9)=1.03s 
     iterations.....................: 15740   215.397185/s
     success_rate...................: 100.00% ✓ 15740      ✗ 0    
     vus............................: 57      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 441510      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=19.06µs min=912ns   med=2.26µs   max=67.14ms  p(90)=4.08µs   p(95)=5.25µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=15.81µs min=0s      med=0s       max=67.08ms  p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=95.97ms min=1.41ms  med=80.12ms  max=2.16s    p(90)=184.44ms p(95)=213.23ms p(99.9)=794.99ms
       { expected_response:true }...: avg=95.97ms min=1.41ms  med=80.12ms  max=2.16s    p(90)=184.44ms p(95)=213.23ms p(99.9)=794.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148170
     http_req_receiving.............: avg=1.61ms  min=52.63µs med=103.27µs max=864.48ms p(90)=1.67ms   p(95)=4.84ms   p(99.9)=99.44ms 
     http_req_sending...............: avg=65.6µs  min=4.72µs  med=9.41µs   max=139.61ms p(90)=19.72µs  p(95)=104.25µs p(99.9)=8.75ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.29ms min=1.34ms  med=78.98ms  max=2.16s    p(90)=182.19ms p(95)=209.45ms p(99.9)=763.04ms
     http_reqs......................: 148170  2393.940775/s
     iteration_duration.............: avg=96.92ms min=2.95ms  med=81.12ms  max=2.17s    p(90)=185.07ms p(95)=214.08ms p(99.9)=798.14ms
     iterations.....................: 147170  2377.784058/s
     success_rate...................: 100.00% ✓ 147170      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 437226      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=12.97µs  min=882ns   med=2.35µs  max=52.23ms  p(90)=4.15µs   p(95)=5.37µs   p(99.9)=839.45µs
     http_req_connecting............: avg=9.99µs   min=0s      med=0s      max=52.17ms  p(90)=0s       p(95)=0s       p(99.9)=786.55µs
     http_req_duration..............: avg=96.93ms  min=1.55ms  med=91.27ms max=325.92ms p(90)=187.76ms p(95)=204.77ms p(99.9)=248.17ms
       { expected_response:true }...: avg=96.93ms  min=1.55ms  med=91.27ms max=325.92ms p(90)=187.76ms p(95)=204.77ms p(99.9)=248.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146742
     http_req_receiving.............: avg=116.19µs min=25.34µs med=53.31µs max=85.32ms  p(90)=123.32µs p(95)=327.59µs p(99.9)=9.36ms  
     http_req_sending...............: avg=61.34µs  min=4.78µs  med=10.16µs max=64.65ms  p(90)=20.36µs  p(95)=116.26µs p(99.9)=8.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.75ms  min=1.47ms  med=91.11ms max=325.62ms p(90)=187.49ms p(95)=204.53ms p(99.9)=247.51ms
     http_reqs......................: 146742  2367.545887/s
     iteration_duration.............: avg=97.83ms  min=4.47ms  med=92.42ms max=348.58ms p(90)=188.23ms p(95)=205.2ms  p(99.9)=248.86ms
     iterations.....................: 145742  2351.411816/s
     success_rate...................: 100.00% ✓ 145742      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 215436      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.51µs   min=1.14µs  med=3.07µs   max=11.11ms  p(90)=4.97µs   p(95)=6.03µs   p(99.9)=532.49µs
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=10.93ms  p(90)=0s       p(95)=0s       p(99.9)=489.05µs
     http_req_duration..............: avg=195.99ms min=1.99ms  med=196.57ms max=550.65ms p(90)=363.98ms p(95)=390.03ms p(99.9)=473.12ms
       { expected_response:true }...: avg=195.99ms min=1.99ms  med=196.57ms max=550.65ms p(90)=363.98ms p(95)=390.03ms p(99.9)=473.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72812
     http_req_receiving.............: avg=78.97µs  min=24.76µs med=66.09µs  max=13.08ms  p(90)=108.06µs p(95)=123.79µs p(99.9)=1.16ms  
     http_req_sending...............: avg=31.15µs  min=5.25µs  med=13.02µs  max=58.29ms  p(90)=20.72µs  p(95)=24.49µs  p(99.9)=3.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.88ms min=1.92ms  med=196.47ms max=550.55ms p(90)=363.86ms p(95)=389.9ms  p(99.9)=473.03ms
     http_reqs......................: 72812   1163.322302/s
     iteration_duration.............: avg=198.97ms min=4.71ms  med=199.92ms max=550.84ms p(90)=364.91ms p(95)=390.77ms p(99.9)=473.8ms 
     iterations.....................: 71812   1147.345234/s
     success_rate...................: 100.00% ✓ 71812       ✗ 0    
     vus............................: 84      min=0         max=495
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

     checks.........................: 100.00% ✓ 98292      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   625 kB/s
     http_req_blocked...............: avg=8.5µs    min=1.06µs  med=2.67µs   max=3.97ms   p(90)=4.45µs   p(95)=5.42µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=4.81µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=425.26ms min=3.87ms  med=394.4ms  max=1.66s    p(90)=840.55ms p(95)=925.25ms p(99.9)=1.31s   
       { expected_response:true }...: avg=425.26ms min=3.87ms  med=394.4ms  max=1.66s    p(90)=840.55ms p(95)=925.25ms p(99.9)=1.31s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33764
     http_req_receiving.............: avg=84.53µs  min=29.15µs med=72.93µs  max=41.97ms  p(90)=111.98µs p(95)=126.18µs p(99.9)=893.77µs
     http_req_sending...............: avg=36.77µs  min=4.98µs  med=13.86µs  max=146.75ms p(90)=21.01µs  p(95)=24.09µs  p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=425.14ms min=3.79ms  med=394.31ms max=1.66s    p(90)=840.37ms p(95)=925.16ms p(99.9)=1.31s   
     http_reqs......................: 33764   520.290081/s
     iteration_duration.............: avg=438.43ms min=16.36ms med=408.09ms max=1.66s    p(90)=845.33ms p(95)=928.09ms p(99.9)=1.31s   
     iterations.....................: 32764   504.88047/s
     success_rate...................: 100.00% ✓ 32764      ✗ 0    
     vus............................: 31      min=0        max=500
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

     checks.........................: 100.00% ✓ 46302      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   292 kB/s
     http_req_blocked...............: avg=14.34µs  min=1.44µs  med=3.9µs    max=3.89ms   p(90)=5.84µs   p(95)=7.55µs   p(99.9)=2.05ms
     http_req_connecting............: avg=8.59µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=2.03ms
     http_req_duration..............: avg=886.06ms min=5.81ms  med=818.66ms max=4.62s    p(90)=1.78s    p(95)=1.99s    p(99.9)=3.94s 
       { expected_response:true }...: avg=886.06ms min=5.81ms  med=818.66ms max=4.62s    p(90)=1.78s    p(95)=1.99s    p(99.9)=3.94s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16434
     http_req_receiving.............: avg=108.01µs min=37.44µs med=94.88µs  max=34.15ms  p(90)=134.88µs p(95)=151.76µs p(99.9)=1.44ms
     http_req_sending...............: avg=39.92µs  min=5.51µs  med=19.28µs  max=112.22ms p(90)=25.44µs  p(95)=30.68µs  p(99.9)=2.69ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=885.92ms min=5.72ms  med=818.56ms max=4.62s    p(90)=1.78s    p(95)=1.99s    p(99.9)=3.94s 
     http_reqs......................: 16434   243.363364/s
     iteration_duration.............: avg=943.54ms min=21.54ms med=885.69ms max=4.63s    p(90)=1.81s    p(95)=2s       p(99.9)=3.99s 
     iterations.....................: 15434   228.554835/s
     success_rate...................: 100.00% ✓ 15434      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 45759      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   283 kB/s
     http_req_blocked...............: avg=15.11µs  min=1.41µs  med=3.68µs   max=6.04ms   p(90)=5.54µs   p(95)=7.34µs   p(99.9)=2.1ms 
     http_req_connecting............: avg=9.43µs   min=0s      med=0s       max=5.98ms   p(90)=0s       p(95)=0s       p(99.9)=2.01ms
     http_req_duration..............: avg=893.72ms min=7.74ms  med=814.1ms  max=2.96s    p(90)=1.83s    p(95)=1.95s    p(99.9)=2.64s 
       { expected_response:true }...: avg=893.72ms min=7.74ms  med=814.1ms  max=2.96s    p(90)=1.83s    p(95)=1.95s    p(99.9)=2.64s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16253
     http_req_receiving.............: avg=105.58µs min=35.92µs med=92.97µs  max=40.97ms  p(90)=132.49µs p(95)=149.55µs p(99.9)=1.11ms
     http_req_sending...............: avg=43.98µs  min=6.3µs   med=18.18µs  max=145.92ms p(90)=24.09µs  p(95)=29.13µs  p(99.9)=3.86ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=893.57ms min=7.65ms  med=813.97ms max=2.96s    p(90)=1.83s    p(95)=1.95s    p(99.9)=2.64s 
     http_reqs......................: 16253   236.109425/s
     iteration_duration.............: avg=952.27ms min=33.95ms med=899.21ms max=2.96s    p(90)=1.85s    p(95)=1.96s    p(99.9)=2.65s 
     iterations.....................: 15253   221.582296/s
     success_rate...................: 100.00% ✓ 15253      ✗ 0    
     vus............................: 97      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

