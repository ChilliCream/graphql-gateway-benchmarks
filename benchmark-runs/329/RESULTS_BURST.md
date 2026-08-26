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
| hive-router | v0.0.84 | 2,688 | 2,844 | 2,656 | 2.4% |  |
| fusion-nightly-net11 | 16.6.2-p.7 | 2,670 | 2,771 | 2,649 | 1.6% |  |
| fusion-nightly | 16.6.2-p.7 | 2,580 | 2,669 | 2,564 | 1.3% |  |
| fusion | 16.6.1 | 2,454 | 2,551 | 2,434 | 1.6% |  |
| fusion-nightly-fed | 16.6.2-p.7 | 2,388 | 2,471 | 2,377 | 1.4% |  |
| cosmo | 0.334.0 | 1,227 | 1,266 | 1,220 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 556 | 572 | 553 | 1.3% |  |
| hive-gateway | 2.10.8 | 250 | 255 | 248 | 0.9% |  |
| apollo-gateway | 2.14.3 | 236 | 242 | 235 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (7083 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (511560 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.6.2-p.7 | 2,426 | 2,522 | 2,392 | 1.7% |  |
| fusion-nightly-net11 | 16.6.2-p.7 | 2,424 | 2,494 | 2,393 | 1.3% |  |
| fusion | 16.6.1 | 2,329 | 2,428 | 2,324 | 1.6% |  |
| hive-router | v0.0.84 | 2,319 | 2,460 | 2,282 | 2.4% |  |
| fusion-nightly-fed | 16.6.2-p.7 | 2,234 | 2,330 | 2,225 | 1.6% |  |
| cosmo | 0.334.0 | 1,170 | 1,205 | 1,162 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 526 | 540 | 523 | 1.0% |  |
| hive-gateway | 2.10.8 | 247 | 254 | 247 | 1.1% |  |
| apollo-gateway | 2.14.3 | 231 | 235 | 229 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (28486 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (324378 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 493926      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=13.91µs  min=801ns   med=2.06µs  max=42.04ms  p(90)=3.51µs   p(95)=4.6µs    p(99.9)=1.18ms  
     http_req_connecting............: avg=11.2µs   min=0s      med=0s      max=41.98ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=85.84ms  min=1.4ms   med=79.84ms max=326.5ms  p(90)=166.39ms p(95)=179.05ms p(99.9)=221.54ms
       { expected_response:true }...: avg=85.84ms  min=1.4ms   med=79.84ms max=326.5ms  p(90)=166.39ms p(95)=179.05ms p(99.9)=221.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165642
     http_req_receiving.............: avg=115.18µs min=24.08µs med=49.56µs max=46.63ms  p(90)=115.69µs p(95)=303.88µs p(99.9)=11.42ms 
     http_req_sending...............: avg=57.75µs  min=4.55µs  med=8.77µs  max=222.24ms p(90)=16.71µs  p(95)=106.82µs p(99.9)=7.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.67ms  min=1.35ms  med=79.68ms max=326.28ms p(90)=166.18ms p(95)=178.82ms p(99.9)=220.95ms
     http_reqs......................: 165642  2688.382723/s
     iteration_duration.............: avg=86.59ms  min=2.16ms  med=80.65ms max=344.85ms p(90)=166.81ms p(95)=179.42ms p(99.9)=222.66ms
     iterations.....................: 164642  2672.152644/s
     success_rate...................: 100.00% ✓ 164642      ✗ 0     
     vus............................: 85      min=0         max=493 
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

     checks.........................: 100.00% ✓ 495756      ✗ 0     
     data_received..................: 15 GB   234 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=23.26µs  min=982ns   med=2.68µs   max=76.87ms  p(90)=4.3µs    p(95)=5.44µs   p(99.9)=3.22ms  
     http_req_connecting............: avg=19.74µs  min=0s      med=0s       max=76.78ms  p(90)=0s       p(95)=0s       p(99.9)=3.06ms  
     http_req_duration..............: avg=85.49ms  min=1.84ms  med=79.61ms  max=328.63ms p(90)=164.52ms p(95)=181.94ms p(99.9)=239.54ms
       { expected_response:true }...: avg=85.49ms  min=1.84ms  med=79.61ms  max=328.63ms p(90)=164.52ms p(95)=181.94ms p(99.9)=239.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166252
     http_req_receiving.............: avg=583.38µs min=50.06µs med=100.28µs max=217.81ms p(90)=1.09ms   p(95)=1.95ms   p(99.9)=27.17ms 
     http_req_sending...............: avg=73.8µs   min=4.43µs  med=9.98µs   max=233.24ms p(90)=19.41µs  p(95)=120.98µs p(99.9)=10.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.84ms  min=1.78ms  med=78.92ms  max=328.53ms p(90)=163.74ms p(95)=181.15ms p(99.9)=238.27ms
     http_reqs......................: 166252  2670.506021/s
     iteration_duration.............: avg=86.27ms  min=3.68ms  med=80.48ms  max=328.83ms p(90)=164.98ms p(95)=182.43ms p(99.9)=240.51ms
     iterations.....................: 165252  2654.44302/s
     success_rate...................: 100.00% ✓ 165252      ✗ 0     
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

     checks.........................: 100.00% ✓ 479871      ✗ 0     
     data_received..................: 14 GB   226 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=17.71µs min=822ns  med=1.96µs  max=62.44ms  p(90)=3.3µs    p(95)=4.35µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=15.13µs min=0s     med=0s      max=62.32ms  p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=88.35ms min=1.94ms med=76.93ms max=1.53s    p(90)=165.37ms p(95)=193.29ms p(99.9)=969.2ms 
       { expected_response:true }...: avg=88.35ms min=1.94ms med=76.93ms max=1.53s    p(90)=165.37ms p(95)=193.29ms p(99.9)=969.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 160957
     http_req_receiving.............: avg=1.38ms  min=49.7µs med=93.67µs max=889.89ms p(90)=1.47ms   p(95)=4.15ms   p(99.9)=108.28ms
     http_req_sending...............: avg=64.2µs  min=4.45µs med=8.47µs  max=144.96ms p(90)=16.13µs  p(95)=101.79µs p(99.9)=8.84ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.91ms min=1.86ms med=75.86ms max=1.5s     p(90)=163.77ms p(95)=190.41ms p(99.9)=925.58ms
     http_reqs......................: 160957  2580.116372/s
     iteration_duration.............: avg=89.15ms min=3.4ms  med=77.76ms max=1.53s    p(90)=165.97ms p(95)=194.1ms  p(99.9)=970.03ms
     iterations.....................: 159957  2564.086523/s
     success_rate...................: 100.00% ✓ 159957      ✗ 0     
     vus............................: 74      min=0         max=494 
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

     checks.........................: 100.00% ✓ 455676      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 184 MB  2.9 MB/s
     http_req_blocked...............: avg=15.06µs min=812ns   med=2.02µs  max=75.79ms  p(90)=3.36µs   p(95)=4.33µs   p(99.9)=907.25µs
     http_req_connecting............: avg=12.09µs min=0s      med=0s      max=75.74ms  p(90)=0s       p(95)=0s       p(99.9)=828.55µs
     http_req_duration..............: avg=93.04ms min=1.93ms  med=82.32ms max=2.35s    p(90)=177.82ms p(95)=204.33ms p(99.9)=620.23ms
       { expected_response:true }...: avg=93.04ms min=1.93ms  med=82.32ms max=2.35s    p(90)=177.82ms p(95)=204.33ms p(99.9)=620.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152892
     http_req_receiving.............: avg=1.3ms   min=49.75µs med=99.96µs max=560.01ms p(90)=1.68ms   p(95)=4.17ms   p(99.9)=80.55ms 
     http_req_sending...............: avg=59.21µs min=4.26µs  med=8.49µs  max=178.6ms  p(90)=15.55µs  p(95)=98.05µs  p(99.9)=7.84ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.67ms min=1.85ms  med=81.02ms max=2.35s    p(90)=176.05ms p(95)=201.38ms p(99.9)=574.46ms
     http_reqs......................: 152892  2454.036375/s
     iteration_duration.............: avg=93.89ms min=3.27ms  med=83.34ms max=2.35s    p(90)=178.34ms p(95)=204.98ms p(99.9)=624.18ms
     iterations.....................: 151892  2437.985592/s
     success_rate...................: 100.00% ✓ 151892      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 441363      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=16.72µs min=812ns   med=2.18µs  max=74.64ms  p(90)=3.84µs   p(95)=4.96µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=13.26µs min=0s      med=0s      max=55.83ms  p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=96.07ms min=1.6ms   med=83.77ms max=2.08s    p(90)=181.31ms p(95)=209.67ms p(99.9)=827.91ms
       { expected_response:true }...: avg=96.07ms min=1.6ms   med=83.77ms max=2.08s    p(90)=181.31ms p(95)=209.67ms p(99.9)=827.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148121
     http_req_receiving.............: avg=1.06ms  min=51.27µs med=98.3µs  max=1.08s    p(90)=1.44ms   p(95)=3.46ms   p(99.9)=57.88ms 
     http_req_sending...............: avg=60.91µs min=4.53µs  med=9.08µs  max=296.02ms p(90)=18.29µs  p(95)=102.06µs p(99.9)=7.93ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.94ms min=1.52ms  med=82.85ms max=2.08s    p(90)=179.76ms p(95)=207.58ms p(99.9)=819.74ms
     http_reqs......................: 148121  2388.495079/s
     iteration_duration.............: avg=96.97ms min=2.77ms  med=84.74ms max=2.08s    p(90)=181.88ms p(95)=210.29ms p(99.9)=830.05ms
     iterations.....................: 147121  2372.369782/s
     success_rate...................: 100.00% ✓ 147121      ✗ 0     
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

     checks.........................: 100.00% ✓ 227136      ✗ 0    
     data_received..................: 6.7 GB  108 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=5.35µs   min=1µs     med=2.47µs   max=23.99ms  p(90)=4.05µs   p(95)=4.92µs   p(99.9)=391µs   
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=23.91ms  p(90)=0s       p(95)=0s       p(99.9)=340.62µs
     http_req_duration..............: avg=185.97ms min=1.9ms   med=186.24ms max=486.29ms p(90)=345.24ms p(95)=370.14ms p(99.9)=440.29ms
       { expected_response:true }...: avg=185.97ms min=1.9ms   med=186.24ms max=486.29ms p(90)=345.24ms p(95)=370.14ms p(99.9)=440.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76712
     http_req_receiving.............: avg=74.18µs  min=28.69µs med=59.3µs   max=146.98ms p(90)=94.72µs  p(95)=109.02µs p(99.9)=1ms     
     http_req_sending...............: avg=27.58µs  min=4.9µs   med=10.41µs  max=94.86ms  p(90)=16.62µs  p(95)=20.42µs  p(99.9)=3.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.87ms min=1.85ms  med=186.12ms max=486.22ms p(90)=345.15ms p(95)=370.05ms p(99.9)=440.15ms
     http_reqs......................: 76712   1227.609121/s
     iteration_duration.............: avg=188.66ms min=4.04ms  med=189.11ms max=486.47ms p(90)=346.03ms p(95)=370.78ms p(99.9)=441.06ms
     iterations.....................: 75712   1211.606291/s
     success_rate...................: 100.00% ✓ 75712       ✗ 0    
     vus............................: 78      min=0         max=493
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

     checks.........................: 100.00% ✓ 104304     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   668 kB/s
     http_req_blocked...............: avg=8.37µs   min=1µs     med=2.32µs   max=15.87ms  p(90)=3.89µs   p(95)=4.83µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=5.09µs   min=0s      med=0s       max=15.81ms  p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=401.01ms min=3.58ms  med=372.47ms max=1.63s    p(90)=788.45ms p(95)=855.79ms p(99.9)=1.28s   
       { expected_response:true }...: avg=401.01ms min=3.58ms  med=372.47ms max=1.63s    p(90)=788.45ms p(95)=855.79ms p(99.9)=1.28s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35768
     http_req_receiving.............: avg=75.49µs  min=30.65µs med=65.17µs  max=6.86ms   p(90)=104.35µs p(95)=118µs    p(99.9)=951.13µs
     http_req_sending...............: avg=33.31µs  min=5.12µs  med=11.67µs  max=124.37ms p(90)=18.98µs  p(95)=21.75µs  p(99.9)=2.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=400.9ms  min=3.5ms   med=372.4ms  max=1.63s    p(90)=788.36ms p(95)=855.71ms p(99.9)=1.28s   
     http_reqs......................: 35768   556.30778/s
     iteration_duration.............: avg=412.77ms min=32.4ms  med=386.55ms max=1.63s    p(90)=792.05ms p(95)=858.47ms p(99.9)=1.28s   
     iterations.....................: 34768   540.754554/s
     success_rate...................: 100.00% ✓ 34768      ✗ 0    
     vus............................: 70      min=0        max=495
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

     checks.........................: 100.00% ✓ 47892      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   302 kB/s
     http_req_blocked...............: avg=13.07µs  min=1.46µs  med=3.73µs   max=3.38ms  p(90)=5.44µs   p(95)=6.84µs   p(99.9)=2.03ms
     http_req_connecting............: avg=7.7µs    min=0s      med=0s       max=3.34ms  p(90)=0s       p(95)=0s       p(99.9)=2.01ms
     http_req_duration..............: avg=837.98ms min=5.89ms  med=716.57ms max=20.94s  p(90)=1.39s    p(95)=1.55s    p(99.9)=18.76s
       { expected_response:true }...: avg=837.98ms min=5.89ms  med=716.57ms max=20.94s  p(90)=1.39s    p(95)=1.55s    p(99.9)=18.76s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16964
     http_req_receiving.............: avg=98.76µs  min=34.17µs med=88.55µs  max=16.25ms p(90)=125.19µs p(95)=140.89µs p(99.9)=1.45ms
     http_req_sending...............: avg=41.4µs   min=6.69µs  med=17.45µs  max=91.72ms p(90)=23.23µs  p(95)=27.01µs  p(99.9)=3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=837.84ms min=5.79ms  med=716.45ms max=20.94s  p(90)=1.39s    p(95)=1.55s    p(99.9)=18.76s
     http_reqs......................: 16964   250.516425/s
     iteration_duration.............: avg=890.49ms min=35.74ms med=776.81ms max=20.94s  p(90)=1.41s    p(95)=1.56s    p(99.9)=18.77s
     iterations.....................: 15964   235.748892/s
     success_rate...................: 100.00% ✓ 15964      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 48696      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   290 kB/s
     http_req_blocked...............: avg=14.82µs  min=1.39µs  med=3.53µs   max=12.74ms  p(90)=5.24µs   p(95)=6.64µs   p(99.9)=2.19ms
     http_req_connecting............: avg=9.57µs   min=0s      med=0s       max=12.67ms  p(90)=0s       p(95)=0s       p(99.9)=2.17ms
     http_req_duration..............: avg=369.19ms min=7.38ms  med=387.11ms max=1.15s    p(90)=662.08ms p(95)=732.78ms p(99.9)=1.05s 
       { expected_response:true }...: avg=369.19ms min=7.38ms  med=387.11ms max=1.15s    p(90)=662.08ms p(95)=732.78ms p(99.9)=1.05s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17232
     http_req_receiving.............: avg=102.61µs min=34.53µs med=84.49µs  max=115.15ms p(90)=123.95µs p(95)=139.42µs p(99.9)=1.2ms 
     http_req_sending...............: avg=46.36µs  min=6.35µs  med=17.58µs  max=94.42ms  p(90)=23.39µs  p(95)=27.91µs  p(99.9)=4.49ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=369.04ms min=7.29ms  med=386.91ms max=1.15s    p(90)=661.97ms p(95)=732.66ms p(99.9)=1.04s 
     http_reqs......................: 17232   236.364357/s
     iteration_duration.............: avg=391.96ms min=13.13ms med=407.2ms  max=1.16s    p(90)=678.23ms p(95)=738.7ms  p(99.9)=1.05s 
     iterations.....................: 16232   222.647762/s
     success_rate...................: 100.00% ✓ 16232      ✗ 0    
     vus............................: 44      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 447360      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=17.1µs  min=862ns  med=2.21µs   max=74.12ms  p(90)=3.91µs   p(95)=5.08µs   p(99.9)=1.09ms  
     http_req_connecting............: avg=14.21µs min=0s     med=0s       max=74.05ms  p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=94.82ms min=1.46ms med=77.92ms  max=1.66s    p(90)=177.13ms p(95)=211.95ms p(99.9)=902.84ms
       { expected_response:true }...: avg=94.82ms min=1.46ms med=77.92ms  max=1.66s    p(90)=177.13ms p(95)=211.95ms p(99.9)=902.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150120
     http_req_receiving.............: avg=2.11ms  min=53.1µs med=104.58µs max=1.05s    p(90)=1.91ms   p(95)=5.7ms    p(99.9)=227.99ms
     http_req_sending...............: avg=65.72µs min=4.32µs med=9.2µs    max=176.98ms p(90)=19.35µs  p(95)=104.75µs p(99.9)=9.16ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.64ms min=1.39ms med=76.84ms  max=1.66s    p(90)=174.64ms p(95)=207.18ms p(99.9)=861.37ms
     http_reqs......................: 150120  2426.663621/s
     iteration_duration.............: avg=95.73ms min=3.12ms med=78.92ms  max=1.67s    p(90)=177.74ms p(95)=212.76ms p(99.9)=904.8ms 
     iterations.....................: 149120  2410.498795/s
     success_rate...................: 100.00% ✓ 149120      ✗ 0     
     vus............................: 99      min=0         max=500 
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

     checks.........................: 100.00% ✓ 446550      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=17.47µs  min=962ns   med=2.82µs   max=51.43ms  p(90)=4.52µs   p(95)=5.69µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=13.82µs  min=0s      med=0s       max=48.85ms  p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=94.88ms  min=1.38ms  med=90.42ms  max=332.73ms p(90)=181.46ms p(95)=197.98ms p(99.9)=257.6ms 
       { expected_response:true }...: avg=94.88ms  min=1.38ms  med=90.42ms  max=332.73ms p(90)=181.46ms p(95)=197.98ms p(99.9)=257.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149850
     http_req_receiving.............: avg=705.26µs min=53.52µs med=110.87µs max=199.79ms p(90)=1.29ms   p(95)=2.34ms   p(99.9)=29.69ms 
     http_req_sending...............: avg=65.25µs  min=4.51µs  med=10.53µs  max=102.3ms  p(90)=20.3µs   p(95)=121.27µs p(99.9)=8.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.11ms  min=1.3ms   med=89.55ms  max=332.64ms p(90)=180.56ms p(95)=197.03ms p(99.9)=255.93ms
     http_reqs......................: 149850  2424.695825/s
     iteration_duration.............: avg=95.78ms  min=3ms     med=91.41ms  max=332.92ms p(90)=182ms    p(95)=198.46ms p(99.9)=258.02ms
     iterations.....................: 148850  2408.515005/s
     success_rate...................: 100.00% ✓ 148850      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 429486      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=14.12µs min=862ns   med=2.17µs   max=83.74ms  p(90)=3.74µs   p(95)=4.79µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=11.22µs min=0s      med=0s       max=73.94ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=98.73ms min=1.52ms  med=88.7ms   max=1.5s     p(90)=186.51ms p(95)=214.26ms p(99.9)=750.47ms
       { expected_response:true }...: avg=98.73ms min=1.52ms  med=88.7ms   max=1.5s     p(90)=186.51ms p(95)=214.26ms p(99.9)=750.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144162
     http_req_receiving.............: avg=1.35ms  min=52.73µs med=105.73µs max=697.41ms p(90)=1.71ms   p(95)=4.17ms   p(99.9)=104.35ms
     http_req_sending...............: avg=57.3µs  min=4.66µs  med=9.18µs   max=73.92ms  p(90)=17.85µs  p(95)=98.36µs  p(99.9)=7.65ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.32ms min=1.45ms  med=87.43ms  max=1.5s     p(90)=184.9ms  p(95)=211.45ms p(99.9)=738.91ms
     http_reqs......................: 144162  2329.543511/s
     iteration_duration.............: avg=99.67ms min=2.75ms  med=89.75ms  max=1.51s    p(90)=187.05ms p(95)=214.89ms p(99.9)=755.88ms
     iterations.....................: 143162  2313.384304/s
     success_rate...................: 100.00% ✓ 143162      ✗ 0     
     vus............................: 51      min=0         max=499 
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

     checks.........................: 100.00% ✓ 428853      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=14.44µs  min=881ns   med=2.58µs  max=74.46ms  p(90)=4.51µs   p(95)=5.76µs   p(99.9)=725.06µs
     http_req_connecting............: avg=10.91µs  min=0s      med=0s      max=74.35ms  p(90)=0s       p(95)=0s       p(99.9)=648.94µs
     http_req_duration..............: avg=98.82ms  min=1.63ms  med=92.89ms max=323.81ms p(90)=191.8ms  p(95)=209.68ms p(99.9)=264.54ms
       { expected_response:true }...: avg=98.82ms  min=1.63ms  med=92.89ms max=323.81ms p(90)=191.8ms  p(95)=209.68ms p(99.9)=264.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143951
     http_req_receiving.............: avg=120.28µs min=26.04µs med=55.92µs max=43.46ms  p(90)=120.61µs p(95)=328.64µs p(99.9)=10.08ms 
     http_req_sending...............: avg=62.29µs  min=4.88µs  med=10.85µs max=194.81ms p(90)=21.06µs  p(95)=118.55µs p(99.9)=7.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.64ms  min=1.56ms  med=92.71ms max=323.58ms p(90)=191.57ms p(95)=209.41ms p(99.9)=263.53ms
     http_reqs......................: 143951  2319.899329/s
     iteration_duration.............: avg=99.76ms  min=3.23ms  med=93.92ms max=360.75ms p(90)=192.27ms p(95)=210.09ms p(99.9)=265.41ms
     iterations.....................: 142951  2303.783433/s
     success_rate...................: 100.00% ✓ 142951      ✗ 0     
     vus............................: 59      min=0         max=498 
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

     checks.........................: 100.00% ✓ 414144      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=15.81µs  min=922ns   med=2.41µs   max=69.15ms p(90)=4.27µs   p(95)=5.51µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=12.59µs  min=0s      med=0s       max=69.09ms p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=102.32ms min=1.7ms   med=84.04ms  max=3.02s   p(90)=195.9ms  p(95)=225.5ms  p(99.9)=1s      
       { expected_response:true }...: avg=102.32ms min=1.7ms   med=84.04ms  max=3.02s   p(90)=195.9ms  p(95)=225.5ms  p(99.9)=1s      
     http_req_failed................: 0.00%   ✓ 0           ✗ 139048
     http_req_receiving.............: avg=1.58ms   min=51.75µs med=107.69µs max=1.91s   p(90)=1.59ms   p(95)=3.91ms   p(99.9)=135.18ms
     http_req_sending...............: avg=60.86µs  min=4.97µs  med=10.1µs   max=66.63ms p(90)=20.57µs  p(95)=105.21µs p(99.9)=8.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.68ms min=1.63ms  med=82.87ms  max=3.02s   p(90)=194.2ms  p(95)=222.25ms p(99.9)=923.67ms
     http_reqs......................: 139048  2234.455079/s
     iteration_duration.............: avg=103.33ms min=3.02ms  med=85.12ms  max=3.02s   p(90)=196.47ms p(95)=226.16ms p(99.9)=1.01s   
     iterations.....................: 138048  2218.385412/s
     success_rate...................: 100.00% ✓ 138048      ✗ 0     
     vus............................: 67      min=0         max=496 
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

     checks.........................: 100.00% ✓ 216645      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=4.71µs   min=902ns  med=2.32µs   max=5.98ms   p(90)=4.09µs   p(95)=5.06µs   p(99.9)=421.87µs
     http_req_connecting............: avg=1.73µs   min=0s     med=0s       max=5.93ms   p(90)=0s       p(95)=0s       p(99.9)=361.36µs
     http_req_duration..............: avg=194.91ms min=1.87ms med=195.99ms max=532.8ms  p(90)=361.55ms p(95)=386.72ms p(99.9)=466.85ms
       { expected_response:true }...: avg=194.91ms min=1.87ms med=195.99ms max=532.8ms  p(90)=361.55ms p(95)=386.72ms p(99.9)=466.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73215
     http_req_receiving.............: avg=77.31µs  min=26.6µs med=62.65µs  max=65.57ms  p(90)=103.67µs p(95)=118.93µs p(99.9)=1.18ms  
     http_req_sending...............: avg=28.75µs  min=5.01µs med=11.21µs  max=121.11ms p(90)=19.21µs  p(95)=22.93µs  p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.81ms min=1.81ms med=195.89ms max=532.75ms p(90)=361.43ms p(95)=386.61ms p(99.9)=466.72ms
     http_reqs......................: 73215   1170.010272/s
     iteration_duration.............: avg=197.84ms min=4.51ms med=199.23ms max=532.99ms p(90)=362.39ms p(95)=387.34ms p(99.9)=467.18ms
     iterations.....................: 72215   1154.0298/s
     success_rate...................: 100.00% ✓ 72215       ✗ 0    
     vus............................: 84      min=0         max=497
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

     checks.........................: 100.00% ✓ 99180      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   632 kB/s
     http_req_blocked...............: avg=8.77µs   min=1.04µs  med=2.73µs   max=9.68ms  p(90)=4.47µs   p(95)=5.46µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=4.9µs    min=0s      med=0s       max=9.61ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=421.2ms  min=3.73ms  med=395.87ms max=1.7s    p(90)=819.86ms p(95)=894.97ms p(99.9)=1.32s   
       { expected_response:true }...: avg=421.2ms  min=3.73ms  med=395.87ms max=1.7s    p(90)=819.86ms p(95)=894.97ms p(99.9)=1.32s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34060
     http_req_receiving.............: avg=82.14µs  min=29.84µs med=71.44µs  max=34.64ms p(90)=110.89µs p(95)=124.82µs p(99.9)=893.77µs
     http_req_sending...............: avg=26.77µs  min=5.18µs  med=13.91µs  max=45.58ms p(90)=21.05µs  p(95)=24.07µs  p(99.9)=2.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=421.1ms  min=3.67ms  med=395.72ms max=1.7s    p(90)=819.75ms p(95)=894.86ms p(99.9)=1.32s   
     http_reqs......................: 34060   526.56292/s
     iteration_duration.............: avg=434.16ms min=19.22ms med=410.3ms  max=1.71s   p(90)=823.15ms p(95)=898.08ms p(99.9)=1.33s   
     iterations.....................: 33060   511.103057/s
     success_rate...................: 100.00% ✓ 33060      ✗ 0    
     vus............................: 88      min=0        max=500
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

     checks.........................: 100.00% ✓ 47196      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   297 kB/s
     http_req_blocked...............: avg=14.48µs  min=1.12µs  med=3.24µs   max=7.03ms   p(90)=5.12µs   p(95)=6.78µs  p(99.9)=2.08ms
     http_req_connecting............: avg=9.44µs   min=0s      med=0s       max=6.84ms   p(90)=0s       p(95)=0s      p(99.9)=2.06ms
     http_req_duration..............: avg=869.4ms  min=6.05ms  med=781.25ms max=4.73s    p(90)=1.75s    p(95)=1.96s   p(99.9)=3.99s 
       { expected_response:true }...: avg=869.4ms  min=6.05ms  med=781.25ms max=4.73s    p(90)=1.75s    p(95)=1.96s   p(99.9)=3.99s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16732
     http_req_receiving.............: avg=108.62µs min=32.86µs med=93.23µs  max=100.44ms p(90)=133.88µs p(95)=149.3µs p(99.9)=1.39ms
     http_req_sending...............: avg=49.76µs  min=5.49µs  med=18.2µs   max=123.58ms p(90)=23.84µs  p(95)=28.81µs p(99.9)=3.23ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=869.24ms min=5.96ms  med=781.12ms max=4.73s    p(90)=1.75s    p(95)=1.96s   p(99.9)=3.99s 
     http_reqs......................: 16732   247.538067/s
     iteration_duration.............: avg=924.75ms min=23.71ms med=856.81ms max=4.73s    p(90)=1.76s    p(95)=1.97s   p(99.9)=4.03s 
     iterations.....................: 15732   232.743777/s
     success_rate...................: 100.00% ✓ 15732      ✗ 0    
     vus............................: 85      min=0        max=500
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

     checks.........................: 100.00% ✓ 44817      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   278 kB/s
     http_req_blocked...............: avg=14.16µs  min=1.21µs  med=3.16µs   max=5.02ms  p(90)=4.9µs    p(95)=6.6µs    p(99.9)=2.1ms   
     http_req_connecting............: avg=9.25µs   min=0s      med=0s       max=4.92ms  p(90)=0s       p(95)=0s       p(99.9)=2.08ms  
     http_req_duration..............: avg=911.58ms min=7.82ms  med=830.41ms max=3.16s   p(90)=1.86s    p(95)=1.97s    p(99.9)=2.79s   
       { expected_response:true }...: avg=911.58ms min=7.82ms  med=830.41ms max=3.16s   p(90)=1.86s    p(95)=1.97s    p(99.9)=2.79s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15939
     http_req_receiving.............: avg=98.72µs  min=32.26µs med=89.23µs  max=48.05ms p(90)=127.82µs p(95)=144.49µs p(99.9)=914.72µs
     http_req_sending...............: avg=35.84µs  min=5.61µs  med=17.17µs  max=67.79ms p(90)=22.76µs  p(95)=27.77µs  p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=911.45ms min=7.73ms  med=830.27ms max=3.16s   p(90)=1.86s    p(95)=1.97s    p(99.9)=2.79s   
     http_reqs......................: 15939   231.309887/s
     iteration_duration.............: avg=972.55ms min=64.42ms med=902.38ms max=3.17s   p(90)=1.87s    p(95)=1.98s    p(99.9)=2.81s   
     iterations.....................: 14939   216.797692/s
     success_rate...................: 100.00% ✓ 14939      ✗ 0    
     vus............................: 22      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

