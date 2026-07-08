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
| hive-router | v0.0.78 | 2,854 | 2,988 | 2,825 | 1.9% |  |
| fusion-nightly-net11 | 16.5.0-p.5 | 2,326 | 2,386 | 2,312 | 1.1% |  |
| fusion | 16.4.0 | 2,270 | 2,350 | 2,248 | 1.5% |  |
| fusion-nightly | 16.5.0-p.5 | 2,265 | 2,360 | 2,251 | 1.6% |  |
| cosmo | 0.329.0 | 1,194 | 1,230 | 1,180 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 564 | 570 | 560 | 0.7% |  |
| hive-gateway | 2.10.2 | 252 | 257 | 251 | 0.7% |  |
| apollo-gateway | 2.14.2 | 232 | 238 | 232 | 0.8% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (11210 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (543115 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,199 | 2,357 | 2,165 | 3.0% |  |
| fusion | 16.4.0 | 2,192 | 2,274 | 2,180 | 1.6% |  |
| fusion-nightly | 16.5.0-p.5 | 2,148 | 2,190 | 2,124 | 1.0% |  |
| fusion-nightly-net11 | 16.5.0-p.5 | 2,123 | 2,209 | 2,116 | 1.4% |  |
| fusion-nightly-fed | 16.5.0-p.5 | 2,058 | 2,129 | 2,046 | 1.3% |  |
| cosmo | 0.329.0 | 1,160 | 1,197 | 1,152 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.2 | 531 | 547 | 526 | 1.3% |  |
| hive-gateway | 2.10.2 | 247 | 252 | 244 | 1.0% |  |
| apollo-gateway | 2.14.2 | 234 | 240 | 233 | 0.9% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (35288 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (209705 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 524646      ✗ 0     
     data_received..................: 15 GB   250 MB/s
     data_sent......................: 211 MB  3.4 MB/s
     http_req_blocked...............: avg=19.78µs  min=831ns   med=2.11µs  max=59.27ms  p(90)=3.68µs   p(95)=4.86µs   p(99.9)=1.08ms  
     http_req_connecting............: avg=16.52µs  min=0s      med=0s      max=59.15ms  p(90)=0s       p(95)=0s       p(99.9)=1.01ms  
     http_req_duration..............: avg=80.8ms   min=1.41ms  med=76.2ms  max=318ms    p(90)=157.42ms p(95)=170.92ms p(99.9)=217.89ms
       { expected_response:true }...: avg=80.8ms   min=1.41ms  med=76.2ms  max=318ms    p(90)=157.42ms p(95)=170.92ms p(99.9)=217.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175882
     http_req_receiving.............: avg=142.35µs min=25.58µs med=49.45µs max=236.34ms p(90)=137.2µs  p(95)=325.33µs p(99.9)=16.93ms 
     http_req_sending...............: avg=71.45µs  min=4.65µs  med=9.08µs  max=256.92ms p(90)=18.64µs  p(95)=112.65µs p(99.9)=9.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.58ms  min=1.37ms  med=76.02ms max=316.62ms p(90)=157.1ms  p(95)=170.57ms p(99.9)=216.99ms
     http_reqs......................: 175882  2854.458907/s
     iteration_duration.............: avg=81.52ms  min=2.19ms  med=76.99ms max=343.9ms  p(90)=157.83ms p(95)=171.4ms  p(99.9)=219.49ms
     iterations.....................: 174882  2838.22951/s
     success_rate...................: 100.00% ✓ 174882      ✗ 0     
     vus............................: 84      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431859      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=10.49µs  min=862ns   med=2.02µs   max=45.16ms  p(90)=3.36µs   p(95)=4.34µs   p(99.9)=909.01µs
     http_req_connecting............: avg=7.78µs   min=0s      med=0s       max=45.02ms  p(90)=0s       p(95)=0s       p(99.9)=818.95µs
     http_req_duration..............: avg=98.14ms  min=1.95ms  med=93.35ms  max=327.28ms p(90)=187.02ms p(95)=202.63ms p(99.9)=259.58ms
       { expected_response:true }...: avg=98.14ms  min=1.95ms  med=93.35ms  max=327.28ms p(90)=187.02ms p(95)=202.63ms p(99.9)=259.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144953
     http_req_receiving.............: avg=817.56µs min=51.85µs med=127.01µs max=221.18ms p(90)=1.6ms    p(95)=2.65ms   p(99.9)=28.68ms 
     http_req_sending...............: avg=58.19µs  min=4.53µs  med=8.43µs   max=260.68ms p(90)=16.61µs  p(95)=95.03µs  p(99.9)=7.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.27ms  min=1.87ms  med=92.47ms  max=325.22ms p(90)=186.05ms p(95)=201.67ms p(99.9)=258.11ms
     http_reqs......................: 144953  2326.926988/s
     iteration_duration.............: avg=99.06ms  min=4.17ms  med=94.37ms  max=333.16ms p(90)=187.49ms p(95)=203.07ms p(99.9)=261.51ms
     iterations.....................: 143953  2310.874012/s
     success_rate...................: 100.00% ✓ 143953      ✗ 0     
     vus............................: 71      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 422127      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=17.64µs  min=941ns   med=2.59µs   max=85.02ms  p(90)=4.17µs   p(95)=5.28µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=13.64µs  min=0s      med=0s       max=66.64ms  p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=100.52ms min=2.06ms  med=86.24ms  max=1.41s    p(90)=189.79ms p(95)=218.1ms  p(99.9)=779.05ms
       { expected_response:true }...: avg=100.52ms min=2.06ms  med=86.24ms  max=1.41s    p(90)=189.79ms p(95)=218.1ms  p(99.9)=779.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141709
     http_req_receiving.............: avg=1.89ms   min=51.51µs med=106.07µs max=843.97ms p(90)=1.71ms   p(95)=4.81ms   p(99.9)=113.6ms 
     http_req_sending...............: avg=65.84µs  min=4.61µs  med=9.85µs   max=175.19ms p(90)=18.12µs  p(95)=109.48µs p(99.9)=8.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.56ms  min=1.95ms  med=85.02ms  max=1.39s    p(90)=187.64ms p(95)=214.71ms p(99.9)=760.8ms 
     http_reqs......................: 141709  2270.831772/s
     iteration_duration.............: avg=101.49ms min=3.09ms  med=87.27ms  max=1.41s    p(90)=190.38ms p(95)=218.8ms  p(99.9)=781.12ms
     iterations.....................: 140709  2254.80716/s
     success_rate...................: 100.00% ✓ 140709      ✗ 0     
     vus............................: 81      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 421353      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=13.39µs  min=832ns  med=2.1µs    max=58.08ms  p(90)=3.63µs   p(95)=4.7µs    p(99.9)=782.15µs
     http_req_connecting............: avg=10.63µs  min=0s     med=0s       max=57.99ms  p(90)=0s       p(95)=0s       p(99.9)=709.52µs
     http_req_duration..............: avg=100.64ms min=2.07ms med=87.89ms  max=2.04s    p(90)=191.72ms p(95)=216.84ms p(99.9)=876.23ms
       { expected_response:true }...: avg=100.64ms min=2.07ms med=87.89ms  max=2.04s    p(90)=191.72ms p(95)=216.84ms p(99.9)=876.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141451
     http_req_receiving.............: avg=1.59ms   min=53.2µs med=102.98µs max=1.49s    p(90)=1.74ms   p(95)=4.58ms   p(99.9)=87.41ms 
     http_req_sending...............: avg=55.78µs  min=4.63µs med=8.9µs    max=112.79ms p(90)=17.32µs  p(95)=94.47µs  p(99.9)=7.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.98ms  min=1.96ms med=86.68ms  max=2.04s    p(90)=189.83ms p(95)=213.76ms p(99.9)=850.94ms
     http_reqs......................: 141451  2265.543292/s
     iteration_duration.............: avg=101.59ms min=3.47ms med=88.97ms  max=2.04s    p(90)=192.2ms  p(95)=217.45ms p(99.9)=877.52ms
     iterations.....................: 140451  2249.526839/s
     success_rate...................: 100.00% ✓ 140451      ✗ 0     
     vus............................: 80      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 220956      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.07µs   min=1.06µs  med=2.67µs   max=15.63ms  p(90)=4.3µs    p(95)=5.2µs    p(99.9)=522.86µs
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=15.52ms  p(90)=0s       p(95)=0s       p(99.9)=448.25µs
     http_req_duration..............: avg=191.16ms min=1.98ms  med=193.99ms max=533.7ms  p(90)=352.73ms p(95)=378.91ms p(99.9)=458.15ms
       { expected_response:true }...: avg=191.16ms min=1.98ms  med=193.99ms max=533.7ms  p(90)=352.73ms p(95)=378.91ms p(99.9)=458.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74652
     http_req_receiving.............: avg=116.87µs min=27.08µs med=60.81µs  max=184.63ms p(90)=99.3µs   p(95)=115.87µs p(99.9)=1.73ms  
     http_req_sending...............: avg=28.47µs  min=5.09µs  med=11.19µs  max=151.53ms p(90)=17.96µs  p(95)=21.85µs  p(99.9)=3.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.01ms min=1.91ms  med=193.75ms max=533.18ms p(90)=352.64ms p(95)=378.82ms p(99.9)=458.07ms
     http_reqs......................: 74652   1194.162734/s
     iteration_duration.............: avg=193.99ms min=4.16ms  med=197.01ms max=533.92ms p(90)=353.61ms p(95)=379.72ms p(99.9)=458.52ms
     iterations.....................: 73652   1178.166341/s
     success_rate...................: 100.00% ✓ 73652       ✗ 0    
     vus............................: 81      min=0         max=495
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 105939     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   678 kB/s
     http_req_blocked...............: avg=6.9µs   min=1.04µs  med=2.48µs   max=10.54ms p(90)=4.27µs   p(95)=5.24µs   p(99.9)=677.54µs
     http_req_connecting............: avg=3.4µs   min=0s      med=0s       max=10.48ms p(90)=0s       p(95)=0s       p(99.9)=626.4µs 
     http_req_duration..............: avg=394.9ms min=3.55ms  med=364.94ms max=1.57s   p(90)=776.26ms p(95)=843.24ms p(99.9)=1.22s   
       { expected_response:true }...: avg=394.9ms min=3.55ms  med=364.94ms max=1.57s   p(90)=776.26ms p(95)=843.24ms p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36313
     http_req_receiving.............: avg=75.76µs min=27.97µs med=64.7µs   max=5.27ms  p(90)=104.09µs p(95)=119.09µs p(99.9)=1.09ms  
     http_req_sending...............: avg=29.68µs min=5.13µs  med=12.12µs  max=94.59ms p(90)=19.82µs  p(95)=22.7µs   p(99.9)=2.26ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=394.8ms min=3.5ms   med=364.84ms max=1.57s   p(90)=776.2ms  p(95)=843.16ms p(99.9)=1.22s   
     http_reqs......................: 36313   564.906181/s
     iteration_duration.............: avg=406.3ms min=25.42ms med=378.92ms max=1.57s   p(90)=779.55ms p(95)=845.68ms p(99.9)=1.22s   
     iterations.....................: 35313   549.349598/s
     success_rate...................: 100.00% ✓ 35313      ✗ 0    
     vus............................: 69      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47916      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   304 kB/s
     http_req_blocked...............: avg=14.59µs  min=1.33µs  med=3.66µs   max=11.83ms  p(90)=5.44µs   p(95)=6.84µs   p(99.9)=2.15ms
     http_req_connecting............: avg=9.24µs   min=0s      med=0s       max=11.77ms  p(90)=0s       p(95)=0s       p(99.9)=2.13ms
     http_req_duration..............: avg=845.71ms min=5.25ms  med=765.53ms max=16.56s   p(90)=1.52s    p(95)=1.71s    p(99.9)=14.9s 
       { expected_response:true }...: avg=845.71ms min=5.25ms  med=765.53ms max=16.56s   p(90)=1.52s    p(95)=1.71s    p(99.9)=14.9s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16972
     http_req_receiving.............: avg=161.48µs min=33.33µs med=88.25µs  max=167.27ms p(90)=125.25µs p(95)=140.54µs p(99.9)=8.07ms
     http_req_sending...............: avg=36.7µs   min=6.47µs  med=17.7µs   max=48.93ms  p(90)=23.66µs  p(95)=28.2µs   p(99.9)=3.46ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=845.51ms min=5.18ms  med=765.38ms max=16.56s   p(90)=1.52s    p(95)=1.71s    p(99.9)=14.9s 
     http_reqs......................: 16972   252.719299/s
     iteration_duration.............: avg=898.71ms min=21.86ms med=819.94ms max=16.56s   p(90)=1.55s    p(95)=1.72s    p(99.9)=15.16s
     iterations.....................: 15972   237.828933/s
     success_rate...................: 100.00% ✓ 15972      ✗ 0    
     vus............................: 61      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47955      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   285 kB/s
     http_req_blocked...............: avg=13.22µs  min=1.31µs  med=3.27µs   max=3.99ms  p(90)=4.9µs    p(95)=6.25µs   p(99.9)=2.03ms  
     http_req_connecting............: avg=8.24µs   min=0s      med=0s       max=3.94ms  p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=365.39ms min=7.51ms  med=433.86ms max=1.02s   p(90)=602.81ms p(95)=647.38ms p(99.9)=893.57ms
       { expected_response:true }...: avg=365.39ms min=7.51ms  med=433.86ms max=1.02s   p(90)=602.81ms p(95)=647.38ms p(99.9)=893.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16985
     http_req_receiving.............: avg=89.7µs   min=35.63µs med=80.02µs  max=30.15ms p(90)=119.72µs p(95)=134.95µs p(99.9)=1.02ms  
     http_req_sending...............: avg=32.49µs  min=6.41µs  med=15.93µs  max=83.58ms p(90)=21.67µs  p(95)=25.71µs  p(99.9)=2.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=365.27ms min=7.42ms  med=433.77ms max=1.02s   p(90)=602.73ms p(95)=647.25ms p(99.9)=893.41ms
     http_reqs......................: 16985   232.40723/s
     iteration_duration.............: avg=388.27ms min=8.36ms  med=451.39ms max=1.02s   p(90)=605.89ms p(95)=652.01ms p(99.9)=903.21ms
     iterations.....................: 15985   218.724144/s
     success_rate...................: 100.00% ✓ 15985      ✗ 0    
     vus............................: 56      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 406713      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=8.82µs   min=872ns   med=2.29µs   max=35.05ms  p(90)=3.97µs   p(95)=5.15µs   p(99.9)=481.56µs
     http_req_connecting............: avg=5.77µs   min=0s      med=0s       max=34.98ms  p(90)=0s       p(95)=0s       p(99.9)=410.99µs
     http_req_duration..............: avg=104.2ms  min=1.55ms  med=100.54ms max=322.37ms p(90)=199.94ms p(95)=215.72ms p(99.9)=261.25ms
       { expected_response:true }...: avg=104.2ms  min=1.55ms  med=100.54ms max=322.37ms p(90)=199.94ms p(95)=215.72ms p(99.9)=261.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136571
     http_req_receiving.............: avg=95.39µs  min=25.81µs med=55.19µs  max=62.86ms  p(90)=102.35µs p(95)=264.3µs  p(99.9)=5.2ms   
     http_req_sending...............: avg=47.66µs  min=4.66µs  med=9.95µs   max=103.63ms p(90)=17.65µs  p(95)=95.8µs   p(99.9)=6.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.06ms min=1.51ms  med=100.39ms max=321.34ms p(90)=199.78ms p(95)=215.53ms p(99.9)=260.49ms
     http_reqs......................: 136571  2199.17628/s
     iteration_duration.............: avg=105.2ms  min=4.1ms   med=101.71ms max=334.32ms p(90)=200.43ms p(95)=216.08ms p(99.9)=262.05ms
     iterations.....................: 135571  2183.073474/s
     success_rate...................: 100.00% ✓ 135571      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 404742      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=14.69µs  min=861ns   med=2.33µs   max=91.32ms  p(90)=4.22µs   p(95)=5.36µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=11.62µs  min=0s      med=0s       max=91.25ms  p(90)=0s       p(95)=0s       p(99.9)=936.9µs 
     http_req_duration..............: avg=104.72ms min=1.63ms  med=92.39ms  max=1.42s    p(90)=199.28ms p(95)=227.32ms p(99.9)=736.73ms
       { expected_response:true }...: avg=104.72ms min=1.63ms  med=92.39ms  max=1.42s    p(90)=199.28ms p(95)=227.32ms p(99.9)=736.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135914
     http_req_receiving.............: avg=1.49ms   min=52.03µs med=106.94µs max=728.14ms p(90)=1.64ms   p(95)=4.1ms    p(99.9)=109.23ms
     http_req_sending...............: avg=56.01µs  min=4.52µs  med=9.61µs   max=144.67ms p(90)=20.04µs  p(95)=100.94µs p(99.9)=7.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.17ms min=1.52ms  med=91.16ms  max=1.31s    p(90)=196.78ms p(95)=223.82ms p(99.9)=729.22ms
     http_reqs......................: 135914  2192.196351/s
     iteration_duration.............: avg=105.76ms min=3.29ms  med=93.59ms  max=1.42s    p(90)=199.88ms p(95)=228ms    p(99.9)=738.54ms
     iterations.....................: 134914  2176.067061/s
     success_rate...................: 100.00% ✓ 134914      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 396465      ✗ 0     
     data_received..................: 12 GB   188 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=14.71µs  min=932ns   med=2.28µs  max=56.07ms  p(90)=3.97µs   p(95)=5.17µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=11.54µs  min=0s      med=0s      max=56.03ms  p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=106.9ms  min=1.54ms  med=90.83ms max=2.26s    p(90)=203.98ms p(95)=235.74ms p(99.9)=830.51ms
       { expected_response:true }...: avg=106.9ms  min=1.54ms  med=90.83ms max=2.26s    p(90)=203.98ms p(95)=235.74ms p(99.9)=830.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133155
     http_req_receiving.............: avg=1.87ms   min=51.72µs med=113.7µs max=792.44ms p(90)=2.17ms   p(95)=5.93ms   p(99.9)=123.66ms
     http_req_sending...............: avg=61.22µs  min=4.72µs  med=9.51µs  max=191.51ms p(90)=19.41µs  p(95)=96.48µs  p(99.9)=7.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.97ms min=1.46ms  med=89.2ms  max=2.26s    p(90)=201.9ms  p(95)=231.84ms p(99.9)=725.07ms
     http_reqs......................: 133155  2148.539153/s
     iteration_duration.............: avg=107.97ms min=3.17ms  med=92.06ms max=2.26s    p(90)=204.6ms  p(95)=236.44ms p(99.9)=832.31ms
     iterations.....................: 132155  2132.403528/s
     success_rate...................: 100.00% ✓ 132155      ✗ 0     
     vus............................: 55      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 391359      ✗ 0     
     data_received..................: 12 GB   186 MB/s
     data_sent......................: 158 MB  2.6 MB/s
     http_req_blocked...............: avg=8.93µs   min=871ns   med=2.21µs   max=30.83ms  p(90)=3.96µs   p(95)=5.05µs   p(99.9)=899.32µs
     http_req_connecting............: avg=5.87µs   min=0s      med=0s       max=23.77ms  p(90)=0s       p(95)=0s       p(99.9)=819.37µs
     http_req_duration..............: avg=108.26ms min=1.52ms  med=103.84ms max=435.04ms p(90)=206.07ms p(95)=223.26ms p(99.9)=299.58ms
       { expected_response:true }...: avg=108.26ms min=1.52ms  med=103.84ms max=435.04ms p(90)=206.07ms p(95)=223.26ms p(99.9)=299.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131453
     http_req_receiving.............: avg=950.14µs min=52.83µs med=136.55µs max=180.1ms  p(90)=1.81ms   p(95)=3.08ms   p(99.9)=32.05ms 
     http_req_sending...............: avg=50.33µs  min=4.79µs  med=9.27µs   max=215.71ms p(90)=18.54µs  p(95)=91.11µs  p(99.9)=6.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.26ms min=1.45ms  med=102.82ms max=434.94ms p(90)=205.1ms  p(95)=222.1ms  p(99.9)=298.6ms 
     http_reqs......................: 131453  2123.774717/s
     iteration_duration.............: avg=109.33ms min=3.72ms  med=105.16ms max=435.26ms p(90)=206.55ms p(95)=223.68ms p(99.9)=300.46ms
     iterations.....................: 130453  2107.618565/s
     success_rate...................: 100.00% ✓ 130453      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 381864      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=11.89µs  min=871ns   med=2.38µs   max=48.75ms  p(90)=4.16µs   p(95)=5.32µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=8.73µs   min=0s      med=0s       max=48.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.01ms  
     http_req_duration..............: avg=110.97ms min=1.86ms  med=98.05ms  max=1.72s    p(90)=211.93ms p(95)=240ms    p(99.9)=780.12ms
       { expected_response:true }...: avg=110.97ms min=1.86ms  med=98.05ms  max=1.72s    p(90)=211.93ms p(95)=240ms    p(99.9)=780.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128288
     http_req_receiving.............: avg=1.32ms   min=51.13µs med=108.42µs max=1s       p(90)=1.54ms   p(95)=3.52ms   p(99.9)=100.19ms
     http_req_sending...............: avg=53.74µs  min=5.04µs  med=10.02µs  max=106.54ms p(90)=19.54µs  p(95)=91.82µs  p(99.9)=6.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.6ms  min=1.78ms  med=97.09ms  max=1.72s    p(90)=210.37ms p(95)=237.22ms p(99.9)=761.77ms
     http_reqs......................: 128288  2058.58927/s
     iteration_duration.............: avg=112.09ms min=3.31ms  med=99.17ms  max=1.72s    p(90)=212.57ms p(95)=240.59ms p(99.9)=795.26ms
     iterations.....................: 127288  2042.542646/s
     success_rate...................: 100.00% ✓ 127288      ✗ 0     
     vus............................: 73      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 215094      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=7.58µs   min=1.01µs  med=2.37µs   max=9.75ms   p(90)=4.16µs   p(95)=5.19µs   p(99.9)=619.16µs
     http_req_connecting............: avg=4.48µs   min=0s      med=0s       max=9.7ms    p(90)=0s       p(95)=0s       p(99.9)=557.06µs
     http_req_duration..............: avg=196.26ms min=2.07ms  med=197.13ms max=591.19ms p(90)=364.41ms p(95)=391.11ms p(99.9)=498.82ms
       { expected_response:true }...: avg=196.26ms min=2.07ms  med=197.13ms max=591.19ms p(90)=364.41ms p(95)=391.11ms p(99.9)=498.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72698
     http_req_receiving.............: avg=77.57µs  min=28.17µs med=64.93µs  max=46.08ms  p(90)=105.72µs p(95)=120.37µs p(99.9)=990.12µs
     http_req_sending...............: avg=29.58µs  min=4.99µs  med=11.03µs  max=90.21ms  p(90)=18.66µs  p(95)=22.53µs  p(99.9)=3.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.15ms min=1.98ms  med=196.97ms max=591.13ms p(90)=364.31ms p(95)=391.01ms p(99.9)=498.71ms
     http_reqs......................: 72698   1160.889297/s
     iteration_duration.............: avg=199.23ms min=5ms     med=200.36ms max=591.37ms p(90)=365.44ms p(95)=391.8ms  p(99.9)=499.24ms
     iterations.....................: 71698   1144.920641/s
     success_rate...................: 100.00% ✓ 71698       ✗ 0    
     vus............................: 86      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100374     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   639 kB/s
     http_req_blocked...............: avg=9.48µs   min=1.12µs  med=3.26µs   max=21.37ms  p(90)=5.14µs   p(95)=6.27µs   p(99.9)=1.37ms
     http_req_connecting............: avg=5.16µs   min=0s      med=0s       max=21.29ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms
     http_req_duration..............: avg=416.39ms min=3.89ms  med=386.85ms max=1.59s    p(90)=818.51ms p(95)=893.41ms p(99.9)=1.34s 
       { expected_response:true }...: avg=416.39ms min=3.89ms  med=386.85ms max=1.59s    p(90)=818.51ms p(95)=893.41ms p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34458
     http_req_receiving.............: avg=92.99µs  min=32.65µs med=77.27µs  max=153.39ms p(90)=116.82µs p(95)=132.02µs p(99.9)=1.18ms
     http_req_sending...............: avg=46.79µs  min=5.79µs  med=15.13µs  max=233.41ms p(90)=22.53µs  p(95)=25.48µs  p(99.9)=3.32ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=416.25ms min=3.8ms   med=386.76ms max=1.59s    p(90)=818.43ms p(95)=893.32ms p(99.9)=1.34s 
     http_reqs......................: 34458   531.883054/s
     iteration_duration.............: avg=429.07ms min=17.65ms med=399.92ms max=1.6s     p(90)=822.83ms p(95)=896.96ms p(99.9)=1.34s 
     iterations.....................: 33458   516.447363/s
     success_rate...................: 100.00% ✓ 33458      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47223      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   297 kB/s
     http_req_blocked...............: avg=16.7µs   min=1.1µs   med=3.36µs   max=44.94ms p(90)=5.13µs   p(95)=6.67µs  p(99.9)=2.07ms
     http_req_connecting............: avg=8.98µs   min=0s      med=0s       max=3.65ms  p(90)=0s       p(95)=0s      p(99.9)=2.01ms
     http_req_duration..............: avg=868.79ms min=5.65ms  med=771.49ms max=4.58s   p(90)=1.74s    p(95)=1.93s   p(99.9)=3.88s 
       { expected_response:true }...: avg=868.79ms min=5.65ms  med=771.49ms max=4.58s   p(90)=1.74s    p(95)=1.93s   p(99.9)=3.88s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16741
     http_req_receiving.............: avg=107.73µs min=34.13µs med=95.94µs  max=49.51ms p(90)=135.46µs p(95)=151.3µs p(99.9)=1.57ms
     http_req_sending...............: avg=25.69µs  min=5.86µs  med=18.25µs  max=8.22ms  p(90)=23.77µs  p(95)=28.53µs p(99.9)=1.89ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=868.66ms min=5.56ms  med=771.39ms max=4.58s   p(90)=1.74s    p(95)=1.93s   p(99.9)=3.88s 
     http_reqs......................: 16741   247.175285/s
     iteration_duration.............: avg=923.99ms min=40.37ms med=852.41ms max=4.58s   p(90)=1.75s    p(95)=1.94s   p(99.9)=3.91s 
     iterations.....................: 15741   232.410618/s
     success_rate...................: 100.00% ✓ 15741      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45501     ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   282 kB/s
     http_req_blocked...............: avg=16.76µs  min=1.49µs  med=3.71µs   max=11.51ms p(90)=5.56µs   p(95)=7.16µs   p(99.9)=2.43ms  
     http_req_connecting............: avg=11.21µs  min=0s      med=0s       max=11.44ms p(90)=0s       p(95)=0s       p(99.9)=2.37ms  
     http_req_duration..............: avg=899.2ms  min=7.87ms  med=824.74ms max=3.25s   p(90)=1.83s    p(95)=1.96s    p(99.9)=2.84s   
       { expected_response:true }...: avg=899.2ms  min=7.87ms  med=824.74ms max=3.25s   p(90)=1.83s    p(95)=1.96s    p(99.9)=2.84s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 16167
     http_req_receiving.............: avg=103.15µs min=34.91µs med=90.18µs  max=82.54ms p(90)=130.61µs p(95)=146.12µs p(99.9)=904.25µs
     http_req_sending...............: avg=40.34µs  min=6.41µs  med=18.38µs  max=85.72ms p(90)=24.66µs  p(95)=30.18µs  p(99.9)=3.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=899.06ms min=7.76ms  med=824.62ms max=3.25s   p(90)=1.83s    p(95)=1.96s    p(99.9)=2.84s   
     http_reqs......................: 16167   234.75001/s
     iteration_duration.............: avg=958.47ms min=70.1ms  med=898.2ms  max=3.26s   p(90)=1.84s    p(95)=1.97s    p(99.9)=2.86s   
     iterations.....................: 15167   220.22969/s
     success_rate...................: 100.00% ✓ 15167     ✗ 0    
     vus............................: 5       min=0       max=500
     vus_max........................: 500     min=500     max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

