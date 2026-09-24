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
| fusion-nightly | 16.7.0-p.10 | 1,881 | 1,930 | 1,873 | 1.0% |  |
| fusion-nightly-net11 | 16.7.0-p.10 | 1,879 | 1,928 | 1,869 | 1.0% |  |
| fusion | 16.6.6 | 1,874 | 1,930 | 1,871 | 1.1% |  |
| hive-router | v0.0.84 | 1,854 | 1,917 | 1,846 | 1.3% |  |
| fusion-nightly-fed | 16.7.0-p.10 | 1,811 | 1,851 | 1,796 | 1.0% |  |
| grafbase | 0.53.5 | 1,288 | 1,320 | 1,282 | 1.0% |  |
| cosmo | 0.334.0 | 1,163 | 1,212 | 1,158 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 554 | 576 | 552 | 1.4% |  |
| apollo-router | v2.16.1 | 436 | 452 | 432 | 1.7% |  |
| apollo-gateway | 2.14.3 | 259 | 264 | 258 | 0.8% |  |
| hive-gateway | 2.10.8 | 255 | 262 | 253 | 1.1% |  |
| feddi | 5ff8b6165878 | 19 | 20 | 19 | 1.8% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688095      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.77µs   min=831ns   med=1.94µs  max=4.09ms   p(90)=3.63µs  p(95)=4.34µs  p(99.9)=32.09µs
     http_req_connecting............: avg=399ns    min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.93ms  min=17.51ms med=25.35ms max=294.32ms p(90)=30.33ms p(95)=32.12ms p(99.9)=49.59ms
       { expected_response:true }...: avg=25.93ms  min=17.51ms med=25.35ms max=294.32ms p(90)=30.33ms p(95)=32.12ms p(99.9)=49.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229465
     http_req_receiving.............: avg=297.18µs min=50.15µs med=92.41µs max=123ms    p(90)=747.1µs p(95)=1.24ms  p(99.9)=7.73ms 
     http_req_sending...............: avg=30.53µs  min=4.44µs  med=8.27µs  max=66.67ms  p(90)=18.36µs p(95)=32.96µs p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.6ms   min=17.4ms  med=25.04ms max=293.88ms p(90)=29.93ms p(95)=31.7ms  p(99.9)=48.08ms
     http_reqs......................: 229465  1881.837861/s
     iteration_duration.............: avg=26.15ms  min=17.71ms med=25.55ms max=315.91ms p(90)=30.53ms p(95)=32.32ms p(99.9)=49.97ms
     iterations.....................: 229365  1881.017763/s
     success_rate...................: 100.00% ✓ 229365      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687081      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.22µs  min=1.01µs  med=2.42µs  max=10.42ms  p(90)=4.15µs  p(95)=4.91µs  p(99.9)=36.23µs
     http_req_connecting............: avg=288ns   min=0s      med=0s      max=2.92ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.96ms min=17.17ms med=25.38ms max=311.27ms p(90)=30.23ms p(95)=32.05ms p(99.9)=51.06ms
       { expected_response:true }...: avg=25.96ms min=17.17ms med=25.38ms max=311.27ms p(90)=30.23ms p(95)=32.05ms p(99.9)=51.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229127
     http_req_receiving.............: avg=400µs   min=50.24µs med=93.83µs max=181.31ms p(90)=1.13ms  p(95)=1.9ms   p(99.9)=11.59ms
     http_req_sending...............: avg=34.51µs min=4.67µs  med=9.11µs  max=149.72ms p(90)=18.93µs p(95)=61.24µs p(99.9)=1.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.53ms min=17.09ms med=24.98ms max=291.65ms p(90)=29.64ms p(95)=31.38ms p(99.9)=48.86ms
     http_reqs......................: 229127  1879.610902/s
     iteration_duration.............: avg=26.18ms min=17.34ms med=25.59ms max=320.94ms p(90)=30.44ms p(95)=32.26ms p(99.9)=51.39ms
     iterations.....................: 229027  1878.790566/s
     success_rate...................: 100.00% ✓ 229027      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685254      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.04µs   min=872ns   med=2.15µs  max=4.27ms   p(90)=3.89µs   p(95)=4.63µs  p(99.9)=32.93µs
     http_req_connecting............: avg=445ns    min=0s      med=0s      max=4.23ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.04ms  min=17.22ms med=25.44ms max=289.98ms p(90)=30.47ms  p(95)=32.3ms  p(99.9)=50ms   
       { expected_response:true }...: avg=26.04ms  min=17.22ms med=25.44ms max=289.98ms p(90)=30.47ms  p(95)=32.3ms  p(99.9)=50ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 228518
     http_req_receiving.............: avg=315.56µs min=50.23µs med=96.77µs max=27.35ms  p(90)=791.81µs p(95)=1.28ms  p(99.9)=8.8ms  
     http_req_sending...............: avg=32.3µs   min=4.44µs  med=8.7µs   max=127.11ms p(90)=18.2µs   p(95)=30.3µs  p(99.9)=1.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.69ms  min=17.12ms med=25.11ms max=289.73ms p(90)=30.06ms  p(95)=31.85ms p(99.9)=48.04ms
     http_reqs......................: 228518  1874.072088/s
     iteration_duration.............: avg=26.26ms  min=17.37ms med=25.64ms max=318.87ms p(90)=30.67ms  p(95)=32.51ms p(99.9)=50.39ms
     iterations.....................: 228418  1873.25199/s
     success_rate...................: 100.00% ✓ 228418      ✗ 0     
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

     checks.........................: 100.00% ✓ 678084      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.32µs  min=1.01µs  med=2.56µs  max=3.47ms   p(90)=4.17µs  p(95)=4.9µs    p(99.9)=40.1µs 
     http_req_connecting............: avg=387ns   min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.31ms min=17.83ms med=25.85ms max=313.09ms p(90)=30.08ms p(95)=31.56ms  p(99.9)=47.93ms
       { expected_response:true }...: avg=26.31ms min=17.83ms med=25.85ms max=313.09ms p(90)=30.08ms p(95)=31.56ms  p(99.9)=47.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226128
     http_req_receiving.............: avg=76.46µs min=25.35µs med=51.4µs  max=32.22ms  p(90)=95.72µs p(95)=125.22µs p(99.9)=1.95ms 
     http_req_sending...............: avg=32.26µs min=4.6µs   med=10.63µs max=61.24ms  p(90)=19.43µs p(95)=28.48µs  p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.2ms  min=17.74ms med=25.75ms max=312.48ms p(90)=29.96ms p(95)=31.43ms  p(99.9)=46.31ms
     http_reqs......................: 226128  1854.296201/s
     iteration_duration.............: avg=26.53ms min=18.58ms med=26.06ms max=321.53ms p(90)=30.29ms p(95)=31.77ms  p(99.9)=48.42ms
     iterations.....................: 226028  1853.47618/s
     success_rate...................: 100.00% ✓ 226028      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 662679      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=2.97µs   min=872ns   med=2.07µs  max=4.17ms   p(90)=3.83µs   p(95)=4.59µs  p(99.9)=30.76µs
     http_req_connecting............: avg=450ns    min=0s      med=0s      max=4.13ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.93ms  min=17.97ms med=26.37ms max=309.99ms p(90)=31.48ms  p(95)=33.33ms p(99.9)=50.18ms
       { expected_response:true }...: avg=26.93ms  min=17.97ms med=26.37ms max=309.99ms p(90)=31.48ms  p(95)=33.33ms p(99.9)=50.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220993
     http_req_receiving.............: avg=294.01µs min=49.17µs med=93.27µs max=100.83ms p(90)=723.25µs p(95)=1.22ms  p(99.9)=8.25ms 
     http_req_sending...............: avg=31.18µs  min=4.56µs  med=8.62µs  max=146.62ms p(90)=18.61µs  p(95)=29.18µs p(99.9)=1.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.61ms  min=17.9ms  med=26.06ms max=309.72ms p(90)=31.1ms   p(95)=32.89ms p(99.9)=48.79ms
     http_reqs......................: 220993  1811.999053/s
     iteration_duration.............: avg=27.15ms  min=18.14ms med=26.57ms max=318.91ms p(90)=31.68ms  p(95)=33.53ms p(99.9)=50.65ms
     iterations.....................: 220893  1811.179118/s
     success_rate...................: 100.00% ✓ 220893      ✗ 0     
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

     checks.........................: 100.00% ✓ 471174      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=4.03µs  min=901ns   med=2.8µs   max=4.07ms   p(90)=5.2µs    p(95)=6.18µs   p(99.9)=45.82µs
     http_req_connecting............: avg=694ns   min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.93ms min=17.8ms  med=37.68ms max=323.32ms p(90)=44.64ms  p(95)=46.7ms   p(99.9)=63.48ms
       { expected_response:true }...: avg=37.93ms min=17.8ms  med=37.68ms max=323.32ms p(90)=44.64ms  p(95)=46.7ms   p(99.9)=63.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157158
     http_req_receiving.............: avg=89.44µs min=26.44µs med=59.42µs max=94.41ms  p(90)=128.12µs p(95)=176.62µs p(99.9)=2.15ms 
     http_req_sending...............: avg=36.32µs min=4.67µs  med=10.55µs max=189.17ms p(90)=24.5µs   p(95)=69.29µs  p(99.9)=2.02ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.8ms  min=17.68ms med=37.57ms max=322.9ms  p(90)=44.51ms  p(95)=46.56ms  p(99.9)=62.49ms
     http_reqs......................: 157158  1288.48744/s
     iteration_duration.............: avg=38.19ms min=20.83ms med=37.92ms max=333.53ms p(90)=44.86ms  p(95)=46.92ms  p(99.9)=63.8ms 
     iterations.....................: 157058  1287.667573/s
     success_rate...................: 100.00% ✓ 157058      ✗ 0     
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

     checks.........................: 100.00% ✓ 425643      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.76µs  min=1.12µs  med=2.84µs  max=3.52ms   p(90)=4.45µs   p(95)=5.18µs   p(99.9)=37.68µs 
     http_req_connecting............: avg=607ns   min=0s      med=0s      max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.03ms min=18.62ms med=41.41ms max=311.77ms p(90)=50.81ms  p(95)=53.84ms  p(99.9)=69.76ms 
       { expected_response:true }...: avg=42.03ms min=18.62ms med=41.41ms max=311.77ms p(90)=50.81ms  p(95)=53.84ms  p(99.9)=69.76ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141981
     http_req_receiving.............: avg=83.94µs min=28.89µs med=67.42µs max=155.09ms p(90)=109.23µs p(95)=128.35µs p(99.9)=991.08µs
     http_req_sending...............: avg=27.02µs min=5.4µs   med=12.35µs max=226.83ms p(90)=19.47µs  p(95)=23.42µs  p(99.9)=989.42µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.92ms min=18.47ms med=41.31ms max=311.12ms p(90)=50.7ms   p(95)=53.72ms  p(99.9)=69.27ms 
     http_reqs......................: 141981  1163.770257/s
     iteration_duration.............: avg=42.28ms min=23.3ms  med=41.63ms max=320.35ms p(90)=51.02ms  p(95)=54.07ms  p(99.9)=70.37ms 
     iterations.....................: 141881  1162.950591/s
     success_rate...................: 100.00% ✓ 141881      ✗ 0     
     vus............................: 27      min=0         max=50  
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

     checks.........................: 100.00% ✓ 203145     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   666 kB/s
     http_req_blocked...............: avg=4.54µs  min=1.02µs  med=2.92µs  max=4.06ms   p(90)=4.5µs    p(95)=5.13µs  p(99.9)=48.23µs 
     http_req_connecting............: avg=1.38µs  min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=88.27ms min=20.61ms med=86.27ms max=337.73ms p(90)=109.24ms p(95)=118.6ms p(99.9)=204.13ms
       { expected_response:true }...: avg=88.27ms min=20.61ms med=86.27ms max=337.73ms p(90)=109.24ms p(95)=118.6ms p(99.9)=204.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67815
     http_req_receiving.............: avg=84.91µs min=29.82µs med=76.52µs max=63.27ms  p(90)=113.1µs  p(95)=126.5µs p(99.9)=683.6µs 
     http_req_sending...............: avg=22.75µs min=5.21µs  med=13.63µs max=112ms    p(90)=20.55µs  p(95)=22.81µs p(99.9)=587.95µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=88.16ms min=20.5ms  med=86.16ms max=337.12ms p(90)=109.12ms p(95)=118.5ms p(99.9)=203.56ms
     http_reqs......................: 67815   554.752699/s
     iteration_duration.............: avg=88.61ms min=33.56ms med=86.52ms max=345.98ms p(90)=109.49ms p(95)=118.9ms p(99.9)=205.69ms
     iterations.....................: 67715   553.93466/s
     success_rate...................: 100.00% ✓ 67715      ✗ 0    
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

     checks.........................: 100.00% ✓ 159897     ✗ 0    
     data_received..................: 4.7 GB  38 MB/s
     data_sent......................: 64 MB   524 kB/s
     http_req_blocked...............: avg=4.85µs   min=1.11µs  med=3.09µs   max=3.35ms   p(90)=4.64µs   p(95)=5.25µs   p(99.9)=57.31µs 
     http_req_connecting............: avg=1.55µs   min=0s      med=0s       max=3.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.14ms min=20.94ms med=110.32ms max=345.1ms  p(90)=139.7ms  p(95)=148.72ms p(99.9)=190.31ms
       { expected_response:true }...: avg=112.14ms min=20.94ms med=110.32ms max=345.1ms  p(90)=139.7ms  p(95)=148.72ms p(99.9)=190.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53399
     http_req_receiving.............: avg=89.56µs  min=30.39µs med=83.08µs  max=64.18ms  p(90)=115.73µs p(95)=128.4µs  p(99.9)=518.9µs 
     http_req_sending...............: avg=23.8µs   min=5.43µs  med=16.75µs  max=95.33ms  p(90)=22.38µs  p(95)=24.34µs  p(99.9)=522.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.03ms min=20.83ms med=110.22ms max=334.46ms p(90)=139.59ms p(95)=148.6ms  p(99.9)=189.92ms
     http_reqs......................: 53399   436.609151/s
     iteration_duration.............: avg=112.59ms min=39.58ms med=110.63ms max=353.23ms p(90)=139.99ms p(95)=149ms    p(99.9)=193.05ms
     iterations.....................: 53299   435.791515/s
     success_rate...................: 100.00% ✓ 53299      ✗ 0    
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

     checks.........................: 100.00% ✓ 95115      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=7.12µs   min=1.38µs  med=3.63µs   max=4.44ms   p(90)=5.11µs   p(95)=5.69µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=3.19µs   min=0s      med=0s       max=4.39ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=188.52ms min=23.16ms med=195.48ms max=377.52ms p(90)=227.77ms p(95)=232.68ms p(99.9)=301.79ms
       { expected_response:true }...: avg=188.52ms min=23.16ms med=195.48ms max=377.52ms p(90)=227.77ms p(95)=232.68ms p(99.9)=301.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31805
     http_req_receiving.............: avg=96.4µs   min=35.85µs med=90.75µs  max=34.45ms  p(90)=123.12µs p(95)=136.41µs p(99.9)=506.61µs
     http_req_sending...............: avg=36.4µs   min=6.15µs  med=18.13µs  max=86.49ms  p(90)=23.26µs  p(95)=25.22µs  p(99.9)=554.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.39ms min=23.05ms med=195.24ms max=368.35ms p(90)=227.64ms p(95)=232.56ms p(99.9)=301.68ms
     http_reqs......................: 31805   259.27207/s
     iteration_duration.............: avg=189.37ms min=50.52ms med=200.69ms max=398.91ms p(90)=228.08ms p(95)=233ms    p(99.9)=304.84ms
     iterations.....................: 31705   258.456877/s
     success_rate...................: 100.00% ✓ 31705      ✗ 0    
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

     checks.........................: 100.00% ✓ 93216      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   306 kB/s
     http_req_blocked...............: avg=6.37µs   min=1.1µs   med=3.13µs   max=4.07ms   p(90)=4.52µs   p(95)=5.08µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=3µs      min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=192.37ms min=18.57ms med=181.66ms max=678.66ms p(90)=223.79ms p(95)=249.4ms  p(99.9)=606.3ms 
       { expected_response:true }...: avg=192.37ms min=18.57ms med=181.66ms max=678.66ms p(90)=223.79ms p(95)=249.4ms  p(99.9)=606.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31172
     http_req_receiving.............: avg=93.58µs  min=29.84µs med=88.21µs  max=55.28ms  p(90)=118.22µs p(95)=129.08µs p(99.9)=510.41µs
     http_req_sending...............: avg=26.39µs  min=4.95µs  med=17.42µs  max=99.24ms  p(90)=21.64µs  p(95)=23.33µs  p(99.9)=534.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.25ms min=18.43ms med=181.55ms max=678.53ms p(90)=223.69ms p(95)=249.3ms  p(99.9)=606.18ms
     http_reqs......................: 31172   255.197898/s
     iteration_duration.............: avg=193.21ms min=51.31ms med=182.08ms max=678.9ms  p(90)=224.18ms p(95)=250.59ms p(99.9)=606.59ms
     iterations.....................: 31072   254.379222/s
     success_rate...................: 100.00% ✓ 31072      ✗ 0    
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

     checks.........................: 100.00% ✓ 7209      ✗ 0   
     data_received..................: 240 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=103.69µs min=1.23µs   med=3.16µs  max=9.18ms  p(90)=4.59µs   p(95)=5.34µs   p(99.9)=9.01ms  
     http_req_connecting............: avg=97.59µs  min=0s       med=0s      max=9.14ms  p(90)=0s       p(95)=0s       p(99.9)=8.97ms  
     http_req_duration..............: avg=2.41s    min=39.03ms  med=2.48s   max=4.52s   p(90)=3.14s    p(95)=3.3s     p(99.9)=4.33s   
       { expected_response:true }...: avg=2.41s    min=39.03ms  med=2.48s   max=4.52s   p(90)=3.14s    p(95)=3.3s     p(99.9)=4.33s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2503
     http_req_receiving.............: avg=98.85µs  min=33.26µs  med=94.17µs max=1.38ms  p(90)=136.56µs p(95)=152.43µs p(99.9)=917.64µs
     http_req_sending...............: avg=63.23µs  min=5.6µs    med=17.8µs  max=22.71ms p(90)=23.3µs   p(95)=26.96µs  p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.41s    min=38.93ms  med=2.48s   max=4.52s   p(90)=3.14s    p(95)=3.3s     p(99.9)=4.33s   
     http_reqs......................: 2503    19.790088/s
     iteration_duration.............: avg=2.51s    min=755.18ms med=2.51s   max=4.52s   p(90)=3.15s    p(95)=3.32s    p(99.9)=4.33s   
     iterations.....................: 2403    18.999433/s
     success_rate...................: 100.00% ✓ 2403      ✗ 0   
     vus............................: 22      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

