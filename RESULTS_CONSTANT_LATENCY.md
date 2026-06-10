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
| hive-router | v0.0.65 | 1,572 | 1,608 | 1,567 | 0.9% |  |
| hotchocolate | 16.1.3 | 1,446 | 1,467 | 1,437 | 0.7% |  |
| grafbase | 0.53.5 | 1,132 | 1,150 | 1,123 | 0.9% |  |
| cosmo | 0.321.1 | 1,120 | 1,134 | 1,112 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 522 | 535 | 518 | 1.1% |  |
| apollo-router | v2.15.0 | 395 | 408 | 387 | 1.7% |  |
| apollo-gateway | 2.14.1 | 235 | 236 | 233 | 0.4% |  |
| hive-gateway | 2.8.2 | 234 | 239 | 231 | 1.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 575478      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.24µs  min=1.03µs  med=2.56µs  max=2.28ms   p(90)=4.45µs   p(95)=5.43µs   p(99.9)=38.35µs
     http_req_connecting............: avg=189ns   min=0s      med=0s      max=1.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.02ms min=14.31ms med=30.76ms max=342.45ms p(90)=36.88ms  p(95)=38.87ms  p(99.9)=58.27ms
       { expected_response:true }...: avg=31.02ms min=14.31ms med=30.76ms max=342.45ms p(90)=36.88ms  p(95)=38.87ms  p(99.9)=58.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 191926
     http_req_receiving.............: avg=88.11µs min=27.65µs med=55.48µs max=109.66ms p(90)=107.15µs p(95)=153.12µs p(99.9)=2.66ms 
     http_req_sending...............: avg=35.17µs min=5.18µs  med=10.14µs max=67.62ms  p(90)=20.62µs  p(95)=44.69µs  p(99.9)=1.94ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.9ms  min=14.25ms med=30.65ms max=323.66ms p(90)=36.75ms  p(95)=38.72ms  p(99.9)=57.56ms
     http_reqs......................: 191926  1572.667673/s
     iteration_duration.............: avg=31.27ms min=14.55ms med=30.98ms max=352ms    p(90)=37.1ms   p(95)=39.09ms  p(99.9)=58.75ms
     iterations.....................: 191826  1571.84826/s
     success_rate...................: 100.00% ✓ 191826      ✗ 0     
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

     checks.........................: 100.00% ✓ 529113      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.04µs   min=1.01µs  med=2.14µs   max=3.97ms   p(90)=3.93µs  p(95)=4.81µs   p(99.9)=32.2µs 
     http_req_connecting............: avg=391ns    min=0s      med=0s       max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.76ms  min=14.21ms med=32.63ms  max=481.38ms p(90)=41.5ms  p(95)=45.11ms  p(99.9)=82.04ms
       { expected_response:true }...: avg=33.76ms  min=14.21ms med=32.63ms  max=481.38ms p(90)=41.5ms  p(95)=45.11ms  p(99.9)=82.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176471
     http_req_receiving.............: avg=761.93µs min=50.7µs  med=110.78µs max=84.12ms  p(90)=2.22ms  p(95)=3.37ms   p(99.9)=14.48ms
     http_req_sending...............: avg=37.05µs  min=5.19µs  med=9.08µs   max=210.78ms p(90)=20.25µs p(95)=100.41µs p(99.9)=2.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.96ms  min=14.11ms med=31.85ms  max=479.23ms p(90)=40.44ms p(95)=43.95ms  p(99.9)=81.3ms 
     http_reqs......................: 176471  1446.014432/s
     iteration_duration.............: avg=34.01ms  min=14.37ms med=32.85ms  max=481.64ms p(90)=41.72ms p(95)=45.33ms  p(99.9)=82.61ms
     iterations.....................: 176371  1445.195025/s
     success_rate...................: 100.00% ✓ 176371      ✗ 0     
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

     checks.........................: 100.00% ✓ 414141      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.47µs  min=981ns   med=2.25µs  max=3.72ms   p(90)=4.7µs   p(95)=5.92µs   p(99.9)=46.4µs 
     http_req_connecting............: avg=566ns   min=0s      med=0s      max=3.69ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.19ms min=15.13ms med=42.72ms max=337.91ms p(90)=52.52ms p(95)=55.91ms  p(99.9)=80.24ms
       { expected_response:true }...: avg=43.19ms min=15.13ms med=42.72ms max=337.91ms p(90)=52.52ms p(95)=55.91ms  p(99.9)=80.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138147
     http_req_receiving.............: avg=96.29µs min=29.63µs med=59.23µs max=68.2ms   p(90)=131.2µs p(95)=212.99µs p(99.9)=3.05ms 
     http_req_sending...............: avg=37.47µs min=5.17µs  med=9.84µs  max=87.57ms  p(90)=23.99µs p(95)=112.23µs p(99.9)=2.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.05ms min=14.93ms med=42.6ms  max=337.03ms p(90)=52.37ms p(95)=55.72ms  p(99.9)=79.83ms
     http_reqs......................: 138147  1132.063911/s
     iteration_duration.............: avg=43.46ms min=18.84ms med=42.96ms max=353.18ms p(90)=52.76ms p(95)=56.15ms  p(99.9)=81.25ms
     iterations.....................: 138047  1131.244448/s
     success_rate...................: 100.00% ✓ 138047      ✗ 0     
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

     checks.........................: 100.00% ✓ 409995      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.72µs  min=1.05µs  med=2.58µs  max=4.11ms   p(90)=4.32µs   p(95)=5.1µs    p(99.9)=39.43µs
     http_req_connecting............: avg=751ns   min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.65ms min=19.33ms med=43.07ms max=349.75ms p(90)=53.03ms  p(95)=56.2ms   p(99.9)=73.14ms
       { expected_response:true }...: avg=43.65ms min=19.33ms med=43.07ms max=349.75ms p(90)=53.03ms  p(95)=56.2ms   p(99.9)=73.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136765
     http_req_receiving.............: avg=85.84µs min=28.31µs med=64.89µs max=151.17ms p(90)=109.65µs p(95)=132.43µs p(99.9)=1.8ms  
     http_req_sending...............: avg=27.08µs min=5.25µs  med=11.19µs max=217.66ms p(90)=18.89µs  p(95)=23.14µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.54ms min=19.23ms med=42.96ms max=349.22ms p(90)=52.92ms  p(95)=56.08ms  p(99.9)=72.63ms
     http_reqs......................: 136765  1120.686485/s
     iteration_duration.............: avg=43.89ms min=19.72ms med=43.28ms max=365.15ms p(90)=53.24ms  p(95)=56.41ms  p(99.9)=73.59ms
     iterations.....................: 136665  1119.86706/s
     success_rate...................: 100.00% ✓ 136665      ✗ 0     
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

     checks.........................: 100.00% ✓ 191550     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   627 kB/s
     http_req_blocked...............: avg=5.19µs   min=1.11µs  med=3.19µs  max=4.46ms   p(90)=4.87µs   p(95)=5.54µs   p(99.9)=51.13µs 
     http_req_connecting............: avg=1.75µs   min=0s      med=0s      max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.61ms  min=19.33ms med=91.84ms max=385.64ms p(90)=111.42ms p(95)=120.17ms p(99.9)=222.71ms
       { expected_response:true }...: avg=93.61ms  min=19.33ms med=91.84ms max=385.64ms p(90)=111.42ms p(95)=120.17ms p(99.9)=222.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63950
     http_req_receiving.............: avg=153.75µs min=31.62µs med=79.28µs max=218.21ms p(90)=116.33µs p(95)=130.66µs p(99.9)=1.18ms  
     http_req_sending...............: avg=25.09µs  min=5.73µs  med=14.82µs max=212.54ms p(90)=21.57µs  p(95)=24.02µs  p(99.9)=682.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.43ms  min=19.13ms med=91.72ms max=238.52ms p(90)=111.31ms p(95)=119.96ms p(99.9)=218.41ms
     http_reqs......................: 63950   522.319212/s
     iteration_duration.............: avg=93.97ms  min=24.86ms med=92.11ms max=395.35ms p(90)=111.67ms p(95)=120.45ms p(99.9)=224.39ms
     iterations.....................: 63850   521.50245/s
     success_rate...................: 100.00% ✓ 63850      ✗ 0    
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

     checks.........................: 100.00% ✓ 145020     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=5.15µs   min=1.19µs  med=3.52µs   max=3.18ms   p(90)=5.14µs   p(95)=5.76µs   p(99.9)=162.97µs
     http_req_connecting............: avg=1.41µs   min=0s      med=0s       max=3.14ms   p(90)=0s       p(95)=0s       p(99.9)=73.07µs 
     http_req_duration..............: avg=123.67ms min=19.99ms med=121.98ms max=374.08ms p(90)=153.76ms p(95)=163.34ms p(99.9)=209.13ms
       { expected_response:true }...: avg=123.67ms min=19.99ms med=121.98ms max=374.08ms p(90)=153.76ms p(95)=163.34ms p(99.9)=209.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48440
     http_req_receiving.............: avg=94.88µs  min=31.92µs med=86.7µs   max=122.11ms p(90)=120.31µs p(95)=133.68µs p(99.9)=698.14µs
     http_req_sending...............: avg=27.66µs  min=5.64µs  med=16.29µs  max=178.05ms p(90)=22.07µs  p(95)=24.15µs  p(99.9)=645.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.55ms min=19.8ms  med=121.87ms max=373.81ms p(90)=153.66ms p(95)=163.21ms p(99.9)=208.62ms
     http_reqs......................: 48440   395.455839/s
     iteration_duration.............: avg=124.16ms min=41.45ms med=122.28ms max=383.89ms p(90)=154.06ms p(95)=163.62ms p(99.9)=211.7ms 
     iterations.....................: 48340   394.639456/s
     success_rate...................: 100.00% ✓ 48340      ✗ 0    
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

     checks.........................: 100.00% ✓ 86391      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   282 kB/s
     http_req_blocked...............: avg=7.47µs   min=1.14µs  med=3.66µs   max=5.54ms   p(90)=5.21µs   p(95)=5.84µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=3.36µs   min=0s      med=0s       max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=207.55ms min=20.82ms med=226.41ms max=388.62ms p(90)=284.53ms p(95)=290.68ms p(99.9)=369.71ms
       { expected_response:true }...: avg=207.55ms min=20.82ms med=226.41ms max=388.62ms p(90)=284.53ms p(95)=290.68ms p(99.9)=369.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28897
     http_req_receiving.............: avg=102.64µs min=34.5µs  med=95.6µs   max=28.51ms  p(90)=129.71µs p(95)=142.85µs p(99.9)=638.72µs
     http_req_sending...............: avg=29.44µs  min=5.98µs  med=18.05µs  max=54.46ms  p(90)=23.48µs  p(95)=25.55µs  p(99.9)=890.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.42ms min=20.65ms med=226.23ms max=387.91ms p(90)=284.42ms p(95)=290.56ms p(99.9)=369.59ms
     http_reqs......................: 28897   235.207872/s
     iteration_duration.............: avg=208.49ms min=56.2ms  med=230.2ms  max=414.85ms p(90)=284.83ms p(95)=291ms    p(99.9)=371.75ms
     iterations.....................: 28797   234.393919/s
     success_rate...................: 100.00% ✓ 28797      ✗ 0    
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

     checks.........................: 100.00% ✓ 85587      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=7.85µs   min=1.36µs  med=3.71µs   max=4.48ms   p(90)=5.2µs    p(95)=5.85µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.76µs   min=0s      med=0s       max=4.44ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=209.46ms min=19.3ms  med=195.39ms max=729.81ms p(90)=240.22ms p(95)=275.52ms p(99.9)=659.51ms
       { expected_response:true }...: avg=209.46ms min=19.3ms  med=195.39ms max=729.81ms p(90)=240.22ms p(95)=275.52ms p(99.9)=659.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28629
     http_req_receiving.............: avg=104.73µs min=35.21µs med=96.3µs   max=91.41ms  p(90)=129.8µs  p(95)=143.84µs p(99.9)=707.19µs
     http_req_sending...............: avg=37.55µs  min=6.42µs  med=17.82µs  max=142.38ms p(90)=22.95µs  p(95)=24.95µs  p(99.9)=582.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.32ms min=19.13ms med=195.27ms max=729.71ms p(90)=240.1ms  p(95)=275.31ms p(99.9)=659.39ms
     http_reqs......................: 28629   234.120754/s
     iteration_duration.............: avg=210.44ms min=45.02ms med=195.83ms max=729.99ms p(90)=240.59ms p(95)=277.88ms p(99.9)=659.97ms
     iterations.....................: 28529   233.302979/s
     success_rate...................: 100.00% ✓ 28529      ✗ 0    
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

