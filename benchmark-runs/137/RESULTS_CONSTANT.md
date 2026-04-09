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
| hive-router | v0.0.43 | 3,050 | 3,217 | 2,989 | 2.4% |  |
| hotchocolate | 16.0.0-rc.1.27 | 2,144 | 2,193 | 2,129 | 1.0% |  |
| grafbase | 0.53.2 | 1,961 | 2,033 | 1,933 | 1.8% |  |
| cosmo | 0.298.0 | 1,271 | 1,292 | 1,262 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.14 | 618 | 633 | 613 | 1.0% |  |
| apollo-router | v2.12.1 | 428 | 436 | 422 | 1.1% | non-compatible response (1 across 1/9 runs) |
| hive-gateway | 2.5.14 | 265 | 271 | 262 | 1.1% |  |
| apollo-gateway | 2.13.3 | 245 | 247 | 244 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,474 | 2,595 | 2,404 | 2.5% |  |
| hotchocolate | 16.0.0-rc.1.27 | 1,979 | 2,029 | 1,964 | 1.1% |  |
| grafbase | 0.53.2 | 1,538 | 1,562 | 1,528 | 0.7% |  |
| cosmo | 0.298.0 | 1,212 | 1,230 | 1,203 | 0.8% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 600 | 615 | 594 | 1.2% |  |
| apollo-router | v2.12.1 | 396 | 406 | 392 | 1.2% |  |
| hive-gateway | 2.5.14 | 261 | 267 | 257 | 1.3% |  |
| apollo-gateway | 2.13.3 | 241 | 244 | 240 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1099626     ✗ 0     
     data_received..................: 32 GB   268 MB/s
     data_sent......................: 441 MB  3.7 MB/s
     http_req_blocked...............: avg=2.75µs   min=1µs     med=2.01µs  max=19.96ms  p(90)=3.08µs  p(95)=3.69µs   p(99.9)=28.96µs
     http_req_connecting............: avg=277ns    min=0s      med=0s      max=4.68ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.13ms  min=1.61ms  med=15.05ms max=308.86ms p(90)=24.16ms p(95)=28.55ms  p(99.9)=51.94ms
       { expected_response:true }...: avg=16.13ms  min=1.61ms  med=15.05ms max=308.86ms p(90)=24.16ms p(95)=28.55ms  p(99.9)=51.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 366642
     http_req_receiving.............: avg=145.52µs min=26.85µs med=47.59µs max=112.3ms  p(90)=94.68µs p(95)=274.15µs p(99.9)=17.63ms
     http_req_sending...............: avg=61.42µs  min=5.19µs  med=8.89µs  max=155.37ms p(90)=14.96µs p(95)=117.55µs p(99.9)=13.16ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.92ms  min=1.53ms  med=14.9ms  max=308.31ms p(90)=23.83ms p(95)=28.04ms  p(99.9)=50.31ms
     http_reqs......................: 366642  3050.087099/s
     iteration_duration.............: avg=16.36ms  min=2.17ms  med=15.26ms max=323.48ms p(90)=24.39ms p(95)=28.83ms  p(99.9)=53.67ms
     iterations.....................: 366542  3049.255201/s
     success_rate...................: 100.00% ✓ 366542      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.27)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 773676      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=2.8µs    min=942ns   med=2µs      max=11.85ms  p(90)=3.09µs   p(95)=3.69µs   p(99.9)=34.52µs 
     http_req_connecting............: avg=377ns    min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.02ms  min=2.45ms  med=14.65ms  max=322.6ms  p(90)=51.69ms  p(95)=70.16ms  p(99.9)=166.53ms
       { expected_response:true }...: avg=23.02ms  min=2.45ms  med=14.65ms  max=322.6ms  p(90)=51.69ms  p(95)=70.16ms  p(99.9)=166.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257992
     http_req_receiving.............: avg=664.87µs min=50.58µs med=105.66µs max=174.98ms p(90)=972.08µs p(95)=1.51ms   p(99.9)=61.73ms 
     http_req_sending...............: avg=42.06µs  min=4.77µs  med=9.11µs   max=203.3ms  p(90)=15.84µs  p(95)=103.46µs p(99.9)=2.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.32ms  min=2.32ms  med=14.15ms  max=297ms    p(90)=50.26ms  p(95)=68.74ms  p(99.9)=164.73ms
     http_reqs......................: 257992  2144.714208/s
     iteration_duration.............: avg=23.25ms  min=3.22ms  med=14.86ms  max=349.02ms p(90)=51.93ms  p(95)=70.4ms   p(99.9)=168.61ms
     iterations.....................: 257892  2143.882898/s
     success_rate...................: 100.00% ✓ 257892      ✗ 0     
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

     checks.........................: 100.00% ✓ 707457      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=2.67µs   min=961ns   med=2.11µs  max=4.93ms   p(90)=3.38µs  p(95)=4.06µs   p(99.9)=37.6µs 
     http_req_connecting............: avg=169ns    min=0s      med=0s      max=1.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.2ms   min=1.97ms  med=24.94ms max=325.75ms p(90)=30.13ms p(95)=32.19ms  p(99.9)=53.55ms
       { expected_response:true }...: avg=25.2ms   min=1.97ms  med=24.94ms max=325.75ms p(90)=30.13ms p(95)=32.19ms  p(99.9)=53.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 235919
     http_req_receiving.............: avg=123.82µs min=29.52µs med=58.21µs max=245.26ms p(90)=97.08µs p(95)=145.97µs p(99.9)=8.76ms 
     http_req_sending...............: avg=38.99µs  min=5.11µs  med=9.85µs  max=106.33ms p(90)=16.06µs p(95)=56.28µs  p(99.9)=2.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=25.04ms  min=1.87ms  med=24.83ms max=126.21ms p(90)=29.98ms p(95)=31.98ms  p(99.9)=52.33ms
     http_reqs......................: 235919  1961.840943/s
     iteration_duration.............: avg=25.43ms  min=3.35ms  med=25.15ms max=353.46ms p(90)=30.35ms p(95)=32.42ms  p(99.9)=54.02ms
     iterations.....................: 235819  1961.009369/s
     success_rate...................: 100.00% ✓ 235819      ✗ 0     
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

     checks.........................: 100.00% ✓ 458442      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.01µs  min=962ns   med=2.03µs  max=4.09ms   p(90)=3.3µs   p(95)=3.94µs   p(99.9)=34.58µs
     http_req_connecting............: avg=662ns   min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.02ms min=2.15ms  med=38.43ms max=327.02ms p(90)=55.01ms p(95)=59.89ms  p(99.9)=84.14ms
       { expected_response:true }...: avg=39.02ms min=2.15ms  med=38.43ms max=327.02ms p(90)=55.01ms p(95)=59.89ms  p(99.9)=84.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152914
     http_req_receiving.............: avg=79.37µs min=28.04µs med=59.18µs max=151.94ms p(90)=94.55µs p(95)=112.11µs p(99.9)=1.95ms 
     http_req_sending...............: avg=25.28µs min=4.63µs  med=9.9µs   max=151.89ms p(90)=15.4µs  p(95)=19.39µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.92ms min=2.08ms  med=38.34ms max=302.46ms p(90)=54.91ms p(95)=59.77ms  p(99.9)=83.76ms
     http_reqs......................: 152914  1271.351673/s
     iteration_duration.............: avg=39.25ms min=4.36ms  med=38.63ms max=346.06ms p(90)=55.21ms p(95)=60.09ms  p(99.9)=84.57ms
     iterations.....................: 152814  1270.520257/s
     success_rate...................: 100.00% ✓ 152814      ✗ 0     
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

     checks.........................: 100.00% ✓ 223398     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 90 MB   743 kB/s
     http_req_blocked...............: avg=3.37µs  min=1.03µs  med=2.5µs   max=2.04ms   p(90)=3.98µs  p(95)=4.56µs   p(99.9)=42.79µs 
     http_req_connecting............: avg=572ns   min=0s      med=0s      max=2ms      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.24ms min=3.61ms  med=77.96ms max=315.18ms p(90)=98.62ms p(95)=108.52ms p(99.9)=202.83ms
       { expected_response:true }...: avg=80.24ms min=3.61ms  med=77.96ms max=315.18ms p(90)=98.62ms p(95)=108.52ms p(99.9)=202.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74566
     http_req_receiving.............: avg=84.43µs min=31.92µs med=72.71µs max=111.73ms p(90)=107.7µs p(95)=120.8µs  p(99.9)=893.7µs 
     http_req_sending...............: avg=23.61µs min=5.27µs  med=12.58µs max=111.65ms p(90)=19.24µs p(95)=21.31µs  p(99.9)=717µs   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.13ms min=3.55ms  med=77.87ms max=314.96ms p(90)=98.51ms p(95)=108.41ms p(99.9)=202.33ms
     http_reqs......................: 74566   618.916164/s
     iteration_duration.............: avg=80.57ms min=27.25ms med=78.18ms max=349.34ms p(90)=98.83ms p(95)=108.75ms p(99.9)=206.53ms
     iterations.....................: 74466   618.08614/s
     success_rate...................: 100.00% ✓ 74466      ✗ 0    
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

     checks.........................: 100.00% ✓ 154989     ✗ 0    
     data_received..................: 4.5 GB  38 MB/s
     data_sent......................: 62 MB   515 kB/s
     http_req_blocked...............: avg=4µs      min=1.11µs  med=2.89µs   max=2.66ms   p(90)=4.28µs   p(95)=4.8µs    p(99.9)=86.07µs 
     http_req_connecting............: avg=916ns    min=0s      med=0s       max=2.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.71ms min=5.5ms   med=115.43ms max=358.22ms p(90)=139.63ms p(95)=146.64ms p(99.9)=182.59ms
       { expected_response:true }...: avg=115.71ms min=5.5ms   med=115.43ms max=358.22ms p(90)=139.63ms p(95)=146.64ms p(99.9)=182.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51763
     http_req_receiving.............: avg=185.53µs min=30.14µs med=80.98µs  max=224.44ms p(90)=111.97µs p(95)=123.62µs p(99.9)=1.28ms  
     http_req_sending...............: avg=26.87µs  min=5.66µs  med=14.96µs  max=218.92ms p(90)=20.24µs  p(95)=22.08µs  p(99.9)=646.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.49ms min=5.39ms  med=115.31ms max=207.52ms p(90)=139.43ms p(95)=146.39ms p(99.9)=175.82ms
     http_reqs......................: 51763   428.872164/s
     iteration_duration.............: avg=116.17ms min=7.75ms  med=115.7ms  max=366.25ms p(90)=139.89ms p(95)=146.9ms  p(99.9)=185.32ms
     iterations.....................: 51663   428.043633/s
     success_rate...................: 100.00% ✓ 51663      ✗ 0    
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

     checks.........................: 100.00% ✓ 95970      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=5.14µs   min=1.29µs  med=3.3µs    max=3.11ms   p(90)=4.67µs   p(95)=5.25µs   p(99.9)=440.36µs
     http_req_connecting............: avg=1.65µs   min=0s      med=0s       max=3.08ms   p(90)=0s       p(95)=0s       p(99.9)=404.09µs
     http_req_duration..............: avg=186.8ms  min=5.79ms  med=169.88ms max=630.9ms  p(90)=217.01ms p(95)=384.88ms p(99.9)=535.45ms
       { expected_response:true }...: avg=186.8ms  min=5.79ms  med=169.88ms max=630.9ms  p(90)=217.01ms p(95)=384.88ms p(99.9)=535.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32090
     http_req_receiving.............: avg=96.01µs  min=34.88µs med=91.4µs   max=11.25ms  p(90)=123.39µs p(95)=135.52µs p(99.9)=674.05µs
     http_req_sending...............: avg=25.82µs  min=5.83µs  med=16.93µs  max=69.73ms  p(90)=21.84µs  p(95)=23.78µs  p(99.9)=702.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.68ms min=5.66ms  med=169.76ms max=630.78ms p(90)=216.89ms p(95)=384.68ms p(99.9)=535.32ms
     http_reqs......................: 32090   265.622619/s
     iteration_duration.............: avg=187.64ms min=23.79ms med=170.23ms max=631.17ms p(90)=217.55ms p(95)=386.3ms  p(99.9)=535.66ms
     iterations.....................: 31990   264.794877/s
     success_rate...................: 100.00% ✓ 31990      ✗ 0    
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

     checks.........................: 100.00% ✓ 88800      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=6.88µs   min=1.26µs  med=3.16µs   max=4.39ms   p(90)=4.43µs   p(95)=4.94µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=201.89ms min=8.52ms  med=193.96ms max=417.97ms p(90)=251.86ms p(95)=262.88ms p(99.9)=320.55ms
       { expected_response:true }...: avg=201.89ms min=8.52ms  med=193.96ms max=417.97ms p(90)=251.86ms p(95)=262.88ms p(99.9)=320.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29700
     http_req_receiving.............: avg=98.78µs  min=34.79µs med=91.14µs  max=53.89ms  p(90)=122.17µs p(95)=134.54µs p(99.9)=539.31µs
     http_req_sending...............: avg=26.93µs  min=6.25µs  med=16.73µs  max=49.69ms  p(90)=21.2µs   p(95)=23.05µs  p(99.9)=578.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.77ms min=8.38ms  med=193.82ms max=417.39ms p(90)=251.73ms p(95)=262.78ms p(99.9)=320.43ms
     http_reqs......................: 29700   245.293388/s
     iteration_duration.............: avg=202.83ms min=45.29ms med=194.86ms max=432.39ms p(90)=252.17ms p(95)=263.2ms  p(99.9)=322.32ms
     iterations.....................: 29600   244.467485/s
     success_rate...................: 100.00% ✓ 29600      ✗ 0    
     vus............................: 36      min=36       max=50 
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

     checks.........................: 100.00% ✓ 892251      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.96µs   min=962ns   med=2.09µs  max=16.4ms   p(90)=3.48µs  p(95)=4.29µs   p(99.9)=32.73µs
     http_req_connecting............: avg=319ns    min=0s      med=0s      max=3.76ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.93ms  min=1.81ms  med=19.3ms  max=356.55ms p(90)=27.91ms p(95)=31.38ms  p(99.9)=53.79ms
       { expected_response:true }...: avg=19.93ms  min=1.81ms  med=19.3ms  max=356.55ms p(90)=27.91ms p(95)=31.38ms  p(99.9)=53.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297517
     http_req_receiving.............: avg=143.91µs min=27.65µs med=50.9µs  max=329.88ms p(90)=99.69µs p(95)=258.47µs p(99.9)=12.42ms
     http_req_sending...............: avg=52.47µs  min=4.9µs   med=9.44µs  max=33.67ms  p(90)=17.87µs p(95)=121.12µs p(99.9)=6.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.73ms  min=1.74ms  med=19.17ms max=72.15ms  p(90)=27.67ms p(95)=31.04ms  p(99.9)=52.27ms
     http_reqs......................: 297517  2474.624419/s
     iteration_duration.............: avg=20.16ms  min=2.91ms  med=19.51ms max=392.14ms p(90)=28.15ms p(95)=31.64ms  p(99.9)=54.33ms
     iterations.....................: 297417  2473.79266/s
     success_rate...................: 100.00% ✓ 297417      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.27)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 713691      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 286 MB  2.4 MB/s
     http_req_blocked...............: avg=2.73µs   min=961ns   med=2.09µs   max=13.34ms  p(90)=3.47µs  p(95)=4.21µs   p(99.9)=35.29µs 
     http_req_connecting............: avg=189ns    min=0s      med=0s       max=2.39ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.97ms  min=1.8ms   med=17.47ms  max=590.04ms p(90)=51.62ms p(95)=68.07ms  p(99.9)=183.95ms
       { expected_response:true }...: avg=24.97ms  min=1.8ms   med=17.47ms  max=590.04ms p(90)=51.62ms p(95)=68.07ms  p(99.9)=183.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237997
     http_req_receiving.............: avg=691.51µs min=50.48µs med=102.62µs max=251.27ms p(90)=1.16ms  p(95)=1.89ms   p(99.9)=54.96ms 
     http_req_sending...............: avg=43.16µs  min=5.08µs  med=9.35µs   max=219.71ms p(90)=18.16µs p(95)=104.27µs p(99.9)=2.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.24ms  min=1.7ms   med=16.91ms  max=589.97ms p(90)=50.32ms p(95)=66.75ms  p(99.9)=179.01ms
     http_reqs......................: 237997  1979.084708/s
     iteration_duration.............: avg=25.21ms  min=2.71ms  med=17.69ms  max=590.23ms p(90)=51.86ms p(95)=68.3ms   p(99.9)=186.64ms
     iterations.....................: 237897  1978.253149/s
     success_rate...................: 100.00% ✓ 237897      ✗ 0     
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

     checks.........................: 100.00% ✓ 555042      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 222 MB  1.8 MB/s
     http_req_blocked...............: avg=3.57µs   min=990ns   med=2.37µs  max=4.31ms   p(90)=4.7µs    p(95)=5.9µs    p(99.9)=45.98µs
     http_req_connecting............: avg=544ns    min=0s      med=0s      max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.15ms  min=2.29ms  med=31.35ms max=341.49ms p(90)=42.63ms  p(95)=47.15ms  p(99.9)=78.44ms
       { expected_response:true }...: avg=32.15ms  min=2.29ms  med=31.35ms max=341.49ms p(90)=42.63ms  p(95)=47.15ms  p(99.9)=78.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185114
     http_req_receiving.............: avg=109.39µs min=30.48µs med=62.51µs max=31.68ms  p(90)=135.28µs p(95)=276µs    p(99.9)=4.86ms 
     http_req_sending...............: avg=47.53µs  min=5.43µs  med=10.74µs max=178.32ms p(90)=25.02µs  p(95)=136.06µs p(99.9)=3.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.99ms  min=2.19ms  med=31.21ms max=340.89ms p(90)=42.44ms  p(95)=46.91ms  p(99.9)=78.11ms
     http_reqs......................: 185114  1538.739726/s
     iteration_duration.............: avg=32.42ms  min=4.36ms  med=31.59ms max=353.29ms p(90)=42.87ms  p(95)=47.39ms  p(99.9)=79.2ms 
     iterations.....................: 185014  1537.908487/s
     success_rate...................: 100.00% ✓ 185014      ✗ 0     
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

     checks.........................: 100.00% ✓ 437445      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.19µs  min=1.03µs  med=2.24µs  max=3.72ms   p(90)=3.74µs   p(95)=4.4µs    p(99.9)=36.17µs
     http_req_connecting............: avg=590ns   min=0s      med=0s      max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.89ms min=2.17ms  med=40.37ms max=321.04ms p(90)=57.31ms  p(95)=62.5ms   p(99.9)=87.81ms
       { expected_response:true }...: avg=40.89ms min=2.17ms  med=40.37ms max=321.04ms p(90)=57.31ms  p(95)=62.5ms   p(99.9)=87.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145915
     http_req_receiving.............: avg=82.87µs min=29.19µs med=65.16µs max=39.6ms   p(90)=103.53µs p(95)=121.99µs p(99.9)=1.67ms 
     http_req_sending...............: avg=28.31µs min=5.17µs  med=11.13µs max=183.68ms p(90)=18µs     p(95)=21.65µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.78ms min=2.06ms  med=40.27ms max=320.4ms  p(90)=57.19ms  p(95)=62.38ms  p(99.9)=87.42ms
     http_reqs......................: 145915  1212.993744/s
     iteration_duration.............: avg=41.14ms min=3.82ms  med=40.58ms max=335.76ms p(90)=57.52ms  p(95)=62.72ms  p(99.9)=88.36ms
     iterations.....................: 145815  1212.162442/s
     success_rate...................: 100.00% ✓ 145815      ✗ 0     
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

     checks.........................: 100.00% ✓ 216831     ✗ 0    
     data_received..................: 6.3 GB  53 MB/s
     data_sent......................: 87 MB   721 kB/s
     http_req_blocked...............: avg=4.5µs   min=1.13µs  med=2.77µs  max=4.23ms   p(90)=4.31µs   p(95)=4.89µs   p(99.9)=46.09µs 
     http_req_connecting............: avg=1.41µs  min=0s      med=0s      max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=82.66ms min=3.92ms  med=79.73ms max=364.31ms p(90)=102.17ms p(95)=113.31ms p(99.9)=208.44ms
       { expected_response:true }...: avg=82.66ms min=3.92ms  med=79.73ms max=364.31ms p(90)=102.17ms p(95)=113.31ms p(99.9)=208.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 72377
     http_req_receiving.............: avg=87.07µs min=30.32µs med=79.02µs max=53.45ms  p(90)=113.32µs p(95)=126.35µs p(99.9)=816.05µs
     http_req_sending...............: avg=26.36µs min=5.6µs   med=13.76µs max=127.04ms p(90)=20.21µs  p(95)=22.44µs  p(99.9)=748.94µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.55ms min=3.81ms  med=79.62ms max=359ms    p(90)=102.06ms p(95)=113.19ms p(99.9)=208.25ms
     http_reqs......................: 72377   600.494953/s
     iteration_duration.............: avg=83.02ms min=24.41ms med=79.98ms max=376.19ms p(90)=102.42ms p(95)=113.6ms  p(99.9)=210.24ms
     iterations.....................: 72277   599.665277/s
     success_rate...................: 100.00% ✓ 72277      ✗ 0    
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

     checks.........................: 100.00% ✓ 143244     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=5.7µs    min=1.24µs  med=3.38µs   max=4.08ms   p(90)=4.9µs    p(95)=5.48µs   p(99.9)=322.75µs
     http_req_connecting............: avg=2µs      min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=113.84µs
     http_req_duration..............: avg=125.16ms min=6.03ms  med=122.62ms max=377.45ms p(90)=165.49ms p(95)=178.25ms p(99.9)=227.77ms
       { expected_response:true }...: avg=125.16ms min=6.03ms  med=122.62ms max=377.45ms p(90)=165.49ms p(95)=178.25ms p(99.9)=227.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47848
     http_req_receiving.............: avg=99.47µs  min=31.63µs med=87.92µs  max=61.71ms  p(90)=119.33µs p(95)=131.1µs  p(99.9)=829.56µs
     http_req_sending...............: avg=31.98µs  min=5.96µs  med=17.04µs  max=139.9ms  p(90)=21.96µs  p(95)=23.81µs  p(99.9)=662.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.02ms min=5.89ms  med=122.51ms max=369.64ms p(90)=165.38ms p(95)=178.14ms p(99.9)=226.7ms 
     http_reqs......................: 47848   396.20681/s
     iteration_duration.............: avg=125.69ms min=22.83ms med=122.94ms max=386.38ms p(90)=165.81ms p(95)=178.57ms p(99.9)=231.02ms
     iterations.....................: 47748   395.378757/s
     success_rate...................: 100.00% ✓ 47748      ✗ 0    
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

     checks.........................: 100.00% ✓ 94698      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.99µs   min=1.19µs  med=3.47µs   max=4.23ms   p(90)=4.92µs   p(95)=5.54µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=3.27µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=189.32ms min=5.86ms  med=171.62ms max=717.36ms p(90)=220.64ms p(95)=395.65ms p(99.9)=528.4ms 
       { expected_response:true }...: avg=189.32ms min=5.86ms  med=171.62ms max=717.36ms p(90)=220.64ms p(95)=395.65ms p(99.9)=528.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31666
     http_req_receiving.............: avg=103.22µs min=32.82µs med=97.56µs  max=20.22ms  p(90)=128.98µs p(95)=142.22µs p(99.9)=615.89µs
     http_req_sending...............: avg=32.91µs  min=5.98µs  med=18.83µs  max=98.76ms  p(90)=23.53µs  p(95)=25.22µs  p(99.9)=584.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.18ms min=5.76ms  med=171.48ms max=717.26ms p(90)=220.53ms p(95)=395.53ms p(99.9)=528.29ms
     http_reqs......................: 31666   261.775535/s
     iteration_duration.............: avg=190.19ms min=48.59ms med=171.98ms max=717.55ms p(90)=221.09ms p(95)=396.44ms p(99.9)=528.67ms
     iterations.....................: 31566   260.948858/s
     success_rate...................: 100.00% ✓ 31566      ✗ 0    
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

     checks.........................: 100.00% ✓ 87396      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.15µs   min=1.28µs  med=3.34µs   max=4.09ms   p(90)=4.65µs   p(95)=5.19µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=3.49µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=205.11ms min=8.77ms  med=173.72ms max=439.12ms p(90)=318.86ms p(95)=326.77ms p(99.9)=405.31ms
       { expected_response:true }...: avg=205.11ms min=8.77ms  med=173.72ms max=439.12ms p(90)=318.86ms p(95)=326.77ms p(99.9)=405.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29232
     http_req_receiving.............: avg=102.61µs min=35.68µs med=93.66µs  max=65.45ms  p(90)=125.56µs p(95)=138.84µs p(99.9)=502.75µs
     http_req_sending...............: avg=43.19µs  min=6.26µs  med=17.59µs  max=232.55ms p(90)=22.19µs  p(95)=23.94µs  p(99.9)=699.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.96ms min=8.62ms  med=173.59ms max=439ms    p(90)=318.73ms p(95)=326.65ms p(99.9)=405.23ms
     http_reqs......................: 29232   241.330191/s
     iteration_duration.............: avg=206.1ms  min=40.74ms med=174.1ms  max=439.37ms p(90)=319.17ms p(95)=327.21ms p(99.9)=412.63ms
     iterations.....................: 29132   240.504623/s
     success_rate...................: 100.00% ✓ 29132      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

