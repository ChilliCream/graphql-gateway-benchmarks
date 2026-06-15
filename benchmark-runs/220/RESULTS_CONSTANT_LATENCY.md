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
| hive-router | v0.0.65 | 1,569 | 1,596 | 1,555 | 0.9% |  |
| hotchocolate | 16.1.3 | 1,444 | 1,466 | 1,437 | 0.7% |  |
| grafbase | 0.53.5 | 1,142 | 1,153 | 1,130 | 0.7% |  |
| cosmo | 0.321.1 | 1,113 | 1,130 | 1,109 | 0.7% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 516 | 531 | 510 | 1.4% |  |
| apollo-router | v2.15.0 | 370 | 384 | 365 | 1.8% |  |
| hive-gateway | 2.8.2 | 238 | 241 | 235 | 0.9% |  |
| apollo-gateway | 2.14.1 | 236 | 237 | 233 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 574164      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 230 MB  1.9 MB/s
     http_req_blocked...............: avg=3.54µs  min=962ns   med=2.58µs  max=4.19ms   p(90)=4.35µs   p(95)=5.27µs   p(99.9)=34.18µs
     http_req_connecting............: avg=519ns   min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.09ms min=13.46ms med=30.81ms max=331.84ms p(90)=37.01ms  p(95)=39.03ms  p(99.9)=57.93ms
       { expected_response:true }...: avg=31.09ms min=13.46ms med=30.81ms max=331.84ms p(90)=37.01ms  p(95)=39.03ms  p(99.9)=57.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 191488
     http_req_receiving.............: avg=85.27µs min=28.12µs med=55.43µs max=37.61ms  p(90)=106.01µs p(95)=152.05µs p(99.9)=2.65ms 
     http_req_sending...............: avg=37.11µs min=4.97µs  med=10.26µs max=209.88ms p(90)=20.12µs  p(95)=38.93µs  p(99.9)=1.84ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.97ms min=13.39ms med=30.7ms  max=331.17ms p(90)=36.9ms   p(95)=38.87ms  p(99.9)=56.38ms
     http_reqs......................: 191488  1569.191213/s
     iteration_duration.............: avg=31.34ms min=13.65ms med=31.04ms max=342.5ms  p(90)=37.23ms  p(95)=39.25ms  p(99.9)=58.57ms
     iterations.....................: 191388  1568.37174/s
     success_rate...................: 100.00% ✓ 191388      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 528447      ✗ 0     
     data_received..................: 15 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.47µs   min=982ns   med=2.4µs    max=4.35ms   p(90)=4.28µs  p(95)=5.16µs   p(99.9)=35.15µs
     http_req_connecting............: avg=600ns    min=0s      med=0s       max=4.28ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.8ms   min=13.88ms med=32.65ms  max=495.12ms p(90)=41.43ms p(95)=45.11ms  p(99.9)=83.8ms 
       { expected_response:true }...: avg=33.8ms   min=13.88ms med=32.65ms  max=495.12ms p(90)=41.43ms p(95)=45.11ms  p(99.9)=83.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 176249
     http_req_receiving.............: avg=811.25µs min=51.39µs med=114.99µs max=231.15ms p(90)=2.35ms  p(95)=3.57ms   p(99.9)=17.18ms
     http_req_sending...............: avg=39.38µs  min=5.23µs  med=9.61µs   max=216.03ms p(90)=20.73µs p(95)=107.86µs p(99.9)=2.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.95ms  min=13.58ms med=31.83ms  max=494.8ms  p(90)=40.33ms p(95)=43.84ms  p(99.9)=80.74ms
     http_reqs......................: 176249  1444.366359/s
     iteration_duration.............: avg=34.05ms  min=14.1ms  med=32.88ms  max=495.44ms p(90)=41.65ms p(95)=45.34ms  p(99.9)=84.35ms
     iterations.....................: 176149  1443.546856/s
     success_rate...................: 100.00% ✓ 176149      ✗ 0     
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

     checks.........................: 100.00% ✓ 417951      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.34µs  min=952ns   med=2.45µs  max=4.03ms   p(90)=4.81µs   p(95)=5.9µs    p(99.9)=42.82µs
     http_req_connecting............: avg=279ns   min=0s      med=0s      max=1.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.79ms min=15.23ms med=42.3ms  max=330.18ms p(90)=52.05ms  p(95)=55.36ms  p(99.9)=81.95ms
       { expected_response:true }...: avg=42.79ms min=15.23ms med=42.3ms  max=330.18ms p(90)=52.05ms  p(95)=55.36ms  p(99.9)=81.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139417
     http_req_receiving.............: avg=97.87µs min=29.22µs med=59.23µs max=91.89ms  p(90)=129.68µs p(95)=204.46µs p(99.9)=3.32ms 
     http_req_sending...............: avg=38.01µs min=5.13µs  med=10.11µs max=153.66ms p(90)=24.13µs  p(95)=110.07µs p(99.9)=2.45ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.65ms min=15.09ms med=42.18ms max=329.85ms p(90)=51.91ms  p(95)=55.2ms   p(99.9)=81.46ms
     http_reqs......................: 139417  1142.41321/s
     iteration_duration.............: avg=43.06ms min=16.48ms med=42.55ms max=370.79ms p(90)=52.29ms  p(95)=55.61ms  p(99.9)=82.79ms
     iterations.....................: 139317  1141.593789/s
     success_rate...................: 100.00% ✓ 139317      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 407640      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=4.17µs   min=1.09µs  med=2.74µs  max=37.26ms  p(90)=4.47µs  p(95)=5.24µs   p(99.9)=38.82µs
     http_req_connecting............: avg=753ns    min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.9ms   min=19.3ms  med=43.29ms max=339.36ms p(90)=53.38ms p(95)=56.62ms  p(99.9)=75.4ms 
       { expected_response:true }...: avg=43.9ms   min=19.3ms  med=43.29ms max=339.36ms p(90)=53.38ms p(95)=56.62ms  p(99.9)=75.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 135980
     http_req_receiving.............: avg=103.24µs min=27.76µs med=66.09µs max=154.19ms p(90)=113.5µs p(95)=140.96µs p(99.9)=2.16ms 
     http_req_sending...............: avg=28.81µs  min=5.23µs  med=11.2µs  max=114.52ms p(90)=19.45µs p(95)=24.64µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.77ms  min=19.14ms med=43.19ms max=257.3ms  p(90)=53.26ms p(95)=56.49ms  p(99.9)=74.16ms
     http_reqs......................: 135980  1113.968237/s
     iteration_duration.............: avg=44.15ms  min=20.67ms med=43.51ms max=368.27ms p(90)=53.6ms  p(95)=56.83ms  p(99.9)=75.74ms
     iterations.....................: 135880  1113.149022/s
     success_rate...................: 100.00% ✓ 135880      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 189330     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   620 kB/s
     http_req_blocked...............: avg=5.27µs  min=1.23µs  med=3.23µs  max=4.15ms   p(90)=4.77µs   p(95)=5.43µs   p(99.9)=51.39µs 
     http_req_connecting............: avg=1.79µs  min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.71ms min=18.4ms  med=90.92ms max=349.51ms p(90)=121.34ms p(95)=132.6ms  p(99.9)=234.19ms
       { expected_response:true }...: avg=94.71ms min=18.4ms  med=90.92ms max=349.51ms p(90)=121.34ms p(95)=132.6ms  p(99.9)=234.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63210
     http_req_receiving.............: avg=89.79µs min=32.97µs med=78.85µs max=96.68ms  p(90)=114.13µs p(95)=127.98µs p(99.9)=904.06µs
     http_req_sending...............: avg=23.16µs min=5.78µs  med=13.97µs max=155.26ms p(90)=20.77µs  p(95)=23.14µs  p(99.9)=657.8µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.6ms  min=18.26ms med=90.81ms max=349.22ms p(90)=121.22ms p(95)=132.49ms p(99.9)=233.62ms
     http_reqs......................: 63210   516.239535/s
     iteration_duration.............: avg=95.09ms min=37.94ms med=91.16ms max=373.96ms p(90)=121.63ms p(95)=132.88ms p(99.9)=238.56ms
     iterations.....................: 63110   515.422829/s
     success_rate...................: 100.00% ✓ 63110      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 135936     ✗ 0    
     data_received..................: 4.0 GB  32 MB/s
     data_sent......................: 55 MB   445 kB/s
     http_req_blocked...............: avg=5.31µs   min=1.23µs  med=3.43µs   max=3.58ms   p(90)=4.91µs   p(95)=5.52µs   p(99.9)=225.67µs
     http_req_connecting............: avg=1.68µs   min=0s      med=0s       max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=122.47µs
     http_req_duration..............: avg=131.92ms min=19.36ms med=129.9ms  max=369.86ms p(90)=165.14ms p(95)=175.75ms p(99.9)=227.68ms
       { expected_response:true }...: avg=131.92ms min=19.36ms med=129.9ms  max=369.86ms p(90)=165.14ms p(95)=175.75ms p(99.9)=227.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45412
     http_req_receiving.............: avg=90.74µs  min=32.16µs med=83.55µs  max=100.34ms p(90)=117.34µs p(95)=130.04µs p(99.9)=592.92µs
     http_req_sending...............: avg=27.86µs  min=6.18µs  med=15.77µs  max=158ms    p(90)=21.97µs  p(95)=24.1µs   p(99.9)=862.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=131.8ms  min=19.21ms med=129.78ms max=365.9ms  p(90)=165.02ms p(95)=175.6ms  p(99.9)=226.89ms
     http_reqs......................: 45412   370.819337/s
     iteration_duration.............: avg=132.45ms min=49.49ms med=130.21ms max=395.96ms p(90)=165.44ms p(95)=176.11ms p(99.9)=233.63ms
     iterations.....................: 45312   370.00277/s
     success_rate...................: 100.00% ✓ 45312      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86997      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=5.94µs   min=1.32µs  med=3.78µs   max=3.15ms   p(90)=5.28µs   p(95)=5.89µs   p(99.9)=729.38µs
     http_req_connecting............: avg=1.95µs   min=0s      med=0s       max=3.1ms    p(90)=0s       p(95)=0s       p(99.9)=704.64µs
     http_req_duration..............: avg=206.07ms min=19.19ms med=190.9ms  max=696.01ms p(90)=245.15ms p(95)=276.26ms p(99.9)=653.43ms
       { expected_response:true }...: avg=206.07ms min=19.19ms med=190.9ms  max=696.01ms p(90)=245.15ms p(95)=276.26ms p(99.9)=653.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29099
     http_req_receiving.............: avg=103.82µs min=35.11µs med=96.99µs  max=31.17ms  p(90)=130.02µs p(95)=143.72µs p(99.9)=672.43µs
     http_req_sending...............: avg=31.39µs  min=5.8µs   med=18.05µs  max=113.28ms p(90)=23.22µs  p(95)=25.07µs  p(99.9)=863.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.93ms min=19.05ms med=190.78ms max=695.9ms  p(90)=245.02ms p(95)=276.14ms p(99.9)=653.33ms
     http_reqs......................: 29099   238.114209/s
     iteration_duration.............: avg=207.02ms min=47.08ms med=191.34ms max=696.31ms p(90)=245.58ms p(95)=277.69ms p(99.9)=654.08ms
     iterations.....................: 28999   237.295919/s
     success_rate...................: 100.00% ✓ 28999      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86850      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=7.57µs   min=1.33µs  med=3.47µs   max=4.69ms   p(90)=4.83µs   p(95)=5.41µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.92µs   min=0s      med=0s       max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=206.45ms min=23.98ms med=211.02ms max=446.63ms p(90)=221.86ms p(95)=226.64ms p(99.9)=304ms   
       { expected_response:true }...: avg=206.45ms min=23.98ms med=211.02ms max=446.63ms p(90)=221.86ms p(95)=226.64ms p(99.9)=304ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 29050
     http_req_receiving.............: avg=105.98µs min=35.03µs med=91.35µs  max=230.2ms  p(90)=123.55µs p(95)=136.7µs  p(99.9)=632.25µs
     http_req_sending...............: avg=33.77µs  min=6.25µs  med=17.29µs  max=163.61ms p(90)=22.23µs  p(95)=24.17µs  p(99.9)=554.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.31ms min=23.87ms med=210.91ms max=445.92ms p(90)=221.71ms p(95)=226.49ms p(99.9)=303.04ms
     http_reqs......................: 29050   236.351357/s
     iteration_duration.............: avg=207.39ms min=66.52ms med=211.3ms  max=464.86ms p(90)=222.13ms p(95)=226.94ms p(99.9)=331.1ms 
     iterations.....................: 28950   235.537755/s
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

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

