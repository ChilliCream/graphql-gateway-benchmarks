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
| hive-router | v0.0.74 | 1,567 | 1,590 | 1,553 | 0.7% |  |
| fusion-nightly | 16.4.0-p.9 | 1,558 | 1,579 | 1,550 | 0.6% |  |
| fusion | 16.3.0 | 1,545 | 1,566 | 1,540 | 0.5% |  |
| grafbase | 0.53.5 | 1,110 | 1,133 | 1,102 | 0.8% |  |
| cosmo | 0.326.1 | 1,103 | 1,120 | 1,096 | 0.7% |  |
| hive-gateway-router-runtime | 2.10.0 | 511 | 526 | 505 | 1.3% |  |
| apollo-router | v2.15.1 | 384 | 400 | 378 | 1.9% |  |
| hive-gateway | 2.10.0 | 236 | 242 | 235 | 1.1% |  |
| apollo-gateway | 2.14.2 | 233 | 235 | 231 | 0.6% |  |
| feddi | 77271dc84a06 | 12 | 13 | 12 | 3.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 573495      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 230 MB  1.9 MB/s
     http_req_blocked...............: avg=4.29µs  min=1µs     med=2.08µs  max=9.99ms   p(90)=3.82µs   p(95)=4.67µs   p(99.9)=28.41µs
     http_req_connecting............: avg=1.72µs  min=0s      med=0s      max=9.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.14ms min=14.02ms med=30.87ms max=325.01ms p(90)=37.07ms  p(95)=39.02ms  p(99.9)=55.84ms
       { expected_response:true }...: avg=31.14ms min=14.02ms med=30.87ms max=325.01ms p(90)=37.07ms  p(95)=39.02ms  p(99.9)=55.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 191265
     http_req_receiving.............: avg=102.8µs min=27.32µs med=51.42µs max=217.3ms  p(90)=100.31µs p(95)=142.29µs p(99.9)=2.68ms 
     http_req_sending...............: avg=30.72µs min=5.12µs  med=9.11µs  max=28.65ms  p(90)=19.13µs  p(95)=32.66µs  p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.01ms min=13.95ms med=30.77ms max=114.44ms p(90)=36.95ms  p(95)=38.88ms  p(99.9)=54.67ms
     http_reqs......................: 191265  1567.473957/s
     iteration_duration.............: avg=31.37ms min=14.2ms  med=31.09ms max=359.56ms p(90)=37.27ms  p(95)=39.23ms  p(99.9)=56.39ms
     iterations.....................: 191165  1566.654427/s
     success_rate...................: 100.00% ✓ 191165      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 570030      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=3.06µs   min=972ns   med=2.04µs   max=4.03ms   p(90)=3.71µs  p(95)=4.61µs   p(99.9)=32.55µs
     http_req_connecting............: avg=540ns    min=0s      med=0s       max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.33ms  min=13.38ms med=30.79ms  max=337.32ms p(90)=38.43ms p(95)=41ms     p(99.9)=61.1ms 
       { expected_response:true }...: avg=31.33ms  min=13.38ms med=30.79ms  max=337.32ms p(90)=38.43ms p(95)=41ms     p(99.9)=61.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 190110
     http_req_receiving.............: avg=667.97µs min=51.57µs med=114.49µs max=254.01ms p(90)=1.81ms  p(95)=2.77ms   p(99.9)=15.8ms 
     http_req_sending...............: avg=34.23µs  min=5.21µs  med=9.1µs    max=41.88ms  p(90)=19.5µs  p(95)=104.61µs p(99.9)=1.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.63ms  min=13.25ms med=30.15ms  max=145.94ms p(90)=37.55ms p(95)=40.06ms  p(99.9)=58.33ms
     http_reqs......................: 190110  1558.347634/s
     iteration_duration.............: avg=31.57ms  min=13.62ms med=31.01ms  max=356.18ms p(90)=38.65ms p(95)=41.21ms  p(99.9)=61.47ms
     iterations.....................: 190010  1557.527925/s
     success_rate...................: 100.00% ✓ 190010      ✗ 0     
     vus............................: 1       min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 565662      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 227 MB  1.9 MB/s
     http_req_blocked...............: avg=2.99µs   min=1µs     med=2.03µs   max=4.56ms   p(90)=3.59µs  p(95)=4.45µs  p(99.9)=28.3µs 
     http_req_connecting............: avg=509ns    min=0s      med=0s       max=3.82ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=31.58ms  min=14ms    med=30.99ms  max=352.9ms  p(90)=38.92ms p(95)=41.59ms p(99.9)=61.38ms
       { expected_response:true }...: avg=31.58ms  min=14ms    med=30.99ms  max=352.9ms  p(90)=38.92ms p(95)=41.59ms p(99.9)=61.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188654
     http_req_receiving.............: avg=621.49µs min=51.18µs med=108.05µs max=303.73ms p(90)=1.62ms  p(95)=2.56ms  p(99.9)=17.29ms
     http_req_sending...............: avg=34.54µs  min=5.26µs  med=9.08µs   max=79.04ms  p(90)=19.21µs p(95)=91.23µs p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.92ms  min=13.86ms med=30.4ms   max=112.56ms p(90)=38.13ms p(95)=40.72ms p(99.9)=56.55ms
     http_reqs......................: 188654  1545.796735/s
     iteration_duration.............: avg=31.81ms  min=14.29ms med=31.2ms   max=371.16ms p(90)=39.13ms p(95)=41.8ms  p(99.9)=61.95ms
     iterations.....................: 188554  1544.977353/s
     success_rate...................: 100.00% ✓ 188554      ✗ 0     
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

     checks.........................: 100.00% ✓ 406140      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=3.68µs  min=992ns   med=2.22µs  max=4.59ms   p(90)=4.64µs   p(95)=5.8µs    p(99.9)=41.16µs
     http_req_connecting............: avg=814ns   min=0s      med=0s      max=4.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.03ms min=17.59ms med=43.59ms max=344.39ms p(90)=53.52ms  p(95)=56.82ms  p(99.9)=81.64ms
       { expected_response:true }...: avg=44.03ms min=17.59ms med=43.59ms max=344.39ms p(90)=53.52ms  p(95)=56.82ms  p(99.9)=81.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135480
     http_req_receiving.............: avg=96.68µs min=28.9µs  med=59.62µs max=159.01ms p(90)=131.78µs p(95)=206.24µs p(99.9)=3.19ms 
     http_req_sending...............: avg=36.62µs min=5.15µs  med=10.01µs max=141.56ms p(90)=24.14µs  p(95)=110.16µs p(99.9)=2.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.9ms  min=17.45ms med=43.46ms max=344.2ms  p(90)=53.37ms  p(95)=56.67ms  p(99.9)=81.3ms 
     http_reqs......................: 135480  1110.254234/s
     iteration_duration.............: avg=44.31ms min=17.84ms med=43.83ms max=369.05ms p(90)=53.76ms  p(95)=57.05ms  p(99.9)=82.23ms
     iterations.....................: 135380  1109.434737/s
     success_rate...................: 100.00% ✓ 135380      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403890      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.31µs  min=992ns   med=2.23µs  max=4.07ms   p(90)=3.85µs  p(95)=4.59µs   p(99.9)=39.13µs
     http_req_connecting............: avg=674ns   min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.32ms min=17.97ms med=43.69ms max=346.5ms  p(90)=54ms    p(95)=57.29ms  p(99.9)=75.75ms
       { expected_response:true }...: avg=44.32ms min=17.97ms med=43.69ms max=346.5ms  p(90)=54ms    p(95)=57.29ms  p(99.9)=75.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134730
     http_req_receiving.............: avg=86.83µs min=28.39µs med=65.22µs max=33.33ms  p(90)=109.4µs p(95)=133.59µs p(99.9)=1.68ms 
     http_req_sending...............: avg=25.34µs min=5.04µs  med=10.53µs max=141.36ms p(90)=18.33µs p(95)=22.66µs  p(99.9)=1.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.21ms min=17.85ms med=43.59ms max=312.59ms p(90)=53.88ms p(95)=57.17ms  p(99.9)=74.58ms
     http_reqs......................: 134730  1103.937315/s
     iteration_duration.............: avg=44.56ms min=20.84ms med=43.9ms  max=354.31ms p(90)=54.2ms  p(95)=57.49ms  p(99.9)=76.49ms
     iterations.....................: 134630  1103.117945/s
     success_rate...................: 100.00% ✓ 134630      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 187581     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   614 kB/s
     http_req_blocked...............: avg=4.71µs  min=1.07µs  med=2.75µs  max=4.15ms   p(90)=4.31µs   p(95)=4.92µs   p(99.9)=50.13µs 
     http_req_connecting............: avg=1.68µs  min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.61ms min=22.46ms med=93.72ms max=354.84ms p(90)=114.98ms p(95)=124.25ms p(99.9)=230.48ms
       { expected_response:true }...: avg=95.61ms min=22.46ms med=93.72ms max=354.84ms p(90)=114.98ms p(95)=124.25ms p(99.9)=230.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62627
     http_req_receiving.............: avg=88.25µs min=30.44µs med=75.64µs max=87.3ms   p(90)=111.29µs p(95)=124.17µs p(99.9)=832.29µs
     http_req_sending...............: avg=21.41µs min=5.64µs  med=12.86µs max=128.48ms p(90)=19.51µs  p(95)=21.92µs  p(99.9)=621.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.5ms  min=22.34ms med=93.62ms max=354.39ms p(90)=114.88ms p(95)=124.15ms p(99.9)=230.19ms
     http_reqs......................: 62627   511.420486/s
     iteration_duration.............: avg=95.97ms min=26.41ms med=93.97ms max=374.27ms p(90)=115.21ms p(95)=124.52ms p(99.9)=232.32ms
     iterations.....................: 62527   510.603873/s
     success_rate...................: 100.00% ✓ 62527      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 141087     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 57 MB   462 kB/s
     http_req_blocked...............: avg=5.51µs   min=1.2µs   med=3.15µs   max=4.02ms   p(90)=4.59µs   p(95)=5.18µs   p(99.9)=298.05µs
     http_req_connecting............: avg=2.12µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=111.91µs
     http_req_duration..............: avg=127.12ms min=21.79ms med=125.05ms max=339.81ms p(90)=159.05ms p(95)=169.91ms p(99.9)=219.93ms
       { expected_response:true }...: avg=127.12ms min=21.79ms med=125.05ms max=339.81ms p(90)=159.05ms p(95)=169.91ms p(99.9)=219.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47129
     http_req_receiving.............: avg=89.72µs  min=30.1µs  med=83.38µs  max=65.26ms  p(90)=116.12µs p(95)=128.47µs p(99.9)=853.66µs
     http_req_sending...............: avg=42.94µs  min=6.05µs  med=15.25µs  max=203.67ms p(90)=21.06µs  p(95)=23.13µs  p(99.9)=687.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=126.99ms min=21.65ms med=124.94ms max=339.13ms p(90)=158.9ms  p(95)=169.77ms p(99.9)=218.27ms
     http_reqs......................: 47129   384.82977/s
     iteration_duration.............: avg=127.62ms min=47.94ms med=125.36ms max=366.37ms p(90)=159.32ms p(95)=170.2ms  p(99.9)=222.66ms
     iterations.....................: 47029   384.013224/s
     success_rate...................: 100.00% ✓ 47029      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86469      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=7.88µs   min=1.28µs  med=3.68µs   max=4.3ms    p(90)=5.24µs   p(95)=5.85µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=3.59µs   min=0s      med=0s       max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=207.32ms min=19.99ms med=192.23ms max=673.89ms p(90)=244.65ms p(95)=288.74ms p(99.9)=622.36ms
       { expected_response:true }...: avg=207.32ms min=19.99ms med=192.23ms max=673.89ms p(90)=244.65ms p(95)=288.74ms p(99.9)=622.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28923
     http_req_receiving.............: avg=107.19µs min=33.89µs med=99.48µs  max=99.17ms  p(90)=132.86µs p(95)=146.34µs p(99.9)=543.34µs
     http_req_sending...............: avg=34.22µs  min=6.25µs  med=18.47µs  max=106.91ms p(90)=23.9µs   p(95)=25.82µs  p(99.9)=534.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.18ms min=19.83ms med=192.11ms max=673.77ms p(90)=244.52ms p(95)=288.44ms p(99.9)=622.23ms
     http_reqs......................: 28923   236.423541/s
     iteration_duration.............: avg=208.29ms min=47.14ms med=192.71ms max=674.2ms  p(90)=245.11ms p(95)=290.81ms p(99.9)=622.73ms
     iterations.....................: 28823   235.606117/s
     success_rate...................: 100.00% ✓ 28823      ✗ 0    
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

     checks.........................: 100.00% ✓ 85749      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=7.71µs   min=1.28µs  med=3.17µs   max=4.56ms   p(90)=4.4µs    p(95)=4.92µs   p(99.9)=2.33ms  
     http_req_connecting............: avg=4.28µs   min=0s      med=0s       max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=2.2ms   
     http_req_duration..............: avg=209.13ms min=21.38ms med=209.34ms max=420.31ms p(90)=225.7ms  p(95)=231.15ms p(99.9)=309.63ms
       { expected_response:true }...: avg=209.13ms min=21.38ms med=209.34ms max=420.31ms p(90)=225.7ms  p(95)=231.15ms p(99.9)=309.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28683
     http_req_receiving.............: avg=95.28µs  min=30.21µs med=88.66µs  max=74.45ms  p(90)=120.76µs p(95)=132.95µs p(99.9)=649.26µs
     http_req_sending...............: avg=26.01µs  min=5.55µs  med=16.04µs  max=60.43ms  p(90)=20.91µs  p(95)=22.84µs  p(99.9)=550.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.01ms min=21.26ms med=209.21ms max=419.71ms p(90)=225.59ms p(95)=231.03ms p(99.9)=309.15ms
     http_reqs......................: 28683   233.481282/s
     iteration_duration.............: avg=210.05ms min=50.85ms med=209.71ms max=452.19ms p(90)=225.95ms p(95)=231.43ms p(99.9)=311.03ms
     iterations.....................: 28583   232.667276/s
     success_rate...................: 100.00% ✓ 28583      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 4365     ✗ 0   
     data_received..................: 149 MB  1.1 MB/s
     data_sent......................: 1.9 MB  14 kB/s
     http_req_blocked...............: avg=39.52µs  min=1.45µs  med=3.43µs  max=2.79ms  p(90)=4.81µs   p(95)=6.06µs   p(99.9)=2.61ms  
     http_req_connecting............: avg=33.79µs  min=0s      med=0s      max=2.76ms  p(90)=0s       p(95)=0s       p(99.9)=2.57ms  
     http_req_duration..............: avg=3.93s    min=59.97ms med=4.06s   max=11.74s  p(90)=5.07s    p(95)=5.35s    p(99.9)=11.06s  
       { expected_response:true }...: avg=3.93s    min=59.97ms med=4.06s   max=11.74s  p(90)=5.07s    p(95)=5.35s    p(99.9)=11.06s  
     http_req_failed................: 0.00%   ✓ 0        ✗ 1555
     http_req_receiving.............: avg=111.73µs min=39.29µs med=99.31µs max=17.02ms p(90)=136.92µs p(95)=150.06µs p(99.9)=535.36µs
     http_req_sending...............: avg=53.04µs  min=6.79µs  med=18.58µs max=9.68ms  p(90)=24.08µs  p(95)=29.28µs  p(99.9)=4.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=3.93s    min=59.78ms med=4.06s   max=11.74s  p(90)=5.07s    p(95)=5.35s    p(99.9)=11.06s  
     http_reqs......................: 1555    12.01486/s
     iteration_duration.............: avg=4.19s    min=1.71s   med=4.14s   max=11.75s  p(90)=5.1s     p(95)=5.36s    p(99.9)=11.17s  
     iterations.....................: 1455    11.2422/s
     success_rate...................: 100.00% ✓ 1455     ✗ 0   
     vus............................: 24      min=0      max=50
     vus_max........................: 50      min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

