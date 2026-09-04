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
| fusion-nightly | 16.7.0-p.2 | 1,894 | 1,940 | 1,886 | 1.0% |  |
| fusion | 16.6.3 | 1,891 | 1,934 | 1,876 | 1.0% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 1,878 | 1,928 | 1,866 | 1.2% |  |
| hive-router | v0.0.84 | 1,823 | 1,904 | 1,811 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 1,796 | 1,865 | 1,791 | 1.4% |  |
| grafbase | 0.53.5 | 1,319 | 1,341 | 1,311 | 0.7% |  |
| cosmo | 0.334.0 | 1,177 | 1,227 | 1,171 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 573 | 596 | 571 | 1.6% |  |
| apollo-router | v2.16.1 | 414 | 435 | 394 | 3.3% |  |
| apollo-gateway | 2.14.3 | 259 | 263 | 258 | 0.7% |  |
| hive-gateway | 2.10.8 | 254 | 261 | 253 | 1.3% |  |
| feddi | 5ff8b6165878 | 16 | 17 | 16 | 2.1% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 692877      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.79µs   min=841ns   med=1.9µs   max=11.1ms   p(90)=3.56µs   p(95)=4.28µs  p(99.9)=28.75µs
     http_req_connecting............: avg=383ns    min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.76ms  min=17.33ms med=25.19ms max=290.05ms p(90)=30.08ms  p(95)=31.86ms p(99.9)=48.23ms
       { expected_response:true }...: avg=25.76ms  min=17.33ms med=25.19ms max=290.05ms p(90)=30.08ms  p(95)=31.86ms p(99.9)=48.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231059
     http_req_receiving.............: avg=299.74µs min=48.71µs med=89.22µs max=65.32ms  p(90)=766.72µs p(95)=1.28ms  p(99.9)=7.79ms 
     http_req_sending...............: avg=29.34µs  min=4.31µs  med=8.18µs  max=150.94ms p(90)=18.56µs  p(95)=28.76µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.43ms  min=17.21ms med=24.87ms max=289.34ms p(90)=29.68ms  p(95)=31.41ms p(99.9)=46.88ms
     http_reqs......................: 231059  1894.949043/s
     iteration_duration.............: avg=25.97ms  min=17.67ms med=25.39ms max=302.62ms p(90)=30.28ms  p(95)=32.06ms p(99.9)=48.51ms
     iterations.....................: 230959  1894.128928/s
     success_rate...................: 100.00% ✓ 230959      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 691788      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.68µs   min=911ns   med=1.95µs  max=6.42ms   p(90)=3.56µs  p(95)=4.31µs  p(99.9)=29µs   
     http_req_connecting............: avg=279ns    min=0s      med=0s      max=2.9ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.79ms  min=17.08ms med=25.22ms max=280.68ms p(90)=30.13ms p(95)=31.96ms p(99.9)=49.51ms
       { expected_response:true }...: avg=25.79ms  min=17.08ms med=25.22ms max=280.68ms p(90)=30.13ms p(95)=31.96ms p(99.9)=49.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230696
     http_req_receiving.............: avg=295.12µs min=48.79µs med=91.05µs max=222.12ms p(90)=730.3µs p(95)=1.21ms  p(99.9)=8.19ms 
     http_req_sending...............: avg=31.5µs   min=4.33µs  med=8.34µs  max=136.42ms p(90)=17.72µs p(95)=27.82µs p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.47ms  min=16.96ms med=24.91ms max=280.07ms p(90)=29.74ms p(95)=31.51ms p(99.9)=47.79ms
     http_reqs......................: 230696  1891.957506/s
     iteration_duration.............: avg=26.01ms  min=17.28ms med=25.42ms max=320.8ms  p(90)=30.33ms p(95)=32.16ms p(99.9)=49.84ms
     iterations.....................: 230596  1891.137397/s
     success_rate...................: 100.00% ✓ 230596      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686613      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.82µs   min=831ns   med=1.98µs  max=4.34ms   p(90)=3.64µs   p(95)=4.4µs   p(99.9)=28.85µs
     http_req_connecting............: avg=433ns    min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.99ms  min=17.52ms med=25.43ms max=292.87ms p(90)=30.3ms   p(95)=32.1ms  p(99.9)=49.39ms
       { expected_response:true }...: avg=25.99ms  min=17.52ms med=25.43ms max=292.87ms p(90)=30.3ms   p(95)=32.1ms  p(99.9)=49.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228971
     http_req_receiving.............: avg=262.73µs min=50.74µs med=87.02µs max=212.82ms p(90)=613.61µs p(95)=1.14ms  p(99.9)=7.29ms 
     http_req_sending...............: avg=33.46µs  min=4.59µs  med=8.26µs  max=194.82ms p(90)=17.96µs  p(95)=29.37µs p(99.9)=1.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.69ms  min=16.95ms med=25.15ms max=292.48ms p(90)=29.94ms  p(95)=31.72ms p(99.9)=48.01ms
     http_reqs......................: 228971  1878.132236/s
     iteration_duration.............: avg=26.2ms   min=17.69ms med=25.63ms max=304.04ms p(90)=30.49ms  p(95)=32.31ms p(99.9)=49.85ms
     iterations.....................: 228871  1877.311987/s
     success_rate...................: 100.00% ✓ 228871      ✗ 0     
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

     checks.........................: 100.00% ✓ 667035      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.07µs  med=2.61µs  max=3.89ms   p(90)=4.14µs  p(95)=4.83µs   p(99.9)=35.5µs 
     http_req_connecting............: avg=466ns   min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.76ms min=17.34ms med=26.31ms max=306.16ms p(90)=30.53ms p(95)=32.02ms  p(99.9)=49.16ms
       { expected_response:true }...: avg=26.76ms min=17.34ms med=26.31ms max=306.16ms p(90)=30.53ms p(95)=32.02ms  p(99.9)=49.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222445
     http_req_receiving.............: avg=80.15µs min=27.02µs med=54.61µs max=132.48ms p(90)=94.19µs p(95)=118.55µs p(99.9)=2.18ms 
     http_req_sending...............: avg=32.35µs min=4.81µs  med=10.63µs max=159.33ms p(90)=18µs    p(95)=24.62µs  p(99.9)=1.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.65ms min=17.23ms med=26.22ms max=304.09ms p(90)=30.42ms p(95)=31.88ms  p(99.9)=48.34ms
     http_reqs......................: 222445  1823.894186/s
     iteration_duration.............: avg=26.97ms min=19.08ms med=26.51ms max=315.7ms  p(90)=30.74ms p(95)=32.22ms  p(99.9)=49.51ms
     iterations.....................: 222345  1823.074255/s
     success_rate...................: 100.00% ✓ 222345      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 657348      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=3.3µs   min=861ns   med=2.03µs  max=8.75ms   p(90)=3.67µs   p(95)=4.39µs  p(99.9)=32.25µs
     http_req_connecting............: avg=852ns   min=0s      med=0s      max=8.7ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.15ms min=18.16ms med=26.58ms max=303.33ms p(90)=31.76ms  p(95)=33.64ms p(99.9)=50.73ms
       { expected_response:true }...: avg=27.15ms min=18.16ms med=26.58ms max=303.33ms p(90)=31.76ms  p(95)=33.64ms p(99.9)=50.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219216
     http_req_receiving.............: avg=318µs   min=50.57µs med=98.49µs max=184.13ms p(90)=791.25µs p(95)=1.25ms  p(99.9)=7.86ms 
     http_req_sending...............: avg=32.03µs min=4.61µs  med=8.7µs   max=179.15ms p(90)=18.61µs  p(95)=30.93µs p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.8ms  min=18ms    med=26.25ms max=281.72ms p(90)=31.35ms  p(95)=33.2ms  p(99.9)=48.51ms
     http_reqs......................: 219216  1796.953815/s
     iteration_duration.............: avg=27.37ms min=18.35ms med=26.79ms max=314.71ms p(90)=31.96ms  p(95)=33.84ms p(99.9)=51.37ms
     iterations.....................: 219116  1796.134096/s
     success_rate...................: 100.00% ✓ 219116      ✗ 0     
     vus............................: 1       min=0         max=50  
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

     checks.........................: 100.00% ✓ 482718      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=4.06µs  min=1.11µs  med=3.17µs  max=3.09ms   p(90)=5.59µs   p(95)=6.59µs   p(99.9)=45.47µs
     http_req_connecting............: avg=368ns   min=0s      med=0s      max=3.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.01ms min=18.16ms med=36.68ms max=310.66ms p(90)=43.43ms  p(95)=45.47ms  p(99.9)=61.3ms 
       { expected_response:true }...: avg=37.01ms min=18.16ms med=36.68ms max=310.66ms p(90)=43.43ms  p(95)=45.47ms  p(99.9)=61.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 161006
     http_req_receiving.............: avg=95.64µs min=26.66µs med=63.61µs max=121.1ms  p(90)=131.17µs p(95)=179.15µs p(99.9)=1.99ms 
     http_req_sending...............: avg=36.94µs min=4.55µs  med=12.11µs max=117.03ms p(90)=26.13µs  p(95)=59.65µs  p(99.9)=1.91ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.87ms min=17.96ms med=36.55ms max=275.21ms p(90)=43.29ms  p(95)=45.33ms  p(99.9)=60.55ms
     http_reqs......................: 161006  1319.793569/s
     iteration_duration.............: avg=37.27ms min=21.86ms med=36.93ms max=321.05ms p(90)=43.65ms  p(95)=45.7ms   p(99.9)=62.11ms
     iterations.....................: 160906  1318.973852/s
     success_rate...................: 100.00% ✓ 160906      ✗ 0     
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

     checks.........................: 100.00% ✓ 430827      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=4.08µs  min=1.05µs  med=3.02µs  max=3.51ms   p(90)=4.68µs   p(95)=5.42µs   p(99.9)=38.5µs  
     http_req_connecting............: avg=742ns   min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.52ms min=18.75ms med=40.9ms  max=315.78ms p(90)=50.08ms  p(95)=52.97ms  p(99.9)=69ms    
       { expected_response:true }...: avg=41.52ms min=18.75ms med=40.9ms  max=315.78ms p(90)=50.08ms  p(95)=52.97ms  p(99.9)=69ms    
     http_req_failed................: 0.00%   ✓ 0           ✗ 143709
     http_req_receiving.............: avg=84.55µs min=26.73µs med=68.46µs max=158.59ms p(90)=112.49µs p(95)=132.08µs p(99.9)=944.09µs
     http_req_sending...............: avg=29.18µs min=5.61µs  med=12.8µs  max=142.33ms p(90)=19.94µs  p(95)=23.88µs  p(99.9)=1.08ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.41ms min=18.66ms med=40.8ms  max=315.56ms p(90)=49.97ms  p(95)=52.86ms  p(99.9)=68.54ms 
     http_reqs......................: 143709  1177.833749/s
     iteration_duration.............: avg=41.77ms min=22.7ms  med=41.12ms max=326.89ms p(90)=50.3ms   p(95)=53.19ms  p(99.9)=69.37ms 
     iterations.....................: 143609  1177.014152/s
     success_rate...................: 100.00% ✓ 143609      ✗ 0     
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

     checks.........................: 100.00% ✓ 209916     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   688 kB/s
     http_req_blocked...............: avg=5.37µs  min=1.25µs  med=3.44µs  max=4.64ms   p(90)=5.04µs   p(95)=5.75µs   p(99.9)=46.28µs 
     http_req_connecting............: avg=1.65µs  min=0s      med=0s      max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.39ms min=20.76ms med=83.7ms  max=331.21ms p(90)=102.73ms p(95)=110.74ms p(99.9)=194.2ms 
       { expected_response:true }...: avg=85.39ms min=20.76ms med=83.7ms  max=331.21ms p(90)=102.73ms p(95)=110.74ms p(99.9)=194.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 70072
     http_req_receiving.............: avg=87.16µs min=32.3µs  med=77.78µs max=102.04ms p(90)=114.86µs p(95)=129.12µs p(99.9)=672.19µs
     http_req_sending...............: avg=25.4µs  min=5.6µs   med=15.65µs max=131.03ms p(90)=22.44µs  p(95)=24.83µs  p(99.9)=647.71µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.28ms min=20.61ms med=83.59ms max=330.43ms p(90)=102.62ms p(95)=110.61ms p(99.9)=193.38ms
     http_reqs......................: 70072   573.209671/s
     iteration_duration.............: avg=85.75ms min=32.13ms med=83.97ms max=341.41ms p(90)=103.01ms p(95)=111.03ms p(99.9)=197.28ms
     iterations.....................: 69972   572.391641/s
     success_rate...................: 100.00% ✓ 69972      ✗ 0    
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

     checks.........................: 100.00% ✓ 151902     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 61 MB   498 kB/s
     http_req_blocked...............: avg=5.35µs   min=1.12µs  med=3.25µs   max=3.76ms   p(90)=4.71µs   p(95)=5.29µs   p(99.9)=164.89µs
     http_req_connecting............: avg=1.88µs   min=0s      med=0s       max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=24.78µs 
     http_req_duration..............: avg=118.06ms min=20.81ms med=116.1ms  max=352.91ms p(90)=147.42ms p(95)=157.15ms p(99.9)=197.91ms
       { expected_response:true }...: avg=118.06ms min=20.81ms med=116.1ms  max=352.91ms p(90)=147.42ms p(95)=157.15ms p(99.9)=197.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50734
     http_req_receiving.............: avg=87.58µs  min=27.24µs med=83.48µs  max=75.31ms  p(90)=115.39µs p(95)=127.91µs p(99.9)=560.63µs
     http_req_sending...............: avg=21.97µs  min=5.36µs  med=17.09µs  max=44.29ms  p(90)=22.46µs  p(95)=24.42µs  p(99.9)=499.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.95ms min=20.62ms med=116ms    max=352.31ms p(90)=147.31ms p(95)=157.03ms p(99.9)=197.78ms
     http_reqs......................: 50734   414.639947/s
     iteration_duration.............: avg=118.53ms min=38.64ms med=116.41ms max=377.67ms p(90)=147.71ms p(95)=157.43ms p(99.9)=200.82ms
     iterations.....................: 50634   413.822665/s
     success_rate...................: 100.00% ✓ 50634      ✗ 0    
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

     checks.........................: 100.00% ✓ 95361      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.33µs   min=1.21µs  med=3.22µs   max=3.6ms    p(90)=4.61µs   p(95)=5.14µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=2.89µs   min=0s      med=0s       max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=188.05ms min=23.36ms med=188.94ms max=386.63ms p(90)=211.04ms p(95)=216.75ms p(99.9)=281.95ms
       { expected_response:true }...: avg=188.05ms min=23.36ms med=188.94ms max=386.63ms p(90)=211.04ms p(95)=216.75ms p(99.9)=281.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31887
     http_req_receiving.............: avg=108.1µs  min=32.51µs med=87.38µs  max=161.75ms p(90)=117.46µs p(95)=128.66µs p(99.9)=543.78µs
     http_req_sending...............: avg=31.1µs   min=5.29µs  med=16.75µs  max=134.03ms p(90)=21.42µs  p(95)=23.26µs  p(99.9)=447.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.91ms min=23.22ms med=188.82ms max=386.09ms p(90)=210.91ms p(95)=216.62ms p(99.9)=280.86ms
     http_reqs......................: 31887   259.995998/s
     iteration_duration.............: avg=188.87ms min=37.65ms med=189.46ms max=395.6ms  p(90)=211.33ms p(95)=217.04ms p(99.9)=283.86ms
     iterations.....................: 31787   259.180631/s
     success_rate...................: 100.00% ✓ 31787      ✗ 0    
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

     checks.........................: 100.00% ✓ 92922      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=7.04µs   min=1.45µs  med=3.61µs   max=3.65ms   p(90)=5.1µs    p(95)=5.74µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=3.07µs   min=0s      med=0s       max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=193ms    min=18.95ms med=182.03ms max=623.18ms p(90)=226.43ms p(95)=260.56ms p(99.9)=570.03ms
       { expected_response:true }...: avg=193ms    min=18.95ms med=182.03ms max=623.18ms p(90)=226.43ms p(95)=260.56ms p(99.9)=570.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31074
     http_req_receiving.............: avg=99.23µs  min=37.04µs med=90.1µs   max=123.87ms p(90)=121.44µs p(95)=133.28µs p(99.9)=813.86µs
     http_req_sending...............: avg=32.2µs   min=6.84µs  med=18.25µs  max=69.25ms  p(90)=23.28µs  p(95)=25.2µs   p(99.9)=587.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.87ms min=18.78ms med=181.9ms  max=623.06ms p(90)=226.32ms p(95)=260.37ms p(99.9)=569.91ms
     http_reqs......................: 31074   254.392321/s
     iteration_duration.............: avg=193.86ms min=42.69ms med=182.39ms max=623.49ms p(90)=226.8ms  p(95)=261.89ms p(99.9)=570.33ms
     iterations.....................: 30974   253.573655/s
     success_rate...................: 100.00% ✓ 30974      ✗ 0    
     vus............................: 44      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6180      ✗ 0   
     data_received..................: 207 MB  1.6 MB/s
     data_sent......................: 2.6 MB  20 kB/s
     http_req_blocked...............: avg=71.98µs min=1.3µs   med=3.17µs  max=5.95ms p(90)=4.51µs   p(95)=5.37µs   p(99.9)=5.65ms  
     http_req_connecting............: avg=65.62µs min=0s      med=0s      max=5.92ms p(90)=0s       p(95)=0s       p(99.9)=5.63ms  
     http_req_duration..............: avg=2.81s   min=39.76ms med=2.93s   max=4.61s  p(90)=3.52s    p(95)=3.72s    p(99.9)=4.54s   
       { expected_response:true }...: avg=2.81s   min=39.76ms med=2.93s   max=4.61s  p(90)=3.52s    p(95)=3.72s    p(99.9)=4.54s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2160
     http_req_receiving.............: avg=94.55µs min=33.15µs med=91.05µs max=501µs  p(90)=131.49µs p(95)=147.62µs p(99.9)=357.42µs
     http_req_sending...............: avg=83.25µs min=5.73µs  med=17.55µs max=6.13ms p(90)=22.16µs  p(95)=26.82µs  p(99.9)=5.08ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.81s   min=39.54ms med=2.93s   max=4.61s  p(90)=3.52s    p(95)=3.72s    p(99.9)=4.54s   
     http_reqs......................: 2160    16.889674/s
     iteration_duration.............: avg=2.95s   min=1.19s   med=2.96s   max=4.61s  p(90)=3.54s    p(95)=3.74s    p(99.9)=4.55s   
     iterations.....................: 2060    16.107745/s
     success_rate...................: 100.00% ✓ 2060      ✗ 0   
     vus............................: 41      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

