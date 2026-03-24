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
| hive-router | v0.0.42 | 1,583 | 1,614 | 1,569 | 1.0% |  |
| hotchocolate | 16.0.0-rc.1.2 | 1,377 | 1,393 | 1,374 | 0.5% |  |
| cosmo | 0.295.0 | 1,172 | 1,187 | 1,164 | 0.6% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.2 | 1,148 | 1,164 | 1,138 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.11 | 573 | 588 | 569 | 1.1% |  |
| apollo-router | v2.12.0 | 379 | 383 | 375 | 0.6% |  |
| hive-gateway | 2.5.11 | 257 | 262 | 255 | 1.0% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 231 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579291      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.14µs  min=972ns   med=2.03µs  max=4.6ms    p(90)=3.9µs    p(95)=4.88µs   p(99.9)=29.13µs
     http_req_connecting............: avg=576ns   min=0s      med=0s      max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.82ms min=14.03ms med=30.58ms max=334.05ms p(90)=36.61ms  p(95)=38.53ms  p(99.9)=58.35ms
       { expected_response:true }...: avg=30.82ms min=14.03ms med=30.58ms max=334.05ms p(90)=36.61ms  p(95)=38.53ms  p(99.9)=58.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193197
     http_req_receiving.............: avg=81.38µs min=27.36µs med=51.53µs max=178.67ms p(90)=102.33µs p(95)=148.22µs p(99.9)=2.46ms 
     http_req_sending...............: avg=36.5µs  min=5.04µs  med=9.09µs  max=209.84ms p(90)=19.21µs  p(95)=39.82µs  p(99.9)=1.87ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.71ms min=13.91ms med=30.48ms max=313.41ms p(90)=36.49ms  p(95)=38.39ms  p(99.9)=57.53ms
     http_reqs......................: 193197  1583.739783/s
     iteration_duration.............: avg=31.06ms min=14.33ms med=30.8ms  max=343.98ms p(90)=36.81ms  p(95)=38.75ms  p(99.9)=58.8ms 
     iterations.....................: 193097  1582.920029/s
     success_rate...................: 100.00% ✓ 193097      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 504117      ✗ 0     
     data_received..................: 15 GB   121 MB/s
     data_sent......................: 202 MB  1.7 MB/s
     http_req_blocked...............: avg=3.19µs  min=951ns   med=1.99µs   max=5.49ms   p(90)=3.79µs  p(95)=4.64µs  p(99.9)=27.79µs
     http_req_connecting............: avg=672ns   min=0s      med=0s       max=4.41ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=35.45ms min=14.29ms med=34.35ms  max=478.42ms p(90)=43.66ms p(95)=47.29ms p(99.9)=83.88ms
       { expected_response:true }...: avg=35.45ms min=14.29ms med=34.35ms  max=478.42ms p(90)=43.66ms p(95)=47.29ms p(99.9)=83.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168139
     http_req_receiving.............: avg=804.4µs min=50.95µs med=114.43µs max=166.67ms p(90)=2.32ms  p(95)=3.47ms  p(99.9)=16.63ms
     http_req_sending...............: avg=35.83µs min=4.99µs  med=8.87µs   max=172.61ms p(90)=19.54µs p(95)=88.27µs p(99.9)=2.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=34.61ms min=13.82ms med=33.51ms  max=478.33ms p(90)=42.61ms p(95)=46.11ms p(99.9)=82.89ms
     http_reqs......................: 168139  1377.951731/s
     iteration_duration.............: avg=35.7ms  min=14.47ms med=34.57ms  max=478.62ms p(90)=43.88ms p(95)=47.52ms p(99.9)=84.68ms
     iterations.....................: 168039  1377.1322/s
     success_rate...................: 100.00% ✓ 168039      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429018      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.21µs  min=1.04µs  med=2.12µs  max=4.07ms   p(90)=3.76µs   p(95)=4.53µs   p(99.9)=34.39µs
     http_req_connecting............: avg=707ns   min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.71ms min=18.94ms med=41.08ms max=344.05ms p(90)=50.68ms  p(95)=53.82ms  p(99.9)=71.23ms
       { expected_response:true }...: avg=41.71ms min=18.94ms med=41.08ms max=344.05ms p(90)=50.68ms  p(95)=53.82ms  p(99.9)=71.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143106
     http_req_receiving.............: avg=84.83µs min=29.37µs med=61.19µs max=108.89ms p(90)=106.56µs p(95)=133.72µs p(99.9)=1.71ms 
     http_req_sending...............: avg=29.34µs min=5.28µs  med=10.15µs max=168.51ms p(90)=18.08µs  p(95)=23.09µs  p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.6ms  min=18.86ms med=40.97ms max=324.03ms p(90)=50.57ms  p(95)=53.68ms  p(99.9)=70.8ms 
     http_reqs......................: 143106  1172.745136/s
     iteration_duration.............: avg=41.94ms min=20.41ms med=41.28ms max=360.92ms p(90)=50.88ms  p(95)=54.02ms  p(99.9)=71.99ms
     iterations.....................: 143006  1171.925641/s
     success_rate...................: 100.00% ✓ 143006      ✗ 0     
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

     checks.........................: 100.00% ✓ 419892      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.49µs  min=952ns   med=2.19µs  max=3.9ms    p(90)=4.69µs   p(95)=5.84µs   p(99.9)=38.31µs
     http_req_connecting............: avg=697ns   min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.58ms min=15.45ms med=42.1ms  max=309.88ms p(90)=51.79ms  p(95)=55.02ms  p(99.9)=80.43ms
       { expected_response:true }...: avg=42.58ms min=15.45ms med=42.1ms  max=309.88ms p(90)=51.79ms  p(95)=55.02ms  p(99.9)=80.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140064
     http_req_receiving.............: avg=96.55µs min=29.5µs  med=59.35µs max=94.11ms  p(90)=132.52µs p(95)=202.81µs p(99.9)=3.33ms 
     http_req_sending...............: avg=42.92µs min=5.23µs  med=9.79µs  max=227.98ms p(90)=23.93µs  p(95)=109.82µs p(99.9)=2.5ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.44ms min=15.34ms med=41.98ms max=309.24ms p(90)=51.64ms  p(95)=54.83ms  p(99.9)=79.94ms
     http_reqs......................: 140064  1148.050128/s
     iteration_duration.............: avg=42.86ms min=15.83ms med=42.34ms max=366.14ms p(90)=52.03ms  p(95)=55.25ms  p(99.9)=81.21ms
     iterations.....................: 139964  1147.230467/s
     success_rate...................: 100.00% ✓ 139964      ✗ 0     
     vus............................: 35      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 210285     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   689 kB/s
     http_req_blocked...............: avg=4.9µs    min=1.05µs  med=3.16µs  max=4.11ms   p(90)=4.8µs    p(95)=5.45µs   p(99.9)=42.54µs 
     http_req_connecting............: avg=1.47µs   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.27ms  min=19.49ms med=83.12ms max=360.73ms p(90)=102.36ms p(95)=109.85ms p(99.9)=206.25ms
       { expected_response:true }...: avg=85.27ms  min=19.49ms med=83.12ms max=360.73ms p(90)=102.36ms p(95)=109.85ms p(99.9)=206.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70195
     http_req_receiving.............: avg=126.18µs min=30.41µs med=78.32µs max=144.37ms p(90)=114.5µs  p(95)=128.64µs p(99.9)=1.39ms  
     http_req_sending...............: avg=27.17µs  min=5.33µs  med=13.99µs max=194.62ms p(90)=20.65µs  p(95)=23.12µs  p(99.9)=772.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.12ms  min=19.36ms med=83ms    max=224.03ms p(90)=102.23ms p(95)=109.68ms p(99.9)=205.86ms
     http_reqs......................: 70195   573.444592/s
     iteration_duration.............: avg=85.6ms   min=19.96ms med=83.36ms max=378.23ms p(90)=102.6ms  p(95)=110.11ms p(99.9)=208.02ms
     iterations.....................: 70095   572.627662/s
     success_rate...................: 100.00% ✓ 70095      ✗ 0    
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

     checks.........................: 100.00% ✓ 139263     ✗ 0    
     data_received..................: 4.1 GB  33 MB/s
     data_sent......................: 56 MB   456 kB/s
     http_req_blocked...............: avg=5.55µs   min=1.13µs  med=3.11µs   max=4.64ms   p(90)=4.46µs   p(95)=4.97µs   p(99.9)=437.19µs
     http_req_connecting............: avg=2.29µs   min=0s      med=0s       max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=414.16µs
     http_req_duration..............: avg=128.8ms  min=20.53ms med=126.9ms  max=380.39ms p(90)=161.02ms p(95)=171.78ms p(99.9)=225.33ms
       { expected_response:true }...: avg=128.8ms  min=20.53ms med=126.9ms  max=380.39ms p(90)=161.02ms p(95)=171.78ms p(99.9)=225.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46521
     http_req_receiving.............: avg=170.96µs min=30.61µs med=79.59µs  max=169.42ms p(90)=112.04µs p(95)=123.6µs  p(99.9)=1.37ms  
     http_req_sending...............: avg=30.21µs  min=6.01µs  med=14.42µs  max=183.28ms p(90)=19.91µs  p(95)=21.94µs  p(99.9)=572.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.6ms  min=20.39ms med=126.77ms max=243ms    p(90)=160.86ms p(95)=171.5ms  p(99.9)=216.38ms
     http_reqs......................: 46521   379.895492/s
     iteration_duration.............: avg=129.28ms min=24ms    med=127.2ms  max=388.72ms p(90)=161.3ms  p(95)=172.05ms p(99.9)=228.35ms
     iterations.....................: 46421   379.078882/s
     success_rate...................: 100.00% ✓ 46421      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94182      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=5.99µs   min=1.24µs  med=3.48µs   max=3.36ms   p(90)=4.9µs    p(95)=5.49µs   p(99.9)=699.59µs
     http_req_connecting............: avg=2.33µs   min=0s      med=0s       max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=654.7µs 
     http_req_duration..............: avg=190.38ms min=18.79ms med=177.56ms max=558.54ms p(90)=221.92ms p(95)=391.98ms p(99.9)=520.66ms
       { expected_response:true }...: avg=190.38ms min=18.79ms med=177.56ms max=558.54ms p(90)=221.92ms p(95)=391.98ms p(99.9)=520.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31494
     http_req_receiving.............: avg=106.03µs min=32.41µs med=93.84µs  max=76.29ms  p(90)=126.89µs p(95)=140.68µs p(99.9)=512.92µs
     http_req_sending...............: avg=25.02µs  min=6.2µs   med=16.92µs  max=88.22ms  p(90)=22.39µs  p(95)=24.33µs  p(99.9)=507.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.25ms min=18.68ms med=177.43ms max=558.42ms p(90)=221.81ms p(95)=391.85ms p(99.9)=520.56ms
     http_reqs......................: 31494   257.542473/s
     iteration_duration.............: avg=191.22ms min=38.86ms med=177.95ms max=558.82ms p(90)=222.34ms p(95)=392.72ms p(99.9)=520.91ms
     iterations.....................: 31394   256.724722/s
     success_rate...................: 100.00% ✓ 31394      ✗ 0    
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

     checks.........................: 100.00% ✓ 86490      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=7.18µs   min=1.22µs  med=3.43µs   max=4.99ms   p(90)=4.81µs   p(95)=5.38µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=4.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=207.29ms min=20.85ms med=206.28ms max=435.5ms  p(90)=217.28ms p(95)=222.71ms p(99.9)=290.17ms
       { expected_response:true }...: avg=207.29ms min=20.85ms med=206.28ms max=435.5ms  p(90)=217.28ms p(95)=222.71ms p(99.9)=290.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28930
     http_req_receiving.............: avg=238.63µs min=31.29µs med=93.01µs  max=260.99ms p(90)=126.38µs p(95)=139.56µs p(99.9)=1.58ms  
     http_req_sending...............: avg=24.18µs  min=6.14µs  med=16.93µs  max=38.86ms  p(90)=22.24µs  p(95)=24.32µs  p(99.9)=816.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.03ms min=20.68ms med=206.16ms max=328.47ms p(90)=217.13ms p(95)=222.4ms  p(99.9)=286.46ms
     http_reqs......................: 28930   235.56633/s
     iteration_duration.............: avg=208.21ms min=37.53ms med=206.57ms max=445.64ms p(90)=217.55ms p(95)=223.03ms p(99.9)=301.59ms
     iterations.....................: 28830   234.752066/s
     success_rate...................: 100.00% ✓ 28830      ✗ 0    
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

