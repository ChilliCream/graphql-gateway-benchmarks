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
| fusion | 16.6.0 | 1,868 | 1,930 | 1,860 | 1.3% |  |
| hive-router | v0.0.84 | 1,834 | 1,902 | 1,826 | 1.4% |  |
| grafbase | 0.53.5 | 1,282 | 1,310 | 1,279 | 1.0% |  |
| cosmo | 0.334.0 | 1,218 | 1,262 | 1,212 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 560 | 582 | 557 | 1.4% |  |
| apollo-router | v2.16.1 | 430 | 447 | 425 | 1.6% |  |
| apollo-gateway | 2.14.3 | 261 | 265 | 260 | 0.7% |  |
| hive-gateway | 2.10.8 | 258 | 265 | 255 | 1.3% |  |
| feddi | 5ff8b6165878 | 17 | 19 | 17 | 4.3% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683220      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.46µs   min=871ns   med=1.93µs  max=8.87ms   p(90)=3.69µs  p(95)=4.44µs  p(99.9)=30µs   
     http_req_connecting............: avg=986ns    min=0s      med=0s      max=8.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.12ms  min=17.59ms med=25.54ms max=301.89ms p(90)=30.55ms p(95)=32.37ms p(99.9)=48.98ms
       { expected_response:true }...: avg=26.12ms  min=17.59ms med=25.54ms max=301.89ms p(90)=30.55ms p(95)=32.37ms p(99.9)=48.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227840
     http_req_receiving.............: avg=315.73µs min=50.75µs med=94.63µs max=127.3ms  p(90)=806.5µs p(95)=1.32ms  p(99.9)=8.14ms 
     http_req_sending...............: avg=33.75µs  min=4.49µs  med=8.36µs  max=145.41ms p(90)=19.32µs p(95)=32.25µs p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.77ms  min=16.84ms med=25.21ms max=281.17ms p(90)=30.13ms p(95)=31.91ms p(99.9)=46.92ms
     http_reqs......................: 227840  1868.198555/s
     iteration_duration.............: avg=26.33ms  min=17.84ms med=25.75ms max=318.89ms p(90)=30.75ms p(95)=32.57ms p(99.9)=49.4ms 
     iterations.....................: 227740  1867.378595/s
     success_rate...................: 100.00% ✓ 227740      ✗ 0     
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

     checks.........................: 100.00% ✓ 670878      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=3.29µs  min=1.03µs  med=2.6µs   max=6.78ms   p(90)=4.18µs  p(95)=4.89µs   p(99.9)=39.19µs
     http_req_connecting............: avg=282ns   min=0s      med=0s      max=2.63ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.6ms  min=18.04ms med=26.16ms max=303.83ms p(90)=30.4ms  p(95)=31.84ms  p(99.9)=48.49ms
       { expected_response:true }...: avg=26.6ms  min=18.04ms med=26.16ms max=303.83ms p(90)=30.4ms  p(95)=31.84ms  p(99.9)=48.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223726
     http_req_receiving.............: avg=77.94µs min=26.65µs med=54.37µs max=146.39ms p(90)=97.1µs  p(95)=123.32µs p(99.9)=1.75ms 
     http_req_sending...............: avg=31.38µs min=4.65µs  med=10.64µs max=95.14ms  p(90)=19.16µs p(95)=26.88µs  p(99.9)=1.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.49ms min=17.95ms med=26.06ms max=278.1ms  p(90)=30.28ms p(95)=31.71ms  p(99.9)=47.12ms
     http_reqs......................: 223726  1834.541463/s
     iteration_duration.............: avg=26.82ms min=18.6ms  med=26.37ms max=320.89ms p(90)=30.61ms p(95)=32.06ms  p(99.9)=48.89ms
     iterations.....................: 223626  1833.721469/s
     success_rate...................: 100.00% ✓ 223626      ✗ 0     
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

     checks.........................: 100.00% ✓ 468873      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=3.29µs  min=902ns   med=2.21µs  max=4.24ms   p(90)=4.4µs    p(95)=5.35µs   p(99.9)=39.94µs
     http_req_connecting............: avg=527ns   min=0s      med=0s      max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.13ms min=18.19ms med=37.87ms max=296.34ms p(90)=44.78ms  p(95)=46.87ms  p(99.9)=63.74ms
       { expected_response:true }...: avg=38.13ms min=18.19ms med=37.87ms max=296.34ms p(90)=44.78ms  p(95)=46.87ms  p(99.9)=63.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156391
     http_req_receiving.............: avg=84.23µs min=27.61µs med=55.58µs max=96.36ms  p(90)=122.36µs p(95)=165.99µs p(99.9)=1.97ms 
     http_req_sending...............: avg=37.27µs min=4.63µs  med=9.38µs  max=231.91ms p(90)=23.55µs  p(95)=40.08µs  p(99.9)=1.71ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.01ms min=18.01ms med=37.76ms max=295.58ms p(90)=44.67ms  p(95)=46.73ms  p(99.9)=62.19ms
     http_reqs......................: 156391  1282.265159/s
     iteration_duration.............: avg=38.38ms min=21.11ms med=38.1ms  max=323.57ms p(90)=45ms     p(95)=47.08ms  p(99.9)=64.04ms
     iterations.....................: 156291  1281.445249/s
     success_rate...................: 100.00% ✓ 156291      ✗ 0     
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

     checks.........................: 100.00% ✓ 445452      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=2.95µs  min=922ns   med=2.28µs  max=2.74ms   p(90)=3.93µs   p(95)=4.63µs   p(99.9)=30.81µs
     http_req_connecting............: avg=314ns   min=0s      med=0s      max=2.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.17ms min=18.41ms med=39.56ms max=319.23ms p(90)=48.25ms  p(95)=51.03ms  p(99.9)=65.57ms
       { expected_response:true }...: avg=40.17ms min=18.41ms med=39.56ms max=319.23ms p(90)=48.25ms  p(95)=51.03ms  p(99.9)=65.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148584
     http_req_receiving.............: avg=76.01µs min=26.27µs med=61.34µs max=67.24ms  p(90)=102.67µs p(95)=121.27µs p(99.9)=889.9µs
     http_req_sending...............: avg=23.4µs  min=4.63µs  med=10.52µs max=218.31ms p(90)=18.15µs  p(95)=22.16µs  p(99.9)=991.5µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.07ms min=18.3ms  med=39.46ms max=318.79ms p(90)=48.14ms  p(95)=50.92ms  p(99.9)=65.13ms
     http_reqs......................: 148584  1218.031019/s
     iteration_duration.............: avg=40.4ms  min=22.87ms med=39.76ms max=331.31ms p(90)=48.45ms  p(95)=51.23ms  p(99.9)=65.96ms
     iterations.....................: 148484  1217.21126/s
     success_rate...................: 100.00% ✓ 148484      ✗ 0     
     vus............................: 0       min=0         max=50  
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

     checks.........................: 100.00% ✓ 205272     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   673 kB/s
     http_req_blocked...............: avg=4.26µs  min=1.06µs  med=2.56µs  max=4.25ms   p(90)=4.09µs   p(95)=4.72µs   p(99.9)=45.74µs 
     http_req_connecting............: avg=1.42µs  min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.36ms min=20.55ms med=85.48ms max=332.08ms p(90)=105.22ms p(95)=113.56ms p(99.9)=204.32ms
       { expected_response:true }...: avg=87.36ms min=20.55ms med=85.48ms max=332.08ms p(90)=105.22ms p(95)=113.56ms p(99.9)=204.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68524
     http_req_receiving.............: avg=82.12µs min=29.12µs med=72.68µs max=84.05ms  p(90)=108.1µs  p(95)=120.3µs  p(99.9)=601.54µs
     http_req_sending...............: avg=23.69µs min=5.07µs  med=12.76µs max=162.12ms p(90)=19.33µs  p(95)=21.62µs  p(99.9)=597.53µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.25ms min=20.46ms med=85.38ms max=331.84ms p(90)=105.12ms p(95)=113.39ms p(99.9)=203.86ms
     http_reqs......................: 68524   560.624998/s
     iteration_duration.............: avg=87.69ms min=36.36ms med=85.73ms max=343.61ms p(90)=105.45ms p(95)=113.9ms  p(99.9)=206.08ms
     iterations.....................: 68424   559.806854/s
     success_rate...................: 100.00% ✓ 68424      ✗ 0    
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

     checks.........................: 100.00% ✓ 157623     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   517 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.11µs  med=3.35µs   max=3.42ms   p(90)=4.85µs   p(95)=5.45µs   p(99.9)=70.31µs 
     http_req_connecting............: avg=1.8µs    min=0s      med=0s       max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.76ms min=21.44ms med=111.99ms max=330.03ms p(90)=141.61ms p(95)=151.11ms p(99.9)=191.84ms
       { expected_response:true }...: avg=113.76ms min=21.44ms med=111.99ms max=330.03ms p(90)=141.61ms p(95)=151.11ms p(99.9)=191.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52641
     http_req_receiving.............: avg=93.18µs  min=30.53µs med=86.12µs  max=137.56ms p(90)=118.04µs p(95)=131.2µs  p(99.9)=522.06µs
     http_req_sending...............: avg=21.61µs  min=5.3µs   med=16.17µs  max=87.66ms  p(90)=21.52µs  p(95)=23.44µs  p(99.9)=585.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.65ms min=21.22ms med=111.89ms max=329.41ms p(90)=141.5ms  p(95)=151.02ms p(99.9)=191.5ms 
     http_reqs......................: 52641   430.334694/s
     iteration_duration.............: avg=114.22ms min=31.95ms med=112.28ms max=369.23ms p(90)=141.9ms  p(95)=151.42ms p(99.9)=193.7ms 
     iterations.....................: 52541   429.517205/s
     success_rate...................: 100.00% ✓ 52541      ✗ 0    
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

     checks.........................: 100.00% ✓ 96015      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   314 kB/s
     http_req_blocked...............: avg=6.1µs    min=1.15µs  med=3.23µs   max=3.32ms   p(90)=4.63µs   p(95)=5.2µs    p(99.9)=1.25ms  
     http_req_connecting............: avg=2.59µs   min=0s      med=0s       max=3.28ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=186.74ms min=23.16ms med=187.12ms max=410.21ms p(90)=201.01ms p(95)=205.65ms p(99.9)=271.2ms 
       { expected_response:true }...: avg=186.74ms min=23.16ms med=187.12ms max=410.21ms p(90)=201.01ms p(95)=205.65ms p(99.9)=271.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32105
     http_req_receiving.............: avg=95.27µs  min=31.62µs med=90.44µs  max=58.32ms  p(90)=121.82µs p(95)=134.25µs p(99.9)=547.34µs
     http_req_sending...............: avg=43.37µs  min=5.31µs  med=17.94µs  max=178.08ms p(90)=22.79µs  p(95)=24.61µs  p(99.9)=547.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.6ms  min=23.05ms med=187ms    max=409.63ms p(90)=200.88ms p(95)=205.51ms p(99.9)=270.42ms
     http_reqs......................: 32105   261.792084/s
     iteration_duration.............: avg=187.56ms min=64.25ms med=187.45ms max=420.84ms p(90)=201.29ms p(95)=205.98ms p(99.9)=272.94ms
     iterations.....................: 32005   260.976659/s
     success_rate...................: 100.00% ✓ 32005      ✗ 0    
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

     checks.........................: 100.00% ✓ 94272      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=5.17µs   min=1.44µs  med=3.71µs   max=1.93ms   p(90)=5.18µs   p(95)=5.81µs   p(99.9)=421.37µs
     http_req_connecting............: avg=1.16µs   min=0s      med=0s       max=1.9ms    p(90)=0s       p(95)=0s       p(99.9)=398.42µs
     http_req_duration..............: avg=190.19ms min=17.94ms med=174.52ms max=693.23ms p(90)=245.3ms  p(95)=291.12ms p(99.9)=587.98ms
       { expected_response:true }...: avg=190.19ms min=17.94ms med=174.52ms max=693.23ms p(90)=245.3ms  p(95)=291.12ms p(99.9)=587.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31524
     http_req_receiving.............: avg=102.7µs  min=36.42µs med=91.91µs  max=91.9ms   p(90)=123.22µs p(95)=135.94µs p(99.9)=698.37µs
     http_req_sending...............: avg=23.44µs  min=6.59µs  med=18.71µs  max=22.93ms  p(90)=23.84µs  p(95)=25.81µs  p(99.9)=537.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.07ms min=17.79ms med=174.4ms  max=693.12ms p(90)=245.14ms p(95)=291ms    p(99.9)=587.85ms
     http_reqs......................: 31524   258.182827/s
     iteration_duration.............: avg=191.03ms min=46.8ms  med=174.94ms max=693.5ms  p(90)=245.77ms p(95)=292.95ms p(99.9)=588.26ms
     iterations.....................: 31424   257.363823/s
     success_rate...................: 100.00% ✓ 31424      ✗ 0    
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

     checks.........................: 100.00% ✓ 6504      ✗ 0   
     data_received..................: 217 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=126.87µs min=1.32µs  med=3.58µs  max=8.56ms  p(90)=5.13µs   p(95)=6.12µs   p(99.9)=8.11ms 
     http_req_connecting............: avg=119.5µs  min=0s      med=0s      max=8.52ms  p(90)=0s       p(95)=0s       p(99.9)=8.08ms 
     http_req_duration..............: avg=2.67s    min=40.23ms med=2.75s   max=4.86s   p(90)=3.42s    p(95)=3.62s    p(99.9)=4.56s  
       { expected_response:true }...: avg=2.67s    min=40.23ms med=2.75s   max=4.86s   p(90)=3.42s    p(95)=3.62s    p(99.9)=4.56s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2268
     http_req_receiving.............: avg=99.71µs  min=36.51µs med=94.54µs max=1.7ms   p(90)=137.19µs p(95)=157.54µs p(99.9)=377.6µs
     http_req_sending...............: avg=56.43µs  min=6.54µs  med=18.59µs max=11.89ms p(90)=24.58µs  p(95)=30.58µs  p(99.9)=3.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.67s    min=40.08ms med=2.75s   max=4.86s   p(90)=3.42s    p(95)=3.62s    p(99.9)=4.56s  
     http_reqs......................: 2268    17.830294/s
     iteration_duration.............: avg=2.79s    min=761.2ms med=2.78s   max=4.86s   p(90)=3.44s    p(95)=3.64s    p(99.9)=4.57s  
     iterations.....................: 2168    17.044126/s
     success_rate...................: 100.00% ✓ 2168      ✗ 0   
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

