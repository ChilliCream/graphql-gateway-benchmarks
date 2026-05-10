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
| hive-router | v0.0.49 | 1,577 | 1,597 | 1,567 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,455 | 1,467 | 1,452 | 0.4% |  |
| cosmo | 0.307.0 | 1,165 | 1,182 | 1,157 | 0.7% | non-compatible response (3 across 1/9 runs) |
| grafbase | 0.53.3 | 1,133 | 1,150 | 1,125 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 506 | 521 | 503 | 1.1% |  |
| apollo-router | v2.13.1 | 380 | 388 | 375 | 1.1% |  |
| hive-gateway | 2.5.25 | 240 | 245 | 236 | 1.1% |  |
| apollo-gateway | 2.13.3 | 232 | 234 | 230 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 576972      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.47µs  min=972ns   med=2.44µs  max=4.06ms   p(90)=4.37µs  p(95)=5.37µs   p(99.9)=35.94µs
     http_req_connecting............: avg=517ns   min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.94ms min=14.04ms med=30.65ms max=337.69ms p(90)=36.81ms p(95)=38.77ms  p(99.9)=57.18ms
       { expected_response:true }...: avg=30.94ms min=14.04ms med=30.65ms max=337.69ms p(90)=36.81ms p(95)=38.77ms  p(99.9)=57.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192424
     http_req_receiving.............: avg=86.96µs min=27.65µs med=55.34µs max=46.22ms  p(90)=108.4µs p(95)=154.87µs p(99.9)=2.62ms 
     http_req_sending...............: avg=35.91µs min=5.16µs  med=10.03µs max=159ms    p(90)=20.64µs p(95)=39.67µs  p(99.9)=1.87ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.82ms min=13.88ms med=30.54ms max=329.57ms p(90)=36.69ms p(95)=38.62ms  p(99.9)=55.91ms
     http_reqs......................: 192424  1577.157909/s
     iteration_duration.............: avg=31.18ms min=14.31ms med=30.87ms max=348.45ms p(90)=37.03ms p(95)=38.99ms  p(99.9)=57.55ms
     iterations.....................: 192324  1576.338282/s
     success_rate...................: 100.00% ✓ 192324      ✗ 0     
     vus............................: 41      min=0         max=50  
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

     checks.........................: 100.00% ✓ 532542      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.4µs    min=982ns   med=2.31µs   max=4.01ms   p(90)=4.18µs  p(95)=5.08µs   p(99.9)=37.15µs
     http_req_connecting............: avg=573ns    min=0s      med=0s       max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.54ms  min=14.54ms med=32.51ms  max=533.35ms p(90)=41.08ms p(95)=44.27ms  p(99.9)=84.85ms
       { expected_response:true }...: avg=33.54ms  min=14.54ms med=32.51ms  max=533.35ms p(90)=41.08ms p(95)=44.27ms  p(99.9)=84.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177614
     http_req_receiving.............: avg=787.71µs min=50.25µs med=114.07µs max=209.38ms p(90)=2.29ms  p(95)=3.46ms   p(99.9)=16.04ms
     http_req_sending...............: avg=40.03µs  min=5.18µs  med=9.44µs   max=223.24ms p(90)=20.51µs p(95)=108.53µs p(99.9)=2.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.71ms  min=14.43ms med=31.71ms  max=533.24ms p(90)=40ms    p(95)=43.07ms  p(99.9)=83.37ms
     http_reqs......................: 177614  1455.531064/s
     iteration_duration.............: avg=33.79ms  min=14.74ms med=32.74ms  max=533.57ms p(90)=41.3ms  p(95)=44.49ms  p(99.9)=85.67ms
     iterations.....................: 177514  1454.711573/s
     success_rate...................: 100.00% ✓ 177514      ✗ 0     
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

     checks.........................: 100.00% ✓ 426432      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.92µs   min=1.07µs  med=2.6µs   max=20.97ms  p(90)=4.38µs   p(95)=5.17µs   p(99.9)=39.21µs
     http_req_connecting............: avg=761ns    min=0s      med=0s      max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.96ms  min=19.13ms med=41.33ms max=325.34ms p(90)=51.16ms  p(95)=54.22ms  p(99.9)=70.85ms
       { expected_response:true }...: avg=41.96ms  min=19.13ms med=41.33ms max=325.34ms p(90)=51.16ms  p(95)=54.22ms  p(99.9)=70.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142244
     http_req_receiving.............: avg=115.37µs min=28.02µs med=64.98µs max=202.5ms  p(90)=112.21µs p(95)=141.02µs p(99.9)=2.17ms 
     http_req_sending...............: avg=32.65µs  min=5.14µs  med=11.14µs max=263.53ms p(90)=19.34µs  p(95)=24.65µs  p(99.9)=1.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.81ms  min=19.02ms med=41.23ms max=122.78ms p(90)=51.04ms  p(95)=54.09ms  p(99.9)=70.11ms
     http_reqs......................: 142244  1165.616558/s
     iteration_duration.............: avg=42.2ms   min=19.78ms med=41.55ms max=350.35ms p(90)=51.36ms  p(95)=54.44ms  p(99.9)=71.37ms
     iterations.....................: 142144  1164.797109/s
     success_rate...................: 100.00% ✓ 142144      ✗ 0     
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

     checks.........................: 100.00% ✓ 414792      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.62µs   min=951ns   med=2.25µs  max=3.9ms    p(90)=4.63µs   p(95)=5.75µs   p(99.9)=44.29µs
     http_req_connecting............: avg=715ns    min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.12ms  min=16.71ms med=42.77ms max=350.66ms p(90)=52.45ms  p(95)=55.47ms  p(99.9)=75.78ms
       { expected_response:true }...: avg=43.12ms  min=16.71ms med=42.77ms max=350.66ms p(90)=52.45ms  p(95)=55.47ms  p(99.9)=75.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138364
     http_req_receiving.............: avg=127.52µs min=29.42µs med=57.81µs max=254.61ms p(90)=130.03µs p(95)=203.66µs p(99.9)=4.02ms 
     http_req_sending...............: avg=34.93µs  min=5.14µs  med=9.74µs  max=31.24ms  p(90)=23.12µs  p(95)=109.3µs  p(99.9)=2.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.96ms  min=16.62ms med=42.65ms max=101.11ms p(90)=52.29ms  p(95)=55.29ms  p(99.9)=74.64ms
     http_reqs......................: 138364  1133.724227/s
     iteration_duration.............: avg=43.39ms  min=17.12ms med=43.01ms max=366.65ms p(90)=52.67ms  p(95)=55.7ms   p(99.9)=76.18ms
     iterations.....................: 138264  1132.904849/s
     success_rate...................: 100.00% ✓ 138264      ✗ 0     
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

     checks.........................: 100.00% ✓ 185847     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 75 MB   609 kB/s
     http_req_blocked...............: avg=5.89µs  min=1.18µs  med=3.11µs  max=8.56ms   p(90)=4.7µs    p(95)=5.34µs   p(99.9)=55.5µs  
     http_req_connecting............: avg=2.44µs  min=0s      med=0s      max=8.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.48ms min=18.8ms  med=94.04ms max=355.86ms p(90)=116.25ms p(95)=125.49ms p(99.9)=222.61ms
       { expected_response:true }...: avg=96.48ms min=18.8ms  med=94.04ms max=355.86ms p(90)=116.25ms p(95)=125.49ms p(99.9)=222.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62049
     http_req_receiving.............: avg=87.97µs min=31.07µs med=78.36µs max=86.84ms  p(90)=114.76µs p(95)=128.28µs p(99.9)=918.87µs
     http_req_sending...............: avg=27.92µs min=5.41µs  med=14µs    max=163.12ms p(90)=20.69µs  p(95)=23.06µs  p(99.9)=802.59µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.36ms min=18.62ms med=93.93ms max=353.76ms p(90)=116.13ms p(95)=125.36ms p(99.9)=222.48ms
     http_reqs......................: 62049   506.838389/s
     iteration_duration.............: avg=96.86ms min=26.04ms med=94.29ms max=368.75ms p(90)=116.49ms p(95)=125.84ms p(99.9)=224.8ms 
     iterations.....................: 61949   506.021553/s
     success_rate...................: 100.00% ✓ 61949      ✗ 0    
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

     checks.........................: 100.00% ✓ 139344     ✗ 0    
     data_received..................: 4.1 GB  33 MB/s
     data_sent......................: 56 MB   456 kB/s
     http_req_blocked...............: avg=5.95µs   min=1.08µs  med=3.34µs   max=4.27ms   p(90)=4.91µs   p(95)=5.55µs   p(99.9)=925.38µs
     http_req_connecting............: avg=2.3µs    min=0s      med=0s       max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=764.84µs
     http_req_duration..............: avg=128.69ms min=19.95ms med=126.85ms max=378.96ms p(90)=160.94ms p(95)=171.82ms p(99.9)=218.37ms
       { expected_response:true }...: avg=128.69ms min=19.95ms med=126.85ms max=378.96ms p(90)=160.94ms p(95)=171.82ms p(99.9)=218.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46548
     http_req_receiving.............: avg=97.16µs  min=32.04µs med=85.07µs  max=76.42ms  p(90)=119.19µs p(95)=131.92µs p(99.9)=737.57µs
     http_req_sending...............: avg=26.22µs  min=5.99µs  med=16.18µs  max=101.22ms p(90)=22.17µs  p(95)=24.31µs  p(99.9)=584.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.57ms min=19.8ms  med=126.74ms max=367.44ms p(90)=160.82ms p(95)=171.71ms p(99.9)=217.62ms
     http_reqs......................: 46548   380.027377/s
     iteration_duration.............: avg=129.21ms min=37.74ms med=127.14ms max=390.58ms p(90)=161.24ms p(95)=172.13ms p(99.9)=221.72ms
     iterations.....................: 46448   379.210957/s
     success_rate...................: 100.00% ✓ 46448      ✗ 0    
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

     checks.........................: 100.00% ✓ 87816      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.16µs   min=1.29µs  med=3.58µs   max=3.88ms   p(90)=5.1µs    p(95)=5.76µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=3.35µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=204.17ms min=18.81ms med=176.48ms max=718.93ms p(90)=324.25ms p(95)=392.81ms p(99.9)=618.04ms
       { expected_response:true }...: avg=204.17ms min=18.81ms med=176.48ms max=718.93ms p(90)=324.25ms p(95)=392.81ms p(99.9)=618.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29372
     http_req_receiving.............: avg=107.87µs min=33.72µs med=96.77µs  max=100.67ms p(90)=131.25µs p(95)=145.37µs p(99.9)=718.9µs 
     http_req_sending...............: avg=27.67µs  min=6.5µs   med=17.9µs   max=60.36ms  p(90)=23.24µs  p(95)=25.14µs  p(99.9)=622.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.04ms min=18.67ms med=176.34ms max=718.8ms  p(90)=324.11ms p(95)=392.65ms p(99.9)=617.88ms
     http_reqs......................: 29372   240.218452/s
     iteration_duration.............: avg=205.11ms min=49.45ms med=177.15ms max=719.2ms  p(90)=324.97ms p(95)=393.7ms  p(99.9)=618.36ms
     iterations.....................: 29272   239.400603/s
     success_rate...................: 100.00% ✓ 29272      ✗ 0    
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

     checks.........................: 100.00% ✓ 85200      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=4.35µs   min=1.3µs   med=3.49µs   max=3.38ms   p(90)=4.96µs   p(95)=5.56µs   p(99.9)=176.94µs
     http_req_connecting............: avg=501ns    min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=73.11µs 
     http_req_duration..............: avg=210.45ms min=21.02ms med=209.41ms max=376.05ms p(90)=227.4ms  p(95)=235.81ms p(99.9)=299.59ms
       { expected_response:true }...: avg=210.45ms min=21.02ms med=209.41ms max=376.05ms p(90)=227.4ms  p(95)=235.81ms p(99.9)=299.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28500
     http_req_receiving.............: avg=101.11µs min=34.18µs med=92.37µs  max=47.79ms  p(90)=127.25µs p(95)=140.5µs  p(99.9)=451.94µs
     http_req_sending...............: avg=30.95µs  min=6.2µs   med=17.28µs  max=160.16ms p(90)=22.66µs  p(95)=24.64µs  p(99.9)=444.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.31ms min=20.84ms med=209.28ms max=375.58ms p(90)=227.26ms p(95)=235.65ms p(99.9)=299.44ms
     http_reqs......................: 28500   232.037204/s
     iteration_duration.............: avg=211.38ms min=67.27ms med=209.75ms max=398.96ms p(90)=227.65ms p(95)=236.14ms p(99.9)=300.73ms
     iterations.....................: 28400   231.223038/s
     success_rate...................: 100.00% ✓ 28400      ✗ 0    
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

