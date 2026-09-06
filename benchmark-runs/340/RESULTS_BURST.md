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
| hive-router | v0.0.84 | 2,873 | 3,013 | 2,864 | 1.9% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,626 | 2,732 | 2,582 | 2.1% |  |
| fusion | 16.6.4 | 2,553 | 2,638 | 2,535 | 1.3% |  |
| fusion-nightly | 16.7.0-p.2 | 2,487 | 2,568 | 2,457 | 1.5% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,369 | 2,456 | 2,355 | 1.4% |  |
| cosmo | 0.334.0 | 1,215 | 1,255 | 1,205 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 587 | 572 | 1.0% |  |
| hive-gateway | 2.10.8 | 252 | 260 | 250 | 1.3% |  |
| apollo-gateway | 2.14.3 | 232 | 240 | 231 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (5606 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (494524 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,492 | 2,581 | 2,479 | 1.4% |  |
| fusion-nightly | 16.7.0-p.2 | 2,419 | 2,508 | 2,410 | 1.4% |  |
| hive-router | v0.0.84 | 2,384 | 2,512 | 2,362 | 2.1% |  |
| fusion | 16.6.4 | 2,312 | 2,399 | 2,305 | 1.4% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,144 | 2,238 | 2,133 | 1.7% |  |
| cosmo | 0.334.0 | 1,119 | 1,161 | 1,114 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 541 | 553 | 537 | 1.1% |  |
| hive-gateway | 2.10.8 | 245 | 252 | 243 | 1.1% |  |
| apollo-gateway | 2.14.3 | 234 | 240 | 233 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (39030 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (245250 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 529608      ✗ 0     
     data_received..................: 16 GB   252 MB/s
     data_sent......................: 213 MB  3.5 MB/s
     http_req_blocked...............: avg=22.56µs  min=832ns   med=2.17µs  max=89.79ms  p(90)=3.72µs   p(95)=4.91µs   p(99.9)=3.27ms  
     http_req_connecting............: avg=19.6µs   min=0s      med=0s      max=89.75ms  p(90)=0s       p(95)=0s       p(99.9)=3.19ms  
     http_req_duration..............: avg=80.03ms  min=1.45ms  med=75.09ms max=249.67ms p(90)=153.89ms p(95)=167.83ms p(99.9)=217.78ms
       { expected_response:true }...: avg=80.03ms  min=1.45ms  med=75.09ms max=249.67ms p(90)=153.89ms p(95)=167.83ms p(99.9)=217.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177536
     http_req_receiving.............: avg=137.31µs min=25.98µs med=50.78µs max=75.16ms  p(90)=131.58µs p(95)=323.37µs p(99.9)=16.22ms 
     http_req_sending...............: avg=71.25µs  min=4.57µs  med=9.13µs  max=107.36ms p(90)=17.22µs  p(95)=112.06µs p(99.9)=9.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.82ms  min=1.37ms  med=74.88ms max=249.44ms p(90)=153.61ms p(95)=167.46ms p(99.9)=216.62ms
     http_reqs......................: 177536  2873.584471/s
     iteration_duration.............: avg=80.74ms  min=1.99ms  med=75.87ms max=271.04ms p(90)=154.34ms p(95)=168.25ms p(99.9)=219.62ms
     iterations.....................: 176536  2857.398545/s
     success_rate...................: 100.00% ✓ 176536      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 486924      ✗ 0     
     data_received..................: 14 GB   230 MB/s
     data_sent......................: 196 MB  3.2 MB/s
     http_req_blocked...............: avg=24.56µs  min=992ns   med=2.77µs   max=65.11ms  p(90)=4.4µs    p(95)=5.55µs   p(99.9)=2.68ms  
     http_req_connecting............: avg=21.13µs  min=0s      med=0s       max=65.03ms  p(90)=0s       p(95)=0s       p(99.9)=2.64ms  
     http_req_duration..............: avg=87.04ms  min=1.84ms  med=81.53ms  max=376.69ms p(90)=168.9ms  p(95)=187.23ms p(99.9)=257.22ms
       { expected_response:true }...: avg=87.04ms  min=1.84ms  med=81.53ms  max=376.69ms p(90)=168.9ms  p(95)=187.23ms p(99.9)=257.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163308
     http_req_receiving.............: avg=598.52µs min=51.27µs med=102.28µs max=234.28ms p(90)=1.08ms   p(95)=1.94ms   p(99.9)=29.62ms 
     http_req_sending...............: avg=75.82µs  min=4.51µs  med=10.09µs  max=221.27ms p(90)=20.05µs  p(95)=124.23µs p(99.9)=10.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.36ms  min=1.76ms  med=80.87ms  max=376.6ms  p(90)=168.11ms p(95)=186.49ms p(99.9)=254.78ms
     http_reqs......................: 163308  2626.168046/s
     iteration_duration.............: avg=87.84ms  min=3.88ms  med=82.41ms  max=387.69ms p(90)=169.41ms p(95)=187.73ms p(99.9)=257.98ms
     iterations.....................: 162308  2610.086972/s
     success_rate...................: 100.00% ✓ 162308      ✗ 0     
     vus............................: 65      min=0         max=496 
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

     checks.........................: 100.00% ✓ 474954      ✗ 0     
     data_received..................: 14 GB   224 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=17.8µs  min=912ns   med=2.18µs  max=67.99ms  p(90)=3.67µs   p(95)=4.77µs   p(99.9)=972.29µs
     http_req_connecting............: avg=14.97µs min=0s      med=0s      max=67.92ms  p(90)=0s       p(95)=0s       p(99.9)=920.38µs
     http_req_duration..............: avg=89.25ms min=1.96ms  med=77.69ms max=1.53s    p(90)=168.75ms p(95)=196.77ms p(99.9)=1.03s   
       { expected_response:true }...: avg=89.25ms min=1.96ms  med=77.69ms max=1.53s    p(90)=168.75ms p(95)=196.77ms p(99.9)=1.03s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 159318
     http_req_receiving.............: avg=1.23ms  min=51.85µs med=94.47µs max=965.12ms p(90)=1.43ms   p(95)=3.93ms   p(99.9)=86.47ms 
     http_req_sending...............: avg=65.58µs min=4.57µs  med=9.03µs  max=182.73ms p(90)=17.44µs  p(95)=103.91µs p(99.9)=8.78ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.95ms min=1.87ms  med=76.58ms max=1.53s    p(90)=167.25ms p(95)=194.48ms p(99.9)=985.01ms
     http_reqs......................: 159318  2553.687207/s
     iteration_duration.............: avg=90.08ms min=3.2ms   med=78.54ms max=1.53s    p(90)=169.3ms  p(95)=197.42ms p(99.9)=1.03s   
     iterations.....................: 158318  2537.658339/s
     success_rate...................: 100.00% ✓ 158318      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462396      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=19.57µs min=1.02µs  med=2.66µs   max=72.8ms   p(90)=4.18µs   p(95)=5.25µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=16.21µs min=0s      med=0s       max=72.61ms  p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=91.67ms min=1.95ms  med=78.53ms  max=1.27s    p(90)=175.61ms p(95)=204.38ms p(99.9)=623.75ms
       { expected_response:true }...: avg=91.67ms min=1.95ms  med=78.53ms  max=1.27s    p(90)=175.61ms p(95)=204.38ms p(99.9)=623.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155132
     http_req_receiving.............: avg=1.53ms  min=52.55µs med=101.29µs max=589.51ms p(90)=1.61ms   p(95)=4.78ms   p(99.9)=117.89ms
     http_req_sending...............: avg=70.58µs min=4.38µs  med=9.68µs   max=187.61ms p(90)=17.73µs  p(95)=116.07µs p(99.9)=9.61ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.06ms min=1.83ms  med=77.43ms  max=1.25s    p(90)=173.62ms p(95)=201.13ms p(99.9)=605.46ms
     http_reqs......................: 155132  2487.002142/s
     iteration_duration.............: avg=92.52ms min=3.06ms  med=79.48ms  max=1.27s    p(90)=176.19ms p(95)=205.07ms p(99.9)=625.34ms
     iterations.....................: 154132  2470.97062/s
     success_rate...................: 100.00% ✓ 154132      ✗ 0     
     vus............................: 72      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 437757      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.8 MB/s
     http_req_blocked...............: avg=14.41µs min=902ns  med=2.2µs   max=83.06ms  p(90)=3.82µs   p(95)=4.91µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=11.33µs min=0s     med=0s      max=82.94ms  p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=96.84ms min=1.6ms  med=79.25ms max=2.82s    p(90)=183.23ms p(95)=211.94ms p(99.9)=930.12ms
       { expected_response:true }...: avg=96.84ms min=1.6ms  med=79.25ms max=2.82s    p(90)=183.23ms p(95)=211.94ms p(99.9)=930.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146919
     http_req_receiving.............: avg=1.18ms  min=50.5µs med=97.48µs max=977.53ms p(90)=1.47ms   p(95)=3.66ms   p(99.9)=84.38ms 
     http_req_sending...............: avg=61.57µs min=4.46µs med=9.23µs  max=185.53ms p(90)=17.83µs  p(95)=97.23µs  p(99.9)=8.24ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.59ms min=1.54ms med=78.1ms  max=2.82s    p(90)=181.86ms p(95)=209.74ms p(99.9)=898.64ms
     http_reqs......................: 146919  2369.249418/s
     iteration_duration.............: avg=97.77ms min=2.77ms med=80.19ms max=2.82s    p(90)=183.79ms p(95)=212.59ms p(99.9)=932.38ms
     iterations.....................: 145919  2353.123189/s
     success_rate...................: 100.00% ✓ 145919      ✗ 0     
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

     checks.........................: 100.00% ✓ 224889      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=4.84µs   min=922ns   med=2.07µs   max=16.99ms  p(90)=3.64µs   p(95)=4.53µs   p(99.9)=388.75µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=16.89ms  p(90)=0s       p(95)=0s       p(99.9)=327.58µs
     http_req_duration..............: avg=187.85ms min=1.94ms  med=188.51ms max=478.26ms p(90)=348.96ms p(95)=373.1ms  p(99.9)=441.02ms
       { expected_response:true }...: avg=187.85ms min=1.94ms  med=188.51ms max=478.26ms p(90)=348.96ms p(95)=373.1ms  p(99.9)=441.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75963
     http_req_receiving.............: avg=70.94µs  min=26.04µs med=57.19µs  max=150.8ms  p(90)=94.04µs  p(95)=108.48µs p(99.9)=939.7µs 
     http_req_sending...............: avg=27.28µs  min=4.74µs  med=9.6µs    max=136.58ms p(90)=16.61µs  p(95)=20.42µs  p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.75ms min=1.85ms  med=188.4ms  max=478.19ms p(90)=348.86ms p(95)=373.03ms p(99.9)=440.96ms
     http_reqs......................: 75963   1215.154238/s
     iteration_duration.............: avg=190.57ms min=4.16ms  med=191.52ms max=478.42ms p(90)=349.71ms p(95)=373.74ms p(99.9)=441.29ms
     iterations.....................: 74963   1199.157578/s
     success_rate...................: 100.00% ✓ 74963       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 108123     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   692 kB/s
     http_req_blocked...............: avg=7.89µs   min=1.03µs  med=2.48µs   max=12.21ms p(90)=4.3µs    p(95)=5.28µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=4.4µs    min=0s      med=0s       max=12.15ms p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=387.17ms min=3.49ms  med=362.18ms max=1.56s   p(90)=753.47ms p(95)=821.09ms p(99.9)=1.23s   
       { expected_response:true }...: avg=387.17ms min=3.49ms  med=362.18ms max=1.56s   p(90)=753.47ms p(95)=821.09ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 37041
     http_req_receiving.............: avg=83.5µs   min=30.64µs med=66.54µs  max=134ms   p(90)=106.2µs  p(95)=121.08µs p(99.9)=989.53µs
     http_req_sending...............: avg=27.45µs  min=5.01µs  med=11.92µs  max=52.85ms p(90)=19.97µs  p(95)=22.97µs  p(99.9)=2.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.06ms min=3.44ms  med=362.08ms max=1.56s   p(90)=753.37ms p(95)=821.03ms p(99.9)=1.23s   
     http_reqs......................: 37041   576.778999/s
     iteration_duration.............: avg=398.13ms min=18.12ms med=377.53ms max=1.57s   p(90)=756.66ms p(95)=823.82ms p(99.9)=1.24s   
     iterations.....................: 36041   561.207632/s
     success_rate...................: 100.00% ✓ 36041      ✗ 0    
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

     checks.........................: 100.00% ✓ 47886      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   304 kB/s
     http_req_blocked...............: avg=10.04µs  min=1.09µs  med=3.1µs    max=2.85ms  p(90)=4.79µs   p(95)=6.09µs   p(99.9)=1.1ms 
     http_req_connecting............: avg=5.43µs   min=0s      med=0s       max=2.78ms  p(90)=0s       p(95)=0s       p(99.9)=1.08ms
     http_req_duration..............: avg=836.31ms min=5.57ms  med=730.35ms max=18.97s  p(90)=1.44s    p(95)=1.67s    p(99.9)=17.48s
       { expected_response:true }...: avg=836.31ms min=5.57ms  med=730.35ms max=18.97s  p(90)=1.44s    p(95)=1.67s    p(99.9)=17.48s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16962
     http_req_receiving.............: avg=98.45µs  min=33.96µs med=89.06µs  max=41.91ms p(90)=125.18µs p(95)=139.38µs p(99.9)=1.22ms
     http_req_sending...............: avg=28.94µs  min=5.71µs  med=17.29µs  max=28.58ms p(90)=22.79µs  p(95)=26.86µs  p(99.9)=3.54ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=836.19ms min=5.48ms  med=730.23ms max=18.97s  p(90)=1.44s    p(95)=1.67s    p(99.9)=17.48s
     http_reqs......................: 16962   252.143489/s
     iteration_duration.............: avg=888.69ms min=44.6ms  med=783.18ms max=18.97s  p(90)=1.48s    p(95)=1.68s    p(99.9)=17.52s
     iterations.....................: 15962   237.278291/s
     success_rate...................: 100.00% ✓ 15962      ✗ 0    
     vus............................: 68      min=0        max=497
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

     checks.........................: 100.00% ✓ 47973      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   284 kB/s
     http_req_blocked...............: avg=10.39µs  min=1.31µs  med=3.37µs   max=3.65ms   p(90)=4.97µs   p(95)=6.23µs   p(99.9)=948.01µs
     http_req_connecting............: avg=5.36µs   min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=914.01µs
     http_req_duration..............: avg=431.22ms min=7.4ms   med=482.63ms max=1.26s    p(90)=758.28ms p(95)=802.97ms p(99.9)=1.09s   
       { expected_response:true }...: avg=431.22ms min=7.4ms   med=482.63ms max=1.26s    p(90)=758.28ms p(95)=802.97ms p(99.9)=1.09s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16991
     http_req_receiving.............: avg=160.39µs min=34.14µs med=83.83µs  max=163.41ms p(90)=123.48µs p(95)=141.15µs p(99.9)=4.81ms  
     http_req_sending...............: avg=28.2µs   min=5.62µs  med=16.33µs  max=34.2ms   p(90)=21.8µs   p(95)=26.73µs  p(99.9)=3.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=431.03ms min=7.31ms  med=482.52ms max=1.26s    p(90)=758.18ms p(95)=802.89ms p(99.9)=1.08s   
     http_reqs......................: 16991   232.603721/s
     iteration_duration.............: avg=458.2ms  min=9.62ms  med=501.61ms max=1.27s    p(90)=762.84ms p(95)=805.57ms p(99.9)=1.1s    
     iterations.....................: 15991   218.913902/s
     success_rate...................: 100.00% ✓ 15991      ✗ 0    
     vus............................: 51      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458475      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=18.59µs  min=841ns   med=2.25µs   max=65.15ms  p(90)=4µs      p(95)=5.18µs   p(99.9)=2.22ms  
     http_req_connecting............: avg=15.42µs  min=0s      med=0s       max=65.1ms   p(90)=0s       p(95)=0s       p(99.9)=2.16ms  
     http_req_duration..............: avg=92.43ms  min=1.41ms  med=87.53ms  max=382.18ms p(90)=177.01ms p(95)=193.2ms  p(99.9)=255.39ms
       { expected_response:true }...: avg=92.43ms  min=1.41ms  med=87.53ms  max=382.18ms p(90)=177.01ms p(95)=193.2ms  p(99.9)=255.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153825
     http_req_receiving.............: avg=639.05µs min=53.01µs med=104.26µs max=131.8ms  p(90)=1.23ms   p(95)=2.18ms   p(99.9)=27.37ms 
     http_req_sending...............: avg=65.6µs   min=4.53µs  med=9.32µs   max=136.77ms p(90)=19.5µs   p(95)=108.88µs p(99.9)=9.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.72ms  min=1.33ms  med=86.77ms  max=382.09ms p(90)=176.18ms p(95)=192.41ms p(99.9)=254.97ms
     http_reqs......................: 153825  2492.665679/s
     iteration_duration.............: avg=93.29ms  min=2.88ms  med=88.47ms  max=382.37ms p(90)=177.45ms p(95)=193.63ms p(99.9)=256.86ms
     iterations.....................: 152825  2476.461124/s
     success_rate...................: 100.00% ✓ 152825      ✗ 0     
     vus............................: 89      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 446199      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=18.55µs min=902ns   med=2.28µs   max=77.41ms  p(90)=3.91µs   p(95)=5.07µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=14.73µs min=0s      med=0s       max=62.91ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=94.99ms min=1.56ms  med=82.15ms  max=1.55s    p(90)=181.23ms p(95)=214ms    p(99.9)=648.79ms
       { expected_response:true }...: avg=94.99ms min=1.56ms  med=82.15ms  max=1.55s    p(90)=181.23ms p(95)=214ms    p(99.9)=648.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149733
     http_req_receiving.............: avg=1.6ms   min=50.07µs med=101.74µs max=964.83ms p(90)=1.65ms   p(95)=4.55ms   p(99.9)=93.38ms 
     http_req_sending...............: avg=62.82µs min=4.72µs  med=9.4µs    max=121.61ms p(90)=19.05µs  p(95)=107.54µs p(99.9)=8.38ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.33ms min=1.47ms  med=81.06ms  max=1.55s    p(90)=179.16ms p(95)=209.99ms p(99.9)=625.53ms
     http_reqs......................: 149733  2419.055938/s
     iteration_duration.............: avg=95.89ms min=2.88ms  med=83.13ms  max=1.55s    p(90)=181.91ms p(95)=214.8ms  p(99.9)=649.61ms
     iterations.....................: 148733  2402.900141/s
     success_rate...................: 100.00% ✓ 148733      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 439194      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=22.08µs  min=1.04µs  med=3.2µs   max=53.81ms  p(90)=5.18µs   p(95)=6.5µs    p(99.9)=1.5ms   
     http_req_connecting............: avg=17.96µs  min=0s      med=0s      max=53.71ms  p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=96.46ms  min=1.48ms  med=90.73ms max=297.13ms p(90)=188.32ms p(95)=204.39ms p(99.9)=259.63ms
       { expected_response:true }...: avg=96.46ms  min=1.48ms  med=90.73ms max=297.13ms p(90)=188.32ms p(95)=204.39ms p(99.9)=259.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147398
     http_req_receiving.............: avg=188.05µs min=25.86µs med=58.88µs max=51.9ms   p(90)=173.33µs p(95)=401.64µs p(99.9)=20.53ms 
     http_req_sending...............: avg=75.42µs  min=5.22µs  med=12.34µs max=159.59ms p(90)=23.74µs  p(95)=139.43µs p(99.9)=10.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.2ms   min=1.44ms  med=90.52ms max=287.94ms p(90)=187.85ms p(95)=203.86ms p(99.9)=258.11ms
     http_reqs......................: 147398  2384.6054/s
     iteration_duration.............: avg=97.4ms   min=3.2ms   med=91.81ms max=330.92ms p(90)=188.86ms p(95)=204.97ms p(99.9)=260.62ms
     iterations.....................: 146398  2368.427396/s
     success_rate...................: 100.00% ✓ 146398      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 426330      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=20.14µs  min=1.05µs  med=2.84µs  max=62.3ms   p(90)=4.52µs   p(95)=5.64µs   p(99.9)=2.15ms  
     http_req_connecting............: avg=16.54µs  min=0s      med=0s      max=62.19ms  p(90)=0s       p(95)=0s       p(99.9)=2.04ms  
     http_req_duration..............: avg=99.43ms  min=1.5ms   med=86.76ms max=1.36s    p(90)=186.85ms p(95)=218.05ms p(99.9)=752.29ms
       { expected_response:true }...: avg=99.43ms  min=1.5ms   med=86.76ms max=1.36s    p(90)=186.85ms p(95)=218.05ms p(99.9)=752.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143110
     http_req_receiving.............: avg=1.48ms   min=54.42µs med=111.7µs max=710.38ms p(90)=1.75ms   p(95)=4.74ms   p(99.9)=95ms    
     http_req_sending...............: avg=72.48µs  min=5.05µs  med=10.72µs max=169.52ms p(90)=20.19µs  p(95)=120.12µs p(99.9)=9.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.87ms  min=1.39ms  med=85.41ms max=1.31s    p(90)=184.96ms p(95)=215.4ms  p(99.9)=731.29ms
     http_reqs......................: 143110  2312.887741/s
     iteration_duration.............: avg=100.39ms min=2.53ms  med=87.8ms  max=1.36s    p(90)=187.52ms p(95)=218.83ms p(99.9)=753.18ms
     iterations.....................: 142110  2296.726133/s
     success_rate...................: 100.00% ✓ 142110      ✗ 0     
     vus............................: 50      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 397608      ✗ 0     
     data_received..................: 12 GB   188 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=14.44µs  min=901ns   med=2.43µs   max=78.63ms  p(90)=4.34µs   p(95)=5.48µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=10.68µs  min=0s      med=0s       max=51.7ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=106.59ms min=1.81ms  med=94.86ms  max=1.97s    p(90)=202.97ms p(95)=232.31ms p(99.9)=661.44ms
       { expected_response:true }...: avg=106.59ms min=1.81ms  med=94.86ms  max=1.97s    p(90)=202.97ms p(95)=232.31ms p(99.9)=661.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133536
     http_req_receiving.............: avg=1.6ms    min=51.69µs med=113.13µs max=560.02ms p(90)=1.92ms   p(95)=4.8ms    p(99.9)=89.63ms 
     http_req_sending...............: avg=60.9µs   min=4.14µs  med=9.61µs   max=213.77ms p(90)=19.05µs  p(95)=92.33µs  p(99.9)=7.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.93ms min=1.71ms  med=93.59ms  max=1.97s    p(90)=201.15ms p(95)=228.94ms p(99.9)=641.42ms
     http_reqs......................: 133536  2144.728499/s
     iteration_duration.............: avg=107.65ms min=2.93ms  med=96.04ms  max=1.97s    p(90)=203.57ms p(95)=233.18ms p(99.9)=663.56ms
     iterations.....................: 132536  2128.667448/s
     success_rate...................: 100.00% ✓ 132536      ✗ 0     
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

     checks.........................: 100.00% ✓ 207252      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.49µs   min=1.11µs  med=2.89µs   max=11.17ms  p(90)=4.68µs   p(95)=5.63µs   p(99.9)=626.02µs
     http_req_connecting............: avg=2.87µs   min=0s      med=0s       max=11.08ms  p(90)=0s       p(95)=0s       p(99.9)=545.59µs
     http_req_duration..............: avg=203.66ms min=2.05ms  med=202.98ms max=532.41ms p(90)=377.8ms  p(95)=405.14ms p(99.9)=488.1ms 
       { expected_response:true }...: avg=203.66ms min=2.05ms  med=202.98ms max=532.41ms p(90)=377.8ms  p(95)=405.14ms p(99.9)=488.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 70084
     http_req_receiving.............: avg=81µs     min=26.34µs med=66.65µs  max=112.24ms p(90)=107.78µs p(95)=123.5µs  p(99.9)=1.11ms  
     http_req_sending...............: avg=30.98µs  min=5.44µs  med=12.07µs  max=161.57ms p(90)=18.76µs  p(95)=22.68µs  p(99.9)=3.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.54ms min=1.98ms  med=202.86ms max=532.35ms p(90)=377.71ms p(95)=405.02ms p(99.9)=488.04ms
     http_reqs......................: 70084   1119.409097/s
     iteration_duration.............: avg=206.84ms min=4.32ms  med=206.98ms max=532.61ms p(90)=378.81ms p(95)=405.78ms p(99.9)=488.57ms
     iterations.....................: 69084   1103.436705/s
     success_rate...................: 100.00% ✓ 69084       ✗ 0    
     vus............................: 85      min=0         max=496
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

     checks.........................: 100.00% ✓ 102243     ✗ 0    
     data_received..................: 3.1 GB  47 MB/s
     data_sent......................: 42 MB   651 kB/s
     http_req_blocked...............: avg=9.24µs   min=1.13µs  med=3.29µs   max=7.97ms   p(90)=5.1µs    p(95)=6.21µs   p(99.9)=1.66ms
     http_req_connecting............: avg=4.9µs    min=0s      med=0s       max=7.9ms    p(90)=0s       p(95)=0s       p(99.9)=1.63ms
     http_req_duration..............: avg=408.96ms min=3.76ms  med=375ms    max=1.71s    p(90)=801.98ms p(95)=876.91ms p(99.9)=1.3s  
       { expected_response:true }...: avg=408.96ms min=3.76ms  med=375ms    max=1.71s    p(90)=801.98ms p(95)=876.91ms p(99.9)=1.3s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 35081
     http_req_receiving.............: avg=94.7µs   min=31.83µs med=77.62µs  max=170.96ms p(90)=117.79µs p(95)=133.67µs p(99.9)=1.08ms
     http_req_sending...............: avg=32.78µs  min=5.35µs  med=15.54µs  max=111.24ms p(90)=22.82µs  p(95)=26.03µs  p(99.9)=2.51ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=408.83ms min=3.66ms  med=374.91ms max=1.71s    p(90)=801.85ms p(95)=876.8ms  p(99.9)=1.3s  
     http_reqs......................: 35081   541.861835/s
     iteration_duration.............: avg=421.22ms min=14.01ms med=390.29ms max=1.72s    p(90)=805.64ms p(95)=879.45ms p(99.9)=1.3s  
     iterations.....................: 34081   526.415815/s
     success_rate...................: 100.00% ✓ 34081      ✗ 0    
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

     checks.........................: 100.00% ✓ 46554      ✗ 0    
     data_received..................: 1.4 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=15.47µs  min=1.3µs   med=3.97µs   max=7.23ms  p(90)=5.89µs   p(95)=7.65µs   p(99.9)=2.13ms
     http_req_connecting............: avg=9.61µs   min=0s      med=0s       max=7.16ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms
     http_req_duration..............: avg=880.97ms min=5.7ms   med=788.9ms  max=4.81s   p(90)=1.75s    p(95)=1.97s    p(99.9)=3.98s 
       { expected_response:true }...: avg=880.97ms min=5.7ms   med=788.9ms  max=4.81s   p(90)=1.75s    p(95)=1.97s    p(99.9)=3.98s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16518
     http_req_receiving.............: avg=103.53µs min=37.24µs med=96.79µs  max=3.22ms  p(90)=135.91µs p(95)=152.02µs p(99.9)=1.25ms
     http_req_sending...............: avg=43.86µs  min=6.41µs  med=18.86µs  max=63.11ms p(90)=24.82µs  p(95)=30.36µs  p(99.9)=5.06ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=880.82ms min=5.56ms  med=788.67ms max=4.81s   p(90)=1.75s    p(95)=1.97s    p(99.9)=3.98s 
     http_reqs......................: 16518   245.07324/s
     iteration_duration.............: avg=937.81ms min=25.71ms med=864.33ms max=4.81s   p(90)=1.77s    p(95)=1.99s    p(99.9)=4s    
     iterations.....................: 15518   230.236502/s
     success_rate...................: 100.00% ✓ 15518      ✗ 0    
     vus............................: 68      min=0        max=499
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

     checks.........................: 100.00% ✓ 45372      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=15.8µs   min=1.42µs  med=3.77µs   max=8.01ms  p(90)=5.62µs   p(95)=7.47µs   p(99.9)=2.31ms
     http_req_connecting............: avg=10.08µs  min=0s      med=0s       max=7.94ms  p(90)=0s       p(95)=0s       p(99.9)=2.29ms
     http_req_duration..............: avg=901.75ms min=7.91ms  med=814.75ms max=3.27s   p(90)=1.86s    p(95)=2.03s    p(99.9)=2.85s 
       { expected_response:true }...: avg=901.75ms min=7.91ms  med=814.75ms max=3.27s   p(90)=1.86s    p(95)=2.03s    p(99.9)=2.85s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16124
     http_req_receiving.............: avg=104.18µs min=34.67µs med=94.17µs  max=20.61ms p(90)=136.13µs p(95)=153.78µs p(99.9)=1.13ms
     http_req_sending...............: avg=39.98µs  min=6.49µs  med=19.05µs  max=42.02ms p(90)=24.95µs  p(95)=30.55µs  p(99.9)=2.82ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=901.61ms min=7.76ms  med=814.62ms max=3.27s   p(90)=1.86s    p(95)=2.03s    p(99.9)=2.85s 
     http_reqs......................: 16124   234.054621/s
     iteration_duration.............: avg=961.4ms  min=12.13ms med=893.64ms max=3.27s   p(90)=1.88s    p(95)=2.04s    p(99.9)=2.87s 
     iterations.....................: 15124   219.538706/s
     success_rate...................: 100.00% ✓ 15124      ✗ 0    
     vus............................: 18      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

