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
| hive-router | v0.0.83 | 2,686 | 2,819 | 2,661 | 2.2% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,578 | 2,669 | 2,561 | 1.4% |  |
| fusion-nightly | 16.5.1-p.2 | 2,476 | 2,585 | 2,437 | 1.9% |  |
| fusion | 16.5.0 | 2,382 | 2,472 | 2,356 | 1.7% |  |
| cosmo | 0.331.1 | 1,201 | 1,247 | 1,191 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.4 | 579 | 590 | 576 | 0.8% |  |
| hive-gateway | 2.10.4 | 256 | 263 | 255 | 1.0% |  |
| apollo-gateway | 2.14.2 | 231 | 237 | 227 | 1.2% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (11384 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (578440 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.5.1-p.2 | 2,360 | 2,449 | 2,349 | 1.5% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,360 | 2,436 | 2,312 | 1.8% |  |
| fusion | 16.5.0 | 2,235 | 2,317 | 2,220 | 1.5% |  |
| hive-router | v0.0.83 | 2,213 | 2,382 | 2,203 | 2.8% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 2,151 | 2,227 | 2,144 | 1.3% |  |
| cosmo | 0.331.1 | 1,169 | 1,209 | 1,162 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.4 | 525 | 543 | 523 | 1.3% |  |
| hive-gateway | 2.10.4 | 248 | 253 | 246 | 0.9% |  |
| apollo-gateway | 2.14.2 | 232 | 237 | 231 | 0.7% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (16681 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (362804 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 494472      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=17.57µs  min=982ns   med=2.54µs  max=64.59ms  p(90)=4.14µs   p(95)=5.25µs   p(99.9)=972.2µs 
     http_req_connecting............: avg=14.31µs  min=0s      med=0s      max=64.51ms  p(90)=0s       p(95)=0s       p(99.9)=875.52µs
     http_req_duration..............: avg=85.72ms  min=1.42ms  med=80.07ms max=289.02ms p(90)=165.6ms  p(95)=177.62ms p(99.9)=222.83ms
       { expected_response:true }...: avg=85.72ms  min=1.42ms  med=80.07ms max=289.02ms p(90)=165.6ms  p(95)=177.62ms p(99.9)=222.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165824
     http_req_receiving.............: avg=127.47µs min=26.09µs med=51.67µs max=144.78ms p(90)=131.26µs p(95)=337.51µs p(99.9)=12.82ms 
     http_req_sending...............: avg=69.28µs  min=4.67µs  med=9.62µs  max=246.68ms p(90)=18.4µs   p(95)=121.06µs p(99.9)=9.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.52ms  min=1.38ms  med=79.89ms max=288.28ms p(90)=165.39ms p(95)=177.37ms p(99.9)=221.65ms
     http_reqs......................: 165824  2686.715623/s
     iteration_duration.............: avg=86.48ms  min=2.13ms  med=80.91ms max=317.33ms p(90)=165.97ms p(95)=178.06ms p(99.9)=223.56ms
     iterations.....................: 164824  2670.513411/s
     success_rate...................: 100.00% ✓ 164824      ✗ 0     
     vus............................: 90      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 478584      ✗ 0     
     data_received..................: 14 GB   226 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=20.97µs  min=931ns   med=2.56µs   max=60.41ms  p(90)=4.15µs   p(95)=5.21µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=17.61µs  min=0s      med=0s       max=60.34ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=88.54ms  min=1.88ms  med=83.84ms  max=350.65ms p(90)=168.63ms p(95)=186.1ms  p(99.9)=256.02ms
       { expected_response:true }...: avg=88.54ms  min=1.88ms  med=83.84ms  max=350.65ms p(90)=168.63ms p(95)=186.1ms  p(99.9)=256.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160528
     http_req_receiving.............: avg=715.84µs min=50.99µs med=111.77µs max=249.34ms p(90)=1.46ms   p(95)=2.37ms   p(99.9)=26.63ms 
     http_req_sending...............: avg=67.1µs   min=4.48µs  med=9.5µs    max=147.24ms p(90)=18.67µs  p(95)=115.98µs p(99.9)=9.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.75ms  min=1.81ms  med=82.93ms  max=350.51ms p(90)=167.74ms p(95)=185.36ms p(99.9)=254.05ms
     http_reqs......................: 160528  2578.122378/s
     iteration_duration.............: avg=89.36ms  min=4.02ms  med=84.76ms  max=360.41ms p(90)=169.15ms p(95)=186.77ms p(99.9)=257.52ms
     iterations.....................: 159528  2562.062112/s
     success_rate...................: 100.00% ✓ 159528      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460296      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=23.16µs min=1.04µs  med=2.61µs  max=78.24ms  p(90)=4.21µs   p(95)=5.34µs   p(99.9)=4.88ms  
     http_req_connecting............: avg=19.6µs  min=0s      med=0s      max=78.18ms  p(90)=0s       p(95)=0s       p(99.9)=4.77ms  
     http_req_duration..............: avg=92.08ms min=1.97ms  med=81.72ms max=1.34s    p(90)=177.23ms p(95)=205.47ms p(99.9)=564.54ms
       { expected_response:true }...: avg=92.08ms min=1.97ms  med=81.72ms max=1.34s    p(90)=177.23ms p(95)=205.47ms p(99.9)=564.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154432
     http_req_receiving.............: avg=1.23ms  min=50.66µs med=97.66µs max=461ms    p(90)=1.38ms   p(95)=3.81ms   p(99.9)=88.85ms 
     http_req_sending...............: avg=73.71µs min=4.92µs  med=9.85µs  max=182.94ms p(90)=18.67µs  p(95)=118.33µs p(99.9)=9.88ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.77ms min=1.89ms  med=80.66ms max=1.34s    p(90)=175.53ms p(95)=203.12ms p(99.9)=545.84ms
     http_reqs......................: 154432  2476.15451/s
     iteration_duration.............: avg=92.95ms min=3.37ms  med=82.61ms max=1.34s    p(90)=177.93ms p(95)=206.26ms p(99.9)=564.95ms
     iterations.....................: 153432  2460.120563/s
     success_rate...................: 100.00% ✓ 153432      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 442329      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=14.5µs  min=871ns   med=2µs     max=54.49ms  p(90)=3.27µs   p(95)=4.23µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=11.83µs min=0s      med=0s      max=54.4ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=95.85ms min=1.98ms  med=82.86ms max=1.48s    p(90)=186.35ms p(95)=215.16ms p(99.9)=653.35ms
       { expected_response:true }...: avg=95.85ms min=1.98ms  med=82.86ms max=1.48s    p(90)=186.35ms p(95)=215.16ms p(99.9)=653.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148443
     http_req_receiving.............: avg=1.8ms   min=51.62µs med=99.57µs max=911.77ms p(90)=1.71ms   p(95)=4.5ms    p(99.9)=146.72ms
     http_req_sending...............: avg=58.07µs min=4.68µs  med=8.69µs  max=194.18ms p(90)=15.75µs  p(95)=98.66µs  p(99.9)=8.52ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.99ms min=1.88ms  med=81.66ms max=1.48s    p(90)=183.6ms  p(95)=209.58ms p(99.9)=644.44ms
     http_reqs......................: 148443  2382.159647/s
     iteration_duration.............: avg=96.76ms min=3.23ms  med=83.92ms max=1.48s    p(90)=187.01ms p(95)=216.03ms p(99.9)=654.29ms
     iterations.....................: 147443  2366.112009/s
     success_rate...................: 100.00% ✓ 147443      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 222189      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=4.84µs   min=962ns   med=2.04µs   max=6.41ms   p(90)=3.61µs   p(95)=4.51µs   p(99.9)=363.17µs
     http_req_connecting............: avg=2.11µs   min=0s      med=0s       max=6.35ms   p(90)=0s       p(95)=0s       p(99.9)=284.34µs
     http_req_duration..............: avg=190.07ms min=1.87ms  med=192.41ms max=534.98ms p(90)=348.03ms p(95)=372.8ms  p(99.9)=467.56ms
       { expected_response:true }...: avg=190.07ms min=1.87ms  med=192.41ms max=534.98ms p(90)=348.03ms p(95)=372.8ms  p(99.9)=467.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75063
     http_req_receiving.............: avg=72.07µs  min=26.39µs med=58.09µs  max=68.37ms  p(90)=94.03µs  p(95)=108.78µs p(99.9)=956.8µs 
     http_req_sending...............: avg=24.89µs  min=4.88µs  med=9.59µs   max=82.83ms  p(90)=15.91µs  p(95)=19.71µs  p(99.9)=2.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.97ms min=1.82ms  med=192.35ms max=534.91ms p(90)=347.9ms  p(95)=372.7ms  p(99.9)=467.5ms 
     http_reqs......................: 75063   1201.359221/s
     iteration_duration.............: avg=192.87ms min=3.47ms  med=195.79ms max=535.14ms p(90)=348.96ms p(95)=373.45ms p(99.9)=468.11ms
     iterations.....................: 74063   1185.354542/s
     success_rate...................: 100.00% ✓ 74063       ✗ 0    
     vus............................: 78      min=0         max=493
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

     checks.........................: 100.00% ✓ 108612     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   695 kB/s
     http_req_blocked...............: avg=7.09µs   min=1.15µs  med=3.26µs   max=3.26ms   p(90)=5.09µs   p(95)=6.15µs   p(99.9)=677.42µs
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=2.22ms   p(90)=0s       p(95)=0s       p(99.9)=595.81µs
     http_req_duration..............: avg=385.42ms min=3.4ms   med=362.39ms max=1.6s     p(90)=755.41ms p(95)=829.38ms p(99.9)=1.19s   
       { expected_response:true }...: avg=385.42ms min=3.4ms   med=362.39ms max=1.6s     p(90)=755.41ms p(95)=829.38ms p(99.9)=1.19s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 37204
     http_req_receiving.............: avg=89.05µs  min=29.27µs med=70.95µs  max=219.99ms p(90)=110.91µs p(95)=126.34µs p(99.9)=851.72µs
     http_req_sending...............: avg=34.99µs  min=5.54µs  med=14.06µs  max=124.09ms p(90)=21.79µs  p(95)=24.98µs  p(99.9)=2.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=385.3ms  min=3.35ms  med=362.26ms max=1.6s     p(90)=755.3ms  p(95)=829.27ms p(99.9)=1.19s   
     http_reqs......................: 37204   579.252581/s
     iteration_duration.............: avg=396.31ms min=22.61ms med=374.6ms  max=1.61s    p(90)=758.99ms p(95)=831.61ms p(99.9)=1.19s   
     iterations.....................: 36204   563.682949/s
     success_rate...................: 100.00% ✓ 36204      ✗ 0    
     vus............................: 67      min=0        max=496
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

     checks.........................: 100.00% ✓ 48663      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=16.09µs  min=1.41µs  med=3.82µs   max=33.96ms  p(90)=5.73µs   p(95)=7.25µs   p(99.9)=2.06ms  
     http_req_connecting............: avg=10.55µs  min=0s      med=0s       max=33.73ms  p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=834.25ms min=5.44ms  med=741.18ms max=15.47s   p(90)=1.48s    p(95)=1.71s    p(99.9)=14.74s  
       { expected_response:true }...: avg=834.25ms min=5.44ms  med=741.18ms max=15.47s   p(90)=1.48s    p(95)=1.71s    p(99.9)=14.74s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17221
     http_req_receiving.............: avg=106.75µs min=38.44µs med=97.26µs  max=36.09ms  p(90)=136.79µs p(95)=152.63µs p(99.9)=896.11µs
     http_req_sending...............: avg=52.43µs  min=6.37µs  med=18.92µs  max=149.67ms p(90)=24.72µs  p(95)=29.25µs  p(99.9)=4.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=834.09ms min=5.36ms  med=740.93ms max=15.47s   p(90)=1.48s    p(95)=1.71s    p(99.9)=14.74s  
     http_reqs......................: 17221   256.68344/s
     iteration_duration.............: avg=885.79ms min=18.81ms med=808ms    max=15.47s   p(90)=1.5s     p(95)=1.74s    p(99.9)=14.75s  
     iterations.....................: 16221   241.778183/s
     success_rate...................: 100.00% ✓ 16221      ✗ 0    
     vus............................: 63      min=0        max=498
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

     checks.........................: 100.00% ✓ 47880      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=13.86µs  min=1.45µs  med=3.52µs   max=15.65ms p(90)=5.25µs   p(95)=6.71µs   p(99.9)=2.02ms
     http_req_connecting............: avg=8.49µs   min=0s      med=0s       max=14.2ms  p(90)=0s       p(95)=0s       p(99.9)=2ms   
     http_req_duration..............: avg=436.08ms min=7.71ms  med=501.06ms max=1.28s   p(90)=744.98ms p(95)=806.57ms p(99.9)=1.13s 
       { expected_response:true }...: avg=436.08ms min=7.71ms  med=501.06ms max=1.28s   p(90)=744.98ms p(95)=806.57ms p(99.9)=1.13s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16960
     http_req_receiving.............: avg=94.99µs  min=35.11µs med=85.52µs  max=18.87ms p(90)=124.87µs p(95)=140.47µs p(99.9)=1.2ms 
     http_req_sending...............: avg=38.39µs  min=6.33µs  med=17.52µs  max=57.27ms p(90)=23.15µs  p(95)=27.2µs   p(99.9)=3.78ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=435.94ms min=7.62ms  med=500.94ms max=1.28s   p(90)=744.68ms p(95)=806.46ms p(99.9)=1.13s 
     http_reqs......................: 16960   231.260819/s
     iteration_duration.............: avg=463.39ms min=10.52ms med=525.42ms max=1.28s   p(90)=752.76ms p(95)=811.56ms p(99.9)=1.15s 
     iterations.....................: 15960   217.625157/s
     success_rate...................: 100.00% ✓ 15960      ✗ 0    
     vus............................: 62      min=0        max=494
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 435171      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=14.7µs  min=881ns  med=2.19µs   max=56.05ms p(90)=3.85µs   p(95)=4.99µs   p(99.9)=1.18ms  
     http_req_connecting............: avg=11.86µs min=0s     med=0s       max=56ms    p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=97.47ms min=1.5ms  med=83.17ms  max=1.33s   p(90)=184.82ms p(95)=211.44ms p(99.9)=910.56ms
       { expected_response:true }...: avg=97.47ms min=1.5ms  med=83.17ms  max=1.33s   p(90)=184.82ms p(95)=211.44ms p(99.9)=910.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146057
     http_req_receiving.............: avg=1.31ms  min=52.4µs med=102.47µs max=1.13s   p(90)=1.54ms   p(95)=3.9ms    p(99.9)=79.54ms 
     http_req_sending...............: avg=58.51µs min=4.77µs med=9.24µs   max=49.31ms p(90)=18.89µs  p(95)=100.84µs p(99.9)=8.12ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.09ms min=1.43ms med=82.05ms  max=1.33s   p(90)=183.16ms p(95)=208.61ms p(99.9)=898.71ms
     http_reqs......................: 146057  2360.967432/s
     iteration_duration.............: avg=98.39ms min=3.02ms med=84.2ms   max=1.33s   p(90)=185.35ms p(95)=212.13ms p(99.9)=912.99ms
     iterations.....................: 145057  2344.802733/s
     success_rate...................: 100.00% ✓ 145057      ✗ 0     
     vus............................: 4       min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 434949      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=13.93µs  min=862ns   med=2.25µs   max=41.93ms  p(90)=4.04µs   p(95)=5.2µs    p(99.9)=1.44ms  
     http_req_connecting............: avg=10.99µs  min=0s      med=0s       max=41.78ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=97.43ms  min=1.48ms  med=92.84ms  max=458.93ms p(90)=185.68ms p(95)=201.4ms  p(99.9)=261.35ms
       { expected_response:true }...: avg=97.43ms  min=1.48ms  med=92.84ms  max=458.93ms p(90)=185.68ms p(95)=201.4ms  p(99.9)=261.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145983
     http_req_receiving.............: avg=807.12µs min=51.84µs med=122.52µs max=302.81ms p(90)=1.66ms   p(95)=2.68ms   p(99.9)=27.73ms 
     http_req_sending...............: avg=59.54µs  min=4.55µs  med=9.29µs   max=157.1ms  p(90)=20.91µs  p(95)=108.59µs p(99.9)=7.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.56ms  min=1.41ms  med=91.94ms  max=458.82ms p(90)=184.8ms  p(95)=200.54ms p(99.9)=259.9ms 
     http_reqs......................: 145983  2360.050012/s
     iteration_duration.............: avg=98.35ms  min=3.15ms  med=93.85ms  max=459.11ms p(90)=186.17ms p(95)=201.8ms  p(99.9)=261.94ms
     iterations.....................: 144983  2343.883403/s
     success_rate...................: 100.00% ✓ 144983      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 412089      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=16.49µs  min=1.04µs  med=2.75µs   max=62.61ms  p(90)=4.42µs   p(95)=5.59µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=12.82µs  min=0s      med=0s       max=62.52ms  p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=102.86ms min=1.52ms  med=88.58ms  max=1.27s    p(90)=191.37ms p(95)=228.5ms  p(99.9)=735.56ms
       { expected_response:true }...: avg=102.86ms min=1.52ms  med=88.58ms  max=1.27s    p(90)=191.37ms p(95)=228.5ms  p(99.9)=735.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138363
     http_req_receiving.............: avg=1.95ms   min=54.68µs med=113.83µs max=786.73ms p(90)=2.11ms   p(95)=6.01ms   p(99.9)=101.03ms
     http_req_sending...............: avg=65.48µs  min=4.79µs  med=10.36µs  max=139.15ms p(90)=19.1µs   p(95)=111.74µs p(99.9)=8.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.84ms min=1.43ms  med=87.27ms  max=1.27s    p(90)=188.82ms p(95)=223.88ms p(99.9)=700.61ms
     http_reqs......................: 138363  2235.171538/s
     iteration_duration.............: avg=103.87ms min=3.22ms  med=89.86ms  max=1.27s    p(90)=192.04ms p(95)=229.56ms p(99.9)=737.13ms
     iterations.....................: 137363  2219.017136/s
     success_rate...................: 100.00% ✓ 137363      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 408519      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=12.08µs  min=981ns   med=2.47µs  max=50.32ms  p(90)=4.22µs   p(95)=5.38µs   p(99.9)=580.88µs
     http_req_connecting............: avg=8.83µs   min=0s      med=0s      max=50.25ms  p(90)=0s       p(95)=0s       p(99.9)=530.16µs
     http_req_duration..............: avg=103.73ms min=1.55ms  med=98.39ms max=325.33ms p(90)=200.05ms p(95)=214.51ms p(99.9)=260.06ms
       { expected_response:true }...: avg=103.73ms min=1.55ms  med=98.39ms max=325.33ms p(90)=200.05ms p(95)=214.51ms p(99.9)=260.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137173
     http_req_receiving.............: avg=109.43µs min=27.05µs med=54.62µs max=49.97ms  p(90)=107.55µs p(95)=296.45µs p(99.9)=8.16ms  
     http_req_sending...............: avg=60.82µs  min=4.84µs  med=10.39µs max=297.65ms p(90)=18.41µs  p(95)=109.94µs p(99.9)=7.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.56ms min=1.48ms  med=98.24ms max=310.13ms p(90)=199.85ms p(95)=214.27ms p(99.9)=259.22ms
     http_reqs......................: 137173  2213.111636/s
     iteration_duration.............: avg=104.73ms min=3.81ms  med=99.58ms max=334.63ms p(90)=200.54ms p(95)=214.93ms p(99.9)=261.37ms
     iterations.....................: 136173  2196.97791/s
     success_rate...................: 100.00% ✓ 136173      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 399003      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=11.77µs  min=841ns   med=2.34µs   max=49.41ms  p(90)=4.26µs   p(95)=5.39µs   p(99.9)=1.09ms  
     http_req_connecting............: avg=8.68µs   min=0s      med=0s       max=49.35ms  p(90)=0s       p(95)=0s       p(99.9)=1.05ms  
     http_req_duration..............: avg=106.22ms min=1.81ms  med=95.28ms  max=1.36s    p(90)=195.84ms p(95)=225.71ms p(99.9)=903.01ms
       { expected_response:true }...: avg=106.22ms min=1.81ms  med=95.28ms  max=1.36s    p(90)=195.84ms p(95)=225.71ms p(99.9)=903.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134001
     http_req_receiving.............: avg=1.5ms    min=49.66µs med=108.28µs max=495.33ms p(90)=1.66ms   p(95)=4.25ms   p(99.9)=107.35ms
     http_req_sending...............: avg=60.38µs  min=4.33µs  med=9.92µs   max=236.21ms p(90)=21.45µs  p(95)=105.18µs p(99.9)=7.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.66ms min=1.72ms  med=94.07ms  max=1.36s    p(90)=193.67ms p(95)=221.75ms p(99.9)=880.33ms
     http_reqs......................: 134001  2151.412542/s
     iteration_duration.............: avg=107.27ms min=3.58ms  med=96.44ms  max=1.36s    p(90)=196.49ms p(95)=226.62ms p(99.9)=906.34ms
     iterations.....................: 133001  2135.357344/s
     success_rate...................: 100.00% ✓ 133001      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 216729      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.52µs   min=1.15µs  med=3.04µs   max=11.42ms  p(90)=4.89µs   p(95)=5.9µs    p(99.9)=538.73µs
     http_req_connecting............: avg=2.79µs   min=0s      med=0s       max=11.29ms  p(90)=0s       p(95)=0s       p(99.9)=479.38µs
     http_req_duration..............: avg=194.77ms min=2.03ms  med=195.84ms max=554.38ms p(90)=359.37ms p(95)=386.13ms p(99.9)=472.88ms
       { expected_response:true }...: avg=194.77ms min=2.03ms  med=195.84ms max=554.38ms p(90)=359.37ms p(95)=386.13ms p(99.9)=472.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73243
     http_req_receiving.............: avg=79.83µs  min=27.57µs med=65.16µs  max=28.43ms  p(90)=106.1µs  p(95)=122.38µs p(99.9)=1.46ms  
     http_req_sending...............: avg=31.63µs  min=5.28µs  med=12.91µs  max=98.15ms  p(90)=20.51µs  p(95)=24.53µs  p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.66ms min=1.95ms  med=195.73ms max=554.27ms p(90)=359.26ms p(95)=385.97ms p(99.9)=472.68ms
     http_reqs......................: 73243   1169.660112/s
     iteration_duration.............: avg=197.72ms min=5.57ms  med=198.9ms  max=554.62ms p(90)=360.3ms  p(95)=386.82ms p(99.9)=473.22ms
     iterations.....................: 72243   1153.69053/s
     success_rate...................: 100.00% ✓ 72243       ✗ 0    
     vus............................: 86      min=0         max=499
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

     checks.........................: 100.00% ✓ 99099      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   631 kB/s
     http_req_blocked...............: avg=7.73µs   min=1.08µs med=2.71µs   max=9.96ms   p(90)=4.45µs   p(95)=5.49µs   p(99.9)=905.1µs 
     http_req_connecting............: avg=4.03µs   min=0s     med=0s       max=9.89ms   p(90)=0s       p(95)=0s       p(99.9)=873.73µs
     http_req_duration..............: avg=421.57ms min=3.75ms med=393.63ms max=2.06s    p(90)=832.27ms p(95)=904.65ms p(99.9)=1.41s   
       { expected_response:true }...: avg=421.57ms min=3.75ms med=393.63ms max=2.06s    p(90)=832.27ms p(95)=904.65ms p(99.9)=1.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34033
     http_req_receiving.............: avg=100.92µs min=29.7µs med=71.19µs  max=76.24ms  p(90)=111.61µs p(95)=126.01µs p(99.9)=2.93ms  
     http_req_sending...............: avg=32.98µs  min=5.35µs med=13.51µs  max=116.61ms p(90)=20.94µs  p(95)=23.83µs  p(99.9)=2.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=421.43ms min=3.65ms med=393.53ms max=2.06s    p(90)=832.16ms p(95)=904.59ms p(99.9)=1.41s   
     http_reqs......................: 34033   525.992259/s
     iteration_duration.............: avg=434.54ms min=7.9ms  med=408.86ms max=2.06s    p(90)=836.01ms p(95)=907.47ms p(99.9)=1.42s   
     iterations.....................: 33033   510.5369/s
     success_rate...................: 100.00% ✓ 33033      ✗ 0    
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

     checks.........................: 100.00% ✓ 47676      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=14.5µs   min=1.07µs  med=3.58µs   max=15.24ms p(90)=5.49µs  p(95)=6.99µs   p(99.9)=2.15ms
     http_req_connecting............: avg=9.28µs   min=0s      med=0s       max=15.17ms p(90)=0s      p(95)=0s       p(99.9)=2.13ms
     http_req_duration..............: avg=860.51ms min=6.08ms  med=772.75ms max=4.46s   p(90)=1.76s   p(95)=1.92s    p(99.9)=3.81s 
       { expected_response:true }...: avg=860.51ms min=6.08ms  med=772.75ms max=4.46s   p(90)=1.76s   p(95)=1.92s    p(99.9)=3.81s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16892
     http_req_receiving.............: avg=109.96µs min=32.15µs med=94.95µs  max=87.33ms p(90)=135.8µs p(95)=152.68µs p(99.9)=1.7ms 
     http_req_sending...............: avg=34.85µs  min=5.58µs  med=18.21µs  max=68.13ms p(90)=24.08µs p(95)=29.14µs  p(99.9)=2.2ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=860.37ms min=5.93ms  med=772.64ms max=4.46s   p(90)=1.76s   p(95)=1.92s    p(99.9)=3.81s 
     http_reqs......................: 16892   248.72914/s
     iteration_duration.............: avg=914.67ms min=38.63ms med=851.4ms  max=4.46s   p(90)=1.78s   p(95)=1.95s    p(99.9)=3.84s 
     iterations.....................: 15892   234.004469/s
     success_rate...................: 100.00% ✓ 15892      ✗ 0    
     vus............................: 24      min=0        max=500
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

     checks.........................: 100.00% ✓ 45120      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=15.98µs  min=1.09µs  med=3.7µs    max=11.83ms  p(90)=5.53µs   p(95)=7.53µs   p(99.9)=2.13ms 
     http_req_connecting............: avg=10.43µs  min=0s      med=0s       max=11.51ms  p(90)=0s       p(95)=0s       p(99.9)=2.1ms  
     http_req_duration..............: avg=905.65ms min=7.92ms  med=825.72ms max=3.21s    p(90)=1.86s    p(95)=1.99s    p(99.9)=2.88s  
       { expected_response:true }...: avg=905.65ms min=7.92ms  med=825.72ms max=3.21s    p(90)=1.86s    p(95)=1.99s    p(99.9)=2.88s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16040
     http_req_receiving.............: avg=317.6µs  min=35.55µs med=93.4µs   max=224.84ms p(90)=134.46µs p(95)=151.82µs p(99.9)=87.62ms
     http_req_sending...............: avg=38.87µs  min=6.17µs  med=17.55µs  max=77.85ms  p(90)=23.61µs  p(95)=28.95µs  p(99.9)=3.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=905.3ms  min=7.83ms  med=825.58ms max=3.21s    p(90)=1.86s    p(95)=1.99s    p(99.9)=2.88s  
     http_reqs......................: 16040   232.809584/s
     iteration_duration.............: avg=965.83ms min=31.47ms med=896.25ms max=3.21s    p(90)=1.87s    p(95)=2.01s    p(99.9)=2.89s  
     iterations.....................: 15040   218.295271/s
     success_rate...................: 100.00% ✓ 15040      ✗ 0    
     vus............................: 13      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

