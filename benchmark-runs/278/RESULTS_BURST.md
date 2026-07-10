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
| hive-router | v0.0.78 | 2,919 | 3,050 | 2,894 | 1.9% |  |
| fusion-nightly-net11 | 16.5.0-p.10 | 2,312 | 2,397 | 2,298 | 1.5% |  |
| fusion | 16.4.0 | 2,280 | 2,362 | 2,265 | 1.4% |  |
| fusion-nightly | 16.5.0-p.10 | 2,276 | 2,369 | 2,261 | 1.6% |  |
| cosmo | 0.329.0 | 1,167 | 1,207 | 1,157 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 581 | 594 | 580 | 0.8% |  |
| hive-gateway | 2.10.2 | 249 | 257 | 247 | 1.2% |  |
| apollo-gateway | 2.14.2 | 234 | 242 | 233 | 1.4% | 4 failed requests across 2/9 runs |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (9337 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (562702 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.5.0-p.10 | 2,316 | 2,335 | 2,297 | 0.5% |  |
| fusion-nightly | 16.5.0-p.10 | 2,270 | 2,367 | 2,257 | 1.7% |  |
| hive-router | v0.0.78 | 2,265 | 2,392 | 2,235 | 2.3% |  |
| fusion | 16.4.0 | 2,187 | 2,265 | 2,172 | 1.4% |  |
| fusion-nightly-fed | 16.5.0-p.10 | 2,046 | 2,136 | 2,028 | 1.7% |  |
| cosmo | 0.329.0 | 1,104 | 1,142 | 1,091 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.2 | 547 | 557 | 544 | 0.8% |  |
| hive-gateway | 2.10.2 | 238 | 244 | 235 | 1.2% |  |
| apollo-gateway | 2.14.2 | 231 | 236 | 230 | 0.7% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (11806 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (272270 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 536448      ✗ 0     
     data_received..................: 16 GB   256 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=28.15µs  min=1.03µs  med=2.78µs  max=88.74ms  p(90)=4.57µs   p(95)=5.85µs   p(99.9)=3.11ms  
     http_req_connecting............: avg=24.56µs  min=0s      med=0s      max=88.48ms  p(90)=0s       p(95)=0s       p(99.9)=2.8ms   
     http_req_duration..............: avg=78.9ms   min=1.33ms  med=72.12ms max=301.55ms p(90)=152.58ms p(95)=171.8ms  p(99.9)=236.41ms
       { expected_response:true }...: avg=78.9ms   min=1.33ms  med=72.12ms max=301.55ms p(90)=152.58ms p(95)=171.8ms  p(99.9)=236.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179816
     http_req_receiving.............: avg=187.14µs min=25.56µs med=53.02µs max=166.52ms p(90)=172.12µs p(95)=369.07µs p(99.9)=25.65ms 
     http_req_sending...............: avg=86.05µs  min=4.54µs  med=10.36µs max=145.34ms p(90)=20.86µs  p(95)=130.77µs p(99.9)=12.92ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.63ms  min=1.29ms  med=71.89ms max=282.75ms p(90)=152.22ms p(95)=171.16ms p(99.9)=234.69ms
     http_reqs......................: 179816  2919.586432/s
     iteration_duration.............: avg=79.71ms  min=2.1ms   med=73.03ms max=329.92ms p(90)=153.18ms p(95)=172.69ms p(99.9)=238.72ms
     iterations.....................: 178816  2903.349911/s
     success_rate...................: 100.00% ✓ 178816      ✗ 0     
     vus............................: 84      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428799      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=10.63µs  min=872ns  med=2.15µs  max=45.72ms  p(90)=3.63µs   p(95)=4.63µs   p(99.9)=631.86µs
     http_req_connecting............: avg=7.91µs   min=0s     med=0s      max=45.6ms   p(90)=0s       p(95)=0s       p(99.9)=595.87µs
     http_req_duration..............: avg=98.85ms  min=1.91ms med=95.22ms max=347.86ms p(90)=187.93ms p(95)=202.76ms p(99.9)=258.74ms
       { expected_response:true }...: avg=98.85ms  min=1.91ms med=95.22ms max=347.86ms p(90)=187.93ms p(95)=202.76ms p(99.9)=258.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143933
     http_req_receiving.............: avg=815.78µs min=50.4µs med=141.5µs max=150.27ms p(90)=1.64ms   p(95)=2.61ms   p(99.9)=28.01ms 
     http_req_sending...............: avg=54.74µs  min=4.33µs med=8.91µs  max=166.65ms p(90)=17.07µs  p(95)=98.25µs  p(99.9)=6.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.98ms  min=1.8ms  med=94.32ms max=347.77ms p(90)=187.02ms p(95)=201.71ms p(99.9)=257.76ms
     http_reqs......................: 143933  2312.439591/s
     iteration_duration.............: avg=99.77ms  min=3.57ms med=96.3ms  max=348.04ms p(90)=188.36ms p(95)=203.19ms p(99.9)=259.31ms
     iterations.....................: 142933  2296.373507/s
     success_rate...................: 100.00% ✓ 142933      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 424212      ✗ 0     
     data_received..................: 13 GB   200 MB/s
     data_sent......................: 171 MB  2.7 MB/s
     http_req_blocked...............: avg=12.41µs  min=872ns   med=2.07µs   max=78.9ms   p(90)=3.48µs   p(95)=4.57µs   p(99.9)=785.74µs
     http_req_connecting............: avg=9.76µs   min=0s      med=0s       max=78.68ms  p(90)=0s       p(95)=0s       p(99.9)=729.37µs
     http_req_duration..............: avg=99.95ms  min=2.01ms  med=87.9ms   max=1.68s    p(90)=190.61ms p(95)=216.94ms p(99.9)=644.59ms
       { expected_response:true }...: avg=99.95ms  min=2.01ms  med=87.9ms   max=1.68s    p(90)=190.61ms p(95)=216.94ms p(99.9)=644.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142404
     http_req_receiving.............: avg=1.52ms   min=51.43µs med=102.06µs max=802.35ms p(90)=1.8ms    p(95)=4.63ms   p(99.9)=86.65ms 
     http_req_sending...............: avg=57.44µs  min=4.39µs  med=8.56µs   max=205.44ms p(90)=16.34µs  p(95)=94.2µs   p(99.9)=7.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.37ms  min=1.92ms  med=86.65ms  max=1.68s    p(90)=188.69ms p(95)=213.51ms p(99.9)=634.25ms
     http_reqs......................: 142404  2280.852401/s
     iteration_duration.............: avg=100.89ms min=3.44ms  med=89ms     max=1.68s    p(90)=191.14ms p(95)=217.61ms p(99.9)=645.68ms
     iterations.....................: 141404  2264.835628/s
     success_rate...................: 100.00% ✓ 141404      ✗ 0     
     vus............................: 76      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423582      ✗ 0     
     data_received..................: 13 GB   200 MB/s
     data_sent......................: 171 MB  2.7 MB/s
     http_req_blocked...............: avg=13.81µs  min=861ns   med=2.55µs   max=57.68ms  p(90)=4.08µs   p(95)=5.08µs   p(99.9)=872.5µs 
     http_req_connecting............: avg=10.53µs  min=0s      med=0s       max=57.63ms  p(90)=0s       p(95)=0s       p(99.9)=795.17µs
     http_req_duration..............: avg=100.12ms min=1.98ms  med=87.34ms  max=1.49s    p(90)=188.32ms p(95)=215.01ms p(99.9)=981.17ms
       { expected_response:true }...: avg=100.12ms min=1.98ms  med=87.34ms  max=1.49s    p(90)=188.32ms p(95)=215.01ms p(99.9)=981.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142194
     http_req_receiving.............: avg=1.9ms    min=52.49µs med=109.39µs max=898.94ms p(90)=2.11ms   p(95)=5.5ms    p(99.9)=218.81ms
     http_req_sending...............: avg=63.35µs  min=4.64µs  med=9.65µs   max=189.59ms p(90)=17.4µs   p(95)=104.52µs p(99.9)=8.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.15ms  min=1.9ms   med=86ms     max=1.49s    p(90)=186.18ms p(95)=211.41ms p(99.9)=726.18ms
     http_reqs......................: 142194  2276.906574/s
     iteration_duration.............: avg=101.07ms min=3.84ms  med=88.46ms  max=1.49s    p(90)=188.9ms  p(95)=215.7ms  p(99.9)=986.32ms
     iterations.....................: 141194  2260.893897/s
     success_rate...................: 100.00% ✓ 141194      ✗ 0     
     vus............................: 78      min=0         max=493 
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

     checks.........................: 100.00% ✓ 215838      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=4.23µs   min=992ns   med=2.12µs   max=2.69ms   p(90)=3.6µs    p(95)=4.44µs   p(99.9)=344.13µs
     http_req_connecting............: avg=1.45µs   min=0s      med=0s       max=2.37ms   p(90)=0s       p(95)=0s       p(99.9)=282.77µs
     http_req_duration..............: avg=195.64ms min=1.92ms  med=196.85ms max=620.22ms p(90)=363.25ms p(95)=391.32ms p(99.9)=508.92ms
       { expected_response:true }...: avg=195.64ms min=1.92ms  med=196.85ms max=620.22ms p(90)=363.25ms p(95)=391.32ms p(99.9)=508.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72946
     http_req_receiving.............: avg=69.12µs  min=28.81µs med=58µs     max=21.26ms  p(90)=92.23µs  p(95)=106.49µs p(99.9)=877.52µs
     http_req_sending...............: avg=23.94µs  min=4.7µs   med=9.53µs   max=115.08ms p(90)=14.92µs  p(95)=18.39µs  p(99.9)=2.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.55ms min=1.86ms  med=196.76ms max=620.12ms p(90)=363.17ms p(95)=391.25ms p(99.9)=508.81ms
     http_reqs......................: 72946   1167.040316/s
     iteration_duration.............: avg=198.59ms min=5.27ms  med=199.86ms max=620.39ms p(90)=364.13ms p(95)=392ms    p(99.9)=509.58ms
     iterations.....................: 71946   1151.041628/s
     success_rate...................: 100.00% ✓ 71946       ✗ 0    
     vus............................: 79      min=0         max=492
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

     checks.........................: 100.00% ✓ 108888     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   698 kB/s
     http_req_blocked...............: avg=9.36µs   min=1.23µs med=3.23µs   max=24.13ms  p(90)=5.06µs   p(95)=6.11µs   p(99.9)=1.3ms 
     http_req_connecting............: avg=5.13µs   min=0s     med=0s       max=24.07ms  p(90)=0s       p(95)=0s       p(99.9)=1.28ms
     http_req_duration..............: avg=384.45ms min=3.53ms med=355.18ms max=1.46s    p(90)=756.54ms p(95)=819.86ms p(99.9)=1.19s 
       { expected_response:true }...: avg=384.45ms min=3.53ms med=355.18ms max=1.46s    p(90)=756.54ms p(95)=819.86ms p(99.9)=1.19s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 37296
     http_req_receiving.............: avg=89.92µs  min=29µs   med=69.84µs  max=171.41ms p(90)=108.35µs p(95)=122.79µs p(99.9)=1.33ms
     http_req_sending...............: avg=36.12µs  min=5.39µs med=14.32µs  max=134.82ms p(90)=21.98µs  p(95)=25.22µs  p(99.9)=2.37ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=384.32ms min=3.44ms med=355.07ms max=1.46s    p(90)=756.4ms  p(95)=819.77ms p(99.9)=1.19s 
     http_reqs......................: 37296   581.069454/s
     iteration_duration.............: avg=395.3ms  min=15.9ms med=370.32ms max=1.46s    p(90)=758.99ms p(95)=822.16ms p(99.9)=1.19s 
     iterations.....................: 36296   565.489514/s
     success_rate...................: 100.00% ✓ 36296      ✗ 0    
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

     checks.........................: 100.00% ✓ 47400      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=9.81µs   min=1.08µs  med=3.62µs   max=3.67ms  p(90)=5.34µs   p(95)=6.7µs    p(99.9)=718.62µs
     http_req_connecting............: avg=4.58µs   min=0s      med=0s       max=3.4ms   p(90)=0s       p(95)=0s       p(99.9)=694.02µs
     http_req_duration..............: avg=837.32ms min=5.58ms  med=737.6ms  max=20.18s  p(90)=1.44s    p(95)=1.62s    p(99.9)=17.42s  
       { expected_response:true }...: avg=837.32ms min=5.58ms  med=737.6ms  max=20.18s  p(90)=1.44s    p(95)=1.62s    p(99.9)=17.42s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16800
     http_req_receiving.............: avg=97.34µs  min=39.52µs med=86.58µs  max=61.11ms p(90)=123.52µs p(95)=138.32µs p(99.9)=1.07ms  
     http_req_sending...............: avg=30.79µs  min=6.13µs  med=17.28µs  max=22.2ms  p(90)=22.96µs  p(95)=26.79µs  p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=837.19ms min=5.45ms  med=737.46ms max=20.18s  p(90)=1.44s    p(95)=1.62s    p(99.9)=17.42s  
     http_reqs......................: 16800   249.262965/s
     iteration_duration.............: avg=890.31ms min=22.86ms med=792.18ms max=20.18s  p(90)=1.47s    p(95)=1.63s    p(99.9)=17.44s  
     iterations.....................: 15800   234.425884/s
     success_rate...................: 100.00% ✓ 15800      ✗ 0    
     vus............................: 79      min=0        max=498
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

     checks.........................: 100.00% ✓ 48393      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   288 kB/s
     http_req_blocked...............: avg=13.02µs  min=1.15µs  med=3.12µs   max=3.78ms   p(90)=4.76µs   p(95)=6µs      p(99.9)=1.98ms 
     http_req_connecting............: avg=8.4µs    min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=1.96ms 
     http_req_duration..............: avg=382.11ms min=7.34ms  med=419.65ms max=1.19s    p(90)=668.51ms p(95)=720.4ms  p(99.9)=1s     
       { expected_response:true }...: avg=382.11ms min=7.34ms  med=419.65ms max=1.19s    p(90)=668.51ms p(95)=720.4ms  p(99.9)=1s     
     http_req_failed................: 0.00%   ✓ 0          ✗ 17131
     http_req_receiving.............: avg=92.46µs  min=32.79µs med=84.97µs  max=23.81ms  p(90)=122.52µs p(95)=136.83µs p(99.9)=823.4µs
     http_req_sending...............: avg=40.88µs  min=5.31µs  med=16.16µs  max=101.63ms p(90)=21.49µs  p(95)=26µs     p(99.9)=4.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=381.97ms min=7.21ms  med=419.55ms max=1.19s    p(90)=668.22ms p(95)=720.3ms  p(99.9)=1s     
     http_reqs......................: 17131   234.890496/s
     iteration_duration.............: avg=405.82ms min=8.19ms  med=444.45ms max=1.19s    p(90)=673.86ms p(95)=726.49ms p(99.9)=1.01s  
     iterations.....................: 16131   221.179067/s
     success_rate...................: 100.00% ✓ 16131      ✗ 0    
     vus............................: 50      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 425721      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=8.5µs    min=911ns   med=2.1µs    max=32.48ms  p(90)=3.44µs   p(95)=4.37µs   p(99.9)=886.92µs
     http_req_connecting............: avg=5.84µs   min=0s      med=0s       max=32.27ms  p(90)=0s       p(95)=0s       p(99.9)=809.86µs
     http_req_duration..............: avg=99.55ms  min=1.36ms  med=95.61ms  max=344.3ms  p(90)=189.77ms p(95)=205.28ms p(99.9)=261.3ms 
       { expected_response:true }...: avg=99.55ms  min=1.36ms  med=95.61ms  max=344.3ms  p(90)=189.77ms p(95)=205.28ms p(99.9)=261.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142907
     http_req_receiving.............: avg=890.88µs min=52.98µs med=142.18µs max=248.56ms p(90)=1.75ms   p(95)=2.83ms   p(99.9)=29.6ms  
     http_req_sending...............: avg=50.68µs  min=4.3µs   med=8.86µs   max=148.89ms p(90)=16.56µs  p(95)=97.88µs  p(99.9)=6.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.61ms  min=1.29ms  med=94.61ms  max=344.2ms  p(90)=188.72ms p(95)=204.3ms  p(99.9)=259.91ms
     http_reqs......................: 142907  2316.890254/s
     iteration_duration.............: avg=100.49ms min=3.33ms  med=96.71ms  max=350.7ms  p(90)=190.19ms p(95)=205.73ms p(99.9)=262.77ms
     iterations.....................: 141907  2300.67768/s
     success_rate...................: 100.00% ✓ 141907      ✗ 0     
     vus............................: 88      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 418899      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=17.02µs  min=861ns   med=2.3µs    max=71.99ms  p(90)=4.15µs   p(95)=5.28µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=13.71µs  min=0s      med=0s       max=71.93ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=101.19ms min=1.54ms  med=85.65ms  max=1.52s    p(90)=191.91ms p(95)=228.71ms p(99.9)=765.49ms
       { expected_response:true }...: avg=101.19ms min=1.54ms  med=85.65ms  max=1.52s    p(90)=191.91ms p(95)=228.71ms p(99.9)=765.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140633
     http_req_receiving.............: avg=2ms      min=50.85µs med=107.22µs max=552.37ms p(90)=1.95ms   p(95)=5.6ms    p(99.9)=142.49ms
     http_req_sending...............: avg=64.69µs  min=4.64µs  med=9.59µs   max=168.31ms p(90)=20.62µs  p(95)=103.49µs p(99.9)=8.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.11ms  min=1.44ms  med=84.38ms  max=1.52s    p(90)=189.19ms p(95)=223.28ms p(99.9)=761.86ms
     http_reqs......................: 140633  2270.870556/s
     iteration_duration.............: avg=102.18ms min=2.82ms  med=86.73ms  max=1.52s    p(90)=192.66ms p(95)=229.68ms p(99.9)=765.96ms
     iterations.....................: 139633  2254.723062/s
     success_rate...................: 100.00% ✓ 139633      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 418362      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=9.33µs   min=922ns   med=2.22µs  max=35.07ms  p(90)=3.78µs   p(95)=4.93µs   p(99.9)=718.69µs
     http_req_connecting............: avg=6.48µs   min=0s      med=0s      max=34.89ms  p(90)=0s       p(95)=0s       p(99.9)=667.57µs
     http_req_duration..............: avg=101.32ms min=1.56ms  med=95.69ms max=318.48ms p(90)=197.66ms p(95)=213.7ms  p(99.9)=252.12ms
       { expected_response:true }...: avg=101.32ms min=1.56ms  med=95.69ms max=318.48ms p(90)=197.66ms p(95)=213.7ms  p(99.9)=252.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140454
     http_req_receiving.............: avg=102.34µs min=26.83µs med=54.97µs max=229.73ms p(90)=105.55µs p(95)=285.52µs p(99.9)=5.94ms  
     http_req_sending...............: avg=51.67µs  min=4.61µs  med=9.81µs  max=235.58ms p(90)=17.51µs  p(95)=100.28µs p(99.9)=6.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.16ms min=1.49ms  med=95.54ms max=310.1ms  p(90)=197.46ms p(95)=213.52ms p(99.9)=251.7ms 
     http_reqs......................: 140454  2265.183147/s
     iteration_duration.............: avg=102.27ms min=4.07ms  med=96.81ms max=345.68ms p(90)=198.12ms p(95)=214.07ms p(99.9)=252.76ms
     iterations.....................: 139454  2249.055567/s
     success_rate...................: 100.00% ✓ 139454      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 403488      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=12.97µs  min=842ns   med=2.28µs   max=54.32ms  p(90)=4.02µs   p(95)=5.2µs    p(99.9)=1.2ms   
     http_req_connecting............: avg=9.91µs   min=0s      med=0s       max=54.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=105.09ms min=1.54ms  med=92.29ms  max=1.53s    p(90)=198.57ms p(95)=232.56ms p(99.9)=1.01s   
       { expected_response:true }...: avg=105.09ms min=1.54ms  med=92.29ms  max=1.53s    p(90)=198.57ms p(95)=232.56ms p(99.9)=1.01s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 135496
     http_req_receiving.............: avg=1.73ms   min=51.22µs med=107.47µs max=958.03ms p(90)=1.95ms   p(95)=5.32ms   p(99.9)=93.98ms 
     http_req_sending...............: avg=56.39µs  min=4.79µs  med=9.48µs   max=55.02ms  p(90)=19µs     p(95)=94.2µs   p(99.9)=8.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.29ms min=1.43ms  med=91ms     max=1.53s    p(90)=195.84ms p(95)=228.45ms p(99.9)=986.93ms
     http_reqs......................: 135496  2187.818167/s
     iteration_duration.............: avg=106.12ms min=2.75ms  med=93.42ms  max=1.53s    p(90)=199.24ms p(95)=233.41ms p(99.9)=1.01s   
     iterations.....................: 134496  2171.671431/s
     success_rate...................: 100.00% ✓ 134496      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 379866      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 153 MB  2.5 MB/s
     http_req_blocked...............: avg=17.36µs  min=1.08µs  med=2.97µs   max=61.06ms  p(90)=4.72µs   p(95)=5.91µs   p(99.9)=1.79ms 
     http_req_connecting............: avg=13.39µs  min=0s      med=0s       max=60.99ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms 
     http_req_duration..............: avg=111.55ms min=1.89ms  med=98.9ms   max=1.75s    p(90)=212.29ms p(95)=244.02ms p(99.9)=1.03s  
       { expected_response:true }...: avg=111.55ms min=1.89ms  med=98.9ms   max=1.75s    p(90)=212.29ms p(95)=244.02ms p(99.9)=1.03s  
     http_req_failed................: 0.00%   ✓ 0           ✗ 127622
     http_req_receiving.............: avg=1.59ms   min=55.32µs med=119.39µs max=998.78ms p(90)=1.82ms   p(95)=4.57ms   p(99.9)=99.96ms
     http_req_sending...............: avg=63.47µs  min=5.39µs  med=11.48µs  max=42.69ms  p(90)=20.97µs  p(95)=115.48µs p(99.9)=8.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=109.88ms min=1.77ms  med=97.53ms  max=1.74s    p(90)=210.2ms  p(95)=240.56ms p(99.9)=1.03s  
     http_reqs......................: 127622  2046.598974/s
     iteration_duration.............: avg=112.69ms min=3.1ms   med=100.26ms max=1.75s    p(90)=212.95ms p(95)=244.79ms p(99.9)=1.03s  
     iterations.....................: 126622  2030.562562/s
     success_rate...................: 100.00% ✓ 126622      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 204585      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=4.98µs   min=882ns   med=2.37µs   max=9.77ms   p(90)=4.06µs   p(95)=5.03µs   p(99.9)=322.2µs 
     http_req_connecting............: avg=1.93µs   min=0s      med=0s       max=9.61ms   p(90)=0s       p(95)=0s       p(99.9)=260.45µs
     http_req_duration..............: avg=206.27ms min=1.98ms  med=208.34ms max=522.4ms  p(90)=378.36ms p(95)=403.59ms p(99.9)=479.13ms
       { expected_response:true }...: avg=206.27ms min=1.98ms  med=208.34ms max=522.4ms  p(90)=378.36ms p(95)=403.59ms p(99.9)=479.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69195
     http_req_receiving.............: avg=77.69µs  min=27.24µs med=61.7µs   max=90.24ms  p(90)=102.05µs p(95)=118.15µs p(99.9)=952.56µs
     http_req_sending...............: avg=30.3µs   min=5.05µs  med=10.65µs  max=141.54ms p(90)=17.73µs  p(95)=21.62µs  p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.17ms min=1.88ms  med=208.22ms max=522.33ms p(90)=378.26ms p(95)=403.5ms  p(99.9)=479.07ms
     http_reqs......................: 69195   1104.774558/s
     iteration_duration.............: avg=209.53ms min=3.98ms  med=211.9ms  max=522.6ms  p(90)=379.33ms p(95)=404.28ms p(99.9)=479.36ms
     iterations.....................: 68195   1088.808454/s
     success_rate...................: 100.00% ✓ 68195       ✗ 0    
     vus............................: 85      min=0         max=496
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

     checks.........................: 100.00% ✓ 103089     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 43 MB   657 kB/s
     http_req_blocked...............: avg=7.18µs   min=1µs     med=2.91µs   max=12.1ms   p(90)=4.65µs   p(95)=5.72µs   p(99.9)=640.39µs
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=7.27ms   p(90)=0s       p(95)=0s       p(99.9)=557.22µs
     http_req_duration..............: avg=405.6ms  min=3.78ms  med=377.24ms max=1.61s    p(90)=795.67ms p(95)=859.25ms p(99.9)=1.34s   
       { expected_response:true }...: avg=405.6ms  min=3.78ms  med=377.24ms max=1.61s    p(90)=795.67ms p(95)=859.25ms p(99.9)=1.34s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35363
     http_req_receiving.............: avg=87.45µs  min=30.9µs  med=74.99µs  max=128.61ms p(90)=114.27µs p(95)=130.28µs p(99.9)=934.05µs
     http_req_sending...............: avg=28.66µs  min=5.02µs  med=14.37µs  max=67.37ms  p(90)=21.79µs  p(95)=24.91µs  p(99.9)=2.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=405.48ms min=3.71ms  med=377.14ms max=1.61s    p(90)=795.56ms p(95)=859.13ms p(99.9)=1.34s   
     http_reqs......................: 35363   547.164408/s
     iteration_duration.............: avg=417.64ms min=18.15ms med=390.74ms max=1.61s    p(90)=798.69ms p(95)=862.61ms p(99.9)=1.35s   
     iterations.....................: 34363   531.691614/s
     success_rate...................: 100.00% ✓ 34363      ✗ 0    
     vus............................: 83      min=0        max=499
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

     checks.........................: 100.00% ✓ 45498      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   286 kB/s
     http_req_blocked...............: avg=14.58µs  min=1.41µs  med=3.71µs   max=3.97ms  p(90)=5.56µs   p(95)=7.27µs   p(99.9)=2.08ms
     http_req_connecting............: avg=9.01µs   min=0s      med=0s       max=3.92ms  p(90)=0s       p(95)=0s       p(99.9)=2.06ms
     http_req_duration..............: avg=901.25ms min=6.08ms  med=815.23ms max=5.19s   p(90)=1.8s     p(95)=2.03s    p(99.9)=4.31s 
       { expected_response:true }...: avg=901.25ms min=6.08ms  med=815.23ms max=5.19s   p(90)=1.8s     p(95)=2.03s    p(99.9)=4.31s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16166
     http_req_receiving.............: avg=101.81µs min=39.17µs med=92.19µs  max=9.06ms  p(90)=131.09µs p(95)=147.57µs p(99.9)=1.54ms
     http_req_sending...............: avg=32.46µs  min=7.06µs  med=18.53µs  max=48.68ms p(90)=24.34µs  p(95)=29.5µs   p(99.9)=2.54ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=901.11ms min=5.94ms  med=815.01ms max=5.19s   p(90)=1.8s     p(95)=2.03s    p(99.9)=4.31s 
     http_reqs......................: 16166   238.666091/s
     iteration_duration.............: avg=960.71ms min=26.82ms med=897.4ms  max=5.19s   p(90)=1.83s    p(95)=2.05s    p(99.9)=4.32s 
     iterations.....................: 15166   223.902631/s
     success_rate...................: 100.00% ✓ 15166      ✗ 0    
     vus............................: 89      min=0        max=500
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

     checks.........................: 100.00% ✓ 44802      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=14.66µs  min=1.17µs  med=3.27µs   max=7.08ms  p(90)=5.02µs   p(95)=6.58µs  p(99.9)=2.25ms  
     http_req_connecting............: avg=9.65µs   min=0s      med=0s       max=6.89ms  p(90)=0s       p(95)=0s      p(99.9)=2.21ms  
     http_req_duration..............: avg=913.29ms min=8.03ms  med=833.5ms  max=3.32s   p(90)=1.85s    p(95)=1.97s   p(99.9)=2.97s   
       { expected_response:true }...: avg=913.29ms min=8.03ms  med=833.5ms  max=3.32s   p(90)=1.85s    p(95)=1.97s   p(99.9)=2.97s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15934
     http_req_receiving.............: avg=98.16µs  min=33.47µs med=91.27µs  max=28.11ms p(90)=129.32µs p(95)=144µs   p(99.9)=695.29µs
     http_req_sending...............: avg=33.15µs  min=5.38µs  med=17.76µs  max=91.45ms p(90)=23.39µs  p(95)=28.34µs p(99.9)=1.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=913.16ms min=7.92ms  med=833.41ms max=3.32s   p(90)=1.85s    p(95)=1.97s   p(99.9)=2.97s   
     http_reqs......................: 15934   231.000235/s
     iteration_duration.............: avg=974.4ms  min=49.18ms med=894.36ms max=3.33s   p(90)=1.87s    p(95)=1.98s   p(99.9)=3s      
     iterations.....................: 14934   216.502919/s
     success_rate...................: 100.00% ✓ 14934      ✗ 0    
     vus............................: 46      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

