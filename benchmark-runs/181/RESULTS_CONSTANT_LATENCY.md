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
| hive-router | v0.0.49 | 1,581 | 1,602 | 1,570 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,445 | 1,463 | 1,435 | 0.5% |  |
| cosmo | 0.307.0 | 1,163 | 1,180 | 1,159 | 0.6% | non-compatible response (2 across 1/9 runs) |
| grafbase | 0.53.3 | 1,135 | 1,149 | 1,122 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 493 | 507 | 489 | 1.3% |  |
| apollo-router | v2.13.1 | 396 | 405 | 393 | 1.1% |  |
| apollo-gateway | 2.13.3 | 238 | 240 | 237 | 0.4% |  |
| hive-gateway | 2.5.25 | 237 | 243 | 235 | 1.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578688      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.41µs  min=992ns   med=2.41µs  max=4.44ms   p(90)=4.27µs  p(95)=5.23µs   p(99.9)=38.26µs
     http_req_connecting............: avg=533ns   min=0s      med=0s      max=4.38ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.85ms min=14.11ms med=30.57ms max=335.08ms p(90)=36.68ms p(95)=38.68ms  p(99.9)=57.58ms
       { expected_response:true }...: avg=30.85ms min=14.11ms med=30.57ms max=335.08ms p(90)=36.68ms p(95)=38.68ms  p(99.9)=57.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192996
     http_req_receiving.............: avg=86.57µs min=28.08µs med=54.19µs max=171.2ms  p(90)=107.1µs p(95)=155.62µs p(99.9)=2.58ms 
     http_req_sending...............: avg=37.63µs min=5.23µs  med=9.83µs  max=168.02ms p(90)=20.27µs p(95)=58.47µs  p(99.9)=1.89ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.73ms min=14.03ms med=30.46ms max=310.16ms p(90)=36.57ms p(95)=38.53ms  p(99.9)=56.42ms
     http_reqs......................: 192996  1581.683495/s
     iteration_duration.............: avg=31.09ms min=14.38ms med=30.8ms  max=360.84ms p(90)=36.9ms  p(95)=38.9ms   p(99.9)=58.04ms
     iterations.....................: 192896  1580.863953/s
     success_rate...................: 100.00% ✓ 192896      ✗ 0     
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

     checks.........................: 100.00% ✓ 529065      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.46µs  min=1µs     med=2.24µs   max=12.06ms  p(90)=4.02µs  p(95)=4.89µs   p(99.9)=31.38µs
     http_req_connecting............: avg=670ns   min=0s      med=0s       max=4.8ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.77ms min=13.89ms med=32.72ms  max=543.65ms p(90)=41.38ms p(95)=44.56ms  p(99.9)=86.22ms
       { expected_response:true }...: avg=33.77ms min=13.89ms med=32.72ms  max=543.65ms p(90)=41.38ms p(95)=44.56ms  p(99.9)=86.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176455
     http_req_receiving.............: avg=799.7µs min=51.05µs med=120.08µs max=299.85ms p(90)=2.29ms  p(95)=3.38ms   p(99.9)=15.67ms
     http_req_sending...............: avg=37.65µs min=5.01µs  med=9.34µs   max=240.93ms p(90)=20.23µs p(95)=103.56µs p(99.9)=2.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.93ms min=13.79ms med=31.91ms  max=538.34ms p(90)=40.31ms p(95)=43.43ms  p(99.9)=83.84ms
     http_reqs......................: 176455  1445.81214/s
     iteration_duration.............: avg=34.01ms min=14.12ms med=32.94ms  max=543.85ms p(90)=41.6ms  p(95)=44.78ms  p(99.9)=87.21ms
     iterations.....................: 176355  1444.992774/s
     success_rate...................: 100.00% ✓ 176355      ✗ 0     
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

     checks.........................: 100.00% ✓ 425844      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.34µs  min=1.04µs  med=2.39µs  max=3.64ms   p(90)=4.17µs   p(95)=4.96µs   p(99.9)=37.65µs
     http_req_connecting............: avg=515ns   min=0s      med=0s      max=3.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.03ms min=17.56ms med=41.42ms max=347.74ms p(90)=51.22ms  p(95)=54.32ms  p(99.9)=71.4ms 
       { expected_response:true }...: avg=42.03ms min=17.56ms med=41.42ms max=347.74ms p(90)=51.22ms  p(95)=54.32ms  p(99.9)=71.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142048
     http_req_receiving.............: avg=85.71µs min=28.23µs med=62.99µs max=50.01ms  p(90)=109.46µs p(95)=137.06µs p(99.9)=1.78ms 
     http_req_sending...............: avg=28.4µs  min=5.21µs  med=10.8µs  max=149.61ms p(90)=19.05µs  p(95)=24.12µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.92ms min=17.44ms med=41.31ms max=347.46ms p(90)=51.1ms   p(95)=54.18ms  p(99.9)=70.82ms
     http_reqs......................: 142048  1163.87796/s
     iteration_duration.............: avg=42.26ms min=17.81ms med=41.62ms max=356.72ms p(90)=51.42ms  p(95)=54.52ms  p(99.9)=71.92ms
     iterations.....................: 141948  1163.058604/s
     success_rate...................: 100.00% ✓ 141948      ✗ 0     
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

     checks.........................: 100.00% ✓ 415467      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.56µs  min=1.01µs  med=2.27µs  max=5.43ms   p(90)=4.68µs  p(95)=5.82µs   p(99.9)=49.15µs
     http_req_connecting............: avg=600ns   min=0s      med=0s      max=3.8ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.05ms min=15.36ms med=42.65ms max=335.45ms p(90)=52.18ms p(95)=55.25ms  p(99.9)=79.43ms
       { expected_response:true }...: avg=43.05ms min=15.36ms med=42.65ms max=335.45ms p(90)=52.18ms p(95)=55.25ms  p(99.9)=79.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138589
     http_req_receiving.............: avg=95.71µs min=29.33µs med=59.4µs  max=29.87ms  p(90)=133.1µs p(95)=211.02µs p(99.9)=3.39ms 
     http_req_sending...............: avg=37.8µs  min=5.14µs  med=9.81µs  max=90.92ms  p(90)=23.87µs p(95)=112.33µs p(99.9)=2.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.91ms min=15.2ms  med=42.53ms max=334.98ms p(90)=52.04ms p(95)=55.1ms   p(99.9)=79.1ms 
     http_reqs......................: 138589  1135.63599/s
     iteration_duration.............: avg=43.32ms min=17.84ms med=42.9ms  max=353.68ms p(90)=52.4ms  p(95)=55.48ms  p(99.9)=79.78ms
     iterations.....................: 138489  1134.816562/s
     success_rate...................: 100.00% ✓ 138489      ✗ 0     
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

     checks.........................: 100.00% ✓ 180894     ✗ 0    
     data_received..................: 5.3 GB  43 MB/s
     data_sent......................: 73 MB   592 kB/s
     http_req_blocked...............: avg=5.18µs  min=1.24µs  med=3.15µs  max=4.51ms   p(90)=4.69µs   p(95)=5.3µs    p(99.9)=52.1µs  
     http_req_connecting............: avg=1.79µs  min=0s      med=0s      max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.13ms min=20.94ms med=98.52ms max=369.73ms p(90)=128.41ms p(95)=140.81ms p(99.9)=236.42ms
       { expected_response:true }...: avg=99.13ms min=20.94ms med=98.52ms max=369.73ms p(90)=128.41ms p(95)=140.81ms p(99.9)=236.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60398
     http_req_receiving.............: avg=91.35µs min=30.51µs med=79.59µs max=110.3ms  p(90)=114.9µs  p(95)=128.41µs p(99.9)=923.66µs
     http_req_sending...............: avg=26.95µs min=5.78µs  med=14.24µs max=115.77ms p(90)=20.71µs  p(95)=22.95µs  p(99.9)=639.57µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.01ms min=20.8ms  med=98.4ms  max=341.92ms p(90)=128.3ms  p(95)=140.7ms  p(99.9)=236.28ms
     http_reqs......................: 60398   493.189583/s
     iteration_duration.............: avg=99.52ms min=39.4ms  med=98.79ms max=385.08ms p(90)=128.65ms p(95)=141.15ms p(99.9)=240.94ms
     iterations.....................: 60298   492.373017/s
     success_rate...................: 100.00% ✓ 60298      ✗ 0    
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

     checks.........................: 100.00% ✓ 145383     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=4.73µs   min=1.11µs  med=3.38µs   max=3ms      p(90)=4.98µs   p(95)=5.62µs   p(99.9)=114.53µs
     http_req_connecting............: avg=1.12µs   min=0s      med=0s       max=2.95ms   p(90)=0s       p(95)=0s       p(99.9)=70.61µs 
     http_req_duration..............: avg=123.36ms min=19.49ms med=121.29ms max=363.02ms p(90)=154.04ms p(95)=164.36ms p(99.9)=209.37ms
       { expected_response:true }...: avg=123.36ms min=19.49ms med=121.29ms max=363.02ms p(90)=154.04ms p(95)=164.36ms p(99.9)=209.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48561
     http_req_receiving.............: avg=89.66µs  min=32.19µs med=84.03µs  max=41.95ms  p(90)=117.86µs p(95)=130.33µs p(99.9)=673.46µs
     http_req_sending...............: avg=21.53µs  min=5.9µs   med=15.75µs  max=58.03ms  p(90)=21.72µs  p(95)=23.87µs  p(99.9)=720.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.25ms min=19.36ms med=121.18ms max=362.15ms p(90)=153.92ms p(95)=164.24ms p(99.9)=209.2ms 
     http_reqs......................: 48561   396.479725/s
     iteration_duration.............: avg=123.84ms min=54.03ms med=121.59ms max=370.19ms p(90)=154.3ms  p(95)=164.65ms p(99.9)=211.32ms
     iterations.....................: 48461   395.663268/s
     success_rate...................: 100.00% ✓ 48461      ✗ 0    
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

     checks.........................: 100.00% ✓ 87711      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.32µs   min=1.33µs  med=3.54µs   max=4.13ms   p(90)=5.02µs   p(95)=5.62µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=3.52µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=204.38ms min=22.2ms  med=210.16ms max=443.37ms p(90)=221.8ms  p(95)=227.57ms p(99.9)=294.72ms
       { expected_response:true }...: avg=204.38ms min=22.2ms  med=210.16ms max=443.37ms p(90)=221.8ms  p(95)=227.57ms p(99.9)=294.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29337
     http_req_receiving.............: avg=107.02µs min=33.87µs med=93.54µs  max=127.54ms p(90)=126.59µs p(95)=139.55µs p(99.9)=631.32µs
     http_req_sending...............: avg=24.53µs  min=6.16µs  med=17.39µs  max=49.56ms  p(90)=22.64µs  p(95)=24.66µs  p(99.9)=556.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.25ms min=22.01ms med=210.04ms max=421.03ms p(90)=221.67ms p(95)=227.43ms p(99.9)=294.28ms
     http_reqs......................: 29337   238.843088/s
     iteration_duration.............: avg=205.31ms min=57.19ms med=210.45ms max=460.58ms p(90)=222.07ms p(95)=227.88ms p(99.9)=303.13ms
     iterations.....................: 29237   238.028952/s
     success_rate...................: 100.00% ✓ 29237      ✗ 0    
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

     checks.........................: 100.00% ✓ 86937      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=5.62µs   min=1.24µs  med=3.49µs   max=3.12ms   p(90)=4.92µs   p(95)=5.49µs   p(99.9)=608.8µs 
     http_req_connecting............: avg=1.95µs   min=0s      med=0s       max=3.09ms   p(90)=0s       p(95)=0s       p(99.9)=578.73µs
     http_req_duration..............: avg=206.23ms min=18.64ms med=193.04ms max=590.59ms p(90)=244.65ms p(95)=416.09ms p(99.9)=544.69ms
       { expected_response:true }...: avg=206.23ms min=18.64ms med=193.04ms max=590.59ms p(90)=244.65ms p(95)=416.09ms p(99.9)=544.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29079
     http_req_receiving.............: avg=101.19µs min=34.3µs  med=94.47µs  max=36.63ms  p(90)=127.09µs p(95)=140.37µs p(99.9)=717.33µs
     http_req_sending...............: avg=27.16µs  min=5.86µs  med=17.65µs  max=60.45ms  p(90)=22.72µs  p(95)=24.57µs  p(99.9)=605.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.1ms  min=18.51ms med=192.92ms max=590.47ms p(90)=244.48ms p(95)=415.97ms p(99.9)=544.59ms
     http_reqs......................: 29079   237.875122/s
     iteration_duration.............: avg=207.16ms min=57.39ms med=193.47ms max=590.87ms p(90)=245.05ms p(95)=416.94ms p(99.9)=544.96ms
     iterations.....................: 28979   237.057092/s
     success_rate...................: 100.00% ✓ 28979      ✗ 0    
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

