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
| hive-router | v0.0.49 | 2,638 | 2,746 | 2,591 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,051 | 2,104 | 2,035 | 1.1% |  |
| cosmo | 0.307.0 | 1,189 | 1,189 | 1,166 | 1.4% | non-compatible response (13 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 504 | 509 | 501 | 0.5% |  |
| hive-gateway | 2.5.25 | 228 | 231 | 226 | 0.7% |  |
| apollo-gateway | 2.13.3 | 204 | 210 | 203 | 1.0% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (15742 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (413904 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,191 | 2,304 | 2,153 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,879 | 1,918 | 1,861 | 0.9% |  |
| cosmo | 0.307.0 | 1,129 | 1,129 | 1,120 | 0.6% | non-compatible response (13 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 482 | 488 | 478 | 0.8% |  |
| hive-gateway | 2.5.25 | 228 | 231 | 225 | 0.7% |  |
| apollo-gateway | 2.13.3 | 212 | 213 | 210 | 0.4% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (14554 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (275715 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 486930      ✗ 0     
     data_received..................: 14 GB   231 MB/s
     data_sent......................: 196 MB  3.2 MB/s
     http_req_blocked...............: avg=24.14µs  min=992ns   med=2.23µs  max=67.61ms  p(90)=3.53µs   p(95)=4.52µs   p(99.9)=2.96ms  
     http_req_connecting............: avg=20.99µs  min=0s      med=0s      max=67.43ms  p(90)=0s       p(95)=0s       p(99.9)=2.69ms  
     http_req_duration..............: avg=87.02ms  min=1.58ms  med=81.94ms max=313.83ms p(90)=167.86ms p(95)=182.92ms p(99.9)=239.94ms
       { expected_response:true }...: avg=87.02ms  min=1.58ms  med=81.94ms max=313.83ms p(90)=167.86ms p(95)=182.92ms p(99.9)=239.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163310
     http_req_receiving.............: avg=268.99µs min=28.64µs med=56.45µs max=243.49ms p(90)=201.41µs p(95)=403.3µs  p(99.9)=30.64ms 
     http_req_sending...............: avg=81.81µs  min=5.32µs  med=9.87µs  max=200.53ms p(90)=17.91µs  p(95)=130.73µs p(99.9)=12.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.67ms  min=1.53ms  med=81.63ms max=274.25ms p(90)=167.38ms p(95)=182.08ms p(99.9)=235.92ms
     http_reqs......................: 163310  2638.598764/s
     iteration_duration.............: avg=87.83ms  min=2.12ms  med=82.84ms max=352.64ms p(90)=168.38ms p(95)=183.47ms p(99.9)=242.33ms
     iterations.....................: 162310  2622.44177/s
     success_rate...................: 100.00% ✓ 162310      ✗ 0     
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

     checks.........................: 100.00% ✓ 382575      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=17.35µs  min=1.03µs med=2.47µs   max=74.37ms  p(90)=3.86µs   p(95)=4.76µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=14.2µs   min=0s     med=0s       max=74.31ms  p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=110.73ms min=2.38ms med=98.03ms  max=716.8ms  p(90)=220.93ms p(95)=262.37ms p(99.9)=491.45ms
       { expected_response:true }...: avg=110.73ms min=2.38ms med=98.03ms  max=716.8ms  p(90)=220.93ms p(95)=262.37ms p(99.9)=491.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128525
     http_req_receiving.............: avg=2.85ms   min=54.3µs med=119.12µs max=354.18ms p(90)=1.65ms   p(95)=6.56ms   p(99.9)=165.8ms 
     http_req_sending...............: avg=69.65µs  min=5.37µs med=9.98µs   max=163.85ms p(90)=18.43µs  p(95)=124.99µs p(99.9)=9.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.8ms  min=2.28ms med=96.77ms  max=716.37ms p(90)=215.33ms p(95)=250.24ms p(99.9)=436.17ms
     http_reqs......................: 128525  2051.380045/s
     iteration_duration.............: avg=111.89ms min=3.79ms med=99.24ms  max=717.04ms p(90)=221.79ms p(95)=263.16ms p(99.9)=491.91ms
     iterations.....................: 127525  2035.419104/s
     success_rate...................: 100.00% ✓ 127525      ✗ 0     
     vus............................: 87      min=0         max=498 
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

     checks.........................: 100.00% ✓ 219969      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=6.11µs   min=1.11µs  med=2.08µs   max=20.41ms  p(90)=3.24µs   p(95)=3.96µs   p(99.9)=577.22µs
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=20.27ms  p(90)=0s       p(95)=0s       p(99.9)=496.49µs
     http_req_duration..............: avg=192.04ms min=1.98ms  med=191.05ms max=536.08ms p(90)=358.59ms p(95)=385.21ms p(99.9)=475.39ms
       { expected_response:true }...: avg=192.04ms min=1.98ms  med=191.05ms max=536.08ms p(90)=358.59ms p(95)=385.21ms p(99.9)=475.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74323
     http_req_receiving.............: avg=71.47µs  min=30.09µs med=57.31µs  max=74.33ms  p(90)=86.66µs  p(95)=99.37µs  p(99.9)=1.49ms  
     http_req_sending...............: avg=27.2µs   min=5.33µs  med=9.92µs   max=123.44ms p(90)=14.71µs  p(95)=18.15µs  p(99.9)=3.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.94ms min=1.93ms  med=190.93ms max=536.02ms p(90)=358.5ms  p(95)=385.1ms  p(99.9)=475.33ms
     http_reqs......................: 74323   1189.769388/s
     iteration_duration.............: avg=194.87ms min=5.45ms  med=194.09ms max=536.22ms p(90)=359.54ms p(95)=385.94ms p(99.9)=475.61ms
     iterations.....................: 73323   1173.761296/s
     success_rate...................: 100.00% ✓ 73323       ✗ 0    
     vus............................: 79      min=0         max=493
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

     checks.........................: 100.00% ✓ 95094      ✗ 0    
     data_received..................: 2.9 GB  44 MB/s
     data_sent......................: 39 MB   605 kB/s
     http_req_blocked...............: avg=11.19µs  min=1.22µs  med=2.86µs   max=41.09ms  p(90)=4.7µs    p(95)=5.78µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=7.17µs   min=0s      med=0s       max=41.03ms  p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=439.05ms min=4ms     med=409.24ms max=1.85s    p(90)=864.3ms  p(95)=935.6ms  p(99.9)=1.41s   
       { expected_response:true }...: avg=439.05ms min=4ms     med=409.24ms max=1.85s    p(90)=864.3ms  p(95)=935.6ms  p(99.9)=1.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32698
     http_req_receiving.............: avg=87.32µs  min=33.06µs med=75.92µs  max=55.4ms   p(90)=113.67µs p(95)=127.37µs p(99.9)=931.31µs
     http_req_sending...............: avg=29.08µs  min=5.89µs  med=13.31µs  max=132.48ms p(90)=21.36µs  p(95)=24.63µs  p(99.9)=2.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=438.93ms min=3.93ms  med=409.15ms max=1.85s    p(90)=864.18ms p(95)=935.45ms p(99.9)=1.41s   
     http_reqs......................: 32698   504.258327/s
     iteration_duration.............: avg=453.13ms min=20.4ms  med=425.91ms max=1.86s    p(90)=868.01ms p(95)=938.77ms p(99.9)=1.42s   
     iterations.....................: 31698   488.83664/s
     success_rate...................: 100.00% ✓ 31698      ✗ 0    
     vus............................: 97      min=0        max=500
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

     checks.........................: 100.00% ✓ 43854      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   275 kB/s
     http_req_blocked...............: avg=12.59µs  min=1.34µs  med=3.55µs   max=5.51ms  p(90)=5.44µs   p(95)=7.32µs   p(99.9)=1.43ms
     http_req_connecting............: avg=6.96µs   min=0s      med=0s       max=5.44ms  p(90)=0s       p(95)=0s       p(99.9)=1.34ms
     http_req_duration..............: avg=920.41ms min=6.12ms  med=797.2ms  max=17.15s  p(90)=1.56s    p(95)=1.72s    p(99.9)=16.89s
       { expected_response:true }...: avg=920.41ms min=6.12ms  med=797.2ms  max=17.15s  p(90)=1.56s    p(95)=1.72s    p(99.9)=16.89s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15618
     http_req_receiving.............: avg=161.87µs min=33.84µs med=96.69µs  max=80.41ms p(90)=137.23µs p(95)=152.05µs p(99.9)=26.4ms
     http_req_sending...............: avg=26.9µs   min=6.1µs   med=17.83µs  max=9.77ms  p(90)=24.27µs  p(95)=28.94µs  p(99.9)=2.06ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=920.23ms min=6.03ms  med=797.1ms  max=17.15s  p(90)=1.56s    p(95)=1.72s    p(99.9)=16.88s
     http_reqs......................: 15618   228.757396/s
     iteration_duration.............: avg=983.37ms min=47.8ms  med=869.01ms max=17.16s  p(90)=1.57s    p(95)=1.74s    p(99.9)=16.9s 
     iterations.....................: 14618   214.110361/s
     success_rate...................: 100.00% ✓ 14618      ✗ 0    
     vus............................: 61      min=0        max=498
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

     checks.........................: 100.00% ✓ 42612      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   252 kB/s
     http_req_blocked...............: avg=16.56µs  min=1.26µs  med=3.36µs   max=15.56ms  p(90)=5.04µs   p(95)=6.48µs   p(99.9)=2.72ms 
     http_req_connecting............: avg=11.35µs  min=0s      med=0s       max=15.5ms   p(90)=0s       p(95)=0s       p(99.9)=2.65ms 
     http_req_duration..............: avg=418.82ms min=8.51ms  med=449.86ms max=1.42s    p(90)=748.81ms p(95)=818.12ms p(99.9)=1.16s  
       { expected_response:true }...: avg=418.82ms min=8.51ms  med=449.86ms max=1.42s    p(90)=748.81ms p(95)=818.12ms p(99.9)=1.16s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15204
     http_req_receiving.............: avg=238.19µs min=37.53µs med=90.52µs  max=157.89ms p(90)=130.62µs p(95)=144.73µs p(99.9)=75.38ms
     http_req_sending...............: avg=35.27µs  min=6.22µs  med=16.38µs  max=46.46ms  p(90)=22.59µs  p(95)=27.19µs  p(99.9)=3.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=418.55ms min=8.4ms   med=449.62ms max=1.42s    p(90)=748.73ms p(95)=818.02ms p(99.9)=1.16s  
     http_reqs......................: 15204   204.54135/s
     iteration_duration.............: avg=448.21ms min=9.01ms  med=474ms    max=1.43s    p(90)=755.8ms  p(95)=825.43ms p(99.9)=1.18s  
     iterations.....................: 14204   191.088222/s
     success_rate...................: 100.00% ✓ 14204      ✗ 0    
     vus............................: 65      min=0        max=494
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

     checks.........................: 100.00% ✓ 405348      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=17.71µs  min=1.06µs  med=2.44µs   max=67.72ms  p(90)=4.03µs   p(95)=5.21µs   p(99.9)=2.27ms  
     http_req_connecting............: avg=14.27µs  min=0s      med=0s       max=63.8ms   p(90)=0s       p(95)=0s       p(99.9)=2.19ms  
     http_req_duration..............: avg=104.51ms min=1.67ms  med=100.04ms max=346.05ms p(90)=200.57ms p(95)=216.55ms p(99.9)=260.18ms
       { expected_response:true }...: avg=104.51ms min=1.67ms  med=100.04ms max=346.05ms p(90)=200.57ms p(95)=216.55ms p(99.9)=260.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136116
     http_req_receiving.............: avg=165.72µs min=30.52µs med=61.45µs  max=128.25ms p(90)=157.34µs p(95)=396.13µs p(99.9)=16.67ms 
     http_req_sending...............: avg=70.91µs  min=5.58µs  med=10.79µs  max=225.12ms p(90)=19.98µs  p(95)=133.03µs p(99.9)=9.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.28ms min=1.6ms   med=99.83ms  max=345.4ms  p(90)=200.28ms p(95)=216.22ms p(99.9)=258.39ms
     http_reqs......................: 136116  2191.919746/s
     iteration_duration.............: avg=105.56ms min=5.33ms  med=101.24ms max=386.41ms p(90)=201.12ms p(95)=217ms    p(99.9)=260.95ms
     iterations.....................: 135116  2175.816424/s
     success_rate...................: 100.00% ✓ 135116      ✗ 0     
     vus............................: 63      min=0         max=497 
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

     checks.........................: 100.00% ✓ 347610      ✗ 0     
     data_received..................: 10 GB   165 MB/s
     data_sent......................: 140 MB  2.3 MB/s
     http_req_blocked...............: avg=12.93µs  min=1.04µs  med=2.29µs   max=44.37ms  p(90)=3.81µs   p(95)=4.86µs   p(99.9)=1.13ms  
     http_req_connecting............: avg=9.98µs   min=0s      med=0s       max=44.2ms   p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=121.83ms min=1.8ms   med=110.66ms max=945.32ms p(90)=237.47ms p(95)=270.17ms p(99.9)=620.01ms
       { expected_response:true }...: avg=121.83ms min=1.8ms   med=110.66ms max=945.32ms p(90)=237.47ms p(95)=270.17ms p(99.9)=620.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 116870
     http_req_receiving.............: avg=1.59ms   min=52.35µs med=115.37µs max=492.15ms p(90)=1.65ms   p(95)=4.17ms   p(99.9)=126.83ms
     http_req_sending...............: avg=58.65µs  min=5.3µs   med=10.04µs  max=151.42ms p(90)=18.76µs  p(95)=114.67µs p(99.9)=7.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.18ms min=1.69ms  med=109.38ms max=922.92ms p(90)=235.04ms p(95)=265.94ms p(99.9)=616.35ms
     http_reqs......................: 116870  1879.043385/s
     iteration_duration.............: avg=123.16ms min=3.07ms  med=112.25ms max=945.54ms p(90)=238.23ms p(95)=270.93ms p(99.9)=620.99ms
     iterations.....................: 115870  1862.965321/s
     success_rate...................: 100.00% ✓ 115870      ✗ 0     
     vus............................: 68      min=0         max=496 
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

     checks.........................: 100.00% ✓ 208974      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=7.36µs   min=1.08µs  med=2.22µs   max=14.13ms  p(90)=3.68µs   p(95)=4.55µs   p(99.9)=449.16µs
     http_req_connecting............: avg=4.48µs   min=0s      med=0s       max=14.07ms  p(90)=0s       p(95)=0s       p(99.9)=404.93µs
     http_req_duration..............: avg=201.98ms min=2.08ms  med=202.84ms max=658.59ms p(90)=373.95ms p(95)=401.69ms p(99.9)=521.09ms
       { expected_response:true }...: avg=201.98ms min=2.08ms  med=202.84ms max=658.59ms p(90)=373.95ms p(95)=401.69ms p(99.9)=521.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70658
     http_req_receiving.............: avg=86.22µs  min=29.92µs med=62.76µs  max=251.86ms p(90)=97.84µs  p(95)=112.34µs p(99.9)=1.71ms  
     http_req_sending...............: avg=33.67µs  min=5.43µs  med=10.66µs  max=185.22ms p(90)=17.01µs  p(95)=20.53µs  p(99.9)=3.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.86ms min=1.98ms  med=202.68ms max=658.48ms p(90)=373.87ms p(95)=401.59ms p(99.9)=521.01ms
     http_reqs......................: 70658   1129.925297/s
     iteration_duration.............: avg=205.14ms min=5.58ms  med=206ms    max=658.76ms p(90)=374.91ms p(95)=402.39ms p(99.9)=522.03ms
     iterations.....................: 69658   1113.933827/s
     success_rate...................: 100.00% ✓ 69658       ✗ 0    
     vus............................: 82      min=0         max=498
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

     checks.........................: 100.00% ✓ 91509      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   580 kB/s
     http_req_blocked...............: avg=12.33µs  min=1.23µs  med=2.87µs   max=22.45ms  p(90)=4.69µs   p(95)=5.64µs   p(99.9)=1.67ms
     http_req_connecting............: avg=8.31µs   min=0s      med=0s       max=22.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.62ms
     http_req_duration..............: avg=455.92ms min=4.19ms  med=425.32ms max=1.96s    p(90)=896.6ms  p(95)=974.66ms p(99.9)=1.45s 
       { expected_response:true }...: avg=455.92ms min=4.19ms  med=425.32ms max=1.96s    p(90)=896.6ms  p(95)=974.66ms p(99.9)=1.45s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31503
     http_req_receiving.............: avg=114.48µs min=32.68µs med=79.67µs  max=97.25ms  p(90)=118.27µs p(95)=133.38µs p(99.9)=1.09ms
     http_req_sending...............: avg=40.71µs  min=5.87µs  med=13.8µs   max=146.81ms p(90)=21.55µs  p(95)=24.94µs  p(99.9)=3.64ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=455.77ms min=4.11ms  med=425.2ms  max=1.96s    p(90)=896.49ms p(95)=974.52ms p(99.9)=1.45s 
     http_reqs......................: 31503   482.943655/s
     iteration_duration.............: avg=471.07ms min=33.66ms med=443.47ms max=1.96s    p(90)=901.74ms p(95)=978.17ms p(99.9)=1.45s 
     iterations.....................: 30503   467.61357/s
     success_rate...................: 100.00% ✓ 30503      ✗ 0    
     vus............................: 69      min=0        max=496
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

     checks.........................: 100.00% ✓ 43791      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   275 kB/s
     http_req_blocked...............: avg=19.11µs  min=1.39µs  med=3.76µs   max=34.75ms p(90)=5.73µs   p(95)=7.5µs   p(99.9)=2.95ms
     http_req_connecting............: avg=13.47µs  min=0s      med=0s       max=34.69ms p(90)=0s       p(95)=0s      p(99.9)=2.93ms
     http_req_duration..............: avg=936.03ms min=6.3ms   med=841.2ms  max=5.49s   p(90)=1.86s    p(95)=2.07s   p(99.9)=4.93s 
       { expected_response:true }...: avg=936.03ms min=6.3ms   med=841.2ms  max=5.49s   p(90)=1.86s    p(95)=2.07s   p(99.9)=4.93s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15597
     http_req_receiving.............: avg=114.35µs min=36.7µs  med=100.32µs max=37.68ms p(90)=140.45µs p(95)=153µs   p(99.9)=1.26ms
     http_req_sending...............: avg=40.49µs  min=6.49µs  med=18.63µs  max=50.8ms  p(90)=24.96µs  p(95)=30.08µs p(99.9)=3.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=935.88ms min=6.22ms  med=841.1ms  max=5.49s   p(90)=1.86s    p(95)=2.07s   p(99.9)=4.93s 
     http_reqs......................: 15597   228.770635/s
     iteration_duration.............: avg=1s       min=54.57ms med=923.59ms max=5.5s    p(90)=1.89s    p(95)=2.09s   p(99.9)=4.94s 
     iterations.....................: 14597   214.10303/s
     success_rate...................: 100.00% ✓ 14597      ✗ 0    
     vus............................: 65      min=0        max=500
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

     checks.........................: 100.00% ✓ 41508      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   255 kB/s
     http_req_blocked...............: avg=17.3µs   min=1.18µs  med=3.53µs   max=14.61ms p(90)=5.29µs   p(95)=7.07µs   p(99.9)=3.06ms
     http_req_connecting............: avg=11.85µs  min=0s      med=0s       max=14.56ms p(90)=0s       p(95)=0s       p(99.9)=3.02ms
     http_req_duration..............: avg=981.93ms min=8.58ms  med=910.19ms max=3.81s   p(90)=2s       p(95)=2.14s    p(99.9)=3.35s 
       { expected_response:true }...: avg=981.93ms min=8.58ms  med=910.19ms max=3.81s   p(90)=2s       p(95)=2.14s    p(99.9)=3.35s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14836
     http_req_receiving.............: avg=102.57µs min=33.92µs med=95.41µs  max=5.43ms  p(90)=135.86µs p(95)=148.99µs p(99.9)=1.17ms
     http_req_sending...............: avg=30.62µs  min=6.19µs  med=17.52µs  max=10.2ms  p(90)=23.44µs  p(95)=28.88µs  p(99.9)=3.34ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=981.8ms  min=8.48ms  med=910.09ms max=3.81s   p(90)=2s       p(95)=2.14s    p(99.9)=3.35s 
     http_reqs......................: 14836   212.821516/s
     iteration_duration.............: avg=1.05s    min=33.33ms med=999.7ms  max=3.82s   p(90)=2.02s    p(95)=2.15s    p(99.9)=3.37s 
     iterations.....................: 13836   198.476577/s
     success_rate...................: 100.00% ✓ 13836      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

