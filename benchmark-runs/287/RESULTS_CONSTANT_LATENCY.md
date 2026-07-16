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
| fusion-nightly-net11 | 16.5.1-p.1 | 1,870 | 1,901 | 1,853 | 0.9% |  |
| fusion | 16.5.0 | 1,869 | 1,925 | 1,860 | 1.2% |  |
| fusion-nightly | 16.5.1-p.1 | 1,869 | 1,920 | 1,860 | 1.0% |  |
| hive-router | v0.0.83 | 1,846 | 1,908 | 1,836 | 1.3% |  |
| fusion-nightly-fed | 16.5.1-p.1 | 1,745 | 1,786 | 1,733 | 1.1% |  |
| grafbase | 0.53.5 | 1,295 | 1,334 | 1,281 | 1.6% |  |
| cosmo | 0.331.1 | 1,169 | 1,222 | 1,161 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.4 | 562 | 581 | 557 | 1.3% |  |
| apollo-router | v2.16.0 | 397 | 417 | 394 | 2.0% |  |
| hive-gateway | 2.10.4 | 264 | 270 | 262 | 1.0% |  |
| apollo-gateway | 2.14.2 | 263 | 266 | 262 | 0.4% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683706      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.33µs   min=962ns   med=2.55µs  max=4.98ms   p(90)=4.2µs    p(95)=4.92µs  p(99.9)=37.92µs
     http_req_connecting............: avg=356ns    min=0s      med=0s      max=3.02ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.09ms  min=17.01ms med=25.52ms max=302.75ms p(90)=30.35ms  p(95)=32.16ms p(99.9)=49.93ms
       { expected_response:true }...: avg=26.09ms  min=17.01ms med=25.52ms max=302.75ms p(90)=30.35ms  p(95)=32.16ms p(99.9)=49.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228002
     http_req_receiving.............: avg=321.58µs min=50.1µs  med=95.14µs max=155.25ms p(90)=831.17µs p(95)=1.4ms   p(99.9)=8.22ms 
     http_req_sending...............: avg=35.99µs  min=4.67µs  med=9.67µs  max=169.99ms p(90)=19.79µs  p(95)=48.49µs p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.73ms  min=16.92ms med=25.18ms max=293.35ms p(90)=29.92ms  p(95)=31.67ms p(99.9)=48.5ms 
     http_reqs......................: 228002  1870.279438/s
     iteration_duration.............: avg=26.31ms  min=17.19ms med=25.74ms max=314.12ms p(90)=30.56ms  p(95)=32.38ms p(99.9)=50.31ms
     iterations.....................: 227902  1869.459148/s
     success_rate...................: 100.00% ✓ 227902      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683580      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.15µs   min=951ns   med=2.45µs   max=3.47ms   p(90)=4.01µs   p(95)=4.73µs  p(99.9)=35.2µs 
     http_req_connecting............: avg=326ns    min=0s      med=0s       max=3.44ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.1ms   min=17.09ms med=25.49ms  max=293.97ms p(90)=30.53ms  p(95)=32.43ms p(99.9)=50.52ms
       { expected_response:true }...: avg=26.1ms   min=17.09ms med=25.49ms  max=293.97ms p(90)=30.53ms  p(95)=32.43ms p(99.9)=50.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227960
     http_req_receiving.............: avg=341.48µs min=51.08µs med=101.52µs max=184.1ms  p(90)=810.41µs p(95)=1.28ms  p(99.9)=9.02ms 
     http_req_sending...............: avg=32.99µs  min=4.48µs  med=9.37µs   max=149.51ms p(90)=17.83µs  p(95)=31.1µs  p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.73ms  min=16.96ms med=25.15ms  max=118.65ms p(90)=30.11ms  p(95)=31.96ms p(99.9)=49.04ms
     http_reqs......................: 227960  1869.55105/s
     iteration_duration.............: avg=26.32ms  min=17.37ms med=25.7ms   max=330.71ms p(90)=30.73ms  p(95)=32.64ms p(99.9)=50.86ms
     iterations.....................: 227860  1868.730927/s
     success_rate...................: 100.00% ✓ 227860      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683622      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.72µs  min=821ns   med=1.97µs  max=5.57ms   p(90)=3.72µs   p(95)=4.43µs  p(99.9)=33.33µs
     http_req_connecting............: avg=234ns   min=0s      med=0s      max=2.71ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.1ms  min=17.79ms med=25.54ms max=306.13ms p(90)=30.46ms  p(95)=32.22ms p(99.9)=48.85ms
       { expected_response:true }...: avg=26.1ms  min=17.79ms med=25.54ms max=306.13ms p(90)=30.46ms  p(95)=32.22ms p(99.9)=48.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227974
     http_req_receiving.............: avg=300.9µs min=49.99µs med=92.86µs max=165ms    p(90)=763.93µs p(95)=1.26ms  p(99.9)=7.16ms 
     http_req_sending...............: avg=30.8µs  min=4.23µs  med=8.41µs  max=95.33ms  p(90)=18.81µs  p(95)=31.2µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.77ms min=17.67ms med=25.23ms max=305.32ms p(90)=30.05ms  p(95)=31.77ms p(99.9)=47.26ms
     http_reqs......................: 227974  1869.551261/s
     iteration_duration.............: avg=26.32ms min=17.99ms med=25.75ms max=314.65ms p(90)=30.66ms  p(95)=32.42ms p(99.9)=49.1ms 
     iterations.....................: 227874  1868.731189/s
     success_rate...................: 100.00% ✓ 227874      ✗ 0     
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

     checks.........................: 100.00% ✓ 675402      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.85µs  min=902ns   med=2.06µs  max=7.37ms   p(90)=3.8µs   p(95)=4.58µs   p(99.9)=35.78µs
     http_req_connecting............: avg=330ns   min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.43ms min=18.17ms med=26ms    max=296.42ms p(90)=30.17ms p(95)=31.55ms  p(99.9)=47.75ms
       { expected_response:true }...: avg=26.43ms min=18.17ms med=26ms    max=296.42ms p(90)=30.17ms p(95)=31.55ms  p(99.9)=47.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225234
     http_req_receiving.............: avg=69.5µs  min=23.43µs med=47.51µs max=32.38ms  p(90)=90.95µs p(95)=117.05µs p(99.9)=1.59ms 
     http_req_sending...............: avg=29.73µs min=4.49µs  med=9.05µs  max=246.85ms p(90)=18.65µs p(95)=25.21µs  p(99.9)=1.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.33ms min=18.02ms med=25.91ms max=295.49ms p(90)=30.07ms p(95)=31.44ms  p(99.9)=46.28ms
     http_reqs......................: 225234  1846.774445/s
     iteration_duration.............: avg=26.64ms min=18.31ms med=26.2ms  max=315.59ms p(90)=30.37ms p(95)=31.75ms  p(99.9)=48.07ms
     iterations.....................: 225134  1845.954509/s
     success_rate...................: 100.00% ✓ 225134      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 638556      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 256 MB  2.1 MB/s
     http_req_blocked...............: avg=3.55µs  min=1.01µs  med=2.7µs    max=3.67ms   p(90)=4.41µs   p(95)=5.16µs  p(99.9)=37.48µs
     http_req_connecting............: avg=461ns   min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.94ms min=18.38ms med=27.34ms  max=319.37ms p(90)=32.72ms  p(95)=34.63ms p(99.9)=52.15ms
       { expected_response:true }...: avg=27.94ms min=18.38ms med=27.34ms  max=319.37ms p(90)=32.72ms  p(95)=34.63ms p(99.9)=52.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 212952
     http_req_receiving.............: avg=340.8µs min=51.92µs med=104.32µs max=190.28ms p(90)=873.69µs p(95)=1.4ms   p(99.9)=8.63ms 
     http_req_sending...............: avg=35.03µs min=4.79µs  med=10.61µs  max=221.89ms p(90)=20.83µs  p(95)=32.59µs p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.57ms min=18.16ms med=26.98ms  max=308.48ms p(90)=32.28ms  p(95)=34.18ms p(99.9)=50.82ms
     http_reqs......................: 212952  1745.77834/s
     iteration_duration.............: avg=28.17ms min=18.66ms med=27.56ms  max=327.87ms p(90)=32.94ms  p(95)=34.84ms p(99.9)=52.65ms
     iterations.....................: 212852  1744.958541/s
     success_rate...................: 100.00% ✓ 212852      ✗ 0     
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

     checks.........................: 100.00% ✓ 473826      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=3.38µs  min=851ns   med=2.2µs   max=3.47ms   p(90)=4.69µs   p(95)=5.65µs   p(99.9)=44.69µs
     http_req_connecting............: avg=575ns   min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.73ms min=18.26ms med=37.45ms max=316.71ms p(90)=44.29ms  p(95)=46.35ms  p(99.9)=62.15ms
       { expected_response:true }...: avg=37.73ms min=18.26ms med=37.45ms max=316.71ms p(90)=44.29ms  p(95)=46.35ms  p(99.9)=62.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158042
     http_req_receiving.............: avg=84.65µs min=26.97µs med=54.52µs max=158.68ms p(90)=123.64µs p(95)=170.73µs p(99.9)=1.97ms 
     http_req_sending...............: avg=32.43µs min=4.35µs  med=9.2µs   max=248.55ms p(90)=23.67µs  p(95)=60.48µs  p(99.9)=1.71ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.61ms min=18.15ms med=37.34ms max=287.69ms p(90)=44.18ms  p(95)=46.22ms  p(99.9)=61.16ms
     http_reqs......................: 158042  1295.672962/s
     iteration_duration.............: avg=37.98ms min=19.51ms med=37.68ms max=334.2ms  p(90)=44.51ms  p(95)=46.56ms  p(99.9)=62.49ms
     iterations.....................: 157942  1294.853133/s
     success_rate...................: 100.00% ✓ 157942      ✗ 0     
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

     checks.........................: 100.00% ✓ 427638      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.33µs  min=992ns   med=2.31µs  max=3.74ms   p(90)=3.98µs   p(95)=4.71µs   p(99.9)=36.6µs  
     http_req_connecting............: avg=673ns   min=0s      med=0s      max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.85ms min=18.68ms med=41.24ms max=312.74ms p(90)=50.44ms  p(95)=53.41ms  p(99.9)=69.4ms  
       { expected_response:true }...: avg=41.85ms min=18.68ms med=41.24ms max=312.74ms p(90)=50.44ms  p(95)=53.41ms  p(99.9)=69.4ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 142646
     http_req_receiving.............: avg=81.48µs min=28.13µs med=66.77µs max=114.71ms p(90)=110.26µs p(95)=128.56µs p(99.9)=785.87µs
     http_req_sending...............: avg=24.07µs min=4.85µs  med=11.03µs max=152.2ms  p(90)=18.54µs  p(95)=22.34µs  p(99.9)=915.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.75ms min=18.49ms med=41.14ms max=300.72ms p(90)=50.33ms  p(95)=53.29ms  p(99.9)=69.15ms 
     http_reqs......................: 142646  1169.024446/s
     iteration_duration.............: avg=42.08ms min=21.91ms med=41.45ms max=330.32ms p(90)=50.64ms  p(95)=53.61ms  p(99.9)=69.73ms 
     iterations.....................: 142546  1168.204917/s
     success_rate...................: 100.00% ✓ 142546      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 205917     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   675 kB/s
     http_req_blocked...............: avg=5.05µs  min=1.3µs   med=3.35µs  max=3.54ms   p(90)=4.93µs   p(95)=5.61µs   p(99.9)=52.71µs 
     http_req_connecting............: avg=1.43µs  min=0s      med=0s      max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.07ms min=20.46ms med=85.44ms max=318.84ms p(90)=103.91ms p(95)=112.61ms p(99.9)=205.15ms
       { expected_response:true }...: avg=87.07ms min=20.46ms med=85.44ms max=318.84ms p(90)=103.91ms p(95)=112.61ms p(99.9)=205.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68739
     http_req_receiving.............: avg=84.52µs min=31.06µs med=75.77µs max=131.13ms p(90)=111.17µs p(95)=124.41µs p(99.9)=601.31µs
     http_req_sending...............: avg=26.76µs min=5.35µs  med=14.91µs max=123.79ms p(90)=21.6µs   p(95)=24µs     p(99.9)=632.86µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.96ms min=20.35ms med=85.34ms max=318.26ms p(90)=103.8ms  p(95)=112.48ms p(99.9)=204.55ms
     http_reqs......................: 68739   562.394118/s
     iteration_duration.............: avg=87.42ms min=36.61ms med=85.7ms  max=339.91ms p(90)=104.16ms p(95)=112.89ms p(99.9)=208.55ms
     iterations.....................: 68639   561.575959/s
     success_rate...................: 100.00% ✓ 68639      ✗ 0    
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

     checks.........................: 100.00% ✓ 145782     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   478 kB/s
     http_req_blocked...............: avg=5.36µs   min=1.07µs  med=3.2µs    max=3.95ms   p(90)=4.71µs   p(95)=5.27µs   p(99.9)=712.46µs
     http_req_connecting............: avg=1.93µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=688.51µs
     http_req_duration..............: avg=123.02ms min=21.17ms med=120.94ms max=351.25ms p(90)=154.09ms p(95)=164.5ms  p(99.9)=208.98ms
       { expected_response:true }...: avg=123.02ms min=21.17ms med=120.94ms max=351.25ms p(90)=154.09ms p(95)=164.5ms  p(99.9)=208.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48694
     http_req_receiving.............: avg=90.23µs  min=29.99µs med=83.59µs  max=67.95ms  p(90)=114.53µs p(95)=127.23µs p(99.9)=499.71µs
     http_req_sending...............: avg=26.86µs  min=5.24µs  med=16.53µs  max=247.76ms p(90)=21.6µs   p(95)=23.56µs  p(99.9)=505.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.9ms  min=20.98ms med=120.82ms max=348.89ms p(90)=153.97ms p(95)=164.38ms p(99.9)=207.69ms
     http_reqs......................: 48694   397.985768/s
     iteration_duration.............: avg=123.5ms  min=47.86ms med=121.25ms max=369.09ms p(90)=154.38ms p(95)=164.78ms p(99.9)=212.62ms
     iterations.....................: 48594   397.168448/s
     success_rate...................: 100.00% ✓ 48594      ✗ 0    
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

     checks.........................: 100.00% ✓ 96615      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.11µs  med=3.26µs   max=4.04ms   p(90)=4.71µs   p(95)=5.3µs    p(99.9)=1.52ms  
     http_req_connecting............: avg=3.03µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=185.81ms min=18.33ms med=171.95ms max=664.87ms p(90)=231.11ms p(95)=269.72ms p(99.9)=575.59ms
       { expected_response:true }...: avg=185.81ms min=18.33ms med=171.95ms max=664.87ms p(90)=231.11ms p(95)=269.72ms p(99.9)=575.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32305
     http_req_receiving.............: avg=98.25µs  min=31.84µs med=91.22µs  max=80.76ms  p(90)=122.71µs p(95)=136µs    p(99.9)=823.7µs 
     http_req_sending...............: avg=27.24µs  min=5.33µs  med=18.22µs  max=80.04ms  p(90)=23.02µs  p(95)=24.9µs   p(99.9)=488.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.68ms min=18.17ms med=171.83ms max=664.78ms p(90)=231.02ms p(95)=269.44ms p(99.9)=575.45ms
     http_reqs......................: 32305   264.017165/s
     iteration_duration.............: avg=186.62ms min=38.05ms med=172.39ms max=665.12ms p(90)=231.53ms p(95)=271.76ms p(99.9)=575.87ms
     iterations.....................: 32205   263.199901/s
     success_rate...................: 100.00% ✓ 32205      ✗ 0    
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

     checks.........................: 100.00% ✓ 96507      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=7.2µs    min=1.31µs  med=3.66µs   max=4.73ms   p(90)=5.18µs   p(95)=5.81µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=3.23µs   min=0s      med=0s       max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=185.77ms min=23.68ms med=191.18ms max=398.16ms p(90)=204.96ms p(95)=209.47ms p(99.9)=279.71ms
       { expected_response:true }...: avg=185.77ms min=23.68ms med=191.18ms max=398.16ms p(90)=204.96ms p(95)=209.47ms p(99.9)=279.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32269
     http_req_receiving.............: avg=99.04µs  min=34.2µs  med=91.19µs  max=63.77ms  p(90)=123.66µs p(95)=136.33µs p(99.9)=534.33µs
     http_req_sending...............: avg=29.23µs  min=6.26µs  med=18.46µs  max=170.4ms  p(90)=23.51µs  p(95)=25.51µs  p(99.9)=537.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.64ms min=23.53ms med=191.05ms max=397.46ms p(90)=204.82ms p(95)=209.34ms p(99.9)=278.86ms
     http_reqs......................: 32269   263.094653/s
     iteration_duration.............: avg=186.59ms min=47.38ms med=191.62ms max=406.93ms p(90)=205.29ms p(95)=209.77ms p(99.9)=285.74ms
     iterations.....................: 32169   262.279336/s
     success_rate...................: 100.00% ✓ 32169      ✗ 0    
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

     checks.........................: 100.00% ✓ 6450      ✗ 0   
     data_received..................: 215 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=53.44µs  min=1.14µs   med=3.1µs   max=5.66ms  p(90)=4.59µs   p(95)=5.65µs   p(99.9)=5.2ms  
     http_req_connecting............: avg=47.6µs   min=0s       med=0s      max=5.55ms  p(90)=0s       p(95)=0s       p(99.9)=4.96ms 
     http_req_duration..............: avg=2.68s    min=42.35ms  med=2.76s   max=4.79s   p(90)=3.44s    p(95)=3.62s    p(99.9)=4.77s  
       { expected_response:true }...: avg=2.68s    min=42.35ms  med=2.76s   max=4.79s   p(90)=3.44s    p(95)=3.62s    p(99.9)=4.77s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2250
     http_req_receiving.............: avg=104.68µs min=29.92µs  med=89.47µs max=22.42ms p(90)=133.64µs p(95)=149.13µs p(99.9)=1.08ms 
     http_req_sending...............: avg=83.46µs  min=5.81µs   med=18.12µs max=32.38ms p(90)=23.55µs  p(95)=29.97µs  p(99.9)=18.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.68s    min=42.21ms  med=2.76s   max=4.79s   p(90)=3.44s    p(95)=3.62s    p(99.9)=4.77s  
     http_reqs......................: 2250    17.69235/s
     iteration_duration.............: avg=2.81s    min=587.12ms med=2.79s   max=4.79s   p(90)=3.45s    p(95)=3.63s    p(99.9)=4.77s  
     iterations.....................: 2150    16.906023/s
     success_rate...................: 100.00% ✓ 2150      ✗ 0   
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

