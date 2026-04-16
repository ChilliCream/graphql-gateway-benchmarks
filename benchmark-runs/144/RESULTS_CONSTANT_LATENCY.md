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
| hive-router | v0.0.43 | 1,587 | 1,609 | 1,584 | 0.5% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,449 | 1,465 | 1,439 | 0.6% |  |
| cosmo | 0.298.0 | 1,155 | 1,172 | 1,145 | 0.9% | non-compatible response (6 across 3/9 runs) |
| grafbase | 0.53.2 | 1,144 | 1,159 | 1,133 | 0.6% |  |
| hive-gateway-router-runtime | 2.5.14 | 571 | 590 | 566 | 1.6% |  |
| apollo-router | v2.12.1 | 360 | 371 | 355 | 1.5% |  |
| hive-gateway | 2.5.14 | 257 | 263 | 253 | 1.4% |  |
| apollo-gateway | 2.13.3 | 232 | 234 | 231 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 580710      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.2µs   min=1µs     med=2.26µs  max=3.61ms   p(90)=4.14µs   p(95)=5.1µs    p(99.9)=37.3µs 
     http_req_connecting............: avg=422ns   min=0s      med=0s      max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.74ms min=14.69ms med=30.51ms max=331.1ms  p(90)=36.48ms  p(95)=38.44ms  p(99.9)=56.46ms
       { expected_response:true }...: avg=30.74ms min=14.69ms med=30.51ms max=331.1ms  p(90)=36.48ms  p(95)=38.44ms  p(99.9)=56.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193670
     http_req_receiving.............: avg=83.8µs  min=26.8µs  med=51.51µs max=46.82ms  p(90)=105.47µs p(95)=159.77µs p(99.9)=2.45ms 
     http_req_sending...............: avg=34.25µs min=5.23µs  med=9.53µs  max=121.8ms  p(90)=20.3µs   p(95)=71.37µs  p(99.9)=1.77ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.63ms min=14.64ms med=30.4ms  max=328.32ms p(90)=36.35ms  p(95)=38.3ms   p(99.9)=55.59ms
     http_reqs......................: 193670  1587.253277/s
     iteration_duration.............: avg=30.98ms min=14.89ms med=30.73ms max=339.81ms p(90)=36.69ms  p(95)=38.66ms  p(99.9)=56.94ms
     iterations.....................: 193570  1586.433711/s
     success_rate...................: 100.00% ✓ 193570      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 530337      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=2.73µs   min=992ns   med=1.99µs   max=2.93ms   p(90)=3.76µs  p(95)=4.65µs   p(99.9)=29.89µs
     http_req_connecting............: avg=238ns    min=0s      med=0s       max=1.92ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.69ms  min=14.36ms med=32.53ms  max=470.25ms p(90)=41.38ms p(95)=44.97ms  p(99.9)=81.79ms
       { expected_response:true }...: avg=33.69ms  min=14.36ms med=32.53ms  max=470.25ms p(90)=41.38ms p(95)=44.97ms  p(99.9)=81.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176879
     http_req_receiving.............: avg=747.04µs min=50.48µs med=110.68µs max=118.66ms p(90)=2.17ms  p(95)=3.29ms   p(99.9)=16.05ms
     http_req_sending...............: avg=37.27µs  min=5.17µs  med=8.96µs   max=148.99ms p(90)=20.05µs p(95)=104.02µs p(99.9)=2.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.91ms  min=13.51ms med=31.78ms  max=469.44ms p(90)=40.34ms p(95)=43.84ms  p(99.9)=80.03ms
     http_reqs......................: 176879  1449.947255/s
     iteration_duration.............: avg=33.93ms  min=14.6ms  med=32.75ms  max=470.44ms p(90)=41.59ms p(95)=45.2ms   p(99.9)=82.27ms
     iterations.....................: 176779  1449.127515/s
     success_rate...................: 100.00% ✓ 176779      ✗ 0     
     vus............................: 30      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 422589      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=4.08µs  min=1.07µs  med=2.55µs  max=55.48ms  p(90)=4.3µs    p(95)=5.08µs   p(99.9)=39.5µs 
     http_req_connecting............: avg=750ns   min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.34ms min=15.82ms med=41.73ms max=340.25ms p(90)=51.56ms  p(95)=54.63ms  p(99.9)=72.61ms
       { expected_response:true }...: avg=42.34ms min=15.82ms med=41.73ms max=340.25ms p(90)=51.56ms  p(95)=54.63ms  p(99.9)=72.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140963
     http_req_receiving.............: avg=90.01µs min=28.01µs med=64.04µs max=213.37ms p(90)=111.29µs p(95)=138.47µs p(99.9)=1.8ms  
     http_req_sending...............: avg=28.88µs min=5.29µs  med=11.26µs max=134.28ms p(90)=19.51µs  p(95)=24.7µs   p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.22ms min=15.67ms med=41.62ms max=339.7ms  p(90)=51.44ms  p(95)=54.51ms  p(99.9)=71.71ms
     http_reqs......................: 140963  1155.138591/s
     iteration_duration.............: avg=42.58ms min=16.27ms med=41.94ms max=366.71ms p(90)=51.77ms  p(95)=54.84ms  p(99.9)=73.23ms
     iterations.....................: 140863  1154.319129/s
     success_rate...................: 100.00% ✓ 140863      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 418719      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.6µs    min=971ns   med=2.25µs  max=4.01ms   p(90)=4.71µs  p(95)=5.83µs   p(99.9)=47.4µs 
     http_req_connecting............: avg=721ns    min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.7ms   min=15.76ms med=42.26ms max=319.12ms p(90)=51.9ms  p(95)=55.07ms  p(99.9)=78.84ms
       { expected_response:true }...: avg=42.7ms   min=15.76ms med=42.26ms max=319.12ms p(90)=51.9ms  p(95)=55.07ms  p(99.9)=78.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139673
     http_req_receiving.............: avg=102.32µs min=29.35µs med=59.85µs max=269.27ms p(90)=132.3µs p(95)=203.33µs p(99.9)=2.63ms 
     http_req_sending...............: avg=38.36µs  min=5.04µs  med=9.99µs  max=198.96ms p(90)=24.04µs p(95)=109.53µs p(99.9)=2.37ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.56ms  min=15.56ms med=42.14ms max=309.65ms p(90)=51.75ms p(95)=54.91ms  p(99.9)=78.17ms
     http_reqs......................: 139673  1144.776084/s
     iteration_duration.............: avg=42.98ms  min=16.84ms med=42.5ms  max=354.22ms p(90)=52.13ms p(95)=55.3ms   p(99.9)=79.51ms
     iterations.....................: 139573  1143.956472/s
     success_rate...................: 100.00% ✓ 139573      ✗ 0     
     vus............................: 38      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 209685     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   687 kB/s
     http_req_blocked...............: avg=4.88µs   min=1.14µs  med=2.97µs  max=4.16ms   p(90)=4.57µs   p(95)=5.25µs   p(99.9)=49.34µs 
     http_req_connecting............: avg=1.56µs   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.5ms   min=22.11ms med=82.85ms max=358.46ms p(90)=104.15ms p(95)=112.75ms p(99.9)=214.7ms 
       { expected_response:true }...: avg=85.5ms   min=22.11ms med=82.85ms max=358.46ms p(90)=104.15ms p(95)=112.75ms p(99.9)=214.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 69995
     http_req_receiving.............: avg=100.51µs min=33.27µs med=76.55µs max=109.05ms p(90)=112.61µs p(95)=126.72µs p(99.9)=1.2ms   
     http_req_sending...............: avg=21.99µs  min=5.72µs  med=13.91µs max=95.35ms  p(90)=20.33µs  p(95)=22.71µs  p(99.9)=728.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.38ms  min=21.98ms med=82.74ms max=297.94ms p(90)=104.04ms p(95)=112.61ms p(99.9)=214.42ms
     http_reqs......................: 69995   571.852039/s
     iteration_duration.............: avg=85.84ms  min=24.81ms med=83.1ms  max=383.9ms  p(90)=104.38ms p(95)=113.02ms p(99.9)=217.99ms
     iterations.....................: 69895   571.035049/s
     success_rate...................: 100.00% ✓ 69895      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 132102     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   432 kB/s
     http_req_blocked...............: avg=5.49µs   min=1.17µs  med=3.01µs   max=3.98ms   p(90)=4.45µs   p(95)=5.01µs   p(99.9)=497.79µs
     http_req_connecting............: avg=2.3µs    min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=365.57µs
     http_req_duration..............: avg=135.8ms  min=22.12ms med=133.81ms max=394.69ms p(90)=170.32ms p(95)=181.78ms p(99.9)=230.56ms
       { expected_response:true }...: avg=135.8ms  min=22.12ms med=133.81ms max=394.69ms p(90)=170.32ms p(95)=181.78ms p(99.9)=230.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44134
     http_req_receiving.............: avg=92.77µs  min=32.59µs med=82.6µs   max=99.83ms  p(90)=116.59µs p(95)=129.24µs p(99.9)=687.34µs
     http_req_sending...............: avg=29.54µs  min=5.64µs  med=14.9µs   max=123.17ms p(90)=20.86µs  p(95)=22.99µs  p(99.9)=573.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=135.67ms min=21.97ms med=133.71ms max=349.19ms p(90)=170.2ms  p(95)=181.66ms p(99.9)=230.48ms
     http_reqs......................: 44134   360.142071/s
     iteration_duration.............: avg=136.33ms min=54.03ms med=134.11ms max=402.01ms p(90)=170.63ms p(95)=182.09ms p(99.9)=236.07ms
     iterations.....................: 44034   359.326051/s
     success_rate...................: 100.00% ✓ 44034      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94065      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=6.9µs    min=1.16µs  med=3.39µs   max=4.21ms   p(90)=4.86µs   p(95)=5.48µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.3µs    min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=190.59ms min=18.73ms med=175.36ms max=635.76ms p(90)=230.35ms p(95)=384.09ms p(99.9)=558.98ms
       { expected_response:true }...: avg=190.59ms min=18.73ms med=175.36ms max=635.76ms p(90)=230.35ms p(95)=384.09ms p(99.9)=558.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31455
     http_req_receiving.............: avg=100.03µs min=34.37µs med=95.51µs  max=5.24ms   p(90)=129.72µs p(95)=143.58µs p(99.9)=674.54µs
     http_req_sending...............: avg=33.82µs  min=6.04µs  med=17.25µs  max=94.52ms  p(90)=22.61µs  p(95)=24.58µs  p(99.9)=548.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.46ms min=18.57ms med=175.22ms max=635.68ms p(90)=230.22ms p(95)=383.93ms p(99.9)=558.87ms
     http_reqs......................: 31455   257.367161/s
     iteration_duration.............: avg=191.43ms min=59.58ms med=175.74ms max=636.04ms p(90)=230.79ms p(95)=385.88ms p(99.9)=559.3ms 
     iterations.....................: 31355   256.548954/s
     success_rate...................: 100.00% ✓ 31355      ✗ 0    
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

     checks.........................: 100.00% ✓ 85512      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=6.92µs   min=1.28µs  med=3.21µs   max=4.06ms   p(90)=4.52µs   p(95)=5.06µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.5µs    min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=209.69ms min=23.62ms med=209.98ms max=433.53ms p(90)=237.06ms p(95)=244.25ms p(99.9)=313.4ms 
       { expected_response:true }...: avg=209.69ms min=23.62ms med=209.98ms max=433.53ms p(90)=237.06ms p(95)=244.25ms p(99.9)=313.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28604
     http_req_receiving.............: avg=165.07µs min=33.62µs med=90.71µs  max=242.62ms p(90)=124.29µs p(95)=137.49µs p(99.9)=866µs   
     http_req_sending...............: avg=40.71µs  min=5.69µs  med=16.15µs  max=199.18ms p(90)=21.65µs  p(95)=23.67µs  p(99.9)=564.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.49ms min=23.41ms med=209.84ms max=409.46ms p(90)=236.87ms p(95)=244.03ms p(99.9)=309.62ms
     http_reqs......................: 28604   232.7812/s
     iteration_duration.............: avg=210.64ms min=61.09ms med=210.3ms  max=455.09ms p(90)=237.37ms p(95)=244.57ms p(99.9)=317.22ms
     iterations.....................: 28504   231.967394/s
     success_rate...................: 100.00% ✓ 28504      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

