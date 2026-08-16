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
| fusion-nightly | 16.6.1-p.3 | 1,880 | 1,930 | 1,874 | 1.0% |  |
| fusion | 16.6.0 | 1,879 | 1,938 | 1,870 | 1.3% |  |
| fusion-nightly-net11 | 16.6.1-p.3 | 1,878 | 1,924 | 1,872 | 0.9% |  |
| hive-router | v0.0.84 | 1,876 | 1,931 | 1,870 | 1.2% |  |
| fusion-nightly-fed | 16.6.1-p.3 | 1,793 | 1,844 | 1,784 | 1.1% |  |
| grafbase | 0.53.5 | 1,284 | 1,317 | 1,280 | 1.0% |  |
| cosmo | 0.334.0 | 1,202 | 1,244 | 1,195 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 558 | 579 | 555 | 1.4% |  |
| apollo-router | v2.16.1 | 409 | 422 | 397 | 1.9% |  |
| apollo-gateway | 2.14.3 | 263 | 265 | 260 | 0.6% |  |
| hive-gateway | 2.10.8 | 255 | 263 | 254 | 1.3% |  |
| feddi | 5ff8b6165878 | 21 | 22 | 19 | 4.4% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687459      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=4.04µs   min=872ns   med=2.32µs  max=9.05ms   p(90)=3.98µs   p(95)=4.7µs   p(99.9)=32.04µs
     http_req_connecting............: avg=1.26µs   min=0s      med=0s      max=8.28ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.95ms  min=17.26ms med=25.34ms max=305.3ms  p(90)=30.35ms  p(95)=32.22ms p(99.9)=50.65ms
       { expected_response:true }...: avg=25.95ms  min=17.26ms med=25.34ms max=305.3ms  p(90)=30.35ms  p(95)=32.22ms p(99.9)=50.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229253
     http_req_receiving.............: avg=301.13µs min=51.89µs med=94.38µs max=155.01ms p(90)=730.76µs p(95)=1.25ms  p(99.9)=8.7ms  
     http_req_sending...............: avg=34.74µs  min=4.64µs  med=9.19µs  max=134.68ms p(90)=19.16µs  p(95)=39.22µs p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.61ms  min=17.17ms med=25.02ms max=304.7ms  p(90)=29.95ms  p(95)=31.79ms p(99.9)=49.21ms
     http_reqs......................: 229253  1880.245999/s
     iteration_duration.............: avg=26.17ms  min=17.45ms med=25.55ms max=316.32ms p(90)=30.56ms  p(95)=32.43ms p(99.9)=51.12ms
     iterations.....................: 229153  1879.425837/s
     success_rate...................: 100.00% ✓ 229153      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687234      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.22µs   min=932ns   med=2.51µs  max=3.58ms   p(90)=4.18µs   p(95)=4.92µs  p(99.9)=38.09µs
     http_req_connecting............: avg=303ns    min=0s      med=0s      max=3.42ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.96ms  min=17.31ms med=25.33ms max=278.39ms p(90)=30.42ms  p(95)=32.35ms p(99.9)=50.41ms
       { expected_response:true }...: avg=25.96ms  min=17.31ms med=25.33ms max=278.39ms p(90)=30.42ms  p(95)=32.35ms p(99.9)=50.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229178
     http_req_receiving.............: avg=316.01µs min=49.32µs med=96.1µs  max=174.85ms p(90)=786.57µs p(95)=1.31ms  p(99.9)=8.99ms 
     http_req_sending...............: avg=34.28µs  min=4.68µs  med=9.66µs  max=156.96ms p(90)=20.03µs  p(95)=47.65µs p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.61ms  min=16.8ms  med=25ms    max=276.12ms p(90)=30ms     p(95)=31.87ms p(99.9)=48.96ms
     http_reqs......................: 229178  1879.587727/s
     iteration_duration.............: avg=26.18ms  min=17.51ms med=25.55ms max=304.81ms p(90)=30.63ms  p(95)=32.55ms p(99.9)=50.93ms
     iterations.....................: 229078  1878.767584/s
     success_rate...................: 100.00% ✓ 229078      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686574      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.23µs   min=851ns   med=2.35µs  max=11.68ms  p(90)=4.03µs   p(95)=4.75µs  p(99.9)=35.13µs
     http_req_connecting............: avg=419ns    min=0s      med=0s      max=4.34ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.98ms  min=16.5ms  med=25.42ms max=307.16ms p(90)=30.3ms   p(95)=32.08ms p(99.9)=49.57ms
       { expected_response:true }...: avg=25.98ms  min=16.5ms  med=25.42ms max=307.16ms p(90)=30.3ms   p(95)=32.08ms p(99.9)=49.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228958
     http_req_receiving.............: avg=259.83µs min=49.97µs med=89.59µs max=73.34ms  p(90)=595.79µs p(95)=1.12ms  p(99.9)=6.99ms 
     http_req_sending...............: avg=34.42µs  min=4.42µs  med=9.3µs   max=198.82ms p(90)=19.35µs  p(95)=50.08µs p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.69ms  min=16.4ms  med=25.14ms max=306.54ms p(90)=29.96ms  p(95)=31.7ms  p(99.9)=48.08ms
     http_reqs......................: 228958  1878.124672/s
     iteration_duration.............: avg=26.2ms   min=16.68ms med=25.63ms max=315.88ms p(90)=30.51ms  p(95)=32.29ms p(99.9)=50.02ms
     iterations.....................: 228858  1877.30438/s
     success_rate...................: 100.00% ✓ 228858      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686064      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.69µs  min=852ns   med=2.09µs  max=2.4ms    p(90)=3.82µs  p(95)=4.55µs   p(99.9)=30.23µs
     http_req_connecting............: avg=189ns   min=0s      med=0s      max=2.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.01ms min=17.97ms med=25.58ms max=302.6ms  p(90)=29.63ms p(95)=31.01ms  p(99.9)=47.63ms
       { expected_response:true }...: avg=26.01ms min=17.97ms med=25.58ms max=302.6ms  p(90)=29.63ms p(95)=31.01ms  p(99.9)=47.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228788
     http_req_receiving.............: avg=71.84µs min=23.5µs  med=49.38µs max=25.75ms  p(90)=91.83µs p(95)=117.12µs p(99.9)=1.71ms 
     http_req_sending...............: avg=28.4µs  min=4.49µs  med=8.93µs  max=85.6ms   p(90)=17.38µs p(95)=24.38µs  p(99.9)=1.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=25.91ms min=17.88ms med=25.49ms max=301.94ms p(90)=29.53ms p(95)=30.89ms  p(99.9)=46.44ms
     http_reqs......................: 228788  1876.12005/s
     iteration_duration.............: avg=26.22ms min=18.32ms med=25.78ms max=330.54ms p(90)=29.82ms p(95)=31.21ms  p(99.9)=48.04ms
     iterations.....................: 228688  1875.300024/s
     success_rate...................: 100.00% ✓ 228688      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 655992      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=2.9µs   min=841ns   med=2.08µs  max=3.65ms   p(90)=3.78µs   p(95)=4.53µs  p(99.9)=29.62µs
     http_req_connecting............: avg=398ns   min=0s      med=0s      max=3.52ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.21ms min=17.82ms med=26.62ms max=300.9ms  p(90)=31.86ms  p(95)=33.76ms p(99.9)=49.74ms
       { expected_response:true }...: avg=27.21ms min=17.82ms med=26.62ms max=300.9ms  p(90)=31.86ms  p(95)=33.76ms p(99.9)=49.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 218764
     http_req_receiving.............: avg=315.2µs min=51.39µs med=97.72µs max=147.25ms p(90)=793.73µs p(95)=1.27ms  p(99.9)=8.08ms 
     http_req_sending...............: avg=31.2µs  min=4.79µs  med=8.71µs  max=117.98ms p(90)=18.6µs   p(95)=29.35µs p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.86ms min=17.74ms med=26.29ms max=300.27ms p(90)=31.47ms  p(95)=33.33ms p(99.9)=48.19ms
     http_reqs......................: 218764  1793.662532/s
     iteration_duration.............: avg=27.43ms min=18.04ms med=26.83ms max=314ms    p(90)=32.07ms  p(95)=33.96ms p(99.9)=50.17ms
     iterations.....................: 218664  1792.842625/s
     success_rate...................: 100.00% ✓ 218664      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 469719      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=3.79µs  min=932ns   med=3µs     max=2.16ms   p(90)=5.42µs   p(95)=6.41µs   p(99.9)=46.06µs
     http_req_connecting............: avg=266ns   min=0s      med=0s      max=2.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.05ms min=17.7ms  med=37.79ms max=307.86ms p(90)=44.88ms  p(95)=46.96ms  p(99.9)=66.75ms
       { expected_response:true }...: avg=38.05ms min=17.7ms  med=37.79ms max=307.86ms p(90)=44.88ms  p(95)=46.96ms  p(99.9)=66.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156673
     http_req_receiving.............: avg=91.74µs min=26.74µs med=60.56µs max=133.72ms p(90)=128.41µs p(95)=173.99µs p(99.9)=2.13ms 
     http_req_sending...............: avg=36.25µs min=4.7µs   med=11.16µs max=169.5ms  p(90)=25.23µs  p(95)=54.72µs  p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.92ms min=17.61ms med=37.67ms max=307.15ms p(90)=44.76ms  p(95)=46.82ms  p(99.9)=65.3ms 
     http_reqs......................: 156673  1284.218391/s
     iteration_duration.............: avg=38.31ms min=20.86ms med=38.04ms max=317.42ms p(90)=45.11ms  p(95)=47.18ms  p(99.9)=67.31ms
     iterations.....................: 156573  1283.39871/s
     success_rate...................: 100.00% ✓ 156573      ✗ 0     
     vus............................: 26      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 439845      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 176 MB  1.4 MB/s
     http_req_blocked...............: avg=4.84µs  min=1.05µs  med=3.01µs  max=8.88ms   p(90)=4.7µs    p(95)=5.44µs   p(99.9)=36.64µs 
     http_req_connecting............: avg=1.4µs   min=0s      med=0s      max=8.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.67ms min=19.11ms med=40.02ms max=308.96ms p(90)=48.97ms  p(95)=51.85ms  p(99.9)=67.31ms 
       { expected_response:true }...: avg=40.67ms min=19.11ms med=40.02ms max=308.96ms p(90)=48.97ms  p(95)=51.85ms  p(99.9)=67.31ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 146715
     http_req_receiving.............: avg=83.39µs min=24.96µs med=69.79µs max=198.5ms  p(90)=112.69µs p(95)=131.39µs p(99.9)=957.67µs
     http_req_sending...............: avg=28.46µs min=5.06µs  med=12.93µs max=140.12ms p(90)=20.39µs  p(95)=24.45µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.56ms min=18.97ms med=39.92ms max=308.02ms p(90)=48.86ms  p(95)=51.74ms  p(99.9)=66.92ms 
     http_reqs......................: 146715  1202.478349/s
     iteration_duration.............: avg=40.91ms min=22.23ms med=40.24ms max=334.56ms p(90)=49.19ms  p(95)=52.07ms  p(99.9)=67.55ms 
     iterations.....................: 146615  1201.658747/s
     success_rate...................: 100.00% ✓ 146615      ✗ 0     
     vus............................: 49      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 204678     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   671 kB/s
     http_req_blocked...............: avg=5.12µs  min=1.21µs  med=3.39µs  max=4.05ms   p(90)=4.93µs   p(95)=5.63µs   p(99.9)=43.5µs  
     http_req_connecting............: avg=1.46µs  min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.6ms  min=20.59ms med=85.88ms max=364.35ms p(90)=105.26ms p(95)=115.05ms p(99.9)=202.02ms
       { expected_response:true }...: avg=87.6ms  min=20.59ms med=85.88ms max=364.35ms p(90)=105.26ms p(95)=115.05ms p(99.9)=202.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68326
     http_req_receiving.............: avg=91.31µs min=31.74µs med=78.63µs max=202.23ms p(90)=114.93µs p(95)=128.66µs p(99.9)=684.48µs
     http_req_sending...............: avg=30.36µs min=5.64µs  med=15.61µs max=243.77ms p(90)=22.33µs  p(95)=24.7µs   p(99.9)=682.93µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.48ms min=20.48ms med=85.77ms max=358.93ms p(90)=105.15ms p(95)=114.9ms  p(99.9)=201.38ms
     http_reqs......................: 68326   558.844602/s
     iteration_duration.............: avg=87.95ms min=39.34ms med=86.14ms max=372.47ms p(90)=105.53ms p(95)=115.36ms p(99.9)=204.34ms
     iterations.....................: 68226   558.026693/s
     success_rate...................: 100.00% ✓ 68226      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 149859     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   491 kB/s
     http_req_blocked...............: avg=4.85µs   min=1.05µs  med=2.89µs   max=3.96ms   p(90)=4.31µs   p(95)=4.85µs   p(99.9)=153.14µs
     http_req_connecting............: avg=1.77µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=77.02µs 
     http_req_duration..............: avg=119.69ms min=20.93ms med=117.68ms max=339.19ms p(90)=149.92ms p(95)=159.74ms p(99.9)=203.79ms
       { expected_response:true }...: avg=119.69ms min=20.93ms med=117.68ms max=339.19ms p(90)=149.92ms p(95)=159.74ms p(99.9)=203.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50053
     http_req_receiving.............: avg=79.45µs  min=29.57µs med=74.62µs  max=23.81ms  p(90)=107.14µs p(95)=119.11µs p(99.9)=463.38µs
     http_req_sending...............: avg=26.17µs  min=5.07µs  med=14.97µs  max=131.42ms p(90)=20.53µs  p(95)=22.4µs   p(99.9)=457.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.59ms min=20.78ms med=117.58ms max=338.71ms p(90)=149.82ms p(95)=159.64ms p(99.9)=203.64ms
     http_reqs......................: 50053   409.199271/s
     iteration_duration.............: avg=120.15ms min=48.5ms  med=117.97ms max=346.95ms p(90)=150.21ms p(95)=160.05ms p(99.9)=206.8ms 
     iterations.....................: 49953   408.381739/s
     success_rate...................: 100.00% ✓ 49953      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96531      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=6.36µs   min=1.04µs  med=3.11µs   max=4.14ms   p(90)=4.46µs   p(95)=5.01µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.98µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=185.79ms min=23.31ms med=185.33ms max=392.35ms p(90)=197.5ms  p(95)=201.64ms p(99.9)=276.53ms
       { expected_response:true }...: avg=185.79ms min=23.31ms med=185.33ms max=392.35ms p(90)=197.5ms  p(95)=201.64ms p(99.9)=276.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32277
     http_req_receiving.............: avg=97.39µs  min=32.12µs med=89.52µs  max=103.98ms p(90)=120.4µs  p(95)=132.83µs p(99.9)=612.58µs
     http_req_sending...............: avg=38.69µs  min=5.33µs  med=17.75µs  max=172.13ms p(90)=22.55µs  p(95)=24.38µs  p(99.9)=507.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.65ms min=23.19ms med=185.22ms max=387.41ms p(90)=197.38ms p(95)=201.53ms p(99.9)=276.28ms
     http_reqs......................: 32277   263.121667/s
     iteration_duration.............: avg=186.59ms min=31.02ms med=185.62ms max=402.67ms p(90)=197.78ms p(95)=201.94ms p(99.9)=279.24ms
     iterations.....................: 32177   262.306469/s
     success_rate...................: 100.00% ✓ 32177      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93405      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 38 MB   307 kB/s
     http_req_blocked...............: avg=7.36µs   min=1.51µs  med=3.73µs   max=4ms      p(90)=5.24µs   p(95)=5.89µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.31µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=191.98ms min=18.43ms med=179.64ms max=736.29ms p(90)=226.45ms p(95)=252.26ms p(99.9)=604.54ms
       { expected_response:true }...: avg=191.98ms min=18.43ms med=179.64ms max=736.29ms p(90)=226.45ms p(95)=252.26ms p(99.9)=604.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31235
     http_req_receiving.............: avg=98.12µs  min=39.07µs med=92.76µs  max=20.07ms  p(90)=124.77µs p(95)=138.35µs p(99.9)=679.9µs 
     http_req_sending...............: avg=31.26µs  min=6.29µs  med=18.96µs  max=71.02ms  p(90)=24.02µs  p(95)=25.92µs  p(99.9)=511.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.85ms min=18.33ms med=179.5ms  max=736.18ms p(90)=226.33ms p(95)=252.12ms p(99.9)=604.39ms
     http_reqs......................: 31235   255.550411/s
     iteration_duration.............: avg=192.83ms min=50.79ms med=180.06ms max=736.54ms p(90)=226.83ms p(95)=252.78ms p(99.9)=604.86ms
     iterations.....................: 31135   254.732257/s
     success_rate...................: 100.00% ✓ 31135      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7725      ✗ 0   
     data_received..................: 256 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=42.31µs  min=1.53µs   med=3.75µs  max=4.45ms  p(90)=5.46µs  p(95)=6.31µs   p(99.9)=4.06ms
     http_req_connecting............: avg=37.73µs  min=0s       med=0s      max=4.41ms  p(90)=0s      p(95)=0s       p(99.9)=4.03ms
     http_req_duration..............: avg=2.26s    min=36.75ms  med=2.28s   max=4.61s   p(90)=3.02s   p(95)=3.32s    p(99.9)=4.54s 
       { expected_response:true }...: avg=2.26s    min=36.75ms  med=2.28s   max=4.61s   p(90)=3.02s   p(95)=3.32s    p(99.9)=4.54s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2675
     http_req_receiving.............: avg=119.74µs min=34.54µs  med=97.91µs max=28.21ms p(90)=141.8µs p(95)=162.79µs p(99.9)=1.31ms
     http_req_sending...............: avg=47.34µs  min=7.43µs   med=19.18µs max=21.28ms p(90)=24.6µs  p(95)=28.91µs  p(99.9)=4.87ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.26s    min=36.53ms  med=2.28s   max=4.61s   p(90)=3.02s   p(95)=3.32s    p(99.9)=4.54s 
     http_reqs......................: 2675    21.141816/s
     iteration_duration.............: avg=2.35s    min=704.68ms med=2.3s    max=4.61s   p(90)=3.04s   p(95)=3.34s    p(99.9)=4.54s 
     iterations.....................: 2575    20.351468/s
     success_rate...................: 100.00% ✓ 2575      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

