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
| hive-router | v0.0.49 | 2,933 | 3,093 | 2,893 | 2.3% |  |
| hotchocolate | 16.1.3-p.1 | 2,161 | 2,217 | 2,105 | 1.7% |  |
| grafbase | 0.53.3 | 2,024 | 2,085 | 1,987 | 1.6% |  |
| cosmo | 0.307.0 | 1,244 | 1,254 | 1,238 | 0.5% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 546 | 552 | 540 | 0.7% |  |
| apollo-router | v2.13.1 | 407 | 427 | 398 | 2.2% |  |
| hive-gateway | 2.5.25 | 246 | 249 | 244 | 0.7% |  |
| apollo-gateway | 2.13.3 | 245 | 246 | 244 | 0.4% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,411 | 2,531 | 2,335 | 2.3% |  |
| hotchocolate | 16.1.3-p.1 | 1,950 | 1,998 | 1,942 | 1.0% |  |
| grafbase | 0.53.3 | 1,541 | 1,576 | 1,527 | 1.0% |  |
| cosmo | 0.307.0 | 1,200 | 1,213 | 1,189 | 0.7% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 519 | 530 | 513 | 1.0% |  |
| apollo-router | v2.13.1 | 393 | 400 | 383 | 1.2% |  |
| apollo-gateway | 2.13.3 | 241 | 243 | 238 | 0.7% |  |
| hive-gateway | 2.5.25 | 237 | 242 | 234 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1057665     ✗ 0     
     data_received..................: 31 GB   257 MB/s
     data_sent......................: 424 MB  3.5 MB/s
     http_req_blocked...............: avg=2.98µs   min=972ns   med=2.15µs  max=23.75ms  p(90)=3.36µs  p(95)=3.98µs   p(99.9)=34.52µs
     http_req_connecting............: avg=285ns    min=0s      med=0s      max=3.69ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.78ms  min=1.59ms  med=15.79ms max=290.62ms p(90)=25.1ms  p(95)=29.04ms  p(99.9)=51.54ms
       { expected_response:true }...: avg=16.78ms  min=1.59ms  med=15.79ms max=290.62ms p(90)=25.1ms  p(95)=29.04ms  p(99.9)=51.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 352655
     http_req_receiving.............: avg=138.48µs min=28.02µs med=49.5µs  max=132.61ms p(90)=98.05µs p(95)=278.08µs p(99.9)=14.45ms
     http_req_sending...............: avg=58.02µs  min=5.21µs  med=9µs     max=145.63ms p(90)=15.23µs p(95)=119.67µs p(99.9)=10.1ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.58ms  min=1.5ms   med=15.64ms max=281.83ms p(90)=24.82ms p(95)=28.64ms  p(99.9)=50.26ms
     http_reqs......................: 352655  2933.940908/s
     iteration_duration.............: avg=17ms     min=2.17ms  med=16ms    max=329.83ms p(90)=25.33ms p(95)=29.3ms   p(99.9)=52.86ms
     iterations.....................: 352555  2933.10895/s
     success_rate...................: 100.00% ✓ 352555      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 779838      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.4µs    min=1.08µs  med=2.39µs   max=14.79ms  p(90)=3.56µs   p(95)=4.16µs   p(99.9)=34.87µs 
     http_req_connecting............: avg=364ns    min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.84ms  min=2.4ms   med=14.58ms  max=344.62ms p(90)=51.03ms  p(95)=69.1ms   p(99.9)=163.94ms
       { expected_response:true }...: avg=22.84ms  min=2.4ms   med=14.58ms  max=344.62ms p(90)=51.03ms  p(95)=69.1ms   p(99.9)=163.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260046
     http_req_receiving.............: avg=638.88µs min=52.89µs med=105.77µs max=165.33ms p(90)=950.89µs p(95)=1.48ms   p(99.9)=58.96ms 
     http_req_sending...............: avg=44.37µs  min=5.48µs  med=9.59µs   max=85.15ms  p(90)=15.81µs  p(95)=110.84µs p(99.9)=3.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.16ms  min=2.28ms  med=14.08ms  max=343.64ms p(90)=49.71ms  p(95)=67.77ms  p(99.9)=162.4ms 
     http_reqs......................: 260046  2161.751477/s
     iteration_duration.............: avg=23.07ms  min=3.12ms  med=14.8ms   max=364.9ms  p(90)=51.28ms  p(95)=69.36ms  p(99.9)=165.19ms
     iterations.....................: 259946  2160.920182/s
     success_rate...................: 100.00% ✓ 259946      ✗ 0     
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

     checks.........................: 100.00% ✓ 729960      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 293 MB  2.4 MB/s
     http_req_blocked...............: avg=3.22µs   min=1µs    med=2.5µs   max=13.24ms  p(90)=3.91µs   p(95)=4.66µs   p(99.9)=42.92µs
     http_req_connecting............: avg=176ns    min=0s     med=0s      max=2.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.4ms   min=1.93ms med=24.15ms max=335.62ms p(90)=29.26ms  p(95)=31.55ms  p(99.9)=53.7ms 
       { expected_response:true }...: avg=24.4ms   min=1.93ms med=24.15ms max=335.62ms p(90)=29.26ms  p(95)=31.55ms  p(99.9)=53.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 243420
     http_req_receiving.............: avg=120.85µs min=30.4µs med=61.19µs max=111.46ms p(90)=105.35µs p(95)=208.58µs p(99.9)=9.57ms 
     http_req_sending...............: avg=48µs     min=5.29µs med=10.77µs max=206.02ms p(90)=18.27µs  p(95)=119.81µs p(99.9)=2.96ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.23ms  min=1.86ms med=24.03ms max=247.47ms p(90)=29.08ms  p(95)=31.29ms  p(99.9)=52.65ms
     http_reqs......................: 243420  2024.306013/s
     iteration_duration.............: avg=24.64ms  min=3.32ms med=24.37ms max=360.24ms p(90)=29.49ms  p(95)=31.8ms   p(99.9)=54.19ms
     iterations.....................: 243320  2023.474403/s
     success_rate...................: 100.00% ✓ 243320      ✗ 0     
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

     checks.........................: 100.00% ✓ 448854      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.01µs  min=1.02µs  med=2.37µs  max=2.56ms   p(90)=3.6µs   p(95)=4.16µs   p(99.9)=34.65µs
     http_req_connecting............: avg=347ns   min=0s      med=0s      max=2.52ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.86ms min=2.1ms   med=39.33ms max=314.98ms p(90)=56.11ms p(95)=61.26ms  p(99.9)=84.81ms
       { expected_response:true }...: avg=39.86ms min=2.1ms   med=39.33ms max=314.98ms p(90)=56.11ms p(95)=61.26ms  p(99.9)=84.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149718
     http_req_receiving.............: avg=78.74µs min=29.41µs med=59.84µs max=24.8ms   p(90)=93.92µs p(95)=110.68µs p(99.9)=1.97ms 
     http_req_sending...............: avg=25.95µs min=5.12µs  med=10.26µs max=140.03ms p(90)=15µs    p(95)=18.87µs  p(99.9)=1.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.75ms min=1.99ms  med=39.24ms max=314.77ms p(90)=56ms    p(95)=61.15ms  p(99.9)=84.52ms
     http_reqs......................: 149718  1244.779763/s
     iteration_duration.............: avg=40.09ms min=3.77ms  med=39.53ms max=340.77ms p(90)=56.31ms p(95)=61.46ms  p(99.9)=85.23ms
     iterations.....................: 149618  1243.948347/s
     success_rate...................: 100.00% ✓ 149618      ✗ 0     
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

     checks.........................: 100.00% ✓ 197451     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   657 kB/s
     http_req_blocked...............: avg=3.99µs  min=1.22µs  med=2.96µs  max=2.62ms   p(90)=4.52µs   p(95)=5.15µs   p(99.9)=51.44µs 
     http_req_connecting............: avg=723ns   min=0s      med=0s      max=2.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.8ms  min=4.21ms  med=88.12ms max=339.78ms p(90)=110.14ms p(95)=122.11ms p(99.9)=214.68ms
       { expected_response:true }...: avg=90.8ms  min=4.21ms  med=88.12ms max=339.78ms p(90)=110.14ms p(95)=122.11ms p(99.9)=214.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65917
     http_req_receiving.............: avg=84.33µs min=32.43µs med=76.69µs max=5.94ms   p(90)=110.88µs p(95)=123.48µs p(99.9)=870.49µs
     http_req_sending...............: avg=23.49µs min=5.75µs  med=13.3µs  max=185.92ms p(90)=19.87µs  p(95)=22.14µs  p(99.9)=643.67µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.69ms min=4.06ms  med=88.01ms max=339.53ms p(90)=110.03ms p(95)=121.97ms p(99.9)=213.85ms
     http_reqs......................: 65917   546.744527/s
     iteration_duration.............: avg=91.17ms min=25.83ms med=88.35ms max=348.85ms p(90)=110.39ms p(95)=122.43ms p(99.9)=216.33ms
     iterations.....................: 65817   545.915083/s
     success_rate...................: 100.00% ✓ 65817      ✗ 0    
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

     checks.........................: 100.00% ✓ 147351     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   490 kB/s
     http_req_blocked...............: avg=5.55µs   min=1.28µs  med=3.31µs   max=4.47ms   p(90)=4.67µs   p(95)=5.22µs   p(99.9)=164.22µs
     http_req_connecting............: avg=2.01µs   min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=103.39µs
     http_req_duration..............: avg=121.69ms min=5.34ms  med=121.39ms max=359.83ms p(90)=147.18ms p(95)=154.7ms  p(99.9)=190.6ms 
       { expected_response:true }...: avg=121.69ms min=5.34ms  med=121.39ms max=359.83ms p(90)=147.18ms p(95)=154.7ms  p(99.9)=190.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 49217
     http_req_receiving.............: avg=87.18µs  min=31.86µs med=80.66µs  max=53.17ms  p(90)=111.17µs p(95)=122.35µs p(99.9)=737.16µs
     http_req_sending...............: avg=23.22µs  min=5.69µs  med=14.78µs  max=73.89ms  p(90)=20.29µs  p(95)=22.09µs  p(99.9)=659.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.58ms min=5.26ms  med=121.27ms max=359.29ms p(90)=147.08ms p(95)=154.6ms  p(99.9)=189.83ms
     http_reqs......................: 49217   407.840818/s
     iteration_duration.............: avg=122.18ms min=18.05ms med=121.68ms max=384.51ms p(90)=147.44ms p(95)=155.01ms p(99.9)=193.24ms
     iterations.....................: 49117   407.012159/s
     success_rate...................: 100.00% ✓ 49117      ✗ 0    
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

     checks.........................: 100.00% ✓ 89049      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=7.22µs   min=1.14µs  med=3.75µs   max=4.29ms   p(90)=5.37µs   p(95)=6.02µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=3.21µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=201.33ms min=6.45ms  med=185.82ms max=930.6ms  p(90)=297.77ms p(95)=423.84ms p(99.9)=723.63ms
       { expected_response:true }...: avg=201.33ms min=6.45ms  med=185.82ms max=930.6ms  p(90)=297.77ms p(95)=423.84ms p(99.9)=723.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29783
     http_req_receiving.............: avg=104.68µs min=32.08µs med=97.87µs  max=66.3ms   p(90)=130.46µs p(95)=144.3µs  p(99.9)=608.65µs
     http_req_sending...............: avg=28.76µs  min=5.85µs  med=18.43µs  max=50.28ms  p(90)=23.85µs  p(95)=25.72µs  p(99.9)=687.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.2ms  min=6.32ms  med=185.69ms max=930.52ms p(90)=297.65ms p(95)=423.71ms p(99.9)=723.5ms 
     http_reqs......................: 29783   246.169434/s
     iteration_duration.............: avg=202.31ms min=34.72ms med=186.3ms  max=930.87ms p(90)=298.47ms p(95)=425.33ms p(99.9)=723.93ms
     iterations.....................: 29683   245.34289/s
     success_rate...................: 100.00% ✓ 29683      ✗ 0    
     vus............................: 1       min=1        max=50 
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

     checks.........................: 100.00% ✓ 89028      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=6.98µs   min=1.26µs  med=3.15µs   max=4.3ms    p(90)=4.36µs   p(95)=4.85µs   p(99.9)=1.96ms  
     http_req_connecting............: avg=3.67µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=1.92ms  
     http_req_duration..............: avg=201.36ms min=8.26ms  med=201.12ms max=429.55ms p(90)=211.39ms p(95)=217.4ms  p(99.9)=281.64ms
       { expected_response:true }...: avg=201.36ms min=8.26ms  med=201.12ms max=429.55ms p(90)=211.39ms p(95)=217.4ms  p(99.9)=281.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29776
     http_req_receiving.............: avg=107.62µs min=33.67µs med=85.43µs  max=213.33ms p(90)=116.58µs p(95)=127.92µs p(99.9)=844.34µs
     http_req_sending...............: avg=26.01µs  min=5.78µs  med=15.14µs  max=140.93ms p(90)=20.31µs  p(95)=22.03µs  p(99.9)=674.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.23ms min=8.13ms  med=201.01ms max=428.93ms p(90)=211.29ms p(95)=217.24ms p(99.9)=280.82ms
     http_reqs......................: 29776   245.975372/s
     iteration_duration.............: avg=202.31ms min=68.6ms  med=201.42ms max=457.02ms p(90)=211.67ms p(95)=217.72ms p(99.9)=289.45ms
     iterations.....................: 29676   245.149286/s
     success_rate...................: 100.00% ✓ 29676      ✗ 0    
     vus............................: 28      min=28       max=50 
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

     checks.........................: 100.00% ✓ 869478      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=3.29µs   min=942ns   med=2.38µs  max=10.25ms  p(90)=3.88µs   p(95)=4.65µs   p(99.9)=38.9µs 
     http_req_connecting............: avg=349ns    min=0s      med=0s      max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.45ms  min=1.83ms  med=19.88ms max=347.21ms p(90)=28.61ms  p(95)=31.97ms  p(99.9)=53.79ms
       { expected_response:true }...: avg=20.45ms  min=1.83ms  med=19.88ms max=347.21ms p(90)=28.61ms  p(95)=31.97ms  p(99.9)=53.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289926
     http_req_receiving.............: avg=141.61µs min=28.93µs med=53.74µs max=262.47ms p(90)=104.58µs p(95)=270.53µs p(99.9)=10.98ms
     http_req_sending...............: avg=54.25µs  min=5.35µs  med=9.83µs  max=34.23ms  p(90)=18.04µs  p(95)=125.53µs p(99.9)=6.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.25ms  min=1.75ms  med=19.73ms max=84.83ms  p(90)=28.38ms  p(95)=31.64ms  p(99.9)=53ms   
     http_reqs......................: 289926  2411.523986/s
     iteration_duration.............: avg=20.69ms  min=3.16ms  med=20.09ms max=357.67ms p(90)=28.84ms  p(95)=32.22ms  p(99.9)=54.58ms
     iterations.....................: 289826  2410.692214/s
     success_rate...................: 100.00% ✓ 289826      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 703356      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 282 MB  2.3 MB/s
     http_req_blocked...............: avg=3.4µs    min=1.06µs  med=2.51µs   max=6.87ms   p(90)=3.79µs  p(95)=4.45µs   p(99.9)=37.02µs 
     http_req_connecting............: avg=488ns    min=0s      med=0s       max=5.38ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.34ms  min=1.93ms  med=17.09ms  max=513.95ms p(90)=53.93ms p(95)=71.16ms  p(99.9)=206.25ms
       { expected_response:true }...: avg=25.34ms  min=1.93ms  med=17.09ms  max=513.95ms p(90)=53.93ms p(95)=71.16ms  p(99.9)=206.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 234552
     http_req_receiving.............: avg=701.12µs min=52.51µs med=109.04µs max=288.79ms p(90)=1.13ms  p(95)=1.8ms    p(99.9)=58.32ms 
     http_req_sending...............: avg=44.6µs   min=5.42µs  med=9.89µs   max=199.41ms p(90)=17.02µs p(95)=112.03µs p(99.9)=3.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.59ms  min=1.8ms   med=16.52ms  max=513.84ms p(90)=52.66ms p(95)=69.68ms  p(99.9)=204.46ms
     http_reqs......................: 234552  1950.776889/s
     iteration_duration.............: avg=25.58ms  min=2.7ms   med=17.31ms  max=514.16ms p(90)=54.18ms p(95)=71.42ms  p(99.9)=210.22ms
     iterations.....................: 234452  1949.945186/s
     success_rate...................: 100.00% ✓ 234452      ✗ 0     
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

     checks.........................: 100.00% ✓ 555846      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.9 MB/s
     http_req_blocked...............: avg=3.61µs   min=942ns   med=2.46µs  max=5.61ms   p(90)=4.83µs   p(95)=5.95µs   p(99.9)=47.23µs
     http_req_connecting............: avg=465ns    min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.1ms   min=2.37ms  med=31.27ms max=367.33ms p(90)=42.54ms  p(95)=47.02ms  p(99.9)=86.97ms
       { expected_response:true }...: avg=32.1ms   min=2.37ms  med=31.27ms max=367.33ms p(90)=42.54ms  p(95)=47.02ms  p(99.9)=86.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185382
     http_req_receiving.............: avg=150.37µs min=30.56µs med=62.54µs max=291.66ms p(90)=136.34µs p(95)=290µs    p(99.9)=7.12ms 
     http_req_sending...............: avg=43.7µs   min=5.51µs  med=10.56µs max=38.38ms  p(90)=24.28µs  p(95)=137.05µs p(99.9)=3ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.91ms  min=2.25ms  med=31.14ms max=133.19ms p(90)=42.35ms  p(95)=46.78ms  p(99.9)=82.88ms
     http_reqs......................: 185382  1541.005726/s
     iteration_duration.............: avg=32.37ms  min=3.48ms  med=31.51ms max=377.5ms  p(90)=42.78ms  p(95)=47.27ms  p(99.9)=88.02ms
     iterations.....................: 185282  1540.174466/s
     success_rate...................: 100.00% ✓ 185282      ✗ 0     
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

     checks.........................: 100.00% ✓ 432828      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.77µs  min=1.08µs  med=2.72µs  max=3.96ms   p(90)=4.27µs   p(95)=4.95µs   p(99.9)=39.15µs
     http_req_connecting............: avg=680ns   min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.32ms min=2.25ms  med=40.79ms max=339.76ms p(90)=58.14ms  p(95)=63.47ms  p(99.9)=89.93ms
       { expected_response:true }...: avg=41.32ms min=2.25ms  med=40.79ms max=339.76ms p(90)=58.14ms  p(95)=63.47ms  p(99.9)=89.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144376
     http_req_receiving.............: avg=91.17µs min=28.43µs med=68.59µs max=211.52ms p(90)=108.77µs p(95)=129.09µs p(99.9)=2.38ms 
     http_req_sending...............: avg=27.9µs  min=5.3µs   med=11.77µs max=126.23ms p(90)=18.21µs  p(95)=22.07µs  p(99.9)=1.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.2ms  min=2.12ms  med=40.67ms max=293.48ms p(90)=58.03ms  p(95)=63.32ms  p(99.9)=89.66ms
     http_reqs......................: 144376  1200.273543/s
     iteration_duration.............: avg=41.58ms min=4.31ms  med=41.01ms max=350.69ms p(90)=58.36ms  p(95)=63.69ms  p(99.9)=90.63ms
     iterations.....................: 144276  1199.44219/s
     success_rate...................: 100.00% ✓ 144276      ✗ 0     
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

     checks.........................: 100.00% ✓ 187554     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 75 MB   624 kB/s
     http_req_blocked...............: avg=4.25µs   min=1.21µs med=3.14µs  max=3ms      p(90)=4.69µs   p(95)=5.32µs   p(99.9)=50.08µs 
     http_req_connecting............: avg=880ns    min=0s     med=0s      max=2.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.58ms  min=4.34ms med=92.72ms max=341.89ms p(90)=115.51ms p(95)=127.81ms p(99.9)=226.46ms
       { expected_response:true }...: avg=95.58ms  min=4.34ms med=92.72ms max=341.89ms p(90)=115.51ms p(95)=127.81ms p(99.9)=226.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62618
     http_req_receiving.............: avg=156.89µs min=31.7µs med=81.84µs max=220.16ms p(90)=115.4µs  p(95)=128.13µs p(99.9)=1.2ms   
     http_req_sending...............: avg=23.8µs   min=5.63µs med=14.24µs max=127ms    p(90)=20.78µs  p(95)=22.92µs  p(99.9)=675.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.4ms   min=4.18ms med=92.61ms max=290.16ms p(90)=115.4ms  p(95)=127.32ms p(99.9)=222.62ms
     http_reqs......................: 62618   519.292225/s
     iteration_duration.............: avg=95.99ms  min=7.55ms med=92.97ms max=360.84ms p(90)=115.79ms p(95)=128.16ms p(99.9)=229.69ms
     iterations.....................: 62518   518.462923/s
     success_rate...................: 100.00% ✓ 62518      ✗ 0    
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

     checks.........................: 100.00% ✓ 142419     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   473 kB/s
     http_req_blocked...............: avg=5.94µs   min=1.21µs  med=3.6µs    max=4.24ms   p(90)=5.06µs   p(95)=5.63µs   p(99.9)=341.27µs
     http_req_connecting............: avg=2.08µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=144.74µs
     http_req_duration..............: avg=125.89ms min=5.98ms  med=123.34ms max=341.71ms p(90)=166.73ms p(95)=179.45ms p(99.9)=231.65ms
       { expected_response:true }...: avg=125.89ms min=5.98ms  med=123.34ms max=341.71ms p(90)=166.73ms p(95)=179.45ms p(99.9)=231.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47573
     http_req_receiving.............: avg=95.1µs   min=31.08µs med=86.07µs  max=112.61ms p(90)=118.31µs p(95)=130.11µs p(99.9)=742.9µs 
     http_req_sending...............: avg=30.61µs  min=5.94µs  med=16.09µs  max=170.92ms p(90)=21.6µs   p(95)=23.51µs  p(99.9)=607.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.77ms min=5.81ms  med=123.23ms max=341.03ms p(90)=166.61ms p(95)=179.3ms  p(99.9)=230.76ms
     http_reqs......................: 47573   393.980272/s
     iteration_duration.............: avg=126.43ms min=33.31ms med=123.67ms max=378.25ms p(90)=167.04ms p(95)=179.75ms p(99.9)=235.6ms 
     iterations.....................: 47473   393.152112/s
     success_rate...................: 100.00% ✓ 47473      ✗ 0    
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

     checks.........................: 100.00% ✓ 87495      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.27µs  med=3.47µs   max=4ms      p(90)=4.84µs   p(95)=5.42µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=204.84ms min=8.62ms  med=205.18ms max=453.95ms p(90)=211.58ms p(95)=218.33ms p(99.9)=291.6ms 
       { expected_response:true }...: avg=204.84ms min=8.62ms  med=205.18ms max=453.95ms p(90)=211.58ms p(95)=218.33ms p(99.9)=291.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29265
     http_req_receiving.............: avg=233.66µs min=34.49µs med=93.44µs  max=228.6ms  p(90)=125.04µs p(95)=137.99µs p(99.9)=66.15ms 
     http_req_sending...............: avg=39.02µs  min=5.88µs  med=16.83µs  max=201.9ms  p(90)=21.8µs   p(95)=23.6µs   p(99.9)=598.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.57ms min=8.49ms  med=205.03ms max=292.9ms  p(90)=211.44ms p(95)=218.14ms p(99.9)=290.13ms
     http_reqs......................: 29265   241.719595/s
     iteration_duration.............: avg=205.82ms min=15.53ms med=205.54ms max=462.07ms p(90)=211.84ms p(95)=218.64ms p(99.9)=313.03ms
     iterations.....................: 29165   240.893626/s
     success_rate...................: 100.00% ✓ 29165      ✗ 0    
     vus............................: 34      min=34       max=50 
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

     checks.........................: 100.00% ✓ 85800      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.47µs   min=1.28µs  med=3.69µs   max=4.06ms   p(90)=5.14µs   p(95)=5.74µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=208.91ms min=6.76ms  med=189.47ms max=689.98ms p(90)=246.74ms p(95)=454.41ms p(99.9)=577.39ms
       { expected_response:true }...: avg=208.91ms min=6.76ms  med=189.47ms max=689.98ms p(90)=246.74ms p(95)=454.41ms p(99.9)=577.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28700
     http_req_receiving.............: avg=103.71µs min=35.12µs med=98.55µs  max=8.59ms   p(90)=130.32µs p(95)=143.83µs p(99.9)=662.84µs
     http_req_sending...............: avg=27.19µs  min=6.4µs   med=18µs     max=52.17ms  p(90)=22.95µs  p(95)=24.58µs  p(99.9)=669.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.78ms min=6.53ms  med=189.33ms max=689.85ms p(90)=246.62ms p(95)=454.32ms p(99.9)=577.25ms
     http_reqs......................: 28700   237.203312/s
     iteration_duration.............: avg=209.93ms min=53.04ms med=189.83ms max=690.27ms p(90)=247.33ms p(95)=454.93ms p(99.9)=577.74ms
     iterations.....................: 28600   236.37682/s
     success_rate...................: 100.00% ✓ 28600      ✗ 0    
     vus............................: 2       min=2        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

