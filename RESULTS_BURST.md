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
| hive-router | v0.0.84 | 2,913 | 3,057 | 2,895 | 2.0% |  |
| fusion-nightly-net11 | 16.6.0-p.11 | 2,628 | 2,716 | 2,612 | 1.4% |  |
| fusion-nightly | 16.6.0-p.11 | 2,494 | 2,541 | 2,486 | 0.7% |  |
| fusion | 16.5.1 | 2,457 | 2,558 | 2,445 | 1.6% |  |
| cosmo | 0.334.0 | 1,191 | 1,234 | 1,183 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 570 | 583 | 566 | 1.0% |  |
| hive-gateway | 2.10.8 | 257 | 262 | 255 | 0.9% |  |
| apollo-gateway | 2.14.3 | 232 | 238 | 230 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (8196 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (491329 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.11 | 2,452 | 2,551 | 2,442 | 1.5% |  |
| hive-router | v0.0.84 | 2,386 | 2,525 | 2,368 | 2.2% |  |
| fusion-nightly | 16.6.0-p.11 | 2,323 | 2,418 | 2,309 | 1.5% |  |
| fusion | 16.5.1 | 2,269 | 2,358 | 2,227 | 2.0% |  |
| fusion-nightly-fed | 16.6.0-p.11 | 2,105 | 2,188 | 2,081 | 1.5% |  |
| cosmo | 0.334.0 | 1,153 | 1,191 | 1,149 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 539 | 556 | 535 | 1.4% |  |
| hive-gateway | 2.10.8 | 242 | 247 | 239 | 1.0% |  |
| apollo-gateway | 2.14.3 | 236 | 242 | 235 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (21191 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (316553 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 536538      ✗ 0     
     data_received..................: 16 GB   256 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=19.18µs  min=861ns   med=2.18µs  max=114.63ms p(90)=3.71µs   p(95)=4.88µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=15.6µs   min=0s      med=0s      max=63.72ms  p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=79.01ms  min=1.4ms   med=73.7ms  max=276.56ms p(90)=153.4ms  p(95)=168.4ms  p(99.9)=220.49ms
       { expected_response:true }...: avg=79.01ms  min=1.4ms   med=73.7ms  max=276.56ms p(90)=153.4ms  p(95)=168.4ms  p(99.9)=220.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179846
     http_req_receiving.............: avg=145.16µs min=25.57µs med=49.39µs max=83.18ms  p(90)=140.52µs p(95)=326.11µs p(99.9)=17.76ms 
     http_req_sending...............: avg=72.93µs  min=4.55µs  med=9.28µs  max=203.89ms p(90)=18.12µs  p(95)=112.45µs p(99.9)=11.02ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.79ms  min=1.34ms  med=73.51ms max=276.49ms p(90)=153.12ms p(95)=167.97ms p(99.9)=219.86ms
     http_reqs......................: 179846  2913.949521/s
     iteration_duration.............: avg=79.7ms   min=2.1ms   med=74.49ms max=311.37ms p(90)=153.81ms p(95)=168.9ms  p(99.9)=222.06ms
     iterations.....................: 178846  2897.74705/s
     success_rate...................: 100.00% ✓ 178846      ✗ 0     
     vus............................: 90      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 488097      ✗ 0     
     data_received..................: 14 GB   230 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=21.24µs  min=1µs     med=2.59µs   max=69.05ms  p(90)=4.16µs   p(95)=5.24µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=17.98µs  min=0s      med=0s       max=68.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=86.84ms  min=1.84ms  med=81.94ms  max=374.69ms p(90)=166.89ms p(95)=184.6ms  p(99.9)=249.72ms
       { expected_response:true }...: avg=86.84ms  min=1.84ms  med=81.94ms  max=374.69ms p(90)=166.89ms p(95)=184.6ms  p(99.9)=249.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163699
     http_req_receiving.............: avg=703.74µs min=51.32µs med=111.19µs max=256.29ms p(90)=1.48ms   p(95)=2.36ms   p(99.9)=26.35ms 
     http_req_sending...............: avg=74.84µs  min=4.37µs  med=9.66µs   max=228.1ms  p(90)=19.09µs  p(95)=119.92µs p(99.9)=10.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.06ms  min=1.77ms  med=81.15ms  max=346.33ms p(90)=166.08ms p(95)=183.77ms p(99.9)=248.97ms
     http_reqs......................: 163699  2628.975213/s
     iteration_duration.............: avg=87.62ms  min=4.5ms   med=82.84ms  max=374.89ms p(90)=167.38ms p(95)=185.11ms p(99.9)=250.67ms
     iterations.....................: 162699  2612.915401/s
     success_rate...................: 100.00% ✓ 162699      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 464604      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=19.2µs  min=892ns   med=2.41µs  max=92.09ms  p(90)=4.08µs   p(95)=5.18µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=16.05µs min=0s      med=0s      max=92.04ms  p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=91.24ms min=2.01ms  med=79.6ms  max=1.39s    p(90)=173.24ms p(95)=198.76ms p(99.9)=757.54ms
       { expected_response:true }...: avg=91.24ms min=2.01ms  med=79.6ms  max=1.39s    p(90)=173.24ms p(95)=198.76ms p(99.9)=757.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155868
     http_req_receiving.............: avg=1.76ms  min=52.14µs med=97.9µs  max=893.63ms p(90)=1.45ms   p(95)=4.1ms    p(99.9)=239.02ms
     http_req_sending...............: avg=73.11µs min=4.67µs  med=9.45µs  max=164.73ms p(90)=18.74µs  p(95)=114.61µs p(99.9)=9.9ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.4ms  min=1.93ms  med=78.56ms max=1.39s    p(90)=171.29ms p(95)=195.53ms p(99.9)=601.82ms
     http_reqs......................: 155868  2494.807567/s
     iteration_duration.............: avg=92.1ms  min=3.49ms  med=80.48ms max=1.41s    p(90)=173.79ms p(95)=199.51ms p(99.9)=757.77ms
     iterations.....................: 154868  2478.801667/s
     success_rate...................: 100.00% ✓ 154868      ✗ 0     
     vus............................: 77      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 456819      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=15.94µs min=861ns   med=2.09µs  max=56.38ms  p(90)=3.49µs   p(95)=4.53µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=13µs    min=0s      med=0s      max=56.3ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=92.82ms min=1.97ms  med=79.84ms max=1.7s     p(90)=176.98ms p(95)=202.34ms p(99.9)=678.54ms
       { expected_response:true }...: avg=92.82ms min=1.97ms  med=79.84ms max=1.7s     p(90)=176.98ms p(95)=202.34ms p(99.9)=678.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153273
     http_req_receiving.............: avg=1.39ms  min=51.41µs med=97.92µs max=555.6ms  p(90)=1.52ms   p(95)=4.02ms   p(99.9)=91.66ms 
     http_req_sending...............: avg=56.15µs min=4.64µs  med=8.74µs  max=110.33ms p(90)=16.47µs  p(95)=99.99µs  p(99.9)=7.5ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.37ms min=1.9ms   med=78.78ms max=1.7s     p(90)=175.24ms p(95)=199.2ms  p(99.9)=652.7ms 
     http_reqs......................: 153273  2457.461988/s
     iteration_duration.............: avg=93.68ms min=3.42ms  med=80.71ms max=1.7s     p(90)=177.48ms p(95)=203.02ms p(99.9)=681.08ms
     iterations.....................: 152273  2441.428754/s
     success_rate...................: 100.00% ✓ 152273      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 220302      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=4.31µs   min=972ns   med=1.97µs   max=8.43ms   p(90)=3.43µs   p(95)=4.24µs   p(99.9)=356.59µs
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=8.37ms   p(90)=0s       p(95)=0s       p(99.9)=301.04µs
     http_req_duration..............: avg=191.75ms min=1.9ms   med=191.13ms max=632.35ms p(90)=352.83ms p(95)=378.15ms p(99.9)=525.58ms
       { expected_response:true }...: avg=191.75ms min=1.9ms   med=191.13ms max=632.35ms p(90)=352.83ms p(95)=378.15ms p(99.9)=525.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74434
     http_req_receiving.............: avg=70.13µs  min=27.06µs med=55.01µs  max=166.11ms p(90)=89.63µs  p(95)=104.1µs  p(99.9)=908.42µs
     http_req_sending...............: avg=23.46µs  min=4.65µs  med=9.17µs   max=110.52ms p(90)=14.63µs  p(95)=18.12µs  p(99.9)=2.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.66ms min=1.85ms  med=191.03ms max=632.3ms  p(90)=352.72ms p(95)=378.08ms p(99.9)=525.54ms
     http_reqs......................: 74434   1191.823357/s
     iteration_duration.............: avg=194.58ms min=5.27ms  med=194.45ms max=632.54ms p(90)=353.72ms p(95)=378.81ms p(99.9)=526.08ms
     iterations.....................: 73434   1175.811543/s
     success_rate...................: 100.00% ✓ 73434       ✗ 0    
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

     checks.........................: 100.00% ✓ 106980     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   685 kB/s
     http_req_blocked...............: avg=7.52µs   min=990ns   med=2.47µs   max=4.78ms  p(90)=4.26µs   p(95)=5.23µs   p(99.9)=1.26ms
     http_req_connecting............: avg=4.05µs   min=0s      med=0s       max=4.74ms  p(90)=0s       p(95)=0s       p(99.9)=1.16ms
     http_req_duration..............: avg=391.33ms min=3.56ms  med=363.89ms max=1.75s   p(90)=771.93ms p(95)=838.58ms p(99.9)=1.23s 
       { expected_response:true }...: avg=391.33ms min=3.56ms  med=363.89ms max=1.75s   p(90)=771.93ms p(95)=838.58ms p(99.9)=1.23s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36660
     http_req_receiving.............: avg=77.64µs  min=27.96µs med=66.17µs  max=19.39ms p(90)=104.58µs p(95)=118.88µs p(99.9)=1.07ms
     http_req_sending...............: avg=31.73µs  min=5.03µs  med=11.76µs  max=171.1ms p(90)=19.16µs  p(95)=22.04µs  p(99.9)=2.33ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=391.22ms min=3.49ms  med=363.79ms max=1.75s   p(90)=771.82ms p(95)=838.49ms p(99.9)=1.23s 
     http_reqs......................: 36660   570.763867/s
     iteration_duration.............: avg=402.53ms min=18.59ms med=376.15ms max=1.76s   p(90)=775.66ms p(95)=841.17ms p(99.9)=1.24s 
     iterations.....................: 35660   555.194749/s
     success_rate...................: 100.00% ✓ 35660      ✗ 0    
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

     checks.........................: 100.00% ✓ 48687      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=15.34µs  min=1.59µs  med=3.81µs   max=12.89ms p(90)=5.64µs   p(95)=7.03µs  p(99.9)=2.27ms
     http_req_connecting............: avg=9.86µs   min=0s      med=0s       max=12.82ms p(90)=0s       p(95)=0s      p(99.9)=2.25ms
     http_req_duration..............: avg=831.63ms min=5.38ms  med=739.61ms max=16.67s  p(90)=1.51s    p(95)=1.71s   p(99.9)=12.25s
       { expected_response:true }...: avg=831.63ms min=5.38ms  med=739.61ms max=16.67s  p(90)=1.51s    p(95)=1.71s   p(99.9)=12.25s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17229
     http_req_receiving.............: avg=107.39µs min=37.55µs med=94.2µs   max=61.32ms p(90)=132.73µs p(95)=149.4µs p(99.9)=1.66ms
     http_req_sending...............: avg=27.88µs  min=6.97µs  med=18.62µs  max=25.91ms p(90)=24.34µs  p(95)=28.88µs p(99.9)=1.61ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=831.5ms  min=5.3ms   med=739.4ms  max=16.67s  p(90)=1.51s    p(95)=1.71s   p(99.9)=12.25s
     http_reqs......................: 17229   257.085731/s
     iteration_duration.............: avg=882.94ms min=45.15ms med=785.12ms max=16.67s  p(90)=1.52s    p(95)=1.72s   p(99.9)=13.33s
     iterations.....................: 16229   242.164045/s
     success_rate...................: 100.00% ✓ 16229      ✗ 0    
     vus............................: 54      min=0        max=500
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

     checks.........................: 100.00% ✓ 47793      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   285 kB/s
     http_req_blocked...............: avg=15.27µs  min=1.16µs  med=3.18µs   max=23.85ms  p(90)=4.77µs   p(95)=6.13µs   p(99.9)=2.14ms  
     http_req_connecting............: avg=10.54µs  min=0s      med=0s       max=23.75ms  p(90)=0s       p(95)=0s       p(99.9)=2.1ms   
     http_req_duration..............: avg=368.65ms min=7.31ms  med=401.54ms max=1.21s    p(90)=653.53ms p(95)=705.8ms  p(99.9)=999.51ms
       { expected_response:true }...: avg=368.65ms min=7.31ms  med=401.54ms max=1.21s    p(90)=653.53ms p(95)=705.8ms  p(99.9)=999.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16931
     http_req_receiving.............: avg=92.74µs  min=31.92µs med=81.82µs  max=52.72ms  p(90)=120.45µs p(95)=135.42µs p(99.9)=930.24µs
     http_req_sending...............: avg=40.6µs   min=5.26µs  med=16.02µs  max=102.98ms p(90)=21.45µs  p(95)=26.1µs   p(99.9)=3.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=368.52ms min=7.21ms  med=401.44ms max=1.21s    p(90)=653.43ms p(95)=705.69ms p(99.9)=999.37ms
     http_reqs......................: 16931   232.089853/s
     iteration_duration.............: avg=391.78ms min=8.02ms  med=418.54ms max=1.22s    p(90)=657.73ms p(95)=711.92ms p(99.9)=1s      
     iterations.....................: 15931   218.381871/s
     success_rate...................: 100.00% ✓ 15931      ✗ 0    
     vus............................: 50      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 451854      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=24.73µs  min=902ns   med=2.77µs   max=66.45ms  p(90)=4.66µs   p(95)=5.82µs   p(99.9)=2.69ms  
     http_req_connecting............: avg=20.53µs  min=0s      med=0s       max=64.21ms  p(90)=0s       p(95)=0s       p(99.9)=2.61ms  
     http_req_duration..............: avg=93.77ms  min=1.43ms  med=88.37ms  max=339.15ms p(90)=179.98ms p(95)=196.51ms p(99.9)=256.07ms
       { expected_response:true }...: avg=93.77ms  min=1.43ms  med=88.37ms  max=339.15ms p(90)=179.98ms p(95)=196.51ms p(99.9)=256.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151618
     http_req_receiving.............: avg=776.46µs min=52.93µs med=117.42µs max=130.57ms p(90)=1.6ms    p(95)=2.64ms   p(99.9)=30.51ms 
     http_req_sending...............: avg=75.61µs  min=4.7µs   med=10.54µs  max=116.27ms p(90)=22.57µs  p(95)=128.75µs p(99.9)=11.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.92ms  min=1.35ms  med=87.49ms  max=337.13ms p(90)=179.02ms p(95)=195.67ms p(99.9)=254.46ms
     http_reqs......................: 151618  2452.808265/s
     iteration_duration.............: avg=94.66ms  min=3.75ms  med=89.36ms  max=349.58ms p(90)=180.47ms p(95)=197.02ms p(99.9)=257.24ms
     iterations.....................: 150618  2436.630712/s
     success_rate...................: 100.00% ✓ 150618      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 439779      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=17.64µs  min=871ns   med=2.49µs  max=53.21ms  p(90)=4.47µs   p(95)=5.78µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=14.3µs   min=0s      med=0s      max=53.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=96.34ms  min=1.5ms   med=90.59ms max=281.57ms p(90)=186.09ms p(95)=203.23ms p(99.9)=254.54ms
       { expected_response:true }...: avg=96.34ms  min=1.5ms   med=90.59ms max=281.57ms p(90)=186.09ms p(95)=203.23ms p(99.9)=254.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147593
     http_req_receiving.............: avg=143.36µs min=25.43µs med=56.46µs max=38.91ms  p(90)=140.07µs p(95)=349.31µs p(99.9)=16.41ms 
     http_req_sending...............: avg=65.85µs  min=4.64µs  med=10.87µs max=78.55ms  p(90)=22.22µs  p(95)=124.22µs p(99.9)=9.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.13ms  min=1.45ms  med=90.36ms max=280.19ms p(90)=185.8ms  p(95)=202.83ms p(99.9)=253.5ms 
     http_reqs......................: 147593  2386.790208/s
     iteration_duration.............: avg=97.28ms  min=4.76ms  med=91.6ms  max=402.51ms p(90)=186.61ms p(95)=203.76ms p(99.9)=256.25ms
     iterations.....................: 146593  2370.618775/s
     success_rate...................: 100.00% ✓ 146593      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428340      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=20.92µs min=1µs     med=2.87µs   max=89.33ms  p(90)=4.61µs   p(95)=5.81µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=17.17µs min=0s      med=0s       max=89.24ms  p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=98.96ms min=1.49ms  med=85ms     max=1.89s    p(90)=187.72ms p(95)=219.78ms p(99.9)=815.95ms
       { expected_response:true }...: avg=98.96ms min=1.49ms  med=85ms     max=1.89s    p(90)=187.72ms p(95)=219.78ms p(99.9)=815.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143780
     http_req_receiving.............: avg=1.71ms  min=54.08µs med=112.23µs max=916.2ms  p(90)=1.87ms   p(95)=5.14ms   p(99.9)=102.16ms
     http_req_sending...............: avg=71.97µs min=4.61µs  med=10.58µs  max=175.09ms p(90)=20.43µs  p(95)=121.84µs p(99.9)=10.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.18ms min=1.37ms  med=83.8ms   max=1.89s    p(90)=185.32ms p(95)=216.43ms p(99.9)=808.13ms
     http_reqs......................: 143780  2323.606748/s
     iteration_duration.............: avg=99.93ms min=2.68ms  med=86.09ms  max=1.89s    p(90)=188.42ms p(95)=220.62ms p(99.9)=818.02ms
     iterations.....................: 142780  2307.4459/s
     success_rate...................: 100.00% ✓ 142780      ✗ 0     
     vus............................: 17      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 418635      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=19.66µs  min=1.09µs  med=2.85µs   max=64.62ms p(90)=4.56µs   p(95)=5.74µs   p(99.9)=2.48ms  
     http_req_connecting............: avg=15.64µs  min=0s      med=0s       max=64.55ms p(90)=0s       p(95)=0s       p(99.9)=2.37ms  
     http_req_duration..............: avg=101.28ms min=1.54ms  med=89.07ms  max=1.44s   p(90)=193.48ms p(95)=220.7ms  p(99.9)=705.19ms
       { expected_response:true }...: avg=101.28ms min=1.54ms  med=89.07ms  max=1.44s   p(90)=193.48ms p(95)=220.7ms  p(99.9)=705.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140545
     http_req_receiving.............: avg=1.52ms   min=54.07µs med=111.78µs max=1.14s   p(90)=1.81ms   p(95)=4.7ms    p(99.9)=96.04ms 
     http_req_sending...............: avg=66.45µs  min=4.79µs  med=10.61µs  max=62.24ms p(90)=20.09µs  p(95)=117.96µs p(99.9)=9.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.68ms  min=1.41ms  med=87.92ms  max=1.44s   p(90)=191.25ms p(95)=217.2ms  p(99.9)=700.99ms
     http_reqs......................: 140545  2269.528105/s
     iteration_duration.............: avg=102.28ms min=3.38ms  med=90.17ms  max=1.44s   p(90)=194.02ms p(95)=221.45ms p(99.9)=706.35ms
     iterations.....................: 139545  2253.380052/s
     success_rate...................: 100.00% ✓ 139545      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 390696      ✗ 0     
     data_received..................: 12 GB   185 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=12.6µs   min=921ns   med=2.41µs   max=55.28ms  p(90)=4.35µs   p(95)=5.49µs   p(99.9)=728.85µs
     http_req_connecting............: avg=9.36µs   min=0s      med=0s       max=55.11ms  p(90)=0s       p(95)=0s       p(99.9)=686.01µs
     http_req_duration..............: avg=108.5ms  min=1.85ms  med=94.09ms  max=1.76s    p(90)=206.69ms p(95)=239.28ms p(99.9)=741.4ms 
       { expected_response:true }...: avg=108.5ms  min=1.85ms  med=94.09ms  max=1.76s    p(90)=206.69ms p(95)=239.28ms p(99.9)=741.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 131232
     http_req_receiving.............: avg=1.59ms   min=52.91µs med=113.54µs max=1.01s    p(90)=1.87ms   p(95)=4.6ms    p(99.9)=97.79ms 
     http_req_sending...............: avg=60.48µs  min=4.84µs  med=10µs     max=164.14ms p(90)=20.47µs  p(95)=98.4µs   p(99.9)=8.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.84ms min=1.77ms  med=92.83ms  max=1.76s    p(90)=204.78ms p(95)=235.11ms p(99.9)=709.22ms
     http_reqs......................: 131232  2105.373544/s
     iteration_duration.............: avg=109.58ms min=3.02ms  med=95.45ms  max=1.76s    p(90)=207.34ms p(95)=240.22ms p(99.9)=742.86ms
     iterations.....................: 130232  2089.330403/s
     success_rate...................: 100.00% ✓ 130232      ✗ 0     
     vus............................: 72      min=0         max=494 
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

     checks.........................: 100.00% ✓ 213744      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.21µs   min=982ns   med=2.53µs   max=9.07ms   p(90)=4.38µs   p(95)=5.35µs   p(99.9)=330.26µs
     http_req_connecting............: avg=1.99µs   min=0s      med=0s       max=8.86ms   p(90)=0s       p(95)=0s       p(99.9)=252.2µs 
     http_req_duration..............: avg=197.53ms min=2.02ms  med=200.03ms max=530.85ms p(90)=365.17ms p(95)=391.49ms p(99.9)=465.57ms
       { expected_response:true }...: avg=197.53ms min=2.02ms  med=200.03ms max=530.85ms p(90)=365.17ms p(95)=391.49ms p(99.9)=465.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72248
     http_req_receiving.............: avg=79.29µs  min=29.12µs med=64.69µs  max=90.36ms  p(90)=106.57µs p(95)=121.81µs p(99.9)=1.16ms  
     http_req_sending...............: avg=29.23µs  min=4.85µs  med=11.48µs  max=79.35ms  p(90)=19.29µs  p(95)=23.18µs  p(99.9)=3.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.42ms min=1.96ms  med=199.91ms max=530.76ms p(90)=365.06ms p(95)=391.38ms p(99.9)=465.29ms
     http_reqs......................: 72248   1153.990182/s
     iteration_duration.............: avg=200.54ms min=5.19ms  med=203.52ms max=531.08ms p(90)=366.01ms p(95)=392.29ms p(99.9)=465.85ms
     iterations.....................: 71248   1138.017557/s
     success_rate...................: 100.00% ✓ 71248       ✗ 0    
     vus............................: 86      min=0         max=496
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

     checks.........................: 100.00% ✓ 101655     ✗ 0    
     data_received..................: 3.1 GB  47 MB/s
     data_sent......................: 42 MB   648 kB/s
     http_req_blocked...............: avg=8.5µs    min=1.08µs  med=2.81µs   max=8.58ms   p(90)=4.57µs   p(95)=5.61µs   p(99.9)=1.4ms 
     http_req_connecting............: avg=4.74µs   min=0s      med=0s       max=8.51ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms
     http_req_duration..............: avg=411.19ms min=3.73ms  med=383.57ms max=2.07s    p(90)=804.43ms p(95)=867.55ms p(99.9)=1.33s 
       { expected_response:true }...: avg=411.19ms min=3.73ms  med=383.57ms max=2.07s    p(90)=804.43ms p(95)=867.55ms p(99.9)=1.33s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34885
     http_req_receiving.............: avg=88.68µs  min=29.34µs med=72.63µs  max=103.48ms p(90)=112.4µs  p(95)=126.79µs p(99.9)=1.2ms 
     http_req_sending...............: avg=28µs     min=5.53µs  med=13.96µs  max=90.9ms   p(90)=21.44µs  p(95)=24.34µs  p(99.9)=2.12ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=411.08ms min=3.66ms  med=383.34ms max=2.07s    p(90)=804.36ms p(95)=867.46ms p(99.9)=1.33s 
     http_reqs......................: 34885   539.460805/s
     iteration_duration.............: avg=423.54ms min=25.88ms med=400.32ms max=2.08s    p(90)=807.68ms p(95)=870.81ms p(99.9)=1.34s 
     iterations.....................: 33885   523.996829/s
     success_rate...................: 100.00% ✓ 33885      ✗ 0    
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

     checks.........................: 100.00% ✓ 46224      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   291 kB/s
     http_req_blocked...............: avg=14.53µs  min=1.35µs  med=3.75µs   max=3.74ms   p(90)=5.69µs   p(95)=7.66µs   p(99.9)=2.03ms
     http_req_connecting............: avg=8.93µs   min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=2.01ms
     http_req_duration..............: avg=886.93ms min=5.81ms  med=822.79ms max=4.77s    p(90)=1.75s    p(95)=2.04s    p(99.9)=3.94s 
       { expected_response:true }...: avg=886.93ms min=5.81ms  med=822.79ms max=4.77s    p(90)=1.75s    p(95)=2.04s    p(99.9)=3.94s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16408
     http_req_receiving.............: avg=113.11µs min=38.47µs med=94.66µs  max=179.84ms p(90)=134.31µs p(95)=150.12µs p(99.9)=1.25ms
     http_req_sending...............: avg=39.53µs  min=6.17µs  med=18.47µs  max=140.95ms p(90)=24.31µs  p(95)=29.14µs  p(99.9)=2.16ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=886.78ms min=5.73ms  med=822.67ms max=4.77s    p(90)=1.75s    p(95)=2.04s    p(99.9)=3.94s 
     http_reqs......................: 16408   242.357117/s
     iteration_duration.............: avg=944.61ms min=7.23ms  med=894.69ms max=4.78s    p(90)=1.79s    p(95)=2.05s    p(99.9)=3.98s 
     iterations.....................: 15408   227.586449/s
     success_rate...................: 100.00% ✓ 15408      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 45747      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=14.05µs  min=1.16µs  med=3.6µs    max=3.37ms  p(90)=5.43µs   p(95)=7.03µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=8.69µs   min=0s      med=0s       max=3.33ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=893.83ms min=7.71ms  med=817.48ms max=3.13s   p(90)=1.82s    p(95)=1.94s    p(99.9)=2.77s   
       { expected_response:true }...: avg=893.83ms min=7.71ms  med=817.48ms max=3.13s   p(90)=1.82s    p(95)=1.94s    p(99.9)=2.77s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16249
     http_req_receiving.............: avg=104.56µs min=32.27µs med=92.25µs  max=99.53ms p(90)=132.88µs p(95)=149.94µs p(99.9)=841.36µs
     http_req_sending...............: avg=44.9µs   min=5.33µs  med=18.21µs  max=96.19ms p(90)=24.03µs  p(95)=28.89µs  p(99.9)=4.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=893.68ms min=7.61ms  med=817.4ms  max=3.13s   p(90)=1.82s    p(95)=1.94s    p(99.9)=2.77s   
     http_reqs......................: 16249   236.42331/s
     iteration_duration.............: avg=952.44ms min=50.08ms med=898.18ms max=3.13s   p(90)=1.84s    p(95)=1.95s    p(99.9)=2.78s   
     iterations.....................: 15249   221.873288/s
     success_rate...................: 100.00% ✓ 15249      ✗ 0    
     vus............................: 90      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

