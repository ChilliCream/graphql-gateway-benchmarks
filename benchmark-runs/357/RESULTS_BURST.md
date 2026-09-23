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
| hive-router | v0.0.84 | 2,909 | 3,049 | 2,896 | 2.0% |  |
| fusion | 16.6.6 | 2,564 | 2,668 | 2,558 | 1.4% |  |
| fusion-nightly-net11 | 16.7.0-p.9 | 2,538 | 2,647 | 2,526 | 1.6% |  |
| fusion-nightly | 16.7.0-p.9 | 2,516 | 2,630 | 2,504 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.9 | 2,311 | 2,404 | 2,292 | 1.6% |  |
| cosmo | 0.334.0 | 1,193 | 1,233 | 1,180 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 580 | 592 | 578 | 0.9% |  |
| hive-gateway | 2.10.8 | 262 | 269 | 259 | 1.1% |  |
| apollo-gateway | 2.14.3 | 237 | 242 | 235 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (12774 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (551217 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.7.0-p.9 | 2,415 | 2,498 | 2,403 | 1.4% |  |
| fusion | 16.6.6 | 2,362 | 2,444 | 2,331 | 1.5% |  |
| fusion-nightly-net11 | 16.7.0-p.9 | 2,353 | 2,536 | 2,342 | 3.3% |  |
| hive-router | v0.0.84 | 2,236 | 2,372 | 2,210 | 2.4% |  |
| fusion-nightly-fed | 16.7.0-p.9 | 2,210 | 2,261 | 2,176 | 1.1% |  |
| cosmo | 0.334.0 | 1,155 | 1,196 | 1,151 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 527 | 543 | 523 | 1.3% |  |
| hive-gateway | 2.10.8 | 245 | 250 | 243 | 0.8% |  |
| apollo-gateway | 2.14.3 | 233 | 237 | 231 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (40507 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (382323 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 535605      ✗ 0     
     data_received..................: 16 GB   255 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=25.26µs  min=952ns   med=2.67µs  max=55.92ms  p(90)=4.4µs    p(95)=5.63µs   p(99.9)=2.49ms  
     http_req_connecting............: avg=21.38µs  min=0s      med=0s      max=55.68ms  p(90)=0s       p(95)=0s       p(99.9)=2.38ms  
     http_req_duration..............: avg=79.13ms  min=1.41ms  med=74.12ms max=329.47ms p(90)=152.98ms p(95)=168.28ms p(99.9)=220.99ms
       { expected_response:true }...: avg=79.13ms  min=1.41ms  med=74.12ms max=329.47ms p(90)=152.98ms p(95)=168.28ms p(99.9)=220.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179535
     http_req_receiving.............: avg=175.78µs min=25.68µs med=51.78µs max=193.66ms p(90)=170.54µs p(95)=364.82µs p(99.9)=23.8ms  
     http_req_sending...............: avg=81.43µs  min=4.46µs  med=9.92µs  max=133.4ms  p(90)=19.68µs  p(95)=129.65µs p(99.9)=12.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.87ms  min=1.36ms  med=73.89ms max=279.61ms p(90)=152.63ms p(95)=167.77ms p(99.9)=219.33ms
     http_reqs......................: 179535  2909.163756/s
     iteration_duration.............: avg=79.84ms  min=2.07ms  med=74.9ms  max=340.13ms p(90)=153.47ms p(95)=168.82ms p(99.9)=222.31ms
     iterations.....................: 178535  2892.959875/s
     success_rate...................: 100.00% ✓ 178535      ✗ 0     
     vus............................: 88      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 476439      ✗ 0     
     data_received..................: 14 GB   225 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=18.21µs min=842ns   med=2.16µs  max=91.59ms  p(90)=3.67µs   p(95)=4.74µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=15.37µs min=0s      med=0s      max=91.51ms  p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=89.01ms min=1.91ms  med=78.67ms max=1.65s    p(90)=170.24ms p(95)=196.03ms p(99.9)=720.4ms 
       { expected_response:true }...: avg=89.01ms min=1.91ms  med=78.67ms max=1.65s    p(90)=170.24ms p(95)=196.03ms p(99.9)=720.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159813
     http_req_receiving.............: avg=1.43ms  min=50.46µs med=94.78µs max=673.65ms p(90)=1.4ms    p(95)=3.91ms   p(99.9)=150.68ms
     http_req_sending...............: avg=67.1µs  min=4.53µs  med=8.98µs  max=161.67ms p(90)=17.3µs   p(95)=105.51µs p(99.9)=8.92ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.5ms  min=1.83ms  med=77.57ms max=1.65s    p(90)=168.34ms p(95)=193.3ms  p(99.9)=715.05ms
     http_reqs......................: 159813  2564.061106/s
     iteration_duration.............: avg=89.82ms min=3.08ms  med=79.55ms max=1.65s    p(90)=170.87ms p(95)=196.68ms p(99.9)=722.21ms
     iterations.....................: 158813  2548.016973/s
     success_rate...................: 100.00% ✓ 158813      ✗ 0     
     vus............................: 71      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 470187      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=19.22µs min=832ns   med=2.17µs  max=80.48ms  p(90)=3.77µs   p(95)=4.93µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=16.21µs min=0s      med=0s      max=80.27ms  p(90)=0s       p(95)=0s       p(99.9)=2.1ms   
     http_req_duration..............: avg=90.15ms min=1.87ms  med=85.24ms max=360.25ms p(90)=172.57ms p(95)=189.51ms p(99.9)=264.28ms
       { expected_response:true }...: avg=90.15ms min=1.87ms  med=85.24ms max=360.25ms p(90)=172.57ms p(95)=189.51ms p(99.9)=264.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157729
     http_req_receiving.............: avg=1.41ms  min=51.71µs med=187.2µs max=142.43ms p(90)=3.41ms   p(95)=5.15ms   p(99.9)=35.5ms  
     http_req_sending...............: avg=67.72µs min=4.27µs  med=8.96µs  max=270.73ms p(90)=19.27µs  p(95)=106.87µs p(99.9)=8.5ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.67ms min=1.79ms  med=83.62ms max=360.11ms p(90)=170.91ms p(95)=188.03ms p(99.9)=262.24ms
     http_reqs......................: 157729  2538.381233/s
     iteration_duration.............: avg=90.98ms min=4.25ms  med=86.16ms max=360.44ms p(90)=173.06ms p(95)=190.01ms p(99.9)=264.7ms 
     iterations.....................: 156729  2522.287926/s
     success_rate...................: 100.00% ✓ 156729      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 467661      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=18.56µs min=822ns   med=2.13µs  max=54.69ms  p(90)=3.59µs   p(95)=4.74µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=15.69µs min=0s      med=0s      max=54.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=90.67ms min=1.94ms  med=80.98ms max=1.45s    p(90)=168.87ms p(95)=193.28ms p(99.9)=1.02s   
       { expected_response:true }...: avg=90.67ms min=1.94ms  med=80.98ms max=1.45s    p(90)=168.87ms p(95)=193.28ms p(99.9)=1.02s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 156887
     http_req_receiving.............: avg=1.13ms  min=53.03µs med=95.49µs max=1.02s    p(90)=1.39ms   p(95)=3.66ms   p(99.9)=76.83ms 
     http_req_sending...............: avg=66.07µs min=4.81µs  med=8.97µs  max=235.77ms p(90)=16.99µs  p(95)=105.12µs p(99.9)=9.31ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.46ms min=1.85ms  med=79.76ms max=1.42s    p(90)=167.06ms p(95)=191.62ms p(99.9)=997.39ms
     http_reqs......................: 156887  2516.722413/s
     iteration_duration.............: avg=91.49ms min=3.3ms   med=81.95ms max=1.45s    p(90)=169.45ms p(95)=193.82ms p(99.9)=1.02s   
     iterations.....................: 155887  2500.680788/s
     success_rate...................: 100.00% ✓ 155887      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427053      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=16.74µs  min=1.03µs  med=2.65µs   max=75.27ms  p(90)=4.19µs   p(95)=5.23µs   p(99.9)=1ms     
     http_req_connecting............: avg=13.43µs  min=0s      med=0s       max=75ms     p(90)=0s       p(95)=0s       p(99.9)=926.62µs
     http_req_duration..............: avg=99.25ms  min=1.64ms  med=85.06ms  max=1.58s    p(90)=189.1ms  p(95)=226.53ms p(99.9)=675.95ms
       { expected_response:true }...: avg=99.25ms  min=1.64ms  med=85.06ms  max=1.58s    p(90)=189.1ms  p(95)=226.53ms p(99.9)=675.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143351
     http_req_receiving.............: avg=1.55ms   min=54.17µs med=106.11µs max=513.33ms p(90)=1.72ms   p(95)=4.72ms   p(99.9)=93.74ms 
     http_req_sending...............: avg=67.55µs  min=4.45µs  med=9.79µs   max=116.29ms p(90)=17.62µs  p(95)=113.84µs p(99.9)=9.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.62ms  min=1.56ms  med=83.98ms  max=1.57s    p(90)=187.06ms p(95)=222.48ms p(99.9)=664.01ms
     http_reqs......................: 143351  2311.582851/s
     iteration_duration.............: avg=100.21ms min=2.8ms   med=86.08ms  max=1.58s    p(90)=189.75ms p(95)=227.58ms p(99.9)=676.25ms
     iterations.....................: 142351  2295.457516/s
     success_rate...................: 100.00% ✓ 142351      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 220671      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.77µs   min=1.04µs  med=2.64µs   max=7.88ms   p(90)=4.21µs   p(95)=5.09µs   p(99.9)=533.54µs
     http_req_connecting............: avg=2.52µs   min=0s      med=0s       max=7.81ms   p(90)=0s       p(95)=0s       p(99.9)=469.38µs
     http_req_duration..............: avg=191.36ms min=1.9ms   med=192.24ms max=588.15ms p(90)=353.88ms p(95)=380.65ms p(99.9)=494.64ms
       { expected_response:true }...: avg=191.36ms min=1.9ms   med=192.24ms max=588.15ms p(90)=353.88ms p(95)=380.65ms p(99.9)=494.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74557
     http_req_receiving.............: avg=76.05µs  min=28.48µs med=60.87µs  max=126.93ms p(90)=98.92µs  p(95)=114.69µs p(99.9)=1.09ms  
     http_req_sending...............: avg=28.59µs  min=4.59µs  med=10.79µs  max=53.11ms  p(90)=17.14µs  p(95)=20.97µs  p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.25ms min=1.83ms  med=192.14ms max=588.08ms p(90)=353.78ms p(95)=380.57ms p(99.9)=494.56ms
     http_reqs......................: 74557   1193.077314/s
     iteration_duration.............: avg=194.19ms min=3.86ms  med=195.41ms max=588.29ms p(90)=354.78ms p(95)=381.3ms  p(99.9)=495.35ms
     iterations.....................: 73557   1177.075096/s
     success_rate...................: 100.00% ✓ 73557       ✗ 0    
     vus............................: 80      min=0         max=494
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

     checks.........................: 100.00% ✓ 108768     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   696 kB/s
     http_req_blocked...............: avg=8.82µs   min=1.19µs  med=3.24µs   max=12.81ms  p(90)=5.05µs   p(95)=6.19µs   p(99.9)=1.43ms
     http_req_connecting............: avg=4.59µs   min=0s      med=0s       max=12.74ms  p(90)=0s       p(95)=0s       p(99.9)=1.4ms 
     http_req_duration..............: avg=385.02ms min=3.47ms  med=358.71ms max=1.55s    p(90)=755.54ms p(95)=821.27ms p(99.9)=1.17s 
       { expected_response:true }...: avg=385.02ms min=3.47ms  med=358.71ms max=1.55s    p(90)=755.54ms p(95)=821.27ms p(99.9)=1.17s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 37256
     http_req_receiving.............: avg=84.86µs  min=30.84µs med=70.43µs  max=105.12ms p(90)=109.37µs p(95)=124.76µs p(99.9)=1ms   
     http_req_sending...............: avg=29.38µs  min=5.8µs   med=14.09µs  max=64.39ms  p(90)=21.9µs   p(95)=25.06µs  p(99.9)=3.26ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=384.91ms min=3.41ms  med=358.61ms max=1.55s    p(90)=755.45ms p(95)=821.18ms p(99.9)=1.17s 
     http_reqs......................: 37256   580.050747/s
     iteration_duration.............: avg=395.89ms min=20.69ms med=371.68ms max=1.55s    p(90)=758.81ms p(95)=824.23ms p(99.9)=1.18s 
     iterations.....................: 36256   564.481422/s
     success_rate...................: 100.00% ✓ 36256      ✗ 0    
     vus............................: 68      min=0        max=496
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

     checks.........................: 100.00% ✓ 50088      ✗ 0    
     data_received..................: 1.6 GB  23 MB/s
     data_sent......................: 21 MB   316 kB/s
     http_req_blocked...............: avg=12.77µs  min=1.18µs  med=3.38µs   max=3.98ms p(90)=5.16µs   p(95)=6.49µs   p(99.9)=1.95ms
     http_req_connecting............: avg=7.88µs   min=0s      med=0s       max=3.94ms p(90)=0s       p(95)=0s       p(99.9)=1.93ms
     http_req_duration..............: avg=805.57ms min=5.44ms  med=705.87ms max=21.12s p(90)=1.35s    p(95)=1.48s    p(99.9)=17.87s
       { expected_response:true }...: avg=805.57ms min=5.44ms  med=705.87ms max=21.12s p(90)=1.35s    p(95)=1.48s    p(99.9)=17.87s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17696
     http_req_receiving.............: avg=263.54µs min=35.63µs med=93.62µs  max=237ms  p(90)=129.71µs p(95)=145.04µs p(99.9)=9.84ms
     http_req_sending...............: avg=30.01µs  min=5.63µs  med=18.09µs  max=48ms   p(90)=23.41µs  p(95)=27.6µs   p(99.9)=3.12ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=805.28ms min=5.32ms  med=705.74ms max=21.12s p(90)=1.35s    p(95)=1.48s    p(99.9)=17.87s
     http_reqs......................: 17696   262.720056/s
     iteration_duration.............: avg=853.92ms min=30.93ms med=755.23ms max=21.12s p(90)=1.37s    p(95)=1.48s    p(99.9)=17.89s
     iterations.....................: 16696   247.87376/s
     success_rate...................: 100.00% ✓ 16696      ✗ 0    
     vus............................: 74      min=0        max=497
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

     checks.........................: 100.00% ✓ 49029      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   291 kB/s
     http_req_blocked...............: avg=10.82µs  min=1.14µs med=2.98µs   max=14.03ms p(90)=4.56µs   p(95)=5.92µs   p(99.9)=875.34µs
     http_req_connecting............: avg=6.3µs    min=0s     med=0s       max=13.97ms p(90)=0s       p(95)=0s       p(99.9)=844.53µs
     http_req_duration..............: avg=345.71ms min=7.39ms med=370.45ms max=1.01s   p(90)=590.56ms p(95)=637.11ms p(99.9)=910.42ms
       { expected_response:true }...: avg=345.71ms min=7.39ms med=370.45ms max=1.01s   p(90)=590.56ms p(95)=637.11ms p(99.9)=910.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17343
     http_req_receiving.............: avg=90.68µs  min=32.9µs med=84.11µs  max=4.94ms  p(90)=121.92µs p(95)=136.84µs p(99.9)=933.87µs
     http_req_sending...............: avg=26.91µs  min=5.54µs med=16.81µs  max=15.18ms p(90)=22.11µs  p(95)=26.73µs  p(99.9)=2.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=345.59ms min=7.29ms med=370.38ms max=1.01s   p(90)=590.43ms p(95)=637ms    p(99.9)=910.3ms 
     http_reqs......................: 17343   237.658857/s
     iteration_duration.............: avg=366.84ms min=8.13ms med=387ms    max=1.01s   p(90)=596.34ms p(95)=642.74ms p(99.9)=918.47ms
     iterations.....................: 16343   223.955412/s
     success_rate...................: 100.00% ✓ 16343      ✗ 0    
     vus............................: 47      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 445410      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=23.23µs min=892ns   med=2.39µs   max=83.36ms  p(90)=4.21µs   p(95)=5.4µs    p(99.9)=3.31ms  
     http_req_connecting............: avg=20.03µs min=0s      med=0s       max=83.33ms  p(90)=0s       p(95)=0s       p(99.9)=3.18ms  
     http_req_duration..............: avg=95.16ms min=1.48ms  med=81.9ms   max=1.21s    p(90)=180.86ms p(95)=212.66ms p(99.9)=633.99ms
       { expected_response:true }...: avg=95.16ms min=1.48ms  med=81.9ms   max=1.21s    p(90)=180.86ms p(95)=212.66ms p(99.9)=633.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149470
     http_req_receiving.............: avg=1.46ms  min=51.61µs med=102.26µs max=716.01ms p(90)=1.62ms   p(95)=4.16ms   p(99.9)=98.11ms 
     http_req_sending...............: avg=68.25µs min=4.55µs  med=9.54µs   max=149.95ms p(90)=19.75µs  p(95)=107.58µs p(99.9)=8.85ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.62ms min=1.39ms  med=80.92ms  max=1.21s    p(90)=179.07ms p(95)=209.3ms  p(99.9)=628.38ms
     http_reqs......................: 149470  2415.562917/s
     iteration_duration.............: avg=96.08ms min=2.8ms   med=82.81ms  max=1.21s    p(90)=181.46ms p(95)=213.54ms p(99.9)=634.34ms
     iterations.....................: 148470  2399.402062/s
     success_rate...................: 100.00% ✓ 148470      ✗ 0     
     vus............................: 48      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 435726      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=21.5µs  min=1µs    med=2.88µs   max=62.71ms  p(90)=4.58µs   p(95)=5.77µs   p(99.9)=2.39ms  
     http_req_connecting............: avg=17.81µs min=0s     med=0s       max=62.62ms  p(90)=0s       p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=97.28ms min=1.52ms med=87.28ms  max=1.57s    p(90)=181.11ms p(95)=208.11ms p(99.9)=924.9ms 
       { expected_response:true }...: avg=97.28ms min=1.52ms med=87.28ms  max=1.57s    p(90)=181.11ms p(95)=208.11ms p(99.9)=924.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 146242
     http_req_receiving.............: avg=1.32ms  min=53.8µs med=109.93µs max=962.07ms p(90)=1.65ms   p(95)=4.15ms   p(99.9)=78.6ms  
     http_req_sending...............: avg=70.36µs min=4.96µs med=10.54µs  max=178.94ms p(90)=19.95µs  p(95)=120.35µs p(99.9)=9.82ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.88ms min=1.45ms med=86ms     max=1.57s    p(90)=179.41ms p(95)=205.75ms p(99.9)=894.5ms 
     http_reqs......................: 146242  2362.45637/s
     iteration_duration.............: avg=98.21ms min=2.96ms med=88.35ms  max=1.57s    p(90)=181.66ms p(95)=208.73ms p(99.9)=954.41ms
     iterations.....................: 145242  2346.301938/s
     success_rate...................: 100.00% ✓ 145242      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432963      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=21.8µs  min=1.09µs  med=2.83µs   max=71.29ms  p(90)=4.52µs   p(95)=5.71µs   p(99.9)=2.51ms  
     http_req_connecting............: avg=17.68µs min=0s      med=0s       max=71.21ms  p(90)=0s       p(95)=0s       p(99.9)=2.39ms  
     http_req_duration..............: avg=97.85ms min=1.41ms  med=91.76ms  max=536.06ms p(90)=188.42ms p(95)=206.89ms p(99.9)=326.5ms 
       { expected_response:true }...: avg=97.85ms min=1.41ms  med=91.76ms  max=536.06ms p(90)=188.42ms p(95)=206.89ms p(99.9)=326.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 145321
     http_req_receiving.............: avg=1.5ms   min=54.93µs med=143.85µs max=262.99ms p(90)=3.37ms   p(95)=5.53ms   p(99.9)=49.57ms 
     http_req_sending...............: avg=75.69µs min=4.76µs  med=10.52µs  max=260.07ms p(90)=21.07µs  p(95)=121.88µs p(99.9)=9.49ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.27ms min=1.31ms  med=90.19ms  max=500.56ms p(90)=186.66ms p(95)=204.89ms p(99.9)=313.56ms
     http_reqs......................: 145321  2353.347637/s
     iteration_duration.............: avg=98.8ms  min=4.3ms   med=92.8ms   max=536.24ms p(90)=188.98ms p(95)=207.42ms p(99.9)=329.08ms
     iterations.....................: 144321  2337.153504/s
     success_rate...................: 100.00% ✓ 144321      ✗ 0     
     vus............................: 90      min=0         max=499 
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

     checks.........................: 100.00% ✓ 413172      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=10.76µs  min=921ns   med=2.43µs  max=32.42ms  p(90)=4.13µs   p(95)=5.31µs   p(99.9)=471.8µs 
     http_req_connecting............: avg=7.68µs   min=0s      med=0s      max=32.36ms  p(90)=0s       p(95)=0s       p(99.9)=407.39µs
     http_req_duration..............: avg=102.57ms min=1.65ms  med=96.87ms max=296.74ms p(90)=198.84ms p(95)=215.21ms p(99.9)=259.61ms
       { expected_response:true }...: avg=102.57ms min=1.65ms  med=96.87ms max=296.74ms p(90)=198.84ms p(95)=215.21ms p(99.9)=259.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138724
     http_req_receiving.............: avg=106.27µs min=27.56µs med=55.21µs max=117.38ms p(90)=108.95µs p(95)=303.33µs p(99.9)=7.18ms  
     http_req_sending...............: avg=55.74µs  min=4.87µs  med=10.55µs max=178.43ms p(90)=19.07µs  p(95)=106.74µs p(99.9)=7.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.41ms min=1.59ms  med=96.72ms max=296.26ms p(90)=198.66ms p(95)=214.99ms p(99.9)=259.2ms 
     http_reqs......................: 138724  2236.399462/s
     iteration_duration.............: avg=103.55ms min=3.37ms  med=98ms    max=313.53ms p(90)=199.41ms p(95)=215.67ms p(99.9)=260ms   
     iterations.....................: 137724  2220.278247/s
     success_rate...................: 100.00% ✓ 137724      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 409995      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=18.04µs  min=872ns   med=2.57µs   max=117.9ms  p(90)=4.67µs   p(95)=5.83µs   p(99.9)=1.11ms  
     http_req_connecting............: avg=14.63µs  min=0s      med=0s       max=117.72ms p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=103.35ms min=1.85ms  med=90.3ms   max=1.62s    p(90)=196.13ms p(95)=227.76ms p(99.9)=948.16ms
       { expected_response:true }...: avg=103.35ms min=1.85ms  med=90.3ms   max=1.62s    p(90)=196.13ms p(95)=227.76ms p(99.9)=948.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137665
     http_req_receiving.............: avg=1.73ms   min=49.09µs med=109.37µs max=1.02s    p(90)=1.86ms   p(95)=5.03ms   p(99.9)=128.01ms
     http_req_sending...............: avg=65.13µs  min=4.94µs  med=10.36µs  max=115.53ms p(90)=21.72µs  p(95)=108.05µs p(99.9)=8.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.55ms min=1.77ms  med=89.11ms  max=1.59s    p(90)=193.61ms p(95)=224.25ms p(99.9)=935.63ms
     http_reqs......................: 137665  2210.776403/s
     iteration_duration.............: avg=104.39ms min=3.33ms  med=91.3ms   max=1.62s    p(90)=196.97ms p(95)=228.66ms p(99.9)=952.49ms
     iterations.....................: 136665  2194.7173/s
     success_rate...................: 100.00% ✓ 136665      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 214050      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.81µs   min=1.03µs  med=2.89µs   max=7.64ms   p(90)=4.77µs   p(95)=5.81µs   p(99.9)=503.22µs
     http_req_connecting............: avg=2.22µs   min=0s      med=0s       max=7.59ms   p(90)=0s       p(95)=0s       p(99.9)=445.59µs
     http_req_duration..............: avg=197.22ms min=2ms     med=199.15ms max=517.5ms  p(90)=365.11ms p(95)=391.13ms p(99.9)=469.69ms
       { expected_response:true }...: avg=197.22ms min=2ms     med=199.15ms max=517.5ms  p(90)=365.11ms p(95)=391.13ms p(99.9)=469.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72350
     http_req_receiving.............: avg=79.09µs  min=28.17µs med=66.21µs  max=25.77ms  p(90)=106.99µs p(95)=122.06µs p(99.9)=1.1ms   
     http_req_sending...............: avg=36.04µs  min=5.12µs  med=12.73µs  max=189.56ms p(90)=20.61µs  p(95)=24.4µs   p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.11ms min=1.9ms   med=199.03ms max=517.4ms  p(90)=364.98ms p(95)=390.99ms p(99.9)=469.37ms
     http_reqs......................: 72350   1155.595734/s
     iteration_duration.............: avg=200.24ms min=4.26ms  med=202.38ms max=517.81ms p(90)=366ms    p(95)=391.95ms p(99.9)=470.11ms
     iterations.....................: 71350   1139.623436/s
     success_rate...................: 100.00% ✓ 71350       ✗ 0    
     vus............................: 86      min=0         max=496
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

     checks.........................: 100.00% ✓ 99474      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   633 kB/s
     http_req_blocked...............: avg=8.89µs   min=1.04µs  med=2.75µs   max=7.36ms  p(90)=4.49µs   p(95)=5.44µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=5.13µs   min=0s      med=0s       max=7.29ms  p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=420.26ms min=3.74ms  med=387.56ms max=1.64s   p(90)=830.77ms p(95)=907.65ms p(99.9)=1.3s    
       { expected_response:true }...: avg=420.26ms min=3.74ms  med=387.56ms max=1.64s   p(90)=830.77ms p(95)=907.65ms p(99.9)=1.3s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 34158
     http_req_receiving.............: avg=80.91µs  min=29.16µs med=70.55µs  max=9.05ms  p(90)=109.97µs p(95)=123.81µs p(99.9)=939.72µs
     http_req_sending...............: avg=31.97µs  min=5.24µs  med=13.34µs  max=77.95ms p(90)=20.73µs  p(95)=23.68µs  p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=420.15ms min=3.69ms  med=387.46ms max=1.64s   p(90)=830.54ms p(95)=907.54ms p(99.9)=1.3s    
     http_reqs......................: 34158   527.549077/s
     iteration_duration.............: avg=433.14ms min=21.24ms med=401.34ms max=1.65s   p(90)=834.2ms  p(95)=910.44ms p(99.9)=1.3s    
     iterations.....................: 33158   512.104698/s
     success_rate...................: 100.00% ✓ 33158      ✗ 0    
     vus............................: 90      min=0        max=500
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

     checks.........................: 100.00% ✓ 46719      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=15.53µs  min=1.47µs  med=3.77µs   max=5.88ms  p(90)=5.71µs   p(95)=7.57µs  p(99.9)=2.37ms
     http_req_connecting............: avg=9.84µs   min=0s      med=0s       max=5.81ms  p(90)=0s       p(95)=0s      p(99.9)=2.35ms
     http_req_duration..............: avg=878.96ms min=5.57ms  med=787.84ms max=4.58s   p(90)=1.77s    p(95)=1.98s   p(99.9)=4.1s  
       { expected_response:true }...: avg=878.96ms min=5.57ms  med=787.84ms max=4.58s   p(90)=1.77s    p(95)=1.98s   p(99.9)=4.1s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16573
     http_req_receiving.............: avg=105.48µs min=32.12µs med=95.13µs  max=42.51ms p(90)=135.05µs p(95)=150.4µs p(99.9)=1.01ms
     http_req_sending...............: avg=34.05µs  min=5.93µs  med=18.94µs  max=57.5ms  p(90)=24.88µs  p(95)=30.17µs p(99.9)=3.05ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=878.82ms min=5.47ms  med=787.69ms max=4.58s   p(90)=1.77s    p(95)=1.98s   p(99.9)=4.1s  
     http_reqs......................: 16573   245.169056/s
     iteration_duration.............: avg=935.46ms min=47.84ms med=853.38ms max=4.59s   p(90)=1.8s     p(95)=1.99s   p(99.9)=4.14s 
     iterations.....................: 15573   230.375775/s
     success_rate...................: 100.00% ✓ 15573      ✗ 0    
     vus............................: 76      min=0        max=500
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

     checks.........................: 100.00% ✓ 45102      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=13.19µs  min=1.09µs  med=3.25µs   max=3.23ms  p(90)=5.01µs   p(95)=6.81µs  p(99.9)=2.02ms  
     http_req_connecting............: avg=8.26µs   min=0s      med=0s       max=3.2ms   p(90)=0s       p(95)=0s      p(99.9)=1.99ms  
     http_req_duration..............: avg=905.31ms min=7.61ms  med=836.64ms max=3.28s   p(90)=1.82s    p(95)=1.97s   p(99.9)=2.87s   
       { expected_response:true }...: avg=905.31ms min=7.61ms  med=836.64ms max=3.28s   p(90)=1.82s    p(95)=1.97s   p(99.9)=2.87s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16034
     http_req_receiving.............: avg=99.94µs  min=32.41µs med=88.5µs   max=80.87ms p(90)=127.88µs p(95)=143.9µs p(99.9)=882.55µs
     http_req_sending...............: avg=41.33µs  min=5.4µs   med=16.92µs  max=73.11ms p(90)=22.55µs  p(95)=27.81µs p(99.9)=3.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=905.17ms min=7.52ms  med=836.54ms max=3.28s   p(90)=1.82s    p(95)=1.97s   p(99.9)=2.87s   
     http_reqs......................: 16034   233.505147/s
     iteration_duration.............: avg=965.48ms min=24.72ms med=899.55ms max=3.29s   p(90)=1.85s    p(95)=1.98s   p(99.9)=2.91s   
     iterations.....................: 15034   218.942022/s
     success_rate...................: 100.00% ✓ 15034      ✗ 0    
     vus............................: 88      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

