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
| hive-router | v0.0.49 | 2,689 | 2,791 | 2,634 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,014 | 2,073 | 2,002 | 1.1% |  |
| cosmo | 0.307.0 | 1,160 | 1,165 | 1,156 | 0.3% | non-compatible response (9 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 491 | 496 | 489 | 0.5% |  |
| hive-gateway | 2.5.25 | 234 | 237 | 218 | 2.3% |  |
| apollo-gateway | 2.13.3 | 199 | 202 | 199 | 0.5% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16699 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (473086 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,204 | 2,312 | 2,164 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,896 | 1,917 | 1,781 | 2.2% |  |
| cosmo | 0.307.0 | 1,153 | 1,168 | 1,136 | 1.4% | non-compatible response (16 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 465 | 473 | 463 | 0.8% |  |
| hive-gateway | 2.5.25 | 231 | 236 | 228 | 1.1% |  |
| apollo-gateway | 2.13.3 | 204 | 206 | 202 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (21424 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (268360 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 496365      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=26.75µs  min=962ns  med=2.23µs  max=68.46ms  p(90)=3.63µs   p(95)=4.73µs   p(99.9)=3.61ms  
     http_req_connecting............: avg=23.88µs  min=0s     med=0s      max=68.29ms  p(90)=0s       p(95)=0s       p(99.9)=3.55ms  
     http_req_duration..............: avg=85.33ms  min=1.53ms med=79.88ms max=291.55ms p(90)=165.39ms p(95)=182.14ms p(99.9)=245.13ms
       { expected_response:true }...: avg=85.33ms  min=1.53ms med=79.88ms max=291.55ms p(90)=165.39ms p(95)=182.14ms p(99.9)=245.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166455
     http_req_receiving.............: avg=360.54µs min=29µs   med=56.44µs max=131.16ms p(90)=238.6µs  p(95)=410.75µs p(99.9)=36.36ms 
     http_req_sending...............: avg=84.1µs   min=5.31µs med=9.95µs  max=164.46ms p(90)=18.46µs  p(95)=130.49µs p(99.9)=12.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.89ms  min=1.48ms med=79.61ms max=291.47ms p(90)=164.64ms p(95)=180.63ms p(99.9)=238.98ms
     http_reqs......................: 166455  2689.877812/s
     iteration_duration.............: avg=86.16ms  min=2.35ms med=80.73ms max=362.61ms p(90)=165.95ms p(95)=182.87ms p(99.9)=247.47ms
     iterations.....................: 165455  2673.718022/s
     success_rate...................: 100.00% ✓ 165455      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 376566      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 152 MB  2.4 MB/s
     http_req_blocked...............: avg=13.82µs  min=1.01µs  med=2.19µs   max=100.22ms p(90)=3.43µs   p(95)=4.36µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=11.05µs  min=0s      med=0s       max=100.02ms p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=112.49ms min=2.39ms  med=104.34ms max=989.37ms p(90)=218.63ms p(95)=253.38ms p(99.9)=469.64ms
       { expected_response:true }...: avg=112.49ms min=2.39ms  med=104.34ms max=989.37ms p(90)=218.63ms p(95)=253.38ms p(99.9)=469.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126522
     http_req_receiving.............: avg=1.53ms   min=52.95µs med=113.79µs max=380.26ms p(90)=1.23ms   p(95)=3.61ms   p(99.9)=148.47ms
     http_req_sending...............: avg=56.04µs  min=5.44µs  med=9.63µs   max=181.86ms p(90)=16.81µs  p(95)=115.34µs p(99.9)=7.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.9ms  min=2.3ms   med=103.3ms  max=823.53ms p(90)=216.24ms p(95)=247.87ms p(99.9)=440.81ms
     http_reqs......................: 126522  2014.261554/s
     iteration_duration.............: avg=113.66ms min=3.89ms  med=105.63ms max=998.99ms p(90)=219.27ms p(95)=254.37ms p(99.9)=471.52ms
     iterations.....................: 125522  1998.341306/s
     success_rate...................: 100.00% ✓ 125522      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214650      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.95µs   min=1.04µs  med=2.15µs   max=22.62ms  p(90)=3.46µs   p(95)=4.25µs   p(99.9)=468.06µs
     http_req_connecting............: avg=3.15µs   min=0s      med=0s       max=22.57ms  p(90)=0s       p(95)=0s       p(99.9)=408.7µs 
     http_req_duration..............: avg=196.71ms min=2.06ms  med=197.44ms max=633.2ms  p(90)=364.01ms p(95)=392.05ms p(99.9)=525.44ms
       { expected_response:true }...: avg=196.71ms min=2.06ms  med=197.44ms max=633.2ms  p(90)=364.01ms p(95)=392.05ms p(99.9)=525.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72550
     http_req_receiving.............: avg=77.45µs  min=29.76µs med=59.55µs  max=105.86ms p(90)=91.07µs  p(95)=104.99µs p(99.9)=1.43ms  
     http_req_sending...............: avg=26.29µs  min=5.19µs  med=9.95µs   max=27.04ms  p(90)=15.17µs  p(95)=18.88µs  p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.61ms min=1.99ms  med=197.31ms max=633.12ms p(90)=363.92ms p(95)=391.97ms p(99.9)=525.38ms
     http_reqs......................: 72550   1160.784335/s
     iteration_duration.............: avg=199.69ms min=5.17ms  med=200.98ms max=633.36ms p(90)=365ms    p(95)=392.76ms p(99.9)=525.86ms
     iterations.....................: 71550   1144.78455/s
     success_rate...................: 100.00% ✓ 71550       ✗ 0    
     vus............................: 81      min=0         max=494
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92817      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   590 kB/s
     http_req_blocked...............: avg=7.88µs   min=1.11µs  med=2.92µs   max=5.81ms   p(90)=4.71µs   p(95)=5.73µs   p(99.9)=845.84µs
     http_req_connecting............: avg=3.87µs   min=0s      med=0s       max=5.76ms   p(90)=0s       p(95)=0s       p(99.9)=755.16µs
     http_req_duration..............: avg=449.68ms min=4.1ms   med=419.13ms max=1.64s    p(90)=889.44ms p(95)=964.03ms p(99.9)=1.4s    
       { expected_response:true }...: avg=449.68ms min=4.1ms   med=419.13ms max=1.64s    p(90)=889.44ms p(95)=964.03ms p(99.9)=1.4s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 31939
     http_req_receiving.............: avg=98.47µs  min=31.67µs med=76.05µs  max=164.07ms p(90)=111.73µs p(95)=124.71µs p(99.9)=875.39µs
     http_req_sending...............: avg=28.31µs  min=5.77µs  med=13.08µs  max=111.15ms p(90)=20.41µs  p(95)=23.8µs   p(99.9)=2.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=449.55ms min=4.04ms  med=419.06ms max=1.64s    p(90)=889.34ms p(95)=963.9ms  p(99.9)=1.4s    
     http_reqs......................: 31939   491.555645/s
     iteration_duration.............: avg=464.43ms min=23.21ms med=435.66ms max=1.65s    p(90)=893.47ms p(95)=968.89ms p(99.9)=1.41s   
     iterations.....................: 30939   476.165193/s
     success_rate...................: 100.00% ✓ 30939      ✗ 0    
     vus............................: 53      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 44904      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   282 kB/s
     http_req_blocked...............: avg=15.63µs  min=1.19µs  med=3.73µs   max=25.85ms p(90)=5.68µs   p(95)=7.33µs   p(99.9)=2.21ms 
     http_req_connecting............: avg=10.09µs  min=0s      med=0s       max=25.79ms p(90)=0s       p(95)=0s       p(99.9)=2.03ms 
     http_req_duration..............: avg=894.06ms min=6.22ms  med=764.19ms max=20.81s  p(90)=1.52s    p(95)=1.7s     p(99.9)=18.23s 
       { expected_response:true }...: avg=894.06ms min=6.22ms  med=764.19ms max=20.81s  p(90)=1.52s    p(95)=1.7s     p(99.9)=18.23s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15968
     http_req_receiving.............: avg=111.67µs min=35.81µs med=98.64µs  max=80.52ms p(90)=137.82µs p(95)=150.35µs p(99.9)=643.8µs
     http_req_sending...............: avg=30.69µs  min=6.01µs  med=18.19µs  max=22.9ms  p(90)=24.53µs  p(95)=29.23µs  p(99.9)=2.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=893.92ms min=6.09ms  med=764.06ms max=20.81s  p(90)=1.52s    p(95)=1.7s     p(99.9)=18.23s 
     http_reqs......................: 15968   234.286487/s
     iteration_duration.............: avg=953.77ms min=24.48ms med=837.47ms max=20.81s  p(90)=1.53s    p(95)=1.72s    p(99.9)=18.24s 
     iterations.....................: 14968   219.614237/s
     success_rate...................: 100.00% ✓ 14968      ✗ 0    
     vus............................: 63      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41436      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   245 kB/s
     http_req_blocked...............: avg=15.87µs  min=1.3µs   med=3.39µs   max=4.41ms  p(90)=5µs      p(95)=6.44µs   p(99.9)=2.71ms
     http_req_connecting............: avg=10.83µs  min=0s      med=0s       max=4.37ms  p(90)=0s       p(95)=0s       p(99.9)=2.69ms
     http_req_duration..............: avg=483.42ms min=8.46ms  med=560.24ms max=1.37s   p(90)=840.17ms p(95)=892.91ms p(99.9)=1.25s 
       { expected_response:true }...: avg=483.42ms min=8.46ms  med=560.24ms max=1.37s   p(90)=840.17ms p(95)=892.91ms p(99.9)=1.25s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14812
     http_req_receiving.............: avg=101.13µs min=33.9µs  med=88.81µs  max=29.01ms p(90)=128.57µs p(95)=141.5µs  p(99.9)=1.07ms
     http_req_sending...............: avg=26.55µs  min=6.19µs  med=16.02µs  max=9.46ms  p(90)=22.02µs  p(95)=26.8µs   p(99.9)=2.36ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=483.29ms min=8.32ms  med=560.15ms max=1.37s   p(90)=840.07ms p(95)=892.79ms p(99.9)=1.25s 
     http_reqs......................: 14812   199.469917/s
     iteration_duration.............: avg=518.25ms min=14.92ms med=588.69ms max=1.38s   p(90)=846.87ms p(95)=901.01ms p(99.9)=1.26s 
     iterations.....................: 13812   186.003139/s
     success_rate...................: 100.00% ✓ 13812      ✗ 0    
     vus............................: 61      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 408021      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.6 MB/s
     http_req_blocked...............: avg=17.06µs  min=1.04µs  med=2.45µs  max=53.98ms  p(90)=4.08µs   p(95)=5.32µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=13.93µs  min=0s      med=0s      max=53.8ms   p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=103.82ms min=1.67ms  med=98.68ms max=379.14ms p(90)=200.94ms p(95)=215.79ms p(99.9)=259.48ms
       { expected_response:true }...: avg=103.82ms min=1.67ms  med=98.68ms max=379.14ms p(90)=200.94ms p(95)=215.79ms p(99.9)=259.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137007
     http_req_receiving.............: avg=208.65µs min=27.79µs med=59.9µs  max=245.45ms p(90)=160.94µs p(95)=403.67µs p(99.9)=21.01ms 
     http_req_sending...............: avg=68.38µs  min=5.31µs  med=10.57µs max=217.55ms p(90)=19.99µs  p(95)=133.66µs p(99.9)=9.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.54ms min=1.61ms  med=98.45ms max=302.45ms p(90)=200.41ms p(95)=215.4ms  p(99.9)=257.85ms
     http_reqs......................: 137007  2204.179837/s
     iteration_duration.............: avg=104.85ms min=3.11ms  med=99.82ms max=406.18ms p(90)=201.44ms p(95)=216.3ms  p(99.9)=261.52ms
     iterations.....................: 136007  2188.091756/s
     success_rate...................: 100.00% ✓ 136007      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 351279      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=14.19µs  min=1.01µs  med=2.34µs   max=46.32ms  p(90)=3.9µs    p(95)=4.92µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=11.22µs  min=0s      med=0s       max=46.16ms  p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=120.58ms min=1.82ms  med=111.87ms max=1.07s    p(90)=231.45ms p(95)=266.57ms p(99.9)=432.93ms
       { expected_response:true }...: avg=120.58ms min=1.82ms  med=111.87ms max=1.07s    p(90)=231.45ms p(95)=266.57ms p(99.9)=432.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118093
     http_req_receiving.............: avg=1.77ms   min=52.35µs med=117.15µs max=715.53ms p(90)=1.65ms   p(95)=4.5ms    p(99.9)=133.07ms
     http_req_sending...............: avg=55.91µs  min=4.93µs  med=9.97µs   max=70.8ms   p(90)=18.27µs  p(95)=107.03µs p(99.9)=7.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.75ms min=1.72ms  med=110.72ms max=640.55ms p(90)=228.12ms p(95)=260.5ms  p(99.9)=416.14ms
     http_reqs......................: 118093  1896.546055/s
     iteration_duration.............: avg=121.88ms min=2.93ms  med=113.34ms max=1.07s    p(90)=232.25ms p(95)=267.35ms p(99.9)=434.82ms
     iterations.....................: 117093  1880.486288/s
     success_rate...................: 100.00% ✓ 117093      ✗ 0     
     vus............................: 72      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 213726      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.93µs   min=1.07µs med=2.74µs   max=9.3ms    p(90)=4.49µs   p(95)=5.45µs   p(99.9)=523.3µs 
     http_req_connecting............: avg=2.45µs   min=0s     med=0s       max=9.23ms   p(90)=0s       p(95)=0s       p(99.9)=462.86µs
     http_req_duration..............: avg=197.51ms min=2.11ms med=197.73ms max=571.77ms p(90)=366.79ms p(95)=393.87ms p(99.9)=497.44ms
       { expected_response:true }...: avg=197.51ms min=2.11ms med=197.73ms max=571.77ms p(90)=366.79ms p(95)=393.87ms p(99.9)=497.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72242
     http_req_receiving.............: avg=82.22µs  min=28.8µs med=66.56µs  max=39.95ms  p(90)=105.48µs p(95)=121.2µs  p(99.9)=1.66ms  
     http_req_sending...............: avg=35.01µs  min=5.48µs med=11.6µs   max=180.12ms p(90)=18.8µs   p(95)=22.56µs  p(99.9)=3.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.39ms min=2.04ms med=197.58ms max=571.7ms  p(90)=366.69ms p(95)=393.78ms p(99.9)=497.38ms
     http_reqs......................: 72242   1153.774267/s
     iteration_duration.............: avg=200.53ms min=4.7ms  med=200.97ms max=571.95ms p(90)=367.6ms  p(95)=394.66ms p(99.9)=498.89ms
     iterations.....................: 71242   1137.803305/s
     success_rate...................: 100.00% ✓ 71242       ✗ 0    
     vus............................: 86      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88218      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   559 kB/s
     http_req_blocked...............: avg=8.44µs   min=1.16µs  med=3.15µs   max=6.27ms   p(90)=4.91µs   p(95)=5.89µs   p(99.9)=853.33µs
     http_req_connecting............: avg=4.21µs   min=0s      med=0s       max=6.21ms   p(90)=0s       p(95)=0s       p(99.9)=739.01µs
     http_req_duration..............: avg=472.57ms min=4.15ms  med=439.2ms  max=1.89s    p(90)=926.97ms p(95)=1.01s    p(99.9)=1.48s   
       { expected_response:true }...: avg=472.57ms min=4.15ms  med=439.2ms  max=1.89s    p(90)=926.97ms p(95)=1.01s    p(99.9)=1.48s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30406
     http_req_receiving.............: avg=100.54µs min=32µs    med=81.17µs  max=91.99ms  p(90)=116.81µs p(95)=130.59µs p(99.9)=789.98µs
     http_req_sending...............: avg=37.86µs  min=5.83µs  med=14.05µs  max=151.11ms p(90)=21.21µs  p(95)=24.17µs  p(99.9)=2.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=472.43ms min=4.09ms  med=439.1ms  max=1.89s    p(90)=926.86ms p(95)=1.01s    p(99.9)=1.48s   
     http_reqs......................: 30406   465.955099/s
     iteration_duration.............: avg=488.91ms min=26.16ms med=458.55ms max=1.89s    p(90)=931.6ms  p(95)=1.01s    p(99.9)=1.48s   
     iterations.....................: 29406   450.630653/s
     success_rate...................: 100.00% ✓ 29406      ✗ 0    
     vus............................: 70      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 44409      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   278 kB/s
     http_req_blocked...............: avg=16.46µs  min=1.24µs  med=3.85µs   max=33.94ms p(90)=5.87µs   p(95)=7.74µs   p(99.9)=2.05ms
     http_req_connecting............: avg=10.68µs  min=0s      med=0s       max=33.85ms p(90)=0s       p(95)=0s       p(99.9)=1.99ms
     http_req_duration..............: avg=922.99ms min=6.35ms  med=833.3ms  max=5.73s   p(90)=1.87s    p(95)=2.06s    p(99.9)=4.76s 
       { expected_response:true }...: avg=922.99ms min=6.35ms  med=833.3ms  max=5.73s   p(90)=1.87s    p(95)=2.06s    p(99.9)=4.76s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15803
     http_req_receiving.............: avg=113.17µs min=36.87µs med=102.42µs max=28.45ms p(90)=141.22µs p(95)=154.27µs p(99.9)=1.1ms 
     http_req_sending...............: avg=35.88µs  min=6.47µs  med=18.85µs  max=25.47ms p(90)=25.14µs  p(95)=30.19µs  p(99.9)=4.56ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=922.84ms min=6.24ms  med=833.16ms max=5.73s   p(90)=1.87s    p(95)=2.06s    p(99.9)=4.76s 
     http_reqs......................: 15803   231.493247/s
     iteration_duration.............: avg=985.34ms min=26.98ms med=912.72ms max=5.74s   p(90)=1.88s    p(95)=2.08s    p(99.9)=4.77s 
     iterations.....................: 14803   216.844557/s
     success_rate...................: 100.00% ✓ 14803      ✗ 0    
     vus............................: 66      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 39783      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   245 kB/s
     http_req_blocked...............: avg=17.06µs  min=1.33µs  med=3.71µs   max=24.43ms p(90)=5.5µs    p(95)=7.23µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=11.51µs  min=0s      med=0s       max=24.36ms p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=1.02s    min=8.6ms   med=943.61ms max=4.44s   p(90)=2.09s    p(95)=2.23s    p(99.9)=3.88s   
       { expected_response:true }...: avg=1.02s    min=8.6ms   med=943.61ms max=4.44s   p(90)=2.09s    p(95)=2.23s    p(99.9)=3.88s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14261
     http_req_receiving.............: avg=117.45µs min=34.55µs med=99.49µs  max=94.13ms p(90)=140.17µs p(95)=153.44µs p(99.9)=878.01µs
     http_req_sending...............: avg=36.84µs  min=6.37µs  med=18.37µs  max=56.08ms p(90)=24.58µs  p(95)=30.04µs  p(99.9)=2.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.02s    min=8.5ms   med=943.5ms  max=4.44s   p(90)=2.09s    p(95)=2.23s    p(99.9)=3.88s   
     http_reqs......................: 14261   204.233054/s
     iteration_duration.............: avg=1.1s     min=33.05ms med=1.02s    max=4.45s   p(90)=2.1s     p(95)=2.25s    p(99.9)=3.99s   
     iterations.....................: 13261   189.911965/s
     success_rate...................: 100.00% ✓ 13261      ✗ 0    
     vus............................: 99      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

