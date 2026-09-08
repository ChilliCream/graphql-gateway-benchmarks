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
| hive-router | v0.0.84 | 2,855 | 2,979 | 2,811 | 2.1% |  |
| fusion-nightly | 16.7.0-p.4 | 2,517 | 2,628 | 2,498 | 2.0% |  |
| fusion-nightly-net11 | 16.7.0-p.4 | 2,507 | 2,621 | 2,486 | 1.9% |  |
| fusion | 16.6.4 | 2,494 | 2,610 | 2,488 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.4 | 2,386 | 2,491 | 2,370 | 1.8% |  |
| cosmo | 0.334.0 | 1,231 | 1,271 | 1,226 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 558 | 573 | 557 | 1.0% |  |
| hive-gateway | 2.10.8 | 260 | 266 | 259 | 0.9% |  |
| apollo-gateway | 2.14.3 | 234 | 240 | 230 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (10153 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (528131 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.4 | 2,423 | 2,512 | 2,412 | 1.4% |  |
| fusion-nightly-net11 | 16.7.0-p.4 | 2,406 | 2,504 | 2,389 | 1.7% |  |
| fusion-nightly | 16.7.0-p.4 | 2,404 | 2,498 | 2,391 | 1.5% |  |
| fusion-nightly-fed | 16.7.0-p.4 | 2,220 | 2,305 | 2,212 | 1.3% |  |
| hive-router | v0.0.84 | 2,166 | 2,314 | 2,136 | 2.7% |  |
| cosmo | 0.334.0 | 1,162 | 1,198 | 1,151 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 543 | 557 | 541 | 1.0% |  |
| hive-gateway | 2.10.8 | 247 | 255 | 245 | 1.3% |  |
| apollo-gateway | 2.14.3 | 233 | 239 | 232 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (32988 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (319512 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 525183      ✗ 0     
     data_received..................: 15 GB   251 MB/s
     data_sent......................: 212 MB  3.4 MB/s
     http_req_blocked...............: avg=27.78µs min=1.08µs  med=2.74µs  max=79.12ms  p(90)=4.56µs   p(95)=5.8µs    p(99.9)=2.36ms  
     http_req_connecting............: avg=23.83µs min=0s      med=0s      max=76.92ms  p(90)=0s       p(95)=0s       p(99.9)=2.21ms  
     http_req_duration..............: avg=80.65ms min=1.34ms  med=75.42ms max=307.36ms p(90)=153.21ms p(95)=173.31ms p(99.9)=251.3ms 
       { expected_response:true }...: avg=80.65ms min=1.34ms  med=75.42ms max=307.36ms p(90)=153.21ms p(95)=173.31ms p(99.9)=251.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 176061
     http_req_receiving.............: avg=182.6µs min=26.36µs med=53.5µs  max=90.57ms  p(90)=163.33µs p(95)=367.4µs  p(99.9)=27.49ms 
     http_req_sending...............: avg=78.86µs min=4.51µs  med=10.04µs max=55.48ms  p(90)=20.04µs  p(95)=130.85µs p(99.9)=11.98ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.39ms min=1.28ms  med=75.21ms max=307.27ms p(90)=152.79ms p(95)=172.73ms p(99.9)=249.74ms
     http_reqs......................: 176061  2855.688714/s
     iteration_duration.............: avg=81.42ms min=2.22ms  med=76.22ms max=378.44ms p(90)=153.73ms p(95)=174.01ms p(99.9)=257.76ms
     iterations.....................: 175061  2839.468832/s
     success_rate...................: 100.00% ✓ 175061      ✗ 0     
     vus............................: 86      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 468357      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 189 MB  3.0 MB/s
     http_req_blocked...............: avg=17.25µs min=892ns   med=2.11µs  max=67.26ms  p(90)=3.58µs   p(95)=4.65µs   p(99.9)=1.96ms  
     http_req_connecting............: avg=14.44µs min=0s      med=0s      max=67.21ms  p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=90.51ms min=1.95ms  med=81.79ms max=1.19s    p(90)=171.38ms p(95)=196.8ms  p(99.9)=596.65ms
       { expected_response:true }...: avg=90.51ms min=1.95ms  med=81.79ms max=1.19s    p(90)=171.38ms p(95)=196.8ms  p(99.9)=596.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157119
     http_req_receiving.............: avg=1.42ms  min=51.41µs med=95.96µs max=556.15ms p(90)=1.47ms   p(95)=3.93ms   p(99.9)=100.09ms
     http_req_sending...............: avg=60.48µs min=4.6µs   med=8.91µs  max=49.74ms  p(90)=17.18µs  p(95)=102.59µs p(99.9)=8.32ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.02ms min=1.88ms  med=80.82ms max=1.01s    p(90)=169.62ms p(95)=193.2ms  p(99.9)=569.84ms
     http_reqs......................: 157119  2517.322695/s
     iteration_duration.............: avg=91.35ms min=3.22ms  med=82.64ms max=1.19s    p(90)=171.89ms p(95)=197.49ms p(99.9)=597.26ms
     iterations.....................: 156119  2501.300937/s
     success_rate...................: 100.00% ✓ 156119      ✗ 0     
     vus............................: 76      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 465504      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=19.43µs  min=1µs     med=2.51µs   max=74.47ms  p(90)=4.01µs   p(95)=5.06µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=15.96µs  min=0s      med=0s       max=74.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=91.05ms  min=1.91ms  med=86.73ms  max=308.93ms p(90)=175.09ms p(95)=192.55ms p(99.9)=252.43ms
       { expected_response:true }...: avg=91.05ms  min=1.91ms  med=86.73ms  max=308.93ms p(90)=175.09ms p(95)=192.55ms p(99.9)=252.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156168
     http_req_receiving.............: avg=630.98µs min=52.05µs med=104.96µs max=94.05ms  p(90)=1.15ms   p(95)=2.09ms   p(99.9)=26.39ms 
     http_req_sending...............: avg=69.51µs  min=4.78µs  med=9.38µs   max=131.64ms p(90)=17.77µs  p(95)=117.87µs p(99.9)=10.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.35ms  min=1.83ms  med=86ms     max=308.85ms p(90)=174.35ms p(95)=191.7ms  p(99.9)=251.15ms
     http_reqs......................: 156168  2507.510805/s
     iteration_duration.............: avg=91.89ms  min=3.35ms  med=87.65ms  max=330.4ms  p(90)=175.61ms p(95)=193.07ms p(99.9)=253.13ms
     iterations.....................: 155168  2491.45431/s
     success_rate...................: 100.00% ✓ 155168      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 463017      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=16.98µs min=831ns   med=2.13µs  max=45.73ms  p(90)=3.65µs   p(95)=4.75µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=14.02µs min=0s      med=0s      max=45.67ms  p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=91.58ms min=2.02ms  med=77.93ms max=1.54s    p(90)=173.93ms p(95)=199.41ms p(99.9)=657.75ms
       { expected_response:true }...: avg=91.58ms min=2.02ms  med=77.93ms max=1.54s    p(90)=173.93ms p(95)=199.41ms p(99.9)=657.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155339
     http_req_receiving.............: avg=1.83ms  min=51.38µs med=98.02µs max=655.67ms p(90)=1.58ms   p(95)=4.66ms   p(99.9)=179.28ms
     http_req_sending...............: avg=63.73µs min=4.68µs  med=8.83µs  max=195.08ms p(90)=17.43µs  p(95)=104.42µs p(99.9)=8.52ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.68ms min=1.9ms   med=76.81ms max=1.51s    p(90)=171.71ms p(95)=196.22ms p(99.9)=614.68ms
     http_reqs......................: 155339  2494.104321/s
     iteration_duration.............: avg=92.42ms min=3.59ms  med=78.78ms max=1.54s    p(90)=174.47ms p(95)=200.13ms p(99.9)=658.3ms 
     iterations.....................: 154339  2478.048441/s
     success_rate...................: 100.00% ✓ 154339      ✗ 0     
     vus............................: 72      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441066      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=19.6µs  min=1µs     med=2.7µs    max=123.51ms p(90)=4.44µs   p(95)=5.6µs    p(99.9)=1.28ms  
     http_req_connecting............: avg=16.13µs min=0s      med=0s       max=123.44ms p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=96.07ms min=1.65ms  med=81.85ms  max=1.74s    p(90)=183.4ms  p(95)=215.41ms p(99.9)=759.67ms
       { expected_response:true }...: avg=96.07ms min=1.65ms  med=81.85ms  max=1.74s    p(90)=183.4ms  p(95)=215.41ms p(99.9)=759.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148022
     http_req_receiving.............: avg=1.42ms  min=51.36µs med=101.93µs max=761.11ms p(90)=1.5ms    p(95)=3.95ms   p(99.9)=116.71ms
     http_req_sending...............: avg=68.02µs min=4.46µs  med=9.84µs   max=143.27ms p(90)=18.68µs  p(95)=115.16µs p(99.9)=9.09ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.58ms min=1.58ms  med=80.67ms  max=1.74s    p(90)=181.55ms p(95)=212.93ms p(99.9)=680.13ms
     http_reqs......................: 148022  2386.550718/s
     iteration_duration.............: avg=97.05ms min=2.94ms  med=82.97ms  max=1.74s    p(90)=184.09ms p(95)=216.45ms p(99.9)=760.58ms
     iterations.....................: 147022  2370.427772/s
     success_rate...................: 100.00% ✓ 147022      ✗ 0     
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

     checks.........................: 100.00% ✓ 227880      ✗ 0    
     data_received..................: 6.8 GB  108 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=6.03µs   min=1.11µs  med=2.75µs   max=7.53ms   p(90)=4.48µs   p(95)=5.45µs   p(99.9)=491.46µs
     http_req_connecting............: avg=2.61µs   min=0s      med=0s       max=7.48ms   p(90)=0s       p(95)=0s       p(99.9)=444.31µs
     http_req_duration..............: avg=185.35ms min=1.93ms  med=187.46ms max=506.04ms p(90)=343.81ms p(95)=368.31ms p(99.9)=445.36ms
       { expected_response:true }...: avg=185.35ms min=1.93ms  med=187.46ms max=506.04ms p(90)=343.81ms p(95)=368.31ms p(99.9)=445.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76960
     http_req_receiving.............: avg=75.51µs  min=27.71µs med=62.08µs  max=29.67ms  p(90)=100.24µs p(95)=115.07µs p(99.9)=1.12ms  
     http_req_sending...............: avg=31.02µs  min=4.94µs  med=11.47µs  max=156.55ms p(90)=18.22µs  p(95)=21.98µs  p(99.9)=3.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.24ms min=1.87ms  med=187.36ms max=505.73ms p(90)=343.73ms p(95)=368.21ms p(99.9)=445.28ms
     http_reqs......................: 76960   1231.228446/s
     iteration_duration.............: avg=188.04ms min=3.91ms  med=190.66ms max=506.44ms p(90)=344.63ms p(95)=368.94ms p(99.9)=445.99ms
     iterations.....................: 75960   1215.230155/s
     success_rate...................: 100.00% ✓ 75960       ✗ 0    
     vus............................: 81      min=0         max=494
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

     checks.........................: 100.00% ✓ 104571     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   670 kB/s
     http_req_blocked...............: avg=9.4µs    min=1.13µs  med=3.01µs   max=6.35ms   p(90)=4.72µs   p(95)=5.75µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=5.25µs   min=0s      med=0s       max=5.69ms   p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=400.22ms min=3.55ms  med=369.97ms max=1.67s    p(90)=789.5ms  p(95)=859.07ms p(99.9)=1.27s   
       { expected_response:true }...: avg=400.22ms min=3.55ms  med=369.97ms max=1.67s    p(90)=789.5ms  p(95)=859.07ms p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35857
     http_req_receiving.............: avg=84.54µs  min=31.44µs med=69.47µs  max=164.77ms p(90)=107.03µs p(95)=121.17µs p(99.9)=876.09µs
     http_req_sending...............: avg=39.65µs  min=5.37µs  med=13.31µs  max=171.79ms p(90)=20.29µs  p(95)=23.24µs  p(99.9)=3.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=400.09ms min=3.44ms  med=369.84ms max=1.66s    p(90)=789.42ms p(95)=858.99ms p(99.9)=1.27s   
     http_reqs......................: 35857   558.017744/s
     iteration_duration.............: avg=411.92ms min=26.04ms med=384.57ms max=1.67s    p(90)=793.39ms p(95)=861.58ms p(99.9)=1.27s   
     iterations.....................: 34857   542.455434/s
     success_rate...................: 100.00% ✓ 34857      ✗ 0    
     vus............................: 66      min=0        max=496
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

     checks.........................: 100.00% ✓ 49401      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   314 kB/s
     http_req_blocked...............: avg=15.31µs  min=1.53µs  med=3.84µs   max=18.5ms   p(90)=5.77µs   p(95)=7.32µs   p(99.9)=2.18ms
     http_req_connecting............: avg=9.67µs   min=0s      med=0s       max=16.88ms  p(90)=0s       p(95)=0s       p(99.9)=2.15ms
     http_req_duration..............: avg=825.13ms min=5.33ms  med=737.01ms max=13.44s   p(90)=1.54s    p(95)=1.74s    p(99.9)=11.03s
       { expected_response:true }...: avg=825.13ms min=5.33ms  med=737.01ms max=13.44s   p(90)=1.54s    p(95)=1.74s    p(99.9)=11.03s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17467
     http_req_receiving.............: avg=110.89µs min=40.79µs med=96.74µs  max=98.36ms  p(90)=137.15µs p(95)=154.05µs p(99.9)=1.19ms
     http_req_sending...............: avg=40.67µs  min=6.71µs  med=18.99µs  max=108.62ms p(90)=24.66µs  p(95)=29.02µs  p(99.9)=3.39ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=824.97ms min=5.26ms  med=736.91ms max=13.44s   p(90)=1.54s    p(95)=1.74s    p(99.9)=11.03s
     http_reqs......................: 17467   260.977747/s
     iteration_duration.............: avg=875.34ms min=33.08ms med=802.38ms max=13.44s   p(90)=1.56s    p(95)=1.75s    p(99.9)=11.1s 
     iterations.....................: 16467   246.036558/s
     success_rate...................: 100.00% ✓ 16467      ✗ 0    
     vus............................: 32      min=0        max=500
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

     checks.........................: 100.00% ✓ 48384      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   288 kB/s
     http_req_blocked...............: avg=13.71µs  min=1.1µs   med=3.09µs   max=3.59ms   p(90)=4.81µs   p(95)=6.22µs   p(99.9)=2.17ms  
     http_req_connecting............: avg=9.06µs   min=0s      med=0s       max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=349.97ms min=7.36ms  med=409.18ms max=1.03s    p(90)=577.64ms p(95)=621.38ms p(99.9)=879.17ms
       { expected_response:true }...: avg=349.97ms min=7.36ms  med=409.18ms max=1.03s    p(90)=577.64ms p(95)=621.38ms p(99.9)=879.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17128
     http_req_receiving.............: avg=147.89µs min=32.86µs med=87.12µs  max=130.72ms p(90)=125.42µs p(95)=139.98µs p(99.9)=1.18ms  
     http_req_sending...............: avg=26.69µs  min=5.61µs  med=16.9µs   max=14.9ms   p(90)=22.14µs  p(95)=26.79µs  p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=349.79ms min=7.27ms  med=409.03ms max=1.03s    p(90)=577.56ms p(95)=621.3ms  p(99.9)=879.03ms
     http_reqs......................: 17128   234.666036/s
     iteration_duration.............: avg=371.67ms min=13.08ms med=429.89ms max=1.04s    p(90)=583.78ms p(95)=626.94ms p(99.9)=886.73ms
     iterations.....................: 16128   220.96531/s
     success_rate...................: 100.00% ✓ 16128      ✗ 0    
     vus............................: 51      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 446697      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=15.09µs min=901ns   med=2.29µs   max=47.87ms  p(90)=4.05µs   p(95)=5.27µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=12.03µs min=0s      med=0s       max=47.79ms  p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=94.93ms min=1.48ms  med=81.17ms  max=1.59s    p(90)=180.97ms p(95)=207.74ms p(99.9)=825.64ms
       { expected_response:true }...: avg=94.93ms min=1.48ms  med=81.17ms  max=1.59s    p(90)=180.97ms p(95)=207.74ms p(99.9)=825.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149899
     http_req_receiving.............: avg=1.22ms  min=51.58µs med=101.29µs max=1.45s    p(90)=1.55ms   p(95)=3.8ms    p(99.9)=75.23ms 
     http_req_sending...............: avg=64.14µs min=4.4µs   med=9.42µs   max=177.84ms p(90)=19.08µs  p(95)=103.71µs p(99.9)=8.48ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.64ms min=1.37ms  med=80.12ms  max=1.57s    p(90)=179.34ms p(95)=204.96ms p(99.9)=795.45ms
     http_reqs......................: 149899  2423.673741/s
     iteration_duration.............: avg=95.82ms min=2.54ms  med=82.07ms  max=1.59s    p(90)=181.54ms p(95)=208.42ms p(99.9)=826.33ms
     iterations.....................: 148899  2407.505029/s
     success_rate...................: 100.00% ✓ 148899      ✗ 0     
     vus............................: 5       min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 442785      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=13.52µs  min=872ns   med=2.11µs  max=45.48ms  p(90)=3.55µs   p(95)=4.61µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=10.67µs  min=0s      med=0s      max=45.29ms  p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=95.73ms  min=1.41ms  med=91.2ms  max=408.15ms p(90)=182.75ms p(95)=198.08ms p(99.9)=261.66ms
       { expected_response:true }...: avg=95.73ms  min=1.41ms  med=91.2ms  max=408.15ms p(90)=182.75ms p(95)=198.08ms p(99.9)=261.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148595
     http_req_receiving.............: avg=694.47µs min=52.11µs med=107.8µs max=108.47ms p(90)=1.3ms    p(95)=2.3ms    p(99.9)=28.4ms  
     http_req_sending...............: avg=53.21µs  min=4.71µs  med=9.13µs  max=72.64ms  p(90)=18.13µs  p(95)=103.46µs p(99.9)=7.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.98ms  min=1.33ms  med=90.42ms max=408.05ms p(90)=181.96ms p(95)=197.28ms p(99.9)=258.31ms
     http_reqs......................: 148595  2406.064631/s
     iteration_duration.............: avg=96.62ms  min=3.12ms  med=92.27ms max=408.34ms p(90)=183.23ms p(95)=198.48ms p(99.9)=262.63ms
     iterations.....................: 147595  2389.872534/s
     success_rate...................: 100.00% ✓ 147595      ✗ 0     
     vus............................: 91      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443679      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=28.74µs min=1.03µs  med=2.93µs   max=119.86ms p(90)=4.77µs   p(95)=5.97µs   p(99.9)=3.21ms  
     http_req_connecting............: avg=25.04µs min=0s      med=0s       max=119.7ms  p(90)=0s       p(95)=0s       p(99.9)=2.83ms  
     http_req_duration..............: avg=95.42ms min=1.49ms  med=80.4ms   max=2.2s     p(90)=182.97ms p(95)=219.67ms p(99.9)=783.56ms
       { expected_response:true }...: avg=95.42ms min=1.49ms  med=80.4ms   max=2.2s     p(90)=182.97ms p(95)=219.67ms p(99.9)=783.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148893
     http_req_receiving.............: avg=2.17ms  min=52.82µs med=106.98µs max=724.1ms  p(90)=1.75ms   p(95)=5.33ms   p(99.9)=161.14ms
     http_req_sending...............: avg=82.92µs min=5.25µs  med=11.29µs  max=139.6ms  p(90)=22.66µs  p(95)=126.62µs p(99.9)=11.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.17ms min=1.42ms  med=79.31ms  max=2.2s     p(90)=180.09ms p(95)=214.03ms p(99.9)=729.2ms 
     http_reqs......................: 148893  2404.105039/s
     iteration_duration.............: avg=96.45ms min=2.6ms   med=81.56ms  max=2.2s     p(90)=184.02ms p(95)=221.32ms p(99.9)=806.43ms
     iterations.....................: 147893  2387.958511/s
     success_rate...................: 100.00% ✓ 147893      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 411567      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=16.59µs  min=892ns   med=2.42µs   max=117.45ms p(90)=4.33µs   p(95)=5.48µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=13.22µs  min=0s      med=0s       max=117.39ms p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=102.8ms  min=1.69ms  med=89.55ms  max=1.5s     p(90)=191.87ms p(95)=225.16ms p(99.9)=849.97ms
       { expected_response:true }...: avg=102.8ms  min=1.69ms  med=89.55ms  max=1.5s     p(90)=191.87ms p(95)=225.16ms p(99.9)=849.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138189
     http_req_receiving.............: avg=1.67ms   min=50.94µs med=106.26µs max=927.57ms p(90)=1.57ms   p(95)=3.87ms   p(99.9)=179.06ms
     http_req_sending...............: avg=64.61µs  min=4.79µs  med=10.28µs  max=160.44ms p(90)=21.93µs  p(95)=105.72µs p(99.9)=8.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.06ms min=1.63ms  med=88.52ms  max=1.5s     p(90)=190.12ms p(95)=220.95ms p(99.9)=680.8ms 
     http_reqs......................: 138189  2220.647339/s
     iteration_duration.............: avg=103.99ms min=3.73ms  med=90.84ms  max=1.5s     p(90)=192.61ms p(95)=226.04ms p(99.9)=850.71ms
     iterations.....................: 137189  2204.5777/s
     success_rate...................: 100.00% ✓ 137189      ✗ 0     
     vus............................: 67      min=0         max=496 
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

     checks.........................: 100.00% ✓ 399999      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=10.53µs  min=1.01µs  med=2.87µs   max=40.18ms  p(90)=4.74µs   p(95)=5.95µs   p(99.9)=702.68µs
     http_req_connecting............: avg=6.94µs   min=0s      med=0s       max=40.11ms  p(90)=0s       p(95)=0s       p(99.9)=636.63µs
     http_req_duration..............: avg=105.92ms min=1.56ms  med=99.8ms   max=296.45ms p(90)=205.97ms p(95)=222.57ms p(99.9)=263.34ms
       { expected_response:true }...: avg=105.92ms min=1.56ms  med=99.8ms   max=296.45ms p(90)=205.97ms p(95)=222.57ms p(99.9)=263.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134333
     http_req_receiving.............: avg=110.77µs min=27.58µs med=58.52µs  max=81.4ms   p(90)=118.64µs p(95)=331.35µs p(99.9)=6.91ms  
     http_req_sending...............: avg=58.77µs  min=5.02µs  med=11.78µs  max=102.67ms p(90)=21.24µs  p(95)=119.1µs  p(99.9)=7.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.75ms min=1.51ms  med=99.64ms  max=296.39ms p(90)=205.77ms p(95)=222.39ms p(99.9)=262.87ms
     http_reqs......................: 134333  2166.018512/s
     iteration_duration.............: avg=106.97ms min=3.12ms  med=101.06ms max=354.05ms p(90)=206.43ms p(95)=222.99ms p(99.9)=263.68ms
     iterations.....................: 133333  2149.894265/s
     success_rate...................: 100.00% ✓ 133333      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 215217      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=7.3µs    min=1.05µs  med=3.08µs   max=27.87ms  p(90)=4.89µs   p(95)=5.91µs   p(99.9)=726.45µs
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=27.16ms  p(90)=0s       p(95)=0s       p(99.9)=669.62µs
     http_req_duration..............: avg=196.17ms min=1.97ms  med=197.52ms max=565.86ms p(90)=361.65ms p(95)=390.16ms p(99.9)=494.58ms
       { expected_response:true }...: avg=196.17ms min=1.97ms  med=197.52ms max=565.86ms p(90)=361.65ms p(95)=390.16ms p(99.9)=494.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72739
     http_req_receiving.............: avg=82.16µs  min=28.98µs med=67.82µs  max=11.58ms  p(90)=108.59µs p(95)=124.82µs p(99.9)=1.35ms  
     http_req_sending...............: avg=32.38µs  min=5.27µs  med=12.55µs  max=111.09ms p(90)=20.07µs  p(95)=24.24µs  p(99.9)=3.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.06ms min=1.87ms  med=197.4ms  max=565.79ms p(90)=361.55ms p(95)=389.98ms p(99.9)=494.49ms
     http_reqs......................: 72739   1162.305593/s
     iteration_duration.............: avg=199.15ms min=4.84ms  med=200.89ms max=566.06ms p(90)=362.63ms p(95)=391ms    p(99.9)=494.98ms
     iterations.....................: 71739   1146.326468/s
     success_rate...................: 100.00% ✓ 71739       ✗ 0    
     vus............................: 84      min=0         max=498
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

     checks.........................: 100.00% ✓ 102468     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   653 kB/s
     http_req_blocked...............: avg=7.72µs   min=1.3µs   med=3.45µs   max=4.6ms    p(90)=5.35µs   p(95)=6.55µs   p(99.9)=610.62µs
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=573.32µs
     http_req_duration..............: avg=408.29ms min=3.68ms  med=380.56ms max=1.86s    p(90)=799.84ms p(95)=875.91ms p(99.9)=1.34s   
       { expected_response:true }...: avg=408.29ms min=3.68ms  med=380.56ms max=1.86s    p(90)=799.84ms p(95)=875.91ms p(99.9)=1.34s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35156
     http_req_receiving.............: avg=101.46µs min=31.13µs med=79.14µs  max=174.31ms p(90)=118.13µs p(95)=133.79µs p(99.9)=1.05ms  
     http_req_sending...............: avg=40.69µs  min=5.65µs  med=15.5µs   max=174.14ms p(90)=22.79µs  p(95)=25.96µs  p(99.9)=3.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=408.15ms min=3.55ms  med=380.41ms max=1.86s    p(90)=799.73ms p(95)=875.83ms p(99.9)=1.34s   
     http_reqs......................: 35156   543.97042/s
     iteration_duration.............: avg=420.51ms min=19.57ms med=396.05ms max=1.86s    p(90)=803.49ms p(95)=878.86ms p(99.9)=1.35s   
     iterations.....................: 34156   528.497373/s
     success_rate...................: 100.00% ✓ 34156      ✗ 0    
     vus............................: 84      min=0        max=500
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

     checks.........................: 100.00% ✓ 47118      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   297 kB/s
     http_req_blocked...............: avg=11.66µs  min=1.1µs   med=3.87µs   max=2.77ms  p(90)=5.85µs   p(95)=7.56µs  p(99.9)=1.13ms
     http_req_connecting............: avg=6.06µs   min=0s      med=0s       max=2.71ms  p(90)=0s       p(95)=0s      p(99.9)=1.11ms
     http_req_duration..............: avg=871.12ms min=5.65ms  med=785.74ms max=5.34s   p(90)=1.73s    p(95)=2s      p(99.9)=4.09s 
       { expected_response:true }...: avg=871.12ms min=5.65ms  med=785.74ms max=5.34s   p(90)=1.73s    p(95)=2s      p(99.9)=4.09s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16706
     http_req_receiving.............: avg=112.07µs min=34.09µs med=94.66µs  max=49.23ms p(90)=134.62µs p(95)=151.2µs p(99.9)=1.25ms
     http_req_sending...............: avg=33.99µs  min=6.07µs  med=19.01µs  max=24.64ms p(90)=24.88µs  p(95)=30.29µs p(99.9)=3.56ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=870.97ms min=5.54ms  med=785.6ms  max=5.34s   p(90)=1.73s    p(95)=2s      p(99.9)=4.08s 
     http_reqs......................: 16706   247.447473/s
     iteration_duration.............: avg=926.62ms min=56.7ms  med=850.18ms max=5.35s   p(90)=1.75s    p(95)=2.01s   p(99.9)=4.1s  
     iterations.....................: 15706   232.63558/s
     success_rate...................: 100.00% ✓ 15706      ✗ 0    
     vus............................: 72      min=0        max=500
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

     checks.........................: 100.00% ✓ 45243      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=15.51µs  min=1.41µs  med=3.63µs   max=9.41ms   p(90)=5.57µs   p(95)=7.17µs   p(99.9)=2.47ms
     http_req_connecting............: avg=9.99µs   min=0s      med=0s       max=9.34ms   p(90)=0s       p(95)=0s       p(99.9)=2.44ms
     http_req_duration..............: avg=903.54ms min=7.9ms   med=831.51ms max=3.14s    p(90)=1.87s    p(95)=2.01s    p(99.9)=2.82s 
       { expected_response:true }...: avg=903.54ms min=7.9ms   med=831.51ms max=3.14s    p(90)=1.87s    p(95)=2.01s    p(99.9)=2.82s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16081
     http_req_receiving.............: avg=124.23µs min=38µs    med=90.74µs  max=196.55ms p(90)=132.94µs p(95)=150.38µs p(99.9)=1.39ms
     http_req_sending...............: avg=44.37µs  min=5.95µs  med=17.87µs  max=71.98ms  p(90)=24.15µs  p(95)=29.92µs  p(99.9)=5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=903.37ms min=7.79ms  med=831.38ms max=3.14s    p(90)=1.87s    p(95)=2.01s    p(99.9)=2.82s 
     http_reqs......................: 16081   233.437025/s
     iteration_duration.............: avg=963.45ms min=27.51ms med=914.12ms max=3.15s    p(90)=1.88s    p(95)=2.03s    p(99.9)=2.83s 
     iterations.....................: 15081   218.9207/s
     success_rate...................: 100.00% ✓ 15081      ✗ 0    
     vus............................: 10      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

