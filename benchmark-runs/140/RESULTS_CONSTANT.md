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
| hive-router | v0.0.43 | 2,998 | 3,186 | 2,927 | 2.6% |  |
| hotchocolate | 16.0.0-rc.1.29 | 2,107 | 2,165 | 2,094 | 1.1% |  |
| grafbase | 0.53.2 | 2,024 | 2,097 | 2,006 | 1.5% |  |
| cosmo | 0.298.0 | 1,271 | 1,292 | 1,263 | 0.8% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 621 | 632 | 609 | 1.2% |  |
| apollo-router | v2.12.1 | 425 | 434 | 420 | 1.1% |  |
| hive-gateway | 2.5.14 | 266 | 269 | 262 | 1.0% |  |
| apollo-gateway | 2.13.3 | 251 | 253 | 249 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,451 | 2,589 | 2,416 | 2.2% |  |
| hotchocolate | 16.0.0-rc.1.29 | 1,937 | 1,982 | 1,910 | 1.1% |  |
| grafbase | 0.53.2 | 1,518 | 1,558 | 1,497 | 1.4% |  |
| cosmo | 0.298.0 | 1,206 | 1,225 | 1,198 | 0.8% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 580 | 597 | 573 | 1.4% |  |
| apollo-router | v2.12.1 | 389 | 405 | 380 | 2.3% |  |
| hive-gateway | 2.5.14 | 274 | 278 | 269 | 1.3% |  |
| apollo-gateway | 2.13.3 | 240 | 242 | 238 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1081101     ✗ 0     
     data_received..................: 32 GB   263 MB/s
     data_sent......................: 433 MB  3.6 MB/s
     http_req_blocked...............: avg=2.81µs   min=972ns  med=2.03µs  max=23.78ms  p(90)=3.16µs  p(95)=3.76µs   p(99.9)=33.31µs
     http_req_connecting............: avg=164ns    min=0s     med=0s      max=3.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.41ms  min=1.73ms med=15.34ms max=311.38ms p(90)=24.61ms p(95)=28.85ms  p(99.9)=51.66ms
       { expected_response:true }...: avg=16.41ms  min=1.73ms med=15.34ms max=311.38ms p(90)=24.61ms p(95)=28.85ms  p(99.9)=51.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 360467
     http_req_receiving.............: avg=148.94µs min=28.1µs med=47.83µs max=99.75ms  p(90)=94.88µs p(95)=275.81µs p(99.9)=17.26ms
     http_req_sending...............: avg=56.44µs  min=5.32µs med=8.94µs  max=152.53ms p(90)=14.62µs p(95)=118.72µs p(99.9)=8.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.2ms   min=1.65ms med=15.18ms max=311.15ms p(90)=24.29ms p(95)=28.34ms  p(99.9)=50.25ms
     http_reqs......................: 360467  2998.724224/s
     iteration_duration.............: avg=16.64ms  min=1.97ms med=15.54ms max=339.48ms p(90)=24.84ms p(95)=29.13ms  p(99.9)=52.92ms
     iterations.....................: 360367  2997.892324/s
     success_rate...................: 100.00% ✓ 360367      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 760026      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.05µs   min=1µs     med=2.23µs   max=16.05ms  p(90)=3.33µs   p(95)=3.88µs  p(99.9)=32.35µs 
     http_req_connecting............: avg=444ns    min=0s      med=0s       max=5.24ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.44ms  min=2.38ms  med=14.72ms  max=329.61ms p(90)=53.29ms  p(95)=71.61ms p(99.9)=170.75ms
       { expected_response:true }...: avg=23.44ms  min=2.38ms  med=14.72ms  max=329.61ms p(90)=53.29ms  p(95)=71.61ms p(99.9)=170.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253442
     http_req_receiving.............: avg=678.65µs min=51.03µs med=107.64µs max=200.7ms  p(90)=972.76µs p(95)=1.5ms   p(99.9)=62.41ms 
     http_req_sending...............: avg=43.85µs  min=5.25µs  med=9.27µs   max=139.27ms p(90)=14.95µs  p(95)=106.1µs p(99.9)=3.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.72ms  min=2.3ms   med=14.2ms   max=312.53ms p(90)=51.84ms  p(95)=70.17ms p(99.9)=168.3ms 
     http_reqs......................: 253442  2107.008616/s
     iteration_duration.............: avg=23.67ms  min=3.31ms  med=14.94ms  max=349.66ms p(90)=53.53ms  p(95)=71.84ms p(99.9)=172.26ms
     iterations.....................: 253342  2106.177259/s
     success_rate...................: 100.00% ✓ 253342      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 730131      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 293 MB  2.4 MB/s
     http_req_blocked...............: avg=3.48µs   min=1.09µs  med=2.62µs  max=9.63ms   p(90)=4.11µs   p(95)=4.86µs   p(99.9)=38.81µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.4ms   min=1.94ms  med=24.16ms max=353.61ms p(90)=29.39ms  p(95)=31.75ms  p(99.9)=53.2ms 
       { expected_response:true }...: avg=24.4ms   min=1.94ms  med=24.16ms max=353.61ms p(90)=29.39ms  p(95)=31.75ms  p(99.9)=53.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 243477
     http_req_receiving.............: avg=144.56µs min=30.07µs med=61.39µs max=316.57ms p(90)=105.21µs p(95)=209.74µs p(99.9)=11.25ms
     http_req_sending...............: avg=45.01µs  min=5.25µs  med=10.75µs max=92.32ms  p(90)=18µs     p(95)=120.34µs p(99.9)=3.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.21ms  min=1.88ms  med=24.03ms max=149.71ms p(90)=29.21ms  p(95)=31.47ms  p(99.9)=50.89ms
     http_reqs......................: 243477  2024.726659/s
     iteration_duration.............: avg=24.64ms  min=3.43ms  med=24.37ms max=372.45ms p(90)=29.61ms  p(95)=32ms     p(99.9)=53.93ms
     iterations.....................: 243377  2023.89507/s
     success_rate...................: 100.00% ✓ 243377      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458466      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=2.97µs  min=1µs     med=2.03µs  max=4.02ms   p(90)=3.22µs  p(95)=3.82µs   p(99.9)=31.46µs
     http_req_connecting............: avg=641ns   min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.02ms min=2.11ms  med=38.51ms max=324.65ms p(90)=55.04ms p(95)=60.11ms  p(99.9)=84.32ms
       { expected_response:true }...: avg=39.02ms min=2.11ms  med=38.51ms max=324.65ms p(90)=55.04ms p(95)=60.11ms  p(99.9)=84.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152922
     http_req_receiving.............: avg=78.07µs min=28.23µs med=57.59µs max=215.76ms p(90)=92.32µs p(95)=109.77µs p(99.9)=1.87ms 
     http_req_sending...............: avg=28.1µs  min=5.19µs  med=9.66µs  max=169.51ms p(90)=14.93µs p(95)=18.9µs   p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.92ms min=2.01ms  med=38.41ms max=324.05ms p(90)=54.92ms p(95)=59.99ms  p(99.9)=83.86ms
     http_reqs......................: 152922  1271.528806/s
     iteration_duration.............: avg=39.25ms min=3.7ms   med=38.7ms  max=344.68ms p(90)=55.23ms p(95)=60.3ms   p(99.9)=84.93ms
     iterations.....................: 152822  1270.697318/s
     success_rate...................: 100.00% ✓ 152822      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 224409     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   747 kB/s
     http_req_blocked...............: avg=3.58µs   min=1.1µs   med=2.78µs  max=2.02ms   p(90)=4.27µs   p(95)=4.88µs   p(99.9)=40.04µs 
     http_req_connecting............: avg=515ns    min=0s      med=0s      max=1.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.87ms  min=3.87ms  med=76.52ms max=341.18ms p(90)=105.11ms p(95)=116.9ms  p(99.9)=211.04ms
       { expected_response:true }...: avg=79.87ms  min=3.87ms  med=76.52ms max=341.18ms p(90)=105.11ms p(95)=116.9ms  p(99.9)=211.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74903
     http_req_receiving.............: avg=117.88µs min=31.28µs med=73.82µs max=249.22ms p(90)=108.34µs p(95)=121.07µs p(99.9)=1.12ms  
     http_req_sending...............: avg=20.56µs  min=5.72µs  med=12.65µs max=39.3ms   p(90)=18.97µs  p(95)=21.25µs  p(99.9)=705.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.73ms  min=3.76ms  med=76.41ms max=260.1ms  p(90)=104.95ms p(95)=116.67ms p(99.9)=209.61ms
     http_reqs......................: 74903   621.627817/s
     iteration_duration.............: avg=80.21ms  min=15.75ms med=76.76ms max=350.63ms p(90)=105.35ms p(95)=117.21ms p(99.9)=213.49ms
     iterations.....................: 74803   620.797907/s
     success_rate...................: 100.00% ✓ 74803      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 153630     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   510 kB/s
     http_req_blocked...............: avg=5.27µs   min=1.11µs  med=3.37µs   max=4.24ms   p(90)=4.8µs    p(95)=5.38µs   p(99.9)=119.88µs
     http_req_connecting............: avg=1.67µs   min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.69ms min=5.72ms  med=116.31ms max=340.47ms p(90)=141ms    p(95)=148.14ms p(99.9)=183.43ms
       { expected_response:true }...: avg=116.69ms min=5.72ms  med=116.31ms max=340.47ms p(90)=141ms    p(95)=148.14ms p(99.9)=183.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51310
     http_req_receiving.............: avg=117.2µs  min=30.57µs med=87.15µs  max=198.83ms p(90)=123.26µs p(95)=137.27µs p(99.9)=861.17µs
     http_req_sending...............: avg=31.48µs  min=5.95µs  med=15.92µs  max=157.43ms p(90)=21.18µs  p(95)=23.13µs  p(99.9)=694.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.54ms min=5.6ms   med=116.18ms max=340.07ms p(90)=140.88ms p(95)=148ms    p(99.9)=179.68ms
     http_reqs......................: 51310   425.076003/s
     iteration_duration.............: avg=117.19ms min=18.99ms med=116.6ms  max=355.4ms  p(90)=141.28ms p(95)=148.44ms p(99.9)=185.29ms
     iterations.....................: 51210   424.247556/s
     success_rate...................: 100.00% ✓ 51210      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96321      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=5.31µs   min=1.33µs  med=3.51µs   max=4.16ms   p(90)=4.97µs   p(95)=5.58µs   p(99.9)=683.54µs
     http_req_connecting............: avg=1.38µs   min=0s      med=0s       max=2.45ms   p(90)=0s       p(95)=0s       p(99.9)=538.33µs
     http_req_duration..............: avg=186.1ms  min=5.78ms  med=169.14ms max=664.22ms p(90)=217.44ms p(95)=390.85ms p(99.9)=559.39ms
       { expected_response:true }...: avg=186.1ms  min=5.78ms  med=169.14ms max=664.22ms p(90)=217.44ms p(95)=390.85ms p(99.9)=559.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32207
     http_req_receiving.............: avg=100.11µs min=34.95µs med=94.56µs  max=48.52ms  p(90)=127.12µs p(95)=140.07µs p(99.9)=621.26µs
     http_req_sending...............: avg=28.87µs  min=5.95µs  med=17.39µs  max=71.4ms   p(90)=22.61µs  p(95)=24.55µs  p(99.9)=510.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.97ms min=5.65ms  med=169.02ms max=664.09ms p(90)=217.25ms p(95)=390.74ms p(99.9)=559.29ms
     http_reqs......................: 32207   266.585511/s
     iteration_duration.............: avg=186.96ms min=38.94ms med=169.48ms max=664.49ms p(90)=218ms    p(95)=391.6ms  p(99.9)=559.61ms
     iterations.....................: 32107   265.757786/s
     success_rate...................: 100.00% ✓ 32107      ✗ 0    
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

     checks.........................: 100.00% ✓ 91098      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   302 kB/s
     http_req_blocked...............: avg=6.8µs    min=1.22µs  med=3.2µs    max=4.17ms   p(90)=4.46µs   p(95)=4.97µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=196.76ms min=8.31ms  med=202.3ms  max=417.62ms p(90)=209.97ms p(95)=216.39ms p(99.9)=285.37ms
       { expected_response:true }...: avg=196.76ms min=8.31ms  med=202.3ms  max=417.62ms p(90)=209.97ms p(95)=216.39ms p(99.9)=285.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30466
     http_req_receiving.............: avg=99.76µs  min=34.07µs med=90.35µs  max=86.55ms  p(90)=121.55µs p(95)=133.78µs p(99.9)=703.09µs
     http_req_sending...............: avg=27.75µs  min=6.14µs  med=16.08µs  max=84.54ms  p(90)=20.62µs  p(95)=22.45µs  p(99.9)=571.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.64ms min=8.22ms  med=202.19ms max=417.13ms p(90)=209.86ms p(95)=216.24ms p(99.9)=284.96ms
     http_reqs......................: 30466   251.687308/s
     iteration_duration.............: avg=197.7ms  min=54.57ms med=202.55ms max=462.1ms  p(90)=210.25ms p(95)=216.76ms p(99.9)=310.65ms
     iterations.....................: 30366   250.861183/s
     success_rate...................: 100.00% ✓ 30366      ✗ 0    
     vus............................: 28      min=28       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 883791      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 354 MB  2.9 MB/s
     http_req_blocked...............: avg=2.8µs    min=1µs     med=2.12µs  max=18.6ms   p(90)=3.48µs   p(95)=4.26µs   p(99.9)=36.07µs
     http_req_connecting............: avg=136ns    min=0s      med=0s      max=2.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.12ms  min=1.86ms  med=19.61ms max=318.96ms p(90)=27.93ms  p(95)=31.02ms  p(99.9)=52.99ms
       { expected_response:true }...: avg=20.12ms  min=1.86ms  med=19.61ms max=318.96ms p(90)=27.93ms  p(95)=31.02ms  p(99.9)=52.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 294697
     http_req_receiving.............: avg=115.45µs min=27.43µs med=53.33µs max=102.1ms  p(90)=103.37µs p(95)=259.77µs p(99.9)=9.03ms 
     http_req_sending...............: avg=49.57µs  min=5.22µs  med=9.59µs  max=92.62ms  p(90)=17.9µs   p(95)=123.25µs p(99.9)=4.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.96ms  min=1.77ms  med=19.48ms max=318.47ms p(90)=27.73ms  p(95)=30.74ms  p(99.9)=52.12ms
     http_reqs......................: 294697  2451.169882/s
     iteration_duration.............: avg=20.35ms  min=3.5ms   med=19.82ms max=333.96ms p(90)=28.15ms  p(95)=31.26ms  p(99.9)=53.76ms
     iterations.....................: 294597  2450.338122/s
     success_rate...................: 100.00% ✓ 294597      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 698736      ✗ 0     
     data_received..................: 20 GB   170 MB/s
     data_sent......................: 280 MB  2.3 MB/s
     http_req_blocked...............: avg=3.09µs   min=1µs     med=2.47µs  max=3.25ms   p(90)=3.9µs   p(95)=4.6µs   p(99.9)=37.39µs 
     http_req_connecting............: avg=242ns    min=0s      med=0s      max=3.01ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.51ms  min=1.99ms  med=17.66ms max=576.26ms p(90)=53.52ms p(95)=70.66ms p(99.9)=189.89ms
       { expected_response:true }...: avg=25.51ms  min=1.99ms  med=17.66ms max=576.26ms p(90)=53.52ms p(95)=70.66ms p(99.9)=189.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 233012
     http_req_receiving.............: avg=709.35µs min=50.59µs med=107.3µs max=309.85ms p(90)=1.16ms  p(95)=1.89ms  p(99.9)=61.91ms 
     http_req_sending...............: avg=44.2µs   min=5.41µs  med=10.14µs max=128.49ms p(90)=18.07µs p(95)=103.1µs p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.75ms  min=1.9ms   med=17.09ms max=576.15ms p(90)=52.24ms p(95)=69.07ms p(99.9)=187.09ms
     http_reqs......................: 233012  1937.657158/s
     iteration_duration.............: avg=25.75ms  min=2.97ms  med=17.89ms max=576.48ms p(90)=53.76ms p(95)=70.92ms p(99.9)=192.52ms
     iterations.....................: 232912  1936.825588/s
     success_rate...................: 100.00% ✓ 232912      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 547659      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.23µs   min=941ns   med=2.34µs  max=7.62ms   p(90)=4.48µs   p(95)=5.64µs   p(99.9)=43.5µs 
     http_req_connecting............: avg=234ns    min=0s      med=0s      max=2ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.59ms  min=2.29ms  med=31.69ms max=322.53ms p(90)=43.3ms   p(95)=48.03ms  p(99.9)=84.82ms
       { expected_response:true }...: avg=32.59ms  min=2.29ms  med=31.69ms max=322.53ms p(90)=43.3ms   p(95)=48.03ms  p(99.9)=84.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182653
     http_req_receiving.............: avg=142.16µs min=30.41µs med=61.84µs max=267.25ms p(90)=132.85µs p(95)=276.8µs  p(99.9)=7.87ms 
     http_req_sending...............: avg=49.67µs  min=5.43µs  med=10.58µs max=199.25ms p(90)=23.93µs  p(95)=134.38µs p(99.9)=3.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.4ms   min=2.21ms  med=31.56ms max=180.69ms p(90)=43.11ms  p(95)=47.8ms   p(99.9)=81.61ms
     http_reqs......................: 182653  1518.215892/s
     iteration_duration.............: avg=32.85ms  min=4.4ms   med=31.93ms max=333.94ms p(90)=43.53ms  p(95)=48.27ms  p(99.9)=85.52ms
     iterations.....................: 182553  1517.38469/s
     success_rate...................: 100.00% ✓ 182553      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 435138      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.72µs  min=1.06µs  med=2.7µs   max=4.1ms    p(90)=4.28µs   p(95)=4.98µs   p(99.9)=37.81µs
     http_req_connecting............: avg=672ns   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.09ms min=2.26ms  med=40.55ms max=321.15ms p(90)=57.88ms  p(95)=62.98ms  p(99.9)=87.36ms
       { expected_response:true }...: avg=41.09ms min=2.26ms  med=40.55ms max=321.15ms p(90)=57.88ms  p(95)=62.98ms  p(99.9)=87.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145146
     http_req_receiving.............: avg=88.37µs min=29.99µs med=69.5µs  max=44.84ms  p(90)=109.29µs p(95)=129.03µs p(99.9)=1.91ms 
     http_req_sending...............: avg=30.35µs min=5.49µs  med=12.11µs max=118.36ms p(90)=18.89µs  p(95)=22.7µs   p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.97ms min=2.15ms  med=40.45ms max=309.77ms p(90)=57.76ms  p(95)=62.84ms  p(99.9)=87.06ms
     http_reqs......................: 145146  1206.611519/s
     iteration_duration.............: avg=41.35ms min=4.07ms  med=40.77ms max=347.16ms p(90)=58.1ms   p(95)=63.2ms   p(99.9)=88.13ms
     iterations.....................: 145046  1205.78021/s
     success_rate...................: 100.00% ✓ 145046      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 209805     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   698 kB/s
     http_req_blocked...............: avg=3.89µs  min=1.23µs  med=3.08µs  max=3.07ms   p(90)=4.6µs    p(95)=5.22µs   p(99.9)=44.81µs 
     http_req_connecting............: avg=522ns   min=0s      med=0s      max=1.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.44ms min=3.93ms  med=83.35ms max=340.43ms p(90)=105.68ms p(95)=116.89ms p(99.9)=212.99ms
       { expected_response:true }...: avg=85.44ms min=3.93ms  med=83.35ms max=340.43ms p(90)=105.68ms p(95)=116.89ms p(99.9)=212.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70035
     http_req_receiving.............: avg=133.6µs min=31.14µs med=81.62µs max=187.88ms p(90)=115.83µs p(95)=129.81µs p(99.9)=960.3µs 
     http_req_sending...............: avg=23.79µs min=5.82µs  med=14.3µs  max=232.17ms p(90)=20.65µs  p(95)=22.83µs  p(99.9)=612.88µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.28ms min=3.82ms  med=83.23ms max=339.89ms p(90)=105.52ms p(95)=116.65ms p(99.9)=210.68ms
     http_reqs......................: 70035   580.942819/s
     iteration_duration.............: avg=85.8ms  min=14.87ms med=83.59ms max=349.5ms  p(90)=105.93ms p(95)=117.18ms p(99.9)=213.92ms
     iterations.....................: 69935   580.113315/s
     success_rate...................: 100.00% ✓ 69935      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 140676     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 56 MB   467 kB/s
     http_req_blocked...............: avg=6.05µs   min=1.24µs  med=3.6µs    max=4.37ms   p(90)=5.09µs   p(95)=5.68µs   p(99.9)=279.11µs
     http_req_connecting............: avg=2.25µs   min=0s      med=0s       max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=256.7µs 
     http_req_duration..............: avg=127.46ms min=6.11ms  med=124.92ms max=385.98ms p(90)=169.11ms p(95)=182.18ms p(99.9)=235.88ms
       { expected_response:true }...: avg=127.46ms min=6.11ms  med=124.92ms max=385.98ms p(90)=169.11ms p(95)=182.18ms p(99.9)=235.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46992
     http_req_receiving.............: avg=97.08µs  min=31.73µs med=89.65µs  max=59.49ms  p(90)=120.59µs p(95)=132.77µs p(99.9)=717.62µs
     http_req_sending...............: avg=28.71µs  min=5.78µs  med=17.28µs  max=110.83ms p(90)=22.31µs  p(95)=24.2µs   p(99.9)=765.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=127.34ms min=5.93ms  med=124.81ms max=360.82ms p(90)=168.98ms p(95)=182.04ms p(99.9)=235.76ms
     http_reqs......................: 46992   389.03451/s
     iteration_duration.............: avg=128ms    min=27.96ms med=125.24ms max=395.03ms p(90)=169.43ms p(95)=182.52ms p(99.9)=243.04ms
     iterations.....................: 46892   388.206636/s
     success_rate...................: 100.00% ✓ 46892      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99300      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   330 kB/s
     http_req_blocked...............: avg=5.13µs   min=1.21µs  med=3.63µs   max=1.8ms    p(90)=5.15µs   p(95)=5.77µs   p(99.9)=491.51µs
     http_req_connecting............: avg=1.28µs   min=0s      med=0s       max=1.77ms   p(90)=0s       p(95)=0s       p(99.9)=448.88µs
     http_req_duration..............: avg=180.54ms min=5.91ms  med=163.94ms max=628.74ms p(90)=214.12ms p(95)=280.33ms p(99.9)=540.42ms
       { expected_response:true }...: avg=180.54ms min=5.91ms  med=163.94ms max=628.74ms p(90)=214.12ms p(95)=280.33ms p(99.9)=540.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33200
     http_req_receiving.............: avg=105.04µs min=32.37µs med=98.92µs  max=72.36ms  p(90)=129.87µs p(95)=143.46µs p(99.9)=705.91µs
     http_req_sending...............: avg=23.02µs  min=5.88µs  med=18.23µs  max=43.69ms  p(90)=23.13µs  p(95)=24.9µs   p(99.9)=516.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.41ms min=5.75ms  med=163.82ms max=628.61ms p(90)=213.98ms p(95)=280.19ms p(99.9)=540.32ms
     http_reqs......................: 33200   274.76534/s
     iteration_duration.............: avg=181.36ms min=45.97ms med=164.29ms max=629.01ms p(90)=214.55ms p(95)=285.51ms p(99.9)=540.68ms
     iterations.....................: 33100   273.937734/s
     success_rate...................: 100.00% ✓ 33100      ✗ 0    
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

     checks.........................: 100.00% ✓ 87102      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=5.49µs   min=1.27µs  med=3.45µs   max=2.81ms   p(90)=4.81µs   p(95)=5.39µs   p(99.9)=715.11µs
     http_req_connecting............: avg=1.86µs   min=0s      med=0s       max=2.78ms   p(90)=0s       p(95)=0s       p(99.9)=685.47µs
     http_req_duration..............: avg=205.82ms min=8.68ms  med=206.97ms max=401.66ms p(90)=220.25ms p(95)=224.38ms p(99.9)=300.43ms
       { expected_response:true }...: avg=205.82ms min=8.68ms  med=206.97ms max=401.66ms p(90)=220.25ms p(95)=224.38ms p(99.9)=300.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29134
     http_req_receiving.............: avg=105.92µs min=36.05µs med=96.96µs  max=105.91ms p(90)=131.45µs p(95)=145.62µs p(99.9)=489.97µs
     http_req_sending...............: avg=42.24µs  min=6.19µs  med=17.45µs  max=192.55ms p(90)=22.28µs  p(95)=24.16µs  p(99.9)=766.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.67ms min=8.52ms  med=206.84ms max=401.37ms p(90)=220.13ms p(95)=224.24ms p(99.9)=300.11ms
     http_reqs......................: 29134   240.545988/s
     iteration_duration.............: avg=206.83ms min=57.88ms med=207.36ms max=433.62ms p(90)=220.53ms p(95)=224.71ms p(99.9)=302.42ms
     iterations.....................: 29034   239.720335/s
     success_rate...................: 100.00% ✓ 29034      ✗ 0    
     vus............................: 45      min=45       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

