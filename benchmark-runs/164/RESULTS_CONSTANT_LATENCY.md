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
| hive-router | v0.0.49 | 1,579 | 1,600 | 1,566 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,451 | 1,465 | 1,443 | 0.5% |  |
| cosmo | 0.307.0 | 1,137 | 1,154 | 1,131 | 0.7% | non-compatible response (2 across 1/9 runs) |
| grafbase | 0.53.3 | 1,123 | 1,144 | 1,117 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 513 | 525 | 511 | 0.9% |  |
| apollo-router | v2.13.1 | 386 | 398 | 383 | 1.2% |  |
| hive-gateway | 2.5.25 | 243 | 246 | 241 | 0.7% |  |
| apollo-gateway | 2.13.3 | 233 | 234 | 230 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577977      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=2.96µs  min=972ns   med=2.08µs  max=3.57ms   p(90)=3.79µs  p(95)=4.72µs   p(99.9)=32.07µs
     http_req_connecting............: avg=403ns   min=0s      med=0s      max=3.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.9ms  min=13.7ms  med=30.61ms max=350.74ms p(90)=36.77ms p(95)=38.72ms  p(99.9)=58.27ms
       { expected_response:true }...: avg=30.9ms  min=13.7ms  med=30.61ms max=350.74ms p(90)=36.77ms p(95)=38.72ms  p(99.9)=58.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192759
     http_req_receiving.............: avg=83.79µs min=27.21µs med=51.9µs  max=124.9ms  p(90)=102.4µs p(95)=149.77µs p(99.9)=2.38ms 
     http_req_sending...............: avg=36.11µs min=4.98µs  med=9.26µs  max=171.11ms p(90)=19.9µs  p(95)=42.45µs  p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.78ms min=13.56ms med=30.5ms  max=338.95ms p(90)=36.65ms p(95)=38.56ms  p(99.9)=57.15ms
     http_reqs......................: 192759  1579.969514/s
     iteration_duration.............: avg=31.13ms min=13.84ms med=30.83ms max=359.58ms p(90)=36.99ms p(95)=38.93ms  p(99.9)=58.84ms
     iterations.....................: 192659  1579.149853/s
     success_rate...................: 100.00% ✓ 192659      ✗ 0     
     vus............................: 37      min=0         max=50  
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

     checks.........................: 100.00% ✓ 531159      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.35µs   min=972ns   med=2.03µs  max=5.62ms   p(90)=3.63µs  p(95)=4.54µs   p(99.9)=31.72µs
     http_req_connecting............: avg=847ns    min=0s      med=0s      max=5.6ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.64ms  min=14.53ms med=32.5ms  max=485.79ms p(90)=41.45ms p(95)=45.1ms   p(99.9)=80.59ms
       { expected_response:true }...: avg=33.64ms  min=14.53ms med=32.5ms  max=485.79ms p(90)=41.45ms p(95)=45.1ms   p(99.9)=80.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177153
     http_req_receiving.............: avg=774.73µs min=51.55µs med=114µs   max=35.6ms   p(90)=2.21ms  p(95)=3.38ms   p(99.9)=15.63ms
     http_req_sending...............: avg=41.79µs  min=5.01µs  med=8.89µs  max=151.73ms p(90)=19.79µs p(95)=106.24µs p(99.9)=2.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.82ms  min=14.41ms med=31.71ms max=481.53ms p(90)=40.35ms p(95)=43.83ms  p(99.9)=78.88ms
     http_reqs......................: 177153  1451.674535/s
     iteration_duration.............: avg=33.87ms  min=14.74ms med=32.72ms max=486.08ms p(90)=41.67ms p(95)=45.32ms  p(99.9)=81.15ms
     iterations.....................: 177053  1450.855089/s
     success_rate...................: 100.00% ✓ 177053      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 416016      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.02µs  min=1µs     med=2.14µs  max=3.43ms   p(90)=3.59µs   p(95)=4.34µs   p(99.9)=33.43µs
     http_req_connecting............: avg=520ns   min=0s      med=0s      max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.03ms min=17.81ms med=42.41ms max=348.18ms p(90)=52.41ms  p(95)=55.54ms  p(99.9)=73.33ms
       { expected_response:true }...: avg=43.03ms min=17.81ms med=42.41ms max=348.18ms p(90)=52.41ms  p(95)=55.54ms  p(99.9)=73.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138772
     http_req_receiving.............: avg=86.07µs min=28.24µs med=61.43µs max=204.44ms p(90)=104.24µs p(95)=128.67µs p(99.9)=1.74ms 
     http_req_sending...............: avg=24.39µs min=4.99µs  med=10.19µs max=86.34ms  p(90)=17.99µs  p(95)=22.44µs  p(99.9)=1.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.92ms min=17.67ms med=42.31ms max=347.81ms p(90)=52.3ms   p(95)=55.43ms  p(99.9)=72.77ms
     http_reqs......................: 138772  1137.235325/s
     iteration_duration.............: avg=43.26ms min=19.18ms med=42.61ms max=358.75ms p(90)=52.61ms  p(95)=55.73ms  p(99.9)=73.98ms
     iterations.....................: 138672  1136.415826/s
     success_rate...................: 100.00% ✓ 138672      ✗ 0     
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

     checks.........................: 100.00% ✓ 410784      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 165 MB  1.3 MB/s
     http_req_blocked...............: avg=3.59µs  min=962ns   med=2.22µs  max=4.2ms    p(90)=4.56µs   p(95)=5.8µs    p(99.9)=48.2µs 
     http_req_connecting............: avg=756ns   min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.54ms min=15.86ms med=43.05ms max=331.38ms p(90)=52.95ms  p(95)=56.31ms  p(99.9)=82.51ms
       { expected_response:true }...: avg=43.54ms min=15.86ms med=43.05ms max=331.38ms p(90)=52.95ms  p(95)=56.31ms  p(99.9)=82.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137028
     http_req_receiving.............: avg=98.99µs min=29.32µs med=59.99µs max=182.33ms p(90)=131.75µs p(95)=208.26µs p(99.9)=3.26ms 
     http_req_sending...............: avg=40.88µs min=5.3µs   med=9.99µs  max=251.58ms p(90)=24.45µs  p(95)=110.21µs p(99.9)=2.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.4ms  min=15.74ms med=42.92ms max=330.75ms p(90)=52.79ms  p(95)=56.15ms  p(99.9)=81.91ms
     http_reqs......................: 137028  1123.06885/s
     iteration_duration.............: avg=43.81ms min=18.09ms med=43.29ms max=352.99ms p(90)=53.18ms  p(95)=56.55ms  p(99.9)=83.4ms 
     iterations.....................: 136928  1122.249259/s
     success_rate...................: 100.00% ✓ 136928      ✗ 0     
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

     checks.........................: 100.00% ✓ 188250     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   616 kB/s
     http_req_blocked...............: avg=4.05µs   min=1.15µs  med=2.9µs   max=4.26ms   p(90)=4.54µs   p(95)=5.2µs    p(99.9)=52.02µs 
     http_req_connecting............: avg=790ns    min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.27ms  min=22.7ms  med=95.71ms max=362.67ms p(90)=130.06ms p(95)=142.17ms p(99.9)=238.7ms 
       { expected_response:true }...: avg=95.27ms  min=22.7ms  med=95.71ms max=362.67ms p(90)=130.06ms p(95)=142.17ms p(99.9)=238.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 62850
     http_req_receiving.............: avg=143.63µs min=32.4µs  med=77.06µs max=285.73ms p(90)=114.4µs  p(95)=128.67µs p(99.9)=995.47µs
     http_req_sending...............: avg=24.82µs  min=5.37µs  med=13.99µs max=134ms    p(90)=21.19µs  p(95)=23.59µs  p(99.9)=786.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.1ms   min=22.57ms med=95.57ms max=282.19ms p(90)=129.91ms p(95)=141.89ms p(99.9)=236.24ms
     http_reqs......................: 62850   513.226717/s
     iteration_duration.............: avg=95.63ms  min=26.95ms med=95.99ms max=371.26ms p(90)=130.32ms p(95)=142.44ms p(99.9)=241.23ms
     iterations.....................: 62750   512.410127/s
     success_rate...................: 100.00% ✓ 62750      ✗ 0    
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

     checks.........................: 100.00% ✓ 141765     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 57 MB   464 kB/s
     http_req_blocked...............: avg=5.81µs   min=1.2µs   med=3.16µs   max=4.7ms    p(90)=4.66µs   p(95)=5.26µs   p(99.9)=930.31µs
     http_req_connecting............: avg=2.44µs   min=0s      med=0s       max=4.65ms   p(90)=0s       p(95)=0s       p(99.9)=905.39µs
     http_req_duration..............: avg=126.49ms min=19.63ms med=124.52ms max=383.4ms  p(90)=157.73ms p(95)=168.37ms p(99.9)=217.04ms
       { expected_response:true }...: avg=126.49ms min=19.63ms med=124.52ms max=383.4ms  p(90)=157.73ms p(95)=168.37ms p(99.9)=217.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47355
     http_req_receiving.............: avg=88.42µs  min=31.9µs  med=81.93µs  max=38.54ms  p(90)=115.65µs p(95)=127.79µs p(99.9)=773.01µs
     http_req_sending...............: avg=25.16µs  min=5.77µs  med=15.57µs  max=100.72ms p(90)=21.57µs  p(95)=23.72µs  p(99.9)=574.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=126.38ms min=19.48ms med=124.41ms max=370.63ms p(90)=157.62ms p(95)=168.26ms p(99.9)=216.49ms
     http_reqs......................: 47355   386.711964/s
     iteration_duration.............: avg=127ms    min=49.05ms med=124.83ms max=393.91ms p(90)=158.01ms p(95)=168.72ms p(99.9)=222.44ms
     iterations.....................: 47255   385.895341/s
     success_rate...................: 100.00% ✓ 47255      ✗ 0    
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

     checks.........................: 100.00% ✓ 88953      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   292 kB/s
     http_req_blocked...............: avg=7.12µs   min=1.24µs  med=3.42µs   max=4.03ms   p(90)=4.93µs   p(95)=5.56µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=3.42µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=201.58ms min=19.26ms med=183.68ms max=683.64ms p(90)=276.11ms p(95)=383.5ms  p(99.9)=577.07ms
       { expected_response:true }...: avg=201.58ms min=19.26ms med=183.68ms max=683.64ms p(90)=276.11ms p(95)=383.5ms  p(99.9)=577.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29751
     http_req_receiving.............: avg=103.18µs min=34.97µs med=96.4µs   max=16.08ms  p(90)=129.93µs p(95)=143.83µs p(99.9)=809.77µs
     http_req_sending...............: avg=25.21µs  min=6.15µs  med=18.03µs  max=61.89ms  p(90)=23.37µs  p(95)=25.36µs  p(99.9)=627.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.45ms min=19.09ms med=183.55ms max=683.53ms p(90)=275.99ms p(95)=383.29ms p(99.9)=576.98ms
     http_reqs......................: 29751   243.263057/s
     iteration_duration.............: avg=202.48ms min=60.94ms med=184.15ms max=683.9ms  p(90)=276.54ms p(95)=384.47ms p(99.9)=577.45ms
     iterations.....................: 29651   242.445393/s
     success_rate...................: 100.00% ✓ 29651      ✗ 0    
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

     checks.........................: 100.00% ✓ 85845      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.23µs  med=3.36µs   max=4.01ms   p(90)=4.83µs   p(95)=5.44µs   p(99.9)=2.27ms  
     http_req_connecting............: avg=3.93µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=2.25ms  
     http_req_duration..............: avg=208.83ms min=20.59ms med=214.23ms max=436.46ms p(90)=232.72ms p(95)=244.56ms p(99.9)=317.62ms
       { expected_response:true }...: avg=208.83ms min=20.59ms med=214.23ms max=436.46ms p(90)=232.72ms p(95)=244.56ms p(99.9)=317.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28715
     http_req_receiving.............: avg=101.79µs min=31.84µs med=92.76µs  max=48.2ms   p(90)=127.25µs p(95)=141.2µs  p(99.9)=749.04µs
     http_req_sending...............: avg=24.87µs  min=6.2µs   med=17.48µs  max=119.55ms p(90)=22.99µs  p(95)=25µs     p(99.9)=492.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.71ms min=20.43ms med=214.11ms max=436.11ms p(90)=232.59ms p(95)=244.4ms  p(99.9)=317.51ms
     http_reqs......................: 28715   233.807728/s
     iteration_duration.............: avg=209.79ms min=49.79ms med=214.53ms max=454.41ms p(90)=233.05ms p(95)=244.95ms p(99.9)=320.88ms
     iterations.....................: 28615   232.993493/s
     success_rate...................: 100.00% ✓ 28615      ✗ 0    
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

