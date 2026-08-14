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
| fusion-nightly | 16.6.1-p.2 | 1,881 | 1,927 | 1,868 | 1.1% |  |
| fusion-nightly-net11 | 16.6.1-p.2 | 1,881 | 1,927 | 1,868 | 0.9% |  |
| fusion | 16.6.0 | 1,865 | 1,918 | 1,857 | 1.1% |  |
| hive-router | v0.0.84 | 1,827 | 1,897 | 1,811 | 1.6% |  |
| fusion-nightly-fed | 16.6.1-p.2 | 1,798 | 1,848 | 1,789 | 1.1% |  |
| grafbase | 0.53.5 | 1,330 | 1,341 | 1,309 | 0.8% |  |
| cosmo | 0.334.0 | 1,219 | 1,262 | 1,215 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 563 | 579 | 561 | 1.1% |  |
| apollo-router | v2.16.1 | 432 | 450 | 428 | 1.7% |  |
| apollo-gateway | 2.14.3 | 259 | 263 | 259 | 0.5% |  |
| hive-gateway | 2.10.8 | 259 | 266 | 258 | 1.2% |  |
| feddi | 5ff8b6165878 | 17 | 17 | 16 | 3.1% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687852      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=3.38µs   min=832ns   med=1.95µs  max=7.37ms   p(90)=3.68µs   p(95)=4.46µs  p(99.9)=27.85µs
     http_req_connecting............: avg=962ns    min=0s      med=0s      max=7.32ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.94ms  min=17.67ms med=25.36ms max=305.44ms p(90)=30.32ms  p(95)=32.13ms p(99.9)=47.96ms
       { expected_response:true }...: avg=25.94ms  min=17.67ms med=25.36ms max=305.44ms p(90)=30.32ms  p(95)=32.13ms p(99.9)=47.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229384
     http_req_receiving.............: avg=299.69µs min=49.32µs med=90.7µs  max=183.99ms p(90)=758.11µs p(95)=1.26ms  p(99.9)=8.12ms 
     http_req_sending...............: avg=31.13µs  min=4.51µs  med=8.4µs   max=130.28ms p(90)=18.47µs  p(95)=29.75µs p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.61ms  min=17.53ms med=25.05ms max=302.69ms p(90)=29.91ms  p(95)=31.69ms p(99.9)=46.76ms
     http_reqs......................: 229384  1881.302725/s
     iteration_duration.............: avg=26.16ms  min=17.84ms med=25.57ms max=316.73ms p(90)=30.52ms  p(95)=32.33ms p(99.9)=48.47ms
     iterations.....................: 229284  1880.482571/s
     success_rate...................: 100.00% ✓ 229284      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687999      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=882ns   med=1.96µs  max=6.6ms    p(90)=3.61µs   p(95)=4.33µs  p(99.9)=34.29µs
     http_req_connecting............: avg=418ns    min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.93ms  min=17.17ms med=25.36ms max=301.09ms p(90)=30.23ms  p(95)=32.06ms p(99.9)=49.06ms
       { expected_response:true }...: avg=25.93ms  min=17.17ms med=25.36ms max=301.09ms p(90)=30.23ms  p(95)=32.06ms p(99.9)=49.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229433
     http_req_receiving.............: avg=262.18µs min=49.55µs med=86.72µs max=246.34ms p(90)=618.06µs p(95)=1.14ms  p(99.9)=7.21ms 
     http_req_sending...............: avg=31.89µs  min=4.41µs  med=8.25µs  max=231.48ms p(90)=18.61µs  p(95)=30.33µs p(99.9)=1.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.64ms  min=16.81ms med=25.08ms max=300.9ms  p(90)=29.88ms  p(95)=31.67ms p(99.9)=47.36ms
     http_reqs......................: 229433  1881.760749/s
     iteration_duration.............: avg=26.15ms  min=17.44ms med=25.56ms max=310.42ms p(90)=30.43ms  p(95)=32.26ms p(99.9)=49.45ms
     iterations.....................: 229333  1880.94057/s
     success_rate...................: 100.00% ✓ 229333      ✗ 0     
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

     checks.........................: 100.00% ✓ 682146      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.35µs   min=942ns   med=2.57µs  max=4.07ms   p(90)=4.28µs   p(95)=5.02µs  p(99.9)=37.84µs
     http_req_connecting............: avg=400ns    min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.15ms  min=17.38ms med=25.51ms max=303.73ms p(90)=30.7ms   p(95)=32.62ms p(99.9)=50.7ms 
       { expected_response:true }...: avg=26.15ms  min=17.38ms med=25.51ms max=303.73ms p(90)=30.7ms   p(95)=32.62ms p(99.9)=50.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 227482
     http_req_receiving.............: avg=332.52µs min=50.63µs med=99.39µs max=123.4ms  p(90)=820.77µs p(95)=1.32ms  p(99.9)=9.26ms 
     http_req_sending...............: avg=33.93µs  min=4.68µs  med=9.39µs  max=157.48ms p(90)=18.94µs  p(95)=48.37µs p(99.9)=1.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.79ms  min=17.27ms med=25.17ms max=239.25ms p(90)=30.26ms  p(95)=32.15ms p(99.9)=49.64ms
     http_reqs......................: 227482  1865.660801/s
     iteration_duration.............: avg=26.37ms  min=17.58ms med=25.72ms max=330.12ms p(90)=30.9ms   p(95)=32.82ms p(99.9)=51.11ms
     iterations.....................: 227382  1864.840666/s
     success_rate...................: 100.00% ✓ 227382      ✗ 0     
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

     checks.........................: 100.00% ✓ 668346      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.91µs  min=942ns   med=2.09µs  max=3.61ms   p(90)=3.77µs  p(95)=4.48µs   p(99.9)=30.93µs
     http_req_connecting............: avg=433ns   min=0s      med=0s      max=3.57ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.71ms min=17.98ms med=26.3ms  max=315.69ms p(90)=30.44ms p(95)=31.86ms  p(99.9)=47.16ms
       { expected_response:true }...: avg=26.71ms min=17.98ms med=26.3ms  max=315.69ms p(90)=30.44ms p(95)=31.86ms  p(99.9)=47.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222882
     http_req_receiving.............: avg=69.92µs min=24.86µs med=50.3µs  max=24.79ms  p(90)=91.26µs p(95)=113.67µs p(99.9)=1.46ms 
     http_req_sending...............: avg=28.2µs  min=4.54µs  med=8.97µs  max=126.36ms p(90)=17.37µs p(95)=23.26µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.62ms min=17.79ms med=26.21ms max=314.92ms p(90)=30.34ms p(95)=31.75ms  p(99.9)=46.13ms
     http_reqs......................: 222882  1827.796728/s
     iteration_duration.............: avg=26.92ms min=18.83ms med=26.49ms max=332.08ms p(90)=30.64ms p(95)=32.06ms  p(99.9)=47.46ms
     iterations.....................: 222782  1826.976655/s
     success_rate...................: 100.00% ✓ 222782      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 657687      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=2.74µs   min=881ns   med=2.06µs  max=2.85ms   p(90)=3.9µs   p(95)=4.62µs  p(99.9)=28.63µs
     http_req_connecting............: avg=228ns    min=0s      med=0s      max=2.43ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.14ms  min=18.09ms med=26.56ms max=295.06ms p(90)=31.72ms p(95)=33.61ms p(99.9)=50.9ms 
       { expected_response:true }...: avg=27.14ms  min=18.09ms med=26.56ms max=295.06ms p(90)=31.72ms p(95)=33.61ms p(99.9)=50.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 219329
     http_req_receiving.............: avg=300.95µs min=49.85µs med=93.98µs max=135.53ms p(90)=739.7µs p(95)=1.24ms  p(99.9)=9.04ms 
     http_req_sending...............: avg=32.41µs  min=4.49µs  med=8.7µs   max=118.29ms p(90)=19.69µs p(95)=34.3µs  p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.8ms   min=17.69ms med=26.24ms max=294.71ms p(90)=31.34ms p(95)=33.18ms p(99.9)=49.58ms
     http_reqs......................: 219329  1798.039897/s
     iteration_duration.............: avg=27.36ms  min=18.23ms med=26.76ms max=322.27ms p(90)=31.93ms p(95)=33.82ms p(99.9)=51.26ms
     iterations.....................: 219229  1797.220106/s
     success_rate...................: 100.00% ✓ 219229      ✗ 0     
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

     checks.........................: 100.00% ✓ 486612      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 195 MB  1.6 MB/s
     http_req_blocked...............: avg=4.1µs    min=1.02µs  med=3.06µs  max=7.58ms   p(90)=5.45µs   p(95)=6.44µs   p(99.9)=47.96µs
     http_req_connecting............: avg=463ns    min=0s      med=0s      max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=36.71ms  min=17.9ms  med=36.31ms max=317.51ms p(90)=43.18ms  p(95)=45.27ms  p(99.9)=63.29ms
       { expected_response:true }...: avg=36.71ms  min=17.9ms  med=36.31ms max=317.51ms p(90)=43.18ms  p(95)=45.27ms  p(99.9)=63.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162304
     http_req_receiving.............: avg=103.25µs min=28.13µs med=63.27µs max=216.15ms p(90)=131.42µs p(95)=177.41µs p(99.9)=2.39ms 
     http_req_sending...............: avg=34.75µs  min=4.49µs  med=11.68µs max=134.19ms p(90)=25.33µs  p(95)=47.21µs  p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.57ms  min=17.72ms med=36.19ms max=317.05ms p(90)=43.05ms  p(95)=45.12ms  p(99.9)=60.64ms
     http_reqs......................: 162304  1330.526272/s
     iteration_duration.............: avg=36.98ms  min=21.29ms med=36.56ms max=327.99ms p(90)=43.41ms  p(95)=45.5ms   p(99.9)=63.99ms
     iterations.....................: 162204  1329.706498/s
     success_rate...................: 100.00% ✓ 162204      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 445986      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.82µs  min=1.03µs  med=2.87µs  max=3.93ms   p(90)=4.53µs   p(95)=5.26µs   p(99.9)=39.25µs
     http_req_connecting............: avg=628ns   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.11ms min=17.4ms  med=39.5ms  max=309.66ms p(90)=48.24ms  p(95)=51.01ms  p(99.9)=65.84ms
       { expected_response:true }...: avg=40.11ms min=17.4ms  med=39.5ms  max=309.66ms p(90)=48.24ms  p(95)=51.01ms  p(99.9)=65.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148762
     http_req_receiving.............: avg=82.12µs min=26.01µs med=67µs    max=152.94ms p(90)=107.84µs p(95)=125.32µs p(99.9)=983.1µs
     http_req_sending...............: avg=28.49µs min=5.14µs  med=12.41µs max=218.68ms p(90)=19.92µs  p(95)=24.07µs  p(99.9)=1.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40ms    min=17.34ms med=39.4ms  max=309.4ms  p(90)=48.12ms  p(95)=50.88ms  p(99.9)=65.41ms
     http_reqs......................: 148762  1219.619537/s
     iteration_duration.............: avg=40.35ms min=22.35ms med=39.72ms max=339.78ms p(90)=48.45ms  p(95)=51.22ms  p(99.9)=66.16ms
     iterations.....................: 148662  1218.799691/s
     success_rate...................: 100.00% ✓ 148662      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 206478     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   677 kB/s
     http_req_blocked...............: avg=4.32µs  min=1.07µs  med=2.73µs  max=3.73ms   p(90)=4.29µs   p(95)=4.92µs   p(99.9)=46.2µs  
     http_req_connecting............: avg=1.29µs  min=0s      med=0s      max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.85ms min=21.2ms  med=85.65ms max=327.4ms  p(90)=102.65ms p(95)=111.16ms p(99.9)=196.01ms
       { expected_response:true }...: avg=86.85ms min=21.2ms  med=85.65ms max=327.4ms  p(90)=102.65ms p(95)=111.16ms p(99.9)=196.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68926
     http_req_receiving.............: avg=84.37µs min=28.29µs med=72.73µs max=214.48ms p(90)=110.27µs p(95)=123.79µs p(99.9)=578µs   
     http_req_sending...............: avg=25.61µs min=5.12µs  med=14.03µs max=111.34ms p(90)=20.84µs  p(95)=23.13µs  p(99.9)=725.94µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.74ms min=21.1ms  med=85.55ms max=326.53ms p(90)=102.55ms p(95)=111.04ms p(99.9)=194.99ms
     http_reqs......................: 68926   563.819952/s
     iteration_duration.............: avg=87.18ms min=27.95ms med=85.9ms  max=342.56ms p(90)=102.89ms p(95)=111.41ms p(99.9)=197.53ms
     iterations.....................: 68826   563.001945/s
     success_rate...................: 100.00% ✓ 68826      ✗ 0    
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

     checks.........................: 100.00% ✓ 158259     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   519 kB/s
     http_req_blocked...............: avg=6.12µs   min=1.3µs   med=3.86µs   max=4.18ms   p(90)=5.5µs    p(95)=6.14µs   p(99.9)=134.33µs
     http_req_connecting............: avg=1.97µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.29ms min=20.36ms med=111.39ms max=328.6ms  p(90)=141.05ms p(95)=150.52ms p(99.9)=190.46ms
       { expected_response:true }...: avg=113.29ms min=20.36ms med=111.39ms max=328.6ms  p(90)=141.05ms p(95)=150.52ms p(99.9)=190.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52853
     http_req_receiving.............: avg=94.08µs  min=33.62µs med=86.63µs  max=153.38ms p(90)=119.6µs  p(95)=132.94µs p(99.9)=659.17µs
     http_req_sending...............: avg=30.63µs  min=6.21µs  med=18.5µs   max=192.63ms p(90)=24.02µs  p(95)=26.15µs  p(99.9)=640.77µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.16ms min=20.22ms med=111.28ms max=328.12ms p(90)=140.94ms p(95)=150.37ms p(99.9)=189.5ms 
     http_reqs......................: 52853   432.078027/s
     iteration_duration.............: avg=113.76ms min=32.5ms  med=111.7ms  max=347.31ms p(90)=141.36ms p(95)=150.88ms p(99.9)=193.47ms
     iterations.....................: 52753   431.260518/s
     success_rate...................: 100.00% ✓ 52753      ✗ 0    
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

     checks.........................: 100.00% ✓ 95223      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=10.97µs  min=1.44µs  med=3.51µs   max=126.36ms p(90)=4.98µs   p(95)=5.58µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.17µs   min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=188.3ms  min=23.5ms  med=188.54ms max=400.82ms p(90)=198.76ms p(95)=203.58ms p(99.9)=279.31ms
       { expected_response:true }...: avg=188.3ms  min=23.5ms  med=188.54ms max=400.82ms p(90)=198.76ms p(95)=203.58ms p(99.9)=279.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31841
     http_req_receiving.............: avg=96.21µs  min=36.09µs med=91.33µs  max=12.27ms  p(90)=123.37µs p(95)=136.34µs p(99.9)=498.57µs
     http_req_sending...............: avg=43.11µs  min=5.48µs  med=18.26µs  max=166.56ms p(90)=23.33µs  p(95)=25.25µs  p(99.9)=557.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.16ms min=23.33ms med=188.42ms max=400.5ms  p(90)=198.62ms p(95)=203.45ms p(99.9)=278.6ms 
     http_reqs......................: 31841   259.621008/s
     iteration_duration.............: avg=189.13ms min=49.76ms med=188.86ms max=407.83ms p(90)=199.06ms p(95)=203.89ms p(99.9)=291.32ms
     iterations.....................: 31741   258.805641/s
     success_rate...................: 100.00% ✓ 31741      ✗ 0    
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

     checks.........................: 100.00% ✓ 94671      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=5.65µs   min=1.43µs  med=3.84µs   max=2.68ms   p(90)=5.42µs   p(95)=6.12µs   p(99.9)=589.97µs
     http_req_connecting............: avg=1.52µs   min=0s      med=0s       max=2.66ms   p(90)=0s       p(95)=0s       p(99.9)=571.36µs
     http_req_duration..............: avg=189.41ms min=18.45ms med=178.2ms  max=592.75ms p(90)=222.78ms p(95)=251.09ms p(99.9)=565.78ms
       { expected_response:true }...: avg=189.41ms min=18.45ms med=178.2ms  max=592.75ms p(90)=222.78ms p(95)=251.09ms p(99.9)=565.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31657
     http_req_receiving.............: avg=98.93µs  min=37.04µs med=92.48µs  max=44.63ms  p(90)=125.19µs p(95)=138.55µs p(99.9)=839.66µs
     http_req_sending...............: avg=30.15µs  min=6.77µs  med=18.58µs  max=83.14ms  p(90)=23.49µs  p(95)=25.44µs  p(99.9)=511.88µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.29ms min=18.35ms med=178.08ms max=592.64ms p(90)=222.66ms p(95)=251ms    p(99.9)=565.66ms
     http_reqs......................: 31657   259.212009/s
     iteration_duration.............: avg=190.27ms min=50.94ms med=178.62ms max=593ms    p(90)=223.16ms p(95)=253.1ms  p(99.9)=566.08ms
     iterations.....................: 31557   258.393195/s
     success_rate...................: 100.00% ✓ 31557      ✗ 0    
     vus............................: 35      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6318     ✗ 0   
     data_received..................: 211 MB  1.7 MB/s
     data_sent......................: 2.6 MB  21 kB/s
     http_req_blocked...............: avg=47.55µs min=1.09µs  med=3.03µs  max=3.61ms p(90)=4.54µs   p(95)=5.54µs   p(99.9)=3.19ms  
     http_req_connecting............: avg=43.55µs min=0s      med=0s      max=3.56ms p(90)=0s       p(95)=0s       p(99.9)=3.15ms  
     http_req_duration..............: avg=2.74s   min=42.57ms med=2.85s   max=4.7s   p(90)=3.47s    p(95)=3.65s    p(99.9)=4.53s   
       { expected_response:true }...: avg=2.74s   min=42.57ms med=2.85s   max=4.7s   p(90)=3.47s    p(95)=3.65s    p(99.9)=4.53s   
     http_req_failed................: 0.00%   ✓ 0        ✗ 2206
     http_req_receiving.............: avg=94.64µs min=35.57µs med=90.9µs  max=2.1ms  p(90)=129.86µs p(95)=143.77µs p(99.9)=383.05µs
     http_req_sending...............: avg=47.45µs min=5.59µs  med=17.45µs max=9.89ms p(90)=22.89µs  p(95)=27.45µs  p(99.9)=8.69ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.74s   min=42.47ms med=2.85s   max=4.7s   p(90)=3.47s    p(95)=3.64s    p(99.9)=4.53s   
     http_reqs......................: 2206    17.31578/s
     iteration_duration.............: avg=2.87s   min=1.06s   med=2.88s   max=4.7s   p(90)=3.48s    p(95)=3.66s    p(99.9)=4.55s   
     iterations.....................: 2106    16.53084/s
     success_rate...................: 100.00% ✓ 2106     ✗ 0   
     vus............................: 23      min=0      max=50
     vus_max........................: 50      min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

