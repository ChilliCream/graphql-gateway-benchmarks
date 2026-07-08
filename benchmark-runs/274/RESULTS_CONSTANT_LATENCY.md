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
| fusion-nightly | 16.5.0-p.5 | 1,851 | 1,894 | 1,843 | 0.9% |  |
| hive-router | v0.0.78 | 1,849 | 1,910 | 1,834 | 1.4% |  |
| fusion | 16.4.0 | 1,837 | 1,895 | 1,833 | 1.2% |  |
| fusion-nightly-net11 | 16.5.0-p.5 | 1,822 | 1,861 | 1,814 | 0.9% |  |
| fusion-nightly-fed | 16.5.0-p.5 | 1,734 | 1,794 | 1,728 | 1.4% |  |
| grafbase | 0.53.5 | 1,288 | 1,324 | 1,284 | 1.1% |  |
| cosmo | 0.329.0 | 1,202 | 1,241 | 1,194 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.2 | 565 | 585 | 563 | 1.2% |  |
| apollo-router | v2.16.0 | 395 | 417 | 391 | 2.4% |  |
| apollo-gateway | 2.14.2 | 264 | 266 | 262 | 0.5% |  |
| hive-gateway | 2.10.2 | 260 | 269 | 257 | 1.5% |  |
| feddi | 77271dc84a06 | 20 | 20 | 17 | 5.0% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 676803      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.65µs   min=902ns   med=2.01µs  max=2.42ms   p(90)=3.73µs   p(95)=4.46µs  p(99.9)=27.67µs
     http_req_connecting............: avg=220ns    min=0s      med=0s      max=2.37ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.37ms  min=17.39ms med=25.82ms max=299.4ms  p(90)=30.74ms  p(95)=32.54ms p(99.9)=48.17ms
       { expected_response:true }...: avg=26.37ms  min=17.39ms med=25.82ms max=299.4ms  p(90)=30.74ms  p(95)=32.54ms p(99.9)=48.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225701
     http_req_receiving.............: avg=327.35µs min=49.86µs med=99.87µs max=63.19ms  p(90)=854.46µs p(95)=1.33ms  p(99.9)=7.4ms  
     http_req_sending...............: avg=30.55µs  min=4.5µs   med=8.65µs  max=158.19ms p(90)=18.43µs  p(95)=28.87µs p(99.9)=1.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.01ms  min=17.26ms med=25.47ms max=292.51ms p(90)=30.31ms  p(95)=32.07ms p(99.9)=46.91ms
     http_reqs......................: 225701  1851.043209/s
     iteration_duration.............: avg=26.58ms  min=17.58ms med=26.02ms max=309ms    p(90)=30.94ms  p(95)=32.74ms p(99.9)=48.59ms
     iterations.....................: 225601  1850.223078/s
     success_rate...................: 100.00% ✓ 225601      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 676203      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3.55µs  min=1.05µs  med=2.69µs  max=5.04ms   p(90)=4.4µs   p(95)=5.15µs  p(99.9)=39.62µs
     http_req_connecting............: avg=409ns   min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.38ms min=18.14ms med=25.89ms max=309.73ms p(90)=30.17ms p(95)=31.69ms p(99.9)=49.25ms
       { expected_response:true }...: avg=26.38ms min=18.14ms med=25.89ms max=309.73ms p(90)=30.17ms p(95)=31.69ms p(99.9)=49.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225501
     http_req_receiving.............: avg=80.15µs min=26.53µs med=53.6µs  max=118.62ms p(90)=99.08µs p(95)=128.5µs p(99.9)=2.48ms 
     http_req_sending...............: avg=34.73µs min=4.78µs  med=10.7µs  max=144.71ms p(90)=19.61µs p(95)=28.67µs p(99.9)=1.66ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.27ms min=18.03ms med=25.8ms  max=309.48ms p(90)=30.05ms p(95)=31.55ms p(99.9)=48.38ms
     http_reqs......................: 225501  1849.136615/s
     iteration_duration.............: avg=26.61ms min=18.34ms med=26.11ms max=317.81ms p(90)=30.39ms p(95)=31.9ms  p(99.9)=49.68ms
     iterations.....................: 225401  1848.316603/s
     success_rate...................: 100.00% ✓ 225401      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 672081      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.81µs   min=912ns   med=1.99µs  max=3.37ms   p(90)=3.53µs   p(95)=4.27µs  p(99.9)=28.24µs
     http_req_connecting............: avg=426ns    min=0s      med=0s      max=3.32ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.56ms  min=17.29ms med=25.96ms max=299.24ms p(90)=31.13ms  p(95)=33.02ms p(99.9)=49.71ms
       { expected_response:true }...: avg=26.56ms  min=17.29ms med=25.96ms max=299.24ms p(90)=31.13ms  p(95)=33.02ms p(99.9)=49.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 224127
     http_req_receiving.............: avg=349.89µs min=49.76µs med=99.94µs max=138.21ms p(90)=901.25µs p(95)=1.38ms  p(99.9)=8.26ms 
     http_req_sending...............: avg=31.79µs  min=4.59µs  med=8.5µs   max=172.71ms p(90)=17.54µs  p(95)=26.61µs p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.18ms  min=17.04ms med=25.59ms max=298.77ms p(90)=30.67ms  p(95)=32.54ms p(99.9)=47.96ms
     http_reqs......................: 224127  1837.94312/s
     iteration_duration.............: avg=26.77ms  min=17.49ms med=26.16ms max=313.18ms p(90)=31.33ms  p(95)=33.22ms p(99.9)=50.27ms
     iterations.....................: 224027  1837.123074/s
     success_rate...................: 100.00% ✓ 224027      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 666165      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.63µs   min=792ns   med=1.99µs  max=3.01ms   p(90)=3.79µs   p(95)=4.5µs   p(99.9)=33.24µs
     http_req_connecting............: avg=187ns    min=0s      med=0s      max=2.45ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.79ms  min=17.62ms med=26.25ms max=307.79ms p(90)=31.12ms  p(95)=32.94ms p(99.9)=50.11ms
       { expected_response:true }...: avg=26.79ms  min=17.62ms med=26.25ms max=307.79ms p(90)=31.12ms  p(95)=32.94ms p(99.9)=50.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222155
     http_req_receiving.............: avg=367.21µs min=49.96µs med=95.45µs max=264.07ms p(90)=916.14µs p(95)=1.45ms  p(99.9)=9.78ms 
     http_req_sending...............: avg=29.78µs  min=4.41µs  med=8.47µs  max=24.69ms  p(90)=19.33µs  p(95)=29.88µs p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.4ms   min=17.46ms med=25.9ms  max=139.32ms p(90)=30.68ms  p(95)=32.44ms p(99.9)=46.34ms
     http_reqs......................: 222155  1822.021342/s
     iteration_duration.............: avg=27.01ms  min=17.9ms  med=26.45ms max=320.3ms  p(90)=31.32ms  p(95)=33.14ms p(99.9)=50.58ms
     iterations.....................: 222055  1821.201185/s
     success_rate...................: 100.00% ✓ 222055      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 634353      ✗ 0     
     data_received..................: 19 GB   152 MB/s
     data_sent......................: 254 MB  2.1 MB/s
     http_req_blocked...............: avg=3.48µs   min=1.01µs  med=2.67µs   max=4.9ms    p(90)=4.38µs   p(95)=5.11µs  p(99.9)=36.27µs
     http_req_connecting............: avg=417ns    min=0s      med=0s       max=3.31ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=28.14ms  min=18.17ms med=27.53ms  max=304.24ms p(90)=33.02ms  p(95)=34.99ms p(99.9)=52.59ms
       { expected_response:true }...: avg=28.14ms  min=18.17ms med=27.53ms  max=304.24ms p(90)=33.02ms  p(95)=34.99ms p(99.9)=52.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 211551
     http_req_receiving.............: avg=348.65µs min=50.68µs med=108.04µs max=167.38ms p(90)=886.64µs p(95)=1.38ms  p(99.9)=8.47ms 
     http_req_sending...............: avg=32.53µs  min=4.52µs  med=10.22µs  max=158.61ms p(90)=19.75µs  p(95)=29.21µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.75ms  min=17.69ms med=27.16ms  max=303.58ms p(90)=32.57ms  p(95)=34.52ms p(99.9)=51.3ms 
     http_reqs......................: 211551  1734.219545/s
     iteration_duration.............: avg=28.36ms  min=18.37ms med=27.74ms  max=314.17ms p(90)=33.24ms  p(95)=35.21ms p(99.9)=53.12ms
     iterations.....................: 211451  1733.39978/s
     success_rate...................: 100.00% ✓ 211451      ✗ 0     
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

     checks.........................: 100.00% ✓ 471342      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=4.2µs   min=1.03µs  med=3.09µs  max=3.61ms   p(90)=5.43µs   p(95)=6.42µs   p(99.9)=48.84µs
     http_req_connecting............: avg=587ns   min=0s      med=0s      max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.91ms min=18.33ms med=37.59ms max=314.62ms p(90)=44.67ms  p(95)=46.83ms  p(99.9)=67.29ms
       { expected_response:true }...: avg=37.91ms min=18.33ms med=37.59ms max=314.62ms p(90)=44.67ms  p(95)=46.83ms  p(99.9)=67.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157214
     http_req_receiving.............: avg=95.65µs min=26.31µs med=62.08µs max=134.95ms p(90)=131.47µs p(95)=180.91µs p(99.9)=2.85ms 
     http_req_sending...............: avg=41.24µs min=4.6µs   med=11.38µs max=211.18ms p(90)=25.1µs   p(95)=81.31µs  p(99.9)=2.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.77ms min=18.22ms med=37.47ms max=313.93ms p(90)=44.53ms  p(95)=46.68ms  p(99.9)=66.35ms
     http_reqs......................: 157214  1288.687754/s
     iteration_duration.............: avg=38.18ms min=21.81ms med=37.83ms max=332.26ms p(90)=44.9ms   p(95)=47.07ms  p(99.9)=67.97ms
     iterations.....................: 157114  1287.868051/s
     success_rate...................: 100.00% ✓ 157114      ✗ 0     
     vus............................: 24      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 439638      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 176 MB  1.4 MB/s
     http_req_blocked...............: avg=3.62µs  min=1.08µs  med=2.58µs  max=4.2ms    p(90)=4.28µs   p(95)=4.98µs   p(99.9)=38.21µs 
     http_req_connecting............: avg=700ns   min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.7ms  min=18.77ms med=40.09ms max=342.24ms p(90)=49.04ms  p(95)=51.92ms  p(99.9)=65.45ms 
       { expected_response:true }...: avg=40.7ms  min=18.77ms med=40.09ms max=342.24ms p(90)=49.04ms  p(95)=51.92ms  p(99.9)=65.45ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 146646
     http_req_receiving.............: avg=78.57µs min=27.44µs med=65.66µs max=51.92ms  p(90)=107.06µs p(95)=124.59µs p(99.9)=818.18µs
     http_req_sending...............: avg=22.83µs min=4.89µs  med=11.32µs max=76.32ms  p(90)=18.64µs  p(95)=22.51µs  p(99.9)=883.01µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.6ms  min=18.66ms med=40ms    max=341.81ms p(90)=48.93ms  p(95)=51.81ms  p(99.9)=65.09ms 
     http_reqs......................: 146646  1202.072989/s
     iteration_duration.............: avg=40.93ms min=23.1ms  med=40.31ms max=352.56ms p(90)=49.24ms  p(95)=52.12ms  p(99.9)=65.69ms 
     iterations.....................: 146546  1201.253278/s
     success_rate...................: 100.00% ✓ 146546      ✗ 0     
     vus............................: 11      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 207249     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   680 kB/s
     http_req_blocked...............: avg=5.03µs  min=1.28µs  med=3.39µs  max=3.52ms   p(90)=5µs      p(95)=5.7µs    p(99.9)=54.91µs 
     http_req_connecting............: avg=1.36µs  min=0s      med=0s      max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.5ms  min=20.62ms med=83.25ms max=339.32ms p(90)=110.45ms p(95)=119.44ms p(99.9)=206.94ms
       { expected_response:true }...: avg=86.5ms  min=20.62ms med=83.25ms max=339.32ms p(90)=110.45ms p(95)=119.44ms p(99.9)=206.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69183
     http_req_receiving.............: avg=89.62µs min=29.81µs med=76.78µs max=150.64ms p(90)=113.47µs p(95)=127.49µs p(99.9)=647.23µs
     http_req_sending...............: avg=31.53µs min=5.88µs  med=15.3µs  max=141.95ms p(90)=22.19µs  p(95)=24.63µs  p(99.9)=637.83µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.38ms min=20.48ms med=83.13ms max=314.57ms p(90)=110.33ms p(95)=119.27ms p(99.9)=206.58ms
     http_reqs......................: 69183   565.99812/s
     iteration_duration.............: avg=86.85ms min=30.15ms med=83.52ms max=347.08ms p(90)=110.7ms  p(95)=119.71ms p(99.9)=208.02ms
     iterations.....................: 69083   565.180003/s
     success_rate...................: 100.00% ✓ 69083      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 144786     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=4.94µs   min=1.43µs  med=3.69µs   max=2.21ms   p(90)=5.25µs   p(95)=5.88µs   p(99.9)=113.78µs
     http_req_connecting............: avg=992ns    min=0s      med=0s       max=2.19ms   p(90)=0s       p(95)=0s       p(99.9)=65.71µs 
     http_req_duration..............: avg=123.85ms min=21.25ms med=121.81ms max=337.64ms p(90)=155.15ms p(95)=165.47ms p(99.9)=209.75ms
       { expected_response:true }...: avg=123.85ms min=21.25ms med=121.81ms max=337.64ms p(90)=155.15ms p(95)=165.47ms p(99.9)=209.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48362
     http_req_receiving.............: avg=93.38µs  min=31.69µs med=87.47µs  max=96.22ms  p(90)=119.06µs p(95)=131.74µs p(99.9)=564.86µs
     http_req_sending...............: avg=26.99µs  min=5.82µs  med=17.61µs  max=74.33ms  p(90)=23.27µs  p(95)=25.29µs  p(99.9)=544.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.73ms min=21.1ms  med=121.7ms  max=331.25ms p(90)=155.02ms p(95)=165.34ms p(99.9)=209.4ms 
     http_reqs......................: 48362   395.256286/s
     iteration_duration.............: avg=124.35ms min=36.42ms med=122.14ms max=351.19ms p(90)=155.46ms p(95)=165.76ms p(99.9)=212.75ms
     iterations.....................: 48262   394.438999/s
     success_rate...................: 100.00% ✓ 48262      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97194      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=6.64µs   min=1.17µs  med=3.24µs   max=4.21ms   p(90)=4.67µs   p(95)=5.25µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=184.52ms min=23.74ms med=185.42ms max=383.18ms p(90)=208.24ms p(95)=214.51ms p(99.9)=285.48ms
       { expected_response:true }...: avg=184.52ms min=23.74ms med=185.42ms max=383.18ms p(90)=208.24ms p(95)=214.51ms p(99.9)=285.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32498
     http_req_receiving.............: avg=95.61µs  min=30.69µs med=89.92µs  max=48.9ms   p(90)=121.24µs p(95)=134.96µs p(99.9)=480.83µs
     http_req_sending...............: avg=29.28µs  min=5.2µs   med=18.05µs  max=79.24ms  p(90)=22.82µs  p(95)=24.68µs  p(99.9)=506.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.39ms min=23.55ms med=185.29ms max=382.68ms p(90)=208.12ms p(95)=214.4ms  p(99.9)=285.37ms
     http_reqs......................: 32498   264.914521/s
     iteration_duration.............: avg=185.32ms min=51.86ms med=186ms    max=399.09ms p(90)=208.53ms p(95)=214.82ms p(99.9)=286.53ms
     iterations.....................: 32398   264.09935/s
     success_rate...................: 100.00% ✓ 32398      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95118      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.87µs   min=1.51µs  med=3.74µs   max=3.6ms    p(90)=5.31µs   p(95)=5.95µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=2.81µs   min=0s      med=0s       max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=188.53ms min=18.08ms med=176.36ms max=657.04ms p(90)=226.47ms p(95)=255.94ms p(99.9)=603.12ms
       { expected_response:true }...: avg=188.53ms min=18.08ms med=176.36ms max=657.04ms p(90)=226.47ms p(95)=255.94ms p(99.9)=603.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31806
     http_req_receiving.............: avg=100.8µs  min=35.18µs med=92.64µs  max=85.12ms  p(90)=125.36µs p(95)=138.7µs  p(99.9)=641.2µs 
     http_req_sending...............: avg=34.53µs  min=6.86µs  med=18.63µs  max=109.61ms p(90)=23.66µs  p(95)=25.6µs   p(99.9)=536.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.4ms  min=17.93ms med=176.23ms max=656.95ms p(90)=226.34ms p(95)=255.85ms p(99.9)=603.01ms
     http_reqs......................: 31806   260.235465/s
     iteration_duration.............: avg=189.38ms min=41.57ms med=176.76ms max=657.28ms p(90)=226.99ms p(95)=256.84ms p(99.9)=603.45ms
     iterations.....................: 31706   259.417269/s
     success_rate...................: 100.00% ✓ 31706      ✗ 0    
     vus............................: 48      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7524      ✗ 0   
     data_received..................: 250 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=33.84µs min=1.25µs   med=3.4µs    max=5.12ms  p(90)=5.06µs   p(95)=6.2µs    p(99.9)=3.75ms  
     http_req_connecting............: avg=28.13µs min=0s       med=0s       max=4.84ms  p(90)=0s       p(95)=0s       p(99.9)=3.41ms  
     http_req_duration..............: avg=2.32s   min=37.15ms  med=2.36s    max=7.73s   p(90)=3.23s    p(95)=3.49s    p(99.9)=6.59s   
       { expected_response:true }...: avg=2.32s   min=37.15ms  med=2.36s    max=7.73s   p(90)=3.23s    p(95)=3.49s    p(99.9)=6.59s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2608
     http_req_receiving.............: avg=104.7µs min=30.32µs  med=100.39µs max=1.23ms  p(90)=141.43µs p(95)=154.78µs p(99.9)=607.76µs
     http_req_sending...............: avg=50.82µs min=6.11µs   med=19.5µs   max=12.74ms p(90)=25.21µs  p(95)=29.48µs  p(99.9)=2.67ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.32s   min=36.94ms  med=2.36s    max=7.73s   p(90)=3.23s    p(95)=3.49s    p(99.9)=6.59s   
     http_reqs......................: 2608    20.665947/s
     iteration_duration.............: avg=2.41s   min=638.16ms med=2.39s    max=7.74s   p(90)=3.25s    p(95)=3.51s    p(99.9)=6.66s   
     iterations.....................: 2508    19.873541/s
     success_rate...................: 100.00% ✓ 2508      ✗ 0   
     vus............................: 30      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

