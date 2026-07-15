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
| fusion | 16.5.0 | 1,866 | 1,908 | 1,861 | 0.8% |  |
| hive-router | v0.0.83 | 1,861 | 1,925 | 1,849 | 1.4% |  |
| grafbase | 0.53.5 | 1,313 | 1,342 | 1,308 | 1.0% |  |
| cosmo | 0.331.1 | 1,220 | 1,264 | 1,211 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.4 | 555 | 574 | 553 | 1.2% |  |
| apollo-router | v2.16.0 | 434 | 451 | 433 | 1.4% |  |
| apollo-gateway | 2.14.2 | 265 | 269 | 265 | 0.5% |  |
| hive-gateway | 2.10.4 | 262 | 270 | 261 | 1.3% |  |
| feddi | 5ff8b6165878 | 16 | 16 | 15 | 3.3% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682395      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.8µs   min=872ns   med=1.96µs  max=3.92ms   p(90)=3.7µs    p(95)=4.43µs  p(99.9)=33.42µs
     http_req_connecting............: avg=394ns   min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.15ms min=17.05ms med=25.57ms max=307.12ms p(90)=30.54ms  p(95)=32.39ms p(99.9)=49.11ms
       { expected_response:true }...: avg=26.15ms min=17.05ms med=25.57ms max=307.12ms p(90)=30.54ms  p(95)=32.39ms p(99.9)=49.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227565
     http_req_receiving.............: avg=293.6µs min=50.35µs med=92.87µs max=129.84ms p(90)=726.19µs p(95)=1.21ms  p(99.9)=7.93ms 
     http_req_sending...............: avg=31.59µs min=4.51µs  med=8.49µs  max=181.97ms p(90)=19.22µs  p(95)=28.65µs p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.83ms min=16.89ms med=25.27ms max=306.63ms p(90)=30.15ms  p(95)=31.97ms p(99.9)=47.49ms
     http_reqs......................: 227565  1866.132467/s
     iteration_duration.............: avg=26.36ms min=17.26ms med=25.78ms max=315.62ms p(90)=30.74ms  p(95)=32.6ms  p(99.9)=49.69ms
     iterations.....................: 227465  1865.312423/s
     success_rate...................: 100.00% ✓ 227465      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 680808      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.21µs  min=852ns   med=2.4µs   max=4.05ms   p(90)=4.15µs  p(95)=4.89µs   p(99.9)=36.72µs
     http_req_connecting............: avg=435ns   min=0s      med=0s      max=4.01ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.21ms min=18.11ms med=25.76ms max=318.32ms p(90)=29.94ms p(95)=31.36ms  p(99.9)=47.99ms
       { expected_response:true }...: avg=26.21ms min=18.11ms med=25.76ms max=318.32ms p(90)=29.94ms p(95)=31.36ms  p(99.9)=47.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227036
     http_req_receiving.............: avg=74.2µs  min=24.49µs med=49.94µs max=102.17ms p(90)=94.46µs p(95)=122.32µs p(99.9)=1.85ms 
     http_req_sending...............: avg=32.83µs min=4.45µs  med=9.83µs  max=218.31ms p(90)=18.91µs p(95)=27.03µs  p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.11ms min=18.03ms med=25.67ms max=292.04ms p(90)=29.83ms p(95)=31.25ms  p(99.9)=47.02ms
     http_reqs......................: 227036  1861.41004/s
     iteration_duration.............: avg=26.43ms min=18.3ms  med=25.97ms max=326.86ms p(90)=30.14ms p(95)=31.57ms  p(99.9)=48.33ms
     iterations.....................: 226936  1860.590165/s
     success_rate...................: 100.00% ✓ 226936      ✗ 0     
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

     checks.........................: 100.00% ✓ 480384      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=3.45µs  min=872ns   med=2.22µs  max=4.07ms   p(90)=4.77µs   p(95)=5.74µs   p(99.9)=40.02µs
     http_req_connecting............: avg=601ns   min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.21ms min=18.26ms med=36.97ms max=317.57ms p(90)=43.75ms  p(95)=45.75ms  p(99.9)=62.86ms
       { expected_response:true }...: avg=37.21ms min=18.26ms med=36.97ms max=317.57ms p(90)=43.75ms  p(95)=45.75ms  p(99.9)=62.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160228
     http_req_receiving.............: avg=84.8µs  min=26.83µs med=54.7µs  max=122.08ms p(90)=122.58µs p(95)=166.82µs p(99.9)=2ms    
     http_req_sending...............: avg=35.39µs min=4.53µs  med=9.15µs  max=224.97ms p(90)=23.28µs  p(95)=47.61µs  p(99.9)=1.98ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.08ms min=18.11ms med=36.85ms max=316.97ms p(90)=43.63ms  p(95)=45.62ms  p(99.9)=62.49ms
     http_reqs......................: 160228  1313.453243/s
     iteration_duration.............: avg=37.46ms min=20.95ms med=37.2ms  max=327.68ms p(90)=43.97ms  p(95)=45.97ms  p(99.9)=63.51ms
     iterations.....................: 160128  1312.633503/s
     success_rate...................: 100.00% ✓ 160128      ✗ 0     
     vus............................: 10      min=0         max=50  
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

     checks.........................: 100.00% ✓ 446250      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.35µs  min=972ns   med=2.36µs  max=4.15ms   p(90)=4.07µs   p(95)=4.83µs  p(99.9)=34.34µs 
     http_req_connecting............: avg=624ns   min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=40.1ms  min=18.76ms med=39.51ms max=321.37ms p(90)=48.1ms   p(95)=50.83ms p(99.9)=64.8ms  
       { expected_response:true }...: avg=40.1ms  min=18.76ms med=39.51ms max=321.37ms p(90)=48.1ms   p(95)=50.83ms p(99.9)=64.8ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 148850
     http_req_receiving.............: avg=78.22µs min=25.06µs med=63.24µs max=104.37ms p(90)=105.01µs p(95)=122.4µs p(99.9)=843.91µs
     http_req_sending...............: avg=25.22µs min=4.82µs  med=11.03µs max=232.3ms  p(90)=19.07µs  p(95)=22.94µs p(99.9)=926.73µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=39.99ms min=18.6ms  med=39.41ms max=320.65ms p(90)=48ms     p(95)=50.73ms p(99.9)=64.49ms 
     http_reqs......................: 148850  1220.004811/s
     iteration_duration.............: avg=40.33ms min=22.23ms med=39.72ms max=330.47ms p(90)=48.3ms   p(95)=51.03ms p(99.9)=65.07ms 
     iterations.....................: 148750  1219.18519/s
     success_rate...................: 100.00% ✓ 148750      ✗ 0     
     vus............................: 40      min=0         max=50  
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

     checks.........................: 100.00% ✓ 203535     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 82 MB   668 kB/s
     http_req_blocked...............: avg=4.62µs  min=1.08µs  med=2.89µs  max=4.5ms    p(90)=4.47µs   p(95)=5.11µs   p(99.9)=46.51µs 
     http_req_connecting............: avg=1.5µs   min=0s      med=0s      max=4.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.1ms  min=20.33ms med=86.49ms max=317.6ms  p(90)=107.58ms p(95)=117.4ms  p(99.9)=206.43ms
       { expected_response:true }...: avg=88.1ms  min=20.33ms med=86.49ms max=317.6ms  p(90)=107.58ms p(95)=117.4ms  p(99.9)=206.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67945
     http_req_receiving.............: avg=81.36µs min=29.96µs med=73.37µs max=70.11ms  p(90)=108.73µs p(95)=121.13µs p(99.9)=599.97µs
     http_req_sending...............: avg=18.71µs min=4.88µs  med=13.29µs max=24.49ms  p(90)=20.05µs  p(95)=22.28µs  p(99.9)=619.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88ms    min=20.23ms med=86.39ms max=316.69ms p(90)=107.49ms p(95)=117.28ms p(99.9)=206.22ms
     http_reqs......................: 67945   555.867364/s
     iteration_duration.............: avg=88.45ms min=30.11ms med=86.74ms max=342.38ms p(90)=107.82ms p(95)=117.67ms p(99.9)=210.13ms
     iterations.....................: 67845   555.04925/s
     success_rate...................: 100.00% ✓ 67845      ✗ 0    
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

     checks.........................: 100.00% ✓ 159015     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   521 kB/s
     http_req_blocked...............: avg=6.94µs   min=1.38µs  med=3.8µs    max=5.6ms    p(90)=5.37µs   p(95)=6.01µs   p(99.9)=93.7µs  
     http_req_connecting............: avg=2.86µs   min=0s      med=0s       max=5.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.76ms min=20.96ms med=110.87ms max=333.44ms p(90)=140.56ms p(95)=150ms    p(99.9)=191.83ms
       { expected_response:true }...: avg=112.76ms min=20.96ms med=110.87ms max=333.44ms p(90)=140.56ms p(95)=150ms    p(99.9)=191.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53105
     http_req_receiving.............: avg=95.37µs  min=31.84µs med=85.58µs  max=156.9ms  p(90)=118.04µs p(95)=131.74µs p(99.9)=598.88µs
     http_req_sending...............: avg=32.13µs  min=5.77µs  med=18.53µs  max=161.5ms  p(90)=24.34µs  p(95)=26.56µs  p(99.9)=681.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.63ms min=20.85ms med=110.76ms max=332.1ms  p(90)=140.44ms p(95)=149.85ms p(99.9)=191.22ms
     http_reqs......................: 53105   434.030842/s
     iteration_duration.............: avg=113.23ms min=45.23ms med=111.18ms max=345.2ms  p(90)=140.86ms p(95)=150.32ms p(99.9)=194.3ms 
     iterations.....................: 53005   433.213535/s
     success_rate...................: 100.00% ✓ 53005      ✗ 0    
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

     checks.........................: 100.00% ✓ 97470      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.14µs  med=3.23µs   max=3.34ms   p(90)=4.71µs   p(95)=5.28µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=2.55µs   min=0s      med=0s       max=3.3ms    p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=183.98ms min=23.57ms med=184.92ms max=432.74ms p(90)=195.01ms p(95)=199.51ms p(99.9)=272.17ms
       { expected_response:true }...: avg=183.98ms min=23.57ms med=184.92ms max=432.74ms p(90)=195.01ms p(95)=199.51ms p(99.9)=272.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32590
     http_req_receiving.............: avg=95.09µs  min=30.16µs med=88.83µs  max=95.07ms  p(90)=119.84µs p(95)=132.34µs p(99.9)=413.84µs
     http_req_sending...............: avg=32.73µs  min=5.41µs  med=18.26µs  max=81.38ms  p(90)=23.17µs  p(95)=25.01µs  p(99.9)=488.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.86ms min=23.35ms med=184.81ms max=419ms    p(90)=194.91ms p(95)=199.4ms  p(99.9)=272.06ms
     http_reqs......................: 32590   265.740523/s
     iteration_duration.............: avg=184.78ms min=45.43ms med=185.28ms max=453.51ms p(90)=195.32ms p(95)=199.83ms p(99.9)=274.12ms
     iterations.....................: 32490   264.925118/s
     success_rate...................: 100.00% ✓ 32490      ✗ 0    
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

     checks.........................: 100.00% ✓ 95721      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=7.31µs   min=1.65µs  med=3.96µs   max=4.14ms   p(90)=5.52µs   p(95)=6.18µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=3.06µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=187.32ms min=18.58ms med=175.65ms max=663.93ms p(90)=221.64ms p(95)=252.79ms p(99.9)=592.09ms
       { expected_response:true }...: avg=187.32ms min=18.58ms med=175.65ms max=663.93ms p(90)=221.64ms p(95)=252.79ms p(99.9)=592.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32007
     http_req_receiving.............: avg=112.4µs  min=36.4µs  med=91.15µs  max=152.87ms p(90)=123.45µs p(95)=136.27µs p(99.9)=1.13ms  
     http_req_sending...............: avg=27.48µs  min=6.17µs  med=19.19µs  max=97.11ms  p(90)=24.27µs  p(95)=26.34µs  p(99.9)=579.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.18ms min=18.43ms med=175.51ms max=663.8ms  p(90)=221.47ms p(95)=252.6ms  p(99.9)=591.98ms
     http_reqs......................: 32007   262.127013/s
     iteration_duration.............: avg=188.14ms min=46.19ms med=176.06ms max=664.21ms p(90)=222.06ms p(95)=253.73ms p(99.9)=592.51ms
     iterations.....................: 31907   261.308045/s
     success_rate...................: 100.00% ✓ 31907      ✗ 0    
     vus............................: 46      min=0        max=50 
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

     checks.........................: 100.00% ✓ 5991      ✗ 0   
     data_received..................: 201 MB  1.6 MB/s
     data_sent......................: 2.5 MB  20 kB/s
     http_req_blocked...............: avg=58.93µs min=1.55µs  med=3.46µs  max=9.41ms p(90)=5.07µs   p(95)=6.08µs   p(99.9)=5.28ms  
     http_req_connecting............: avg=48.74µs min=0s      med=0s      max=5.53ms p(90)=0s       p(95)=0s       p(99.9)=5.13ms  
     http_req_duration..............: avg=2.89s   min=43.54ms med=2.99s   max=11.59s p(90)=3.78s    p(95)=3.94s    p(99.9)=9.94s   
       { expected_response:true }...: avg=2.89s   min=43.54ms med=2.99s   max=11.59s p(90)=3.78s    p(95)=3.94s    p(99.9)=9.94s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2097
     http_req_receiving.............: avg=95.36µs min=36.48µs med=90.19µs max=1.71ms p(90)=132.04µs p(95)=149.51µs p(99.9)=420.16µs
     http_req_sending...............: avg=65.86µs min=6.54µs  med=17.74µs max=8.96ms p(90)=23.25µs  p(95)=28.98µs  p(99.9)=3.59ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.89s   min=43.41ms med=2.99s   max=11.59s p(90)=3.78s    p(95)=3.94s    p(99.9)=9.94s   
     http_reqs......................: 2097    16.420897/s
     iteration_duration.............: avg=3.04s   min=759.2ms med=3.03s   max=11.6s  p(90)=3.8s     p(95)=3.95s    p(99.9)=10.11s  
     iterations.....................: 1997    15.637831/s
     success_rate...................: 100.00% ✓ 1997      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

