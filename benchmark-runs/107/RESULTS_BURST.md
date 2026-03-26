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
| hive-router | v0.0.42 | 2,826 | 2,944 | 2,775 | 1.9% |  |
| hotchocolate | 16.0.0-rc.1.15 | 1,566 | 1,566 | 1,566 | 0.0% | non-compatible response (173 across 8/9 runs) |
| cosmo | 0.295.0 | 1,173 | 1,173 | 1,173 | 0.0% | non-compatible response (22 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 557 | 563 | 552 | 0.7% |  |
| hive-gateway | 2.5.11 | 243 | 247 | 239 | 1.1% |  |
| apollo-gateway | 2.13.3 | 215 | 220 | 211 | 1.2% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (36545 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (432797 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.42 | 2,260 | 2,379 | 2,233 | 2.4% |  |
| cosmo | 0.295.0 | 1,116 | 1,118 | 1,097 | 0.9% | non-compatible response (12 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 526 | 536 | 522 | 0.9% |  |
| hive-gateway | 2.5.11 | 240 | 243 | 237 | 0.7% |  |
| apollo-gateway | 2.13.3 | 204 | 208 | 202 | 0.8% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (37920 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (292485 across 9/9 runs) |
| hotchocolate | 16.0.0-rc.1.15 | — | — | — | — | non-compatible response (33 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 521250      ✗ 0     
     data_received..................: 15 GB   248 MB/s
     data_sent......................: 210 MB  3.4 MB/s
     http_req_blocked...............: avg=28µs     min=981ns   med=2.23µs  max=81.22ms  p(90)=3.61µs   p(95)=4.69µs   p(99.9)=3.32ms  
     http_req_connecting............: avg=25.12µs  min=0s      med=0s      max=81.07ms  p(90)=0s       p(95)=0s       p(99.9)=2.98ms  
     http_req_duration..............: avg=81.28ms  min=1.61ms  med=73.88ms max=295.13ms p(90)=157.9ms  p(95)=174.39ms p(99.9)=241.3ms 
       { expected_response:true }...: avg=81.28ms  min=1.61ms  med=73.88ms max=295.13ms p(90)=157.9ms  p(95)=174.39ms p(99.9)=241.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 174750
     http_req_receiving.............: avg=424.64µs min=28.27µs med=55.24µs max=62.91ms  p(90)=247.74µs p(95)=409.7µs  p(99.9)=44.15ms 
     http_req_sending...............: avg=89.03µs  min=5.34µs  med=9.6µs   max=276.94ms p(90)=17.93µs  p(95)=128.28µs p(99.9)=14.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.76ms  min=1.55ms  med=73.53ms max=289.97ms p(90)=157.22ms p(95)=173.28ms p(99.9)=236.56ms
     http_reqs......................: 174750  2826.959065/s
     iteration_duration.............: avg=82.03ms  min=2.42ms  med=74.8ms  max=371.74ms p(90)=158.42ms p(95)=174.93ms p(99.9)=243.46ms
     iterations.....................: 173750  2810.781903/s
     success_rate...................: 100.00% ✓ 173750      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 291891      ✗ 0    
     data_received..................: 8.6 GB  137 MB/s
     data_sent......................: 118 MB  1.9 MB/s
     http_req_blocked...............: avg=29.99µs  min=1.01µs  med=2.18µs   max=102.26ms p(90)=3.54µs   p(95)=4.5µs    p(99.9)=2.08ms  
     http_req_connecting............: avg=27.17µs  min=0s      med=0s       max=102.21ms p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=144.77ms min=2.39ms  med=86.42ms  max=15.36s   p(90)=329.1ms  p(95)=447.92ms p(99.9)=1.32s   
       { expected_response:true }...: avg=144.77ms min=2.39ms  med=86.42ms  max=15.36s   p(90)=329.1ms  p(95)=447.92ms p(99.9)=1.32s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 98297
     http_req_receiving.............: avg=9.72ms   min=51.61µs med=104.02µs max=1.14s    p(90)=7.55ms   p(95)=45.43ms  p(99.9)=436.45ms
     http_req_sending...............: avg=76.13µs  min=5.06µs  med=9.34µs   max=83.83ms  p(90)=16.64µs  p(95)=82.79µs  p(99.9)=12.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.97ms min=2.3ms   med=84.1ms   max=15.34s   p(90)=299.22ms p(95)=399.96ms p(99.9)=1.25s   
     http_reqs......................: 98297   1566.631593/s
     iteration_duration.............: avg=146.85ms min=2.75ms  med=88.2ms   max=15.37s   p(90)=332.68ms p(95)=450.69ms p(99.9)=1.33s   
     iterations.....................: 97297   1550.693857/s
     success_rate...................: 100.00% ✓ 97297       ✗ 0    
     vus............................: 91      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 217050      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.78µs   min=1.07µs  med=2.23µs   max=19.7ms   p(90)=3.7µs    p(95)=4.63µs   p(99.9)=778.7µs 
     http_req_connecting............: avg=3.89µs   min=0s      med=0s       max=19.55ms  p(90)=0s       p(95)=0s       p(99.9)=676.37µs
     http_req_duration..............: avg=194.5ms  min=2.09ms  med=196.81ms max=592.65ms p(90)=358.92ms p(95)=382.26ms p(99.9)=501.82ms
       { expected_response:true }...: avg=194.5ms  min=2.09ms  med=196.81ms max=592.65ms p(90)=358.92ms p(95)=382.26ms p(99.9)=501.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73350
     http_req_receiving.............: avg=75.67µs  min=28.85µs med=59.78µs  max=92.86ms  p(90)=94.75µs  p(95)=109.43µs p(99.9)=1.47ms  
     http_req_sending...............: avg=31.93µs  min=5.25µs  med=10.22µs  max=209.98ms p(90)=16.1µs   p(95)=19.75µs  p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.4ms  min=2.03ms  med=196.7ms  max=592.57ms p(90)=358.77ms p(95)=382.12ms p(99.9)=501.75ms
     http_reqs......................: 73350   1173.313448/s
     iteration_duration.............: avg=197.46ms min=4.67ms  med=199.83ms max=592.84ms p(90)=359.78ms p(95)=382.94ms p(99.9)=502.68ms
     iterations.....................: 72350   1157.317355/s
     success_rate...................: 100.00% ✓ 72350       ✗ 0    
     vus............................: 83      min=0         max=493
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

     checks.........................: 100.00% ✓ 104805     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   670 kB/s
     http_req_blocked...............: avg=8.15µs   min=1.24µs  med=2.92µs   max=5.33ms  p(90)=4.7µs    p(95)=5.72µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=4.19µs   min=0s      med=0s       max=5.24ms  p(90)=0s       p(95)=0s       p(99.9)=1.01ms  
     http_req_duration..............: avg=398.79ms min=3.76ms  med=369.41ms max=1.57s   p(90)=791.43ms p(95)=854.8ms  p(99.9)=1.21s   
       { expected_response:true }...: avg=398.79ms min=3.76ms  med=369.41ms max=1.57s   p(90)=791.43ms p(95)=854.8ms  p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35935
     http_req_receiving.............: avg=83.06µs  min=33.47µs med=74.75µs  max=11.05ms p(90)=110.49µs p(95)=123.57µs p(99.9)=779.04µs
     http_req_sending...............: avg=24.33µs  min=5.71µs  med=12.84µs  max=21.48ms p(90)=19.99µs  p(95)=23.36µs  p(99.9)=2.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=398.69ms min=3.69ms  med=369.24ms max=1.57s   p(90)=791.29ms p(95)=854.69ms p(99.9)=1.21s   
     http_reqs......................: 35935   557.214516/s
     iteration_duration.............: avg=410.45ms min=21.6ms  med=383.02ms max=1.59s   p(90)=795.01ms p(95)=857.7ms  p(99.9)=1.21s   
     iterations.....................: 34935   541.708338/s
     success_rate...................: 100.00% ✓ 34935      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 46224      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   296 kB/s
     http_req_blocked...............: avg=15.09µs  min=1.26µs  med=3.7µs    max=42.41ms p(90)=5.64µs   p(95)=7.23µs   p(99.9)=1.63ms
     http_req_connecting............: avg=9.44µs   min=0s      med=0s       max=42.33ms p(90)=0s       p(95)=0s       p(99.9)=1.52ms
     http_req_duration..............: avg=852.36ms min=5.59ms  med=771.71ms max=14.33s  p(90)=1.6s     p(95)=1.75s    p(99.9)=10.82s
       { expected_response:true }...: avg=852.36ms min=5.59ms  med=771.71ms max=14.33s  p(90)=1.6s     p(95)=1.75s    p(99.9)=10.82s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16408
     http_req_receiving.............: avg=109.7µs  min=34.37µs med=97.61µs  max=60.5ms  p(90)=139.57µs p(95)=153.86µs p(99.9)=1.17ms
     http_req_sending...............: avg=39.81µs  min=6.19µs  med=17.68µs  max=77.61ms p(90)=24.24µs  p(95)=28.68µs  p(99.9)=3.19ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=852.21ms min=5.51ms  med=771.54ms max=14.33s  p(90)=1.6s     p(95)=1.75s    p(99.9)=10.82s
     http_reqs......................: 16408   243.752664/s
     iteration_duration.............: avg=907.74ms min=34.26ms med=837.76ms max=14.33s  p(90)=1.61s    p(95)=1.76s    p(99.9)=10.97s
     iterations.....................: 15408   228.896944/s
     success_rate...................: 100.00% ✓ 15408      ✗ 0    
     vus............................: 80      min=0        max=500
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

     checks.........................: 100.00% ✓ 41712      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   264 kB/s
     http_req_blocked...............: avg=15.69µs  min=1.3µs   med=3.35µs   max=23.65ms p(90)=5.02µs   p(95)=6.55µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=10.64µs  min=0s      med=0s       max=23.58ms p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=505.28ms min=8.37ms  med=539.53ms max=1.5s    p(90)=933.97ms p(95)=975.8ms  p(99.9)=1.35s   
       { expected_response:true }...: avg=505.28ms min=8.37ms  med=539.53ms max=1.5s    p(90)=933.97ms p(95)=975.8ms  p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14904
     http_req_receiving.............: avg=101.84µs min=32.37µs med=88.69µs  max=58.23ms p(90)=127.97µs p(95)=139.91µs p(99.9)=799.75µs
     http_req_sending...............: avg=34.08µs  min=6.37µs  med=15.71µs  max=48.91ms p(90)=22.29µs  p(95)=27.13µs  p(99.9)=3.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=505.15ms min=8.2ms   med=539.43ms max=1.5s    p(90)=933.85ms p(95)=975.62ms p(99.9)=1.35s   
     http_reqs......................: 14904   215.262935/s
     iteration_duration.............: avg=541.49ms min=14.12ms med=575.05ms max=1.53s   p(90)=940.67ms p(95)=978.96ms p(99.9)=1.36s   
     iterations.....................: 13904   200.819636/s
     success_rate...................: 100.00% ✓ 13904      ✗ 0    
     vus............................: 105     min=0        max=495
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

     checks.........................: 100.00% ✓ 418369      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=18.28µs  min=1.05µs  med=2.49µs  max=63.31ms  p(90)=4.12µs   p(95)=5.33µs   p(99.9)=2.29ms  
     http_req_connecting............: avg=14.79µs  min=0s      med=0s      max=63.14ms  p(90)=0s       p(95)=0s       p(99.9)=2.22ms  
     http_req_duration..............: avg=101.25ms min=1.62ms  med=95.33ms max=389.66ms p(90)=195ms    p(95)=210.19ms p(99.9)=255.15ms
       { expected_response:true }...: avg=101.25ms min=1.62ms  med=95.33ms max=389.66ms p(90)=195ms    p(95)=210.19ms p(99.9)=255.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140457
     http_req_receiving.............: avg=189.48µs min=29.01µs med=59.54µs max=234.68ms p(90)=164.69µs p(95)=402.18µs p(99.9)=17.91ms 
     http_req_sending...............: avg=69.37µs  min=5.47µs  med=10.73µs max=43ms     p(90)=19.99µs  p(95)=134.02µs p(99.9)=9.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.99ms min=1.54ms  med=95.13ms max=294.24ms p(90)=194.6ms  p(95)=209.74ms p(99.9)=253.22ms
     http_reqs......................: 140457  2260.058908/s
     iteration_duration.............: avg=102.25ms min=2.88ms  med=96.46ms max=418.62ms p(90)=195.57ms p(95)=210.71ms p(99.9)=257.23ms
     iterations.....................: 139456  2243.952064/s
     success_rate...................: 100.00% ✓ 139456      ✗ 0     
     vus............................: 65      min=0         max=496 
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

     checks.........................: 100.00% ✓ 206910      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=11.52µs  min=1.12µs  med=2.86µs   max=12.6ms   p(90)=4.67µs   p(95)=5.69µs   p(99.9)=585.71µs
     http_req_connecting............: avg=7.96µs   min=0s      med=0s       max=12.55ms  p(90)=0s       p(95)=0s       p(99.9)=531.61µs
     http_req_duration..............: avg=203.89ms min=2.17ms  med=206.71ms max=611.8ms  p(90)=373.26ms p(95)=401.8ms  p(99.9)=511.91ms
       { expected_response:true }...: avg=203.89ms min=2.17ms  med=206.71ms max=611.8ms  p(90)=373.26ms p(95)=401.8ms  p(99.9)=511.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69970
     http_req_receiving.............: avg=86.89µs  min=30.57µs med=69.2µs   max=34.33ms  p(90)=108.73µs p(95)=125.18µs p(99.9)=1.94ms  
     http_req_sending...............: avg=34.61µs  min=5.57µs  med=12.27µs  max=130.62ms p(90)=19.74µs  p(95)=23.71µs  p(99.9)=4.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.77ms min=2.07ms  med=206.6ms  max=611.64ms p(90)=373.16ms p(95)=401.67ms p(99.9)=511.82ms
     http_reqs......................: 69970   1116.310131/s
     iteration_duration.............: avg=207.1ms  min=4.88ms  med=210.18ms max=612.05ms p(90)=374.29ms p(95)=402.6ms  p(99.9)=512.8ms 
     iterations.....................: 68970   1100.356006/s
     success_rate...................: 100.00% ✓ 68970       ✗ 0    
     vus............................: 90      min=0         max=500
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 99258      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   634 kB/s
     http_req_blocked...............: avg=8.14µs   min=1.19µs  med=3.16µs   max=4.47ms  p(90)=4.92µs   p(95)=5.86µs   p(99.9)=896.4µs 
     http_req_connecting............: avg=3.92µs   min=0s      med=0s       max=4.4ms   p(90)=0s       p(95)=0s       p(99.9)=855.5µs 
     http_req_duration..............: avg=420.75ms min=3.77ms  med=390.15ms max=1.61s   p(90)=833.32ms p(95)=896.84ms p(99.9)=1.32s   
       { expected_response:true }...: avg=420.75ms min=3.77ms  med=390.15ms max=1.61s   p(90)=833.32ms p(95)=896.84ms p(99.9)=1.32s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34086
     http_req_receiving.............: avg=87.35µs  min=31.37µs med=80.47µs  max=3.68ms  p(90)=116.42µs p(95)=129.6µs  p(99.9)=827.46µs
     http_req_sending...............: avg=27.96µs  min=5.46µs  med=14.12µs  max=35.87ms p(90)=21.14µs  p(95)=24.22µs  p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=420.63ms min=3.7ms   med=390.06ms max=1.61s   p(90)=833.2ms  p(95)=896.78ms p(99.9)=1.32s   
     http_reqs......................: 34086   526.92842/s
     iteration_duration.............: avg=433.69ms min=21.19ms med=406.47ms max=1.62s   p(90)=836.67ms p(95)=900.18ms p(99.9)=1.32s   
     iterations.....................: 33086   511.469627/s
     success_rate...................: 100.00% ✓ 33086      ✗ 0    
     vus............................: 94      min=0        max=500
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

     checks.........................: 100.00% ✓ 45654      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   291 kB/s
     http_req_blocked...............: avg=13.6µs   min=1.21µs  med=3.39µs   max=4.21ms   p(90)=5.17µs   p(95)=6.51µs   p(99.9)=2.13ms
     http_req_connecting............: avg=8.44µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=2.07ms
     http_req_duration..............: avg=881.68ms min=5.98ms  med=802.52ms max=4.3s     p(90)=1.76s    p(95)=1.98s    p(99.9)=3.61s 
       { expected_response:true }...: avg=881.68ms min=5.98ms  med=802.52ms max=4.3s     p(90)=1.76s    p(95)=1.98s    p(99.9)=3.61s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16218
     http_req_receiving.............: avg=112.13µs min=35.25µs med=95.21µs  max=110.44ms p(90)=134.59µs p(95)=147.06µs p(99.9)=1.37ms
     http_req_sending...............: avg=33.16µs  min=6.27µs  med=17.5µs   max=70.89ms  p(90)=23.38µs  p(95)=27.8µs   p(99.9)=1.73ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=881.53ms min=5.86ms  med=802.41ms max=4.3s     p(90)=1.76s    p(95)=1.98s    p(99.9)=3.61s 
     http_reqs......................: 16218   240.234753/s
     iteration_duration.............: avg=939.66ms min=36.05ms med=863.77ms max=4.3s     p(90)=1.77s    p(95)=2s       p(99.9)=3.65s 
     iterations.....................: 15218   225.421906/s
     success_rate...................: 100.00% ✓ 15218      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 39717      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=16.22µs min=1.21µs  med=3.33µs   max=4.55ms   p(90)=5.02µs   p(95)=6.32µs   p(99.9)=2.79ms  
     http_req_connecting............: avg=11.03µs min=0s      med=0s       max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=2.67ms  
     http_req_duration..............: avg=1s      min=8.71ms  med=905.81ms max=3.74s    p(90)=2.05s    p(95)=2.16s    p(99.9)=3.31s   
       { expected_response:true }...: avg=1s      min=8.71ms  med=905.81ms max=3.74s    p(90)=2.05s    p(95)=2.16s    p(99.9)=3.31s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14239
     http_req_receiving.............: avg=358.7µs min=32.76µs med=93.74µs  max=183.62ms p(90)=135.22µs p(95)=148.07µs p(99.9)=116.99ms
     http_req_sending...............: avg=34µs    min=5.75µs  med=16.65µs  max=87.75ms  p(90)=22.59µs  p(95)=27.61µs  p(99.9)=2.61ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s      min=8.56ms  med=905.69ms max=3.74s    p(90)=2.05s    p(95)=2.16s    p(99.9)=3.31s   
     http_reqs......................: 14239   204.541147/s
     iteration_duration.............: avg=1.07s   min=14.87ms med=1.01s    max=3.75s    p(90)=2.07s    p(95)=2.17s    p(99.9)=3.34s   
     iterations.....................: 13239   190.176293/s
     success_rate...................: 100.00% ✓ 13239      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

