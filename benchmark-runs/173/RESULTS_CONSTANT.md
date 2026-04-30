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
| hive-router | v0.0.49 | 3,009 | 3,198 | 2,939 | 2.7% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,145 | 2,196 | 2,119 | 1.1% |  |
| grafbase | 0.53.3 | 2,023 | 2,096 | 2,000 | 1.6% |  |
| cosmo | 0.307.0 | 1,237 | 1,240 | 1,235 | 0.2% | non-compatible response (7 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 529 | 540 | 525 | 0.9% |  |
| apollo-router | v2.13.1 | 431 | 441 | 428 | 1.0% |  |
| hive-gateway | 2.5.25 | 255 | 261 | 254 | 0.9% |  |
| apollo-gateway | 2.13.3 | 246 | 248 | 244 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,368 | 2,496 | 2,349 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,009 | 2,053 | 1,986 | 1.1% |  |
| grafbase | 0.53.3 | 1,529 | 1,555 | 1,521 | 0.8% |  |
| cosmo | 0.307.0 | 1,212 | 1,234 | 1,206 | 0.8% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 504 | 516 | 497 | 1.3% |  |
| apollo-router | v2.13.1 | 373 | 384 | 368 | 1.5% |  |
| hive-gateway | 2.5.25 | 243 | 248 | 239 | 1.1% |  |
| apollo-gateway | 2.13.3 | 237 | 240 | 236 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1084899     ✗ 0     
     data_received..................: 32 GB   264 MB/s
     data_sent......................: 435 MB  3.6 MB/s
     http_req_blocked...............: avg=3.46µs   min=1.08µs  med=2.44µs  max=26ms     p(90)=3.71µs   p(95)=4.39µs   p(99.9)=34.72µs
     http_req_connecting............: avg=281ns    min=0s      med=0s      max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.34ms  min=1.65ms  med=15.28ms max=325.14ms p(90)=24.41ms  p(95)=28.62ms  p(99.9)=52.55ms
       { expected_response:true }...: avg=16.34ms  min=1.65ms  med=15.28ms max=325.14ms p(90)=24.41ms  p(95)=28.62ms  p(99.9)=52.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 361733
     http_req_receiving.............: avg=146.92µs min=28.69µs med=50.74µs max=153.54ms p(90)=103.32µs p(95)=292.54µs p(99.9)=14.65ms
     http_req_sending...............: avg=64.21µs  min=5.41µs  med=9.48µs  max=199.02ms p(90)=16.2µs   p(95)=126.52µs p(99.9)=14.96ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.13ms  min=1.57ms  med=15.12ms max=302.66ms p(90)=24.09ms  p(95)=28.14ms  p(99.9)=50.9ms 
     http_reqs......................: 361733  3009.303132/s
     iteration_duration.............: avg=16.58ms  min=2.25ms  med=15.5ms  max=335.35ms p(90)=24.65ms  p(95)=28.89ms  p(99.9)=54.36ms
     iterations.....................: 361633  3008.47122/s
     success_rate...................: 100.00% ✓ 361633      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 773880      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.15µs   min=1µs     med=2.32µs   max=18.72ms  p(90)=3.46µs   p(95)=4.05µs   p(99.9)=32.85µs 
     http_req_connecting............: avg=235ns    min=0s      med=0s       max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.02ms  min=2.47ms  med=14.52ms  max=355.96ms p(90)=51.96ms  p(95)=70.25ms  p(99.9)=167.59ms
       { expected_response:true }...: avg=23.02ms  min=2.47ms  med=14.52ms  max=355.96ms p(90)=51.96ms  p(95)=70.25ms  p(99.9)=167.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258060
     http_req_receiving.............: avg=689.36µs min=51.92µs med=111.15µs max=269.45ms p(90)=971.55µs p(95)=1.51ms   p(99.9)=62.52ms 
     http_req_sending...............: avg=43.1µs   min=5.43µs  med=9.52µs   max=82.02ms  p(90)=15.56µs  p(95)=110.58µs p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.29ms  min=2.34ms  med=14ms     max=355.35ms p(90)=50.58ms  p(95)=68.76ms  p(99.9)=163.28ms
     http_reqs......................: 258060  2145.267781/s
     iteration_duration.............: avg=23.24ms  min=3.35ms  med=14.74ms  max=356.2ms  p(90)=52.21ms  p(95)=70.48ms  p(99.9)=167.93ms
     iterations.....................: 257960  2144.436476/s
     success_rate...................: 100.00% ✓ 257960      ✗ 0     
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

     checks.........................: 100.00% ✓ 729666      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.22µs   min=1.01µs  med=2.18µs  max=16.72ms  p(90)=3.61µs  p(95)=4.37µs   p(99.9)=39.57µs
     http_req_connecting............: avg=328ns    min=0s      med=0s      max=3.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.43ms  min=1.98ms  med=24.17ms max=351.89ms p(90)=29.36ms p(95)=31.63ms  p(99.9)=53.06ms
       { expected_response:true }...: avg=24.43ms  min=1.98ms  med=24.17ms max=351.89ms p(90)=29.36ms p(95)=31.63ms  p(99.9)=53.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 243322
     http_req_receiving.............: avg=146.86µs min=29.44µs med=57.67µs max=319.23ms p(90)=98.83µs p(95)=179.78µs p(99.9)=11.52ms
     http_req_sending...............: avg=42.88µs  min=5.12µs  med=9.95µs  max=340.16ms p(90)=16.48µs p(95)=102.27µs p(99.9)=2.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.24ms  min=1.87ms  med=24.05ms max=83.17ms  p(90)=29.18ms p(95)=31.37ms  p(99.9)=49.97ms
     http_reqs......................: 243322  2023.384815/s
     iteration_duration.............: avg=24.66ms  min=4.01ms  med=24.38ms max=369.66ms p(90)=29.58ms p(95)=31.87ms  p(99.9)=53.55ms
     iterations.....................: 243222  2022.553248/s
     success_rate...................: 100.00% ✓ 243222      ✗ 0     
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

     checks.........................: 100.00% ✓ 446193      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=2.83µs  min=1µs     med=2.02µs  max=3.72ms   p(90)=3.24µs  p(95)=3.83µs   p(99.9)=32.16µs
     http_req_connecting............: avg=503ns   min=0s      med=0s      max=3.69ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.1ms  min=2.09ms  med=39.59ms max=336.74ms p(90)=56.56ms p(95)=61.66ms  p(99.9)=85.58ms
       { expected_response:true }...: avg=40.1ms  min=2.09ms  med=39.59ms max=336.74ms p(90)=56.56ms p(95)=61.66ms  p(99.9)=85.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148831
     http_req_receiving.............: avg=75.9µs  min=28.85µs med=59.12µs max=114.39ms p(90)=93.13µs p(95)=109.54µs p(99.9)=1.55ms 
     http_req_sending...............: avg=24.91µs min=5.32µs  med=9.93µs  max=121.76ms p(90)=14.78µs p(95)=18.54µs  p(99.9)=1.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40ms    min=2.03ms  med=39.49ms max=336.38ms p(90)=56.46ms p(95)=61.55ms  p(99.9)=85.13ms
     http_reqs......................: 148831  1237.462103/s
     iteration_duration.............: avg=40.33ms min=4.51ms  med=39.78ms max=348.62ms p(90)=56.75ms p(95)=61.86ms  p(99.9)=86.22ms
     iterations.....................: 148731  1236.630649/s
     success_rate...................: 100.00% ✓ 148731      ✗ 0     
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

     checks.........................: 100.00% ✓ 191238     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   636 kB/s
     http_req_blocked...............: avg=4.69µs  min=1.13µs  med=2.76µs  max=4.54ms   p(90)=4.26µs   p(95)=4.85µs   p(99.9)=48.26µs 
     http_req_connecting............: avg=1.59µs  min=0s      med=0s      max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.75ms min=4.27ms  med=86.55ms max=315.91ms p(90)=131.52ms p(95)=145.72ms p(99.9)=243.57ms
       { expected_response:true }...: avg=93.75ms min=4.27ms  med=86.55ms max=315.91ms p(90)=131.52ms p(95)=145.72ms p(99.9)=243.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63846
     http_req_receiving.............: avg=85.04µs min=31.74µs med=75.42µs max=73.2ms   p(90)=109.3µs  p(95)=121.74µs p(99.9)=916.11µs
     http_req_sending...............: avg=22.75µs min=5.8µs   med=13.22µs max=121.99ms p(90)=19.63µs  p(95)=21.82µs  p(99.9)=710.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.64ms min=4.16ms  med=86.44ms max=315.35ms p(90)=131.41ms p(95)=145.6ms  p(99.9)=243.23ms
     http_reqs......................: 63846   529.556293/s
     iteration_duration.............: avg=94.13ms min=27.66ms med=86.8ms  max=356.72ms p(90)=131.77ms p(95)=146.01ms p(99.9)=246.37ms
     iterations.....................: 63746   528.726865/s
     success_rate...................: 100.00% ✓ 63746      ✗ 0    
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

     checks.........................: 100.00% ✓ 156003     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   518 kB/s
     http_req_blocked...............: avg=4.13µs   min=1.14µs  med=3.19µs   max=2.29ms   p(90)=4.66µs   p(95)=5.24µs   p(99.9)=95.52µs 
     http_req_connecting............: avg=733ns    min=0s      med=0s       max=2.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.92ms min=5.42ms  med=114.72ms max=345.3ms  p(90)=138.65ms p(95)=145.5ms  p(99.9)=180.47ms
       { expected_response:true }...: avg=114.92ms min=5.42ms  med=114.72ms max=345.3ms  p(90)=138.65ms p(95)=145.5ms  p(99.9)=180.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52101
     http_req_receiving.............: avg=98.85µs  min=32.69µs med=83.89µs  max=127.01ms p(90)=114.24µs p(95)=125.75µs p(99.9)=817.92µs
     http_req_sending...............: avg=31.25µs  min=5.99µs  med=15.68µs  max=241.96ms p(90)=20.92µs  p(95)=22.69µs  p(99.9)=624.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.79ms min=5.36ms  med=114.61ms max=343.19ms p(90)=138.54ms p(95)=145.36ms p(99.9)=179.27ms
     http_reqs......................: 52101   431.671682/s
     iteration_duration.............: avg=115.41ms min=14.7ms  med=115.01ms max=388.14ms p(90)=138.93ms p(95)=145.78ms p(99.9)=184.28ms
     iterations.....................: 52001   430.843154/s
     success_rate...................: 100.00% ✓ 52001      ✗ 0    
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

     checks.........................: 100.00% ✓ 92406      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   307 kB/s
     http_req_blocked...............: avg=5.97µs   min=1.16µs  med=3.4µs    max=3.59ms   p(90)=4.86µs   p(95)=5.51µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=2.35µs   min=0s      med=0s       max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=193.98ms min=6.32ms  med=177.24ms max=630.35ms p(90)=225.55ms p(95)=390.9ms  p(99.9)=555.27ms
       { expected_response:true }...: avg=193.98ms min=6.32ms  med=177.24ms max=630.35ms p(90)=225.55ms p(95)=390.9ms  p(99.9)=555.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30902
     http_req_receiving.............: avg=103.39µs min=32.82µs med=97.62µs  max=47.92ms  p(90)=129.19µs p(95)=142.29µs p(99.9)=682.75µs
     http_req_sending...............: avg=36.12µs  min=6.2µs   med=17.9µs   max=142.73ms p(90)=22.99µs  p(95)=24.93µs  p(99.9)=941.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.84ms min=6.21ms  med=177.12ms max=630.23ms p(90)=225.4ms  p(95)=390.81ms p(99.9)=555.16ms
     http_reqs......................: 30902   255.386977/s
     iteration_duration.............: avg=194.9ms  min=48.6ms  med=177.61ms max=630.6ms  p(90)=226.19ms p(95)=392.59ms p(99.9)=555.65ms
     iterations.....................: 30802   254.560535/s
     success_rate...................: 100.00% ✓ 30802      ✗ 0    
     vus............................: 8       min=8        max=50 
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

     checks.........................: 100.00% ✓ 89271      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=6.31µs   min=1.24µs med=3.17µs   max=3.65ms   p(90)=4.41µs   p(95)=4.91µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=2.98µs   min=0s     med=0s       max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=200.82ms min=8.39ms med=202.26ms max=414.66ms p(90)=212.47ms p(95)=218.15ms p(99.9)=283.87ms
       { expected_response:true }...: avg=200.82ms min=8.39ms med=202.26ms max=414.66ms p(90)=212.47ms p(95)=218.15ms p(99.9)=283.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29857
     http_req_receiving.............: avg=92.59µs  min=32.7µs med=87.98µs  max=4.88ms   p(90)=119.19µs p(95)=130.97µs p(99.9)=640.11µs
     http_req_sending...............: avg=33.71µs  min=6.02µs med=15.65µs  max=81.91ms  p(90)=20.59µs  p(95)=22.36µs  p(99.9)=742.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.69ms min=8.27ms med=202.13ms max=414.37ms p(90)=212.35ms p(95)=218.05ms p(99.9)=283.76ms
     http_reqs......................: 29857   246.621202/s
     iteration_duration.............: avg=201.76ms min=22.4ms med=202.72ms max=423.35ms p(90)=212.74ms p(95)=218.46ms p(99.9)=285.56ms
     iterations.....................: 29757   245.795194/s
     success_rate...................: 100.00% ✓ 29757      ✗ 0    
     vus............................: 37      min=37       max=50 
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

     checks.........................: 100.00% ✓ 853938      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=3.51µs   min=1.04µs  med=2.62µs  max=13.22ms  p(90)=4.19µs   p(95)=5.04µs   p(99.9)=39.64µs
     http_req_connecting............: avg=308ns    min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.83ms  min=1.74ms  med=20.31ms max=349.16ms p(90)=28.84ms  p(95)=32.09ms  p(99.9)=54.77ms
       { expected_response:true }...: avg=20.83ms  min=1.74ms  med=20.31ms max=349.16ms p(90)=28.84ms  p(95)=32.09ms  p(99.9)=54.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284746
     http_req_receiving.............: avg=134.84µs min=27.72µs med=57.73µs max=264.22ms p(90)=108.42µs p(95)=271.24µs p(99.9)=9.88ms 
     http_req_sending...............: avg=55.46µs  min=5.38µs  med=10.77µs max=279.71ms p(90)=19.25µs  p(95)=131.38µs p(99.9)=5.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.64ms  min=1.65ms  med=20.16ms max=85.59ms  p(90)=28.64ms  p(95)=31.8ms   p(99.9)=53.51ms
     http_reqs......................: 284746  2368.467404/s
     iteration_duration.............: avg=21.06ms  min=3.08ms  med=20.52ms max=367.41ms p(90)=29.08ms  p(95)=32.34ms  p(99.9)=55.45ms
     iterations.....................: 284646  2367.635621/s
     success_rate...................: 100.00% ✓ 284646      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 724482      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=3.03µs   min=982ns   med=2.2µs    max=5.79ms   p(90)=3.63µs  p(95)=4.35µs   p(99.9)=35.97µs 
     http_req_connecting............: avg=408ns    min=0s      med=0s       max=3.92ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.59ms  min=1.85ms  med=17.22ms  max=646.1ms  p(90)=50.87ms p(95)=67.27ms  p(99.9)=183.25ms
       { expected_response:true }...: avg=24.59ms  min=1.85ms  med=17.22ms  max=646.1ms  p(90)=50.87ms p(95)=67.27ms  p(99.9)=183.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241594
     http_req_receiving.............: avg=684.97µs min=51.63µs med=102.77µs max=170.79ms p(90)=1.17ms  p(95)=1.9ms    p(99.9)=56.19ms 
     http_req_sending...............: avg=45.79µs  min=5.32µs  med=9.64µs   max=270.49ms p(90)=18.13µs p(95)=113.39µs p(99.9)=3.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.86ms  min=1.72ms  med=16.64ms  max=646.02ms p(90)=49.6ms  p(95)=65.94ms  p(99.9)=180.49ms
     http_reqs......................: 241594  2009.418435/s
     iteration_duration.............: avg=24.83ms  min=2.51ms  med=17.44ms  max=646.29ms p(90)=51.12ms p(95)=67.52ms  p(99.9)=185.76ms
     iterations.....................: 241494  2008.586701/s
     success_rate...................: 100.00% ✓ 241494      ✗ 0     
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

     checks.........................: 100.00% ✓ 551730      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.57µs   min=982ns   med=2.37µs  max=3.9ms    p(90)=4.64µs   p(95)=5.78µs   p(99.9)=46.89µs
     http_req_connecting............: avg=561ns    min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.34ms  min=2.43ms  med=31.45ms max=354.26ms p(90)=42.77ms  p(95)=47.55ms  p(99.9)=88.05ms
       { expected_response:true }...: avg=32.34ms  min=2.43ms  med=31.45ms max=354.26ms p(90)=42.77ms  p(95)=47.55ms  p(99.9)=88.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184010
     http_req_receiving.............: avg=128.82µs min=30.63µs med=62.53µs max=207.36ms p(90)=135.86µs p(95)=290.42µs p(99.9)=5.67ms 
     http_req_sending...............: avg=45.71µs  min=5.34µs  med=10.55µs max=103.38ms p(90)=24.39µs  p(95)=135.83µs p(99.9)=3.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.17ms  min=2.34ms  med=31.32ms max=156.56ms p(90)=42.58ms  p(95)=47.32ms  p(99.9)=86.94ms
     http_reqs......................: 184010  1529.549748/s
     iteration_duration.............: avg=32.61ms  min=3.59ms  med=31.69ms max=367.74ms p(90)=43.01ms  p(95)=47.8ms   p(99.9)=88.7ms 
     iterations.....................: 183910  1528.718516/s
     success_rate...................: 100.00% ✓ 183910      ✗ 0     
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

     checks.........................: 100.00% ✓ 437379      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.26µs  min=1.03µs  med=2.49µs  max=4.02ms   p(90)=4.1µs    p(95)=4.77µs   p(99.9)=36.73µs
     http_req_connecting............: avg=368ns   min=0s      med=0s      max=2.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.9ms  min=2.26ms  med=40.39ms max=331.71ms p(90)=57.32ms  p(95)=62.56ms  p(99.9)=88.75ms
       { expected_response:true }...: avg=40.9ms  min=2.26ms  med=40.39ms max=331.71ms p(90)=57.32ms  p(95)=62.56ms  p(99.9)=88.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145893
     http_req_receiving.............: avg=85.37µs min=30.07µs med=64.57µs max=98.12ms  p(90)=103.34µs p(95)=123.21µs p(99.9)=1.96ms 
     http_req_sending...............: avg=28.97µs min=5.33µs  med=11.39µs max=82.99ms  p(90)=18.27µs  p(95)=22.18µs  p(99.9)=1.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.78ms min=2.14ms  med=40.27ms max=331.3ms  p(90)=57.19ms  p(95)=62.42ms  p(99.9)=88.21ms
     http_reqs......................: 145893  1212.806285/s
     iteration_duration.............: avg=41.14ms min=4.15ms  med=40.61ms max=341.03ms p(90)=57.54ms  p(95)=62.78ms  p(99.9)=89.51ms
     iterations.....................: 145793  1211.974987/s
     success_rate...................: 100.00% ✓ 145793      ✗ 0     
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

     checks.........................: 100.00% ✓ 182331     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   606 kB/s
     http_req_blocked...............: avg=4.93µs  min=1.08µs  med=2.94µs  max=4.3ms    p(90)=4.44µs   p(95)=4.98µs   p(99.9)=50.4µs  
     http_req_connecting............: avg=1.76µs  min=0s      med=0s      max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.34ms min=4.3ms   med=98.94ms max=343.26ms p(90)=130.42ms p(95)=144.84ms p(99.9)=242.67ms
       { expected_response:true }...: avg=98.34ms min=4.3ms   med=98.94ms max=343.26ms p(90)=130.42ms p(95)=144.84ms p(99.9)=242.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60877
     http_req_receiving.............: avg=88.65µs min=31.46µs med=80.01µs max=78.04ms  p(90)=113.08µs p(95)=124.81µs p(99.9)=856.82µs
     http_req_sending...............: avg=28.55µs min=5.31µs  med=13.81µs max=204.14ms p(90)=19.9µs   p(95)=21.87µs  p(99.9)=613.93µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.23ms min=4.23ms  med=98.84ms max=342.43ms p(90)=130.29ms p(95)=144.72ms p(99.9)=242.13ms
     http_reqs......................: 60877   504.768376/s
     iteration_duration.............: avg=98.74ms min=34.27ms med=99.22ms max=367.26ms p(90)=130.69ms p(95)=145.15ms p(99.9)=244.5ms 
     iterations.....................: 60777   503.939215/s
     success_rate...................: 100.00% ✓ 60777      ✗ 0    
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

     checks.........................: 100.00% ✓ 135078     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   449 kB/s
     http_req_blocked...............: avg=5.8µs    min=1.24µs  med=3.09µs   max=4.18ms   p(90)=4.54µs   p(95)=5.1µs    p(99.9)=479.41µs
     http_req_connecting............: avg=2.49µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=453.33µs
     http_req_duration..............: avg=132.75ms min=6.01ms  med=130.34ms max=355.55ms p(90)=175.71ms p(95)=188.59ms p(99.9)=244.82ms
       { expected_response:true }...: avg=132.75ms min=6.01ms  med=130.34ms max=355.55ms p(90)=175.71ms p(95)=188.59ms p(99.9)=244.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45126
     http_req_receiving.............: avg=96.74µs  min=33.74µs med=86.98µs  max=182.29ms p(90)=117.93µs p(95)=130.31µs p(99.9)=778.07µs
     http_req_sending...............: avg=22.45µs  min=6.08µs  med=15.62µs  max=130.36ms p(90)=20.71µs  p(95)=22.53µs  p(99.9)=586.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.64ms min=5.88ms  med=130.23ms max=354.86ms p(90)=175.61ms p(95)=188.47ms p(99.9)=243.4ms 
     http_reqs......................: 45126   373.68282/s
     iteration_duration.............: avg=133.31ms min=21.96ms med=130.67ms max=369.41ms p(90)=176.05ms p(95)=188.89ms p(99.9)=247.95ms
     iterations.....................: 45026   372.854733/s
     success_rate...................: 100.00% ✓ 45026      ✗ 0    
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

     checks.........................: 100.00% ✓ 88155      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   293 kB/s
     http_req_blocked...............: avg=7.02µs   min=1.26µs  med=3.3µs    max=3.88ms   p(90)=4.58µs   p(95)=5.09µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=203.37ms min=6.35ms  med=192.09ms max=635.52ms p(90)=249.72ms p(95)=413.63ms p(99.9)=541.17ms
       { expected_response:true }...: avg=203.37ms min=6.35ms  med=192.09ms max=635.52ms p(90)=249.72ms p(95)=413.63ms p(99.9)=541.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29485
     http_req_receiving.............: avg=100.39µs min=35.09µs med=93.71µs  max=80.96ms  p(90)=124.49µs p(95)=136.83µs p(99.9)=668.43µs
     http_req_sending...............: avg=29.56µs  min=6.13µs  med=17.22µs  max=79.45ms  p(90)=21.81µs  p(95)=23.57µs  p(99.9)=610.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.24ms min=6.25ms  med=191.98ms max=635.43ms p(90)=249.6ms  p(95)=413.53ms p(99.9)=541.07ms
     http_reqs......................: 29485   243.825628/s
     iteration_duration.............: avg=204.33ms min=42.35ms med=192.49ms max=635.75ms p(90)=250.18ms p(95)=414.8ms  p(99.9)=541.45ms
     iterations.....................: 29385   242.99868/s
     success_rate...................: 100.00% ✓ 29385      ✗ 0    
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

     checks.........................: 100.00% ✓ 86133      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=4.74µs   min=1.2µs   med=3.26µs   max=1.73ms   p(90)=4.53µs   p(95)=5.09µs   p(99.9)=555.37µs
     http_req_connecting............: avg=1.3µs    min=0s      med=0s       max=1.7ms    p(90)=0s       p(95)=0s       p(99.9)=523.07µs
     http_req_duration..............: avg=208.11ms min=8.59ms  med=206.06ms max=388.51ms p(90)=221.13ms p(95)=227.85ms p(99.9)=293.75ms
       { expected_response:true }...: avg=208.11ms min=8.59ms  med=206.06ms max=388.51ms p(90)=221.13ms p(95)=227.85ms p(99.9)=293.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28811
     http_req_receiving.............: avg=155.39µs min=35.83µs med=92.5µs   max=207.31ms p(90)=123.75µs p(95)=136.81µs p(99.9)=1.18ms  
     http_req_sending...............: avg=34.33µs  min=6.04µs  med=16.85µs  max=199.78ms p(90)=21.42µs  p(95)=23.15µs  p(99.9)=599.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.92ms min=8.49ms  med=205.92ms max=350.15ms p(90)=220.99ms p(95)=227.67ms p(99.9)=292.45ms
     http_reqs......................: 28811   237.948561/s
     iteration_duration.............: avg=209.11ms min=63.47ms med=206.35ms max=402.55ms p(90)=221.4ms  p(95)=228.19ms p(99.9)=295.49ms
     iterations.....................: 28711   237.122666/s
     success_rate...................: 100.00% ✓ 28711      ✗ 0    
     vus............................: 40      min=40       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

