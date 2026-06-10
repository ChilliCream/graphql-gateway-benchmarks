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
| hive-router | v0.0.65 | 2,635 | 2,759 | 2,582 | 2.3% |  |
| hotchocolate | 16.1.3 | 2,097 | 2,142 | 2,082 | 1.0% |  |
| cosmo | 0.321.1 | 1,157 | 1,159 | 1,142 | 0.8% | non-compatible response (12 across 6/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 522 | 529 | 519 | 0.8% |  |
| hive-gateway | 2.8.2 | 215 | 219 | 213 | 0.8% |  |
| apollo-gateway | 2.14.1 | 204 | 208 | 202 | 0.9% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (11750 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (439220 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,170 | 2,279 | 2,129 | 2.3% |  |
| hotchocolate | 16.1.3 | 1,895 | 1,960 | 1,885 | 1.6% |  |
| cosmo | 0.321.1 | 1,059 | 1,068 | 1,051 | 0.8% | non-compatible response (12 across 6/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 489 | 500 | 486 | 1.1% |  |
| hive-gateway | 2.8.2 | 221 | 226 | 219 | 0.9% |  |
| apollo-gateway | 2.14.1 | 204 | 207 | 201 | 0.8% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (21395 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (362021 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 486516      ✗ 0     
     data_received..................: 14 GB   231 MB/s
     data_sent......................: 196 MB  3.2 MB/s
     http_req_blocked...............: avg=26.75µs min=1.09µs  med=2.73µs  max=77.88ms  p(90)=4.24µs   p(95)=5.36µs   p(99.9)=3.09ms  
     http_req_connecting............: avg=22.81µs min=0s      med=0s      max=77.8ms   p(90)=0s       p(95)=0s       p(99.9)=2.92ms  
     http_req_duration..............: avg=87.07ms min=1.65ms  med=80.09ms max=286.96ms p(90)=169.7ms  p(95)=184.73ms p(99.9)=232.16ms
       { expected_response:true }...: avg=87.07ms min=1.65ms  med=80.09ms max=286.96ms p(90)=169.7ms  p(95)=184.73ms p(99.9)=232.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163172
     http_req_receiving.............: avg=287.3µs min=29.53µs med=57.94µs max=101.62ms p(90)=187.74µs p(95)=408.47µs p(99.9)=35.35ms 
     http_req_sending...............: avg=85.94µs min=5.37µs  med=10.53µs max=58.76ms  p(90)=19.29µs  p(95)=133.13µs p(99.9)=12.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.7ms  min=1.61ms  med=79.78ms max=265.25ms p(90)=169.11ms p(95)=183.91ms p(99.9)=229.39ms
     http_reqs......................: 163172  2635.765534/s
     iteration_duration.............: avg=87.91ms min=2.37ms  med=81.04ms max=406.63ms p(90)=170.23ms p(95)=185.21ms p(99.9)=234.5ms 
     iterations.....................: 162172  2619.612239/s
     success_rate...................: 100.00% ✓ 162172      ✗ 0     
     vus............................: 54      min=0         max=499 
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

     checks.........................: 100.00% ✓ 392133      ✗ 0     
     data_received..................: 12 GB   184 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=21.46µs  min=1.06µs  med=2.64µs   max=57.06ms  p(90)=4.09µs   p(95)=5.13µs   p(99.9)=2.94ms  
     http_req_connecting............: avg=17.97µs  min=0s      med=0s       max=56.88ms  p(90)=0s       p(95)=0s       p(99.9)=2.77ms  
     http_req_duration..............: avg=108.04ms min=2.38ms  med=99.01ms  max=869.82ms p(90)=210.69ms p(95)=247.5ms  p(99.9)=453.68ms
       { expected_response:true }...: avg=108.04ms min=2.38ms  med=99.01ms  max=869.82ms p(90)=210.69ms p(95)=247.5ms  p(99.9)=453.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131711
     http_req_receiving.............: avg=2.11ms   min=51.19µs med=113.87µs max=306.22ms p(90)=1.4ms    p(95)=4.89ms   p(99.9)=179.86ms
     http_req_sending...............: avg=74.74µs  min=5.44µs  med=10.21µs  max=144.48ms p(90)=18.9µs   p(95)=124.88µs p(99.9)=10.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.85ms min=2.28ms  med=97.85ms  max=868.72ms p(90)=206.29ms p(95)=240.38ms p(99.9)=411.12ms
     http_reqs......................: 131711  2097.895003/s
     iteration_duration.............: avg=109.15ms min=3.85ms  med=100.21ms max=870.02ms p(90)=211.46ms p(95)=248.34ms p(99.9)=454.25ms
     iterations.....................: 130711  2081.966986/s
     success_rate...................: 100.00% ✓ 130711      ✗ 0     
     vus............................: 92      min=0         max=500 
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

     checks.........................: 100.00% ✓ 214083      ✗ 0    
     data_received..................: 6.3 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.81µs   min=1.03µs  med=2.62µs   max=13.4ms   p(90)=4.21µs   p(95)=5.11µs   p(99.9)=517.88µs
     http_req_connecting............: avg=2.42µs   min=0s      med=0s       max=13.18ms  p(90)=0s       p(95)=0s       p(99.9)=429.4µs 
     http_req_duration..............: avg=197.22ms min=2.07ms  med=196.46ms max=584.65ms p(90)=366.35ms p(95)=391.92ms p(99.9)=494ms   
       { expected_response:true }...: avg=197.22ms min=2.07ms  med=196.46ms max=584.65ms p(90)=366.35ms p(95)=391.92ms p(99.9)=494ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 72361
     http_req_receiving.............: avg=78.01µs  min=30.31µs med=62.81µs  max=25.3ms   p(90)=98.44µs  p(95)=113µs    p(99.9)=1.2ms   
     http_req_sending...............: avg=31.07µs  min=5.54µs  med=11.29µs  max=52.59ms  p(90)=17.72µs  p(95)=21.28µs  p(99.9)=3.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.11ms min=1.99ms  med=196.33ms max=584.53ms p(90)=366.27ms p(95)=391.81ms p(99.9)=493.92ms
     http_reqs......................: 72361   1157.504615/s
     iteration_duration.............: avg=200.23ms min=4.75ms  med=200.1ms  max=584.94ms p(90)=367.15ms p(95)=392.57ms p(99.9)=494.81ms
     iterations.....................: 71361   1141.508366/s
     success_rate...................: 100.00% ✓ 71361       ✗ 0    
     vus............................: 83      min=0         max=495
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

     checks.........................: 100.00% ✓ 98571      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   628 kB/s
     http_req_blocked...............: avg=9.68µs   min=1.12µs med=3.14µs   max=4.76ms   p(90)=5.04µs   p(95)=6.19µs   p(99.9)=1.71ms 
     http_req_connecting............: avg=5.45µs   min=0s     med=0s       max=4.72ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms 
     http_req_duration..............: avg=423.93ms min=3.86ms med=395.81ms max=1.63s    p(90)=837ms    p(95)=914.71ms p(99.9)=1.31s  
       { expected_response:true }...: avg=423.93ms min=3.86ms med=395.81ms max=1.63s    p(90)=837ms    p(95)=914.71ms p(99.9)=1.31s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 33857
     http_req_receiving.............: avg=158.03µs min=31.4µs med=79.16µs  max=186.83ms p(90)=116.8µs  p(95)=132.05µs p(99.9)=14.53ms
     http_req_sending...............: avg=26.67µs  min=5.66µs med=14.42µs  max=58.44ms  p(90)=22.29µs  p(95)=26.01µs  p(99.9)=2.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=423.74ms min=3.8ms  med=395.69ms max=1.63s    p(90)=836.89ms p(95)=914.45ms p(99.9)=1.3s   
     http_reqs......................: 33857   522.873248/s
     iteration_duration.............: avg=437.07ms min=7.01ms med=411.25ms max=1.64s    p(90)=841.01ms p(95)=918.7ms  p(99.9)=1.31s  
     iterations.....................: 32857   507.429669/s
     success_rate...................: 100.00% ✓ 32857      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 41316      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   260 kB/s
     http_req_blocked...............: avg=16.35µs  min=1.27µs  med=3.97µs   max=39.85ms p(90)=5.96µs  p(95)=7.86µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=10.62µs  min=0s      med=0s       max=39.79ms p(90)=0s      p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=944.44ms min=6.5ms   med=824.78ms max=22.39s  p(90)=1.61s   p(95)=1.73s    p(99.9)=20.08s  
       { expected_response:true }...: avg=944.44ms min=6.5ms   med=824.78ms max=22.39s  p(90)=1.61s   p(95)=1.73s    p(99.9)=20.08s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14772
     http_req_receiving.............: avg=108.72µs min=33.45µs med=103.13µs max=6ms     p(90)=142.3µs p(95)=155.51µs p(99.9)=842.74µs
     http_req_sending...............: avg=40.86µs  min=6.55µs  med=19.16µs  max=47.84ms p(90)=25.07µs p(95)=30.5µs   p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=944.29ms min=6.42ms  med=824.64ms max=22.39s  p(90)=1.61s   p(95)=1.73s    p(99.9)=20.08s  
     http_reqs......................: 14772   215.439129/s
     iteration_duration.............: avg=1.01s    min=46.53ms med=908.55ms max=22.39s  p(90)=1.63s   p(95)=1.74s    p(99.9)=20.36s  
     iterations.....................: 13772   200.854839/s
     success_rate...................: 100.00% ✓ 13772      ✗ 0    
     vus............................: 89      min=0        max=500
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

     checks.........................: 100.00% ✓ 42663      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   251 kB/s
     http_req_blocked...............: avg=17.14µs  min=1.32µs med=3.39µs   max=17.93ms  p(90)=4.99µs   p(95)=6.42µs   p(99.9)=2.6ms  
     http_req_connecting............: avg=12.01µs  min=0s     med=0s       max=17.82ms  p(90)=0s       p(95)=0s       p(99.9)=2.57ms 
     http_req_duration..............: avg=484.92ms min=8.44ms med=556.25ms max=1.34s    p(90)=831.55ms p(95)=892.34ms p(99.9)=1.23s  
       { expected_response:true }...: avg=484.92ms min=8.44ms med=556.25ms max=1.34s    p(90)=831.55ms p(95)=892.34ms p(99.9)=1.23s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15221
     http_req_receiving.............: avg=266.65µs min=35.2µs med=91.16µs  max=165.09ms p(90)=128.95µs p(95)=143.48µs p(99.9)=82.26ms
     http_req_sending...............: avg=41.68µs  min=6.05µs med=16.92µs  max=131.59ms p(90)=22.65µs  p(95)=27.67µs  p(99.9)=3.16ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=484.61ms min=8.31ms med=556.15ms max=1.34s    p(90)=831.45ms p(95)=892.25ms p(99.9)=1.22s  
     http_reqs......................: 15221   204.775456/s
     iteration_duration.............: avg=518.95ms min=9.01ms med=597.54ms max=1.35s    p(90)=839.07ms p(95)=898.39ms p(99.9)=1.23s  
     iterations.....................: 14221   191.321973/s
     success_rate...................: 100.00% ✓ 14221      ✗ 0    
     vus............................: 67      min=0        max=497
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

     checks.........................: 100.00% ✓ 402336      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=20.17µs  min=1.03µs med=2.78µs  max=63.44ms  p(90)=4.54µs   p(95)=5.8µs    p(99.9)=3.59ms  
     http_req_connecting............: avg=16.65µs  min=0s     med=0s      max=63.24ms  p(90)=0s       p(95)=0s       p(99.9)=3.52ms  
     http_req_duration..............: avg=105.28ms min=1.67ms med=99.14ms max=326.45ms p(90)=203.61ms p(95)=221.01ms p(99.9)=277.03ms
       { expected_response:true }...: avg=105.28ms min=1.67ms med=99.14ms max=326.45ms p(90)=203.61ms p(95)=221.01ms p(99.9)=277.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135112
     http_req_receiving.............: avg=190.17µs min=30.6µs med=63.19µs max=162.32ms p(90)=169.48µs p(95)=408.39µs p(99.9)=25.24ms 
     http_req_sending...............: avg=80.56µs  min=5.39µs med=11.54µs max=152.1ms  p(90)=21.72µs  p(95)=138.32µs p(99.9)=11.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.01ms min=1.59ms med=98.93ms max=315.97ms p(90)=203.15ms p(95)=220.51ms p(99.9)=274.33ms
     http_reqs......................: 135112  2170.175889/s
     iteration_duration.............: avg=106.35ms min=4.2ms  med=100.3ms max=372.14ms p(90)=204.15ms p(95)=221.56ms p(99.9)=278.39ms
     iterations.....................: 134112  2154.113837/s
     success_rate...................: 100.00% ✓ 134112      ✗ 0     
     vus............................: 69      min=0         max=495 
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

     checks.........................: 100.00% ✓ 351447      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=20.44µs  min=1.04µs  med=2.87µs   max=81.14ms  p(90)=4.6µs    p(95)=5.76µs   p(99.9)=3.04ms  
     http_req_connecting............: avg=16.7µs   min=0s      med=0s       max=81.08ms  p(90)=0s       p(95)=0s       p(99.9)=2.9ms   
     http_req_duration..............: avg=120.48ms min=1.81ms  med=111.83ms max=823.77ms p(90)=234.17ms p(95)=266.5ms  p(99.9)=590.65ms
       { expected_response:true }...: avg=120.48ms min=1.81ms  med=111.83ms max=823.77ms p(90)=234.17ms p(95)=266.5ms  p(99.9)=590.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118149
     http_req_receiving.............: avg=1.82ms   min=53.38µs med=118.63µs max=311.57ms p(90)=1.77ms   p(95)=4.93ms   p(99.9)=135.08ms
     http_req_sending...............: avg=68.97µs  min=5.33µs  med=11.1µs   max=51.36ms  p(90)=20.83µs  p(95)=126.3µs  p(99.9)=9.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.58ms min=1.7ms   med=110.52ms max=823.65ms p(90)=230.92ms p(95)=260.21ms p(99.9)=589.45ms
     http_reqs......................: 118149  1895.766138/s
     iteration_duration.............: avg=121.8ms  min=3.03ms  med=113.38ms max=823.97ms p(90)=234.98ms p(95)=267.2ms  p(99.9)=591.08ms
     iterations.....................: 117149  1879.720584/s
     success_rate...................: 100.00% ✓ 117149      ✗ 0     
     vus............................: 74      min=0         max=494 
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

     checks.........................: 100.00% ✓ 196449      ✗ 0    
     data_received..................: 5.8 GB  93 MB/s
     data_sent......................: 80 MB   1.3 MB/s
     http_req_blocked...............: avg=8.08µs   min=1.02µs  med=2.87µs   max=39.94ms  p(90)=4.58µs   p(95)=5.52µs   p(99.9)=626.24µs
     http_req_connecting............: avg=4.32µs   min=0s      med=0s       max=39.87ms  p(90)=0s       p(95)=0s       p(99.9)=544.32µs
     http_req_duration..............: avg=214.67ms min=2.17ms  med=216.05ms max=603.33ms p(90)=397.58ms p(95)=427.81ms p(99.9)=532.38ms
       { expected_response:true }...: avg=214.67ms min=2.17ms  med=216.05ms max=603.33ms p(90)=397.58ms p(95)=427.81ms p(99.9)=532.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 66483
     http_req_receiving.............: avg=124.11µs min=29.63µs med=69.48µs  max=159.09ms p(90)=106.87µs p(95)=122.7µs  p(99.9)=3.06ms  
     http_req_sending...............: avg=31.89µs  min=5.4µs   med=12.21µs  max=89.63ms  p(90)=19.26µs  p(95)=22.88µs  p(99.9)=3.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.51ms min=2.09ms  med=215.83ms max=603.26ms p(90)=397.43ms p(95)=427.7ms  p(99.9)=532.28ms
     http_reqs......................: 66483   1059.727151/s
     iteration_duration.............: avg=218.2ms  min=6.91ms  med=219.94ms max=603.48ms p(90)=398.56ms p(95)=428.64ms p(99.9)=533.29ms
     iterations.....................: 65483   1043.787329/s
     success_rate...................: 100.00% ✓ 65483       ✗ 0    
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

     checks.........................: 100.00% ✓ 92781      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   588 kB/s
     http_req_blocked...............: avg=9.56µs   min=1.23µs  med=3.44µs   max=13.96ms p(90)=5.27µs   p(95)=6.27µs   p(99.9)=1.13ms  
     http_req_connecting............: avg=5.05µs   min=0s      med=0s       max=13.91ms p(90)=0s       p(95)=0s       p(99.9)=1.06ms  
     http_req_duration..............: avg=449.68ms min=4.01ms  med=418.97ms max=1.95s   p(90)=889.67ms p(95)=961.74ms p(99.9)=1.41s   
       { expected_response:true }...: avg=449.68ms min=4.01ms  med=418.97ms max=1.95s   p(90)=889.67ms p(95)=961.74ms p(99.9)=1.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31927
     http_req_receiving.............: avg=93.26µs  min=33.25µs med=82.66µs  max=47.89ms p(90)=119.55µs p(95)=133.77µs p(99.9)=999.01µs
     http_req_sending...............: avg=26.89µs  min=5.7µs   med=15.38µs  max=38.24ms p(90)=22.52µs  p(95)=25.79µs  p(99.9)=2.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=449.56ms min=3.94ms  med=418.88ms max=1.95s   p(90)=889.59ms p(95)=961.59ms p(99.9)=1.41s   
     http_reqs......................: 31927   489.931308/s
     iteration_duration.............: avg=464.43ms min=14.14ms med=438.54ms max=1.95s   p(90)=893.44ms p(95)=965.11ms p(99.9)=1.42s   
     iterations.....................: 30927   474.585948/s
     success_rate...................: 100.00% ✓ 30927      ✗ 0    
     vus............................: 65      min=0        max=497
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

     checks.........................: 100.00% ✓ 42447      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   266 kB/s
     http_req_blocked...............: avg=17.25µs  min=1.39µs  med=3.82µs   max=13.45ms p(90)=5.79µs   p(95)=7.48µs   p(99.9)=2.81ms  
     http_req_connecting............: avg=11.68µs  min=0s      med=0s       max=13.4ms  p(90)=0s       p(95)=0s       p(99.9)=2.78ms  
     http_req_duration..............: avg=964.03ms min=6.35ms  med=863.27ms max=5.98s   p(90)=1.89s    p(95)=2.14s    p(99.9)=5.19s   
       { expected_response:true }...: avg=964.03ms min=6.35ms  med=863.27ms max=5.98s   p(90)=1.89s    p(95)=2.14s    p(99.9)=5.19s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15149
     http_req_receiving.............: avg=110.08µs min=40.06µs med=100.69µs max=65.2ms  p(90)=139.36µs p(95)=151.93µs p(99.9)=889.16µs
     http_req_sending...............: avg=45.29µs  min=6.2µs   med=18.64µs  max=85.14ms p(90)=24.83µs  p(95)=30.5µs   p(99.9)=3.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=963.88ms min=6.25ms  med=863.17ms max=5.98s   p(90)=1.89s    p(95)=2.14s    p(99.9)=5.18s   
     http_reqs......................: 15149   221.936831/s
     iteration_duration.............: avg=1.03s    min=63.52ms med=943.8ms  max=5.98s   p(90)=1.92s    p(95)=2.18s    p(99.9)=5.21s   
     iterations.....................: 14149   207.286568/s
     success_rate...................: 100.00% ✓ 14149      ✗ 0    
     vus............................: 68      min=0        max=500
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

     checks.........................: 100.00% ✓ 40032      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=15.65µs  min=1.4µs   med=3.72µs   max=5.7ms   p(90)=5.58µs  p(95)=7.3µs   p(99.9)=2.35ms  
     http_req_connecting............: avg=10.08µs  min=0s      med=0s       max=5.6ms   p(90)=0s      p(95)=0s      p(99.9)=2.31ms  
     http_req_duration..............: avg=1.01s    min=8.76ms  med=928.46ms max=4.33s   p(90)=2.07s   p(95)=2.22s   p(99.9)=3.83s   
       { expected_response:true }...: avg=1.01s    min=8.76ms  med=928.46ms max=4.33s   p(90)=2.07s   p(95)=2.22s   p(99.9)=3.83s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14344
     http_req_receiving.............: avg=110.15µs min=36.78µs med=98.57µs  max=73.85ms p(90)=139µs   p(95)=151.4µs p(99.9)=545.15µs
     http_req_sending...............: avg=32.67µs  min=5.39µs  med=18.45µs  max=13.66ms p(90)=24.19µs p(95)=29.19µs p(99.9)=3.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=1.01s    min=8.66ms  med=928.34ms max=4.33s   p(90)=2.07s   p(95)=2.22s   p(99.9)=3.83s   
     http_reqs......................: 14344   204.95652/s
     iteration_duration.............: avg=1.09s    min=38.11ms med=1s       max=4.33s   p(90)=2.08s   p(95)=2.22s   p(99.9)=3.84s   
     iterations.....................: 13344   190.667861/s
     success_rate...................: 100.00% ✓ 13344      ✗ 0    
     vus............................: 41      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

