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
| hive-router | v0.0.49 | 1,595 | 1,618 | 1,591 | 0.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,446 | 1,463 | 1,437 | 0.5% |  |
| cosmo | 0.307.0 | 1,166 | 1,181 | 1,160 | 0.7% | non-compatible response (2 across 1/9 runs) |
| grafbase | 0.53.3 | 1,141 | 1,162 | 1,129 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 510 | 522 | 503 | 1.2% |  |
| apollo-router | v2.13.1 | 395 | 404 | 392 | 1.0% |  |
| hive-gateway | 2.5.25 | 246 | 251 | 244 | 0.9% |  |
| apollo-gateway | 2.13.3 | 239 | 240 | 235 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 583821      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.33µs  min=932ns   med=2.25µs  max=7.46ms   p(90)=4.2µs    p(95)=5.15µs   p(99.9)=31.83µs
     http_req_connecting............: avg=513ns   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.57ms min=13.7ms  med=30.31ms max=336.4ms  p(90)=36.28ms  p(95)=38.22ms  p(99.9)=58.05ms
       { expected_response:true }...: avg=30.57ms min=13.7ms  med=30.31ms max=336.4ms  p(90)=36.28ms  p(95)=38.22ms  p(99.9)=58.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194707
     http_req_receiving.............: avg=96.03µs min=27.26µs med=52.72µs max=162.37ms p(90)=107.47µs p(95)=166.57µs p(99.9)=2.94ms 
     http_req_sending...............: avg=37.96µs min=5.14µs  med=9.58µs  max=200.85ms p(90)=21.13µs  p(95)=105.58µs p(99.9)=2.03ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.44ms min=13.64ms med=30.2ms  max=335.9ms  p(90)=36.16ms  p(95)=38.06ms  p(99.9)=56.7ms 
     http_reqs......................: 194707  1595.47726/s
     iteration_duration.............: avg=30.82ms min=13.9ms  med=30.54ms max=349.15ms p(90)=36.5ms   p(95)=38.44ms  p(99.9)=58.68ms
     iterations.....................: 194607  1594.657835/s
     success_rate...................: 100.00% ✓ 194607      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 529005      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.03µs   min=982ns   med=1.98µs   max=4.01ms   p(90)=3.6µs   p(95)=4.47µs   p(99.9)=30.84µs
     http_req_connecting............: avg=597ns    min=0s      med=0s       max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.77ms  min=14.67ms med=32.48ms  max=692.6ms  p(90)=41.43ms p(95)=45.07ms  p(99.9)=88.96ms
       { expected_response:true }...: avg=33.77ms  min=14.67ms med=32.48ms  max=692.6ms  p(90)=41.43ms p(95)=45.07ms  p(99.9)=88.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176435
     http_req_receiving.............: avg=822.46µs min=51.11µs med=111.54µs max=203.22ms p(90)=2.32ms  p(95)=3.53ms   p(99.9)=17.02ms
     http_req_sending...............: avg=36µs     min=5.06µs  med=8.67µs   max=124.83ms p(90)=18.98µs p(95)=104.71µs p(99.9)=2.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.92ms  min=14.33ms med=31.68ms  max=691.25ms p(90)=40.26ms p(95)=43.8ms   p(99.9)=82.85ms
     http_reqs......................: 176435  1446.425092/s
     iteration_duration.............: avg=34.01ms  min=14.89ms med=32.71ms  max=692.82ms p(90)=41.65ms p(95)=45.29ms  p(99.9)=94.67ms
     iterations.....................: 176335  1445.605286/s
     success_rate...................: 100.00% ✓ 176335      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 426834      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=2.82µs   min=1.01µs  med=2.14µs  max=2.13ms   p(90)=3.75µs   p(95)=4.51µs   p(99.9)=38.81µs
     http_req_connecting............: avg=282ns    min=0s      med=0s      max=2.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.93ms  min=15.7ms  med=41.31ms max=329.07ms p(90)=51.03ms  p(95)=54.09ms  p(99.9)=70.71ms
       { expected_response:true }...: avg=41.93ms  min=15.7ms  med=41.31ms max=329.07ms p(90)=51.03ms  p(95)=54.09ms  p(99.9)=70.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142378
     http_req_receiving.............: avg=110.93µs min=28.5µs  med=61.62µs max=204.42ms p(90)=107.26µs p(95)=132.32µs p(99.9)=2.12ms 
     http_req_sending...............: avg=27.3µs   min=5.1µs   med=10.2µs  max=226.82ms p(90)=18.34µs  p(95)=22.91µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.79ms  min=15.57ms med=41.21ms max=156.37ms p(90)=50.92ms  p(95)=53.96ms  p(99.9)=69.95ms
     http_reqs......................: 142378  1166.799702/s
     iteration_duration.............: avg=42.16ms  min=19.73ms med=41.52ms max=352.39ms p(90)=51.22ms  p(95)=54.29ms  p(99.9)=71.5ms 
     iterations.....................: 142278  1165.980194/s
     success_rate...................: 100.00% ✓ 142278      ✗ 0     
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

     checks.........................: 100.00% ✓ 417540      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.66µs   min=971ns   med=2.23µs  max=4.03ms   p(90)=4.69µs   p(95)=5.89µs   p(99.9)=51.97µs
     http_req_connecting............: avg=786ns    min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.83ms  min=17.71ms med=42.41ms max=342.21ms p(90)=51.85ms  p(95)=54.93ms  p(99.9)=78.08ms
       { expected_response:true }...: avg=42.83ms  min=17.71ms med=42.41ms max=342.21ms p(90)=51.85ms  p(95)=54.93ms  p(99.9)=78.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139280
     http_req_receiving.............: avg=116.95µs min=29.74µs med=59.08µs max=167.08ms p(90)=133.16µs p(95)=213.53µs p(99.9)=3.79ms 
     http_req_sending...............: avg=41.7µs   min=5.12µs  med=9.76µs  max=186.7ms  p(90)=24.35µs  p(95)=114.3µs  p(99.9)=2.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.67ms  min=17.64ms med=42.29ms max=180.92ms p(90)=51.69ms  p(95)=54.74ms  p(99.9)=76.81ms
     http_reqs......................: 139280  1141.281355/s
     iteration_duration.............: avg=43.1ms   min=17.96ms med=42.66ms max=372.6ms  p(90)=52.08ms  p(95)=55.16ms  p(99.9)=78.6ms 
     iterations.....................: 139180  1140.46194/s
     success_rate...................: 100.00% ✓ 139180      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 187362     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   613 kB/s
     http_req_blocked...............: avg=5.14µs  min=1.06µs  med=3.26µs  max=3.93ms   p(90)=4.91µs   p(95)=5.6µs    p(99.9)=65.83µs 
     http_req_connecting............: avg=1.62µs  min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.72ms min=20.06ms med=92.89ms max=350.56ms p(90)=117.03ms p(95)=127.72ms p(99.9)=221.67ms
       { expected_response:true }...: avg=95.72ms min=20.06ms med=92.89ms max=350.56ms p(90)=117.03ms p(95)=127.72ms p(99.9)=221.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62554
     http_req_receiving.............: avg=123.9µs min=31.26µs med=81.18µs max=126.92ms p(90)=117.35µs p(95)=131.67µs p(99.9)=1.31ms  
     http_req_sending...............: avg=30.31µs min=5.49µs  med=14.66µs max=185.71ms p(90)=21.49µs  p(95)=23.85µs  p(99.9)=697.15µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.56ms min=19.94ms med=92.78ms max=243.09ms p(90)=116.89ms p(95)=127.53ms p(99.9)=221.48ms
     http_reqs......................: 62554   510.71361/s
     iteration_duration.............: avg=96.09ms min=25.27ms med=93.14ms max=385.4ms  p(90)=117.27ms p(95)=128.07ms p(99.9)=223.59ms
     iterations.....................: 62454   509.897173/s
     success_rate...................: 100.00% ✓ 62454      ✗ 0    
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

     checks.........................: 100.00% ✓ 145038     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=5.81µs   min=1.15µs  med=3.16µs   max=5.08ms   p(90)=4.68µs   p(95)=5.3µs    p(99.9)=218.66µs
     http_req_connecting............: avg=2.39µs   min=0s      med=0s       max=5.02ms   p(90)=0s       p(95)=0s       p(99.9)=168.9µs 
     http_req_duration..............: avg=123.65ms min=22.25ms med=121.79ms max=375.38ms p(90)=154.16ms p(95)=164.75ms p(99.9)=211.02ms
       { expected_response:true }...: avg=123.65ms min=22.25ms med=121.79ms max=375.38ms p(90)=154.16ms p(95)=164.75ms p(99.9)=211.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48446
     http_req_receiving.............: avg=91.13µs  min=31.2µs  med=85.61µs  max=27.58ms  p(90)=118.67µs p(95)=131.01µs p(99.9)=900.44µs
     http_req_sending...............: avg=26.23µs  min=5.15µs  med=15.85µs  max=82.51ms  p(90)=21.6µs   p(95)=23.62µs  p(99.9)=679.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.53ms min=22.1ms  med=121.67ms max=375.2ms  p(90)=154.02ms p(95)=164.62ms p(99.9)=210.55ms
     http_reqs......................: 48446   395.505232/s
     iteration_duration.............: avg=124.13ms min=35.8ms  med=122.08ms max=386.8ms  p(90)=154.44ms p(95)=165.07ms p(99.9)=213.96ms
     iterations.....................: 48346   394.688849/s
     success_rate...................: 100.00% ✓ 48346      ✗ 0    
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

     checks.........................: 100.00% ✓ 90012      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=7.41µs   min=1.14µs  med=3.62µs   max=4.36ms   p(90)=5.17µs   p(95)=5.83µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=199.2ms  min=18.65ms med=187.07ms max=584.21ms p(90)=231.27ms p(95)=402.71ms p(99.9)=532.68ms
       { expected_response:true }...: avg=199.2ms  min=18.65ms med=187.07ms max=584.21ms p(90)=231.27ms p(95)=402.71ms p(99.9)=532.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30104
     http_req_receiving.............: avg=200.8µs  min=32.23µs med=98.55µs  max=226.98ms p(90)=132.15µs p(95)=145.75µs p(99.9)=1.4ms   
     http_req_sending...............: avg=26.43µs  min=6.22µs  med=18.11µs  max=30.52ms  p(90)=23.45µs  p(95)=25.36µs  p(99.9)=583.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.97ms min=18.5ms  med=186.87ms max=584.07ms p(90)=230.99ms p(95)=402.6ms  p(99.9)=532.6ms 
     http_reqs......................: 30104   246.290579/s
     iteration_duration.............: avg=200.11ms min=30.61ms med=187.48ms max=584.51ms p(90)=231.72ms p(95)=403.91ms p(99.9)=532.93ms
     iterations.....................: 30004   245.472447/s
     success_rate...................: 100.00% ✓ 30004      ✗ 0    
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

     checks.........................: 100.00% ✓ 87867      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=8.26µs   min=1.28µs  med=3.42µs   max=5.12ms   p(90)=4.95µs   p(95)=5.56µs   p(99.9)=2.3ms   
     http_req_connecting............: avg=4.57µs   min=0s      med=0s       max=5.07ms   p(90)=0s       p(95)=0s       p(99.9)=2.26ms  
     http_req_duration..............: avg=204.09ms min=21.5ms  med=203.81ms max=433.49ms p(90)=218.86ms p(95)=224.27ms p(99.9)=296.98ms
       { expected_response:true }...: avg=204.09ms min=21.5ms  med=203.81ms max=433.49ms p(90)=218.86ms p(95)=224.27ms p(99.9)=296.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29389
     http_req_receiving.............: avg=102.19µs min=35.75µs med=94.35µs  max=56.88ms  p(90)=128.78µs p(95)=142.81µs p(99.9)=463.14µs
     http_req_sending...............: avg=26.37µs  min=6.33µs  med=17.69µs  max=81.9ms   p(90)=23.09µs  p(95)=25.14µs  p(99.9)=580.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.96ms min=21.34ms med=203.67ms max=433.18ms p(90)=218.74ms p(95)=224.12ms p(99.9)=296.89ms
     http_reqs......................: 29389   239.154511/s
     iteration_duration.............: avg=205.03ms min=39.42ms med=204.18ms max=453.4ms  p(90)=219.14ms p(95)=224.57ms p(99.9)=303.73ms
     iterations.....................: 29289   238.340756/s
     success_rate...................: 100.00% ✓ 29289      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

