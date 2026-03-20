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
| hive-router | v0.0.41 | 1,544 | 1,574 | 1,532 | 0.8% |  |
| hotchocolate | 16.0.0-p.11.52 | 1,417 | 1,441 | 1,390 | 1.0% |  |
| cosmo | 0.291.0 | 1,142 | 1,160 | 1,137 | 0.7% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.2 | 1,135 | 1,156 | 1,126 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.6 | 489 | 500 | 485 | 1.1% |  |
| apollo-router | v2.12.0 | 380 | 388 | 374 | 1.1% |  |
| hive-gateway | 2.5.6 | 253 | 259 | 251 | 1.1% |  |
| apollo-gateway | 2.13.2 | 233 | 235 | 232 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 564828      ✗ 0     
     data_received..................: 17 GB   135 MB/s
     data_sent......................: 226 MB  1.9 MB/s
     http_req_blocked...............: avg=3.47µs  min=982ns   med=2.41µs  max=7.03ms   p(90)=4.23µs   p(95)=5.18µs   p(99.9)=37.39µs
     http_req_connecting............: avg=550ns   min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.62ms min=14.02ms med=31.28ms max=347.57ms p(90)=37.67ms  p(95)=39.72ms  p(99.9)=58.62ms
       { expected_response:true }...: avg=31.62ms min=14.02ms med=31.28ms max=347.57ms p(90)=37.67ms  p(95)=39.72ms  p(99.9)=58.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188376
     http_req_receiving.............: avg=85.29µs min=27.42µs med=54.18µs max=47.64ms  p(90)=105.71µs p(95)=153.16µs p(99.9)=2.48ms 
     http_req_sending...............: avg=35.58µs min=5.12µs  med=9.92µs  max=273.66ms p(90)=20.01µs  p(95)=50.73µs  p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.5ms  min=13.93ms med=31.17ms max=347.15ms p(90)=37.55ms  p(95)=39.58ms  p(99.9)=57.08ms
     http_reqs......................: 188376  1544.24395/s
     iteration_duration.............: avg=31.86ms min=14.25ms med=31.5ms  max=358.95ms p(90)=37.89ms  p(95)=39.94ms  p(99.9)=59.16ms
     iterations.....................: 188276  1543.424183/s
     success_rate...................: 100.00% ✓ 188276      ✗ 0     
     vus............................: 12      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.52)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 518718      ✗ 0     
     data_received..................: 15 GB   124 MB/s
     data_sent......................: 208 MB  1.7 MB/s
     http_req_blocked...............: avg=3.15µs   min=982ns   med=2.38µs   max=3.32ms   p(90)=4.04µs  p(95)=4.79µs  p(99.9)=36.34µs 
     http_req_connecting............: avg=372ns    min=0s      med=0s       max=3.29ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=34.45ms  min=15.06ms med=32.96ms  max=475.46ms p(90)=42.74ms p(95)=47.17ms p(99.9)=143.07ms
       { expected_response:true }...: avg=34.45ms  min=15.06ms med=32.96ms  max=475.46ms p(90)=42.74ms p(95)=47.17ms p(99.9)=143.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173006
     http_req_receiving.............: avg=603.24µs min=51.54µs med=117.95µs max=59.69ms  p(90)=1.67ms  p(95)=2.55ms  p(99.9)=13.5ms  
     http_req_sending...............: avg=35.31µs  min=5.21µs  med=9.95µs   max=282.64ms p(90)=19.7µs  p(95)=57.5µs  p(99.9)=1.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=33.82ms  min=14.89ms med=32.32ms  max=475.29ms p(90)=41.98ms p(95)=46.37ms p(99.9)=141.48ms
     http_reqs......................: 173006  1417.958848/s
     iteration_duration.............: avg=34.69ms  min=15.3ms  med=33.18ms  max=475.66ms p(90)=42.96ms p(95)=47.39ms p(99.9)=155.48ms
     iterations.....................: 172906  1417.139247/s
     success_rate...................: 100.00% ✓ 172906      ✗ 0     
     vus............................: 40      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 417897      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.59µs  min=981ns   med=2.47µs  max=3.99ms   p(90)=4.08µs   p(95)=4.82µs  p(99.9)=38.55µs
     http_req_connecting............: avg=717ns   min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=42.82ms min=15.82ms med=42.21ms max=335.45ms p(90)=52.11ms  p(95)=55.24ms p(99.9)=72.32ms
       { expected_response:true }...: avg=42.82ms min=15.82ms med=42.21ms max=335.45ms p(90)=52.11ms  p(95)=55.24ms p(99.9)=72.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139399
     http_req_receiving.............: avg=86.72µs min=29.45µs med=63.51µs max=100.65ms p(90)=108.03µs p(95)=135µs   p(99.9)=1.89ms 
     http_req_sending...............: avg=26.36µs min=4.99µs  med=10.7µs  max=77.99ms  p(90)=18.16µs  p(95)=23.05µs p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=42.71ms min=15.62ms med=42.1ms  max=334.69ms p(90)=51.99ms  p(95)=55.13ms p(99.9)=72.15ms
     http_reqs......................: 139399  1142.416943/s
     iteration_duration.............: avg=43.06ms min=20.62ms med=42.41ms max=359.6ms  p(90)=52.32ms  p(95)=55.45ms p(99.9)=72.78ms
     iterations.....................: 139299  1141.597413/s
     success_rate...................: 100.00% ✓ 139299      ✗ 0     
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

     checks.........................: 100.00% ✓ 415374      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.61µs  min=982ns   med=2.21µs  max=4.08ms   p(90)=4.53µs   p(95)=5.69µs   p(99.9)=41.9µs 
     http_req_connecting............: avg=775ns   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.05ms min=17.38ms med=42.59ms max=340.85ms p(90)=52.33ms  p(95)=55.52ms  p(99.9)=79ms   
       { expected_response:true }...: avg=43.05ms min=17.38ms med=42.59ms max=340.85ms p(90)=52.33ms  p(95)=55.52ms  p(99.9)=79ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 138558
     http_req_receiving.............: avg=98.23µs min=29.06µs med=58.62µs max=254.57ms p(90)=129.62µs p(95)=199.76µs p(99.9)=2.7ms  
     http_req_sending...............: avg=35.28µs min=5.18µs  med=9.84µs  max=137.98ms p(90)=23.34µs  p(95)=108.73µs p(99.9)=1.94ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.91ms min=17.27ms med=42.47ms max=329.39ms p(90)=52.19ms  p(95)=55.37ms  p(99.9)=77.88ms
     http_reqs......................: 138558  1135.491857/s
     iteration_duration.............: avg=43.32ms min=18.28ms med=42.83ms max=353.34ms p(90)=52.56ms  p(95)=55.75ms  p(99.9)=79.58ms
     iterations.....................: 138458  1134.672351/s
     success_rate...................: 100.00% ✓ 138458      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 179385     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 72 MB   587 kB/s
     http_req_blocked...............: avg=5.11µs   min=1.19µs  med=3.12µs  max=4.64ms   p(90)=4.66µs   p(95)=5.3µs    p(99.9)=49.47µs 
     http_req_connecting............: avg=1.72µs   min=0s      med=0s      max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.97ms  min=22.73ms med=97.65ms max=364.52ms p(90)=118.83ms p(95)=126.9ms  p(99.9)=228ms   
       { expected_response:true }...: avg=99.97ms  min=22.73ms med=97.65ms max=364.52ms p(90)=118.83ms p(95)=126.9ms  p(99.9)=228ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 59895
     http_req_receiving.............: avg=88.05µs  min=31.56µs med=79.91µs max=80.99ms  p(90)=115.03µs p(95)=128.55µs p(99.9)=799.91µs
     http_req_sending...............: avg=21.47µs  min=5.96µs  med=14.36µs max=64.28ms  p(90)=21.07µs  p(95)=23.39µs  p(99.9)=649.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.86ms  min=22.58ms med=97.54ms max=361.15ms p(90)=118.73ms p(95)=126.78ms p(99.9)=227.89ms
     http_reqs......................: 59895   489.15472/s
     iteration_duration.............: avg=100.35ms min=30.25ms med=97.9ms  max=379.55ms p(90)=119.08ms p(95)=127.21ms p(99.9)=229.75ms
     iterations.....................: 59795   488.338033/s
     success_rate...................: 100.00% ✓ 59795      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 139419     ✗ 0    
     data_received..................: 4.1 GB  33 MB/s
     data_sent......................: 56 MB   457 kB/s
     http_req_blocked...............: avg=5.84µs   min=1.15µs  med=3.38µs   max=4.09ms   p(90)=4.94µs   p(95)=5.56µs   p(99.9)=255.47µs
     http_req_connecting............: avg=2.25µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=215.81µs
     http_req_duration..............: avg=128.65ms min=21.03ms med=126.67ms max=374.35ms p(90)=160.61ms p(95)=171.31ms p(99.9)=217.05ms
       { expected_response:true }...: avg=128.65ms min=21.03ms med=126.67ms max=374.35ms p(90)=160.61ms p(95)=171.31ms p(99.9)=217.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46573
     http_req_receiving.............: avg=92.62µs  min=31.88µs med=85.58µs  max=101.98ms p(90)=119.78µs p(95)=133.17µs p(99.9)=690.69µs
     http_req_sending...............: avg=28.54µs  min=6.05µs  med=15.88µs  max=149.77ms p(90)=21.98µs  p(95)=24.08µs  p(99.9)=551.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.53ms min=20.91ms med=126.57ms max=373.82ms p(90)=160.5ms  p(95)=171.19ms p(99.9)=216.83ms
     http_reqs......................: 46573   380.223272/s
     iteration_duration.............: avg=129.16ms min=42.6ms  med=126.98ms max=384.59ms p(90)=160.89ms p(95)=171.63ms p(99.9)=220.76ms
     iterations.....................: 46473   379.406869/s
     success_rate...................: 100.00% ✓ 46473      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92604      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=6.88µs   min=1.22µs  med=3.46µs   max=4.03ms   p(90)=4.87µs   p(95)=5.46µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=3.25µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=193.7ms  min=18.51ms med=193.64ms max=684.54ms p(90)=252.2ms  p(95)=337.65ms p(99.9)=596.23ms
       { expected_response:true }...: avg=193.7ms  min=18.51ms med=193.64ms max=684.54ms p(90)=252.2ms  p(95)=337.65ms p(99.9)=596.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30968
     http_req_receiving.............: avg=98.1µs   min=36.66µs med=92.51µs  max=22.73ms  p(90)=124.77µs p(95)=138.4µs  p(99.9)=650.5µs 
     http_req_sending...............: avg=32.5µs   min=6.06µs  med=16.77µs  max=89.27ms  p(90)=22.14µs  p(95)=23.97µs  p(99.9)=586.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.57ms min=18.38ms med=193.51ms max=684.09ms p(90)=252.08ms p(95)=337.55ms p(99.9)=596.1ms 
     http_reqs......................: 30968   253.177927/s
     iteration_duration.............: avg=194.55ms min=36.9ms  med=194.16ms max=684.8ms  p(90)=252.61ms p(95)=342.18ms p(99.9)=596.52ms
     iterations.....................: 30868   252.36038/s
     success_rate...................: 100.00% ✓ 30868      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85962      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=5.17µs   min=1.29µs  med=3.4µs    max=2.61ms   p(90)=4.79µs   p(95)=5.36µs   p(99.9)=550.78µs
     http_req_connecting............: avg=1.58µs   min=0s      med=0s       max=2.59ms   p(90)=0s       p(95)=0s       p(99.9)=525.84µs
     http_req_duration..............: avg=208.58ms min=21.25ms med=207.94ms max=420.83ms p(90)=238.03ms p(95)=245.38ms p(99.9)=317.6ms 
       { expected_response:true }...: avg=208.58ms min=21.25ms med=207.94ms max=420.83ms p(90)=238.03ms p(95)=245.38ms p(99.9)=317.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28754
     http_req_receiving.............: avg=101.66µs min=34.23µs med=92.16µs  max=63.37ms  p(90)=124.88µs p(95)=137.77µs p(99.9)=636.13µs
     http_req_sending...............: avg=34.01µs  min=6.15µs  med=17.12µs  max=129.74ms p(90)=22.27µs  p(95)=24.25µs  p(99.9)=732.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.45ms min=20.88ms med=207.82ms max=420.62ms p(90)=237.9ms  p(95)=245.24ms p(99.9)=317.39ms
     http_reqs......................: 28754   233.971391/s
     iteration_duration.............: avg=209.52ms min=60.01ms med=208.31ms max=436.56ms p(90)=238.34ms p(95)=245.68ms p(99.9)=320.47ms
     iterations.....................: 28654   233.157691/s
     success_rate...................: 100.00% ✓ 28654      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

