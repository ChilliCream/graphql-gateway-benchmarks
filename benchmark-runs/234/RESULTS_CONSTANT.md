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
| hive-router | v0.0.72 | 2,792 | 2,998 | 2,737 | 3.0% |  |
| fusion-nightly | 16.3.0-p.1 | 2,178 | 2,223 | 2,168 | 0.8% |  |
| fusion | 16.2.2 | 2,143 | 2,177 | 2,130 | 0.7% |  |
| grafbase | 0.53.5 | 2,016 | 2,054 | 1,963 | 1.4% |  |
| cosmo | 0.324.0 | 1,166 | 1,188 | 1,159 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 571 | 582 | 568 | 0.7% |  |
| apollo-router | v2.15.1 | 443 | 454 | 439 | 1.1% |  |
| apollo-gateway | 2.14.1 | 245 | 246 | 243 | 0.4% |  |
| hive-gateway | 2.9.0 | 245 | 248 | 243 | 0.8% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,295 | 2,427 | 2,279 | 2.2% |  |
| fusion-nightly | 16.3.0-p.1 | 2,019 | 2,067 | 2,006 | 1.0% |  |
| fusion | 16.2.2 | 1,984 | 2,041 | 1,976 | 1.1% |  |
| grafbase | 0.53.5 | 1,483 | 1,521 | 1,469 | 1.1% |  |
| cosmo | 0.324.0 | 1,093 | 1,119 | 1,089 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 538 | 550 | 535 | 0.9% |  |
| apollo-router | v2.15.1 | 379 | 391 | 374 | 1.4% |  |
| hive-gateway | 2.9.0 | 246 | 249 | 244 | 0.8% |  |
| apollo-gateway | 2.14.1 | 237 | 240 | 235 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1006566     ✗ 0     
     data_received..................: 29 GB   245 MB/s
     data_sent......................: 403 MB  3.4 MB/s
     http_req_blocked...............: avg=3.14µs   min=1.02µs  med=2.34µs  max=22.93ms  p(90)=3.5µs    p(95)=4.11µs   p(99.9)=36.16µs
     http_req_connecting............: avg=160ns    min=0s      med=0s      max=3.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.64ms  min=1.63ms  med=16.86ms max=333.58ms p(90)=25.62ms  p(95)=29.21ms  p(99.9)=52.17ms
       { expected_response:true }...: avg=17.64ms  min=1.63ms  med=16.86ms max=333.58ms p(90)=25.62ms  p(95)=29.21ms  p(99.9)=52.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 335622
     http_req_receiving.............: avg=125.33µs min=28.46µs med=52.36µs max=299.94ms p(90)=100.83µs p(95)=279.82µs p(99.9)=10.19ms
     http_req_sending...............: avg=58.82µs  min=5.15µs  med=9.36µs  max=264.95ms p(90)=15.95µs  p(95)=125.44µs p(99.9)=7.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.45ms  min=1.58ms  med=16.71ms max=299.8ms  p(90)=25.39ms  p(95)=28.86ms  p(99.9)=50.23ms
     http_reqs......................: 335622  2792.177002/s
     iteration_duration.............: avg=17.87ms  min=2.07ms  med=17.07ms max=343.14ms p(90)=25.85ms  p(95)=29.46ms  p(99.9)=53.46ms
     iterations.....................: 335522  2791.345061/s
     success_rate...................: 100.00% ✓ 335522      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 785793      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=3.31µs  min=992ns   med=2.38µs   max=17.16ms  p(90)=3.59µs  p(95)=4.22µs   p(99.9)=33.56µs 
     http_req_connecting............: avg=481ns   min=0s      med=0s       max=5.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.66ms min=2.3ms   med=19.27ms  max=345.08ms p(90)=39.05ms p(95)=48.66ms  p(99.9)=114.75ms
       { expected_response:true }...: avg=22.66ms min=2.3ms   med=19.27ms  max=345.08ms p(90)=39.05ms p(95)=48.66ms  p(99.9)=114.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262031
     http_req_receiving.............: avg=1.08ms  min=51.49µs med=335.88µs max=319.62ms p(90)=2.2ms   p(95)=3.3ms    p(99.9)=40.76ms 
     http_req_sending...............: avg=46.78µs min=5.17µs  med=9.55µs   max=178.23ms p(90)=17.43µs p(95)=115.58µs p(99.9)=3.95ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.52ms min=2.2ms   med=18.18ms  max=212.78ms p(90)=37.48ms p(95)=46.83ms  p(99.9)=109.85ms
     http_reqs......................: 262031  2178.767251/s
     iteration_duration.............: avg=22.89ms min=2.66ms  med=19.49ms  max=354.79ms p(90)=39.3ms  p(95)=48.9ms   p(99.9)=115.27ms
     iterations.....................: 261931  2177.935759/s
     success_rate...................: 100.00% ✓ 261931      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 773385      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.22µs   min=1.04µs  med=2.32µs   max=12.64ms  p(90)=3.44µs  p(95)=3.98µs   p(99.9)=32.72µs 
     http_req_connecting............: avg=397ns    min=0s      med=0s       max=4.01ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.03ms  min=2.48ms  med=15.4ms   max=341.23ms p(90)=49.9ms  p(95)=67.08ms  p(99.9)=166.43ms
       { expected_response:true }...: avg=23.03ms  min=2.48ms  med=15.4ms   max=341.23ms p(90)=49.9ms  p(95)=67.08ms  p(99.9)=166.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257895
     http_req_receiving.............: avg=958.94µs min=52.41µs med=125.98µs max=261.35ms p(90)=1.37ms  p(95)=2.31ms   p(99.9)=64.46ms 
     http_req_sending...............: avg=46.47µs  min=5.13µs  med=9.33µs   max=31.61ms  p(90)=15.62µs p(95)=112.08µs p(99.9)=4.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.02ms  min=2.37ms  med=14.6ms   max=312.99ms p(90)=48.02ms p(95)=65.24ms  p(99.9)=160.51ms
     http_reqs......................: 257895  2143.797324/s
     iteration_duration.............: avg=23.26ms  min=3.03ms  med=15.62ms  max=361.73ms p(90)=50.15ms p(95)=67.33ms  p(99.9)=168.18ms
     iterations.....................: 257795  2142.966057/s
     success_rate...................: 100.00% ✓ 257795      ✗ 0     
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

     checks.........................: 100.00% ✓ 727248      ✗ 0     
     data_received..................: 21 GB   177 MB/s
     data_sent......................: 291 MB  2.4 MB/s
     http_req_blocked...............: avg=3.21µs   min=1.05µs  med=2.47µs  max=9.12ms   p(90)=3.92µs   p(95)=4.66µs   p(99.9)=42.18µs
     http_req_connecting............: avg=269ns    min=0s      med=0s      max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.5ms   min=1.99ms  med=24.26ms max=385.72ms p(90)=29.45ms  p(95)=31.75ms  p(99.9)=53.65ms
       { expected_response:true }...: avg=24.5ms   min=1.99ms  med=24.26ms max=385.72ms p(90)=29.45ms  p(95)=31.75ms  p(99.9)=53.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 242516
     http_req_receiving.............: avg=139.44µs min=29.18µs med=59.04µs max=354.22ms p(90)=101.46µs p(95)=188.86µs p(99.9)=9.53ms 
     http_req_sending...............: avg=46.15µs  min=5.23µs  med=10.58µs max=58.54ms  p(90)=17.6µs   p(95)=115.97µs p(99.9)=3.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.32ms  min=1.87ms  med=24.14ms max=69.88ms  p(90)=29.27ms  p(95)=31.48ms  p(99.9)=51.56ms
     http_reqs......................: 242516  2016.7037/s
     iteration_duration.............: avg=24.74ms  min=3.97ms  med=24.47ms max=406.95ms p(90)=29.67ms  p(95)=32ms     p(99.9)=54.01ms
     iterations.....................: 242416  2015.872124/s
     success_rate...................: 100.00% ✓ 242416      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 420621      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.53µs   min=1.07µs  med=2.46µs  max=4.19ms   p(90)=3.76µs   p(95)=4.37µs   p(99.9)=36.52µs
     http_req_connecting............: avg=713ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.54ms  min=2.1ms   med=42.02ms max=336.22ms p(90)=59.97ms  p(95)=65.39ms  p(99.9)=91.96ms
       { expected_response:true }...: avg=42.54ms  min=2.1ms   med=42.02ms max=336.22ms p(90)=59.97ms  p(95)=65.39ms  p(99.9)=91.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140307
     http_req_receiving.............: avg=127.55µs min=29.07µs med=64.73µs max=275.75ms p(90)=100.98µs p(95)=119.07µs p(99.9)=1.82ms 
     http_req_sending...............: avg=27.01µs  min=5.47µs  med=10.65µs max=220.32ms p(90)=15.63µs  p(95)=19.44µs  p(99.9)=1.14ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.39ms  min=2.03ms  med=41.92ms max=214.67ms p(90)=59.83ms  p(95)=65.25ms  p(99.9)=89.84ms
     http_reqs......................: 140307  1166.554431/s
     iteration_duration.............: avg=42.79ms  min=3.12ms  med=42.23ms max=346.2ms  p(90)=60.17ms  p(95)=65.61ms  p(99.9)=92.9ms 
     iterations.....................: 140207  1165.723001/s
     success_rate...................: 100.00% ✓ 140207      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 206505     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   687 kB/s
     http_req_blocked...............: avg=4.82µs  min=1.22µs  med=3µs     max=4.34ms   p(90)=4.6µs    p(95)=5.26µs   p(99.9)=45.7µs  
     http_req_connecting............: avg=1.55µs  min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.8ms  min=4.01ms  med=84.77ms max=353.78ms p(90)=104.62ms p(95)=114.52ms p(99.9)=210.54ms
       { expected_response:true }...: avg=86.8ms  min=4.01ms  med=84.77ms max=353.78ms p(90)=104.62ms p(95)=114.52ms p(99.9)=210.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68935
     http_req_receiving.............: avg=87.25µs min=31.63µs med=78.32µs max=28.41ms  p(90)=113.48µs p(95)=126.7µs  p(99.9)=937.99µs
     http_req_sending...............: avg=23.81µs min=5.65µs  med=13.61µs max=126.06ms p(90)=20.63µs  p(95)=23.04µs  p(99.9)=797.31µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.69ms min=3.89ms  med=84.67ms max=352.76ms p(90)=104.51ms p(95)=114.39ms p(99.9)=210.41ms
     http_reqs......................: 68935   571.949057/s
     iteration_duration.............: avg=87.17ms min=29.73ms med=85.01ms max=373.8ms  p(90)=104.87ms p(95)=114.81ms p(99.9)=211.85ms
     iterations.....................: 68835   571.119363/s
     success_rate...................: 100.00% ✓ 68835      ✗ 0    
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

     checks.........................: 100.00% ✓ 160338     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   533 kB/s
     http_req_blocked...............: avg=4.85µs   min=1.14µs  med=3.34µs   max=3.74ms   p(90)=4.8µs    p(95)=5.37µs   p(99.9)=109.44µs
     http_req_connecting............: avg=1.32µs   min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.82ms min=5.28ms  med=111.53ms max=338.56ms p(90)=134.8ms  p(95)=141.66ms p(99.9)=174.43ms
       { expected_response:true }...: avg=111.82ms min=5.28ms  med=111.53ms max=338.56ms p(90)=134.8ms  p(95)=141.66ms p(99.9)=174.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53546
     http_req_receiving.............: avg=92.13µs  min=31.89µs med=83.29µs  max=158.68ms p(90)=114.59µs p(95)=126.88µs p(99.9)=724.64µs
     http_req_sending...............: avg=26.56µs  min=5.45µs  med=15.34µs  max=150.72ms p(90)=21µs     p(95)=22.89µs  p(99.9)=650.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.7ms  min=5.14ms  med=111.43ms max=337.6ms  p(90)=134.71ms p(95)=141.55ms p(99.9)=173.44ms
     http_reqs......................: 53546   443.750645/s
     iteration_duration.............: avg=112.28ms min=18.86ms med=111.81ms max=347.72ms p(90)=135.07ms p(95)=141.95ms p(99.9)=175.92ms
     iterations.....................: 53446   442.921917/s
     success_rate...................: 100.00% ✓ 53446      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88767      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=7.31µs   min=1.27µs  med=3.46µs   max=4.7ms    p(90)=4.76µs   p(95)=5.32µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.63µs   min=0s      med=0s       max=4.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=201.92ms min=8.78ms  med=202.11ms max=441.65ms p(90)=215.6ms  p(95)=224.14ms p(99.9)=300.42ms
       { expected_response:true }...: avg=201.92ms min=8.78ms  med=202.11ms max=441.65ms p(90)=215.6ms  p(95)=224.14ms p(99.9)=300.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29689
     http_req_receiving.............: avg=103.62µs min=34.82µs med=92.82µs  max=120.05ms p(90)=124.23µs p(95)=137.41µs p(99.9)=806.83µs
     http_req_sending...............: avg=35.86µs  min=6.11µs  med=17.35µs  max=139.54ms p(90)=22.12µs  p(95)=23.95µs  p(99.9)=586.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.78ms min=8.68ms  med=201.95ms max=441.26ms p(90)=215.48ms p(95)=224.01ms p(99.9)=297ms   
     http_reqs......................: 29689   245.121704/s
     iteration_duration.............: avg=202.91ms min=58.6ms  med=202.61ms max=465.69ms p(90)=215.87ms p(95)=224.5ms  p(99.9)=316.28ms
     iterations.....................: 29589   244.296073/s
     success_rate...................: 100.00% ✓ 29589      ✗ 0    
     vus............................: 47      min=47       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88722      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=11.2µs   min=1.29µs  med=3.71µs   max=12.19ms  p(90)=5.27µs   p(95)=5.9µs    p(99.9)=1.52ms  
     http_req_connecting............: avg=7.02µs   min=0s      med=0s       max=12.14ms  p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=202.05ms min=6.79ms  med=182.13ms max=707.15ms p(90)=242.7ms  p(95)=416.9ms  p(99.9)=597.49ms
       { expected_response:true }...: avg=202.05ms min=6.79ms  med=182.13ms max=707.15ms p(90)=242.7ms  p(95)=416.9ms  p(99.9)=597.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29674
     http_req_receiving.............: avg=105.5µs  min=32.34µs med=99µs     max=52.12ms  p(90)=131.53µs p(95)=145.38µs p(99.9)=564.21µs
     http_req_sending...............: avg=30.98µs  min=6.1µs   med=18.91µs  max=120.7ms  p(90)=24.21µs  p(95)=26.17µs  p(99.9)=801.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.92ms min=6.65ms  med=182ms    max=707.08ms p(90)=242.55ms p(95)=416.81ms p(99.9)=597.37ms
     http_reqs......................: 29674   245.1771/s
     iteration_duration.............: avg=203ms    min=32.09ms med=182.51ms max=707.46ms p(90)=243.16ms p(95)=418.12ms p(99.9)=597.75ms
     iterations.....................: 29574   244.350864/s
     success_rate...................: 100.00% ✓ 29574      ✗ 0    
     vus............................: 21      min=21       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 827784      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 332 MB  2.8 MB/s
     http_req_blocked...............: avg=3.38µs  min=1.01µs  med=2.49µs  max=12.15ms  p(90)=3.94µs   p(95)=4.7µs    p(99.9)=39.13µs
     http_req_connecting............: avg=381ns   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.49ms min=1.89ms  med=21.02ms max=310.97ms p(90)=29.91ms  p(95)=33.05ms  p(99.9)=54.68ms
       { expected_response:true }...: avg=21.49ms min=1.89ms  med=21.02ms max=310.97ms p(90)=29.91ms  p(95)=33.05ms  p(99.9)=54.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 276028
     http_req_receiving.............: avg=120.4µs min=28.52µs med=56.03µs max=169.27ms p(90)=105.16µs p(95)=260.46µs p(99.9)=10ms   
     http_req_sending...............: avg=52.43µs min=5.29µs  med=10.1µs  max=174.83ms p(90)=17.94µs  p(95)=125.81µs p(99.9)=5.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.32ms min=1.81ms  med=20.88ms max=310.28ms p(90)=29.71ms  p(95)=32.77ms  p(99.9)=53.38ms
     http_reqs......................: 276028  2295.793076/s
     iteration_duration.............: avg=21.73ms min=3.37ms  med=21.24ms max=327.93ms p(90)=30.13ms  p(95)=33.29ms  p(99.9)=55.15ms
     iterations.....................: 275928  2294.961352/s
     success_rate...................: 100.00% ✓ 275928      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 728178      ✗ 0     
     data_received..................: 21 GB   177 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.51µs  min=1µs     med=2.6µs    max=12.02ms  p(90)=4.08µs  p(95)=4.87µs   p(99.9)=39.53µs 
     http_req_connecting............: avg=430ns   min=0s      med=0s       max=4.32ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.46ms min=1.78ms  med=21.5ms   max=347.14ms p(90)=41.22ms p(95)=50.31ms  p(99.9)=113.32ms
       { expected_response:true }...: avg=24.46ms min=1.78ms  med=21.5ms   max=347.14ms p(90)=41.22ms p(95)=50.31ms  p(99.9)=113.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 242826
     http_req_receiving.............: avg=1.14ms  min=52.78µs med=340.06µs max=127.65ms p(90)=2.48ms  p(95)=3.74ms   p(99.9)=39.04ms 
     http_req_sending...............: avg=45.94µs min=5.22µs  med=10.4µs   max=124.17ms p(90)=19.82µs p(95)=119.07µs p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.27ms min=1.67ms  med=20.32ms  max=233.02ms p(90)=39.63ms p(95)=48.51ms  p(99.9)=108.53ms
     http_reqs......................: 242826  2019.751943/s
     iteration_duration.............: avg=24.7ms  min=2.52ms  med=21.73ms  max=369.53ms p(90)=41.46ms p(95)=50.57ms  p(99.9)=113.67ms
     iterations.....................: 242726  2018.920173/s
     success_rate...................: 100.00% ✓ 242726      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 715566      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 287 MB  2.4 MB/s
     http_req_blocked...............: avg=3.7µs   min=1.02µs  med=2.6µs    max=7.65ms   p(90)=3.92µs  p(95)=4.61µs   p(99.9)=36.6µs  
     http_req_connecting............: avg=733ns   min=0s      med=0s       max=7.61ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.9ms  min=1.85ms  med=18.04ms  max=483.9ms  p(90)=50.49ms p(95)=67.85ms  p(99.9)=181.94ms
       { expected_response:true }...: avg=24.9ms  min=1.85ms  med=18.04ms  max=483.9ms  p(90)=50.49ms p(95)=67.85ms  p(99.9)=181.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 238622
     http_req_receiving.............: avg=1ms     min=51.49µs med=135.98µs max=266.96ms p(90)=1.63ms  p(95)=2.64ms   p(99.9)=62.57ms 
     http_req_sending...............: avg=46.25µs min=5.26µs  med=10.34µs  max=131.55ms p(90)=18.58µs p(95)=114.39µs p(99.9)=3.33ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.84ms min=1.74ms  med=17.18ms  max=477.19ms p(90)=48.5ms  p(95)=65.64ms  p(99.9)=178.07ms
     http_reqs......................: 238622  1984.639431/s
     iteration_duration.............: avg=25.14ms min=2.58ms  med=18.27ms  max=484.09ms p(90)=50.73ms p(95)=68.11ms  p(99.9)=184.39ms
     iterations.....................: 238522  1983.807723/s
     success_rate...................: 100.00% ✓ 238522      ✗ 0     
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

     checks.........................: 100.00% ✓ 535125      ✗ 0     
     data_received..................: 16 GB   130 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.65µs   min=972ns   med=2.5µs   max=9.24ms   p(90)=4.82µs   p(95)=5.96µs   p(99.9)=46.23µs
     http_req_connecting............: avg=513ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.35ms  min=2.51ms  med=32.54ms max=341.15ms p(90)=44.21ms  p(95)=48.93ms  p(99.9)=84.13ms
       { expected_response:true }...: avg=33.35ms  min=2.51ms  med=32.54ms max=341.15ms p(90)=44.21ms  p(95)=48.93ms  p(99.9)=84.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178475
     http_req_receiving.............: avg=112.58µs min=30.43µs med=63.45µs max=191.56ms p(90)=138.19µs p(95)=284.91µs p(99.9)=4.87ms 
     http_req_sending...............: avg=43.6µs   min=5.31µs  med=10.6µs  max=31.47ms  p(90)=24.72µs  p(95)=136.38µs p(99.9)=3.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.2ms   min=2.42ms  med=32.41ms max=340.25ms p(90)=44.02ms  p(95)=48.71ms  p(99.9)=83.86ms
     http_reqs......................: 178475  1483.424086/s
     iteration_duration.............: avg=33.62ms  min=5.45ms  med=32.78ms max=352.2ms  p(90)=44.45ms  p(95)=49.17ms  p(99.9)=85.1ms 
     iterations.....................: 178375  1482.59292/s
     success_rate...................: 100.00% ✓ 178375      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 394380      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 158 MB  1.3 MB/s
     http_req_blocked...............: avg=4.05µs  min=1.09µs  med=2.86µs  max=4.18ms   p(90)=4.45µs   p(95)=5.18µs   p(99.9)=40.25µs
     http_req_connecting............: avg=806ns   min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=45.36ms min=2.25ms  med=44.77ms max=314.32ms p(90)=63.8ms   p(95)=69.51ms  p(99.9)=96.81ms
       { expected_response:true }...: avg=45.36ms min=2.25ms  med=44.77ms max=314.32ms p(90)=63.8ms   p(95)=69.51ms  p(99.9)=96.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131560
     http_req_receiving.............: avg=97.13µs min=29.41µs med=75.13µs max=226.26ms p(90)=117.63µs p(95)=138.26µs p(99.9)=1.84ms 
     http_req_sending...............: avg=28.39µs min=5.35µs  med=12.04µs max=126.14ms p(90)=18.59µs  p(95)=22.54µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45.24ms min=2.17ms  med=44.65ms max=303.52ms p(90)=63.67ms  p(95)=69.37ms  p(99.9)=96.3ms 
     http_reqs......................: 131560  1093.624891/s
     iteration_duration.............: avg=45.63ms min=4.33ms  med=44.99ms max=352.92ms p(90)=64.02ms  p(95)=69.74ms  p(99.9)=97.38ms
     iterations.....................: 131460  1092.793616/s
     success_rate...................: 100.00% ✓ 131460      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 194697     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   647 kB/s
     http_req_blocked...............: avg=5.03µs  min=1.18µs  med=3.26µs  max=4.32ms   p(90)=4.88µs   p(95)=5.53µs   p(99.9)=64.25µs 
     http_req_connecting............: avg=1.49µs  min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.1ms  min=4.23ms  med=88.15ms max=325ms    p(90)=123.08ms p(95)=136.67ms p(99.9)=234.9ms 
       { expected_response:true }...: avg=92.1ms  min=4.23ms  med=88.15ms max=325ms    p(90)=123.08ms p(95)=136.67ms p(99.9)=234.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 64999
     http_req_receiving.............: avg=91.77µs min=31.95µs med=82.47µs max=154.44ms p(90)=117.22µs p(95)=131.22µs p(99.9)=887.67µs
     http_req_sending...............: avg=23.36µs min=5.59µs  med=14.36µs max=63.13ms  p(90)=21.28µs  p(95)=23.54µs  p(99.9)=727.35µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.98ms min=4.15ms  med=88.02ms max=322.56ms p(90)=122.97ms p(95)=136.54ms p(99.9)=234.72ms
     http_reqs......................: 64999   538.885305/s
     iteration_duration.............: avg=92.48ms min=13.56ms med=88.43ms max=342.73ms p(90)=123.33ms p(95)=136.98ms p(99.9)=238.38ms
     iterations.....................: 64899   538.056238/s
     success_rate...................: 100.00% ✓ 64899      ✗ 0    
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

     checks.........................: 100.00% ✓ 137208     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   456 kB/s
     http_req_blocked...............: avg=4.54µs   min=1.23µs  med=3.4µs    max=2.44ms   p(90)=4.83µs   p(95)=5.39µs   p(99.9)=178.95µs
     http_req_connecting............: avg=907ns    min=0s      med=0s       max=2.39ms   p(90)=0s       p(95)=0s       p(99.9)=100.23µs
     http_req_duration..............: avg=130.68ms min=5.67ms  med=128.24ms max=349.11ms p(90)=172.67ms p(95)=185.62ms p(99.9)=236.75ms
       { expected_response:true }...: avg=130.68ms min=5.67ms  med=128.24ms max=349.11ms p(90)=172.67ms p(95)=185.62ms p(99.9)=236.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45836
     http_req_receiving.............: avg=96.16µs  min=33.89µs med=86.21µs  max=84.64ms  p(90)=118.35µs p(95)=130.94µs p(99.9)=833.69µs
     http_req_sending...............: avg=27.55µs  min=6.18µs  med=16.26µs  max=117.41ms p(90)=21.91µs  p(95)=23.76µs  p(99.9)=639.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.56ms min=5.55ms  med=128.1ms  max=334.76ms p(90)=172.54ms p(95)=185.48ms p(99.9)=236.66ms
     http_reqs......................: 45836   379.63975/s
     iteration_duration.............: avg=131.22ms min=31.8ms  med=128.54ms max=357.58ms p(90)=173ms    p(95)=185.96ms p(99.9)=237.81ms
     iterations.....................: 45736   378.811493/s
     success_rate...................: 100.00% ✓ 45736      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 89001      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=10.06µs  min=1.25µs  med=3.82µs   max=81.15ms  p(90)=5.36µs   p(95)=5.99µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.25µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=201.4ms  min=6.46ms  med=191.97ms max=727.62ms p(90)=243.23ms p(95)=299.29ms p(99.9)=646.63ms
       { expected_response:true }...: avg=201.4ms  min=6.46ms  med=191.97ms max=727.62ms p(90)=243.23ms p(95)=299.29ms p(99.9)=646.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29767
     http_req_receiving.............: avg=105.29µs min=36.66µs med=100.94µs max=16.81ms  p(90)=133.34µs p(95)=146.94µs p(99.9)=564.05µs
     http_req_sending...............: avg=26.32µs  min=6.29µs  med=18.72µs  max=50.82ms  p(90)=23.7µs   p(95)=25.47µs  p(99.9)=579.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.27ms min=6.35ms  med=191.85ms max=727.49ms p(90)=243.11ms p(95)=299.18ms p(99.9)=646.49ms
     http_reqs......................: 29767   246.163531/s
     iteration_duration.............: avg=202.37ms min=55.5ms  med=192.46ms max=727.89ms p(90)=243.6ms  p(95)=302.79ms p(99.9)=647.24ms
     iterations.....................: 29667   245.336563/s
     success_rate...................: 100.00% ✓ 29667      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 86016      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.14µs  med=3.62µs   max=4.39ms   p(90)=5µs      p(95)=5.6µs    p(99.9)=1.54ms  
     http_req_connecting............: avg=3.3µs    min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=208.37ms min=8.76ms  med=207.65ms max=433.25ms p(90)=221.9ms  p(95)=225.09ms p(99.9)=305.74ms
       { expected_response:true }...: avg=208.37ms min=8.76ms  med=207.65ms max=433.25ms p(90)=221.9ms  p(95)=225.09ms p(99.9)=305.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28772
     http_req_receiving.............: avg=102.34µs min=29.46µs med=95.94µs  max=6.65ms   p(90)=128.52µs p(95)=142.04µs p(99.9)=612.82µs
     http_req_sending...............: avg=43.65µs  min=5.77µs  med=18.01µs  max=252.1ms  p(90)=23.09µs  p(95)=25.02µs  p(99.9)=590.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.22ms min=8.61ms  med=207.53ms max=423.61ms p(90)=221.77ms p(95)=224.95ms p(99.9)=305.25ms
     http_reqs......................: 28772   237.580119/s
     iteration_duration.............: avg=209.39ms min=57.8ms  med=208.05ms max=448.75ms p(90)=222.18ms p(95)=225.42ms p(99.9)=308.7ms 
     iterations.....................: 28672   236.754385/s
     success_rate...................: 100.00% ✓ 28672      ✗ 0    
     vus............................: 45      min=45       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

