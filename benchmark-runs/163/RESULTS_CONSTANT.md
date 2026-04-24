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
| hive-router | v0.0.49 | 2,989 | 3,139 | 2,932 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,198 | 2,261 | 2,180 | 1.1% |  |
| grafbase | 0.53.3 | 1,959 | 2,032 | 1,932 | 1.6% |  |
| cosmo | 0.307.0 | 1,255 | 1,268 | 1,242 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 539 | 549 | 536 | 0.9% |  |
| apollo-router | v2.13.1 | 432 | 441 | 429 | 0.9% |  |
| hive-gateway | 2.5.25 | 252 | 256 | 252 | 0.7% |  |
| apollo-gateway | 2.13.3 | 244 | 246 | 243 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,374 | 2,497 | 2,347 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,023 | 2,069 | 2,005 | 1.0% |  |
| grafbase | 0.53.3 | 1,527 | 1,549 | 1,512 | 0.7% |  |
| cosmo | 0.307.0 | 1,231 | 1,240 | 1,223 | 0.5% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 516 | 531 | 510 | 1.4% |  |
| apollo-router | v2.13.1 | 389 | 398 | 386 | 1.1% |  |
| hive-gateway | 2.5.25 | 243 | 247 | 240 | 0.9% |  |
| apollo-gateway | 2.13.3 | 239 | 241 | 238 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1077687     ✗ 0     
     data_received..................: 32 GB   262 MB/s
     data_sent......................: 432 MB  3.6 MB/s
     http_req_blocked...............: avg=2.91µs   min=952ns   med=2.02µs  max=23.44ms  p(90)=3.16µs  p(95)=3.81µs   p(99.9)=32.85µs
     http_req_connecting............: avg=248ns    min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.46ms  min=1.65ms  med=15.79ms max=307.3ms  p(90)=23.18ms p(95)=26.98ms  p(99.9)=50.25ms
       { expected_response:true }...: avg=16.46ms  min=1.65ms  med=15.79ms max=307.3ms  p(90)=23.18ms p(95)=26.98ms  p(99.9)=50.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 359329
     http_req_receiving.............: avg=130.23µs min=27.46µs med=49.48µs max=191.83ms p(90)=98.27µs p(95)=273.16µs p(99.9)=12.67ms
     http_req_sending...............: avg=61.65µs  min=5.16µs  med=8.94µs  max=250.63ms p(90)=15.63µs p(95)=121.39µs p(99.9)=10.98ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.27ms  min=1.59ms  med=15.65ms max=306.24ms p(90)=22.91ms p(95)=26.55ms  p(99.9)=48.55ms
     http_reqs......................: 359329  2989.484314/s
     iteration_duration.............: avg=16.69ms  min=2.01ms  med=15.99ms max=322.22ms p(90)=23.41ms p(95)=27.24ms  p(99.9)=51.85ms
     iterations.....................: 359229  2988.652351/s
     success_rate...................: 100.00% ✓ 359229      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 793230      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 318 MB  2.6 MB/s
     http_req_blocked...............: avg=2.75µs   min=1.02µs  med=2.04µs   max=4.18ms   p(90)=3.08µs   p(95)=3.65µs   p(99.9)=30.57µs 
     http_req_connecting............: avg=380ns    min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.45ms  min=2.43ms  med=14.26ms  max=306.78ms p(90)=50.21ms  p(95)=68.42ms  p(99.9)=166ms   
       { expected_response:true }...: avg=22.45ms  min=2.43ms  med=14.26ms  max=306.78ms p(90)=50.21ms  p(95)=68.42ms  p(99.9)=166ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 264510
     http_req_receiving.............: avg=637.38µs min=51.35µs med=106.19µs max=206.21ms p(90)=944.71µs p(95)=1.45ms   p(99.9)=58.86ms 
     http_req_sending...............: avg=41.94µs  min=5.11µs  med=8.95µs   max=145.31ms p(90)=14.83µs  p(95)=111.69µs p(99.9)=2.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.77ms  min=2.33ms  med=13.76ms  max=306.04ms p(90)=48.91ms  p(95)=67.07ms  p(99.9)=164.16ms
     http_reqs......................: 264510  2198.638197/s
     iteration_duration.............: avg=22.68ms  min=3.17ms  med=14.47ms  max=330.85ms p(90)=50.43ms  p(95)=68.65ms  p(99.9)=167.6ms 
     iterations.....................: 264410  2197.806986/s
     success_rate...................: 100.00% ✓ 264410      ✗ 0     
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

     checks.........................: 100.00% ✓ 706632      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 283 MB  2.4 MB/s
     http_req_blocked...............: avg=3.04µs   min=1.03µs  med=2.12µs  max=12.21ms  p(90)=3.4µs   p(95)=4.12µs   p(99.9)=35.01µs
     http_req_connecting............: avg=474ns    min=0s      med=0s      max=4.33ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.23ms  min=2.01ms  med=24.96ms max=308.07ms p(90)=30.22ms p(95)=32.38ms  p(99.9)=55.3ms 
       { expected_response:true }...: avg=25.23ms  min=2.01ms  med=24.96ms max=308.07ms p(90)=30.22ms p(95)=32.38ms  p(99.9)=55.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 235644
     http_req_receiving.............: avg=106.06µs min=30.06µs med=58.75µs max=123.09ms p(90)=97.68µs p(95)=160.94µs p(99.9)=7.76ms 
     http_req_sending...............: avg=44.54µs  min=4.97µs  med=9.75µs  max=267.99ms p(90)=15.79µs p(95)=86.74µs  p(99.9)=2.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=25.08ms  min=1.9ms   med=24.85ms max=307.73ms p(90)=30.05ms p(95)=32.15ms  p(99.9)=53.73ms
     http_reqs......................: 235644  1959.366535/s
     iteration_duration.............: avg=25.46ms  min=4.53ms  med=25.17ms max=330.99ms p(90)=30.44ms p(95)=32.62ms  p(99.9)=55.87ms
     iterations.....................: 235544  1958.535041/s
     success_rate...................: 100.00% ✓ 235544      ✗ 0     
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

     checks.........................: 100.00% ✓ 452613      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=2.78µs  min=1.06µs med=2.06µs  max=17.55ms  p(90)=3.27µs  p(95)=3.84µs   p(99.9)=31.24µs
     http_req_connecting............: avg=302ns   min=0s     med=0s      max=2.23ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.54ms min=2.08ms med=39ms    max=349.45ms p(90)=55.75ms p(95)=60.92ms  p(99.9)=84.68ms
       { expected_response:true }...: avg=39.54ms min=2.08ms med=39ms    max=349.45ms p(90)=55.75ms p(95)=60.92ms  p(99.9)=84.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150971
     http_req_receiving.............: avg=120µs   min=28.2µs med=57.69µs max=304.28ms p(90)=90.55µs p(95)=107.17µs p(99.9)=2.22ms 
     http_req_sending...............: avg=23.08µs min=5.19µs med=9.68µs  max=27.69ms  p(90)=14.84µs p(95)=18.87µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.4ms  min=1.99ms med=38.91ms max=104.4ms  p(90)=55.62ms p(95)=60.78ms  p(99.9)=82.93ms
     http_reqs......................: 150971  1255.172757/s
     iteration_duration.............: avg=39.76ms min=3.63ms med=39.2ms  max=372.95ms p(90)=55.95ms p(95)=61.13ms  p(99.9)=85.39ms
     iterations.....................: 150871  1254.341357/s
     success_rate...................: 100.00% ✓ 150871      ✗ 0     
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

     checks.........................: 100.00% ✓ 194841     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   648 kB/s
     http_req_blocked...............: avg=4.46µs  min=1.15µs  med=2.45µs  max=4.87ms   p(90)=4.05µs   p(95)=4.58µs   p(99.9)=44.13µs 
     http_req_connecting............: avg=1.62µs  min=0s      med=0s      max=4.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.03ms min=4.27ms  med=90.44ms max=327.85ms p(90)=119.56ms p(95)=133.64ms p(99.9)=228.47ms
       { expected_response:true }...: avg=92.03ms min=4.27ms  med=90.44ms max=327.85ms p(90)=119.56ms p(95)=133.64ms p(99.9)=228.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65047
     http_req_receiving.............: avg=80.16µs min=32.12µs med=70.85µs max=56.61ms  p(90)=105.51µs p(95)=117.74µs p(99.9)=897.53µs
     http_req_sending...............: avg=23.6µs  min=5.67µs  med=11.97µs max=151.33ms p(90)=18.56µs  p(95)=20.62µs  p(99.9)=603.75µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.93ms min=4.16ms  med=90.34ms max=327.67ms p(90)=119.46ms p(95)=133.51ms p(99.9)=228.25ms
     http_reqs......................: 65047   539.58085/s
     iteration_duration.............: avg=92.39ms min=21.04ms med=90.68ms max=362.87ms p(90)=119.8ms  p(95)=133.96ms p(99.9)=230.45ms
     iterations.....................: 64947   538.751325/s
     success_rate...................: 100.00% ✓ 64947      ✗ 0    
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

     checks.........................: 100.00% ✓ 156321     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   519 kB/s
     http_req_blocked...............: avg=5.25µs   min=1.12µs  med=3.03µs   max=4.49ms   p(90)=4.44µs   p(95)=4.98µs   p(99.9)=158.23µs
     http_req_connecting............: avg=2µs      min=0s      med=0s       max=4.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.72ms min=5.42ms  med=114.52ms max=350.4ms  p(90)=138.59ms p(95)=145.68ms p(99.9)=182.48ms
       { expected_response:true }...: avg=114.72ms min=5.42ms  med=114.52ms max=350.4ms  p(90)=138.59ms p(95)=145.68ms p(99.9)=182.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52207
     http_req_receiving.............: avg=89.92µs  min=30.65µs med=80.42µs  max=161.02ms p(90)=112.16µs p(95)=124.36µs p(99.9)=697.41µs
     http_req_sending...............: avg=28.81µs  min=5.94µs  med=14.77µs  max=174.5ms  p(90)=20.13µs  p(95)=21.97µs  p(99.9)=613.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.6ms  min=5.33ms  med=114.42ms max=350.03ms p(90)=138.47ms p(95)=145.56ms p(99.9)=180.91ms
     http_reqs......................: 52207   432.560374/s
     iteration_duration.............: avg=115.18ms min=20.07ms med=114.8ms  max=374.03ms p(90)=138.83ms p(95)=145.96ms p(99.9)=186.2ms 
     iterations.....................: 52107   431.731825/s
     success_rate...................: 100.00% ✓ 52107      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 91512      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=7.25µs   min=1.34µs  med=3.53µs   max=4.11ms   p(90)=4.97µs   p(95)=5.6µs    p(99.9)=1.93ms  
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=195.91ms min=6.36ms  med=178.21ms max=649.81ms p(90)=233ms    p(95)=404.07ms p(99.9)=532.04ms
       { expected_response:true }...: avg=195.91ms min=6.36ms  med=178.21ms max=649.81ms p(90)=233ms    p(95)=404.07ms p(99.9)=532.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30604
     http_req_receiving.............: avg=105.37µs min=33.37µs med=97.07µs  max=89.06ms  p(90)=129.59µs p(95)=143.38µs p(99.9)=563.75µs
     http_req_sending...............: avg=30.02µs  min=6.07µs  med=17.88µs  max=99.5ms   p(90)=23.14µs  p(95)=25.18µs  p(99.9)=595.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.78ms min=6.23ms  med=178.08ms max=649.71ms p(90)=232.85ms p(95)=403.95ms p(99.9)=531.9ms 
     http_reqs......................: 30604   252.897637/s
     iteration_duration.............: avg=196.85ms min=48.25ms med=178.56ms max=650.03ms p(90)=233.64ms p(95)=404.73ms p(99.9)=532.31ms
     iterations.....................: 30504   252.071282/s
     success_rate...................: 100.00% ✓ 30504      ✗ 0    
     vus............................: 6       min=6        max=50 
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

     checks.........................: 100.00% ✓ 88548      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=11.46µs  min=1.18µs  med=3.27µs   max=136.28ms p(90)=4.53µs   p(95)=5.05µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.33µs   min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=202.41ms min=8.27ms  med=201.78ms max=439.6ms  p(90)=220.32ms p(95)=227.79ms p(99.9)=290.45ms
       { expected_response:true }...: avg=202.41ms min=8.27ms  med=201.78ms max=439.6ms  p(90)=220.32ms p(95)=227.79ms p(99.9)=290.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29616
     http_req_receiving.............: avg=101.77µs min=33.29µs med=88.28µs  max=197.22ms p(90)=119.95µs p(95)=132.13µs p(99.9)=559.24µs
     http_req_sending...............: avg=24.68µs  min=5.89µs  med=16.57µs  max=57.46ms  p(90)=21.39µs  p(95)=23.28µs  p(99.9)=600.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.28ms min=8.18ms  med=201.66ms max=412.97ms p(90)=220.2ms  p(95)=227.66ms p(99.9)=289.79ms
     http_reqs......................: 29616   244.686566/s
     iteration_duration.............: avg=203.39ms min=53.1ms  med=202.06ms max=457ms    p(90)=220.61ms p(95)=228.19ms p(99.9)=317.21ms
     iterations.....................: 29516   243.860369/s
     success_rate...................: 100.00% ✓ 29516      ✗ 0    
     vus............................: 28      min=28       max=50 
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

     checks.........................: 100.00% ✓ 856365      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=2.92µs   min=982ns   med=2.26µs  max=16.16ms  p(90)=3.72µs   p(95)=4.57µs   p(99.9)=36.1µs 
     http_req_connecting............: avg=144ns    min=0s      med=0s      max=1.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.77ms  min=1.81ms  med=20.37ms max=306.58ms p(90)=28.54ms  p(95)=31.39ms  p(99.9)=53.42ms
       { expected_response:true }...: avg=20.77ms  min=1.81ms  med=20.37ms max=306.58ms p(90)=28.54ms  p(95)=31.39ms  p(99.9)=53.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285555
     http_req_receiving.............: avg=110.58µs min=28.95µs med=56.02µs max=90.46ms  p(90)=105.23µs p(95)=264.17µs p(99.9)=7.51ms 
     http_req_sending...............: avg=49.22µs  min=5.39µs  med=10.09µs max=61.67ms  p(90)=18.74µs  p(95)=127.87µs p(99.9)=3.98ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.61ms  min=1.73ms  med=20.23ms max=306.01ms p(90)=28.34ms  p(95)=31.16ms  p(99.9)=52.4ms 
     http_reqs......................: 285555  2374.935222/s
     iteration_duration.............: avg=21ms     min=3.2ms   med=20.58ms max=324.7ms  p(90)=28.76ms  p(95)=31.63ms  p(99.9)=53.95ms
     iterations.....................: 285455  2374.103531/s
     success_rate...................: 100.00% ✓ 285455      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 729726      ✗ 0     
     data_received..................: 21 GB   177 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.01µs  min=992ns   med=2.1µs    max=15.42ms  p(90)=3.49µs  p(95)=4.23µs   p(99.9)=34.03µs 
     http_req_connecting............: avg=408ns   min=0s      med=0s       max=3.79ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.42ms min=1.91ms  med=17.08ms  max=594.07ms p(90)=50.46ms p(95)=67.21ms  p(99.9)=183.71ms
       { expected_response:true }...: avg=24.42ms min=1.91ms  med=17.08ms  max=594.07ms p(90)=50.46ms p(95)=67.21ms  p(99.9)=183.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 243342
     http_req_receiving.............: avg=662.1µs min=50.62µs med=100.36µs max=174.68ms p(90)=1.14ms  p(95)=1.85ms   p(99.9)=54.44ms 
     http_req_sending...............: avg=45.9µs  min=5.22µs  med=9.22µs   max=105.03ms p(90)=17.61µs p(95)=108.55µs p(99.9)=3.76ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.71ms min=1.8ms   med=16.54ms  max=544.99ms p(90)=49.18ms p(95)=65.72ms  p(99.9)=181.73ms
     http_reqs......................: 243342  2023.941171/s
     iteration_duration.............: avg=24.65ms min=2.55ms  med=17.3ms   max=594.27ms p(90)=50.7ms  p(95)=67.45ms  p(99.9)=185.97ms
     iterations.....................: 243242  2023.109444/s
     success_rate...................: 100.00% ✓ 243242      ✗ 0     
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

     checks.........................: 100.00% ✓ 550995      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.69µs  min=961ns   med=2.4µs   max=4.96ms   p(90)=4.73µs   p(95)=5.94µs   p(99.9)=50.22µs
     http_req_connecting............: avg=598ns   min=0s      med=0s      max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.38ms min=2.36ms  med=31.45ms max=321.2ms  p(90)=43.08ms  p(95)=47.96ms  p(99.9)=91.41ms
       { expected_response:true }...: avg=32.38ms min=2.36ms  med=31.45ms max=321.2ms  p(90)=43.08ms  p(95)=47.96ms  p(99.9)=91.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183765
     http_req_receiving.............: avg=115.2µs min=30.52µs med=61.99µs max=33.48ms  p(90)=138.17µs p(95)=291.18µs p(99.9)=6.41ms 
     http_req_sending...............: avg=52.2µs  min=5.34µs  med=10.56µs max=230.46ms p(90)=25.14µs  p(95)=139.36µs p(99.9)=3.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.22ms min=2.24ms  med=31.3ms  max=320.79ms p(90)=42.89ms  p(95)=47.69ms  p(99.9)=90.98ms
     http_reqs......................: 183765  1527.584405/s
     iteration_duration.............: avg=32.65ms min=3.52ms  med=31.69ms max=337.02ms p(90)=43.32ms  p(95)=48.2ms   p(99.9)=92.34ms
     iterations.....................: 183665  1526.753135/s
     success_rate...................: 100.00% ✓ 183665      ✗ 0     
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

     checks.........................: 100.00% ✓ 444054      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.29µs   min=982ns   med=2.38µs  max=3.99ms   p(90)=3.99µs   p(95)=4.67µs   p(99.9)=36.62µs
     http_req_connecting............: avg=548ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.28ms  min=2.27ms  med=39.76ms max=337.89ms p(90)=56.59ms  p(95)=61.69ms  p(99.9)=86.22ms
       { expected_response:true }...: avg=40.28ms  min=2.27ms  med=39.76ms max=337.89ms p(90)=56.59ms  p(95)=61.69ms  p(99.9)=86.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148118
     http_req_receiving.............: avg=130.99µs min=28.48µs med=64.64µs max=258.9ms  p(90)=102.15µs p(95)=120.09µs p(99.9)=2.15ms 
     http_req_sending...............: avg=26.77µs  min=5.4µs   med=10.92µs max=231.84ms p(90)=17.5µs   p(95)=21.19µs  p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.12ms  min=2.16ms  med=39.66ms max=106.37ms p(90)=56.47ms  p(95)=61.55ms  p(99.9)=83.66ms
     http_reqs......................: 148118  1231.463477/s
     iteration_duration.............: avg=40.52ms  min=3.37ms  med=39.97ms max=345.02ms p(90)=56.8ms   p(95)=61.89ms  p(99.9)=86.68ms
     iterations.....................: 148018  1230.63207/s
     success_rate...................: 100.00% ✓ 148018      ✗ 0     
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

     checks.........................: 100.00% ✓ 186699     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   621 kB/s
     http_req_blocked...............: avg=4.63µs  min=1.11µs  med=2.77µs  max=4.23ms   p(90)=4.34µs   p(95)=4.87µs   p(99.9)=46.41µs 
     http_req_connecting............: avg=1.58µs  min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.03ms min=4.21ms  med=93.28ms max=370.32ms p(90)=117.65ms p(95)=131.06ms p(99.9)=229.31ms
       { expected_response:true }...: avg=96.03ms min=4.21ms  med=93.28ms max=370.32ms p(90)=117.65ms p(95)=131.06ms p(99.9)=229.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62333
     http_req_receiving.............: avg=90.07µs min=31.25µs med=78.2µs  max=138.54ms p(90)=113.31µs p(95)=126.51µs p(99.9)=854.28µs
     http_req_sending...............: avg=26.53µs min=5.71µs  med=12.99µs max=137.88ms p(90)=19.51µs  p(95)=21.52µs  p(99.9)=801.91µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.91ms min=4.1ms   med=93.18ms max=369.32ms p(90)=117.54ms p(95)=130.91ms p(99.9)=228.51ms
     http_reqs......................: 62333   516.967115/s
     iteration_duration.............: avg=96.43ms min=29.51ms med=93.53ms max=380.89ms p(90)=117.93ms p(95)=131.37ms p(99.9)=230.51ms
     iterations.....................: 62233   516.137752/s
     success_rate...................: 100.00% ✓ 62233      ✗ 0    
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

     checks.........................: 100.00% ✓ 140727     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 56 MB   467 kB/s
     http_req_blocked...............: avg=6µs      min=1.19µs  med=3.42µs   max=4.52ms   p(90)=4.85µs   p(95)=5.41µs   p(99.9)=867.84µs
     http_req_connecting............: avg=2.42µs   min=0s      med=0s       max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=842.9µs 
     http_req_duration..............: avg=127.42ms min=5.97ms  med=125.02ms max=355.35ms p(90)=169.03ms p(95)=181.57ms p(99.9)=232.83ms
       { expected_response:true }...: avg=127.42ms min=5.97ms  med=125.02ms max=355.35ms p(90)=169.03ms p(95)=181.57ms p(99.9)=232.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47009
     http_req_receiving.............: avg=90.35µs  min=31.9µs  med=85.08µs  max=52.93ms  p(90)=116.01µs p(95)=128.02µs p(99.9)=608.35µs
     http_req_sending...............: avg=20.15µs  min=5.86µs  med=16.02µs  max=40.35ms  p(90)=21.15µs  p(95)=23.02µs  p(99.9)=496.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=127.31ms min=5.84ms  med=124.91ms max=355.09ms p(90)=168.92ms p(95)=181.48ms p(99.9)=232.75ms
     http_reqs......................: 47009   389.310663/s
     iteration_duration.............: avg=127.96ms min=38.25ms med=125.37ms max=374.65ms p(90)=169.32ms p(95)=181.96ms p(99.9)=236.12ms
     iterations.....................: 46909   388.482501/s
     success_rate...................: 100.00% ✓ 46909      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 87987      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7.17µs   min=1.27µs  med=3.47µs   max=4.15ms   p(90)=4.79µs   p(95)=5.33µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=203.72ms min=6.39ms  med=204.13ms max=709.4ms  p(90)=267.24ms p(95)=405.4ms  p(99.9)=569.94ms
       { expected_response:true }...: avg=203.72ms min=6.39ms  med=204.13ms max=709.4ms  p(90)=267.24ms p(95)=405.4ms  p(99.9)=569.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29429
     http_req_receiving.............: avg=97.79µs  min=33.89µs med=94.51µs  max=1.67ms   p(90)=126.02µs p(95)=139.51µs p(99.9)=491.1µs 
     http_req_sending...............: avg=31.87µs  min=5.92µs  med=17.4µs   max=188.08ms p(90)=22.19µs  p(95)=23.95µs  p(99.9)=559.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.59ms min=6.29ms  med=204.02ms max=709.24ms p(90)=267.09ms p(95)=405.28ms p(99.9)=569.66ms
     http_reqs......................: 29429   243.398588/s
     iteration_duration.............: avg=204.69ms min=25.31ms med=204.57ms max=709.63ms p(90)=267.73ms p(95)=406.52ms p(99.9)=570.19ms
     iterations.....................: 29329   242.571517/s
     success_rate...................: 100.00% ✓ 29329      ✗ 0    
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

     checks.........................: 100.00% ✓ 86718      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=6.87µs   min=1.27µs  med=3.44µs   max=4.14ms   p(90)=4.72µs   p(95)=5.28µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=3.25µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=206.74ms min=8.69ms  med=192.23ms max=396.28ms p(90)=295.34ms p(95)=302.78ms p(99.9)=379.96ms
       { expected_response:true }...: avg=206.74ms min=8.69ms  med=192.23ms max=396.28ms p(90)=295.34ms p(95)=302.78ms p(99.9)=379.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29006
     http_req_receiving.............: avg=99.77µs  min=34.73µs med=93.46µs  max=47.61ms  p(90)=126.07µs p(95)=139.57µs p(99.9)=650.74µs
     http_req_sending...............: avg=27.23µs  min=6.23µs  med=17.33µs  max=60.91ms  p(90)=22.03µs  p(95)=24.03µs  p(99.9)=585.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.61ms min=8.55ms  med=192.13ms max=393.46ms p(90)=295.2ms  p(95)=302.66ms p(99.9)=379.6ms 
     http_reqs......................: 29006   239.493511/s
     iteration_duration.............: avg=207.7ms  min=52.84ms med=192.61ms max=396.88ms p(90)=295.6ms  p(95)=303.1ms  p(99.9)=380.88ms
     iterations.....................: 28906   238.667842/s
     success_rate...................: 100.00% ✓ 28906      ✗ 0    
     vus............................: 43      min=43       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

