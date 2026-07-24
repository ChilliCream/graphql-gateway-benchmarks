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
| hive-router | v0.0.83 | 2,727 | 2,886 | 2,676 | 2.5% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,595 | 2,699 | 2,582 | 1.5% |  |
| fusion-nightly | 16.6.0-p.3 | 2,558 | 2,653 | 2,552 | 1.4% |  |
| fusion | 16.5.1 | 2,390 | 2,496 | 2,377 | 1.7% |  |
| cosmo | 0.331.1 | 1,241 | 1,278 | 1,233 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.4 | 580 | 590 | 577 | 0.8% |  |
| hive-gateway | 2.10.4 | 253 | 259 | 250 | 1.1% |  |
| apollo-gateway | 2.14.2 | 235 | 241 | 234 | 0.9% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (5728 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (527173 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,474 | 2,565 | 2,451 | 1.5% |  |
| hive-router | v0.0.83 | 2,377 | 2,525 | 2,356 | 2.4% |  |
| fusion | 16.5.1 | 2,356 | 2,448 | 2,342 | 1.6% |  |
| fusion-nightly | 16.6.0-p.3 | 2,353 | 2,413 | 2,295 | 1.7% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 2,204 | 2,291 | 2,198 | 1.4% |  |
| cosmo | 0.331.1 | 1,173 | 1,214 | 1,169 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 524 | 537 | 521 | 1.0% |  |
| hive-gateway | 2.10.4 | 244 | 249 | 242 | 0.8% |  |
| apollo-gateway | 2.14.2 | 232 | 237 | 231 | 0.8% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (30022 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (299086 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 501936      ✗ 0     
     data_received..................: 15 GB   239 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=22.23µs  min=1µs     med=2.63µs  max=77.6ms   p(90)=4.33µs   p(95)=5.52µs   p(99.9)=2.27ms  
     http_req_connecting............: avg=18.69µs  min=0s      med=0s      max=77.53ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=84.44ms  min=1.43ms  med=79.51ms max=312.23ms p(90)=160.87ms p(95)=176.48ms p(99.9)=253.81ms
       { expected_response:true }...: avg=84.44ms  min=1.43ms  med=79.51ms max=312.23ms p(90)=160.87ms p(95)=176.48ms p(99.9)=253.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168312
     http_req_receiving.............: avg=203.14µs min=27.09µs med=53.13µs max=117.02ms p(90)=154.75µs p(95)=359.89µs p(99.9)=29.87ms 
     http_req_sending...............: avg=76.12µs  min=4.76µs  med=9.86µs  max=284.45ms p(90)=19µs     p(95)=125.71µs p(99.9)=10.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.16ms  min=1.38ms  med=79.28ms max=293.47ms p(90)=160.53ms p(95)=176.03ms p(99.9)=245.53ms
     http_reqs......................: 168312  2727.069005/s
     iteration_duration.............: avg=85.21ms  min=1.99ms  med=80.33ms max=330.15ms p(90)=161.31ms p(95)=176.99ms p(99.9)=256.21ms
     iterations.....................: 167312  2710.866542/s
     success_rate...................: 100.00% ✓ 167312      ✗ 0     
     vus............................: 89      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 481800      ✗ 0     
     data_received..................: 14 GB   228 MB/s
     data_sent......................: 194 MB  3.1 MB/s
     http_req_blocked...............: avg=21.92µs  min=932ns   med=2.64µs   max=73.37ms  p(90)=4.27µs   p(95)=5.38µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=18.18µs  min=0s      med=0s       max=73.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=87.96ms  min=1.9ms   med=82.83ms  max=326.04ms p(90)=168.77ms p(95)=185.1ms  p(99.9)=245.76ms
       { expected_response:true }...: avg=87.96ms  min=1.9ms   med=82.83ms  max=326.04ms p(90)=168.77ms p(95)=185.1ms  p(99.9)=245.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161600
     http_req_receiving.............: avg=702.56µs min=50.58µs med=114.79µs max=251.99ms p(90)=1.47ms   p(95)=2.32ms   p(99.9)=26.96ms 
     http_req_sending...............: avg=75.82µs  min=4.64µs  med=9.78µs   max=257.58ms p(90)=19.64µs  p(95)=121.77µs p(99.9)=9.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.18ms  min=1.81ms  med=82ms     max=325.76ms p(90)=167.93ms p(95)=184.33ms p(99.9)=244.94ms
     http_reqs......................: 161600  2595.91528/s
     iteration_duration.............: avg=88.76ms  min=4.22ms  med=83.7ms   max=336.1ms  p(90)=169.23ms p(95)=185.56ms p(99.9)=246.98ms
     iterations.....................: 160600  2579.851448/s
     success_rate...................: 100.00% ✓ 160600      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 475533      ✗ 0     
     data_received..................: 14 GB   224 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=23.67µs min=1µs     med=2.55µs  max=110.31ms p(90)=4.14µs   p(95)=5.27µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=20.25µs min=0s      med=0s      max=110.1ms  p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=89.07ms min=2ms     med=74.35ms max=1.55s    p(90)=167.71ms p(95)=201.68ms p(99.9)=981.54ms
       { expected_response:true }...: avg=89.07ms min=2ms     med=74.35ms max=1.55s    p(90)=167.71ms p(95)=201.68ms p(99.9)=981.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159511
     http_req_receiving.............: avg=1.83ms  min=53.65µs med=99.12µs max=909.47ms p(90)=1.42ms   p(95)=4.05ms   p(99.9)=347.74ms
     http_req_sending...............: avg=79.82µs min=4.9µs   med=9.65µs  max=231.23ms p(90)=18.7µs   p(95)=118.22µs p(99.9)=11.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.15ms min=1.92ms  med=73.38ms max=1.55s    p(90)=165.76ms p(95)=197.47ms p(99.9)=926.43ms
     http_reqs......................: 159511  2558.462362/s
     iteration_duration.............: avg=90ms    min=3.41ms  med=75.28ms max=1.55s    p(90)=168.48ms p(95)=203.71ms p(99.9)=982.41ms
     iterations.....................: 158511  2542.422952/s
     success_rate...................: 100.00% ✓ 158511      ✗ 0     
     vus............................: 72      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 444159      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=11.04µs min=862ns  med=2.02µs  max=48.36ms  p(90)=3.31µs   p(95)=4.24µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=8.46µs  min=0s     med=0s      max=48.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=95.45ms min=2ms    med=84.49ms max=1.18s    p(90)=178.61ms p(95)=206.79ms p(99.9)=695.51ms
       { expected_response:true }...: avg=95.45ms min=2ms    med=84.49ms max=1.18s    p(90)=178.61ms p(95)=206.79ms p(99.9)=695.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149053
     http_req_receiving.............: avg=1.62ms  min=52.5µs med=98.91µs max=683.21ms p(90)=1.88ms   p(95)=4.96ms   p(99.9)=102.86ms
     http_req_sending...............: avg=57.69µs min=4.76µs med=8.75µs  max=201.87ms p(90)=16.04µs  p(95)=95.92µs  p(99.9)=7.48ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.77ms min=1.89ms med=83.28ms max=1.15s    p(90)=176.15ms p(95)=202.62ms p(99.9)=675.73ms
     http_reqs......................: 149053  2390.093144/s
     iteration_duration.............: avg=96.34ms min=3.49ms med=85.53ms max=1.18s    p(90)=179.15ms p(95)=207.41ms p(99.9)=695.84ms
     iterations.....................: 148053  2374.057954/s
     success_rate...................: 100.00% ✓ 148053      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 229740      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=6.05µs   min=1.07µs  med=2.72µs   max=12.19ms  p(90)=4.4µs    p(95)=5.36µs   p(99.9)=692.69µs
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=12.12ms  p(90)=0s       p(95)=0s       p(99.9)=574.42µs
     http_req_duration..............: avg=183.89ms min=1.87ms  med=185.61ms max=474.95ms p(90)=340.84ms p(95)=363.76ms p(99.9)=424.82ms
       { expected_response:true }...: avg=183.89ms min=1.87ms  med=185.61ms max=474.95ms p(90)=340.84ms p(95)=363.76ms p(99.9)=424.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77580
     http_req_receiving.............: avg=77.62µs  min=29.22µs med=63.45µs  max=26.11ms  p(90)=101.5µs  p(95)=116.84µs p(99.9)=1.26ms  
     http_req_sending...............: avg=31.91µs  min=5.14µs  med=11.63µs  max=105.21ms p(90)=18.53µs  p(95)=22.75µs  p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.78ms min=1.82ms  med=185.5ms  max=474.84ms p(90)=340.73ms p(95)=363.67ms p(99.9)=424.53ms
     http_reqs......................: 77580   1241.168055/s
     iteration_duration.............: avg=186.53ms min=3.88ms  med=188.46ms max=475.17ms p(90)=341.5ms  p(95)=364.38ms p(99.9)=425.56ms
     iterations.....................: 76580   1225.169498/s
     success_rate...................: 100.00% ✓ 76580       ✗ 0    
     vus............................: 81      min=0         max=492
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 108810     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   697 kB/s
     http_req_blocked...............: avg=8.49µs   min=1.17µs  med=3.28µs   max=7.34ms   p(90)=5.11µs   p(95)=6.2µs    p(99.9)=1.3ms   
     http_req_connecting............: avg=4.22µs   min=0s      med=0s       max=7.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=384.58ms min=3.5ms   med=358.41ms max=1.58s    p(90)=755.64ms p(95)=821.7ms  p(99.9)=1.24s   
       { expected_response:true }...: avg=384.58ms min=3.5ms   med=358.41ms max=1.58s    p(90)=755.64ms p(95)=821.7ms  p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 37270
     http_req_receiving.............: avg=82.18µs  min=32.56µs med=73.15µs  max=13.32ms  p(90)=111.99µs p(95)=126.89µs p(99.9)=833.26µs
     http_req_sending...............: avg=29.76µs  min=5.49µs  med=14.16µs  max=110.96ms p(90)=21.88µs  p(95)=25.05µs  p(99.9)=2.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=384.47ms min=3.41ms  med=358.32ms max=1.58s    p(90)=755.55ms p(95)=821.58ms p(99.9)=1.24s   
     http_reqs......................: 37270   580.259878/s
     iteration_duration.............: avg=395.4ms  min=19.77ms med=370.41ms max=1.58s    p(90)=759.23ms p(95)=824.24ms p(99.9)=1.24s   
     iterations.....................: 36270   564.690791/s
     success_rate...................: 100.00% ✓ 36270      ✗ 0    
     vus............................: 68      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48222      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   304 kB/s
     http_req_blocked...............: avg=16.09µs  min=1.15µs  med=3.55µs   max=9.24ms  p(90)=5.42µs   p(95)=6.91µs   p(99.9)=3.54ms
     http_req_connecting............: avg=10.15µs  min=0s      med=0s       max=5.4ms   p(90)=0s       p(95)=0s       p(99.9)=3.36ms
     http_req_duration..............: avg=841.93ms min=5.78ms  med=725.21ms max=18.01s  p(90)=1.48s    p(95)=1.71s    p(99.9)=14.27s
       { expected_response:true }...: avg=841.93ms min=5.78ms  med=725.21ms max=18.01s  p(90)=1.48s    p(95)=1.71s    p(99.9)=14.27s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17074
     http_req_receiving.............: avg=98.29µs  min=34.18µs med=91.12µs  max=7.87ms  p(90)=127.87µs p(95)=144.97µs p(99.9)=1.02ms
     http_req_sending...............: avg=34.45µs  min=5.5µs   med=17.22µs  max=27.66ms p(90)=23.04µs  p(95)=27.65µs  p(99.9)=3.52ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=841.8ms  min=5.71ms  med=725.09ms max=18.01s  p(90)=1.48s    p(95)=1.71s    p(99.9)=14.27s
     http_reqs......................: 17074   253.11853/s
     iteration_duration.............: avg=894.32ms min=61.09ms med=776.43ms max=18.01s  p(90)=1.52s    p(95)=1.72s    p(99.9)=14.28s
     iterations.....................: 16074   238.293736/s
     success_rate...................: 100.00% ✓ 16074      ✗ 0    
     vus............................: 76      min=0        max=499
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

     checks.........................: 100.00% ✓ 48480      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   288 kB/s
     http_req_blocked...............: avg=20.31µs  min=1.07µs  med=3.07µs   max=8.43ms  p(90)=4.68µs   p(95)=6.12µs   p(99.9)=5.03ms
     http_req_connecting............: avg=14.81µs  min=0s      med=0s       max=8.09ms  p(90)=0s       p(95)=0s       p(99.9)=4.8ms 
     http_req_duration..............: avg=379.58ms min=7.42ms  med=417.36ms max=1.1s    p(90)=656.81ms p(95)=717.95ms p(99.9)=1.01s 
       { expected_response:true }...: avg=379.58ms min=7.42ms  med=417.36ms max=1.1s    p(90)=656.81ms p(95)=717.95ms p(99.9)=1.01s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17160
     http_req_receiving.............: avg=90.61µs  min=33.51µs med=84.09µs  max=6.05ms  p(90)=121.6µs  p(95)=135.84µs p(99.9)=1.04ms
     http_req_sending...............: avg=34.24µs  min=5.54µs  med=16.37µs  max=41.12ms p(90)=21.56µs  p(95)=25.82µs  p(99.9)=3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=379.45ms min=7.29ms  med=417.26ms max=1.1s    p(90)=656.7ms  p(95)=717.86ms p(99.9)=1.01s 
     http_reqs......................: 17160   235.065857/s
     iteration_duration.............: avg=403.07ms min=11.9ms  med=437.83ms max=1.11s   p(90)=662.67ms p(95)=722.47ms p(99.9)=1.02s 
     iterations.....................: 16160   221.367381/s
     success_rate...................: 100.00% ✓ 16160      ✗ 0    
     vus............................: 51      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 455874      ✗ 0     
     data_received..................: 13 GB   217 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=20.2µs   min=871ns   med=2.58µs   max=89.93ms  p(90)=4.42µs   p(95)=5.59µs   p(99.9)=1.93ms  
     http_req_connecting............: avg=16.83µs  min=0s      med=0s       max=89.71ms  p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=92.95ms  min=1.41ms  med=87.82ms  max=406.32ms p(90)=177.53ms p(95)=195.46ms p(99.9)=260.53ms
       { expected_response:true }...: avg=92.95ms  min=1.41ms  med=87.82ms  max=406.32ms p(90)=177.53ms p(95)=195.46ms p(99.9)=260.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152958
     http_req_receiving.............: avg=773.32µs min=52.27µs med=116.86µs max=126.74ms p(90)=1.63ms   p(95)=2.65ms   p(99.9)=26.77ms 
     http_req_sending...............: avg=66.33µs  min=4.79µs  med=9.97µs   max=52.35ms  p(90)=21.45µs  p(95)=121.47µs p(99.9)=9.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.11ms  min=1.31ms  med=87ms     max=406.07ms p(90)=176.67ms p(95)=194.54ms p(99.9)=259.4ms 
     http_reqs......................: 152958  2474.680017/s
     iteration_duration.............: avg=93.83ms  min=3.78ms  med=88.79ms  max=406.71ms p(90)=178.03ms p(95)=195.98ms p(99.9)=261.64ms
     iterations.....................: 151958  2458.501197/s
     success_rate...................: 100.00% ✓ 151958      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438405      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=15.46µs  min=932ns   med=2.52µs  max=56.28ms  p(90)=4.45µs   p(95)=5.73µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=12.24µs  min=0s      med=0s      max=56.02ms  p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=96.65ms  min=1.53ms  med=91.66ms max=343ms    p(90)=185.93ms p(95)=201.7ms  p(99.9)=256.57ms
       { expected_response:true }...: avg=96.65ms  min=1.53ms  med=91.66ms max=343ms    p(90)=185.93ms p(95)=201.7ms  p(99.9)=256.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147135
     http_req_receiving.............: avg=129.46µs min=25.17µs med=55.19µs max=40.18ms  p(90)=133.68µs p(95)=345.93µs p(99.9)=12.09ms 
     http_req_sending...............: avg=67.37µs  min=4.74µs  med=10.7µs  max=120.47ms p(90)=21.8µs   p(95)=121.02µs p(99.9)=8.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.45ms  min=1.48ms  med=91.49ms max=342.49ms p(90)=185.67ms p(95)=201.42ms p(99.9)=255.87ms
     http_reqs......................: 147135  2377.68027/s
     iteration_duration.............: avg=97.58ms  min=3.08ms  med=92.68ms max=363.14ms p(90)=186.46ms p(95)=202.13ms p(99.9)=257.99ms
     iterations.....................: 146135  2361.520415/s
     success_rate...................: 100.00% ✓ 146135      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 434589      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=23.3µs  min=982ns   med=2.69µs   max=109.83ms p(90)=4.5µs    p(95)=5.68µs   p(99.9)=2.2ms   
     http_req_connecting............: avg=19.79µs min=0s      med=0s       max=109.76ms p(90)=0s       p(95)=0s       p(99.9)=2.15ms  
     http_req_duration..............: avg=97.53ms min=1.53ms  med=84.95ms  max=1.21s    p(90)=187.83ms p(95)=220.65ms p(99.9)=656.28ms
       { expected_response:true }...: avg=97.53ms min=1.53ms  med=84.95ms  max=1.21s    p(90)=187.83ms p(95)=220.65ms p(99.9)=656.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145863
     http_req_receiving.............: avg=1.94ms  min=53.78µs med=106.67µs max=548.32ms p(90)=1.69ms   p(95)=4.86ms   p(99.9)=195.22ms
     http_req_sending...............: avg=71.84µs min=5.06µs  med=10.34µs  max=125.93ms p(90)=19.98µs  p(95)=118.33µs p(99.9)=9.82ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.52ms min=1.45ms  med=83.74ms  max=1.21s    p(90)=185.12ms p(95)=216.47ms p(99.9)=617.29ms
     http_reqs......................: 145863  2356.706407/s
     iteration_duration.............: avg=98.51ms min=2.82ms  med=85.94ms  max=1.21s    p(90)=188.43ms p(95)=221.44ms p(99.9)=658.35ms
     iterations.....................: 144863  2340.549422/s
     success_rate...................: 100.00% ✓ 144863      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433779      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=15.94µs min=861ns   med=2.24µs  max=55.76ms  p(90)=3.86µs   p(95)=4.98µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=12.91µs min=0s      med=0s      max=55.67ms  p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=97.76ms min=1.47ms  med=85.86ms max=1.41s    p(90)=183.69ms p(95)=211.46ms p(99.9)=757.92ms
       { expected_response:true }...: avg=97.76ms min=1.47ms  med=85.86ms max=1.41s    p(90)=183.69ms p(95)=211.46ms p(99.9)=757.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145593
     http_req_receiving.............: avg=1.41ms  min=52.02µs med=106.4µs max=605.93ms p(90)=1.7ms    p(95)=4.28ms   p(99.9)=75.84ms 
     http_req_sending...............: avg=62.98µs min=4.81µs  med=9.48µs  max=190.64ms p(90)=19.44µs  p(95)=105.2µs  p(99.9)=8.25ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.28ms min=1.41ms  med=84.44ms max=1.36s    p(90)=181.87ms p(95)=208.7ms  p(99.9)=740.1ms 
     http_reqs......................: 145593  2353.534758/s
     iteration_duration.............: avg=98.7ms  min=3.04ms  med=86.98ms max=1.41s    p(90)=184.34ms p(95)=212.09ms p(99.9)=762.7ms 
     iterations.....................: 144593  2337.369594/s
     success_rate...................: 100.00% ✓ 144593      ✗ 0     
     vus............................: 7       min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 409104      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.6 MB/s
     http_req_blocked...............: avg=16.76µs  min=861ns   med=2.51µs   max=67.51ms  p(90)=4.52µs   p(95)=5.69µs   p(99.9)=1.97ms  
     http_req_connecting............: avg=13.43µs  min=0s      med=0s       max=67.45ms  p(90)=0s       p(95)=0s       p(99.9)=1.93ms  
     http_req_duration..............: avg=103.59ms min=1.76ms  med=92.8ms   max=1.15s    p(90)=196.01ms p(95)=222.6ms  p(99.9)=586.98ms
       { expected_response:true }...: avg=103.59ms min=1.76ms  med=92.8ms   max=1.15s    p(90)=196.01ms p(95)=222.6ms  p(99.9)=586.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137368
     http_req_receiving.............: avg=1.3ms    min=51.91µs med=108.08µs max=460.61ms p(90)=1.64ms   p(95)=3.92ms   p(99.9)=79.25ms 
     http_req_sending...............: avg=62.73µs  min=4.66µs  med=10.04µs  max=76.11ms  p(90)=22.38µs  p(95)=112.11µs p(99.9)=8.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.22ms min=1.68ms  med=91.67ms  max=1.15s    p(90)=194.21ms p(95)=219.71ms p(99.9)=585.03ms
     http_reqs......................: 137368  2204.176951/s
     iteration_duration.............: avg=104.63ms min=3.53ms  med=93.94ms  max=1.15s    p(90)=196.64ms p(95)=223.31ms p(99.9)=587.87ms
     iterations.....................: 136368  2188.13117/s
     success_rate...................: 100.00% ✓ 136368      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 217341      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.44µs   min=1µs     med=2.96µs   max=4.82ms   p(90)=4.86µs   p(95)=5.86µs   p(99.9)=447.51µs
     http_req_connecting............: avg=1.78µs   min=0s      med=0s       max=4.76ms   p(90)=0s       p(95)=0s       p(99.9)=382.6µs 
     http_req_duration..............: avg=194.29ms min=1.89ms  med=195.12ms max=512.5ms  p(90)=358.65ms p(95)=384.51ms p(99.9)=462.84ms
       { expected_response:true }...: avg=194.29ms min=1.89ms  med=195.12ms max=512.5ms  p(90)=358.65ms p(95)=384.51ms p(99.9)=462.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73447
     http_req_receiving.............: avg=89.84µs  min=28.32µs med=69.69µs  max=215.24ms p(90)=111.03µs p(95)=127.27µs p(99.9)=1.54ms  
     http_req_sending...............: avg=36.9µs   min=4.6µs   med=12.64µs  max=196.47ms p(90)=20.58µs  p(95)=24.57µs  p(99.9)=3.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.16ms min=1.81ms  med=194.95ms max=512.43ms p(90)=358.51ms p(95)=384.39ms p(99.9)=462.72ms
     http_reqs......................: 73447   1173.743048/s
     iteration_duration.............: avg=197.23ms min=4.59ms  med=198.32ms max=512.63ms p(90)=359.55ms p(95)=385.22ms p(99.9)=463.33ms
     iterations.....................: 72447   1157.762232/s
     success_rate...................: 100.00% ✓ 72447       ✗ 0    
     vus............................: 84      min=0         max=495
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98742      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   629 kB/s
     http_req_blocked...............: avg=9.31µs   min=1.21µs  med=3.17µs   max=15.47ms  p(90)=4.9µs    p(95)=5.95µs   p(99.9)=1.68ms
     http_req_connecting............: avg=5.13µs   min=0s      med=0s       max=15.39ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms
     http_req_duration..............: avg=422.9ms  min=3.82ms  med=389.18ms max=1.87s    p(90)=834.23ms p(95)=917.34ms p(99.9)=1.39s 
       { expected_response:true }...: avg=422.9ms  min=3.82ms  med=389.18ms max=1.87s    p(90)=834.23ms p(95)=917.34ms p(99.9)=1.39s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33914
     http_req_receiving.............: avg=86.11µs  min=30.74µs med=75.06µs  max=12.02ms  p(90)=114.65µs p(95)=128.54µs p(99.9)=1.19ms
     http_req_sending...............: avg=33.11µs  min=5.48µs  med=14.75µs  max=183.37ms p(90)=22.28µs  p(95)=25.52µs  p(99.9)=2.39ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=422.79ms min=3.74ms  med=389.09ms max=1.87s    p(90)=834.11ms p(95)=917.26ms p(99.9)=1.39s 
     http_reqs......................: 33914   524.308897/s
     iteration_duration.............: avg=435.99ms min=25.02ms med=405.91ms max=1.87s    p(90)=838.18ms p(95)=920.76ms p(99.9)=1.39s 
     iterations.....................: 32914   508.848942/s
     success_rate...................: 100.00% ✓ 32914      ✗ 0    
     vus............................: 87      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46680      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   293 kB/s
     http_req_blocked...............: avg=13.25µs  min=1µs     med=3.34µs   max=3.9ms   p(90)=5.15µs   p(95)=7.03µs   p(99.9)=2.07ms
     http_req_connecting............: avg=8.26µs   min=0s      med=0s       max=3.83ms  p(90)=0s       p(95)=0s       p(99.9)=2.06ms
     http_req_duration..............: avg=878.28ms min=6.08ms  med=797.4ms  max=4.49s   p(90)=1.75s    p(95)=1.95s    p(99.9)=4.01s 
       { expected_response:true }...: avg=878.28ms min=6.08ms  med=797.4ms  max=4.49s   p(90)=1.75s    p(95)=1.95s    p(99.9)=4.01s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16560
     http_req_receiving.............: avg=97.99µs  min=31.02µs med=92.58µs  max=6.05ms  p(90)=130.35µs p(95)=145.61µs p(99.9)=1ms   
     http_req_sending...............: avg=29.95µs  min=5.52µs  med=17.62µs  max=50.12ms p(90)=23.01µs  p(95)=27.61µs  p(99.9)=2.51ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=878.16ms min=5.99ms  med=797.29ms max=4.49s   p(90)=1.75s    p(95)=1.95s    p(99.9)=4.01s 
     http_reqs......................: 16560   244.060584/s
     iteration_duration.............: avg=934.72ms min=20.77ms med=876.78ms max=4.5s    p(90)=1.77s    p(95)=1.98s    p(99.9)=4.04s 
     iterations.....................: 15560   229.322626/s
     success_rate...................: 100.00% ✓ 15560      ✗ 0    
     vus............................: 98      min=0        max=500
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

     checks.........................: 100.00% ✓ 45012      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=14.85µs  min=1.14µs  med=3.06µs   max=12.57ms  p(90)=4.78µs   p(95)=6.68µs   p(99.9)=2.29ms  
     http_req_connecting............: avg=10µs     min=0s      med=0s       max=12.5ms   p(90)=0s       p(95)=0s       p(99.9)=2.27ms  
     http_req_duration..............: avg=907.73ms min=7.93ms  med=829.84ms max=3.15s    p(90)=1.85s    p(95)=1.96s    p(99.9)=2.89s   
       { expected_response:true }...: avg=907.73ms min=7.93ms  med=829.84ms max=3.15s    p(90)=1.85s    p(95)=1.96s    p(99.9)=2.89s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16004
     http_req_receiving.............: avg=97.09µs  min=31.5µs  med=86.6µs   max=32.25ms  p(90)=127.54µs p(95)=144.12µs p(99.9)=954.34µs
     http_req_sending...............: avg=43.54µs  min=5.72µs  med=16.33µs  max=106.58ms p(90)=22.28µs  p(95)=27.29µs  p(99.9)=3.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=907.59ms min=7.85ms  med=829.71ms max=3.15s    p(90)=1.85s    p(95)=1.96s    p(99.9)=2.89s   
     http_reqs......................: 16004   232.382588/s
     iteration_duration.............: avg=968.16ms min=35.68ms med=920.56ms max=3.16s    p(90)=1.86s    p(95)=1.97s    p(99.9)=2.91s   
     iterations.....................: 15004   217.862306/s
     success_rate...................: 100.00% ✓ 15004      ✗ 0    
     vus............................: 7       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

