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
| hive-router | v0.0.42 | 1,588 | 1,615 | 1,574 | 0.8% |  |
| hotchocolate | 16.0.0-rc.1.14 | 1,419 | 1,434 | 1,408 | 0.6% |  |
| grafbase | 0.53.2 | 1,141 | 1,165 | 1,135 | 0.8% |  |
| cosmo | 0.295.0 | 1,138 | 1,155 | 1,127 | 0.9% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 581 | 599 | 575 | 1.4% |  |
| apollo-router | v2.12.0 | 397 | 406 | 393 | 1.2% |  |
| hive-gateway | 2.5.11 | 260 | 265 | 258 | 0.9% |  |
| apollo-gateway | 2.13.3 | 230 | 233 | 228 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 581121      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.29µs   min=990ns   med=2.17µs  max=6.64ms   p(90)=4µs      p(95)=4.95µs   p(99.9)=33.94µs
     http_req_connecting............: avg=570ns    min=0s      med=0s      max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.73ms  min=14.53ms med=30.5ms  max=337.87ms p(90)=36.54ms  p(95)=38.47ms  p(99.9)=55.42ms
       { expected_response:true }...: avg=30.73ms  min=14.53ms med=30.5ms  max=337.87ms p(90)=36.54ms  p(95)=38.47ms  p(99.9)=55.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193807
     http_req_receiving.............: avg=108.53µs min=27.78µs med=51.7µs  max=242.08ms p(90)=103.06µs p(95)=153.08µs p(99.9)=2.85ms 
     http_req_sending...............: avg=33.27µs  min=5.12µs  med=9.23µs  max=149.64ms p(90)=19.18µs  p(95)=71.44µs  p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.59ms  min=14.4ms  med=30.39ms max=129.84ms p(90)=36.42ms  p(95)=38.34ms  p(99.9)=54.25ms
     http_reqs......................: 193807  1588.357691/s
     iteration_duration.............: avg=30.96ms  min=14.86ms med=30.71ms max=360.71ms p(90)=36.75ms  p(95)=38.69ms  p(99.9)=56.03ms
     iterations.....................: 193707  1587.538135/s
     success_rate...................: 100.00% ✓ 193707      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 519090      ✗ 0     
     data_received..................: 15 GB   124 MB/s
     data_sent......................: 208 MB  1.7 MB/s
     http_req_blocked...............: avg=3.11µs   min=961ns   med=2.07µs   max=4.05ms   p(90)=3.79µs  p(95)=4.65µs   p(99.9)=34.02µs
     http_req_connecting............: avg=572ns    min=0s      med=0s       max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=34.42ms  min=14.44ms med=33.21ms  max=479.43ms p(90)=42.1ms  p(95)=45.73ms  p(99.9)=84.67ms
       { expected_response:true }...: avg=34.42ms  min=14.44ms med=33.21ms  max=479.43ms p(90)=42.1ms  p(95)=45.73ms  p(99.9)=84.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173130
     http_req_receiving.............: avg=819.28µs min=51.26µs med=113.95µs max=251.82ms p(90)=2.37ms  p(95)=3.57ms   p(99.9)=16.56ms
     http_req_sending...............: avg=35.9µs   min=5.12µs  med=8.97µs   max=102.42ms p(90)=19.62µs p(95)=103.59µs p(99.9)=2.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.57ms  min=14.34ms med=32.4ms   max=479.35ms p(90)=40.99ms p(95)=44.44ms  p(99.9)=82.93ms
     http_reqs......................: 173130  1419.165106/s
     iteration_duration.............: avg=34.67ms  min=14.65ms med=33.44ms  max=479.64ms p(90)=42.32ms p(95)=45.95ms  p(99.9)=85.99ms
     iterations.....................: 173030  1418.345395/s
     success_rate...................: 100.00% ✓ 173030      ✗ 0     
     vus............................: 27      min=0         max=50  
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

     checks.........................: 100.00% ✓ 417615      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=5.42µs  min=932ns   med=2.26µs  max=10.85ms  p(90)=4.71µs   p(95)=5.83µs   p(99.9)=44.77µs
     http_req_connecting............: avg=2.28µs  min=0s      med=0s      max=10.8ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.82ms min=17.71ms med=42.3ms  max=345.09ms p(90)=51.96ms  p(95)=55.19ms  p(99.9)=78.54ms
       { expected_response:true }...: avg=42.82ms min=17.71ms med=42.3ms  max=345.09ms p(90)=51.96ms  p(95)=55.19ms  p(99.9)=78.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139305
     http_req_receiving.............: avg=95.56µs min=29.1µs  med=59.66µs max=126.25ms p(90)=132.42µs p(95)=202.12µs p(99.9)=2.93ms 
     http_req_sending...............: avg=39.75µs min=5.12µs  med=9.83µs  max=170.61ms p(90)=23.4µs   p(95)=109.43µs p(99.9)=2.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.68ms min=17.63ms med=42.18ms max=344.34ms p(90)=51.82ms  p(95)=55.03ms  p(99.9)=77.92ms
     http_reqs......................: 139305  1141.707815/s
     iteration_duration.............: avg=43.09ms min=17.98ms med=42.54ms max=361.75ms p(90)=52.19ms  p(95)=55.43ms  p(99.9)=79.15ms
     iterations.....................: 139205  1140.88824/s
     success_rate...................: 100.00% ✓ 139205      ✗ 0     
     vus............................: 40      min=0         max=50  
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

     checks.........................: 100.00% ✓ 416442      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.7µs   min=1.01µs  med=2.61µs  max=5.31ms   p(90)=4.27µs   p(95)=5.04µs   p(99.9)=38.36µs
     http_req_connecting............: avg=659ns   min=0s      med=0s      max=5.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.97ms min=15.85ms med=42.4ms  max=314.76ms p(90)=52.25ms  p(95)=55.38ms  p(99.9)=71.39ms
       { expected_response:true }...: avg=42.97ms min=15.85ms med=42.4ms  max=314.76ms p(90)=52.25ms  p(95)=55.38ms  p(99.9)=71.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138914
     http_req_receiving.............: avg=87.42µs min=28.06µs med=64.97µs max=194.22ms p(90)=109.02µs p(95)=135.65µs p(99.9)=1.84ms 
     http_req_sending...............: avg=27.5µs  min=5.36µs  med=10.85µs max=225.4ms  p(90)=18.08µs  p(95)=22.92µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.86ms min=15.68ms med=42.29ms max=310.27ms p(90)=52.13ms  p(95)=55.25ms  p(99.9)=70.65ms
     http_reqs......................: 138914  1138.538944/s
     iteration_duration.............: avg=43.21ms min=19.81ms med=42.61ms max=339.32ms p(90)=52.45ms  p(95)=55.58ms  p(99.9)=71.69ms
     iterations.....................: 138814  1137.719344/s
     success_rate...................: 100.00% ✓ 138814      ✗ 0     
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

     checks.........................: 100.00% ✓ 212997     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   698 kB/s
     http_req_blocked...............: avg=5.03µs  min=1.13µs  med=3.2µs   max=4.7ms    p(90)=4.84µs   p(95)=5.51µs   p(99.9)=51.41µs 
     http_req_connecting............: avg=1.54µs  min=0s      med=0s      max=4.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.17ms min=21.49ms med=81.81ms max=349.33ms p(90)=99.78ms  p(95)=107.81ms p(99.9)=206.95ms
       { expected_response:true }...: avg=84.17ms min=21.49ms med=81.81ms max=349.33ms p(90)=99.78ms  p(95)=107.81ms p(99.9)=206.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71099
     http_req_receiving.............: avg=90.06µs min=31.58µs med=78.52µs max=94.82ms  p(90)=115.6µs  p(95)=130.87µs p(99.9)=1.04ms  
     http_req_sending...............: avg=29.27µs min=5.73µs  med=13.98µs max=182.48ms p(90)=20.84µs  p(95)=23.43µs  p(99.9)=781.34µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.05ms min=21.32ms med=81.71ms max=349.02ms p(90)=99.67ms  p(95)=107.68ms p(99.9)=206.55ms
     http_reqs......................: 71099   581.052841/s
     iteration_duration.............: avg=84.51ms min=30.79ms med=82.06ms max=390.65ms p(90)=100.01ms p(95)=108.04ms p(99.9)=208.78ms
     iterations.....................: 70999   580.235596/s
     success_rate...................: 100.00% ✓ 70999      ✗ 0    
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

     checks.........................: 100.00% ✓ 145899     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   478 kB/s
     http_req_blocked...............: avg=6.14µs   min=1.24µs  med=3.57µs   max=4.27ms   p(90)=5.21µs   p(95)=5.83µs   p(99.9)=777.56µs
     http_req_connecting............: avg=2.3µs    min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=455.97µs
     http_req_duration..............: avg=122.9ms  min=19.03ms med=120.91ms max=366.64ms p(90)=152.8ms  p(95)=162.91ms p(99.9)=209.86ms
       { expected_response:true }...: avg=122.9ms  min=19.03ms med=120.91ms max=366.64ms p(90)=152.8ms  p(95)=162.91ms p(99.9)=209.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48733
     http_req_receiving.............: avg=173.89µs min=32.67µs med=86.47µs  max=200.03ms p(90)=119.49µs p(95)=132.6µs  p(99.9)=2.14ms  
     http_req_sending...............: avg=25.48µs  min=5.88µs  med=16.24µs  max=108.24ms p(90)=22.25µs  p(95)=24.3µs   p(99.9)=605.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.7ms  min=18.87ms med=120.79ms max=230.49ms p(90)=152.66ms p(95)=162.77ms p(99.9)=205.63ms
     http_reqs......................: 48733   397.846691/s
     iteration_duration.............: avg=123.4ms  min=29.68ms med=121.23ms max=390.2ms  p(90)=153.11ms p(95)=163.2ms  p(99.9)=212.63ms
     iterations.....................: 48633   397.03031/s
     success_rate...................: 100.00% ✓ 48633      ✗ 0    
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

     checks.........................: 100.00% ✓ 95217      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=6.9µs    min=1.16µs  med=3.49µs   max=4.07ms   p(90)=5.05µs   p(95)=5.7µs    p(99.9)=1.51ms  
     http_req_connecting............: avg=3.19µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=188.37ms min=18.77ms med=192.91ms max=626.4ms  p(90)=255.17ms p(95)=380.57ms p(99.9)=552.39ms
       { expected_response:true }...: avg=188.37ms min=18.77ms med=192.91ms max=626.4ms  p(90)=255.17ms p(95)=380.57ms p(99.9)=552.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31839
     http_req_receiving.............: avg=99.48µs  min=33.7µs  med=94.07µs  max=10.78ms  p(90)=127.65µs p(95)=141.52µs p(99.9)=592.03µs
     http_req_sending...............: avg=21.25µs  min=5.92µs  med=17.41µs  max=6.16ms   p(90)=23.01µs  p(95)=25.04µs  p(99.9)=570.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.25ms min=18.61ms med=192.8ms  max=626.29ms p(90)=255.04ms p(95)=380.03ms p(99.9)=552.27ms
     http_reqs......................: 31839   260.525555/s
     iteration_duration.............: avg=189.16ms min=46.01ms med=193.36ms max=626.68ms p(90)=255.49ms p(95)=381.37ms p(99.9)=553.16ms
     iterations.....................: 31739   259.707295/s
     success_rate...................: 100.00% ✓ 31739      ✗ 0    
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

     checks.........................: 100.00% ✓ 84651      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   277 kB/s
     http_req_blocked...............: avg=7.27µs   min=1.13µs  med=3.4µs    max=4.17ms   p(90)=4.84µs   p(95)=5.42µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=3.68µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.87ms  
     http_req_duration..............: avg=211.8ms  min=22.27ms med=223.96ms max=418.72ms p(90)=252.88ms p(95)=263.39ms p(99.9)=333.06ms
       { expected_response:true }...: avg=211.8ms  min=22.27ms med=223.96ms max=418.72ms p(90)=252.88ms p(95)=263.39ms p(99.9)=333.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28317
     http_req_receiving.............: avg=96.36µs  min=31.56µs med=91.64µs  max=3.6ms    p(90)=125.06µs p(95)=138.3µs  p(99.9)=630.32µs
     http_req_sending...............: avg=36.83µs  min=5.91µs  med=16.42µs  max=138.9ms  p(90)=21.87µs  p(95)=23.84µs  p(99.9)=558µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.66ms min=22.1ms  med=223.81ms max=418.08ms p(90)=252.76ms p(95)=263.26ms p(99.9)=332.95ms
     http_reqs......................: 28317   230.493066/s
     iteration_duration.............: avg=212.77ms min=54.2ms  med=224.52ms max=433.41ms p(90)=253.25ms p(95)=263.96ms p(99.9)=335.75ms
     iterations.....................: 28217   229.679092/s
     success_rate...................: 100.00% ✓ 28217      ✗ 0    
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

