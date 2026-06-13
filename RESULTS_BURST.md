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
| hive-router | v0.0.65 | 2,689 | 2,787 | 2,675 | 1.5% |  |
| hotchocolate | 16.1.3 | 2,081 | 2,123 | 2,054 | 0.9% |  |
| cosmo | 0.321.1 | 1,160 | 1,160 | 1,155 | 0.3% | non-compatible response (21 across 7/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 520 | 525 | 515 | 0.7% |  |
| hive-gateway | 2.8.2 | 215 | 215 | 211 | 0.7% |  |
| apollo-gateway | 2.14.1 | 200 | 205 | 198 | 1.1% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (6599 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (421182 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,137 | 2,248 | 2,087 | 2.4% |  |
| hotchocolate | 16.1.3 | 1,881 | 1,919 | 1,853 | 1.2% |  |
| cosmo | 0.321.1 | 1,085 | 1,085 | 1,083 | 0.1% | non-compatible response (17 across 7/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 495 | 508 | 490 | 1.3% |  |
| hive-gateway | 2.8.2 | 220 | 225 | 218 | 1.2% |  |
| apollo-gateway | 2.14.1 | 203 | 206 | 202 | 0.7% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (21463 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (206153 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 495957      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=22.91µs  min=1µs     med=2.21µs  max=58.94ms  p(90)=3.62µs   p(95)=4.74µs   p(99.9)=3.24ms  
     http_req_connecting............: avg=19.93µs  min=0s      med=0s      max=58.86ms  p(90)=0s       p(95)=0s       p(99.9)=3.09ms  
     http_req_duration..............: avg=85.43ms  min=1.6ms   med=80.36ms max=343.47ms p(90)=164.57ms p(95)=180.72ms p(99.9)=231.2ms 
       { expected_response:true }...: avg=85.43ms  min=1.6ms   med=80.36ms max=343.47ms p(90)=164.57ms p(95)=180.72ms p(99.9)=231.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 166319
     http_req_receiving.............: avg=246.93µs min=28.99µs med=55.74µs max=65.72ms  p(90)=187.99µs p(95)=391.88µs p(99.9)=26.81ms 
     http_req_sending...............: avg=82.05µs  min=5.21µs  med=9.8µs   max=130.96ms p(90)=18.46µs  p(95)=127.88µs p(99.9)=12.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.1ms   min=1.55ms  med=80.08ms max=343.03ms p(90)=164ms    p(95)=180.1ms  p(99.9)=229.34ms
     http_reqs......................: 166319  2689.196795/s
     iteration_duration.............: avg=86.23ms  min=2.68ms  med=81.31ms max=377.8ms  p(90)=165.1ms  p(95)=181.17ms p(99.9)=232.53ms
     iterations.....................: 165319  2673.027886/s
     success_rate...................: 100.00% ✓ 165319      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 389190      ✗ 0     
     data_received..................: 12 GB   182 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=27.86µs  min=1.01µs med=2.3µs    max=172.17ms p(90)=3.74µs   p(95)=4.74µs   p(99.9)=3.01ms  
     http_req_connecting............: avg=24.78µs  min=0s     med=0s       max=172.1ms  p(90)=0s       p(95)=0s       p(99.9)=2.95ms  
     http_req_duration..............: avg=108.83ms min=2.37ms med=100.57ms max=691.13ms p(90)=210.04ms p(95)=245.5ms  p(99.9)=476.52ms
       { expected_response:true }...: avg=108.83ms min=2.37ms med=100.57ms max=691.13ms p(90)=210.04ms p(95)=245.5ms  p(99.9)=476.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130730
     http_req_receiving.............: avg=2.03ms   min=52.7µs med=112.6µs  max=436.26ms p(90)=1.31ms   p(95)=4.6ms    p(99.9)=165.04ms
     http_req_sending...............: avg=68.55µs  min=5.45µs med=9.85µs   max=162.67ms p(90)=18.38µs  p(95)=119.48µs p(99.9)=9.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.73ms min=2.29ms med=99.37ms  max=625.34ms p(90)=206.62ms p(95)=238.27ms p(99.9)=414.7ms 
     http_reqs......................: 130730  2081.541713/s
     iteration_duration.............: avg=109.95ms min=3.88ms med=101.94ms max=691.36ms p(90)=210.73ms p(95)=246.27ms p(99.9)=477.41ms
     iterations.....................: 129730  2065.619264/s
     success_rate...................: 100.00% ✓ 129730      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 214923      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.99µs   min=1.09µs  med=2.22µs   max=16.4ms   p(90)=3.71µs   p(95)=4.61µs   p(99.9)=512.65µs
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=16.33ms  p(90)=0s       p(95)=0s       p(99.9)=456.76µs
     http_req_duration..............: avg=196.49ms min=2.04ms  med=196.24ms max=541.9ms  p(90)=364.82ms p(95)=390.7ms  p(99.9)=474.89ms
       { expected_response:true }...: avg=196.49ms min=2.04ms  med=196.24ms max=541.9ms  p(90)=364.82ms p(95)=390.7ms  p(99.9)=474.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72641
     http_req_receiving.............: avg=79.32µs  min=29.64µs med=60.93µs  max=113.44ms p(90)=96.55µs  p(95)=111.23µs p(99.9)=1.38ms  
     http_req_sending...............: avg=32.72µs  min=5.36µs  med=10.56µs  max=167.42ms p(90)=16.69µs  p(95)=20.2µs   p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.37ms min=1.99ms  med=196.12ms max=541.83ms p(90)=364.75ms p(95)=390.61ms p(99.9)=474.43ms
     http_reqs......................: 72641   1160.929564/s
     iteration_duration.............: avg=199.46ms min=5.57ms  med=199.66ms max=542.12ms p(90)=365.85ms p(95)=391.29ms p(99.9)=475.18ms
     iterations.....................: 71641   1144.947824/s
     success_rate...................: 100.00% ✓ 71641       ✗ 0    
     vus............................: 82      min=0         max=497
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

     checks.........................: 100.00% ✓ 98022      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 40 MB   625 kB/s
     http_req_blocked...............: avg=8.5µs    min=1.23µs  med=2.9µs    max=10.11ms  p(90)=4.8µs    p(95)=5.91µs   p(99.9)=1.05ms 
     http_req_connecting............: avg=4.58µs   min=0s      med=0s       max=10.05ms  p(90)=0s       p(95)=0s       p(99.9)=981.2µs
     http_req_duration..............: avg=426.22ms min=3.86ms  med=401.08ms max=1.9s     p(90)=839.79ms p(95)=916.8ms  p(99.9)=1.3s   
       { expected_response:true }...: avg=426.22ms min=3.86ms  med=401.08ms max=1.9s     p(90)=839.79ms p(95)=916.8ms  p(99.9)=1.3s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33674
     http_req_receiving.............: avg=156.9µs  min=31.9µs  med=76.9µs   max=191.41ms p(90)=113.23µs p(95)=127.11µs p(99.9)=3.64ms 
     http_req_sending...............: avg=27.78µs  min=5.73µs  med=13.33µs  max=129.3ms  p(90)=20.75µs  p(95)=24.09µs  p(99.9)=2.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=426.03ms min=3.81ms  med=400.97ms max=1.9s     p(90)=839.69ms p(95)=916.73ms p(99.9)=1.3s   
     http_reqs......................: 33674   520.255162/s
     iteration_duration.............: avg=439.5ms  min=10.04ms med=415.25ms max=1.9s     p(90)=843.79ms p(95)=920.68ms p(99.9)=1.31s  
     iterations.....................: 32674   504.805403/s
     success_rate...................: 100.00% ✓ 32674      ✗ 0    
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

     checks.........................: 100.00% ✓ 41267      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   260 kB/s
     http_req_blocked...............: avg=17.7µs   min=1.33µs  med=3.58µs   max=7.67ms p(90)=5.36µs   p(95)=6.96µs   p(99.9)=2.63ms 
     http_req_connecting............: avg=11.83µs  min=0s      med=0s       max=7.39ms p(90)=0s       p(95)=0s       p(99.9)=2.54ms 
     http_req_duration..............: avg=965.64ms min=6.62ms  med=856.01ms max=19.82s p(90)=1.68s    p(95)=1.84s    p(99.9)=17.92s 
       { expected_response:true }...: avg=965.64ms min=6.62ms  med=856.01ms max=19.82s p(90)=1.68s    p(95)=1.84s    p(99.9)=17.92s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14756
     http_req_receiving.............: avg=101.64µs min=38.17µs med=97.17µs  max=1.53ms p(90)=135.88µs p(95)=149.33µs p(99.9)=766.5µs
     http_req_sending...............: avg=31.54µs  min=6.2µs   med=17.77µs  max=6.6ms  p(90)=23.94µs  p(95)=28.45µs  p(99.9)=4.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=965.51ms min=6.48ms  med=855.89ms max=19.82s p(90)=1.68s    p(95)=1.84s    p(99.9)=17.92s 
     http_reqs......................: 14756   215.349371/s
     iteration_duration.............: avg=1.03s    min=55.57ms med=931.84ms max=19.82s p(90)=1.69s    p(95)=1.85s    p(99.9)=17.93s 
     iterations.....................: 13755   200.740756/s
     success_rate...................: 100.00% ✓ 13755      ✗ 0    
     vus............................: 86      min=0        max=500
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

     checks.........................: 100.00% ✓ 41631      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=15.7µs   min=1.32µs  med=3.4µs    max=33.34ms p(90)=5.06µs   p(95)=6.61µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=10.54µs  min=0s      med=0s       max=33.28ms p(90)=0s       p(95)=0s       p(99.9)=2.07ms  
     http_req_duration..............: avg=495.04ms min=8.46ms  med=564.08ms max=1.48s   p(90)=866.47ms p(95)=941.7ms  p(99.9)=1.3s    
       { expected_response:true }...: avg=495.04ms min=8.46ms  med=564.08ms max=1.48s   p(90)=866.47ms p(95)=941.7ms  p(99.9)=1.3s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 14877
     http_req_receiving.............: avg=97.4µs   min=34.95µs med=89.79µs  max=5.8ms   p(90)=129.9µs  p(95)=142.92µs p(99.9)=983.53µs
     http_req_sending...............: avg=26.75µs  min=5.95µs  med=15.73µs  max=22.29ms p(90)=22µs     p(95)=27.18µs  p(99.9)=2.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=494.92ms min=8.36ms  med=563.92ms max=1.48s   p(90)=866.35ms p(95)=941.61ms p(99.9)=1.3s    
     http_reqs......................: 14877   200.157829/s
     iteration_duration.............: avg=530.54ms min=15.01ms med=593.95ms max=1.48s   p(90)=882.35ms p(95)=947.44ms p(99.9)=1.31s   
     iterations.....................: 13877   186.70365/s
     success_rate...................: 100.00% ✓ 13877      ✗ 0    
     vus............................: 61      min=0        max=495
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

     checks.........................: 100.00% ✓ 394248      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 159 MB  2.6 MB/s
     http_req_blocked...............: avg=27.24µs  min=1.02µs  med=2.38µs   max=133.69ms p(90)=3.95µs   p(95)=5.14µs   p(99.9)=2.45ms  
     http_req_connecting............: avg=23.84µs  min=0s      med=0s       max=133.65ms p(90)=0s       p(95)=0s       p(99.9)=2.28ms  
     http_req_duration..............: avg=107.43ms min=1.58ms  med=102.09ms max=352.75ms p(90)=207.03ms p(95)=224.06ms p(99.9)=272.02ms
       { expected_response:true }...: avg=107.43ms min=1.58ms  med=102.09ms max=352.75ms p(90)=207.03ms p(95)=224.06ms p(99.9)=272.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132416
     http_req_receiving.............: avg=159.93µs min=29.86µs med=60.58µs  max=236.35ms p(90)=145.39µs p(95)=385.7µs  p(99.9)=16.71ms 
     http_req_sending...............: avg=74.02µs  min=5.48µs  med=10.48µs  max=83.24ms  p(90)=19.36µs  p(95)=130.8µs  p(99.9)=9.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.2ms  min=1.53ms  med=101.91ms max=349.1ms  p(90)=206.64ms p(95)=223.72ms p(99.9)=270.89ms
     http_reqs......................: 132416  2137.89851/s
     iteration_duration.............: avg=108.54ms min=4.1ms   med=103.32ms max=369.83ms p(90)=207.62ms p(95)=224.54ms p(99.9)=273.12ms
     iterations.....................: 131416  2121.753191/s
     success_rate...................: 100.00% ✓ 131416      ✗ 0     
     vus............................: 55      min=0         max=499 
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

     checks.........................: 100.00% ✓ 348417      ✗ 0     
     data_received..................: 10 GB   165 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=13.38µs  min=982ns   med=2.33µs   max=78.09ms  p(90)=3.95µs   p(95)=5µs      p(99.9)=1.41ms  
     http_req_connecting............: avg=10.13µs  min=0s      med=0s       max=78.03ms  p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=121.55ms min=1.79ms  med=112.4ms  max=948.72ms p(90)=233.64ms p(95)=265.03ms p(99.9)=549.04ms
       { expected_response:true }...: avg=121.55ms min=1.79ms  med=112.4ms  max=948.72ms p(90)=233.64ms p(95)=265.03ms p(99.9)=549.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117139
     http_req_receiving.............: avg=1.83ms   min=52.92µs med=116.88µs max=327.49ms p(90)=1.77ms   p(95)=4.75ms   p(99.9)=151.04ms
     http_req_sending...............: avg=59.97µs  min=5.35µs  med=9.87µs   max=127.58ms p(90)=18.1µs   p(95)=112.51µs p(99.9)=7.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.66ms min=1.7ms   med=111.25ms max=948.45ms p(90)=230.51ms p(95)=258.53ms p(99.9)=525.83ms
     http_reqs......................: 117139  1881.387398/s
     iteration_duration.............: avg=122.86ms min=3.04ms  med=113.92ms max=948.92ms p(90)=234.28ms p(95)=265.81ms p(99.9)=550.63ms
     iterations.....................: 116139  1865.326245/s
     success_rate...................: 100.00% ✓ 116139      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 201078      ✗ 0    
     data_received..................: 6.0 GB  95 MB/s
     data_sent......................: 82 MB   1.3 MB/s
     http_req_blocked...............: avg=6.21µs   min=1.14µs  med=2.77µs   max=24.43ms  p(90)=4.47µs   p(95)=5.41µs   p(99.9)=447.78µs
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=24.36ms  p(90)=0s       p(95)=0s       p(99.9)=355.95µs
     http_req_duration..............: avg=209.79ms min=2.14ms  med=209.92ms max=604.3ms  p(90)=386.97ms p(95)=418.86ms p(99.9)=530.2ms 
       { expected_response:true }...: avg=209.79ms min=2.14ms  med=209.92ms max=604.3ms  p(90)=386.97ms p(95)=418.86ms p(99.9)=530.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 68026
     http_req_receiving.............: avg=87.49µs  min=31.02µs med=67.64µs  max=251.67ms p(90)=104.83µs p(95)=119.56µs p(99.9)=1.25ms  
     http_req_sending...............: avg=39.42µs  min=5.6µs   med=11.66µs  max=226.84ms p(90)=18.24µs  p(95)=21.81µs  p(99.9)=3.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.66ms min=2.07ms  med=209.77ms max=604.19ms p(90)=386.86ms p(95)=418.76ms p(99.9)=530.14ms
     http_reqs......................: 68026   1085.177615/s
     iteration_duration.............: avg=213.2ms  min=4.15ms  med=213.93ms max=604.52ms p(90)=388.07ms p(95)=419.75ms p(99.9)=531.15ms
     iterations.....................: 67026   1069.22522/s
     success_rate...................: 100.00% ✓ 67026       ✗ 0    
     vus............................: 88      min=0         max=498
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

     checks.........................: 100.00% ✓ 93885      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   595 kB/s
     http_req_blocked...............: avg=8.65µs   min=1.13µs  med=3.19µs   max=4.26ms   p(90)=5.05µs   p(95)=6.08µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=4.38µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=444.64ms min=4.04ms  med=412.56ms max=1.79s    p(90)=880.86ms p(95)=970.12ms p(99.9)=1.46s   
       { expected_response:true }...: avg=444.64ms min=4.04ms  med=412.56ms max=1.79s    p(90)=880.86ms p(95)=970.12ms p(99.9)=1.46s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32295
     http_req_receiving.............: avg=95.4µs   min=31.94µs med=82.22µs  max=141.21ms p(90)=119.36µs p(95)=133.45µs p(99.9)=939.75µs
     http_req_sending...............: avg=31.18µs  min=5.7µs   med=14.61µs  max=167.54ms p(90)=21.9µs   p(95)=25.31µs  p(99.9)=2.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=444.52ms min=3.96ms  med=412.46ms max=1.79s    p(90)=880.78ms p(95)=970.01ms p(99.9)=1.46s   
     http_reqs......................: 32295   495.657518/s
     iteration_duration.............: avg=459.07ms min=25.84ms med=428.78ms max=1.8s     p(90)=886.86ms p(95)=974.41ms p(99.9)=1.46s   
     iterations.....................: 31295   480.309708/s
     success_rate...................: 100.00% ✓ 31295      ✗ 0    
     vus............................: 64      min=0        max=497
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

     checks.........................: 100.00% ✓ 42297      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   265 kB/s
     http_req_blocked...............: avg=17.91µs  min=1.18µs  med=3.68µs   max=22.08ms p(90)=5.59µs   p(95)=7.29µs   p(99.9)=2.77ms  
     http_req_connecting............: avg=12.47µs  min=0s      med=0s       max=22.01ms p(90)=0s       p(95)=0s       p(99.9)=2.75ms  
     http_req_duration..............: avg=966.64ms min=6.44ms  med=880.96ms max=5.85s   p(90)=1.94s    p(95)=2.16s    p(99.9)=4.86s   
       { expected_response:true }...: avg=966.64ms min=6.44ms  med=880.96ms max=5.85s   p(90)=1.94s    p(95)=2.16s    p(99.9)=4.86s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15099
     http_req_receiving.............: avg=102.89µs min=36.42µs med=98.43µs  max=6.36ms  p(90)=136.61µs p(95)=148.48µs p(99.9)=573.78µs
     http_req_sending...............: avg=30.44µs  min=6.29µs  med=17.86µs  max=22.58ms p(90)=23.85µs  p(95)=28.84µs  p(99.9)=3.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=966.51ms min=6.35ms  med=880.86ms max=5.85s   p(90)=1.94s    p(95)=2.16s    p(99.9)=4.86s   
     http_reqs......................: 15099   220.654899/s
     iteration_duration.............: avg=1.03s    min=41.2ms  med=954.02ms max=5.86s   p(90)=1.96s    p(95)=2.19s    p(99.9)=4.92s   
     iterations.....................: 14099   206.041024/s
     success_rate...................: 100.00% ✓ 14099      ✗ 0    
     vus............................: 80      min=0        max=500
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

     checks.........................: 100.00% ✓ 39735      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   244 kB/s
     http_req_blocked...............: avg=17.03µs  min=1.29µs  med=3.57µs   max=30.3ms   p(90)=5.37µs   p(95)=7.21µs   p(99.9)=2.2ms 
     http_req_connecting............: avg=11.3µs   min=0s      med=0s       max=30.24ms  p(90)=0s       p(95)=0s       p(99.9)=2.01ms
     http_req_duration..............: avg=1.02s    min=8.66ms  med=933.8ms  max=4.22s    p(90)=2.08s    p(95)=2.18s    p(99.9)=3.88s 
       { expected_response:true }...: avg=1.02s    min=8.66ms  med=933.8ms  max=4.22s    p(90)=2.08s    p(95)=2.18s    p(99.9)=3.88s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14245
     http_req_receiving.............: avg=113.41µs min=35.13µs med=94.91µs  max=109.47ms p(90)=135.94µs p(95)=148.42µs p(99.9)=1.19ms
     http_req_sending...............: avg=32.02µs  min=6.08µs  med=17.24µs  max=52.96ms  p(90)=23.12µs  p(95)=28.56µs  p(99.9)=2.5ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.02s    min=8.55ms  med=933.72ms max=4.22s    p(90)=2.08s    p(95)=2.18s    p(99.9)=3.88s 
     http_reqs......................: 14245   203.615235/s
     iteration_duration.............: avg=1.1s     min=48.69ms med=1.03s    max=4.23s    p(90)=2.09s    p(95)=2.21s    p(99.9)=3.9s  
     iterations.....................: 13245   189.321432/s
     success_rate...................: 100.00% ✓ 13245      ✗ 0    
     vus............................: 42      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

