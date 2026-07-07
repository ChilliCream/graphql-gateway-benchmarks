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
| hive-router | v0.0.78 | 2,841 | 2,963 | 2,797 | 2.0% |  |
| fusion-nightly-net11 | 16.5.0-p.1 | 2,318 | 2,388 | 2,310 | 1.1% |  |
| fusion-nightly | 16.5.0-p.1 | 2,275 | 2,354 | 2,261 | 1.3% |  |
| fusion | 16.4.0 | 2,192 | 2,285 | 2,177 | 1.7% |  |
| cosmo | 0.329.0 | 1,224 | 1,266 | 1,222 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.2 | 569 | 579 | 563 | 0.9% |  |
| hive-gateway | 2.10.2 | 260 | 266 | 256 | 1.1% |  |
| apollo-gateway | 2.14.2 | 229 | 236 | 228 | 1.1% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (11830 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (538965 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,325 | 2,497 | 2,254 | 3.3% |  |
| fusion-nightly-net11 | 16.5.0-p.1 | 2,231 | 2,310 | 2,223 | 1.4% |  |
| fusion-nightly | 16.5.0-p.1 | 2,190 | 2,267 | 2,181 | 1.3% |  |
| fusion | 16.4.0 | 2,127 | 2,208 | 2,104 | 1.9% |  |
| fusion-nightly-fed | 16.5.0-p.1 | 2,056 | 2,141 | 2,048 | 1.6% |  |
| cosmo | 0.329.0 | 1,136 | 1,171 | 1,125 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 523 | 540 | 518 | 1.3% |  |
| hive-gateway | 2.10.2 | 245 | 252 | 244 | 1.0% |  |
| apollo-gateway | 2.14.2 | 236 | 240 | 234 | 0.8% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (26842 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (269118 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 523368      ✗ 0     
     data_received..................: 15 GB   249 MB/s
     data_sent......................: 211 MB  3.4 MB/s
     http_req_blocked...............: avg=20.1µs   min=892ns   med=2.13µs  max=75.13ms  p(90)=3.64µs   p(95)=4.81µs   p(99.9)=2.67ms  
     http_req_connecting............: avg=17.07µs  min=0s      med=0s      max=74.94ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=80.99ms  min=1.4ms   med=74.76ms max=316.04ms p(90)=157.74ms p(95)=173.32ms p(99.9)=226.52ms
       { expected_response:true }...: avg=80.99ms  min=1.4ms   med=74.76ms max=316.04ms p(90)=157.74ms p(95)=173.32ms p(99.9)=226.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175456
     http_req_receiving.............: avg=135.92µs min=26.14µs med=50.62µs max=50.69ms  p(90)=130.64µs p(95)=320.1µs  p(99.9)=15.61ms 
     http_req_sending...............: avg=67.47µs  min=4.5µs   med=9.01µs  max=207.03ms p(90)=17.26µs  p(95)=110.01µs p(99.9)=9ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.78ms  min=1.35ms  med=74.55ms max=307.79ms p(90)=157.44ms p(95)=173.02ms p(99.9)=225.82ms
     http_reqs......................: 175456  2841.664189/s
     iteration_duration.............: avg=81.7ms   min=2.33ms  med=75.5ms  max=331.86ms p(90)=158.21ms p(95)=173.73ms p(99.9)=228.28ms
     iterations.....................: 174456  2825.468309/s
     success_rate...................: 100.00% ✓ 174456      ✗ 0     
     vus............................: 90      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 430968      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=12.32µs  min=891ns   med=2.08µs   max=44.48ms  p(90)=3.5µs    p(95)=4.51µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=9.31µs   min=0s      med=0s       max=44.3ms   p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=98.35ms  min=1.95ms  med=93.71ms  max=343.93ms p(90)=186.77ms p(95)=202.66ms p(99.9)=260.28ms
       { expected_response:true }...: avg=98.35ms  min=1.95ms  med=93.71ms  max=343.93ms p(90)=186.77ms p(95)=202.66ms p(99.9)=260.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144656
     http_req_receiving.............: avg=817.36µs min=50.83µs med=125.91µs max=104.95ms p(90)=1.6ms    p(95)=2.63ms   p(99.9)=28.9ms  
     http_req_sending...............: avg=54.52µs  min=4.7µs   med=8.98µs   max=184.63ms p(90)=17.72µs  p(95)=97.32µs  p(99.9)=7.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.48ms  min=1.85ms  med=92.94ms  max=343.85ms p(90)=185.86ms p(95)=201.78ms p(99.9)=257.81ms
     http_reqs......................: 144656  2318.951721/s
     iteration_duration.............: avg=99.27ms  min=3.89ms  med=94.74ms  max=344.11ms p(90)=187.26ms p(95)=203.14ms p(99.9)=261.14ms
     iterations.....................: 143656  2302.920919/s
     success_rate...................: 100.00% ✓ 143656      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 424053      ✗ 0     
     data_received..................: 13 GB   199 MB/s
     data_sent......................: 171 MB  2.7 MB/s
     http_req_blocked...............: avg=15.19µs  min=1.03µs  med=2.57µs   max=67.55ms  p(90)=4.11µs   p(95)=5.17µs   p(99.9)=968.69µs
     http_req_connecting............: avg=11.97µs  min=0s      med=0s       max=67.32ms  p(90)=0s       p(95)=0s       p(99.9)=899.28µs
     http_req_duration..............: avg=99.98ms  min=2.1ms   med=90.38ms  max=1.14s    p(90)=188.45ms p(95)=212.56ms p(99.9)=618.1ms 
       { expected_response:true }...: avg=99.98ms  min=2.1ms   med=90.38ms  max=1.14s    p(90)=188.45ms p(95)=212.56ms p(99.9)=618.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142351
     http_req_receiving.............: avg=1.32ms   min=51.56µs med=103.34µs max=613.26ms p(90)=1.59ms   p(95)=4.21ms   p(99.9)=85.87ms 
     http_req_sending...............: avg=61.51µs  min=4.83µs  med=9.79µs   max=138.79ms p(90)=18.44µs  p(95)=113.57µs p(99.9)=7.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.6ms   min=2.01ms  med=89.11ms  max=1.14s    p(90)=186.55ms p(95)=209.73ms p(99.9)=585.72ms
     http_reqs......................: 142351  2275.293045/s
     iteration_duration.............: avg=100.93ms min=2.98ms  med=91.48ms  max=1.14s    p(90)=188.97ms p(95)=213.11ms p(99.9)=619.17ms
     iterations.....................: 141351  2259.309364/s
     success_rate...................: 100.00% ✓ 141351      ✗ 0     
     vus............................: 83      min=0         max=493 
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

     checks.........................: 100.00% ✓ 408699      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 165 MB  2.6 MB/s
     http_req_blocked...............: avg=15.25µs  min=1.05µs med=2.64µs   max=54.22ms  p(90)=4.16µs   p(95)=5.22µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=11.87µs  min=0s     med=0s       max=54.13ms  p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=103.76ms min=2.13ms med=89.39ms  max=1.67s    p(90)=195.67ms p(95)=234.05ms p(99.9)=849.8ms 
       { expected_response:true }...: avg=103.76ms min=2.13ms med=89.39ms  max=1.67s    p(90)=195.67ms p(95)=234.05ms p(99.9)=849.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 137233
     http_req_receiving.............: avg=2.24ms   min=53.2µs med=108.28µs max=697.84ms p(90)=2.12ms   p(95)=6.64ms   p(99.9)=189.39ms
     http_req_sending...............: avg=57.84µs  min=5.07µs med=9.72µs   max=156.12ms p(90)=17.4µs   p(95)=108.5µs  p(99.9)=7.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.45ms min=2.02ms med=88.01ms  max=1.67s    p(90)=192.98ms p(95)=228.86ms p(99.9)=792.82ms
     http_reqs......................: 137233  2192.721501/s
     iteration_duration.............: avg=104.79ms min=3.34ms med=90.47ms  max=1.67s    p(90)=196.33ms p(95)=235.15ms p(99.9)=850.75ms
     iterations.....................: 136233  2176.743409/s
     success_rate...................: 100.00% ✓ 136233      ✗ 0     
     vus............................: 85      min=0         max=492 
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

     checks.........................: 100.00% ✓ 226620      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=4.92µs   min=962ns   med=2.15µs   max=6.52ms   p(90)=3.74µs   p(95)=4.67µs   p(99.9)=472.25µs
     http_req_connecting............: avg=2.11µs   min=0s      med=0s       max=6.45ms   p(90)=0s       p(95)=0s       p(99.9)=393.44µs
     http_req_duration..............: avg=186.42ms min=1.86ms  med=186.78ms max=485.72ms p(90)=345.43ms p(95)=369.37ms p(99.9)=436.28ms
       { expected_response:true }...: avg=186.42ms min=1.86ms  med=186.78ms max=485.72ms p(90)=345.43ms p(95)=369.37ms p(99.9)=436.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76540
     http_req_receiving.............: avg=71.78µs  min=28.34µs med=58µs     max=87.76ms  p(90)=95.06µs  p(95)=108.4µs  p(99.9)=1.05ms  
     http_req_sending...............: avg=27.55µs  min=4.92µs  med=9.83µs   max=143.69ms p(90)=16.62µs  p(95)=20.49µs  p(99.9)=2.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.32ms min=1.81ms  med=186.69ms max=485.65ms p(90)=345.35ms p(95)=369.29ms p(99.9)=436.21ms
     http_reqs......................: 76540   1224.316621/s
     iteration_duration.............: avg=189.11ms min=3.71ms  med=189.81ms max=485.88ms p(90)=346.17ms p(95)=370.07ms p(99.9)=436.65ms
     iterations.....................: 75540   1208.320846/s
     success_rate...................: 100.00% ✓ 75540       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 106662     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   684 kB/s
     http_req_blocked...............: avg=18.64µs  min=1.17µs  med=3.17µs   max=23.1ms  p(90)=4.98µs   p(95)=5.99µs   p(99.9)=5.08ms  
     http_req_connecting............: avg=14.29µs  min=0s      med=0s       max=20.48ms p(90)=0s       p(95)=0s       p(99.9)=4.86ms  
     http_req_duration..............: avg=392.45ms min=3.54ms  med=369.47ms max=1.48s   p(90)=766.47ms p(95)=834.68ms p(99.9)=1.22s   
       { expected_response:true }...: avg=392.45ms min=3.54ms  med=369.47ms max=1.48s   p(90)=766.47ms p(95)=834.68ms p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36554
     http_req_receiving.............: avg=79.86µs  min=30.58µs med=68.81µs  max=22.88ms p(90)=107.1µs  p(95)=120.9µs  p(99.9)=991.16µs
     http_req_sending...............: avg=25.69µs  min=5.49µs  med=13.88µs  max=22.77ms p(90)=21.33µs  p(95)=24.37µs  p(99.9)=2.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=392.34ms min=3.47ms  med=369.38ms max=1.48s   p(90)=766.35ms p(95)=834.59ms p(99.9)=1.22s   
     http_reqs......................: 36554   569.366241/s
     iteration_duration.............: avg=403.72ms min=28.06ms med=382.4ms  max=1.48s   p(90)=770.44ms p(95)=837.55ms p(99.9)=1.23s   
     iterations.....................: 35554   553.79021/s
     success_rate...................: 100.00% ✓ 35554      ✗ 0    
     vus............................: 66      min=0        max=496
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

     checks.........................: 100.00% ✓ 49476      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   313 kB/s
     http_req_blocked...............: avg=12.27µs  min=1.51µs  med=3.82µs   max=4.9ms    p(90)=5.69µs   p(95)=7.12µs   p(99.9)=1.67ms
     http_req_connecting............: avg=6.79µs   min=0s      med=0s       max=4.63ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms
     http_req_duration..............: avg=823.8ms  min=5.32ms  med=724.54ms max=17.66s   p(90)=1.44s    p(95)=1.64s    p(99.9)=15.63s
       { expected_response:true }...: avg=823.8ms  min=5.32ms  med=724.54ms max=17.66s   p(90)=1.44s    p(95)=1.64s    p(99.9)=15.63s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17492
     http_req_receiving.............: avg=107.49µs min=34.61µs med=93.44µs  max=100.93ms p(90)=131.72µs p(95)=147.85µs p(99.9)=1.05ms
     http_req_sending...............: avg=37.84µs  min=6.07µs  med=18.33µs  max=79.4ms   p(90)=24.14µs  p(95)=28.41µs  p(99.9)=1.42ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=823.66ms min=5.25ms  med=724.43ms max=17.66s   p(90)=1.44s    p(95)=1.64s    p(99.9)=15.63s
     http_reqs......................: 17492   260.587778/s
     iteration_duration.............: avg=873.86ms min=31.15ms med=767.53ms max=17.66s   p(90)=1.46s    p(95)=1.65s    p(99.9)=15.65s
     iterations.....................: 16492   245.690238/s
     success_rate...................: 100.00% ✓ 16492      ✗ 0    
     vus............................: 44      min=0        max=500
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

     checks.........................: 100.00% ✓ 47340      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   282 kB/s
     http_req_blocked...............: avg=14.03µs  min=1.38µs  med=3.55µs   max=4.22ms  p(90)=5.25µs   p(95)=6.63µs   p(99.9)=2.15ms
     http_req_connecting............: avg=8.82µs   min=0s      med=0s       max=4.15ms  p(90)=0s       p(95)=0s       p(99.9)=2.13ms
     http_req_duration..............: avg=402.71ms min=7.51ms  med=428.18ms max=1.19s   p(90)=713.05ms p(95)=767.24ms p(99.9)=1.06s 
       { expected_response:true }...: avg=402.71ms min=7.51ms  med=428.18ms max=1.19s   p(90)=713.05ms p(95)=767.24ms p(99.9)=1.06s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16780
     http_req_receiving.............: avg=98.31µs  min=34.44µs med=85.65µs  max=32.13ms p(90)=123.98µs p(95)=139.3µs  p(99.9)=1.17ms
     http_req_sending...............: avg=34.7µs   min=5.75µs  med=16.44µs  max=68.79ms p(90)=21.96µs  p(95)=26.52µs  p(99.9)=4.02ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=402.58ms min=7.38ms  med=428.08ms max=1.19s   p(90)=712.94ms p(95)=767.15ms p(99.9)=1.06s 
     http_reqs......................: 16780   229.596642/s
     iteration_duration.............: avg=428.22ms min=8.65ms  med=461.38ms max=1.19s   p(90)=717.56ms p(95)=772.54ms p(99.9)=1.07s 
     iterations.....................: 15780   215.913887/s
     success_rate...................: 100.00% ✓ 15780      ✗ 0    
     vus............................: 55      min=0        max=497
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

     checks.........................: 100.00% ✓ 429612      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=11.2µs   min=941ns   med=2.4µs   max=44.64ms  p(90)=4.12µs   p(95)=5.3µs    p(99.9)=514.4µs 
     http_req_connecting............: avg=7.94µs   min=0s      med=0s      max=44.58ms  p(90)=0s       p(95)=0s       p(99.9)=450.64µs
     http_req_duration..............: avg=98.66ms  min=1.5ms   med=93.99ms max=346.87ms p(90)=191.32ms p(95)=207.16ms p(99.9)=259.69ms
       { expected_response:true }...: avg=98.66ms  min=1.5ms   med=93.99ms max=346.87ms p(90)=191.32ms p(95)=207.16ms p(99.9)=259.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144204
     http_req_receiving.............: avg=107.91µs min=25.37µs med=53.55µs max=51.45ms  p(90)=115.84µs p(95)=315.04µs p(99.9)=7.53ms  
     http_req_sending...............: avg=55.55µs  min=4.66µs  med=10.15µs max=227.7ms  p(90)=19.39µs  p(95)=110.01µs p(99.9)=6.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.5ms   min=1.43ms  med=93.82ms max=346.72ms p(90)=191.12ms p(95)=206.93ms p(99.9)=259.03ms
     http_reqs......................: 144204  2325.02144/s
     iteration_duration.............: avg=99.58ms  min=3.76ms  med=95.08ms max=356.51ms p(90)=191.78ms p(95)=207.56ms p(99.9)=260.82ms
     iterations.....................: 143204  2308.898299/s
     success_rate...................: 100.00% ✓ 143204      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 411390      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=17.27µs  min=1.07µs  med=2.91µs   max=51.18ms  p(90)=4.75µs   p(95)=5.94µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=13.53µs  min=0s      med=0s       max=51.11ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=102.98ms min=1.52ms  med=97.34ms  max=462.07ms p(90)=196.94ms p(95)=213.32ms p(99.9)=282.96ms
       { expected_response:true }...: avg=102.98ms min=1.52ms  med=97.34ms  max=462.07ms p(90)=196.94ms p(95)=213.32ms p(99.9)=282.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138130
     http_req_receiving.............: avg=896.91µs min=52.78µs med=127.26µs max=214.68ms p(90)=1.75ms   p(95)=2.97ms   p(99.9)=33.09ms 
     http_req_sending...............: avg=68.53µs  min=5.22µs  med=10.87µs  max=206.03ms p(90)=21.97µs  p(95)=122.95µs p(99.9)=8.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.01ms min=1.45ms  med=96.4ms   max=461.97ms p(90)=195.94ms p(95)=212.25ms p(99.9)=281.7ms 
     http_reqs......................: 138130  2231.426369/s
     iteration_duration.............: avg=104ms    min=3.24ms  med=98.47ms  max=462.26ms p(90)=197.5ms  p(95)=213.78ms p(99.9)=283.83ms
     iterations.....................: 137130  2215.27183/s
     success_rate...................: 100.00% ✓ 137130      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 404307      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=13.42µs  min=881ns  med=2.28µs   max=77.5ms   p(90)=4.06µs   p(95)=5.22µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=10.25µs  min=0s     med=0s       max=70.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=104.87ms min=1.59ms med=87.55ms  max=1.25s    p(90)=199.11ms p(95)=229.68ms p(99.9)=739.38ms
       { expected_response:true }...: avg=104.87ms min=1.59ms med=87.55ms  max=1.25s    p(90)=199.11ms p(95)=229.68ms p(99.9)=739.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135769
     http_req_receiving.............: avg=1.73ms   min=51.9µs med=108.82µs max=952.99ms p(90)=1.84ms   p(95)=5.01ms   p(99.9)=105.03ms
     http_req_sending...............: avg=58.7µs   min=4.66µs med=9.43µs   max=188.89ms p(90)=19.91µs  p(95)=97.43µs  p(99.9)=7.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.07ms min=1.47ms med=86.21ms  max=1.25s    p(90)=197.25ms p(95)=226.05ms p(99.9)=717.29ms
     http_reqs......................: 135769  2190.309026/s
     iteration_duration.............: avg=105.9ms  min=2.53ms med=88.77ms  max=1.25s    p(90)=199.78ms p(95)=230.67ms p(99.9)=740.49ms
     iterations.....................: 134769  2174.17641/s
     success_rate...................: 100.00% ✓ 134769      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 392778      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 158 MB  2.6 MB/s
     http_req_blocked...............: avg=13.52µs  min=912ns   med=2.67µs   max=64.22ms  p(90)=4.42µs   p(95)=5.52µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=10.2µs   min=0s      med=0s       max=64.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=107.93ms min=1.63ms  med=91.17ms  max=1.63s    p(90)=206.69ms p(95)=241.79ms p(99.9)=764.07ms
       { expected_response:true }...: avg=107.93ms min=1.63ms  med=91.17ms  max=1.63s    p(90)=206.69ms p(95)=241.79ms p(99.9)=764.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131926
     http_req_receiving.............: avg=1.91ms   min=53.62µs med=113.89µs max=1.02s    p(90)=2.1ms    p(95)=5.76ms   p(99.9)=98.49ms 
     http_req_sending...............: avg=60.42µs  min=4.95µs  med=10.45µs  max=262.64ms p(90)=19.81µs  p(95)=102.2µs  p(99.9)=7.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.95ms min=1.55ms  med=89.74ms  max=1.63s    p(90)=204.36ms p(95)=237.61ms p(99.9)=741.59ms
     http_reqs......................: 131926  2127.322194/s
     iteration_duration.............: avg=109.01ms min=2.22ms  med=92.29ms  max=1.63s    p(90)=207.36ms p(95)=242.53ms p(99.9)=765.1ms 
     iterations.....................: 130926  2111.197077/s
     success_rate...................: 100.00% ✓ 130926      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 382065      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=17.42µs  min=1.07µs  med=3.17µs   max=62.8ms   p(90)=5.18µs   p(95)=6.41µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=13.48µs  min=0s      med=0s       max=62.74ms  p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=110.91ms min=1.98ms  med=96.83ms  max=1.45s    p(90)=212.67ms p(95)=243.96ms p(99.9)=703.49ms
       { expected_response:true }...: avg=110.91ms min=1.98ms  med=96.83ms  max=1.45s    p(90)=212.67ms p(95)=243.96ms p(99.9)=703.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128355
     http_req_receiving.............: avg=1.3ms    min=51.87µs med=114.75µs max=621.78ms p(90)=1.57ms   p(95)=3.8ms    p(99.9)=69.1ms  
     http_req_sending...............: avg=66.57µs  min=5.1µs   med=12.14µs  max=188.71ms p(90)=23.51µs  p(95)=125.23µs p(99.9)=8.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.54ms min=1.89ms  med=95.57ms  max=1.45s    p(90)=210.84ms p(95)=241.01ms p(99.9)=694.35ms
     http_reqs......................: 128355  2056.56154/s
     iteration_duration.............: avg=112.05ms min=3.74ms  med=98.27ms  max=1.45s    p(90)=213.32ms p(95)=244.75ms p(99.9)=705.05ms
     iterations.....................: 127355  2040.539091/s
     success_rate...................: 100.00% ✓ 127355      ✗ 0     
     vus............................: 76      min=0         max=493 
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

     checks.........................: 100.00% ✓ 210477      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=5.31µs   min=972ns   med=2.35µs   max=5.92ms   p(90)=4.19µs   p(95)=5.2µs    p(99.9)=444.2µs 
     http_req_connecting............: avg=2.26µs   min=0s      med=0s       max=5.84ms   p(90)=0s       p(95)=0s       p(99.9)=376.75µs
     http_req_duration..............: avg=200.54ms min=1.97ms  med=201.59ms max=536.14ms p(90)=369.71ms p(95)=395.16ms p(99.9)=478.39ms
       { expected_response:true }...: avg=200.54ms min=1.97ms  med=201.59ms max=536.14ms p(90)=369.71ms p(95)=395.16ms p(99.9)=478.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71159
     http_req_receiving.............: avg=79.32µs  min=25.73µs med=64.15µs  max=147.04ms p(90)=106.14µs p(95)=121.9µs  p(99.9)=1.19ms  
     http_req_sending...............: avg=27.54µs  min=4.97µs  med=11.01µs  max=68.84ms  p(90)=18.34µs  p(95)=22.32µs  p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.43ms min=1.9ms   med=201.47ms max=536.05ms p(90)=369.62ms p(95)=395.05ms p(99.9)=478.29ms
     http_reqs......................: 71159   1136.282706/s
     iteration_duration.............: avg=203.64ms min=4.51ms  med=204.92ms max=536.29ms p(90)=370.54ms p(95)=395.93ms p(99.9)=478.87ms
     iterations.....................: 70159   1120.314484/s
     success_rate...................: 100.00% ✓ 70159       ✗ 0    
     vus............................: 87      min=0         max=498
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

     checks.........................: 100.00% ✓ 98724      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   629 kB/s
     http_req_blocked...............: avg=9.18µs   min=1.05µs  med=3.39µs   max=12.53ms  p(90)=5.19µs   p(95)=6.29µs   p(99.9)=1.39ms
     http_req_connecting............: avg=4.75µs   min=0s      med=0s       max=12.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.36ms
     http_req_duration..............: avg=423.4ms  min=3.94ms  med=390.27ms max=1.93s    p(90)=833.23ms p(95)=917.82ms p(99.9)=1.35s 
       { expected_response:true }...: avg=423.4ms  min=3.94ms  med=390.27ms max=1.93s    p(90)=833.23ms p(95)=917.82ms p(99.9)=1.35s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33908
     http_req_receiving.............: avg=94.84µs  min=31.84µs med=76.73µs  max=180.91ms p(90)=116.26µs p(95)=131.85µs p(99.9)=1.11ms
     http_req_sending...............: avg=41.09µs  min=5.55µs  med=14.87µs  max=182.41ms p(90)=22.13µs  p(95)=25.5µs   p(99.9)=2.3ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=423.27ms min=3.83ms  med=390.17ms max=1.93s    p(90)=833.13ms p(95)=917.68ms p(99.9)=1.35s 
     http_reqs......................: 33908   523.767473/s
     iteration_duration.............: avg=436.52ms min=8.14ms  med=404.27ms max=1.94s    p(90)=837.21ms p(95)=921.73ms p(99.9)=1.35s 
     iterations.....................: 32908   508.32075/s
     success_rate...................: 100.00% ✓ 32908      ✗ 0    
     vus............................: 90      min=0        max=500
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

     checks.........................: 100.00% ✓ 46716      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=14.1µs   min=1.14µs  med=3.34µs   max=11.54ms p(90)=5.21µs   p(95)=6.99µs  p(99.9)=2.2ms 
     http_req_connecting............: avg=8.85µs   min=0s      med=0s       max=11.47ms p(90)=0s       p(95)=0s      p(99.9)=2.15ms
     http_req_duration..............: avg=878.85ms min=5.66ms  med=789.86ms max=4.65s   p(90)=1.76s    p(95)=1.99s   p(99.9)=3.93s 
       { expected_response:true }...: avg=878.85ms min=5.66ms  med=789.86ms max=4.65s   p(90)=1.76s    p(95)=1.99s   p(99.9)=3.93s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16572
     http_req_receiving.............: avg=102.52µs min=33.04µs med=94.09µs  max=14.78ms p(90)=131.88µs p(95)=147µs   p(99.9)=1.51ms
     http_req_sending...............: avg=29.32µs  min=5.29µs  med=18.14µs  max=23.25ms p(90)=23.9µs   p(95)=28.95µs p(99.9)=2.52ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=878.72ms min=5.57ms  med=789.76ms max=4.65s   p(90)=1.76s    p(95)=1.99s   p(99.9)=3.93s 
     http_reqs......................: 16572   245.196432/s
     iteration_duration.............: avg=935.3ms  min=34.72ms med=860.86ms max=4.66s   p(90)=1.79s    p(95)=2.01s   p(99.9)=3.96s 
     iterations.....................: 15572   230.400606/s
     success_rate...................: 100.00% ✓ 15572      ✗ 0    
     vus............................: 81      min=0        max=500
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

     checks.........................: 100.00% ✓ 45822      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=14.63µs  min=1.53µs  med=3.74µs   max=5.07ms  p(90)=5.6µs    p(95)=7.52µs   p(99.9)=2.27ms 
     http_req_connecting............: avg=8.93µs   min=0s      med=0s       max=4.97ms  p(90)=0s       p(95)=0s       p(99.9)=2.19ms 
     http_req_duration..............: avg=892.28ms min=7.83ms  med=803.85ms max=3.18s   p(90)=1.82s    p(95)=1.92s    p(99.9)=2.68s  
       { expected_response:true }...: avg=892.28ms min=7.83ms  med=803.85ms max=3.18s   p(90)=1.82s    p(95)=1.92s    p(99.9)=2.68s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16274
     http_req_receiving.............: avg=101.08µs min=39.61µs med=93.42µs  max=5.53ms  p(90)=136.29µs p(95)=153.27µs p(99.9)=952.5µs
     http_req_sending...............: avg=37.92µs  min=6.45µs  med=18.7µs   max=76.64ms p(90)=25µs     p(95)=30.43µs  p(99.9)=3.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=892.14ms min=7.72ms  med=803.74ms max=3.18s   p(90)=1.82s    p(95)=1.92s    p(99.9)=2.68s  
     http_reqs......................: 16274   236.277087/s
     iteration_duration.............: avg=950.7ms  min=42.15ms med=866.37ms max=3.19s   p(90)=1.84s    p(95)=1.93s    p(99.9)=2.7s   
     iterations.....................: 15274   221.758402/s
     success_rate...................: 100.00% ✓ 15274      ✗ 0    
     vus............................: 6       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

