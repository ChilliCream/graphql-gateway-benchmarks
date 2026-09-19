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
| fusion | 16.6.6 | 1,893 | 1,943 | 1,881 | 1.2% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 1,887 | 1,928 | 1,880 | 0.9% |  |
| fusion-nightly | 16.7.0-p.8 | 1,881 | 1,933 | 1,872 | 1.1% |  |
| hive-router | v0.0.84 | 1,836 | 1,907 | 1,823 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 1,798 | 1,855 | 1,794 | 1.2% |  |
| grafbase | 0.53.5 | 1,314 | 1,342 | 1,312 | 0.8% |  |
| cosmo | 0.334.0 | 1,229 | 1,269 | 1,222 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 566 | 584 | 563 | 1.2% |  |
| apollo-router | v2.16.1 | 431 | 451 | 429 | 1.7% |  |
| apollo-gateway | 2.14.3 | 257 | 261 | 256 | 0.7% |  |
| hive-gateway | 2.10.8 | 256 | 262 | 255 | 0.9% |  |
| feddi | 5ff8b6165878 | 18 | 18 | 17 | 2.9% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 692292     ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=3.23µs   min=992ns   med=2.43µs  max=7.71ms   p(90)=3.97µs   p(95)=4.69µs  p(99.9)=36.65µs
     http_req_connecting............: avg=404ns    min=0s      med=0s      max=3.78ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.77ms  min=17.56ms med=25.16ms max=312.2ms  p(90)=30.15ms  p(95)=32.01ms p(99.9)=48.72ms
       { expected_response:true }...: avg=25.77ms  min=17.56ms med=25.16ms max=312.2ms  p(90)=30.15ms  p(95)=32.01ms p(99.9)=48.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 230864
     http_req_receiving.............: avg=299.45µs min=51.02µs med=95.47µs max=286.36ms p(90)=728.91µs p(95)=1.23ms  p(99.9)=8.27ms 
     http_req_sending...............: avg=33.24µs  min=4.69µs  med=9.33µs  max=140.67ms p(90)=18.98µs  p(95)=39µs    p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.43ms  min=17.37ms med=24.85ms max=274.29ms p(90)=29.76ms  p(95)=31.57ms p(99.9)=47.32ms
     http_reqs......................: 230864  1893.50041/s
     iteration_duration.............: avg=25.99ms  min=17.79ms med=25.37ms max=321.57ms p(90)=30.36ms  p(95)=32.22ms p(99.9)=49.22ms
     iterations.....................: 230764  1892.68023/s
     success_rate...................: 100.00% ✓ 230764     ✗ 0     
     vus............................: 50      min=0        max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689937      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=891ns   med=1.97µs  max=4.39ms   p(90)=3.63µs  p(95)=4.37µs  p(99.9)=27.8µs 
     http_req_connecting............: avg=433ns    min=0s      med=0s      max=4.35ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.86ms  min=17.02ms med=25.32ms max=310.97ms p(90)=30.04ms p(95)=31.77ms p(99.9)=47.7ms 
       { expected_response:true }...: avg=25.86ms  min=17.02ms med=25.32ms max=310.97ms p(90)=30.04ms p(95)=31.77ms p(99.9)=47.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 230079
     http_req_receiving.............: avg=384.34µs min=47.01µs med=89.72µs max=109.59ms p(90)=1.11ms  p(95)=1.85ms  p(99.9)=9.4ms  
     http_req_sending...............: avg=30.79µs  min=4.37µs  med=8.37µs  max=121.06ms p(90)=17.68µs p(95)=29.5µs  p(99.9)=1.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.45ms  min=16.93ms med=24.93ms max=294.59ms p(90)=29.45ms p(95)=31.14ms p(99.9)=45.8ms 
     http_reqs......................: 230079  1887.186868/s
     iteration_duration.............: avg=26.08ms  min=17.2ms  med=25.52ms max=320.93ms p(90)=30.24ms p(95)=31.97ms p(99.9)=48.08ms
     iterations.....................: 229979  1886.366634/s
     success_rate...................: 100.00% ✓ 229979      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688038      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=3.15µs   min=832ns   med=2.1µs   max=7.86ms   p(90)=3.73µs   p(95)=4.46µs  p(99.9)=31.23µs
     http_req_connecting............: avg=576ns    min=0s      med=0s      max=5.65ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.94ms  min=16.95ms med=25.35ms max=297.7ms  p(90)=30.32ms  p(95)=32.15ms p(99.9)=50.01ms
       { expected_response:true }...: avg=25.94ms  min=16.95ms med=25.35ms max=297.7ms  p(90)=30.32ms  p(95)=32.15ms p(99.9)=50.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229446
     http_req_receiving.............: avg=317.02µs min=50.5µs  med=95.93µs max=62.77ms  p(90)=802.75µs p(95)=1.29ms  p(99.9)=8.58ms 
     http_req_sending...............: avg=31.09µs  min=4.48µs  med=8.72µs  max=84.33ms  p(90)=18.13µs  p(95)=29.99µs p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.59ms  min=16.86ms med=25.02ms max=295.91ms p(90)=29.9ms   p(95)=31.68ms p(99.9)=48ms   
     http_reqs......................: 229446  1881.787806/s
     iteration_duration.............: avg=26.15ms  min=17.12ms med=25.55ms max=305.98ms p(90)=30.51ms  p(95)=32.35ms p(99.9)=50.47ms
     iterations.....................: 229346  1880.967662/s
     success_rate...................: 100.00% ✓ 229346      ✗ 0     
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

     checks.........................: 100.00% ✓ 671577      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.91µs  min=832ns   med=2.14µs  max=4.01ms   p(90)=3.69µs  p(95)=4.39µs   p(99.9)=28.85µs
     http_req_connecting............: avg=402ns   min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.58ms min=18.39ms med=26.16ms max=310.86ms p(90)=30.28ms p(95)=31.7ms   p(99.9)=46.45ms
       { expected_response:true }...: avg=26.58ms min=18.39ms med=26.16ms max=310.86ms p(90)=30.28ms p(95)=31.7ms   p(99.9)=46.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223959
     http_req_receiving.............: avg=74.15µs min=26.74µs med=51.37µs max=184.09ms p(90)=91.55µs p(95)=114.79µs p(99.9)=1.79ms 
     http_req_sending...............: avg=28.31µs min=4.65µs  med=9.16µs  max=176.62ms p(90)=16.8µs  p(95)=23.07µs  p(99.9)=1.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.47ms min=18.34ms med=26.07ms max=295.72ms p(90)=30.17ms p(95)=31.58ms  p(99.9)=45.05ms
     http_reqs......................: 223959  1836.455494/s
     iteration_duration.............: avg=26.79ms min=18.68ms med=26.36ms max=316.86ms p(90)=30.48ms p(95)=31.9ms   p(99.9)=46.92ms
     iterations.....................: 223859  1835.635498/s
     success_rate...................: 100.00% ✓ 223859      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 657984      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=2.83µs   min=841ns   med=1.96µs  max=4.34ms   p(90)=3.63µs   p(95)=4.41µs  p(99.9)=30.6µs 
     http_req_connecting............: avg=444ns    min=0s      med=0s      max=4.3ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.13ms  min=17.31ms med=26.54ms max=307.75ms p(90)=31.72ms  p(95)=33.62ms p(99.9)=51ms   
       { expected_response:true }...: avg=27.13ms  min=17.31ms med=26.54ms max=307.75ms p(90)=31.72ms  p(95)=33.62ms p(99.9)=51ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 219428
     http_req_receiving.............: avg=310.53µs min=51.07µs med=96.88µs max=141.65ms p(90)=788.95µs p(95)=1.27ms  p(99.9)=7.6ms  
     http_req_sending...............: avg=32.18µs  min=4.56µs  med=8.45µs  max=142.6ms  p(90)=18.03µs  p(95)=29.1µs  p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.79ms  min=17.21ms med=26.22ms max=306.99ms p(90)=31.31ms  p(95)=33.18ms p(99.9)=49.7ms 
     http_reqs......................: 219428  1798.917449/s
     iteration_duration.............: avg=27.34ms  min=17.48ms med=26.75ms max=326.31ms p(90)=31.92ms  p(95)=33.82ms p(99.9)=51.63ms
     iterations.....................: 219328  1798.097628/s
     success_rate...................: 100.00% ✓ 219328      ✗ 0     
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

     checks.........................: 100.00% ✓ 480894      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=4.05µs  min=962ns   med=2.95µs  max=3.32ms   p(90)=5.31µs   p(95)=6.3µs   p(99.9)=45.71µs
     http_req_connecting............: avg=526ns   min=0s      med=0s      max=3.26ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=37.16ms min=18.38ms med=36.91ms max=331.66ms p(90)=43.75ms  p(95)=45.76ms p(99.9)=61.33ms
       { expected_response:true }...: avg=37.16ms min=18.38ms med=36.91ms max=331.66ms p(90)=43.75ms  p(95)=45.76ms p(99.9)=61.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160398
     http_req_receiving.............: avg=90.77µs min=27.11µs med=60.65µs max=23.18ms  p(90)=129.03µs p(95)=175.8µs p(99.9)=2.35ms 
     http_req_sending...............: avg=35.18µs min=4.35µs  med=11.35µs max=97.54ms  p(90)=25.81µs  p(95)=54.56µs p(99.9)=2.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=37.03ms min=18.23ms med=36.79ms max=330.91ms p(90)=43.63ms  p(95)=45.63ms p(99.9)=60.24ms
     http_reqs......................: 160398  1314.855609/s
     iteration_duration.............: avg=37.41ms min=21.06ms med=37.16ms max=346.5ms  p(90)=43.98ms  p(95)=45.98ms p(99.9)=61.68ms
     iterations.....................: 160298  1314.035863/s
     success_rate...................: 100.00% ✓ 160298      ✗ 0     
     vus............................: 4       min=0         max=50  
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

     checks.........................: 100.00% ✓ 449811      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.34µs  min=962ns   med=2.39µs  max=3.79ms   p(90)=4.1µs    p(95)=4.8µs   p(99.9)=32.57µs 
     http_req_connecting............: avg=594ns   min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=39.78ms min=18.48ms med=39.15ms max=325.36ms p(90)=47.71ms  p(95)=50.48ms p(99.9)=65.43ms 
       { expected_response:true }...: avg=39.78ms min=18.48ms med=39.15ms max=325.36ms p(90)=47.71ms  p(95)=50.48ms p(99.9)=65.43ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 150037
     http_req_receiving.............: avg=76.26µs min=26.47µs med=62.15µs max=47.22ms  p(90)=102.79µs p(95)=120.5µs p(99.9)=864.51µs
     http_req_sending...............: avg=26.76µs min=4.8µs   med=10.91µs max=173.06ms p(90)=18.93µs  p(95)=22.9µs  p(99.9)=966.63µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=39.68ms min=18.34ms med=39.06ms max=324.85ms p(90)=47.61ms  p(95)=50.37ms p(99.9)=65.26ms 
     http_reqs......................: 150037  1229.811029/s
     iteration_duration.............: avg=40.01ms min=21.5ms  med=39.36ms max=334.22ms p(90)=47.91ms  p(95)=50.68ms p(99.9)=65.83ms 
     iterations.....................: 149937  1228.991357/s
     success_rate...................: 100.00% ✓ 149937      ✗ 0     
     vus............................: 32      min=0         max=50  
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

     checks.........................: 100.00% ✓ 207357     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   680 kB/s
     http_req_blocked...............: avg=4.3µs   min=1.07µs  med=2.69µs  max=4.12ms   p(90)=4.24µs   p(95)=4.87µs   p(99.9)=46.18µs 
     http_req_connecting............: avg=1.35µs  min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.47ms min=20.69ms med=86.42ms max=318.58ms p(90)=110.01ms p(95)=119.24ms p(99.9)=200.16ms
       { expected_response:true }...: avg=86.47ms min=20.69ms med=86.42ms max=318.58ms p(90)=110.01ms p(95)=119.24ms p(99.9)=200.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69219
     http_req_receiving.............: avg=84.28µs min=29.95µs med=74.17µs max=118.95ms p(90)=112.09µs p(95)=126.29µs p(99.9)=624.51µs
     http_req_sending...............: avg=22.97µs min=5µs     med=13.2µs  max=123.14ms p(90)=20.52µs  p(95)=22.87µs  p(99.9)=624.64µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.37ms min=20.5ms  med=86.33ms max=302.88ms p(90)=109.91ms p(95)=119.12ms p(99.9)=199.95ms
     http_reqs......................: 69219   566.224107/s
     iteration_duration.............: avg=86.82ms min=36.1ms  med=86.68ms max=334.5ms  p(90)=110.26ms p(95)=119.52ms p(99.9)=203.49ms
     iterations.....................: 69119   565.406088/s
     success_rate...................: 100.00% ✓ 69119      ✗ 0    
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

     checks.........................: 100.00% ✓ 158253     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   519 kB/s
     http_req_blocked...............: avg=4.97µs   min=1.11µs  med=3.16µs   max=3.33ms   p(90)=4.68µs   p(95)=5.26µs   p(99.9)=132.12µs
     http_req_connecting............: avg=1.59µs   min=0s      med=0s       max=3.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.31ms min=21.5ms  med=111.38ms max=318.85ms p(90)=141.27ms p(95)=150.48ms p(99.9)=191.02ms
       { expected_response:true }...: avg=113.31ms min=21.5ms  med=111.38ms max=318.85ms p(90)=141.27ms p(95)=150.48ms p(99.9)=191.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52851
     http_req_receiving.............: avg=88.45µs  min=29.4µs  med=85.24µs  max=35.51ms  p(90)=116.28µs p(95)=128.98µs p(99.9)=539.64µs
     http_req_sending...............: avg=23.58µs  min=5.02µs  med=17.11µs  max=86.02ms  p(90)=22.47µs  p(95)=24.51µs  p(99.9)=567.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.2ms  min=21.33ms med=111.26ms max=318.22ms p(90)=141.16ms p(95)=150.35ms p(99.9)=190.83ms
     http_reqs......................: 52851   431.967907/s
     iteration_duration.............: avg=113.76ms min=32.36ms med=111.67ms max=353.05ms p(90)=141.57ms p(95)=150.8ms  p(99.9)=194.07ms
     iterations.....................: 52751   431.150576/s
     success_rate...................: 100.00% ✓ 52751      ✗ 0    
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

     checks.........................: 100.00% ✓ 94305      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=6.46µs   min=1.16µs  med=3.17µs   max=3.52ms   p(90)=4.58µs   p(95)=5.15µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=2.98µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=190.18ms min=23.64ms med=191.02ms max=377.67ms p(90)=203.46ms p(95)=209.08ms p(99.9)=279.35ms
       { expected_response:true }...: avg=190.18ms min=23.64ms med=191.02ms max=377.67ms p(90)=203.46ms p(95)=209.08ms p(99.9)=279.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31535
     http_req_receiving.............: avg=94.73µs  min=31.82µs med=86.9µs   max=78.7ms   p(90)=118.41µs p(95)=131.1µs  p(99.9)=557.31µs
     http_req_sending...............: avg=28.09µs  min=5.75µs  med=17.14µs  max=53.82ms  p(90)=22.01µs  p(95)=23.89µs  p(99.9)=518.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.05ms min=23.45ms med=190.91ms max=373.68ms p(90)=203.35ms p(95)=208.96ms p(99.9)=278.81ms
     http_reqs......................: 31535   257.090131/s
     iteration_duration.............: avg=191ms    min=62.23ms med=191.45ms max=385.15ms p(90)=203.75ms p(95)=209.4ms  p(99.9)=282.69ms
     iterations.....................: 31435   256.274878/s
     success_rate...................: 100.00% ✓ 31435      ✗ 0    
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

     checks.........................: 100.00% ✓ 93810      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   308 kB/s
     http_req_blocked...............: avg=7.05µs   min=1.47µs  med=3.61µs   max=4.2ms    p(90)=5.1µs    p(95)=5.73µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=3.14µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=191.21ms min=18.12ms med=178.12ms max=662.09ms p(90)=232.08ms p(95)=269.78ms p(99.9)=561.94ms
       { expected_response:true }...: avg=191.21ms min=18.12ms med=178.12ms max=662.09ms p(90)=232.08ms p(95)=269.78ms p(99.9)=561.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31370
     http_req_receiving.............: avg=93.86µs  min=34.57µs med=89.16µs  max=7.07ms   p(90)=120.85µs p(95)=133.56µs p(99.9)=789.4µs 
     http_req_sending...............: avg=28.84µs  min=6.72µs  med=18.69µs  max=63.65ms  p(90)=23.77µs  p(95)=25.77µs  p(99.9)=666.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.09ms min=17.98ms med=178ms    max=661.99ms p(90)=231.97ms p(95)=269.66ms p(99.9)=561.83ms
     http_reqs......................: 31370   256.661986/s
     iteration_duration.............: avg=192.07ms min=44.67ms med=178.5ms  max=662.29ms p(90)=232.51ms p(95)=272.04ms p(99.9)=562.22ms
     iterations.....................: 31270   255.84381/s
     success_rate...................: 100.00% ✓ 31270      ✗ 0    
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

     checks.........................: 100.00% ✓ 6582      ✗ 0   
     data_received..................: 220 MB  1.7 MB/s
     data_sent......................: 2.8 MB  22 kB/s
     http_req_blocked...............: avg=46.37µs  min=1.62µs   med=3.71µs  max=3.88ms  p(90)=5.36µs   p(95)=6.28µs   p(99.9)=3.53ms
     http_req_connecting............: avg=41.43µs  min=0s       med=0s      max=3.84ms  p(90)=0s       p(95)=0s       p(99.9)=3.5ms 
     http_req_duration..............: avg=2.64s    min=43.42ms  med=2.73s   max=4.35s   p(90)=3.36s    p(95)=3.57s    p(99.9)=4.31s 
       { expected_response:true }...: avg=2.64s    min=43.42ms  med=2.73s   max=4.35s   p(90)=3.36s    p(95)=3.57s    p(99.9)=4.31s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2294
     http_req_receiving.............: avg=109.29µs min=42.14µs  med=95.19µs max=14.86ms p(90)=136.38µs p(95)=156.48µs p(99.9)=2.1ms 
     http_req_sending...............: avg=51.27µs  min=6.67µs   med=19.29µs max=17.86ms p(90)=24.8µs   p(95)=29.59µs  p(99.9)=9.6ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.64s    min=43.16ms  med=2.73s   max=4.35s   p(90)=3.36s    p(95)=3.57s    p(99.9)=4.31s 
     http_reqs......................: 2294    18.015269/s
     iteration_duration.............: avg=2.76s    min=813.07ms med=2.76s   max=4.35s   p(90)=3.37s    p(95)=3.58s    p(99.9)=4.31s 
     iterations.....................: 2194    17.229948/s
     success_rate...................: 100.00% ✓ 2194      ✗ 0   
     vus............................: 24      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

