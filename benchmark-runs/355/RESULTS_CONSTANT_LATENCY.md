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
| fusion-nightly | 16.7.0-p.8 | 1,879 | 1,930 | 1,873 | 1.0% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 1,876 | 1,925 | 1,866 | 1.1% |  |
| fusion | 16.6.6 | 1,875 | 1,929 | 1,862 | 1.2% |  |
| hive-router | v0.0.84 | 1,833 | 1,909 | 1,800 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 1,809 | 1,865 | 1,800 | 1.2% |  |
| grafbase | 0.53.5 | 1,266 | 1,300 | 1,264 | 1.1% |  |
| cosmo | 0.334.0 | 1,225 | 1,270 | 1,221 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 549 | 569 | 546 | 1.4% |  |
| apollo-router | v2.16.1 | 431 | 448 | 427 | 1.7% |  |
| apollo-gateway | 2.14.3 | 263 | 266 | 262 | 0.4% |  |
| hive-gateway | 2.10.8 | 261 | 269 | 260 | 1.3% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.0% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687009      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.46µs   min=1.02µs  med=2.55µs  max=7.75ms   p(90)=4.2µs    p(95)=4.94µs  p(99.9)=38.11µs
     http_req_connecting............: avg=472ns    min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.96ms  min=17.49ms med=25.33ms max=301.06ms p(90)=30.45ms  p(95)=32.33ms p(99.9)=51.39ms
       { expected_response:true }...: avg=25.96ms  min=17.49ms med=25.33ms max=301.06ms p(90)=30.45ms  p(95)=32.33ms p(99.9)=51.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229103
     http_req_receiving.............: avg=305.45µs min=50.11µs med=96.07µs max=173.62ms p(90)=752.17µs p(95)=1.27ms  p(99.9)=8.54ms 
     http_req_sending...............: avg=34.18µs  min=4.66µs  med=9.78µs  max=160.67ms p(90)=19.18µs  p(95)=49.18µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.62ms  min=17.2ms  med=25.01ms max=293.48ms p(90)=30.04ms  p(95)=31.88ms p(99.9)=49.58ms
     http_reqs......................: 229103  1879.053347/s
     iteration_duration.............: avg=26.19ms  min=17.7ms  med=25.54ms max=315.41ms p(90)=30.66ms  p(95)=32.54ms p(99.9)=51.79ms
     iterations.....................: 229003  1878.233169/s
     success_rate...................: 100.00% ✓ 229003      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 685896      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.76µs   min=892ns   med=1.9µs   max=4.96ms   p(90)=3.59µs  p(95)=4.34µs  p(99.9)=29.68µs
     http_req_connecting............: avg=390ns    min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.02ms  min=17.64ms med=25.46ms max=305.96ms p(90)=30.24ms p(95)=32.04ms p(99.9)=49.19ms
       { expected_response:true }...: avg=26.02ms  min=17.64ms med=25.46ms max=305.96ms p(90)=30.24ms p(95)=32.04ms p(99.9)=49.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228732
     http_req_receiving.............: avg=397.11µs min=48.53µs med=89.96µs max=148.43ms p(90)=1.15ms  p(95)=1.91ms  p(99.9)=9.6ms  
     http_req_sending...............: avg=32.71µs  min=4.3µs   med=8.18µs  max=138.9ms  p(90)=18.38µs p(95)=32.12µs p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.59ms  min=17.36ms med=25.06ms max=305.23ms p(90)=29.63ms p(95)=31.36ms p(99.9)=46.95ms
     http_reqs......................: 228732  1876.045218/s
     iteration_duration.............: avg=26.23ms  min=17.8ms  med=25.66ms max=315.82ms p(90)=30.44ms p(95)=32.24ms p(99.9)=49.56ms
     iterations.....................: 228632  1875.225024/s
     success_rate...................: 100.00% ✓ 228632      ✗ 0     
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

     checks.........................: 100.00% ✓ 685938      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.41µs   min=822ns   med=1.92µs  max=8.5ms    p(90)=3.48µs  p(95)=4.21µs  p(99.9)=30.61µs
     http_req_connecting............: avg=1.03µs   min=0s      med=0s      max=8.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.02ms  min=17.67ms med=25.43ms max=290.05ms p(90)=30.43ms p(95)=32.29ms p(99.9)=49.26ms
       { expected_response:true }...: avg=26.02ms  min=17.67ms med=25.43ms max=290.05ms p(90)=30.43ms p(95)=32.29ms p(99.9)=49.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228746
     http_req_receiving.............: avg=312.93µs min=49.37µs med=93.87µs max=267.01ms p(90)=771.6µs p(95)=1.24ms  p(99.9)=8.72ms 
     http_req_sending...............: avg=30.82µs  min=4.52µs  med=8.22µs  max=260.83ms p(90)=17.99µs p(95)=27.27µs p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.67ms  min=17.54ms med=25.11ms max=273.58ms p(90)=30.03ms p(95)=31.83ms p(99.9)=47.53ms
     http_reqs......................: 228746  1875.970088/s
     iteration_duration.............: avg=26.23ms  min=17.84ms med=25.63ms max=322.88ms p(90)=30.63ms p(95)=32.49ms p(99.9)=49.69ms
     iterations.....................: 228646  1875.149977/s
     success_rate...................: 100.00% ✓ 228646      ✗ 0     
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

     checks.........................: 100.00% ✓ 670596      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.95µs  min=921ns   med=2.12µs  max=7.28ms   p(90)=3.78µs  p(95)=4.5µs    p(99.9)=29.26µs
     http_req_connecting............: avg=423ns   min=0s      med=0s      max=3.85ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.62ms min=18.49ms med=26.19ms max=305.4ms  p(90)=30.32ms p(95)=31.75ms  p(99.9)=47.21ms
       { expected_response:true }...: avg=26.62ms min=18.49ms med=26.19ms max=305.4ms  p(90)=30.32ms p(95)=31.75ms  p(99.9)=47.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223632
     http_req_receiving.............: avg=74.58µs min=26.34µs med=51.7µs  max=167.81ms p(90)=93.18µs p(95)=116.65µs p(99.9)=1.75ms 
     http_req_sending...............: avg=29.53µs min=4.51µs  med=9.42µs  max=156.29ms p(90)=18.08µs p(95)=24.45µs  p(99.9)=1.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.52ms min=18.39ms med=26.1ms  max=295.41ms p(90)=30.22ms p(95)=31.62ms  p(99.9)=46.04ms
     http_reqs......................: 223632  1833.537589/s
     iteration_duration.............: avg=26.83ms min=18.73ms med=26.39ms max=314.68ms p(90)=30.53ms p(95)=31.95ms  p(99.9)=47.62ms
     iterations.....................: 223532  1832.717699/s
     success_rate...................: 100.00% ✓ 223532      ✗ 0     
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

     checks.........................: 100.00% ✓ 661734      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=2.81µs   min=842ns   med=1.99µs  max=3.37ms   p(90)=3.57µs   p(95)=4.3µs   p(99.9)=26.2µs 
     http_req_connecting............: avg=435ns    min=0s      med=0s      max=3.34ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.97ms  min=17.3ms  med=26.38ms max=296.79ms p(90)=31.55ms  p(95)=33.43ms p(99.9)=50.05ms
       { expected_response:true }...: avg=26.97ms  min=17.3ms  med=26.38ms max=296.79ms p(90)=31.55ms  p(95)=33.43ms p(99.9)=50.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220678
     http_req_receiving.............: avg=327.02µs min=52.27µs med=99.79µs max=115.53ms p(90)=838.17µs p(95)=1.32ms  p(99.9)=8.15ms 
     http_req_sending...............: avg=33.3µs   min=4.77µs  med=8.67µs  max=224.62ms p(90)=18.33µs  p(95)=28.89µs p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.61ms  min=17.21ms med=26.03ms max=285.87ms p(90)=31.13ms  p(95)=32.96ms p(99.9)=47.98ms
     http_reqs......................: 220678  1809.405904/s
     iteration_duration.............: avg=27.19ms  min=17.5ms  med=26.58ms max=309ms    p(90)=31.75ms  p(95)=33.63ms p(99.9)=50.44ms
     iterations.....................: 220578  1808.585974/s
     success_rate...................: 100.00% ✓ 220578      ✗ 0     
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

     checks.........................: 100.00% ✓ 463284      ✗ 0     
     data_received..................: 14 GB   111 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=4.31µs  min=862ns   med=2.12µs  max=8.69ms   p(90)=4.62µs   p(95)=5.63µs   p(99.9)=40.76µs
     http_req_connecting............: avg=1.53µs  min=0s      med=0s      max=8.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.59ms min=18.33ms med=38.33ms max=308.22ms p(90)=45.37ms  p(95)=47.47ms  p(99.9)=62.08ms
       { expected_response:true }...: avg=38.59ms min=18.33ms med=38.33ms max=308.22ms p(90)=45.37ms  p(95)=47.47ms  p(99.9)=62.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154528
     http_req_receiving.............: avg=85.28µs min=27.09µs med=55.49µs max=123.59ms p(90)=123.23µs p(95)=169.58µs p(99.9)=1.72ms 
     http_req_sending...............: avg=31.4µs  min=4.55µs  med=9.16µs  max=69.21ms  p(90)=23.83µs  p(95)=49.61µs  p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.47ms min=18.2ms  med=38.22ms max=298.91ms p(90)=45.25ms  p(95)=47.33ms  p(99.9)=61.25ms
     http_reqs......................: 154528  1266.758631/s
     iteration_duration.............: avg=38.84ms min=20.29ms med=38.56ms max=319.44ms p(90)=45.58ms  p(95)=47.68ms  p(99.9)=62.6ms 
     iterations.....................: 154428  1265.938871/s
     success_rate...................: 100.00% ✓ 154428      ✗ 0     
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

     checks.........................: 100.00% ✓ 448089      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=4.11µs  min=1.13µs  med=3.07µs  max=4.89ms   p(90)=4.74µs  p(95)=5.48µs   p(99.9)=38.17µs 
     http_req_connecting............: avg=686ns   min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.91ms min=18.34ms med=39.32ms max=309.35ms p(90)=47.92ms p(95)=50.68ms  p(99.9)=66.42ms 
       { expected_response:true }...: avg=39.91ms min=18.34ms med=39.32ms max=309.35ms p(90)=47.92ms p(95)=50.68ms  p(99.9)=66.42ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149463
     http_req_receiving.............: avg=85.17µs min=26.58µs med=68.42µs max=119.3ms  p(90)=111.1µs p(95)=130.26µs p(99.9)=975.43µs
     http_req_sending...............: avg=27.65µs min=5.3µs   med=12.66µs max=70.4ms   p(90)=20.02µs p(95)=24.41µs  p(99.9)=1.1ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.8ms  min=18.19ms med=39.21ms max=309.01ms p(90)=47.8ms  p(95)=50.55ms  p(99.9)=66.1ms  
     http_reqs......................: 149463  1225.220093/s
     iteration_duration.............: avg=40.16ms min=22.37ms med=39.54ms max=325.41ms p(90)=48.14ms p(95)=50.9ms   p(99.9)=66.87ms 
     iterations.....................: 149363  1224.400344/s
     success_rate...................: 100.00% ✓ 149363      ✗ 0     
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

     checks.........................: 100.00% ✓ 201192     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   660 kB/s
     http_req_blocked...............: avg=5.11µs  min=1.2µs   med=3.29µs  max=4.07ms   p(90)=4.78µs   p(95)=5.45µs   p(99.9)=50.6µs  
     http_req_connecting............: avg=1.52µs  min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.11ms min=20.77ms med=87.87ms max=312.48ms p(90)=105.54ms p(95)=114.61ms p(99.9)=205.07ms
       { expected_response:true }...: avg=89.11ms min=20.77ms med=87.87ms max=312.48ms p(90)=105.54ms p(95)=114.61ms p(99.9)=205.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67164
     http_req_receiving.............: avg=92.51µs min=30.06µs med=78.99µs max=120.25ms p(90)=114.55µs p(95)=128.13µs p(99.9)=712.56µs
     http_req_sending...............: avg=25.25µs min=5.75µs  med=15.53µs max=128.35ms p(90)=21.96µs  p(95)=24.23µs  p(99.9)=591.71µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.99ms min=20.62ms med=87.76ms max=311.88ms p(90)=105.42ms p(95)=114.48ms p(99.9)=204.57ms
     http_reqs......................: 67164   549.280983/s
     iteration_duration.............: avg=89.48ms min=28.81ms med=88.13ms max=326.55ms p(90)=105.81ms p(95)=114.9ms  p(99.9)=206.24ms
     iterations.....................: 67064   548.463163/s
     success_rate...................: 100.00% ✓ 67064      ✗ 0    
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

     checks.........................: 100.00% ✓ 158019     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   518 kB/s
     http_req_blocked...............: avg=5.09µs   min=1.12µs  med=3.26µs   max=3.47ms   p(90)=4.75µs   p(95)=5.35µs   p(99.9)=104.55µs
     http_req_connecting............: avg=1.6µs    min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.47ms min=20.78ms med=111.62ms max=344.34ms p(90)=141.27ms p(95)=150.39ms p(99.9)=190.61ms
       { expected_response:true }...: avg=113.47ms min=20.78ms med=111.62ms max=344.34ms p(90)=141.27ms p(95)=150.39ms p(99.9)=190.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52773
     http_req_receiving.............: avg=89.61µs  min=30.62µs med=86.43µs  max=53.06ms  p(90)=117.04µs p(95)=129.87µs p(99.9)=561.23µs
     http_req_sending...............: avg=23.52µs  min=5.55µs  med=17.61µs  max=112.8ms  p(90)=22.88µs  p(95)=24.87µs  p(99.9)=534.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.36ms min=20.61ms med=111.52ms max=343.81ms p(90)=141.14ms p(95)=150.27ms p(99.9)=190.27ms
     http_reqs......................: 52773   431.444885/s
     iteration_duration.............: avg=113.93ms min=35.82ms med=111.93ms max=355.84ms p(90)=141.56ms p(95)=150.69ms p(99.9)=193.54ms
     iterations.....................: 52673   430.627336/s
     success_rate...................: 100.00% ✓ 52673      ✗ 0    
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

     checks.........................: 100.00% ✓ 96594      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=7.43µs   min=1.41µs  med=3.61µs   max=4.66ms   p(90)=5.15µs   p(95)=5.79µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=3.5µs    min=0s      med=0s       max=4.62ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=185.62ms min=23.29ms med=187.63ms max=382.94ms p(90)=199.49ms p(95)=203.83ms p(99.9)=271.26ms
       { expected_response:true }...: avg=185.62ms min=23.29ms med=187.63ms max=382.94ms p(90)=199.49ms p(95)=203.83ms p(99.9)=271.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32298
     http_req_receiving.............: avg=202.19µs min=35.74µs med=90.76µs  max=192.81ms p(90)=123.41µs p(95)=137.05µs p(99.9)=18.47ms 
     http_req_sending...............: avg=28.6µs   min=6.7µs   med=18.55µs  max=96.89ms  p(90)=23.74µs  p(95)=25.73µs  p(99.9)=603.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.39ms min=23.18ms med=187.51ms max=281.12ms p(90)=199.35ms p(95)=203.66ms p(99.9)=267.21ms
     http_reqs......................: 32298   263.319342/s
     iteration_duration.............: avg=186.45ms min=32.88ms med=187.93ms max=418.46ms p(90)=199.79ms p(95)=204.14ms p(99.9)=277.01ms
     iterations.....................: 32198   262.504061/s
     success_rate...................: 100.00% ✓ 32198      ✗ 0    
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

     checks.........................: 100.00% ✓ 95535      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=7.5µs    min=1.48µs  med=3.9µs    max=4.28ms   p(90)=5.43µs   p(95)=6.1µs    p(99.9)=1.62ms  
     http_req_connecting............: avg=3.31µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=187.7ms  min=18.37ms med=175.02ms max=637.74ms p(90)=227.24ms p(95)=259.32ms p(99.9)=561.47ms
       { expected_response:true }...: avg=187.7ms  min=18.37ms med=175.02ms max=637.74ms p(90)=227.24ms p(95)=259.32ms p(99.9)=561.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31945
     http_req_receiving.............: avg=101.87µs min=37.72µs med=94.13µs  max=30.49ms  p(90)=126.69µs p(95)=141.06µs p(99.9)=673.96µs
     http_req_sending...............: avg=28.86µs  min=6.79µs  med=19.44µs  max=136.26ms p(90)=24.64µs  p(95)=26.67µs  p(99.9)=543.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.57ms min=18.22ms med=174.9ms  max=637.63ms p(90)=227.09ms p(95)=259.17ms p(99.9)=561.38ms
     http_reqs......................: 31945   261.389514/s
     iteration_duration.............: avg=188.53ms min=35.9ms  med=175.5ms  max=637.99ms p(90)=227.63ms p(95)=260.11ms p(99.9)=561.78ms
     iterations.....................: 31845   260.571265/s
     success_rate...................: 100.00% ✓ 31845      ✗ 0    
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

     checks.........................: 100.00% ✓ 6399      ✗ 0   
     data_received..................: 214 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=48.57µs  min=1.23µs  med=3.41µs  max=4.12ms  p(90)=5.16µs   p(95)=6.14µs   p(99.9)=3.87ms 
     http_req_connecting............: avg=44.03µs  min=0s      med=0s      max=4.08ms  p(90)=0s       p(95)=0s       p(99.9)=3.84ms 
     http_req_duration..............: avg=2.71s    min=41.46ms med=2.8s    max=4.45s   p(90)=3.54s    p(95)=3.74s    p(99.9)=4.32s  
       { expected_response:true }...: avg=2.71s    min=41.46ms med=2.8s    max=4.45s   p(90)=3.54s    p(95)=3.74s    p(99.9)=4.32s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2233
     http_req_receiving.............: avg=138.91µs min=35.93µs med=94.78µs max=53.43ms p(90)=137.93µs p(95)=154.34µs p(99.9)=712.7µs
     http_req_sending...............: avg=99.19µs  min=6.4µs   med=18.18µs max=65.04ms p(90)=24.17µs  p(95)=29.67µs  p(99.9)=28.24ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.71s    min=41.17ms med=2.8s    max=4.45s   p(90)=3.54s    p(95)=3.74s    p(99.9)=4.32s  
     http_reqs......................: 2233    17.560523/s
     iteration_duration.............: avg=2.83s    min=1.21s   med=2.84s   max=4.45s   p(90)=3.57s    p(95)=3.75s    p(99.9)=4.32s  
     iterations.....................: 2133    16.774114/s
     success_rate...................: 100.00% ✓ 2133      ✗ 0   
     vus............................: 13      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

