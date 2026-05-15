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
| hive-router | v0.0.49 | 2,688 | 2,802 | 2,652 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,049 | 2,102 | 2,039 | 1.0% |  |
| cosmo | 0.307.0 | 1,216 | 1,216 | 1,195 | 1.2% | non-compatible response (18 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 481 | 490 | 477 | 1.0% |  |
| hive-gateway | 2.5.25 | 227 | 232 | 225 | 1.1% |  |
| apollo-gateway | 2.13.3 | 203 | 207 | 201 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (17216 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (527283 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,321 | 2,431 | 2,282 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,908 | 1,942 | 1,882 | 1.2% |  |
| cosmo | 0.307.0 | 1,154 | 1,168 | 1,137 | 1.3% | non-compatible response (15 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 470 | 479 | 463 | 1.2% |  |
| hive-gateway | 2.5.25 | 224 | 232 | 221 | 1.5% |  |
| apollo-gateway | 2.13.3 | 202 | 205 | 200 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (17191 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (257648 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 496299      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=26.24µs  min=992ns   med=2.27µs  max=86.14ms  p(90)=3.7µs    p(95)=4.84µs   p(99.9)=8.12ms  
     http_req_connecting............: avg=22.86µs  min=0s      med=0s      max=86.08ms  p(90)=0s       p(95)=0s       p(99.9)=7.76ms  
     http_req_duration..............: avg=85.36ms  min=1.45ms  med=79.53ms max=371.94ms p(90)=165.53ms p(95)=178.3ms  p(99.9)=222.24ms
       { expected_response:true }...: avg=85.36ms  min=1.45ms  med=79.53ms max=371.94ms p(90)=165.53ms p(95)=178.3ms  p(99.9)=222.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166433
     http_req_receiving.............: avg=288.55µs min=26.96µs med=55.44µs max=59.83ms  p(90)=223.94µs p(95)=407.76µs p(99.9)=32.47ms 
     http_req_sending...............: avg=86.55µs  min=5.22µs  med=9.84µs  max=165.49ms p(90)=18.88µs  p(95)=131.68µs p(99.9)=12.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.99ms  min=1.4ms   med=79.26ms max=370.03ms p(90)=164.75ms p(95)=177.22ms p(99.9)=220.6ms 
     http_reqs......................: 166433  2688.901262/s
     iteration_duration.............: avg=86.18ms  min=2.27ms  med=80.41ms max=404.74ms p(90)=166.01ms p(95)=178.75ms p(99.9)=224.41ms
     iterations.....................: 165433  2672.745204/s
     success_rate...................: 100.00% ✓ 165433      ✗ 0     
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

     checks.........................: 100.00% ✓ 383262      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=18.51µs  min=942ns   med=2.3µs    max=72.13ms  p(90)=3.72µs   p(95)=4.67µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=15.25µs  min=0s      med=0s       max=72.08ms  p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=110.54ms min=2.41ms  med=99.81ms  max=777.41ms p(90)=215.26ms p(95)=252.05ms p(99.9)=478.97ms
       { expected_response:true }...: avg=110.54ms min=2.41ms  med=99.81ms  max=777.41ms p(90)=215.26ms p(95)=252.05ms p(99.9)=478.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128754
     http_req_receiving.............: avg=2.16ms   min=51.98µs med=112.71µs max=613.33ms p(90)=1.26ms   p(95)=4.22ms   p(99.9)=159.94ms
     http_req_sending...............: avg=68.06µs  min=5.13µs  med=9.79µs   max=88.31ms  p(90)=18.37µs  p(95)=123.11µs p(99.9)=9.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.31ms min=2.32ms  med=98.62ms  max=663.61ms p(90)=212.24ms p(95)=244.91ms p(99.9)=427.8ms 
     http_reqs......................: 128754  2049.032564/s
     iteration_duration.............: avg=111.69ms min=3.75ms  med=101.22ms max=777.63ms p(90)=215.96ms p(95)=253.04ms p(99.9)=480.47ms
     iterations.....................: 127754  2033.118243/s
     success_rate...................: 100.00% ✓ 127754      ✗ 0     
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

     checks.........................: 100.00% ✓ 224937      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=10.49µs  min=1.06µs med=2.4µs    max=23.75ms  p(90)=3.92µs   p(95)=4.78µs   p(99.9)=513.62µs
     http_req_connecting............: avg=7.36µs   min=0s     med=0s       max=23.58ms  p(90)=0s       p(95)=0s       p(99.9)=431.2µs 
     http_req_duration..............: avg=187.75ms min=2.04ms med=188.9ms  max=628.03ms p(90)=349.03ms p(95)=376.46ms p(99.9)=485.17ms
       { expected_response:true }...: avg=187.75ms min=2.04ms med=188.9ms  max=628.03ms p(90)=349.03ms p(95)=376.46ms p(99.9)=485.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75979
     http_req_receiving.............: avg=83.74µs  min=29.1µs med=59.5µs   max=190.91ms p(90)=93.3µs   p(95)=107.63µs p(99.9)=2ms     
     http_req_sending...............: avg=44.75µs  min=5.15µs med=10.45µs  max=183.33ms p(90)=16.29µs  p(95)=19.78µs  p(99.9)=5.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.62ms min=1.98ms med=188.76ms max=627.88ms p(90)=348.94ms p(95)=376.37ms p(99.9)=485.1ms 
     http_reqs......................: 75979   1216.583109/s
     iteration_duration.............: avg=190.51ms min=5.25ms med=191.74ms max=628.27ms p(90)=350.07ms p(95)=377.08ms p(99.9)=485.35ms
     iterations.....................: 74979   1200.571012/s
     success_rate...................: 100.00% ✓ 74979       ✗ 0    
     vus............................: 78      min=0         max=493
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

     checks.........................: 100.00% ✓ 90978      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   578 kB/s
     http_req_blocked...............: avg=9.5µs    min=1.21µs  med=3.06µs   max=9.97ms  p(90)=4.83µs   p(95)=5.88µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=5.39µs   min=0s      med=0s       max=9.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=458.57ms min=4.03ms  med=426ms    max=1.89s   p(90)=903.38ms p(95)=976.68ms p(99.9)=1.45s   
       { expected_response:true }...: avg=458.57ms min=4.03ms  med=426ms    max=1.89s   p(90)=903.38ms p(95)=976.68ms p(99.9)=1.45s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31326
     http_req_receiving.............: avg=96.32µs  min=33.2µs  med=78.31µs  max=129.6ms p(90)=114.26µs p(95)=126.65µs p(99.9)=887.18µs
     http_req_sending...............: avg=27.19µs  min=5.85µs  med=13.91µs  max=75.75ms p(90)=20.9µs   p(95)=24.27µs  p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=458.45ms min=3.97ms  med=425.89ms max=1.89s   p(90)=903.2ms  p(95)=976.55ms p(99.9)=1.45s   
     http_reqs......................: 31326   481.845891/s
     iteration_duration.............: avg=473.91ms min=28.02ms med=445.06ms max=1.89s   p(90)=906.96ms p(95)=980.25ms p(99.9)=1.45s   
     iterations.....................: 30326   466.464231/s
     success_rate...................: 100.00% ✓ 30326      ✗ 0    
     vus............................: 57      min=0        max=499
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

     checks.........................: 100.00% ✓ 43521      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=14.12µs  min=1.3µs   med=3.63µs   max=5.64ms  p(90)=5.45µs   p(95)=7.19µs   p(99.9)=2.32ms
     http_req_connecting............: avg=8.82µs   min=0s      med=0s       max=5.58ms  p(90)=0s       p(95)=0s       p(99.9)=2.29ms
     http_req_duration..............: avg=910.35ms min=6.23ms  med=811.21ms max=20.19s  p(90)=1.55s    p(95)=1.7s     p(99.9)=18.09s
       { expected_response:true }...: avg=910.35ms min=6.23ms  med=811.21ms max=20.19s  p(90)=1.55s    p(95)=1.7s     p(99.9)=18.09s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15507
     http_req_receiving.............: avg=156.64µs min=37.61µs med=95.5µs   max=87.1ms  p(90)=135.89µs p(95)=149.42µs p(99.9)=6.9ms 
     http_req_sending...............: avg=29.22µs  min=6.38µs  med=16.7µs   max=18.05ms p(90)=22.85µs  p(95)=27.92µs  p(99.9)=2.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=910.16ms min=6.1ms   med=811.12ms max=20.19s  p(90)=1.55s    p(95)=1.7s     p(99.9)=18.09s
     http_reqs......................: 15507   227.215525/s
     iteration_duration.............: avg=973.05ms min=41.97ms med=891.35ms max=20.19s  p(90)=1.57s    p(95)=1.72s    p(99.9)=18.12s
     iterations.....................: 14507   212.563076/s
     success_rate...................: 100.00% ✓ 14507      ✗ 0    
     vus............................: 60      min=0        max=498
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

     checks.........................: 100.00% ✓ 42402      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=17.58µs  min=1.05µs  med=3.37µs   max=19.32ms p(90)=5.03µs   p(95)=6.62µs   p(99.9)=2.99ms  
     http_req_connecting............: avg=12.32µs  min=0s      med=0s       max=19.27ms p(90)=0s       p(95)=0s       p(99.9)=2.94ms  
     http_req_duration..............: avg=479.69ms min=8.38ms  med=563.91ms max=1.32s   p(90)=796.21ms p(95)=857.83ms p(99.9)=1.17s   
       { expected_response:true }...: avg=479.69ms min=8.38ms  med=563.91ms max=1.32s   p(90)=796.21ms p(95)=857.83ms p(99.9)=1.17s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15134
     http_req_receiving.............: avg=96.24µs  min=32.27µs med=90.17µs  max=9.5ms   p(90)=128.55µs p(95)=142.01µs p(99.9)=910.23µs
     http_req_sending...............: avg=30.7µs   min=5.94µs  med=15.94µs  max=57.95ms p(90)=21.93µs  p(95)=26.94µs  p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=479.57ms min=8.27ms  med=563.81ms max=1.32s   p(90)=796.09ms p(95)=857.71ms p(99.9)=1.17s   
     http_reqs......................: 15134   203.830911/s
     iteration_duration.............: avg=513.51ms min=14.75ms med=602.8ms  max=1.33s   p(90)=803.23ms p(95)=866.49ms p(99.9)=1.19s   
     iterations.....................: 14134   190.362502/s
     success_rate...................: 100.00% ✓ 14134      ✗ 0    
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

     checks.........................: 100.00% ✓ 429705      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=22.89µs min=1.01µs  med=2.49µs  max=80.48ms  p(90)=4.35µs   p(95)=5.72µs   p(99.9)=2.66ms  
     http_req_connecting............: avg=19.3µs  min=0s      med=0s      max=80.43ms  p(90)=0s       p(95)=0s       p(99.9)=2.52ms  
     http_req_duration..............: avg=98.58ms min=1.66ms  med=93.03ms max=328.85ms p(90)=192.01ms p(95)=208.67ms p(99.9)=257.36ms
       { expected_response:true }...: avg=98.58ms min=1.66ms  med=93.03ms max=328.85ms p(90)=192.01ms p(95)=208.67ms p(99.9)=257.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144235
     http_req_receiving.............: avg=254.9µs min=27.67µs med=60.13µs max=180.41ms p(90)=202.01µs p(95)=436.42µs p(99.9)=26.16ms 
     http_req_sending...............: avg=81.18µs min=5.44µs  med=10.94µs max=169.3ms  p(90)=22.3µs   p(95)=142.86µs p(99.9)=10.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.25ms min=1.6ms   med=92.72ms max=328.16ms p(90)=191.37ms p(95)=208.11ms p(99.9)=255.99ms
     http_reqs......................: 144235  2321.942305/s
     iteration_duration.............: avg=99.56ms min=4.1ms   med=94.08ms max=364.59ms p(90)=192.54ms p(95)=209.12ms p(99.9)=259.11ms
     iterations.....................: 143235  2305.843977/s
     success_rate...................: 100.00% ✓ 143235      ✗ 0     
     vus............................: 62      min=0         max=497 
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

     checks.........................: 100.00% ✓ 352950      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=18.15µs  min=962ns   med=2.35µs   max=65.3ms   p(90)=3.88µs   p(95)=4.92µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=15µs     min=0s      med=0s       max=65.23ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=119.96ms min=1.77ms  med=105.41ms max=1.88s    p(90)=227.26ms p(95)=262.37ms p(99.9)=1.49s   
       { expected_response:true }...: avg=119.96ms min=1.77ms  med=105.41ms max=1.88s    p(90)=227.26ms p(95)=262.37ms p(99.9)=1.49s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 118650
     http_req_receiving.............: avg=1.68ms   min=50.44µs med=112.72µs max=335.71ms p(90)=1.54ms   p(95)=4.4ms    p(99.9)=140.25ms
     http_req_sending...............: avg=63.71µs  min=5.15µs  med=9.87µs   max=57.64ms  p(90)=19.23µs  p(95)=121.83µs p(99.9)=9.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.21ms min=1.69ms  med=104.37ms max=1.88s    p(90)=224.66ms p(95)=257.34ms p(99.9)=1.49s   
     http_reqs......................: 118650  1908.486349/s
     iteration_duration.............: avg=121.26ms min=2.91ms  med=106.79ms max=1.88s    p(90)=228.01ms p(95)=263.23ms p(99.9)=1.49s   
     iterations.....................: 117650  1892.40134/s
     success_rate...................: 100.00% ✓ 117650      ✗ 0     
     vus............................: 66      min=0         max=496 
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

     checks.........................: 100.00% ✓ 213795      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.25µs   min=1.03µs  med=2.52µs   max=15.54ms  p(90)=4.3µs    p(95)=5.27µs   p(99.9)=575.84µs
     http_req_connecting............: avg=2.99µs   min=0s      med=0s       max=15.47ms  p(90)=0s       p(95)=0s       p(99.9)=480.37µs
     http_req_duration..............: avg=197.46ms min=2.1ms   med=198.58ms max=617.85ms p(90)=362.55ms p(95)=388.64ms p(99.9)=522.79ms
       { expected_response:true }...: avg=197.46ms min=2.1ms   med=198.58ms max=617.85ms p(90)=362.55ms p(95)=388.64ms p(99.9)=522.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72265
     http_req_receiving.............: avg=87.68µs  min=29.46µs med=65.43µs  max=148.54ms p(90)=104.45µs p(95)=121.73µs p(99.9)=1.89ms  
     http_req_sending...............: avg=33.61µs  min=5.12µs  med=11.55µs  max=177.78ms p(90)=18.59µs  p(95)=22.66µs  p(99.9)=3.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.33ms min=2.03ms  med=198.44ms max=617.76ms p(90)=362.46ms p(95)=388.54ms p(99.9)=522.71ms
     http_reqs......................: 72265   1154.725149/s
     iteration_duration.............: avg=200.48ms min=5.3ms   med=202.01ms max=618.03ms p(90)=363.39ms p(95)=389.4ms  p(99.9)=523.32ms
     iterations.....................: 71265   1138.746112/s
     success_rate...................: 100.00% ✓ 71265       ✗ 0    
     vus............................: 85      min=0         max=498
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

     checks.........................: 100.00% ✓ 89157      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   565 kB/s
     http_req_blocked...............: avg=9.49µs   min=1.19µs  med=3.44µs   max=29.83ms  p(90)=5.31µs   p(95)=6.34µs   p(99.9)=907.27µs
     http_req_connecting............: avg=4.96µs   min=0s      med=0s       max=29.77ms  p(90)=0s       p(95)=0s       p(99.9)=824.11µs
     http_req_duration..............: avg=467.51ms min=4.21ms  med=440.86ms max=1.77s    p(90)=914.25ms p(95)=992.55ms p(99.9)=1.45s   
       { expected_response:true }...: avg=467.51ms min=4.21ms  med=440.86ms max=1.77s    p(90)=914.25ms p(95)=992.55ms p(99.9)=1.45s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30719
     http_req_receiving.............: avg=100.19µs min=30.81µs med=83.85µs  max=106.25ms p(90)=120.81µs p(95)=134.73µs p(99.9)=1.02ms  
     http_req_sending...............: avg=34.09µs  min=5.77µs  med=15.23µs  max=137.35ms p(90)=22.43µs  p(95)=25.78µs  p(99.9)=2.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=467.38ms min=4.13ms  med=440.74ms max=1.77s    p(90)=914.15ms p(95)=992.43ms p(99.9)=1.45s   
     http_reqs......................: 30719   470.423489/s
     iteration_duration.............: avg=483.49ms min=30.81ms med=459.14ms max=1.77s    p(90)=919.72ms p(95)=995.96ms p(99.9)=1.45s   
     iterations.....................: 29719   455.109726/s
     success_rate...................: 100.00% ✓ 29719      ✗ 0    
     vus............................: 70      min=0        max=495
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

     checks.........................: 100.00% ✓ 42933      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   269 kB/s
     http_req_blocked...............: avg=19.18µs  min=1.32µs  med=3.97µs   max=27.59ms  p(90)=5.93µs   p(95)=7.67µs   p(99.9)=2.69ms  
     http_req_connecting............: avg=13.35µs  min=0s      med=0s       max=27.53ms  p(90)=0s       p(95)=0s       p(99.9)=2.66ms  
     http_req_duration..............: avg=953.83ms min=6.31ms  med=859.68ms max=5.54s    p(90)=1.9s     p(95)=2.1s     p(99.9)=5.05s   
       { expected_response:true }...: avg=953.83ms min=6.31ms  med=859.68ms max=5.54s    p(90)=1.9s     p(95)=2.1s     p(99.9)=5.05s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15311
     http_req_receiving.............: avg=127.78µs min=36.04µs med=103.11µs max=167.34ms p(90)=142.99µs p(95)=156.18µs p(99.9)=945.37µs
     http_req_sending...............: avg=38.66µs  min=6.51µs  med=18.65µs  max=63.87ms  p(90)=24.7µs   p(95)=30.17µs  p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=953.66ms min=6.19ms  med=859.5ms  max=5.54s    p(90)=1.89s    p(95)=2.1s     p(99.9)=5.05s   
     http_reqs......................: 15311   224.36301/s
     iteration_duration.............: avg=1.02s    min=54.3ms  med=940.68ms max=5.56s    p(90)=1.91s    p(95)=2.11s    p(99.9)=5.08s   
     iterations.....................: 14311   209.709297/s
     success_rate...................: 100.00% ✓ 14311      ✗ 0    
     vus............................: 67      min=0        max=500
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

     checks.........................: 100.00% ✓ 39519      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   243 kB/s
     http_req_blocked...............: avg=16.19µs  min=1.28µs  med=3.49µs   max=19.22ms p(90)=5.26µs   p(95)=7.41µs   p(99.9)=2.12ms
     http_req_connecting............: avg=10.64µs  min=0s      med=0s       max=19.15ms p(90)=0s       p(95)=0s       p(99.9)=1.99ms
     http_req_duration..............: avg=1.02s    min=8.7ms   med=954.53ms max=4.37s   p(90)=2.07s    p(95)=2.22s    p(99.9)=3.93s 
       { expected_response:true }...: avg=1.02s    min=8.7ms   med=954.53ms max=4.37s   p(90)=2.07s    p(95)=2.22s    p(99.9)=3.93s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14173
     http_req_receiving.............: avg=106.38µs min=35.03µs med=94.84µs  max=60.09ms p(90)=135.78µs p(95)=148.31µs p(99.9)=1.08ms
     http_req_sending...............: avg=33.33µs  min=6.06µs  med=17.34µs  max=14.1ms  p(90)=23.51µs  p(95)=29µs     p(99.9)=4.26ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.02s    min=8.59ms  med=954.35ms max=4.37s   p(90)=2.07s    p(95)=2.22s    p(99.9)=3.93s 
     http_reqs......................: 14173   202.70917/s
     iteration_duration.............: avg=1.1s     min=41.09ms med=1.04s    max=4.38s   p(90)=2.1s     p(95)=2.23s    p(99.9)=3.97s 
     iterations.....................: 13173   188.406681/s
     success_rate...................: 100.00% ✓ 13173      ✗ 0    
     vus............................: 30      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

