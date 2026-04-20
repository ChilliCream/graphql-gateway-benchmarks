## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 1,577 | 1,599 | 1,564 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.7 | 1,448 | 1,470 | 1,443 | 0.6% |  |
| cosmo | 0.307.0 | 1,168 | 1,179 | 1,156 | 0.8% | non-compatible response (4 across 3/9 runs) |
| grafbase | 0.53.3 | 1,126 | 1,146 | 1,117 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 501 | 512 | 494 | 1.3% |  |
| apollo-router | v2.13.1 | 389 | 400 | 386 | 1.1% |  |
| hive-gateway | 2.5.25 | 235 | 241 | 233 | 1.2% |  |
| apollo-gateway | 2.13.3 | 232 | 234 | 231 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 576849      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=2.81µs  min=992ns   med=2.12µs  max=4.65ms   p(90)=4.05µs   p(95)=5.04µs   p(99.9)=31.14µs
     http_req_connecting............: avg=193ns   min=0s      med=0s      max=2ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.96ms min=13.38ms med=30.7ms  max=355.64ms p(90)=36.76ms  p(95)=38.67ms  p(99.9)=56.59ms
       { expected_response:true }...: avg=30.96ms min=13.38ms med=30.7ms  max=355.64ms p(90)=36.76ms  p(95)=38.67ms  p(99.9)=56.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192383
     http_req_receiving.............: avg=84.62µs min=27.79µs med=52.78µs max=93.97ms  p(90)=104.43µs p(95)=146.68µs p(99.9)=2.66ms 
     http_req_sending...............: avg=31.2µs  min=5.23µs  med=9.2µs   max=68.97ms  p(90)=19.76µs  p(95)=34.45µs  p(99.9)=1.66ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.84ms min=13.32ms med=30.6ms  max=355.13ms p(90)=36.64ms  p(95)=38.53ms  p(99.9)=55.16ms
     http_reqs......................: 192383  1577.007418/s
     iteration_duration.............: avg=31.19ms min=13.54ms med=30.92ms max=363.22ms p(90)=36.97ms  p(95)=38.89ms  p(99.9)=57.21ms
     iterations.....................: 192283  1576.187695/s
     success_rate...................: 100.00% ✓ 192283      ✗ 0     
     vus............................: 27      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 530016      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.13µs   min=1µs     med=2.12µs   max=4.15ms   p(90)=3.89µs  p(95)=4.78µs   p(99.9)=29.41µs
     http_req_connecting............: avg=544ns    min=0s      med=0s       max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.7ms   min=14.36ms med=32.41ms  max=673.7ms  p(90)=41.33ms p(95)=44.94ms  p(99.9)=85.06ms
       { expected_response:true }...: avg=33.7ms   min=14.36ms med=32.41ms  max=673.7ms  p(90)=41.33ms p(95)=44.94ms  p(99.9)=85.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176772
     http_req_receiving.............: avg=764.09µs min=50.59µs med=111.19µs max=221.05ms p(90)=2.16ms  p(95)=3.29ms   p(99.9)=19.37ms
     http_req_sending...............: avg=38.33µs  min=4.87µs  med=9.09µs   max=248.18ms p(90)=19.99µs p(95)=102.57µs p(99.9)=2.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.9ms   min=13.87ms med=31.64ms  max=672.68ms p(90)=40.25ms p(95)=43.72ms  p(99.9)=81.93ms
     http_reqs......................: 176772  1448.874199/s
     iteration_duration.............: avg=33.95ms  min=14.63ms med=32.63ms  max=673.91ms p(90)=41.54ms p(95)=45.17ms  p(99.9)=88.47ms
     iterations.....................: 176672  1448.05457/s
     success_rate...................: 100.00% ✓ 176672      ✗ 0     
     vus............................: 40      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 427422      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.75µs  min=1.07µs  med=2.43µs  max=8.43ms   p(90)=4.21µs   p(95)=5µs      p(99.9)=36.32µs
     http_req_connecting............: avg=829ns   min=0s      med=0s      max=4.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.87ms min=19.39ms med=41.26ms max=328.87ms p(90)=50.91ms  p(95)=53.98ms  p(99.9)=69.47ms
       { expected_response:true }...: avg=41.87ms min=19.39ms med=41.26ms max=328.87ms p(90)=50.91ms  p(95)=53.98ms  p(99.9)=69.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142574
     http_req_receiving.............: avg=84.33µs min=28.53µs med=62.81µs max=40.52ms  p(90)=108.86µs p(95)=134.97µs p(99.9)=1.74ms 
     http_req_sending...............: avg=28.37µs min=4.99µs  med=10.74µs max=187.41ms p(90)=18.9µs   p(95)=23.52µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.75ms min=19.31ms med=41.16ms max=328.64ms p(90)=50.79ms  p(95)=53.84ms  p(99.9)=68.87ms
     http_reqs......................: 142574  1168.31207/s
     iteration_duration.............: avg=42.1ms  min=20.25ms med=41.47ms max=346.39ms p(90)=51.12ms  p(95)=54.17ms  p(99.9)=69.77ms
     iterations.....................: 142474  1167.492627/s
     success_rate...................: 100.00% ✓ 142474      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 412266      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.62µs  min=952ns   med=2.24µs  max=4.1ms    p(90)=4.74µs   p(95)=5.87µs   p(99.9)=43.54µs
     http_req_connecting............: avg=723ns   min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.38ms min=17.02ms med=42.89ms max=345.65ms p(90)=52.85ms  p(95)=56.18ms  p(99.9)=81.01ms
       { expected_response:true }...: avg=43.38ms min=17.02ms med=42.89ms max=345.65ms p(90)=52.85ms  p(95)=56.18ms  p(99.9)=81.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137522
     http_req_receiving.............: avg=96.31µs min=29.47µs med=59.3µs  max=28.48ms  p(90)=132.05µs p(95)=209.46µs p(99.9)=3.14ms 
     http_req_sending...............: avg=37.08µs min=5.21µs  med=9.97µs  max=136.69ms p(90)=24.06µs  p(95)=111.96µs p(99.9)=2.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.25ms min=16.92ms med=42.77ms max=340.7ms  p(90)=52.71ms  p(95)=56.02ms  p(99.9)=80.03ms
     http_reqs......................: 137522  1126.928718/s
     iteration_duration.............: avg=43.65ms min=17.7ms  med=43.13ms max=355.54ms p(90)=53.09ms  p(95)=56.41ms  p(99.9)=81.39ms
     iterations.....................: 137422  1126.109264/s
     success_rate...................: 100.00% ✓ 137422      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 183954     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   603 kB/s
     http_req_blocked...............: avg=5.03µs   min=1.1µs   med=2.85µs  max=4.75ms   p(90)=4.48µs   p(95)=5.08µs   p(99.9)=105.66µs
     http_req_connecting............: avg=1.83µs   min=0s      med=0s      max=4.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.49ms  min=18.48ms med=95.35ms max=380.02ms p(90)=114.71ms p(95)=124.75ms p(99.9)=225.07ms
       { expected_response:true }...: avg=97.49ms  min=18.48ms med=95.35ms max=380.02ms p(90)=114.71ms p(95)=124.75ms p(99.9)=225.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61418
     http_req_receiving.............: avg=124.05µs min=30.21µs med=77.33µs max=299.87ms p(90)=112.8µs  p(95)=126.66µs p(99.9)=939.41µs
     http_req_sending...............: avg=22.67µs  min=5.74µs  med=13.17µs max=76.36ms  p(90)=20.01µs  p(95)=22.29µs  p(99.9)=680.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.34ms  min=18.36ms med=95.24ms max=375.76ms p(90)=114.58ms p(95)=124.55ms p(99.9)=223.36ms
     http_reqs......................: 61418   501.815764/s
     iteration_duration.............: avg=97.86ms  min=34.39ms med=95.58ms max=388.34ms p(90)=114.95ms p(95)=125.07ms p(99.9)=227.86ms
     iterations.....................: 61318   500.998714/s
     success_rate...................: 100.00% ✓ 61318      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 142941     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 57 MB   468 kB/s
     http_req_blocked...............: avg=6.19µs   min=1.31µs  med=3.57µs   max=4.46ms   p(90)=5.18µs   p(95)=5.82µs   p(99.9)=1ms     
     http_req_connecting............: avg=2.39µs   min=0s      med=0s       max=4.42ms   p(90)=0s       p(95)=0s       p(99.9)=958.63µs
     http_req_duration..............: avg=125.45ms min=20.38ms med=123.56ms max=374.97ms p(90)=156.42ms p(95)=167.07ms p(99.9)=214.62ms
       { expected_response:true }...: avg=125.45ms min=20.38ms med=123.56ms max=374.97ms p(90)=156.42ms p(95)=167.07ms p(99.9)=214.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47747
     http_req_receiving.............: avg=93.86µs  min=31.2µs  med=88.52µs  max=29.69ms  p(90)=121.57µs p(95)=135.46µs p(99.9)=684.08µs
     http_req_sending...............: avg=23.27µs  min=5.76µs  med=16.9µs   max=52.18ms  p(90)=22.75µs  p(95)=24.86µs  p(99.9)=587.39µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.33ms min=20.25ms med=123.45ms max=374.62ms p(90)=156.3ms  p(95)=166.95ms p(99.9)=214.06ms
     http_reqs......................: 47747   389.730243/s
     iteration_duration.............: avg=125.96ms min=42.01ms med=123.86ms max=396.68ms p(90)=156.72ms p(95)=167.45ms p(99.9)=218.83ms
     iterations.....................: 47647   388.914003/s
     success_rate...................: 100.00% ✓ 47647      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 86004      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=7.68µs   min=1.23µs  med=3.57µs   max=4.08ms   p(90)=5µs      p(95)=5.59µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=3.91µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=208.45ms min=19.31ms med=200.13ms max=624.51ms p(90)=268.2ms  p(95)=417.92ms p(99.9)=532.05ms
       { expected_response:true }...: avg=208.45ms min=19.31ms med=200.13ms max=624.51ms p(90)=268.2ms  p(95)=417.92ms p(99.9)=532.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28768
     http_req_receiving.............: avg=133.82µs min=35.5µs  med=96.33µs  max=96.54ms  p(90)=128.87µs p(95)=142.29µs p(99.9)=9.74ms  
     http_req_sending...............: avg=30.73µs  min=6.14µs  med=17.82µs  max=105.46ms p(90)=22.81µs  p(95)=24.52µs  p(99.9)=585.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.29ms min=19.1ms  med=199.97ms max=624.37ms p(90)=268.06ms p(95)=417.79ms p(99.9)=531.7ms 
     http_reqs......................: 28768   235.270114/s
     iteration_duration.............: avg=209.42ms min=37.64ms med=200.56ms max=624.73ms p(90)=268.75ms p(95)=418.39ms p(99.9)=532.43ms
     iterations.....................: 28668   234.452295/s
     success_rate...................: 100.00% ✓ 28668      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 85479      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=8.02µs   min=1.26µs  med=3.48µs   max=4.5ms    p(90)=4.91µs   p(95)=5.52µs   p(99.9)=2.31ms  
     http_req_connecting............: avg=4.31µs   min=0s      med=0s       max=4.45ms   p(90)=0s       p(95)=0s       p(99.9)=2.28ms  
     http_req_duration..............: avg=209.79ms min=22.16ms med=226.21ms max=424.5ms  p(90)=254.24ms p(95)=261.54ms p(99.9)=332.74ms
       { expected_response:true }...: avg=209.79ms min=22.16ms med=226.21ms max=424.5ms  p(90)=254.24ms p(95)=261.54ms p(99.9)=332.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28593
     http_req_receiving.............: avg=101.98µs min=35.56µs med=93.22µs  max=84.08ms  p(90)=125.94µs p(95)=138.81µs p(99.9)=387.55µs
     http_req_sending...............: avg=33.38µs  min=6.25µs  med=17.43µs  max=125.27ms p(90)=22.52µs  p(95)=24.4µs   p(99.9)=524.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.66ms min=21.97ms med=226.08ms max=423.93ms p(90)=254.11ms p(95)=261.37ms p(99.9)=331.69ms
     http_reqs......................: 28593   232.649539/s
     iteration_duration.............: avg=210.73ms min=72.38ms med=226.55ms max=434.3ms  p(90)=254.53ms p(95)=261.88ms p(99.9)=334.54ms
     iterations.....................: 28493   231.83588/s
     success_rate...................: 100.00% ✓ 28493      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

