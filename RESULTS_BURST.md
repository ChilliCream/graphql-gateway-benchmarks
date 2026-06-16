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
| hive-router | v0.0.65 | 2,813 | 2,915 | 2,782 | 1.6% |  |
| hotchocolate | 16.1.3 | 2,030 | 2,075 | 2,014 | 0.9% |  |
| cosmo | 0.321.1 | 1,151 | 1,151 | 1,151 | 0.0% | non-compatible response (16 across 8/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 521 | 525 | 514 | 0.7% |  |
| hive-gateway | 2.8.2 | 218 | 221 | 216 | 0.7% |  |
| apollo-gateway | 2.14.1 | 198 | 203 | 196 | 1.0% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (7013 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (495788 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,170 | 2,285 | 2,143 | 2.2% |  |
| hotchocolate | 16.1.3 | 1,907 | 1,941 | 1,893 | 1.0% |  |
| cosmo | 0.321.1 | 1,097 | 1,109 | 1,084 | 0.8% | non-compatible response (7 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 490 | 499 | 484 | 1.2% |  |
| hive-gateway | 2.8.2 | 217 | 221 | 215 | 1.0% |  |
| apollo-gateway | 2.14.1 | 205 | 208 | 204 | 0.6% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (24123 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (369880 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 519246      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=29.61µs  min=962ns   med=2.27µs  max=89.31ms  p(90)=3.73µs   p(95)=4.82µs   p(99.9)=5.76ms  
     http_req_connecting............: avg=26.42µs  min=0s      med=0s      max=89.12ms  p(90)=0s       p(95)=0s       p(99.9)=5.01ms  
     http_req_duration..............: avg=81.56ms  min=1.6ms   med=74.64ms max=319.63ms p(90)=157.68ms p(95)=175.71ms p(99.9)=247.11ms
       { expected_response:true }...: avg=81.56ms  min=1.6ms   med=74.64ms max=319.63ms p(90)=157.68ms p(95)=175.71ms p(99.9)=247.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174082
     http_req_receiving.............: avg=382.76µs min=28.05µs med=54.84µs max=161.26ms p(90)=239.71µs p(95)=415.28µs p(99.9)=44.42ms 
     http_req_sending...............: avg=90.85µs  min=5.21µs  med=9.71µs  max=130.12ms p(90)=18.73µs  p(95)=131.87µs p(99.9)=15.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.09ms  min=1.54ms  med=74.19ms max=305.81ms p(90)=157.1ms  p(95)=174.6ms  p(99.9)=242.04ms
     http_reqs......................: 174082  2813.508795/s
     iteration_duration.............: avg=82.36ms  min=2.7ms   med=75.56ms max=356.05ms p(90)=158.26ms p(95)=176.42ms p(99.9)=249.08ms
     iterations.....................: 173082  2797.346821/s
     success_rate...................: 100.00% ✓ 173082      ✗ 0     
     vus............................: 51      min=0         max=499 
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

     checks.........................: 100.00% ✓ 379491      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=14.42µs  min=1.02µs  med=2.2µs    max=66.51ms  p(90)=3.44µs   p(95)=4.34µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=11.37µs  min=0s      med=0s       max=62.5ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=111.62ms min=2.36ms  med=103.08ms max=687.19ms p(90)=215.92ms p(95)=246.39ms p(99.9)=437.2ms 
       { expected_response:true }...: avg=111.62ms min=2.36ms  med=103.08ms max=687.19ms p(90)=215.92ms p(95)=246.39ms p(99.9)=437.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 127497
     http_req_receiving.............: avg=1.54ms   min=50.64µs med=114.73µs max=520.5ms  p(90)=1.25ms   p(95)=3.8ms    p(99.9)=128.26ms
     http_req_sending...............: avg=55.27µs  min=5.32µs  med=9.43µs   max=39.68ms  p(90)=16.13µs  p(95)=113.69µs p(99.9)=8.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.03ms min=2.28ms  med=102.16ms max=626.28ms p(90)=213.24ms p(95)=241.4ms  p(99.9)=409.4ms 
     http_reqs......................: 127497  2030.391918/s
     iteration_duration.............: avg=112.78ms min=3.77ms  med=104.48ms max=687.39ms p(90)=216.54ms p(95)=247.3ms  p(99.9)=438.22ms
     iterations.....................: 126497  2014.466901/s
     success_rate...................: 100.00% ✓ 126497      ✗ 0     
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

     checks.........................: 100.00% ✓ 212961      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=5.54µs   min=1.09µs  med=2.22µs   max=26.17ms  p(90)=3.74µs   p(95)=4.65µs   p(99.9)=473.58µs
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=26.11ms  p(90)=0s       p(95)=0s       p(99.9)=419.74µs
     http_req_duration..............: avg=198.26ms min=2.07ms  med=198.5ms  max=622.46ms p(90)=367.34ms p(95)=395.56ms p(99.9)=517.45ms
       { expected_response:true }...: avg=198.26ms min=2.07ms  med=198.5ms  max=622.46ms p(90)=367.34ms p(95)=395.56ms p(99.9)=517.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71987
     http_req_receiving.............: avg=76.82µs  min=28.81µs med=60.99µs  max=106.78ms p(90)=97.26µs  p(95)=111.7µs  p(99.9)=1.75ms  
     http_req_sending...............: avg=29.73µs  min=5.38µs  med=10.39µs  max=172.15ms p(90)=16.5µs   p(95)=20.05µs  p(99.9)=3.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.15ms min=2.01ms  med=198.39ms max=622.37ms p(90)=367.24ms p(95)=395.47ms p(99.9)=517.37ms
     http_reqs......................: 71987   1151.586413/s
     iteration_duration.............: avg=201.29ms min=5.06ms  med=201.73ms max=622.73ms p(90)=368.3ms  p(95)=396.26ms p(99.9)=517.65ms
     iterations.....................: 70987   1135.589268/s
     success_rate...................: 100.00% ✓ 70987       ✗ 0    
     vus............................: 81      min=0         max=495
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

     checks.........................: 100.00% ✓ 98238      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   626 kB/s
     http_req_blocked...............: avg=9.31µs   min=1.2µs   med=2.84µs   max=10.12ms p(90)=4.63µs   p(95)=5.69µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=5.39µs   min=0s      med=0s       max=10.02ms p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=425.25ms min=3.87ms  med=396.83ms max=1.68s   p(90)=837.44ms p(95)=919.92ms p(99.9)=1.35s   
       { expected_response:true }...: avg=425.25ms min=3.87ms  med=396.83ms max=1.68s   p(90)=837.44ms p(95)=919.92ms p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33746
     http_req_receiving.............: avg=87.63µs  min=31.21µs med=75.19µs  max=89.84ms p(90)=111.8µs  p(95)=125.45µs p(99.9)=928.18µs
     http_req_sending...............: avg=25.73µs  min=5.5µs   med=12.75µs  max=84.93ms p(90)=20.21µs  p(95)=23.78µs  p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=425.13ms min=3.8ms   med=396.74ms max=1.68s   p(90)=837.35ms p(95)=919.82ms p(99.9)=1.35s   
     http_reqs......................: 33746   521.552568/s
     iteration_duration.............: avg=438.47ms min=33.19ms med=412.7ms  max=1.68s   p(90)=842.62ms p(95)=923.05ms p(99.9)=1.35s   
     iterations.....................: 32746   506.097327/s
     success_rate...................: 100.00% ✓ 32746      ✗ 0    
     vus............................: 90      min=0        max=500
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

     checks.........................: 100.00% ✓ 41571      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   263 kB/s
     http_req_blocked...............: avg=19.43µs  min=1.26µs  med=3.52µs   max=31.91ms p(90)=5.37µs   p(95)=7.22µs   p(99.9)=2.96ms  
     http_req_connecting............: avg=14.19µs  min=0s      med=0s       max=31.85ms p(90)=0s       p(95)=0s       p(99.9)=2.94ms  
     http_req_duration..............: avg=960.15ms min=6.08ms  med=850.65ms max=17.76s  p(90)=1.71s    p(95)=1.92s    p(99.9)=16.03s  
       { expected_response:true }...: avg=960.15ms min=6.08ms  med=850.65ms max=17.76s  p(90)=1.71s    p(95)=1.92s    p(99.9)=16.03s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14857
     http_req_receiving.............: avg=106.39µs min=36.25µs med=96.04µs  max=38.46ms p(90)=134.66µs p(95)=146.87µs p(99.9)=845.98µs
     http_req_sending...............: avg=29.91µs  min=6.45µs  med=17.57µs  max=9.69ms  p(90)=23.96µs  p(95)=28.75µs  p(99.9)=4.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=960.02ms min=5.97ms  med=850.56ms max=17.76s  p(90)=1.71s    p(95)=1.92s    p(99.9)=16.03s  
     http_reqs......................: 14857   218.501678/s
     iteration_duration.............: avg=1.02s    min=25.67ms med=922.88ms max=17.76s  p(90)=1.73s    p(95)=1.95s    p(99.9)=16.08s  
     iterations.....................: 13857   203.794693/s
     success_rate...................: 100.00% ✓ 13857      ✗ 0    
     vus............................: 50      min=0        max=500
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

     checks.........................: 100.00% ✓ 41400      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   244 kB/s
     http_req_blocked...............: avg=13.31µs  min=1.2µs   med=3.32µs   max=5.43ms   p(90)=5.04µs   p(95)=6.5µs    p(99.9)=1.53ms 
     http_req_connecting............: avg=7.85µs   min=0s      med=0s       max=5.38ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms 
     http_req_duration..............: avg=479.21ms min=8.5ms   med=550.98ms max=1.41s    p(90)=828.63ms p(95)=888.95ms p(99.9)=1.24s  
       { expected_response:true }...: avg=479.21ms min=8.5ms   med=550.98ms max=1.41s    p(90)=828.63ms p(95)=888.95ms p(99.9)=1.24s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14800
     http_req_receiving.............: avg=212.27µs min=34.21µs med=89.12µs  max=158.64ms p(90)=128.81µs p(95)=142.02µs p(99.9)=39.17ms
     http_req_sending...............: avg=26.25µs  min=5.67µs  med=15.78µs  max=13.59ms  p(90)=22.28µs  p(95)=26.44µs  p(99.9)=2.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=478.97ms min=8.37ms  med=550.88ms max=1.41s    p(90)=828.55ms p(95)=888.85ms p(99.9)=1.24s  
     http_reqs......................: 14800   198.738795/s
     iteration_duration.............: avg=513.82ms min=9.3ms   med=578.07ms max=1.41s    p(90)=836.85ms p(95)=897.57ms p(99.9)=1.25s  
     iterations.....................: 13800   185.310498/s
     success_rate...................: 100.00% ✓ 13800      ✗ 0    
     vus............................: 68      min=0        max=497
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

     checks.........................: 100.00% ✓ 400773      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=18.08µs  min=1.01µs  med=2.57µs   max=55.16ms  p(90)=4.27µs   p(95)=5.48µs   p(99.9)=2.35ms  
     http_req_connecting............: avg=14.7µs   min=0s      med=0s       max=55.01ms  p(90)=0s       p(95)=0s       p(99.9)=2.26ms  
     http_req_duration..............: avg=105.7ms  min=1.62ms  med=101.13ms max=308.84ms p(90)=203.2ms  p(95)=219.9ms  p(99.9)=269.4ms 
       { expected_response:true }...: avg=105.7ms  min=1.62ms  med=101.13ms max=308.84ms p(90)=203.2ms  p(95)=219.9ms  p(99.9)=269.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 134591
     http_req_receiving.............: avg=179.43µs min=27.84µs med=61.09µs  max=46.84ms  p(90)=164.83µs p(95)=409.59µs p(99.9)=21.54ms 
     http_req_sending...............: avg=71.99µs  min=5.22µs  med=10.94µs  max=142.32ms p(90)=20.64µs  p(95)=136.5µs  p(99.9)=9.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.45ms min=1.54ms  med=100.91ms max=308.25ms p(90)=202.79ms p(95)=219.38ms p(99.9)=267.95ms
     http_reqs......................: 134591  2170.518716/s
     iteration_duration.............: avg=106.76ms min=3.08ms  med=102.33ms max=365.37ms p(90)=203.69ms p(95)=220.44ms p(99.9)=270.15ms
     iterations.....................: 133591  2154.391941/s
     success_rate...................: 100.00% ✓ 133591      ✗ 0     
     vus............................: 58      min=0         max=498 
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

     checks.........................: 100.00% ✓ 352875      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=16.79µs  min=1.06µs  med=2.81µs   max=56.23ms  p(90)=4.47µs   p(95)=5.63µs   p(99.9)=1.11ms  
     http_req_connecting............: avg=13µs     min=0s      med=0s       max=56.13ms  p(90)=0s       p(95)=0s       p(99.9)=972.14µs
     http_req_duration..............: avg=119.99ms min=1.77ms  med=110.34ms max=1.02s    p(90)=229.56ms p(95)=261.97ms p(99.9)=694.7ms 
       { expected_response:true }...: avg=119.99ms min=1.77ms  med=110.34ms max=1.02s    p(90)=229.56ms p(95)=261.97ms p(99.9)=694.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 118625
     http_req_receiving.............: avg=1.5ms    min=52.27µs med=119.57µs max=355.86ms p(90)=1.62ms   p(95)=4.36ms   p(99.9)=128.01ms
     http_req_sending...............: avg=64.14µs  min=5.4µs   med=10.75µs  max=193.99ms p(90)=20.07µs  p(95)=126.05µs p(99.9)=8.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.42ms min=1.66ms  med=109.09ms max=1.02s    p(90)=227.27ms p(95)=258.24ms p(99.9)=682.99ms
     http_reqs......................: 118625  1907.30163/s
     iteration_duration.............: avg=121.31ms min=2.75ms  med=111.75ms max=1.02s    p(90)=230.28ms p(95)=262.86ms p(99.9)=695.69ms
     iterations.....................: 117625  1891.223218/s
     success_rate...................: 100.00% ✓ 117625      ✗ 0     
     vus............................: 68      min=0         max=496 
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

     checks.........................: 100.00% ✓ 203313      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=7.53µs   min=1.11µs  med=2.58µs   max=28.77ms  p(90)=4.31µs   p(95)=5.27µs   p(99.9)=701.98µs
     http_req_connecting............: avg=4.18µs   min=0s      med=0s       max=28.72ms  p(90)=0s       p(95)=0s       p(99.9)=552.45µs
     http_req_duration..............: avg=207.59ms min=2.15ms  med=206.91ms max=579.69ms p(90)=387.47ms p(95)=415.39ms p(99.9)=500.44ms
       { expected_response:true }...: avg=207.59ms min=2.15ms  med=206.91ms max=579.69ms p(90)=387.47ms p(95)=415.39ms p(99.9)=500.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68771
     http_req_receiving.............: avg=86.42µs  min=29.19µs med=66.13µs  max=114.43ms p(90)=104.75µs p(95)=120.82µs p(99.9)=1.93ms  
     http_req_sending...............: avg=31.78µs  min=5.24µs  med=11.43µs  max=108.59ms p(90)=18.3µs   p(95)=22.02µs  p(99.9)=3.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.47ms min=2.08ms  med=206.76ms max=579.64ms p(90)=387.34ms p(95)=415.25ms p(99.9)=500.37ms
     http_reqs......................: 68771   1097.422098/s
     iteration_duration.............: avg=210.9ms  min=4.89ms  med=210.5ms  max=579.85ms p(90)=388.44ms p(95)=416.18ms p(99.9)=501.58ms
     iterations.....................: 67771   1081.46447/s
     success_rate...................: 100.00% ✓ 67771       ✗ 0    
     vus............................: 89      min=0         max=498
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

     checks.........................: 100.00% ✓ 92901      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   589 kB/s
     http_req_blocked...............: avg=10.22µs  min=1.21µs  med=3.27µs   max=6.2ms    p(90)=5.14µs   p(95)=6.21µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=5.81µs   min=0s      med=0s       max=6.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=449.2ms  min=4.05ms  med=420.89ms max=2.08s    p(90)=882.81ms p(95)=964.96ms p(99.9)=1.43s   
       { expected_response:true }...: avg=449.2ms  min=4.05ms  med=420.89ms max=2.08s    p(90)=882.81ms p(95)=964.96ms p(99.9)=1.43s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31967
     http_req_receiving.............: avg=99.61µs  min=33.19µs med=82.27µs  max=251.49ms p(90)=118.97µs p(95)=132.67µs p(99.9)=844.75µs
     http_req_sending...............: avg=25.61µs  min=5.7µs   med=14.75µs  max=13.98ms  p(90)=21.86µs  p(95)=25.08µs  p(99.9)=2.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=449.07ms min=3.95ms  med=420.79ms max=2.08s    p(90)=882.7ms  p(95)=964.87ms p(99.9)=1.43s   
     http_reqs......................: 31967   490.397507/s
     iteration_duration.............: avg=463.95ms min=28.88ms med=440.09ms max=2.09s    p(90)=888.45ms p(95)=968.59ms p(99.9)=1.44s   
     iterations.....................: 30967   475.056765/s
     success_rate...................: 100.00% ✓ 30967      ✗ 0    
     vus............................: 67      min=0        max=497
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

     checks.........................: 100.00% ✓ 41613      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   261 kB/s
     http_req_blocked...............: avg=14.47µs  min=1.31µs  med=3.55µs   max=6.85ms  p(90)=5.38µs   p(95)=7.06µs   p(99.9)=1.95ms  
     http_req_connecting............: avg=8.96µs   min=0s      med=0s       max=6.76ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=983.14ms min=6.48ms  med=896.6ms  max=5.68s   p(90)=1.95s    p(95)=2.16s    p(99.9)=5.23s   
       { expected_response:true }...: avg=983.14ms min=6.48ms  med=896.6ms  max=5.68s   p(90)=1.95s    p(95)=2.16s    p(99.9)=5.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14871
     http_req_receiving.............: avg=106.25µs min=34.91µs med=95.13µs  max=80.41ms p(90)=133.34µs p(95)=145.97µs p(99.9)=844.04µs
     http_req_sending...............: avg=33.91µs  min=6.07µs  med=17.12µs  max=63.57ms p(90)=23.13µs  p(95)=28.69µs  p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=983ms    min=6.38ms  med=896.4ms  max=5.68s   p(90)=1.95s    p(95)=2.16s    p(99.9)=5.23s   
     http_reqs......................: 14871   217.434883/s
     iteration_duration.............: avg=1.05s    min=43.04ms med=982.46ms max=5.68s   p(90)=1.97s    p(95)=2.18s    p(99.9)=5.25s   
     iterations.....................: 13871   202.81348/s
     success_rate...................: 100.00% ✓ 13871      ✗ 0    
     vus............................: 77      min=0        max=500
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

     checks.........................: 100.00% ✓ 40143      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=19.65µs  min=1.3µs   med=3.73µs   max=33.76ms  p(90)=5.6µs    p(95)=7.27µs   p(99.9)=2.92ms
     http_req_connecting............: avg=13.69µs  min=0s      med=0s       max=33.7ms   p(90)=0s       p(95)=0s       p(99.9)=2.83ms
     http_req_duration..............: avg=1.01s    min=8.87ms  med=922.92ms max=4.17s    p(90)=2.05s    p(95)=2.2s     p(99.9)=3.74s 
       { expected_response:true }...: avg=1.01s    min=8.87ms  med=922.92ms max=4.17s    p(90)=2.05s    p(95)=2.2s     p(99.9)=3.74s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14381
     http_req_receiving.............: avg=113.29µs min=32.34µs med=99.3µs   max=116.85ms p(90)=140.72µs p(95)=154.29µs p(99.9)=1ms   
     http_req_sending...............: avg=39.7µs   min=6.24µs  med=17.92µs  max=64.52ms  p(90)=24.12µs  p(95)=29.78µs  p(99.9)=3.02ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.76ms  med=922.77ms max=4.17s    p(90)=2.05s    p(95)=2.2s     p(99.9)=3.74s 
     http_reqs......................: 14381   205.387442/s
     iteration_duration.............: avg=1.08s    min=86.63ms med=1.03s    max=4.17s    p(90)=2.08s    p(95)=2.2s     p(99.9)=3.79s 
     iterations.....................: 13381   191.105581/s
     success_rate...................: 100.00% ✓ 13381      ✗ 0    
     vus............................: 56      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

