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
| hive-router | v0.0.65 | 2,844 | 2,940 | 2,805 | 1.6% |  |
| fusion | 16.1.4 | 2,073 | 2,119 | 2,059 | 1.0% |  |
| fusion-nightly | 16.2.0-p.1 | 1,991 | 2,039 | 1,959 | 1.3% |  |
| cosmo | 0.321.1 | 1,134 | 1,134 | 1,134 | 0.0% | non-compatible response (22 across 8/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 524 | 529 | 518 | 0.8% |  |
| hive-gateway | 2.8.2 | 216 | 219 | 213 | 0.9% |  |
| apollo-gateway | 2.14.1 | 204 | 207 | 203 | 0.6% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (7908 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (501806 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,319 | 2,413 | 2,285 | 1.9% |  |
| fusion | 16.1.4 | 1,912 | 1,938 | 1,827 | 1.8% |  |
| fusion-nightly | 16.2.0-p.1 | 1,836 | 1,885 | 1,785 | 1.6% |  |
| cosmo | 0.321.1 | 1,088 | 1,088 | 1,088 | 0.0% | non-compatible response (21 across 8/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 489 | 496 | 485 | 0.8% |  |
| hive-gateway | 2.8.2 | 221 | 224 | 219 | 0.7% |  |
| apollo-gateway | 2.14.1 | 209 | 212 | 209 | 0.5% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (13672 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (304927 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 524181      ✗ 0     
     data_received..................: 15 GB   250 MB/s
     data_sent......................: 211 MB  3.4 MB/s
     http_req_blocked...............: avg=31.76µs  min=1.02µs  med=2.26µs  max=81.62ms  p(90)=3.75µs   p(95)=4.88µs   p(99.9)=6.54ms  
     http_req_connecting............: avg=28.4µs   min=0s      med=0s      max=81.55ms  p(90)=0s       p(95)=0s       p(99.9)=6.07ms  
     http_req_duration..............: avg=80.79ms  min=1.56ms  med=73.33ms max=307.49ms p(90)=157.63ms p(95)=175.74ms p(99.9)=244.14ms
       { expected_response:true }...: avg=80.79ms  min=1.56ms  med=73.33ms max=307.49ms p(90)=157.63ms p(95)=175.74ms p(99.9)=244.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175727
     http_req_receiving.............: avg=420.83µs min=29.01µs med=55.02µs max=84.23ms  p(90)=270.58µs p(95)=426.86µs p(99.9)=43.97ms 
     http_req_sending...............: avg=92.42µs  min=5.39µs  med=9.82µs  max=114.74ms p(90)=18.83µs  p(95)=133.53µs p(99.9)=14.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.28ms  min=1.5ms   med=73.05ms max=307.44ms p(90)=156.8ms  p(95)=174.03ms p(99.9)=241.61ms
     http_reqs......................: 175727  2844.262103/s
     iteration_duration.............: avg=81.58ms  min=2.46ms  med=74.2ms  max=388.06ms p(90)=158.23ms p(95)=176.55ms p(99.9)=246.26ms
     iterations.....................: 174727  2828.076417/s
     success_rate...................: 100.00% ✓ 174727      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 387468      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=18.7µs   min=1.01µs  med=2.18µs   max=70.47ms  p(90)=3.43µs   p(95)=4.37µs   p(99.9)=2.07ms  
     http_req_connecting............: avg=15.84µs  min=0s      med=0s       max=70.33ms  p(90)=0s       p(95)=0s       p(99.9)=1.92ms  
     http_req_duration..............: avg=109.35ms min=2.39ms  med=100.31ms max=822.65ms p(90)=215.11ms p(95)=254.26ms p(99.9)=536.73ms
       { expected_response:true }...: avg=109.35ms min=2.39ms  med=100.31ms max=822.65ms p(90)=215.11ms p(95)=254.26ms p(99.9)=536.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130156
     http_req_receiving.............: avg=2ms      min=51.12µs med=110.77µs max=441.48ms p(90)=1.38ms   p(95)=4.97ms   p(99.9)=159.28ms
     http_req_sending...............: avg=68.76µs  min=5.29µs  med=9.51µs   max=159.53ms p(90)=17.22µs  p(95)=119.33µs p(99.9)=9.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.29ms min=2.31ms  med=99.07ms  max=822.55ms p(90)=212ms    p(95)=246.4ms  p(99.9)=455.87ms
     http_reqs......................: 130156  2073.214792/s
     iteration_duration.............: avg=110.48ms min=3.53ms  med=101.58ms max=822.88ms p(90)=215.86ms p(95)=254.98ms p(99.9)=538.07ms
     iterations.....................: 129156  2057.2861/s
     success_rate...................: 100.00% ✓ 129156      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.2.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 371478      ✗ 0     
     data_received..................: 11 GB   175 MB/s
     data_sent......................: 150 MB  2.4 MB/s
     http_req_blocked...............: avg=13.53µs  min=1.01µs  med=2.22µs   max=64.95ms  p(90)=3.43µs   p(95)=4.28µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=10.74µs  min=0s      med=0s       max=64.9ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=114.04ms min=2.37ms  med=102.79ms max=749.52ms p(90)=223.32ms p(95)=261.92ms p(99.9)=474.89ms
       { expected_response:true }...: avg=114.04ms min=2.37ms  med=102.79ms max=749.52ms p(90)=223.32ms p(95)=261.92ms p(99.9)=474.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 124826
     http_req_receiving.............: avg=2.23ms   min=53.37µs med=115.92µs max=522.32ms p(90)=1.52ms   p(95)=5.3ms    p(99.9)=161.23ms
     http_req_sending...............: avg=61.2µs   min=5.37µs  med=9.53µs   max=224.25ms p(90)=16.68µs  p(95)=117.29µs p(99.9)=7.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.74ms min=2.28ms  med=101.67ms max=747.68ms p(90)=218.94ms p(95)=253.51ms p(99.9)=430.44ms
     http_reqs......................: 124826  1991.940281/s
     iteration_duration.............: avg=115.22ms min=3.75ms  med=104.06ms max=749.72ms p(90)=224.18ms p(95)=262.85ms p(99.9)=475.33ms
     iterations.....................: 123826  1975.982546/s
     success_rate...................: 100.00% ✓ 123826      ✗ 0     
     vus............................: 89      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 209547      ✗ 0    
     data_received..................: 6.2 GB  100 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=6.73µs   min=1.06µs  med=2.13µs   max=22ms     p(90)=3.38µs   p(95)=4.09µs   p(99.9)=581.5µs 
     http_req_connecting............: avg=3.84µs   min=0s      med=0s       max=21.93ms  p(90)=0s       p(95)=0s       p(99.9)=422.62µs
     http_req_duration..............: avg=201.45ms min=2.03ms  med=202.46ms max=606.75ms p(90)=372.63ms p(95)=401.05ms p(99.9)=521.38ms
       { expected_response:true }...: avg=201.45ms min=2.03ms  med=202.46ms max=606.75ms p(90)=372.63ms p(95)=401.05ms p(99.9)=521.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70849
     http_req_receiving.............: avg=73.04µs  min=29.95µs med=58.18µs  max=131.6ms  p(90)=87.58µs  p(95)=100.21µs p(99.9)=1.25ms  
     http_req_sending...............: avg=28.02µs  min=5.46µs  med=9.97µs   max=138.85ms p(90)=14.39µs  p(95)=17.78µs  p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.35ms min=1.97ms  med=202.37ms max=606.69ms p(90)=372.54ms p(95)=400.93ms p(99.9)=521.3ms 
     http_reqs......................: 70849   1134.415992/s
     iteration_duration.............: avg=204.56ms min=6.17ms  med=205.64ms max=606.89ms p(90)=373.53ms p(95)=401.98ms p(99.9)=521.91ms
     iterations.....................: 69849   1118.404249/s
     success_rate...................: 100.00% ✓ 69849       ✗ 0    
     vus............................: 79      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98679      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   629 kB/s
     http_req_blocked...............: avg=11.9µs   min=1.15µs  med=3.05µs   max=22.08ms  p(90)=4.89µs   p(95)=5.95µs   p(99.9)=2.37ms  
     http_req_connecting............: avg=7.69µs   min=0s      med=0s       max=21.93ms  p(90)=0s       p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=423.63ms min=3.87ms  med=390.4ms  max=1.67s    p(90)=833.35ms p(95)=903.54ms p(99.9)=1.36s   
       { expected_response:true }...: avg=423.63ms min=3.87ms  med=390.4ms  max=1.67s    p(90)=833.35ms p(95)=903.54ms p(99.9)=1.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33893
     http_req_receiving.............: avg=89.19µs  min=32.68µs med=78.47µs  max=94.49ms  p(90)=114.28µs p(95)=127.31µs p(99.9)=959.01µs
     http_req_sending...............: avg=29.96µs  min=5.65µs  med=13.99µs  max=189.34ms p(90)=21.69µs  p(95)=24.97µs  p(99.9)=2.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=423.51ms min=3.81ms  med=390.27ms max=1.67s    p(90)=833.18ms p(95)=903.46ms p(99.9)=1.36s   
     http_reqs......................: 33893   524.047321/s
     iteration_duration.............: avg=436.74ms min=23.48ms med=406.14ms max=1.68s    p(90)=836.82ms p(95)=906.86ms p(99.9)=1.37s   
     iterations.....................: 32893   508.585506/s
     success_rate...................: 100.00% ✓ 32893      ✗ 0    
     vus............................: 88      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41181      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   261 kB/s
     http_req_blocked...............: avg=15.53µs  min=1.12µs  med=3.74µs   max=35.73ms  p(90)=5.65µs   p(95)=7.27µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=9.89µs   min=0s      med=0s       max=35.66ms  p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=958.49ms min=6.18ms  med=813.07ms max=19.99s   p(90)=1.7s     p(95)=1.84s    p(99.9)=18.88s  
       { expected_response:true }...: avg=958.49ms min=6.18ms  med=813.07ms max=19.99s   p(90)=1.7s     p(95)=1.84s    p(99.9)=18.88s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14727
     http_req_receiving.............: avg=115.36µs min=32.88µs med=99.54µs  max=141.98ms p(90)=139.61µs p(95)=153.09µs p(99.9)=732.65µs
     http_req_sending...............: avg=32.82µs  min=5.79µs  med=18.49µs  max=51.28ms  p(90)=25.02µs  p(95)=30.02µs  p(99.9)=3.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=958.34ms min=6.04ms  med=812.97ms max=19.99s   p(90)=1.7s     p(95)=1.84s    p(99.9)=18.88s  
     http_reqs......................: 14727   216.156915/s
     iteration_duration.............: avg=1.02s    min=48.88ms med=900.22ms max=19.99s   p(90)=1.72s    p(95)=1.84s    p(99.9)=18.9s   
     iterations.....................: 13727   201.479322/s
     success_rate...................: 100.00% ✓ 13727      ✗ 0    
     vus............................: 60      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42636      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   252 kB/s
     http_req_blocked...............: avg=15.09µs  min=1.22µs  med=3.43µs   max=26.06ms p(90)=5.12µs   p(95)=6.59µs   p(99.9)=2.02ms
     http_req_connecting............: avg=10µs     min=0s      med=0s       max=26ms    p(90)=0s       p(95)=0s       p(99.9)=1.99ms
     http_req_duration..............: avg=440.36ms min=8.38ms  med=441.82ms max=1.29s   p(90)=777.94ms p(95)=819.09ms p(99.9)=1.15s 
       { expected_response:true }...: avg=440.36ms min=8.38ms  med=441.82ms max=1.29s   p(90)=777.94ms p(95)=819.09ms p(99.9)=1.15s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15212
     http_req_receiving.............: avg=99.51µs  min=33.11µs med=91.87µs  max=6.45ms  p(90)=131.48µs p(95)=144.69µs p(99.9)=1.04ms
     http_req_sending...............: avg=26.5µs   min=5.57µs  med=16.92µs  max=16.57ms p(90)=23.1µs   p(95)=27.53µs  p(99.9)=2.19ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=440.23ms min=8.25ms  med=441.71ms max=1.29s   p(90)=777.76ms p(95)=818.93ms p(99.9)=1.15s 
     http_reqs......................: 15212   204.929597/s
     iteration_duration.............: avg=471.17ms min=13.69ms med=467.72ms max=1.3s    p(90)=782.1ms  p(95)=823.46ms p(99.9)=1.16s 
     iterations.....................: 14212   191.458022/s
     success_rate...................: 100.00% ✓ 14212      ✗ 0    
     vus............................: 58      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428967      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=20.79µs min=1.06µs  med=2.47µs  max=53.27ms  p(90)=4.19µs   p(95)=5.48µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=17.36µs min=0s      med=0s      max=53.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=98.74ms min=1.64ms  med=92.93ms max=363.02ms p(90)=189.67ms p(95)=206.35ms p(99.9)=256.76ms
       { expected_response:true }...: avg=98.74ms min=1.64ms  med=92.93ms max=363.02ms p(90)=189.67ms p(95)=206.35ms p(99.9)=256.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143989
     http_req_receiving.............: avg=249.5µs min=30.21µs med=59.95µs max=56.86ms  p(90)=202.93µs p(95)=431.17µs p(99.9)=26.19ms 
     http_req_sending...............: avg=81.07µs min=5.43µs  med=10.92µs max=177.54ms p(90)=21.56µs  p(95)=139.76µs p(99.9)=11.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.41ms min=1.58ms  med=92.69ms max=362.26ms p(90)=189.09ms p(95)=205.82ms p(99.9)=255.76ms
     http_reqs......................: 143989  2319.616991/s
     iteration_duration.............: avg=99.73ms min=4.16ms  med=94.05ms max=387.32ms p(90)=190.21ms p(95)=206.87ms p(99.9)=258.51ms
     iterations.....................: 142989  2303.507309/s
     success_rate...................: 100.00% ✓ 142989      ✗ 0     
     vus............................: 59      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 353514      ✗ 0     
     data_received..................: 10 GB   168 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=11.84µs  min=932ns   med=2.25µs   max=44.16ms  p(90)=3.62µs   p(95)=4.56µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=8.88µs   min=0s      med=0s       max=44.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=119.83ms min=1.78ms  med=112.41ms max=820.57ms p(90)=228.68ms p(95)=263.7ms  p(99.9)=646.84ms
       { expected_response:true }...: avg=119.83ms min=1.78ms  med=112.41ms max=820.57ms p(90)=228.68ms p(95)=263.7ms  p(99.9)=646.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118838
     http_req_receiving.............: avg=1.84ms   min=52.88µs med=115.85µs max=305.61ms p(90)=1.74ms   p(95)=4.75ms   p(99.9)=142.18ms
     http_req_sending...............: avg=55.3µs   min=5.33µs  med=9.81µs   max=47.14ms  p(90)=18.14µs  p(95)=117.33µs p(99.9)=7.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.93ms min=1.66ms  med=111.03ms max=820.49ms p(90)=225.59ms p(95)=256.92ms p(99.9)=645.36ms
     http_reqs......................: 118838  1912.328125/s
     iteration_duration.............: avg=121.11ms min=3.35ms  med=113.86ms max=820.77ms p(90)=229.38ms p(95)=264.48ms p(99.9)=647.23ms
     iterations.....................: 117838  1896.236234/s
     success_rate...................: 100.00% ✓ 117838      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.2.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 339795      ✗ 0     
     data_received..................: 10 GB   161 MB/s
     data_sent......................: 137 MB  2.2 MB/s
     http_req_blocked...............: avg=12.18µs  min=1.02µs  med=2.39µs   max=40.88ms  p(90)=3.96µs   p(95)=5µs      p(99.9)=959.56µs
     http_req_connecting............: avg=9.12µs   min=0s      med=0s       max=40.79ms  p(90)=0s       p(95)=0s       p(99.9)=921.72µs
     http_req_duration..............: avg=124.6ms  min=1.81ms  med=114.32ms max=1.11s    p(90)=240.64ms p(95)=273.83ms p(99.9)=571.79ms
       { expected_response:true }...: avg=124.6ms  min=1.81ms  med=114.32ms max=1.11s    p(90)=240.64ms p(95)=273.83ms p(99.9)=571.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 114265
     http_req_receiving.............: avg=1.74ms   min=52.99µs med=117.52µs max=370.87ms p(90)=1.66ms   p(95)=4.23ms   p(99.9)=143.92ms
     http_req_sending...............: avg=56.58µs  min=5.33µs  med=10.24µs  max=60.03ms  p(90)=19.19µs  p(95)=112.87µs p(99.9)=7.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.8ms  min=1.7ms   med=113.12ms max=1.11s    p(90)=237.52ms p(95)=267.75ms p(99.9)=569.45ms
     http_reqs......................: 114265  1836.70752/s
     iteration_duration.............: avg=125.99ms min=3.12ms  med=116.05ms max=1.11s    p(90)=241.44ms p(95)=274.92ms p(99.9)=572.1ms 
     iterations.....................: 113265  1820.633416/s
     success_rate...................: 100.00% ✓ 113265      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 201813      ✗ 0    
     data_received..................: 6.0 GB  95 MB/s
     data_sent......................: 82 MB   1.3 MB/s
     http_req_blocked...............: avg=6.11µs   min=1.09µs  med=2.49µs   max=10.22ms  p(90)=4.27µs   p(95)=5.25µs   p(99.9)=623.97µs
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=9.73ms   p(90)=0s       p(95)=0s       p(99.9)=544.36µs
     http_req_duration..............: avg=209.1ms  min=2.13ms  med=210.87ms max=668.82ms p(90)=382.97ms p(95)=410.98ms p(99.9)=580.67ms
       { expected_response:true }...: avg=209.1ms  min=2.13ms  med=210.87ms max=668.82ms p(90)=382.97ms p(95)=410.98ms p(99.9)=580.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68271
     http_req_receiving.............: avg=88.82µs  min=29.78µs med=66.08µs  max=179.63ms p(90)=104.62µs p(95)=119.68µs p(99.9)=1.57ms  
     http_req_sending...............: avg=31.73µs  min=5.26µs  med=11.5µs   max=154.97ms p(90)=18.6µs   p(95)=22.11µs  p(99.9)=3.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.98ms min=2.06ms  med=210.69ms max=668.72ms p(90)=382.86ms p(95)=410.9ms  p(99.9)=580.6ms 
     http_reqs......................: 68271   1088.672774/s
     iteration_duration.............: avg=212.46ms min=4.53ms  med=214.7ms  max=669.01ms p(90)=383.92ms p(95)=411.74ms p(99.9)=580.94ms
     iterations.....................: 67271   1072.726431/s
     success_rate...................: 100.00% ✓ 67271       ✗ 0    
     vus............................: 91      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92643      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   588 kB/s
     http_req_blocked...............: avg=11.3µs   min=1.07µs  med=3.16µs   max=18.88ms p(90)=5.07µs   p(95)=6.11µs   p(99.9)=2ms     
     http_req_connecting............: avg=7.1µs    min=0s      med=0s       max=18.82ms p(90)=0s       p(95)=0s       p(99.9)=1.97ms  
     http_req_duration..............: avg=450.13ms min=4.03ms  med=420.64ms max=1.85s   p(90)=885.57ms p(95)=958.74ms p(99.9)=1.47s   
       { expected_response:true }...: avg=450.13ms min=4.03ms  med=420.64ms max=1.85s   p(90)=885.57ms p(95)=958.74ms p(99.9)=1.47s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31881
     http_req_receiving.............: avg=100.17µs min=32.42µs med=80.87µs  max=99.91ms p(90)=117.29µs p(95)=131.61µs p(99.9)=947.37µs
     http_req_sending...............: avg=30.58µs  min=5.97µs  med=14.53µs  max=45.74ms p(90)=22.21µs  p(95)=25.28µs  p(99.9)=2.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=450ms    min=3.96ms  med=420.56ms max=1.85s   p(90)=885.45ms p(95)=958.65ms p(99.9)=1.47s   
     http_reqs......................: 31881   489.892138/s
     iteration_duration.............: avg=464.94ms min=30.19ms med=436.65ms max=1.85s   p(90)=889.44ms p(95)=962.2ms  p(99.9)=1.48s   
     iterations.....................: 30881   474.525866/s
     success_rate...................: 100.00% ✓ 30881      ✗ 0    
     vus............................: 58      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42543      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   266 kB/s
     http_req_blocked...............: avg=14.93µs  min=1.3µs   med=3.74µs   max=10.29ms p(90)=5.67µs   p(95)=7.4µs    p(99.9)=1.92ms
     http_req_connecting............: avg=9.42µs   min=0s      med=0s       max=10.03ms p(90)=0s       p(95)=0s       p(99.9)=1.89ms
     http_req_duration..............: avg=963.25ms min=6.41ms  med=868.22ms max=5.88s   p(90)=1.9s     p(95)=2.13s    p(99.9)=5.16s 
       { expected_response:true }...: avg=963.25ms min=6.41ms  med=868.22ms max=5.88s   p(90)=1.9s     p(95)=2.13s    p(99.9)=5.16s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15181
     http_req_receiving.............: avg=109.99µs min=33.51µs med=99.04µs  max=73.58ms p(90)=137.99µs p(95)=152.23µs p(99.9)=1.13ms
     http_req_sending...............: avg=34.32µs  min=5.95µs  med=18.75µs  max=17.57ms p(90)=25.03µs  p(95)=30.42µs  p(99.9)=3.51ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=963.11ms min=6.3ms   med=868.12ms max=5.88s   p(90)=1.9s     p(95)=2.13s    p(99.9)=5.16s 
     http_reqs......................: 15181   221.661473/s
     iteration_duration.............: avg=1.03s    min=37.03ms med=953.67ms max=5.89s   p(90)=1.93s    p(95)=2.16s    p(99.9)=5.18s 
     iterations.....................: 14181   207.060229/s
     success_rate...................: 100.00% ✓ 14181      ✗ 0    
     vus............................: 81      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 40920      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=14.01µs  min=1.23µs  med=3.76µs   max=8.7ms   p(90)=5.68µs   p(95)=7.31µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=8.25µs   min=0s      med=0s       max=8.5ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=995.65ms min=8.78ms  med=910.35ms max=4.05s   p(90)=2.02s    p(95)=2.16s    p(99.9)=3.59s   
       { expected_response:true }...: avg=995.65ms min=8.78ms  med=910.35ms max=4.05s   p(90)=2.02s    p(95)=2.16s    p(99.9)=3.59s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14640
     http_req_receiving.............: avg=107.06µs min=33.15µs med=100.84µs max=7.16ms  p(90)=142.03µs p(95)=155.02µs p(99.9)=844.55µs
     http_req_sending...............: avg=47.31µs  min=5.59µs  med=18.77µs  max=94.95ms p(90)=24.96µs  p(95)=30.01µs  p(99.9)=5.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=995.5ms  min=8.67ms  med=910.25ms max=4.05s   p(90)=2.02s    p(95)=2.16s    p(99.9)=3.59s   
     http_reqs......................: 14640   209.208007/s
     iteration_duration.............: avg=1.06s    min=94.01ms med=988.66ms max=4.06s   p(90)=2.04s    p(95)=2.17s    p(99.9)=3.61s   
     iterations.....................: 13640   194.917843/s
     success_rate...................: 100.00% ✓ 13640      ✗ 0    
     vus............................: 48      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

