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
| hive-router | v0.0.83 | 1,864 | 1,910 | 1,848 | 1.0% |  |
| fusion | 16.5.1 | 1,859 | 1,910 | 1,853 | 1.1% |  |
| grafbase | 0.53.5 | 1,324 | 1,342 | 1,313 | 0.7% |  |
| cosmo | 0.331.1 | 1,166 | 1,214 | 1,159 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.4 | 550 | 567 | 539 | 1.4% |  |
| apollo-router | v2.16.0 | 424 | 446 | 419 | 2.2% |  |
| apollo-gateway | 2.14.2 | 268 | 270 | 267 | 0.4% |  |
| hive-gateway | 2.10.4 | 258 | 266 | 257 | 1.1% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 22 | 2.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681675      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.2µs   min=892ns   med=2.42µs  max=5.95ms   p(90)=4.04µs  p(95)=4.76µs  p(99.9)=31.63µs
     http_req_connecting............: avg=372ns   min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.18ms min=17.88ms med=25.73ms max=306.29ms p(90)=29.91ms p(95)=31.36ms p(99.9)=47.67ms
       { expected_response:true }...: avg=26.18ms min=17.88ms med=25.73ms max=306.29ms p(90)=29.91ms p(95)=31.36ms p(99.9)=47.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227325
     http_req_receiving.............: avg=74.55µs min=24.17µs med=49.89µs max=204.45ms p(90)=92.41µs p(95)=119.1µs p(99.9)=1.79ms 
     http_req_sending...............: avg=30.5µs  min=4.56µs  med=9.84µs  max=125.69ms p(90)=18.22µs p(95)=25.46µs p(99.9)=1.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.07ms min=17.77ms med=25.64ms max=305.82ms p(90)=29.8ms  p(95)=31.24ms p(99.9)=46.31ms
     http_reqs......................: 227325  1864.032866/s
     iteration_duration.............: avg=26.39ms min=18.09ms med=25.93ms max=322.95ms p(90)=30.11ms p(95)=31.56ms p(99.9)=48.15ms
     iterations.....................: 227225  1863.21288/s
     success_rate...................: 100.00% ✓ 227225      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 679905      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.86µs  min=862ns   med=2µs     max=4.18ms   p(90)=3.59µs   p(95)=4.32µs  p(99.9)=31.13µs
     http_req_connecting............: avg=437ns   min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.25ms min=17.41ms med=25.69ms max=303.96ms p(90)=30.65ms  p(95)=32.44ms p(99.9)=48.58ms
       { expected_response:true }...: avg=26.25ms min=17.41ms med=25.69ms max=303.96ms p(90)=30.65ms  p(95)=32.44ms p(99.9)=48.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226735
     http_req_receiving.............: avg=323.5µs min=52.07µs med=97.84µs max=201.22ms p(90)=830.57µs p(95)=1.31ms  p(99.9)=7.44ms 
     http_req_sending...............: avg=30.77µs min=4.55µs  med=8.47µs  max=201.21ms p(90)=18.01µs  p(95)=27.77µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.89ms min=17.26ms med=25.35ms max=303.17ms p(90)=30.22ms  p(95)=31.98ms p(99.9)=46.93ms
     http_reqs......................: 226735  1859.407686/s
     iteration_duration.............: avg=26.46ms min=17.63ms med=25.89ms max=320.67ms p(90)=30.85ms  p(95)=32.64ms p(99.9)=48.85ms
     iterations.....................: 226635  1858.587607/s
     success_rate...................: 100.00% ✓ 226635      ✗ 0     
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

     checks.........................: 100.00% ✓ 484497      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 194 MB  1.6 MB/s
     http_req_blocked...............: avg=3.38µs  min=862ns   med=2.14µs  max=4.03ms   p(90)=4.55µs   p(95)=5.51µs   p(99.9)=35.7µs 
     http_req_connecting............: avg=650ns   min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=36.89ms min=17.7ms  med=36.67ms max=300.64ms p(90)=43.39ms  p(95)=45.38ms  p(99.9)=61.85ms
       { expected_response:true }...: avg=36.89ms min=17.7ms  med=36.67ms max=300.64ms p(90)=43.39ms  p(95)=45.38ms  p(99.9)=61.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161599
     http_req_receiving.............: avg=83.68µs min=26.21µs med=53.05µs max=128.86ms p(90)=119.48µs p(95)=163.13µs p(99.9)=1.98ms 
     http_req_sending...............: avg=32.11µs min=4.32µs  med=9.06µs  max=75.45ms  p(90)=23.51µs  p(95)=39.96µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.77ms min=17.58ms med=36.56ms max=300.37ms p(90)=43.28ms  p(95)=45.25ms  p(99.9)=60.75ms
     http_reqs......................: 161599  1324.865019/s
     iteration_duration.............: avg=37.14ms min=20.93ms med=36.9ms  max=313.09ms p(90)=43.61ms  p(95)=45.6ms   p(99.9)=62.25ms
     iterations.....................: 161499  1324.045171/s
     success_rate...................: 100.00% ✓ 161499      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 426702      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.81µs  min=1.15µs  med=2.76µs  max=4.19ms   p(90)=4.31µs   p(95)=5.04µs   p(99.9)=38.6µs  
     http_req_connecting............: avg=717ns   min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.94ms min=18.94ms med=41.32ms max=323.36ms p(90)=50.66ms  p(95)=53.78ms  p(99.9)=68.9ms  
       { expected_response:true }...: avg=41.94ms min=18.94ms med=41.32ms max=323.36ms p(90)=50.66ms  p(95)=53.78ms  p(99.9)=68.9ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 142334
     http_req_receiving.............: avg=84.48µs min=29.7µs  med=70.71µs max=197.9ms  p(90)=111.12µs p(95)=130.26µs p(99.9)=792.84µs
     http_req_sending...............: avg=25.81µs min=4.94µs  med=12.17µs max=130.6ms  p(90)=18.84µs  p(95)=22.77µs  p(99.9)=913.01µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.83ms min=18.79ms med=41.21ms max=323.04ms p(90)=50.55ms  p(95)=53.66ms  p(99.9)=68.61ms 
     http_reqs......................: 142334  1166.761552/s
     iteration_duration.............: avg=42.17ms min=21.72ms med=41.53ms max=332.61ms p(90)=50.88ms  p(95)=53.99ms  p(99.9)=69.23ms 
     iterations.....................: 142234  1165.941817/s
     success_rate...................: 100.00% ✓ 142234      ✗ 0     
     vus............................: 14      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 201603     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   661 kB/s
     http_req_blocked...............: avg=6.22µs  min=1.24µs  med=3.4µs   max=9.01ms   p(90)=4.92µs   p(95)=5.61µs   p(99.9)=52.41µs 
     http_req_connecting............: avg=2.51µs  min=0s      med=0s      max=8.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.93ms min=20.51ms med=87.03ms max=367.67ms p(90)=108.49ms p(95)=117.69ms p(99.9)=206.36ms
       { expected_response:true }...: avg=88.93ms min=20.51ms med=87.03ms max=367.67ms p(90)=108.49ms p(95)=117.69ms p(99.9)=206.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67301
     http_req_receiving.............: avg=92.94µs min=30.75µs med=78.81µs max=206.1ms  p(90)=115.09µs p(95)=129.23µs p(99.9)=664.83µs
     http_req_sending...............: avg=25.88µs min=5.45µs  med=15.84µs max=202.38ms p(90)=22.2µs   p(95)=24.49µs  p(99.9)=634.31µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.81ms min=20.37ms med=86.93ms max=314.4ms  p(90)=108.39ms p(95)=117.57ms p(99.9)=205.89ms
     http_reqs......................: 67301   550.410212/s
     iteration_duration.............: avg=89.29ms min=28.26ms med=87.3ms  max=367.92ms p(90)=108.76ms p(95)=117.98ms p(99.9)=208.97ms
     iterations.....................: 67201   549.592378/s
     success_rate...................: 100.00% ✓ 67201      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 155355     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   509 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.52µs  med=3.84µs   max=4.14ms   p(90)=5.48µs   p(95)=6.12µs   p(99.9)=175.41µs
     http_req_connecting............: avg=1.76µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.41ms min=21.67ms med=113.56ms max=335.41ms p(90)=143.93ms p(95)=153.27ms p(99.9)=193.13ms
       { expected_response:true }...: avg=115.41ms min=21.67ms med=113.56ms max=335.41ms p(90)=143.93ms p(95)=153.27ms p(99.9)=193.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51885
     http_req_receiving.............: avg=93.4µs   min=31.98µs med=87.01µs  max=124.82ms p(90)=119.75µs p(95)=132.92µs p(99.9)=569.54µs
     http_req_sending...............: avg=27.51µs  min=5.92µs  med=18.68µs  max=63.36ms  p(90)=24.18µs  p(95)=26.26µs  p(99.9)=623.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.29ms min=21.41ms med=113.44ms max=334.43ms p(90)=143.81ms p(95)=153.15ms p(99.9)=192.72ms
     http_reqs......................: 51885   424.065909/s
     iteration_duration.............: avg=115.89ms min=41.57ms med=113.87ms max=360.52ms p(90)=144.22ms p(95)=153.61ms p(99.9)=196.88ms
     iterations.....................: 51785   423.24859/s
     success_rate...................: 100.00% ✓ 51785      ✗ 0    
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

     checks.........................: 100.00% ✓ 98349      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   322 kB/s
     http_req_blocked...............: avg=7.18µs   min=1.5µs   med=3.89µs   max=4.38ms   p(90)=5.45µs   p(95)=6.05µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=182.31ms min=23.42ms med=183.01ms max=385.67ms p(90)=192.68ms p(95)=196.6ms  p(99.9)=265.64ms
       { expected_response:true }...: avg=182.31ms min=23.42ms med=183.01ms max=385.67ms p(90)=192.68ms p(95)=196.6ms  p(99.9)=265.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32883
     http_req_receiving.............: avg=105.81µs min=36.46µs med=91.29µs  max=161.81ms p(90)=123.5µs  p(95)=136.22µs p(99.9)=560.55µs
     http_req_sending...............: avg=31.85µs  min=6.3µs   med=18.99µs  max=117.84ms p(90)=24.03µs  p(95)=25.95µs  p(99.9)=623.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.17ms min=23.32ms med=182.89ms max=385.47ms p(90)=192.56ms p(95)=196.47ms p(99.9)=264.78ms
     http_reqs......................: 32883   268.109242/s
     iteration_duration.............: avg=183.12ms min=31.19ms med=183.4ms  max=391.97ms p(90)=192.98ms p(95)=196.93ms p(99.9)=269.46ms
     iterations.....................: 32783   267.293899/s
     success_rate...................: 100.00% ✓ 32783      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94434      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=5.11µs   min=1.15µs  med=3.28µs   max=2.3ms    p(90)=4.65µs   p(95)=5.24µs   p(99.9)=627.28µs
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=2.27ms   p(90)=0s       p(95)=0s       p(99.9)=605.76µs
     http_req_duration..............: avg=189.94ms min=18.79ms med=178.49ms max=641.45ms p(90)=223.69ms p(95)=257.84ms p(99.9)=567.53ms
       { expected_response:true }...: avg=189.94ms min=18.79ms med=178.49ms max=641.45ms p(90)=223.69ms p(95)=257.84ms p(99.9)=567.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31578
     http_req_receiving.............: avg=96.57µs  min=31.21µs med=90.1µs   max=70.61ms  p(90)=120.22µs p(95)=132.46µs p(99.9)=633.29µs
     http_req_sending...............: avg=25.15µs  min=5.15µs  med=17.29µs  max=76.06ms  p(90)=21.75µs  p(95)=23.58µs  p(99.9)=505.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.82ms min=18.65ms med=178.36ms max=641.33ms p(90)=223.56ms p(95)=257.73ms p(99.9)=567.44ms
     http_reqs......................: 31578   258.139036/s
     iteration_duration.............: avg=190.77ms min=61.77ms med=178.9ms  max=641.71ms p(90)=224.01ms p(95)=258.88ms p(99.9)=567.82ms
     iterations.....................: 31478   257.321572/s
     success_rate...................: 100.00% ✓ 31478      ✗ 0    
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

     checks.........................: 100.00% ✓ 8115      ✗ 0   
     data_received..................: 269 MB  2.1 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=91.94µs min=1.17µs   med=3.24µs  max=8.73ms   p(90)=4.72µs   p(95)=5.42µs   p(99.9)=8.49ms  
     http_req_connecting............: avg=86.96µs min=0s       med=0s      max=8.68ms   p(90)=0s       p(95)=0s       p(99.9)=8.46ms  
     http_req_duration..............: avg=2.15s   min=38.71ms  med=2.19s   max=4.72s    p(90)=2.79s    p(95)=3.02s    p(99.9)=4.6s    
       { expected_response:true }...: avg=2.15s   min=38.71ms  med=2.19s   max=4.72s    p(90)=2.79s    p(95)=3.02s    p(99.9)=4.6s    
     http_req_failed................: 0.00%   ✓ 0         ✗ 2805
     http_req_receiving.............: avg=97.25µs min=31.97µs  med=94.2µs  max=887.57µs p(90)=131.64µs p(95)=146.22µs p(99.9)=324.58µs
     http_req_sending...............: avg=74.87µs min=5.39µs   med=17.87µs max=26.99ms  p(90)=23.03µs  p(95)=27.65µs  p(99.9)=7.68ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.15s   min=38.56ms  med=2.19s   max=4.72s    p(90)=2.79s    p(95)=3.02s    p(99.9)=4.6s    
     http_reqs......................: 2805    22.287252/s
     iteration_duration.............: avg=2.23s   min=291.45ms med=2.21s   max=4.72s    p(90)=2.81s    p(95)=3.04s    p(99.9)=4.6s    
     iterations.....................: 2705    21.492697/s
     success_rate...................: 100.00% ✓ 2705      ✗ 0   
     vus............................: 49      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

