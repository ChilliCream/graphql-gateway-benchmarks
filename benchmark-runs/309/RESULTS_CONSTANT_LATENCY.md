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
| fusion | 16.6.0 | 1,892 | 1,926 | 1,884 | 0.7% |  |
| hive-router | v0.0.84 | 1,871 | 1,917 | 1,854 | 1.0% |  |
| grafbase | 0.53.5 | 1,317 | 1,329 | 1,311 | 0.4% |  |
| cosmo | 0.334.0 | 1,201 | 1,257 | 1,192 | 1.8% |  |
| hive-gateway-router-runtime | 2.10.8 | 558 | 579 | 553 | 1.6% |  |
| apollo-router | v2.16.1 | 433 | 452 | 431 | 1.7% |  |
| apollo-gateway | 2.14.3 | 266 | 269 | 266 | 0.4% |  |
| hive-gateway | 2.10.8 | 254 | 261 | 252 | 1.3% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 20 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 692097      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.99µs   min=862ns   med=2.24µs  max=3.37ms   p(90)=3.91µs   p(95)=4.67µs  p(99.9)=32.29µs
     http_req_connecting............: avg=368ns    min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.78ms  min=17.16ms med=25.2ms  max=303.84ms p(90)=30.12ms  p(95)=31.9ms  p(99.9)=49.79ms
       { expected_response:true }...: avg=25.78ms  min=17.16ms med=25.2ms  max=303.84ms p(90)=30.12ms  p(95)=31.9ms  p(99.9)=49.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230799
     http_req_receiving.............: avg=291.13µs min=50.04µs med=92.65µs max=26.94ms  p(90)=726.48µs p(95)=1.21ms  p(99.9)=7.3ms  
     http_req_sending...............: avg=31.61µs  min=4.47µs  med=8.88µs  max=148.55ms p(90)=18.41µs  p(95)=37.26µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.46ms  min=17.08ms med=24.89ms max=303.27ms p(90)=29.73ms  p(95)=31.48ms p(99.9)=48.11ms
     http_reqs......................: 230799  1892.946928/s
     iteration_duration.............: avg=26ms     min=17.32ms med=25.4ms  max=326.28ms p(90)=30.33ms  p(95)=32.11ms p(99.9)=50.2ms 
     iterations.....................: 230699  1892.126757/s
     success_rate...................: 100.00% ✓ 230699      ✗ 0     
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

     checks.........................: 100.00% ✓ 684192      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.49µs  min=1.03µs  med=2.72µs  max=4.87ms   p(90)=4.42µs  p(95)=5.15µs   p(99.9)=38.97µs
     http_req_connecting............: avg=376ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.07ms min=17.82ms med=25.6ms  max=306.01ms p(90)=29.72ms p(95)=31.16ms  p(99.9)=48.66ms
       { expected_response:true }...: avg=26.07ms min=17.82ms med=25.6ms  max=306.01ms p(90)=29.72ms p(95)=31.16ms  p(99.9)=48.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228164
     http_req_receiving.............: avg=77.8µs  min=25.35µs med=52.11µs max=136.38ms p(90)=97.04µs p(95)=126.56µs p(99.9)=2.18ms 
     http_req_sending...............: avg=33.19µs min=4.59µs  med=10.77µs max=123.81ms p(90)=19.61µs p(95)=28.7µs   p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=25.96ms min=17.68ms med=25.5ms  max=305.39ms p(90)=29.6ms  p(95)=31.02ms  p(99.9)=48ms   
     http_reqs......................: 228164  1871.528057/s
     iteration_duration.............: avg=26.29ms min=18.15ms med=25.81ms max=327.83ms p(90)=29.93ms p(95)=31.37ms  p(99.9)=48.96ms
     iterations.....................: 228064  1870.707801/s
     success_rate...................: 100.00% ✓ 228064      ✗ 0     
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

     checks.........................: 100.00% ✓ 482025      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=4.11µs  min=941ns   med=3.03µs  max=5.53ms   p(90)=5.37µs   p(95)=6.35µs   p(99.9)=44.96µs
     http_req_connecting............: avg=542ns   min=0s      med=0s      max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.06ms min=18.15ms med=36.72ms max=300.04ms p(90)=43.61ms  p(95)=45.69ms  p(99.9)=64.86ms
       { expected_response:true }...: avg=37.06ms min=18.15ms med=36.72ms max=300.04ms p(90)=43.61ms  p(95)=45.69ms  p(99.9)=64.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160775
     http_req_receiving.............: avg=94.05µs min=27.49µs med=61.91µs max=121.89ms p(90)=131.15µs p(95)=181.83µs p(99.9)=2.25ms 
     http_req_sending...............: avg=39.47µs min=4.95µs  med=11.7µs  max=205.36ms p(90)=25.67µs  p(95)=74.03µs  p(99.9)=2.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.93ms min=17.99ms med=36.6ms  max=299.66ms p(90)=43.48ms  p(95)=45.54ms  p(99.9)=63.97ms
     http_reqs......................: 160775  1317.919983/s
     iteration_duration.............: avg=37.33ms min=20.93ms med=36.97ms max=320.38ms p(90)=43.83ms  p(95)=45.92ms  p(99.9)=65.15ms
     iterations.....................: 160675  1317.100254/s
     success_rate...................: 100.00% ✓ 160675      ✗ 0     
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

     checks.........................: 100.00% ✓ 439377      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 176 MB  1.4 MB/s
     http_req_blocked...............: avg=3.19µs  min=972ns   med=2.27µs  max=3.48ms   p(90)=3.89µs   p(95)=4.58µs   p(99.9)=35.21µs 
     http_req_connecting............: avg=580ns   min=0s      med=0s      max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.73ms min=18.56ms med=40.09ms max=312.38ms p(90)=49.14ms  p(95)=52.05ms  p(99.9)=67.13ms 
       { expected_response:true }...: avg=40.73ms min=18.56ms med=40.09ms max=312.38ms p(90)=49.14ms  p(95)=52.05ms  p(99.9)=67.13ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 146559
     http_req_receiving.............: avg=85.22µs min=26.81µs med=65.29µs max=182.23ms p(90)=106.64µs p(95)=124.56µs p(99.9)=862.19µs
     http_req_sending...............: avg=23.38µs min=4.8µs   med=10.79µs max=143.77ms p(90)=18.55µs  p(95)=22.31µs  p(99.9)=950.94µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.62ms min=18.43ms med=39.99ms max=295.33ms p(90)=49.04ms  p(95)=51.94ms  p(99.9)=66.98ms 
     http_reqs......................: 146559  1201.431758/s
     iteration_duration.............: avg=40.96ms min=22.95ms med=40.3ms  max=321.56ms p(90)=49.35ms  p(95)=52.25ms  p(99.9)=67.48ms 
     iterations.....................: 146459  1200.611998/s
     success_rate...................: 100.00% ✓ 146459      ✗ 0     
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

     checks.........................: 100.00% ✓ 204471     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   671 kB/s
     http_req_blocked...............: avg=5.7µs   min=1.23µs  med=3.37µs  max=4.86ms   p(90)=4.94µs   p(95)=5.61µs   p(99.9)=50.82µs 
     http_req_connecting............: avg=2.07µs  min=0s      med=0s      max=4.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.67ms min=20.61ms med=86.38ms max=337.99ms p(90)=103.34ms p(95)=111.74ms p(99.9)=198.16ms
       { expected_response:true }...: avg=87.67ms min=20.61ms med=86.38ms max=337.99ms p(90)=103.34ms p(95)=111.74ms p(99.9)=198.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68257
     http_req_receiving.............: avg=91.14µs min=30.62µs med=79.08µs max=172.66ms p(90)=114.98µs p(95)=128.01µs p(99.9)=628.92µs
     http_req_sending...............: avg=26.65µs min=5.54µs  med=15.51µs max=159.28ms p(90)=22.24µs  p(95)=24.56µs  p(99.9)=623.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.55ms min=20.46ms med=86.28ms max=337.7ms  p(90)=103.23ms p(95)=111.63ms p(99.9)=197.29ms
     http_reqs......................: 68257   558.368912/s
     iteration_duration.............: avg=88.03ms min=33.22ms med=86.66ms max=351.11ms p(90)=103.6ms  p(95)=112.02ms p(99.9)=199.33ms
     iterations.....................: 68157   557.550873/s
     success_rate...................: 100.00% ✓ 68157      ✗ 0    
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

     checks.........................: 100.00% ✓ 158640     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   520 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.15µs  med=3.8µs    max=4.07ms   p(90)=5.47µs   p(95)=6.13µs   p(99.9)=145.49µs
     http_req_connecting............: avg=1.9µs    min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.02ms min=20.82ms med=111.21ms max=335.98ms p(90)=140.84ms p(95)=150.14ms p(99.9)=190.53ms
       { expected_response:true }...: avg=113.02ms min=20.82ms med=111.21ms max=335.98ms p(90)=140.84ms p(95)=150.14ms p(99.9)=190.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52980
     http_req_receiving.............: avg=90.58µs  min=28.96µs med=85.13µs  max=105.21ms p(90)=116.91µs p(95)=129.25µs p(99.9)=613.26µs
     http_req_sending...............: avg=27.11µs  min=5.35µs  med=18.25µs  max=106.41ms p(90)=23.81µs  p(95)=25.94µs  p(99.9)=604.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.9ms  min=20.67ms med=111.1ms  max=335.55ms p(90)=140.72ms p(95)=150.03ms p(99.9)=190.25ms
     http_reqs......................: 52980   433.14651/s
     iteration_duration.............: avg=113.49ms min=39.42ms med=111.53ms max=345.15ms p(90)=141.14ms p(95)=150.45ms p(99.9)=192.69ms
     iterations.....................: 52880   432.328943/s
     success_rate...................: 100.00% ✓ 52880      ✗ 0    
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

     checks.........................: 100.00% ✓ 97839      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.36µs   min=1.32µs  med=3.8µs    max=3.02ms   p(90)=5.33µs   p(95)=5.91µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=2.98ms   p(90)=0s       p(95)=0s       p(99.9)=970.47µs
     http_req_duration..............: avg=183.28ms min=23.49ms med=184.37ms max=361.2ms  p(90)=207.1ms  p(95)=213.28ms p(99.9)=278.19ms
       { expected_response:true }...: avg=183.28ms min=23.49ms med=184.37ms max=361.2ms  p(90)=207.1ms  p(95)=213.28ms p(99.9)=278.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32713
     http_req_receiving.............: avg=97.9µs   min=35.74µs med=93.09µs  max=2.72ms   p(90)=126.11µs p(95)=140.51µs p(99.9)=563.1µs 
     http_req_sending...............: avg=33.52µs  min=6.59µs  med=19.37µs  max=81.63ms  p(90)=24.59µs  p(95)=26.5µs   p(99.9)=853.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.15ms min=23.33ms med=184.22ms max=360.19ms p(90)=206.99ms p(95)=213.17ms p(99.9)=278.07ms
     http_reqs......................: 32713   266.681595/s
     iteration_duration.............: avg=184.09ms min=42.19ms med=184.87ms max=375.35ms p(90)=207.41ms p(95)=213.59ms p(99.9)=280.22ms
     iterations.....................: 32613   265.866379/s
     success_rate...................: 100.00% ✓ 32613      ✗ 0    
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

     checks.........................: 100.00% ✓ 92937      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=6.66µs   min=1.11µs  med=3.36µs   max=4.2ms    p(90)=4.76µs   p(95)=5.32µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=3.09µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=192.96ms min=18.45ms med=179.72ms max=686.29ms p(90)=234.33ms p(95)=266.57ms p(99.9)=611.58ms
       { expected_response:true }...: avg=192.96ms min=18.45ms med=179.72ms max=686.29ms p(90)=234.33ms p(95)=266.57ms p(99.9)=611.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31079
     http_req_receiving.............: avg=94.5µs   min=32.12µs med=89.65µs  max=51.53ms  p(90)=120.36µs p(95)=132.87µs p(99.9)=569.4µs 
     http_req_sending...............: avg=23.06µs  min=5.61µs  med=17.85µs  max=28.99ms  p(90)=22.49µs  p(95)=24.44µs  p(99.9)=533.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.84ms min=18.35ms med=179.6ms  max=686.19ms p(90)=234.24ms p(95)=266.45ms p(99.9)=611.48ms
     http_reqs......................: 31079   254.245188/s
     iteration_duration.............: avg=193.81ms min=57.58ms med=180.18ms max=686.54ms p(90)=234.75ms p(95)=267.64ms p(99.9)=611.89ms
     iterations.....................: 30979   253.427127/s
     success_rate...................: 100.00% ✓ 30979      ✗ 0    
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

     checks.........................: 100.00% ✓ 7521      ✗ 0   
     data_received..................: 250 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=42.67µs  min=1.56µs   med=4.01µs   max=4.18ms p(90)=5.66µs   p(95)=6.81µs   p(99.9)=3.85ms
     http_req_connecting............: avg=37.87µs  min=0s       med=0s       max=4.13ms p(90)=0s       p(95)=0s       p(99.9)=3.81ms
     http_req_duration..............: avg=2.31s    min=37.86ms  med=2.38s    max=4.46s  p(90)=3.15s    p(95)=3.34s    p(99.9)=4.19s 
       { expected_response:true }...: avg=2.31s    min=37.86ms  med=2.38s    max=4.46s  p(90)=3.15s    p(95)=3.34s    p(99.9)=4.19s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2607
     http_req_receiving.............: avg=111.16µs min=36.04µs  med=101.46µs max=2.72ms p(90)=147.46µs p(95)=167.17µs p(99.9)=1.54ms
     http_req_sending...............: avg=33.58µs  min=7.52µs   med=20.13µs  max=4.78ms p(90)=25.63µs  p(95)=29.5µs   p(99.9)=1.7ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.31s    min=37.73ms  med=2.38s    max=4.46s  p(90)=3.15s    p(95)=3.34s    p(99.9)=4.19s 
     http_reqs......................: 2607    20.644522/s
     iteration_duration.............: avg=2.4s     min=603.33ms med=2.4s     max=4.46s  p(90)=3.17s    p(95)=3.35s    p(99.9)=4.19s 
     iterations.....................: 2507    19.852634/s
     success_rate...................: 100.00% ✓ 2507      ✗ 0   
     vus............................: 17      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

