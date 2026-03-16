## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Comparison

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 3,042 | 3,042 | 2,976 | 1.5% |  |
| grafbase | 0.53.2 | 2,119 | 2,119 | 2,105 | 0.5% |  |
| hotchocolate (rust subgraphs) | 16.0.0-p.11.46 | 1,901 | 1,901 | 1,881 | 0.7% |  |
| hotchocolate (.net subgraphs) | 16.0.0-p.11.46 | 1,699 | 1,699 | 1,698 | 0.0% |  |
| cosmo | 0.291.0 | 1,170 | 1,170 | 1,161 | 0.5% |  |
| hive-gateway-router-runtime | 2.5.6 | 539 | 539 | 535 | 0.5% |  |
| apollo-router | v2.12.0 | 438 | 438 | 438 | 0.0% |  |
| hive-gateway | 2.5.6 | 282 | 282 | 280 | 0.5% |  |
| apollo-gateway | 2.13.2 | 249 | 249 | 249 | 0.0% |  |


<details>
  <summary>Summary for: hive-router (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1096533     ✗ 0     
     data_received..................: 32 GB   267 MB/s
     data_sent......................: 439 MB  3.7 MB/s
     http_req_blocked...............: avg=2.85µs   min=1.03µs  med=2.32µs  max=15.43ms  p(90)=3.44µs   p(95)=4.06µs   p(99.9)=32.82µs
     http_req_connecting............: avg=131ns    min=0s      med=0s      max=2.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.19ms  min=1.43ms  med=15.56ms max=312.86ms p(90)=23.32ms  p(95)=26.21ms  p(99.9)=47.61ms
       { expected_response:true }...: avg=16.19ms  min=1.43ms  med=15.56ms max=312.86ms p(90)=23.32ms  p(95)=26.21ms  p(99.9)=47.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 365611
     http_req_receiving.............: avg=106.86µs min=28.19µs med=52.49µs max=133.05ms p(90)=104.51µs p(95)=273.94µs p(99.9)=6.2ms  
     http_req_sending...............: avg=52.75µs  min=5.27µs  med=9.49µs  max=119.31ms p(90)=16.47µs  p(95)=125.11µs p(99.9)=4.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.03ms  min=1.38ms  med=15.42ms max=312.35ms p(90)=23.12ms  p(95)=25.96ms  p(99.9)=46.57ms
     http_reqs......................: 365611  3042.119629/s
     iteration_duration.............: avg=16.4ms   min=2.05ms  med=15.76ms max=334.95ms p(90)=23.53ms  p(95)=26.44ms  p(99.9)=48.4ms 
     iterations.....................: 365511  3041.287564/s
     success_rate...................: 100.00% ✓ 365511      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 764445      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=3.55µs   min=1.06µs  med=2.66µs  max=10.23ms  p(90)=4.06µs   p(95)=4.79µs   p(99.9)=37.61µs
     http_req_connecting............: avg=455ns    min=0s      med=0s      max=4.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.3ms   min=1.95ms  med=23.02ms max=358.66ms p(90)=28.06ms  p(95)=30.02ms  p(99.9)=50.95ms
       { expected_response:true }...: avg=23.3ms   min=1.95ms  med=23.02ms max=358.66ms p(90)=28.06ms  p(95)=30.02ms  p(99.9)=50.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 254915
     http_req_receiving.............: avg=100.34µs min=30.04µs med=61.23µs max=284.56ms p(90)=103.04µs p(95)=184.81µs p(99.9)=4.76ms 
     http_req_sending...............: avg=40.52µs  min=5.4µs   med=11.04µs max=111.27ms p(90)=18.08µs  p(95)=117.86µs p(99.9)=2.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.16ms  min=1.84ms  med=22.91ms max=296.5ms  p(90)=27.91ms  p(95)=29.85ms  p(99.9)=49.73ms
     http_reqs......................: 254915  2119.913725/s
     iteration_duration.............: avg=23.53ms  min=4ms     med=23.24ms max=375.3ms  p(90)=28.28ms  p(95)=30.24ms  p(99.9)=51.62ms
     iterations.....................: 254815  2119.08211/s
     success_rate...................: 100.00% ✓ 254815      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.46)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686085      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.93µs   min=1.08µs  med=2.31µs   max=10.77ms  p(90)=3.37µs   p(95)=3.91µs  p(99.9)=35.51µs 
     http_req_connecting............: avg=263ns    min=0s      med=0s       max=2.86ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=26ms     min=2.81ms  med=14.4ms   max=321.39ms p(90)=63.75ms  p(95)=84.02ms p(99.9)=188.54ms
       { expected_response:true }...: avg=26ms     min=2.81ms  med=14.4ms   max=321.39ms p(90)=63.75ms  p(95)=84.02ms p(99.9)=188.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228795
     http_req_receiving.............: avg=553.49µs min=51.86µs med=110.52µs max=262.32ms p(90)=704.18µs p(95)=1.05ms  p(99.9)=64.51ms 
     http_req_sending...............: avg=35.52µs  min=5.2µs   med=9.83µs   max=262.43ms p(90)=15.15µs  p(95)=22.89µs p(99.9)=1.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.41ms  min=2.68ms  med=13.93ms  max=301ms    p(90)=62.63ms  p(95)=82.97ms p(99.9)=186.14ms
     http_reqs......................: 228795  1901.166629/s
     iteration_duration.............: avg=26.22ms  min=3.35ms  med=14.61ms  max=340.36ms p(90)=63.97ms  p(95)=84.25ms p(99.9)=189.16ms
     iterations.....................: 228695  1900.335681/s
     success_rate...................: 100.00% ✓ 228695      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.46)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 612864      ✗ 0     
     data_received..................: 18 GB   149 MB/s
     data_sent......................: 246 MB  2.0 MB/s
     http_req_blocked...............: avg=3.36µs   min=1.03µs  med=2.44µs   max=4.41ms   p(90)=3.67µs   p(95)=4.26µs  p(99.9)=34.13µs 
     http_req_connecting............: avg=604ns    min=0s      med=0s       max=4.36ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=29.13ms  min=2.13ms  med=18.32ms  max=991.99ms p(90)=64.53ms  p(95)=86.67ms p(99.9)=255.72ms
       { expected_response:true }...: avg=29.13ms  min=2.13ms  med=18.32ms  max=991.99ms p(90)=64.53ms  p(95)=86.67ms p(99.9)=255.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 204388
     http_req_receiving.............: avg=560.24µs min=52.61µs med=114.07µs max=321.84ms p(90)=748.35µs p(95)=1.16ms  p(99.9)=65.89ms 
     http_req_sending...............: avg=30.88µs  min=5.42µs  med=10.5µs   max=67.71ms  p(90)=16.89µs  p(95)=23.35µs p(99.9)=1.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=28.54ms  min=2.04ms  med=17.89ms  max=991.89ms p(90)=63.42ms  p(95)=85.38ms p(99.9)=239.85ms
     http_reqs......................: 204388  1699.296791/s
     iteration_duration.............: avg=29.36ms  min=3.03ms  med=18.54ms  max=992.21ms p(90)=64.78ms  p(95)=86.89ms p(99.9)=256.95ms
     iterations.....................: 204288  1698.465383/s
     success_rate...................: 100.00% ✓ 204288      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 421950      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.45µs  min=1.04µs  med=2.34µs  max=4.52ms   p(90)=3.6µs   p(95)=4.15µs   p(99.9)=35.93µs
     http_req_connecting............: avg=827ns   min=0s      med=0s      max=4.48ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.41ms min=2.1ms   med=41.88ms max=319.67ms p(90)=58.64ms p(95)=63.61ms  p(99.9)=88.22ms
       { expected_response:true }...: avg=42.41ms min=2.1ms   med=41.88ms max=319.67ms p(90)=58.64ms p(95)=63.61ms  p(99.9)=88.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140750
     http_req_receiving.............: avg=74.18µs min=28.39µs med=59.45µs max=93.13ms  p(90)=92.64µs p(95)=107.28µs p(99.9)=1.58ms 
     http_req_sending...............: avg=21.43µs min=5.32µs  med=10.35µs max=244.01ms p(90)=14.97µs p(95)=18.38µs  p(99.9)=915.4µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.32ms min=1.99ms  med=41.79ms max=318.84ms p(90)=58.54ms p(95)=63.52ms  p(99.9)=88.04ms
     http_reqs......................: 140750  1170.384165/s
     iteration_duration.............: avg=42.65ms min=3.94ms  med=42.08ms max=355.59ms p(90)=58.84ms p(95)=63.8ms   p(99.9)=89.24ms
     iterations.....................: 140650  1169.552631/s
     success_rate...................: 100.00% ✓ 140650      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 194904     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   648 kB/s
     http_req_blocked...............: avg=4.05µs   min=1.28µs  med=3.11µs  max=2.54ms   p(90)=4.44µs   p(95)=5µs      p(99.9)=46.1µs  
     http_req_connecting............: avg=685ns    min=0s      med=0s      max=2.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.99ms  min=4.19ms  med=89.42ms max=362.39ms p(90)=109.31ms p(95)=116.88ms p(99.9)=214.35ms
       { expected_response:true }...: avg=91.99ms  min=4.19ms  med=89.42ms max=362.39ms p(90)=109.31ms p(95)=116.88ms p(99.9)=214.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65068
     http_req_receiving.............: avg=159.07µs min=31.82µs med=77.55µs max=303.14ms p(90)=108.6µs  p(95)=120µs    p(99.9)=1.03ms  
     http_req_sending...............: avg=19.99µs  min=5.92µs  med=13.89µs max=37.9ms   p(90)=19.04µs  p(95)=21.04µs  p(99.9)=659.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.81ms  min=4.14ms  med=89.31ms max=234.92ms p(90)=109.17ms p(95)=116.56ms p(99.9)=211.42ms
     http_reqs......................: 65068   539.702044/s
     iteration_duration.............: avg=92.37ms  min=14.82ms med=89.66ms max=372.89ms p(90)=109.55ms p(95)=117.18ms p(99.9)=216.67ms
     iterations.....................: 64968   538.872601/s
     success_rate...................: 100.00% ✓ 64968      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 158436     ✗ 0    
     data_received..................: 4.6 GB  39 MB/s
     data_sent......................: 64 MB   526 kB/s
     http_req_blocked...............: avg=4.88µs   min=1.17µs  med=3.2µs    max=3.96ms   p(90)=4.54µs   p(95)=5.09µs   p(99.9)=99.67µs 
     http_req_connecting............: avg=1.51µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.18ms min=5.47ms  med=113.01ms max=352.2ms  p(90)=136.59ms p(95)=143.66ms p(99.9)=175.04ms
       { expected_response:true }...: avg=113.18ms min=5.47ms  med=113.01ms max=352.2ms  p(90)=136.59ms p(95)=143.66ms p(99.9)=175.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52912
     http_req_receiving.............: avg=101.06µs min=29.91µs med=79.94µs  max=252.28ms p(90)=110.8µs  p(95)=122.46µs p(99.9)=747.46µs
     http_req_sending...............: avg=32.55µs  min=5.65µs  med=14.91µs  max=179.41ms p(90)=20.28µs  p(95)=22.03µs  p(99.9)=965.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.05ms min=5.37ms  med=112.9ms  max=346.04ms p(90)=136.47ms p(95)=143.52ms p(99.9)=174ms   
     http_reqs......................: 52912   438.427796/s
     iteration_duration.............: avg=113.64ms min=15.17ms med=113.29ms max=375.07ms p(90)=136.85ms p(95)=143.9ms  p(99.9)=177.29ms
     iterations.....................: 52812   437.599198/s
     success_rate...................: 100.00% ✓ 52812      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 102174     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=6.98µs   min=1.29µs  med=3.63µs   max=4.59ms   p(90)=5.07µs   p(95)=5.73µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=3.03µs   min=0s      med=0s       max=4.55ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=175.46ms min=5.89ms  med=159.88ms max=622.64ms p(90)=231.35ms p(95)=262.98ms p(99.9)=549.6ms 
       { expected_response:true }...: avg=175.46ms min=5.89ms  med=159.88ms max=622.64ms p(90)=231.35ms p(95)=262.98ms p(99.9)=549.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34158
     http_req_receiving.............: avg=102.62µs min=35.18µs med=95.69µs  max=51.02ms  p(90)=127.03µs p(95)=140.33µs p(99.9)=602.96µs
     http_req_sending...............: avg=35.14µs  min=6.45µs  med=18.24µs  max=227.47ms p(90)=23.04µs  p(95)=24.91µs  p(99.9)=554.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.32ms min=5.75ms  med=159.75ms max=622.48ms p(90)=231.23ms p(95)=262.68ms p(99.9)=549.5ms 
     http_reqs......................: 34158   282.668775/s
     iteration_duration.............: avg=176.25ms min=39.83ms med=160.28ms max=622.95ms p(90)=231.79ms p(95)=264.38ms p(99.9)=549.86ms
     iterations.....................: 34058   281.841242/s
     success_rate...................: 100.00% ✓ 34058      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90159      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   299 kB/s
     http_req_blocked...............: avg=7.34µs   min=1.2µs   med=3.04µs   max=5.05ms   p(90)=4.18µs   p(95)=4.65µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=4.17µs   min=0s      med=0s       max=4.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=198.87ms min=8.37ms  med=200.09ms max=446.49ms p(90)=211.09ms p(95)=216.99ms p(99.9)=285.8ms 
       { expected_response:true }...: avg=198.87ms min=8.37ms  med=200.09ms max=446.49ms p(90)=211.09ms p(95)=216.99ms p(99.9)=285.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30153
     http_req_receiving.............: avg=207.14µs min=34.73µs med=82.83µs  max=169.82ms p(90)=113.6µs  p(95)=124.47µs p(99.9)=32.9ms  
     http_req_sending...............: avg=34.98µs  min=6.16µs  med=14.45µs  max=213.18ms p(90)=19.73µs  p(95)=21.28µs  p(99.9)=500.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.63ms min=8.26ms  med=199.96ms max=287.95ms p(90)=210.99ms p(95)=216.87ms p(99.9)=281.84ms
     http_reqs......................: 30153   249.122285/s
     iteration_duration.............: avg=199.78ms min=10.69ms med=200.59ms max=454.3ms  p(90)=211.34ms p(95)=217.3ms  p(99.9)=305.61ms
     iterations.....................: 30053   248.296091/s
     success_rate...................: 100.00% ✓ 30053      ✗ 0    
     vus............................: 32      min=32       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

