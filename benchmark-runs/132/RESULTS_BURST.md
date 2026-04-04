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
| hive-router | v0.0.43 | 2,787 | 2,870 | 2,727 | 1.6% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,060 | 2,107 | 2,039 | 1.0% |  |
| cosmo | 0.298.0 | 1,203 | 1,210 | 1,193 | 0.6% | non-compatible response (7 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 560 | 566 | 556 | 0.6% |  |
| hive-gateway | 2.5.14 | 253 | 255 | 250 | 0.6% |  |
| apollo-gateway | 2.13.3 | 207 | 209 | 204 | 0.8% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (34317 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (468684 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,377 | 2,464 | 2,348 | 1.8% | non-compatible response (23 across 1/9 runs) |
| hotchocolate | 16.0.0-rc.1.25 | 1,888 | 1,920 | 1,871 | 0.8% |  |
| cosmo | 0.298.0 | 1,157 | 1,157 | 1,141 | 1.0% | non-compatible response (11 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 533 | 544 | 528 | 1.0% |  |
| hive-gateway | 2.5.14 | 245 | 248 | 244 | 0.6% |  |
| apollo-gateway | 2.13.3 | 209 | 212 | 208 | 0.6% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (40803 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (214352 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 514701      ✗ 0     
     data_received..................: 15 GB   245 MB/s
     data_sent......................: 207 MB  3.3 MB/s
     http_req_blocked...............: avg=23.96µs  min=992ns   med=2.19µs  max=63.37ms  p(90)=3.58µs   p(95)=4.64µs   p(99.9)=2.92ms  
     http_req_connecting............: avg=20.99µs  min=0s      med=0s      max=63.29ms  p(90)=0s       p(95)=0s       p(99.9)=2.52ms  
     http_req_duration..............: avg=82.27ms  min=1.63ms  med=76.46ms max=319.85ms p(90)=159.84ms p(95)=174.51ms p(99.9)=224.65ms
       { expected_response:true }...: avg=82.27ms  min=1.63ms  med=76.46ms max=319.85ms p(90)=159.84ms p(95)=174.51ms p(99.9)=224.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 172567
     http_req_receiving.............: avg=337.65µs min=27.84µs med=54.25µs max=110.76ms p(90)=220.43µs p(95)=404.67µs p(99.9)=38.24ms 
     http_req_sending...............: avg=85.35µs  min=5.07µs  med=9.6µs   max=174.64ms p(90)=18.04µs  p(95)=128.65µs p(99.9)=13.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.85ms  min=1.58ms  med=76.13ms max=319.05ms p(90)=159.18ms p(95)=173.53ms p(99.9)=221.13ms
     http_reqs......................: 172567  2787.954435/s
     iteration_duration.............: avg=83.09ms  min=2.17ms  med=77.37ms max=355.34ms p(90)=160.4ms  p(95)=175.13ms p(99.9)=226.77ms
     iterations.....................: 171567  2771.798655/s
     success_rate...................: 100.00% ✓ 171567      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 385176      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=22.62µs  min=1.03µs  med=2.63µs   max=60.78ms  p(90)=4.12µs   p(95)=5.14µs   p(99.9)=4.15ms  
     http_req_connecting............: avg=18.93µs  min=0s      med=0s       max=60.59ms  p(90)=0s       p(95)=0s       p(99.9)=3.78ms  
     http_req_duration..............: avg=109.97ms min=2.42ms  med=105.97ms max=528.23ms p(90)=208ms    p(95)=230.03ms p(99.9)=368.66ms
       { expected_response:true }...: avg=109.97ms min=2.42ms  med=105.97ms max=528.23ms p(90)=208ms    p(95)=230.03ms p(99.9)=368.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129392
     http_req_receiving.............: avg=1.21ms   min=52.67µs med=150.49µs max=231.23ms p(90)=1.23ms   p(95)=2.92ms   p(99.9)=112.65ms
     http_req_sending...............: avg=65.49µs  min=5.2µs   med=10.17µs  max=213.66ms p(90)=19.23µs  p(95)=130.17µs p(99.9)=8.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.69ms min=2.33ms  med=104.63ms max=528.06ms p(90)=206.32ms p(95)=227.4ms  p(99.9)=363.3ms 
     http_reqs......................: 129392  2060.047439/s
     iteration_duration.............: avg=111.1ms  min=3.63ms  med=107.21ms max=528.45ms p(90)=208.58ms p(95)=230.61ms p(99.9)=369.42ms
     iterations.....................: 128392  2044.126459/s
     success_rate...................: 100.00% ✓ 128392      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 222504      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.98µs  min=1.05µs  med=2.22µs   max=29.28ms  p(90)=3.72µs   p(95)=4.59µs   p(99.9)=756.95µs
     http_req_connecting............: avg=4.08µs  min=0s      med=0s       max=29.21ms  p(90)=0s       p(95)=0s       p(99.9)=710.68µs
     http_req_duration..............: avg=189.8ms min=2.07ms  med=191.91ms max=570ms    p(90)=351.05ms p(95)=375.1ms  p(99.9)=468.93ms
       { expected_response:true }...: avg=189.8ms min=2.07ms  med=191.91ms max=570ms    p(90)=351.05ms p(95)=375.1ms  p(99.9)=468.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75168
     http_req_receiving.............: avg=77µs    min=28.72µs med=57.77µs  max=112.91ms p(90)=91.62µs  p(95)=106.01µs p(99.9)=1.74ms  
     http_req_sending...............: avg=28.06µs min=5.46µs  med=10.17µs  max=77.97ms  p(90)=16.2µs   p(95)=19.92µs  p(99.9)=3.54ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.7ms min=1.97ms  med=191.73ms max=569.92ms p(90)=350.98ms p(95)=375.04ms p(99.9)=468.81ms
     http_reqs......................: 75168   1203.252152/s
     iteration_duration.............: avg=192.6ms min=4.86ms  med=194.86ms max=570.16ms p(90)=351.8ms  p(95)=375.66ms p(99.9)=469.94ms
     iterations.....................: 74168   1187.244647/s
     success_rate...................: 100.00% ✓ 74168       ✗ 0    
     vus............................: 80      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 105348     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   673 kB/s
     http_req_blocked...............: avg=8.62µs   min=1.12µs  med=2.77µs   max=11.7ms   p(90)=4.48µs   p(95)=5.47µs   p(99.9)=1.13ms
     http_req_connecting............: avg=4.85µs   min=0s      med=0s       max=11.63ms  p(90)=0s       p(95)=0s       p(99.9)=1.03ms
     http_req_duration..............: avg=397.23ms min=3.75ms  med=367.94ms max=1.73s    p(90)=787.93ms p(95)=861.02ms p(99.9)=1.28s 
       { expected_response:true }...: avg=397.23ms min=3.75ms  med=367.94ms max=1.73s    p(90)=787.93ms p(95)=861.02ms p(99.9)=1.28s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36116
     http_req_receiving.............: avg=104.92µs min=32.32µs med=72.82µs  max=60.77ms  p(90)=108.4µs  p(95)=121.45µs p(99.9)=1.77ms
     http_req_sending...............: avg=29.53µs  min=5.82µs  med=12.59µs  max=122.73ms p(90)=19.94µs  p(95)=23.2µs   p(99.9)=1.88ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=397.1ms  min=3.65ms  med=367.8ms  max=1.73s    p(90)=787.84ms p(95)=860.93ms p(99.9)=1.28s 
     http_reqs......................: 36116   560.322417/s
     iteration_duration.............: avg=408.77ms min=7.62ms  med=383.76ms max=1.74s    p(90)=791.92ms p(95)=863.51ms p(99.9)=1.29s 
     iterations.....................: 35116   544.807897/s
     success_rate...................: 100.00% ✓ 35116      ✗ 0    
     vus............................: 78      min=0        max=493
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48384      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   305 kB/s
     http_req_blocked...............: avg=15.2µs   min=1.23µs  med=3.4µs    max=33.29ms p(90)=5.23µs   p(95)=6.77µs   p(99.9)=2.38ms 
     http_req_connecting............: avg=10.04µs  min=0s      med=0s       max=33.23ms p(90)=0s       p(95)=0s       p(99.9)=2.19ms 
     http_req_duration..............: avg=833.74ms min=5.69ms  med=752.85ms max=15.62s  p(90)=1.47s    p(95)=1.6s     p(99.9)=14.83s 
       { expected_response:true }...: avg=833.74ms min=5.69ms  med=752.85ms max=15.62s  p(90)=1.47s    p(95)=1.6s     p(99.9)=14.83s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17128
     http_req_receiving.............: avg=102µs    min=37.33µs med=94.27µs  max=20.79ms p(90)=132.12µs p(95)=146.03µs p(99.9)=893.7µs
     http_req_sending...............: avg=28.79µs  min=6.11µs  med=17.47µs  max=13.36ms p(90)=23.52µs  p(95)=28µs     p(99.9)=3.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=833.61ms min=5.61ms  med=752.72ms max=15.62s  p(90)=1.47s    p(95)=1.6s     p(99.9)=14.83s 
     http_reqs......................: 17128   253.245038/s
     iteration_duration.............: avg=885.43ms min=21.48ms med=808.2ms  max=15.62s  p(90)=1.48s    p(95)=1.61s    p(99.9)=14.89s 
     iterations.....................: 16128   238.459597/s
     success_rate...................: 100.00% ✓ 16128      ✗ 0    
     vus............................: 86      min=0        max=500
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

     checks.........................: 100.00% ✓ 43260      ✗ 0    
     data_received..................: 1.4 GB  18 MB/s
     data_sent......................: 19 MB   254 kB/s
     http_req_blocked...............: avg=11.91µs  min=1.24µs  med=3.29µs   max=3.37ms p(90)=4.92µs   p(95)=6.27µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=7.08µs   min=0s      med=0s       max=3.34ms p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=486.91ms min=8.48ms  med=567.32ms max=1.34s  p(90)=836.82ms p(95)=881.33ms p(99.9)=1.2s    
       { expected_response:true }...: avg=486.91ms min=8.48ms  med=567.32ms max=1.34s  p(90)=836.82ms p(95)=881.33ms p(99.9)=1.2s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 15420
     http_req_receiving.............: avg=95.88µs  min=30.72µs med=90.5µs   max=9.82ms p(90)=127.55µs p(95)=139.87µs p(99.9)=501.57µs
     http_req_sending...............: avg=26.04µs  min=5.98µs  med=16.82µs  max=27.1ms p(90)=22.46µs  p(95)=26.41µs  p(99.9)=2.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=486.79ms min=8.35ms  med=567.2ms  max=1.34s  p(90)=836.72ms p(95)=881.22ms p(99.9)=1.2s    
     http_reqs......................: 15420   207.210857/s
     iteration_duration.............: avg=520.49ms min=13.29ms med=602.54ms max=1.34s  p(90)=842.7ms  p(95)=885.8ms  p(99.9)=1.22s   
     iterations.....................: 14420   193.773059/s
     success_rate...................: 100.00% ✓ 14420      ✗ 0    
     vus............................: 64      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438645      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=24.07µs  min=1.01µs  med=2.56µs  max=52.9ms   p(90)=4.55µs   p(95)=5.89µs   p(99.9)=3.72ms  
     http_req_connecting............: avg=20.34µs  min=0s      med=0s      max=52.84ms  p(90)=0s       p(95)=0s       p(99.9)=3.49ms  
     http_req_duration..............: avg=96.57ms  min=1.6ms   med=91.17ms max=292.73ms p(90)=186.33ms p(95)=202.4ms  p(99.9)=253.04ms
       { expected_response:true }...: avg=96.57ms  min=1.6ms   med=91.17ms max=292.73ms p(90)=186.33ms p(95)=202.4ms  p(99.9)=253.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147215
     http_req_receiving.............: avg=281.05µs min=27.62µs med=58.82µs max=45.42ms  p(90)=202.77µs p(95)=438.19µs p(99.9)=30.21ms 
     http_req_sending...............: avg=84.07µs  min=5.47µs  med=11.07µs max=72.13ms  p(90)=22.77µs  p(95)=141.45µs p(99.9)=12.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.2ms   min=1.54ms  med=90.87ms max=289.66ms p(90)=185.68ms p(95)=201.54ms p(99.9)=251.86ms
     http_reqs......................: 147215  2377.411984/s
     iteration_duration.............: avg=97.52ms  min=3.29ms  med=92.26ms max=406.57ms p(90)=186.86ms p(95)=203.03ms p(99.9)=254.75ms
     iterations.....................: 146215  2361.262733/s
     success_rate...................: 100.00% ✓ 146215      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 349305      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=14.91µs  min=1.04µs  med=2.33µs   max=90.72ms  p(90)=3.91µs   p(95)=4.93µs   p(99.9)=2.05ms  
     http_req_connecting............: avg=11.89µs  min=0s      med=0s       max=90.65ms  p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=121.23ms min=1.8ms   med=116.22ms max=881.89ms p(90)=227.89ms p(95)=253.42ms p(99.9)=693.92ms
       { expected_response:true }...: avg=121.23ms min=1.8ms   med=116.22ms max=881.89ms p(90)=227.89ms p(95)=253.42ms p(99.9)=693.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117435
     http_req_receiving.............: avg=1.22ms   min=52.54µs med=136.28µs max=262.56ms p(90)=1.49ms   p(95)=2.95ms   p(99.9)=112.29ms
     http_req_sending...............: avg=56.1µs   min=5.27µs  med=9.8µs    max=51.46ms  p(90)=18.95µs  p(95)=116.04µs p(99.9)=7.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.95ms min=1.7ms   med=115.07ms max=881.78ms p(90)=226.13ms p(95)=250.44ms p(99.9)=692.63ms
     http_reqs......................: 117435  1888.070561/s
     iteration_duration.............: avg=122.55ms min=2.99ms  med=117.74ms max=882.09ms p(90)=228.59ms p(95)=254.16ms p(99.9)=694.83ms
     iterations.....................: 116435  1871.992981/s
     success_rate...................: 100.00% ✓ 116435      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214458      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=8.48µs   min=1.13µs  med=2.8µs    max=38.17ms  p(90)=4.6µs    p(95)=5.63µs   p(99.9)=610.45µs
     http_req_connecting............: avg=4.94µs   min=0s      med=0s       max=37.99ms  p(90)=0s       p(95)=0s       p(99.9)=490.62µs
     http_req_duration..............: avg=196.88ms min=2.09ms  med=198.13ms max=555.36ms p(90)=365.11ms p(95)=392.49ms p(99.9)=478.42ms
       { expected_response:true }...: avg=196.88ms min=2.09ms  med=198.13ms max=555.36ms p(90)=365.11ms p(95)=392.49ms p(99.9)=478.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72486
     http_req_receiving.............: avg=121.59µs min=29.74µs med=66.29µs  max=203.8ms  p(90)=105.01µs p(95)=120.97µs p(99.9)=3.27ms  
     http_req_sending...............: avg=41.63µs  min=5.56µs  med=11.87µs  max=318.04ms p(90)=19.45µs  p(95)=23.28µs  p(99.9)=3.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.72ms min=2.03ms  med=197.85ms max=555.29ms p(90)=364.98ms p(95)=392.34ms p(99.9)=478.33ms
     http_reqs......................: 72486   1157.96375/s
     iteration_duration.............: avg=199.9ms  min=4.99ms  med=201.3ms  max=555.56ms p(90)=365.97ms p(95)=393.23ms p(99.9)=478.84ms
     iterations.....................: 71486   1141.988751/s
     success_rate...................: 100.00% ✓ 71486       ✗ 0    
     vus............................: 85      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100575     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   640 kB/s
     http_req_blocked...............: avg=9.03µs   min=1.1µs   med=3.1µs    max=8.63ms   p(90)=4.92µs   p(95)=5.94µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=4.99µs   min=0s      med=0s       max=8.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=415.71ms min=3.81ms  med=382.33ms max=1.92s    p(90)=829.41ms p(95)=899.5ms  p(99.9)=1.35s   
       { expected_response:true }...: avg=415.71ms min=3.81ms  med=382.33ms max=1.92s    p(90)=829.41ms p(95)=899.5ms  p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34525
     http_req_receiving.............: avg=90.64µs  min=32.62µs med=79.76µs  max=91.27ms  p(90)=116.37µs p(95)=129.55µs p(99.9)=939.78µs
     http_req_sending...............: avg=41.84µs  min=5.74µs  med=14.18µs  max=180.27ms p(90)=21.5µs   p(95)=24.68µs  p(99.9)=3.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=415.58ms min=3.74ms  med=382.21ms max=1.92s    p(90)=829.32ms p(95)=899.4ms  p(99.9)=1.35s   
     http_reqs......................: 34525   533.259213/s
     iteration_duration.............: avg=428.36ms min=23.37ms med=399.08ms max=1.92s    p(90)=832.89ms p(95)=902.82ms p(99.9)=1.36s   
     iterations.....................: 33525   517.813616/s
     success_rate...................: 100.00% ✓ 33525      ✗ 0    
     vus............................: 88      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47007      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=12.85µs  min=1.21µs  med=3.77µs   max=3.98ms  p(90)=5.72µs   p(95)=7.21µs   p(99.9)=1.59ms
     http_req_connecting............: avg=7.33µs   min=0s      med=0s       max=3.9ms   p(90)=0s       p(95)=0s       p(99.9)=1.47ms
     http_req_duration..............: avg=871.99ms min=6.24ms  med=795.7ms  max=4.53s   p(90)=1.73s    p(95)=1.92s    p(99.9)=3.9s  
       { expected_response:true }...: avg=871.99ms min=6.24ms  med=795.7ms  max=4.53s   p(90)=1.73s    p(95)=1.92s    p(99.9)=3.9s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16669
     http_req_receiving.............: avg=114.13µs min=34.42µs med=101.42µs max=45.91ms p(90)=141.02µs p(95)=153.47µs p(99.9)=1.58ms
     http_req_sending...............: avg=32.55µs  min=6.19µs  med=19.32µs  max=17.11ms p(90)=25.24µs  p(95)=29.72µs  p(99.9)=3.53ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=871.84ms min=6.14ms  med=795.55ms max=4.53s   p(90)=1.73s    p(95)=1.92s    p(99.9)=3.9s  
     http_reqs......................: 16669   245.264303/s
     iteration_duration.............: avg=927.69ms min=30.23ms med=859.15ms max=4.54s   p(90)=1.75s    p(95)=1.93s    p(99.9)=3.93s 
     iterations.....................: 15669   230.550505/s
     success_rate...................: 100.00% ✓ 15669      ✗ 0    
     vus............................: 51      min=0        max=500
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

     checks.........................: 100.00% ✓ 40878      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   252 kB/s
     http_req_blocked...............: avg=19.04µs  min=1.19µs  med=3.67µs   max=39.32ms p(90)=5.53µs  p(95)=7.44µs   p(99.9)=2.88ms  
     http_req_connecting............: avg=13.44µs  min=0s      med=0s       max=39.26ms p(90)=0s      p(95)=0s       p(99.9)=2.85ms  
     http_req_duration..............: avg=996.16ms min=8.61ms  med=928.19ms max=4.06s   p(90)=2.02s   p(95)=2.15s    p(99.9)=3.62s   
       { expected_response:true }...: avg=996.16ms min=8.61ms  med=928.19ms max=4.06s   p(90)=2.02s   p(95)=2.15s    p(99.9)=3.62s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14626
     http_req_receiving.............: avg=110.66µs min=32.94µs med=99.92µs  max=49.73ms p(90)=140.1µs p(95)=153.02µs p(99.9)=747.17µs
     http_req_sending...............: avg=33.9µs   min=6.06µs  med=18.71µs  max=46.68ms p(90)=24.91µs p(95)=30.57µs  p(99.9)=3.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=996.02ms min=8.51ms  med=928.05ms max=4.06s   p(90)=2.02s   p(95)=2.15s    p(99.9)=3.62s   
     http_reqs......................: 14626   209.538694/s
     iteration_duration.............: avg=1.06s    min=45.41ms med=1s       max=4.06s   p(90)=2.03s   p(95)=2.15s    p(99.9)=3.66s   
     iterations.....................: 13626   195.212241/s
     success_rate...................: 100.00% ✓ 13626      ✗ 0    
     vus............................: 96      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

