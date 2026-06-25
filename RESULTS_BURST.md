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
| hive-router | v0.0.72 | 2,644 | 2,776 | 2,629 | 1.9% |  |
| fusion-nightly | 16.4.0-p.1 | 2,100 | 2,130 | 2,081 | 0.7% |  |
| fusion | 16.2.3 | 2,014 | 2,062 | 1,995 | 1.1% |  |
| cosmo | 0.326.0 | 1,127 | 1,150 | 1,118 | 1.0% |  |
| hive-gateway-router-runtime | 2.9.0 | 520 | 529 | 517 | 0.8% |  |
| hive-gateway | 2.9.0 | 219 | 223 | 207 | 2.0% |  |
| apollo-gateway | 2.14.1 | 198 | 204 | 196 | 1.2% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (14114 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (465209 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,160 | 2,232 | 2,087 | 2.3% |  |
| fusion-nightly | 16.4.0-p.1 | 2,021 | 2,062 | 2,008 | 0.9% |  |
| fusion | 16.2.3 | 1,924 | 1,968 | 1,903 | 1.0% |  |
| cosmo | 0.326.0 | 1,027 | 1,054 | 1,019 | 1.1% |  |
| hive-gateway-router-runtime | 2.9.0 | 472 | 481 | 467 | 1.0% |  |
| hive-gateway | 2.9.0 | 219 | 225 | 217 | 1.0% |  |
| apollo-gateway | 2.14.1 | 202 | 208 | 201 | 1.0% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (30390 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (284330 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 488070      ✗ 0     
     data_received..................: 14 GB   232 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=35.12µs  min=1.09µs  med=2.75µs  max=76.26ms  p(90)=4.4µs    p(95)=5.53µs   p(99.9)=9.55ms  
     http_req_connecting............: avg=31.13µs  min=0s      med=0s      max=76.15ms  p(90)=0s       p(95)=0s       p(99.9)=8.66ms  
     http_req_duration..............: avg=86.73ms  min=1.58ms  med=78.94ms max=303.83ms p(90)=170.77ms p(95)=188.44ms p(99.9)=257.36ms
       { expected_response:true }...: avg=86.73ms  min=1.58ms  med=78.94ms max=303.83ms p(90)=170.77ms p(95)=188.44ms p(99.9)=257.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163690
     http_req_receiving.............: avg=384.43µs min=29.96µs med=59.32µs max=112.59ms p(90)=215.34µs p(95)=433.99µs p(99.9)=45.61ms 
     http_req_sending...............: avg=104.81µs min=5.28µs  med=10.72µs max=114.78ms p(90)=19.97µs  p(95)=141.19µs p(99.9)=18.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.24ms  min=1.51ms  med=78.57ms max=292.84ms p(90)=170.01ms p(95)=187.2ms  p(99.9)=251.81ms
     http_reqs......................: 163690  2644.670978/s
     iteration_duration.............: avg=87.63ms  min=2.45ms  med=79.92ms max=319.09ms p(90)=171.4ms  p(95)=189.29ms p(99.9)=261.24ms
     iterations.....................: 162690  2628.514396/s
     success_rate...................: 100.00% ✓ 162690      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 391746      ✗ 0     
     data_received..................: 12 GB   184 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=19.19µs  min=1.03µs  med=2.59µs   max=62.56ms  p(90)=4.04µs   p(95)=5.06µs   p(99.9)=3.68ms  
     http_req_connecting............: avg=15.69µs  min=0s      med=0s       max=62.5ms   p(90)=0s       p(95)=0s       p(99.9)=3.48ms  
     http_req_duration..............: avg=108.11ms min=2.28ms  med=102.43ms max=523.57ms p(90)=208.27ms p(95)=233.9ms  p(99.9)=378.69ms
       { expected_response:true }...: avg=108.11ms min=2.28ms  med=102.43ms max=523.57ms p(90)=208.27ms p(95)=233.9ms  p(99.9)=378.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131582
     http_req_receiving.............: avg=1.97ms   min=53.75µs med=292.91µs max=256.58ms p(90)=3.1ms    p(95)=6.85ms   p(99.9)=90.08ms 
     http_req_sending...............: avg=75.25µs  min=5.35µs  med=10.12µs  max=132.19ms p(90)=18.73µs  p(95)=124.97µs p(99.9)=10.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.07ms min=2.19ms  med=100.59ms max=486.07ms p(90)=205.45ms p(95)=229.65ms p(99.9)=368.11ms
     http_reqs......................: 131582  2100.749036/s
     iteration_duration.............: avg=109.23ms min=3.66ms  med=103.7ms  max=523.78ms p(90)=208.91ms p(95)=234.49ms p(99.9)=379.31ms
     iterations.....................: 130582  2084.783713/s
     success_rate...................: 100.00% ✓ 130582      ✗ 0     
     vus............................: 86      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 376350      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 152 MB  2.4 MB/s
     http_req_blocked...............: avg=20.81µs  min=972ns   med=2.6µs    max=78.46ms  p(90)=4.04µs   p(95)=5.02µs   p(99.9)=2.88ms  
     http_req_connecting............: avg=17.58µs  min=0s      med=0s       max=78.4ms   p(90)=0s       p(95)=0s       p(99.9)=2.86ms  
     http_req_duration..............: avg=112.55ms min=2.44ms  med=99.37ms  max=872.76ms p(90)=224.46ms p(95)=265.08ms p(99.9)=534.61ms
       { expected_response:true }...: avg=112.55ms min=2.44ms  med=99.37ms  max=872.76ms p(90)=224.46ms p(95)=265.08ms p(99.9)=534.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126450
     http_req_receiving.............: avg=3.8ms    min=53.92µs med=156.46µs max=411.23ms p(90)=4.74ms   p(95)=13.05ms  p(99.9)=171.11ms
     http_req_sending...............: avg=72.02µs  min=5.61µs  med=10.21µs  max=101.07ms p(90)=18.68µs  p(95)=124.77µs p(99.9)=9.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.68ms min=2.3ms   med=96.78ms  max=767.74ms p(90)=216.89ms p(95)=253.41ms p(99.9)=471.59ms
     http_reqs......................: 126450  2014.811216/s
     iteration_duration.............: avg=113.73ms min=3.52ms  med=100.87ms max=879.3ms  p(90)=225.21ms p(95)=265.93ms p(99.9)=535.23ms
     iterations.....................: 125450  1998.877557/s
     success_rate...................: 100.00% ✓ 125450      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 208491      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=6.32µs   min=1.03µs  med=2.25µs   max=48.14ms  p(90)=3.82µs   p(95)=4.71µs   p(99.9)=501.61µs
     http_req_connecting............: avg=3.27µs   min=0s      med=0s       max=48.09ms  p(90)=0s       p(95)=0s       p(99.9)=430.76µs
     http_req_duration..............: avg=202.45ms min=2.06ms  med=202.26ms max=632.33ms p(90)=375.76ms p(95)=403.64ms p(99.9)=548.63ms
       { expected_response:true }...: avg=202.45ms min=2.06ms  med=202.26ms max=632.33ms p(90)=375.76ms p(95)=403.64ms p(99.9)=548.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70497
     http_req_receiving.............: avg=85.21µs  min=29.04µs med=63.57µs  max=127.41ms p(90)=98.34µs  p(95)=112.88µs p(99.9)=1.93ms  
     http_req_sending...............: avg=27.44µs  min=5.38µs  med=10.81µs  max=26.15ms  p(90)=16.79µs  p(95)=20.44µs  p(99.9)=3.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.34ms min=1.99ms  med=202.13ms max=632.26ms p(90)=375.66ms p(95)=403.52ms p(99.9)=548.51ms
     http_reqs......................: 70497   1127.777364/s
     iteration_duration.............: avg=205.61ms min=4.43ms  med=205.72ms max=632.48ms p(90)=376.7ms  p(95)=404.45ms p(99.9)=549.34ms
     iterations.....................: 69497   1111.779841/s
     success_rate...................: 100.00% ✓ 69497       ✗ 0    
     vus............................: 82      min=0         max=492
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98100      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   625 kB/s
     http_req_blocked...............: avg=10.68µs  min=1.14µs  med=3.16µs   max=26.15ms  p(90)=5.05µs   p(95)=6.2µs    p(99.9)=1.51ms  
     http_req_connecting............: avg=6.46µs   min=0s      med=0s       max=26.08ms  p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=425.74ms min=3.92ms  med=396.6ms  max=1.91s    p(90)=838.01ms p(95)=907.51ms p(99.9)=1.31s   
       { expected_response:true }...: avg=425.74ms min=3.92ms  med=396.6ms  max=1.91s    p(90)=838.01ms p(95)=907.51ms p(99.9)=1.31s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33700
     http_req_receiving.............: avg=91.98µs  min=33.82µs med=79.46µs  max=111.91ms p(90)=117.09µs p(95)=130.98µs p(99.9)=809.33µs
     http_req_sending...............: avg=30.06µs  min=5.86µs  med=14.27µs  max=62.31ms  p(90)=21.88µs  p(95)=25.41µs  p(99.9)=3.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=425.62ms min=3.86ms  med=396.5ms  max=1.91s    p(90)=837.85ms p(95)=907.39ms p(99.9)=1.31s   
     http_reqs......................: 33700   520.624248/s
     iteration_duration.............: avg=439ms    min=26.13ms med=410.82ms max=1.92s    p(90)=842.06ms p(95)=911.2ms  p(99.9)=1.31s   
     iterations.....................: 32700   505.175457/s
     success_rate...................: 100.00% ✓ 32700      ✗ 0    
     vus............................: 90      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42240      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   265 kB/s
     http_req_blocked...............: avg=19.79µs  min=1.24µs  med=3.86µs   max=31.26ms  p(90)=5.85µs   p(95)=7.49µs   p(99.9)=2.98ms
     http_req_connecting............: avg=14.06µs  min=0s      med=0s       max=31.19ms  p(90)=0s       p(95)=0s       p(99.9)=2.94ms
     http_req_duration..............: avg=934.49ms min=6.35ms  med=815.82ms max=20.68s   p(90)=1.66s    p(95)=1.81s    p(99.9)=18.42s
       { expected_response:true }...: avg=934.49ms min=6.35ms  med=815.82ms max=20.68s   p(90)=1.66s    p(95)=1.81s    p(99.9)=18.42s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15080
     http_req_receiving.............: avg=126.3µs  min=37.43µs med=101µs    max=100.13ms p(90)=139.35µs p(95)=152.59µs p(99.9)=1.53ms
     http_req_sending...............: avg=43.95µs  min=6.57µs  med=18.77µs  max=105.62ms p(90)=25.25µs  p(95)=30.76µs  p(99.9)=4.16ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=934.32ms min=6.26ms  med=815.68ms max=20.68s   p(90)=1.66s    p(95)=1.81s    p(99.9)=18.42s
     http_reqs......................: 15080   219.560135/s
     iteration_duration.............: avg=1s       min=18.83ms med=897.72ms max=20.68s   p(90)=1.69s    p(95)=1.82s    p(99.9)=18.47s
     iterations.....................: 14080   205.000444/s
     success_rate...................: 100.00% ✓ 14080      ✗ 0    
     vus............................: 76      min=0        max=500
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

     checks.........................: 100.00% ✓ 41244      ✗ 0    
     data_received..................: 1.3 GB  17 MB/s
     data_sent......................: 18 MB   243 kB/s
     http_req_blocked...............: avg=16.21µs  min=1.16µs  med=3.35µs  max=9.06ms   p(90)=5.01µs   p(95)=6.51µs   p(99.9)=2.56ms 
     http_req_connecting............: avg=10.99µs  min=0s      med=0s      max=8.98ms   p(90)=0s       p(95)=0s       p(99.9)=2.54ms 
     http_req_duration..............: avg=478.82ms min=8.54ms  med=556.1ms max=1.29s    p(90)=801.99ms p(95)=855.04ms p(99.9)=1.19s  
       { expected_response:true }...: avg=478.82ms min=8.54ms  med=556.1ms max=1.29s    p(90)=801.99ms p(95)=855.04ms p(99.9)=1.19s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14748
     http_req_receiving.............: avg=297.78µs min=33.08µs med=91.67µs max=175.11ms p(90)=133.11µs p(95)=146.03µs p(99.9)=93.89ms
     http_req_sending...............: avg=33.51µs  min=6µs     med=16.52µs max=105.23ms p(90)=22.53µs  p(95)=27.84µs  p(99.9)=1.96ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=478.48ms min=8.42ms  med=556ms   max=1.29s    p(90)=801.92ms p(95)=854.93ms p(99.9)=1.19s  
     http_reqs......................: 14748   198.101505/s
     iteration_duration.............: avg=513.59ms min=11.35ms med=583.6ms max=1.3s     p(90)=808.87ms p(95)=861ms    p(99.9)=1.2s   
     iterations.....................: 13748   184.669073/s
     success_rate...................: 100.00% ✓ 13748      ✗ 0    
     vus............................: 71      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 399252      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=20.45µs  min=1.08µs  med=2.95µs   max=56.53ms  p(90)=4.72µs   p(95)=5.96µs   p(99.9)=2.51ms  
     http_req_connecting............: avg=16.75µs  min=0s      med=0s       max=56.37ms  p(90)=0s       p(95)=0s       p(99.9)=2.4ms   
     http_req_duration..............: avg=106.07ms min=1.77ms  med=99.14ms  max=377.27ms p(90)=205.22ms p(95)=221.21ms p(99.9)=273.56ms
       { expected_response:true }...: avg=106.07ms min=1.77ms  med=99.14ms  max=377.27ms p(90)=205.22ms p(95)=221.21ms p(99.9)=273.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134084
     http_req_receiving.............: avg=195.81µs min=29.87µs med=64.21µs  max=243.65ms p(90)=178.73µs p(95)=426.25µs p(99.9)=23.83ms 
     http_req_sending...............: avg=78.38µs  min=4.99µs  med=11.7µs   max=141.86ms p(90)=22.11µs  p(95)=143.7µs  p(99.9)=10.39ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.79ms min=1.69ms  med=98.84ms  max=338.75ms p(90)=204.87ms p(95)=220.77ms p(99.9)=270.64ms
     http_reqs......................: 134084  2160.161533/s
     iteration_duration.............: avg=107.16ms min=3.47ms  med=100.37ms max=385.92ms p(90)=205.77ms p(95)=221.71ms p(99.9)=275.76ms
     iterations.....................: 133084  2144.051024/s
     success_rate...................: 100.00% ✓ 133084      ✗ 0     
     vus............................: 61      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 373437      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 151 MB  2.4 MB/s
     http_req_blocked...............: avg=17.72µs  min=1.04µs  med=2.85µs   max=64.2ms   p(90)=4.69µs   p(95)=6.04µs   p(99.9)=2.28ms  
     http_req_connecting............: avg=14.08µs  min=0s      med=0s       max=64.07ms  p(90)=0s       p(95)=0s       p(99.9)=2.19ms  
     http_req_duration..............: avg=113.39ms min=1.69ms  med=107.16ms max=469.96ms p(90)=216.9ms  p(95)=236.93ms p(99.9)=361.81ms
       { expected_response:true }...: avg=113.39ms min=1.69ms  med=107.16ms max=469.96ms p(90)=216.9ms  p(95)=236.93ms p(99.9)=361.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 125479
     http_req_receiving.............: avg=1.49ms   min=53.87µs med=273.66µs max=173.34ms p(90)=2.8ms    p(95)=5.08ms   p(99.9)=69.2ms  
     http_req_sending...............: avg=71.17µs  min=5.48µs  med=11.17µs  max=109.42ms p(90)=22.64µs  p(95)=132.89µs p(99.9)=9.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.83ms min=1.6ms   med=105.51ms max=467.85ms p(90)=214.89ms p(95)=234.78ms p(99.9)=358.42ms
     http_reqs......................: 125479  2021.474286/s
     iteration_duration.............: avg=114.59ms min=3.2ms   med=108.48ms max=470.19ms p(90)=217.5ms  p(95)=237.49ms p(99.9)=362.91ms
     iterations.....................: 124479  2005.364226/s
     success_rate...................: 100.00% ✓ 124479      ✗ 0     
     vus............................: 61      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 355776      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=16.63µs  min=1.04µs  med=2.81µs   max=64.13ms  p(90)=4.6µs    p(95)=5.81µs   p(99.9)=2.47ms  
     http_req_connecting............: avg=13.08µs  min=0s      med=0s       max=63.97ms  p(90)=0s       p(95)=0s       p(99.9)=2.25ms  
     http_req_duration..............: avg=119.01ms min=1.74ms  med=110.88ms max=677.19ms p(90)=232.08ms p(95)=266.08ms p(99.9)=446.59ms
       { expected_response:true }...: avg=119.01ms min=1.74ms  med=110.88ms max=677.19ms p(90)=232.08ms p(95)=266.08ms p(99.9)=446.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119592
     http_req_receiving.............: avg=2.93ms   min=53.19µs med=152.9µs  max=312.02ms p(90)=4.41ms   p(95)=10.58ms  p(99.9)=137.52ms
     http_req_sending...............: avg=65.66µs  min=5.3µs   med=10.94µs  max=53.39ms  p(90)=20.75µs  p(95)=124.57µs p(99.9)=8.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116ms    min=1.66ms  med=108.61ms max=573.96ms p(90)=226.47ms p(95)=258.52ms p(99.9)=419.75ms
     http_reqs......................: 119592  1924.125448/s
     iteration_duration.............: avg=120.32ms min=2.9ms   med=112.35ms max=677.39ms p(90)=232.92ms p(95)=267ms    p(99.9)=447.06ms
     iterations.....................: 118592  1908.036367/s
     success_rate...................: 100.00% ✓ 118592      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 190389      ✗ 0    
     data_received..................: 5.6 GB  90 MB/s
     data_sent......................: 77 MB   1.2 MB/s
     http_req_blocked...............: avg=7.66µs   min=1.07µs  med=2.85µs   max=31.93ms  p(90)=4.65µs   p(95)=5.72µs   p(99.9)=680.77µs
     http_req_connecting............: avg=4.03µs   min=0s      med=0s       max=31.86ms  p(90)=0s       p(95)=0s       p(99.9)=572.09µs
     http_req_duration..............: avg=221.44ms min=2.18ms  med=222.04ms max=704.15ms p(90)=409.84ms p(95)=443.77ms p(99.9)=601.36ms
       { expected_response:true }...: avg=221.44ms min=2.18ms  med=222.04ms max=704.15ms p(90)=409.84ms p(95)=443.77ms p(99.9)=601.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 64463
     http_req_receiving.............: avg=93.14µs  min=30.44µs med=74.92µs  max=122.09ms p(90)=115.61µs p(95)=131.52µs p(99.9)=1.59ms  
     http_req_sending...............: avg=34.56µs  min=5.6µs   med=12.55µs  max=84.88ms  p(90)=19.62µs  p(95)=23.55µs  p(99.9)=4.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=221.32ms min=2.09ms  med=221.88ms max=704.09ms p(90)=409.73ms p(95)=443.65ms p(99.9)=601.25ms
     http_reqs......................: 64463   1027.261068/s
     iteration_duration.............: avg=225.2ms  min=5.38ms  med=226.31ms max=704.35ms p(90)=411.18ms p(95)=444.75ms p(99.9)=601.72ms
     iterations.....................: 63463   1011.325399/s
     success_rate...................: 100.00% ✓ 63463       ✗ 0    
     vus............................: 92      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89418      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   567 kB/s
     http_req_blocked...............: avg=9.86µs   min=1.21µs  med=3.2µs    max=46.71ms p(90)=5.01µs   p(95)=6.01µs   p(99.9)=923.7µs 
     http_req_connecting............: avg=5.54µs   min=0s      med=0s       max=46.65ms p(90)=0s       p(95)=0s       p(99.9)=856.89µs
     http_req_duration..............: avg=466.14ms min=4.14ms  med=436.7ms  max=1.89s   p(90)=911.2ms  p(95)=994.57ms p(99.9)=1.47s   
       { expected_response:true }...: avg=466.14ms min=4.14ms  med=436.7ms  max=1.89s   p(90)=911.2ms  p(95)=994.57ms p(99.9)=1.47s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30806
     http_req_receiving.............: avg=92.67µs  min=34.46µs med=83.15µs  max=34.03ms p(90)=119.92µs p(95)=134.43µs p(99.9)=902.66µs
     http_req_sending...............: avg=32.84µs  min=5.99µs  med=14.96µs  max=86.43ms p(90)=22.14µs  p(95)=25.45µs  p(99.9)=3.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=466.01ms min=4.05ms  med=436.61ms max=1.89s   p(90)=910.96ms p(95)=994.41ms p(99.9)=1.47s   
     http_reqs......................: 30806   472.363865/s
     iteration_duration.............: avg=481.98ms min=29.4ms  med=452.91ms max=1.89s   p(90)=914.81ms p(95)=998.2ms  p(99.9)=1.48s   
     iterations.....................: 29806   457.030363/s
     success_rate...................: 100.00% ✓ 29806      ✗ 0    
     vus............................: 66      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42024      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   264 kB/s
     http_req_blocked...............: avg=18.86µs  min=1.31µs  med=3.93µs   max=20.56ms p(90)=5.92µs   p(95)=7.69µs   p(99.9)=2.54ms  
     http_req_connecting............: avg=12.84µs  min=0s      med=0s       max=20.48ms p(90)=0s       p(95)=0s       p(99.9)=2.52ms  
     http_req_duration..............: avg=973.52ms min=6.34ms  med=851.05ms max=5.84s   p(90)=1.89s    p(95)=2.15s    p(99.9)=5.39s   
       { expected_response:true }...: avg=973.52ms min=6.34ms  med=851.05ms max=5.84s   p(90)=1.89s    p(95)=2.15s    p(99.9)=5.39s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15008
     http_req_receiving.............: avg=112.67µs min=34.13µs med=102.39µs max=56.66ms p(90)=140.58µs p(95)=153.25µs p(99.9)=910.88µs
     http_req_sending...............: avg=30.1µs   min=6.33µs  med=18.98µs  max=19.06ms p(90)=25.18µs  p(95)=30.62µs  p(99.9)=2.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=973.37ms min=6.25ms  med=850.93ms max=5.84s   p(90)=1.89s    p(95)=2.15s    p(99.9)=5.39s   
     http_reqs......................: 15008   219.488314/s
     iteration_duration.............: avg=1.04s    min=56.47ms med=950.97ms max=5.85s   p(90)=1.91s    p(95)=2.16s    p(99.9)=5.4s    
     iterations.....................: 14008   204.863559/s
     success_rate...................: 100.00% ✓ 14008      ✗ 0    
     vus............................: 65      min=0        max=500
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

     checks.........................: 100.00% ✓ 39492      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   243 kB/s
     http_req_blocked...............: avg=17.29µs  min=1.24µs  med=3.69µs   max=27.7ms   p(90)=5.48µs   p(95)=7.29µs   p(99.9)=2.19ms 
     http_req_connecting............: avg=11.75µs  min=0s      med=0s       max=27.64ms  p(90)=0s       p(95)=0s       p(99.9)=2.16ms 
     http_req_duration..............: avg=1.03s    min=8.69ms  med=939.16ms max=4.36s    p(90)=2.07s    p(95)=2.24s    p(99.9)=3.91s  
       { expected_response:true }...: avg=1.03s    min=8.69ms  med=939.16ms max=4.36s    p(90)=2.07s    p(95)=2.24s    p(99.9)=3.91s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14164
     http_req_receiving.............: avg=320.77µs min=34.93µs med=99.68µs  max=220.92ms p(90)=139.62µs p(95)=152.86µs p(99.9)=91.37ms
     http_req_sending...............: avg=36.24µs  min=5.99µs  med=17.97µs  max=41.54ms  p(90)=23.86µs  p(95)=29.62µs  p(99.9)=4.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=1.03s    min=8.59ms  med=939ms    max=4.36s    p(90)=2.07s    p(95)=2.24s    p(99.9)=3.91s  
     http_reqs......................: 14164   202.270345/s
     iteration_duration.............: avg=1.1s     min=38ms    med=1.03s    max=4.37s    p(90)=2.1s     p(95)=2.26s    p(99.9)=3.92s  
     iterations.....................: 13164   187.98975/s
     success_rate...................: 100.00% ✓ 13164      ✗ 0    
     vus............................: 58      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

