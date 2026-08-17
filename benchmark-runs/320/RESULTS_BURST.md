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
| fusion-nightly-net11 | 16.6.2-p.1 | 2,624 | 2,714 | 2,602 | 1.7% |  |
| cosmo | 0.334.0 | 1,225 | 1,266 | 1,220 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 567 | 581 | 563 | 1.2% |  |
| hive-gateway | 2.10.8 | 252 | 259 | 249 | 1.3% |  |
| apollo-gateway | 2.14.3 | 233 | 240 | 231 | 1.3% | 3 failed requests across 1/9 runs |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (8913 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion | — | — | — | — | — | benchmark run failed |
| fusion-nightly | — | — | — | — | — | benchmark run failed |
| fusion-nightly-fed | — | — | — | — | — | benchmark run failed |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (521348 across 9/9 runs) |
| hive-router | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.1 | 2,414 | 2,505 | 2,407 | 1.4% |  |
| apollo-gateway | 2.14.3 | 236 | 240 | 235 | 0.6% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (24484 across 9/9 runs) |
| cosmo | — | — | — | — | — | benchmark run failed |
| feddi | — | — | — | — | — | not run |
| fusion-nightly | — | — | — | — | — | benchmark run failed |
| fusion-nightly-fed | — | — | — | — | — | benchmark run failed |
| fusion-nightly-net11 | — | — | — | — | — | benchmark run failed |
| grafbase | — | — | — | — | — | benchmark run failed |
| hive-gateway | — | — | — | — | — | benchmark run failed |
| hive-gateway-router-runtime | — | — | — | — | — | benchmark run failed |
| hive-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 486264      ✗ 0     
     data_received..................: 14 GB   230 MB/s
     data_sent......................: 196 MB  3.2 MB/s
     http_req_blocked...............: avg=24.12µs  min=941ns  med=2.59µs   max=72.93ms  p(90)=4.22µs   p(95)=5.38µs   p(99.9)=2.89ms  
     http_req_connecting............: avg=20.63µs  min=0s     med=0s       max=72.85ms  p(90)=0s       p(95)=0s       p(99.9)=2.83ms  
     http_req_duration..............: avg=87.15ms  min=1.87ms med=82.37ms  max=358.22ms p(90)=166.46ms p(95)=185.89ms p(99.9)=259.77ms
       { expected_response:true }...: avg=87.15ms  min=1.87ms med=82.37ms  max=358.22ms p(90)=166.46ms p(95)=185.89ms p(99.9)=259.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163088
     http_req_receiving.............: avg=571.41µs min=50.8µs med=101.67µs max=145.89ms p(90)=1.08ms   p(95)=1.9ms    p(99.9)=26.51ms 
     http_req_sending...............: avg=77.26µs  min=4.36µs med=9.68µs   max=227.54ms p(90)=18.98µs  p(95)=120.03µs p(99.9)=10.29ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.5ms   min=1.79ms med=81.7ms   max=340.1ms  p(90)=165.73ms p(95)=185.26ms p(99.9)=257.47ms
     http_reqs......................: 163088  2624.640613/s
     iteration_duration.............: avg=87.96ms  min=3.15ms med=83.2ms   max=369.65ms p(90)=166.97ms p(95)=186.55ms p(99.9)=261.65ms
     iterations.....................: 162088  2608.547211/s
     success_rate...................: 100.00% ✓ 162088      ✗ 0     
     vus............................: 62      min=0         max=497 
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

     checks.........................: 100.00% ✓ 226626      ✗ 0    
     data_received..................: 6.7 GB  108 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=5µs      min=912ns   med=2.05µs   max=7.78ms   p(90)=3.55µs   p(95)=4.48µs   p(99.9)=477.06µs
     http_req_connecting............: avg=2.3µs    min=0s      med=0s       max=7.7ms    p(90)=0s       p(95)=0s       p(99.9)=396.75µs
     http_req_duration..............: avg=186.4ms  min=1.92ms  med=187.71ms max=592.87ms p(90)=344.99ms p(95)=368.8ms  p(99.9)=505.56ms
       { expected_response:true }...: avg=186.4ms  min=1.92ms  med=187.71ms max=592.87ms p(90)=344.99ms p(95)=368.8ms  p(99.9)=505.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76542
     http_req_receiving.............: avg=68.2µs   min=27.67µs med=56.48µs  max=37.51ms  p(90)=91.64µs  p(95)=105.62µs p(99.9)=813.34µs
     http_req_sending...............: avg=26.68µs  min=4.82µs  med=9.28µs   max=118.46ms p(90)=15.53µs  p(95)=19.56µs  p(99.9)=3.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.31ms min=1.86ms  med=187.6ms  max=592.78ms p(90)=344.9ms  p(95)=368.7ms  p(99.9)=505.32ms
     http_reqs......................: 76542   1225.541405/s
     iteration_duration.............: avg=189.09ms min=4.22ms  med=190.62ms max=593.07ms p(90)=345.78ms p(95)=369.36ms p(99.9)=505.83ms
     iterations.....................: 75542   1209.530046/s
     success_rate...................: 100.00% ✓ 75542       ✗ 0    
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

     checks.........................: 100.00% ✓ 106341     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   682 kB/s
     http_req_blocked...............: avg=7.47µs   min=1.18µs  med=3.2µs    max=16.91ms  p(90)=4.91µs   p(95)=5.97µs   p(99.9)=580.69µs
     http_req_connecting............: avg=3.29µs   min=0s      med=0s       max=16.85ms  p(90)=0s       p(95)=0s       p(99.9)=531.64µs
     http_req_duration..............: avg=393.43ms min=3.48ms  med=366.19ms max=1.73s    p(90)=776.45ms p(95)=844.83ms p(99.9)=1.23s   
       { expected_response:true }...: avg=393.43ms min=3.48ms  med=366.19ms max=1.73s    p(90)=776.45ms p(95)=844.83ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36447
     http_req_receiving.............: avg=84.42µs  min=29.46µs med=71.94µs  max=35.96ms  p(90)=111.36µs p(95)=126.55µs p(99.9)=1.06ms  
     http_req_sending...............: avg=31.9µs   min=5.59µs  med=14.14µs  max=125.37ms p(90)=21.49µs  p(95)=24.45µs  p(99.9)=2.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=393.31ms min=3.41ms  med=366.08ms max=1.73s    p(90)=776.36ms p(95)=844.75ms p(99.9)=1.23s   
     http_reqs......................: 36447   567.716565/s
     iteration_duration.............: avg=404.77ms min=17.74ms med=379.53ms max=1.74s    p(90)=780.29ms p(95)=847.8ms  p(99.9)=1.23s   
     iterations.....................: 35447   552.140069/s
     success_rate...................: 100.00% ✓ 35447      ✗ 0    
     vus............................: 64      min=0        max=496
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

     checks.........................: 100.00% ✓ 48129      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   304 kB/s
     http_req_blocked...............: avg=14.76µs  min=1.32µs  med=3.76µs   max=12.28ms p(90)=5.54µs   p(95)=6.9µs    p(99.9)=2.03ms
     http_req_connecting............: avg=9.4µs    min=0s      med=0s       max=12.21ms p(90)=0s       p(95)=0s       p(99.9)=2.01ms
     http_req_duration..............: avg=839.07ms min=5.62ms  med=737.58ms max=16.97s  p(90)=1.48s    p(95)=1.68s    p(99.9)=16.25s
       { expected_response:true }...: avg=839.07ms min=5.62ms  med=737.58ms max=16.97s  p(90)=1.48s    p(95)=1.68s    p(99.9)=16.25s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17043
     http_req_receiving.............: avg=96.46µs  min=37.12µs med=88.74µs  max=9.43ms  p(90)=127.42µs p(95)=144.18µs p(99.9)=1.19ms
     http_req_sending...............: avg=32.08µs  min=6.62µs  med=18.09µs  max=73.23ms p(90)=24.05µs  p(95)=27.87µs  p(99.9)=2.58ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=838.94ms min=5.51ms  med=737.48ms max=16.97s  p(90)=1.48s    p(95)=1.68s    p(99.9)=16.25s
     http_reqs......................: 17043   252.793173/s
     iteration_duration.............: avg=891.39ms min=23.37ms med=795.28ms max=16.98s  p(90)=1.5s     p(95)=1.69s    p(99.9)=16.31s
     iterations.....................: 16043   237.960504/s
     success_rate...................: 100.00% ✓ 16043      ✗ 0    
     vus............................: 75      min=0        max=499
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

     checks.........................: 100.00% ✓ 48129      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   286 kB/s
     http_req_blocked...............: avg=11.89µs  min=1.36µs  med=3.25µs   max=5.64ms  p(90)=4.83µs   p(95)=6.22µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=6.71µs   min=0s      med=0s       max=5.46ms  p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=383.07ms min=7.48ms  med=448.68ms max=1.14s   p(90)=641.66ms p(95)=698.53ms p(99.9)=956.07ms
       { expected_response:true }...: avg=383.07ms min=7.48ms  med=448.68ms max=1.14s   p(90)=641.66ms p(95)=698.53ms p(99.9)=956.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17043
     http_req_receiving.............: avg=98.57µs  min=32.35µs med=81.59µs  max=99.02ms p(90)=120µs    p(95)=133.73µs p(99.9)=944.47µs
     http_req_sending...............: avg=35.86µs  min=5.83µs  med=16.07µs  max=82.86ms p(90)=21.72µs  p(95)=26.02µs  p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=382.93ms min=7.37ms  med=448.45ms max=1.14s   p(90)=641.56ms p(95)=698.42ms p(99.9)=955.98ms
     http_reqs......................: 17043   233.309372/s
     iteration_duration.............: avg=406.97ms min=8.25ms  med=469.34ms max=1.14s   p(90)=647.61ms p(95)=703.43ms p(99.9)=971.69ms
     iterations.....................: 16043   219.619918/s
     success_rate...................: 100.00% ✓ 16043      ✗ 0    
     vus............................: 53      min=0        max=497
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

     checks.........................: 100.00% ✓ 445473      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=18.07µs min=872ns   med=2.29µs   max=83.05ms  p(90)=4.07µs   p(95)=5.26µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=14.92µs min=0s      med=0s       max=82.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=95.14ms min=1.54ms  med=84.35ms  max=1.23s    p(90)=181.17ms p(95)=210.53ms p(99.9)=636.86ms
       { expected_response:true }...: avg=95.14ms min=1.54ms  med=84.35ms  max=1.23s    p(90)=181.17ms p(95)=210.53ms p(99.9)=636.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149491
     http_req_receiving.............: avg=1.44ms  min=52.01µs med=100.74µs max=415.15ms p(90)=1.57ms   p(95)=4.22ms   p(99.9)=103.07ms
     http_req_sending...............: avg=66.64µs min=4.91µs  med=9.46µs   max=160.49ms p(90)=20.14µs  p(95)=109.33µs p(99.9)=9.12ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.63ms min=1.45ms  med=83.27ms  max=1.23s    p(90)=179.49ms p(95)=207.34ms p(99.9)=625.19ms
     http_reqs......................: 149491  2414.456971/s
     iteration_duration.............: avg=96.05ms min=2.74ms  med=85.27ms  max=1.23s    p(90)=181.82ms p(95)=211.32ms p(99.9)=637.76ms
     iterations.....................: 148491  2398.305785/s
     success_rate...................: 100.00% ✓ 148491      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 45780      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=13.63µs  min=1.18µs  med=3.35µs   max=3.63ms  p(90)=5.22µs   p(95)=6.95µs   p(99.9)=1.91ms
     http_req_connecting............: avg=8.5µs    min=0s      med=0s       max=3.59ms  p(90)=0s       p(95)=0s       p(99.9)=1.89ms
     http_req_duration..............: avg=893.6ms  min=7.86ms  med=816.59ms max=3.2s    p(90)=1.85s    p(95)=1.96s    p(99.9)=2.79s 
       { expected_response:true }...: avg=893.6ms  min=7.86ms  med=816.59ms max=3.2s    p(90)=1.85s    p(95)=1.96s    p(99.9)=2.79s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16260
     http_req_receiving.............: avg=101.59µs min=34.84µs med=93.1µs   max=28.14ms p(90)=133.72µs p(95)=148.98µs p(99.9)=861µs 
     http_req_sending...............: avg=32.76µs  min=5.48µs  med=18.03µs  max=74.69ms p(90)=23.61µs  p(95)=28.33µs  p(99.9)=2.6ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=893.46ms min=7.73ms  med=816.49ms max=3.2s    p(90)=1.85s    p(95)=1.96s    p(99.9)=2.79s 
     http_reqs......................: 16260   236.183425/s
     iteration_duration.............: avg=952.18ms min=32.49ms med=886.09ms max=3.21s   p(90)=1.86s    p(95)=1.97s    p(99.9)=2.81s 
     iterations.....................: 15260   221.657999/s
     success_rate...................: 100.00% ✓ 15260      ✗ 0    
     vus............................: 100     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

