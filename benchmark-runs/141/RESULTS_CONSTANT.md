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
| hive-router | v0.0.43 | 2,998 | 3,162 | 2,971 | 1.9% |  |
| hotchocolate | 16.0.0-rc.1.29 | 2,153 | 2,204 | 2,141 | 0.9% |  |
| grafbase | 0.53.2 | 2,034 | 2,094 | 2,015 | 1.3% |  |
| cosmo | 0.298.0 | 1,255 | 1,255 | 1,255 | 0.0% | non-compatible response (9185355 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 610 | 623 | 605 | 1.0% |  |
| apollo-router | v2.12.1 | 395 | 407 | 390 | 1.5% |  |
| hive-gateway | 2.5.14 | 266 | 271 | 263 | 1.0% |  |
| apollo-gateway | 2.13.3 | 246 | 248 | 245 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,427 | 2,558 | 2,394 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.29 | 1,923 | 1,978 | 1,905 | 1.1% |  |
| grafbase | 0.53.2 | 1,523 | 1,565 | 1,507 | 1.3% |  |
| cosmo | 0.298.0 | 1,192 | 1,204 | 1,183 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 579 | 593 | 572 | 1.2% |  |
| apollo-router | v2.12.1 | 370 | 380 | 366 | 1.3% |  |
| hive-gateway | 2.5.14 | 257 | 262 | 255 | 1.0% |  |
| apollo-gateway | 2.13.3 | 229 | 232 | 227 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1080918     ✗ 0     
     data_received..................: 32 GB   263 MB/s
     data_sent......................: 433 MB  3.6 MB/s
     http_req_blocked...............: avg=3.28µs   min=1.06µs  med=2.36µs  max=25.59ms  p(90)=3.58µs  p(95)=4.22µs   p(99.9)=34.84µs
     http_req_connecting............: avg=343ns    min=0s      med=0s      max=4.25ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.4ms   min=1.6ms   med=15.25ms max=314.13ms p(90)=24.71ms p(95)=29.2ms   p(99.9)=53.4ms 
       { expected_response:true }...: avg=16.4ms   min=1.6ms   med=15.25ms max=314.13ms p(90)=24.71ms p(95)=29.2ms   p(99.9)=53.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 360406
     http_req_receiving.............: avg=148.87µs min=27.74µs med=49.41µs max=151.88ms p(90)=97.69µs p(95)=281.45µs p(99.9)=17.77ms
     http_req_sending...............: avg=63.61µs  min=5.31µs  med=9.13µs  max=250.62ms p(90)=15.46µs p(95)=121.96µs p(99.9)=15.01ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.19ms  min=1.54ms  med=15.09ms max=289.65ms p(90)=24.38ms p(95)=28.69ms  p(99.9)=51.75ms
     http_reqs......................: 360406  2998.431589/s
     iteration_duration.............: avg=16.64ms  min=2.15ms  med=15.46ms max=333.13ms p(90)=24.95ms p(95)=29.48ms  p(99.9)=55.25ms
     iterations.....................: 360306  2997.59963/s
     success_rate...................: 100.00% ✓ 360306      ✗ 0     
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

     checks.........................: 100.00% ✓ 777036      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=2.97µs   min=1µs     med=2.17µs   max=16.62ms  p(90)=3.37µs   p(95)=3.98µs  p(99.9)=35.14µs 
     http_req_connecting............: avg=252ns    min=0s      med=0s       max=3.35ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.92ms  min=2.49ms  med=14.59ms  max=377.33ms p(90)=51.13ms  p(95)=69.61ms p(99.9)=167.21ms
       { expected_response:true }...: avg=22.92ms  min=2.49ms  med=14.59ms  max=377.33ms p(90)=51.13ms  p(95)=69.61ms p(99.9)=167.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259112
     http_req_receiving.............: avg=646.23µs min=50.57µs med=102.96µs max=258.06ms p(90)=961.72µs p(95)=1.49ms  p(99.9)=60.75ms 
     http_req_sending...............: avg=45.39µs  min=5.13µs  med=9.1µs    max=78.74ms  p(90)=15.38µs  p(95)=109.7µs p(99.9)=3.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.23ms  min=2.4ms   med=14.09ms  max=375.34ms p(90)=49.79ms  p(95)=68.2ms  p(99.9)=164.87ms
     http_reqs......................: 259112  2153.925338/s
     iteration_duration.............: avg=23.15ms  min=3.32ms  med=14.8ms   max=377.53ms p(90)=51.37ms  p(95)=69.85ms p(99.9)=167.91ms
     iterations.....................: 259012  2153.094066/s
     success_rate...................: 100.00% ✓ 259012      ✗ 0     
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

     checks.........................: 100.00% ✓ 733674      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=3.45µs   min=1.03µs  med=2.49µs  max=13.12ms  p(90)=4.01µs   p(95)=4.78µs   p(99.9)=40.51µs
     http_req_connecting............: avg=313ns    min=0s      med=0s      max=3.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.28ms  min=1.93ms  med=24.02ms max=304.16ms p(90)=29.23ms  p(95)=31.61ms  p(99.9)=54.72ms
       { expected_response:true }...: avg=24.28ms  min=1.93ms  med=24.02ms max=304.16ms p(90)=29.23ms  p(95)=31.61ms  p(99.9)=54.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244658
     http_req_receiving.............: avg=116.58µs min=29.19µs med=61.01µs max=116.22ms p(90)=104.96µs p(95)=192.79µs p(99.9)=9.96ms 
     http_req_sending...............: avg=43.22µs  min=5.04µs  med=10.5µs  max=165.63ms p(90)=17.88µs  p(95)=114.13µs p(99.9)=2.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.12ms  min=1.83ms  med=23.9ms  max=295.78ms p(90)=29.05ms  p(95)=31.32ms  p(99.9)=53.85ms
     http_reqs......................: 244658  2034.248799/s
     iteration_duration.............: avg=24.52ms  min=3.66ms  med=24.23ms max=331.65ms p(90)=29.46ms  p(95)=31.87ms  p(99.9)=55.35ms
     iterations.....................: 244558  2033.417333/s
     success_rate...................: 100.00% ✓ 244558      ✗ 0     
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

     checks.........................: 100.00% ✓ 452643      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=3.2µs   min=1.07µs  med=2.24µs  max=4.51ms   p(90)=3.31µs  p(95)=3.85µs   p(99.9)=33.94µs
     http_req_connecting............: avg=659ns   min=0s      med=0s      max=4.29ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.54ms min=2.03ms  med=38.96ms max=309.91ms p(90)=55.86ms p(95)=61.04ms  p(99.9)=85.9ms 
       { expected_response:true }...: avg=39.54ms min=2.03ms  med=38.96ms max=309.91ms p(90)=55.86ms p(95)=61.04ms  p(99.9)=85.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 150981
     http_req_receiving.............: avg=74.01µs min=28.92µs med=58.62µs max=63.38ms  p(90)=90.31µs p(95)=105.16µs p(99.9)=1.45ms 
     http_req_sending...............: avg=21.28µs min=5.28µs  med=9.88µs  max=47.93ms  p(90)=13.95µs p(95)=17.57µs  p(99.9)=1.03ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.44ms min=1.97ms  med=38.87ms max=308.76ms p(90)=55.76ms p(95)=60.94ms  p(99.9)=85.69ms
     http_reqs......................: 150981  1255.353757/s
     iteration_duration.............: avg=39.76ms min=3.73ms  med=39.15ms max=326.82ms p(90)=56.05ms p(95)=61.23ms  p(99.9)=86.26ms
     iterations.....................: 150881  1254.522292/s
     success_rate...................: 100.00% ✓ 150881      ✗ 0     
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

     checks.........................: 100.00% ✓ 220560     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 88 MB   734 kB/s
     http_req_blocked...............: avg=4.46µs  min=1.16µs  med=2.88µs  max=4.35ms   p(90)=4.35µs   p(95)=4.96µs   p(99.9)=45.57µs 
     http_req_connecting............: avg=1.29µs  min=0s      med=0s      max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.28ms min=3.68ms  med=72.65ms max=331.11ms p(90)=119.82ms p(95)=132.62ms p(99.9)=227.76ms
       { expected_response:true }...: avg=81.28ms min=3.68ms  med=72.65ms max=331.11ms p(90)=119.82ms p(95)=132.62ms p(99.9)=227.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73620
     http_req_receiving.............: avg=135.6µs min=30.83µs med=75.06µs max=261.83ms p(90)=109.02µs p(95)=121.76µs p(99.9)=1.08ms  
     http_req_sending...............: avg=25.54µs min=5.5µs   med=13.1µs  max=251.75ms p(90)=19.34µs  p(95)=21.64µs  p(99.9)=820.07µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.12ms min=3.62ms  med=72.54ms max=260.95ms p(90)=119.66ms p(95)=132.39ms p(99.9)=223.69ms
     http_reqs......................: 73620   610.994841/s
     iteration_duration.............: avg=81.61ms min=17.91ms med=72.9ms  max=343.41ms p(90)=120.07ms p(95)=132.89ms p(99.9)=229.27ms
     iterations.....................: 73520   610.164911/s
     success_rate...................: 100.00% ✓ 73520      ✗ 0    
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

     checks.........................: 100.00% ✓ 143019     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   475 kB/s
     http_req_blocked...............: avg=5.45µs   min=1.16µs  med=3.15µs   max=3.9ms    p(90)=4.49µs   p(95)=5.03µs   p(99.9)=222.13µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=109.73µs
     http_req_duration..............: avg=125.38ms min=5.58ms  med=125.19ms max=360.15ms p(90)=151.2ms  p(95)=158.97ms p(99.9)=195.14ms
       { expected_response:true }...: avg=125.38ms min=5.58ms  med=125.19ms max=360.15ms p(90)=151.2ms  p(95)=158.97ms p(99.9)=195.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47773
     http_req_receiving.............: avg=93.63µs  min=31.03µs med=79.89µs  max=161.66ms p(90)=111.26µs p(95)=122.98µs p(99.9)=779.09µs
     http_req_sending...............: avg=22.18µs  min=5.86µs  med=14.09µs  max=63.24ms  p(90)=19.72µs  p(95)=21.59µs  p(99.9)=594.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.27ms min=5.47ms  med=125.09ms max=359.7ms  p(90)=151.1ms  p(95)=158.85ms p(99.9)=194.81ms
     http_reqs......................: 47773   395.762712/s
     iteration_duration.............: avg=125.89ms min=28.17ms med=125.48ms max=373.87ms p(90)=151.47ms p(95)=159.24ms p(99.9)=198.9ms 
     iterations.....................: 47673   394.934289/s
     success_rate...................: 100.00% ✓ 47673      ✗ 0    
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

     checks.........................: 100.00% ✓ 96261      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.91µs   min=1.26µs  med=3.57µs   max=3.97ms   p(90)=5.02µs   p(95)=5.64µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=3.06µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=186.22ms min=5.95ms  med=169.5ms  max=616.32ms p(90)=215.72ms p(95)=346.92ms p(99.9)=558.39ms
       { expected_response:true }...: avg=186.22ms min=5.95ms  med=169.5ms  max=616.32ms p(90)=215.72ms p(95)=346.92ms p(99.9)=558.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32187
     http_req_receiving.............: avg=120.85µs min=33.61µs med=93.24µs  max=221.06ms p(90)=125.41µs p(95)=138.08µs p(99.9)=858.1µs 
     http_req_sending...............: avg=29.53µs  min=6.24µs  med=16.78µs  max=84.92ms  p(90)=22.2µs   p(95)=24.13µs  p(99.9)=600.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.07ms min=5.78ms  med=169.37ms max=616.21ms p(90)=215.57ms p(95)=346.42ms p(99.9)=558.27ms
     http_reqs......................: 32187   266.370484/s
     iteration_duration.............: avg=187.09ms min=38.11ms med=169.83ms max=616.5ms  p(90)=216.18ms p(95)=356.91ms p(99.9)=558.73ms
     iterations.....................: 32087   265.542912/s
     success_rate...................: 100.00% ✓ 32087      ✗ 0    
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

     checks.........................: 100.00% ✓ 89097     ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=6.93µs   min=1.29µs  med=3.26µs   max=4.39ms   p(90)=4.55µs   p(95)=5.06µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=3.53µs   min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=201.17ms min=8.26ms  med=201.59ms max=430.62ms p(90)=210.64ms p(95)=216.88ms p(99.9)=285.57ms
       { expected_response:true }...: avg=201.17ms min=8.26ms  med=201.59ms max=430.62ms p(90)=210.64ms p(95)=216.88ms p(99.9)=285.57ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 29799
     http_req_receiving.............: avg=109.68µs min=34.7µs  med=87.63µs  max=161.63ms p(90)=119µs    p(95)=130.39µs p(99.9)=709.51µs
     http_req_sending...............: avg=31.32µs  min=5.81µs  med=15.51µs  max=92.14ms  p(90)=20.48µs  p(95)=22.27µs  p(99.9)=812.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.03ms min=8.17ms  med=201.47ms max=429.69ms p(90)=210.52ms p(95)=216.74ms p(99.9)=285.24ms
     http_reqs......................: 29799   246.19954/s
     iteration_duration.............: avg=202.14ms min=31.43ms med=201.95ms max=450.99ms p(90)=210.89ms p(95)=217.22ms p(99.9)=297.21ms
     iterations.....................: 29699   245.37334/s
     success_rate...................: 100.00% ✓ 29699     ✗ 0    
     vus............................: 26      min=26      max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 875247      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=2.97µs   min=951ns   med=2.29µs  max=13.72ms  p(90)=3.78µs   p(95)=4.57µs   p(99.9)=34.83µs
     http_req_connecting............: avg=132ns    min=0s      med=0s      max=1.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.32ms  min=1.77ms  med=19.79ms max=349.36ms p(90)=28.17ms  p(95)=31.41ms  p(99.9)=53.78ms
       { expected_response:true }...: avg=20.32ms  min=1.77ms  med=19.79ms max=349.36ms p(90)=28.17ms  p(95)=31.41ms  p(99.9)=53.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291849
     http_req_receiving.............: avg=131.61µs min=27.99µs med=54.27µs max=227.73ms p(90)=104.69µs p(95)=270.46µs p(99.9)=9.55ms 
     http_req_sending...............: avg=55.56µs  min=5.19µs  med=9.63µs  max=221.06ms p(90)=18.04µs  p(95)=125.05µs p(99.9)=6.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.13ms  min=1.7ms   med=19.65ms max=124.09ms p(90)=27.96ms  p(95)=31.1ms   p(99.9)=52.16ms
     http_reqs......................: 291849  2427.5311/s
     iteration_duration.............: avg=20.55ms  min=3.3ms   med=20.01ms max=360.64ms p(90)=28.4ms   p(95)=31.67ms  p(99.9)=54.22ms
     iterations.....................: 291749  2426.699324/s
     success_rate...................: 100.00% ✓ 291749      ✗ 0     
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

     checks.........................: 100.00% ✓ 693612      ✗ 0     
     data_received..................: 20 GB   169 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=4.96µs   min=982ns   med=2.57µs   max=148.57ms p(90)=3.95µs  p(95)=4.64µs   p(99.9)=37.79µs 
     http_req_connecting............: avg=1.92µs   min=0s      med=0s       max=148.52ms p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.69ms  min=1.96ms  med=17.37ms  max=548.58ms p(90)=55.03ms p(95)=72.44ms  p(99.9)=190.5ms 
       { expected_response:true }...: avg=25.69ms  min=1.96ms  med=17.37ms  max=548.58ms p(90)=55.03ms p(95)=72.44ms  p(99.9)=190.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 231304
     http_req_receiving.............: avg=714.62µs min=52.65µs med=110.87µs max=166.65ms p(90)=1.15ms  p(95)=1.83ms   p(99.9)=59.99ms 
     http_req_sending...............: avg=45.37µs  min=5.26µs  med=10.23µs  max=152.63ms p(90)=18.14µs p(95)=112.74µs p(99.9)=3.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.93ms  min=1.81ms  med=16.8ms   max=548.24ms p(90)=53.65ms p(95)=70.94ms  p(99.9)=188.28ms
     http_reqs......................: 231304  1923.691306/s
     iteration_duration.............: avg=25.94ms  min=2.68ms  med=17.59ms  max=548.85ms p(90)=55.29ms p(95)=72.7ms   p(99.9)=192.45ms
     iterations.....................: 231204  1922.859634/s
     success_rate...................: 100.00% ✓ 231204      ✗ 0     
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

     checks.........................: 100.00% ✓ 549417      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.67µs   min=962ns   med=2.39µs  max=5.3ms    p(90)=4.68µs   p(95)=5.81µs   p(99.9)=45.06µs
     http_req_connecting............: avg=682ns    min=0s      med=0s      max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.47ms  min=2.27ms  med=31.52ms max=360.9ms  p(90)=43.24ms  p(95)=48.07ms  p(99.9)=88.36ms
       { expected_response:true }...: avg=32.47ms  min=2.27ms  med=31.52ms max=360.9ms  p(90)=43.24ms  p(95)=48.07ms  p(99.9)=88.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183239
     http_req_receiving.............: avg=112.63µs min=30.94µs med=61.95µs max=61.11ms  p(90)=135.34µs p(95)=278.46µs p(99.9)=5.53ms 
     http_req_sending...............: avg=47.3µs   min=5.31µs  med=10.46µs max=194.13ms p(90)=24.18µs  p(95)=133.42µs p(99.9)=3.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.31ms  min=2.21ms  med=31.39ms max=353.28ms p(90)=43.05ms  p(95)=47.84ms  p(99.9)=88.07ms
     http_reqs......................: 183239  1523.259048/s
     iteration_duration.............: avg=32.75ms  min=5.8ms   med=31.77ms max=374.33ms p(90)=43.48ms  p(95)=48.32ms  p(99.9)=88.91ms
     iterations.....................: 183139  1522.427752/s
     success_rate...................: 100.00% ✓ 183139      ✗ 0     
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

     checks.........................: 100.00% ✓ 430104      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs   min=1.13µs  med=2.67µs  max=30.69ms  p(90)=4.19µs   p(95)=4.87µs   p(99.9)=37.95µs
     http_req_connecting............: avg=482ns    min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.59ms  min=2.14ms  med=41.05ms max=334.45ms p(90)=58.35ms  p(95)=63.7ms   p(99.9)=89.97ms
       { expected_response:true }...: avg=41.59ms  min=2.14ms  med=41.05ms max=334.45ms p(90)=58.35ms  p(95)=63.7ms   p(99.9)=89.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143468
     http_req_receiving.............: avg=124.03µs min=29.45µs med=67.9µs  max=237.88ms p(90)=106.03µs p(95)=124.24µs p(99.9)=2.34ms 
     http_req_sending...............: avg=27.57µs  min=5.61µs  med=11.93µs max=233.52ms p(90)=18.58µs  p(95)=22.3µs   p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.44ms  min=2.07ms  med=40.94ms max=124.89ms p(90)=58.22ms  p(95)=63.53ms  p(99.9)=88.75ms
     http_reqs......................: 143468  1192.743088/s
     iteration_duration.............: avg=41.84ms  min=4ms     med=41.27ms max=358.58ms p(90)=58.57ms  p(95)=63.91ms  p(99.9)=90.36ms
     iterations.....................: 143368  1191.911723/s
     success_rate...................: 100.00% ✓ 143368      ✗ 0     
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

     checks.........................: 100.00% ✓ 209214     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   696 kB/s
     http_req_blocked...............: avg=4.77µs   min=1.13µs  med=3.18µs  max=4.22ms   p(90)=4.76µs   p(95)=5.4µs    p(99.9)=46.05µs 
     http_req_connecting............: avg=1.35µs   min=0s      med=0s      max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.68ms  min=4.01ms  med=83.37ms max=360.21ms p(90)=104.75ms p(95)=115.33ms p(99.9)=215.21ms
       { expected_response:true }...: avg=85.68ms  min=4.01ms  med=83.37ms max=360.21ms p(90)=104.75ms p(95)=115.33ms p(99.9)=215.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69838
     http_req_receiving.............: avg=131.17µs min=32.3µs  med=81.62µs max=261.06ms p(90)=115.73µs p(95)=129.03µs p(99.9)=947.26µs
     http_req_sending...............: avg=27.14µs  min=5.95µs  med=14.02µs max=163.25ms p(90)=20.61µs  p(95)=22.92µs  p(99.9)=896.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.52ms  min=3.92ms  med=83.26ms max=359.02ms p(90)=104.59ms p(95)=115.11ms p(99.9)=214.12ms
     http_reqs......................: 69838   579.287997/s
     iteration_duration.............: avg=86.04ms  min=20.11ms med=83.61ms max=373.59ms p(90)=105ms    p(95)=115.67ms p(99.9)=216.9ms 
     iterations.....................: 69738   578.458523/s
     success_rate...................: 100.00% ✓ 69738      ✗ 0    
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

     checks.........................: 100.00% ✓ 134010     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   445 kB/s
     http_req_blocked...............: avg=5.99µs   min=1.3µs   med=3.58µs   max=4.4ms    p(90)=5.04µs   p(95)=5.61µs   p(99.9)=291.26µs
     http_req_connecting............: avg=2.21µs   min=0s      med=0s       max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=200.06µs
     http_req_duration..............: avg=133.8ms  min=6.14ms  med=131.2ms  max=338.7ms  p(90)=178.06ms p(95)=191.38ms p(99.9)=246.95ms
       { expected_response:true }...: avg=133.8ms  min=6.14ms  med=131.2ms  max=338.7ms  p(90)=178.06ms p(95)=191.38ms p(99.9)=246.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44770
     http_req_receiving.............: avg=179.19µs min=33.23µs med=88.47µs  max=151.93ms p(90)=120.31µs p(95)=132.36µs p(99.9)=1.18ms  
     http_req_sending...............: avg=22.54µs  min=6.1µs   med=16.71µs  max=58.57ms  p(90)=21.91µs  p(95)=23.66µs  p(99.9)=614.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.6ms  min=5.95ms  med=131.06ms max=304.05ms p(90)=177.83ms p(95)=191.09ms p(99.9)=240.87ms
     http_reqs......................: 44770   370.734614/s
     iteration_duration.............: avg=134.36ms min=10.23ms med=131.57ms max=359.32ms p(90)=178.38ms p(95)=191.72ms p(99.9)=249.47ms
     iterations.....................: 44670   369.906526/s
     success_rate...................: 100.00% ✓ 44670      ✗ 0    
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

     checks.........................: 100.00% ✓ 93165      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   309 kB/s
     http_req_blocked...............: avg=7.42µs   min=1.23µs  med=3.55µs   max=5.01ms   p(90)=4.95µs   p(95)=5.51µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=3.7µs    min=0s      med=0s       max=4.97ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=192.46ms min=6.19ms  med=175.11ms max=635.87ms p(90)=223.55ms p(95)=399.39ms p(99.9)=558.6ms 
       { expected_response:true }...: avg=192.46ms min=6.19ms  med=175.11ms max=635.87ms p(90)=223.55ms p(95)=399.39ms p(99.9)=558.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31155
     http_req_receiving.............: avg=98.15µs  min=35.47µs med=94.21µs  max=13.45ms  p(90)=125.98µs p(95)=138.41µs p(99.9)=532.38µs
     http_req_sending...............: avg=34.04µs  min=5.77µs  med=17.22µs  max=113.14ms p(90)=22.3µs   p(95)=24.05µs  p(99.9)=538.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.33ms min=6.03ms  med=174.99ms max=635.71ms p(90)=223.39ms p(95)=399.18ms p(99.9)=558.5ms 
     http_reqs......................: 31155   257.45249/s
     iteration_duration.............: avg=193.38ms min=52.37ms med=175.49ms max=636.13ms p(90)=224.08ms p(95)=400.09ms p(99.9)=558.92ms
     iterations.....................: 31055   256.626129/s
     success_rate...................: 100.00% ✓ 31055      ✗ 0    
     vus............................: 6       min=6        max=50 
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

     checks.........................: 100.00% ✓ 83256      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   276 kB/s
     http_req_blocked...............: avg=6.92µs   min=1.29µs  med=3.37µs   max=4.22ms   p(90)=4.64µs   p(95)=5.19µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=3.29µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=215.3ms  min=8.72ms  med=250.21ms max=461.33ms p(90)=274.34ms p(95)=285.41ms p(99.9)=352.74ms
       { expected_response:true }...: avg=215.3ms  min=8.72ms  med=250.21ms max=461.33ms p(90)=274.34ms p(95)=285.41ms p(99.9)=352.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27852
     http_req_receiving.............: avg=185.9µs  min=35.51µs med=92.05µs  max=206.57ms p(90)=123.8µs  p(95)=136.47µs p(99.9)=1.63ms  
     http_req_sending...............: avg=41.85µs  min=6.1µs   med=16.64µs  max=225.43ms p(90)=21.35µs  p(95)=23.2µs   p(99.9)=897.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.07ms min=8.57ms  med=250.08ms max=406.73ms p(90)=274.15ms p(95)=284.96ms p(99.9)=349.13ms
     http_reqs......................: 27852   229.905575/s
     iteration_duration.............: avg=216.34ms min=30.5ms  med=250.55ms max=468.63ms p(90)=274.64ms p(95)=285.82ms p(99.9)=362.48ms
     iterations.....................: 27752   229.080121/s
     success_rate...................: 100.00% ✓ 27752      ✗ 0    
     vus............................: 48      min=48       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

