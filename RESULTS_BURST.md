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
| hive-router | v0.0.49 | 2,707 | 2,840 | 2,655 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,032 | 2,069 | 2,010 | 1.0% |  |
| cosmo | 0.307.0 | 1,193 | 1,193 | 1,188 | 0.3% | non-compatible response (26 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 492 | 499 | 488 | 0.9% |  |
| hive-gateway | 2.5.25 | 234 | 237 | 231 | 0.8% |  |
| apollo-gateway | 2.13.3 | 205 | 209 | 203 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (23408 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (523688 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,298 | 2,336 | 2,235 | 1.3% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,890 | 1,941 | 1,682 | 4.0% |  |
| cosmo | 0.307.0 | 1,131 | 1,137 | 1,104 | 1.4% | non-compatible response (11 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 470 | 479 | 466 | 0.9% |  |
| hive-gateway | 2.5.25 | 228 | 233 | 226 | 1.1% |  |
| apollo-gateway | 2.13.3 | 210 | 213 | 209 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (12150 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (282936 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 500502      ✗ 0     
     data_received..................: 15 GB   238 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=29.19µs  min=961ns   med=2.68µs  max=68.41ms  p(90)=4.22µs   p(95)=5.33µs   p(99.9)=7.3ms   
     http_req_connecting............: avg=25.46µs  min=0s      med=0s      max=68.3ms   p(90)=0s       p(95)=0s       p(99.9)=6.77ms  
     http_req_duration..............: avg=84.63ms  min=1.62ms  med=77.38ms max=453.47ms p(90)=164.6ms  p(95)=180.35ms p(99.9)=244.52ms
       { expected_response:true }...: avg=84.63ms  min=1.62ms  med=77.38ms max=453.47ms p(90)=164.6ms  p(95)=180.35ms p(99.9)=244.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167834
     http_req_receiving.............: avg=487.59µs min=30.32µs med=58.55µs max=326.07ms p(90)=261.01µs p(95)=437.97µs p(99.9)=48.44ms 
     http_req_sending...............: avg=94.91µs  min=5.39µs  med=10.4µs  max=307.27ms p(90)=19.51µs  p(95)=137.84µs p(99.9)=14.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.04ms  min=1.56ms  med=76.97ms max=289.35ms p(90)=163.77ms p(95)=178.63ms p(99.9)=238.62ms
     http_reqs......................: 167834  2707.497901/s
     iteration_duration.............: avg=85.45ms  min=2.73ms  med=78.31ms max=462.71ms p(90)=165.17ms p(95)=180.94ms p(99.9)=246.47ms
     iterations.....................: 166834  2691.365902/s
     success_rate...................: 100.00% ✓ 166834      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 380037      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=17.49µs  min=1.04µs med=2.67µs   max=58.78ms  p(90)=4.1µs    p(95)=5.05µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=13.76µs  min=0s     med=0s       max=58.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=111.45ms min=2.4ms  med=104.66ms max=704.35ms p(90)=214.95ms p(95)=253.89ms p(99.9)=464.13ms
       { expected_response:true }...: avg=111.45ms min=2.4ms  med=104.66ms max=704.35ms p(90)=214.95ms p(95)=253.89ms p(99.9)=464.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127679
     http_req_receiving.............: avg=1.92ms   min=52.7µs med=117.1µs  max=337.65ms p(90)=1.32ms   p(95)=4.26ms   p(99.9)=145.64ms
     http_req_sending...............: avg=64.9µs   min=5.1µs  med=10.26µs  max=136.01ms p(90)=18.08µs  p(95)=123.77µs p(99.9)=8.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.46ms min=2.31ms med=103.6ms  max=704.25ms p(90)=211.73ms p(95)=246.4ms  p(99.9)=409.15ms
     http_reqs......................: 127679  2032.335136/s
     iteration_duration.............: avg=112.61ms min=3.49ms med=105.89ms max=704.53ms p(90)=215.74ms p(95)=254.68ms p(99.9)=465.16ms
     iterations.....................: 126679  2016.4176/s
     success_rate...................: 100.00% ✓ 126679      ✗ 0     
     vus............................: 97      min=0         max=500 
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

     checks.........................: 100.00% ✓ 220668      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.91µs   min=1.15µs med=2.68µs   max=9.01ms   p(90)=4.24µs   p(95)=5.11µs   p(99.9)=369.28µs
     http_req_connecting............: avg=2.53µs   min=0s     med=0s       max=8.11ms   p(90)=0s       p(95)=0s       p(99.9)=285.58µs
     http_req_duration..............: avg=191.38ms min=2.01ms med=191.99ms max=530.49ms p(90)=354.8ms  p(95)=380.09ms p(99.9)=461.33ms
       { expected_response:true }...: avg=191.38ms min=2.01ms med=191.99ms max=530.49ms p(90)=354.8ms  p(95)=380.09ms p(99.9)=461.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74556
     http_req_receiving.............: avg=146.34µs min=29.4µs med=61.99µs  max=275.1ms  p(90)=96.67µs  p(95)=111.93µs p(99.9)=3.21ms  
     http_req_sending...............: avg=29.35µs  min=5.4µs  med=11.16µs  max=46.47ms  p(90)=17.39µs  p(95)=21.14µs  p(99.9)=3.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.21ms min=1.95ms med=191.74ms max=530.42ms p(90)=354.67ms p(95)=379.97ms p(99.9)=461.05ms
     http_reqs......................: 74556   1193.186497/s
     iteration_duration.............: avg=194.24ms min=3.91ms med=195.16ms max=530.65ms p(90)=355.66ms p(95)=380.83ms p(99.9)=461.69ms
     iterations.....................: 73556   1177.1826/s
     success_rate...................: 100.00% ✓ 73556       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 92832      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   591 kB/s
     http_req_blocked...............: avg=10.63µs  min=1.14µs  med=3.12µs   max=19.74ms p(90)=4.96µs   p(95)=6.05µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=6.22µs   min=0s      med=0s       max=19.42ms p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=449.73ms min=3.99ms  med=419.76ms max=1.85s   p(90)=894.86ms p(95)=970.67ms p(99.9)=1.5s    
       { expected_response:true }...: avg=449.73ms min=3.99ms  med=419.76ms max=1.85s   p(90)=894.86ms p(95)=970.67ms p(99.9)=1.5s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 31944
     http_req_receiving.............: avg=92.02µs  min=34.02µs med=78.56µs  max=90.41ms p(90)=115.58µs p(95)=129.64µs p(99.9)=978.03µs
     http_req_sending...............: avg=28.18µs  min=5.91µs  med=13.97µs  max=56.15ms p(90)=21.52µs  p(95)=25.08µs  p(99.9)=2.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=449.61ms min=3.93ms  med=419.56ms max=1.85s   p(90)=894.75ms p(95)=970.58ms p(99.9)=1.5s    
     http_reqs......................: 31944   492.059351/s
     iteration_duration.............: avg=464.46ms min=24.23ms med=437.62ms max=1.86s   p(90)=899.59ms p(95)=974.48ms p(99.9)=1.5s    
     iterations.....................: 30944   476.65554/s
     success_rate...................: 100.00% ✓ 30944      ✗ 0    
     vus............................: 53      min=0        max=500
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

     checks.........................: 100.00% ✓ 44907      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   282 kB/s
     http_req_blocked...............: avg=17.21µs  min=1.28µs  med=3.87µs   max=25.56ms  p(90)=5.85µs   p(95)=7.56µs  p(99.9)=2.61ms
     http_req_connecting............: avg=11.6µs   min=0s      med=0s       max=25.5ms   p(90)=0s       p(95)=0s      p(99.9)=2.42ms
     http_req_duration..............: avg=888.35ms min=6.1ms   med=783.03ms max=17.86s   p(90)=1.51s    p(95)=1.64s   p(99.9)=17.05s
       { expected_response:true }...: avg=888.35ms min=6.1ms   med=783.03ms max=17.86s   p(90)=1.51s    p(95)=1.64s   p(99.9)=17.05s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15969
     http_req_receiving.............: avg=108.14µs min=36.81µs med=102.26µs max=9.25ms   p(90)=141.62µs p(95)=154.5µs p(99.9)=1ms   
     http_req_sending...............: avg=40.74µs  min=5.97µs  med=19.1µs   max=154.24ms p(90)=25.41µs  p(95)=30.37µs p(99.9)=3.14ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=888.2ms  min=6.02ms  med=782.82ms max=17.86s   p(90)=1.51s    p(95)=1.64s   p(99.9)=17.05s
     http_reqs......................: 15969   234.245044/s
     iteration_duration.............: avg=947.72ms min=45.88ms med=853.62ms max=17.86s   p(90)=1.53s    p(95)=1.66s   p(99.9)=17.07s
     iterations.....................: 14969   219.576308/s
     success_rate...................: 100.00% ✓ 14969      ✗ 0    
     vus............................: 65      min=0        max=498
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

     checks.........................: 100.00% ✓ 42795      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   252 kB/s
     http_req_blocked...............: avg=14.4µs   min=1.17µs  med=3.28µs   max=6.59ms  p(90)=4.97µs   p(95)=6.63µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=9.49µs   min=0s      med=0s       max=6.51ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=462.34ms min=8.38ms  med=540.96ms max=1.31s   p(90)=776.87ms p(95)=845.77ms p(99.9)=1.15s   
       { expected_response:true }...: avg=462.34ms min=8.38ms  med=540.96ms max=1.31s   p(90)=776.87ms p(95)=845.77ms p(99.9)=1.15s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15265
     http_req_receiving.............: avg=97.7µs   min=29.71µs med=89.11µs  max=29.59ms p(90)=128.67µs p(95)=141.56µs p(99.9)=973.08µs
     http_req_sending...............: avg=27.28µs  min=6.17µs  med=15.96µs  max=10.11ms p(90)=22.13µs  p(95)=26.97µs  p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=462.22ms min=8.28ms  med=540.83ms max=1.31s   p(90)=776.76ms p(95)=845.69ms p(99.9)=1.15s   
     http_reqs......................: 15265   205.687429/s
     iteration_duration.............: avg=494.63ms min=14.3ms  med=573.41ms max=1.31s   p(90)=784.79ms p(95)=852.8ms  p(99.9)=1.16s   
     iterations.....................: 14265   192.212982/s
     success_rate...................: 100.00% ✓ 14265      ✗ 0    
     vus............................: 60      min=0        max=495
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

     checks.........................: 100.00% ✓ 424977      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=44.46µs  min=1.09µs  med=3.05µs  max=148.11ms p(90)=5.02µs   p(95)=6.41µs   p(99.9)=10.29ms 
     http_req_connecting............: avg=40.27µs  min=0s      med=0s      max=147.93ms p(90)=0s       p(95)=0s       p(99.9)=9.41ms  
     http_req_duration..............: avg=99.63ms  min=1.61ms  med=93.48ms max=308.33ms p(90)=188.7ms  p(95)=206.31ms p(99.9)=268.22ms
       { expected_response:true }...: avg=99.63ms  min=1.61ms  med=93.48ms max=308.33ms p(90)=188.7ms  p(95)=206.31ms p(99.9)=268.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142659
     http_req_receiving.............: avg=347.46µs min=29.35µs med=64µs    max=54.61ms  p(90)=215.15µs p(95)=461.35µs p(99.9)=32.96ms 
     http_req_sending...............: avg=93.35µs  min=5.39µs  med=11.79µs max=58.26ms  p(90)=23.03µs  p(95)=148.17µs p(99.9)=15.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.19ms  min=1.55ms  med=93.22ms max=308.08ms p(90)=187.88ms p(95)=205.16ms p(99.9)=261.59ms
     http_reqs......................: 142659  2298.854876/s
     iteration_duration.............: avg=100.66ms min=4.67ms  med=94.58ms max=365.86ms p(90)=189.34ms p(95)=206.94ms p(99.9)=270.28ms
     iterations.....................: 141659  2282.740541/s
     success_rate...................: 100.00% ✓ 141659      ✗ 0     
     vus............................: 60      min=0         max=498 
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

     checks.........................: 100.00% ✓ 349914      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=16.62µs  min=1.05µs  med=2.86µs   max=62.47ms  p(90)=4.5µs    p(95)=5.57µs   p(99.9)=2.13ms  
     http_req_connecting............: avg=12.95µs  min=0s      med=0s       max=62.39ms  p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=121.01ms min=1.78ms  med=111.56ms max=643.95ms p(90)=234.17ms p(95)=267.41ms p(99.9)=543.37ms
       { expected_response:true }...: avg=121.01ms min=1.78ms  med=111.56ms max=643.95ms p(90)=234.17ms p(95)=267.41ms p(99.9)=543.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117638
     http_req_receiving.............: avg=1.67ms   min=53.49µs med=120.71µs max=262.91ms p(90)=1.65ms   p(95)=4.64ms   p(99.9)=129.24ms
     http_req_sending...............: avg=68.54µs  min=5.36µs  med=11.14µs  max=227.88ms p(90)=20.63µs  p(95)=128.67µs p(99.9)=8.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.26ms min=1.64ms  med=110.37ms max=641.74ms p(90)=230.99ms p(95)=261.64ms p(99.9)=539.86ms
     http_reqs......................: 117638  1890.745396/s
     iteration_duration.............: avg=122.34ms min=2.94ms  med=113.08ms max=667.07ms p(90)=235.02ms p(95)=268.23ms p(99.9)=544.23ms
     iterations.....................: 116638  1874.672823/s
     success_rate...................: 100.00% ✓ 116638      ✗ 0     
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

     checks.........................: 100.00% ✓ 209076      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=12.08µs  min=1.15µs med=2.65µs   max=39.71ms  p(90)=4.25µs   p(95)=5.2µs    p(99.9)=660.5µs 
     http_req_connecting............: avg=8.56µs   min=0s     med=0s       max=39.63ms  p(90)=0s       p(95)=0s       p(99.9)=577.05µs
     http_req_duration..............: avg=201.93ms min=2.07ms med=203.54ms max=580.05ms p(90)=374.01ms p(95)=401.68ms p(99.9)=488.63ms
       { expected_response:true }...: avg=201.93ms min=2.07ms med=203.54ms max=580.05ms p(90)=374.01ms p(95)=401.68ms p(99.9)=488.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70692
     http_req_receiving.............: avg=84.41µs  min=30.8µs med=65.34µs  max=95.8ms   p(90)=101.42µs p(95)=117.34µs p(99.9)=1.77ms  
     http_req_sending...............: avg=36.32µs  min=5.47µs med=11.68µs  max=125.22ms p(90)=18.2µs   p(95)=21.89µs  p(99.9)=4.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.81ms min=2.01ms med=203.39ms max=579.97ms p(90)=373.93ms p(95)=401.6ms  p(99.9)=488.56ms
     http_reqs......................: 70692   1131.127758/s
     iteration_duration.............: avg=205.07ms min=5.57ms med=207.21ms max=580.22ms p(90)=374.92ms p(95)=402.59ms p(99.9)=489.02ms
     iterations.....................: 69692   1115.12697/s
     success_rate...................: 100.00% ✓ 69692       ✗ 0    
     vus............................: 81      min=0         max=493
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

     checks.........................: 100.00% ✓ 89190      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   565 kB/s
     http_req_blocked...............: avg=10.69µs  min=1.24µs  med=3.22µs   max=19.94ms  p(90)=5.06µs   p(95)=6.11µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=6.23µs   min=0s      med=0s       max=19.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.56ms  
     http_req_duration..............: avg=467.4ms  min=4.14ms  med=434.51ms max=2.14s    p(90)=928.29ms p(95)=1s       p(99.9)=1.53s   
       { expected_response:true }...: avg=467.4ms  min=4.14ms  med=434.51ms max=2.14s    p(90)=928.29ms p(95)=1s       p(99.9)=1.53s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30730
     http_req_receiving.............: avg=97.73µs  min=32.35µs med=83.71µs  max=156.27ms p(90)=120.86µs p(95)=136.43µs p(99.9)=884.72µs
     http_req_sending...............: avg=30.86µs  min=5.74µs  med=15.3µs   max=81.57ms  p(90)=22.57µs  p(95)=25.98µs  p(99.9)=2.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=467.27ms min=4.07ms  med=434.41ms max=2.14s    p(90)=928.16ms p(95)=1s       p(99.9)=1.53s   
     http_reqs......................: 30730   470.758761/s
     iteration_duration.............: avg=483.36ms min=36.14ms med=453.39ms max=2.15s    p(90)=932.58ms p(95)=1s       p(99.9)=1.54s   
     iterations.....................: 29730   455.439569/s
     success_rate...................: 100.00% ✓ 29730      ✗ 0    
     vus............................: 70      min=0        max=497
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

     checks.........................: 100.00% ✓ 43737      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=17.34µs  min=1.37µs  med=3.83µs   max=25.01ms p(90)=5.84µs   p(95)=7.68µs  p(99.9)=2.39ms
     http_req_connecting............: avg=11.5µs   min=0s      med=0s       max=24.94ms p(90)=0s       p(95)=0s      p(99.9)=2.36ms
     http_req_duration..............: avg=936.96ms min=6.35ms  med=845.37ms max=5.31s   p(90)=1.82s    p(95)=2.05s   p(99.9)=4.8s  
       { expected_response:true }...: avg=936.96ms min=6.35ms  med=845.37ms max=5.31s   p(90)=1.82s    p(95)=2.05s   p(99.9)=4.8s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15579
     http_req_receiving.............: avg=112.57µs min=35.53µs med=101.91µs max=33.91ms p(90)=142.25µs p(95)=155.6µs p(99.9)=1.38ms
     http_req_sending...............: avg=34.78µs  min=6.2µs   med=18.62µs  max=44.56ms p(90)=24.88µs  p(95)=30.44µs p(99.9)=3.54ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=936.82ms min=6.26ms  med=845.26ms max=5.31s   p(90)=1.82s    p(95)=2.05s   p(99.9)=4.8s  
     http_reqs......................: 15579   228.200003/s
     iteration_duration.............: avg=1s       min=27.65ms med=931.13ms max=5.32s   p(90)=1.84s    p(95)=2.06s   p(99.9)=4.84s 
     iterations.....................: 14579   213.552079/s
     success_rate...................: 100.00% ✓ 14579      ✗ 0    
     vus............................: 70      min=0        max=500
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

     checks.........................: 100.00% ✓ 41322      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   253 kB/s
     http_req_blocked...............: avg=15.54µs  min=1.21µs  med=3.66µs   max=19.45ms p(90)=5.53µs   p(95)=7.2µs    p(99.9)=1.78ms  
     http_req_connecting............: avg=9.72µs   min=0s      med=0s       max=19.29ms p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=986.91ms min=8.89ms  med=900.62ms max=3.92s   p(90)=2s       p(95)=2.13s    p(99.9)=3.36s   
       { expected_response:true }...: avg=986.91ms min=8.89ms  med=900.62ms max=3.92s   p(90)=2s       p(95)=2.13s    p(99.9)=3.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14774
     http_req_receiving.............: avg=113.08µs min=38.04µs med=98.21µs  max=69.47ms p(90)=138.24µs p(95)=151.56µs p(99.9)=925.84µs
     http_req_sending...............: avg=40.97µs  min=6.52µs  med=18.18µs  max=71.73ms p(90)=24.32µs  p(95)=29.54µs  p(99.9)=4.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=986.75ms min=8.79ms  med=900.47ms max=3.92s   p(90)=2s       p(95)=2.13s    p(99.9)=3.36s   
     http_reqs......................: 14774   210.734908/s
     iteration_duration.............: avg=1.05s    min=89.61ms med=980.61ms max=3.93s   p(90)=2.02s    p(95)=2.14s    p(99.9)=3.38s   
     iterations.....................: 13774   196.471004/s
     success_rate...................: 100.00% ✓ 13774      ✗ 0    
     vus............................: 61      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

