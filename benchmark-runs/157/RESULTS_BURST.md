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
| hive-router | v0.0.49 | 2,676 | 2,792 | 2,628 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.7 | 2,032 | 2,092 | 2,014 | 1.2% |  |
| cosmo | 0.307.0 | 1,200 | 1,200 | 1,187 | 0.8% | non-compatible response (13 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 494 | 499 | 487 | 0.7% |  |
| hive-gateway | 2.5.25 | 234 | 238 | 232 | 0.9% |  |
| apollo-gateway | 2.13.3 | 201 | 206 | 200 | 1.0% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (18209 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (460589 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,190 | 2,303 | 2,149 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.7 | 1,897 | 1,939 | 1,887 | 1.0% |  |
| cosmo | 0.307.0 | 1,098 | 1,106 | 1,095 | 0.5% | non-compatible response (12 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 460 | 469 | 455 | 1.2% |  |
| hive-gateway | 2.5.25 | 227 | 229 | 224 | 0.7% |  |
| apollo-gateway | 2.13.3 | 202 | 205 | 201 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (11200 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (249917 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 493842      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=28.12µs  min=942ns   med=2.34µs  max=73.73ms  p(90)=3.91µs   p(95)=5.04µs   p(99.9)=5.84ms  
     http_req_connecting............: avg=24.15µs  min=0s      med=0s      max=73.63ms  p(90)=0s       p(95)=0s       p(99.9)=4.98ms  
     http_req_duration..............: avg=85.76ms  min=1.66ms  med=78.86ms max=327.75ms p(90)=169.29ms p(95)=183.48ms p(99.9)=237.01ms
       { expected_response:true }...: avg=85.76ms  min=1.66ms  med=78.86ms max=327.75ms p(90)=169.29ms p(95)=183.48ms p(99.9)=237.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165614
     http_req_receiving.............: avg=340.44µs min=27.52µs med=56.85µs max=97.88ms  p(90)=218.06µs p(95)=414.07µs p(99.9)=41.92ms 
     http_req_sending...............: avg=90.71µs  min=5.32µs  med=9.96µs  max=159.5ms  p(90)=18.74µs  p(95)=132.5µs  p(99.9)=13.93ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.33ms  min=1.61ms  med=78.5ms  max=327.18ms p(90)=168.53ms p(95)=182.63ms p(99.9)=234.06ms
     http_reqs......................: 165614  2676.385369/s
     iteration_duration.............: avg=86.59ms  min=2.31ms  med=79.71ms max=367.33ms p(90)=169.83ms p(95)=183.97ms p(99.9)=238.75ms
     iterations.....................: 164614  2660.224988/s
     success_rate...................: 100.00% ✓ 164614      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 379941      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=11.94µs  min=1.01µs  med=2.19µs   max=41.47ms  p(90)=3.47µs   p(95)=4.35µs   p(99.9)=983.7µs 
     http_req_connecting............: avg=9.05µs   min=0s      med=0s       max=41.42ms  p(90)=0s       p(95)=0s       p(99.9)=906.2µs 
     http_req_duration..............: avg=111.52ms min=2.42ms  med=107.17ms max=623.52ms p(90)=212.96ms p(95)=234.34ms p(99.9)=361.5ms 
       { expected_response:true }...: avg=111.52ms min=2.42ms  med=107.17ms max=623.52ms p(90)=212.96ms p(95)=234.34ms p(99.9)=361.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 127647
     http_req_receiving.............: avg=1.22ms   min=51.87µs med=154.13µs max=255.01ms p(90)=1.33ms   p(95)=3.33ms   p(99.9)=98.09ms 
     http_req_sending...............: avg=61.15µs  min=5.32µs  med=9.45µs   max=227.21ms p(90)=17.47µs  p(95)=118.5µs  p(99.9)=8.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.24ms min=2.32ms  med=106ms    max=623.41ms p(90)=211.25ms p(95)=231.43ms p(99.9)=355.47ms
     http_reqs......................: 127647  2032.059106/s
     iteration_duration.............: avg=112.65ms min=3.77ms  med=108.47ms max=623.73ms p(90)=213.54ms p(95)=234.91ms p(99.9)=362.38ms
     iterations.....................: 126647  2016.139741/s
     success_rate...................: 100.00% ✓ 126647      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 222165      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=7.38µs   min=1.04µs  med=2.6µs    max=14.7ms   p(90)=4.22µs   p(95)=5.13µs   p(99.9)=615.3µs 
     http_req_connecting............: avg=4.04µs   min=0s      med=0s       max=14.61ms  p(90)=0s       p(95)=0s       p(99.9)=555.43µs
     http_req_duration..............: avg=190.1ms  min=2.07ms  med=191.78ms max=541.75ms p(90)=350.84ms p(95)=376.76ms p(99.9)=463.57ms
       { expected_response:true }...: avg=190.1ms  min=2.07ms  med=191.78ms max=541.75ms p(90)=350.84ms p(95)=376.76ms p(99.9)=463.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75055
     http_req_receiving.............: avg=78.84µs  min=30.35µs med=62.92µs  max=45.27ms  p(90)=98.58µs  p(95)=113.29µs p(99.9)=1.66ms  
     http_req_sending...............: avg=35.26µs  min=5.25µs  med=11.34µs  max=136.05ms p(90)=17.59µs  p(95)=21.4µs   p(99.9)=4.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.99ms min=2.01ms  med=191.61ms max=541.67ms p(90)=350.7ms  p(95)=376.62ms p(99.9)=463.5ms 
     http_reqs......................: 75055   1200.306916/s
     iteration_duration.............: avg=192.91ms min=4.7ms   med=195.03ms max=541.91ms p(90)=351.65ms p(95)=377.47ms p(99.9)=463.95ms
     iterations.....................: 74055   1184.314551/s
     success_rate...................: 100.00% ✓ 74055       ✗ 0    
     vus............................: 82      min=0         max=496
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

     checks.........................: 100.00% ✓ 93099      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   594 kB/s
     http_req_blocked...............: avg=9.07µs   min=1.07µs  med=2.84µs   max=25.18ms p(90)=4.55µs   p(95)=5.62µs   p(99.9)=1ms     
     http_req_connecting............: avg=5.06µs   min=0s      med=0s       max=24.89ms p(90)=0s       p(95)=0s       p(99.9)=826.03µs
     http_req_duration..............: avg=448.4ms  min=3.92ms  med=420.12ms max=1.96s   p(90)=889.07ms p(95)=958.21ms p(99.9)=1.4s    
       { expected_response:true }...: avg=448.4ms  min=3.92ms  med=420.12ms max=1.96s   p(90)=889.07ms p(95)=958.21ms p(99.9)=1.4s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 32033
     http_req_receiving.............: avg=85.36µs  min=32.3µs  med=75µs     max=31.67ms p(90)=110.15µs p(95)=122.92µs p(99.9)=948.04µs
     http_req_sending...............: avg=24.04µs  min=5.72µs  med=13µs     max=38.19ms p(90)=20.15µs  p(95)=23.33µs  p(99.9)=2.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.29ms min=3.81ms  med=420.02ms max=1.96s   p(90)=888.97ms p(95)=958.1ms  p(99.9)=1.4s    
     http_reqs......................: 32033   494.691529/s
     iteration_duration.............: avg=463.08ms min=26.06ms med=437.44ms max=1.96s   p(90)=892.61ms p(95)=961.78ms p(99.9)=1.41s   
     iterations.....................: 31033   479.248344/s
     success_rate...................: 100.00% ✓ 31033      ✗ 0    
     vus............................: 95      min=0        max=500
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

     checks.........................: 100.00% ✓ 44682      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   282 kB/s
     http_req_blocked...............: avg=15.95µs  min=1.24µs med=3.66µs   max=43.95ms p(90)=5.57µs   p(95)=7.24µs   p(99.9)=1.74ms 
     http_req_connecting............: avg=10.7µs   min=0s     med=0s       max=43.87ms p(90)=0s       p(95)=0s       p(99.9)=1.71ms 
     http_req_duration..............: avg=899.4ms  min=6.03ms med=781.36ms max=17.51s  p(90)=1.62s    p(95)=1.76s    p(99.9)=15.27s 
       { expected_response:true }...: avg=899.4ms  min=6.03ms med=781.36ms max=17.51s  p(90)=1.62s    p(95)=1.76s    p(99.9)=15.27s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15894
     http_req_receiving.............: avg=107.12µs min=35.3µs med=99.95µs  max=17.53ms p(90)=139.51µs p(95)=152.73µs p(99.9)=736.5µs
     http_req_sending...............: avg=35.38µs  min=5.98µs med=18.38µs  max=91.97ms p(90)=24.73µs  p(95)=29.44µs  p(99.9)=2.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=899.26ms min=5.93ms med=781.24ms max=17.51s  p(90)=1.62s    p(95)=1.76s    p(99.9)=15.27s 
     http_reqs......................: 15894   234.150787/s
     iteration_duration.............: avg=959.81ms min=43.5ms med=852.7ms  max=17.51s  p(90)=1.64s    p(95)=1.77s    p(99.9)=15.28s 
     iterations.....................: 14894   219.418763/s
     success_rate...................: 100.00% ✓ 14894      ✗ 0    
     vus............................: 23      min=0        max=500
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

     checks.........................: 100.00% ✓ 41853      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   247 kB/s
     http_req_blocked...............: avg=17.92µs  min=1.35µs  med=3.46µs   max=42.09ms p(90)=5.09µs   p(95)=6.57µs   p(99.9)=2.4ms 
     http_req_connecting............: avg=12.73µs  min=0s      med=0s       max=42.03ms p(90)=0s       p(95)=0s       p(99.9)=2.37ms
     http_req_duration..............: avg=473.71ms min=8.4ms   med=571.05ms max=1.35s   p(90)=782.63ms p(95)=842.21ms p(99.9)=1.18s 
       { expected_response:true }...: avg=473.71ms min=8.4ms   med=571.05ms max=1.35s   p(90)=782.63ms p(95)=842.21ms p(99.9)=1.18s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14951
     http_req_receiving.............: avg=107.2µs  min=36.43µs med=92.68µs  max=59.09ms p(90)=132.7µs  p(95)=145.57µs p(99.9)=1ms   
     http_req_sending...............: avg=32.33µs  min=6.13µs  med=16.61µs  max=50.68ms p(90)=22.96µs  p(95)=27.7µs   p(99.9)=3.63ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=473.57ms min=8.28ms  med=570.95ms max=1.35s   p(90)=782.55ms p(95)=842.07ms p(99.9)=1.18s 
     http_reqs......................: 14951   201.192427/s
     iteration_duration.............: avg=507.51ms min=15.32ms med=597.14ms max=1.36s   p(90)=789.32ms p(95)=856.36ms p(99.9)=1.19s 
     iterations.....................: 13951   187.73564/s
     success_rate...................: 100.00% ✓ 13951      ✗ 0    
     vus............................: 58      min=0        max=494
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

     checks.........................: 100.00% ✓ 405174      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=18.01µs  min=1µs     med=2.58µs   max=67.86ms  p(90)=4.41µs   p(95)=5.7µs    p(99.9)=2.1ms   
     http_req_connecting............: avg=14.69µs  min=0s      med=0s       max=67.62ms  p(90)=0s       p(95)=0s       p(99.9)=2.04ms  
     http_req_duration..............: avg=104.56ms min=1.67ms  med=99.05ms  max=329.01ms p(90)=201.55ms p(95)=219.19ms p(99.9)=272.75ms
       { expected_response:true }...: avg=104.56ms min=1.67ms  med=99.05ms  max=329.01ms p(90)=201.55ms p(95)=219.19ms p(99.9)=272.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136058
     http_req_receiving.............: avg=201.44µs min=28.03µs med=60.97µs  max=183.98ms p(90)=167.36µs p(95)=410.78µs p(99.9)=22.82ms 
     http_req_sending...............: avg=72.8µs   min=5.42µs  med=11.15µs  max=93.22ms  p(90)=21.21µs  p(95)=136.01µs p(99.9)=9.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.29ms min=1.57ms  med=98.82ms  max=328.34ms p(90)=201.18ms p(95)=218.74ms p(99.9)=269.01ms
     http_reqs......................: 136058  2190.116965/s
     iteration_duration.............: avg=105.61ms min=5.05ms  med=100.26ms max=367.96ms p(90)=202.16ms p(95)=219.67ms p(99.9)=273.92ms
     iterations.....................: 135058  2174.020029/s
     success_rate...................: 100.00% ✓ 135058      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 351645      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=12.2µs   min=1.02µs  med=2.33µs   max=56.63ms  p(90)=3.89µs   p(95)=4.94µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=9.23µs   min=0s      med=0s       max=56.56ms  p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=120.43ms min=1.8ms   med=114.09ms max=780.6ms  p(90)=227.92ms p(95)=250.95ms p(99.9)=622.31ms
       { expected_response:true }...: avg=120.43ms min=1.8ms   med=114.09ms max=780.6ms  p(90)=227.92ms p(95)=250.95ms p(99.9)=622.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118215
     http_req_receiving.............: avg=1.32ms   min=52.62µs med=154.49µs max=295.28ms p(90)=1.63ms   p(95)=3.7ms    p(99.9)=100.47ms
     http_req_sending...............: avg=54.18µs  min=5.33µs  med=9.89µs   max=192.93ms p(90)=18.98µs  p(95)=117.23µs p(99.9)=7.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.05ms min=1.71ms  med=112.63ms max=780.45ms p(90)=226.12ms p(95)=248.31ms p(99.9)=621.81ms
     http_reqs......................: 118215  1897.798596/s
     iteration_duration.............: avg=121.72ms min=3.34ms  med=115.64ms max=780.81ms p(90)=228.55ms p(95)=251.6ms  p(99.9)=622.64ms
     iterations.....................: 117215  1881.744808/s
     success_rate...................: 100.00% ✓ 117215      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 203592      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=6.94µs   min=1.06µs  med=2.84µs   max=14.46ms  p(90)=4.63µs   p(95)=5.6µs    p(99.9)=641.63µs
     http_req_connecting............: avg=3.29µs   min=0s      med=0s       max=14.4ms   p(90)=0s       p(95)=0s       p(99.9)=559.61µs
     http_req_duration..............: avg=207.23ms min=2.13ms  med=206.61ms max=630.92ms p(90)=381.75ms p(95)=410.53ms p(99.9)=544.16ms
       { expected_response:true }...: avg=207.23ms min=2.13ms  med=206.61ms max=630.92ms p(90)=381.75ms p(95)=410.53ms p(99.9)=544.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68864
     http_req_receiving.............: avg=82µs     min=29.83µs med=68.17µs  max=50.66ms  p(90)=105.43µs p(95)=120.95µs p(99.9)=1.15ms  
     http_req_sending...............: avg=33.57µs  min=5.46µs  med=12.33µs  max=251.81ms p(90)=19.21µs  p(95)=22.82µs  p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.12ms min=2.06ms  med=206.48ms max=630.84ms p(90)=381.65ms p(95)=410.43ms p(99.9)=544.08ms
     http_reqs......................: 68864   1098.430491/s
     iteration_duration.............: avg=210.54ms min=4.78ms  med=210.33ms max=631.08ms p(90)=382.79ms p(95)=411.35ms p(99.9)=544.52ms
     iterations.....................: 67864   1082.479769/s
     success_rate...................: 100.00% ✓ 67864       ✗ 0    
     vus............................: 89      min=0         max=499
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

     checks.........................: 100.00% ✓ 87165      ✗ 0    
     data_received..................: 2.6 GB  40 MB/s
     data_sent......................: 36 MB   553 kB/s
     http_req_blocked...............: avg=9.6µs    min=1.17µs  med=3.08µs   max=10.76ms  p(90)=4.82µs   p(95)=5.76µs   p(99.9)=1.71ms
     http_req_connecting............: avg=5.48µs   min=0s      med=0s       max=10.7ms   p(90)=0s       p(95)=0s       p(99.9)=1.56ms
     http_req_duration..............: avg=477.87ms min=4.24ms  med=443.89ms max=2.02s    p(90)=940ms    p(95)=1.02s    p(99.9)=1.56s 
       { expected_response:true }...: avg=477.87ms min=4.24ms  med=443.89ms max=2.02s    p(90)=940ms    p(95)=1.02s    p(99.9)=1.56s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30055
     http_req_receiving.............: avg=92.07µs  min=33.75µs med=80.97µs  max=31.09ms  p(90)=117.29µs p(95)=130.76µs p(99.9)=1.46ms
     http_req_sending...............: avg=32.73µs  min=5.84µs  med=13.86µs  max=130.19ms p(90)=21.14µs  p(95)=24.39µs  p(99.9)=2.29ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=477.74ms min=4.17ms  med=443.76ms max=2.02s    p(90)=939.85ms p(95)=1.02s    p(99.9)=1.56s 
     http_reqs......................: 30055   460.244787/s
     iteration_duration.............: avg=494.53ms min=20.18ms med=462.51ms max=2.03s    p(90)=944.33ms p(95)=1.02s    p(99.9)=1.57s 
     iterations.....................: 29055   444.931369/s
     success_rate...................: 100.00% ✓ 29055      ✗ 0    
     vus............................: 71      min=0        max=495
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

     checks.........................: 100.00% ✓ 43584      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   273 kB/s
     http_req_blocked...............: avg=17.1µs   min=1.33µs  med=3.83µs   max=22.13ms p(90)=5.81µs   p(95)=7.73µs   p(99.9)=2.78ms
     http_req_connecting............: avg=11.49µs  min=0s      med=0s       max=22.07ms p(90)=0s       p(95)=0s       p(99.9)=2.75ms
     http_req_duration..............: avg=940.05ms min=6.34ms  med=863.98ms max=6.28s   p(90)=1.83s    p(95)=2.06s    p(99.9)=4.96s 
       { expected_response:true }...: avg=940.05ms min=6.34ms  med=863.98ms max=6.28s   p(90)=1.83s    p(95)=2.06s    p(99.9)=4.96s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15528
     http_req_receiving.............: avg=108.37µs min=38.05µs med=101.51µs max=5.93ms  p(90)=141.53µs p(95)=153.91µs p(99.9)=1.26ms
     http_req_sending...............: avg=29.67µs  min=6.51µs  med=18.91µs  max=9.9ms   p(90)=25.04µs  p(95)=30.73µs  p(99.9)=2.81ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=939.92ms min=6.23ms  med=863.88ms max=6.28s   p(90)=1.83s    p(95)=2.06s    p(99.9)=4.96s 
     http_reqs......................: 15528   227.392543/s
     iteration_duration.............: avg=1s       min=54.43ms med=944.46ms max=6.29s   p(90)=1.85s    p(95)=2.09s    p(99.9)=5.01s 
     iterations.....................: 14528   212.74851/s
     success_rate...................: 100.00% ✓ 14528      ✗ 0    
     vus............................: 72      min=0        max=500
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

     checks.........................: 100.00% ✓ 39654      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   243 kB/s
     http_req_blocked...............: avg=16.53µs  min=1.37µs  med=3.63µs   max=33.19ms  p(90)=5.37µs   p(95)=7.08µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=11.07µs  min=0s      med=0s       max=33.12ms  p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=1.02s    min=8.88ms  med=931.45ms max=4.43s    p(90)=2.08s    p(95)=2.2s     p(99.9)=3.92s   
       { expected_response:true }...: avg=1.02s    min=8.88ms  med=931.45ms max=4.43s    p(90)=2.08s    p(95)=2.2s     p(99.9)=3.92s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14218
     http_req_receiving.............: avg=103.95µs min=38.97µs med=97.7µs   max=6.58ms   p(90)=139.01µs p(95)=152.51µs p(99.9)=740.14µs
     http_req_sending...............: avg=46.31µs  min=6.32µs  med=18.03µs  max=139.73ms p(90)=23.67µs  p(95)=28.9µs   p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.02s    min=8.74ms  med=931.3ms  max=4.43s    p(90)=2.08s    p(95)=2.2s     p(99.9)=3.92s   
     http_reqs......................: 14218   202.167237/s
     iteration_duration.............: avg=1.1s     min=49.07ms med=1.03s    max=4.43s    p(90)=2.09s    p(95)=2.21s    p(99.9)=3.93s   
     iterations.....................: 13218   187.948132/s
     success_rate...................: 100.00% ✓ 13218      ✗ 0    
     vus............................: 72      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

