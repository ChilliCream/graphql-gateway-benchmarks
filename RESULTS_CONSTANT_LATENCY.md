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
| hive-router | v0.0.49 | 1,582 | 1,610 | 1,575 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,441 | 1,459 | 1,435 | 0.6% |  |
| cosmo | 0.307.0 | 1,133 | 1,140 | 1,125 | 0.5% | non-compatible response (3 across 3/9 runs) |
| grafbase | 0.53.3 | 1,131 | 1,152 | 1,121 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 509 | 522 | 505 | 1.3% |  |
| apollo-router | v2.13.1 | 396 | 406 | 392 | 1.2% |  |
| hive-gateway | 2.5.25 | 243 | 248 | 240 | 1.3% |  |
| apollo-gateway | 2.13.3 | 237 | 239 | 234 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579060      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.41µs  min=992ns   med=2.34µs  max=4.58ms   p(90)=4.25µs   p(95)=5.23µs   p(99.9)=37.36µs
     http_req_connecting............: avg=567ns   min=0s      med=0s      max=4.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.83ms min=14.36ms med=30.57ms max=346.4ms  p(90)=36.66ms  p(95)=38.61ms  p(99.9)=57.15ms
       { expected_response:true }...: avg=30.83ms min=14.36ms med=30.57ms max=346.4ms  p(90)=36.66ms  p(95)=38.61ms  p(99.9)=57.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193120
     http_req_receiving.............: avg=86.04µs min=27.57µs med=53.96µs max=232.49ms p(90)=105.98µs p(95)=154.73µs p(99.9)=2.26ms 
     http_req_sending...............: avg=35.26µs min=5.12µs  med=9.73µs  max=146.29ms p(90)=20.28µs  p(95)=62.49µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.71ms min=14.27ms med=30.46ms max=316.31ms p(90)=36.54ms  p(95)=38.47ms  p(99.9)=55.43ms
     http_reqs......................: 193120  1582.648786/s
     iteration_duration.............: avg=31.07ms min=14.64ms med=30.79ms max=354.69ms p(90)=36.88ms  p(95)=38.83ms  p(99.9)=57.54ms
     iterations.....................: 193020  1581.82927/s
     success_rate...................: 100.00% ✓ 193020      ✗ 0     
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

     checks.........................: 100.00% ✓ 527235      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.27µs   min=972ns   med=2.28µs   max=3.93ms   p(90)=4.07µs  p(95)=4.95µs   p(99.9)=31.58µs
     http_req_connecting............: avg=504ns    min=0s      med=0s       max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.88ms  min=13.47ms med=32.62ms  max=509.5ms  p(90)=41.49ms p(95)=45.05ms  p(99.9)=87.15ms
       { expected_response:true }...: avg=33.88ms  min=13.47ms med=32.62ms  max=509.5ms  p(90)=41.49ms p(95)=45.05ms  p(99.9)=87.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175845
     http_req_receiving.............: avg=801.28µs min=50.38µs med=115.97µs max=235.99ms p(90)=2.31ms  p(95)=3.46ms   p(99.9)=15.95ms
     http_req_sending...............: avg=41.88µs  min=5.11µs  med=9.45µs   max=207.04ms p(90)=20.43µs p(95)=109.04µs p(99.9)=2.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.04ms  min=13.34ms med=31.8ms   max=508.35ms p(90)=40.38ms p(95)=43.83ms  p(99.9)=85.31ms
     http_reqs......................: 175845  1441.277472/s
     iteration_duration.............: avg=34.13ms  min=13.67ms med=32.84ms  max=509.74ms p(90)=41.71ms p(95)=45.27ms  p(99.9)=89.82ms
     iterations.....................: 175745  1440.457843/s
     success_rate...................: 100.00% ✓ 175745      ✗ 0     
     vus............................: 36      min=0         max=50  
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

     checks.........................: 100.00% ✓ 414600      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.63µs   min=1.07µs  med=2.48µs  max=4.48ms   p(90)=4.13µs   p(95)=4.89µs  p(99.9)=38.87µs
     http_req_connecting............: avg=770ns    min=0s      med=0s      max=4.43ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=43.17ms  min=18.69ms med=42.54ms max=312.05ms p(90)=52.56ms  p(95)=55.8ms  p(99.9)=72.69ms
       { expected_response:true }...: avg=43.17ms  min=18.69ms med=42.54ms max=312.05ms p(90)=52.56ms  p(95)=55.8ms  p(99.9)=72.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138300
     http_req_receiving.............: avg=104.05µs min=29.07µs med=64.42µs max=237.8ms  p(90)=109.69µs p(95)=136.5µs p(99.9)=1.97ms 
     http_req_sending...............: avg=28.32µs  min=5.13µs  med=10.8µs  max=108.37ms p(90)=18.52µs  p(95)=23.55µs p(99.9)=1.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=43.03ms  min=18.6ms  med=42.43ms max=311.52ms p(90)=52.44ms  p(95)=55.66ms p(99.9)=71.44ms
     http_reqs......................: 138300  1133.263017/s
     iteration_duration.............: avg=43.41ms  min=18.95ms med=42.75ms max=368.99ms p(90)=52.77ms  p(95)=56.01ms p(99.9)=73.04ms
     iterations.....................: 138200  1132.443593/s
     success_rate...................: 100.00% ✓ 138200      ✗ 0     
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

     checks.........................: 100.00% ✓ 413742      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.26µs  min=992ns   med=2.24µs  max=4.45ms   p(90)=4.68µs   p(95)=5.84µs   p(99.9)=46.61µs
     http_req_connecting............: avg=303ns   min=0s      med=0s      max=2.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.22ms min=17.32ms med=42.77ms max=349.91ms p(90)=52.6ms   p(95)=55.86ms  p(99.9)=79.36ms
       { expected_response:true }...: avg=43.22ms min=17.32ms med=42.77ms max=349.91ms p(90)=52.6ms   p(95)=55.86ms  p(99.9)=79.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138014
     http_req_receiving.............: avg=98.6µs  min=29.24µs med=59.41µs max=146.06ms p(90)=131.69µs p(95)=207.53µs p(99.9)=2.96ms 
     http_req_sending...............: avg=37.57µs min=5.3µs   med=9.85µs  max=93.36ms  p(90)=23.8µs   p(95)=111.48µs p(99.9)=2.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.09ms min=17.21ms med=42.65ms max=349.79ms p(90)=52.46ms  p(95)=55.69ms  p(99.9)=78.87ms
     http_reqs......................: 138014  1131.116402/s
     iteration_duration.............: avg=43.5ms  min=17.52ms med=43.02ms max=364.83ms p(90)=52.84ms  p(95)=56.1ms   p(99.9)=80.51ms
     iterations.....................: 137914  1130.296835/s
     success_rate...................: 100.00% ✓ 137914      ✗ 0     
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

     checks.........................: 100.00% ✓ 186699     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   612 kB/s
     http_req_blocked...............: avg=9.03µs  min=1.17µs  med=3.18µs  max=12.43ms  p(90)=4.77µs   p(95)=5.43µs   p(99.9)=79.42µs 
     http_req_connecting............: avg=5.42µs  min=0s      med=0s      max=12.34ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.05ms min=21.91ms med=93.71ms max=343.82ms p(90)=114.93ms p(95)=125.02ms p(99.9)=221.7ms 
       { expected_response:true }...: avg=96.05ms min=21.91ms med=93.71ms max=343.82ms p(90)=114.93ms p(95)=125.02ms p(99.9)=221.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 62333
     http_req_receiving.............: avg=89.06µs min=32.39µs med=79.62µs max=57.43ms  p(90)=116.63µs p(95)=130.91µs p(99.9)=893.52µs
     http_req_sending...............: avg=28.9µs  min=5.62µs  med=14.21µs max=172.71ms p(90)=21.08µs  p(95)=23.55µs  p(99.9)=953.42µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.93ms min=21.75ms med=93.6ms  max=342.24ms p(90)=114.81ms p(95)=124.84ms p(99.9)=221.4ms 
     http_reqs......................: 62333   509.214399/s
     iteration_duration.............: avg=96.43ms min=39.95ms med=93.97ms max=386.62ms p(90)=115.16ms p(95)=125.35ms p(99.9)=223.75ms
     iterations.....................: 62233   508.397474/s
     success_rate...................: 100.00% ✓ 62233      ✗ 0    
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

     checks.........................: 100.00% ✓ 145425     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=6.25µs   min=1.24µs  med=3.58µs   max=4.36ms   p(90)=5.16µs   p(95)=5.77µs   p(99.9)=303.46µs
     http_req_connecting............: avg=2.4µs    min=0s      med=0s       max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=125.16µs
     http_req_duration..............: avg=123.33ms min=21.16ms med=121.4ms  max=386.8ms  p(90)=153.55ms p(95)=163.97ms p(99.9)=210.74ms
       { expected_response:true }...: avg=123.33ms min=21.16ms med=121.4ms  max=386.8ms  p(90)=153.55ms p(95)=163.97ms p(99.9)=210.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48575
     http_req_receiving.............: avg=93.25µs  min=31.01µs med=86.49µs  max=41.02ms  p(90)=120.26µs p(95)=133.1µs  p(99.9)=681.99µs
     http_req_sending...............: avg=31.05µs  min=5.77µs  med=16.6µs   max=140.07ms p(90)=22.4µs   p(95)=24.53µs  p(99.9)=1.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.21ms min=21.01ms med=121.29ms max=361.6ms  p(90)=153.44ms p(95)=163.84ms p(99.9)=209.51ms
     http_reqs......................: 48575   396.573558/s
     iteration_duration.............: avg=123.82ms min=44.93ms med=121.71ms max=396.83ms p(90)=153.84ms p(95)=164.3ms  p(99.9)=215.66ms
     iterations.....................: 48475   395.757143/s
     success_rate...................: 100.00% ✓ 48475      ✗ 0    
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

     checks.........................: 100.00% ✓ 89037      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   292 kB/s
     http_req_blocked...............: avg=7.81µs   min=1.22µs  med=3.72µs   max=4.45ms   p(90)=5.31µs   p(95)=5.95µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=3.66µs   min=0s      med=0s       max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=201.41ms min=16.08ms med=187.98ms max=626.9ms  p(90)=237.55ms p(95)=405.46ms p(99.9)=532.67ms
       { expected_response:true }...: avg=201.41ms min=16.08ms med=187.98ms max=626.9ms  p(90)=237.55ms p(95)=405.46ms p(99.9)=532.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29779
     http_req_receiving.............: avg=108.81µs min=36.78µs med=99.51µs  max=128.62ms p(90)=133.56µs p(95)=147.22µs p(99.9)=580.47µs
     http_req_sending...............: avg=36.25µs  min=6.27µs  med=18.62µs  max=115.81ms p(90)=24.02µs  p(95)=26.06µs  p(99.9)=491.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.27ms min=15.91ms med=187.85ms max=626.77ms p(90)=237.41ms p(95)=405.37ms p(99.9)=532.55ms
     http_reqs......................: 29779   243.545865/s
     iteration_duration.............: avg=202.33ms min=42.4ms  med=188.38ms max=627.21ms p(90)=238.02ms p(95)=406.29ms p(99.9)=532.98ms
     iterations.....................: 29679   242.728021/s
     success_rate...................: 100.00% ✓ 29679      ✗ 0    
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

     checks.........................: 100.00% ✓ 87246      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.51µs   min=1.19µs  med=3.68µs   max=3.88ms   p(90)=5.17µs   p(95)=5.78µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=3.4µs    min=0s      med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=205.53ms min=20.74ms med=204.26ms max=443.19ms p(90)=250.21ms p(95)=256.55ms p(99.9)=325ms   
       { expected_response:true }...: avg=205.53ms min=20.74ms med=204.26ms max=443.19ms p(90)=250.21ms p(95)=256.55ms p(99.9)=325ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 29182
     http_req_receiving.............: avg=106.85µs min=33.23µs med=95.5µs   max=89.3ms   p(90)=129.35µs p(95)=142.93µs p(99.9)=686.41µs
     http_req_sending...............: avg=33.84µs  min=5.88µs  med=18.44µs  max=72.81ms  p(90)=23.82µs  p(95)=25.85µs  p(99.9)=602.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.38ms min=20.62ms med=204.13ms max=442.59ms p(90)=250.09ms p(95)=256.41ms p(99.9)=324.9ms 
     http_reqs......................: 29182   237.421468/s
     iteration_duration.............: avg=206.47ms min=54.92ms med=204.79ms max=451.74ms p(90)=250.54ms p(95)=256.9ms  p(99.9)=326.78ms
     iterations.....................: 29082   236.60788/s
     success_rate...................: 100.00% ✓ 29082      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

