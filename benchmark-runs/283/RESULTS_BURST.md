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
| hive-router | v0.0.78 | 2,824 | 2,958 | 2,786 | 2.1% |  |
| fusion-nightly-net11 | 16.5.0-p.18 | 2,495 | 2,592 | 2,480 | 1.6% |  |
| fusion-nightly | 16.5.0-p.18 | 2,386 | 2,477 | 2,373 | 1.5% |  |
| fusion | 16.4.0 | 2,207 | 2,291 | 2,182 | 1.6% |  |
| cosmo | 0.329.0 | 1,219 | 1,259 | 1,214 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.2 | 554 | 569 | 554 | 0.9% |  |
| hive-gateway | 2.10.2 | 249 | 254 | 248 | 0.8% |  |
| apollo-gateway | 2.14.2 | 232 | 239 | 230 | 1.2% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (4998 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (552789 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,296 | 2,422 | 2,245 | 2.6% |  |
| fusion-nightly-net11 | 16.5.0-p.18 | 2,253 | 2,339 | 2,235 | 1.5% |  |
| fusion-nightly | 16.5.0-p.18 | 2,217 | 2,318 | 2,203 | 1.8% |  |
| fusion-nightly-fed | 16.5.0-p.18 | 2,159 | 2,251 | 2,152 | 1.6% |  |
| fusion | 16.4.0 | 2,122 | 2,210 | 2,105 | 1.7% |  |
| cosmo | 0.329.0 | 1,157 | 1,196 | 1,152 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.2 | 520 | 538 | 515 | 1.5% |  |
| hive-gateway | 2.10.2 | 242 | 248 | 238 | 1.1% |  |
| apollo-gateway | 2.14.2 | 232 | 238 | 231 | 1.0% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (33561 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (331839 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 519945    ✗ 0     
     data_received..................: 15 GB   248 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=17.21µs  min=842ns   med=2.15µs  max=67.68ms  p(90)=3.66µs   p(95)=4.81µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=14.28µs  min=0s      med=0s      max=65.64ms  p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=81.53ms  min=1.39ms  med=76.3ms  max=278.6ms  p(90)=158.35ms p(95)=172.52ms p(99.9)=226.76ms
       { expected_response:true }...: avg=81.53ms  min=1.39ms  med=76.3ms  max=278.6ms  p(90)=158.35ms p(95)=172.52ms p(99.9)=226.76ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 174315
     http_req_receiving.............: avg=127.41µs min=24.71µs med=49.57µs max=98.54ms  p(90)=129.4µs  p(95)=319.07µs p(99.9)=12.45ms 
     http_req_sending...............: avg=66.81µs  min=4.26µs  med=9.19µs  max=229.95ms p(90)=17.3µs   p(95)=109.61µs p(99.9)=8.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.34ms  min=1.34ms  med=76.12ms max=271.54ms p(90)=158.14ms p(95)=172.26ms p(99.9)=225.15ms
     http_reqs......................: 174315  2824.9837/s
     iteration_duration.............: avg=82.25ms  min=2.45ms  med=77.1ms  max=353.5ms  p(90)=158.77ms p(95)=172.92ms p(99.9)=227.66ms
     iterations.....................: 173315  2808.7775/s
     success_rate...................: 100.00% ✓ 173315    ✗ 0     
     vus............................: 90      min=0       max=498 
     vus_max........................: 500     min=500     max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462357      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=22.65µs  min=1.02µs  med=2.7µs    max=61.04ms  p(90)=4.36µs   p(95)=5.55µs   p(99.9)=2.97ms  
     http_req_connecting............: avg=19.03µs  min=0s      med=0s       max=60.8ms   p(90)=0s       p(95)=0s       p(99.9)=2.69ms  
     http_req_duration..............: avg=91.65ms  min=1.89ms  med=86.09ms  max=338.45ms p(90)=175.78ms p(95)=193.18ms p(99.9)=251.6ms 
       { expected_response:true }...: avg=91.65ms  min=1.89ms  med=86.09ms  max=338.45ms p(90)=175.78ms p(95)=193.18ms p(99.9)=251.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 155119
     http_req_receiving.............: avg=792.35µs min=53.25µs med=117.79µs max=206.14ms p(90)=1.52ms   p(95)=2.63ms   p(99.9)=31.03ms 
     http_req_sending...............: avg=71.43µs  min=4.44µs  med=9.98µs   max=101.72ms p(90)=19.94µs  p(95)=124.01µs p(99.9)=9.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.79ms  min=1.81ms  med=85.13ms  max=338.37ms p(90)=174.82ms p(95)=192.14ms p(99.9)=249.58ms
     http_reqs......................: 155119  2495.487277/s
     iteration_duration.............: avg=92.5ms   min=4.11ms  med=87.01ms  max=338.62ms p(90)=176.3ms  p(95)=193.7ms  p(99.9)=253ms   
     iterations.....................: 154119  2479.39971/s
     success_rate...................: 100.00% ✓ 154119      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 444420      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=12.6µs  min=842ns   med=1.99µs  max=63.68ms  p(90)=3.25µs   p(95)=4.2µs    p(99.9)=939.07µs
     http_req_connecting............: avg=9.94µs  min=0s      med=0s      max=63.54ms  p(90)=0s       p(95)=0s       p(99.9)=848.7µs 
     http_req_duration..............: avg=95.4ms  min=2.01ms  med=83.46ms max=1.66s    p(90)=180.02ms p(95)=205ms    p(99.9)=686.43ms
       { expected_response:true }...: avg=95.4ms  min=2.01ms  med=83.46ms max=1.66s    p(90)=180.02ms p(95)=205ms    p(99.9)=686.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149140
     http_req_receiving.............: avg=1.69ms  min=49.94µs med=98.46µs max=1.35s    p(90)=1.95ms   p(95)=5.71ms   p(99.9)=104.01ms
     http_req_sending...............: avg=55.96µs min=4.46µs  med=8.62µs  max=172.09ms p(90)=14.76µs  p(95)=90.84µs  p(99.9)=7.68ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.65ms min=1.93ms  med=82.09ms max=1.66s    p(90)=177.68ms p(95)=201.36ms p(99.9)=675.87ms
     http_reqs......................: 149140  2386.822779/s
     iteration_duration.............: avg=96.28ms min=3.55ms  med=84.47ms max=1.66s    p(90)=180.56ms p(95)=205.64ms p(99.9)=687.13ms
     iterations.....................: 148140  2370.818871/s
     success_rate...................: 100.00% ✓ 148140      ✗ 0     
     vus............................: 79      min=0         max=493 
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

     checks.........................: 100.00% ✓ 411375      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=13.39µs  min=1µs     med=2.51µs   max=70.92ms  p(90)=3.96µs   p(95)=4.96µs   p(99.9)=890.82µs
     http_req_connecting............: avg=10.14µs  min=0s      med=0s       max=70.75ms  p(90)=0s       p(95)=0s       p(99.9)=800.62µs
     http_req_duration..............: avg=103.07ms min=2.1ms   med=91.99ms  max=1.08s    p(90)=193.67ms p(95)=223.57ms p(99.9)=663.63ms
       { expected_response:true }...: avg=103.07ms min=2.1ms   med=91.99ms  max=1.08s    p(90)=193.67ms p(95)=223.57ms p(99.9)=663.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138125
     http_req_receiving.............: avg=1.76ms   min=51.73µs med=107.52µs max=491.37ms p(90)=2.04ms   p(95)=5.2ms    p(99.9)=142.45ms
     http_req_sending...............: avg=56.6µs   min=4.68µs  med=9.51µs   max=139.09ms p(90)=16.82µs  p(95)=101.22µs p(99.9)=7.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.26ms min=1.98ms  med=90.77ms  max=1.08s    p(90)=191.42ms p(95)=219.25ms p(99.9)=651.21ms
     http_reqs......................: 138125  2207.574715/s
     iteration_duration.............: avg=104.06ms min=3.56ms  med=93.1ms   max=1.08s    p(90)=194.27ms p(95)=224.21ms p(99.9)=664.21ms
     iterations.....................: 137125  2191.592274/s
     success_rate...................: 100.00% ✓ 137125      ✗ 0     
     vus............................: 83      min=0         max=492 
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

     checks.........................: 100.00% ✓ 225669      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=4.98µs   min=972ns   med=2.22µs   max=16.88ms  p(90)=3.85µs   p(95)=4.75µs   p(99.9)=404.35µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=16.82ms  p(90)=0s       p(95)=0s       p(99.9)=348.52µs
     http_req_duration..............: avg=187.18ms min=1.92ms  med=189.57ms max=486.6ms  p(90)=347.08ms p(95)=370.87ms p(99.9)=436.83ms
       { expected_response:true }...: avg=187.18ms min=1.92ms  med=189.57ms max=486.6ms  p(90)=347.08ms p(95)=370.87ms p(99.9)=436.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76223
     http_req_receiving.............: avg=72.78µs  min=27.77µs med=58.59µs  max=183.03ms p(90)=95.26µs  p(95)=109.3µs  p(99.9)=1.12ms  
     http_req_sending...............: avg=28.82µs  min=5.02µs  med=10.15µs  max=146.98ms p(90)=17.16µs  p(95)=20.95µs  p(99.9)=2.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.08ms min=1.8ms   med=189.45ms max=486.52ms p(90)=346.99ms p(95)=370.77ms p(99.9)=436.76ms
     http_reqs......................: 76223   1219.694768/s
     iteration_duration.............: avg=189.9ms  min=3.91ms  med=192.49ms max=486.76ms p(90)=347.83ms p(95)=371.58ms p(99.9)=437.63ms
     iterations.....................: 75223   1203.693105/s
     success_rate...................: 100.00% ✓ 75223       ✗ 0    
     vus............................: 78      min=0         max=493
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

     checks.........................: 100.00% ✓ 103896     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   666 kB/s
     http_req_blocked...............: avg=7.62µs   min=1µs     med=2.33µs   max=12.62ms p(90)=4.05µs   p(95)=4.97µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=4.25µs   min=0s      med=0s       max=12.56ms p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=402.52ms min=3.53ms  med=374.36ms max=1.73s   p(90)=794.31ms p(95)=864.73ms p(99.9)=1.26s   
       { expected_response:true }...: avg=402.52ms min=3.53ms  med=374.36ms max=1.73s   p(90)=794.31ms p(95)=864.73ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35632
     http_req_receiving.............: avg=75.34µs  min=28.53µs med=62.66µs  max=42.55ms p(90)=100.97µs p(95)=115.84µs p(99.9)=951.57µs
     http_req_sending...............: avg=25.02µs  min=5.2µs   med=11.55µs  max=67.2ms  p(90)=19.03µs  p(95)=21.81µs  p(99.9)=2.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=402.42ms min=3.48ms  med=374.26ms max=1.73s   p(90)=794.18ms p(95)=864.57ms p(99.9)=1.26s   
     http_reqs......................: 35632   554.605587/s
     iteration_duration.............: avg=414.34ms min=15.84ms med=388.43ms max=1.74s   p(90)=798.38ms p(95)=867.32ms p(99.9)=1.26s   
     iterations.....................: 34632   539.04077/s
     success_rate...................: 100.00% ✓ 34632      ✗ 0    
     vus............................: 65      min=0        max=496
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

     checks.........................: 100.00% ✓ 47487      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=13.58µs  min=1.18µs  med=3.09µs   max=3.91ms  p(90)=4.7µs    p(95)=5.97µs   p(99.9)=2.28ms
     http_req_connecting............: avg=8.77µs   min=0s      med=0s       max=3.86ms  p(90)=0s       p(95)=0s       p(99.9)=2.16ms
     http_req_duration..............: avg=855.98ms min=5.7ms   med=762.92ms max=14.21s  p(90)=1.55s    p(95)=1.77s    p(99.9)=12.63s
       { expected_response:true }...: avg=855.98ms min=5.7ms   med=762.92ms max=14.21s  p(90)=1.55s    p(95)=1.77s    p(99.9)=12.63s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16829
     http_req_receiving.............: avg=94.49µs  min=32.88µs med=86.84µs  max=23.91ms p(90)=122.75µs p(95)=136.92µs p(99.9)=1.29ms
     http_req_sending...............: avg=26.02µs  min=5.28µs  med=15.92µs  max=7.69ms  p(90)=21.35µs  p(95)=25.57µs  p(99.9)=2.95ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=855.86ms min=5.6ms   med=762.8ms  max=14.21s  p(90)=1.55s    p(95)=1.77s    p(99.9)=12.63s
     http_reqs......................: 16829   249.995841/s
     iteration_duration.............: avg=910.06ms min=49.61ms med=814.81ms max=14.21s  p(90)=1.57s    p(95)=1.78s    p(99.9)=12.64s
     iterations.....................: 15829   235.140778/s
     success_rate...................: 100.00% ✓ 15829      ✗ 0    
     vus............................: 72      min=0        max=498
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

     checks.........................: 100.00% ✓ 48030      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   284 kB/s
     http_req_blocked...............: avg=13.87µs  min=1.35µs  med=3.41µs   max=3.43ms  p(90)=5.05µs   p(95)=6.51µs   p(99.9)=2.22ms
     http_req_connecting............: avg=8.75µs   min=0s      med=0s       max=3.39ms  p(90)=0s       p(95)=0s       p(99.9)=2.08ms
     http_req_duration..............: avg=382.45ms min=7.6ms   med=406.39ms max=1.31s   p(90)=661.23ms p(95)=729.74ms p(99.9)=1.03s 
       { expected_response:true }...: avg=382.45ms min=7.6ms   med=406.39ms max=1.31s   p(90)=661.23ms p(95)=729.74ms p(99.9)=1.03s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17010
     http_req_receiving.............: avg=100.38µs min=35.98µs med=86.59µs  max=48.67ms p(90)=125.88µs p(95)=142.25µs p(99.9)=1.15ms
     http_req_sending...............: avg=28.57µs  min=5.56µs  med=16.69µs  max=31.07ms p(90)=22.2µs   p(95)=27.29µs  p(99.9)=2.88ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=382.32ms min=7.46ms  med=406.31ms max=1.31s   p(90)=661.14ms p(95)=729.62ms p(99.9)=1.03s 
     http_reqs......................: 17010   232.221474/s
     iteration_duration.............: avg=406.31ms min=8.43ms  med=423.43ms max=1.32s   p(90)=666.56ms p(95)=739.09ms p(99.9)=1.04s 
     iterations.....................: 16010   218.569418/s
     success_rate...................: 100.00% ✓ 16010      ✗ 0    
     vus............................: 60      min=0        max=495
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

     checks.........................: 100.00% ✓ 425058      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=20.45µs  min=1.08µs  med=3.19µs  max=53.75ms  p(90)=5.2µs    p(95)=6.5µs    p(99.9)=1.77ms  
     http_req_connecting............: avg=16.45µs  min=0s      med=0s      max=53.68ms  p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=99.67ms  min=1.59ms  med=93.59ms max=313.79ms p(90)=195.05ms p(95)=214.14ms p(99.9)=279.59ms
       { expected_response:true }...: avg=99.67ms  min=1.59ms  med=93.59ms max=313.79ms p(90)=195.05ms p(95)=214.14ms p(99.9)=279.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142686
     http_req_receiving.............: avg=162.22µs min=27.21µs med=60.48µs max=51.94ms  p(90)=153.39µs p(95)=386.97µs p(99.9)=18.3ms  
     http_req_sending...............: avg=76.86µs  min=5.38µs  med=12.19µs max=102.81ms p(90)=23.65µs  p(95)=137.61µs p(99.9)=10.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.43ms  min=1.54ms  med=93.37ms max=313.72ms p(90)=194.76ms p(95)=213.78ms p(99.9)=277.87ms
     http_reqs......................: 142686  2296.108835/s
     iteration_duration.............: avg=100.64ms min=3.58ms  med=94.75ms max=346.22ms p(90)=195.51ms p(95)=214.66ms p(99.9)=280.87ms
     iterations.....................: 141686  2280.016795/s
     success_rate...................: 100.00% ✓ 141686      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415179      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=10.87µs  min=882ns   med=2.21µs  max=43.41ms  p(90)=3.97µs   p(95)=5.11µs   p(99.9)=956.39µs
     http_req_connecting............: avg=7.89µs   min=0s      med=0s      max=43.35ms  p(90)=0s       p(95)=0s       p(99.9)=781.45µs
     http_req_duration..............: avg=102.07ms min=1.49ms  med=98.05ms max=385.96ms p(90)=194.67ms p(95)=210.59ms p(99.9)=267.95ms
       { expected_response:true }...: avg=102.07ms min=1.49ms  med=98.05ms max=385.96ms p(90)=194.67ms p(95)=210.59ms p(99.9)=267.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139393
     http_req_receiving.............: avg=980.52µs min=51.83µs med=130.1µs max=245.4ms  p(90)=1.8ms    p(95)=3.25ms   p(99.9)=34.02ms 
     http_req_sending...............: avg=54.68µs  min=4.71µs  med=9.32µs  max=127.03ms p(90)=19.86µs  p(95)=101.16µs p(99.9)=7.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.03ms min=1.41ms  med=96.99ms max=385.88ms p(90)=193.66ms p(95)=209.45ms p(99.9)=264.85ms
     http_reqs......................: 139393  2253.682837/s
     iteration_duration.............: avg=103.04ms min=3.39ms  med=99.18ms max=386.14ms p(90)=195.11ms p(95)=211.03ms p(99.9)=268.72ms
     iterations.....................: 138393  2237.515003/s
     success_rate...................: 100.00% ✓ 138393      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 409158      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=19.6µs   min=1.09µs  med=2.89µs   max=155.86ms p(90)=4.62µs   p(95)=5.81µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=15.49µs  min=0s      med=0s       max=155.76ms p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=103.56ms min=1.57ms  med=88.16ms  max=1.26s    p(90)=195.8ms  p(95)=231.51ms p(99.9)=844.69ms
       { expected_response:true }...: avg=103.56ms min=1.57ms  med=88.16ms  max=1.26s    p(90)=195.8ms  p(95)=231.51ms p(99.9)=844.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137386
     http_req_receiving.............: avg=2.34ms   min=54.85µs med=115.65µs max=794.04ms p(90)=2.17ms   p(95)=6.58ms   p(99.9)=216.27ms
     http_req_sending...............: avg=67.73µs  min=5.14µs  med=11.12µs  max=178.01ms p(90)=21.42µs  p(95)=119.85µs p(99.9)=9.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.15ms min=1.49ms  med=86.73ms  max=1.25s    p(90)=192.52ms p(95)=226.49ms p(99.9)=792.53ms
     http_reqs......................: 137386  2217.076627/s
     iteration_duration.............: avg=104.6ms  min=3.01ms  med=89.29ms  max=1.26s    p(90)=196.57ms p(95)=232.73ms p(99.9)=847.29ms
     iterations.....................: 136386  2200.939054/s
     success_rate...................: 100.00% ✓ 136386      ✗ 0     
     vus............................: 55      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 400914      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=17.69µs  min=881ns   med=2.63µs   max=80.89ms  p(90)=4.68µs   p(95)=5.81µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=14.1µs   min=0s      med=0s       max=80.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=105.75ms min=1.9ms   med=89.28ms  max=1.59s    p(90)=201.99ms p(95)=233.87ms p(99.9)=846.8ms 
       { expected_response:true }...: avg=105.75ms min=1.9ms   med=89.28ms  max=1.59s    p(90)=201.99ms p(95)=233.87ms p(99.9)=846.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 134638
     http_req_receiving.............: avg=2.06ms   min=52.59µs med=111.38µs max=1.02s    p(90)=1.95ms   p(95)=6.2ms    p(99.9)=141.31ms
     http_req_sending...............: avg=69.9µs   min=4.78µs  med=10.35µs  max=239.96ms p(90)=21.68µs  p(95)=113.84µs p(99.9)=9.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.62ms min=1.79ms  med=87.82ms  max=1.55s    p(90)=198.75ms p(95)=228.35ms p(99.9)=808ms   
     http_reqs......................: 134638  2159.0153/s
     iteration_duration.............: avg=106.81ms min=3.84ms  med=90.68ms  max=1.59s    p(90)=202.69ms p(95)=234.66ms p(99.9)=849.73ms
     iterations.....................: 133638  2142.979595/s
     success_rate...................: 100.00% ✓ 133638      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 391674      ✗ 0     
     data_received..................: 12 GB   186 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=16.12µs  min=1.01µs  med=2.79µs   max=76.92ms p(90)=4.46µs   p(95)=5.55µs   p(99.9)=1.11ms  
     http_req_connecting............: avg=12.43µs  min=0s      med=0s       max=76.88ms p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=108.23ms min=1.6ms   med=87.41ms  max=2.92s   p(90)=207.14ms p(95)=242.6ms  p(99.9)=989.93ms
       { expected_response:true }...: avg=108.23ms min=1.6ms   med=87.41ms  max=2.92s   p(90)=207.14ms p(95)=242.6ms  p(99.9)=989.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131558
     http_req_receiving.............: avg=2.02ms   min=53.83µs med=117.39µs max=1.92s   p(90)=2.13ms   p(95)=6.14ms   p(99.9)=125.48ms
     http_req_sending...............: avg=63.41µs  min=4.77µs  med=10.46µs  max=73.88ms p(90)=19.31µs  p(95)=112.02µs p(99.9)=8.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.14ms min=1.52ms  med=85.95ms  max=2.63s   p(90)=205.16ms p(95)=238.17ms p(99.9)=959.27ms
     http_reqs......................: 131558  2122.694832/s
     iteration_duration.............: avg=109.33ms min=3.55ms  med=88.66ms  max=2.92s   p(90)=207.83ms p(95)=243.42ms p(99.9)=992.04ms
     iterations.....................: 130558  2106.559782/s
     success_rate...................: 100.00% ✓ 130558      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 214557      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.79µs   min=882ns  med=2.68µs   max=9.24ms   p(90)=4.54µs   p(95)=5.52µs   p(99.9)=387.06µs
     http_req_connecting............: avg=2.4µs    min=0s     med=0s       max=9.17ms   p(90)=0s       p(95)=0s       p(99.9)=334.7µs 
     http_req_duration..............: avg=196.71ms min=1.97ms med=195.17ms max=502.97ms p(90)=366.07ms p(95)=390.21ms p(99.9)=463.68ms
       { expected_response:true }...: avg=196.71ms min=1.97ms med=195.17ms max=502.97ms p(90)=366.07ms p(95)=390.21ms p(99.9)=463.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72519
     http_req_receiving.............: avg=80.59µs  min=27.3µs med=64.74µs  max=75.51ms  p(90)=105.31µs p(95)=120.47µs p(99.9)=1.3ms   
     http_req_sending...............: avg=31.03µs  min=4.93µs med=12.16µs  max=124.33ms p(90)=20.12µs  p(95)=23.76µs  p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.6ms  min=1.91ms med=195.07ms max=502.89ms p(90)=365.96ms p(95)=390.11ms p(99.9)=463.54ms
     http_reqs......................: 72519   1157.771417/s
     iteration_duration.............: avg=199.71ms min=4.36ms med=198.3ms  max=503.18ms p(90)=366.95ms p(95)=390.88ms p(99.9)=463.93ms
     iterations.....................: 71519   1141.80634/s
     success_rate...................: 100.00% ✓ 71519       ✗ 0    
     vus............................: 86      min=0         max=499
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

     checks.........................: 100.00% ✓ 98178      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   624 kB/s
     http_req_blocked...............: avg=29.21µs  min=1.25µs  med=3.35µs   max=25.35ms  p(90)=5.07µs   p(95)=6.14µs   p(99.9)=12.46ms
     http_req_connecting............: avg=24.39µs  min=0s      med=0s       max=24.04ms  p(90)=0s       p(95)=0s       p(99.9)=11.5ms 
     http_req_duration..............: avg=425.47ms min=3.9ms   med=395.65ms max=1.87s    p(90)=837.14ms p(95)=914.14ms p(99.9)=1.38s  
       { expected_response:true }...: avg=425.47ms min=3.9ms   med=395.65ms max=1.87s    p(90)=837.14ms p(95)=914.14ms p(99.9)=1.38s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 33726
     http_req_receiving.............: avg=88.47µs  min=29.84µs med=77.09µs  max=24.84ms  p(90)=116.61µs p(95)=131.03µs p(99.9)=1.13ms 
     http_req_sending...............: avg=34.94µs  min=5.62µs  med=14.9µs   max=115.93ms p(90)=21.99µs  p(95)=25.03µs  p(99.9)=3.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=425.35ms min=3.81ms  med=395.56ms max=1.87s    p(90)=837.05ms p(95)=914.05ms p(99.9)=1.38s  
     http_reqs......................: 33726   520.151954/s
     iteration_duration.............: avg=438.7ms  min=15.99ms med=411.54ms max=1.87s    p(90)=841.9ms  p(95)=917.21ms p(99.9)=1.38s  
     iterations.....................: 32726   504.729077/s
     success_rate...................: 100.00% ✓ 32726      ✗ 0    
     vus............................: 95      min=0        max=500
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

     checks.........................: 100.00% ✓ 46203      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   292 kB/s
     http_req_blocked...............: avg=13.16µs  min=1.08µs  med=3.3µs    max=4.83ms  p(90)=5.09µs   p(95)=6.61µs   p(99.9)=2.25ms
     http_req_connecting............: avg=8.15µs   min=0s      med=0s       max=4.64ms  p(90)=0s       p(95)=0s       p(99.9)=2.22ms
     http_req_duration..............: avg=887.12ms min=5.73ms  med=797.05ms max=5.04s   p(90)=1.79s    p(95)=2.02s    p(99.9)=4.01s 
       { expected_response:true }...: avg=887.12ms min=5.73ms  med=797.05ms max=5.04s   p(90)=1.79s    p(95)=2.02s    p(99.9)=4.01s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16401
     http_req_receiving.............: avg=101.06µs min=33.79µs med=94.67µs  max=5.11ms  p(90)=132.67µs p(95)=148.39µs p(99.9)=1.03ms
     http_req_sending...............: avg=27.86µs  min=5.68µs  med=18.14µs  max=10.11ms p(90)=23.46µs  p(95)=28.73µs  p(99.9)=2.69ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=886.99ms min=5.6ms   med=796.87ms max=5.04s   p(90)=1.79s    p(95)=2.02s    p(99.9)=4.01s 
     http_reqs......................: 16401   242.985146/s
     iteration_duration.............: avg=944.71ms min=25.62ms med=862.57ms max=5.05s   p(90)=1.82s    p(95)=2.03s    p(99.9)=4.03s 
     iterations.....................: 15401   228.169882/s
     success_rate...................: 100.00% ✓ 15401      ✗ 0    
     vus............................: 79      min=0        max=500
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

     checks.........................: 100.00% ✓ 45033      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=13.83µs  min=1.31µs  med=3.66µs   max=8.43ms   p(90)=5.55µs   p(95)=7.29µs   p(99.9)=1.86ms
     http_req_connecting............: avg=8.32µs   min=0s      med=0s       max=8.37ms   p(90)=0s       p(95)=0s       p(99.9)=1.84ms
     http_req_duration..............: avg=907.59ms min=7.72ms  med=837.49ms max=3.09s    p(90)=1.86s    p(95)=1.97s    p(99.9)=2.78s 
       { expected_response:true }...: avg=907.59ms min=7.72ms  med=837.49ms max=3.09s    p(90)=1.86s    p(95)=1.97s    p(99.9)=2.78s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16011
     http_req_receiving.............: avg=116.37µs min=37.11µs med=92.06µs  max=160.14ms p(90)=132.88µs p(95)=149.26µs p(99.9)=1.46ms
     http_req_sending...............: avg=49.03µs  min=6.39µs  med=17.89µs  max=143.91ms p(90)=24.01µs  p(95)=29.05µs  p(99.9)=3.23ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=907.43ms min=7.6ms   med=837.38ms max=3.09s    p(90)=1.86s    p(95)=1.97s    p(99.9)=2.78s 
     http_reqs......................: 16011   232.88469/s
     iteration_duration.............: avg=968.01ms min=27.16ms med=897.33ms max=3.1s     p(90)=1.88s    p(95)=1.98s    p(99.9)=2.79s 
     iterations.....................: 15011   218.339396/s
     success_rate...................: 100.00% ✓ 15011      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

