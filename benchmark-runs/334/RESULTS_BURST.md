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
| hive-router | v0.0.84 | 2,917 | 3,051 | 2,899 | 1.8% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,610 | 2,718 | 2,588 | 1.6% |  |
| fusion-nightly | 16.7.0-p.1 | 2,568 | 2,648 | 2,539 | 1.3% |  |
| fusion | 16.6.2 | 2,508 | 2,562 | 2,471 | 1.0% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,389 | 2,477 | 2,381 | 1.4% |  |
| cosmo | 0.334.0 | 1,189 | 1,226 | 1,176 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 589 | 575 | 0.9% |  |
| hive-gateway | 2.10.8 | 251 | 258 | 249 | 1.1% |  |
| apollo-gateway | 2.14.3 | 235 | 241 | 234 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (15215 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (505634 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.7.0-p.1 | 2,428 | 2,533 | 2,419 | 1.6% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,404 | 2,499 | 2,385 | 1.5% |  |
| fusion | 16.6.2 | 2,324 | 2,419 | 2,300 | 1.8% |  |
| hive-router | v0.0.84 | 2,302 | 2,437 | 2,268 | 2.5% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,238 | 2,332 | 2,235 | 1.6% |  |
| cosmo | 0.334.0 | 1,155 | 1,195 | 1,148 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 545 | 556 | 543 | 0.8% |  |
| hive-gateway | 2.10.8 | 245 | 250 | 242 | 1.1% |  |
| apollo-gateway | 2.14.3 | 236 | 238 | 233 | 0.6% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (25124 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (345506 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 536940      ✗ 0     
     data_received..................: 16 GB   256 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=17.51µs  min=822ns   med=2.08µs  max=55.21ms  p(90)=3.59µs   p(95)=4.71µs   p(99.9)=1.19ms  
     http_req_connecting............: avg=14.53µs  min=0s      med=0s      max=55.06ms  p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=78.95ms  min=1.39ms  med=74.38ms max=245.63ms p(90)=151.72ms p(95)=165.45ms p(99.9)=209.01ms
       { expected_response:true }...: avg=78.95ms  min=1.39ms  med=74.38ms max=245.63ms p(90)=151.72ms p(95)=165.45ms p(99.9)=209.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179980
     http_req_receiving.............: avg=141.86µs min=24.87µs med=48.04µs max=42.41ms  p(90)=135.04µs p(95)=323.46µs p(99.9)=17.29ms 
     http_req_sending...............: avg=68.63µs  min=4.39µs  med=8.78µs  max=170.75ms p(90)=17.8µs   p(95)=111.38µs p(99.9)=9.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.74ms  min=1.34ms  med=74.18ms max=245.58ms p(90)=151.41ms p(95)=165.1ms  p(99.9)=208.38ms
     http_reqs......................: 179980  2917.958333/s
     iteration_duration.............: avg=79.64ms  min=2.4ms   med=75.15ms max=370.21ms p(90)=152.1ms  p(95)=165.82ms p(99.9)=210.03ms
     iterations.....................: 178980  2901.745652/s
     success_rate...................: 100.00% ✓ 178980      ✗ 0     
     vus............................: 87      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 484050      ✗ 0     
     data_received..................: 14 GB   229 MB/s
     data_sent......................: 195 MB  3.1 MB/s
     http_req_blocked...............: avg=25.41µs  min=1.01µs  med=2.71µs  max=72.52ms  p(90)=4.42µs   p(95)=5.62µs   p(99.9)=3.69ms  
     http_req_connecting............: avg=22.04µs  min=0s      med=0s      max=72.45ms  p(90)=0s       p(95)=0s       p(99.9)=3.62ms  
     http_req_duration..............: avg=87.54ms  min=1.89ms  med=82.32ms max=322.27ms p(90)=168.66ms p(95)=187.38ms p(99.9)=246.83ms
       { expected_response:true }...: avg=87.54ms  min=1.89ms  med=82.32ms max=322.27ms p(90)=168.66ms p(95)=187.38ms p(99.9)=246.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162350
     http_req_receiving.............: avg=600.23µs min=52.96µs med=102.8µs max=76.35ms  p(90)=1.09ms   p(95)=1.98ms   p(99.9)=28.44ms 
     http_req_sending...............: avg=80.52µs  min=4.26µs  med=9.89µs  max=300.68ms p(90)=19.79µs  p(95)=125.13µs p(99.9)=11.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.85ms  min=1.8ms   med=81.63ms max=301.59ms p(90)=167.87ms p(95)=186.53ms p(99.9)=245.63ms
     http_reqs......................: 162350  2610.956939/s
     iteration_duration.............: avg=88.36ms  min=3.77ms  med=83.21ms max=335.46ms p(90)=169.25ms p(95)=187.95ms p(99.9)=247.69ms
     iterations.....................: 161350  2594.874666/s
     success_rate...................: 100.00% ✓ 161350      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 476883      ✗ 0     
     data_received..................: 14 GB   225 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=22.55µs min=1.06µs  med=2.62µs  max=68.77ms p(90)=4.21µs   p(95)=5.4µs    p(99.9)=2.33ms  
     http_req_connecting............: avg=19.24µs min=0s      med=0s      max=68.5ms  p(90)=0s       p(95)=0s       p(99.9)=2.27ms  
     http_req_duration..............: avg=88.9ms  min=1.89ms  med=74.67ms max=1.39s   p(90)=169.93ms p(95)=200.94ms p(99.9)=644.35ms
       { expected_response:true }...: avg=88.9ms  min=1.89ms  med=74.67ms max=1.39s   p(90)=169.93ms p(95)=200.94ms p(99.9)=644.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159961
     http_req_receiving.............: avg=1.38ms  min=51.06µs med=97.18µs max=796.1ms p(90)=1.39ms   p(95)=4.05ms   p(99.9)=114.77ms
     http_req_sending...............: avg=78.1µs  min=4.46µs  med=9.76µs  max=135.8ms p(90)=18.37µs  p(95)=116.11µs p(99.9)=11.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.44ms min=1.83ms  med=73.65ms max=1.39s   p(90)=167.88ms p(95)=197.6ms  p(99.9)=642.9ms 
     http_reqs......................: 159961  2568.216483/s
     iteration_duration.............: avg=89.75ms min=3.24ms  med=75.57ms max=1.4s    p(90)=170.54ms p(95)=201.72ms p(99.9)=646.18ms
     iterations.....................: 158961  2552.161217/s
     success_rate...................: 100.00% ✓ 158961      ✗ 0     
     vus............................: 71      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 465897      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=16.1µs  min=872ns   med=2.11µs  max=55.6ms   p(90)=3.58µs   p(95)=4.65µs   p(99.9)=1.93ms  
     http_req_connecting............: avg=13.25µs min=0s      med=0s      max=49.24ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=91.01ms min=1.95ms  med=81.17ms max=1.31s    p(90)=171.19ms p(95)=195.84ms p(99.9)=845.96ms
       { expected_response:true }...: avg=91.01ms min=1.95ms  med=81.17ms max=1.31s    p(90)=171.19ms p(95)=195.84ms p(99.9)=845.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156299
     http_req_receiving.............: avg=1.17ms  min=52.38µs med=97.01µs max=746.34ms p(90)=1.47ms   p(95)=3.96ms   p(99.9)=76.15ms 
     http_req_sending...............: avg=61.04µs min=4.88µs  med=8.95µs  max=63.93ms  p(90)=17.01µs  p(95)=106.28µs p(99.9)=8.59ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.77ms min=1.88ms  med=79.75ms max=1.31s    p(90)=169.52ms p(95)=193.62ms p(99.9)=814.44ms
     http_reqs......................: 156299  2508.025987/s
     iteration_duration.............: avg=91.84ms min=2.98ms  med=82.13ms max=1.31s    p(90)=171.73ms p(95)=196.5ms  p(99.9)=847.01ms
     iterations.....................: 155299  2491.979653/s
     success_rate...................: 100.00% ✓ 155299      ✗ 0     
     vus............................: 72      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441528      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=12.5µs  min=881ns   med=2.14µs  max=47.83ms  p(90)=3.64µs   p(95)=4.71µs   p(99.9)=877.64µs
     http_req_connecting............: avg=9.6µs   min=0s      med=0s      max=47.78ms  p(90)=0s       p(95)=0s       p(99.9)=786.58µs
     http_req_duration..............: avg=96ms    min=1.63ms  med=81.24ms max=1.18s    p(90)=181.02ms p(95)=212.61ms p(99.9)=722.94ms
       { expected_response:true }...: avg=96ms    min=1.63ms  med=81.24ms max=1.18s    p(90)=181.02ms p(95)=212.61ms p(99.9)=722.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148176
     http_req_receiving.............: avg=1.32ms  min=51.05µs med=96.16µs max=864.82ms p(90)=1.63ms   p(95)=4.11ms   p(99.9)=103.73ms
     http_req_sending...............: avg=57.46µs min=4.58µs  med=9.07µs  max=150.73ms p(90)=16.92µs  p(95)=95.37µs  p(99.9)=7.84ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.62ms min=1.56ms  med=80.2ms  max=1.18s    p(90)=179.36ms p(95)=208.97ms p(99.9)=710.96ms
     http_reqs......................: 148176  2389.054409/s
     iteration_duration.............: avg=96.91ms min=2.82ms  med=82.28ms max=1.18s    p(90)=181.56ms p(95)=213.37ms p(99.9)=728.04ms
     iterations.....................: 147176  2372.931323/s
     success_rate...................: 100.00% ✓ 147176      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 220068      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=5.79µs   min=990ns   med=2.66µs   max=9.1ms    p(90)=4.29µs   p(95)=5.17µs   p(99.9)=465.69µs
     http_req_connecting............: avg=2.49µs   min=0s      med=0s       max=9.04ms   p(90)=0s       p(95)=0s       p(99.9)=436.89µs
     http_req_duration..............: avg=191.88ms min=1.95ms  med=192.58ms max=532.71ms p(90)=355.45ms p(95)=381.09ms p(99.9)=468.1ms 
       { expected_response:true }...: avg=191.88ms min=1.95ms  med=192.58ms max=532.71ms p(90)=355.45ms p(95)=381.09ms p(99.9)=468.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 74356
     http_req_receiving.............: avg=80.28µs  min=27.71µs med=59.72µs  max=155.19ms p(90)=97.34µs  p(95)=114.32µs p(99.9)=1.35ms  
     http_req_sending...............: avg=31.42µs  min=5.06µs  med=10.86µs  max=125.27ms p(90)=17.53µs  p(95)=21.53µs  p(99.9)=3.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.77ms min=1.88ms  med=192.41ms max=532.65ms p(90)=355.33ms p(95)=380.99ms p(99.9)=468.04ms
     http_reqs......................: 74356   1189.069287/s
     iteration_duration.............: avg=194.73ms min=4.49ms  med=195.5ms  max=532.87ms p(90)=356.31ms p(95)=381.67ms p(99.9)=468.71ms
     iterations.....................: 73356   1173.077715/s
     success_rate...................: 100.00% ✓ 73356       ✗ 0    
     vus............................: 82      min=0         max=492
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

     checks.........................: 100.00% ✓ 107940     ✗ 0    
     data_received..................: 3.2 GB  51 MB/s
     data_sent......................: 44 MB   692 kB/s
     http_req_blocked...............: avg=6.15µs   min=1.05µs  med=2.43µs   max=2.3ms    p(90)=4.22µs   p(95)=5.24µs   p(99.9)=636.49µs
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=2.26ms   p(90)=0s       p(95)=0s       p(99.9)=581.94µs
     http_req_duration..............: avg=387.9ms  min=3.54ms  med=363.15ms max=1.75s    p(90)=762.88ms p(95)=823.3ms  p(99.9)=1.21s   
       { expected_response:true }...: avg=387.9ms  min=3.54ms  med=363.15ms max=1.75s    p(90)=762.88ms p(95)=823.3ms  p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36980
     http_req_receiving.............: avg=92.16µs  min=29.21µs med=68.83µs  max=225.39ms p(90)=109.47µs p(95)=125.25µs p(99.9)=1.22ms  
     http_req_sending...............: avg=33.71µs  min=5.01µs  med=12.62µs  max=111.05ms p(90)=20.79µs  p(95)=23.86µs  p(99.9)=2.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.77ms min=3.45ms  med=363.03ms max=1.75s    p(90)=762.78ms p(95)=823.19ms p(99.9)=1.21s   
     http_reqs......................: 36980   576.065324/s
     iteration_duration.............: avg=398.9ms  min=19.67ms med=376.22ms max=1.77s    p(90)=765.8ms  p(95)=826.14ms p(99.9)=1.21s   
     iterations.....................: 35980   560.48757/s
     success_rate...................: 100.00% ✓ 35980      ✗ 0    
     vus............................: 66      min=0        max=497
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

     checks.........................: 100.00% ✓ 47871      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   302 kB/s
     http_req_blocked...............: avg=15.11µs  min=1.31µs  med=3.64µs   max=17.4ms  p(90)=5.39µs   p(95)=6.92µs   p(99.9)=2.47ms
     http_req_connecting............: avg=9.81µs   min=0s      med=0s       max=17.33ms p(90)=0s       p(95)=0s       p(99.9)=2.45ms
     http_req_duration..............: avg=844.98ms min=5.77ms  med=753.63ms max=16.48s  p(90)=1.53s    p(95)=1.73s    p(99.9)=13.71s
       { expected_response:true }...: avg=844.98ms min=5.77ms  med=753.63ms max=16.48s  p(90)=1.53s    p(95)=1.73s    p(99.9)=13.71s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16957
     http_req_receiving.............: avg=97.26µs  min=37.53µs med=89.41µs  max=6.07ms  p(90)=125.48µs p(95)=141.14µs p(99.9)=1.13ms
     http_req_sending...............: avg=29.88µs  min=6.46µs  med=17.55µs  max=16.12ms p(90)=23.49µs  p(95)=28µs     p(99.9)=2.94ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=844.85ms min=5.68ms  med=753.48ms max=16.48s  p(90)=1.53s    p(95)=1.73s    p(99.9)=13.71s
     http_reqs......................: 16957   251.309137/s
     iteration_duration.............: avg=897.96ms min=23.73ms med=810.99ms max=16.48s  p(90)=1.56s    p(95)=1.74s    p(99.9)=14.73s
     iterations.....................: 15957   236.48876/s
     success_rate...................: 100.00% ✓ 15957      ✗ 0    
     vus............................: 80      min=0        max=500
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

     checks.........................: 100.00% ✓ 48693      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   289 kB/s
     http_req_blocked...............: avg=14.56µs  min=1.48µs  med=3.56µs   max=15.45ms p(90)=5.27µs   p(95)=6.67µs   p(99.9)=2.06ms  
     http_req_connecting............: avg=9.31µs   min=0s      med=0s       max=15.39ms p(90)=0s       p(95)=0s       p(99.9)=2.04ms  
     http_req_duration..............: avg=389.8ms  min=7.42ms  med=454.82ms max=1.22s   p(90)=642.55ms p(95)=705.4ms  p(99.9)=989.48ms
       { expected_response:true }...: avg=389.8ms  min=7.42ms  med=454.82ms max=1.22s   p(90)=642.55ms p(95)=705.4ms  p(99.9)=989.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17231
     http_req_receiving.............: avg=94.6µs   min=33.27µs med=87.21µs  max=9.27ms  p(90)=125.62µs p(95)=141.38µs p(99.9)=1.04ms  
     http_req_sending...............: avg=36.6µs   min=6.31µs  med=17.78µs  max=67.89ms p(90)=23.25µs  p(95)=27.67µs  p(99.9)=3.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.67ms min=7.32ms  med=454.69ms max=1.22s   p(90)=642.42ms p(95)=705.28ms p(99.9)=989.34ms
     http_reqs......................: 17231   235.920761/s
     iteration_duration.............: avg=413.83ms min=12.95ms med=467.84ms max=1.22s   p(90)=650.31ms p(95)=710.15ms p(99.9)=999.45ms
     iterations.....................: 16231   222.229114/s
     success_rate...................: 100.00% ✓ 16231      ✗ 0    
     vus............................: 50      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 448086      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 181 MB  2.9 MB/s
     http_req_blocked...............: avg=22.68µs min=881ns   med=2.56µs  max=83.87ms  p(90)=4.43µs   p(95)=5.61µs   p(99.9)=2.29ms  
     http_req_connecting............: avg=18.85µs min=0s      med=0s      max=73.53ms  p(90)=0s       p(95)=0s       p(99.9)=2.21ms  
     http_req_duration..............: avg=94.6ms  min=1.54ms  med=81.59ms max=1.64s    p(90)=181.19ms p(95)=209.9ms  p(99.9)=656.33ms
       { expected_response:true }...: avg=94.6ms  min=1.54ms  med=81.59ms max=1.64s    p(90)=181.19ms p(95)=209.9ms  p(99.9)=656.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150362
     http_req_receiving.............: avg=1.2ms   min=53.07µs med=103.4µs max=499.11ms p(90)=1.5ms    p(95)=3.87ms   p(99.9)=78.5ms  
     http_req_sending...............: avg=72.86µs min=4.68µs  med=9.97µs  max=104.32ms p(90)=20.57µs  p(95)=116.63µs p(99.9)=10ms    
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.33ms min=1.44ms  med=80.4ms  max=1.64s    p(90)=179.82ms p(95)=207.62ms p(99.9)=652.3ms 
     http_reqs......................: 150362  2428.660191/s
     iteration_duration.............: avg=95.51ms min=2.91ms  med=82.56ms max=1.64s    p(90)=181.83ms p(95)=210.65ms p(99.9)=658.55ms
     iterations.....................: 149362  2412.508104/s
     success_rate...................: 100.00% ✓ 149362      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 442638      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=14.54µs  min=852ns   med=2.19µs   max=57.49ms  p(90)=3.76µs   p(95)=4.87µs   p(99.9)=800.71µs
     http_req_connecting............: avg=11.44µs  min=0s      med=0s       max=57.06ms  p(90)=0s       p(95)=0s       p(99.9)=749.63µs
     http_req_duration..............: avg=95.74ms  min=1.45ms  med=91.25ms  max=372.35ms p(90)=181.41ms p(95)=197.81ms p(99.9)=265.68ms
       { expected_response:true }...: avg=95.74ms  min=1.45ms  med=91.25ms  max=372.35ms p(90)=181.41ms p(95)=197.81ms p(99.9)=265.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148546
     http_req_receiving.............: avg=693.04µs min=54.35µs med=109.49µs max=119.49ms p(90)=1.33ms   p(95)=2.37ms   p(99.9)=27.7ms  
     http_req_sending...............: avg=59.36µs  min=4.72µs  med=9.28µs   max=92.44ms  p(90)=18.54µs  p(95)=105.18µs p(99.9)=7.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.99ms  min=1.36ms  med=90.4ms   max=372.26ms p(90)=180.51ms p(95)=196.87ms p(99.9)=263.63ms
     http_reqs......................: 148546  2404.660689/s
     iteration_duration.............: avg=96.64ms  min=3.37ms  med=92.23ms  max=372.53ms p(90)=181.87ms p(95)=198.3ms  p(99.9)=266.89ms
     iterations.....................: 147546  2388.472702/s
     success_rate...................: 100.00% ✓ 147546      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428991      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=15.15µs min=912ns   med=2.27µs   max=53.05ms p(90)=3.91µs   p(95)=5µs      p(99.9)=1.23ms  
     http_req_connecting............: avg=12.18µs min=0s      med=0s       max=53.01ms p(90)=0s       p(95)=0s       p(99.9)=1.1ms   
     http_req_duration..............: avg=98.83ms min=1.58ms  med=84.35ms  max=1.56s   p(90)=185.36ms p(95)=213.29ms p(99.9)=1.03s   
       { expected_response:true }...: avg=98.83ms min=1.58ms  med=84.35ms  max=1.56s   p(90)=185.36ms p(95)=213.29ms p(99.9)=1.03s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 143997
     http_req_receiving.............: avg=1.78ms  min=51.65µs med=108.44µs max=1.06s   p(90)=1.95ms   p(95)=4.92ms   p(99.9)=122.25ms
     http_req_sending...............: avg=58.07µs min=4.81µs  med=9.49µs   max=56.47ms p(90)=19.08µs  p(95)=100.98µs p(99.9)=7.89ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.98ms min=1.47ms  med=83.2ms   max=1.54s   p(90)=183.57ms p(95)=209.99ms p(99.9)=926.49ms
     http_reqs......................: 143997  2324.70555/s
     iteration_duration.............: avg=99.76ms min=2.71ms  med=85.26ms  max=1.56s   p(90)=185.88ms p(95)=213.87ms p(99.9)=1.03s   
     iterations.....................: 142997  2308.561426/s
     success_rate...................: 100.00% ✓ 142997      ✗ 0     
     vus............................: 54      min=0         max=499 
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

     checks.........................: 100.00% ✓ 425211      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=19.81µs  min=912ns   med=2.99µs  max=64.93ms  p(90)=4.87µs   p(95)=6.11µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=16µs     min=0s      med=0s      max=64.79ms  p(90)=0s       p(95)=0s       p(99.9)=2.06ms  
     http_req_duration..............: avg=99.64ms  min=1.56ms  med=93.82ms max=317.23ms p(90)=191.05ms p(95)=209.07ms p(99.9)=270.7ms 
       { expected_response:true }...: avg=99.64ms  min=1.56ms  med=93.82ms max=317.23ms p(90)=191.05ms p(95)=209.07ms p(99.9)=270.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142737
     http_req_receiving.............: avg=153.68µs min=27.17µs med=56.99µs max=90.59ms  p(90)=142.33µs p(95)=368.25µs p(99.9)=18.04ms 
     http_req_sending...............: avg=70.66µs  min=5.08µs  med=11.6µs  max=228.19ms p(90)=21.42µs  p(95)=131.65µs p(99.9)=8.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.42ms  min=1.51ms  med=93.63ms max=310.37ms p(90)=190.7ms  p(95)=208.59ms p(99.9)=270.5ms 
     http_reqs......................: 142737  2302.397855/s
     iteration_duration.............: avg=100.6ms  min=4.31ms  med=94.84ms max=332.79ms p(90)=191.6ms  p(95)=209.55ms p(99.9)=271.76ms
     iterations.....................: 141737  2286.267505/s
     success_rate...................: 100.00% ✓ 141737      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415026      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=17.35µs  min=862ns   med=2.45µs   max=83.41ms  p(90)=4.53µs   p(95)=5.73µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=13.83µs  min=0s      med=0s       max=83.34ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=102.06ms min=1.75ms  med=90.24ms  max=1.04s    p(90)=194.98ms p(95)=225.52ms p(99.9)=553.91ms
       { expected_response:true }...: avg=102.06ms min=1.75ms  med=90.24ms  max=1.04s    p(90)=194.98ms p(95)=225.52ms p(99.9)=553.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139342
     http_req_receiving.............: avg=1.47ms   min=51.68µs med=107.09µs max=477.33ms p(90)=1.68ms   p(95)=4.26ms   p(99.9)=97.22ms 
     http_req_sending...............: avg=62.63µs  min=4.56µs  med=9.86µs   max=198.37ms p(90)=21.48µs  p(95)=109.98µs p(99.9)=8.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.53ms min=1.66ms  med=89.17ms  max=1.04s    p(90)=192.48ms p(95)=221.36ms p(99.9)=538.07ms
     http_reqs......................: 139342  2238.562885/s
     iteration_duration.............: avg=103.1ms  min=3.41ms  med=91.4ms   max=1.04s    p(90)=195.73ms p(95)=226.4ms  p(99.9)=555.84ms
     iterations.....................: 138342  2222.497643/s
     success_rate...................: 100.00% ✓ 138342      ✗ 0     
     vus............................: 67      min=0         max=495 
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

     checks.........................: 100.00% ✓ 214047      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.2µs    min=951ns  med=2.35µs   max=6.57ms   p(90)=4.08µs   p(95)=5.05µs   p(99.9)=307.76µs
     http_req_connecting............: avg=2.12µs   min=0s     med=0s       max=6.51ms   p(90)=0s       p(95)=0s       p(99.9)=228.31µs
     http_req_duration..............: avg=197.22ms min=1.99ms med=197.75ms max=527.49ms p(90)=365.1ms  p(95)=390.85ms p(99.9)=467.79ms
       { expected_response:true }...: avg=197.22ms min=1.99ms med=197.75ms max=527.49ms p(90)=365.1ms  p(95)=390.85ms p(99.9)=467.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72349
     http_req_receiving.............: avg=75.7µs   min=27.2µs med=63.15µs  max=24.06ms  p(90)=104.15µs p(95)=119.16µs p(99.9)=1ms     
     http_req_sending...............: avg=29.26µs  min=4.93µs med=11.23µs  max=142.42ms p(90)=18.88µs  p(95)=22.57µs  p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.11ms min=1.92ms med=197.64ms max=527.37ms p(90)=365.01ms p(95)=390.72ms p(99.9)=467.72ms
     http_reqs......................: 72349   1155.907369/s
     iteration_duration.............: avg=200.23ms min=4.9ms  med=200.96ms max=527.71ms p(90)=365.97ms p(95)=391.54ms p(99.9)=468.21ms
     iterations.....................: 71349   1139.930543/s
     success_rate...................: 100.00% ✓ 71349       ✗ 0    
     vus............................: 83      min=0         max=495
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

     checks.........................: 100.00% ✓ 102870     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   655 kB/s
     http_req_blocked...............: avg=8.42µs   min=1.02µs  med=2.88µs   max=7.39ms   p(90)=4.65µs   p(95)=5.68µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=4.44µs   min=0s      med=0s       max=7.3ms    p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=406.53ms min=3.79ms  med=380.77ms max=1.59s    p(90)=798.82ms p(95)=866.55ms p(99.9)=1.3s    
       { expected_response:true }...: avg=406.53ms min=3.79ms  med=380.77ms max=1.59s    p(90)=798.82ms p(95)=866.55ms p(99.9)=1.3s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 35290
     http_req_receiving.............: avg=82.33µs  min=28.41µs med=73.18µs  max=16.74ms  p(90)=112.06µs p(95)=126.05µs p(99.9)=819.73µs
     http_req_sending...............: avg=36.77µs  min=5.1µs   med=14.01µs  max=116.02ms p(90)=21.37µs  p(95)=24.51µs  p(99.9)=2.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=406.41ms min=3.69ms  med=380.69ms max=1.59s    p(90)=798.77ms p(95)=866.45ms p(99.9)=1.3s    
     http_reqs......................: 35290   545.870201/s
     iteration_duration.............: avg=418.62ms min=18.87ms med=394.77ms max=1.59s    p(90)=803.02ms p(95)=869.2ms  p(99.9)=1.3s    
     iterations.....................: 34290   530.402074/s
     success_rate...................: 100.00% ✓ 34290      ✗ 0    
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

     checks.........................: 100.00% ✓ 46668      ✗ 0    
     data_received..................: 1.4 GB  22 MB/s
     data_sent......................: 20 MB   295 kB/s
     http_req_blocked...............: avg=13.74µs  min=1.23µs  med=3.3µs    max=12.18ms p(90)=5.06µs  p(95)=6.41µs   p(99.9)=2.15ms
     http_req_connecting............: avg=8.67µs   min=0s      med=0s       max=12.11ms p(90)=0s      p(95)=0s       p(99.9)=2.12ms
     http_req_duration..............: avg=880.64ms min=5.64ms  med=783.82ms max=4.63s   p(90)=1.76s   p(95)=2.03s    p(99.9)=4.01s 
       { expected_response:true }...: avg=880.64ms min=5.64ms  med=783.82ms max=4.63s   p(90)=1.76s   p(95)=2.03s    p(99.9)=4.01s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16556
     http_req_receiving.............: avg=107.32µs min=32.77µs med=93.11µs  max=19.82ms p(90)=131.3µs p(95)=146.04µs p(99.9)=2.15ms
     http_req_sending...............: avg=32.26µs  min=5.57µs  med=17.95µs  max=71.71ms p(90)=23.39µs p(95)=28.21µs  p(99.9)=2.62ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=880.5ms  min=5.5ms   med=783.72ms max=4.63s   p(90)=1.76s   p(95)=2.03s    p(99.9)=4.01s 
     http_reqs......................: 16556   245.512721/s
     iteration_duration.............: avg=937.29ms min=33.44ms med=873.06ms max=4.64s   p(90)=1.79s   p(95)=2.04s    p(99.9)=4.04s 
     iterations.....................: 15556   230.683492/s
     success_rate...................: 100.00% ✓ 15556      ✗ 0    
     vus............................: 71      min=0        max=500
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

     checks.........................: 100.00% ✓ 45810      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=13.83µs  min=1.37µs  med=3.73µs   max=9.08ms p(90)=5.61µs  p(95)=7.52µs   p(99.9)=1.68ms
     http_req_connecting............: avg=8.18µs   min=0s      med=0s       max=9.02ms p(90)=0s      p(95)=0s       p(99.9)=1.65ms
     http_req_duration..............: avg=893.21ms min=7.78ms  med=799.15ms max=3.09s  p(90)=1.83s   p(95)=1.98s    p(99.9)=2.78s 
       { expected_response:true }...: avg=893.21ms min=7.78ms  med=799.15ms max=3.09s  p(90)=1.83s   p(95)=1.98s    p(99.9)=2.78s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16270
     http_req_receiving.............: avg=101.39µs min=39.26µs med=93.17µs  max=9.64ms p(90)=133.2µs p(95)=150.61µs p(99.9)=1.12ms
     http_req_sending...............: avg=36.41µs  min=6.24µs  med=17.74µs  max=64.1ms p(90)=23.98µs p(95)=29.34µs  p(99.9)=2.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=893.08ms min=7.69ms  med=799.04ms max=3.09s  p(90)=1.83s   p(95)=1.98s    p(99.9)=2.78s 
     http_reqs......................: 16270   236.295607/s
     iteration_duration.............: avg=951.66ms min=40ms    med=886.43ms max=3.1s   p(90)=1.84s   p(95)=1.99s    p(99.9)=2.8s  
     iterations.....................: 15270   221.772214/s
     success_rate...................: 100.00% ✓ 15270      ✗ 0    
     vus............................: 94      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

