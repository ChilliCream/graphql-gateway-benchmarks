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
| hive-router | v0.0.49 | 2,882 | 3,136 | 2,782 | 3.9% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,116 | 2,171 | 2,083 | 1.2% |  |
| grafbase | 0.53.3 | 2,033 | 2,102 | 2,007 | 1.5% |  |
| cosmo | 0.307.0 | 1,280 | 1,293 | 1,271 | 0.6% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 539 | 551 | 535 | 1.0% |  |
| apollo-router | v2.13.1 | 400 | 413 | 395 | 1.6% |  |
| apollo-gateway | 2.13.3 | 243 | 244 | 241 | 0.5% |  |
| hive-gateway | 2.5.25 | 240 | 244 | 238 | 1.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,370 | 2,485 | 2,315 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,009 | 2,052 | 1,997 | 0.8% |  |
| grafbase | 0.53.3 | 1,521 | 1,566 | 1,502 | 1.3% |  |
| cosmo | 0.307.0 | 1,213 | 1,232 | 1,204 | 0.8% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 508 | 524 | 501 | 1.6% |  |
| apollo-router | v2.13.1 | 373 | 384 | 369 | 1.4% |  |
| apollo-gateway | 2.13.3 | 230 | 233 | 229 | 0.7% |  |
| hive-gateway | 2.5.25 | 229 | 233 | 227 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1039020     ✗ 0     
     data_received..................: 30 GB   253 MB/s
     data_sent......................: 416 MB  3.5 MB/s
     http_req_blocked...............: avg=2.74µs   min=1.01µs  med=2.06µs  max=11.34ms  p(90)=3.22µs  p(95)=3.84µs   p(99.9)=28.74µs
     http_req_connecting............: avg=293ns    min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.08ms  min=1.57ms  med=16.23ms max=307.22ms p(90)=25.19ms p(95)=29.16ms  p(99.9)=51.51ms
       { expected_response:true }...: avg=17.08ms  min=1.57ms  med=16.23ms max=307.22ms p(90)=25.19ms p(95)=29.16ms  p(99.9)=51.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 346440
     http_req_receiving.............: avg=133.33µs min=28.38µs med=48.05µs max=64.59ms  p(90)=93.1µs  p(95)=268.24µs p(99.9)=14.48ms
     http_req_sending...............: avg=58.13µs  min=4.99µs  med=8.91µs  max=173.85ms p(90)=14.91µs p(95)=119.68µs p(99.9)=10.35ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.89ms  min=1.52ms  med=16.09ms max=288.81ms p(90)=24.92ms p(95)=28.73ms  p(99.9)=50.32ms
     http_reqs......................: 346440  2882.326833/s
     iteration_duration.............: avg=17.31ms  min=1.94ms  med=16.44ms max=363.95ms p(90)=25.42ms p(95)=29.44ms  p(99.9)=52.93ms
     iterations.....................: 346340  2881.494848/s
     success_rate...................: 100.00% ✓ 346340      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 763596      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=2.95µs   min=1.04µs med=2.31µs   max=11.04ms  p(90)=3.49µs   p(95)=4.1µs    p(99.9)=31.42µs 
     http_req_connecting............: avg=211ns    min=0s     med=0s       max=2.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.32ms  min=2.37ms med=14.75ms  max=321.34ms p(90)=52.4ms   p(95)=71.2ms   p(99.9)=167.2ms 
       { expected_response:true }...: avg=23.32ms  min=2.37ms med=14.75ms  max=321.34ms p(90)=52.4ms   p(95)=71.2ms   p(99.9)=167.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 254632
     http_req_receiving.............: avg=662.63µs min=52.1µs med=107.83µs max=295.83ms p(90)=956.36µs p(95)=1.48ms   p(99.9)=63.32ms 
     http_req_sending...............: avg=44.17µs  min=5.25µs med=9.48µs   max=104.5ms  p(90)=15.44µs  p(95)=110.99µs p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.62ms  min=2.29ms med=14.24ms  max=292.84ms p(90)=51.07ms  p(95)=69.82ms  p(99.9)=163.3ms 
     http_reqs......................: 254632  2116.657236/s
     iteration_duration.............: avg=23.56ms  min=3.5ms  med=14.97ms  max=340.96ms p(90)=52.64ms  p(95)=71.46ms  p(99.9)=168.51ms
     iterations.....................: 254532  2115.825975/s
     success_rate...................: 100.00% ✓ 254532      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 733395      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=3.57µs   min=1.04µs med=2.64µs  max=14.26ms  p(90)=4.2µs    p(95)=5.01µs   p(99.9)=43.58µs
     http_req_connecting............: avg=210ns    min=0s     med=0s      max=2.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.28ms  min=1.92ms med=24.03ms max=340.94ms p(90)=29.38ms  p(95)=31.96ms  p(99.9)=54.39ms
       { expected_response:true }...: avg=24.28ms  min=1.92ms med=24.03ms max=340.94ms p(90)=29.38ms  p(95)=31.96ms  p(99.9)=54.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244565
     http_req_receiving.............: avg=118.57µs min=29.7µs med=60.64µs max=92.9ms   p(90)=105.62µs p(95)=225.58µs p(99.9)=10.27ms
     http_req_sending...............: avg=49.7µs   min=5.39µs med=10.97µs max=222.1ms  p(90)=18.62µs  p(95)=124.22µs p(99.9)=3.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.11ms  min=1.85ms med=23.9ms  max=340.8ms  p(90)=29.18ms  p(95)=31.65ms  p(99.9)=53.43ms
     http_reqs......................: 244565  2033.844162/s
     iteration_duration.............: avg=24.53ms  min=3.19ms med=24.25ms max=349.89ms p(90)=29.61ms  p(95)=32.22ms  p(99.9)=54.84ms
     iterations.....................: 244465  2033.012545/s
     success_rate...................: 100.00% ✓ 244465      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 461889      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.51µs   min=1µs     med=2.52µs  max=4ms      p(90)=3.95µs  p(95)=4.6µs    p(99.9)=38.42µs
     http_req_connecting............: avg=634ns    min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.72ms  min=2.13ms  med=38.15ms max=339.45ms p(90)=54.65ms p(95)=59.64ms  p(99.9)=83.24ms
       { expected_response:true }...: avg=38.72ms  min=2.13ms  med=38.15ms max=339.45ms p(90)=54.65ms p(95)=59.64ms  p(99.9)=83.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154063
     http_req_receiving.............: avg=107.85µs min=29.03µs med=61.57µs max=217.31ms p(90)=98.46µs p(95)=118.41µs p(99.9)=2.53ms 
     http_req_sending...............: avg=27.36µs  min=5.36µs  med=10.81µs max=152.74ms p(90)=16.72µs p(95)=21.04µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.59ms  min=2.05ms  med=38.04ms max=338.7ms  p(90)=54.53ms p(95)=59.5ms   p(99.9)=82.28ms
     http_reqs......................: 154063  1280.948857/s
     iteration_duration.............: avg=38.96ms  min=3.84ms  med=38.35ms max=364.19ms p(90)=54.86ms p(95)=59.84ms  p(99.9)=83.72ms
     iterations.....................: 153963  1280.117412/s
     success_rate...................: 100.00% ✓ 153963      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 194922     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   648 kB/s
     http_req_blocked...............: avg=4.79µs  min=1.13µs  med=2.85µs  max=4.28ms   p(90)=4.29µs   p(95)=4.87µs   p(99.9)=47.17µs 
     http_req_connecting............: avg=1.67µs  min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.98ms min=3.99ms  med=88.63ms max=367.73ms p(90)=115.65ms p(95)=129.79ms p(99.9)=224.79ms
       { expected_response:true }...: avg=91.98ms min=3.99ms  med=88.63ms max=367.73ms p(90)=115.65ms p(95)=129.79ms p(99.9)=224.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65074
     http_req_receiving.............: avg=92.08µs min=31.86µs med=75.86µs max=237.51ms p(90)=109.62µs p(95)=122.09µs p(99.9)=987.15µs
     http_req_sending...............: avg=28µs    min=5.6µs   med=13µs    max=132.66ms p(90)=19.45µs  p(95)=21.66µs  p(99.9)=704.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.86ms min=3.94ms  med=88.53ms max=346.64ms p(90)=115.52ms p(95)=129.64ms p(99.9)=224.25ms
     http_reqs......................: 65074   539.790663/s
     iteration_duration.............: avg=92.36ms min=12.16ms med=88.89ms max=375.92ms p(90)=115.89ms p(95)=130.08ms p(99.9)=226.93ms
     iterations.....................: 64974   538.96116/s
     success_rate...................: 100.00% ✓ 64974      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 144867     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   481 kB/s
     http_req_blocked...............: avg=5.05µs   min=1.1µs   med=3.13µs   max=3.63ms   p(90)=4.52µs   p(95)=5.06µs   p(99.9)=163.86µs
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=94.54µs 
     http_req_duration..............: avg=123.79ms min=5.49ms  med=123.44ms max=333.11ms p(90)=149.65ms p(95)=157.16ms p(99.9)=190.96ms
       { expected_response:true }...: avg=123.79ms min=5.49ms  med=123.44ms max=333.11ms p(90)=149.65ms p(95)=157.16ms p(99.9)=190.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48389
     http_req_receiving.............: avg=86.94µs  min=30.6µs  med=79.18µs  max=50.95ms  p(90)=111.16µs p(95)=122.78µs p(99.9)=722.08µs
     http_req_sending...............: avg=23.32µs  min=5.92µs  med=14.44µs  max=77.98ms  p(90)=20.33µs  p(95)=22.25µs  p(99.9)=573.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.68ms min=5.43ms  med=123.33ms max=332.58ms p(90)=149.54ms p(95)=157.04ms p(99.9)=190.67ms
     http_reqs......................: 48389   400.90604/s
     iteration_duration.............: avg=124.28ms min=29.88ms med=123.72ms max=347.42ms p(90)=149.89ms p(95)=157.43ms p(99.9)=192.6ms 
     iterations.....................: 48289   400.077533/s
     success_rate...................: 100.00% ✓ 48289      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88212      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   293 kB/s
     http_req_blocked...............: avg=5.45µs   min=1.23µs  med=3.28µs   max=3.14ms   p(90)=4.51µs   p(95)=5µs      p(99.9)=755.39µs
     http_req_connecting............: avg=1.94µs   min=0s      med=0s       max=3.1ms    p(90)=0s       p(95)=0s       p(99.9)=712.97µs
     http_req_duration..............: avg=203.2ms  min=8.6ms   med=201.44ms max=408.82ms p(90)=211.11ms p(95)=220.47ms p(99.9)=282.78ms
       { expected_response:true }...: avg=203.2ms  min=8.6ms   med=201.44ms max=408.82ms p(90)=211.11ms p(95)=220.47ms p(99.9)=282.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29504
     http_req_receiving.............: avg=94.72µs  min=32.87µs med=89.25µs  max=27.18ms  p(90)=120.58µs p(95)=132.51µs p(99.9)=776.75µs
     http_req_sending...............: avg=28.65µs  min=5.77µs  med=16.2µs   max=63.05ms  p(90)=21µs     p(95)=22.73µs  p(99.9)=813.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.08ms min=8.46ms  med=201.33ms max=408.56ms p(90)=211ms    p(95)=220.31ms p(99.9)=281.2ms 
     http_reqs......................: 29504   243.685671/s
     iteration_duration.............: avg=204.16ms min=49.82ms med=201.7ms  max=423.16ms p(90)=211.4ms  p(95)=220.85ms p(99.9)=291.58ms
     iterations.....................: 29404   242.859729/s
     success_rate...................: 100.00% ✓ 29404      ✗ 0    
     vus............................: 36      min=36       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86880      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=7.42µs   min=1.25µs  med=3.45µs   max=4.49ms   p(90)=4.8µs    p(95)=5.39µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.71µs   min=0s      med=0s       max=4.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=206.32ms min=6.35ms  med=186.21ms max=680.68ms p(90)=242.27ms p(95)=459.06ms p(99.9)=606.55ms
       { expected_response:true }...: avg=206.32ms min=6.35ms  med=186.21ms max=680.68ms p(90)=242.27ms p(95)=459.06ms p(99.9)=606.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29060
     http_req_receiving.............: avg=99.37µs  min=36.95µs med=93.32µs  max=45.2ms   p(90)=125.44µs p(95)=138.96µs p(99.9)=442.09µs
     http_req_sending...............: avg=38.91µs  min=5.71µs  med=17.7µs   max=157.23ms p(90)=22.74µs  p(95)=24.63µs  p(99.9)=493.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.18ms min=6.24ms  med=186.09ms max=680.56ms p(90)=242.1ms  p(95)=458.95ms p(99.9)=606.46ms
     http_reqs......................: 29060   240.348586/s
     iteration_duration.............: avg=207.32ms min=16.62ms med=186.57ms max=680.89ms p(90)=242.77ms p(95)=460.13ms p(99.9)=606.83ms
     iterations.....................: 28960   239.521509/s
     success_rate...................: 100.00% ✓ 28960      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 854724      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 343 MB  2.8 MB/s
     http_req_blocked...............: avg=3.44µs   min=1.03µs  med=2.59µs  max=13.1ms   p(90)=4.11µs   p(95)=4.95µs   p(99.9)=39.3µs 
     http_req_connecting............: avg=290ns    min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.8ms   min=1.81ms  med=20.27ms max=323.11ms p(90)=28.87ms  p(95)=32.07ms  p(99.9)=54.97ms
       { expected_response:true }...: avg=20.8ms   min=1.81ms  med=20.27ms max=323.11ms p(90)=28.87ms  p(95)=32.07ms  p(99.9)=54.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285008
     http_req_receiving.............: avg=121.64µs min=28.16µs med=57.24µs max=234.6ms  p(90)=108.23µs p(95)=271.58µs p(99.9)=9.46ms 
     http_req_sending...............: avg=54.04µs  min=5.26µs  med=10.42µs max=138.49ms p(90)=18.85µs  p(95)=130.22µs p(99.9)=5.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.63ms  min=1.7ms   med=20.13ms max=292.11ms p(90)=28.67ms  p(95)=31.78ms  p(99.9)=53.83ms
     http_reqs......................: 285008  2370.523869/s
     iteration_duration.............: avg=21.04ms  min=3.41ms  med=20.49ms max=334.05ms p(90)=29.11ms  p(95)=32.34ms  p(99.9)=55.69ms
     iterations.....................: 284908  2369.692129/s
     success_rate...................: 100.00% ✓ 284908      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 724527      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=3.53µs   min=1.02µs  med=2.57µs   max=15.12ms  p(90)=4.06µs  p(95)=4.81µs   p(99.9)=40.82µs 
     http_req_connecting............: avg=422ns    min=0s      med=0s       max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.59ms  min=1.92ms  med=17.07ms  max=782.93ms p(90)=51.2ms  p(95)=69.69ms  p(99.9)=179.92ms
       { expected_response:true }...: avg=24.59ms  min=1.92ms  med=17.07ms  max=782.93ms p(90)=51.2ms  p(95)=69.69ms  p(99.9)=179.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241609
     http_req_receiving.............: avg=731.99µs min=50.89µs med=105.02µs max=376.9ms  p(90)=1.14ms  p(95)=1.86ms   p(99.9)=63.47ms 
     http_req_sending...............: avg=44.98µs  min=5.41µs  med=10.32µs  max=35.36ms  p(90)=18.89µs p(95)=116.68µs p(99.9)=3.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.81ms  min=1.79ms  med=16.52ms  max=781.94ms p(90)=49.68ms p(95)=68.04ms  p(99.9)=175.14ms
     http_reqs......................: 241609  2009.4165/s
     iteration_duration.............: avg=24.83ms  min=2.81ms  med=17.29ms  max=783.13ms p(90)=51.46ms p(95)=69.94ms  p(99.9)=180.66ms
     iterations.....................: 241509  2008.584819/s
     success_rate...................: 100.00% ✓ 241509      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 548967      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.96µs   min=962ns   med=2.75µs  max=4.7ms    p(90)=5.14µs   p(95)=6.3µs    p(99.9)=46.05µs
     http_req_connecting............: avg=553ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.5ms   min=2.26ms  med=31.62ms max=332.98ms p(90)=43.08ms  p(95)=47.84ms  p(99.9)=93.8ms 
       { expected_response:true }...: avg=32.5ms   min=2.26ms  med=31.62ms max=332.98ms p(90)=43.08ms  p(95)=47.84ms  p(99.9)=93.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 183089
     http_req_receiving.............: avg=114.65µs min=31.02µs med=64.69µs max=145.92ms p(90)=139.99µs p(95)=296.8µs  p(99.9)=5.17ms 
     http_req_sending...............: avg=51.41µs  min=5.61µs  med=11.23µs max=188.74ms p(90)=25.26µs  p(95)=141.48µs p(99.9)=3.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.34ms  min=2.2ms   med=31.47ms max=332.42ms p(90)=42.88ms  p(95)=47.59ms  p(99.9)=92.31ms
     http_reqs......................: 183089  1521.900377/s
     iteration_duration.............: avg=32.77ms  min=4.01ms  med=31.86ms max=350.51ms p(90)=43.33ms  p(95)=48.1ms   p(99.9)=94.74ms
     iterations.....................: 182989  1521.069142/s
     success_rate...................: 100.00% ✓ 182989      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 437499      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.48µs  min=1.09µs  med=2.86µs  max=4.92ms   p(90)=4.48µs  p(95)=5.18µs   p(99.9)=37.46µs
     http_req_connecting............: avg=276ns   min=0s      med=0s      max=2.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.88ms min=2.1ms   med=40.35ms max=328.84ms p(90)=57.43ms p(95)=62.56ms  p(99.9)=86.93ms
       { expected_response:true }...: avg=40.88ms min=2.1ms   med=40.35ms max=328.84ms p(90)=57.43ms p(95)=62.56ms  p(99.9)=86.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145933
     http_req_receiving.............: avg=87.88µs min=30.05µs med=69.52µs max=26.26ms  p(90)=109.1µs p(95)=129.44µs p(99.9)=1.71ms 
     http_req_sending...............: avg=29.76µs min=5.49µs  med=12.44µs max=119.85ms p(90)=19.58µs p(95)=23.62µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.76ms min=2.03ms  med=40.24ms max=328.45ms p(90)=57.3ms  p(95)=62.44ms  p(99.9)=86.71ms
     http_reqs......................: 145933  1213.28209/s
     iteration_duration.............: avg=41.13ms min=4.09ms  med=40.57ms max=364.05ms p(90)=57.65ms p(95)=62.78ms  p(99.9)=87.59ms
     iterations.....................: 145833  1212.450693/s
     success_rate...................: 100.00% ✓ 145833      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 183645     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 74 MB   611 kB/s
     http_req_blocked...............: avg=4.85µs  min=1.13µs  med=3.01µs   max=3.97ms   p(90)=4.54µs   p(95)=5.13µs   p(99.9)=63.2µs  
     http_req_connecting............: avg=1.61µs  min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.64ms min=4.28ms  med=103.55ms max=345.89ms p(90)=135.01ms p(95)=149.44ms p(99.9)=243.58ms
       { expected_response:true }...: avg=97.64ms min=4.28ms  med=103.55ms max=345.89ms p(90)=135.01ms p(95)=149.44ms p(99.9)=243.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61315
     http_req_receiving.............: avg=87.92µs min=31.88µs med=80.04µs  max=15.19ms  p(90)=114.62µs p(95)=127.71µs p(99.9)=940.8µs 
     http_req_sending...............: avg=24.01µs min=5.79µs  med=14.03µs  max=92.47ms  p(90)=20.64µs  p(95)=22.77µs  p(99.9)=677.67µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.53ms min=4.2ms   med=103.44ms max=345.44ms p(90)=134.9ms  p(95)=149.34ms p(99.9)=243.49ms
     http_reqs......................: 61315   508.343376/s
     iteration_duration.............: avg=98.04ms min=23.15ms med=103.83ms max=360.01ms p(90)=135.27ms p(95)=149.75ms p(99.9)=248.38ms
     iterations.....................: 61215   507.514307/s
     success_rate...................: 100.00% ✓ 61215      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 134931     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   448 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.24µs  med=3.56µs   max=4.07ms   p(90)=4.97µs   p(95)=5.55µs   p(99.9)=487.57µs
     http_req_connecting............: avg=2.22µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=292.74µs
     http_req_duration..............: avg=132.87ms min=5.88ms  med=130.28ms max=362.35ms p(90)=175.97ms p(95)=189.64ms p(99.9)=243.65ms
       { expected_response:true }...: avg=132.87ms min=5.88ms  med=130.28ms max=362.35ms p(90)=175.97ms p(95)=189.64ms p(99.9)=243.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45077
     http_req_receiving.............: avg=100.27µs min=32.63µs med=87.64µs  max=178.94ms p(90)=118.64µs p(95)=130.86µs p(99.9)=752.09µs
     http_req_sending...............: avg=25.35µs  min=6.37µs  med=16.91µs  max=75.7ms   p(90)=22.1µs   p(95)=23.86µs  p(99.9)=611.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.75ms min=5.79ms  med=130.18ms max=361.67ms p(90)=175.87ms p(95)=189.53ms p(99.9)=243.31ms
     http_reqs......................: 45077   373.306419/s
     iteration_duration.............: avg=133.44ms min=21.59ms med=130.64ms max=377.96ms p(90)=176.29ms p(95)=189.96ms p(99.9)=245.35ms
     iterations.....................: 44977   372.478266/s
     success_rate...................: 100.00% ✓ 44977      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 83583      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 34 MB   277 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.23µs  med=3.37µs   max=3.95ms   p(90)=4.63µs   p(95)=5.15µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.56µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=214.44ms min=8.82ms  med=216.6ms  max=455.41ms p(90)=230.18ms p(95)=241.21ms p(99.9)=306.96ms
       { expected_response:true }...: avg=214.44ms min=8.82ms  med=216.6ms  max=455.41ms p(90)=230.18ms p(95)=241.21ms p(99.9)=306.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27961
     http_req_receiving.............: avg=110.73µs min=34.31µs med=91.81µs  max=206.01ms p(90)=122.77µs p(95)=135.13µs p(99.9)=660.72µs
     http_req_sending...............: avg=28.56µs  min=5.96µs  med=16.93µs  max=112.87ms p(90)=21.41µs  p(95)=23.12µs  p(99.9)=584.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.3ms  min=8.66ms  med=216.49ms max=455.28ms p(90)=230.04ms p(95)=241.03ms p(99.9)=305.09ms
     http_reqs......................: 27961   230.783987/s
     iteration_duration.............: avg=215.5ms  min=47.4ms  med=216.88ms max=464.15ms p(90)=230.5ms  p(95)=241.61ms p(99.9)=349.08ms
     iterations.....................: 27861   229.958609/s
     success_rate...................: 100.00% ✓ 27861      ✗ 0    
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

     checks.........................: 100.00% ✓ 82839      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   275 kB/s
     http_req_blocked...............: avg=7.35µs   min=1.27µs  med=3.47µs   max=3.84ms   p(90)=4.76µs   p(95)=5.32µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=216.36ms min=6.65ms  med=199.08ms max=679.49ms p(90)=252.42ms p(95)=462.49ms p(99.9)=577.09ms
       { expected_response:true }...: avg=216.36ms min=6.65ms  med=199.08ms max=679.49ms p(90)=252.42ms p(95)=462.49ms p(99.9)=577.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27713
     http_req_receiving.............: avg=144.22µs min=35.17µs med=95.8µs   max=119.63ms p(90)=127.11µs p(95)=140.51µs p(99.9)=986.59µs
     http_req_sending...............: avg=28.61µs  min=6.34µs  med=17.58µs  max=93.81ms  p(90)=22.17µs  p(95)=23.97µs  p(99.9)=609.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=216.19ms min=6.56ms  med=198.95ms max=679.4ms  p(90)=252.27ms p(95)=462.38ms p(99.9)=577ms   
     http_reqs......................: 27713   229.097362/s
     iteration_duration.............: avg=217.42ms min=34.83ms med=199.45ms max=679.65ms p(90)=252.85ms p(95)=462.99ms p(99.9)=577.33ms
     iterations.....................: 27613   228.270684/s
     success_rate...................: 100.00% ✓ 27613      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

