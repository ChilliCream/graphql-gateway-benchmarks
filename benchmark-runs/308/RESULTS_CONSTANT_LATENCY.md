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
| fusion-nightly | 16.6.0-p.15 | 1,872 | 1,925 | 1,865 | 1.0% |  |
| fusion-nightly-net11 | 16.6.0-p.15 | 1,872 | 1,919 | 1,860 | 1.0% |  |
| fusion | 16.5.1 | 1,862 | 1,917 | 1,853 | 1.1% |  |
| fusion-nightly-fed | 16.6.0-p.15 | 1,808 | 1,853 | 1,795 | 1.1% |  |
| hive-router | v0.0.84 | 1,808 | 1,889 | 1,796 | 1.7% |  |
| grafbase | 0.53.5 | 1,276 | 1,310 | 1,274 | 1.1% |  |
| cosmo | 0.334.0 | 1,229 | 1,267 | 1,224 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 552 | 576 | 551 | 1.5% |  |
| apollo-router | v2.16.1 | 429 | 448 | 427 | 1.9% |  |
| apollo-gateway | 2.14.3 | 264 | 269 | 263 | 0.6% |  |
| hive-gateway | 2.10.8 | 264 | 271 | 263 | 1.2% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 3.1% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684573      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=4.13µs   min=932ns   med=2.54µs   max=8.94ms   p(90)=4.11µs   p(95)=4.82µs  p(99.9)=37.21µs
     http_req_connecting............: avg=1.18µs   min=0s      med=0s       max=8.9ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.06ms  min=17.37ms med=25.44ms  max=305.64ms p(90)=30.56ms  p(95)=32.43ms p(99.9)=50.4ms 
       { expected_response:true }...: avg=26.06ms  min=17.37ms med=25.44ms  max=305.64ms p(90)=30.56ms  p(95)=32.43ms p(99.9)=50.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 228291
     http_req_receiving.............: avg=322.85µs min=51.46µs med=100.06µs max=278.47ms p(90)=804.75µs p(95)=1.31ms  p(99.9)=8.08ms 
     http_req_sending...............: avg=33.93µs  min=4.66µs  med=9.63µs   max=96.63ms  p(90)=18.73µs  p(95)=35.81µs p(99.9)=1.99ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.7ms   min=16.63ms med=25.1ms   max=299.27ms p(90)=30.12ms  p(95)=31.97ms p(99.9)=48.99ms
     http_reqs......................: 228291  1872.334617/s
     iteration_duration.............: avg=26.28ms  min=17.5ms  med=25.65ms  max=321.77ms p(90)=30.77ms  p(95)=32.64ms p(99.9)=50.83ms
     iterations.....................: 228191  1871.514464/s
     success_rate...................: 100.00% ✓ 228191      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684366      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.77µs   min=882ns   med=1.92µs  max=3.97ms   p(90)=3.53µs   p(95)=4.27µs  p(99.9)=27.07µs
     http_req_connecting............: avg=442ns    min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.07ms  min=17.43ms med=25.51ms max=302.04ms p(90)=30.36ms  p(95)=32.19ms p(99.9)=49.01ms
       { expected_response:true }...: avg=26.07ms  min=17.43ms med=25.51ms max=302.04ms p(90)=30.36ms  p(95)=32.19ms p(99.9)=49.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228222
     http_req_receiving.............: avg=318.64µs min=49.86µs med=91.3µs  max=128.74ms p(90)=838.78µs p(95)=1.38ms  p(99.9)=7.89ms 
     http_req_sending...............: avg=32.83µs  min=4.56µs  med=8.28µs  max=148.33ms p(90)=17.74µs  p(95)=33.38µs p(99.9)=1.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.72ms  min=17.34ms med=25.18ms max=297.51ms p(90)=29.94ms  p(95)=31.72ms p(99.9)=47.77ms
     http_reqs......................: 228222  1872.051049/s
     iteration_duration.............: avg=26.29ms  min=17.57ms med=25.72ms max=311.35ms p(90)=30.56ms  p(95)=32.39ms p(99.9)=49.38ms
     iterations.....................: 228122  1871.230772/s
     success_rate...................: 100.00% ✓ 228122      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681123      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.18µs   min=1µs     med=2.49µs   max=10.7ms   p(90)=3.93µs   p(95)=4.6µs   p(99.9)=35.52µs
     http_req_connecting............: avg=214ns    min=0s      med=0s       max=2.26ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.19ms  min=17.66ms med=25.58ms  max=301.29ms p(90)=30.68ms  p(95)=32.56ms p(99.9)=50.64ms
       { expected_response:true }...: avg=26.19ms  min=17.66ms med=25.58ms  max=301.29ms p(90)=30.68ms  p(95)=32.56ms p(99.9)=50.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227141
     http_req_receiving.............: avg=337.13µs min=51.57µs med=100.44µs max=121.17ms p(90)=856.79µs p(95)=1.36ms  p(99.9)=8.93ms 
     http_req_sending...............: avg=32.31µs  min=4.68µs  med=9.66µs   max=182.34ms p(90)=18.18µs  p(95)=33.55µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.82ms  min=17.41ms med=25.23ms  max=300.49ms p(90)=30.25ms  p(95)=32.07ms p(99.9)=49.34ms
     http_reqs......................: 227141  1862.78573/s
     iteration_duration.............: avg=26.41ms  min=17.84ms med=25.8ms   max=313.08ms p(90)=30.89ms  p(95)=32.77ms p(99.9)=51.04ms
     iterations.....................: 227041  1861.965629/s
     success_rate...................: 100.00% ✓ 227041      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 661266      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=2.92µs   min=851ns   med=2.06µs  max=6.05ms   p(90)=3.8µs    p(95)=4.55µs  p(99.9)=33.76µs
     http_req_connecting............: avg=378ns    min=0s      med=0s      max=3.28ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.99ms  min=17.73ms med=26.4ms  max=314.37ms p(90)=31.54ms  p(95)=33.4ms  p(99.9)=50.84ms
       { expected_response:true }...: avg=26.99ms  min=17.73ms med=26.4ms  max=314.37ms p(90)=31.54ms  p(95)=33.4ms  p(99.9)=50.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220522
     http_req_receiving.............: avg=306.95µs min=49.56µs med=93.55µs max=126.98ms p(90)=774.42µs p(95)=1.28ms  p(99.9)=8.51ms 
     http_req_sending...............: avg=33.54µs  min=4.67µs  med=8.81µs  max=188.44ms p(90)=19.18µs  p(95)=29.39µs p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.65ms  min=17.65ms med=26.08ms max=313.85ms p(90)=31.13ms  p(95)=32.97ms p(99.9)=49ms   
     http_reqs......................: 220522  1808.001824/s
     iteration_duration.............: avg=27.21ms  min=17.91ms med=26.61ms max=322.33ms p(90)=31.74ms  p(95)=33.61ms p(99.9)=51.23ms
     iterations.....................: 220422  1807.181951/s
     success_rate...................: 100.00% ✓ 220422      ✗ 0     
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

     checks.........................: 100.00% ✓ 661461      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=3.59µs  min=921ns   med=2.77µs  max=4.21ms   p(90)=4.46µs  p(95)=5.21µs   p(99.9)=37.49µs
     http_req_connecting............: avg=457ns   min=0s      med=0s      max=4.16ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.97ms min=18.11ms med=26.5ms  max=290.91ms p(90)=30.82ms p(95)=32.33ms  p(99.9)=50.23ms
       { expected_response:true }...: avg=26.97ms min=18.11ms med=26.5ms  max=290.91ms p(90)=30.82ms p(95)=32.33ms  p(99.9)=50.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220587
     http_req_receiving.............: avg=81.21µs min=26.29µs med=54.12µs max=118.62ms p(90)=98.46µs p(95)=126.46µs p(99.9)=2.55ms 
     http_req_sending...............: avg=32.22µs min=4.65µs  med=11µs    max=87.69ms  p(90)=19.16µs p(95)=26.86µs  p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.86ms min=17.97ms med=26.4ms  max=290.54ms p(90)=30.7ms  p(95)=32.2ms   p(99.9)=48.46ms
     http_reqs......................: 220587  1808.801785/s
     iteration_duration.............: avg=27.2ms  min=18.63ms med=26.71ms max=318.87ms p(90)=31.03ms p(95)=32.55ms  p(99.9)=50.62ms
     iterations.....................: 220487  1807.981791/s
     success_rate...................: 100.00% ✓ 220487      ✗ 0     
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

     checks.........................: 100.00% ✓ 466734      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 187 MB  1.5 MB/s
     http_req_blocked...............: avg=3.38µs  min=882ns   med=2.12µs  max=5.94ms   p(90)=4.52µs   p(95)=5.47µs   p(99.9)=39.58µs
     http_req_connecting............: avg=630ns   min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.3ms  min=18.14ms med=38.03ms max=315.01ms p(90)=45.05ms  p(95)=47.13ms  p(99.9)=63.38ms
       { expected_response:true }...: avg=38.3ms  min=18.14ms med=38.03ms max=315.01ms p(90)=45.05ms  p(95)=47.13ms  p(99.9)=63.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155678
     http_req_receiving.............: avg=84.11µs min=26.96µs med=54.63µs max=123.4ms  p(90)=121.84µs p(95)=165.36µs p(99.9)=2.07ms 
     http_req_sending...............: avg=31.41µs min=4.4µs   med=8.96µs  max=101.52ms p(90)=23.08µs  p(95)=40.01µs  p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.19ms min=18.04ms med=37.93ms max=314.55ms p(90)=44.93ms  p(95)=47ms     p(99.9)=61.94ms
     http_reqs......................: 155678  1276.117099/s
     iteration_duration.............: avg=38.55ms min=20.5ms  med=38.26ms max=337.31ms p(90)=45.26ms  p(95)=47.35ms  p(99.9)=64.03ms
     iterations.....................: 155578  1275.297383/s
     success_rate...................: 100.00% ✓ 155578      ✗ 0     
     vus............................: 6       min=0         max=50  
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

     checks.........................: 100.00% ✓ 449622      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.46µs  min=972ns   med=2.4µs   max=3.55ms   p(90)=4.07µs   p(95)=4.77µs   p(99.9)=35.2µs  
     http_req_connecting............: avg=710ns   min=0s      med=0s      max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.79ms min=18.43ms med=39.16ms max=311.96ms p(90)=47.75ms  p(95)=50.45ms  p(99.9)=64.57ms 
       { expected_response:true }...: avg=39.79ms min=18.43ms med=39.16ms max=311.96ms p(90)=47.75ms  p(95)=50.45ms  p(99.9)=64.57ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149974
     http_req_receiving.............: avg=79.65µs min=26.04µs med=62.8µs  max=186.31ms p(90)=103.56µs p(95)=121.03µs p(99.9)=916.14µs
     http_req_sending...............: avg=23.74µs min=4.67µs  med=11.5µs  max=138.96ms p(90)=19.47µs  p(95)=23.26µs  p(99.9)=896.13µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.68ms min=18.28ms med=39.07ms max=311.44ms p(90)=47.65ms  p(95)=50.35ms  p(99.9)=64.39ms 
     http_reqs......................: 149974  1229.290321/s
     iteration_duration.............: avg=40.02ms min=22.19ms med=39.37ms max=326.14ms p(90)=47.96ms  p(95)=50.67ms  p(99.9)=64.95ms 
     iterations.....................: 149874  1228.470652/s
     success_rate...................: 100.00% ✓ 149874      ✗ 0     
     vus............................: 21      min=0         max=50  
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

     checks.........................: 100.00% ✓ 202362     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   664 kB/s
     http_req_blocked...............: avg=4.76µs  min=1.11µs  med=3.02µs  max=3.94ms   p(90)=4.56µs   p(95)=5.23µs   p(99.9)=44.31µs 
     http_req_connecting............: avg=1.5µs   min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.63ms min=21.4ms  med=87.08ms max=324.42ms p(90)=105.65ms p(95)=114.33ms p(99.9)=206.84ms
       { expected_response:true }...: avg=88.63ms min=21.4ms  med=87.08ms max=324.42ms p(90)=105.65ms p(95)=114.33ms p(99.9)=206.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67554
     http_req_receiving.............: avg=88.51µs min=29.53µs med=78.13µs max=141.86ms p(90)=113.97µs p(95)=127.17µs p(99.9)=634.84µs
     http_req_sending...............: avg=26.09µs min=5.03µs  med=14.88µs max=125.35ms p(90)=21.45µs  p(95)=23.76µs  p(99.9)=609.88µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.51ms min=21.26ms med=86.97ms max=323.89ms p(90)=105.56ms p(95)=114.19ms p(99.9)=206.47ms
     http_reqs......................: 67554   552.537069/s
     iteration_duration.............: avg=88.96ms min=31.57ms med=87.34ms max=340.99ms p(90)=105.91ms p(95)=114.57ms p(99.9)=208.14ms
     iterations.....................: 67454   551.71915/s
     success_rate...................: 100.00% ✓ 67454      ✗ 0    
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

     checks.........................: 100.00% ✓ 157431     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   516 kB/s
     http_req_blocked...............: avg=5.12µs   min=1.02µs  med=3.21µs   max=3.82ms   p(90)=4.72µs   p(95)=5.31µs   p(99.9)=140.8µs 
     http_req_connecting............: avg=1.69µs   min=0s      med=0s       max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.9ms  min=21.27ms med=112.12ms max=351.5ms  p(90)=141.85ms p(95)=151.38ms p(99.9)=191.7ms 
       { expected_response:true }...: avg=113.9ms  min=21.27ms med=112.12ms max=351.5ms  p(90)=141.85ms p(95)=151.38ms p(99.9)=191.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 52577
     http_req_receiving.............: avg=179.77µs min=28.59µs med=85.5µs   max=238.95ms p(90)=116.19µs p(95)=128.79µs p(99.9)=808.26µs
     http_req_sending...............: avg=25.04µs  min=4.96µs  med=17.01µs  max=165.65ms p(90)=22.28µs  p(95)=24.26µs  p(99.9)=530.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.7ms  min=21.16ms med=111.99ms max=209.31ms p(90)=141.61ms p(95)=151.11ms p(99.9)=186.28ms
     http_reqs......................: 52577   429.82892/s
     iteration_duration.............: avg=114.35ms min=25.61ms med=112.41ms max=364.52ms p(90)=142.13ms p(95)=151.66ms p(99.9)=193.27ms
     iterations.....................: 52477   429.011397/s
     success_rate...................: 100.00% ✓ 52477      ✗ 0    
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

     checks.........................: 100.00% ✓ 97209      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=6.69µs   min=1.57µs  med=3.8µs    max=3.47ms   p(90)=5.31µs   p(95)=5.92µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=2.62µs   min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=184.47ms min=23.51ms med=188.48ms max=377.06ms p(90)=200.27ms p(95)=205.86ms p(99.9)=269.62ms
       { expected_response:true }...: avg=184.47ms min=23.51ms med=188.48ms max=377.06ms p(90)=200.27ms p(95)=205.86ms p(99.9)=269.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32503
     http_req_receiving.............: avg=99.17µs  min=37.01µs med=90.06µs  max=68.75ms  p(90)=121.55µs p(95)=134.65µs p(99.9)=628.91µs
     http_req_sending...............: avg=26.36µs  min=6.33µs  med=18.47µs  max=44.11ms  p(90)=23.72µs  p(95)=25.81µs  p(99.9)=550.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.35ms min=23.36ms med=188.36ms max=373.92ms p(90)=200.15ms p(95)=205.7ms  p(99.9)=269.5ms 
     http_reqs......................: 32503   264.987036/s
     iteration_duration.............: avg=185.28ms min=45.93ms med=188.8ms  max=387.05ms p(90)=200.59ms p(95)=206.21ms p(99.9)=270.28ms
     iterations.....................: 32403   264.171766/s
     success_rate...................: 100.00% ✓ 32403      ✗ 0    
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

     checks.........................: 100.00% ✓ 96453      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=5.43µs   min=1.57µs  med=3.91µs   max=1.86ms   p(90)=5.51µs   p(95)=6.18µs   p(99.9)=465.58µs
     http_req_connecting............: avg=1.2µs    min=0s      med=0s       max=1.83ms   p(90)=0s       p(95)=0s       p(99.9)=441.65µs
     http_req_duration..............: avg=185.88ms min=18.05ms med=173.47ms max=666.81ms p(90)=222.96ms p(95)=251.04ms p(99.9)=589.11ms
       { expected_response:true }...: avg=185.88ms min=18.05ms med=173.47ms max=666.81ms p(90)=222.96ms p(95)=251.04ms p(99.9)=589.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32251
     http_req_receiving.............: avg=119.51µs min=37.26µs med=95.62µs  max=111.02ms p(90)=128.42µs p(95)=142.87µs p(99.9)=992.42µs
     http_req_sending...............: avg=33.2µs   min=6.39µs  med=20.08µs  max=156.41ms p(90)=25.35µs  p(95)=27.56µs  p(99.9)=497.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.73ms min=17.87ms med=173.33ms max=666.69ms p(90)=222.81ms p(95)=250.44ms p(99.9)=588.98ms
     http_reqs......................: 32251   264.112698/s
     iteration_duration.............: avg=186.71ms min=46.14ms med=173.91ms max=667.11ms p(90)=223.33ms p(95)=252.45ms p(99.9)=589.58ms
     iterations.....................: 32151   263.293769/s
     success_rate...................: 100.00% ✓ 32151      ✗ 0    
     vus............................: 41      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6429      ✗ 0   
     data_received..................: 215 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=44.64µs  min=1.28µs  med=3.6µs   max=4.06ms  p(90)=5.39µs   p(95)=6.41µs   p(99.9)=3.75ms 
     http_req_connecting............: avg=40.01µs  min=0s      med=0s      max=3.97ms  p(90)=0s       p(95)=0s       p(99.9)=3.72ms 
     http_req_duration..............: avg=2.71s    min=42.6ms  med=2.8s    max=4.35s   p(90)=3.48s    p(95)=3.68s    p(99.9)=4.22s  
       { expected_response:true }...: avg=2.71s    min=42.6ms  med=2.8s    max=4.35s   p(90)=3.48s    p(95)=3.68s    p(99.9)=4.22s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2243
     http_req_receiving.............: avg=111.77µs min=29.98µs med=92.8µs  max=32.92ms p(90)=133.97µs p(95)=148.93µs p(99.9)=350.5µs
     http_req_sending...............: avg=53.41µs  min=5.69µs  med=19.38µs max=19.71ms p(90)=25.27µs  p(95)=30.26µs  p(99.9)=6.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.71s    min=42.45ms med=2.8s    max=4.35s   p(90)=3.48s    p(95)=3.68s    p(99.9)=4.22s  
     http_reqs......................: 2243    17.508098/s
     iteration_duration.............: avg=2.84s    min=1s      med=2.84s   max=4.35s   p(90)=3.5s     p(95)=3.7s     p(99.9)=4.22s  
     iterations.....................: 2143    16.727532/s
     success_rate...................: 100.00% ✓ 2143      ✗ 0   
     vus............................: 23      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

