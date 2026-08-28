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
| hive-router | v0.0.84 | 2,750 | 2,918 | 2,660 | 3.0% |  |
| fusion-nightly-net11 | 16.6.2-p.8 | 2,677 | 2,770 | 2,655 | 1.4% |  |
| fusion-nightly | 16.6.2-p.8 | 2,499 | 2,600 | 2,472 | 1.6% |  |
| fusion | 16.6.1 | 2,456 | 2,551 | 2,442 | 1.6% |  |
| fusion-nightly-fed | 16.6.2-p.8 | 2,317 | 2,403 | 2,302 | 1.4% |  |
| cosmo | 0.334.0 | 1,233 | 1,279 | 1,228 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 559 | 571 | 557 | 0.8% |  |
| hive-gateway | 2.10.8 | 259 | 264 | 257 | 0.9% |  |
| apollo-gateway | 2.14.3 | 233 | 240 | 229 | 1.3% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (5044 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (480066 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.8 | 2,498 | 2,586 | 2,481 | 1.4% |  |
| fusion-nightly | 16.6.2-p.8 | 2,377 | 2,483 | 2,282 | 2.6% |  |
| hive-router | v0.0.84 | 2,293 | 2,416 | 2,227 | 2.6% |  |
| fusion | 16.6.1 | 2,276 | 2,394 | 2,270 | 1.8% |  |
| fusion-nightly-fed | 16.6.2-p.8 | 2,237 | 2,330 | 2,227 | 1.6% |  |
| cosmo | 0.334.0 | 1,166 | 1,203 | 1,158 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 527 | 539 | 525 | 0.9% |  |
| hive-gateway | 2.10.8 | 239 | 245 | 238 | 1.0% |  |
| apollo-gateway | 2.14.3 | 235 | 240 | 234 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (31075 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (325218 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 506043      ✗ 0     
     data_received..................: 15 GB   241 MB/s
     data_sent......................: 204 MB  3.3 MB/s
     http_req_blocked...............: avg=15.33µs  min=831ns   med=2.16µs  max=67.34ms  p(90)=3.78µs   p(95)=4.92µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=12.46µs  min=0s      med=0s      max=67.26ms  p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=83.78ms  min=1.43ms  med=78.55ms max=306.64ms p(90)=160.5ms  p(95)=174.51ms p(99.9)=228.77ms
       { expected_response:true }...: avg=83.78ms  min=1.43ms  med=78.55ms max=306.64ms p(90)=160.5ms  p(95)=174.51ms p(99.9)=228.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 169681
     http_req_receiving.............: avg=130.24µs min=25.36µs med=50.14µs max=49.44ms  p(90)=133.94µs p(95)=328.59µs p(99.9)=13.81ms 
     http_req_sending...............: avg=66.66µs  min=4.61µs  med=9.15µs  max=129.27ms p(90)=18.13µs  p(95)=113.47µs p(99.9)=8.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.58ms  min=1.38ms  med=78.35ms max=306.11ms p(90)=160.26ms p(95)=174.2ms  p(99.9)=227.99ms
     http_reqs......................: 169681  2750.99569/s
     iteration_duration.............: avg=84.51ms  min=2.42ms  med=79.39ms max=333.45ms p(90)=160.91ms p(95)=174.94ms p(99.9)=230.45ms
     iterations.....................: 168681  2734.782939/s
     success_rate...................: 100.00% ✓ 168681      ✗ 0     
     vus............................: 87      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 496962      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=22.41µs  min=971ns   med=2.62µs   max=75.12ms  p(90)=4.24µs   p(95)=5.42µs   p(99.9)=2.89ms  
     http_req_connecting............: avg=18.62µs  min=0s      med=0s       max=65.79ms  p(90)=0s       p(95)=0s       p(99.9)=2.82ms  
     http_req_duration..............: avg=85.27ms  min=1.88ms  med=80.07ms  max=346.28ms p(90)=163.85ms p(95)=181.29ms p(99.9)=240.45ms
       { expected_response:true }...: avg=85.27ms  min=1.88ms  med=80.07ms  max=346.28ms p(90)=163.85ms p(95)=181.29ms p(99.9)=240.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166654
     http_req_receiving.............: avg=573.65µs min=52.93µs med=102.04µs max=198.48ms p(90)=1.08ms   p(95)=1.94ms   p(99.9)=24.74ms 
     http_req_sending...............: avg=75.42µs  min=4.51µs  med=9.79µs   max=270.33ms p(90)=19.62µs  p(95)=122.86µs p(99.9)=10.02ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.62ms  min=1.79ms  med=79.41ms  max=345.69ms p(90)=163.2ms  p(95)=180.44ms p(99.9)=238.77ms
     http_reqs......................: 166654  2677.258059/s
     iteration_duration.............: avg=86.05ms  min=3.64ms  med=80.89ms  max=362.95ms p(90)=164.33ms p(95)=181.79ms p(99.9)=241.26ms
     iterations.....................: 165654  2661.19329/s
     success_rate...................: 100.00% ✓ 165654      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 464226      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=14.62µs min=911ns   med=2.08µs  max=57.08ms  p(90)=3.48µs   p(95)=4.54µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=11.67µs min=0s      med=0s      max=56.87ms  p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=91.33ms min=1.95ms  med=81.35ms max=1.17s    p(90)=176.55ms p(95)=202.84ms p(99.9)=556.88ms
       { expected_response:true }...: avg=91.33ms min=1.95ms  med=81.35ms max=1.17s    p(90)=176.55ms p(95)=202.84ms p(99.9)=556.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155742
     http_req_receiving.............: avg=1.45ms  min=52.38µs med=98.08µs max=689.59ms p(90)=1.79ms   p(95)=4.8ms    p(99.9)=98.06ms 
     http_req_sending...............: avg=63.22µs min=4.5µs   med=8.82µs  max=131.36ms p(90)=15.8µs   p(95)=98.53µs  p(99.9)=8.88ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.81ms min=1.87ms  med=80.28ms max=1.17s    p(90)=174.26ms p(95)=199.11ms p(99.9)=555.81ms
     http_reqs......................: 155742  2499.375487/s
     iteration_duration.............: avg=92.17ms min=3.54ms  med=82.27ms max=1.17s    p(90)=177.06ms p(95)=203.52ms p(99.9)=558.38ms
     iterations.....................: 154742  2483.327308/s
     success_rate...................: 100.00% ✓ 154742      ✗ 0     
     vus............................: 72      min=0         max=495 
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

     checks.........................: 100.00% ✓ 456792      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=14.11µs min=851ns   med=1.98µs  max=49.82ms  p(90)=3.31µs   p(95)=4.3µs    p(99.9)=1.17ms  
     http_req_connecting............: avg=11.43µs min=0s      med=0s      max=49.64ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=92.82ms min=1.96ms  med=83.04ms max=1.29s    p(90)=174.44ms p(95)=198.05ms p(99.9)=632.02ms
       { expected_response:true }...: avg=92.82ms min=1.96ms  med=83.04ms max=1.29s    p(90)=174.44ms p(95)=198.05ms p(99.9)=632.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153264
     http_req_receiving.............: avg=1.34ms  min=50.33µs med=98.85µs max=846.53ms p(90)=1.73ms   p(95)=4.44ms   p(99.9)=80.25ms 
     http_req_sending...............: avg=60.55µs min=4.54µs  med=8.68µs  max=178.95ms p(90)=16.09µs  p(95)=95.6µs   p(99.9)=8.33ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.41ms min=1.86ms  med=81.82ms max=1.29s    p(90)=172.52ms p(95)=195ms    p(99.9)=623.26ms
     http_reqs......................: 153264  2456.757343/s
     iteration_duration.............: avg=93.67ms min=3.46ms  med=84.03ms max=1.29s    p(90)=174.95ms p(95)=198.76ms p(99.9)=632.44ms
     iterations.....................: 152264  2440.727764/s
     success_rate...................: 100.00% ✓ 152264      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428163      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=16.84µs min=882ns   med=2.57µs   max=89.61ms  p(90)=4.08µs   p(95)=5.09µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=13.39µs min=0s      med=0s       max=89.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=98.95ms min=1.62ms  med=82.79ms  max=1.52s    p(90)=188.13ms p(95)=225.85ms p(99.9)=986.67ms
       { expected_response:true }...: avg=98.95ms min=1.62ms  med=82.79ms  max=1.52s    p(90)=188.13ms p(95)=225.85ms p(99.9)=986.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143721
     http_req_receiving.............: avg=1.66ms  min=51.92µs med=108.38µs max=1.27s    p(90)=1.87ms   p(95)=5.21ms   p(99.9)=108.16ms
     http_req_sending...............: avg=64.75µs min=4.61µs  med=10.1µs   max=107.54ms p(90)=18.3µs   p(95)=111.96µs p(99.9)=8.53ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.22ms min=1.54ms  med=81.79ms  max=1.52s    p(90)=185.64ms p(95)=220.77ms p(99.9)=964.56ms
     http_reqs......................: 143721  2317.426336/s
     iteration_duration.............: avg=99.97ms min=2.43ms  med=83.69ms  max=1.55s    p(90)=189.06ms p(95)=227.21ms p(99.9)=987.98ms
     iterations.....................: 142721  2301.301856/s
     success_rate...................: 100.00% ✓ 142721      ✗ 0     
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

     checks.........................: 100.00% ✓ 228285      ✗ 0    
     data_received..................: 6.8 GB  108 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=4.99µs   min=1.01µs  med=2.48µs   max=9ms      p(90)=4.2µs    p(95)=5.13µs   p(99.9)=432.86µs
     http_req_connecting............: avg=1.84µs   min=0s      med=0s       max=8.85ms   p(90)=0s       p(95)=0s       p(99.9)=351.11µs
     http_req_duration..............: avg=185.06ms min=1.94ms  med=187.28ms max=509.71ms p(90)=343.86ms p(95)=368.43ms p(99.9)=440.01ms
       { expected_response:true }...: avg=185.06ms min=1.94ms  med=187.28ms max=509.71ms p(90)=343.86ms p(95)=368.43ms p(99.9)=440.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77095
     http_req_receiving.............: avg=74.29µs  min=26.64µs med=59.42µs  max=42.79ms  p(90)=96.74µs  p(95)=111.37µs p(99.9)=1.38ms  
     http_req_sending...............: avg=31.39µs  min=4.92µs  med=10.5µs   max=153.71ms p(90)=17.4µs   p(95)=21.43µs  p(99.9)=3.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.95ms min=1.89ms  med=187.18ms max=509.64ms p(90)=343.76ms p(95)=368.36ms p(99.9)=439.95ms
     http_reqs......................: 77095   1233.701543/s
     iteration_duration.............: avg=187.72ms min=3.85ms  med=190.07ms max=509.86ms p(90)=344.63ms p(95)=369.08ms p(99.9)=440.62ms
     iterations.....................: 76095   1217.699188/s
     success_rate...................: 100.00% ✓ 76095       ✗ 0    
     vus............................: 79      min=0         max=493
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

     checks.........................: 100.00% ✓ 104841     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   671 kB/s
     http_req_blocked...............: avg=8.36µs   min=1.03µs  med=2.66µs   max=12.98ms  p(90)=4.39µs   p(95)=5.33µs   p(99.9)=1.36ms
     http_req_connecting............: avg=4.68µs   min=0s      med=0s       max=12.92ms  p(90)=0s       p(95)=0s       p(99.9)=1.34ms
     http_req_duration..............: avg=399.06ms min=3.58ms  med=373.6ms  max=1.69s    p(90)=777.63ms p(95)=851.3ms  p(99.9)=1.21s 
       { expected_response:true }...: avg=399.06ms min=3.58ms  med=373.6ms  max=1.69s    p(90)=777.63ms p(95)=851.3ms  p(99.9)=1.21s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35947
     http_req_receiving.............: avg=84.29µs  min=29.03µs med=66.62µs  max=82.48ms  p(90)=105.62µs p(95)=120.19µs p(99.9)=1.26ms
     http_req_sending...............: avg=33.73µs  min=5.14µs  med=12.58µs  max=129.81ms p(90)=19.73µs  p(95)=22.85µs  p(99.9)=2.91ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=398.94ms min=3.52ms  med=373.47ms max=1.69s    p(90)=777.55ms p(95)=851.21ms p(99.9)=1.21s 
     http_reqs......................: 35947   559.131956/s
     iteration_duration.............: avg=410.71ms min=30.03ms med=387.38ms max=1.7s     p(90)=781.07ms p(95)=854.54ms p(99.9)=1.21s 
     iterations.....................: 34947   543.577614/s
     success_rate...................: 100.00% ✓ 34947      ✗ 0    
     vus............................: 71      min=0        max=495
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

     checks.........................: 100.00% ✓ 49494      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   312 kB/s
     http_req_blocked...............: avg=14.27µs  min=1.09µs  med=3.33µs   max=22.45ms p(90)=5.19µs   p(95)=6.49µs   p(99.9)=2.12ms
     http_req_connecting............: avg=9.4µs    min=0s      med=0s       max=22.39ms p(90)=0s       p(95)=0s       p(99.9)=2.1ms 
     http_req_duration..............: avg=817.8ms  min=5.66ms  med=726.53ms max=14.81s  p(90)=1.48s    p(95)=1.66s    p(99.9)=13.67s
       { expected_response:true }...: avg=817.8ms  min=5.66ms  med=726.53ms max=14.81s  p(90)=1.48s    p(95)=1.66s    p(99.9)=13.67s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17498
     http_req_receiving.............: avg=97.71µs  min=31.03µs med=89.68µs  max=42.63ms p(90)=126.93µs p(95)=142.84µs p(99.9)=1.06ms
     http_req_sending...............: avg=28.39µs  min=5.93µs  med=17.73µs  max=16.41ms p(90)=23.78µs  p(95)=27.95µs  p(99.9)=2.4ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=817.67ms min=5.51ms  med=726.41ms max=14.81s  p(90)=1.48s    p(95)=1.66s    p(99.9)=13.67s
     http_reqs......................: 17498   259.551081/s
     iteration_duration.............: avg=867.39ms min=58.87ms med=784.45ms max=14.81s  p(90)=1.5s     p(95)=1.67s    p(99.9)=13.71s
     iterations.....................: 16498   244.717896/s
     success_rate...................: 100.00% ✓ 16498      ✗ 0    
     vus............................: 79      min=0        max=500
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

     checks.........................: 100.00% ✓ 48201      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   286 kB/s
     http_req_blocked...............: avg=15.85µs  min=1.36µs  med=3.54µs   max=20.66ms p(90)=5.27µs   p(95)=6.76µs   p(99.9)=2.27ms  
     http_req_connecting............: avg=10.63µs  min=0s      med=0s       max=20.59ms p(90)=0s       p(95)=0s       p(99.9)=2.24ms  
     http_req_duration..............: avg=419.58ms min=7.5ms   med=441.24ms max=1.25s   p(90)=770.28ms p(95)=811.87ms p(99.9)=1.14s   
       { expected_response:true }...: avg=419.58ms min=7.5ms   med=441.24ms max=1.25s   p(90)=770.28ms p(95)=811.87ms p(99.9)=1.14s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 17067
     http_req_receiving.............: avg=93.65µs  min=37.92µs med=86.39µs  max=3.9ms   p(90)=125.94µs p(95)=141.03µs p(99.9)=925.72µs
     http_req_sending...............: avg=31.6µs   min=6.01µs  med=17.32µs  max=61.1ms  p(90)=22.85µs  p(95)=27.48µs  p(99.9)=2.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=419.45ms min=7.33ms  med=441.13ms max=1.25s   p(90)=770.07ms p(95)=811.73ms p(99.9)=1.14s   
     http_reqs......................: 17067   233.504383/s
     iteration_duration.............: avg=445.75ms min=17.65ms med=458.52ms max=1.25s   p(90)=774.74ms p(95)=817.06ms p(99.9)=1.15s   
     iterations.....................: 16067   219.822753/s
     success_rate...................: 100.00% ✓ 16067      ✗ 0    
     vus............................: 50      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460044      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=16.3µs   min=872ns   med=2.21µs   max=51ms     p(90)=3.95µs   p(95)=5.1µs    p(99.9)=1.92ms  
     http_req_connecting............: avg=13.19µs  min=0s      med=0s       max=50.93ms  p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=92.12ms  min=1.43ms  med=87.16ms  max=431.06ms p(90)=176.27ms p(95)=191.64ms p(99.9)=251.68ms
       { expected_response:true }...: avg=92.12ms  min=1.43ms  med=87.16ms  max=431.06ms p(90)=176.27ms p(95)=191.64ms p(99.9)=251.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154348
     http_req_receiving.............: avg=637.54µs min=50.63µs med=103.91µs max=71.88ms  p(90)=1.22ms   p(95)=2.2ms    p(99.9)=26.59ms 
     http_req_sending...............: avg=59.59µs  min=4.64µs  med=9.31µs   max=69.44ms  p(90)=20.87µs  p(95)=111.19µs p(99.9)=8.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.42ms  min=1.32ms  med=86.43ms  max=430.96ms p(90)=175.5ms  p(95)=190.81ms p(99.9)=250.02ms
     http_reqs......................: 154348  2498.823653/s
     iteration_duration.............: avg=92.98ms  min=2.56ms  med=88.12ms  max=431.26ms p(90)=176.68ms p(95)=192.06ms p(99.9)=256ms   
     iterations.....................: 153348  2482.63411/s
     success_rate...................: 100.00% ✓ 153348      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438747      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=16.87µs min=881ns   med=2.31µs   max=50.26ms  p(90)=4.06µs   p(95)=5.21µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=13.83µs min=0s      med=0s       max=50.21ms  p(90)=0s       p(95)=0s       p(99.9)=1.92ms  
     http_req_duration..............: avg=96.62ms min=1.55ms  med=83.89ms  max=1s       p(90)=183.33ms p(95)=210.69ms p(99.9)=639.34ms
       { expected_response:true }...: avg=96.62ms min=1.55ms  med=83.89ms  max=1s       p(90)=183.33ms p(95)=210.69ms p(99.9)=639.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147249
     http_req_receiving.............: avg=1.36ms  min=52.28µs med=104.56µs max=569.71ms p(90)=1.69ms   p(95)=4.22ms   p(99.9)=87.78ms 
     http_req_sending...............: avg=65.22µs min=4.78µs  med=9.49µs   max=210.06ms p(90)=19.78µs  p(95)=108.29µs p(99.9)=8.44ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.19ms min=1.47ms  med=82.9ms   max=999.69ms p(90)=181.22ms p(95)=206.68ms p(99.9)=629.06ms
     http_reqs......................: 147249  2377.902434/s
     iteration_duration.............: avg=97.55ms min=3.02ms  med=84.92ms  max=1s       p(90)=183.92ms p(95)=211.33ms p(99.9)=639.73ms
     iterations.....................: 146249  2361.753581/s
     success_rate...................: 100.00% ✓ 146249      ✗ 0     
     vus............................: 57      min=0         max=499 
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

     checks.........................: 100.00% ✓ 423744      ✗ 0     
     data_received..................: 12 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=19.47µs  min=911ns   med=2.4µs   max=226.65ms p(90)=4.15µs   p(95)=5.38µs   p(99.9)=992.26µs
     http_req_connecting............: avg=15.8µs   min=0s      med=0s      max=226.14ms p(90)=0s       p(95)=0s       p(99.9)=881.3µs 
     http_req_duration..............: avg=100.01ms min=1.49ms  med=94.45ms max=303.74ms p(90)=194.62ms p(95)=211.97ms p(99.9)=256.81ms
       { expected_response:true }...: avg=100.01ms min=1.49ms  med=94.45ms max=303.74ms p(90)=194.62ms p(95)=211.97ms p(99.9)=256.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142248
     http_req_receiving.............: avg=114.72µs min=27.62µs med=55.82µs max=53.56ms  p(90)=114.57µs p(95)=313.5µs  p(99.9)=9.22ms  
     http_req_sending...............: avg=61.67µs  min=4.88µs  med=10.23µs max=107.9ms  p(90)=19.86µs  p(95)=112.15µs p(99.9)=8.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.83ms  min=1.44ms  med=94.28ms max=293.65ms p(90)=194.35ms p(95)=211.76ms p(99.9)=256.48ms
     http_reqs......................: 142248  2293.659666/s
     iteration_duration.............: avg=100.96ms min=3.62ms  med=95.49ms max=329.78ms p(90)=195.13ms p(95)=212.42ms p(99.9)=257.93ms
     iterations.....................: 141248  2277.535294/s
     success_rate...................: 100.00% ✓ 141248      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 420069      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=14.03µs  min=842ns   med=2.15µs   max=73.93ms  p(90)=3.71µs   p(95)=4.81µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=11.21µs  min=0s      med=0s       max=73.86ms  p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=100.94ms min=1.53ms  med=85.54ms  max=1.31s    p(90)=188.81ms p(95)=219.48ms p(99.9)=831.23ms
       { expected_response:true }...: avg=100.94ms min=1.53ms  med=85.54ms  max=1.31s    p(90)=188.81ms p(95)=219.48ms p(99.9)=831.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141023
     http_req_receiving.............: avg=2.19ms   min=52.49µs med=110.97µs max=765.27ms p(90)=2.09ms   p(95)=5.47ms   p(99.9)=235.24ms
     http_req_sending...............: avg=58.32µs  min=4.51µs  med=9.1µs    max=201.08ms p(90)=18.04µs  p(95)=98.78µs  p(99.9)=7.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.68ms  min=1.46ms  med=84.25ms  max=1.31s    p(90)=185.96ms p(95)=214.33ms p(99.9)=770.11ms
     http_reqs......................: 141023  2276.879982/s
     iteration_duration.............: avg=101.91ms min=3ms     med=86.55ms  max=1.32s    p(90)=189.35ms p(95)=220.19ms p(99.9)=832.27ms
     iterations.....................: 140023  2260.734531/s
     success_rate...................: 100.00% ✓ 140023      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 414789      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=20.86µs  min=1.1µs   med=3.12µs   max=92.18ms p(90)=5.09µs   p(95)=6.33µs   p(99.9)=2.21ms  
     http_req_connecting............: avg=17.01µs  min=0s      med=0s       max=92.13ms p(90)=0s       p(95)=0s       p(99.9)=2.17ms  
     http_req_duration..............: avg=102.1ms  min=1.8ms   med=88.24ms  max=1.63s   p(90)=193.75ms p(95)=226.16ms p(99.9)=894.27ms
       { expected_response:true }...: avg=102.1ms  min=1.8ms   med=88.24ms  max=1.63s   p(90)=193.75ms p(95)=226.16ms p(99.9)=894.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139263
     http_req_receiving.............: avg=1.47ms   min=54.04µs med=111.68µs max=1.27s   p(90)=1.59ms   p(95)=4.22ms   p(99.9)=89.25ms 
     http_req_sending...............: avg=74.64µs  min=5.23µs  med=11.74µs  max=52.82ms p(90)=22.9µs   p(95)=128.38µs p(99.9)=10.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.55ms min=1.73ms  med=87.01ms  max=1.62s   p(90)=192.15ms p(95)=223.2ms  p(99.9)=855.54ms
     http_reqs......................: 139263  2237.416772/s
     iteration_duration.............: avg=103.17ms min=3.37ms  med=89.45ms  max=1.63s   p(90)=194.45ms p(95)=227.21ms p(99.9)=895.03ms
     iterations.....................: 138263  2221.350647/s
     success_rate...................: 100.00% ✓ 138263      ✗ 0     
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

     checks.........................: 100.00% ✓ 216039      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.92µs   min=982ns   med=2.51µs   max=9.38ms   p(90)=4.35µs   p(95)=5.34µs   p(99.9)=587.54µs
     http_req_connecting............: avg=2.64µs   min=0s      med=0s       max=8.51ms   p(90)=0s       p(95)=0s       p(99.9)=500.68µs
     http_req_duration..............: avg=195.38ms min=1.97ms  med=197.37ms max=507.48ms p(90)=359.92ms p(95)=385.89ms p(99.9)=456.89ms
       { expected_response:true }...: avg=195.38ms min=1.97ms  med=197.37ms max=507.48ms p(90)=359.92ms p(95)=385.89ms p(99.9)=456.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73013
     http_req_receiving.............: avg=74.09µs  min=26.93µs med=63.02µs  max=11.43ms  p(90)=103.55µs p(95)=118.93µs p(99.9)=979.95µs
     http_req_sending...............: avg=27.24µs  min=5.15µs  med=11.73µs  max=168.88ms p(90)=19.64µs  p(95)=23.11µs  p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.28ms min=1.83ms  med=197.26ms max=507.37ms p(90)=359.84ms p(95)=385.8ms  p(99.9)=456.78ms
     http_reqs......................: 73013   1166.185577/s
     iteration_duration.............: avg=198.33ms min=5.64ms  med=200.57ms max=507.76ms p(90)=360.86ms p(95)=386.6ms  p(99.9)=457.26ms
     iterations.....................: 72013   1150.213277/s
     success_rate...................: 100.00% ✓ 72013       ✗ 0    
     vus............................: 84      min=0         max=496
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

     checks.........................: 100.00% ✓ 99378      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   634 kB/s
     http_req_blocked...............: avg=8.02µs   min=1.13µs  med=3.16µs   max=6.36ms  p(90)=4.93µs   p(95)=6.06µs   p(99.9)=829.03µs
     http_req_connecting............: avg=3.81µs   min=0s      med=0s       max=6.16ms  p(90)=0s       p(95)=0s       p(99.9)=763.14µs
     http_req_duration..............: avg=420.63ms min=3.81ms  med=392.57ms max=1.81s   p(90)=832ms    p(95)=899.15ms p(99.9)=1.32s   
       { expected_response:true }...: avg=420.63ms min=3.81ms  med=392.57ms max=1.81s   p(90)=832ms    p(95)=899.15ms p(99.9)=1.32s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34126
     http_req_receiving.............: avg=87.09µs  min=32.12µs med=74.7µs   max=43.02ms p(90)=113.97µs p(95)=127.69µs p(99.9)=1.17ms  
     http_req_sending...............: avg=34.8µs   min=5.59µs  med=14.52µs  max=145.5ms p(90)=21.88µs  p(95)=25.05µs  p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=420.51ms min=3.75ms  med=392.47ms max=1.81s   p(90)=831.93ms p(95)=898.98ms p(99.9)=1.32s   
     http_reqs......................: 34126   527.782619/s
     iteration_duration.............: avg=433.55ms min=30.64ms med=409.2ms  max=1.81s   p(90)=836ms    p(95)=902ms    p(99.9)=1.32s   
     iterations.....................: 33126   512.316915/s
     success_rate...................: 100.00% ✓ 33126      ✗ 0    
     vus............................: 86      min=0        max=500
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

     checks.........................: 100.00% ✓ 45822      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   287 kB/s
     http_req_blocked...............: avg=12.77µs  min=1.46µs  med=3.63µs   max=16.12ms  p(90)=5.43µs   p(95)=7.3µs    p(99.9)=1.33ms
     http_req_connecting............: avg=7.17µs   min=0s      med=0s       max=15.91ms  p(90)=0s       p(95)=0s       p(99.9)=1.27ms
     http_req_duration..............: avg=894.66ms min=6.27ms  med=805.21ms max=4.85s    p(90)=1.77s    p(95)=1.99s    p(99.9)=4.24s 
       { expected_response:true }...: avg=894.66ms min=6.27ms  med=805.21ms max=4.85s    p(90)=1.77s    p(95)=1.99s    p(99.9)=4.24s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16274
     http_req_receiving.............: avg=105.06µs min=35.47µs med=90.9µs   max=19.93ms  p(90)=131.38µs p(95)=148.66µs p(99.9)=1.31ms
     http_req_sending...............: avg=46.84µs  min=5.88µs  med=17.91µs  max=165.33ms p(90)=24.2µs   p(95)=29.09µs  p(99.9)=2.97ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=894.51ms min=6.18ms  med=805.11ms max=4.85s    p(90)=1.77s    p(95)=1.99s    p(99.9)=4.24s 
     http_reqs......................: 16274   239.30935/s
     iteration_duration.............: avg=953.29ms min=25.7ms  med=875.85ms max=4.86s    p(90)=1.79s    p(95)=2.03s    p(99.9)=4.26s 
     iterations.....................: 15274   224.604339/s
     success_rate...................: 100.00% ✓ 15274      ✗ 0    
     vus............................: 53      min=0        max=500
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

     checks.........................: 100.00% ✓ 45594      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   283 kB/s
     http_req_blocked...............: avg=12.58µs  min=1.1µs   med=3.29µs   max=17.11ms p(90)=5.07µs   p(95)=6.63µs   p(99.9)=1.41ms
     http_req_connecting............: avg=7.61µs   min=0s      med=0s       max=17.04ms p(90)=0s       p(95)=0s       p(99.9)=1.38ms
     http_req_duration..............: avg=897.17ms min=7.88ms  med=812.43ms max=3.1s    p(90)=1.81s    p(95)=1.94s    p(99.9)=2.77s 
       { expected_response:true }...: avg=897.17ms min=7.88ms  med=812.43ms max=3.1s    p(90)=1.81s    p(95)=1.94s    p(99.9)=2.77s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16198
     http_req_receiving.............: avg=102.65µs min=31.18µs med=89.91µs  max=87.15ms p(90)=128.86µs p(95)=145.28µs p(99.9)=1.15ms
     http_req_sending...............: avg=27.24µs  min=5.62µs  med=17.68µs  max=42.07ms p(90)=23.59µs  p(95)=28.47µs  p(99.9)=1.75ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=897.04ms min=7.75ms  med=812.31ms max=3.1s    p(90)=1.81s    p(95)=1.94s    p(99.9)=2.77s 
     http_reqs......................: 16198   235.351692/s
     iteration_duration.............: avg=956.16ms min=39.36ms med=927.19ms max=3.12s   p(90)=1.82s    p(95)=1.95s    p(99.9)=2.81s 
     iterations.....................: 15198   220.822016/s
     success_rate...................: 100.00% ✓ 15198      ✗ 0    
     vus............................: 96      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

