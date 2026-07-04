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
| hive-router | v0.0.74 | 1,769 | 1,811 | 1,755 | 0.9% |  |
| fusion | 16.3.0 | 1,758 | 1,795 | 1,753 | 0.8% |  |
| fusion-nightly | 16.4.0-p.14 | 1,718 | 1,772 | 1,712 | 1.2% |  |
| grafbase | 0.53.5 | 1,229 | 1,250 | 1,217 | 0.9% |  |
| cosmo | 0.326.1 | 1,103 | 1,128 | 1,099 | 1.0% |  |
| hive-gateway-router-runtime | 2.10.0 | 499 | 511 | 497 | 1.1% |  |
| apollo-router | v2.15.1 | 363 | 377 | 360 | 1.5% |  |
| apollo-gateway | 2.14.2 | 234 | 236 | 232 | 0.5% |  |
| hive-gateway | 2.10.0 | 231 | 235 | 230 | 0.9% |  |
| feddi | 77271dc84a06 | 21 | 21 | 20 | 2.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 647190      ✗ 0     
     data_received..................: 19 GB   155 MB/s
     data_sent......................: 259 MB  2.1 MB/s
     http_req_blocked...............: avg=4µs     min=1.16µs  med=2.95µs  max=7.13ms   p(90)=4.66µs  p(95)=5.46µs   p(99.9)=41.33µs
     http_req_connecting............: avg=550ns   min=0s      med=0s      max=5.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=27.55ms min=18.17ms med=27.03ms max=351.35ms p(90)=31.57ms p(95)=33.23ms  p(99.9)=53.7ms 
       { expected_response:true }...: avg=27.55ms min=18.17ms med=27.03ms max=351.35ms p(90)=31.57ms p(95)=33.23ms  p(99.9)=53.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 215830
     http_req_receiving.............: avg=89.31µs min=27.78µs med=57.45µs max=179.06ms p(90)=107.1µs p(95)=143.87µs p(99.9)=3.25ms 
     http_req_sending...............: avg=42.59µs min=5.65µs  med=12.32µs max=267.46ms p(90)=21.84µs p(95)=61.67µs  p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=27.42ms min=18.03ms med=26.93ms max=330.88ms p(90)=31.44ms p(95)=33.07ms  p(99.9)=51.93ms
     http_reqs......................: 215830  1769.83247/s
     iteration_duration.............: avg=27.8ms  min=19.37ms med=27.26ms max=372.19ms p(90)=31.8ms  p(95)=33.47ms  p(99.9)=54.14ms
     iterations.....................: 215730  1769.012458/s
     success_rate...................: 100.00% ✓ 215730      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 642819      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 258 MB  2.1 MB/s
     http_req_blocked...............: avg=3.21µs   min=1.07µs  med=2.22µs   max=5.94ms   p(90)=3.63µs  p(95)=4.26µs  p(99.9)=28.73µs
     http_req_connecting............: avg=545ns    min=0s      med=0s       max=4.49ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.76ms  min=17.76ms med=27.09ms  max=344.69ms p(90)=32.64ms p(95)=34.77ms p(99.9)=54.49ms
       { expected_response:true }...: avg=27.76ms  min=17.76ms med=27.09ms  max=344.69ms p(90)=32.64ms p(95)=34.77ms p(99.9)=54.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 214373
     http_req_receiving.............: avg=417.57µs min=55.25µs med=113.59µs max=244.73ms p(90)=1ms     p(95)=1.54ms  p(99.9)=11.07ms
     http_req_sending...............: avg=34.72µs  min=4.98µs  med=9.44µs   max=128.42ms p(90)=17.62µs p(95)=35.62µs p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.31ms  min=17.62ms med=26.66ms  max=338.55ms p(90)=32.09ms p(95)=34.19ms p(99.9)=52.39ms
     http_reqs......................: 214373  1758.311055/s
     iteration_duration.............: avg=27.99ms  min=18.46ms med=27.3ms   max=356.09ms p(90)=32.86ms p(95)=34.99ms p(99.9)=54.87ms
     iterations.....................: 214273  1757.490844/s
     success_rate...................: 100.00% ✓ 214273      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 628428      ✗ 0     
     data_received..................: 18 GB   151 MB/s
     data_sent......................: 252 MB  2.1 MB/s
     http_req_blocked...............: avg=3.75µs   min=1.11µs  med=2.77µs   max=5.15ms   p(90)=4.33µs  p(95)=5.01µs  p(99.9)=39.22µs
     http_req_connecting............: avg=546ns    min=0s      med=0s       max=4.7ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=28.39ms  min=18.13ms med=27.76ms  max=352.65ms p(90)=33.28ms p(95)=35.36ms p(99.9)=54.44ms
       { expected_response:true }...: avg=28.39ms  min=18.13ms med=27.76ms  max=352.65ms p(90)=33.28ms p(95)=35.36ms p(99.9)=54.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 209576
     http_req_receiving.............: avg=441.23µs min=56.27µs med=117.09µs max=131.06ms p(90)=1.12ms  p(95)=1.69ms  p(99.9)=11.14ms
     http_req_sending...............: avg=38.95µs  min=5.25µs  med=10.68µs  max=231.51ms p(90)=19.96µs p(95)=64.51µs p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.91ms  min=17.91ms med=27.3ms   max=352.07ms p(90)=32.7ms  p(95)=34.74ms p(99.9)=52.49ms
     http_reqs......................: 209576  1718.479639/s
     iteration_duration.............: avg=28.63ms  min=18.69ms med=27.98ms  max=372.49ms p(90)=33.5ms  p(95)=35.6ms  p(99.9)=54.94ms
     iterations.....................: 209476  1717.65966/s
     success_rate...................: 100.00% ✓ 209476      ✗ 0     
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

     checks.........................: 100.00% ✓ 449580      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=4.47µs  min=1.07µs  med=2.36µs  max=8.68ms   p(90)=4.69µs   p(95)=5.7µs    p(99.9)=37.85µs
     http_req_connecting............: avg=1.46µs  min=0s      med=0s      max=8.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.76ms min=18.32ms med=39.34ms max=345.85ms p(90)=47.03ms  p(95)=49.46ms  p(99.9)=67.17ms
       { expected_response:true }...: avg=39.76ms min=18.32ms med=39.34ms max=345.85ms p(90)=47.03ms  p(95)=49.46ms  p(99.9)=67.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149960
     http_req_receiving.............: avg=93.49µs min=29.87µs med=58.2µs  max=254.43ms p(90)=128.18µs p(95)=177.74µs p(99.9)=2.72ms 
     http_req_sending...............: avg=36.93µs min=5.23µs  med=9.92µs  max=91.98ms  p(90)=24.05µs  p(95)=82.16µs  p(99.9)=2.95ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.63ms min=18.18ms med=39.22ms max=311ms    p(90)=46.89ms  p(95)=49.29ms  p(99.9)=66.22ms
     http_reqs......................: 149960  1229.257775/s
     iteration_duration.............: avg=40.03ms min=21.09ms med=39.58ms max=368ms    p(90)=47.26ms  p(95)=49.69ms  p(99.9)=67.98ms
     iterations.....................: 149860  1228.438051/s
     success_rate...................: 100.00% ✓ 149860      ✗ 0     
     vus............................: 18      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403455      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=4.4µs   min=1.27µs  med=3.13µs  max=4.41ms   p(90)=4.82µs   p(95)=5.6µs    p(99.9)=43.69µs
     http_req_connecting............: avg=888ns   min=0s      med=0s      max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.34ms min=18.92ms med=43.68ms max=352.59ms p(90)=54.16ms  p(95)=57.35ms  p(99.9)=73.51ms
       { expected_response:true }...: avg=44.34ms min=18.92ms med=43.68ms max=352.59ms p(90)=54.16ms  p(95)=57.35ms  p(99.9)=73.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134585
     http_req_receiving.............: avg=96.13µs min=29.14µs med=77.07µs max=155.96ms p(90)=119.04µs p(95)=137.24µs p(99.9)=1.27ms 
     http_req_sending...............: avg=30.08µs min=5.68µs  med=14.34µs max=88.82ms  p(90)=21.53µs  p(95)=26.56µs  p(99.9)=1.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.21ms min=18.79ms med=43.56ms max=339.81ms p(90)=54.04ms  p(95)=57.22ms  p(99.9)=73.28ms
     http_reqs......................: 134585  1103.182538/s
     iteration_duration.............: avg=44.6ms  min=23.71ms med=43.91ms max=376.05ms p(90)=54.39ms  p(95)=57.58ms  p(99.9)=73.91ms
     iterations.....................: 134485  1102.362846/s
     success_rate...................: 100.00% ✓ 134485      ✗ 0     
     vus............................: 14      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 182943     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   600 kB/s
     http_req_blocked...............: avg=5.6µs   min=1.42µs  med=3.42µs  max=4.71ms   p(90)=5µs      p(95)=5.72µs   p(99.9)=105.96µs
     http_req_connecting............: avg=1.86µs  min=0s      med=0s      max=4.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98ms    min=20.61ms med=95.65ms max=366.45ms p(90)=121.17ms p(95)=131.48ms p(99.9)=220.32ms
       { expected_response:true }...: avg=98ms    min=20.61ms med=95.65ms max=366.45ms p(90)=121.17ms p(95)=131.48ms p(99.9)=220.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61081
     http_req_receiving.............: avg=89.08µs min=32.86µs med=81.33µs max=38.61ms  p(90)=115.12µs p(95)=127.3µs  p(99.9)=847.37µs
     http_req_sending...............: avg=29.74µs min=6.39µs  med=16.62µs max=183.1ms  p(90)=22.57µs  p(95)=25.13µs  p(99.9)=715.26µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.89ms min=20.47ms med=95.54ms max=366.27ms p(90)=121.05ms p(95)=131.33ms p(99.9)=219.8ms 
     http_reqs......................: 61081   499.672635/s
     iteration_duration.............: avg=98.4ms  min=38.45ms med=95.9ms  max=405.47ms p(90)=121.44ms p(95)=131.82ms p(99.9)=224.09ms
     iterations.....................: 60981   498.854586/s
     success_rate...................: 100.00% ✓ 60981      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 133137     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   436 kB/s
     http_req_blocked...............: avg=6.69µs   min=1.39µs  med=3.66µs   max=4.94ms   p(90)=5.16µs   p(95)=5.8µs    p(99.9)=1.33ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=4.89ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=134.69ms min=21.55ms med=132.52ms max=410.66ms p(90)=169.44ms p(95)=180.95ms p(99.9)=231.57ms
       { expected_response:true }...: avg=134.69ms min=21.55ms med=132.52ms max=410.66ms p(90)=169.44ms p(95)=180.95ms p(99.9)=231.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44479
     http_req_receiving.............: avg=101.45µs min=35.4µs  med=88.54µs  max=132.44ms p(90)=120.83µs p(95)=133.62µs p(99.9)=924.96µs
     http_req_sending...............: avg=26.31µs  min=6.1µs   med=18.33µs  max=84.13ms  p(90)=23.7µs   p(95)=26.02µs  p(99.9)=614.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.56ms min=21.43ms med=132.4ms  max=399.5ms  p(90)=169.33ms p(95)=180.8ms  p(99.9)=230.95ms
     http_reqs......................: 44479   363.410272/s
     iteration_duration.............: avg=135.24ms min=33.7ms  med=132.83ms max=422.85ms p(90)=169.77ms p(95)=181.3ms  p(99.9)=235.85ms
     iterations.....................: 44379   362.593235/s
     success_rate...................: 100.00% ✓ 44379      ✗ 0    
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

     checks.........................: 100.00% ✓ 86220      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   282 kB/s
     http_req_blocked...............: avg=6.67µs   min=1.41µs  med=3.69µs   max=3.99ms   p(90)=5.18µs   p(95)=5.83µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=2.5µs    min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=207.93ms min=23.86ms med=208.79ms max=396.18ms p(90)=219.93ms p(95)=224.49ms p(99.9)=303.41ms
       { expected_response:true }...: avg=207.93ms min=23.86ms med=208.79ms max=396.18ms p(90)=219.93ms p(95)=224.49ms p(99.9)=303.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28840
     http_req_receiving.............: avg=107.55µs min=39.12µs med=95.76µs  max=72.93ms  p(90)=127.32µs p(95)=140.14µs p(99.9)=1.06ms  
     http_req_sending...............: avg=26.81µs  min=7.23µs  med=19.38µs  max=69.24ms  p(90)=24.34µs  p(95)=26.78µs  p(99.9)=768.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.79ms min=23.71ms med=208.66ms max=395.96ms p(90)=219.78ms p(95)=224.36ms p(99.9)=303.32ms
     http_reqs......................: 28840   234.998179/s
     iteration_duration.............: avg=208.87ms min=59.44ms med=209.14ms max=405.07ms p(90)=220.22ms p(95)=224.77ms p(99.9)=305.4ms 
     iterations.....................: 28740   234.183345/s
     success_rate...................: 100.00% ✓ 28740      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84615      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.99µs   min=1.68µs  med=3.84µs   max=4.34ms   p(90)=5.3µs    p(95)=5.92µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.85µs   min=0s      med=0s       max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=211.93ms min=18.86ms med=196.53ms max=851.81ms p(90)=263.72ms p(95)=305.79ms p(99.9)=706.02ms
       { expected_response:true }...: avg=211.93ms min=18.86ms med=196.53ms max=851.81ms p(90)=263.72ms p(95)=305.79ms p(99.9)=706.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28305
     http_req_receiving.............: avg=103.78µs min=40.24µs med=95.2µs   max=48.04ms  p(90)=127.01µs p(95)=139.55µs p(99.9)=1.65ms  
     http_req_sending...............: avg=26.82µs  min=6.91µs  med=19.26µs  max=66.08ms  p(90)=24.02µs  p(95)=26.32µs  p(99.9)=452.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.8ms  min=18.72ms med=196.42ms max=851.69ms p(90)=263.59ms p(95)=305.67ms p(99.9)=705.91ms
     http_reqs......................: 28305   231.560501/s
     iteration_duration.............: avg=212.91ms min=45.04ms med=196.98ms max=852.05ms p(90)=264.28ms p(95)=307.05ms p(99.9)=706.31ms
     iterations.....................: 28205   230.74241/s
     success_rate...................: 100.00% ✓ 28205      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7968      ✗ 0   
     data_received..................: 264 MB  2.1 MB/s
     data_sent......................: 3.3 MB  26 kB/s
     http_req_blocked...............: avg=44.96µs  min=1.46µs   med=3.77µs  max=4.07ms p(90)=5.37µs   p(95)=6.21µs   p(99.9)=3.88ms
     http_req_connecting............: avg=40.41µs  min=0s       med=0s      max=4.05ms p(90)=0s       p(95)=0s       p(99.9)=3.84ms
     http_req_duration..............: avg=2.19s    min=39.18ms  med=2.26s   max=3.89s  p(90)=2.89s    p(95)=3.04s    p(99.9)=3.69s 
       { expected_response:true }...: avg=2.19s    min=39.18ms  med=2.26s   max=3.89s  p(90)=2.89s    p(95)=3.04s    p(99.9)=3.69s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2756
     http_req_receiving.............: avg=108.11µs min=34.7µs   med=98.86µs max=5.82ms p(90)=140.79µs p(95)=158.36µs p(99.9)=1.74ms
     http_req_sending...............: avg=36.2µs   min=6.85µs   med=20.14µs max=3.66ms p(90)=25.32µs  p(95)=29.28µs  p(99.9)=1.47ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.19s    min=39.02ms  med=2.26s   max=3.89s  p(90)=2.89s    p(95)=3.04s    p(99.9)=3.69s 
     http_reqs......................: 2756    21.727019/s
     iteration_duration.............: avg=2.27s    min=202.52ms med=2.29s   max=3.89s  p(90)=2.9s     p(95)=3.05s    p(99.9)=3.69s 
     iterations.....................: 2656    20.938665/s
     success_rate...................: 100.00% ✓ 2656      ✗ 0   
     vus............................: 45      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB (observed in 81 run metadata entries)
- Benchmark hardware #2: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=119 GB (observed in 9 run metadata entries)

