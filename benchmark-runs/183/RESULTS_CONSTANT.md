## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,996 | 3,169 | 2,884 | 2.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,092 | 2,144 | 2,072 | 1.1% |  |
| grafbase | 0.53.3 | 2,026 | 2,095 | 2,007 | 1.4% |  |
| cosmo | 0.307.0 | 1,285 | 1,301 | 1,274 | 0.8% | non-compatible response (6 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 547 | 554 | 541 | 0.9% |  |
| apollo-router | v2.13.1 | 401 | 411 | 394 | 1.4% |  |
| hive-gateway | 2.5.25 | 256 | 259 | 254 | 0.7% |  |
| apollo-gateway | 2.13.3 | 247 | 249 | 245 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,375 | 2,515 | 2,350 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,971 | 2,019 | 1,956 | 1.0% |  |
| grafbase | 0.53.3 | 1,544 | 1,586 | 1,520 | 1.5% |  |
| cosmo | 0.307.0 | 1,175 | 1,198 | 1,167 | 0.9% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 522 | 533 | 517 | 1.1% |  |
| apollo-router | v2.13.1 | 370 | 382 | 367 | 1.4% |  |
| hive-gateway | 2.5.25 | 251 | 254 | 249 | 0.8% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 233 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1080417     ✗ 0     
     data_received..................: 32 GB   263 MB/s
     data_sent......................: 433 MB  3.6 MB/s
     http_req_blocked...............: avg=3.06µs   min=981ns   med=2.32µs  max=25.19ms  p(90)=3.59µs   p(95)=4.25µs   p(99.9)=37.36µs
     http_req_connecting............: avg=268ns    min=0s      med=0s      max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.42ms  min=1.63ms  med=15.48ms max=346.92ms p(90)=24.35ms  p(95)=28.14ms  p(99.9)=51.53ms
       { expected_response:true }...: avg=16.42ms  min=1.63ms  med=15.48ms max=346.92ms p(90)=24.35ms  p(95)=28.14ms  p(99.9)=51.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 360239
     http_req_receiving.............: avg=133.69µs min=27.46µs med=52.26µs max=148.09ms p(90)=105.05µs p(95)=284.74µs p(99.9)=11.43ms
     http_req_sending...............: avg=62.47µs  min=5.29µs  med=9.47µs  max=160.56ms p(90)=16.58µs  p(95)=126.36µs p(99.9)=10.52ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.22ms  min=1.57ms  med=15.33ms max=346.5ms  p(90)=24.08ms  p(95)=27.75ms  p(99.9)=49.92ms
     http_reqs......................: 360239  2996.847953/s
     iteration_duration.............: avg=16.65ms  min=2.1ms   med=15.69ms max=359.31ms p(90)=24.58ms  p(95)=28.38ms  p(99.9)=53ms   
     iterations.....................: 360139  2996.016047/s
     success_rate...................: 100.00% ✓ 360139      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 754848      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.23µs   min=1.07µs  med=2.4µs    max=12.1ms   p(90)=3.59µs   p(95)=4.2µs    p(99.9)=35.45µs 
     http_req_connecting............: avg=438ns    min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.6ms   min=2.51ms  med=14.83ms  max=335.76ms p(90)=53.47ms  p(95)=71.94ms  p(99.9)=172.16ms
       { expected_response:true }...: avg=23.6ms   min=2.51ms  med=14.83ms  max=335.76ms p(90)=53.47ms  p(95)=71.94ms  p(99.9)=172.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 251716
     http_req_receiving.............: avg=661.68µs min=52.31µs med=112.57µs max=250.35ms p(90)=959.02µs p(95)=1.46ms   p(99.9)=62.59ms 
     http_req_sending...............: avg=44.9µs   min=5.26µs  med=9.93µs   max=126.28ms p(90)=16.32µs  p(95)=108.21µs p(99.9)=3.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.89ms  min=2.37ms  med=14.31ms  max=335.62ms p(90)=52.04ms  p(95)=70.39ms  p(99.9)=169.25ms
     http_reqs......................: 251716  2092.31988/s
     iteration_duration.............: avg=23.83ms  min=3.46ms  med=15.05ms  max=346.12ms p(90)=53.69ms  p(95)=72.19ms  p(99.9)=173.93ms
     iterations.....................: 251616  2091.488658/s
     success_rate...................: 100.00% ✓ 251616      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 730587      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 293 MB  2.4 MB/s
     http_req_blocked...............: avg=5.67µs   min=1.04µs  med=2.48µs  max=46.75ms  p(90)=3.92µs   p(95)=4.63µs   p(99.9)=40.63µs
     http_req_connecting............: avg=2.68µs   min=0s      med=0s      max=46.71ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.38ms  min=1.99ms  med=24.13ms max=274.18ms p(90)=29.29ms  p(95)=31.64ms  p(99.9)=53.54ms
       { expected_response:true }...: avg=24.38ms  min=1.99ms  med=24.13ms max=274.18ms p(90)=29.29ms  p(95)=31.64ms  p(99.9)=53.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 243629
     http_req_receiving.............: avg=113.85µs min=29.53µs med=60.92µs max=245ms    p(90)=104.22µs p(95)=196.49µs p(99.9)=9.11ms 
     http_req_sending...............: avg=50.84µs  min=5.19µs  med=10.33µs max=148.45ms p(90)=17.36µs  p(95)=116.92µs p(99.9)=4.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.22ms  min=1.88ms  med=24.01ms max=256.88ms p(90)=29.11ms  p(95)=31.36ms  p(99.9)=52.36ms
     http_reqs......................: 243629  2026.00636/s
     iteration_duration.............: avg=24.62ms  min=3.41ms  med=24.34ms max=341.18ms p(90)=29.52ms  p(95)=31.89ms  p(99.9)=54.12ms
     iterations.....................: 243529  2025.174765/s
     success_rate...................: 100.00% ✓ 243529      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 463503      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=3.43µs  min=1.09µs med=2.45µs  max=3.96ms   p(90)=3.84µs  p(95)=4.48µs   p(99.9)=37.64µs
     http_req_connecting............: avg=632ns   min=0s     med=0s      max=3.92ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.59ms min=2.16ms med=38.05ms max=337.28ms p(90)=54.36ms p(95)=59.34ms  p(99.9)=84.57ms
       { expected_response:true }...: avg=38.59ms min=2.16ms med=38.05ms max=337.28ms p(90)=54.36ms p(95)=59.34ms  p(99.9)=84.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154601
     http_req_receiving.............: avg=81.57µs min=28.8µs med=61.59µs max=27.23ms  p(90)=98.89µs p(95)=118.02µs p(99.9)=2.05ms 
     http_req_sending...............: avg=29.51µs min=5.18µs med=10.81µs max=149.08ms p(90)=16.48µs p(95)=20.5µs   p(99.9)=1.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.48ms min=2.08ms med=37.94ms max=336.72ms p(90)=54.24ms p(95)=59.22ms  p(99.9)=84.22ms
     http_reqs......................: 154601  1285.425671/s
     iteration_duration.............: avg=38.82ms min=4.16ms med=38.25ms max=344.01ms p(90)=54.56ms p(95)=59.54ms  p(99.9)=85.28ms
     iterations.....................: 154501  1284.594224/s
     success_rate...................: 100.00% ✓ 154501      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 197625     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   657 kB/s
     http_req_blocked...............: avg=4.58µs   min=1.22µs  med=2.95µs  max=3.83ms   p(90)=4.5µs    p(95)=5.12µs   p(99.9)=71.03µs 
     http_req_connecting............: avg=1.32µs   min=0s      med=0s      max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.72ms  min=4.1ms   med=87.91ms max=313.58ms p(90)=110.35ms p(95)=122.68ms p(99.9)=218.19ms
       { expected_response:true }...: avg=90.72ms  min=4.1ms   med=87.91ms max=313.58ms p(90)=110.35ms p(95)=122.68ms p(99.9)=218.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65975
     http_req_receiving.............: avg=123.14µs min=31.15µs med=77.86µs max=228.73ms p(90)=112.31µs p(95)=125.01µs p(99.9)=1.3ms   
     http_req_sending...............: avg=22.81µs  min=5.62µs  med=13.37µs max=68.95ms  p(90)=20.05µs  p(95)=22.35µs  p(99.9)=657.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.58ms  min=4.04ms  med=87.79ms max=312.94ms p(90)=110.21ms p(95)=122.37ms p(99.9)=216.21ms
     http_reqs......................: 65975   547.248519/s
     iteration_duration.............: avg=91.1ms   min=24.19ms med=88.15ms max=328.85ms p(90)=110.59ms p(95)=122.96ms p(99.9)=221.13ms
     iterations.....................: 65875   546.419041/s
     success_rate...................: 100.00% ✓ 65875      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 145086     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 58 MB   482 kB/s
     http_req_blocked...............: avg=6.86µs   min=1.18µs  med=3.33µs   max=6.58ms   p(90)=4.74µs   p(95)=5.32µs   p(99.9)=247.74µs
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=6.55ms   p(90)=0s       p(95)=0s       p(99.9)=145.36µs
     http_req_duration..............: avg=123.59ms min=5.42ms  med=123.44ms max=367.6ms  p(90)=149.6ms  p(95)=157.36ms p(99.9)=193.05ms
       { expected_response:true }...: avg=123.59ms min=5.42ms  med=123.44ms max=367.6ms  p(90)=149.6ms  p(95)=157.36ms p(99.9)=193.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48462
     http_req_receiving.............: avg=95.97µs  min=32.85µs med=84.64µs  max=173.31ms p(90)=116.23µs p(95)=128.51µs p(99.9)=853.43µs
     http_req_sending...............: avg=24.78µs  min=5.86µs  med=15.46µs  max=51.24ms  p(90)=20.76µs  p(95)=22.6µs   p(99.9)=788.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.47ms min=5.31ms  med=123.33ms max=366.55ms p(90)=149.5ms  p(95)=157.25ms p(99.9)=192.72ms
     http_reqs......................: 48462   401.514752/s
     iteration_duration.............: avg=124.1ms  min=27.59ms med=123.75ms max=377.16ms p(90)=149.88ms p(95)=157.64ms p(99.9)=194.9ms 
     iterations.....................: 48362   400.686238/s
     success_rate...................: 100.00% ✓ 48362      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 92610      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   307 kB/s
     http_req_blocked...............: avg=15.84µs  min=1.34µs med=3.67µs   max=207.48ms p(90)=5.17µs   p(95)=5.82µs   p(99.9)=2.14ms  
     http_req_connecting............: avg=4µs      min=0s     med=0s       max=4.8ms    p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=193.54ms min=6.09ms med=176.93ms max=612.7ms  p(90)=228.5ms  p(95)=396.01ms p(99.9)=524.87ms
       { expected_response:true }...: avg=193.54ms min=6.09ms med=176.93ms max=612.7ms  p(90)=228.5ms  p(95)=396.01ms p(99.9)=524.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30970
     http_req_receiving.............: avg=105.4µs  min=34.5µs med=98.11µs  max=100.46ms p(90)=130.52µs p(95)=144.26µs p(99.9)=631.48µs
     http_req_sending...............: avg=43.71µs  min=6.22µs med=18.09µs  max=182.73ms p(90)=23.18µs  p(95)=25.15µs  p(99.9)=607.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.39ms min=6ms    med=176.8ms  max=612.59ms p(90)=228.3ms  p(95)=395.87ms p(99.9)=524.8ms 
     http_reqs......................: 30970   256.021812/s
     iteration_duration.............: avg=194.47ms min=25ms   med=177.32ms max=612.97ms p(90)=229ms    p(95)=396.87ms p(99.9)=525.07ms
     iterations.....................: 30870   255.195136/s
     success_rate...................: 100.00% ✓ 30870      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 89592      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=6.51µs   min=1.26µs  med=3.14µs   max=4.07ms   p(90)=4.39µs   p(95)=4.9µs    p(99.9)=1.37ms  
     http_req_connecting............: avg=3.21µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=200.09ms min=8.35ms  med=199.81ms max=438.5ms  p(90)=227.51ms p(95)=236.42ms p(99.9)=304.9ms 
       { expected_response:true }...: avg=200.09ms min=8.35ms  med=199.81ms max=438.5ms  p(90)=227.51ms p(95)=236.42ms p(99.9)=304.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29964
     http_req_receiving.............: avg=94.36µs  min=35.69µs med=86.51µs  max=94.93ms  p(90)=118.32µs p(95)=130.36µs p(99.9)=606.57µs
     http_req_sending...............: avg=36.74µs  min=5.83µs  med=15.02µs  max=194.87ms p(90)=20.02µs  p(95)=21.8µs   p(99.9)=831.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.96ms min=8.22ms  med=199.69ms max=438.32ms p(90)=227.39ms p(95)=236.31ms p(99.9)=304.63ms
     http_reqs......................: 29964   247.467642/s
     iteration_duration.............: avg=201.03ms min=47.1ms  med=200.32ms max=450.94ms p(90)=227.78ms p(95)=236.71ms p(99.9)=312.41ms
     iterations.....................: 29864   246.641759/s
     success_rate...................: 100.00% ✓ 29864      ✗ 0    
     vus............................: 32      min=32       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 856581      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=3.28µs  min=1.06µs  med=2.55µs  max=13.39ms  p(90)=4.04µs   p(95)=4.85µs   p(99.9)=38.02µs
     http_req_connecting............: avg=157ns   min=0s      med=0s      max=2.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.76ms min=1.67ms  med=20.3ms  max=315.19ms p(90)=28.71ms  p(95)=31.74ms  p(99.9)=53.59ms
       { expected_response:true }...: avg=20.76ms min=1.67ms  med=20.3ms  max=315.19ms p(90)=28.71ms  p(95)=31.74ms  p(99.9)=53.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285627
     http_req_receiving.............: avg=118µs   min=28.44µs med=58.16µs max=175.3ms  p(90)=110.27µs p(95)=273.55µs p(99.9)=9.12ms 
     http_req_sending...............: avg=55.94µs min=5.13µs  med=10.7µs  max=205.85ms p(90)=19.28µs  p(95)=130.4µs  p(99.9)=5.49ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.59ms min=1.62ms  med=20.15ms max=314.7ms  p(90)=28.49ms  p(95)=31.48ms  p(99.9)=52.48ms
     http_reqs......................: 285627  2375.9399/s
     iteration_duration.............: avg=21ms    min=3.63ms  med=20.51ms max=326.44ms p(90)=28.93ms  p(95)=31.98ms  p(99.9)=54.33ms
     iterations.....................: 285527  2375.108067/s
     success_rate...................: 100.00% ✓ 285527      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 711132      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=3.36µs   min=1.02µs  med=2.49µs   max=16.5ms   p(90)=3.98µs  p(95)=4.71µs   p(99.9)=40.33µs 
     http_req_connecting............: avg=311ns    min=0s      med=0s       max=3.7ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.06ms  min=1.91ms  med=17.31ms  max=536.1ms  p(90)=52.59ms p(95)=69.32ms  p(99.9)=185.67ms
       { expected_response:true }...: avg=25.06ms  min=1.91ms  med=17.31ms  max=536.1ms  p(90)=52.59ms p(95)=69.32ms  p(99.9)=185.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237144
     http_req_receiving.............: avg=682.94µs min=51.31µs med=106.86µs max=209.72ms p(90)=1.13ms  p(95)=1.83ms   p(99.9)=57.34ms 
     http_req_sending...............: avg=47.24µs  min=5.34µs  med=10.22µs  max=205.32ms p(90)=18.73µs p(95)=115.07µs p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.33ms  min=1.81ms  med=16.74ms  max=535.64ms p(90)=51.3ms  p(95)=67.98ms  p(99.9)=184.48ms
     http_reqs......................: 237144  1971.697897/s
     iteration_duration.............: avg=25.3ms   min=2.53ms  med=17.53ms  max=536.31ms p(90)=52.83ms p(95)=69.58ms  p(99.9)=188.03ms
     iterations.....................: 237044  1970.866462/s
     success_rate...................: 100.00% ✓ 237044      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 557217      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.9 MB/s
     http_req_blocked...............: avg=3.48µs   min=982ns   med=2.28µs  max=4.48ms   p(90)=4.56µs  p(95)=5.73µs   p(99.9)=46.57µs
     http_req_connecting............: avg=580ns    min=0s      med=0s      max=4.45ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.02ms  min=2.41ms  med=31.13ms max=335.9ms  p(90)=42.81ms p(95)=47.65ms  p(99.9)=93.49ms
       { expected_response:true }...: avg=32.02ms  min=2.41ms  med=31.13ms max=335.9ms  p(90)=42.81ms p(95)=47.65ms  p(99.9)=93.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185839
     http_req_receiving.............: avg=112.45µs min=30.37µs med=60.01µs max=91.73ms  p(90)=133.5µs p(95)=275.82µs p(99.9)=5.71ms 
     http_req_sending...............: avg=47.61µs  min=5.13µs  med=10.25µs max=121.04ms p(90)=24.14µs p(95)=134.51µs p(99.9)=3.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.86ms  min=2.3ms   med=31ms    max=335.75ms p(90)=42.61ms p(95)=47.43ms  p(99.9)=92.85ms
     http_reqs......................: 185839  1544.714075/s
     iteration_duration.............: avg=32.29ms  min=4.41ms  med=31.37ms max=353.03ms p(90)=43.04ms p(95)=47.9ms   p(99.9)=94.13ms
     iterations.....................: 185739  1543.882864/s
     success_rate...................: 100.00% ✓ 185739      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 424086      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.15µs  min=1.02µs  med=2.34µs  max=3.54ms   p(90)=3.85µs   p(95)=4.5µs    p(99.9)=37.7µs 
     http_req_connecting............: avg=466ns   min=0s      med=0s      max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.19ms min=2.18ms  med=41.68ms max=345.44ms p(90)=59.29ms  p(95)=64.75ms  p(99.9)=90.4ms 
       { expected_response:true }...: avg=42.19ms min=2.18ms  med=41.68ms max=345.44ms p(90)=59.29ms  p(95)=64.75ms  p(99.9)=90.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141462
     http_req_receiving.............: avg=80.51µs min=29.99µs med=64.27µs max=24.25ms  p(90)=100.79µs p(95)=118.41µs p(99.9)=1.62ms 
     http_req_sending...............: avg=26.76µs min=5.29µs  med=11.01µs max=133.58ms p(90)=17.09µs  p(95)=20.64µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.08ms min=2.11ms  med=41.56ms max=345.3ms  p(90)=59.18ms  p(95)=64.64ms  p(99.9)=90.08ms
     http_reqs......................: 141462  1175.961169/s
     iteration_duration.............: avg=42.43ms min=4.39ms  med=41.89ms max=353.82ms p(90)=59.51ms  p(95)=64.96ms  p(99.9)=91.52ms
     iterations.....................: 141362  1175.129877/s
     success_rate...................: 100.00% ✓ 141362      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 188826     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   628 kB/s
     http_req_blocked...............: avg=4.25µs  min=1.2µs   med=3.24µs  max=2.39ms   p(90)=4.81µs   p(95)=5.44µs   p(99.9)=44.9µs  
     http_req_connecting............: avg=802ns   min=0s      med=0s      max=2.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.94ms min=4.48ms  med=92.68ms max=341.27ms p(90)=114.48ms p(95)=126.7ms  p(99.9)=223.29ms
       { expected_response:true }...: avg=94.94ms min=4.48ms  med=92.68ms max=341.27ms p(90)=114.48ms p(95)=126.7ms  p(99.9)=223.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63042
     http_req_receiving.............: avg=92.48µs min=31.41µs med=83.15µs max=81.6ms   p(90)=117.96µs p(95)=131.32µs p(99.9)=883.37µs
     http_req_sending...............: avg=24.59µs min=5.78µs  med=14.3µs  max=132.79ms p(90)=20.9µs   p(95)=23.13µs  p(99.9)=667.42µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.82ms min=4.35ms  med=92.58ms max=340.91ms p(90)=114.36ms p(95)=126.56ms p(99.9)=223.17ms
     http_reqs......................: 63042   522.695764/s
     iteration_duration.............: avg=95.34ms min=29.75ms med=92.93ms max=364.36ms p(90)=114.76ms p(95)=127.06ms p(99.9)=224.82ms
     iterations.....................: 62942   521.86664/s
     success_rate...................: 100.00% ✓ 62942      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 134016     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   445 kB/s
     http_req_blocked...............: avg=6.18µs   min=1.26µs  med=3.54µs   max=4ms      p(90)=5.02µs   p(95)=5.6µs    p(99.9)=362.02µs
     http_req_connecting............: avg=2.41µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=332.15µs
     http_req_duration..............: avg=133.78ms min=5.91ms  med=131.24ms max=371.77ms p(90)=177.54ms p(95)=191.07ms p(99.9)=246.6ms 
       { expected_response:true }...: avg=133.78ms min=5.91ms  med=131.24ms max=371.77ms p(90)=177.54ms p(95)=191.07ms p(99.9)=246.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 44772
     http_req_receiving.............: avg=99.61µs  min=34.65µs med=88.97µs  max=218.7ms  p(90)=120.48µs p(95)=132.89µs p(99.9)=854.2µs 
     http_req_sending...............: avg=38.64µs  min=5.87µs  med=17.01µs  max=239.74ms p(90)=22.14µs  p(95)=23.88µs  p(99.9)=589.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.64ms min=5.83ms  med=131.11ms max=346.82ms p(90)=177.39ms p(95)=190.95ms p(99.9)=244.72ms
     http_reqs......................: 44772   370.777026/s
     iteration_duration.............: avg=134.35ms min=37.85ms med=131.57ms max=378.02ms p(90)=177.84ms p(95)=191.44ms p(99.9)=249.91ms
     iterations.....................: 44672   369.948881/s
     success_rate...................: 100.00% ✓ 44672      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 90792      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   302 kB/s
     http_req_blocked...............: avg=7.66µs   min=1.3µs   med=3.56µs   max=4.69ms   p(90)=5.02µs   p(95)=5.61µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=3.88µs   min=0s      med=0s       max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=197.45ms min=6.36ms  med=179.73ms max=676.51ms p(90)=237.68ms p(95)=400.75ms p(99.9)=536.66ms
       { expected_response:true }...: avg=197.45ms min=6.36ms  med=179.73ms max=676.51ms p(90)=237.68ms p(95)=400.75ms p(99.9)=536.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30364
     http_req_receiving.............: avg=131.7µs  min=33.62µs med=96.28µs  max=103.1ms  p(90)=128.42µs p(95)=141.96µs p(99.9)=1.03ms  
     http_req_sending...............: avg=23.03µs  min=6.07µs  med=17.97µs  max=17.88ms  p(90)=22.93µs  p(95)=24.68µs  p(99.9)=617.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.29ms min=6.25ms  med=179.61ms max=676.14ms p(90)=237.43ms p(95)=400.63ms p(99.9)=536.54ms
     http_reqs......................: 30364   251.16303/s
     iteration_duration.............: avg=198.36ms min=89.49ms med=180.09ms max=676.78ms p(90)=238.23ms p(95)=401.4ms  p(99.9)=537ms   
     iterations.....................: 30264   250.335856/s
     success_rate...................: 100.00% ✓ 30264      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 85428      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=7.23µs   min=1.26µs  med=3.37µs   max=4.32ms   p(90)=4.68µs   p(95)=5.2µs    p(99.9)=1.94ms  
     http_req_connecting............: avg=3.71µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=209.83ms min=8.6ms   med=211.49ms max=416.34ms p(90)=296.48ms p(95)=302.24ms p(99.9)=375.11ms
       { expected_response:true }...: avg=209.83ms min=8.6ms   med=211.49ms max=416.34ms p(90)=296.48ms p(95)=302.24ms p(99.9)=375.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28576
     http_req_receiving.............: avg=105.57µs min=34.43µs med=91.79µs  max=110.55ms p(90)=122.68µs p(95)=134.96µs p(99.9)=736.19µs
     http_req_sending...............: avg=25.8µs   min=6.12µs  med=16.76µs  max=75.52ms  p(90)=21.45µs  p(95)=23.22µs  p(99.9)=563.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.7ms  min=8.5ms   med=211.4ms  max=416.21ms p(90)=296.36ms p(95)=302.13ms p(99.9)=374.8ms 
     http_reqs......................: 28576   235.942299/s
     iteration_duration.............: avg=210.83ms min=32.68ms med=212.59ms max=416.61ms p(90)=296.78ms p(95)=302.62ms p(99.9)=380.54ms
     iterations.....................: 28476   235.116633/s
     success_rate...................: 100.00% ✓ 28476      ✗ 0    
     vus............................: 40      min=40       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

