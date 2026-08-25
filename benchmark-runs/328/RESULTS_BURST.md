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
| hive-router | v0.0.84 | 2,933 | 3,068 | 2,905 | 1.8% |  |
| fusion-nightly-net11 | 16.6.2-p.7 | 2,633 | 2,735 | 2,609 | 1.5% |  |
| fusion-nightly | 16.6.2-p.7 | 2,498 | 2,613 | 2,482 | 1.9% |  |
| fusion | 16.6.1 | 2,484 | 2,614 | 2,425 | 2.3% |  |
| fusion-nightly-fed | 16.6.2-p.7 | 2,368 | 2,458 | 2,358 | 1.4% |  |
| cosmo | 0.334.0 | 1,182 | 1,219 | 1,173 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 559 | 570 | 557 | 0.9% |  |
| hive-gateway | 2.10.8 | 261 | 266 | 260 | 0.8% |  |
| apollo-gateway | 2.14.3 | 234 | 240 | 232 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (11656 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (525361 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.1 | 2,386 | 2,484 | 2,376 | 1.5% |  |
| fusion-nightly-net11 | 16.6.2-p.7 | 2,385 | 2,498 | 2,370 | 1.9% |  |
| fusion-nightly | 16.6.2-p.7 | 2,351 | 2,421 | 2,317 | 1.6% |  |
| hive-router | v0.0.84 | 2,249 | 2,402 | 2,209 | 3.0% |  |
| fusion-nightly-fed | 16.6.2-p.7 | 2,245 | 2,334 | 2,242 | 1.4% |  |
| cosmo | 0.334.0 | 1,179 | 1,213 | 1,171 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 535 | 552 | 530 | 1.5% |  |
| hive-gateway | 2.10.8 | 242 | 250 | 240 | 1.4% |  |
| apollo-gateway | 2.14.3 | 231 | 236 | 230 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (39632 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (314111 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 539964      ✗ 0     
     data_received..................: 16 GB   257 MB/s
     data_sent......................: 217 MB  3.5 MB/s
     http_req_blocked...............: avg=24.11µs  min=841ns   med=2.58µs  max=77.91ms  p(90)=4.36µs   p(95)=5.61µs   p(99.9)=2.55ms  
     http_req_connecting............: avg=20.38µs  min=0s      med=0s      max=77.75ms  p(90)=0s       p(95)=0s       p(99.9)=2.35ms  
     http_req_duration..............: avg=78.46ms  min=1.37ms  med=72.88ms max=334.91ms p(90)=151.26ms p(95)=168.79ms p(99.9)=231.76ms
       { expected_response:true }...: avg=78.46ms  min=1.37ms  med=72.88ms max=334.91ms p(90)=151.26ms p(95)=168.79ms p(99.9)=231.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180988
     http_req_receiving.............: avg=173.79µs min=24.65µs med=51.48µs max=56.96ms  p(90)=169.39µs p(95)=364.19µs p(99.9)=22.1ms  
     http_req_sending...............: avg=85.43µs  min=4.53µs  med=9.93µs  max=209.64ms p(90)=20.3µs   p(95)=128.58µs p(99.9)=13.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.2ms   min=1.31ms  med=72.65ms max=334.27ms p(90)=150.95ms p(95)=168.37ms p(99.9)=229.11ms
     http_reqs......................: 180988  2933.413087/s
     iteration_duration.............: avg=79.19ms  min=2.09ms  med=73.71ms max=358.81ms p(90)=151.72ms p(95)=169.31ms p(99.9)=232.99ms
     iterations.....................: 179988  2917.205311/s
     success_rate...................: 100.00% ✓ 179988      ✗ 0     
     vus............................: 88      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 488916      ✗ 0     
     data_received..................: 14 GB   231 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=18.83µs  min=851ns   med=2.16µs  max=54.54ms  p(90)=3.73µs   p(95)=4.83µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=15.95µs  min=0s      med=0s      max=54.49ms  p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=86.7ms   min=1.88ms  med=82.27ms max=378.29ms p(90)=165.67ms p(95)=182.71ms p(99.9)=241.6ms 
       { expected_response:true }...: avg=86.7ms   min=1.88ms  med=82.27ms max=378.29ms p(90)=165.67ms p(95)=182.71ms p(99.9)=241.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 163972
     http_req_receiving.............: avg=582.04µs min=50.67µs med=99.01µs max=222.85ms p(90)=1.1ms    p(95)=1.97ms   p(99.9)=25.14ms 
     http_req_sending...............: avg=65.37µs  min=4.41µs  med=8.96µs  max=147.43ms p(90)=18.16µs  p(95)=106.77µs p(99.9)=9.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.05ms  min=1.8ms   med=81.6ms  max=378.2ms  p(90)=164.93ms p(95)=182.05ms p(99.9)=240.44ms
     http_reqs......................: 163972  2633.478026/s
     iteration_duration.............: avg=87.47ms  min=3.59ms  med=83.12ms max=378.48ms p(90)=166.12ms p(95)=183.2ms  p(99.9)=241.97ms
     iterations.....................: 162972  2617.417491/s
     success_rate...................: 100.00% ✓ 162972      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 463932      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=22.75µs min=1.05µs  med=2.57µs   max=97.95ms  p(90)=4.09µs   p(95)=5.15µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=19.11µs min=0s      med=0s       max=97.78ms  p(90)=0s       p(95)=0s       p(99.9)=1.56ms  
     http_req_duration..............: avg=91.27ms min=1.91ms  med=79.31ms  max=1.25s    p(90)=173ms    p(95)=201.76ms p(99.9)=680.35ms
       { expected_response:true }...: avg=91.27ms min=1.91ms  med=79.31ms  max=1.25s    p(90)=173ms    p(95)=201.76ms p(99.9)=680.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155644
     http_req_receiving.............: avg=1.37ms  min=53.92µs med=100.88µs max=562.17ms p(90)=1.65ms   p(95)=4.44ms   p(99.9)=90.28ms 
     http_req_sending...............: avg=72.07µs min=4.54µs  med=9.44µs   max=111.44ms p(90)=17.13µs  p(95)=115.06µs p(99.9)=10.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.83ms min=1.84ms  med=77.99ms  max=1.25s    p(90)=171.1ms  p(95)=198.42ms p(99.9)=664.22ms
     http_reqs......................: 155644  2498.155813/s
     iteration_duration.............: avg=92.21ms min=3.36ms  med=80.36ms  max=1.25s    p(90)=173.68ms p(95)=202.93ms p(99.9)=687.05ms
     iterations.....................: 154644  2482.105365/s
     success_rate...................: 100.00% ✓ 154644      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460992      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=12.22µs min=842ns   med=1.97µs  max=70.48ms  p(90)=3.27µs   p(95)=4.23µs   p(99.9)=782.35µs
     http_req_connecting............: avg=9.71µs  min=0s      med=0s      max=70.42ms  p(90)=0s       p(95)=0s       p(99.9)=705.41µs
     http_req_duration..............: avg=91.99ms min=1.93ms  med=80.12ms max=2.23s    p(90)=169.82ms p(95)=193.52ms p(99.9)=913.05ms
       { expected_response:true }...: avg=91.99ms min=1.93ms  med=80.12ms max=2.23s    p(90)=169.82ms p(95)=193.52ms p(99.9)=913.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154664
     http_req_receiving.............: avg=1.74ms  min=50.62µs med=98.26µs max=1.55s    p(90)=1.8ms    p(95)=4.56ms   p(99.9)=130.68ms
     http_req_sending...............: avg=54.14µs min=4.36µs  med=8.34µs  max=169.62ms p(90)=15.11µs  p(95)=92.85µs  p(99.9)=6.88ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.19ms min=1.83ms  med=79.04ms max=2.18s    p(90)=168.02ms p(95)=190.54ms p(99.9)=774.89ms
     http_reqs......................: 154664  2484.386331/s
     iteration_duration.............: avg=92.82ms min=3.29ms  med=80.99ms max=2.23s    p(90)=170.28ms p(95)=194.12ms p(99.9)=917.6ms 
     iterations.....................: 153664  2468.323212/s
     success_rate...................: 100.00% ✓ 153664      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 437880      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.8 MB/s
     http_req_blocked...............: avg=14.33µs min=862ns  med=2.17µs  max=107.38ms p(90)=3.7µs    p(95)=4.76µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=11.4µs  min=0s     med=0s      max=107.33ms p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=96.81ms min=1.61ms med=82.76ms max=1.59s    p(90)=179.46ms p(95)=210.46ms p(99.9)=1.15s   
       { expected_response:true }...: avg=96.81ms min=1.61ms med=82.76ms max=1.59s    p(90)=179.46ms p(95)=210.46ms p(99.9)=1.15s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 146960
     http_req_receiving.............: avg=1.39ms  min=51µs   med=97.23µs max=1.14s    p(90)=1.38ms   p(95)=3.62ms   p(99.9)=111.88ms
     http_req_sending...............: avg=58.7µs  min=4.39µs med=9.15µs  max=111.12ms p(90)=17.29µs  p(95)=98.93µs  p(99.9)=7.92ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.36ms min=1.54ms med=81.75ms max=1.5s     p(90)=177.99ms p(95)=207.31ms p(99.9)=1.04s   
     http_reqs......................: 146960  2368.963042/s
     iteration_duration.............: avg=97.76ms min=2.65ms med=83.81ms max=1.6s     p(90)=180.04ms p(95)=211.26ms p(99.9)=1.15s   
     iterations.....................: 145960  2352.843261/s
     success_rate...................: 100.00% ✓ 145960      ✗ 0     
     vus............................: 58      min=0         max=498 
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

     checks.........................: 100.00% ✓ 218637      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=5.71µs   min=952ns   med=2.42µs   max=15.97ms  p(90)=3.96µs   p(95)=4.79µs   p(99.9)=451.76µs
     http_req_connecting............: avg=2.66µs   min=0s      med=0s       max=15.75ms  p(90)=0s       p(95)=0s       p(99.9)=382.51µs
     http_req_duration..............: avg=193.19ms min=1.89ms  med=192.17ms max=664.17ms p(90)=358.04ms p(95)=383.54ms p(99.9)=578.38ms
       { expected_response:true }...: avg=193.19ms min=1.89ms  med=192.17ms max=664.17ms p(90)=358.04ms p(95)=383.54ms p(99.9)=578.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73879
     http_req_receiving.............: avg=72.55µs  min=26.72µs med=59.13µs  max=74.38ms  p(90)=94.21µs  p(95)=108.39µs p(99.9)=981.28µs
     http_req_sending...............: avg=27.55µs  min=4.66µs  med=10.55µs  max=195.92ms p(90)=16.27µs  p(95)=19.74µs  p(99.9)=3.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.09ms min=1.79ms  med=192.09ms max=664.08ms p(90)=357.89ms p(95)=383.41ms p(99.9)=578.32ms
     http_reqs......................: 73879   1182.878267/s
     iteration_duration.............: avg=196.07ms min=4.66ms  med=195.11ms max=664.33ms p(90)=358.9ms  p(95)=384.27ms p(99.9)=578.74ms
     iterations.....................: 72879   1166.867246/s
     success_rate...................: 100.00% ✓ 72879       ✗ 0    
     vus............................: 77      min=0         max=493
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

     checks.........................: 100.00% ✓ 104667     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   671 kB/s
     http_req_blocked...............: avg=7.93µs   min=1.1µs   med=2.86µs   max=3.81ms p(90)=4.52µs   p(95)=5.48µs   p(99.9)=1.37ms 
     http_req_connecting............: avg=3.91µs   min=0s      med=0s       max=3.34ms p(90)=0s       p(95)=0s       p(99.9)=1.24ms 
     http_req_duration..............: avg=399.52ms min=3.55ms  med=371.5ms  max=1.83s  p(90)=781.67ms p(95)=855.14ms p(99.9)=1.21s  
       { expected_response:true }...: avg=399.52ms min=3.55ms  med=371.5ms  max=1.83s  p(90)=781.67ms p(95)=855.14ms p(99.9)=1.21s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 35889
     http_req_receiving.............: avg=79.97µs  min=29.49µs med=67.65µs  max=18.7ms p(90)=105.19µs p(95)=119.3µs  p(99.9)=986.3µs
     http_req_sending...............: avg=32.52µs  min=5.41µs  med=13.13µs  max=98.9ms p(90)=20.07µs  p(95)=23.14µs  p(99.9)=2.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=399.4ms  min=3.49ms  med=371.39ms max=1.83s  p(90)=781.56ms p(95)=855.05ms p(99.9)=1.21s  
     http_reqs......................: 35889   559.034479/s
     iteration_duration.............: avg=411.22ms min=15.26ms med=384.23ms max=1.83s  p(90)=785.05ms p(95)=857.62ms p(99.9)=1.23s  
     iterations.....................: 34889   543.457715/s
     success_rate...................: 100.00% ✓ 34889      ✗ 0    
     vus............................: 67      min=0        max=496
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

     checks.........................: 100.00% ✓ 49533      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   314 kB/s
     http_req_blocked...............: avg=13.09µs  min=1.13µs  med=3.14µs  max=5.81ms  p(90)=4.93µs   p(95)=6.35µs   p(99.9)=2.01ms
     http_req_connecting............: avg=8.37µs   min=0s      med=0s      max=5.52ms  p(90)=0s       p(95)=0s       p(99.9)=1.99ms
     http_req_duration..............: avg=817.99ms min=5.41ms  med=718ms   max=15.13s  p(90)=1.52s    p(95)=1.69s    p(99.9)=14.28s
       { expected_response:true }...: avg=817.99ms min=5.41ms  med=718ms   max=15.13s  p(90)=1.52s    p(95)=1.69s    p(99.9)=14.28s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17511
     http_req_receiving.............: avg=98.85µs  min=36.17µs med=92.91µs max=10.61ms p(90)=129.89µs p(95)=145.31µs p(99.9)=1.14ms
     http_req_sending...............: avg=29.3µs   min=5.78µs  med=17.57µs max=53.71ms p(90)=23.15µs  p(95)=27.26µs  p(99.9)=2.52ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=817.87ms min=5.34ms  med=717.9ms max=15.13s  p(90)=1.52s    p(95)=1.69s    p(99.9)=14.28s
     http_reqs......................: 17511   261.138894/s
     iteration_duration.............: avg=867.6ms  min=23.54ms med=777ms   max=15.13s  p(90)=1.54s    p(95)=1.7s     p(99.9)=14.32s
     iterations.....................: 16511   246.226045/s
     success_rate...................: 100.00% ✓ 16511      ✗ 0    
     vus............................: 59      min=0        max=499
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

     checks.........................: 100.00% ✓ 48390      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   287 kB/s
     http_req_blocked...............: avg=13.1µs   min=1.16µs  med=3.21µs   max=7.83ms  p(90)=4.92µs   p(95)=6.33µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=8.32µs   min=0s      med=0s       max=7.59ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=363.59ms min=7.56ms  med=410.23ms max=1.05s   p(90)=628.15ms p(95)=688.97ms p(99.9)=944.59ms
       { expected_response:true }...: avg=363.59ms min=7.56ms  med=410.23ms max=1.05s   p(90)=628.15ms p(95)=688.97ms p(99.9)=944.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17130
     http_req_receiving.............: avg=90.67µs  min=30.86µs med=85.37µs  max=3.19ms  p(90)=123.98µs p(95)=139.16µs p(99.9)=956.45µs
     http_req_sending...............: avg=35.26µs  min=5.26µs  med=16.71µs  max=82.97ms p(90)=21.91µs  p(95)=26.49µs  p(99.9)=3.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=363.46ms min=7.43ms  med=410.12ms max=1.05s   p(90)=628.03ms p(95)=688.87ms p(99.9)=944.49ms
     http_reqs......................: 17130   234.247989/s
     iteration_duration.............: avg=386.19ms min=8.18ms  med=428.24ms max=1.06s   p(90)=633.82ms p(95)=690.83ms p(99.9)=956.99ms
     iterations.....................: 16130   220.573267/s
     success_rate...................: 100.00% ✓ 16130      ✗ 0    
     vus............................: 59      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 440265      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=18.96µs min=942ns   med=2.3µs    max=89.32ms  p(90)=4.07µs   p(95)=5.26µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=15.95µs min=0s      med=0s       max=89.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=96.33ms min=1.54ms  med=83.7ms   max=1.24s    p(90)=179.28ms p(95)=208.38ms p(99.9)=773.35ms
       { expected_response:true }...: avg=96.33ms min=1.54ms  med=83.7ms   max=1.24s    p(90)=179.28ms p(95)=208.38ms p(99.9)=773.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147755
     http_req_receiving.............: avg=1.43ms  min=50.75µs med=102.91µs max=828.99ms p(90)=1.51ms   p(95)=3.87ms   p(99.9)=105.78ms
     http_req_sending...............: avg=68.49µs min=4.62µs  med=9.74µs   max=100.57ms p(90)=20.67µs  p(95)=105.77µs p(99.9)=9.26ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.83ms min=1.46ms  med=82.59ms  max=1.24s    p(90)=177.77ms p(95)=206.14ms p(99.9)=714.35ms
     http_reqs......................: 147755  2386.784456/s
     iteration_duration.............: avg=97.25ms min=2.67ms  med=84.85ms  max=1.24s    p(90)=179.86ms p(95)=209.08ms p(99.9)=774.32ms
     iterations.....................: 146755  2370.630793/s
     success_rate...................: 100.00% ✓ 146755      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 439128      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=13.99µs  min=921ns   med=2.2µs    max=42.11ms  p(90)=3.74µs   p(95)=4.85µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=11.12µs  min=0s      med=0s       max=42.08ms  p(90)=0s       p(95)=0s       p(99.9)=1.06ms  
     http_req_duration..............: avg=96.52ms  min=1.46ms  med=91.89ms  max=332.78ms p(90)=184.35ms p(95)=199.8ms  p(99.9)=257.94ms
       { expected_response:true }...: avg=96.52ms  min=1.46ms  med=91.89ms  max=332.78ms p(90)=184.35ms p(95)=199.8ms  p(99.9)=257.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147376
     http_req_receiving.............: avg=719.76µs min=53.26µs med=111.51µs max=251.3ms  p(90)=1.36ms   p(95)=2.39ms   p(99.9)=28.24ms 
     http_req_sending...............: avg=57.19µs  min=4.76µs  med=9.2µs    max=83.9ms   p(90)=18.12µs  p(95)=105.71µs p(99.9)=7.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.74ms  min=1.37ms  med=91.05ms  max=332.69ms p(90)=183.4ms  p(95)=198.8ms  p(99.9)=254.24ms
     http_reqs......................: 147376  2385.113165/s
     iteration_duration.............: avg=97.42ms  min=3.33ms  med=92.93ms  max=339.82ms p(90)=184.76ms p(95)=200.22ms p(99.9)=258.53ms
     iterations.....................: 146376  2368.929301/s
     success_rate...................: 100.00% ✓ 146376      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433839      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=19.09µs min=921ns   med=2.76µs   max=81.2ms   p(90)=4.38µs   p(95)=5.46µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=15.65µs min=0s      med=0s       max=81.02ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=97.73ms min=1.49ms  med=83.87ms  max=1.49s    p(90)=188.54ms p(95)=220.68ms p(99.9)=757.47ms
       { expected_response:true }...: avg=97.73ms min=1.49ms  med=83.87ms  max=1.49s    p(90)=188.54ms p(95)=220.68ms p(99.9)=757.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145613
     http_req_receiving.............: avg=1.67ms  min=52.18µs med=110.77µs max=748.15ms p(90)=1.86ms   p(95)=5.03ms   p(99.9)=115.79ms
     http_req_sending...............: avg=73.55µs min=4.95µs  med=10.44µs  max=179.4ms  p(90)=19.66µs  p(95)=119.41µs p(99.9)=9.51ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.98ms min=1.41ms  med=82.48ms  max=1.49s    p(90)=185.66ms p(95)=216.44ms p(99.9)=737.81ms
     http_reqs......................: 145613  2351.828733/s
     iteration_duration.............: avg=98.68ms min=2.68ms  med=84.97ms  max=1.49s    p(90)=189.18ms p(95)=221.35ms p(99.9)=758.29ms
     iterations.....................: 144613  2335.677505/s
     success_rate...................: 100.00% ✓ 144613      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 415761      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=15.4µs   min=1.12µs  med=3.01µs  max=49.69ms  p(90)=4.84µs   p(95)=6.09µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=11.61µs  min=0s      med=0s      max=49.5ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=101.89ms min=1.68ms  med=96.78ms max=335.71ms p(90)=197.2ms  p(95)=212.4ms  p(99.9)=257.92ms
       { expected_response:true }...: avg=101.89ms min=1.68ms  med=96.78ms max=335.71ms p(90)=197.2ms  p(95)=212.4ms  p(99.9)=257.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139587
     http_req_receiving.............: avg=126.36µs min=25.73µs med=58.45µs max=87.56ms  p(90)=141.74µs p(95)=371.66µs p(99.9)=9.59ms  
     http_req_sending...............: avg=69.08µs  min=5.11µs  med=11.55µs max=158.96ms p(90)=21.76µs  p(95)=131.99µs p(99.9)=8.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.7ms  min=1.63ms  med=96.6ms  max=335.06ms p(90)=197.01ms p(95)=212.15ms p(99.9)=257.05ms
     http_reqs......................: 139587  2249.182894/s
     iteration_duration.............: avg=102.89ms min=3.88ms  med=97.98ms max=356.33ms p(90)=197.72ms p(95)=212.94ms p(99.9)=258.73ms
     iterations.....................: 138587  2233.069768/s
     success_rate...................: 100.00% ✓ 138587      ✗ 0     
     vus............................: 59      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415857      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=20.7µs   min=861ns   med=2.3µs    max=230.05ms p(90)=4.18µs   p(95)=5.38µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=17.41µs  min=0s      med=0s       max=230.01ms p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=101.84ms min=1.79ms  med=85.49ms  max=1.66s    p(90)=191.81ms p(95)=225.03ms p(99.9)=946.34ms
       { expected_response:true }...: avg=101.84ms min=1.79ms  med=85.49ms  max=1.66s    p(90)=191.81ms p(95)=225.03ms p(99.9)=946.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139619
     http_req_receiving.............: avg=2.43ms   min=52.47µs med=107.88µs max=1.33s    p(90)=1.84ms   p(95)=5.02ms   p(99.9)=226.85ms
     http_req_sending...............: avg=67.36µs  min=4.56µs  med=9.78µs   max=181.3ms  p(90)=20.39µs  p(95)=103.71µs p(99.9)=8.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.34ms  min=1.72ms  med=84.54ms  max=1.66s    p(90)=189.69ms p(95)=220.91ms p(99.9)=737.24ms
     http_reqs......................: 139619  2245.118062/s
     iteration_duration.............: avg=102.94ms min=3.5ms   med=86.44ms  max=1.66s    p(90)=192.54ms p(95)=226.23ms p(99.9)=960.2ms 
     iterations.....................: 138619  2229.037743/s
     success_rate...................: 100.00% ✓ 138619      ✗ 0     
     vus............................: 68      min=0         max=496 
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

     checks.........................: 100.00% ✓ 218244      ✗ 0    
     data_received..................: 6.5 GB  103 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=9.59µs   min=931ns   med=2.52µs   max=284.84ms p(90)=4.41µs   p(95)=5.39µs   p(99.9)=489.87µs
     http_req_connecting............: avg=2.5µs    min=0s      med=0s       max=11.86ms  p(90)=0s       p(95)=0s       p(99.9)=428.59µs
     http_req_duration..............: avg=193.46ms min=1.9ms   med=195.29ms max=506.14ms p(90)=356.67ms p(95)=381.7ms  p(99.9)=460.58ms
       { expected_response:true }...: avg=193.46ms min=1.9ms   med=195.29ms max=506.14ms p(90)=356.67ms p(95)=381.7ms  p(99.9)=460.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73748
     http_req_receiving.............: avg=76.73µs  min=26.63µs med=62.2µs   max=202.43ms p(90)=102.16µs p(95)=116.62µs p(99.9)=845.26µs
     http_req_sending...............: avg=31.59µs  min=4.65µs  med=11.53µs  max=135.91ms p(90)=19.67µs  p(95)=23.16µs  p(99.9)=2.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.35ms min=1.8ms   med=195.2ms  max=506.07ms p(90)=356.57ms p(95)=381.61ms p(99.9)=460.3ms 
     http_reqs......................: 73748   1179.374775/s
     iteration_duration.............: avg=196.37ms min=4.73ms  med=198.35ms max=506.28ms p(90)=357.49ms p(95)=382.31ms p(99.9)=461.27ms
     iterations.....................: 72748   1163.382819/s
     success_rate...................: 100.00% ✓ 72748       ✗ 0    
     vus............................: 81      min=0         max=494
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

     checks.........................: 100.00% ✓ 100944     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   643 kB/s
     http_req_blocked...............: avg=9.39µs   min=1.11µs  med=3.24µs   max=5.58ms   p(90)=5.08µs   p(95)=6.24µs   p(99.9)=1.55ms
     http_req_connecting............: avg=5.17µs   min=0s      med=0s       max=5.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.51ms
     http_req_duration..............: avg=414.09ms min=3.82ms  med=385.8ms  max=1.61s    p(90)=815.07ms p(95)=893.84ms p(99.9)=1.32s 
       { expected_response:true }...: avg=414.09ms min=3.82ms  med=385.8ms  max=1.61s    p(90)=815.07ms p(95)=893.84ms p(99.9)=1.32s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34648
     http_req_receiving.............: avg=90.46µs  min=29.52µs med=76.53µs  max=77.77ms  p(90)=116.72µs p(95)=132.56µs p(99.9)=1.04ms
     http_req_sending...............: avg=37.28µs  min=5.45µs  med=15.15µs  max=189.62ms p(90)=22.39µs  p(95)=25.7µs   p(99.9)=2.24ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=413.96ms min=3.71ms  med=385.69ms max=1.61s    p(90)=814.98ms p(95)=893.74ms p(99.9)=1.32s 
     http_reqs......................: 34648   535.264056/s
     iteration_duration.............: avg=426.64ms min=11.99ms med=401.04ms max=1.61s    p(90)=819.07ms p(95)=897.73ms p(99.9)=1.32s 
     iterations.....................: 33648   519.815428/s
     success_rate...................: 100.00% ✓ 33648      ✗ 0    
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

     checks.........................: 100.00% ✓ 46404      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   291 kB/s
     http_req_blocked...............: avg=15.68µs  min=1.29µs  med=3.8µs    max=8.58ms   p(90)=5.73µs   p(95)=7.55µs   p(99.9)=2.35ms
     http_req_connecting............: avg=10.05µs  min=0s      med=0s       max=8.51ms   p(90)=0s       p(95)=0s       p(99.9)=2.33ms
     http_req_duration..............: avg=884.24ms min=5.95ms  med=812.1ms  max=4.8s     p(90)=1.76s    p(95)=1.97s    p(99.9)=4.11s 
       { expected_response:true }...: avg=884.24ms min=5.95ms  med=812.1ms  max=4.8s     p(90)=1.76s    p(95)=1.97s    p(99.9)=4.11s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16468
     http_req_receiving.............: avg=103.53µs min=34.97µs med=95.12µs  max=33.76ms  p(90)=133.93µs p(95)=149.99µs p(99.9)=1.12ms
     http_req_sending...............: avg=42.43µs  min=6.45µs  med=19.29µs  max=109.97ms p(90)=25.29µs  p(95)=30.59µs  p(99.9)=4.39ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=884.09ms min=5.82ms  med=811.99ms max=4.8s     p(90)=1.76s    p(95)=1.97s    p(99.9)=4.11s 
     http_reqs......................: 16468   242.397364/s
     iteration_duration.............: avg=941.47ms min=24.46ms med=878.56ms max=4.8s     p(90)=1.78s    p(95)=1.99s    p(99.9)=4.14s 
     iterations.....................: 15468   227.678068/s
     success_rate...................: 100.00% ✓ 15468      ✗ 0    
     vus............................: 17      min=0        max=500
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

     checks.........................: 100.00% ✓ 44793      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=14.27µs  min=1.27µs  med=3.66µs   max=4.13ms  p(90)=5.49µs   p(95)=7.24µs   p(99.9)=2.26ms
     http_req_connecting............: avg=8.54µs   min=0s      med=0s       max=3.22ms  p(90)=0s       p(95)=0s       p(99.9)=2.17ms
     http_req_duration..............: avg=912.7ms  min=7.9ms   med=825.14ms max=3.18s   p(90)=1.85s    p(95)=2s       p(99.9)=2.94s 
       { expected_response:true }...: avg=912.7ms  min=7.9ms   med=825.14ms max=3.18s   p(90)=1.85s    p(95)=2s       p(99.9)=2.94s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15931
     http_req_receiving.............: avg=104.68µs min=33.09µs med=91.85µs  max=53.05ms p(90)=133.43µs p(95)=150.97µs p(99.9)=1.28ms
     http_req_sending...............: avg=38.14µs  min=5.9µs   med=18.43µs  max=94.3ms  p(90)=24.38µs  p(95)=29.28µs  p(99.9)=2.48ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=912.55ms min=7.77ms  med=825.04ms max=3.18s   p(90)=1.85s    p(95)=2s       p(99.9)=2.94s 
     http_reqs......................: 15931   231.040473/s
     iteration_duration.............: avg=973.77ms min=28.31ms med=901.41ms max=3.19s   p(90)=1.87s    p(95)=2.02s    p(99.9)=2.95s 
     iterations.....................: 14931   216.537901/s
     success_rate...................: 100.00% ✓ 14931      ✗ 0    
     vus............................: 34      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

