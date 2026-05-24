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
| hive-router | v0.0.49 | 2,783 | 2,865 | 2,733 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,093 | 2,136 | 2,064 | 1.0% |  |
| cosmo | 0.307.0 | 1,215 | 1,215 | 1,215 | 0.0% | non-compatible response (13 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 486 | 492 | 482 | 0.8% |  |
| hive-gateway | 2.5.25 | 228 | 230 | 226 | 0.7% |  |
| apollo-gateway | 2.13.3 | 200 | 206 | 199 | 1.2% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (27612 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (474342 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,264 | 2,369 | 2,213 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,905 | 1,942 | 1,885 | 1.1% |  |
| cosmo | 0.307.0 | 1,146 | 1,154 | 1,126 | 1.2% | non-compatible response (11 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 458 | 469 | 453 | 1.2% |  |
| hive-gateway | 2.5.25 | 224 | 228 | 220 | 1.2% |  |
| apollo-gateway | 2.13.3 | 206 | 208 | 202 | 1.1% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (14833 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (210325 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 513666      ✗ 0     
     data_received..................: 15 GB   244 MB/s
     data_sent......................: 207 MB  3.3 MB/s
     http_req_blocked...............: avg=34.34µs  min=992ns   med=2.2µs   max=79.27ms  p(90)=3.66µs   p(95)=4.79µs   p(99.9)=10.79ms 
     http_req_connecting............: avg=31.42µs  min=0s      med=0s      max=79.1ms   p(90)=0s       p(95)=0s       p(99.9)=10.77ms 
     http_req_duration..............: avg=82.38ms  min=1.5ms   med=77.07ms max=289.27ms p(90)=158.4ms  p(95)=178.72ms p(99.9)=250.28ms
       { expected_response:true }...: avg=82.38ms  min=1.5ms   med=77.07ms max=289.27ms p(90)=158.4ms  p(95)=178.72ms p(99.9)=250.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 172222
     http_req_receiving.............: avg=477.14µs min=27.76µs med=55.29µs max=90.85ms  p(90)=247.28µs p(95)=420.78µs p(99.9)=57.68ms 
     http_req_sending...............: avg=89.89µs  min=5.39µs  med=9.74µs  max=135.09ms p(90)=18.58µs  p(95)=131.95µs p(99.9)=14ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.81ms  min=1.45ms  med=76.67ms max=283.74ms p(90)=157.38ms p(95)=176.97ms p(99.9)=241.62ms
     http_reqs......................: 172222  2783.551345/s
     iteration_duration.............: avg=83.25ms  min=2.3ms   med=77.9ms  max=339.46ms p(90)=159.17ms p(95)=179.77ms p(99.9)=253.93ms
     iterations.....................: 171222  2767.388768/s
     success_rate...................: 100.00% ✓ 171222      ✗ 0     
     vus............................: 51      min=0         max=500 
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

     checks.........................: 100.00% ✓ 391020      ✗ 0     
     data_received..................: 12 GB   184 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=16.72µs  min=1µs     med=2.24µs   max=92.91ms  p(90)=3.63µs   p(95)=4.62µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=13.6µs   min=0s      med=0s       max=92.7ms   p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=108.35ms min=2.35ms  med=100.12ms max=595.13ms p(90)=209.74ms p(95)=241.83ms p(99.9)=448.29ms
       { expected_response:true }...: avg=108.35ms min=2.35ms  med=100.12ms max=595.13ms p(90)=209.74ms p(95)=241.83ms p(99.9)=448.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131340
     http_req_receiving.............: avg=1.66ms   min=51.43µs med=110.39µs max=422.92ms p(90)=1.21ms   p(95)=3.92ms   p(99.9)=164.24ms
     http_req_sending...............: avg=64.87µs  min=5.09µs  med=9.82µs   max=161.06ms p(90)=18.13µs  p(95)=118.36µs p(99.9)=9.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.62ms min=2.27ms  med=99.02ms  max=587.28ms p(90)=207.07ms p(95)=236.39ms p(99.9)=395.92ms
     http_reqs......................: 131340  2093.257515/s
     iteration_duration.............: avg=109.45ms min=3.59ms  med=101.41ms max=595.33ms p(90)=210.47ms p(95)=242.65ms p(99.9)=449.36ms
     iterations.....................: 130340  2077.319815/s
     success_rate...................: 100.00% ✓ 130340      ✗ 0     
     vus............................: 92      min=0         max=500 
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

     checks.........................: 100.00% ✓ 224793      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=6.23µs   min=1.01µs  med=2.15µs   max=42.81ms  p(90)=3.54µs   p(95)=4.42µs   p(99.9)=438.55µs
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=42.76ms  p(90)=0s       p(95)=0s       p(99.9)=378.96µs
     http_req_duration..............: avg=187.91ms min=2.05ms  med=189.3ms  max=638.03ms p(90)=345.16ms p(95)=370.35ms p(99.9)=534.79ms
       { expected_response:true }...: avg=187.91ms min=2.05ms  med=189.3ms  max=638.03ms p(90)=345.16ms p(95)=370.35ms p(99.9)=534.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75931
     http_req_receiving.............: avg=73.33µs  min=28.52µs med=57.85µs  max=75.73ms  p(90)=91.74µs  p(95)=104.58µs p(99.9)=1.47ms  
     http_req_sending...............: avg=35.17µs  min=5.42µs  med=10.22µs  max=225.49ms p(90)=15.75µs  p(95)=19.14µs  p(99.9)=3.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.8ms  min=1.99ms  med=189.17ms max=637.93ms p(90)=345.06ms p(95)=370.25ms p(99.9)=534.7ms 
     http_reqs......................: 75931   1215.611816/s
     iteration_duration.............: avg=190.66ms min=4.93ms  med=192.08ms max=638.2ms  p(90)=346.03ms p(95)=370.99ms p(99.9)=535.35ms
     iterations.....................: 74931   1199.602388/s
     success_rate...................: 100.00% ✓ 74931       ✗ 0    
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

     checks.........................: 100.00% ✓ 91806      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   584 kB/s
     http_req_blocked...............: avg=8.95µs   min=1.06µs med=2.53µs   max=23.67ms  p(90)=4.23µs   p(95)=5.17µs   p(99.9)=1.27ms 
     http_req_connecting............: avg=5.31µs   min=0s     med=0s       max=23.61ms  p(90)=0s       p(95)=0s       p(99.9)=1.15ms 
     http_req_duration..............: avg=454.58ms min=4.14ms med=425.38ms max=1.81s    p(90)=896.62ms p(95)=969.97ms p(99.9)=1.41s  
       { expected_response:true }...: avg=454.58ms min=4.14ms med=425.38ms max=1.81s    p(90)=896.62ms p(95)=969.97ms p(99.9)=1.41s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31602
     http_req_receiving.............: avg=173.88µs min=31µs   med=72.25µs  max=154.59ms p(90)=108.21µs p(95)=121.32µs p(99.9)=38.42ms
     http_req_sending...............: avg=29.36µs  min=5.72µs med=12.15µs  max=247.66ms p(90)=19.03µs  p(95)=22.43µs  p(99.9)=2.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=454.37ms min=4.08ms med=425.29ms max=1.81s    p(90)=896.55ms p(95)=969.89ms p(99.9)=1.41s  
     http_reqs......................: 31602   486.470511/s
     iteration_duration.............: avg=469.64ms min=8.05ms med=441.71ms max=1.82s    p(90)=901.47ms p(95)=973.86ms p(99.9)=1.42s  
     iterations.....................: 30602   471.076849/s
     success_rate...................: 100.00% ✓ 30602      ✗ 0    
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

     checks.........................: 100.00% ✓ 43755     ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=17.94µs  min=1.19µs  med=3.37µs   max=29.75ms p(90)=5.17µs   p(95)=6.84µs   p(99.9)=2.57ms
     http_req_connecting............: avg=12.86µs  min=0s      med=0s       max=29.67ms p(90)=0s       p(95)=0s       p(99.9)=2.55ms
     http_req_duration..............: avg=915.06ms min=6.14ms  med=790.2ms  max=18.34s  p(90)=1.59s    p(95)=1.77s    p(99.9)=16.53s
       { expected_response:true }...: avg=915.06ms min=6.14ms  med=790.2ms  max=18.34s  p(90)=1.59s    p(95)=1.77s    p(99.9)=16.53s
     http_req_failed................: 0.00%   ✓ 0         ✗ 15585
     http_req_receiving.............: avg=106.51µs min=35.3µs  med=94.63µs  max=21.7ms  p(90)=133.42µs p(95)=146.78µs p(99.9)=1.11ms
     http_req_sending...............: avg=34.78µs  min=6.18µs  med=16.94µs  max=62.11ms p(90)=23.16µs  p(95)=28.14µs  p(99.9)=2.98ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=914.92ms min=6.02ms  med=789.98ms max=18.34s  p(90)=1.59s    p(95)=1.77s    p(99.9)=16.53s
     http_reqs......................: 15585   228.93071/s
     iteration_duration.............: avg=977.85ms min=47.12ms med=851.5ms  max=18.35s  p(90)=1.62s    p(95)=1.78s    p(99.9)=16.67s
     iterations.....................: 14585   214.24154/s
     success_rate...................: 100.00% ✓ 14585     ✗ 0    
     vus............................: 62      min=0       max=499
     vus_max........................: 500     min=500     max=500
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

     checks.........................: 100.00% ✓ 41697      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=16.48µs  min=1.24µs  med=3.13µs   max=5.71ms  p(90)=4.77µs   p(95)=6.36µs   p(99.9)=3.33ms
     http_req_connecting............: avg=11.33µs  min=0s      med=0s       max=5.65ms  p(90)=0s       p(95)=0s       p(99.9)=3.26ms
     http_req_duration..............: avg=498.04ms min=8.36ms  med=563.24ms max=1.51s   p(90)=903.96ms p(95)=968.9ms  p(99.9)=1.34s 
       { expected_response:true }...: avg=498.04ms min=8.36ms  med=563.24ms max=1.51s   p(90)=903.96ms p(95)=968.9ms  p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14899
     http_req_receiving.............: avg=97.95µs  min=33.93µs med=88.33µs  max=29.85ms p(90)=128.45µs p(95)=142.19µs p(99.9)=1.19ms
     http_req_sending...............: avg=33.46µs  min=5.75µs  med=15.74µs  max=30.71ms p(90)=22.09µs  p(95)=27.29µs  p(99.9)=3.38ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=497.91ms min=8.26ms  med=563.14ms max=1.51s   p(90)=903.81ms p(95)=968.82ms p(99.9)=1.34s 
     http_reqs......................: 14899   200.586694/s
     iteration_duration.............: avg=533.71ms min=15.3ms  med=601.07ms max=1.51s   p(90)=913.19ms p(95)=977.95ms p(99.9)=1.36s 
     iterations.....................: 13899   187.123596/s
     success_rate...................: 100.00% ✓ 13899      ✗ 0    
     vus............................: 64      min=0        max=495
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

     checks.........................: 100.00% ✓ 418446      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=21.2µs   min=1µs     med=2.51µs  max=56.75ms  p(90)=4.26µs   p(95)=5.55µs   p(99.9)=2.73ms  
     http_req_connecting............: avg=17.75µs  min=0s      med=0s      max=56.58ms  p(90)=0s       p(95)=0s       p(99.9)=2.58ms  
     http_req_duration..............: avg=101.24ms min=1.62ms  med=97.75ms max=382.72ms p(90)=192.97ms p(95)=212.44ms p(99.9)=273.86ms
       { expected_response:true }...: avg=101.24ms min=1.62ms  med=97.75ms max=382.72ms p(90)=192.97ms p(95)=212.44ms p(99.9)=273.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140482
     http_req_receiving.............: avg=240.69µs min=28.64µs med=60.51µs max=225.8ms  p(90)=168.51µs p(95)=411.66µs p(99.9)=33.47ms 
     http_req_sending...............: avg=75.76µs  min=5.17µs  med=10.99µs max=56.45ms  p(90)=21.18µs  p(95)=136.13µs p(99.9)=10.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.93ms min=1.57ms  med=97.52ms max=343.82ms p(90)=192.63ms p(95)=211.74ms p(99.9)=271.35ms
     http_reqs......................: 140482  2264.920002/s
     iteration_duration.............: avg=102.26ms min=3.07ms  med=98.91ms max=394.94ms p(90)=193.6ms  p(95)=213.04ms p(99.9)=275.42ms
     iterations.....................: 139482  2248.797509/s
     success_rate...................: 100.00% ✓ 139482      ✗ 0     
     vus............................: 59      min=0         max=498 
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

     checks.........................: 100.00% ✓ 352941      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=15.17µs  min=972ns   med=2.36µs   max=62.12ms  p(90)=4.07µs   p(95)=5.21µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=11.96µs  min=0s      med=0s       max=62.02ms  p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=119.99ms min=1.83ms  med=111.99ms max=661.04ms p(90)=230.3ms  p(95)=267.15ms p(99.9)=515.84ms
       { expected_response:true }...: avg=119.99ms min=1.83ms  med=111.99ms max=661.04ms p(90)=230.3ms  p(95)=267.15ms p(99.9)=515.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118647
     http_req_receiving.............: avg=1.78ms   min=52.88µs med=113.34µs max=340.23ms p(90)=1.54ms   p(95)=4.41ms   p(99.9)=125.36ms
     http_req_sending...............: avg=66.74µs  min=5.38µs  med=10.11µs  max=314.88ms p(90)=19.99µs  p(95)=119.99µs p(99.9)=7.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.14ms min=1.75ms  med=110.84ms max=621.98ms p(90)=227.01ms p(95)=259.85ms p(99.9)=495.05ms
     http_reqs......................: 118647  1905.042584/s
     iteration_duration.............: avg=121.28ms min=3.04ms  med=113.53ms max=661.27ms p(90)=231.19ms p(95)=267.96ms p(99.9)=516.69ms
     iterations.....................: 117647  1888.986193/s
     success_rate...................: 100.00% ✓ 117647      ✗ 0     
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

     checks.........................: 100.00% ✓ 212265      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=5.47µs   min=1.03µs  med=2.34µs   max=10.88ms  p(90)=4.01µs   p(95)=4.98µs   p(99.9)=311.54µs
     http_req_connecting............: avg=2.28µs   min=0s      med=0s       max=10.81ms  p(90)=0s       p(95)=0s       p(99.9)=245.96µs
     http_req_duration..............: avg=198.9ms  min=2.07ms  med=199.74ms max=601.6ms  p(90)=366.53ms p(95)=394.07ms p(99.9)=484.57ms
       { expected_response:true }...: avg=198.9ms  min=2.07ms  med=199.74ms max=601.6ms  p(90)=366.53ms p(95)=394.07ms p(99.9)=484.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71755
     http_req_receiving.............: avg=78.38µs  min=28.79µs med=62.4µs   max=106.17ms p(90)=99.5µs   p(95)=114.61µs p(99.9)=1.43ms  
     http_req_sending...............: avg=28.03µs  min=5.45µs  med=10.64µs  max=44.87ms  p(90)=17.08µs  p(95)=20.67µs  p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.8ms  min=1.99ms  med=199.64ms max=601.5ms  p(90)=366.44ms p(95)=393.99ms p(99.9)=484.48ms
     http_reqs......................: 71755   1146.902035/s
     iteration_duration.............: avg=201.96ms min=4.39ms  med=203.27ms max=601.83ms p(90)=367.37ms p(95)=394.67ms p(99.9)=485.11ms
     iterations.....................: 70755   1130.918452/s
     success_rate...................: 100.00% ✓ 70755       ✗ 0    
     vus............................: 83      min=0         max=497
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

     checks.........................: 100.00% ✓ 86862      ✗ 0    
     data_received..................: 2.6 GB  40 MB/s
     data_sent......................: 36 MB   551 kB/s
     http_req_blocked...............: avg=11.37µs  min=1.15µs  med=2.81µs   max=33.44ms  p(90)=4.55µs   p(95)=5.49µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=7.39µs   min=0s      med=0s       max=33.38ms  p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=479.58ms min=4.06ms  med=444.11ms max=1.84s    p(90)=947.31ms p(95)=1.02s    p(99.9)=1.5s    
       { expected_response:true }...: avg=479.58ms min=4.06ms  med=444.11ms max=1.84s    p(90)=947.31ms p(95)=1.02s    p(99.9)=1.5s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 29954
     http_req_receiving.............: avg=92.08µs  min=31.47µs med=78.65µs  max=158.81ms p(90)=115.22µs p(95)=127.73µs p(99.9)=902.54µs
     http_req_sending...............: avg=35.68µs  min=5.65µs  med=13.33µs  max=100.52ms p(90)=20.43µs  p(95)=23.65µs  p(99.9)=3.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=479.45ms min=4ms     med=444.03ms max=1.84s    p(90)=947.22ms p(95)=1.02s    p(99.9)=1.5s    
     http_reqs......................: 29954   458.982532/s
     iteration_duration.............: avg=496.37ms min=20.38ms med=463.79ms max=1.84s    p(90)=951.57ms p(95)=1.03s    p(99.9)=1.51s   
     iterations.....................: 28954   443.659619/s
     success_rate...................: 100.00% ✓ 28954      ✗ 0    
     vus............................: 68      min=0        max=496
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

     checks.........................: 100.00% ✓ 43017      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   270 kB/s
     http_req_blocked...............: avg=14.77µs  min=1.2µs   med=3.52µs   max=16.85ms p(90)=5.34µs   p(95)=7.04µs   p(99.9)=1.93ms
     http_req_connecting............: avg=9.51µs   min=0s      med=0s       max=16.78ms p(90)=0s       p(95)=0s       p(99.9)=1.91ms
     http_req_duration..............: avg=950.35ms min=6.14ms  med=855.76ms max=5.37s   p(90)=1.91s    p(95)=2.08s    p(99.9)=4.82s 
       { expected_response:true }...: avg=950.35ms min=6.14ms  med=855.76ms max=5.37s   p(90)=1.91s    p(95)=2.08s    p(99.9)=4.82s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15339
     http_req_receiving.............: avg=109.24µs min=36.01µs med=99.59µs  max=47.9ms  p(90)=139.21µs p(95)=151.73µs p(99.9)=1.18ms
     http_req_sending...............: avg=37.95µs  min=6.41µs  med=17.73µs  max=49.39ms p(90)=23.65µs  p(95)=28.99µs  p(99.9)=4.38ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=950.2ms  min=6.05ms  med=855.68ms max=5.36s   p(90)=1.91s    p(95)=2.08s    p(99.9)=4.82s 
     http_reqs......................: 15339   224.911545/s
     iteration_duration.............: avg=1.01s    min=29.74ms med=928.88ms max=5.37s   p(90)=1.94s    p(95)=2.09s    p(99.9)=4.84s 
     iterations.....................: 14339   210.24882/s
     success_rate...................: 100.00% ✓ 14339      ✗ 0    
     vus............................: 61      min=0        max=499
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

     checks.........................: 100.00% ✓ 40164      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=17.09µs  min=1.31µs  med=3.38µs   max=11.08ms p(90)=5.17µs   p(95)=7.05µs   p(99.9)=2.68ms
     http_req_connecting............: avg=11.95µs  min=0s      med=0s       max=11.03ms p(90)=0s       p(95)=0s       p(99.9)=2.66ms
     http_req_duration..............: avg=1.01s    min=8.51ms  med=935.18ms max=4.11s   p(90)=2.04s    p(95)=2.17s    p(99.9)=3.64s 
       { expected_response:true }...: avg=1.01s    min=8.51ms  med=935.18ms max=4.11s   p(90)=2.04s    p(95)=2.17s    p(99.9)=3.64s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14388
     http_req_receiving.............: avg=107.83µs min=36.52µs med=94.55µs  max=41.83ms p(90)=135.54µs p(95)=148.62µs p(99.9)=1.02ms
     http_req_sending...............: avg=35.69µs  min=6.4µs   med=17.3µs   max=62.04ms p(90)=23.48µs  p(95)=29.26µs  p(99.9)=3.62ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.42ms  med=935.05ms max=4.11s   p(90)=2.04s    p(95)=2.17s    p(99.9)=3.64s 
     http_reqs......................: 14388   206.197712/s
     iteration_duration.............: avg=1.08s    min=44.4ms  med=1.03s    max=4.12s   p(90)=2.06s    p(95)=2.18s    p(99.9)=3.66s 
     iterations.....................: 13388   191.866483/s
     success_rate...................: 100.00% ✓ 13388      ✗ 0    
     vus............................: 96      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

