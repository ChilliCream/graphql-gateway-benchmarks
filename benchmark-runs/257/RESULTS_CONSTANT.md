## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,966 | 3,150 | 2,937 | 2.5% |  |
| grafbase | 0.53.5 | 2,171 | 2,228 | 2,163 | 1.1% |  |
| fusion-nightly | 16.4.0-p.14 | 2,150 | 2,221 | 2,142 | 1.3% |  |
| fusion | 16.3.0 | 2,121 | 2,180 | 2,116 | 1.0% |  |
| cosmo | 0.326.1 | 1,177 | 1,199 | 1,173 | 0.7% |  |
| hive-gateway-router-runtime | 2.10.0 | 559 | 567 | 557 | 0.7% |  |
| apollo-router | v2.15.1 | 409 | 434 | 401 | 2.6% |  |
| hive-gateway | 2.10.0 | 255 | 259 | 253 | 0.7% |  |
| apollo-gateway | 2.14.2 | 248 | 249 | 246 | 0.5% |  |
| feddi | 77271dc84a06 | 18 | 20 | 18 | 3.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,247 | 2,417 | 2,232 | 2.8% |  |
| fusion-nightly | 16.4.0-p.14 | 2,167 | 2,205 | 2,163 | 0.7% |  |
| fusion | 16.3.0 | 1,972 | 2,032 | 1,962 | 1.1% |  |
| grafbase | 0.53.5 | 1,617 | 1,638 | 1,614 | 0.5% |  |
| cosmo | 0.326.1 | 1,125 | 1,145 | 1,119 | 0.8% |  |
| hive-gateway-router-runtime | 2.10.0 | 528 | 538 | 525 | 0.8% |  |
| apollo-router | v2.15.1 | 405 | 415 | 398 | 1.2% |  |
| hive-gateway | 2.10.0 | 242 | 246 | 241 | 0.7% |  |
| apollo-gateway | 2.14.2 | 232 | 235 | 231 | 0.7% |  |
| feddi | 77271dc84a06 | 21 | 22 | 21 | 2.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1069344     ✗ 0     
     data_received..................: 31 GB   260 MB/s
     data_sent......................: 429 MB  3.6 MB/s
     http_req_blocked...............: avg=3.3µs   min=1.11µs  med=2.36µs  max=21.76ms  p(90)=3.6µs   p(95)=4.15µs   p(99.9)=35.44µs
     http_req_connecting............: avg=409ns   min=0s      med=0s      max=5.36ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.59ms min=1.66ms  med=15.84ms max=260.43ms p(90)=24.36ms p(95)=27.67ms  p(99.9)=47.77ms
       { expected_response:true }...: avg=16.59ms min=1.66ms  med=15.84ms max=260.43ms p(90)=24.36ms p(95)=27.67ms  p(99.9)=47.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 356548
     http_req_receiving.............: avg=96.24µs min=26.11µs med=44.92µs max=39.72ms  p(90)=83.62µs p(95)=188.32µs p(99.9)=8.03ms 
     http_req_sending...............: avg=54.4µs  min=4.97µs  med=9.14µs  max=205.36ms p(90)=16.09µs p(95)=108.17µs p(99.9)=6.96ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.44ms min=1.6ms   med=15.72ms max=258.73ms p(90)=24.17ms p(95)=27.39ms  p(99.9)=46.31ms
     http_reqs......................: 356548  2966.336707/s
     iteration_duration.............: avg=16.82ms min=2.17ms  med=16.04ms max=394.57ms p(90)=24.59ms p(95)=27.93ms  p(99.9)=48.6ms 
     iterations.....................: 356448  2965.504747/s
     success_rate...................: 100.00% ✓ 356448      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 783111      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=3.35µs  min=1µs     med=2.53µs  max=7.7ms    p(90)=3.99µs  p(95)=4.68µs   p(99.9)=37.59µs
     http_req_connecting............: avg=397ns   min=0s      med=0s      max=3.59ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.73ms min=1.9ms   med=22.5ms  max=339.72ms p(90)=27.06ms p(95)=29ms     p(99.9)=49.87ms
       { expected_response:true }...: avg=22.73ms min=1.9ms   med=22.5ms  max=339.72ms p(90)=27.06ms p(95)=29ms     p(99.9)=49.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261137
     http_req_receiving.............: avg=98.44µs min=27.62µs med=52.8µs  max=310.83ms p(90)=90.41µs p(95)=127.05µs p(99.9)=7ms    
     http_req_sending...............: avg=41.78µs min=4.98µs  med=10.62µs max=125.49ms p(90)=17.74µs p(95)=85.99µs  p(99.9)=2.44ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.59ms min=1.8ms   med=22.4ms  max=301.43ms p(90)=26.92ms p(95)=28.8ms   p(99.9)=48.63ms
     http_reqs......................: 261137  2171.981125/s
     iteration_duration.............: avg=22.97ms min=4.16ms  med=22.71ms max=356.9ms  p(90)=27.29ms p(95)=29.24ms  p(99.9)=50.31ms
     iterations.....................: 261037  2171.149385/s
     success_rate...................: 100.00% ✓ 261037      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 775617      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=4.28µs   min=1.13µs  med=2.55µs   max=16.46ms  p(90)=3.88µs  p(95)=4.48µs  p(99.9)=37.54µs
     http_req_connecting............: avg=1.05µs   min=0s      med=0s       max=10.69ms  p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=22.96ms  min=2.26ms  med=21.28ms  max=333.99ms p(90)=36.7ms  p(95)=42.32ms p(99.9)=77.1ms 
       { expected_response:true }...: avg=22.96ms  min=2.26ms  med=21.28ms  max=333.99ms p(90)=36.7ms  p(95)=42.32ms p(99.9)=77.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 258639
     http_req_receiving.............: avg=899.06µs min=56.35µs med=180.07µs max=269.03ms p(90)=1.87ms  p(95)=3.31ms  p(99.9)=25.92ms
     http_req_sending...............: avg=47.03µs  min=5.25µs  med=9.87µs   max=163.85ms p(90)=16.97µs p(95)=96.86µs p(99.9)=3.98ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.01ms  min=2.16ms  med=20.35ms  max=333.42ms p(90)=35.48ms p(95)=40.98ms p(99.9)=75.58ms
     http_reqs......................: 258639  2150.532662/s
     iteration_duration.............: avg=23.19ms  min=4.07ms  med=21.51ms  max=355.54ms p(90)=36.93ms p(95)=42.56ms p(99.9)=77.5ms 
     iterations.....................: 258539  2149.701182/s
     success_rate...................: 100.00% ✓ 258539      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 765114     ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 307 MB  2.5 MB/s
     http_req_blocked...............: avg=3µs      min=1.02µs  med=2.15µs   max=12.08ms  p(90)=3.46µs  p(95)=4.08µs  p(99.9)=33.06µs 
     http_req_connecting............: avg=403ns    min=0s      med=0s       max=4.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.28ms  min=2.38ms  med=19.68ms  max=452.06ms p(90)=37.81ms p(95)=45.84ms p(99.9)=170.14ms
       { expected_response:true }...: avg=23.28ms  min=2.38ms  med=19.68ms  max=452.06ms p(90)=37.81ms p(95)=45.84ms p(99.9)=170.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 255138
     http_req_receiving.............: avg=818.03µs min=54.29µs med=104.17µs max=162.74ms p(90)=1.46ms  p(95)=2.99ms  p(99.9)=33.06ms 
     http_req_sending...............: avg=39.87µs  min=5.13µs  med=9.2µs    max=111.14ms p(90)=16.77µs p(95)=78.53µs p(99.9)=2.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.42ms  min=2.29ms  med=18.94ms  max=431.06ms p(90)=36.41ms p(95)=44.24ms p(99.9)=168.47ms
     http_reqs......................: 255138  2121.13958/s
     iteration_duration.............: avg=23.51ms  min=3.98ms  med=19.9ms   max=452.25ms p(90)=38.04ms p(95)=46.09ms p(99.9)=172.62ms
     iterations.....................: 255038  2120.30821/s
     success_rate...................: 100.00% ✓ 255038     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 424698      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=6.66µs   min=1.09µs  med=2.2µs   max=194.92ms p(90)=3.47µs  p(95)=4.09µs   p(99.9)=29.31µs
     http_req_connecting............: avg=3.72µs   min=0s      med=0s      max=135.3ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.14ms  min=2.18ms  med=41.65ms max=314.46ms p(90)=59.27ms p(95)=64.56ms  p(99.9)=90.98ms
       { expected_response:true }...: avg=42.14ms  min=2.18ms  med=41.65ms max=314.46ms p(90)=59.27ms p(95)=64.56ms  p(99.9)=90.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141666
     http_req_receiving.............: avg=113.62µs min=28.69µs med=61.32µs max=273.79ms p(90)=95.93µs p(95)=111.02µs p(99.9)=2.12ms 
     http_req_sending...............: avg=31.28µs  min=5.25µs  med=10.2µs  max=92.49ms  p(90)=16.27µs p(95)=20.55µs  p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42ms     min=2.07ms  med=41.55ms max=130.67ms p(90)=59.13ms p(95)=64.41ms  p(99.9)=88.52ms
     http_reqs......................: 141666  1177.892595/s
     iteration_duration.............: avg=42.37ms  min=3.96ms  med=41.85ms max=355ms    p(90)=59.47ms p(95)=64.76ms  p(99.9)=91.45ms
     iterations.....................: 141566  1177.061137/s
     success_rate...................: 100.00% ✓ 141566      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 201900     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   672 kB/s
     http_req_blocked...............: avg=4.75µs  min=1.21µs  med=2.72µs  max=4.78ms   p(90)=3.97µs   p(95)=4.48µs   p(99.9)=44.87µs 
     http_req_connecting............: avg=1.76µs  min=0s      med=0s      max=4.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.83ms min=4.06ms  med=86.76ms max=380.16ms p(90)=108.11ms p(95)=118.7ms  p(99.9)=203.91ms
       { expected_response:true }...: avg=88.83ms min=4.06ms  med=86.76ms max=380.16ms p(90)=108.11ms p(95)=118.7ms  p(99.9)=203.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67400
     http_req_receiving.............: avg=88.38µs min=31.64µs med=64.19µs max=180.86ms p(90)=93.17µs  p(95)=104.62µs p(99.9)=2.51ms  
     http_req_sending...............: avg=22.32µs min=5.93µs  med=13.36µs max=87.32ms  p(90)=18.02µs  p(95)=20.04µs  p(99.9)=645.05µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.71ms min=4.01ms  med=86.66ms max=379.73ms p(90)=108.02ms p(95)=118.57ms p(99.9)=202.15ms
     http_reqs......................: 67400   559.224622/s
     iteration_duration.............: avg=89.16ms min=27.68ms med=86.98ms max=395.45ms p(90)=108.32ms p(95)=118.94ms p(99.9)=206.55ms
     iterations.....................: 67300   558.394912/s
     success_rate...................: 100.00% ✓ 67300      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 148110     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   492 kB/s
     http_req_blocked...............: avg=4.8µs    min=1.21µs  med=2.79µs   max=3.75ms   p(90)=4.23µs   p(95)=4.76µs   p(99.9)=124.65µs
     http_req_connecting............: avg=1.74µs   min=0s      med=0s       max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=82.76µs 
     http_req_duration..............: avg=121.11ms min=5.05ms  med=120.79ms max=350.34ms p(90)=146.54ms p(95)=154.13ms p(99.9)=190.09ms
       { expected_response:true }...: avg=121.11ms min=5.05ms  med=120.79ms max=350.34ms p(90)=146.54ms p(95)=154.13ms p(99.9)=190.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49470
     http_req_receiving.............: avg=83.4µs   min=31.92µs med=74.21µs  max=49.15ms  p(90)=105.61µs p(95)=118.12µs p(99.9)=1.69ms  
     http_req_sending...............: avg=27.11µs  min=5.96µs  med=14.27µs  max=119.36ms p(90)=19.93µs  p(95)=21.91µs  p(99.9)=606.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121ms    min=4.99ms  med=120.69ms max=349.74ms p(90)=146.43ms p(95)=154.02ms p(99.9)=190.01ms
     http_reqs......................: 49470   409.964212/s
     iteration_duration.............: avg=121.57ms min=16.82ms med=121.04ms max=375.35ms p(90)=146.78ms p(95)=154.36ms p(99.9)=191.37ms
     iterations.....................: 49370   409.135499/s
     success_rate...................: 100.00% ✓ 49370      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92337      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   306 kB/s
     http_req_blocked...............: avg=9.79µs   min=1.5µs   med=3.34µs   max=9.72ms   p(90)=4.61µs   p(95)=5.15µs   p(99.9)=2.36ms  
     http_req_connecting............: avg=6.02µs   min=0s      med=0s       max=9.61ms   p(90)=0s       p(95)=0s       p(99.9)=2.2ms   
     http_req_duration..............: avg=194.19ms min=6.93ms  med=178.28ms max=666.07ms p(90)=221.73ms p(95)=271.19ms p(99.9)=580.66ms
       { expected_response:true }...: avg=194.19ms min=6.93ms  med=178.28ms max=666.07ms p(90)=221.73ms p(95)=271.19ms p(99.9)=580.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30879
     http_req_receiving.............: avg=90.12µs  min=32.97µs med=82.76µs  max=73.47ms  p(90)=108.84µs p(95)=117.51µs p(99.9)=1.27ms  
     http_req_sending...............: avg=27.73µs  min=6.81µs  med=16.79µs  max=67.74ms  p(90)=20.75µs  p(95)=22.57µs  p(99.9)=2.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.07ms min=6.8ms   med=178.17ms max=664.78ms p(90)=221.57ms p(95)=271.05ms p(99.9)=580.59ms
     http_reqs......................: 30879   255.069346/s
     iteration_duration.............: avg=195.05ms min=59.35ms med=178.6ms  max=666.34ms p(90)=222.09ms p(95)=273.01ms p(99.9)=580.89ms
     iterations.....................: 30779   254.243317/s
     success_rate...................: 100.00% ✓ 30779      ✗ 0    
     vus............................: 29      min=29       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90066      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   299 kB/s
     http_req_blocked...............: avg=6.84µs   min=1.28µs  med=2.83µs   max=4.39ms   p(90)=4.07µs   p(95)=4.51µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=3.74µs   min=0s      med=0s       max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=199.12ms min=8.62ms  med=191.9ms  max=446.93ms p(90)=224.7ms  p(95)=229.33ms p(99.9)=303.84ms
       { expected_response:true }...: avg=199.12ms min=8.62ms  med=191.9ms  max=446.93ms p(90)=224.7ms  p(95)=229.33ms p(99.9)=303.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30122
     http_req_receiving.............: avg=88.81µs  min=31.52µs med=77.7µs   max=46.41ms  p(90)=103.7µs  p(95)=113.23µs p(99.9)=3.01ms  
     http_req_sending...............: avg=36.66µs  min=6.12µs  med=15.15µs  max=238.44ms p(90)=18.69µs  p(95)=20.1µs   p(99.9)=533.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.99ms min=8.48ms  med=191.8ms  max=444.07ms p(90)=224.58ms p(95)=229.19ms p(99.9)=301.76ms
     http_reqs......................: 30122   248.779206/s
     iteration_duration.............: avg=199.99ms min=47.27ms med=192.13ms max=456.38ms p(90)=224.94ms p(95)=229.56ms p(99.9)=304.52ms
     iterations.....................: 30022   247.9533/s
     success_rate...................: 100.00% ✓ 30022      ✗ 0    
     vus............................: 43      min=43       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 6813      ✗ 0   
     data_received..................: 227 MB  1.8 MB/s
     data_sent......................: 2.8 MB  23 kB/s
     http_req_blocked...............: avg=51.69µs  min=1.68µs   med=3.8µs   max=4.54ms  p(90)=5.36µs   p(95)=6.22µs   p(99.9)=4.11ms  
     http_req_connecting............: avg=46.84µs  min=0s       med=0s      max=4.5ms   p(90)=0s       p(95)=0s       p(99.9)=4.08ms  
     http_req_duration..............: avg=2.54s    min=27.66ms  med=2.61s   max=5.87s   p(90)=3.44s    p(95)=3.74s    p(99.9)=5.63s   
       { expected_response:true }...: avg=2.54s    min=27.66ms  med=2.61s   max=5.87s   p(90)=3.44s    p(95)=3.74s    p(99.9)=5.63s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2371
     http_req_receiving.............: avg=116.53µs min=32.68µs  med=96.8µs  max=27.02ms p(90)=140.83µs p(95)=164.06µs p(99.9)=942.75µs
     http_req_sending...............: avg=63.93µs  min=6.79µs   med=19.75µs max=33.57ms p(90)=24.96µs  p(95)=30.38µs  p(99.9)=10.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.54s    min=27.56ms  med=2.61s   max=5.87s   p(90)=3.44s    p(95)=3.74s    p(99.9)=5.63s   
     http_reqs......................: 2371    18.908029/s
     iteration_duration.............: avg=2.65s    min=620.57ms med=2.65s   max=5.87s   p(90)=3.46s    p(95)=3.76s    p(99.9)=5.64s   
     iterations.....................: 2271    18.110559/s
     success_rate...................: 100.00% ✓ 2271      ✗ 0   
     vus............................: 17      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 810321      ✗ 0     
     data_received..................: 24 GB   197 MB/s
     data_sent......................: 325 MB  2.7 MB/s
     http_req_blocked...............: avg=4.02µs   min=1.18µs  med=2.87µs  max=13.23ms  p(90)=4.5µs    p(95)=5.29µs   p(99.9)=43µs   
     http_req_connecting............: avg=444ns    min=0s      med=0s      max=4.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.96ms  min=1.85ms  med=21.75ms max=344.5ms  p(90)=30.31ms  p(95)=32.99ms  p(99.9)=53.95ms
       { expected_response:true }...: avg=21.96ms  min=1.85ms  med=21.75ms max=344.5ms  p(90)=30.31ms  p(95)=32.99ms  p(99.9)=53.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 270207
     http_req_receiving.............: avg=105.68µs min=28.71µs med=55.7µs  max=125.75ms p(90)=100.27µs p(95)=161.08µs p(99.9)=9.76ms 
     http_req_sending...............: avg=48.52µs  min=5.63µs  med=11.51µs max=130.33ms p(90)=19.82µs  p(95)=111.85µs p(99.9)=3.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.8ms   min=1.79ms  med=21.62ms max=344.1ms  p(90)=30.13ms  p(95)=32.74ms  p(99.9)=52.87ms
     http_reqs......................: 270207  2247.346472/s
     iteration_duration.............: avg=22.2ms   min=3.58ms  med=21.97ms max=357.51ms p(90)=30.54ms  p(95)=33.23ms  p(99.9)=54.76ms
     iterations.....................: 270107  2246.514759/s
     success_rate...................: 100.00% ✓ 270107      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 781527      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.3µs    min=1.06µs  med=2.21µs   max=17.69ms  p(90)=3.7µs   p(95)=4.28µs  p(99.9)=30.29µs
     http_req_connecting............: avg=426ns    min=0s      med=0s       max=4.42ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=22.78ms  min=1.9ms   med=21.17ms  max=339.08ms p(90)=36.57ms p(95)=42.12ms p(99.9)=76.22ms
       { expected_response:true }...: avg=22.78ms  min=1.9ms   med=21.17ms  max=339.08ms p(90)=36.57ms p(95)=42.12ms p(99.9)=76.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260609
     http_req_receiving.............: avg=884.76µs min=53.36µs med=208.38µs max=114.46ms p(90)=1.85ms  p(95)=3.11ms  p(99.9)=24.6ms 
     http_req_sending...............: avg=41.09µs  min=5.04µs  med=9.24µs   max=112.68ms p(90)=17.33µs p(95)=82.39µs p(99.9)=3.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=21.86ms  min=1.75ms  med=20.24ms  max=329.8ms  p(90)=35.4ms  p(95)=40.88ms p(99.9)=74.3ms 
     http_reqs......................: 260609  2167.587258/s
     iteration_duration.............: avg=23.02ms  min=3.49ms  med=21.39ms  max=380.53ms p(90)=36.8ms  p(95)=42.35ms p(99.9)=77.21ms
     iterations.....................: 260509  2166.755519/s
     success_rate...................: 100.00% ✓ 260509      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 711231      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=3.78µs   min=1.26µs  med=2.81µs   max=6.7ms    p(90)=4.29µs  p(95)=4.97µs  p(99.9)=39.3µs  
     http_req_connecting............: avg=476ns    min=0s      med=0s       max=4.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.04ms  min=1.95ms  med=20.51ms  max=426.59ms p(90)=41.9ms  p(95)=51.64ms p(99.9)=195.05ms
       { expected_response:true }...: avg=25.04ms  min=1.95ms  med=20.51ms  max=426.59ms p(90)=41.9ms  p(95)=51.64ms p(99.9)=195.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237177
     http_req_receiving.............: avg=909.99µs min=55.75µs med=115.88µs max=256.63ms p(90)=1.56ms  p(95)=3.25ms  p(99.9)=37.79ms 
     http_req_sending...............: avg=47.85µs  min=5.24µs  med=10.98µs  max=246.41ms p(90)=19.19µs p(95)=98.6µs  p(99.9)=3.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.08ms  min=1.83ms  med=19.65ms  max=426.49ms p(90)=40.39ms p(95)=49.96ms p(99.9)=191.04ms
     http_reqs......................: 237177  1972.350675/s
     iteration_duration.............: avg=25.29ms  min=3.47ms  med=20.74ms  max=426.81ms p(90)=42.16ms p(95)=51.91ms p(99.9)=198.03ms
     iterations.....................: 237077  1971.519081/s
     success_rate...................: 100.00% ✓ 237077      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 583386      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.31µs  min=1.08µs  med=2.26µs  max=7.94ms   p(90)=4.16µs   p(95)=4.93µs   p(99.9)=35.97µs
     http_req_connecting............: avg=488ns   min=0s      med=0s      max=3.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.59ms min=2.45ms  med=30.19ms max=344.12ms p(90)=40.6ms   p(95)=44.16ms  p(99.9)=67.81ms
       { expected_response:true }...: avg=30.59ms min=2.45ms  med=30.19ms max=344.12ms p(90)=40.6ms   p(95)=44.16ms  p(99.9)=67.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194562
     http_req_receiving.............: avg=91.56µs min=27.18µs med=49.38µs max=199.91ms p(90)=109.46µs p(95)=195.76µs p(99.9)=4.12ms 
     http_req_sending...............: avg=42.5µs  min=5.18µs  med=9.28µs  max=129.35ms p(90)=21.48µs  p(95)=111.15µs p(99.9)=3.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.45ms min=2.37ms  med=30.07ms max=343.56ms p(90)=40.45ms  p(95)=43.97ms  p(99.9)=66.77ms
     http_reqs......................: 194562  1617.272691/s
     iteration_duration.............: avg=30.84ms min=6.22ms  med=30.41ms max=363.15ms p(90)=40.83ms  p(95)=44.39ms  p(99.9)=68.51ms
     iterations.....................: 194462  1616.441453/s
     success_rate...................: 100.00% ✓ 194462      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 405804      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 163 MB  1.4 MB/s
     http_req_blocked...............: avg=3.87µs  min=1.25µs  med=2.72µs  max=4.57ms   p(90)=4.06µs  p(95)=4.63µs   p(99.9)=32.67µs
     http_req_connecting............: avg=849ns   min=0s      med=0s      max=4.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.1ms  min=2.36ms  med=43.59ms max=363.81ms p(90)=61.69ms p(95)=67.14ms  p(99.9)=92.17ms
       { expected_response:true }...: avg=44.1ms  min=2.36ms  med=43.59ms max=363.81ms p(90)=61.69ms p(95)=67.14ms  p(99.9)=92.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135368
     http_req_receiving.............: avg=79.14µs min=27.43µs med=64.86µs max=128.1ms  p(90)=97.68µs p(95)=111.48µs p(99.9)=1.46ms 
     http_req_sending...............: avg=27.9µs  min=5.54µs  med=12.22µs max=201.44ms p(90)=17.57µs p(95)=21.29µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.99ms min=2.29ms  med=43.49ms max=363.11ms p(90)=61.57ms p(95)=67.02ms  p(99.9)=92.04ms
     http_reqs......................: 135368  1125.30415/s
     iteration_duration.............: avg=44.35ms min=4.3ms   med=43.81ms max=372.38ms p(90)=61.89ms p(95)=67.34ms  p(99.9)=92.78ms
     iterations.....................: 135268  1124.472857/s
     success_rate...................: 100.00% ✓ 135268      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 190938     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   635 kB/s
     http_req_blocked...............: avg=4.96µs  min=1.26µs  med=2.96µs  max=4.61ms   p(90)=4.27µs   p(95)=4.82µs   p(99.9)=40.9µs  
     http_req_connecting............: avg=1.74µs  min=0s      med=0s      max=4.57ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.9ms  min=4.6ms   med=91.61ms max=364.1ms  p(90)=115.3ms  p(95)=127.01ms p(99.9)=210.58ms
       { expected_response:true }...: avg=93.9ms  min=4.6ms   med=91.61ms max=364.1ms  p(90)=115.3ms  p(95)=127.01ms p(99.9)=210.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63746
     http_req_receiving.............: avg=90.66µs min=30.85µs med=72.54µs max=141.73ms p(90)=102.79µs p(95)=114.25µs p(99.9)=1.93ms  
     http_req_sending...............: avg=24.32µs min=5.81µs  med=14.84µs max=158.11ms p(90)=19.68µs  p(95)=21.81µs  p(99.9)=656.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.79ms min=4.51ms  med=91.51ms max=363.41ms p(90)=115.18ms p(95)=126.88ms p(99.9)=208.54ms
     http_reqs......................: 63746   528.673179/s
     iteration_duration.............: avg=94.28ms min=31.55ms med=91.84ms max=387.82ms p(90)=115.54ms p(95)=127.26ms p(99.9)=213.42ms
     iterations.....................: 63646   527.843835/s
     success_rate...................: 100.00% ✓ 63646      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 146592     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   487 kB/s
     http_req_blocked...............: avg=6.55µs   min=1.52µs  med=3.88µs   max=4.64ms   p(90)=5.38µs   p(95)=5.98µs   p(99.9)=916.79µs
     http_req_connecting............: avg=2.39µs   min=0s      med=0s       max=4.6ms    p(90)=0s       p(95)=0s       p(99.9)=879.36µs
     http_req_duration..............: avg=122.29ms min=5.93ms  med=119.67ms max=382.95ms p(90)=162.31ms p(95)=175.02ms p(99.9)=227.66ms
       { expected_response:true }...: avg=122.29ms min=5.93ms  med=119.67ms max=382.95ms p(90)=162.31ms p(95)=175.02ms p(99.9)=227.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48964
     http_req_receiving.............: avg=96.25µs  min=35.72µs med=86.52µs  max=178.1ms  p(90)=117.69µs p(95)=129.06µs p(99.9)=748.21µs
     http_req_sending...............: avg=30.88µs  min=6.74µs  med=18.58µs  max=205.12ms p(90)=23.9µs   p(95)=26.16µs  p(99.9)=571.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.17ms min=5.8ms   med=119.55ms max=372.01ms p(90)=162.18ms p(95)=174.88ms p(99.9)=226.27ms
     http_reqs......................: 48964   405.553827/s
     iteration_duration.............: avg=122.82ms min=24.7ms  med=120.02ms max=391.3ms  p(90)=162.62ms p(95)=175.31ms p(99.9)=230.8ms 
     iterations.....................: 48864   404.725558/s
     success_rate...................: 100.00% ✓ 48864      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87675      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=6.68µs   min=1.29µs  med=2.85µs   max=3.97ms   p(90)=4.03µs   p(95)=4.53µs   p(99.9)=1.93ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=204.5ms  min=7.4ms   med=188.83ms max=652.9ms  p(90)=236.5ms  p(95)=291.68ms p(99.9)=581.1ms 
       { expected_response:true }...: avg=204.5ms  min=7.4ms   med=188.83ms max=652.9ms  p(90)=236.5ms  p(95)=291.68ms p(99.9)=581.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29325
     http_req_receiving.............: avg=96.64µs  min=31.18µs med=81.29µs  max=85.6ms   p(90)=106.92µs p(95)=115.59µs p(99.9)=2.21ms  
     http_req_sending...............: avg=30µs     min=5.89µs  med=16.14µs  max=153.8ms  p(90)=19.43µs  p(95)=20.8µs   p(99.9)=588.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.38ms min=7.27ms  med=188.72ms max=652.8ms  p(90)=236.34ms p(95)=291.58ms p(99.9)=580.99ms
     http_reqs......................: 29325   242.330069/s
     iteration_duration.............: avg=205.43ms min=31.66ms med=189.12ms max=653.16ms p(90)=236.8ms  p(95)=292.89ms p(99.9)=581.36ms
     iterations.....................: 29225   241.503709/s
     success_rate...................: 100.00% ✓ 29225      ✗ 0    
     vus............................: 9       min=9        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84051      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.2µs   med=3.16µs   max=4.79ms   p(90)=4.54µs   p(95)=5.11µs   p(99.9)=1.97ms  
     http_req_connecting............: avg=4.09µs   min=0s      med=0s       max=4.75ms   p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=213.31ms min=9.08ms  med=213.73ms max=446.29ms p(90)=240.71ms p(95)=246ms    p(99.9)=331.92ms
       { expected_response:true }...: avg=213.31ms min=9.08ms  med=213.73ms max=446.29ms p(90)=240.71ms p(95)=246ms    p(99.9)=331.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28117
     http_req_receiving.............: avg=95.71µs  min=30.67µs med=89.03µs  max=53.29ms  p(90)=118µs    p(95)=128.43µs p(99.9)=1.31ms  
     http_req_sending...............: avg=26.17µs  min=5.96µs  med=17.25µs  max=70.66ms  p(90)=21.49µs  p(95)=23.46µs  p(99.9)=599.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.19ms min=8.94ms  med=213.61ms max=442.82ms p(90)=240.6ms  p(95)=245.9ms  p(99.9)=331.68ms
     http_reqs......................: 28117   232.100708/s
     iteration_duration.............: avg=214.29ms min=30.21ms med=214.33ms max=453.81ms p(90)=240.97ms p(95)=246.27ms p(99.9)=338.1ms 
     iterations.....................: 28017   231.275226/s
     success_rate...................: 100.00% ✓ 28017      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7929      ✗ 0   
     data_received..................: 263 MB  2.1 MB/s
     data_sent......................: 3.3 MB  26 kB/s
     http_req_blocked...............: avg=44.88µs min=1.39µs  med=3.38µs  max=4.32ms p(90)=4.91µs   p(95)=5.85µs   p(99.9)=3.95ms
     http_req_connecting............: avg=40.46µs min=0s      med=0s      max=4.28ms p(90)=0s       p(95)=0s       p(99.9)=3.92ms
     http_req_duration..............: avg=2.2s    min=27.02ms med=2.23s   max=4.64s  p(90)=3.15s    p(95)=3.34s    p(99.9)=4.42s 
       { expected_response:true }...: avg=2.2s    min=27.02ms med=2.23s   max=4.64s  p(90)=3.15s    p(95)=3.34s    p(99.9)=4.42s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2743
     http_req_receiving.............: avg=104µs   min=33.65µs med=96.2µs  max=5.17ms p(90)=135.22µs p(95)=153.11µs p(99.9)=1.66ms
     http_req_sending...............: avg=33.45µs min=6.35µs  med=19.03µs max=7.19ms p(90)=24.37µs  p(95)=29.3µs   p(99.9)=2.11ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.2s    min=26.85ms med=2.23s   max=4.64s  p(90)=3.15s    p(95)=3.34s    p(99.9)=4.42s 
     http_reqs......................: 2743    21.820795/s
     iteration_duration.............: avg=2.28s   min=40.4ms  med=2.26s   max=4.64s  p(90)=3.16s    p(95)=3.35s    p(99.9)=4.43s 
     iterations.....................: 2643    21.025287/s
     success_rate...................: 100.00% ✓ 2643      ✗ 0   
     vus............................: 24      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-002, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=124 GB (observed in 90 run metadata entries)
- Benchmark hardware #2: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB (observed in 81 run metadata entries)
- Benchmark hardware #3: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=119 GB (observed in 9 run metadata entries)

