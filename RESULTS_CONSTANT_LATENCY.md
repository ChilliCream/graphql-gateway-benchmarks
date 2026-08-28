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
| fusion-nightly | 16.6.2-p.8 | 1,887 | 1,940 | 1,881 | 1.0% |  |
| fusion-nightly-net11 | 16.6.2-p.8 | 1,883 | 1,933 | 1,870 | 1.1% |  |
| fusion | 16.6.1 | 1,865 | 1,916 | 1,854 | 1.1% |  |
| hive-router | v0.0.84 | 1,835 | 1,910 | 1,825 | 1.6% |  |
| fusion-nightly-fed | 16.6.2-p.8 | 1,812 | 1,862 | 1,798 | 1.1% |  |
| grafbase | 0.53.5 | 1,287 | 1,324 | 1,278 | 1.2% |  |
| cosmo | 0.334.0 | 1,169 | 1,220 | 1,159 | 1.8% |  |
| hive-gateway-router-runtime | 2.10.8 | 561 | 578 | 559 | 1.1% |  |
| apollo-router | v2.16.1 | 433 | 451 | 430 | 1.5% |  |
| apollo-gateway | 2.14.3 | 266 | 268 | 264 | 0.4% |  |
| hive-gateway | 2.10.8 | 259 | 266 | 258 | 1.1% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 4.3% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690306      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.85µs   min=842ns   med=1.96µs  max=6.69ms   p(90)=3.68µs   p(95)=4.45µs  p(99.9)=28.11µs
     http_req_connecting............: avg=426ns    min=0s      med=0s      max=3.48ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.85ms  min=17.17ms med=25.29ms max=301.36ms p(90)=30.2ms   p(95)=31.98ms p(99.9)=48.1ms 
       { expected_response:true }...: avg=25.85ms  min=17.17ms med=25.29ms max=301.36ms p(90)=30.2ms   p(95)=31.98ms p(99.9)=48.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 230202
     http_req_receiving.............: avg=303.07µs min=49.93µs med=90.72µs max=107.07ms p(90)=772.06µs p(95)=1.27ms  p(99.9)=7.87ms 
     http_req_sending...............: avg=30.14µs  min=4.43µs  med=8.27µs  max=105.14ms p(90)=18.24µs  p(95)=29.74µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.52ms  min=17.09ms med=24.97ms max=300.82ms p(90)=29.8ms   p(95)=31.54ms p(99.9)=46.58ms
     http_reqs......................: 230202  1887.989205/s
     iteration_duration.............: avg=26.06ms  min=17.3ms  med=25.49ms max=317.17ms p(90)=30.4ms   p(95)=32.18ms p(99.9)=48.55ms
     iterations.....................: 230102  1887.169061/s
     success_rate...................: 100.00% ✓ 230102      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688413      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=3.38µs   min=1.02µs  med=2.51µs  max=11.16ms  p(90)=4.07µs   p(95)=4.76µs  p(99.9)=36.63µs
     http_req_connecting............: avg=436ns    min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.92ms  min=16.99ms med=25.32ms max=304.97ms p(90)=30.23ms  p(95)=32.11ms p(99.9)=49.28ms
       { expected_response:true }...: avg=25.92ms  min=16.99ms med=25.32ms max=304.97ms p(90)=30.23ms  p(95)=32.11ms p(99.9)=49.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229571
     http_req_receiving.............: avg=275.49µs min=50µs    med=93.1µs  max=128.45ms p(90)=664.47µs p(95)=1.16ms  p(99.9)=7.21ms 
     http_req_sending...............: avg=34.96µs  min=4.47µs  med=9.6µs   max=157.69ms p(90)=19.3µs   p(95)=35.66µs p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.61ms  min=16.8ms  med=25.03ms max=304.63ms p(90)=29.86ms  p(95)=31.69ms p(99.9)=48.12ms
     http_reqs......................: 229571  1883.046105/s
     iteration_duration.............: avg=26.13ms  min=17.18ms med=25.53ms max=314.32ms p(90)=30.44ms  p(95)=32.31ms p(99.9)=49.69ms
     iterations.....................: 229471  1882.225859/s
     success_rate...................: 100.00% ✓ 229471      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681981      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.41µs   min=1.02µs  med=2.62µs  max=3.85ms   p(90)=4.27µs   p(95)=5.01µs  p(99.9)=36.48µs
     http_req_connecting............: avg=400ns    min=0s      med=0s      max=3.81ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.16ms  min=17.31ms med=25.53ms max=289.1ms  p(90)=30.68ms  p(95)=32.61ms p(99.9)=50.51ms
       { expected_response:true }...: avg=26.16ms  min=17.31ms med=25.53ms max=289.1ms  p(90)=30.68ms  p(95)=32.61ms p(99.9)=50.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227427
     http_req_receiving.............: avg=316.22µs min=51.85µs med=99.74µs max=212.66ms p(90)=781.75µs p(95)=1.27ms  p(99.9)=8.66ms 
     http_req_sending...............: avg=35.33µs  min=4.51µs  med=9.68µs  max=146.35ms p(90)=18.9µs   p(95)=36.37µs p(99.9)=1.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.81ms  min=17.21ms med=25.2ms  max=288.87ms p(90)=30.27ms  p(95)=32.17ms p(99.9)=48.82ms
     http_reqs......................: 227427  1865.170218/s
     iteration_duration.............: avg=26.38ms  min=17.55ms med=25.74ms max=313.7ms  p(90)=30.89ms  p(95)=32.83ms p(99.9)=50.83ms
     iterations.....................: 227327  1864.350099/s
     success_rate...................: 100.00% ✓ 227327      ✗ 0     
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

     checks.........................: 100.00% ✓ 671346      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.9µs   min=882ns   med=2.09µs  max=4.17ms   p(90)=3.67µs  p(95)=4.37µs   p(99.9)=29.3µs 
     http_req_connecting............: avg=415ns   min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.59ms min=18.27ms med=26.19ms max=301.12ms p(90)=30.29ms p(95)=31.69ms  p(99.9)=45.94ms
       { expected_response:true }...: avg=26.59ms min=18.27ms med=26.19ms max=301.12ms p(90)=30.29ms p(95)=31.69ms  p(99.9)=45.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223882
     http_req_receiving.............: avg=73.08µs min=24.69µs med=49.23µs max=180.06ms p(90)=90.36µs p(95)=114.61µs p(99.9)=1.58ms 
     http_req_sending...............: avg=27.91µs min=4.71µs  med=9.02µs  max=156.64ms p(90)=16.83µs p(95)=23.18µs  p(99.9)=1.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.49ms min=18.12ms med=26.1ms  max=295ms    p(90)=30.19ms p(95)=31.57ms  p(99.9)=44.06ms
     http_reqs......................: 223882  1835.925092/s
     iteration_duration.............: avg=26.8ms  min=18.76ms med=26.38ms max=320.19ms p(90)=30.49ms p(95)=31.88ms  p(99.9)=46.41ms
     iterations.....................: 223782  1835.10505/s
     success_rate...................: 100.00% ✓ 223782      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 663012      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=3.49µs   min=1µs     med=2.64µs  max=7.64ms   p(90)=4.39µs   p(95)=5.17µs  p(99.9)=36.72µs
     http_req_connecting............: avg=428ns    min=0s      med=0s      max=4.23ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.91ms  min=17.81ms med=26.29ms max=309.94ms p(90)=31.51ms  p(95)=33.44ms p(99.9)=51.66ms
       { expected_response:true }...: avg=26.91ms  min=17.81ms med=26.29ms max=309.94ms p(90)=31.51ms  p(95)=33.44ms p(99.9)=51.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221104
     http_req_receiving.............: avg=307.43µs min=52.03µs med=98.55µs max=214.44ms p(90)=737.32µs p(95)=1.25ms  p(99.9)=9.03ms 
     http_req_sending...............: avg=34.92µs  min=4.8µs   med=10.01µs max=165.73ms p(90)=20.03µs  p(95)=37.35µs p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.57ms  min=17.73ms med=25.97ms max=300.39ms p(90)=31.11ms  p(95)=33ms    p(99.9)=49.93ms
     http_reqs......................: 221104  1812.825559/s
     iteration_duration.............: avg=27.13ms  min=17.97ms med=26.5ms  max=320.55ms p(90)=31.72ms  p(95)=33.65ms p(99.9)=52.08ms
     iterations.....................: 221004  1812.005662/s
     success_rate...................: 100.00% ✓ 221004      ✗ 0     
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

     checks.........................: 100.00% ✓ 470997      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=3.38µs  min=821ns   med=2.12µs  max=4.53ms   p(90)=4.47µs   p(95)=5.46µs   p(99.9)=42.52µs
     http_req_connecting............: avg=663ns   min=0s      med=0s      max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.96ms min=18.13ms med=37.67ms max=312.62ms p(90)=44.55ms  p(95)=46.56ms  p(99.9)=63.87ms
       { expected_response:true }...: avg=37.96ms min=18.13ms med=37.67ms max=312.62ms p(90)=44.55ms  p(95)=46.56ms  p(99.9)=63.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157099
     http_req_receiving.............: avg=85.82µs min=26.58µs med=54.41µs max=219.5ms  p(90)=122.11µs p(95)=164.26µs p(99.9)=1.86ms 
     http_req_sending...............: avg=34.06µs min=4.34µs  med=8.89µs  max=136.35ms p(90)=22.95µs  p(95)=39.41µs  p(99.9)=1.9ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.84ms min=18.01ms med=37.57ms max=312.08ms p(90)=44.43ms  p(95)=46.43ms  p(99.9)=62.89ms
     http_reqs......................: 157099  1287.80131/s
     iteration_duration.............: avg=38.21ms min=21.61ms med=37.9ms  max=323.57ms p(90)=44.76ms  p(95)=46.77ms  p(99.9)=64.15ms
     iterations.....................: 156999  1286.981571/s
     success_rate...................: 100.00% ✓ 156999      ✗ 0     
     vus............................: 7       min=0         max=50  
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

     checks.........................: 100.00% ✓ 427710      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.94µs  min=1.13µs  med=2.93µs  max=4.46ms   p(90)=4.56µs   p(95)=5.29µs   p(99.9)=36.73µs 
     http_req_connecting............: avg=695ns   min=0s      med=0s      max=4.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.83ms min=18.56ms med=41.21ms max=322.82ms p(90)=50.58ms  p(95)=53.53ms  p(99.9)=68.84ms 
       { expected_response:true }...: avg=41.83ms min=18.56ms med=41.21ms max=322.82ms p(90)=50.58ms  p(95)=53.53ms  p(99.9)=68.84ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142670
     http_req_receiving.............: avg=83.58µs min=27.65µs med=67.09µs max=166.95ms p(90)=109.67µs p(95)=128.85µs p(99.9)=988.83µs
     http_req_sending...............: avg=28.37µs min=5.2µs   med=12.3µs  max=174.37ms p(90)=19.28µs  p(95)=23.36µs  p(99.9)=1.04ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.72ms min=18.41ms med=41.11ms max=322.13ms p(90)=50.47ms  p(95)=53.41ms  p(99.9)=68.38ms 
     http_reqs......................: 142670  1169.434549/s
     iteration_duration.............: avg=42.07ms min=23.57ms med=41.43ms max=336.35ms p(90)=50.79ms  p(95)=53.75ms  p(99.9)=69.14ms 
     iterations.....................: 142570  1168.614871/s
     success_rate...................: 100.00% ✓ 142570      ✗ 0     
     vus............................: 23      min=0         max=50  
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

     checks.........................: 100.00% ✓ 205647     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   674 kB/s
     http_req_blocked...............: avg=4.13µs  min=982ns   med=2.5µs   max=4.25ms   p(90)=4.06µs   p(95)=4.67µs   p(99.9)=49.03µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.21ms min=20.51ms med=85.79ms max=325.28ms p(90)=102.98ms p(95)=111.21ms p(99.9)=205ms   
       { expected_response:true }...: avg=87.21ms min=20.51ms med=85.79ms max=325.28ms p(90)=102.98ms p(95)=111.21ms p(99.9)=205ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 68649
     http_req_receiving.............: avg=82.33µs min=28.28µs med=71.53µs max=208.4ms  p(90)=108.1µs  p(95)=120.92µs p(99.9)=637.78µs
     http_req_sending...............: avg=26.77µs min=4.78µs  med=12.89µs max=158.28ms p(90)=19.87µs  p(95)=22.11µs  p(99.9)=585.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.1ms  min=20.35ms med=85.7ms  max=324.68ms p(90)=102.87ms p(95)=111.08ms p(99.9)=204.73ms
     http_reqs......................: 68649   561.345521/s
     iteration_duration.............: avg=87.55ms min=28.88ms med=86.03ms max=340.5ms  p(90)=103.22ms p(95)=111.48ms p(99.9)=206.59ms
     iterations.....................: 68549   560.527817/s
     success_rate...................: 100.00% ✓ 68549      ✗ 0    
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

     checks.........................: 100.00% ✓ 158961     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   521 kB/s
     http_req_blocked...............: avg=5.24µs   min=1.1µs   med=3.18µs   max=4.25ms   p(90)=4.71µs   p(95)=5.3µs    p(99.9)=121.01µs
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.8ms  min=21.11ms med=110.95ms max=346.71ms p(90)=140.56ms p(95)=150.04ms p(99.9)=191.08ms
       { expected_response:true }...: avg=112.8ms  min=21.11ms med=110.95ms max=346.71ms p(90)=140.56ms p(95)=150.04ms p(99.9)=191.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53087
     http_req_receiving.............: avg=91.72µs  min=27.5µs  med=85.73µs  max=95.92ms  p(90)=116.76µs p(95)=129.2µs  p(99.9)=511.3µs 
     http_req_sending...............: avg=25.44µs  min=5.06µs  med=17.17µs  max=100.74ms p(90)=22.69µs  p(95)=24.71µs  p(99.9)=512.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.68ms min=21.01ms med=110.85ms max=346.03ms p(90)=140.44ms p(95)=149.93ms p(99.9)=190.81ms
     http_reqs......................: 53087   433.987614/s
     iteration_duration.............: avg=113.25ms min=23.74ms med=111.25ms max=365.82ms p(90)=140.85ms p(95)=150.34ms p(99.9)=195.13ms
     iterations.....................: 52987   433.170111/s
     success_rate...................: 100.00% ✓ 52987      ✗ 0    
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

     checks.........................: 100.00% ✓ 97668      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.4µs    min=1.17µs  med=3.28µs   max=4.04ms   p(90)=4.76µs   p(95)=5.35µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.84µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=183.57ms min=23.02ms med=183.95ms max=391.88ms p(90)=195.21ms p(95)=200.11ms p(99.9)=269.34ms
       { expected_response:true }...: avg=183.57ms min=23.02ms med=183.95ms max=391.88ms p(90)=195.21ms p(95)=200.11ms p(99.9)=269.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32656
     http_req_receiving.............: avg=100.61µs min=32.18µs med=89.78µs  max=124ms    p(90)=120.82µs p(95)=133.95µs p(99.9)=538.86µs
     http_req_sending...............: avg=29.76µs  min=4.96µs  med=17.36µs  max=108.66ms p(90)=22.17µs  p(95)=24.04µs  p(99.9)=564.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.44ms min=22.84ms med=183.82ms max=391.36ms p(90)=195.09ms p(95)=199.99ms p(99.9)=268.9ms 
     http_reqs......................: 32656   266.326671/s
     iteration_duration.............: avg=184.39ms min=57.33ms med=184.31ms max=409.08ms p(90)=195.52ms p(95)=200.43ms p(99.9)=278.98ms
     iterations.....................: 32556   265.511119/s
     success_rate...................: 100.00% ✓ 32556      ✗ 0    
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

     checks.........................: 100.00% ✓ 94692      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=6.47µs   min=1.14µs  med=3.44µs   max=3.52ms   p(90)=4.94µs   p(95)=5.59µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=189.38ms min=18.56ms med=177.12ms max=717.6ms  p(90)=263.29ms p(95)=301.58ms p(99.9)=658.16ms
       { expected_response:true }...: avg=189.38ms min=18.56ms med=177.12ms max=717.6ms  p(90)=263.29ms p(95)=301.58ms p(99.9)=658.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31664
     http_req_receiving.............: avg=98.25µs  min=31.4µs  med=92.4µs   max=29.15ms  p(90)=123.57µs p(95)=137µs    p(99.9)=782.26µs
     http_req_sending...............: avg=27.2µs   min=5.5µs   med=18.18µs  max=65.16ms  p(90)=23.13µs  p(95)=25.15µs  p(99.9)=557.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.26ms min=18.45ms med=176.99ms max=717.49ms p(90)=263.18ms p(95)=301.48ms p(99.9)=658.04ms
     http_reqs......................: 31664   259.218969/s
     iteration_duration.............: avg=190.21ms min=50.85ms med=177.69ms max=717.85ms p(90)=263.72ms p(95)=302.42ms p(99.9)=658.51ms
     iterations.....................: 31564   258.400314/s
     success_rate...................: 100.00% ✓ 31564      ✗ 0    
     vus............................: 36      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7626      ✗ 0   
     data_received..................: 253 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=83.41µs  min=1.19µs   med=3.53µs  max=8.41ms p(90)=5.11µs   p(95)=5.96µs   p(99.9)=7.96ms  
     http_req_connecting............: avg=77.9µs   min=0s       med=0s      max=8.24ms p(90)=0s       p(95)=0s       p(99.9)=7.9ms   
     http_req_duration..............: avg=2.29s    min=39.28ms  med=2.3s    max=5.23s  p(90)=3.05s    p(95)=3.46s    p(99.9)=5s      
       { expected_response:true }...: avg=2.29s    min=39.28ms  med=2.3s    max=5.23s  p(90)=3.05s    p(95)=3.46s    p(99.9)=5s      
     http_req_failed................: 0.00%   ✓ 0         ✗ 2642
     http_req_receiving.............: avg=103.09µs min=32.97µs  med=97.31µs max=1.58ms p(90)=139.01µs p(95)=155.37µs p(99.9)=563.38µs
     http_req_sending...............: avg=39.05µs  min=5.95µs   med=19.83µs max=7.96ms p(90)=24.97µs  p(95)=29.39µs  p(99.9)=2.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.29s    min=39.18ms  med=2.3s    max=5.23s  p(90)=3.05s    p(95)=3.46s    p(99.9)=5s      
     http_reqs......................: 2642    20.851436/s
     iteration_duration.............: avg=2.37s    min=232.19ms med=2.32s   max=5.23s  p(90)=3.07s    p(95)=3.48s    p(99.9)=5.03s   
     iterations.....................: 2542    20.062207/s
     success_rate...................: 100.00% ✓ 2542      ✗ 0   
     vus............................: 34      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

