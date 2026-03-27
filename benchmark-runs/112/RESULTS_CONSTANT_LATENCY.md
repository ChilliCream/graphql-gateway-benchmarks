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
| hive-router | v0.0.42 | 1,592 | 1,620 | 1,583 | 0.8% |  |
| hotchocolate | 16.0.0-rc.1.19 | 1,422 | 1,432 | 1,416 | 0.4% |  |
| cosmo | 0.295.0 | 1,140 | 1,161 | 1,136 | 0.9% | non-compatible response (3 across 2/9 runs) |
| grafbase | 0.53.2 | 1,140 | 1,162 | 1,135 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.11 | 570 | 582 | 566 | 1.0% |  |
| apollo-router | v2.12.0 | 396 | 405 | 392 | 1.2% | non-compatible response (1 across 1/9 runs) |
| hive-gateway | 2.5.11 | 265 | 268 | 263 | 0.6% |  |
| apollo-gateway | 2.13.3 | 237 | 238 | 235 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 582498      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.29µs  min=972ns   med=2.3µs   max=3.99ms   p(90)=4.14µs   p(95)=5.11µs   p(99.9)=37.85µs
     http_req_connecting............: avg=519ns   min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.65ms min=13.66ms med=30.38ms max=328.99ms p(90)=36.42ms  p(95)=38.34ms  p(99.9)=58.84ms
       { expected_response:true }...: avg=30.65ms min=13.66ms med=30.38ms max=328.99ms p(90)=36.42ms  p(95)=38.34ms  p(99.9)=58.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194266
     http_req_receiving.............: avg=83.19µs min=27.27µs med=52.9µs  max=29.07ms  p(90)=104.52µs p(95)=152.52µs p(99.9)=2.3ms  
     http_req_sending...............: avg=36.48µs min=5.21µs  med=9.62µs  max=142.31ms p(90)=19.62µs  p(95)=64.05µs  p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.53ms min=13.54ms med=30.27ms max=328.28ms p(90)=36.3ms   p(95)=38.2ms   p(99.9)=57.8ms 
     http_reqs......................: 194266  1592.244666/s
     iteration_duration.............: avg=30.89ms min=13.92ms med=30.6ms  max=358.25ms p(90)=36.64ms  p(95)=38.56ms  p(99.9)=59.56ms
     iterations.....................: 194166  1591.425045/s
     success_rate...................: 100.00% ✓ 194166      ✗ 0     
     vus............................: 39      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.19)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 520461      ✗ 0     
     data_received..................: 15 GB   125 MB/s
     data_sent......................: 209 MB  1.7 MB/s
     http_req_blocked...............: avg=3.07µs   min=1µs     med=2.12µs  max=3.86ms   p(90)=3.95µs  p(95)=4.79µs   p(99.9)=34.19µs
     http_req_connecting............: avg=454ns    min=0s      med=0s      max=3.75ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=34.34ms  min=13.96ms med=33.09ms max=617.87ms p(90)=42.02ms p(95)=45.57ms  p(99.9)=87.01ms
       { expected_response:true }...: avg=34.34ms  min=13.96ms med=33.09ms max=617.87ms p(90)=42.02ms p(95)=45.57ms  p(99.9)=87.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173587
     http_req_receiving.............: avg=791.36µs min=51.37µs med=111.8µs max=199.94ms p(90)=2.24ms  p(95)=3.43ms   p(99.9)=16.58ms
     http_req_sending...............: avg=36.95µs  min=5.14µs  med=9.16µs  max=190.16ms p(90)=20.22µs p(95)=105.09µs p(99.9)=2.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.51ms  min=13.82ms med=32.29ms max=616.75ms p(90)=40.93ms p(95)=44.4ms   p(99.9)=84.99ms
     http_reqs......................: 173587  1422.743884/s
     iteration_duration.............: avg=34.57ms  min=14.24ms med=33.32ms max=618.1ms  p(90)=42.24ms p(95)=45.78ms  p(99.9)=87.64ms
     iterations.....................: 173487  1421.924269/s
     success_rate...................: 100.00% ✓ 173487      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 417102      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=2.83µs  min=992ns   med=2.09µs  max=5.27ms   p(90)=3.63µs   p(95)=4.39µs   p(99.9)=36.24µs
     http_req_connecting............: avg=319ns   min=0s      med=0s      max=2.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.92ms min=15.9ms  med=42.37ms max=342.87ms p(90)=52.14ms  p(95)=55.14ms  p(99.9)=70.19ms
       { expected_response:true }...: avg=42.92ms min=15.9ms  med=42.37ms max=342.87ms p(90)=52.14ms  p(95)=55.14ms  p(99.9)=70.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139134
     http_req_receiving.............: avg=121.1µs min=28.79µs med=61.2µs  max=253.02ms p(90)=104.46µs p(95)=130.63µs p(99.9)=2.1ms  
     http_req_sending...............: avg=23.72µs min=5.25µs  med=9.95µs  max=34.2ms   p(90)=17.46µs  p(95)=22.02µs  p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.78ms min=15.78ms med=42.27ms max=142.03ms p(90)=52.03ms  p(95)=55.04ms  p(99.9)=69.58ms
     http_reqs......................: 139134  1140.299929/s
     iteration_duration.............: avg=43.14ms min=18.61ms med=42.57ms max=355.66ms p(90)=52.34ms  p(95)=55.34ms  p(99.9)=70.59ms
     iterations.....................: 139034  1139.480359/s
     success_rate...................: 100.00% ✓ 139034      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 417336      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.36µs  min=982ns   med=2.19µs  max=8.73ms   p(90)=4.58µs   p(95)=5.75µs   p(99.9)=45.46µs
     http_req_connecting............: avg=477ns   min=0s      med=0s      max=3.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.85ms min=17.25ms med=42.38ms max=354.69ms p(90)=52.05ms  p(95)=55.32ms  p(99.9)=79.58ms
       { expected_response:true }...: avg=42.85ms min=17.25ms med=42.38ms max=354.69ms p(90)=52.05ms  p(95)=55.32ms  p(99.9)=79.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139212
     http_req_receiving.............: avg=97.8µs  min=29.57µs med=60.1µs  max=159.25ms p(90)=132.21µs p(95)=211.09µs p(99.9)=3.03ms 
     http_req_sending...............: avg=37.65µs min=4.94µs  med=9.88µs  max=190.68ms p(90)=23.82µs  p(95)=109.98µs p(99.9)=2.47ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.71ms min=17.1ms  med=42.25ms max=354.22ms p(90)=51.9ms   p(95)=55.16ms  p(99.9)=79.05ms
     http_reqs......................: 139212  1140.863717/s
     iteration_duration.............: avg=43.12ms min=18.28ms med=42.62ms max=369.01ms p(90)=52.28ms  p(95)=55.56ms  p(99.9)=80.12ms
     iterations.....................: 139112  1140.044202/s
     success_rate...................: 100.00% ✓ 139112      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 209403     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   686 kB/s
     http_req_blocked...............: avg=4.84µs  min=1.11µs  med=2.94µs  max=4.1ms    p(90)=4.53µs   p(95)=5.16µs   p(99.9)=47.04µs 
     http_req_connecting............: avg=1.6µs   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.62ms min=19.49ms med=83.8ms  max=359.51ms p(90)=99.19ms  p(95)=106.41ms p(99.9)=203.56ms
       { expected_response:true }...: avg=85.62ms min=19.49ms med=83.8ms  max=359.51ms p(90)=99.19ms  p(95)=106.41ms p(99.9)=203.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69901
     http_req_receiving.............: avg=89.17µs min=31.92µs med=76.52µs max=187.81ms p(90)=113.08µs p(95)=127.52µs p(99.9)=905.22µs
     http_req_sending...............: avg=26.93µs min=5.21µs  med=13.9µs  max=110.46ms p(90)=20.48µs  p(95)=22.96µs  p(99.9)=746.12µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.5ms  min=19.36ms med=83.68ms max=358.82ms p(90)=99.08ms  p(95)=106.28ms p(99.9)=203.21ms
     http_reqs......................: 69901   570.939055/s
     iteration_duration.............: avg=85.96ms min=42.13ms med=84.04ms max=384.33ms p(90)=99.42ms  p(95)=106.7ms  p(99.9)=205.85ms
     iterations.....................: 69801   570.122272/s
     success_rate...................: 100.00% ✓ 69801      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 145425     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=5.68µs   min=1.22µs  med=3.4µs    max=4.06ms   p(90)=4.93µs   p(95)=5.55µs   p(99.9)=248.99µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=98.79µs 
     http_req_duration..............: avg=123.32ms min=20.33ms med=121.37ms max=344.72ms p(90)=153.75ms p(95)=163.85ms p(99.9)=210.82ms
       { expected_response:true }...: avg=123.32ms min=20.33ms med=121.37ms max=344.72ms p(90)=153.75ms p(95)=163.85ms p(99.9)=210.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48575
     http_req_receiving.............: avg=94.6µs   min=30.27µs med=85.15µs  max=149.93ms p(90)=118.37µs p(95)=131.58µs p(99.9)=789.58µs
     http_req_sending...............: avg=23.86µs  min=5.66µs  med=16.11µs  max=61.92ms  p(90)=22.02µs  p(95)=24.24µs  p(99.9)=663.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.2ms  min=20.19ms med=121.27ms max=344.07ms p(90)=153.65ms p(95)=163.71ms p(99.9)=210.11ms
     http_reqs......................: 48575   396.481018/s
     iteration_duration.............: avg=123.82ms min=54.83ms med=121.67ms max=379.31ms p(90)=154.05ms p(95)=164.14ms p(99.9)=214.28ms
     iterations.....................: 48475   395.664794/s
     success_rate...................: 100.00% ✓ 48475      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97017      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=7.15µs   min=1.22µs  med=3.62µs   max=4.26ms   p(90)=5.25µs   p(95)=5.88µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=3.23µs   min=0s      med=0s       max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=184.8ms  min=18.58ms med=169.04ms max=909.59ms p(90)=230.03ms p(95)=372.36ms p(99.9)=541.63ms
       { expected_response:true }...: avg=184.8ms  min=18.58ms med=169.04ms max=909.59ms p(90)=230.03ms p(95)=372.36ms p(99.9)=541.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32439
     http_req_receiving.............: avg=103.08µs min=36.51µs med=97.32µs  max=26.92ms  p(90)=130.93µs p(95)=145.48µs p(99.9)=700.78µs
     http_req_sending...............: avg=29.29µs  min=6.39µs  med=18.07µs  max=82.04ms  p(90)=23.5µs   p(95)=25.46µs  p(99.9)=605.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.67ms min=18.46ms med=168.93ms max=909.48ms p(90)=229.91ms p(95)=371.87ms p(99.9)=540.34ms
     http_reqs......................: 32439   265.193362/s
     iteration_duration.............: avg=185.62ms min=36ms    med=169.45ms max=909.83ms p(90)=230.45ms p(95)=374.44ms p(99.9)=541.98ms
     iterations.....................: 32339   264.375848/s
     success_rate...................: 100.00% ✓ 32339      ✗ 0    
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

     checks.........................: 100.00% ✓ 87357      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=6.25µs   min=1.14µs  med=3.39µs   max=3.76ms   p(90)=4.83µs   p(95)=5.4µs    p(99.9)=1.01ms  
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=998.14µs
     http_req_duration..............: avg=205.28ms min=21.08ms med=199.76ms max=396.74ms p(90)=247.96ms p(95)=254.13ms p(99.9)=324.18ms
       { expected_response:true }...: avg=205.28ms min=21.08ms med=199.76ms max=396.74ms p(90)=247.96ms p(95)=254.13ms p(99.9)=324.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29219
     http_req_receiving.............: avg=97.59µs  min=34.64µs med=92.06µs  max=21.51ms  p(90)=126.14µs p(95)=139.88µs p(99.9)=547.19µs
     http_req_sending...............: avg=36.55µs  min=6.14µs  med=17.07µs  max=182.44ms p(90)=22.64µs  p(95)=24.68µs  p(99.9)=638.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.14ms min=20.96ms med=199.63ms max=396.37ms p(90)=247.84ms p(95)=253.99ms p(99.9)=323.92ms
     http_reqs......................: 29219   237.856021/s
     iteration_duration.............: avg=206.2ms  min=56.25ms med=200.76ms max=414.58ms p(90)=248.26ms p(95)=254.42ms p(99.9)=325.83ms
     iterations.....................: 29119   237.041976/s
     success_rate...................: 100.00% ✓ 29119      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

