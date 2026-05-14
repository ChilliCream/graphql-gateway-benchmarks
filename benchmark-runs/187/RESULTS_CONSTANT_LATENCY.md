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
| hive-router | v0.0.49 | 1,590 | 1,618 | 1,585 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,441 | 1,463 | 1,434 | 0.6% |  |
| cosmo | 0.307.0 | 1,136 | 1,152 | 1,127 | 0.9% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.3 | 1,121 | 1,142 | 1,110 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 511 | 522 | 507 | 1.0% |  |
| apollo-router | v2.13.1 | 394 | 404 | 391 | 1.1% |  |
| hive-gateway | 2.5.25 | 244 | 248 | 242 | 0.9% |  |
| apollo-gateway | 2.13.3 | 236 | 239 | 234 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 581844      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=2.91µs  min=992ns   med=2.13µs  max=2.79ms   p(90)=4.05µs   p(95)=4.96µs   p(99.9)=34.72µs
     http_req_connecting............: avg=272ns   min=0s      med=0s      max=2.76ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.69ms min=13.72ms med=30.42ms max=335.56ms p(90)=36.41ms  p(95)=38.46ms  p(99.9)=57.09ms
       { expected_response:true }...: avg=30.69ms min=13.72ms med=30.42ms max=335.56ms p(90)=36.41ms  p(95)=38.46ms  p(99.9)=57.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194048
     http_req_receiving.............: avg=82.32µs min=26.71µs med=49.83µs max=25.82ms  p(90)=103.02µs p(95)=152.74µs p(99.9)=2.87ms 
     http_req_sending...............: avg=33.22µs min=5.17µs  med=9.11µs  max=74.75ms  p(90)=19.69µs  p(95)=66.51µs  p(99.9)=1.92ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.57ms min=13.64ms med=30.31ms max=334.69ms p(90)=36.29ms  p(95)=38.32ms  p(99.9)=55.63ms
     http_reqs......................: 194048  1590.816602/s
     iteration_duration.............: avg=30.92ms min=13.96ms med=30.64ms max=343.57ms p(90)=36.63ms  p(95)=38.68ms  p(99.9)=57.49ms
     iterations.....................: 193948  1589.996797/s
     success_rate...................: 100.00% ✓ 193948      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 527394      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.16µs   min=972ns   med=2.08µs   max=4.03ms   p(90)=3.85µs  p(95)=4.72µs   p(99.9)=28.82µs
     http_req_connecting............: avg=612ns    min=0s      med=0s       max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.88ms  min=14.02ms med=32.59ms  max=628.28ms p(90)=41.55ms p(95)=45.1ms   p(99.9)=83.42ms
       { expected_response:true }...: avg=33.88ms  min=14.02ms med=32.59ms  max=628.28ms p(90)=41.55ms p(95)=45.1ms   p(99.9)=83.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175898
     http_req_receiving.............: avg=795.58µs min=50.79µs med=113.08µs max=259.85ms p(90)=2.2ms   p(95)=3.33ms   p(99.9)=17ms   
     http_req_sending...............: avg=34.13µs  min=4.98µs  med=8.93µs   max=35.38ms  p(90)=19.6µs  p(95)=105.46µs p(99.9)=2.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.05ms  min=13.9ms  med=31.8ms   max=626.45ms p(90)=40.49ms p(95)=43.95ms  p(99.9)=80.4ms 
     http_reqs......................: 175898  1441.923207/s
     iteration_duration.............: avg=34.12ms  min=14.21ms med=32.81ms  max=628.55ms p(90)=41.76ms p(95)=45.32ms  p(99.9)=84.04ms
     iterations.....................: 175798  1441.103458/s
     success_rate...................: 100.00% ✓ 175798      ✗ 0     
     vus............................: 2       min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415692      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.65µs  min=1.08µs  med=2.49µs  max=4.01ms   p(90)=4.15µs   p(95)=4.91µs   p(99.9)=38.01µs
     http_req_connecting............: avg=771ns   min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.05ms min=15.62ms med=42.45ms max=356.19ms p(90)=52.44ms  p(95)=55.58ms  p(99.9)=72.34ms
       { expected_response:true }...: avg=43.05ms min=15.62ms med=42.45ms max=356.19ms p(90)=52.44ms  p(95)=55.58ms  p(99.9)=72.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138664
     http_req_receiving.............: avg=96.39µs min=27.89µs med=64.8µs  max=140.08ms p(90)=109.31µs p(95)=135.47µs p(99.9)=1.95ms 
     http_req_sending...............: avg=27.7µs  min=5.14µs  med=11.07µs max=147.61ms p(90)=18.99µs  p(95)=23.82µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.93ms min=15.47ms med=42.34ms max=236.62ms p(90)=52.32ms  p(95)=55.44ms  p(99.9)=71.85ms
     http_reqs......................: 138664  1136.367838/s
     iteration_duration.............: avg=43.29ms min=17.99ms med=42.66ms max=374.13ms p(90)=52.64ms  p(95)=55.78ms  p(99.9)=72.66ms
     iterations.....................: 138564  1135.548326/s
     success_rate...................: 100.00% ✓ 138564      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 410133      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.18µs  min=981ns   med=2.2µs   max=2.23ms   p(90)=4.64µs   p(95)=5.82µs   p(99.9)=48.67µs
     http_req_connecting............: avg=327ns   min=0s      med=0s      max=2.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.61ms min=17.3ms  med=43.14ms max=345ms    p(90)=52.97ms  p(95)=56.17ms  p(99.9)=81.4ms 
       { expected_response:true }...: avg=43.61ms min=17.3ms  med=43.14ms max=345ms    p(90)=52.97ms  p(95)=56.17ms  p(99.9)=81.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 136811
     http_req_receiving.............: avg=96.2µs  min=28.12µs med=59.54µs max=138.65ms p(90)=129.73µs p(95)=196.04µs p(99.9)=3.24ms 
     http_req_sending...............: avg=38.46µs min=5.2µs   med=9.82µs  max=165.95ms p(90)=23.56µs  p(95)=103.47µs p(99.9)=2.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.47ms min=17.11ms med=43.01ms max=334.61ms p(90)=52.81ms  p(95)=56ms     p(99.9)=80.45ms
     http_reqs......................: 136811  1121.282768/s
     iteration_duration.............: avg=43.88ms min=17.83ms med=43.38ms max=360.77ms p(90)=53.2ms   p(95)=56.4ms   p(99.9)=82.16ms
     iterations.....................: 136711  1120.463183/s
     success_rate...................: 100.00% ✓ 136711      ✗ 0     
     vus............................: 46      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 187722     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   615 kB/s
     http_req_blocked...............: avg=5.18µs   min=1.19µs  med=3.24µs  max=4.76ms   p(90)=4.87µs   p(95)=5.57µs   p(99.9)=59.25µs 
     http_req_connecting............: avg=1.69µs   min=0s      med=0s      max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.56ms  min=19.25ms med=92.74ms max=386.95ms p(90)=116.09ms p(95)=126.19ms p(99.9)=229.41ms
       { expected_response:true }...: avg=95.56ms  min=19.25ms med=92.74ms max=386.95ms p(90)=116.09ms p(95)=126.19ms p(99.9)=229.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62674
     http_req_receiving.............: avg=174.83µs min=31.31µs med=80.23µs max=264.42ms p(90)=116.85µs p(95)=131.5µs  p(99.9)=1.66ms  
     http_req_sending...............: avg=21.34µs  min=5.63µs  med=14.79µs max=24.9ms   p(90)=21.82µs  p(95)=24.23µs  p(99.9)=792.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.36ms  min=19.1ms  med=92.63ms max=255.8ms  p(90)=115.95ms p(95)=125.82ms p(99.9)=226.11ms
     http_reqs......................: 62674   511.821726/s
     iteration_duration.............: avg=95.91ms  min=27.1ms  med=93ms    max=395.91ms p(90)=116.34ms p(95)=126.46ms p(99.9)=230.96ms
     iterations.....................: 62574   511.005085/s
     success_rate...................: 100.00% ✓ 62574      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 144738     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   474 kB/s
     http_req_blocked...............: avg=5.56µs   min=1.21µs  med=3.49µs   max=3.71ms   p(90)=5.05µs   p(95)=5.69µs   p(99.9)=239.1µs 
     http_req_connecting............: avg=1.85µs   min=0s      med=0s       max=3.68ms   p(90)=0s       p(95)=0s       p(99.9)=186.33µs
     http_req_duration..............: avg=123.9ms  min=21.12ms med=122.13ms max=371.1ms  p(90)=154.21ms p(95)=164.11ms p(99.9)=211.81ms
       { expected_response:true }...: avg=123.9ms  min=21.12ms med=122.13ms max=371.1ms  p(90)=154.21ms p(95)=164.11ms p(99.9)=211.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48346
     http_req_receiving.............: avg=91.78µs  min=32.74µs med=86.84µs  max=7.8ms    p(90)=120.49µs p(95)=134.15µs p(99.9)=694.05µs
     http_req_sending...............: avg=26.32µs  min=5.63µs  med=16.93µs  max=103.98ms p(90)=22.75µs  p(95)=24.89µs  p(99.9)=832.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.78ms min=21.02ms med=122.02ms max=370.09ms p(90)=154.09ms p(95)=164.01ms p(99.9)=211.66ms
     http_reqs......................: 48346   394.724022/s
     iteration_duration.............: avg=124.39ms min=52.91ms med=122.44ms max=384.03ms p(90)=154.48ms p(95)=164.41ms p(99.9)=215.44ms
     iterations.....................: 48246   393.907565/s
     success_rate...................: 100.00% ✓ 48246      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89502      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=7.52µs   min=1.32µs  med=3.63µs   max=4.07ms   p(90)=5.21µs   p(95)=5.83µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=200.35ms min=19.23ms med=181.62ms max=666.52ms p(90)=301.38ms p(95)=383.04ms p(99.9)=591.67ms
       { expected_response:true }...: avg=200.35ms min=19.23ms med=181.62ms max=666.52ms p(90)=301.38ms p(95)=383.04ms p(99.9)=591.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29934
     http_req_receiving.............: avg=104.94µs min=36.38µs med=100.01µs max=23.93ms  p(90)=133.3µs  p(95)=147.21µs p(99.9)=660.72µs
     http_req_sending...............: avg=29.31µs  min=5.75µs  med=18.45µs  max=80.06ms  p(90)=23.82µs  p(95)=25.74µs  p(99.9)=483.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.21ms min=19.07ms med=181.45ms max=666.44ms p(90)=301.23ms p(95)=382.91ms p(99.9)=591.56ms
     http_reqs......................: 29934   244.663675/s
     iteration_duration.............: avg=201.25ms min=61.13ms med=183.42ms max=666.72ms p(90)=301.77ms p(95)=384.21ms p(99.9)=591.97ms
     iterations.....................: 29834   243.846331/s
     success_rate...................: 100.00% ✓ 29834      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86850      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=7.23µs   min=1.29µs  med=3.56µs   max=4.38ms   p(90)=5.03µs   p(95)=5.61µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=3.43µs   min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=206.43ms min=19.7ms  med=208.67ms max=424.27ms p(90)=230.5ms  p(95)=236.76ms p(99.9)=311.65ms
       { expected_response:true }...: avg=206.43ms min=19.7ms  med=208.67ms max=424.27ms p(90)=230.5ms  p(95)=236.76ms p(99.9)=311.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29050
     http_req_receiving.............: avg=99.79µs  min=34.47µs med=94.89µs  max=4.69ms   p(90)=129.34µs p(95)=142.67µs p(99.9)=522.81µs
     http_req_sending...............: avg=23.4µs   min=6.11µs  med=17.89µs  max=33.34ms  p(90)=23.3µs   p(95)=25.4µs   p(99.9)=564.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.31ms min=19.53ms med=208.54ms max=424.05ms p(90)=230.38ms p(95)=236.63ms p(99.9)=311.55ms
     http_reqs......................: 29050   236.36148/s
     iteration_duration.............: avg=207.4ms  min=51.75ms med=209.02ms max=471.85ms p(90)=230.81ms p(95)=237.08ms p(99.9)=328.56ms
     iterations.....................: 28950   235.547843/s
     success_rate...................: 100.00% ✓ 28950      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

