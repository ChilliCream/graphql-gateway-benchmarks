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
| hive-router | v0.0.72 | 1,560 | 1,584 | 1,547 | 0.7% |  |
| fusion-nightly | 16.4.0-p.3 | 1,557 | 1,578 | 1,550 | 0.5% |  |
| fusion | 16.3.0 | 1,547 | 1,560 | 1,538 | 0.5% |  |
| grafbase | 0.53.5 | 1,117 | 1,133 | 1,105 | 0.7% |  |
| cosmo | 0.326.0 | 1,102 | 1,120 | 1,096 | 0.7% |  |
| hive-gateway-router-runtime | 2.9.0 | 506 | 523 | 502 | 1.3% |  |
| apollo-router | v2.15.1 | 373 | 384 | 367 | 1.6% |  |
| hive-gateway | 2.9.0 | 237 | 242 | 234 | 1.1% |  |
| apollo-gateway | 2.14.1 | 233 | 235 | 232 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 571017      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.33µs  min=1µs     med=2.29µs  max=4.38ms   p(90)=4.18µs   p(95)=5.04µs   p(99.9)=35.07µs
     http_req_connecting............: avg=574ns   min=0s      med=0s      max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.28ms min=14.24ms med=30.97ms max=318.07ms p(90)=37.24ms  p(95)=39.22ms  p(99.9)=58.11ms
       { expected_response:true }...: avg=31.28ms min=14.24ms med=30.97ms max=318.07ms p(90)=37.24ms  p(95)=39.22ms  p(99.9)=58.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190439
     http_req_receiving.............: avg=83.64µs min=27.22µs med=52.28µs max=160.86ms p(90)=103.28µs p(95)=145.68µs p(99.9)=2.35ms 
     http_req_sending...............: avg=33.31µs min=5.14µs  med=9.54µs  max=171.87ms p(90)=19.71µs  p(95)=35.76µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.16ms min=14.18ms med=30.87ms max=317.74ms p(90)=37.11ms  p(95)=39.08ms  p(99.9)=56.53ms
     http_reqs......................: 190439  1560.5678/s
     iteration_duration.............: avg=31.51ms min=14.5ms  med=31.19ms max=335.72ms p(90)=37.45ms  p(95)=39.43ms  p(99.9)=58.65ms
     iterations.....................: 190339  1559.748341/s
     success_rate...................: 100.00% ✓ 190339      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 569883      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=3.25µs   min=992ns   med=2.07µs   max=9.95ms   p(90)=3.81µs  p(95)=4.67µs   p(99.9)=29.84µs
     http_req_connecting............: avg=638ns    min=0s      med=0s       max=4.54ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.34ms  min=13.44ms med=30.76ms  max=343.05ms p(90)=38.47ms p(95)=41.1ms   p(99.9)=62.4ms 
       { expected_response:true }...: avg=31.34ms  min=13.44ms med=30.76ms  max=343.05ms p(90)=38.47ms p(95)=41.1ms   p(99.9)=62.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 190061
     http_req_receiving.............: avg=626.47µs min=51.31µs med=109.15µs max=220.6ms  p(90)=1.78ms  p(95)=2.74ms   p(99.9)=15.03ms
     http_req_sending...............: avg=38.42µs  min=4.87µs  med=9.08µs   max=195.1ms  p(90)=19.85µs p(95)=103.32µs p(99.9)=1.99ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.67ms  min=13.18ms med=30.13ms  max=342.45ms p(90)=37.63ms p(95)=40.18ms  p(99.9)=60.4ms 
     http_reqs......................: 190061  1557.959496/s
     iteration_duration.............: avg=31.57ms  min=13.74ms med=30.98ms  max=352.97ms p(90)=38.69ms p(95)=41.32ms  p(99.9)=62.95ms
     iterations.....................: 189961  1557.139781/s
     success_rate...................: 100.00% ✓ 189961      ✗ 0     
     vus............................: 20      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 566127      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 227 MB  1.9 MB/s
     http_req_blocked...............: avg=3.11µs   min=1.02µs  med=2.08µs  max=4.16ms   p(90)=3.85µs  p(95)=4.72µs   p(99.9)=29.65µs
     http_req_connecting............: avg=572ns    min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.54ms  min=13.77ms med=31ms    max=322.09ms p(90)=38.72ms p(95)=41.24ms  p(99.9)=59.15ms
       { expected_response:true }...: avg=31.54ms  min=13.77ms med=31ms    max=322.09ms p(90)=38.72ms p(95)=41.24ms  p(99.9)=59.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188809
     http_req_receiving.............: avg=558.31µs min=51.17µs med=108.7µs max=73.12ms  p(90)=1.57ms  p(95)=2.45ms   p(99.9)=11.82ms
     http_req_sending...............: avg=36.06µs  min=5.23µs  med=9.15µs  max=141.48ms p(90)=19.85µs p(95)=103.19µs p(99.9)=1.98ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.94ms  min=13.55ms med=30.43ms max=321.66ms p(90)=37.95ms p(95)=40.44ms  p(99.9)=57.06ms
     http_reqs......................: 188809  1547.529572/s
     iteration_duration.............: avg=31.78ms  min=14.01ms med=31.22ms max=367.62ms p(90)=38.93ms p(95)=41.46ms  p(99.9)=59.7ms 
     iterations.....................: 188709  1546.709945/s
     success_rate...................: 100.00% ✓ 188709      ✗ 0     
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

     checks.........................: 100.00% ✓ 408717      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.64µs  min=992ns   med=2.25µs  max=3.95ms   p(90)=4.69µs   p(95)=5.86µs   p(99.9)=46µs   
     http_req_connecting............: avg=720ns   min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.75ms min=15.65ms med=43.28ms max=338.51ms p(90)=53.13ms  p(95)=56.36ms  p(99.9)=77.98ms
       { expected_response:true }...: avg=43.75ms min=15.65ms med=43.28ms max=338.51ms p(90)=53.13ms  p(95)=56.36ms  p(99.9)=77.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136339
     http_req_receiving.............: avg=95.96µs min=29.68µs med=59.61µs max=132.87ms p(90)=132.16µs p(95)=209.76µs p(99.9)=2.41ms 
     http_req_sending...............: avg=41.44µs min=5.36µs  med=9.98µs  max=258.83ms p(90)=24.05µs  p(95)=113.1µs  p(99.9)=2.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.61ms min=15.53ms med=43.16ms max=309.46ms p(90)=52.98ms  p(95)=56.21ms  p(99.9)=77.52ms
     http_reqs......................: 136339  1117.336084/s
     iteration_duration.............: avg=44.03ms min=18.37ms med=43.53ms max=356.22ms p(90)=53.36ms  p(95)=56.6ms   p(99.9)=78.62ms
     iterations.....................: 136239  1116.516556/s
     success_rate...................: 100.00% ✓ 136239      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403386      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.38µs   min=972ns   med=2.22µs  max=4.06ms   p(90)=3.92µs  p(95)=4.66µs   p(99.9)=36.52µs
     http_req_connecting............: avg=760ns    min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.38ms  min=19.75ms med=43.77ms max=366.6ms  p(90)=53.97ms p(95)=57.22ms  p(99.9)=74.53ms
       { expected_response:true }...: avg=44.38ms  min=19.75ms med=43.77ms max=366.6ms  p(90)=53.97ms p(95)=57.22ms  p(99.9)=74.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134562
     http_req_receiving.............: avg=129.59µs min=29.26µs med=64.71µs max=303.3ms  p(90)=108.2µs p(95)=130.82µs p(99.9)=2.01ms 
     http_req_sending...............: avg=24.26µs  min=5.09µs  med=10.61µs max=26.18ms  p(90)=18.56µs p(95)=22.86µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.23ms  min=19.55ms med=43.66ms max=179.45ms p(90)=53.86ms p(95)=57.1ms   p(99.9)=72.66ms
     http_reqs......................: 134562  1102.501637/s
     iteration_duration.............: avg=44.61ms  min=22.29ms med=43.97ms max=373.57ms p(90)=54.17ms p(95)=57.41ms  p(99.9)=75.12ms
     iterations.....................: 134462  1101.682311/s
     success_rate...................: 100.00% ✓ 134462      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 185967     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 75 MB   609 kB/s
     http_req_blocked...............: avg=5.01µs  min=1.23µs  med=3.09µs  max=4.01ms   p(90)=4.63µs   p(95)=5.25µs   p(99.9)=53.38µs 
     http_req_connecting............: avg=1.63µs  min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.45ms min=22.47ms med=94.57ms max=356.15ms p(90)=115.15ms p(95)=123.51ms p(99.9)=227.43ms
       { expected_response:true }...: avg=96.45ms min=22.47ms med=94.57ms max=356.15ms p(90)=115.15ms p(95)=123.51ms p(99.9)=227.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62089
     http_req_receiving.............: avg=87.87µs min=31.45µs med=78.8µs  max=115.23ms p(90)=114.34µs p(95)=127.59µs p(99.9)=849.37µs
     http_req_sending...............: avg=26.41µs min=5.69µs  med=14.17µs max=115.11ms p(90)=20.98µs  p(95)=23.34µs  p(99.9)=739.26µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.33ms min=22.3ms  med=94.45ms max=341.58ms p(90)=115.04ms p(95)=123.4ms  p(99.9)=227.32ms
     http_reqs......................: 62089   506.911753/s
     iteration_duration.............: avg=96.82ms min=26.29ms med=94.82ms max=372.4ms  p(90)=115.38ms p(95)=123.79ms p(99.9)=230.04ms
     iterations.....................: 61989   506.095326/s
     success_rate...................: 100.00% ✓ 61989      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 136812     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   448 kB/s
     http_req_blocked...............: avg=4.28µs   min=1.23µs  med=3.11µs   max=2.16ms   p(90)=4.61µs   p(95)=5.22µs   p(99.9)=225.09µs
     http_req_connecting............: avg=970ns    min=0s      med=0s       max=2.11ms   p(90)=0s       p(95)=0s       p(99.9)=115.28µs
     http_req_duration..............: avg=131.11ms min=21.09ms med=129.27ms max=366.41ms p(90)=163.56ms p(95)=174.76ms p(99.9)=219.96ms
       { expected_response:true }...: avg=131.11ms min=21.09ms med=129.27ms max=366.41ms p(90)=163.56ms p(95)=174.76ms p(99.9)=219.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45704
     http_req_receiving.............: avg=89.61µs  min=31.03µs med=82.44µs  max=49.96ms  p(90)=115.9µs  p(95)=127.88µs p(99.9)=669.05µs
     http_req_sending...............: avg=18.74µs  min=5.7µs   med=15.29µs  max=4.6ms    p(90)=21.5µs   p(95)=23.48µs  p(99.9)=477.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=131ms    min=20.95ms med=129.17ms max=366.13ms p(90)=163.46ms p(95)=174.67ms p(99.9)=219.88ms
     http_reqs......................: 45704   373.12428/s
     iteration_duration.............: avg=131.61ms min=52.47ms med=129.56ms max=373.67ms p(90)=163.89ms p(95)=175.06ms p(99.9)=223.57ms
     iterations.....................: 45604   372.307887/s
     success_rate...................: 100.00% ✓ 45604      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86742      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=6.97µs   min=1.2µs   med=3.59µs   max=4.97ms   p(90)=5.12µs   p(95)=5.74µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=3.15µs   min=0s      med=0s       max=4.92ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=206.73ms min=19.38ms med=192.11ms max=725.53ms p(90)=237.95ms p(95)=268.59ms p(99.9)=668.56ms
       { expected_response:true }...: avg=206.73ms min=19.38ms med=192.11ms max=725.53ms p(90)=237.95ms p(95)=268.59ms p(99.9)=668.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29014
     http_req_receiving.............: avg=100.59µs min=32.72µs med=96.72µs  max=8.67ms   p(90)=129.25µs p(95)=142.76µs p(99.9)=520.25µs
     http_req_sending...............: avg=30.71µs  min=6.34µs  med=18.25µs  max=92.27ms  p(90)=23.7µs   p(95)=25.61µs  p(99.9)=572.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.6ms  min=19.19ms med=191.99ms max=725.42ms p(90)=237.84ms p(95)=268.48ms p(99.9)=668.41ms
     http_reqs......................: 29014   237.076706/s
     iteration_duration.............: avg=207.67ms min=73.11ms med=192.52ms max=725.8ms  p(90)=238.31ms p(95)=270.05ms p(99.9)=668.97ms
     iterations.....................: 28914   236.259595/s
     success_rate...................: 100.00% ✓ 28914      ✗ 0    
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

     checks.........................: 100.00% ✓ 85896      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=7.23µs   min=1.19µs  med=3.3µs    max=4.6ms    p(90)=4.64µs   p(95)=5.24µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.76µs   min=0s      med=0s       max=4.55ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=208.77ms min=21.17ms med=209.88ms max=426.27ms p(90)=235.43ms p(95)=240.84ms p(99.9)=315.12ms
       { expected_response:true }...: avg=208.77ms min=21.17ms med=209.88ms max=426.27ms p(90)=235.43ms p(95)=240.84ms p(99.9)=315.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28732
     http_req_receiving.............: avg=99.52µs  min=32.78µs med=89.46µs  max=51.75ms  p(90)=122.08µs p(95)=135.19µs p(99.9)=746.61µs
     http_req_sending...............: avg=40.3µs   min=5.79µs  med=16.65µs  max=141.91ms p(90)=22.29µs  p(95)=24.35µs  p(99.9)=616.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.63ms min=21.01ms med=209.76ms max=423.98ms p(90)=235.31ms p(95)=240.72ms p(99.9)=314.67ms
     http_reqs......................: 28732   233.83429/s
     iteration_duration.............: avg=209.7ms  min=60.18ms med=210.29ms max=460.32ms p(90)=235.71ms p(95)=241.16ms p(99.9)=322.15ms
     iterations.....................: 28632   233.020444/s
     success_rate...................: 100.00% ✓ 28632      ✗ 0    
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

