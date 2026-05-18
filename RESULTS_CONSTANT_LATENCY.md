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
| hive-router | v0.0.49 | 1,586 | 1,610 | 1,576 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,442 | 1,458 | 1,437 | 0.5% |  |
| cosmo | 0.307.0 | 1,165 | 1,179 | 1,155 | 0.7% | non-compatible response (2 across 1/9 runs) |
| grafbase | 0.53.3 | 1,131 | 1,153 | 1,124 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 513 | 525 | 509 | 1.0% |  |
| apollo-router | v2.13.1 | 365 | 376 | 361 | 1.5% |  |
| hive-gateway | 2.5.25 | 247 | 251 | 244 | 1.0% |  |
| apollo-gateway | 2.13.3 | 240 | 241 | 239 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 580218      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=2.98µs  min=992ns   med=2.09µs  max=11.15ms  p(90)=3.98µs   p(95)=4.94µs   p(99.9)=40.56µs
     http_req_connecting............: avg=303ns   min=0s      med=0s      max=3.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.77ms min=14.17ms med=30.55ms max=342.01ms p(90)=36.58ms  p(95)=38.48ms  p(99.9)=56.54ms
       { expected_response:true }...: avg=30.77ms min=14.17ms med=30.55ms max=342.01ms p(90)=36.58ms  p(95)=38.48ms  p(99.9)=56.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193506
     http_req_receiving.............: avg=84.79µs min=26.76µs med=51.66µs max=113.33ms p(90)=104.32µs p(95)=153.44µs p(99.9)=2.55ms 
     http_req_sending...............: avg=33.96µs min=5.06µs  med=9.16µs  max=154.41ms p(90)=20.04µs  p(95)=58.09µs  p(99.9)=1.68ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.66ms min=14.1ms  med=30.44ms max=329.4ms  p(90)=36.45ms  p(95)=38.34ms  p(99.9)=53.75ms
     http_reqs......................: 193506  1586.010183/s
     iteration_duration.............: avg=31.01ms min=14.38ms med=30.77ms max=348.44ms p(90)=36.79ms  p(95)=38.69ms  p(99.9)=57.13ms
     iterations.....................: 193406  1585.190565/s
     success_rate...................: 100.00% ✓ 193406      ✗ 0     
     vus............................: 36      min=0         max=50  
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

     checks.........................: 100.00% ✓ 528078      ✗ 0     
     data_received..................: 15 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.03µs   min=992ns   med=2.05µs   max=4.32ms   p(90)=3.88µs  p(95)=4.75µs   p(99.9)=29µs   
     http_req_connecting............: avg=467ns    min=0s      med=0s       max=3.72ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.83ms  min=13.98ms med=32.55ms  max=494.5ms  p(90)=41.45ms p(95)=45.09ms  p(99.9)=88.54ms
       { expected_response:true }...: avg=33.83ms  min=13.98ms med=32.55ms  max=494.5ms  p(90)=41.45ms p(95)=45.09ms  p(99.9)=88.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176126
     http_req_receiving.............: avg=780.26µs min=49.84µs med=113.35µs max=257.38ms p(90)=2.18ms  p(95)=3.31ms   p(99.9)=17.86ms
     http_req_sending...............: avg=37.13µs  min=5.02µs  med=8.98µs   max=282.64ms p(90)=20.23µs p(95)=108.22µs p(99.9)=2.32ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.02ms  min=13.87ms med=31.8ms   max=484.62ms p(90)=40.34ms p(95)=43.88ms  p(99.9)=85.94ms
     http_reqs......................: 176126  1442.812992/s
     iteration_duration.............: avg=34.07ms  min=14.26ms med=32.78ms  max=494.72ms p(90)=41.67ms p(95)=45.31ms  p(99.9)=89.86ms
     iterations.....................: 176026  1441.993798/s
     success_rate...................: 100.00% ✓ 176026      ✗ 0     
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

     checks.........................: 100.00% ✓ 426348      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.26µs  min=962ns   med=2.22µs  max=4.25ms   p(90)=3.84µs   p(95)=4.58µs   p(99.9)=36.76µs
     http_req_connecting............: avg=658ns   min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.97ms min=15.21ms med=41.39ms max=334.79ms p(90)=51.01ms  p(95)=54.04ms  p(99.9)=70.51ms
       { expected_response:true }...: avg=41.97ms min=15.21ms med=41.39ms max=334.79ms p(90)=51.01ms  p(95)=54.04ms  p(99.9)=70.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142216
     http_req_receiving.............: avg=82.91µs min=27.99µs med=60.74µs max=185.52ms p(90)=105.71µs p(95)=131.07µs p(99.9)=1.65ms 
     http_req_sending...............: avg=28.22µs min=5.08µs  med=10.2µs  max=169.26ms p(90)=18.05µs  p(95)=22.79µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.86ms min=15.14ms med=41.29ms max=334.21ms p(90)=50.9ms   p(95)=53.92ms  p(99.9)=70.21ms
     http_reqs......................: 142216  1165.458585/s
     iteration_duration.............: avg=42.21ms min=18.74ms med=41.6ms  max=344.36ms p(90)=51.21ms  p(95)=54.25ms  p(99.9)=70.88ms
     iterations.....................: 142116  1164.639086/s
     success_rate...................: 100.00% ✓ 142116      ✗ 0     
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

     checks.........................: 100.00% ✓ 413940      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.61µs   min=982ns   med=2.21µs  max=4.52ms   p(90)=4.59µs   p(95)=5.72µs  p(99.9)=44.63µs
     http_req_connecting............: avg=750ns    min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=43.2ms   min=16.39ms med=42.76ms max=367.13ms p(90)=52.42ms  p(95)=55.6ms  p(99.9)=78.53ms
       { expected_response:true }...: avg=43.2ms   min=16.39ms med=42.76ms max=367.13ms p(90)=52.42ms  p(95)=55.6ms  p(99.9)=78.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138080
     http_req_receiving.............: avg=114.68µs min=28.15µs med=58.39µs max=158.68ms p(90)=129.69µs p(95)=197.9µs p(99.9)=3.84ms 
     http_req_sending...............: avg=36µs     min=5.08µs  med=9.69µs  max=145.47ms p(90)=23.35µs  p(95)=106.7µs p(99.9)=2.22ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=43.05ms  min=16.29ms med=42.64ms max=209.06ms p(90)=52.27ms  p(95)=55.44ms p(99.9)=78.1ms 
     http_reqs......................: 138080  1131.439179/s
     iteration_duration.............: avg=43.48ms  min=16.61ms med=43.01ms max=382.23ms p(90)=52.65ms  p(95)=55.84ms p(99.9)=79.21ms
     iterations.....................: 137980  1130.61977/s
     success_rate...................: 100.00% ✓ 137980      ✗ 0     
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

     checks.........................: 100.00% ✓ 188229     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   616 kB/s
     http_req_blocked...............: avg=5.87µs  min=1.1µs   med=3.25µs  max=11.76ms  p(90)=4.87µs   p(95)=5.54µs   p(99.9)=54.03µs 
     http_req_connecting............: avg=2.07µs  min=0s      med=0s      max=6.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.27ms min=22.05ms med=93.8ms  max=336.5ms  p(90)=116.49ms p(95)=126.06ms p(99.9)=221.87ms
       { expected_response:true }...: avg=95.27ms min=22.05ms med=93.8ms  max=336.5ms  p(90)=116.49ms p(95)=126.06ms p(99.9)=221.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62843
     http_req_receiving.............: avg=90.47µs min=31.14µs med=80.58µs max=86.62ms  p(90)=117.12µs p(95)=131.92µs p(99.9)=1ms     
     http_req_sending...............: avg=33.77µs min=5.69µs  med=14.63µs max=175.49ms p(90)=21.3µs   p(95)=23.75µs  p(99.9)=913.32µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.14ms min=21.94ms med=93.68ms max=334.51ms p(90)=116.38ms p(95)=125.92ms p(99.9)=220.98ms
     http_reqs......................: 62843   513.186747/s
     iteration_duration.............: avg=95.64ms min=35.48ms med=94.07ms max=363.79ms p(90)=116.74ms p(95)=126.34ms p(99.9)=223.24ms
     iterations.....................: 62743   512.370129/s
     success_rate...................: 100.00% ✓ 62743      ✗ 0    
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

     checks.........................: 100.00% ✓ 133863     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   438 kB/s
     http_req_blocked...............: avg=5.9µs    min=1.14µs  med=3.25µs   max=3.85ms   p(90)=4.73µs   p(95)=5.33µs   p(99.9)=470.1µs 
     http_req_connecting............: avg=2.38µs   min=0s      med=0s       max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=379.85µs
     http_req_duration..............: avg=133.97ms min=20.38ms med=131.93ms max=355.12ms p(90)=167.85ms p(95)=178.9ms  p(99.9)=230.98ms
       { expected_response:true }...: avg=133.97ms min=20.38ms med=131.93ms max=355.12ms p(90)=167.85ms p(95)=178.9ms  p(99.9)=230.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44721
     http_req_receiving.............: avg=99.7µs   min=31.72µs med=85.65µs  max=164.08ms p(90)=119.01µs p(95)=132.3µs  p(99.9)=722.53µs
     http_req_sending...............: avg=29.71µs  min=5.65µs  med=15.84µs  max=147.71ms p(90)=21.45µs  p(95)=23.55µs  p(99.9)=608.39µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.84ms min=20.19ms med=131.82ms max=347.98ms p(90)=167.72ms p(95)=178.77ms p(99.9)=229.37ms
     http_reqs......................: 44721   365.039218/s
     iteration_duration.............: avg=134.5ms  min=45.11ms med=132.25ms max=387.23ms p(90)=168.16ms p(95)=179.2ms  p(99.9)=234.54ms
     iterations.....................: 44621   364.222959/s
     success_rate...................: 100.00% ✓ 44621      ✗ 0    
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

     checks.........................: 100.00% ✓ 90351      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=7.73µs   min=1.28µs  med=3.67µs   max=4.38ms   p(90)=5.31µs   p(95)=5.98µs   p(99.9)=1.93ms  
     http_req_connecting............: avg=3.74µs   min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=198.44ms min=16.14ms med=186.38ms max=593.64ms p(90)=233.25ms p(95)=392.63ms p(99.9)=515.43ms
       { expected_response:true }...: avg=198.44ms min=16.14ms med=186.38ms max=593.64ms p(90)=233.25ms p(95)=392.63ms p(99.9)=515.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30217
     http_req_receiving.............: avg=111.7µs  min=36.35µs med=99.2µs   max=161.52ms p(90)=132.49µs p(95)=146.72µs p(99.9)=592.99µs
     http_req_sending...............: avg=29.43µs  min=6.46µs  med=18.6µs   max=107.57ms p(90)=23.89µs  p(95)=25.9µs   p(99.9)=569.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.3ms  min=15.99ms med=186.23ms max=593.52ms p(90)=233.13ms p(95)=392.49ms p(99.9)=515.31ms
     http_reqs......................: 30217   247.19011/s
     iteration_duration.............: avg=199.35ms min=51.96ms med=186.8ms  max=593.91ms p(90)=233.69ms p(95)=393.23ms p(99.9)=515.85ms
     iterations.....................: 30117   246.372061/s
     success_rate...................: 100.00% ✓ 30117      ✗ 0    
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

     checks.........................: 100.00% ✓ 88230      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.2µs    min=1.28µs  med=3.44µs   max=4.15ms   p(90)=4.94µs   p(95)=5.53µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=203.21ms min=21.18ms med=202.8ms  max=450.87ms p(90)=230.59ms p(95)=236.37ms p(99.9)=307.71ms
       { expected_response:true }...: avg=203.21ms min=21.18ms med=202.8ms  max=450.87ms p(90)=230.59ms p(95)=236.37ms p(99.9)=307.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29510
     http_req_receiving.............: avg=99.12µs  min=33.35µs med=93.56µs  max=19.21ms  p(90)=127.35µs p(95)=141.42µs p(99.9)=520.06µs
     http_req_sending...............: avg=32.22µs  min=5.97µs  med=17.15µs  max=132.12ms p(90)=22.64µs  p(95)=24.6µs   p(99.9)=641.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.08ms min=21.03ms med=202.67ms max=450.33ms p(90)=230.47ms p(95)=236.24ms p(99.9)=307.04ms
     http_reqs......................: 29510   240.209928/s
     iteration_duration.............: avg=204.13ms min=64.66ms med=203.19ms max=459.89ms p(90)=230.87ms p(95)=236.69ms p(99.9)=310.8ms 
     iterations.....................: 29410   239.395933/s
     success_rate...................: 100.00% ✓ 29410      ✗ 0    
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

