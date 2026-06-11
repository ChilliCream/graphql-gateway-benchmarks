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
| hive-router | v0.0.65 | 2,799 | 2,927 | 2,780 | 1.9% |  |
| hotchocolate | 16.1.3 | 2,054 | 2,103 | 2,041 | 1.1% |  |
| cosmo | 0.321.1 | 1,118 | 1,140 | 1,113 | 1.3% | non-compatible response (18 across 6/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 502 | 512 | 496 | 1.1% |  |
| hive-gateway | 2.8.2 | 217 | 219 | 202 | 2.4% |  |
| apollo-gateway | 2.14.1 | 201 | 207 | 200 | 1.1% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (6134 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (455379 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,236 | 2,342 | 2,186 | 2.4% |  |
| hotchocolate | 16.1.3 | 1,887 | 1,933 | 1,866 | 1.2% |  |
| cosmo | 0.321.1 | 1,098 | 1,101 | 1,086 | 0.7% | non-compatible response (16 across 6/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 490 | 504 | 485 | 1.3% |  |
| hive-gateway | 2.8.2 | 224 | 227 | 223 | 0.7% |  |
| apollo-gateway | 2.14.1 | 206 | 208 | 203 | 0.8% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (18224 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (262392 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 517467      ✗ 0     
     data_received..................: 15 GB   246 MB/s
     data_sent......................: 208 MB  3.4 MB/s
     http_req_blocked...............: avg=33.34µs  min=961ns   med=2.26µs  max=80.2ms   p(90)=3.77µs   p(95)=4.89µs   p(99.9)=7.27ms  
     http_req_connecting............: avg=30.41µs  min=0s      med=0s      max=80.05ms  p(90)=0s       p(95)=0s       p(99.9)=7.18ms  
     http_req_duration..............: avg=81.77ms  min=1.66ms  med=74.8ms  max=337.61ms p(90)=159.84ms p(95)=177.61ms p(99.9)=240.76ms
       { expected_response:true }...: avg=81.77ms  min=1.66ms  med=74.8ms  max=337.61ms p(90)=159.84ms p(95)=177.61ms p(99.9)=240.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173489
     http_req_receiving.............: avg=440.96µs min=28.54µs med=55.37µs max=131.12ms p(90)=253.01µs p(95)=419.69µs p(99.9)=56.23ms 
     http_req_sending...............: avg=93.28µs  min=5.22µs  med=9.78µs  max=287.43ms p(90)=18.76µs  p(95)=133.78µs p(99.9)=13.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.24ms  min=1.61ms  med=74.51ms max=294.38ms p(90)=159.01ms p(95)=175.97ms p(99.9)=235.38ms
     http_reqs......................: 173489  2799.267009/s
     iteration_duration.............: avg=82.65ms  min=2.21ms  med=75.82ms max=408.71ms p(90)=160.52ms p(95)=178.35ms p(99.9)=243.41ms
     iterations.....................: 172489  2783.131882/s
     success_rate...................: 100.00% ✓ 172489      ✗ 0     
     vus............................: 55      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 383169      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=14.21µs  min=992ns   med=2.2µs    max=55.84ms  p(90)=3.48µs   p(95)=4.37µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=11.42µs  min=0s      med=0s       max=55.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=110.59ms min=2.34ms  med=101.35ms max=585.13ms p(90)=212.28ms p(95)=247ms    p(99.9)=427.58ms
       { expected_response:true }...: avg=110.59ms min=2.34ms  med=101.35ms max=585.13ms p(90)=212.28ms p(95)=247ms    p(99.9)=427.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128723
     http_req_receiving.............: avg=1.76ms   min=51.59µs med=115.46µs max=287.58ms p(90)=1.33ms   p(95)=4.42ms   p(99.9)=176.98ms
     http_req_sending...............: avg=65.23µs  min=5.38µs  med=9.68µs   max=208.82ms p(90)=17.61µs  p(95)=119.03µs p(99.9)=8.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.75ms min=2.26ms  med=100.28ms max=571.1ms  p(90)=209.31ms p(95)=240.41ms p(99.9)=398.29ms
     http_reqs......................: 128723  2054.144896/s
     iteration_duration.............: avg=111.7ms  min=3.44ms  med=102.78ms max=585.44ms p(90)=212.92ms p(95)=247.88ms p(99.9)=427.79ms
     iterations.....................: 127723  2038.187026/s
     success_rate...................: 100.00% ✓ 127723      ✗ 0     
     vus............................: 90      min=0         max=498 
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

     checks.........................: 100.00% ✓ 206865      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.51µs   min=1.04µs  med=2.16µs   max=8.76ms   p(90)=3.53µs   p(95)=4.37µs   p(99.9)=535.17µs
     http_req_connecting............: avg=3.69µs   min=0s      med=0s       max=8.7ms    p(90)=0s       p(95)=0s       p(99.9)=473.34µs
     http_req_duration..............: avg=204.05ms min=2.05ms  med=204.05ms max=678.11ms p(90)=376.65ms p(95)=404.14ms p(99.9)=591.46ms
       { expected_response:true }...: avg=204.05ms min=2.05ms  med=204.05ms max=678.11ms p(90)=376.65ms p(95)=404.14ms p(99.9)=591.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69955
     http_req_receiving.............: avg=71.65µs  min=29.88µs med=59.41µs  max=32.32ms  p(90)=91.93µs  p(95)=104.79µs p(99.9)=1ms     
     http_req_sending...............: avg=24.24µs  min=5.32µs  med=10.05µs  max=10.22ms  p(90)=15.31µs  p(95)=18.67µs  p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.95ms min=2ms     med=203.94ms max=678.04ms p(90)=376.5ms  p(95)=404.05ms p(99.9)=591.34ms
     http_reqs......................: 69955   1118.857859/s
     iteration_duration.............: avg=207.24ms min=5.21ms  med=207.37ms max=678.25ms p(90)=377.5ms  p(95)=404.79ms p(99.9)=592.06ms
     iterations.....................: 68955   1102.863893/s
     success_rate...................: 100.00% ✓ 68955       ✗ 0    
     vus............................: 84      min=0         max=493
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

     checks.........................: 100.00% ✓ 94686      ✗ 0    
     data_received..................: 2.9 GB  44 MB/s
     data_sent......................: 39 MB   604 kB/s
     http_req_blocked...............: avg=9.95µs   min=1.07µs  med=2.7µs    max=30.28ms  p(90)=4.5µs    p(95)=5.53µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=6.23µs   min=0s      med=0s       max=30.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=440.95ms min=3.85ms  med=412.17ms max=1.71s    p(90)=862.8ms  p(95)=939.41ms p(99.9)=1.38s   
       { expected_response:true }...: avg=440.95ms min=3.85ms  med=412.17ms max=1.71s    p(90)=862.8ms  p(95)=939.41ms p(99.9)=1.38s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32562
     http_req_receiving.............: avg=84.83µs  min=33.33µs med=74.7µs   max=86.89ms  p(90)=110.88µs p(95)=123.42µs p(99.9)=787.31µs
     http_req_sending...............: avg=32.82µs  min=5.74µs  med=12.69µs  max=153.87ms p(90)=19.83µs  p(95)=23.18µs  p(99.9)=2.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=440.84ms min=3.79ms  med=412.1ms  max=1.71s    p(90)=862.69ms p(95)=939.27ms p(99.9)=1.38s   
     http_reqs......................: 32562   502.77103/s
     iteration_duration.............: avg=455.13ms min=16.37ms med=427.96ms max=1.72s    p(90)=867.07ms p(95)=942.47ms p(99.9)=1.38s   
     iterations.....................: 31562   487.330608/s
     success_rate...................: 100.00% ✓ 31562      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 41694      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   261 kB/s
     http_req_blocked...............: avg=17.55µs  min=1.19µs  med=3.69µs   max=28.35ms p(90)=5.63µs   p(95)=7.6µs    p(99.9)=2.92ms  
     http_req_connecting............: avg=11.9µs   min=0s      med=0s       max=28.29ms p(90)=0s       p(95)=0s       p(99.9)=2.79ms  
     http_req_duration..............: avg=966.12ms min=6.06ms  med=872.77ms max=17.62s  p(90)=1.67s    p(95)=1.88s    p(99.9)=16.06s  
       { expected_response:true }...: avg=966.12ms min=6.06ms  med=872.77ms max=17.62s  p(90)=1.67s    p(95)=1.88s    p(99.9)=16.06s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14898
     http_req_receiving.............: avg=111.44µs min=34.38µs med=99.48µs  max=87.31ms p(90)=139.32µs p(95)=153.09µs p(99.9)=945.99µs
     http_req_sending...............: avg=32.75µs  min=6.13µs  med=17.94µs  max=39.74ms p(90)=24.03µs  p(95)=29.07µs  p(99.9)=3.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=965.98ms min=5.97ms  med=872.62ms max=17.62s  p(90)=1.67s    p(95)=1.88s    p(99.9)=16.06s  
     http_reqs......................: 14898   217.104794/s
     iteration_duration.............: avg=1.03s    min=63.04ms med=950.63ms max=17.62s  p(90)=1.7s     p(95)=1.9s     p(99.9)=16.07s  
     iterations.....................: 13898   202.532046/s
     success_rate...................: 100.00% ✓ 13898      ✗ 0    
     vus............................: 79      min=0        max=500
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

     checks.........................: 100.00% ✓ 41877      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   247 kB/s
     http_req_blocked...............: avg=17.85µs  min=1.3µs   med=3.38µs   max=34.29ms p(90)=5µs      p(95)=6.62µs   p(99.9)=2.89ms  
     http_req_connecting............: avg=12.9µs   min=0s      med=0s       max=34.23ms p(90)=0s       p(95)=0s       p(99.9)=2.86ms  
     http_req_duration..............: avg=436ms    min=8.47ms  med=505.7ms  max=1.32s   p(90)=757.33ms p(95)=802.34ms p(99.9)=1.11s   
       { expected_response:true }...: avg=436ms    min=8.47ms  med=505.7ms  max=1.32s   p(90)=757.33ms p(95)=802.34ms p(99.9)=1.11s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14959
     http_req_receiving.............: avg=96.31µs  min=36.06µs med=89.67µs  max=18.34ms p(90)=129.79µs p(95)=142.9µs  p(99.9)=732.58µs
     http_req_sending...............: avg=28.03µs  min=6.32µs  med=16.02µs  max=18.08ms p(90)=22.12µs  p(95)=26.64µs  p(99.9)=2.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=435.87ms min=8.37ms  med=505.61ms max=1.32s   p(90)=757.24ms p(95)=802.21ms p(99.9)=1.11s   
     http_reqs......................: 14959   201.258794/s
     iteration_duration.............: avg=467.09ms min=8.88ms  med=523.87ms max=1.32s   p(90)=762.18ms p(95)=806.98ms p(99.9)=1.12s   
     iterations.....................: 13959   187.804767/s
     success_rate...................: 100.00% ✓ 13959      ✗ 0    
     vus............................: 68      min=0        max=494
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

     checks.........................: 100.00% ✓ 414309      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=19.74µs  min=1.03µs  med=2.43µs  max=57.07ms  p(90)=4.09µs   p(95)=5.4µs    p(99.9)=2.04ms  
     http_req_connecting............: avg=16.52µs  min=0s      med=0s      max=56.85ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=102.25ms min=1.69ms  med=93.74ms max=321.37ms p(90)=199.5ms  p(95)=216.33ms p(99.9)=269.98ms
       { expected_response:true }...: avg=102.25ms min=1.69ms  med=93.74ms max=321.37ms p(90)=199.5ms  p(95)=216.33ms p(99.9)=269.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139103
     http_req_receiving.............: avg=194.04µs min=28.93µs med=60.71µs max=207.42ms p(90)=175.73µs p(95)=410.6µs  p(99.9)=22.69ms 
     http_req_sending...............: avg=78.69µs  min=5.33µs  med=10.71µs max=178.22ms p(90)=20.9µs   p(95)=137.01µs p(99.9)=10.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.98ms min=1.6ms   med=93.44ms max=296.52ms p(90)=199.04ms p(95)=215.92ms p(99.9)=267.46ms
     http_reqs......................: 139103  2236.187463/s
     iteration_duration.............: avg=103.27ms min=4.9ms   med=94.88ms max=338.07ms p(90)=200.09ms p(95)=216.89ms p(99.9)=270.78ms
     iterations.....................: 138103  2220.111696/s
     success_rate...................: 100.00% ✓ 138103      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 349524      ✗ 0     
     data_received..................: 10 GB   165 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=15.1µs   min=1.01µs  med=2.35µs   max=67.74ms  p(90)=3.91µs   p(95)=4.91µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=12.04µs  min=0s      med=0s       max=67.58ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=121.12ms min=1.79ms  med=111.16ms max=848.31ms p(90)=231.33ms p(95)=263.13ms p(99.9)=704.74ms
       { expected_response:true }...: avg=121.12ms min=1.79ms  med=111.16ms max=848.31ms p(90)=231.33ms p(95)=263.13ms p(99.9)=704.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117508
     http_req_receiving.............: avg=1.64ms   min=53.11µs med=115.27µs max=378.32ms p(90)=1.56ms   p(95)=4.05ms   p(99.9)=137.33ms
     http_req_sending...............: avg=62.11µs  min=5.23µs  med=10.11µs  max=126.02ms p(90)=18.88µs  p(95)=119.17µs p(99.9)=8.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.42ms min=1.67ms  med=109.98ms max=848.22ms p(90)=228.36ms p(95)=258.15ms p(99.9)=699.72ms
     http_reqs......................: 117508  1887.095095/s
     iteration_duration.............: avg=122.46ms min=2.73ms  med=112.78ms max=848.52ms p(90)=232.11ms p(95)=264.14ms p(99.9)=705.39ms
     iterations.....................: 116508  1871.035805/s
     success_rate...................: 100.00% ✓ 116508      ✗ 0     
     vus............................: 69      min=0         max=495 
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

     checks.........................: 100.00% ✓ 203592      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=7.19µs   min=1.08µs  med=2.44µs   max=26.97ms  p(90)=4.24µs   p(95)=5.19µs   p(99.9)=816.88µs
     http_req_connecting............: avg=3.98µs   min=0s      med=0s       max=26.91ms  p(90)=0s       p(95)=0s       p(99.9)=684.5µs 
     http_req_duration..............: avg=207.31ms min=2.18ms  med=208.05ms max=563.45ms p(90)=383.04ms p(95)=411.02ms p(99.9)=504.58ms
       { expected_response:true }...: avg=207.31ms min=2.18ms  med=208.05ms max=563.45ms p(90)=383.04ms p(95)=411.02ms p(99.9)=504.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68864
     http_req_receiving.............: avg=83.2µs   min=29.03µs med=65.82µs  max=131.1ms  p(90)=105.16µs p(95)=121.43µs p(99.9)=1.62ms  
     http_req_sending...............: avg=30.85µs  min=5.26µs  med=11.19µs  max=66.69ms  p(90)=18.35µs  p(95)=22.14µs  p(99.9)=3.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.2ms  min=2.11ms  med=207.93ms max=563.38ms p(90)=382.97ms p(95)=410.88ms p(99.9)=504.49ms
     http_reqs......................: 68864   1098.067911/s
     iteration_duration.............: avg=210.62ms min=4.61ms  med=211.51ms max=563.65ms p(90)=384.09ms p(95)=411.74ms p(99.9)=505.12ms
     iterations.....................: 67864   1082.122455/s
     success_rate...................: 100.00% ✓ 67864       ✗ 0    
     vus............................: 91      min=0         max=499
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

     checks.........................: 100.00% ✓ 92916      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   589 kB/s
     http_req_blocked...............: avg=10.78µs  min=1.12µs  med=3.08µs   max=36.96ms  p(90)=4.92µs   p(95)=5.9µs    p(99.9)=1.96ms  
     http_req_connecting............: avg=6.7µs    min=0s      med=0s       max=36.9ms   p(90)=0s       p(95)=0s       p(99.9)=1.92ms  
     http_req_duration..............: avg=449.07ms min=3.99ms  med=419.93ms max=2.2s     p(90)=881.25ms p(95)=957.92ms p(99.9)=1.37s   
       { expected_response:true }...: avg=449.07ms min=3.99ms  med=419.93ms max=2.2s     p(90)=881.25ms p(95)=957.92ms p(99.9)=1.37s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31972
     http_req_receiving.............: avg=86.88µs  min=32µs    med=80.49µs  max=13.05ms  p(90)=117.26µs p(95)=130.13µs p(99.9)=706.74µs
     http_req_sending...............: avg=39.08µs  min=5.87µs  med=13.84µs  max=203.55ms p(90)=21.1µs   p(95)=24.38µs  p(99.9)=2.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.94ms min=3.93ms  med=419.81ms max=2.2s     p(90)=881.17ms p(95)=957.8ms  p(99.9)=1.37s   
     http_reqs......................: 31972   490.424391/s
     iteration_duration.............: avg=463.79ms min=23.64ms med=436.25ms max=2.2s     p(90)=886.06ms p(95)=962.11ms p(99.9)=1.37s   
     iterations.....................: 30972   475.085207/s
     success_rate...................: 100.00% ✓ 30972      ✗ 0    
     vus............................: 66      min=0        max=496
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

     checks.........................: 100.00% ✓ 43020      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   269 kB/s
     http_req_blocked...............: avg=30.21µs  min=1.32µs  med=3.83µs   max=43.08ms p(90)=5.82µs  p(95)=7.63µs   p(99.9)=5.91ms  
     http_req_connecting............: avg=24.19µs  min=0s      med=0s       max=42.94ms p(90)=0s      p(95)=0s       p(99.9)=5.74ms  
     http_req_duration..............: avg=951.49ms min=6.37ms  med=854.16ms max=5.33s   p(90)=1.86s   p(95)=2.13s    p(99.9)=4.83s   
       { expected_response:true }...: avg=951.49ms min=6.37ms  med=854.16ms max=5.33s   p(90)=1.86s   p(95)=2.13s    p(99.9)=4.83s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15340
     http_req_receiving.............: avg=107.22µs min=37.61µs med=102.78µs max=1.87ms  p(90)=141.1µs p(95)=154.58µs p(99.9)=719.02µs
     http_req_sending...............: avg=43.15µs  min=6.66µs  med=19.08µs  max=62.92ms p(90)=25.58µs p(95)=30.85µs  p(99.9)=5.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=951.34ms min=6.28ms  med=853.84ms max=5.33s   p(90)=1.86s   p(95)=2.13s    p(99.9)=4.83s   
     http_reqs......................: 15340   224.40347/s
     iteration_duration.............: avg=1.01s    min=35.07ms med=934.18ms max=5.34s   p(90)=1.91s   p(95)=2.16s    p(99.9)=4.86s   
     iterations.....................: 14340   209.774821/s
     success_rate...................: 100.00% ✓ 14340      ✗ 0    
     vus............................: 70      min=0        max=500
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

     checks.........................: 100.00% ✓ 40206      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=15.6µs   min=1.31µs  med=3.5µs    max=3.9ms   p(90)=5.19µs   p(95)=6.98µs   p(99.9)=2.56ms  
     http_req_connecting............: avg=10.04µs  min=0s      med=0s       max=3.86ms  p(90)=0s       p(95)=0s       p(99.9)=2.53ms  
     http_req_duration..............: avg=1.01s    min=8.6ms   med=929.29ms max=4.19s   p(90)=2.05s    p(95)=2.18s    p(99.9)=3.78s   
       { expected_response:true }...: avg=1.01s    min=8.6ms   med=929.29ms max=4.19s   p(90)=2.05s    p(95)=2.18s    p(99.9)=3.78s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14402
     http_req_receiving.............: avg=101.47µs min=33.81µs med=95.14µs  max=4.51ms  p(90)=135.75µs p(95)=148.36µs p(99.9)=959.27µs
     http_req_sending...............: avg=30.34µs  min=6.53µs  med=17.26µs  max=17.18ms p(90)=23.18µs  p(95)=28.23µs  p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.01s    min=8.5ms   med=929.18ms max=4.19s   p(90)=2.05s    p(95)=2.18s    p(99.9)=3.78s   
     http_reqs......................: 14402   206.120292/s
     iteration_duration.............: avg=1.08s    min=30.59ms med=1s       max=4.19s   p(90)=2.06s    p(95)=2.2s     p(99.9)=3.83s   
     iterations.....................: 13402   191.808371/s
     success_rate...................: 100.00% ✓ 13402      ✗ 0    
     vus............................: 10      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

