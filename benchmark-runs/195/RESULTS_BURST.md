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
| hive-router | v0.0.49 | 2,688 | 2,807 | 2,648 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,029 | 2,059 | 2,004 | 0.9% |  |
| cosmo | 0.307.0 | 1,175 | 1,175 | 1,165 | 0.6% | non-compatible response (17 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 494 | 501 | 491 | 0.8% |  |
| hive-gateway | 2.5.25 | 232 | 236 | 229 | 0.9% |  |
| apollo-gateway | 2.13.3 | 202 | 206 | 200 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (26881 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (502295 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,221 | 2,325 | 2,181 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,883 | 1,930 | 1,867 | 1.1% |  |
| cosmo | 0.307.0 | 1,147 | 1,153 | 1,140 | 0.5% | non-compatible response (7 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 470 | 480 | 462 | 1.3% |  |
| hive-gateway | 2.5.25 | 230 | 234 | 227 | 1.0% |  |
| apollo-gateway | 2.13.3 | 207 | 211 | 205 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16070 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (307378 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 496323      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=29.23µs  min=1.09µs  med=2.69µs  max=86.51ms  p(90)=4.3µs    p(95)=5.48µs   p(99.9)=3.66ms  
     http_req_connecting............: avg=25.65µs  min=0s      med=0s      max=86.41ms  p(90)=0s       p(95)=0s       p(99.9)=3.59ms  
     http_req_duration..............: avg=85.3ms   min=1.65ms  med=78.92ms max=394.42ms p(90)=166.05ms p(95)=181.55ms p(99.9)=233ms   
       { expected_response:true }...: avg=85.3ms   min=1.65ms  med=78.92ms max=394.42ms p(90)=166.05ms p(95)=181.55ms p(99.9)=233ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 166441
     http_req_receiving.............: avg=352.42µs min=29.03µs med=58.9µs  max=107.6ms  p(90)=235.71µs p(95)=428.66µs p(99.9)=36.02ms 
     http_req_sending...............: avg=89.11µs  min=5.43µs  med=10.62µs max=237.94ms p(90)=20.36µs  p(95)=137.59µs p(99.9)=13.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.86ms  min=1.59ms  med=78.59ms max=394.31ms p(90)=165.37ms p(95)=180.76ms p(99.9)=229.52ms
     http_reqs......................: 166441  2688.239369/s
     iteration_duration.............: avg=86.17ms  min=2.19ms  med=79.82ms max=406.86ms p(90)=166.71ms p(95)=182.09ms p(99.9)=235.73ms
     iterations.....................: 165441  2672.088064/s
     success_rate...................: 100.00% ✓ 165441      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 378483      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=17.17µs  min=1.04µs  med=2.57µs   max=91.29ms  p(90)=4µs      p(95)=4.94µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=13.82µs  min=0s      med=0s       max=91.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=111.92ms min=2.35ms  med=103.73ms max=598.31ms p(90)=217.3ms  p(95)=251.3ms  p(99.9)=418.29ms
       { expected_response:true }...: avg=111.92ms min=2.35ms  med=103.73ms max=598.31ms p(90)=217.3ms  p(95)=251.3ms  p(99.9)=418.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127161
     http_req_receiving.............: avg=1.9ms    min=53.49µs med=119.31µs max=333.8ms  p(90)=1.45ms   p(95)=5.02ms   p(99.9)=148.93ms
     http_req_sending...............: avg=67.07µs  min=5.53µs  med=10.17µs  max=194.98ms p(90)=18.13µs  p(95)=121.98µs p(99.9)=9.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.94ms min=2.26ms  med=102.55ms max=593.36ms p(90)=213.6ms  p(95)=245.14ms p(99.9)=403.21ms
     http_reqs......................: 127161  2029.650047/s
     iteration_duration.............: avg=113.08ms min=3.57ms  med=105.14ms max=598.67ms p(90)=218.08ms p(95)=252.05ms p(99.9)=418.54ms
     iterations.....................: 126161  2013.688785/s
     success_rate...................: 100.00% ✓ 126161      ✗ 0     
     vus............................: 87      min=0         max=495 
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

     checks.........................: 100.00% ✓ 217389      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.51µs   min=1.04µs  med=2.06µs   max=26.34ms  p(90)=3.29µs   p(95)=4.02µs   p(99.9)=564.34µs
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=26.27ms  p(90)=0s       p(95)=0s       p(99.9)=438.5µs 
     http_req_duration..............: avg=194.25ms min=2.06ms  med=193.93ms max=632.42ms p(90)=358.6ms  p(95)=387.24ms p(99.9)=538.62ms
       { expected_response:true }...: avg=194.25ms min=2.06ms  med=193.93ms max=632.42ms p(90)=358.6ms  p(95)=387.24ms p(99.9)=538.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73463
     http_req_receiving.............: avg=72.08µs  min=29.52µs med=57.97µs  max=49.27ms  p(90)=88.06µs  p(95)=101.09µs p(99.9)=1.54ms  
     http_req_sending...............: avg=29.28µs  min=5.22µs  med=9.87µs   max=132.44ms p(90)=14.49µs  p(95)=18µs     p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.15ms min=2ms     med=193.84ms max=632.36ms p(90)=358.51ms p(95)=387.17ms p(99.9)=538.31ms
     http_reqs......................: 73463   1175.774154/s
     iteration_duration.............: avg=197.16ms min=5.04ms  med=197.17ms max=632.6ms  p(90)=359.52ms p(95)=388.09ms p(99.9)=539.03ms
     iterations.....................: 72463   1159.76917/s
     success_rate...................: 100.00% ✓ 72463       ✗ 0    
     vus............................: 79      min=0         max=493
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

     checks.........................: 100.00% ✓ 93093      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   593 kB/s
     http_req_blocked...............: avg=10.66µs  min=1.24µs  med=3.17µs   max=6.67ms   p(90)=4.98µs   p(95)=6.14µs   p(99.9)=2.2ms   
     http_req_connecting............: avg=6.19µs   min=0s      med=0s       max=6.61ms   p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=448.27ms min=3.85ms  med=420.57ms max=1.86s    p(90)=878.92ms p(95)=966.98ms p(99.9)=1.39s   
       { expected_response:true }...: avg=448.27ms min=3.85ms  med=420.57ms max=1.86s    p(90)=878.92ms p(95)=966.98ms p(99.9)=1.39s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32031
     http_req_receiving.............: avg=96.38µs  min=34.56µs med=79.99µs  max=90.67ms  p(90)=117.65µs p(95)=132.95µs p(99.9)=794.38µs
     http_req_sending...............: avg=39.97µs  min=5.86µs  med=14.26µs  max=136.57ms p(90)=21.73µs  p(95)=25.28µs  p(99.9)=4.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.14ms min=3.79ms  med=420.46ms max=1.86s    p(90)=878.85ms p(95)=966.88ms p(99.9)=1.39s   
     http_reqs......................: 32031   494.31818/s
     iteration_duration.............: avg=462.95ms min=27.87ms med=439.02ms max=1.86s    p(90)=884.38ms p(95)=969.95ms p(99.9)=1.4s    
     iterations.....................: 31031   478.885687/s
     success_rate...................: 100.00% ✓ 31031      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 44589      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=27.44µs  min=1.22µs  med=3.64µs   max=24.47ms p(90)=5.54µs   p(95)=7.22µs   p(99.9)=6.71ms  
     http_req_connecting............: avg=21.38µs  min=0s      med=0s       max=24.4ms  p(90)=0s       p(95)=0s       p(99.9)=6.54ms  
     http_req_duration..............: avg=898.79ms min=6.33ms  med=803.2ms  max=16.98s  p(90)=1.57s    p(95)=1.72s    p(99.9)=15.8s   
       { expected_response:true }...: avg=898.79ms min=6.33ms  med=803.2ms  max=16.98s  p(90)=1.57s    p(95)=1.72s    p(99.9)=15.8s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15863
     http_req_receiving.............: avg=111.14µs min=33.4µs  med=99.31µs  max=82.13ms p(90)=138.54µs p(95)=151.92µs p(99.9)=917.47µs
     http_req_sending...............: avg=48.21µs  min=6.06µs  med=18.54µs  max=88.94ms p(90)=24.69µs  p(95)=29.98µs  p(99.9)=5.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=898.63ms min=6.23ms  med=803.07ms max=16.98s  p(90)=1.57s    p(95)=1.72s    p(99.9)=15.8s   
     http_reqs......................: 15863   232.400091/s
     iteration_duration.............: avg=959.28ms min=20.86ms med=874.12ms max=16.98s  p(90)=1.59s    p(95)=1.73s    p(99.9)=15.81s  
     iterations.....................: 14863   217.749641/s
     success_rate...................: 100.00% ✓ 14863      ✗ 0    
     vus............................: 69      min=0        max=499
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

     checks.........................: 100.00% ✓ 42132      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=16.01µs  min=1.3µs   med=3.56µs   max=14.96ms p(90)=5.34µs   p(95)=6.9µs    p(99.9)=2.48ms
     http_req_connecting............: avg=10.54µs  min=0s      med=0s       max=14.83ms p(90)=0s       p(95)=0s       p(99.9)=2.45ms
     http_req_duration..............: avg=444.42ms min=8.32ms  med=517.26ms max=1.31s   p(90)=737.82ms p(95)=817.65ms p(99.9)=1.13s 
       { expected_response:true }...: avg=444.42ms min=8.32ms  med=517.26ms max=1.31s   p(90)=737.82ms p(95)=817.65ms p(99.9)=1.13s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15044
     http_req_receiving.............: avg=104.56µs min=34.82µs med=94.38µs  max=20.9ms  p(90)=135.54µs p(95)=150.11µs p(99.9)=1.15ms
     http_req_sending...............: avg=30.79µs  min=6.14µs  med=17.67µs  max=8.03ms  p(90)=23.82µs  p(95)=29.11µs  p(99.9)=3.97ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=444.28ms min=8.19ms  med=517.12ms max=1.31s   p(90)=737.7ms  p(95)=817.12ms p(99.9)=1.13s 
     http_reqs......................: 15044   202.418607/s
     iteration_duration.............: avg=475.89ms min=13.87ms med=546.18ms max=1.32s   p(90)=746.47ms p(95)=828.62ms p(99.9)=1.13s 
     iterations.....................: 14044   188.963502/s
     success_rate...................: 100.00% ✓ 14044      ✗ 0    
     vus............................: 65      min=0        max=494
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

     checks.........................: 100.00% ✓ 410031      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=19.56µs  min=1.06µs  med=2.92µs  max=61.81ms  p(90)=4.69µs   p(95)=5.96µs   p(99.9)=2ms     
     http_req_connecting............: avg=15.77µs  min=0s      med=0s      max=61.59ms  p(90)=0s       p(95)=0s       p(99.9)=1.95ms  
     http_req_duration..............: avg=103.29ms min=1.6ms   med=98.49ms max=313.78ms p(90)=198.18ms p(95)=215.79ms p(99.9)=263.16ms
       { expected_response:true }...: avg=103.29ms min=1.6ms   med=98.49ms max=313.78ms p(90)=198.18ms p(95)=215.79ms p(99.9)=263.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137677
     http_req_receiving.............: avg=244.61µs min=30.09µs med=64.16µs max=87.53ms  p(90)=179.32µs p(95)=431.57µs p(99.9)=25.24ms 
     http_req_sending...............: avg=75.95µs  min=5.52µs  med=11.81µs max=49.96ms  p(90)=22.56µs  p(95)=142.02µs p(99.9)=10.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.97ms min=1.55ms  med=98.23ms max=313.67ms p(90)=197.65ms p(95)=215.19ms p(99.9)=261.25ms
     http_reqs......................: 137677  2221.436652/s
     iteration_duration.............: avg=104.35ms min=4.35ms  med=99.68ms max=332.06ms p(90)=198.81ms p(95)=216.36ms p(99.9)=263.94ms
     iterations.....................: 136677  2205.30152/s
     success_rate...................: 100.00% ✓ 136677      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 348615      ✗ 0     
     data_received..................: 10 GB   165 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=13.64µs  min=1.04µs  med=2.74µs   max=44.61ms  p(90)=4.41µs   p(95)=5.52µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=10.14µs  min=0s      med=0s       max=44.51ms  p(90)=0s       p(95)=0s       p(99.9)=955.87µs
     http_req_duration..............: avg=121.47ms min=1.79ms  med=111.94ms max=871.28ms p(90)=234.29ms p(95)=265.11ms p(99.9)=635.95ms
       { expected_response:true }...: avg=121.47ms min=1.79ms  med=111.94ms max=871.28ms p(90)=234.29ms p(95)=265.11ms p(99.9)=635.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117205
     http_req_receiving.............: avg=1.75ms   min=54.07µs med=120.42µs max=340.71ms p(90)=1.82ms   p(95)=4.99ms   p(99.9)=123.53ms
     http_req_sending...............: avg=64.2µs   min=5.4µs   med=10.71µs  max=202.36ms p(90)=19.92µs  p(95)=125.09µs p(99.9)=8.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.66ms min=1.69ms  med=110.63ms max=871.19ms p(90)=231ms    p(95)=259.6ms  p(99.9)=634.21ms
     http_reqs......................: 117205  1883.280115/s
     iteration_duration.............: avg=122.79ms min=3.02ms  med=113.39ms max=871.51ms p(90)=235.04ms p(95)=265.98ms p(99.9)=636.67ms
     iterations.....................: 116205  1867.211858/s
     success_rate...................: 100.00% ✓ 116205      ✗ 0     
     vus............................: 67      min=0         max=495 
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

     checks.........................: 100.00% ✓ 212730      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=7.18µs   min=1.1µs   med=2.82µs   max=22.71ms  p(90)=4.61µs   p(95)=5.61µs   p(99.9)=657.34µs
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=22.66ms  p(90)=0s       p(95)=0s       p(99.9)=603.87µs
     http_req_duration..............: avg=198.46ms min=2.15ms  med=199.16ms max=600.37ms p(90)=368.33ms p(95)=395.54ms p(99.9)=524.32ms
       { expected_response:true }...: avg=198.46ms min=2.15ms  med=199.16ms max=600.37ms p(90)=368.33ms p(95)=395.54ms p(99.9)=524.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71910
     http_req_receiving.............: avg=87.98µs  min=28.98µs med=69.8µs   max=97.65ms  p(90)=109.08µs p(95)=125.79µs p(99.9)=1.95ms  
     http_req_sending...............: avg=35.28µs  min=5.5µs   med=12.37µs  max=118.04ms p(90)=19.95µs  p(95)=24.01µs  p(99.9)=4.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.34ms min=2.06ms  med=199.03ms max=600.28ms p(90)=368.21ms p(95)=395.42ms p(99.9)=524.25ms
     http_reqs......................: 71910   1147.833498/s
     iteration_duration.............: avg=201.52ms min=5.36ms  med=202.46ms max=600.56ms p(90)=369.24ms p(95)=396.41ms p(99.9)=525.47ms
     iterations.....................: 70910   1131.871414/s
     success_rate...................: 100.00% ✓ 70910       ✗ 0    
     vus............................: 87      min=0         max=498
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

     checks.........................: 100.00% ✓ 89061      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   564 kB/s
     http_req_blocked...............: avg=10.45µs  min=1.16µs  med=3.29µs   max=5.87ms  p(90)=5.12µs   p(95)=6.16µs   p(99.9)=2.03ms
     http_req_connecting............: avg=5.92µs   min=0s      med=0s       max=5.79ms  p(90)=0s       p(95)=0s       p(99.9)=1.9ms 
     http_req_duration..............: avg=468.08ms min=4.1ms   med=430.1ms  max=2.03s   p(90)=939.88ms p(95)=1.02s    p(99.9)=1.52s 
       { expected_response:true }...: avg=468.08ms min=4.1ms   med=430.1ms  max=2.03s   p(90)=939.88ms p(95)=1.02s    p(99.9)=1.52s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30687
     http_req_receiving.............: avg=97.5µs   min=31.44µs med=84.39µs  max=48.19ms p(90)=121.73µs p(95)=136.46µs p(99.9)=1.02ms
     http_req_sending...............: avg=29.21µs  min=5.85µs  med=15.31µs  max=39.88ms p(90)=22.45µs  p(95)=25.82µs  p(99.9)=2.57ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=467.95ms min=4.03ms  med=429.97ms max=2.03s   p(90)=939.78ms p(95)=1.02s    p(99.9)=1.52s 
     http_reqs......................: 30687   470.157164/s
     iteration_duration.............: avg=484.08ms min=33.46ms med=451.08ms max=2.03s   p(90)=945.22ms p(95)=1.02s    p(99.9)=1.53s 
     iterations.....................: 29687   454.836111/s
     success_rate...................: 100.00% ✓ 29687      ✗ 0    
     vus............................: 69      min=0        max=497
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

     checks.........................: 100.00% ✓ 44115      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=15.8µs   min=1.21µs  med=3.56µs   max=7.76ms  p(90)=5.44µs   p(95)=6.97µs   p(99.9)=2.6ms 
     http_req_connecting............: avg=10.46µs  min=0s      med=0s       max=7.58ms  p(90)=0s       p(95)=0s       p(99.9)=2.57ms
     http_req_duration..............: avg=927.76ms min=6.38ms  med=842.79ms max=5.11s   p(90)=1.86s    p(95)=2.06s    p(99.9)=4.61s 
       { expected_response:true }...: avg=927.76ms min=6.38ms  med=842.79ms max=5.11s   p(90)=1.86s    p(95)=2.06s    p(99.9)=4.61s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15705
     http_req_receiving.............: avg=109.17µs min=35.58µs med=97.99µs  max=59.8ms  p(90)=135.61µs p(95)=148.33µs p(99.9)=1.47ms
     http_req_sending...............: avg=28.71µs  min=6.04µs  med=18.11µs  max=19.68ms p(90)=24.21µs  p(95)=29.27µs  p(99.9)=2.43ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=927.62ms min=6.27ms  med=842.7ms  max=5.11s   p(90)=1.86s    p(95)=2.06s    p(99.9)=4.61s 
     http_reqs......................: 15705   230.427904/s
     iteration_duration.............: avg=990.84ms min=36.22ms med=903.05ms max=5.12s   p(90)=1.88s    p(95)=2.08s    p(99.9)=4.62s 
     iterations.....................: 14705   215.75564/s
     success_rate...................: 100.00% ✓ 14705      ✗ 0    
     vus............................: 62      min=0        max=498
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

     checks.........................: 100.00% ✓ 40458      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=17.27µs  min=1.3µs   med=3.43µs   max=22.34ms p(90)=5.25µs   p(95)=7.02µs   p(99.9)=2.8ms   
     http_req_connecting............: avg=11.88µs  min=0s      med=0s       max=22.28ms p(90)=0s       p(95)=0s       p(99.9)=2.77ms  
     http_req_duration..............: avg=1s       min=8.58ms  med=930.22ms max=4.15s   p(90)=2.04s    p(95)=2.19s    p(99.9)=3.59s   
       { expected_response:true }...: avg=1s       min=8.58ms  med=930.22ms max=4.15s   p(90)=2.04s    p(95)=2.19s    p(99.9)=3.59s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14486
     http_req_receiving.............: avg=103.47µs min=35.77µs med=94.04µs  max=26.13ms p(90)=135.32µs p(95)=148.09µs p(99.9)=898.07µs
     http_req_sending...............: avg=29.34µs  min=6.1µs   med=17.53µs  max=27.82ms p(90)=23.55µs  p(95)=28.57µs  p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s       min=8.48ms  med=930.1ms  max=4.15s   p(90)=2.04s    p(95)=2.19s    p(99.9)=3.58s   
     http_reqs......................: 14486   207.600756/s
     iteration_duration.............: avg=1.08s    min=33.86ms med=1s       max=4.16s   p(90)=2.06s    p(95)=2.2s     p(99.9)=3.61s   
     iterations.....................: 13486   193.269626/s
     success_rate...................: 100.00% ✓ 13486      ✗ 0    
     vus............................: 97      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

