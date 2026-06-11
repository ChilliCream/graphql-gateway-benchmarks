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
| hive-router | v0.0.65 | 2,988 | 3,158 | 2,949 | 2.2% |  |
| hotchocolate | 16.1.3 | 2,111 | 2,177 | 2,098 | 1.2% |  |
| grafbase | 0.53.5 | 2,040 | 2,114 | 2,018 | 1.8% |  |
| cosmo | 0.321.1 | 1,222 | 1,240 | 1,211 | 0.8% | non-compatible response (3 across 1/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 558 | 573 | 551 | 1.3% |  |
| apollo-router | v2.15.0 | 440 | 450 | 436 | 1.1% |  |
| apollo-gateway | 2.14.1 | 248 | 250 | 245 | 0.8% |  |
| hive-gateway | 2.8.2 | 235 | 238 | 232 | 1.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,335 | 2,465 | 2,275 | 2.6% |  |
| hotchocolate | 16.1.3 | 1,933 | 1,988 | 1,922 | 1.2% |  |
| grafbase | 0.53.5 | 1,523 | 1,561 | 1,514 | 1.0% |  |
| cosmo | 0.321.1 | 1,115 | 1,138 | 1,106 | 1.0% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 533 | 549 | 526 | 1.4% |  |
| apollo-router | v2.15.0 | 378 | 392 | 372 | 1.7% |  |
| hive-gateway | 2.8.2 | 237 | 243 | 234 | 1.5% |  |
| apollo-gateway | 2.14.1 | 235 | 238 | 233 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1077318     ✗ 0     
     data_received..................: 32 GB   262 MB/s
     data_sent......................: 432 MB  3.6 MB/s
     http_req_blocked...............: avg=2.85µs   min=981ns   med=2.13µs  max=23.45ms  p(90)=3.38µs   p(95)=4.08µs   p(99.9)=35.92µs
     http_req_connecting............: avg=128ns    min=0s      med=0s      max=2.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.47ms  min=1.63ms  med=15.55ms max=347.3ms  p(90)=24.25ms  p(95)=28.04ms  p(99.9)=50.87ms
       { expected_response:true }...: avg=16.47ms  min=1.63ms  med=15.55ms max=347.3ms  p(90)=24.25ms  p(95)=28.04ms  p(99.9)=50.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 359206
     http_req_receiving.............: avg=151.42µs min=27.53µs med=50.65µs max=313.84ms p(90)=101.99µs p(95)=280.55µs p(99.9)=14.86ms
     http_req_sending...............: avg=58.41µs  min=5.29µs  med=9.29µs  max=40.86ms  p(90)=16.16µs  p(95)=124.48µs p(99.9)=7.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.26ms  min=1.58ms  med=15.4ms  max=111.4ms  p(90)=23.97ms  p(95)=27.62ms  p(99.9)=48.65ms
     http_reqs......................: 359206  2988.351027/s
     iteration_duration.............: avg=16.69ms  min=2.21ms  med=15.76ms max=365.99ms p(90)=24.47ms  p(95)=28.3ms   p(99.9)=52.46ms
     iterations.....................: 359106  2987.519095/s
     success_rate...................: 100.00% ✓ 359106      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 761871      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=2.85µs   min=1.02µs  med=2.04µs   max=15.91ms  p(90)=3.11µs   p(95)=3.7µs   p(99.9)=30.91µs 
     http_req_connecting............: avg=335ns    min=0s      med=0s       max=5.22ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.39ms  min=2.47ms  med=14.63ms  max=369.14ms p(90)=53.15ms  p(95)=71.59ms p(99.9)=168.69ms
       { expected_response:true }...: avg=23.39ms  min=2.47ms  med=14.63ms  max=369.14ms p(90)=53.15ms  p(95)=71.59ms p(99.9)=168.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 254057
     http_req_receiving.............: avg=674.74µs min=51.95µs med=110.12µs max=323.35ms p(90)=949.08µs p(95)=1.45ms  p(99.9)=62.34ms 
     http_req_sending...............: avg=37.92µs  min=5.12µs  med=9.19µs   max=70.1ms   p(90)=15.26µs  p(95)=91.97µs p(99.9)=2.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.68ms  min=2.37ms  med=14.12ms  max=324.79ms p(90)=51.79ms  p(95)=70.09ms p(99.9)=165ms   
     http_reqs......................: 254057  2111.575017/s
     iteration_duration.............: avg=23.62ms  min=3.38ms  med=14.85ms  max=380.95ms p(90)=53.39ms  p(95)=71.84ms p(99.9)=169.4ms 
     iterations.....................: 253957  2110.743874/s
     success_rate...................: 100.00% ✓ 253957      ✗ 0     
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

     checks.........................: 100.00% ✓ 735711      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 295 MB  2.5 MB/s
     http_req_blocked...............: avg=3.11µs   min=962ns   med=2.15µs  max=16.28ms  p(90)=3.45µs  p(95)=4.17µs   p(99.9)=38.04µs
     http_req_connecting............: avg=460ns    min=0s      med=0s      max=4.57ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.23ms  min=1.95ms  med=23.98ms max=321.43ms p(90)=28.95ms p(95)=30.97ms  p(99.9)=51.96ms
       { expected_response:true }...: avg=24.23ms  min=1.95ms  med=23.98ms max=321.43ms p(90)=28.95ms p(95)=30.97ms  p(99.9)=51.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245337
     http_req_receiving.............: avg=114.73µs min=29.89µs med=58.17µs max=142.42ms p(90)=97.46µs p(95)=156.35µs p(99.9)=7.53ms 
     http_req_sending...............: avg=41.17µs  min=5.24µs  med=9.77µs  max=238.9ms  p(90)=16.17µs p(95)=88.95µs  p(99.9)=2.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.07ms  min=1.85ms  med=23.87ms max=191.72ms p(90)=28.8ms  p(95)=30.74ms  p(99.9)=50.76ms
     http_reqs......................: 245337  2040.122411/s
     iteration_duration.............: avg=24.45ms  min=3.93ms  med=24.19ms max=338.81ms p(90)=29.16ms p(95)=31.19ms  p(99.9)=52.51ms
     iterations.....................: 245237  2039.290852/s
     success_rate...................: 100.00% ✓ 245237      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 440676      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3µs     min=990ns   med=2.1µs   max=4.23ms   p(90)=3.41µs  p(95)=4.03µs   p(99.9)=34.2µs 
     http_req_connecting............: avg=564ns   min=0s      med=0s      max=4.2ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.6ms  min=2.18ms  med=40.07ms max=298.95ms p(90)=57.41ms p(95)=62.54ms  p(99.9)=86.69ms
       { expected_response:true }...: avg=40.6ms  min=2.18ms  med=40.07ms max=298.95ms p(90)=57.41ms p(95)=62.54ms  p(99.9)=86.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146992
     http_req_receiving.............: avg=77.34µs min=28.81µs med=60.01µs max=45.89ms  p(90)=95.07µs p(95)=112.12µs p(99.9)=1.74ms 
     http_req_sending...............: avg=27.11µs min=5.06µs  med=9.9µs   max=132.58ms p(90)=15.23µs p(95)=18.98µs  p(99.9)=1.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.5ms  min=2.07ms  med=39.98ms max=297.8ms  p(90)=57.29ms p(95)=62.43ms  p(99.9)=86.09ms
     http_reqs......................: 146992  1222.035251/s
     iteration_duration.............: avg=40.83ms min=3.69ms  med=40.27ms max=325.92ms p(90)=57.61ms p(95)=62.75ms  p(99.9)=87.46ms
     iterations.....................: 146892  1221.20389/s
     success_rate...................: 100.00% ✓ 146892      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 201855     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   671 kB/s
     http_req_blocked...............: avg=3.92µs  min=1.12µs  med=2.59µs  max=3.79ms   p(90)=4.21µs   p(95)=4.79µs   p(99.9)=46.89µs 
     http_req_connecting............: avg=936ns   min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.82ms min=4.21ms  med=87.29ms max=326.24ms p(90)=112.2ms  p(95)=124.88ms p(99.9)=220.54ms
       { expected_response:true }...: avg=88.82ms min=4.21ms  med=87.29ms max=326.24ms p(90)=112.2ms  p(95)=124.88ms p(99.9)=220.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67385
     http_req_receiving.............: avg=86.19µs min=32.07µs med=74.2µs  max=126.07ms p(90)=109.51µs p(95)=122.71µs p(99.9)=866.93µs
     http_req_sending...............: avg=23.98µs min=5.35µs  med=12.38µs max=132.46ms p(90)=19.01µs  p(95)=21.24µs  p(99.9)=756.11µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.71ms min=4.1ms   med=87.18ms max=300.97ms p(90)=112.1ms  p(95)=124.78ms p(99.9)=220.27ms
     http_reqs......................: 67385   558.851632/s
     iteration_duration.............: avg=89.19ms min=15.21ms med=87.55ms max=335.49ms p(90)=112.45ms p(95)=125.15ms p(99.9)=222.77ms
     iterations.....................: 67285   558.02229/s
     success_rate...................: 100.00% ✓ 67285      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 159309     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   529 kB/s
     http_req_blocked...............: avg=5.4µs    min=1.2µs   med=3.24µs   max=4.24ms   p(90)=4.71µs   p(95)=5.28µs   p(99.9)=98.32µs 
     http_req_connecting............: avg=1.97µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.56ms min=5.26ms  med=112.35ms max=361.65ms p(90)=135.59ms p(95)=142.47ms p(99.9)=176.56ms
       { expected_response:true }...: avg=112.56ms min=5.26ms  med=112.35ms max=361.65ms p(90)=135.59ms p(95)=142.47ms p(99.9)=176.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53203
     http_req_receiving.............: avg=91.25µs  min=30.3µs  med=83.3µs   max=104.77ms p(90)=114.76µs p(95)=127.16µs p(99.9)=773.61µs
     http_req_sending...............: avg=27.4µs   min=5.7µs   med=15.12µs  max=102.57ms p(90)=20.61µs  p(95)=22.52µs  p(99.9)=636.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.44ms min=5.15ms  med=112.23ms max=361.06ms p(90)=135.48ms p(95)=142.36ms p(99.9)=176.31ms
     http_reqs......................: 53203   440.901244/s
     iteration_duration.............: avg=113.02ms min=18.84ms med=112.62ms max=370.44ms p(90)=135.84ms p(95)=142.73ms p(99.9)=177.75ms
     iterations.....................: 53103   440.072529/s
     success_rate...................: 100.00% ✓ 53103      ✗ 0    
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

     checks.........................: 100.00% ✓ 89964      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   298 kB/s
     http_req_blocked...............: avg=5.93µs   min=1.17µs  med=3.23µs   max=3.65ms   p(90)=4.48µs   p(95)=5µs      p(99.9)=1.02ms  
     http_req_connecting............: avg=2.55µs   min=0s      med=0s       max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=199.28ms min=8.31ms  med=217.58ms max=379.17ms p(90)=257.53ms p(95)=263.26ms p(99.9)=347.36ms
       { expected_response:true }...: avg=199.28ms min=8.31ms  med=217.58ms max=379.17ms p(90)=257.53ms p(95)=263.26ms p(99.9)=347.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30088
     http_req_receiving.............: avg=94.37µs  min=35.1µs  med=89.49µs  max=11.29ms  p(90)=120.52µs p(95)=132.71µs p(99.9)=644.8µs 
     http_req_sending...............: avg=25.43µs  min=5.51µs  med=16.26µs  max=69.26ms  p(90)=20.99µs  p(95)=22.75µs  p(99.9)=906.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.16ms min=8.18ms  med=217.46ms max=378.86ms p(90)=257.41ms p(95)=263.11ms p(99.9)=347.28ms
     http_reqs......................: 30088   248.523292/s
     iteration_duration.............: avg=200.21ms min=37.47ms med=218.19ms max=414.85ms p(90)=257.8ms  p(95)=263.63ms p(99.9)=349.96ms
     iterations.....................: 29988   247.697304/s
     success_rate...................: 100.00% ✓ 29988      ✗ 0    
     vus............................: 30      min=30       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85299      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=7.71µs   min=1.19µs  med=3.55µs   max=4.72ms   p(90)=5µs      p(95)=5.66µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.9µs    min=0s      med=0s       max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=210.18ms min=6.47ms  med=192.12ms max=750.94ms p(90)=252.59ms p(95)=413.43ms p(99.9)=622.72ms
       { expected_response:true }...: avg=210.18ms min=6.47ms  med=192.12ms max=750.94ms p(90)=252.59ms p(95)=413.43ms p(99.9)=622.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28533
     http_req_receiving.............: avg=104.43µs min=37.13µs med=97.45µs  max=82.95ms  p(90)=130.38µs p(95)=144.21µs p(99.9)=563.56µs
     http_req_sending...............: avg=41.26µs  min=6.37µs  med=17.45µs  max=111.47ms p(90)=22.57µs  p(95)=24.45µs  p(99.9)=581.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.03ms min=6.33ms  med=191.99ms max=750.85ms p(90)=252.45ms p(95)=413.32ms p(99.9)=622.25ms
     http_reqs......................: 28533   235.508245/s
     iteration_duration.............: avg=211.21ms min=34.55ms med=192.52ms max=751.11ms p(90)=253.28ms p(95)=415.35ms p(99.9)=623.06ms
     iterations.....................: 28433   234.682856/s
     success_rate...................: 100.00% ✓ 28433      ✗ 0    
     vus............................: 25      min=25       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 842010      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=3.03µs   min=972ns  med=2.21µs  max=15.19ms  p(90)=3.64µs   p(95)=4.43µs   p(99.9)=32.09µs
     http_req_connecting............: avg=286ns    min=0s     med=0s      max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.14ms  min=1.77ms med=20.71ms max=356.99ms p(90)=29.28ms  p(95)=32.25ms  p(99.9)=54.67ms
       { expected_response:true }...: avg=21.14ms  min=1.77ms med=20.71ms max=356.99ms p(90)=29.28ms  p(95)=32.25ms  p(99.9)=54.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280770
     http_req_receiving.............: avg=111.92µs min=28µs   med=55.55µs max=32.48ms  p(90)=101.64µs p(95)=247.02µs p(99.9)=9.25ms 
     http_req_sending...............: avg=50.03µs  min=5.22µs med=9.8µs   max=166.05ms p(90)=17.46µs  p(95)=122.72µs p(99.9)=4.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.97ms  min=1.68ms med=20.58ms max=356.03ms p(90)=29.08ms  p(95)=31.99ms  p(99.9)=53.91ms
     http_reqs......................: 280770  2335.230055/s
     iteration_duration.............: avg=21.36ms  min=3.38ms med=20.92ms max=370.75ms p(90)=29.5ms   p(95)=32.49ms  p(99.9)=55.16ms
     iterations.....................: 280670  2334.398331/s
     success_rate...................: 100.00% ✓ 280670      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 697227      ✗ 0     
     data_received..................: 20 GB   170 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=3.05µs   min=982ns   med=2.2µs    max=11.51ms  p(90)=3.65µs  p(95)=4.37µs   p(99.9)=35.39µs 
     http_req_connecting............: avg=361ns    min=0s      med=0s       max=3.59ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.56ms  min=1.96ms  med=17.24ms  max=616.83ms p(90)=54.67ms p(95)=71.99ms  p(99.9)=197.96ms
       { expected_response:true }...: avg=25.56ms  min=1.96ms  med=17.24ms  max=616.83ms p(90)=54.67ms p(95)=71.99ms  p(99.9)=197.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232509
     http_req_receiving.............: avg=688.09µs min=52.42µs med=109.13µs max=228.7ms  p(90)=1.11ms  p(95)=1.75ms   p(99.9)=59.39ms 
     http_req_sending...............: avg=42.13µs  min=5.17µs  med=9.57µs   max=163.6ms  p(90)=17.56µs p(95)=103.73µs p(99.9)=2.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.83ms  min=1.83ms  med=16.67ms  max=616.76ms p(90)=53.36ms p(95)=70.57ms  p(99.9)=194.52ms
     http_reqs......................: 232509  1933.574635/s
     iteration_duration.............: avg=25.8ms   min=2.72ms  med=17.46ms  max=616.97ms p(90)=54.92ms p(95)=72.27ms  p(99.9)=200.64ms
     iterations.....................: 232409  1932.743022/s
     success_rate...................: 100.00% ✓ 232409      ✗ 0     
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

     checks.........................: 100.00% ✓ 549435      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.65µs  min=962ns   med=2.33µs  max=13.8ms   p(90)=4.59µs   p(95)=5.8µs    p(99.9)=44.1µs 
     http_req_connecting............: avg=610ns   min=0s      med=0s      max=4.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.47ms min=2.32ms  med=31.54ms max=272.97ms p(90)=43.25ms  p(95)=48.09ms  p(99.9)=88.79ms
       { expected_response:true }...: avg=32.47ms min=2.32ms  med=31.54ms max=272.97ms p(90)=43.25ms  p(95)=48.09ms  p(99.9)=88.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183245
     http_req_receiving.............: avg=111.5µs min=30.47µs med=60.89µs max=31.78ms  p(90)=133.15µs p(95)=281.05µs p(99.9)=6.01ms 
     http_req_sending...............: avg=46.43µs min=5.18µs  med=10.21µs max=105.39ms p(90)=23.98µs  p(95)=134.19µs p(99.9)=3.57ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.31ms min=2.2ms   med=31.41ms max=272.48ms p(90)=43.05ms  p(95)=47.86ms  p(99.9)=88.2ms 
     http_reqs......................: 183245  1523.298923/s
     iteration_duration.............: avg=32.74ms min=4.83ms  med=31.78ms max=361.78ms p(90)=43.48ms  p(95)=48.33ms  p(99.9)=90.15ms
     iterations.....................: 183145  1522.467632/s
     success_rate...................: 100.00% ✓ 183145      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 402147      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 161 MB  1.3 MB/s
     http_req_blocked...............: avg=3.28µs   min=1.04µs  med=2.2µs   max=3.99ms   p(90)=3.63µs   p(95)=4.26µs   p(99.9)=38.38µs
     http_req_connecting............: avg=730ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.51ms  min=2.3ms   med=44.01ms max=320.49ms p(90)=62.64ms  p(95)=68.23ms  p(99.9)=94.37ms
       { expected_response:true }...: avg=44.51ms  min=2.3ms   med=44.01ms max=320.49ms p(90)=62.64ms  p(95)=68.23ms  p(99.9)=94.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134149
     http_req_receiving.............: avg=122.92µs min=29.39µs med=64.8µs  max=276.8ms  p(90)=101.63µs p(95)=119.05µs p(99.9)=1.77ms 
     http_req_sending...............: avg=25.26µs  min=5.2µs   med=10.54µs max=87.46ms  p(90)=16.55µs  p(95)=20.04µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.36ms  min=2.18ms  med=43.9ms  max=159.18ms p(90)=62.51ms  p(95)=68.09ms  p(99.9)=92.58ms
     http_reqs......................: 134149  1115.155896/s
     iteration_duration.............: avg=44.75ms  min=3.69ms  med=44.22ms max=365.73ms p(90)=62.84ms  p(95)=68.44ms  p(99.9)=94.85ms
     iterations.....................: 134049  1114.324615/s
     success_rate...................: 100.00% ✓ 134049      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 192816     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   641 kB/s
     http_req_blocked...............: avg=4.87µs   min=1.14µs  med=2.99µs  max=4.35ms   p(90)=4.55µs   p(95)=5.14µs   p(99.9)=48.53µs 
     http_req_connecting............: avg=1.64µs   min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.98ms  min=4.07ms  med=90.74ms max=368.57ms p(90)=113.34ms p(95)=124.68ms p(99.9)=227.72ms
       { expected_response:true }...: avg=92.98ms  min=4.07ms  med=90.74ms max=368.57ms p(90)=113.34ms p(95)=124.68ms p(99.9)=227.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64372
     http_req_receiving.............: avg=164.88µs min=32.85µs med=80.97µs max=300.16ms p(90)=115.4µs  p(95)=128.29µs p(99.9)=1.01ms  
     http_req_sending...............: avg=25.83µs  min=5.56µs  med=13.79µs max=141.2ms  p(90)=20.23µs  p(95)=22.4µs   p(99.9)=822.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.79ms  min=3.94ms  med=90.62ms max=254.03ms p(90)=113.18ms p(95)=124.38ms p(99.9)=224.82ms
     http_reqs......................: 64372   533.951192/s
     iteration_duration.............: avg=93.36ms  min=20.13ms med=90.99ms max=378.96ms p(90)=113.6ms  p(95)=125.01ms p(99.9)=230.01ms
     iterations.....................: 64272   533.121714/s
     success_rate...................: 100.00% ✓ 64272      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 136887     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   455 kB/s
     http_req_blocked...............: avg=5.93µs   min=1.21µs  med=3.44µs   max=4.41ms   p(90)=4.9µs    p(95)=5.48µs   p(99.9)=249.58µs
     http_req_connecting............: avg=2.23µs   min=0s      med=0s       max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=133.67µs
     http_req_duration..............: avg=130.98ms min=5.66ms  med=128.5ms  max=347.86ms p(90)=173.89ms p(95)=187.13ms p(99.9)=239.61ms
       { expected_response:true }...: avg=130.98ms min=5.66ms  med=128.5ms  max=347.86ms p(90)=173.89ms p(95)=187.13ms p(99.9)=239.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45729
     http_req_receiving.............: avg=90.93µs  min=33.58µs med=85.52µs  max=26.22ms  p(90)=117.66µs p(95)=129.71µs p(99.9)=639.33µs
     http_req_sending...............: avg=26.79µs  min=6µs     med=15.88µs  max=139.09ms p(90)=21.34µs  p(95)=23.14µs  p(99.9)=637.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.86ms min=5.54ms  med=128.39ms max=345.55ms p(90)=173.75ms p(95)=186.99ms p(99.9)=239.48ms
     http_reqs......................: 45729   378.748048/s
     iteration_duration.............: avg=131.54ms min=17.43ms med=128.82ms max=365.34ms p(90)=174.17ms p(95)=187.47ms p(99.9)=242.83ms
     iterations.....................: 45629   377.919803/s
     success_rate...................: 100.00% ✓ 45629      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 85989      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.3µs   med=3.46µs   max=4.12ms   p(90)=4.82µs   p(95)=5.4µs    p(99.9)=714µs   
     http_req_connecting............: avg=2.15µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=653.14µs
     http_req_duration..............: avg=208.49ms min=6.46ms  med=189.98ms max=812.11ms p(90)=236.85ms p(95)=284.91ms p(99.9)=687.64ms
       { expected_response:true }...: avg=208.49ms min=6.46ms  med=189.98ms max=812.11ms p(90)=236.85ms p(95)=284.91ms p(99.9)=687.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28763
     http_req_receiving.............: avg=100.19µs min=34.42µs med=95.24µs  max=33.05ms  p(90)=126.49µs p(95)=139.66µs p(99.9)=548.78µs
     http_req_sending...............: avg=24.38µs  min=6.24µs  med=17.09µs  max=50.96ms  p(90)=21.8µs   p(95)=23.5µs   p(99.9)=686.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.36ms min=6.36ms  med=189.87ms max=811.99ms p(90)=236.69ms p(95)=284.77ms p(99.9)=687.55ms
     http_reqs......................: 28763   237.612798/s
     iteration_duration.............: avg=209.47ms min=81.75ms med=190.32ms max=812.35ms p(90)=237.34ms p(95)=286.12ms p(99.9)=688.13ms
     iterations.....................: 28663   236.786692/s
     success_rate...................: 100.00% ✓ 28663      ✗ 0    
     vus............................: 25      min=25       max=50 
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

     checks.........................: 100.00% ✓ 85362      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=5.39µs   min=1.15µs  med=3.3µs    max=2.86ms   p(90)=4.57µs   p(95)=5.07µs   p(99.9)=670.07µs
     http_req_connecting............: avg=1.92µs   min=0s      med=0s       max=2.84ms   p(90)=0s       p(95)=0s       p(99.9)=635.27µs
     http_req_duration..............: avg=210ms    min=8.82ms  med=209.24ms max=397.39ms p(90)=224.06ms p(95)=228.21ms p(99.9)=303.42ms
       { expected_response:true }...: avg=210ms    min=8.82ms  med=209.24ms max=397.39ms p(90)=224.06ms p(95)=228.21ms p(99.9)=303.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28554
     http_req_receiving.............: avg=97.14µs  min=34.67µs med=93.01µs  max=4.25ms   p(90)=124.37µs p(95)=136.85µs p(99.9)=431.34µs
     http_req_sending...............: avg=19.95µs  min=5.92µs  med=16.42µs  max=22.29ms  p(90)=20.91µs  p(95)=22.59µs  p(99.9)=431.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.89ms min=8.67ms  med=209.13ms max=397.18ms p(90)=223.95ms p(95)=228.1ms  p(99.9)=303.32ms
     http_reqs......................: 28554   235.774182/s
     iteration_duration.............: avg=210.98ms min=65.12ms med=209.58ms max=403.36ms p(90)=224.31ms p(95)=228.5ms  p(99.9)=304.09ms
     iterations.....................: 28454   234.948469/s
     success_rate...................: 100.00% ✓ 28454      ✗ 0    
     vus............................: 40      min=40       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

