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
| fusion | 16.6.6 | 1,905 | 1,949 | 1,893 | 1.1% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 1,880 | 1,936 | 1,869 | 1.1% |  |
| fusion-nightly | 16.7.0-p.6 | 1,862 | 1,912 | 1,857 | 1.0% |  |
| hive-router | v0.0.84 | 1,823 | 1,900 | 1,813 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 1,811 | 1,862 | 1,800 | 1.1% |  |
| grafbase | 0.53.5 | 1,281 | 1,314 | 1,272 | 1.1% |  |
| cosmo | 0.334.0 | 1,182 | 1,226 | 1,174 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 548 | 574 | 545 | 1.7% |  |
| apollo-router | v2.16.1 | 436 | 453 | 433 | 1.5% |  |
| apollo-gateway | 2.14.3 | 267 | 269 | 267 | 0.3% |  |
| hive-gateway | 2.10.8 | 254 | 265 | 254 | 1.7% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 21 | 3.0% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 696561      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=2.76µs   min=882ns   med=1.94µs  max=3.61ms   p(90)=3.65µs  p(95)=4.4µs   p(99.9)=31.93µs
     http_req_connecting............: avg=383ns    min=0s      med=0s      max=3.57ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.62ms  min=17.14ms med=25.03ms max=297.36ms p(90)=29.94ms p(95)=31.78ms p(99.9)=48.63ms
       { expected_response:true }...: avg=25.62ms  min=17.14ms med=25.03ms max=297.36ms p(90)=29.94ms p(95)=31.78ms p(99.9)=48.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232287
     http_req_receiving.............: avg=292.78µs min=50.24µs med=93.51µs max=186.7ms  p(90)=726.4µs p(95)=1.2ms   p(99.9)=7.67ms 
     http_req_sending...............: avg=32.13µs  min=4.47µs  med=8.27µs  max=161.28ms p(90)=18.69µs p(95)=30.35µs p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.29ms  min=17.05ms med=24.72ms max=296.75ms p(90)=29.55ms p(95)=31.35ms p(99.9)=46.87ms
     http_reqs......................: 232287  1905.086962/s
     iteration_duration.............: avg=25.83ms  min=17.3ms  med=25.23ms max=308.29ms p(90)=30.14ms p(95)=31.98ms p(99.9)=48.95ms
     iterations.....................: 232187  1904.266819/s
     success_rate...................: 100.00% ✓ 232187      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687468      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=3.44µs   min=902ns   med=1.94µs  max=8.3ms    p(90)=3.67µs  p(95)=4.4µs   p(99.9)=28.86µs
     http_req_connecting............: avg=1.02µs   min=0s      med=0s      max=8.26ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.95ms  min=17.3ms  med=25.42ms max=301.68ms p(90)=30.06ms p(95)=31.77ms p(99.9)=48.68ms
       { expected_response:true }...: avg=25.95ms  min=17.3ms  med=25.42ms max=301.68ms p(90)=30.06ms p(95)=31.77ms p(99.9)=48.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229256
     http_req_receiving.............: avg=404.06µs min=50.24µs med=93.56µs max=135.9ms  p(90)=1.18ms  p(95)=1.88ms  p(99.9)=10.08ms
     http_req_sending...............: avg=30.94µs  min=4.15µs  med=8.19µs  max=202.52ms p(90)=18.62µs p(95)=34.85µs p(99.9)=1.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.52ms  min=17.22ms med=25.01ms max=300.59ms p(90)=29.47ms p(95)=31.1ms  p(99.9)=46.72ms
     http_reqs......................: 229256  1880.409669/s
     iteration_duration.............: avg=26.17ms  min=17.47ms med=25.63ms max=315.15ms p(90)=30.26ms p(95)=31.97ms p(99.9)=49.05ms
     iterations.....................: 229156  1879.589446/s
     success_rate...................: 100.00% ✓ 229156      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681018      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.35µs   min=992ns   med=2.53µs  max=9.89ms   p(90)=4.18µs   p(95)=4.91µs  p(99.9)=33.44µs
     http_req_connecting............: avg=406ns    min=0s      med=0s      max=3.52ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.2ms   min=17.22ms med=25.57ms max=312.98ms p(90)=30.75ms  p(95)=32.63ms p(99.9)=51.53ms
       { expected_response:true }...: avg=26.2ms   min=17.22ms med=25.57ms max=312.98ms p(90)=30.75ms  p(95)=32.63ms p(99.9)=51.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227106
     http_req_receiving.............: avg=315.85µs min=50.65µs med=99.48µs max=149.84ms p(90)=791.13µs p(95)=1.28ms  p(99.9)=8.17ms 
     http_req_sending...............: avg=33.5µs   min=4.64µs  med=9.71µs  max=123.35ms p(90)=19.22µs  p(95)=60.38µs p(99.9)=1.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.85ms  min=17.12ms med=25.24ms max=298.22ms p(90)=30.33ms  p(95)=32.16ms p(99.9)=50.13ms
     http_reqs......................: 227106  1862.44144/s
     iteration_duration.............: avg=26.42ms  min=17.45ms med=25.78ms max=324.53ms p(90)=30.96ms  p(95)=32.85ms p(99.9)=51.88ms
     iterations.....................: 227006  1861.621364/s
     success_rate...................: 100.00% ✓ 227006      ✗ 0     
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

     checks.........................: 100.00% ✓ 666627      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=3.3µs   min=952ns   med=2.52µs  max=4.14ms   p(90)=4.11µs  p(95)=4.8µs    p(99.9)=36.17µs
     http_req_connecting............: avg=440ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.77ms min=18.19ms med=26.35ms max=295.99ms p(90)=30.54ms p(95)=31.99ms  p(99.9)=47.6ms 
       { expected_response:true }...: avg=26.77ms min=18.19ms med=26.35ms max=295.99ms p(90)=30.54ms p(95)=31.99ms  p(99.9)=47.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 222309
     http_req_receiving.............: avg=77.44µs min=27.16µs med=54.03µs max=158.95ms p(90)=94.32µs p(95)=119.08µs p(99.9)=1.79ms 
     http_req_sending...............: avg=31.11µs min=4.92µs  med=10.52µs max=212.82ms p(90)=17.88µs p(95)=25.11µs  p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.66ms min=18.03ms med=26.25ms max=295.75ms p(90)=30.44ms p(95)=31.86ms  p(99.9)=45.85ms
     http_reqs......................: 222309  1823.021424/s
     iteration_duration.............: avg=26.99ms min=18.54ms med=26.55ms max=313.6ms  p(90)=30.75ms p(95)=32.2ms   p(99.9)=48.21ms
     iterations.....................: 222209  1822.201384/s
     success_rate...................: 100.00% ✓ 222209      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 662490      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=2.72µs   min=821ns   med=1.91µs  max=3.35ms   p(90)=3.63µs   p(95)=4.38µs  p(99.9)=26.98µs
     http_req_connecting............: avg=373ns    min=0s      med=0s      max=3.31ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.94ms  min=17.41ms med=26.37ms max=301.6ms  p(90)=31.52ms  p(95)=33.36ms p(99.9)=50.81ms
       { expected_response:true }...: avg=26.94ms  min=17.41ms med=26.37ms max=301.6ms  p(90)=31.52ms  p(95)=33.36ms p(99.9)=50.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220930
     http_req_receiving.............: avg=296.09µs min=49.96µs med=93.45µs max=124.93ms p(90)=734.98µs p(95)=1.22ms  p(99.9)=8.13ms 
     http_req_sending...............: avg=31.93µs  min=4.4µs   med=8.32µs  max=132.37ms p(90)=18.35µs  p(95)=33.68µs p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.61ms  min=16.69ms med=26.05ms max=292.22ms p(90)=31.14ms  p(95)=32.94ms p(99.9)=49.09ms
     http_reqs......................: 220930  1811.287366/s
     iteration_duration.............: avg=27.16ms  min=17.57ms med=26.57ms max=311.59ms p(90)=31.72ms  p(95)=33.56ms p(99.9)=51.25ms
     iterations.....................: 220830  1810.467519/s
     success_rate...................: 100.00% ✓ 220830      ✗ 0     
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

     checks.........................: 100.00% ✓ 468714      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=4.2µs   min=982ns   med=3.01µs  max=3.93ms   p(90)=5.25µs   p(95)=6.23µs   p(99.9)=45.01µs
     http_req_connecting............: avg=648ns   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.12ms min=18.22ms med=37.81ms max=305.6ms  p(90)=44.97ms  p(95)=47.22ms  p(99.9)=65.16ms
       { expected_response:true }...: avg=38.12ms min=18.22ms med=37.81ms max=305.6ms  p(90)=44.97ms  p(95)=47.22ms  p(99.9)=65.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156338
     http_req_receiving.............: avg=112.6µs min=27.76µs med=61.73µs max=178.59ms p(90)=130.71µs p(95)=181.29µs p(99.9)=3.11ms 
     http_req_sending...............: avg=38.58µs min=4.83µs  med=11.53µs max=233.35ms p(90)=25.12µs  p(95)=68.33µs  p(99.9)=1.89ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.97ms min=18.11ms med=37.68ms max=232.05ms p(90)=44.84ms  p(95)=47.07ms  p(99.9)=63.98ms
     http_reqs......................: 156338  1281.559693/s
     iteration_duration.............: avg=38.39ms min=20.76ms med=38.06ms max=318.26ms p(90)=45.2ms   p(95)=47.44ms  p(99.9)=65.67ms
     iterations.....................: 156238  1280.739957/s
     success_rate...................: 100.00% ✓ 156238      ✗ 0     
     vus............................: 1       min=0         max=50  
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

     checks.........................: 100.00% ✓ 432549      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.88µs   min=1.18µs  med=2.87µs  max=3.55ms   p(90)=4.46µs   p(95)=5.18µs   p(99.9)=39.32µs 
     http_req_connecting............: avg=670ns    min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.36ms  min=18.59ms med=40.71ms max=306.48ms p(90)=49.86ms  p(95)=52.81ms  p(99.9)=68.51ms 
       { expected_response:true }...: avg=41.36ms  min=18.59ms med=40.71ms max=306.48ms p(90)=49.86ms  p(95)=52.81ms  p(99.9)=68.51ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144283
     http_req_receiving.............: avg=102.49µs min=27.04µs med=65.71µs max=177.16ms p(90)=108.17µs p(95)=128.11µs p(99.9)=983.67µs
     http_req_sending...............: avg=25.43µs  min=4.96µs  med=11.92µs max=156.23ms p(90)=19.02µs  p(95)=23.21µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.24ms  min=18.44ms med=40.61ms max=159.01ms p(90)=49.75ms  p(95)=52.69ms  p(99.9)=68.03ms 
     http_reqs......................: 144283  1182.758056/s
     iteration_duration.............: avg=41.6ms   min=19.85ms med=40.93ms max=317.25ms p(90)=50.08ms  p(95)=53.02ms  p(99.9)=68.79ms 
     iterations.....................: 144183  1181.938307/s
     success_rate...................: 100.00% ✓ 144183      ✗ 0     
     vus............................: 2       min=0         max=50  
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

     checks.........................: 100.00% ✓ 200961     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   659 kB/s
     http_req_blocked...............: avg=4.4µs   min=1.04µs  med=2.86µs  max=3.5ms    p(90)=4.41µs   p(95)=5.06µs   p(99.9)=48.96µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.22ms min=20.8ms  med=87.44ms max=314.39ms p(90)=113.37ms p(95)=122.75ms p(99.9)=205.42ms
       { expected_response:true }...: avg=89.22ms min=20.8ms  med=87.44ms max=314.39ms p(90)=113.37ms p(95)=122.75ms p(99.9)=205.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67087
     http_req_receiving.............: avg=85.85µs min=30.87µs med=76.47µs max=96.34ms  p(90)=112.6µs  p(95)=126.17µs p(99.9)=649.24µs
     http_req_sending...............: avg=20.6µs  min=5.08µs  med=14.19µs max=66.11ms  p(90)=20.82µs  p(95)=23.01µs  p(99.9)=585.55µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.12ms min=20.71ms med=87.34ms max=313.8ms  p(90)=113.27ms p(95)=122.64ms p(99.9)=205.09ms
     http_reqs......................: 67087   548.725402/s
     iteration_duration.............: avg=89.58ms min=31.49ms med=87.72ms max=345.92ms p(90)=113.63ms p(95)=123.05ms p(99.9)=207.87ms
     iterations.....................: 66987   547.907471/s
     success_rate...................: 100.00% ✓ 66987      ✗ 0    
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

     checks.........................: 100.00% ✓ 159711     ✗ 0    
     data_received..................: 4.7 GB  38 MB/s
     data_sent......................: 64 MB   524 kB/s
     http_req_blocked...............: avg=5.64µs   min=1.26µs  med=3.77µs   max=3.52ms   p(90)=5.38µs   p(95)=6.02µs   p(99.9)=91.99µs 
     http_req_connecting............: avg=1.61µs   min=0s      med=0s       max=3.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.26ms min=20.61ms med=110.52ms max=348.23ms p(90)=139.88ms p(95)=149.02ms p(99.9)=189.07ms
       { expected_response:true }...: avg=112.26ms min=20.61ms med=110.52ms max=348.23ms p(90)=139.88ms p(95)=149.02ms p(99.9)=189.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53337
     http_req_receiving.............: avg=92.44µs  min=31.2µs  med=87.53µs  max=36.66ms  p(90)=120.34µs p(95)=133.08µs p(99.9)=534.47µs
     http_req_sending...............: avg=25.75µs  min=6.48µs  med=17.96µs  max=122.31ms p(90)=23.71µs  p(95)=25.85µs  p(99.9)=595.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.14ms min=20.49ms med=110.4ms  max=347.69ms p(90)=139.77ms p(95)=148.92ms p(99.9)=187.73ms
     http_reqs......................: 53337   436.051104/s
     iteration_duration.............: avg=112.73ms min=41.1ms  med=110.84ms max=357.19ms p(90)=140.19ms p(95)=149.33ms p(99.9)=190.87ms
     iterations.....................: 53237   435.233564/s
     success_rate...................: 100.00% ✓ 53237      ✗ 0    
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

     checks.........................: 100.00% ✓ 98136      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.67µs   min=1.13µs  med=3.31µs   max=3.63ms   p(90)=4.7µs    p(95)=5.28µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=3.04µs   min=0s      med=0s       max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=182.74ms min=23.34ms med=187.71ms max=401.25ms p(90)=195.81ms p(95)=199.58ms p(99.9)=269.56ms
       { expected_response:true }...: avg=182.74ms min=23.34ms med=187.71ms max=401.25ms p(90)=195.81ms p(95)=199.58ms p(99.9)=269.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32812
     http_req_receiving.............: avg=159.53µs min=30.15µs med=88.77µs  max=185.71ms p(90)=119.91µs p(95)=132.41µs p(99.9)=1.06ms  
     http_req_sending...............: avg=30.56µs  min=5.55µs  med=17.88µs  max=162.18ms p(90)=22.97µs  p(95)=24.85µs  p(99.9)=634.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.55ms min=23.21ms med=187.59ms max=387.56ms p(90)=195.7ms  p(95)=199.46ms p(99.9)=264.39ms
     http_reqs......................: 32812   267.510945/s
     iteration_duration.............: avg=183.53ms min=50.75ms med=187.99ms max=411.06ms p(90)=196.1ms  p(95)=199.88ms p(99.9)=278.66ms
     iterations.....................: 32712   266.695661/s
     success_rate...................: 100.00% ✓ 32712      ✗ 0    
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

     checks.........................: 100.00% ✓ 92859      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=6.34µs   min=1.14µs  med=3.25µs   max=3.65ms   p(90)=4.65µs   p(95)=5.18µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=193.14ms min=18.25ms med=181.29ms max=620.08ms p(90)=229.19ms p(95)=266.87ms p(99.9)=576.88ms
       { expected_response:true }...: avg=193.14ms min=18.25ms med=181.29ms max=620.08ms p(90)=229.19ms p(95)=266.87ms p(99.9)=576.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31053
     http_req_receiving.............: avg=92µs     min=33.64µs med=89.09µs  max=9.05ms   p(90)=119.48µs p(95)=131.68µs p(99.9)=467.08µs
     http_req_sending...............: avg=27.11µs  min=5.33µs  med=16.89µs  max=66.5ms   p(90)=21.34µs  p(95)=23.08µs  p(99.9)=698.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.02ms min=18.15ms med=181.17ms max=619.95ms p(90)=229.06ms p(95)=266.79ms p(99.9)=576.75ms
     http_reqs......................: 31053   254.305488/s
     iteration_duration.............: avg=193.98ms min=63.58ms med=181.69ms max=620.33ms p(90)=229.53ms p(95)=267.79ms p(99.9)=577.21ms
     iterations.....................: 30953   253.486548/s
     success_rate...................: 100.00% ✓ 30953      ✗ 0    
     vus............................: 34      min=0        max=50 
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

     checks.........................: 100.00% ✓ 8322      ✗ 0   
     data_received..................: 275 MB  2.2 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=80.19µs  min=1.49µs   med=3.99µs  max=7.84ms   p(90)=5.72µs   p(95)=6.52µs   p(99.9)=7.25ms 
     http_req_connecting............: avg=72.75µs  min=0s       med=0s      max=7.8ms    p(90)=0s       p(95)=0s       p(99.9)=7.19ms 
     http_req_duration..............: avg=2.1s     min=39.71ms  med=2.16s   max=4.46s    p(90)=2.73s    p(95)=2.94s    p(99.9)=3.77s  
       { expected_response:true }...: avg=2.1s     min=39.71ms  med=2.16s   max=4.46s    p(90)=2.73s    p(95)=2.94s    p(99.9)=3.77s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2874
     http_req_receiving.............: avg=103.48µs min=37.22µs  med=98.78µs max=417.54µs p(90)=139.93µs p(95)=158.33µs p(99.9)=340.6µs
     http_req_sending...............: avg=113.14µs min=8.51µs   med=20.13µs max=84.76ms  p(90)=25.48µs  p(95)=28.8µs   p(99.9)=29.16ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.1s     min=39.6ms   med=2.16s   max=4.46s    p(90)=2.73s    p(95)=2.94s    p(99.9)=3.77s  
     http_reqs......................: 2874    22.727025/s
     iteration_duration.............: avg=2.17s    min=273.72ms med=2.18s   max=4.47s    p(90)=2.74s    p(95)=2.94s    p(99.9)=3.78s  
     iterations.....................: 2774    21.936245/s
     success_rate...................: 100.00% ✓ 2774      ✗ 0   
     vus............................: 29      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

