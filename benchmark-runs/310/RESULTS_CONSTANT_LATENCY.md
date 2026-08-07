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
| fusion | 16.6.0 | 1,880 | 1,919 | 1,875 | 0.8% |  |
| hive-router | v0.0.84 | 1,848 | 1,918 | 1,839 | 1.5% |  |
| grafbase | 0.53.5 | 1,275 | 1,301 | 1,267 | 0.9% |  |
| cosmo | 0.334.0 | 1,171 | 1,212 | 1,163 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 552 | 572 | 548 | 1.4% |  |
| apollo-router | v2.16.1 | 395 | 414 | 392 | 2.2% |  |
| apollo-gateway | 2.14.3 | 260 | 265 | 258 | 0.8% |  |
| hive-gateway | 2.10.8 | 252 | 262 | 250 | 1.5% |  |
| feddi | 5ff8b6165878 | 19 | 20 | 19 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687321      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.85µs   min=841ns   med=2.06µs  max=4.05ms   p(90)=3.72µs   p(95)=4.44µs  p(99.9)=27.66µs
     http_req_connecting............: avg=384ns    min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.96ms  min=17.71ms med=25.34ms max=298.84ms p(90)=30.39ms  p(95)=32.21ms p(99.9)=49.76ms
       { expected_response:true }...: avg=25.96ms  min=17.71ms med=25.34ms max=298.84ms p(90)=30.39ms  p(95)=32.21ms p(99.9)=49.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229207
     http_req_receiving.............: avg=324.37µs min=50.56µs med=96.95µs max=190.53ms p(90)=825.54µs p(95)=1.3ms   p(99.9)=8.51ms 
     http_req_sending...............: avg=31.62µs  min=4.34µs  med=8.61µs  max=219.45ms p(90)=18.5µs   p(95)=29.37µs p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.61ms  min=17.4ms  med=25.01ms max=298.35ms p(90)=29.94ms  p(95)=31.75ms p(99.9)=48.18ms
     http_reqs......................: 229207  1880.012469/s
     iteration_duration.............: avg=26.18ms  min=17.84ms med=25.55ms max=309.05ms p(90)=30.59ms  p(95)=32.41ms p(99.9)=50.16ms
     iterations.....................: 229107  1879.192244/s
     success_rate...................: 100.00% ✓ 229107      ✗ 0     
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

     checks.........................: 100.00% ✓ 675825      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3µs     min=872ns   med=2.15µs  max=5.24ms   p(90)=3.76µs  p(95)=4.45µs   p(99.9)=34.22µs
     http_req_connecting............: avg=438ns   min=0s      med=0s      max=3.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.41ms min=18.08ms med=25.97ms max=311.99ms p(90)=30.15ms p(95)=31.61ms  p(99.9)=47.67ms
       { expected_response:true }...: avg=26.41ms min=18.08ms med=25.97ms max=311.99ms p(90)=30.15ms p(95)=31.61ms  p(99.9)=47.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225375
     http_req_receiving.............: avg=73.84µs min=25.05µs med=49.02µs max=164.55ms p(90)=92.27µs p(95)=118.86µs p(99.9)=2.01ms 
     http_req_sending...............: avg=29.97µs min=4.47µs  med=9.24µs  max=217.91ms p(90)=17.6µs  p(95)=24.81µs  p(99.9)=1.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.3ms  min=17.95ms med=25.88ms max=311.59ms p(90)=30.05ms p(95)=31.48ms  p(99.9)=45.99ms
     http_reqs......................: 225375  1848.099076/s
     iteration_duration.............: avg=26.62ms min=18.54ms med=26.17ms max=321.22ms p(90)=30.36ms p(95)=31.81ms  p(99.9)=48.03ms
     iterations.....................: 225275  1847.279065/s
     success_rate...................: 100.00% ✓ 225275      ✗ 0     
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

     checks.........................: 100.00% ✓ 466434      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 187 MB  1.5 MB/s
     http_req_blocked...............: avg=3.34µs  min=891ns   med=2.18µs  max=3.59ms   p(90)=4.53µs   p(95)=5.51µs   p(99.9)=40.45µs
     http_req_connecting............: avg=567ns   min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.33ms min=17.97ms med=38.11ms max=322.49ms p(90)=45.15ms  p(95)=47.24ms  p(99.9)=62.27ms
       { expected_response:true }...: avg=38.33ms min=17.97ms med=38.11ms max=322.49ms p(90)=45.15ms  p(95)=47.24ms  p(99.9)=62.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155578
     http_req_receiving.............: avg=84µs    min=27.25µs med=55.08µs max=45.85ms  p(90)=123.77µs p(95)=170.39µs p(99.9)=2.07ms 
     http_req_sending...............: avg=29.47µs min=4.67µs  med=9.18µs  max=28.55ms  p(90)=23.33µs  p(95)=48.65µs  p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.22ms min=17.88ms med=38ms    max=321.68ms p(90)=45.04ms  p(95)=47.11ms  p(99.9)=61.44ms
     http_reqs......................: 155578  1275.411638/s
     iteration_duration.............: avg=38.58ms min=21.89ms med=38.33ms max=339.43ms p(90)=45.36ms  p(95)=47.46ms  p(99.9)=62.84ms
     iterations.....................: 155478  1274.591849/s
     success_rate...................: 100.00% ✓ 155478      ✗ 0     
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

     checks.........................: 100.00% ✓ 428481      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.29µs  min=922ns   med=2.2µs   max=3.68ms   p(90)=3.77µs  p(95)=4.48µs   p(99.9)=33.95µs 
     http_req_connecting............: avg=740ns   min=0s      med=0s      max=3.63ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.77ms min=18.37ms med=41.11ms max=302.79ms p(90)=50.47ms p(95)=53.43ms  p(99.9)=68.84ms 
       { expected_response:true }...: avg=41.77ms min=18.37ms med=41.11ms max=302.79ms p(90)=50.47ms p(95)=53.43ms  p(99.9)=68.84ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142927
     http_req_receiving.............: avg=79.75µs min=26.63µs med=65.42µs max=105.87ms p(90)=108.4µs p(95)=126.71µs p(99.9)=781.16µs
     http_req_sending...............: avg=21.47µs min=4.61µs  med=10.75µs max=79.34ms  p(90)=18.25µs p(95)=21.95µs  p(99.9)=857.02µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.67ms min=18.28ms med=41.01ms max=302.29ms p(90)=50.37ms p(95)=53.32ms  p(99.9)=68.57ms 
     http_reqs......................: 142927  1171.53204/s
     iteration_duration.............: avg=42ms    min=23.05ms med=41.31ms max=320.35ms p(90)=50.68ms p(95)=53.63ms  p(99.9)=69.22ms 
     iterations.....................: 142827  1170.712368/s
     success_rate...................: 100.00% ✓ 142827      ✗ 0     
     vus............................: 30      min=0         max=50  
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

     checks.........................: 100.00% ✓ 202251     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   663 kB/s
     http_req_blocked...............: avg=4.19µs  min=1.02µs  med=2.71µs  max=3.39ms   p(90)=4.14µs   p(95)=4.76µs   p(99.9)=46.44µs 
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.66ms min=21.37ms med=87.25ms max=317.69ms p(90)=105.62ms p(95)=114.82ms p(99.9)=203.16ms
       { expected_response:true }...: avg=88.66ms min=21.37ms med=87.25ms max=317.69ms p(90)=105.62ms p(95)=114.82ms p(99.9)=203.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67517
     http_req_receiving.............: avg=86.61µs min=29.37µs med=73.88µs max=163.5ms  p(90)=111.05µs p(95)=124.95µs p(99.9)=669.5µs 
     http_req_sending...............: avg=24.94µs min=4.96µs  med=14.05µs max=104.92ms p(90)=20.74µs  p(95)=22.88µs  p(99.9)=580.35µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.55ms min=21.2ms  med=87.15ms max=316.69ms p(90)=105.51ms p(95)=114.7ms  p(99.9)=202.84ms
     http_reqs......................: 67517   552.268888/s
     iteration_duration.............: avg=89.01ms min=36.47ms med=87.51ms max=338.19ms p(90)=105.86ms p(95)=115.08ms p(99.9)=205.95ms
     iterations.....................: 67417   551.450918/s
     success_rate...................: 100.00% ✓ 67417      ✗ 0    
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

     checks.........................: 100.00% ✓ 144795     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=5.33µs   min=1.13µs  med=3.05µs   max=3.86ms   p(90)=4.51µs   p(95)=5.07µs   p(99.9)=740.49µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=701µs   
     http_req_duration..............: avg=123.87ms min=21.12ms med=121.77ms max=343.35ms p(90)=155.19ms p(95)=165.22ms p(99.9)=211.24ms
       { expected_response:true }...: avg=123.87ms min=21.12ms med=121.77ms max=343.35ms p(90)=155.19ms p(95)=165.22ms p(99.9)=211.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48365
     http_req_receiving.............: avg=85.95µs  min=28.35µs med=78.12µs  max=104.21ms p(90)=110.49µs p(95)=122.79µs p(99.9)=473.55µs
     http_req_sending...............: avg=24.45µs  min=5.25µs  med=15.57µs  max=124.43ms p(90)=21.06µs  p(95)=22.97µs  p(99.9)=476.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.76ms min=21.03ms med=121.66ms max=335.96ms p(90)=155.04ms p(95)=165.09ms p(99.9)=210.59ms
     http_reqs......................: 48365   395.311387/s
     iteration_duration.............: avg=124.34ms min=46.41ms med=122.05ms max=364.28ms p(90)=155.48ms p(95)=165.5ms  p(99.9)=213.23ms
     iterations.....................: 48265   394.494037/s
     success_rate...................: 100.00% ✓ 48265      ✗ 0    
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

     checks.........................: 100.00% ✓ 95418      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.41µs   min=1.22µs  med=3.27µs   max=3.96ms   p(90)=4.67µs   p(95)=5.22µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=2.86µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=187.93ms min=23.41ms med=187.22ms max=397.58ms p(90)=200.38ms p(95)=205.1ms  p(99.9)=275.83ms
       { expected_response:true }...: avg=187.93ms min=23.41ms med=187.22ms max=397.58ms p(90)=200.38ms p(95)=205.1ms  p(99.9)=275.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31906
     http_req_receiving.............: avg=95.26µs  min=31.89µs med=88.59µs  max=108.27ms p(90)=118.95µs p(95)=130.25µs p(99.9)=614.3µs 
     http_req_sending...............: avg=31.35µs  min=5.64µs  med=17.76µs  max=89.93ms  p(90)=22.25µs  p(95)=24.13µs  p(99.9)=570.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.8ms  min=23.27ms med=187.11ms max=396.76ms p(90)=200.27ms p(95)=204.99ms p(99.9)=274.99ms
     http_reqs......................: 31906   260.187331/s
     iteration_duration.............: avg=188.75ms min=37.4ms  med=187.57ms max=410.2ms  p(90)=200.68ms p(95)=205.43ms p(99.9)=279.17ms
     iterations.....................: 31806   259.37185/s
     success_rate...................: 100.00% ✓ 31806      ✗ 0    
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

     checks.........................: 100.00% ✓ 92091      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   303 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.18µs  med=3.11µs   max=3.55ms   p(90)=4.47µs   p(95)=5.02µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.16µs   min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=194.74ms min=18.34ms med=183.6ms  max=629.59ms p(90)=227.48ms p(95)=262.54ms p(99.9)=562.3ms 
       { expected_response:true }...: avg=194.74ms min=18.34ms med=183.6ms  max=629.59ms p(90)=227.48ms p(95)=262.54ms p(99.9)=562.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30797
     http_req_receiving.............: avg=93.57µs  min=33.27µs med=89.93µs  max=9.09ms   p(90)=120.8µs  p(95)=133.74µs p(99.9)=870.65µs
     http_req_sending...............: avg=21.18µs  min=5.24µs  med=17.45µs  max=32.27ms  p(90)=21.83µs  p(95)=23.68µs  p(99.9)=494.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.63ms min=18.19ms med=183.5ms  max=629.46ms p(90)=227.37ms p(95)=262.43ms p(99.9)=562.2ms 
     http_reqs......................: 30797   252.206099/s
     iteration_duration.............: avg=195.58ms min=71.58ms med=183.97ms max=629.84ms p(90)=227.84ms p(95)=263.63ms p(99.9)=562.65ms
     iterations.....................: 30697   251.387168/s
     success_rate...................: 100.00% ✓ 30697      ✗ 0    
     vus............................: 42      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7020      ✗ 0   
     data_received..................: 234 MB  1.8 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=117.88µs min=1.53µs   med=3.7µs   max=8.55ms  p(90)=5.38µs   p(95)=6.22µs   p(99.9)=8.04ms  
     http_req_connecting............: avg=110.2µs  min=0s       med=0s      max=8.51ms  p(90)=0s       p(95)=0s       p(99.9)=7.76ms  
     http_req_duration..............: avg=2.49s    min=37.1ms   med=2.56s   max=4.77s   p(90)=3.22s    p(95)=3.45s    p(99.9)=4.42s   
       { expected_response:true }...: avg=2.49s    min=37.1ms   med=2.56s   max=4.77s   p(90)=3.22s    p(95)=3.45s    p(99.9)=4.42s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2440
     http_req_receiving.............: avg=111.85µs min=36.83µs  med=96.73µs max=24.15ms p(90)=143.08µs p(95)=162.05µs p(99.9)=375.67µs
     http_req_sending...............: avg=41.64µs  min=6.14µs   med=19.15µs max=8.19ms  p(90)=24.64µs  p(95)=28.75µs  p(99.9)=1.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.49s    min=36.99ms  med=2.56s   max=4.77s   p(90)=3.22s    p(95)=3.45s    p(99.9)=4.42s   
     http_reqs......................: 2440    19.116048/s
     iteration_duration.............: avg=2.59s    min=271.12ms med=2.57s   max=4.77s   p(90)=3.23s    p(95)=3.47s    p(99.9)=4.42s   
     iterations.....................: 2340    18.332604/s
     success_rate...................: 100.00% ✓ 2340      ✗ 0   
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

