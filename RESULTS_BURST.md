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
| hive-router | v0.0.49 | 2,695 | 2,810 | 2,650 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,067 | 2,113 | 2,049 | 1.1% |  |
| cosmo | 0.307.0 | 1,185 | 1,185 | 1,160 | 1.5% | non-compatible response (10 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 490 | 499 | 486 | 0.9% |  |
| hive-gateway | 2.5.25 | 231 | 234 | 229 | 0.7% |  |
| apollo-gateway | 2.13.3 | 200 | 205 | 199 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (17721 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (504839 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,271 | 2,361 | 2,252 | 1.8% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,892 | 1,934 | 1,871 | 1.2% |  |
| cosmo | 0.307.0 | 1,115 | 1,125 | 1,106 | 0.7% | non-compatible response (9 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 474 | 485 | 472 | 1.0% |  |
| hive-gateway | 2.5.25 | 225 | 228 | 224 | 0.7% |  |
| apollo-gateway | 2.13.3 | 204 | 209 | 203 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (17465 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (311502 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 497166      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=28.85µs min=1.02µs  med=2.68µs  max=78.16ms  p(90)=4.29µs   p(95)=5.45µs   p(99.9)=5.96ms  
     http_req_connecting............: avg=25.09µs min=0s      med=0s      max=77.96ms  p(90)=0s       p(95)=0s       p(99.9)=5.78ms  
     http_req_duration..............: avg=85.21ms min=1.54ms  med=79.21ms max=347.3ms  p(90)=165.64ms p(95)=183.05ms p(99.9)=243.7ms 
       { expected_response:true }...: avg=85.21ms min=1.54ms  med=79.21ms max=347.3ms  p(90)=165.64ms p(95)=183.05ms p(99.9)=243.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 166722
     http_req_receiving.............: avg=323.5µs min=29.03µs med=57.68µs max=174.05ms p(90)=208.96µs p(95)=417.54µs p(99.9)=37.37ms 
     http_req_sending...............: avg=92.25µs min=5.11µs  med=10.36µs max=170.56ms p(90)=19.51µs  p(95)=135.84µs p(99.9)=14.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.79ms min=1.46ms  med=78.92ms max=326.92ms p(90)=164.91ms p(95)=182.09ms p(99.9)=240.05ms
     http_reqs......................: 166722  2695.631205/s
     iteration_duration.............: avg=86.02ms min=2.34ms  med=80.1ms  max=381.51ms p(90)=166.18ms p(95)=183.65ms p(99.9)=245.46ms
     iterations.....................: 165722  2679.462785/s
     success_rate...................: 100.00% ✓ 165722      ✗ 0     
     vus............................: 51      min=0         max=499 
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

     checks.........................: 100.00% ✓ 386019      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=17.03µs  min=1.06µs  med=2.67µs   max=101.56ms p(90)=4.13µs   p(95)=5.1µs    p(99.9)=1.77ms  
     http_req_connecting............: avg=13.69µs  min=0s      med=0s       max=101.48ms p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=109.76ms min=2.38ms  med=100.85ms max=702.13ms p(90)=212.33ms p(95)=252.88ms p(99.9)=478.38ms
       { expected_response:true }...: avg=109.76ms min=2.38ms  med=100.85ms max=702.13ms p(90)=212.33ms p(95)=252.88ms p(99.9)=478.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129673
     http_req_receiving.............: avg=2.33ms   min=53.26µs med=116.56µs max=419.68ms p(90)=1.45ms   p(95)=5.83ms   p(99.9)=165.34ms
     http_req_sending...............: avg=70.09µs  min=5.49µs  med=10.48µs  max=86.91ms  p(90)=18.58µs  p(95)=124.49µs p(99.9)=9.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.35ms min=2.27ms  med=99.68ms  max=692.72ms p(90)=208.41ms p(95)=243.63ms p(99.9)=415.04ms
     http_reqs......................: 129673  2067.558197/s
     iteration_duration.............: avg=110.88ms min=3.48ms  med=102.18ms max=702.34ms p(90)=213.15ms p(95)=253.88ms p(99.9)=479.18ms
     iterations.....................: 128673  2051.613797/s
     success_rate...................: 100.00% ✓ 128673      ✗ 0     
     vus............................: 91      min=0         max=500 
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

     checks.........................: 100.00% ✓ 219114      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=6.74µs   min=1.1µs  med=2.42µs   max=44.76ms  p(90)=3.79µs   p(95)=4.5µs    p(99.9)=578.27µs
     http_req_connecting............: avg=3.68µs   min=0s     med=0s       max=44.71ms  p(90)=0s       p(95)=0s       p(99.9)=534.36µs
     http_req_duration..............: avg=192.7ms  min=2.01ms med=195.14ms max=582.01ms p(90)=355.44ms p(95)=382.48ms p(99.9)=480.01ms
       { expected_response:true }...: avg=192.7ms  min=2.01ms med=195.14ms max=582.01ms p(90)=355.44ms p(95)=382.48ms p(99.9)=480.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74038
     http_req_receiving.............: avg=74.36µs  min=29.3µs med=58.94µs  max=105.43ms p(90)=89.53µs  p(95)=101.29µs p(99.9)=1.62ms  
     http_req_sending...............: avg=32.9µs   min=5.58µs med=10.48µs  max=184.83ms p(90)=15.43µs  p(95)=18.61µs  p(99.9)=3.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.59ms min=1.95ms med=195.05ms max=581.94ms p(90)=355.33ms p(95)=382.35ms p(99.9)=479.95ms
     http_reqs......................: 74038   1185.38139/s
     iteration_duration.............: avg=195.58ms min=5.37ms med=198.39ms max=582.15ms p(90)=356.44ms p(95)=383.2ms  p(99.9)=482.24ms
     iterations.....................: 73038   1169.370944/s
     success_rate...................: 100.00% ✓ 73038       ✗ 0    
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

     checks.........................: 100.00% ✓ 92724      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   589 kB/s
     http_req_blocked...............: avg=9.68µs   min=1.29µs  med=3.05µs   max=17.02ms p(90)=4.84µs   p(95)=5.9µs    p(99.9)=1.48ms  
     http_req_connecting............: avg=5.56µs   min=0s      med=0s       max=16.97ms p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=450.11ms min=4.09ms  med=418.7ms  max=2.11s   p(90)=884.38ms p(95)=957.76ms p(99.9)=1.46s   
       { expected_response:true }...: avg=450.11ms min=4.09ms  med=418.7ms  max=2.11s   p(90)=884.38ms p(95)=957.76ms p(99.9)=1.46s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31908
     http_req_receiving.............: avg=88.49µs  min=33.33µs med=76.78µs  max=35.97ms p(90)=113.61µs p(95)=126.81µs p(99.9)=874.57µs
     http_req_sending...............: avg=33.02µs  min=6µs     med=13.85µs  max=98.28ms p(90)=21.2µs   p(95)=24.73µs  p(99.9)=2.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=449.99ms min=4.04ms  med=418.63ms max=2.11s   p(90)=884.28ms p(95)=957.69ms p(99.9)=1.46s   
     http_reqs......................: 31908   490.924315/s
     iteration_duration.............: avg=464.9ms  min=24.75ms med=436.47ms max=2.12s   p(90)=888.51ms p(95)=961.22ms p(99.9)=1.47s   
     iterations.....................: 30908   475.538696/s
     success_rate...................: 100.00% ✓ 30908      ✗ 0    
     vus............................: 56      min=0        max=499
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
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=16.98µs  min=1.39µs  med=3.58µs   max=18.97ms p(90)=5.41µs   p(95)=7.17µs   p(99.9)=2.66ms  
     http_req_connecting............: avg=11.67µs  min=0s      med=0s       max=18.91ms p(90)=0s       p(95)=0s       p(99.9)=2.64ms  
     http_req_duration..............: avg=908.75ms min=5.93ms  med=789.73ms max=18.31s  p(90)=1.55s    p(95)=1.75s    p(99.9)=16.74s  
       { expected_response:true }...: avg=908.75ms min=5.93ms  med=789.73ms max=18.31s  p(90)=1.55s    p(95)=1.75s    p(99.9)=16.74s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15706
     http_req_receiving.............: avg=106.86µs min=37.97µs med=96.44µs  max=19.38ms p(90)=136.01µs p(95)=150.75µs p(99.9)=877.53µs
     http_req_sending...............: avg=35.43µs  min=6.43µs  med=17.56µs  max=48.58ms p(90)=23.7µs   p(95)=28.95µs  p(99.9)=3.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=908.61ms min=5.84ms  med=789.62ms max=18.31s  p(90)=1.55s    p(95)=1.75s    p(99.9)=16.74s  
     http_reqs......................: 15706   231.786476/s
     iteration_duration.............: avg=970.54ms min=63.21ms med=857.58ms max=18.32s  p(90)=1.57s    p(95)=1.77s    p(99.9)=16.89s  
     iterations.....................: 14706   217.028646/s
     success_rate...................: 100.00% ✓ 14706      ✗ 0    
     vus............................: 96      min=0        max=500
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

     checks.........................: 100.00% ✓ 41676      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   245 kB/s
     http_req_blocked...............: avg=16.81µs  min=1.29µs  med=3.28µs   max=4.44ms   p(90)=4.94µs   p(95)=6.41µs   p(99.9)=2.69ms
     http_req_connecting............: avg=11.61µs  min=0s      med=0s       max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=2.53ms
     http_req_duration..............: avg=536.76ms min=8.41ms  med=603.47ms max=1.49s    p(90)=941.86ms p(95)=989.55ms p(99.9)=1.36s 
       { expected_response:true }...: avg=536.76ms min=8.41ms  med=603.47ms max=1.49s    p(90)=941.86ms p(95)=989.55ms p(99.9)=1.36s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14892
     http_req_receiving.............: avg=138.35µs min=38.98µs med=90.78µs  max=182.51ms p(90)=130.03µs p(95)=142.67µs p(99.9)=1.02ms
     http_req_sending...............: avg=34.12µs  min=6.27µs  med=16.33µs  max=106.7ms  p(90)=22.65µs  p(95)=27.84µs  p(99.9)=2.2ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=536.58ms min=8.31ms  med=603.36ms max=1.49s    p(90)=941.74ms p(95)=989.39ms p(99.9)=1.36s 
     http_reqs......................: 14892   200.354165/s
     iteration_duration.............: avg=575.29ms min=9ms     med=641.05ms max=1.5s     p(90)=947.02ms p(95)=997.78ms p(99.9)=1.37s 
     iterations.....................: 13892   186.900353/s
     success_rate...................: 100.00% ✓ 13892      ✗ 0    
     vus............................: 62      min=0        max=496
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

     checks.........................: 100.00% ✓ 419484      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=31.88µs  min=1.08µs  med=3.02µs  max=68.24ms  p(90)=4.91µs   p(95)=6.23µs   p(99.9)=10.72ms 
     http_req_connecting............: avg=28.1µs   min=0s      med=0s      max=68ms     p(90)=0s       p(95)=0s       p(99.9)=10.69ms 
     http_req_duration..............: avg=100.94ms min=1.65ms  med=93.01ms max=325.57ms p(90)=197.72ms p(95)=218.99ms p(99.9)=282.49ms
       { expected_response:true }...: avg=100.94ms min=1.65ms  med=93.01ms max=325.57ms p(90)=197.72ms p(95)=218.99ms p(99.9)=282.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140828
     http_req_receiving.............: avg=243.34µs min=30.99µs med=63.94µs max=62.96ms  p(90)=200.06µs p(95)=451.5µs  p(99.9)=29.17ms 
     http_req_sending...............: avg=91.27µs  min=5.43µs  med=11.75µs max=281.23ms p(90)=23.11µs  p(95)=150.86µs p(99.9)=12.93ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.6ms  min=1.6ms   med=92.76ms max=325.51ms p(90)=197.1ms  p(95)=218.46ms p(99.9)=281.54ms
     http_reqs......................: 140828  2271.66055/s
     iteration_duration.............: avg=101.98ms min=4.25ms  med=94.09ms max=360.26ms p(90)=198.42ms p(95)=219.75ms p(99.9)=283.91ms
     iterations.....................: 139828  2255.529805/s
     success_rate...................: 100.00% ✓ 139828      ✗ 0     
     vus............................: 58      min=0         max=498 
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

     checks.........................: 100.00% ✓ 350268      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=13.72µs  min=1.03µs  med=2.83µs   max=39.4ms   p(90)=4.42µs   p(95)=5.52µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=10.12µs  min=0s      med=0s       max=39.33ms  p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=120.95ms min=1.77ms  med=113.22ms max=842.22ms p(90)=235.48ms p(95)=268.18ms p(99.9)=517.32ms
       { expected_response:true }...: avg=120.95ms min=1.77ms  med=113.22ms max=842.22ms p(90)=235.48ms p(95)=268.18ms p(99.9)=517.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117756
     http_req_receiving.............: avg=1.89ms   min=52.69µs med=119.06µs max=325.53ms p(90)=1.8ms    p(95)=4.74ms   p(99.9)=154.99ms
     http_req_sending...............: avg=63.65µs  min=5.22µs  med=11.05µs  max=279ms    p(90)=20.21µs  p(95)=123.9µs  p(99.9)=8.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.99ms min=1.68ms  med=112.11ms max=842.14ms p(90)=232.54ms p(95)=261.76ms p(99.9)=516.06ms
     http_reqs......................: 117756  1892.481902/s
     iteration_duration.............: avg=122.26ms min=3.34ms  med=114.63ms max=842.41ms p(90)=236.16ms p(95)=268.93ms p(99.9)=517.83ms
     iterations.....................: 116756  1876.410688/s
     success_rate...................: 100.00% ✓ 116756      ✗ 0     
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

     checks.........................: 100.00% ✓ 206562      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.74µs   min=1.08µs  med=2.84µs   max=16.92ms  p(90)=4.58µs   p(95)=5.56µs   p(99.9)=707.82µs
     http_req_connecting............: avg=4.14µs   min=0s      med=0s       max=16.71ms  p(90)=0s       p(95)=0s       p(99.9)=595.85µs
     http_req_duration..............: avg=204.3ms  min=2.12ms  med=206.21ms max=660.86ms p(90)=375.99ms p(95)=403.91ms p(99.9)=567.53ms
       { expected_response:true }...: avg=204.3ms  min=2.12ms  med=206.21ms max=660.86ms p(90)=375.99ms p(95)=403.91ms p(99.9)=567.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69854
     http_req_receiving.............: avg=91.52µs  min=31.45µs med=68.28µs  max=188.25ms p(90)=104.96µs p(95)=120.6µs  p(99.9)=1.74ms  
     http_req_sending...............: avg=40.35µs  min=5.65µs  med=12.1µs   max=159.27ms p(90)=19.06µs  p(95)=22.87µs  p(99.9)=3.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.17ms min=2.05ms  med=206.02ms max=660.81ms p(90)=375.87ms p(95)=403.81ms p(99.9)=567.44ms
     http_reqs......................: 69854   1115.760508/s
     iteration_duration.............: avg=207.53ms min=5.28ms  med=209.7ms  max=661.07ms p(90)=376.98ms p(95)=404.69ms p(99.9)=568.5ms 
     iterations.....................: 68854   1099.787758/s
     success_rate...................: 100.00% ✓ 68854       ✗ 0    
     vus............................: 86      min=0         max=498
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

     checks.........................: 100.00% ✓ 89934      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   569 kB/s
     http_req_blocked...............: avg=10.61µs  min=1.09µs  med=3.27µs   max=24.55ms  p(90)=5.13µs   p(95)=6.18µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=6.25µs   min=0s      med=0s       max=24.48ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=463.63ms min=4.15ms  med=429.94ms max=1.81s    p(90)=922.28ms p(95)=999.37ms p(99.9)=1.45s   
       { expected_response:true }...: avg=463.63ms min=4.15ms  med=429.94ms max=1.81s    p(90)=922.28ms p(95)=999.37ms p(99.9)=1.45s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30978
     http_req_receiving.............: avg=100.89µs min=32.69µs med=82.63µs  max=247.21ms p(90)=119.24µs p(95)=134.45µs p(99.9)=969.81µs
     http_req_sending...............: avg=26.69µs  min=5.85µs  med=14.99µs  max=24.89ms  p(90)=22.29µs  p(95)=25.56µs  p(99.9)=2.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=463.51ms min=4.06ms  med=429.84ms max=1.81s    p(90)=922.19ms p(95)=999.25ms p(99.9)=1.45s   
     http_reqs......................: 30978   474.368472/s
     iteration_duration.............: avg=479.31ms min=28.66ms med=446.57ms max=1.82s    p(90)=926.53ms p(95)=1s       p(99.9)=1.46s   
     iterations.....................: 29978   459.055396/s
     success_rate...................: 100.00% ✓ 29978      ✗ 0    
     vus............................: 69      min=0        max=495
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

     checks.........................: 100.00% ✓ 43092      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   271 kB/s
     http_req_blocked...............: avg=15.33µs  min=1.37µs  med=3.64µs   max=11.11ms  p(90)=5.47µs   p(95)=7.31µs   p(99.9)=2.06ms 
     http_req_connecting............: avg=9.87µs   min=0s      med=0s       max=11.06ms  p(90)=0s       p(95)=0s       p(99.9)=1.92ms 
     http_req_duration..............: avg=950.19ms min=6.25ms  med=852.84ms max=6.33s    p(90)=1.88s    p(95)=2.07s    p(99.9)=5.11s  
       { expected_response:true }...: avg=950.19ms min=6.25ms  med=852.84ms max=6.33s    p(90)=1.88s    p(95)=2.07s    p(99.9)=5.11s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15364
     http_req_receiving.............: avg=187.67µs min=39.08µs med=99.14µs  max=156.47ms p(90)=140.11µs p(95)=153.06µs p(99.9)=23.37ms
     http_req_sending...............: avg=27.63µs  min=6.51µs  med=18.33µs  max=9.64ms   p(90)=24.28µs  p(95)=29.05µs  p(99.9)=2.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=949.98ms min=6.15ms  med=852.7ms  max=6.33s    p(90)=1.88s    p(95)=2.07s    p(99.9)=5.11s  
     http_reqs......................: 15364   225.578375/s
     iteration_duration.............: avg=1.01s    min=70.96ms med=949.73ms max=6.33s    p(90)=1.9s     p(95)=2.09s    p(99.9)=5.12s  
     iterations.....................: 14364   210.896106/s
     success_rate...................: 100.00% ✓ 14364      ✗ 0    
     vus............................: 66      min=0        max=500
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

     checks.........................: 100.00% ✓ 39966      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=15.23µs  min=1.17µs  med=3.61µs   max=17.63ms  p(90)=5.41µs   p(95)=7.04µs   p(99.9)=1.8ms  
     http_req_connecting............: avg=9.68µs   min=0s      med=0s       max=17.56ms  p(90)=0s       p(95)=0s       p(99.9)=1.77ms 
     http_req_duration..............: avg=1.01s    min=8.8ms   med=927.83ms max=4.3s     p(90)=2.08s    p(95)=2.2s     p(99.9)=3.92s  
       { expected_response:true }...: avg=1.01s    min=8.8ms   med=927.83ms max=4.3s     p(90)=2.08s    p(95)=2.2s     p(99.9)=3.92s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14322
     http_req_receiving.............: avg=119.55µs min=35.08µs med=96.25µs  max=151.89ms p(90)=137.15µs p(95)=150.57µs p(99.9)=922.2µs
     http_req_sending...............: avg=50.83µs  min=6.26µs  med=17.9µs   max=114.42ms p(90)=23.84µs  p(95)=29.69µs  p(99.9)=2.76ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=1.01s    min=8.69ms  med=927.7ms  max=4.3s     p(90)=2.08s    p(95)=2.2s     p(99.9)=3.92s  
     http_reqs......................: 14322   204.676299/s
     iteration_duration.............: avg=1.09s    min=39ms    med=1.02s    max=4.31s    p(90)=2.09s    p(95)=2.22s    p(99.9)=3.94s  
     iterations.....................: 13322   190.385258/s
     success_rate...................: 100.00% ✓ 13322      ✗ 0    
     vus............................: 51      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

