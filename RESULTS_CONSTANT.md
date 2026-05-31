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
| hive-router | v0.0.49 | 2,937 | 3,154 | 2,888 | 3.1% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,117 | 2,178 | 2,111 | 1.1% |  |
| grafbase | 0.53.3 | 1,990 | 2,056 | 1,961 | 1.5% |  |
| cosmo | 0.307.0 | 1,245 | 1,262 | 1,232 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 539 | 550 | 534 | 1.0% |  |
| apollo-router | v2.13.1 | 433 | 442 | 429 | 1.1% |  |
| apollo-gateway | 2.13.3 | 241 | 243 | 240 | 0.5% |  |
| hive-gateway | 2.5.25 | 235 | 239 | 233 | 0.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,421 | 2,548 | 2,388 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,939 | 1,995 | 1,922 | 1.3% |  |
| grafbase | 0.53.3 | 1,564 | 1,592 | 1,554 | 0.7% |  |
| cosmo | 0.307.0 | 1,180 | 1,205 | 1,175 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 504 | 517 | 499 | 1.2% |  |
| apollo-router | v2.13.1 | 400 | 410 | 396 | 1.1% |  |
| apollo-gateway | 2.13.3 | 234 | 237 | 232 | 0.7% |  |
| hive-gateway | 2.5.25 | 229 | 233 | 226 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1059027     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 424 MB  3.5 MB/s
     http_req_blocked...............: avg=3.03µs  min=1.05µs  med=2.23µs  max=13.17ms  p(90)=3.43µs  p(95)=4.07µs   p(99.9)=33.83µs
     http_req_connecting............: avg=295ns   min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.76ms min=1.62ms  med=15.85ms max=324.03ms p(90)=24.55ms p(95)=28.25ms  p(99.9)=50.63ms
       { expected_response:true }...: avg=16.76ms min=1.62ms  med=15.85ms max=324.03ms p(90)=24.55ms p(95)=28.25ms  p(99.9)=50.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 353109
     http_req_receiving.............: avg=138.8µs min=27.43µs med=50.88µs max=203.74ms p(90)=99.18µs p(95)=281.12µs p(99.9)=11.54ms
     http_req_sending...............: avg=60.33µs min=5.09µs  med=9.21µs  max=148.86ms p(90)=15.63µs p(95)=124.47µs p(99.9)=11.56ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.56ms min=1.54ms  med=15.7ms  max=136.45ms p(90)=24.28ms p(95)=27.87ms  p(99.9)=48.83ms
     http_reqs......................: 353109  2937.405574/s
     iteration_duration.............: avg=16.98ms min=2.22ms  med=16.06ms max=363.29ms p(90)=24.78ms p(95)=28.5ms   p(99.9)=51.79ms
     iterations.....................: 353009  2936.573705/s
     success_rate...................: 100.00% ✓ 353009      ✗ 0     
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

     checks.........................: 100.00% ✓ 763746      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=2.73µs  min=1.02µs med=2.01µs   max=7.08ms   p(90)=3.05µs   p(95)=3.59µs  p(99.9)=30.23µs 
     http_req_connecting............: avg=370ns   min=0s     med=0s       max=4.09ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.33ms min=2.39ms med=14.75ms  max=332.2ms  p(90)=52.65ms  p(95)=70.79ms p(99.9)=164.63ms
       { expected_response:true }...: avg=23.33ms min=2.39ms med=14.75ms  max=332.2ms  p(90)=52.65ms  p(95)=70.79ms p(99.9)=164.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 254682
     http_req_receiving.............: avg=655.9µs min=51µs   med=106.32µs max=189.82ms p(90)=951.47µs p(95)=1.48ms  p(99.9)=57.84ms 
     http_req_sending...............: avg=41.21µs min=4.85µs med=8.76µs   max=116.49ms p(90)=14.01µs  p(95)=98.41µs p(99.9)=3.16ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.63ms min=2.29ms med=14.22ms  max=318.39ms p(90)=51.26ms  p(95)=69.37ms p(99.9)=162.72ms
     http_reqs......................: 254682  2117.406052/s
     iteration_duration.............: avg=23.56ms min=3.31ms med=14.96ms  max=350.99ms p(90)=52.88ms  p(95)=71.05ms p(99.9)=166.03ms
     iterations.....................: 254582  2116.57466/s
     success_rate...................: 100.00% ✓ 254582      ✗ 0     
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

     checks.........................: 100.00% ✓ 717693      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.67µs   min=1.06µs  med=2.59µs  max=19.42ms  p(90)=3.95µs   p(95)=4.66µs  p(99.9)=42.43µs
     http_req_connecting............: avg=372ns    min=0s      med=0s      max=3.46ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=24.83ms  min=1.93ms  med=24.57ms max=319.54ms p(90)=29.84ms  p(95)=32.03ms p(99.9)=54.32ms
       { expected_response:true }...: avg=24.83ms  min=1.93ms  med=24.57ms max=319.54ms p(90)=29.84ms  p(95)=32.03ms p(99.9)=54.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239331
     http_req_receiving.............: avg=110.46µs min=30.57µs med=62.32µs max=135.6ms  p(90)=104.89µs p(95)=191.4µs p(99.9)=7.83ms 
     http_req_sending...............: avg=47.45µs  min=5.31µs  med=10.71µs max=222.5ms  p(90)=17.16µs  p(95)=118.1µs p(99.9)=3.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=24.67ms  min=1.84ms  med=24.45ms max=312.12ms p(90)=29.66ms  p(95)=31.77ms p(99.9)=53.48ms
     http_reqs......................: 239331  1990.09274/s
     iteration_duration.............: avg=25.07ms  min=3.8ms   med=24.78ms max=329.55ms p(90)=30.07ms  p(95)=32.28ms p(99.9)=55.07ms
     iterations.....................: 239231  1989.261216/s
     success_rate...................: 100.00% ✓ 239231      ✗ 0     
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

     checks.........................: 100.00% ✓ 449094      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.24µs  min=1.01µs  med=2.38µs  max=3.58ms   p(90)=3.62µs  p(95)=4.2µs    p(99.9)=34.61µs
     http_req_connecting............: avg=565ns   min=0s      med=0s      max=3.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.84ms min=2.15ms  med=39.27ms max=335.6ms  p(90)=56.35ms p(95)=61.55ms  p(99.9)=87.47ms
       { expected_response:true }...: avg=39.84ms min=2.15ms  med=39.27ms max=335.6ms  p(90)=56.35ms p(95)=61.55ms  p(99.9)=87.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149798
     http_req_receiving.............: avg=80.08µs min=28.56µs med=61.07µs max=25.18ms  p(90)=95.08µs p(95)=112.16µs p(99.9)=2.01ms 
     http_req_sending...............: avg=26.18µs min=4.95µs  med=10.24µs max=188.4ms  p(90)=15.05µs p(95)=19µs     p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.74ms min=2.06ms  med=39.17ms max=322.8ms  p(90)=56.24ms p(95)=61.43ms  p(99.9)=86.8ms 
     http_reqs......................: 149798  1245.32807/s
     iteration_duration.............: avg=40.07ms min=3.78ms  med=39.48ms max=346.53ms p(90)=56.55ms p(95)=61.75ms  p(99.9)=88.01ms
     iterations.....................: 149698  1244.496732/s
     success_rate...................: 100.00% ✓ 149698      ✗ 0     
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

     checks.........................: 100.00% ✓ 194748     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   648 kB/s
     http_req_blocked...............: avg=4.7µs   min=1.16µs  med=2.8µs   max=4.11ms   p(90)=4.39µs   p(95)=5.01µs   p(99.9)=47.9µs  
     http_req_connecting............: avg=1.57µs  min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.04ms min=4.1ms   med=89.78ms max=359.66ms p(90)=111.89ms p(95)=123.74ms p(99.9)=215.96ms
       { expected_response:true }...: avg=92.04ms min=4.1ms   med=89.78ms max=359.66ms p(90)=111.89ms p(95)=123.74ms p(99.9)=215.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65016
     http_req_receiving.............: avg=85.75µs min=30.91µs med=74.87µs max=191.98ms p(90)=109.39µs p(95)=121.64µs p(99.9)=885.28µs
     http_req_sending...............: avg=24.48µs min=5.54µs  med=12.68µs max=211.92ms p(90)=19.48µs  p(95)=21.81µs  p(99.9)=681.41µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.93ms min=3.99ms  med=89.68ms max=358.91ms p(90)=111.77ms p(95)=123.6ms  p(99.9)=215.69ms
     http_reqs......................: 65016   539.354304/s
     iteration_duration.............: avg=92.43ms min=26.52ms med=90.02ms max=384.99ms p(90)=112.15ms p(95)=124.02ms p(99.9)=219.84ms
     iterations.....................: 64916   538.524732/s
     success_rate...................: 100.00% ✓ 64916      ✗ 0    
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

     checks.........................: 100.00% ✓ 156489     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   520 kB/s
     http_req_blocked...............: avg=4.89µs   min=1.17µs  med=3.4µs    max=3.79ms   p(90)=4.84µs   p(95)=5.39µs   p(99.9)=140.16µs
     http_req_connecting............: avg=1.28µs   min=0s      med=0s       max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.52ms min=5.28ms  med=114.29ms max=272.25ms p(90)=138.35ms p(95)=145.35ms p(99.9)=173.8ms 
       { expected_response:true }...: avg=114.52ms min=5.28ms  med=114.29ms max=272.25ms p(90)=138.35ms p(95)=145.35ms p(99.9)=173.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 52263
     http_req_receiving.............: avg=109.11µs min=31.04µs med=81.76µs  max=132.01ms p(90)=113.89µs p(95)=125.96µs p(99.9)=972.31µs
     http_req_sending...............: avg=21.16µs  min=6.08µs  med=15.53µs  max=16.65ms  p(90)=21.19µs  p(95)=23µs     p(99.9)=604.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.39ms min=5.23ms  med=114.17ms max=195.13ms p(90)=138.24ms p(95)=145.25ms p(99.9)=173.4ms 
     http_reqs......................: 52263   433.025099/s
     iteration_duration.............: avg=115.06ms min=26.3ms  med=114.57ms max=374.02ms p(90)=138.67ms p(95)=145.71ms p(99.9)=180.01ms
     iterations.....................: 52163   432.196549/s
     success_rate...................: 100.00% ✓ 52163      ✗ 0    
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

     checks.........................: 100.00% ✓ 87585      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=6.89µs   min=1.29µs  med=3.11µs   max=3.9ms    p(90)=4.36µs   p(95)=4.88µs   p(99.9)=2ms     
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.98ms  
     http_req_duration..............: avg=204.7ms  min=8.56ms  med=207.68ms max=420.46ms p(90)=221.2ms  p(95)=231.98ms p(99.9)=294.25ms
       { expected_response:true }...: avg=204.7ms  min=8.56ms  med=207.68ms max=420.46ms p(90)=221.2ms  p(95)=231.98ms p(99.9)=294.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29295
     http_req_receiving.............: avg=186.29µs min=32.68µs med=85.53µs  max=135.93ms p(90)=117.64µs p(95)=128.78µs p(99.9)=34.49ms 
     http_req_sending...............: avg=31.3µs   min=6.08µs  med=15.15µs  max=165.27ms p(90)=20.49µs  p(95)=22.29µs  p(99.9)=633.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.49ms min=8.43ms  med=207.57ms max=299.43ms p(90)=221.06ms p(95)=231.83ms p(99.9)=293.77ms
     http_reqs......................: 29295   241.913339/s
     iteration_duration.............: avg=205.65ms min=26.17ms med=207.96ms max=448.72ms p(90)=221.51ms p(95)=232.27ms p(99.9)=298.31ms
     iterations.....................: 29195   241.087556/s
     success_rate...................: 100.00% ✓ 29195      ✗ 0    
     vus............................: 42      min=42       max=50 
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

     checks.........................: 100.00% ✓ 85200      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=7.35µs   min=1.29µs  med=3.43µs   max=3.84ms   p(90)=4.79µs   p(95)=5.39µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=210.39ms min=6.48ms  med=190.38ms max=690.72ms p(90)=244.21ms p(95)=467.35ms p(99.9)=607.4ms 
       { expected_response:true }...: avg=210.39ms min=6.48ms  med=190.38ms max=690.72ms p(90)=244.21ms p(95)=467.35ms p(99.9)=607.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28500
     http_req_receiving.............: avg=187.18µs min=36.73µs med=92.79µs  max=185.01ms p(90)=125.45µs p(95)=138.9µs  p(99.9)=4.13ms  
     http_req_sending...............: avg=31.88µs  min=6.59µs  med=16.93µs  max=148.71ms p(90)=22.14µs  p(95)=24.13µs  p(99.9)=569.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.17ms min=6.38ms  med=190.28ms max=690.57ms p(90)=243.66ms p(95)=467.21ms p(99.9)=607.31ms
     http_reqs......................: 28500   235.464864/s
     iteration_duration.............: avg=211.41ms min=54.21ms med=190.74ms max=690.98ms p(90)=244.86ms p(95)=468.34ms p(99.9)=608.14ms
     iterations.....................: 28400   234.638672/s
     success_rate...................: 100.00% ✓ 28400      ✗ 0    
     vus............................: 22      min=22       max=50 
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

     checks.........................: 100.00% ✓ 873285      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=3.92µs   min=1µs    med=2.3µs   max=19.93ms  p(90)=3.75µs  p(95)=4.56µs   p(99.9)=36.92µs
     http_req_connecting............: avg=918ns    min=0s     med=0s      max=9.7ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.37ms  min=1.83ms med=19.86ms max=309.82ms p(90)=28.22ms p(95)=31.42ms  p(99.9)=53.92ms
       { expected_response:true }...: avg=20.37ms  min=1.83ms med=19.86ms max=309.82ms p(90)=28.22ms p(95)=31.42ms  p(99.9)=53.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291195
     http_req_receiving.............: avg=118.32µs min=28.4µs med=54.02µs max=101.31ms p(90)=104µs   p(95)=264.5µs  p(99.9)=10.03ms
     http_req_sending...............: avg=57.75µs  min=5.03µs med=9.7µs   max=300.16ms p(90)=17.73µs p(95)=123.65µs p(99.9)=6.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.19ms  min=1.73ms med=19.72ms max=298.11ms p(90)=27.99ms p(95)=31.09ms  p(99.9)=53.08ms
     http_reqs......................: 291195  2421.994347/s
     iteration_duration.............: avg=20.6ms   min=3.65ms med=20.07ms max=342.46ms p(90)=28.44ms p(95)=31.68ms  p(99.9)=54.62ms
     iterations.....................: 291095  2421.162604/s
     success_rate...................: 100.00% ✓ 291095      ✗ 0     
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

     checks.........................: 100.00% ✓ 699180      ✗ 0     
     data_received..................: 20 GB   170 MB/s
     data_sent......................: 280 MB  2.3 MB/s
     http_req_blocked...............: avg=2.93µs   min=1µs    med=2.13µs   max=3.89ms   p(90)=3.43µs  p(95)=4.13µs  p(99.9)=32.31µs 
     http_req_connecting............: avg=444ns    min=0s     med=0s       max=3.86ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.49ms  min=1.88ms med=17.02ms  max=622.27ms p(90)=55.06ms p(95)=72.85ms p(99.9)=193.7ms 
       { expected_response:true }...: avg=25.49ms  min=1.88ms med=17.02ms  max=622.27ms p(90)=55.06ms p(95)=72.85ms p(99.9)=193.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 233160
     http_req_receiving.............: avg=687.35µs min=51.7µs med=109.97µs max=158.68ms p(90)=1.11ms  p(95)=1.73ms  p(99.9)=60.05ms 
     http_req_sending...............: avg=41.57µs  min=5.29µs med=9.39µs   max=225.88ms p(90)=17.09µs p(95)=106.6µs p(99.9)=2.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.77ms  min=1.75ms med=16.46ms  max=621.5ms  p(90)=53.81ms p(95)=71.51ms p(99.9)=190.22ms
     http_reqs......................: 233160  1939.230019/s
     iteration_duration.............: avg=25.73ms  min=2.51ms med=17.23ms  max=622.41ms p(90)=55.31ms p(95)=73.09ms p(99.9)=197.22ms
     iterations.....................: 233060  1938.398302/s
     success_rate...................: 100.00% ✓ 233060      ✗ 0     
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

     checks.........................: 100.00% ✓ 564252      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 226 MB  1.9 MB/s
     http_req_blocked...............: avg=3.16µs   min=962ns   med=2.33µs  max=2.35ms   p(90)=4.7µs    p(95)=5.88µs   p(99.9)=41.6µs 
     http_req_connecting............: avg=216ns    min=0s      med=0s      max=2.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.62ms  min=2.25ms  med=30.77ms max=321.93ms p(90)=42.05ms  p(95)=46.81ms  p(99.9)=87.12ms
       { expected_response:true }...: avg=31.62ms  min=2.25ms  med=30.77ms max=321.93ms p(90)=42.05ms  p(95)=46.81ms  p(99.9)=87.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188184
     http_req_receiving.............: avg=115.05µs min=30.27µs med=60.83µs max=238.16ms p(90)=133.47µs p(95)=275.53µs p(99.9)=7ms    
     http_req_sending...............: avg=45.37µs  min=5.37µs  med=10.26µs max=84.45ms  p(90)=24.14µs  p(95)=132.73µs p(99.9)=3.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.46ms  min=2.09ms  med=30.63ms max=321.51ms p(90)=41.86ms  p(95)=46.57ms  p(99.9)=86.6ms 
     http_reqs......................: 188184  1564.311167/s
     iteration_duration.............: avg=31.89ms  min=4.13ms  med=31.01ms max=352.7ms  p(90)=42.3ms   p(95)=47.06ms  p(99.9)=88.16ms
     iterations.....................: 188084  1563.4799/s
     success_rate...................: 100.00% ✓ 188084      ✗ 0     
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

     checks.........................: 100.00% ✓ 425790      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.27µs  min=1.1µs   med=2.47µs  max=3.21ms   p(90)=3.97µs   p(95)=4.6µs    p(99.9)=37.15µs
     http_req_connecting............: avg=449ns   min=0s      med=0s      max=3.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.02ms min=2.22ms  med=41.46ms max=312.6ms  p(90)=59.11ms  p(95)=64.57ms  p(99.9)=90.38ms
       { expected_response:true }...: avg=42.02ms min=2.22ms  med=41.46ms max=312.6ms  p(90)=59.11ms  p(95)=64.57ms  p(99.9)=90.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142030
     http_req_receiving.............: avg=86.04µs min=29.55µs med=65.87µs max=110.56ms p(90)=103.41µs p(95)=121.61µs p(99.9)=1.57ms 
     http_req_sending...............: avg=24.91µs min=5.47µs  med=11µs    max=52.24ms  p(90)=16.95µs  p(95)=20.66µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.91ms min=2.13ms  med=41.36ms max=312.19ms p(90)=58.99ms  p(95)=64.43ms  p(99.9)=90.23ms
     http_reqs......................: 142030  1180.799083/s
     iteration_duration.............: avg=42.26ms min=4.3ms   med=41.68ms max=341.73ms p(90)=59.31ms  p(95)=64.77ms  p(99.9)=91.03ms
     iterations.....................: 141930  1179.96771/s
     success_rate...................: 100.00% ✓ 141930      ✗ 0     
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

     checks.........................: 100.00% ✓ 182358     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   606 kB/s
     http_req_blocked...............: avg=4.66µs  min=1.1µs   med=2.8µs   max=3.94ms   p(90)=4.32µs   p(95)=4.86µs   p(99.9)=47.04µs 
     http_req_connecting............: avg=1.6µs   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.32ms min=4.24ms  med=95.44ms max=332.65ms p(90)=120.75ms p(95)=134.63ms p(99.9)=227.32ms
       { expected_response:true }...: avg=98.32ms min=4.24ms  med=95.44ms max=332.65ms p(90)=120.75ms p(95)=134.63ms p(99.9)=227.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60886
     http_req_receiving.............: avg=86.24µs min=31.39µs med=77.42µs max=77.38ms  p(90)=111.34µs p(95)=123.12µs p(99.9)=863.53µs
     http_req_sending...............: avg=25.46µs min=5.68µs  med=12.95µs max=151.29ms p(90)=19.47µs  p(95)=21.41µs  p(99.9)=682.99µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.2ms  min=4.17ms  med=95.33ms max=331.77ms p(90)=120.64ms p(95)=134.51ms p(99.9)=227.22ms
     http_reqs......................: 60886   504.954394/s
     iteration_duration.............: avg=98.72ms min=18.8ms  med=95.69ms max=341.94ms p(90)=121ms    p(95)=135ms    p(99.9)=229.77ms
     iterations.....................: 60786   504.12505/s
     success_rate...................: 100.00% ✓ 60786      ✗ 0    
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

     checks.........................: 100.00% ✓ 144825     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   481 kB/s
     http_req_blocked...............: avg=6.1µs    min=1.24µs  med=3.56µs   max=4.28ms   p(90)=5.1µs    p(95)=5.68µs   p(99.9)=391.33µs
     http_req_connecting............: avg=2.27µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=365.45µs
     http_req_duration..............: avg=123.8ms  min=5.95ms  med=121.29ms max=355.14ms p(90)=164.28ms p(95)=176.73ms p(99.9)=226.7ms 
       { expected_response:true }...: avg=123.8ms  min=5.95ms  med=121.29ms max=355.14ms p(90)=164.28ms p(95)=176.73ms p(99.9)=226.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48375
     http_req_receiving.............: avg=134.92µs min=32.9µs  med=86.97µs  max=154.36ms p(90)=118.38µs p(95)=130.64µs p(99.9)=1.9ms   
     http_req_sending...............: avg=30.58µs  min=5.63µs  med=16.62µs  max=159.84ms p(90)=21.87µs  p(95)=23.76µs  p(99.9)=699.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.63ms min=5.82ms  med=121.18ms max=245.54ms p(90)=164.16ms p(95)=176.62ms p(99.9)=220.04ms
     http_reqs......................: 48375   400.657354/s
     iteration_duration.............: avg=124.31ms min=13.19ms med=121.62ms max=367.71ms p(90)=164.6ms  p(95)=177.02ms p(99.9)=228.08ms
     iterations.....................: 48275   399.829121/s
     success_rate...................: 100.00% ✓ 48275      ✗ 0    
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

     checks.........................: 100.00% ✓ 85023      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   282 kB/s
     http_req_blocked...............: avg=6.54µs   min=1.32µs  med=3.37µs   max=3.74ms   p(90)=4.69µs   p(95)=5.22µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=210.85ms min=8.56ms  med=190.04ms max=428.96ms p(90)=298.46ms p(95)=308.37ms p(99.9)=385.65ms
       { expected_response:true }...: avg=210.85ms min=8.56ms  med=190.04ms max=428.96ms p(90)=298.46ms p(95)=308.37ms p(99.9)=385.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28441
     http_req_receiving.............: avg=168.62µs min=32.85µs med=91.39µs  max=219.46ms p(90)=123.61µs p(95)=136.75µs p(99.9)=948.15µs
     http_req_sending...............: avg=29.85µs  min=6.2µs   med=17.12µs  max=166.94ms p(90)=21.94µs  p(95)=23.76µs  p(99.9)=957.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.65ms min=8.41ms  med=189.92ms max=427.61ms p(90)=298.27ms p(95)=308.12ms p(99.9)=384.74ms
     http_reqs......................: 28441   234.823581/s
     iteration_duration.............: avg=211.87ms min=32.93ms med=190.35ms max=435.04ms p(90)=298.79ms p(95)=308.72ms p(99.9)=391.37ms
     iterations.....................: 28341   233.997929/s
     success_rate...................: 100.00% ✓ 28341      ✗ 0    
     vus............................: 43      min=43       max=50 
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

     checks.........................: 100.00% ✓ 82971      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   275 kB/s
     http_req_blocked...............: avg=7.37µs   min=1.28µs  med=3.46µs   max=4.13ms   p(90)=4.83µs   p(95)=5.41µs   p(99.9)=1.95ms  
     http_req_connecting............: avg=3.74µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.93ms  
     http_req_duration..............: avg=216.08ms min=6.75ms  med=199.52ms max=691.74ms p(90)=259.44ms p(95)=464.44ms p(99.9)=591.83ms
       { expected_response:true }...: avg=216.08ms min=6.75ms  med=199.52ms max=691.74ms p(90)=259.44ms p(95)=464.44ms p(99.9)=591.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27757
     http_req_receiving.............: avg=104.46µs min=34.88µs med=93.14µs  max=84.4ms   p(90)=124.28µs p(95)=137.64µs p(99.9)=699.35µs
     http_req_sending...............: avg=30.79µs  min=5.82µs  med=17.3µs   max=145.41ms p(90)=22.34µs  p(95)=24.06µs  p(99.9)=547.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.94ms min=6.6ms   med=199.4ms  max=691.64ms p(90)=259.3ms  p(95)=464.35ms p(99.9)=591.71ms
     http_reqs......................: 27757   229.401784/s
     iteration_duration.............: avg=217.13ms min=57.89ms med=199.88ms max=691.97ms p(90)=260.02ms p(95)=465.16ms p(99.9)=592.29ms
     iterations.....................: 27657   228.575319/s
     success_rate...................: 100.00% ✓ 27657      ✗ 0    
     vus............................: 2       min=2        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

