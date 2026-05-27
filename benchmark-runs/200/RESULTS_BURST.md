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
| hive-router | v0.0.49 | 2,847 | 2,954 | 2,816 | 1.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,057 | 2,094 | 2,033 | 1.0% |  |
| cosmo | 0.307.0 | 1,213 | 1,217 | 1,213 | 0.2% | non-compatible response (14 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 496 | 499 | 489 | 0.8% |  |
| hive-gateway | 2.5.25 | 231 | 233 | 228 | 0.7% |  |
| apollo-gateway | 2.13.3 | 199 | 204 | 197 | 1.1% | 3 failed requests across 1/9 runs |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (24039 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (442124 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,361 | 2,430 | 2,327 | 1.4% | non-compatible response (10 across 1/9 runs) |
| hotchocolate | 16.1.0-p.1.12 | 1,882 | 1,925 | 1,800 | 2.1% |  |
| cosmo | 0.307.0 | 1,125 | 1,132 | 1,106 | 1.0% | non-compatible response (11 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 465 | 473 | 458 | 1.2% |  |
| hive-gateway | 2.5.25 | 224 | 228 | 223 | 0.7% |  |
| apollo-gateway | 2.13.3 | 206 | 209 | 205 | 0.6% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (10812 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (476032 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 525612      ✗ 0     
     data_received..................: 16 GB   250 MB/s
     data_sent......................: 212 MB  3.4 MB/s
     http_req_blocked...............: avg=30.32µs  min=992ns   med=2.22µs  max=68.17ms  p(90)=3.74µs   p(95)=4.85µs   p(99.9)=4.73ms  
     http_req_connecting............: avg=27.32µs  min=0s      med=0s      max=68.1ms   p(90)=0s       p(95)=0s       p(99.9)=4.66ms  
     http_req_duration..............: avg=80.59ms  min=1.58ms  med=75.01ms max=299.37ms p(90)=156.45ms p(95)=173.58ms p(99.9)=230.59ms
       { expected_response:true }...: avg=80.59ms  min=1.58ms  med=75.01ms max=299.37ms p(90)=156.45ms p(95)=173.58ms p(99.9)=230.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176204
     http_req_receiving.............: avg=392.65µs min=26.97µs med=54.93µs max=116.37ms p(90)=257.16µs p(95)=422.5µs  p(99.9)=43.06ms 
     http_req_sending...............: avg=97.23µs  min=5.22µs  med=9.87µs  max=242.37ms p(90)=18.71µs  p(95)=134.06µs p(99.9)=16.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.1ms   min=1.53ms  med=74.66ms max=299.31ms p(90)=155.63ms p(95)=172.11ms p(99.9)=226.05ms
     http_reqs......................: 176204  2847.303806/s
     iteration_duration.............: avg=81.36ms  min=2.49ms  med=75.84ms max=336.11ms p(90)=156.97ms p(95)=174.21ms p(99.9)=233.77ms
     iterations.....................: 175204  2831.144673/s
     success_rate...................: 100.00% ✓ 175204      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 384801      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=16.33µs  min=1.01µs  med=2.15µs   max=62.65ms  p(90)=3.4µs    p(95)=4.34µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=13.57µs  min=0s      med=0s       max=62.59ms  p(90)=0s       p(95)=0s       p(99.9)=2.08ms  
     http_req_duration..............: avg=110.09ms min=2.35ms  med=97.78ms  max=761.46ms p(90)=213.06ms p(95)=252.9ms  p(99.9)=543.26ms
       { expected_response:true }...: avg=110.09ms min=2.35ms  med=97.78ms  max=761.46ms p(90)=213.06ms p(95)=252.9ms  p(99.9)=543.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129267
     http_req_receiving.............: avg=2.24ms   min=51.83µs med=114.43µs max=477.11ms p(90)=1.36ms   p(95)=4.82ms   p(99.9)=323.54ms
     http_req_sending...............: avg=64.06µs  min=5.19µs  med=9.63µs   max=231.28ms p(90)=17.39µs  p(95)=117.81µs p(99.9)=8.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.78ms min=2.27ms  med=96.69ms  max=761.01ms p(90)=209.78ms p(95)=245.04ms p(99.9)=458.9ms 
     http_reqs......................: 129267  2057.866688/s
     iteration_duration.............: avg=111.22ms min=3.62ms  med=99.2ms   max=761.67ms p(90)=213.79ms p(95)=253.71ms p(99.9)=543.66ms
     iterations.....................: 128267  2041.947183/s
     success_rate...................: 100.00% ✓ 128267      ✗ 0     
     vus............................: 96      min=0         max=500 
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

     checks.........................: 100.00% ✓ 224478      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=6.13µs   min=1.05µs  med=2.1µs    max=44.51ms  p(90)=3.5µs    p(95)=4.35µs   p(99.9)=324.09µs
     http_req_connecting............: avg=3.41µs   min=0s      med=0s       max=44.44ms  p(90)=0s       p(95)=0s       p(99.9)=260.8µs 
     http_req_duration..............: avg=188.17ms min=2.04ms  med=188.69ms max=548.95ms p(90)=349.28ms p(95)=374.7ms  p(99.9)=479.2ms 
       { expected_response:true }...: avg=188.17ms min=2.04ms  med=188.69ms max=548.95ms p(90)=349.28ms p(95)=374.7ms  p(99.9)=479.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 75826
     http_req_receiving.............: avg=76.4µs   min=29.26µs med=58.11µs  max=188.95ms p(90)=90.82µs  p(95)=103.69µs p(99.9)=1.21ms  
     http_req_sending...............: avg=28.27µs  min=5.28µs  med=10.03µs  max=58.07ms  p(90)=15.42µs  p(95)=18.94µs  p(99.9)=3.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.06ms min=1.98ms  med=188.57ms max=548.88ms p(90)=349.2ms  p(95)=374.61ms p(99.9)=479.12ms
     http_reqs......................: 75826   1213.904353/s
     iteration_duration.............: avg=190.92ms min=4.63ms  med=191.58ms max=549.18ms p(90)=350.03ms p(95)=375.36ms p(99.9)=480.2ms 
     iterations.....................: 74826   1197.895275/s
     success_rate...................: 100.00% ✓ 74826       ✗ 0    
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

     checks.........................: 100.00% ✓ 93657      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   596 kB/s
     http_req_blocked...............: avg=10.76µs  min=1.08µs  med=3µs      max=45.48ms  p(90)=4.78µs   p(95)=5.82µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=6.72µs   min=0s      med=0s       max=45.42ms  p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=445.71ms min=4.06ms  med=410.13ms max=1.78s    p(90)=884.12ms p(95)=963.77ms p(99.9)=1.42s   
       { expected_response:true }...: avg=445.71ms min=4.06ms  med=410.13ms max=1.78s    p(90)=884.12ms p(95)=963.77ms p(99.9)=1.42s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32219
     http_req_receiving.............: avg=90.2µs   min=31.83µs med=78.38µs  max=105.05ms p(90)=115.12µs p(95)=128.39µs p(99.9)=872.17µs
     http_req_sending...............: avg=26.61µs  min=5.56µs  med=13.88µs  max=65.31ms  p(90)=21.4µs   p(95)=24.62µs  p(99.9)=2.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=445.59ms min=3.99ms  med=410.03ms max=1.78s    p(90)=884.04ms p(95)=963.7ms  p(99.9)=1.42s   
     http_reqs......................: 32219   496.033042/s
     iteration_duration.............: avg=460.2ms  min=19.56ms med=428.63ms max=1.78s    p(90)=888.94ms p(95)=966.63ms p(99.9)=1.42s   
     iterations.....................: 31219   480.637374/s
     success_rate...................: 100.00% ✓ 31219      ✗ 0    
     vus............................: 54      min=0        max=499
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

     checks.........................: 100.00% ✓ 44361      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=14.81µs  min=1.21µs  med=3.6µs    max=3.98ms  p(90)=5.44µs  p(95)=7.17µs   p(99.9)=2.51ms  
     http_req_connecting............: avg=9.41µs   min=0s      med=0s       max=3.94ms  p(90)=0s      p(95)=0s       p(99.9)=2.43ms  
     http_req_duration..............: avg=900.35ms min=6ms     med=785.79ms max=18.43s  p(90)=1.57s   p(95)=1.72s    p(99.9)=16.7s   
       { expected_response:true }...: avg=900.35ms min=6ms     med=785.79ms max=18.43s  p(90)=1.57s   p(95)=1.72s    p(99.9)=16.7s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15787
     http_req_receiving.............: avg=103.96µs min=35.76µs med=98.29µs  max=15.24ms p(90)=137.6µs p(95)=150.82µs p(99.9)=757.51µs
     http_req_sending...............: avg=37.31µs  min=5.83µs  med=18.06µs  max=57.09ms p(90)=24.25µs p(95)=28.86µs  p(99.9)=3.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=900.21ms min=5.92ms  med=785.68ms max=18.43s  p(90)=1.57s   p(95)=1.72s    p(99.9)=16.7s   
     http_reqs......................: 15787   231.681321/s
     iteration_duration.............: avg=961.24ms min=43.17ms med=855.64ms max=18.43s  p(90)=1.59s   p(95)=1.73s    p(99.9)=16.76s  
     iterations.....................: 14787   217.005872/s
     success_rate...................: 100.00% ✓ 14787      ✗ 0    
     vus............................: 58      min=0        max=499
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

     checks.........................: 100.00% ✓ 41556      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   245 kB/s
     http_req_blocked...............: avg=16.05µs  min=1.24µs  med=3.31µs   max=44.32ms  p(90)=4.99µs   p(95)=6.47µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=10.93µs  min=0s      med=0s       max=44.27ms  p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=461.61ms min=8.34ms  med=532.5ms  max=1.31s    p(90)=788.35ms p(95)=841.76ms p(99.9)=1.17s   
       { expected_response:true }...: avg=461.61ms min=8.34ms  med=532.5ms  max=1.31s    p(90)=788.35ms p(95)=841.76ms p(99.9)=1.17s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14852
     http_req_receiving.............: avg=107.09µs min=37.94µs med=88.64µs  max=77.78ms  p(90)=128.37µs p(95)=141.95µs p(99.9)=929.65µs
     http_req_sending...............: avg=38.83µs  min=6.2µs   med=16.4µs   max=113.88ms p(90)=22.44µs  p(95)=27.26µs  p(99.9)=2.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=461.46ms min=8.2ms   med=532.39ms max=1.31s    p(90)=788.26ms p(95)=841.67ms p(99.9)=1.17s   
     http_reqs......................: 14852   199.945166/s
     iteration_duration.............: avg=494.83ms min=9.31ms  med=554.03ms max=1.32s    p(90)=792.64ms p(95)=847.78ms p(99.9)=1.18s   
     iterations.....................: 13852   186.482658/s
     success_rate...................: 100.00% ✓ 13852      ✗ 0    
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

     checks.........................: 100.00% ✓ 437358      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=24.56µs  min=1.04µs  med=2.45µs  max=65.34ms  p(90)=4.24µs   p(95)=5.56µs   p(99.9)=4.28ms  
     http_req_connecting............: avg=21.18µs  min=0s      med=0s      max=65.29ms  p(90)=0s       p(95)=0s       p(99.9)=4.18ms  
     http_req_duration..............: avg=96.85ms  min=1.7ms   med=91.04ms max=382.45ms p(90)=186.49ms p(95)=204.2ms  p(99.9)=261.31ms
       { expected_response:true }...: avg=96.85ms  min=1.7ms   med=91.04ms max=382.45ms p(90)=186.49ms p(95)=204.2ms  p(99.9)=261.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146786
     http_req_receiving.............: avg=269.34µs min=27.22µs med=59.77µs max=246.28ms p(90)=192.2µs  p(95)=428.43µs p(99.9)=31.58ms 
     http_req_sending...............: avg=82.42µs  min=5.29µs  med=10.71µs max=86.42ms  p(90)=21.39µs  p(95)=140.59µs p(99.9)=11.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.49ms  min=1.63ms  med=90.76ms max=296.67ms p(90)=186.02ms p(95)=203.41ms p(99.9)=259.14ms
     http_reqs......................: 146786  2361.929659/s
     iteration_duration.............: avg=97.8ms   min=2.49ms  med=92.17ms max=415.82ms p(90)=187.02ms p(95)=204.74ms p(99.9)=263.36ms
     iterations.....................: 145786  2345.838685/s
     success_rate...................: 100.00% ✓ 145786      ✗ 0     
     vus............................: 63      min=0         max=496 
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

     checks.........................: 100.00% ✓ 348651      ✗ 0     
     data_received..................: 10 GB   165 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=14.6µs   min=1µs     med=2.31µs   max=75.08ms  p(90)=3.95µs   p(95)=5.02µs   p(99.9)=1.07ms  
     http_req_connecting............: avg=11.35µs  min=0s      med=0s       max=74.9ms   p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=121.47ms min=1.8ms   med=114.04ms max=661.59ms p(90)=229.38ms p(95)=265.83ms p(99.9)=523.71ms
       { expected_response:true }...: avg=121.47ms min=1.8ms   med=114.04ms max=661.59ms p(90)=229.38ms p(95)=265.83ms p(99.9)=523.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117217
     http_req_receiving.............: avg=1.95ms   min=53.35µs med=116.1µs  max=367.14ms p(90)=1.71ms   p(95)=4.78ms   p(99.9)=152.91ms
     http_req_sending...............: avg=59.45µs  min=5.4µs   med=10.1µs   max=75.86ms  p(90)=19.23µs  p(95)=116.75µs p(99.9)=8.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.46ms min=1.72ms  med=112.83ms max=650.17ms p(90)=226.54ms p(95)=260.71ms p(99.9)=438.18ms
     http_reqs......................: 117217  1882.09151/s
     iteration_duration.............: avg=122.8ms  min=3.12ms  med=115.54ms max=661.82ms p(90)=230.21ms p(95)=266.63ms p(99.9)=524.3ms 
     iterations.....................: 116217  1866.035038/s
     success_rate...................: 100.00% ✓ 116217      ✗ 0     
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

     checks.........................: 100.00% ✓ 208140      ✗ 0    
     data_received..................: 6.2 GB  98 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=7.11µs   min=1.06µs  med=2.23µs   max=11.59ms  p(90)=3.77µs   p(95)=4.71µs   p(99.9)=549.38µs
     http_req_connecting............: avg=3.98µs   min=0s      med=0s       max=11.42ms  p(90)=0s       p(95)=0s       p(99.9)=450.98µs
     http_req_duration..............: avg=202.76ms min=2.09ms  med=204.14ms max=653.86ms p(90)=372.16ms p(95)=401.06ms p(99.9)=542.29ms
       { expected_response:true }...: avg=202.76ms min=2.09ms  med=204.14ms max=653.86ms p(90)=372.16ms p(95)=401.06ms p(99.9)=542.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70380
     http_req_receiving.............: avg=77.45µs  min=30.02µs med=63.03µs  max=44.16ms  p(90)=99.1µs   p(95)=115.23µs p(99.9)=1.57ms  
     http_req_sending...............: avg=33.38µs  min=5.36µs  med=10.88µs  max=113.39ms p(90)=17.36µs  p(95)=20.92µs  p(99.9)=3.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.65ms min=2ms     med=204.03ms max=653.8ms  p(90)=372.03ms p(95)=400.94ms p(99.9)=542.23ms
     http_reqs......................: 70380   1125.191699/s
     iteration_duration.............: avg=205.93ms min=5.4ms   med=207.62ms max=654.08ms p(90)=373.06ms p(95)=401.93ms p(99.9)=543.01ms
     iterations.....................: 69380   1109.204321/s
     success_rate...................: 100.00% ✓ 69380       ✗ 0    
     vus............................: 82      min=0         max=495
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

     checks.........................: 100.00% ✓ 88176      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   559 kB/s
     http_req_blocked...............: avg=9.86µs   min=1.17µs  med=2.96µs   max=18.47ms  p(90)=4.72µs   p(95)=5.72µs   p(99.9)=1.67ms 
     http_req_connecting............: avg=5.88µs   min=0s      med=0s       max=18.41ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms 
     http_req_duration..............: avg=472.69ms min=4.13ms  med=438.35ms max=1.9s     p(90)=938.61ms p(95)=1.01s    p(99.9)=1.51s  
       { expected_response:true }...: avg=472.69ms min=4.13ms  med=438.35ms max=1.9s     p(90)=938.61ms p(95)=1.01s    p(99.9)=1.51s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 30392
     http_req_receiving.............: avg=176.12µs min=32.8µs  med=80.57µs  max=196.43ms p(90)=116.55µs p(95)=130.13µs p(99.9)=18.11ms
     http_req_sending...............: avg=25.93µs  min=5.72µs  med=14.27µs  max=25.69ms  p(90)=21.46µs  p(95)=24.68µs  p(99.9)=2.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=472.49ms min=4.06ms  med=438.27ms max=1.9s     p(90)=938.52ms p(95)=1.01s    p(99.9)=1.51s  
     http_reqs......................: 30392   465.451516/s
     iteration_duration.............: avg=488.99ms min=10.57ms med=456.61ms max=1.9s     p(90)=944.51ms p(95)=1.01s    p(99.9)=1.52s  
     iterations.....................: 29392   450.136581/s
     success_rate...................: 100.00% ✓ 29392      ✗ 0    
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

     checks.........................: 100.00% ✓ 42942      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   269 kB/s
     http_req_blocked...............: avg=18.48µs  min=1.25µs  med=3.84µs   max=29.37ms  p(90)=5.83µs   p(95)=7.51µs   p(99.9)=2.99ms
     http_req_connecting............: avg=12.84µs  min=0s      med=0s       max=29.3ms   p(90)=0s       p(95)=0s       p(99.9)=2.95ms
     http_req_duration..............: avg=953.46ms min=6.38ms  med=877.85ms max=5.65s    p(90)=1.9s     p(95)=2.11s    p(99.9)=5.01s 
       { expected_response:true }...: avg=953.46ms min=6.38ms  med=877.85ms max=5.65s    p(90)=1.9s     p(95)=2.11s    p(99.9)=5.01s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15314
     http_req_receiving.............: avg=122.96µs min=35.64µs med=102.97µs max=109.86ms p(90)=142.43µs p(95)=156.09µs p(99.9)=1.14ms
     http_req_sending...............: avg=39.34µs  min=6.44µs  med=19.11µs  max=67.32ms  p(90)=25.16µs  p(95)=30.46µs  p(99.9)=3.73ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=953.3ms  min=6.28ms  med=877.69ms max=5.65s    p(90)=1.9s     p(95)=2.11s    p(99.9)=5.01s 
     http_reqs......................: 15314   224.031906/s
     iteration_duration.............: avg=1.02s    min=37.48ms med=948.97ms max=5.65s    p(90)=1.92s    p(95)=2.12s    p(99.9)=5.05s 
     iterations.....................: 14314   209.402684/s
     success_rate...................: 100.00% ✓ 14314      ✗ 0    
     vus............................: 75      min=0        max=500
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

     checks.........................: 100.00% ✓ 40266      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=18.69µs  min=1.25µs  med=3.45µs   max=25.11ms p(90)=5.21µs   p(95)=6.94µs   p(99.9)=2.75ms
     http_req_connecting............: avg=13.23µs  min=0s      med=0s       max=25.04ms p(90)=0s       p(95)=0s       p(99.9)=2.72ms
     http_req_duration..............: avg=1.01s    min=8.55ms  med=919.67ms max=4.24s   p(90)=2.07s    p(95)=2.2s     p(99.9)=3.79s 
       { expected_response:true }...: avg=1.01s    min=8.55ms  med=919.67ms max=4.24s   p(90)=2.07s    p(95)=2.2s     p(99.9)=3.79s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14422
     http_req_receiving.............: avg=103.38µs min=35.06µs med=95.86µs  max=3.61ms  p(90)=137.07µs p(95)=149.81µs p(99.9)=1.13ms
     http_req_sending...............: avg=36.88µs  min=5.84µs  med=17.8µs   max=93.99ms p(90)=23.84µs  p(95)=28.97µs  p(99.9)=1.85ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.45ms  med=919.55ms max=4.24s   p(90)=2.07s    p(95)=2.2s     p(99.9)=3.79s 
     http_reqs......................: 14422   206.611007/s
     iteration_duration.............: avg=1.08s    min=40.85ms med=1s       max=4.26s   p(90)=2.09s    p(95)=2.21s    p(99.9)=3.81s 
     iterations.....................: 13422   192.284907/s
     success_rate...................: 100.00% ✓ 13422      ✗ 0    
     vus............................: 101     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

