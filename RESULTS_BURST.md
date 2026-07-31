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
| hive-router | v0.0.84 | 2,817 | 3,026 | 2,771 | 2.8% |  |
| fusion-nightly-net11 | 16.6.0-p.8 | 2,616 | 2,708 | 2,568 | 1.8% |  |
| fusion-nightly | 16.6.0-p.8 | 2,458 | 2,547 | 2,436 | 1.7% |  |
| fusion | 16.5.1 | 2,381 | 2,474 | 2,376 | 1.5% |  |
| cosmo | 0.334.0 | 1,232 | 1,280 | 1,227 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 572 | 582 | 569 | 0.7% |  |
| hive-gateway | 2.10.8 | 248 | 253 | 246 | 1.0% |  |
| apollo-gateway | 2.14.3 | 233 | 239 | 230 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (5160 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (559911 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.8 | 2,468 | 2,562 | 2,463 | 1.4% |  |
| hive-router | v0.0.84 | 2,412 | 2,566 | 2,397 | 2.4% |  |
| fusion-nightly | 16.6.0-p.8 | 2,351 | 2,471 | 2,294 | 2.1% |  |
| fusion | 16.5.1 | 2,271 | 2,349 | 2,254 | 1.3% |  |
| fusion-nightly-fed | 16.6.0-p.8 | 2,094 | 2,203 | 2,081 | 1.9% |  |
| cosmo | 0.334.0 | 1,155 | 1,196 | 1,152 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 530 | 541 | 527 | 1.0% |  |
| apollo-gateway | 2.14.3 | 236 | 241 | 235 | 0.8% |  |
| hive-gateway | 2.10.8 | 236 | 243 | 234 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (23870 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (303859 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 517938      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=16.56µs min=861ns   med=2.15µs  max=65.55ms  p(90)=3.63µs   p(95)=4.81µs   p(99.9)=997.57µs
     http_req_connecting............: avg=13.47µs min=0s      med=0s      max=60.25ms  p(90)=0s       p(95)=0s       p(99.9)=920.77µs
     http_req_duration..............: avg=81.85ms min=1.37ms  med=76.82ms max=318.15ms p(90)=159.88ms p(95)=174.96ms p(99.9)=228.73ms
       { expected_response:true }...: avg=81.85ms min=1.37ms  med=76.82ms max=318.15ms p(90)=159.88ms p(95)=174.96ms p(99.9)=228.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173646
     http_req_receiving.............: avg=165µs   min=26.07µs med=51.02µs max=200.59ms p(90)=134µs    p(95)=324.85µs p(99.9)=23.82ms 
     http_req_sending...............: avg=67.12µs min=4.59µs  med=9.15µs  max=206.53ms p(90)=17.44µs  p(95)=110.7µs  p(99.9)=9.2ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.62ms min=1.33ms  med=76.63ms max=317.6ms  p(90)=159.63ms p(95)=174.55ms p(99.9)=224.06ms
     http_reqs......................: 173646  2817.847943/s
     iteration_duration.............: avg=82.57ms min=2.04ms  med=77.62ms max=327.81ms p(90)=160.27ms p(95)=175.41ms p(99.9)=229.74ms
     iterations.....................: 172646  2801.6204/s
     success_rate...................: 100.00% ✓ 172646      ✗ 0     
     vus............................: 85      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 484866      ✗ 0     
     data_received..................: 14 GB   229 MB/s
     data_sent......................: 195 MB  3.1 MB/s
     http_req_blocked...............: avg=16.52µs min=872ns   med=2.13µs   max=93.93ms  p(90)=3.59µs   p(95)=4.61µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=13.59µs min=0s      med=0s       max=93.77ms  p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=87.43ms min=1.87ms  med=82.47ms  max=323.8ms  p(90)=167.27ms p(95)=182.14ms p(99.9)=236.72ms
       { expected_response:true }...: avg=87.43ms min=1.87ms  med=82.47ms  max=323.8ms  p(90)=167.27ms p(95)=182.14ms p(99.9)=236.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162622
     http_req_receiving.............: avg=720µs   min=51.81µs med=113.48µs max=96.37ms  p(90)=1.51ms   p(95)=2.44ms   p(99.9)=25.2ms  
     http_req_sending...............: avg=63.8µs  min=4.5µs   med=8.96µs   max=218.29ms p(90)=17.66µs  p(95)=104.89µs p(99.9)=8.18ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.65ms min=1.8ms   med=81.64ms  max=323.34ms p(90)=166.42ms p(95)=181.26ms p(99.9)=236.05ms
     http_reqs......................: 162622  2616.298471/s
     iteration_duration.............: avg=88.21ms min=3.88ms  med=83.33ms  max=345.66ms p(90)=167.7ms  p(95)=182.55ms p(99.9)=237.64ms
     iterations.....................: 161622  2600.210251/s
     success_rate...................: 100.00% ✓ 161622      ✗ 0     
     vus............................: 63      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 456102      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=13.88µs min=882ns   med=2.06µs  max=64.25ms  p(90)=3.45µs   p(95)=4.45µs   p(99.9)=1ms     
     http_req_connecting............: avg=11.25µs min=0s      med=0s      max=64.09ms  p(90)=0s       p(95)=0s       p(99.9)=956.93µs
     http_req_duration..............: avg=92.97ms min=1.91ms  med=79.89ms max=1.16s    p(90)=178.53ms p(95)=207.16ms p(99.9)=611.04ms
       { expected_response:true }...: avg=92.97ms min=1.91ms  med=79.89ms max=1.16s    p(90)=178.53ms p(95)=207.16ms p(99.9)=611.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153034
     http_req_receiving.............: avg=1.6ms   min=51.82µs med=98.08µs max=538.12ms p(90)=1.77ms   p(95)=4.89ms   p(99.9)=111.59ms
     http_req_sending...............: avg=58.6µs  min=4.46µs  med=8.62µs  max=142.26ms p(90)=15.6µs   p(95)=94.73µs  p(99.9)=8.1ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.31ms min=1.83ms  med=78.72ms max=1.16s    p(90)=176.38ms p(95)=203.9ms  p(99.9)=590.77ms
     http_reqs......................: 153034  2458.640812/s
     iteration_duration.............: avg=93.82ms min=3.13ms  med=80.78ms max=1.16s    p(90)=179.09ms p(95)=207.8ms  p(99.9)=611.56ms
     iterations.....................: 152034  2442.574834/s
     success_rate...................: 100.00% ✓ 152034      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 442908      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=13.92µs min=822ns   med=1.96µs  max=69.1ms   p(90)=3.21µs   p(95)=4.11µs   p(99.9)=1.08ms  
     http_req_connecting............: avg=11.39µs min=0s      med=0s      max=68.92ms  p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=95.73ms min=1.98ms  med=84.84ms max=1.88s    p(90)=179.51ms p(95)=207.95ms p(99.9)=765.92ms
       { expected_response:true }...: avg=95.73ms min=1.98ms  med=84.84ms max=1.88s    p(90)=179.51ms p(95)=207.95ms p(99.9)=765.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148636
     http_req_receiving.............: avg=1.29ms  min=52.34µs med=99.24µs max=522.73ms p(90)=1.68ms   p(95)=4.25ms   p(99.9)=84.32ms 
     http_req_sending...............: avg=59.02µs min=4.42µs  med=8.56µs  max=274.32ms p(90)=15.02µs  p(95)=90.48µs  p(99.9)=8.04ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.38ms min=1.89ms  med=83.73ms max=1.77s    p(90)=177.71ms p(95)=205.34ms p(99.9)=758.02ms
     http_reqs......................: 148636  2381.902843/s
     iteration_duration.............: avg=96.61ms min=3.02ms  med=85.88ms max=1.88s    p(90)=180.03ms p(95)=208.56ms p(99.9)=769.14ms
     iterations.....................: 147636  2365.87777/s
     success_rate...................: 100.00% ✓ 147636      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 228147      ✗ 0    
     data_received..................: 6.8 GB  108 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=4.95µs   min=1.01µs  med=2.21µs   max=6.21ms   p(90)=3.92µs   p(95)=4.84µs   p(99.9)=425.01µs
     http_req_connecting............: avg=2.03µs   min=0s      med=0s       max=6.16ms   p(90)=0s       p(95)=0s       p(99.9)=385.63µs
     http_req_duration..............: avg=185.19ms min=1.98ms  med=187.71ms max=541.03ms p(90)=341.34ms p(95)=366ms    p(99.9)=438.1ms 
       { expected_response:true }...: avg=185.19ms min=1.98ms  med=187.71ms max=541.03ms p(90)=341.34ms p(95)=366ms    p(99.9)=438.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 77049
     http_req_receiving.............: avg=69.52µs  min=26.29µs med=57.36µs  max=42.17ms  p(90)=95.21µs  p(95)=109.53µs p(99.9)=884.77µs
     http_req_sending...............: avg=27.53µs  min=4.81µs  med=9.89µs   max=113.55ms p(90)=17.05µs  p(95)=21.05µs  p(99.9)=3.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.09ms min=1.88ms  med=187.61ms max=540.97ms p(90)=341.25ms p(95)=365.91ms p(99.9)=437.99ms
     http_reqs......................: 77049   1232.672701/s
     iteration_duration.............: avg=187.85ms min=4.73ms  med=190.21ms max=541.19ms p(90)=342.18ms p(95)=366.62ms p(99.9)=438.5ms 
     iterations.....................: 76049   1216.674146/s
     success_rate...................: 100.00% ✓ 76049       ✗ 0    
     vus............................: 80      min=0         max=492
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

     checks.........................: 100.00% ✓ 107205     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   687 kB/s
     http_req_blocked...............: avg=7.3µs    min=961ns   med=2.48µs   max=5.8ms    p(90)=4.26µs   p(95)=5.32µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=5.73ms   p(90)=0s       p(95)=0s       p(99.9)=848.35µs
     http_req_duration..............: avg=390.4ms  min=3.44ms  med=360.81ms max=1.57s    p(90)=770.96ms p(95)=834.92ms p(99.9)=1.26s   
       { expected_response:true }...: avg=390.4ms  min=3.44ms  med=360.81ms max=1.57s    p(90)=770.96ms p(95)=834.92ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36735
     http_req_receiving.............: avg=84.86µs  min=28.54µs med=64.95µs  max=189.08ms p(90)=105.26µs p(95)=120.17µs p(99.9)=1.1ms   
     http_req_sending...............: avg=23.38µs  min=5.28µs  med=12.08µs  max=27.15ms  p(90)=19.9µs   p(95)=22.88µs  p(99.9)=2.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=390.3ms  min=3.39ms  med=360.73ms max=1.57s    p(90)=770.88ms p(95)=834.83ms p(99.9)=1.26s   
     http_reqs......................: 36735   572.58764/s
     iteration_duration.............: avg=401.55ms min=13.31ms med=373.28ms max=1.57s    p(90)=773.92ms p(95)=838.04ms p(99.9)=1.26s   
     iterations.....................: 35735   557.000662/s
     success_rate...................: 100.00% ✓ 35735      ✗ 0    
     vus............................: 64      min=0        max=497
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

     checks.........................: 100.00% ✓ 47373      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=14.66µs  min=1.15µs  med=3.39µs   max=19.33ms  p(90)=5.08µs   p(95)=6.59µs   p(99.9)=2.42ms 
     http_req_connecting............: avg=9.59µs   min=0s      med=0s       max=19.27ms  p(90)=0s       p(95)=0s       p(99.9)=2.39ms 
     http_req_duration..............: avg=851.1ms  min=5.8ms   med=761.05ms max=15.88s   p(90)=1.55s    p(95)=1.74s    p(99.9)=14.28s 
       { expected_response:true }...: avg=851.1ms  min=5.8ms   med=761.05ms max=15.88s   p(90)=1.55s    p(95)=1.74s    p(99.9)=14.28s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16791
     http_req_receiving.............: avg=198.97µs min=33.93µs med=87.6µs   max=135.45ms p(90)=123.75µs p(95)=139.35µs p(99.9)=49.75ms
     http_req_sending...............: avg=28.42µs  min=5.56µs  med=17.57µs  max=9.59ms   p(90)=23.29µs  p(95)=27.6µs   p(99.9)=3.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=850.87ms min=5.73ms  med=760.95ms max=15.88s   p(90)=1.55s    p(95)=1.74s    p(99.9)=14.28s 
     http_reqs......................: 16791   248.764043/s
     iteration_duration.............: avg=905.02ms min=44.64ms med=823.62ms max=15.88s   p(90)=1.58s    p(95)=1.76s    p(99.9)=14.29s 
     iterations.....................: 15791   233.948722/s
     success_rate...................: 100.00% ✓ 15791      ✗ 0    
     vus............................: 82      min=0        max=500
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

     checks.........................: 100.00% ✓ 48009      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   285 kB/s
     http_req_blocked...............: avg=15.41µs  min=1.39µs  med=3.61µs   max=15.64ms p(90)=5.28µs   p(95)=6.58µs   p(99.9)=2.27ms  
     http_req_connecting............: avg=10.17µs  min=0s      med=0s       max=15.59ms p(90)=0s       p(95)=0s       p(99.9)=2.25ms  
     http_req_duration..............: avg=401.4ms  min=7.42ms  med=446.39ms max=1.11s   p(90)=679.36ms p(95)=726.1ms  p(99.9)=998.59ms
       { expected_response:true }...: avg=401.4ms  min=7.42ms  med=446.39ms max=1.11s   p(90)=679.36ms p(95)=726.1ms  p(99.9)=998.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17003
     http_req_receiving.............: avg=90.96µs  min=37.29µs med=82.58µs  max=6.04ms  p(90)=122.57µs p(95)=136.27µs p(99.9)=1.04ms  
     http_req_sending...............: avg=43.25µs  min=5.84µs  med=16.97µs  max=87ms    p(90)=22.35µs  p(95)=26.76µs  p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=401.26ms min=7.28ms  med=446.31ms max=1.11s   p(90)=679.26ms p(95)=725.99ms p(99.9)=998.43ms
     http_reqs......................: 17003   233.005364/s
     iteration_duration.............: avg=426.5ms  min=11.49ms med=470.78ms max=1.12s   p(90)=683.83ms p(95)=732.44ms p(99.9)=1s      
     iterations.....................: 16003   219.301584/s
     success_rate...................: 100.00% ✓ 16003      ✗ 0    
     vus............................: 49      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 454749      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 183 MB  3.0 MB/s
     http_req_blocked...............: avg=25.5µs   min=1.09µs  med=3.06µs   max=63.85ms  p(90)=4.95µs   p(95)=6.17µs   p(99.9)=3.01ms  
     http_req_connecting............: avg=21.08µs  min=0s      med=0s       max=63.76ms  p(90)=0s       p(95)=0s       p(99.9)=2.8ms   
     http_req_duration..............: avg=93.15ms  min=1.5ms   med=88.07ms  max=382.31ms p(90)=178.29ms p(95)=196.98ms p(99.9)=266.93ms
       { expected_response:true }...: avg=93.15ms  min=1.5ms   med=88.07ms  max=382.31ms p(90)=178.29ms p(95)=196.98ms p(99.9)=266.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152583
     http_req_receiving.............: avg=786.21µs min=53.23µs med=115.97µs max=106.02ms p(90)=1.62ms   p(95)=2.65ms   p(99.9)=32.36ms 
     http_req_sending...............: avg=78.63µs  min=5.19µs  med=11.42µs  max=148.01ms p(90)=23.62µs  p(95)=130.54µs p(99.9)=10.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.29ms  min=1.4ms   med=87.19ms  max=382.16ms p(90)=177.44ms p(95)=196.03ms p(99.9)=259.49ms
     http_reqs......................: 152583  2468.74425/s
     iteration_duration.............: avg=94.05ms  min=3.74ms  med=89.09ms  max=382.53ms p(90)=178.82ms p(95)=197.57ms p(99.9)=268.65ms
     iterations.....................: 151583  2452.564569/s
     success_rate...................: 100.00% ✓ 151583      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 445566      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=24.76µs  min=951ns   med=3.08µs  max=75.17ms  p(90)=5.05µs   p(95)=6.36µs   p(99.9)=2.58ms  
     http_req_connecting............: avg=20.66µs  min=0s      med=0s      max=75.06ms  p(90)=0s       p(95)=0s       p(99.9)=2.52ms  
     http_req_duration..............: avg=95.08ms  min=1.57ms  med=88.96ms max=310.25ms p(90)=186.03ms p(95)=204.36ms p(99.9)=266.84ms
       { expected_response:true }...: avg=95.08ms  min=1.57ms  med=88.96ms max=310.25ms p(90)=186.03ms p(95)=204.36ms p(99.9)=266.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149522
     http_req_receiving.............: avg=158.58µs min=27.34µs med=59.06µs max=54.12ms  p(90)=167.81µs p(95)=393.56µs p(99.9)=16.06ms 
     http_req_sending...............: avg=78.3µs   min=4.71µs  med=11.66µs max=164.46ms p(90)=22.95µs  p(95)=138.98µs p(99.9)=10.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.84ms  min=1.53ms  med=88.76ms max=309.97ms p(90)=185.8ms  p(95)=203.9ms  p(99.9)=265.13ms
     http_reqs......................: 149522  2412.414653/s
     iteration_duration.............: avg=96ms     min=3.78ms  med=90.05ms max=359.03ms p(90)=186.6ms  p(95)=204.95ms p(99.9)=267.73ms
     iterations.....................: 148522  2396.280474/s
     success_rate...................: 100.00% ✓ 148522      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433743      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=14.81µs min=831ns   med=2.17µs   max=52.22ms  p(90)=3.84µs   p(95)=4.93µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=11.89µs min=0s      med=0s       max=52.14ms  p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=97.74ms min=1.58ms  med=86.05ms  max=1.78s    p(90)=185.47ms p(95)=211.15ms p(99.9)=665.18ms
       { expected_response:true }...: avg=97.74ms min=1.58ms  med=86.05ms  max=1.78s    p(90)=185.47ms p(95)=211.15ms p(99.9)=665.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145581
     http_req_receiving.............: avg=1.31ms  min=51.86µs med=104.07µs max=860.21ms p(90)=1.7ms    p(95)=4.05ms   p(99.9)=88.97ms 
     http_req_sending...............: avg=61.87µs min=4.8µs   med=9.23µs   max=116.72ms p(90)=18.96µs  p(95)=103.37µs p(99.9)=8.39ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.36ms min=1.49ms  med=85.1ms   max=1.78s    p(90)=183.14ms p(95)=208.37ms p(99.9)=661.76ms
     http_reqs......................: 145581  2351.035111/s
     iteration_duration.............: avg=98.66ms min=2.72ms  med=86.99ms  max=1.78s    p(90)=185.98ms p(95)=211.74ms p(99.9)=666.64ms
     iterations.....................: 144581  2334.885784/s
     success_rate...................: 100.00% ✓ 144581      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 419019      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=18.43µs  min=931ns   med=2.74µs   max=67.38ms  p(90)=4.45µs   p(95)=5.59µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=14.93µs  min=0s      med=0s       max=67.29ms  p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=101.15ms min=1.54ms  med=85.71ms  max=1.64s    p(90)=193.89ms p(95)=227.6ms  p(99.9)=913.37ms
       { expected_response:true }...: avg=101.15ms min=1.54ms  med=85.71ms  max=1.64s    p(90)=193.89ms p(95)=227.6ms  p(99.9)=913.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140673
     http_req_receiving.............: avg=1.74ms   min=52.64µs med=111.35µs max=886.34ms p(90)=2.03ms   p(95)=5.45ms   p(99.9)=105.88ms
     http_req_sending...............: avg=66.92µs  min=4.87µs  med=10.37µs  max=154.61ms p(90)=19.6µs   p(95)=113.45µs p(99.9)=8.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.34ms  min=1.47ms  med=84.29ms  max=1.64s    p(90)=190.99ms p(95)=223.73ms p(99.9)=887.04ms
     http_reqs......................: 140673  2271.784678/s
     iteration_duration.............: avg=102.18ms min=2.88ms  med=86.85ms  max=1.64s    p(90)=194.75ms p(95)=228.58ms p(99.9)=913.67ms
     iterations.....................: 139673  2255.635278/s
     success_rate...................: 100.00% ✓ 139673      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 388860      ✗ 0     
     data_received..................: 11 GB   184 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=12.63µs  min=881ns   med=2.23µs   max=52.97ms  p(90)=3.98µs   p(95)=5.11µs   p(99.9)=1ms     
     http_req_connecting............: avg=9.64µs   min=0s      med=0s       max=52.88ms  p(90)=0s       p(95)=0s       p(99.9)=916.36µs
     http_req_duration..............: avg=109ms    min=1.83ms  med=97.23ms  max=1.54s    p(90)=207.34ms p(95)=234.33ms p(99.9)=708.09ms
       { expected_response:true }...: avg=109ms    min=1.83ms  med=97.23ms  max=1.54s    p(90)=207.34ms p(95)=234.33ms p(99.9)=708.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130620
     http_req_receiving.............: avg=1.66ms   min=52.25µs med=113.25µs max=744.52ms p(90)=1.77ms   p(95)=4.35ms   p(99.9)=119.68ms
     http_req_sending...............: avg=53.03µs  min=4.81µs  med=9.77µs   max=97.67ms  p(90)=19.52µs  p(95)=92.05µs  p(99.9)=7.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.28ms min=1.74ms  med=96.1ms   max=1.54s    p(90)=205.32ms p(95)=230.54ms p(99.9)=685.14ms
     http_reqs......................: 130620  2094.826954/s
     iteration_duration.............: avg=110.09ms min=3.57ms  med=98.47ms  max=1.54s    p(90)=207.96ms p(95)=235.15ms p(99.9)=708.92ms
     iterations.....................: 129620  2078.789387/s
     success_rate...................: 100.00% ✓ 129620      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 213870      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.26µs   min=990ns   med=2.27µs   max=10.87ms  p(90)=4.05µs   p(95)=5.08µs   p(99.9)=389.89µs
     http_req_connecting............: avg=2.21µs   min=0s      med=0s       max=10.67ms  p(90)=0s       p(95)=0s       p(99.9)=308.14µs
     http_req_duration..............: avg=197.39ms min=2.03ms  med=198.57ms max=514.69ms p(90)=365.24ms p(95)=391.76ms p(99.9)=466.45ms
       { expected_response:true }...: avg=197.39ms min=2.03ms  med=198.57ms max=514.69ms p(90)=365.24ms p(95)=391.76ms p(99.9)=466.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72290
     http_req_receiving.............: avg=79.12µs  min=26.88µs med=62.59µs  max=202.1ms  p(90)=103.2µs  p(95)=118.23µs p(99.9)=1.11ms  
     http_req_sending...............: avg=28.84µs  min=4.87µs  med=11.25µs  max=107.42ms p(90)=19.12µs  p(95)=22.64µs  p(99.9)=3.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.28ms min=1.96ms  med=198.47ms max=514.61ms p(90)=365.14ms p(95)=391.65ms p(99.9)=466.34ms
     http_reqs......................: 72290   1155.105369/s
     iteration_duration.............: avg=200.4ms  min=5.68ms  med=201.71ms max=514.84ms p(90)=366.13ms p(95)=392.4ms  p(99.9)=466.88ms
     iterations.....................: 71290   1139.126598/s
     success_rate...................: 100.00% ✓ 71290       ✗ 0    
     vus............................: 82      min=0         max=495
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

     checks.........................: 100.00% ✓ 99756      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   637 kB/s
     http_req_blocked...............: avg=7.73µs   min=1.01µs  med=2.63µs   max=3.2ms    p(90)=4.33µs   p(95)=5.31µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=4.13µs   min=0s      med=0s       max=3.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=418.77ms min=3.73ms  med=389.84ms max=1.74s    p(90)=827.62ms p(95)=900.69ms p(99.9)=1.36s   
       { expected_response:true }...: avg=418.77ms min=3.73ms  med=389.84ms max=1.74s    p(90)=827.62ms p(95)=900.69ms p(99.9)=1.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34252
     http_req_receiving.............: avg=84.2µs   min=28.96µs med=70.78µs  max=95.99ms  p(90)=109.67µs p(95)=123.9µs  p(99.9)=943.77µs
     http_req_sending...............: avg=28.16µs  min=5.03µs  med=12.93µs  max=137.89ms p(90)=20.2µs   p(95)=22.94µs  p(99.9)=1.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=418.66ms min=3.62ms  med=389.74ms max=1.74s    p(90)=827.53ms p(95)=900.61ms p(99.9)=1.36s   
     http_reqs......................: 34252   530.229742/s
     iteration_duration.............: avg=431.57ms min=15.4ms  med=406.1ms  max=1.74s    p(90)=832.76ms p(95)=904.16ms p(99.9)=1.36s   
     iterations.....................: 33252   514.749485/s
     success_rate...................: 100.00% ✓ 33252      ✗ 0    
     vus............................: 86      min=0        max=500
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

     checks.........................: 100.00% ✓ 45873      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=13.71µs  min=1.11µs  med=3.31µs   max=3.51ms   p(90)=5.13µs   p(95)=6.78µs  p(99.9)=2.2ms 
     http_req_connecting............: avg=8.7µs    min=0s      med=0s       max=3.48ms   p(90)=0s       p(95)=0s      p(99.9)=2.18ms
     http_req_duration..............: avg=891.81ms min=7.83ms  med=820.22ms max=3.26s    p(90)=1.81s    p(95)=1.94s   p(99.9)=2.84s 
       { expected_response:true }...: avg=891.81ms min=7.83ms  med=820.22ms max=3.26s    p(90)=1.81s    p(95)=1.94s   p(99.9)=2.84s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16291
     http_req_receiving.............: avg=108.66µs min=32.81µs med=91.45µs  max=75.17ms  p(90)=130.26µs p(95)=147.1µs p(99.9)=1.07ms
     http_req_sending...............: avg=50.86µs  min=5.63µs  med=17.38µs  max=128.24ms p(90)=23.16µs  p(95)=28.65µs p(99.9)=5.13ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=891.65ms min=7.74ms  med=820.12ms max=3.26s    p(90)=1.81s    p(95)=1.94s   p(99.9)=2.84s 
     http_reqs......................: 16291   236.624486/s
     iteration_duration.............: avg=950.13ms min=39.09ms med=890.43ms max=3.26s    p(90)=1.83s    p(95)=1.94s   p(99.9)=2.86s 
     iterations.....................: 15291   222.099627/s
     success_rate...................: 100.00% ✓ 15291      ✗ 0    
     vus............................: 96      min=0        max=500
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

     checks.........................: 100.00% ✓ 45198      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   284 kB/s
     http_req_blocked...............: avg=15.19µs  min=1.21µs  med=3.49µs   max=16.5ms  p(90)=5.35µs   p(95)=7.25µs   p(99.9)=2.16ms
     http_req_connecting............: avg=8.86µs   min=0s      med=0s       max=3.68ms  p(90)=0s       p(95)=0s       p(99.9)=2.11ms
     http_req_duration..............: avg=906.82ms min=5.98ms  med=842.39ms max=5.65s   p(90)=1.83s    p(95)=2.02s    p(99.9)=4.42s 
       { expected_response:true }...: avg=906.82ms min=5.98ms  med=842.39ms max=5.65s   p(90)=1.83s    p(95)=2.02s    p(99.9)=4.42s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16066
     http_req_receiving.............: avg=103.1µs  min=30.95µs med=89.37µs  max=44.88ms p(90)=127.35µs p(95)=142.92µs p(99.9)=1.86ms
     http_req_sending...............: avg=39.8µs   min=5.76µs  med=17.31µs  max=68.56ms p(90)=23.28µs  p(95)=28.46µs  p(99.9)=3.82ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=906.68ms min=5.87ms  med=842.31ms max=5.65s   p(90)=1.83s    p(95)=2.02s    p(99.9)=4.42s 
     http_reqs......................: 16066   236.486052/s
     iteration_duration.............: avg=967.01ms min=48.58ms med=906.82ms max=5.65s   p(90)=1.85s    p(95)=2.05s    p(99.9)=4.43s 
     iterations.....................: 15066   221.766392/s
     success_rate...................: 100.00% ✓ 15066      ✗ 0    
     vus............................: 31      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

