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
| hive-router | v0.0.43 | 1,580 | 1,610 | 1,575 | 0.7% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,437 | 1,451 | 1,434 | 0.4% |  |
| cosmo | 0.298.0 | 1,168 | 1,180 | 1,156 | 0.8% | non-compatible response (5 across 4/9 runs) |
| grafbase | 0.53.2 | 1,130 | 1,147 | 1,125 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.14 | 581 | 591 | 576 | 0.7% |  |
| apollo-router | v2.12.1 | 363 | 373 | 359 | 1.3% |  |
| hive-gateway | 2.5.14 | 257 | 263 | 256 | 1.0% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 234 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578370      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.01µs  min=952ns   med=2.11µs  max=3.8ms    p(90)=3.83µs   p(95)=4.71µs   p(99.9)=32.86µs
     http_req_connecting............: avg=449ns   min=0s      med=0s      max=3.78ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.88ms min=14.38ms med=30.59ms max=336.35ms p(90)=36.77ms  p(95)=38.74ms  p(99.9)=57.5ms 
       { expected_response:true }...: avg=30.88ms min=14.38ms med=30.59ms max=336.35ms p(90)=36.77ms  p(95)=38.74ms  p(99.9)=57.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 192890
     http_req_receiving.............: avg=84.16µs min=27.87µs med=51.88µs max=260.1ms  p(90)=100.61µs p(95)=143.09µs p(99.9)=2.85ms 
     http_req_sending...............: avg=33.57µs min=5.11µs  med=9.28µs  max=129.37ms p(90)=19.03µs  p(95)=33.38µs  p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.76ms min=14.31ms med=30.49ms max=335.77ms p(90)=36.66ms  p(95)=38.59ms  p(99.9)=56.67ms
     http_reqs......................: 192890  1580.577529/s
     iteration_duration.............: avg=31.11ms min=14.58ms med=30.81ms max=351.7ms  p(90)=36.98ms  p(95)=38.95ms  p(99.9)=58.08ms
     iterations.....................: 192790  1579.75811/s
     success_rate...................: 100.00% ✓ 192790      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 526092      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.11µs   min=962ns   med=1.99µs   max=5.38ms   p(90)=3.8µs   p(95)=4.67µs  p(99.9)=31.59µs
     http_req_connecting............: avg=591ns    min=0s      med=0s       max=4.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=33.96ms  min=14.62ms med=32.84ms  max=482.92ms p(90)=41.75ms p(95)=45.21ms p(99.9)=81.24ms
       { expected_response:true }...: avg=33.96ms  min=14.62ms med=32.84ms  max=482.92ms p(90)=41.75ms p(95)=45.21ms p(99.9)=81.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175464
     http_req_receiving.............: avg=792.83µs min=50.14µs med=114.79µs max=39.09ms  p(90)=2.3ms   p(95)=3.41ms  p(99.9)=16.52ms
     http_req_sending...............: avg=35.37µs  min=5.04µs  med=8.99µs   max=136.89ms p(90)=20.31µs p(95)=103.4µs p(99.9)=2.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=33.13ms  min=14.2ms  med=32.05ms  max=479.51ms p(90)=40.63ms p(95)=44.03ms p(99.9)=79.86ms
     http_reqs......................: 175464  1437.529299/s
     iteration_duration.............: avg=34.2ms   min=14.86ms med=33.06ms  max=483.12ms p(90)=41.97ms p(95)=45.43ms p(99.9)=81.84ms
     iterations.....................: 175364  1436.710026/s
     success_rate...................: 100.00% ✓ 175364      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 427614      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.49µs  min=992ns   med=2.4µs   max=4.32ms   p(90)=4.05µs   p(95)=4.78µs   p(99.9)=37.38µs
     http_req_connecting............: avg=686ns   min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.84ms min=15.82ms med=41.25ms max=255.43ms p(90)=50.96ms  p(95)=53.97ms  p(99.9)=69.54ms
       { expected_response:true }...: avg=41.84ms min=15.82ms med=41.25ms max=255.43ms p(90)=50.96ms  p(95)=53.97ms  p(99.9)=69.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142638
     http_req_receiving.............: avg=84.92µs min=28.38µs med=62.57µs max=120.26ms p(90)=107.65µs p(95)=133.64µs p(99.9)=1.77ms 
     http_req_sending...............: avg=27.71µs min=5.26µs  med=10.59µs max=118.32ms p(90)=18.42µs  p(95)=23.19µs  p(99.9)=1.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.73ms min=15.72ms med=41.15ms max=254.86ms p(90)=50.83ms  p(95)=53.83ms  p(99.9)=69ms   
     http_reqs......................: 142638  1168.820596/s
     iteration_duration.............: avg=42.08ms min=19.33ms med=41.46ms max=358.95ms p(90)=51.16ms  p(95)=54.16ms  p(99.9)=69.88ms
     iterations.....................: 142538  1168.001164/s
     success_rate...................: 100.00% ✓ 142538      ✗ 0     
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

     checks.........................: 100.00% ✓ 413451      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.57µs  min=922ns   med=2.18µs  max=4.6ms    p(90)=4.53µs   p(95)=5.65µs   p(99.9)=34.09µs
     http_req_connecting............: avg=803ns   min=0s      med=0s      max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.25ms min=17.51ms med=42.87ms max=343.82ms p(90)=52.46ms  p(95)=55.56ms  p(99.9)=82.01ms
       { expected_response:true }...: avg=43.25ms min=17.51ms med=42.87ms max=343.82ms p(90)=52.46ms  p(95)=55.56ms  p(99.9)=82.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137917
     http_req_receiving.............: avg=95.03µs min=29.14µs med=58.44µs max=112.63ms p(90)=129.09µs p(95)=201.47µs p(99.9)=3.36ms 
     http_req_sending...............: avg=37.19µs min=5.19µs  med=9.75µs  max=94.63ms  p(90)=23.47µs  p(95)=108.91µs p(99.9)=2.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.12ms min=17.31ms med=42.75ms max=343.33ms p(90)=52.32ms  p(95)=55.43ms  p(99.9)=81.37ms
     http_reqs......................: 137917  1130.100805/s
     iteration_duration.............: avg=43.53ms min=18.79ms med=43.11ms max=354.66ms p(90)=52.69ms  p(95)=55.8ms   p(99.9)=82.39ms
     iterations.....................: 137817  1129.281398/s
     success_rate...................: 100.00% ✓ 137817      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 213378     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 86 MB   699 kB/s
     http_req_blocked...............: avg=6.83µs  min=1.11µs  med=2.99µs  max=11.35ms  p(90)=4.56µs   p(95)=5.2µs    p(99.9)=46.1µs  
     http_req_connecting............: avg=3.2µs   min=0s      med=0s      max=8.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.02ms min=19.63ms med=82.01ms max=351.13ms p(90)=98.01ms  p(95)=105.17ms p(99.9)=201.46ms
       { expected_response:true }...: avg=84.02ms min=19.63ms med=82.01ms max=351.13ms p(90)=98.01ms  p(95)=105.17ms p(99.9)=201.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71226
     http_req_receiving.............: avg=87.54µs min=30.51µs med=74.74µs max=181.24ms p(90)=109.87µs p(95)=124.06µs p(99.9)=910.56µs
     http_req_sending...............: avg=31.8µs  min=5.49µs  med=13.23µs max=217.82ms p(90)=19.97µs  p(95)=22.43µs  p(99.9)=1.11ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.9ms  min=19.42ms med=81.9ms  max=350.98ms p(90)=97.9ms   p(95)=105.04ms p(99.9)=200.69ms
     http_reqs......................: 71226   581.709782/s
     iteration_duration.............: avg=84.36ms min=27.93ms med=82.24ms max=364.3ms  p(90)=98.24ms  p(95)=105.43ms p(99.9)=202.92ms
     iterations.....................: 71126   580.893073/s
     success_rate...................: 100.00% ✓ 71126      ✗ 0    
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

     checks.........................: 100.00% ✓ 133164     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   436 kB/s
     http_req_blocked...............: avg=4.6µs    min=1.17µs  med=3.19µs   max=2.94ms   p(90)=4.64µs   p(95)=5.22µs   p(99.9)=171.2µs 
     http_req_connecting............: avg=1.24µs   min=0s      med=0s       max=2.89ms   p(90)=0s       p(95)=0s       p(99.9)=110.17µs
     http_req_duration..............: avg=134.7ms  min=21.53ms med=132.77ms max=355.03ms p(90)=168.58ms p(95)=180.17ms p(99.9)=227.72ms
       { expected_response:true }...: avg=134.7ms  min=21.53ms med=132.77ms max=355.03ms p(90)=168.58ms p(95)=180.17ms p(99.9)=227.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44488
     http_req_receiving.............: avg=92.58µs  min=31.51µs med=84.18µs  max=89.22ms  p(90)=117.81µs p(95)=130.59µs p(99.9)=771.64µs
     http_req_sending...............: avg=27.88µs  min=6.04µs  med=15.52µs  max=153.29ms p(90)=21.27µs  p(95)=23.28µs  p(99.9)=678.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.58ms min=21.39ms med=132.65ms max=354.37ms p(90)=168.48ms p(95)=180.04ms p(99.9)=227.3ms 
     http_reqs......................: 44488   363.087967/s
     iteration_duration.............: avg=135.21ms min=39.62ms med=133.07ms max=372.68ms p(90)=168.86ms p(95)=180.45ms p(99.9)=230.56ms
     iterations.....................: 44388   362.271819/s
     success_rate...................: 100.00% ✓ 44388      ✗ 0    
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

     checks.........................: 100.00% ✓ 94185      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=6.97µs   min=1.16µs  med=3.49µs   max=4.11ms   p(90)=4.97µs   p(95)=5.59µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=3.28µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=190.36ms min=18.67ms med=173.59ms max=611.3ms  p(90)=237.11ms p(95)=395.07ms p(99.9)=542.54ms
       { expected_response:true }...: avg=190.36ms min=18.67ms med=173.59ms max=611.3ms  p(90)=237.11ms p(95)=395.07ms p(99.9)=542.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31495
     http_req_receiving.............: avg=108.67µs min=37.26µs med=94.37µs  max=206.37ms p(90)=128.22µs p(95)=141.95µs p(99.9)=713.72µs
     http_req_sending...............: avg=22.53µs  min=6.29µs  med=17.5µs   max=30.68ms  p(90)=22.98µs  p(95)=24.91µs  p(99.9)=551.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.23ms min=18.56ms med=173.46ms max=611.16ms p(90)=236.99ms p(95)=394.93ms p(99.9)=542.43ms
     http_reqs......................: 31495   257.778187/s
     iteration_duration.............: avg=191.21ms min=64.58ms med=174.02ms max=611.53ms p(90)=237.64ms p(95)=396.85ms p(99.9)=542.77ms
     iterations.....................: 31395   256.959714/s
     success_rate...................: 100.00% ✓ 31395      ✗ 0    
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

     checks.........................: 100.00% ✓ 86571      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=5.08µs   min=1.27µs  med=3.37µs   max=2.34ms   p(90)=4.78µs   p(95)=5.37µs   p(99.9)=595.12µs
     http_req_connecting............: avg=1.47µs   min=0s      med=0s       max=2.32ms   p(90)=0s       p(95)=0s       p(99.9)=554.39µs
     http_req_duration..............: avg=207.12ms min=23.81ms med=206.22ms max=416.36ms p(90)=222.88ms p(95)=228.83ms p(99.9)=294.6ms 
       { expected_response:true }...: avg=207.12ms min=23.81ms med=206.22ms max=416.36ms p(90)=222.88ms p(95)=228.83ms p(99.9)=294.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28957
     http_req_receiving.............: avg=139.21µs min=35.12µs med=92.59µs  max=183.52ms p(90)=125.71µs p(95)=138.92µs p(99.9)=891.93µs
     http_req_sending...............: avg=38.87µs  min=5.95µs  med=17.13µs  max=222.97ms p(90)=22.55µs  p(95)=24.57µs  p(99.9)=498.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.94ms min=23.7ms  med=206.1ms  max=385.74ms p(90)=222.72ms p(95)=228.66ms p(99.9)=292.12ms
     http_reqs......................: 28957   235.642484/s
     iteration_duration.............: avg=208.05ms min=85ms    med=206.55ms max=416.67ms p(90)=223.15ms p(95)=229.17ms p(99.9)=296.77ms
     iterations.....................: 28857   234.828717/s
     success_rate...................: 100.00% ✓ 28857      ✗ 0    
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

