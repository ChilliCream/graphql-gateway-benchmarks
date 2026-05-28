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
| hive-router | v0.0.49 | 3,015 | 3,201 | 2,966 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,174 | 2,230 | 2,162 | 1.0% |  |
| grafbase | 0.53.3 | 2,050 | 2,115 | 2,031 | 1.4% |  |
| cosmo | 0.307.0 | 1,242 | 1,257 | 1,233 | 0.7% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 534 | 546 | 529 | 1.1% |  |
| apollo-router | v2.13.1 | 400 | 413 | 395 | 1.6% |  |
| hive-gateway | 2.5.25 | 246 | 251 | 244 | 1.0% |  |
| apollo-gateway | 2.13.3 | 243 | 246 | 241 | 0.7% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,505 | 2,637 | 2,476 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,006 | 2,049 | 1,923 | 1.7% |  |
| grafbase | 0.53.3 | 1,547 | 1,564 | 1,532 | 0.7% |  |
| cosmo | 0.307.0 | 1,176 | 1,199 | 1,167 | 1.0% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 506 | 520 | 501 | 1.2% |  |
| apollo-router | v2.13.1 | 368 | 381 | 364 | 1.7% |  |
| hive-gateway | 2.5.25 | 242 | 247 | 240 | 1.0% |  |
| apollo-gateway | 2.13.3 | 236 | 238 | 234 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1087278    ✗ 0     
     data_received..................: 32 GB   265 MB/s
     data_sent......................: 436 MB  3.6 MB/s
     http_req_blocked...............: avg=3.9µs   min=1.02µs  med=2.36µs  max=27.21ms  p(90)=3.58µs  p(95)=4.23µs   p(99.9)=35.8µs 
     http_req_connecting............: avg=730ns   min=0s      med=0s      max=9.35ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.3ms  min=1.61ms  med=15.16ms max=301.09ms p(90)=24.4ms  p(95)=29.12ms  p(99.9)=53.78ms
       { expected_response:true }...: avg=16.3ms  min=1.61ms  med=15.16ms max=301.09ms p(90)=24.4ms  p(95)=29.12ms  p(99.9)=53.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 362526
     http_req_receiving.............: avg=158.6µs min=27.01µs med=48.34µs max=159.48ms p(90)=99.65µs p(95)=299.37µs p(99.9)=15.7ms 
     http_req_sending...............: avg=69.59µs min=5.02µs  med=9.26µs  max=252.58ms p(90)=15.67µs p(95)=123.11µs p(99.9)=17.97ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.08ms min=1.52ms  med=15ms    max=292.68ms p(90)=24.03ms p(95)=28.56ms  p(99.9)=51.77ms
     http_reqs......................: 362526  3015.7476/s
     iteration_duration.............: avg=16.54ms min=2.15ms  med=15.36ms max=342.64ms p(90)=24.65ms p(95)=29.41ms  p(99.9)=55.42ms
     iterations.....................: 362426  3014.91573/s
     success_rate...................: 100.00% ✓ 362426     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 784407      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=2.85µs   min=992ns   med=2.34µs   max=2.87ms   p(90)=3.52µs   p(95)=4.12µs   p(99.9)=31.71µs 
     http_req_connecting............: avg=182ns    min=0s      med=0s       max=2.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.7ms   min=2.46ms  med=14.65ms  max=375.91ms p(90)=50.07ms  p(95)=68.33ms  p(99.9)=167.22ms
       { expected_response:true }...: avg=22.7ms   min=2.46ms  med=14.65ms  max=375.91ms p(90)=50.07ms  p(95)=68.33ms  p(99.9)=167.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261569
     http_req_receiving.............: avg=669.11µs min=50.73µs med=104.47µs max=265.41ms p(90)=973.66µs p(95)=1.53ms   p(99.9)=62.93ms 
     http_req_sending...............: avg=45.62µs  min=5.35µs  med=9.5µs    max=275.14ms p(90)=15.89µs  p(95)=115.54µs p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.99ms  min=2.32ms  med=14.14ms  max=375.62ms p(90)=48.66ms  p(95)=66.8ms   p(99.9)=162.81ms
     http_reqs......................: 261569  2174.286472/s
     iteration_duration.............: avg=22.93ms  min=3.25ms  med=14.87ms  max=376.15ms p(90)=50.29ms  p(95)=68.58ms  p(99.9)=168.41ms
     iterations.....................: 261469  2173.455225/s
     success_rate...................: 100.00% ✓ 261469      ✗ 0     
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

     checks.........................: 100.00% ✓ 739665      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 296 MB  2.5 MB/s
     http_req_blocked...............: avg=3.49µs   min=1.05µs med=2.65µs  max=4.28ms   p(90)=4.14µs   p(95)=4.94µs   p(99.9)=42.65µs
     http_req_connecting............: avg=420ns    min=0s     med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.08ms  min=2.01ms med=23.84ms max=322.57ms p(90)=29.06ms  p(95)=31.59ms  p(99.9)=54.73ms
       { expected_response:true }...: avg=24.08ms  min=2.01ms med=23.84ms max=322.57ms p(90)=29.06ms  p(95)=31.59ms  p(99.9)=54.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 246655
     http_req_receiving.............: avg=115.65µs min=29.1µs med=59.85µs max=179.9ms  p(90)=105.31µs p(95)=221.88µs p(99.9)=9.63ms 
     http_req_sending...............: avg=52.03µs  min=5.06µs med=10.96µs max=170.12ms p(90)=18.76µs  p(95)=125.11µs p(99.9)=4.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.91ms  min=1.9ms  med=23.72ms max=320.65ms p(90)=28.87ms  p(95)=31.28ms  p(99.9)=53.42ms
     http_reqs......................: 246655  2050.971607/s
     iteration_duration.............: avg=24.32ms  min=4.22ms med=24.06ms max=338.86ms p(90)=29.29ms  p(95)=31.84ms  p(99.9)=55.29ms
     iterations.....................: 246555  2050.140093/s
     success_rate...................: 100.00% ✓ 246555      ✗ 0     
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

     checks.........................: 100.00% ✓ 448014      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.01µs  min=982ns   med=2.4µs   max=4.45ms   p(90)=3.67µs  p(95)=4.25µs   p(99.9)=34.43µs
     http_req_connecting............: avg=278ns   min=0s      med=0s      max=2.21ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.94ms min=2.14ms  med=39.36ms max=317.02ms p(90)=56.37ms p(95)=61.58ms  p(99.9)=87.62ms
       { expected_response:true }...: avg=39.94ms min=2.14ms  med=39.36ms max=317.02ms p(90)=56.37ms p(95)=61.58ms  p(99.9)=87.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149438
     http_req_receiving.............: avg=80.56µs min=28.59µs med=61.3µs  max=40.04ms  p(90)=95.44µs p(95)=112.71µs p(99.9)=2ms    
     http_req_sending...............: avg=24.25µs min=5.37µs  med=10.43µs max=131.74ms p(90)=15.3µs  p(95)=19.1µs   p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.83ms min=2.05ms  med=39.26ms max=316.19ms p(90)=56.26ms p(95)=61.48ms  p(99.9)=87.39ms
     http_reqs......................: 149438  1242.479045/s
     iteration_duration.............: avg=40.17ms min=3.99ms  med=39.56ms max=340.29ms p(90)=56.56ms p(95)=61.78ms  p(99.9)=88.32ms
     iterations.....................: 149338  1241.647611/s
     success_rate...................: 100.00% ✓ 149338      ✗ 0     
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

     checks.........................: 100.00% ✓ 192948     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 77 MB   642 kB/s
     http_req_blocked...............: avg=3.79µs   min=1.06µs  med=2.88µs  max=2.12ms   p(90)=4.38µs   p(95)=5.01µs   p(99.9)=59.83µs 
     http_req_connecting............: avg=601ns    min=0s      med=0s      max=2.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.94ms  min=4.18ms  med=91.15ms max=341.49ms p(90)=116.28ms p(95)=129.46ms p(99.9)=224.92ms
       { expected_response:true }...: avg=92.94ms  min=4.18ms  med=91.15ms max=341.49ms p(90)=116.28ms p(95)=129.46ms p(99.9)=224.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64416
     http_req_receiving.............: avg=147.16µs min=31.66µs med=75.87µs max=200.3ms  p(90)=109.11µs p(95)=121.37µs p(99.9)=1.3ms   
     http_req_sending...............: avg=21.47µs  min=5.72µs  med=13.17µs max=53.28ms  p(90)=19.82µs  p(95)=21.98µs  p(99.9)=675.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.77ms  min=4.08ms  med=91.05ms max=250.79ms p(90)=116.15ms p(95)=129.24ms p(99.9)=222.89ms
     http_reqs......................: 64416   534.228601/s
     iteration_duration.............: avg=93.3ms   min=6.35ms  med=91.39ms max=356.5ms  p(90)=116.53ms p(95)=129.77ms p(99.9)=225.93ms
     iterations.....................: 64316   533.39926/s
     success_rate...................: 100.00% ✓ 64316      ✗ 0    
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

     checks.........................: 100.00% ✓ 144702     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   481 kB/s
     http_req_blocked...............: avg=5.36µs   min=1.12µs  med=3.31µs   max=4.23ms   p(90)=4.71µs   p(95)=5.23µs   p(99.9)=177.07µs
     http_req_connecting............: avg=1.78µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=100.47µs
     http_req_duration..............: avg=123.91ms min=5.41ms  med=123.62ms max=380.32ms p(90)=150ms    p(95)=157.66ms p(99.9)=197.78ms
       { expected_response:true }...: avg=123.91ms min=5.41ms  med=123.62ms max=380.32ms p(90)=150ms    p(95)=157.66ms p(99.9)=197.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48334
     http_req_receiving.............: avg=93.06µs  min=32.95µs med=83.72µs  max=155.36ms p(90)=115.83µs p(95)=127.86µs p(99.9)=736.64µs
     http_req_sending...............: avg=31.37µs  min=5.72µs  med=15.22µs  max=125.76ms p(90)=20.81µs  p(95)=22.61µs  p(99.9)=889.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.79ms min=5.34ms  med=123.52ms max=379.32ms p(90)=149.89ms p(95)=157.51ms p(99.9)=196.75ms
     http_reqs......................: 48334   400.473843/s
     iteration_duration.............: avg=124.43ms min=19.72ms med=123.91ms max=396.36ms p(90)=150.27ms p(95)=157.92ms p(99.9)=199.62ms
     iterations.....................: 48234   399.645288/s
     success_rate...................: 100.00% ✓ 48234      ✗ 0    
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

     checks.........................: 100.00% ✓ 89307      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=5.63µs   min=1.25µs  med=3.37µs   max=3.17ms   p(90)=4.66µs   p(95)=5.24µs   p(99.9)=784.72µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=3.14ms   p(90)=0s       p(95)=0s       p(99.9)=756.68µs
     http_req_duration..............: avg=200.74ms min=6.25ms  med=186.03ms max=686.72ms p(90)=241.79ms p(95)=394.94ms p(99.9)=568.69ms
       { expected_response:true }...: avg=200.74ms min=6.25ms  med=186.03ms max=686.72ms p(90)=241.79ms p(95)=394.94ms p(99.9)=568.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29869
     http_req_receiving.............: avg=101.61µs min=35.98µs med=92.06µs  max=84.2ms   p(90)=124.3µs  p(95)=137.49µs p(99.9)=571.83µs
     http_req_sending...............: avg=27.64µs  min=6.4µs   med=16.84µs  max=71.88ms  p(90)=21.99µs  p(95)=23.94µs  p(99.9)=841.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.61ms min=6.16ms  med=185.92ms max=686.6ms  p(90)=241.67ms p(95)=394.83ms p(99.9)=568.54ms
     http_reqs......................: 29869   246.784606/s
     iteration_duration.............: avg=201.7ms  min=55.32ms med=186.42ms max=686.91ms p(90)=242.36ms p(95)=396.68ms p(99.9)=569.03ms
     iterations.....................: 29769   245.958383/s
     success_rate...................: 100.00% ✓ 29769      ✗ 0    
     vus............................: 20      min=20       max=50 
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

     checks.........................: 100.00% ✓ 87945      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=6.76µs   min=1.19µs  med=3.25µs   max=3.89ms   p(90)=4.45µs   p(95)=4.95µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.33µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=203.82ms min=8.3ms   med=209.67ms max=436.14ms p(90)=222.28ms p(95)=231.99ms p(99.9)=296.29ms
       { expected_response:true }...: avg=203.82ms min=8.3ms   med=209.67ms max=436.14ms p(90)=222.28ms p(95)=231.99ms p(99.9)=296.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29415
     http_req_receiving.............: avg=95.12µs  min=34.69µs med=88.46µs  max=70.67ms  p(90)=119.31µs p(95)=130.98µs p(99.9)=612.79µs
     http_req_sending...............: avg=31.87µs  min=5.88µs  med=15.99µs  max=123.83ms p(90)=20.72µs  p(95)=22.36µs  p(99.9)=578.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.7ms  min=8.23ms  med=209.57ms max=435.99ms p(90)=222.15ms p(95)=231.84ms p(99.9)=296.17ms
     http_reqs......................: 29415   243.009488/s
     iteration_duration.............: avg=204.78ms min=29.09ms med=209.96ms max=447.17ms p(90)=222.56ms p(95)=232.37ms p(99.9)=298.29ms
     iterations.....................: 29315   242.183347/s
     success_rate...................: 100.00% ✓ 29315      ✗ 0    
     vus............................: 25      min=25       max=50 
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

     checks.........................: 100.00% ✓ 903294      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=3.41µs   min=982ns   med=2.68µs  max=9.89ms   p(90)=4.27µs   p(95)=5.15µs   p(99.9)=40.33µs
     http_req_connecting............: avg=226ns    min=0s      med=0s      max=3.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.67ms  min=1.89ms  med=19.02ms max=321.34ms p(90)=27.34ms  p(95)=30.74ms  p(99.9)=53.45ms
       { expected_response:true }...: avg=19.67ms  min=1.89ms  med=19.02ms max=321.34ms p(90)=27.34ms  p(95)=30.74ms  p(99.9)=53.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301198
     http_req_receiving.............: avg=123.48µs min=27.55µs med=55.97µs max=113.87ms p(90)=114.52µs p(95)=296.08µs p(99.9)=9.05ms 
     http_req_sending...............: avg=59.83µs  min=5.25µs  med=10.58µs max=116.89ms p(90)=19.84µs  p(95)=135.59µs p(99.9)=7.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.49ms  min=1.79ms  med=18.87ms max=320.85ms p(90)=27.11ms  p(95)=30.4ms   p(99.9)=52.49ms
     http_reqs......................: 301198  2505.054177/s
     iteration_duration.............: avg=19.91ms  min=3.53ms  med=19.24ms max=333.44ms p(90)=27.57ms  p(95)=30.99ms  p(99.9)=54.12ms
     iterations.....................: 301098  2504.22248/s
     success_rate...................: 100.00% ✓ 301098      ✗ 0     
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

     checks.........................: 100.00% ✓ 723372      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=3.53µs   min=1.05µs  med=2.54µs   max=15.86ms  p(90)=3.95µs  p(95)=4.7µs    p(99.9)=37.16µs 
     http_req_connecting............: avg=423ns    min=0s      med=0s       max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.63ms  min=1.88ms  med=17.11ms  max=550.97ms p(90)=51.16ms p(95)=67.64ms  p(99.9)=190.76ms
       { expected_response:true }...: avg=24.63ms  min=1.88ms  med=17.11ms  max=550.97ms p(90)=51.16ms p(95)=67.64ms  p(99.9)=190.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241224
     http_req_receiving.............: avg=669.04µs min=50.78µs med=106.23µs max=181.45ms p(90)=1.13ms  p(95)=1.84ms   p(99.9)=55.4ms  
     http_req_sending...............: avg=48.59µs  min=5.33µs  med=10.2µs   max=285.86ms p(90)=18.62µs p(95)=119.07µs p(99.9)=3.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.91ms  min=1.75ms  med=16.56ms  max=550.89ms p(90)=49.85ms p(95)=66.15ms  p(99.9)=188.73ms
     http_reqs......................: 241224  2006.262855/s
     iteration_duration.............: avg=24.87ms  min=2.54ms  med=17.33ms  max=551.18ms p(90)=51.4ms  p(95)=67.88ms  p(99.9)=195.1ms 
     iterations.....................: 241124  2005.431153/s
     success_rate...................: 100.00% ✓ 241124      ✗ 0     
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

     checks.........................: 100.00% ✓ 558087      ✗ 0     
     data_received..................: 16 GB   136 MB/s
     data_sent......................: 224 MB  1.9 MB/s
     http_req_blocked...............: avg=3.74µs   min=992ns   med=2.63µs  max=4.59ms   p(90)=4.99µs   p(95)=6.14µs   p(99.9)=43.87µs
     http_req_connecting............: avg=533ns    min=0s      med=0s      max=4.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.97ms  min=2.44ms  med=31.08ms max=323.73ms p(90)=42.44ms  p(95)=47.1ms   p(99.9)=91.21ms
       { expected_response:true }...: avg=31.97ms  min=2.44ms  med=31.08ms max=323.73ms p(90)=42.44ms  p(95)=47.1ms   p(99.9)=91.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 186129
     http_req_receiving.............: avg=117.51µs min=30.24µs med=63.53µs max=179.15ms p(90)=137.75µs p(95)=293.35µs p(99.9)=5.86ms 
     http_req_sending...............: avg=51.4µs   min=5.04µs  med=10.99µs max=187.04ms p(90)=25µs     p(95)=141.4µs  p(99.9)=3.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.8ms   min=2.32ms  med=30.95ms max=323.42ms p(90)=42.25ms  p(95)=46.85ms  p(99.9)=90.74ms
     http_reqs......................: 186129  1547.051815/s
     iteration_duration.............: avg=32.24ms  min=4.16ms  med=31.32ms max=357.37ms p(90)=42.69ms  p(95)=47.36ms  p(99.9)=91.69ms
     iterations.....................: 186029  1546.220643/s
     success_rate...................: 100.00% ✓ 186029      ✗ 0     
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

     checks.........................: 100.00% ✓ 424215      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=4.65µs  min=1.11µs med=2.73µs  max=181.3ms  p(90)=4.21µs   p(95)=4.87µs   p(99.9)=36.47µs
     http_req_connecting............: avg=314ns   min=0s     med=0s      max=2.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.17ms min=2.29ms med=41.66ms max=339.56ms p(90)=59.4ms   p(95)=64.77ms  p(99.9)=90.63ms
       { expected_response:true }...: avg=42.17ms min=2.29ms med=41.66ms max=339.56ms p(90)=59.4ms   p(95)=64.77ms  p(99.9)=90.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141505
     http_req_receiving.............: avg=89µs    min=29µs   med=68.85µs max=170.3ms  p(90)=106.79µs p(95)=125.66µs p(99.9)=1.94ms 
     http_req_sending...............: avg=29.41µs min=5.19µs med=11.67µs max=201.44ms p(90)=17.85µs  p(95)=21.59µs  p(99.9)=1.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.05ms min=2.17ms med=41.55ms max=339.15ms p(90)=59.28ms  p(95)=64.64ms  p(99.9)=90.23ms
     http_reqs......................: 141505  1176.388511/s
     iteration_duration.............: avg=42.42ms min=4.03ms med=41.88ms max=349.1ms  p(90)=59.62ms  p(95)=64.99ms  p(99.9)=91.2ms 
     iterations.....................: 141405  1175.55717/s
     success_rate...................: 100.00% ✓ 141405      ✗ 0     
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

     checks.........................: 100.00% ✓ 182877     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   608 kB/s
     http_req_blocked...............: avg=5.16µs  min=1.2µs   med=3.03µs  max=4.28ms   p(90)=4.49µs   p(95)=5.08µs   p(99.9)=49.46µs 
     http_req_connecting............: avg=1.89µs  min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.02ms min=4.22ms  med=94.72ms max=357.33ms p(90)=123.43ms p(95)=138.84ms p(99.9)=232.76ms
       { expected_response:true }...: avg=98.02ms min=4.22ms  med=94.72ms max=357.33ms p(90)=123.43ms p(95)=138.84ms p(99.9)=232.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61059
     http_req_receiving.............: avg=90.38µs min=32.82µs med=81.74µs max=121.75ms p(90)=114.57µs p(95)=126.54µs p(99.9)=818.82µs
     http_req_sending...............: avg=24.24µs min=5.86µs  med=14.14µs max=132.23ms p(90)=20.39µs  p(95)=22.37µs  p(99.9)=621.7µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.91ms min=4.15ms  med=94.61ms max=356.97ms p(90)=123.3ms  p(95)=138.72ms p(99.9)=232.42ms
     http_reqs......................: 61059   506.327594/s
     iteration_duration.............: avg=98.44ms min=17.88ms med=94.99ms max=396.97ms p(90)=123.71ms p(95)=139.16ms p(99.9)=235.72ms
     iterations.....................: 60959   505.498351/s
     success_rate...................: 100.00% ✓ 60959      ✗ 0    
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

     checks.........................: 100.00% ✓ 133368     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   443 kB/s
     http_req_blocked...............: avg=5.86µs   min=1.26µs  med=3.39µs   max=3.96ms   p(90)=4.81µs   p(95)=5.38µs   p(99.9)=468.58µs
     http_req_connecting............: avg=2.27µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=348.45µs
     http_req_duration..............: avg=134.44ms min=5.84ms  med=131.84ms max=369.55ms p(90)=178.49ms p(95)=192.04ms p(99.9)=246.33ms
       { expected_response:true }...: avg=134.44ms min=5.84ms  med=131.84ms max=369.55ms p(90)=178.49ms p(95)=192.04ms p(99.9)=246.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44556
     http_req_receiving.............: avg=92.4µs   min=32.25µs med=86.49µs  max=51.13ms  p(90)=118.44µs p(95)=130.49µs p(99.9)=679.99µs
     http_req_sending...............: avg=31.62µs  min=5.67µs  med=16.51µs  max=102.45ms p(90)=21.92µs  p(95)=23.75µs  p(99.9)=677.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.32ms min=5.75ms  med=131.72ms max=366.09ms p(90)=178.38ms p(95)=191.88ms p(99.9)=246.19ms
     http_reqs......................: 44556   368.962165/s
     iteration_duration.............: avg=135.01ms min=15.09ms med=132.15ms max=380.05ms p(90)=178.82ms p(95)=192.36ms p(99.9)=248.53ms
     iterations.....................: 44456   368.134079/s
     success_rate...................: 100.00% ✓ 44456      ✗ 0    
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

     checks.........................: 100.00% ✓ 87669      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=5.96µs   min=1.27µs  med=3.44µs   max=3.5ms    p(90)=4.76µs   p(95)=5.32µs   p(99.9)=669.23µs
     http_req_connecting............: avg=2.33µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=631.24µs
     http_req_duration..............: avg=204.66ms min=6.38ms  med=187.41ms max=611.48ms p(90)=241.52ms p(95)=410.43ms p(99.9)=549.49ms
       { expected_response:true }...: avg=204.66ms min=6.38ms  med=187.41ms max=611.48ms p(90)=241.52ms p(95)=410.43ms p(99.9)=549.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29323
     http_req_receiving.............: avg=100.4µs  min=35.37µs med=93.84µs  max=40.26ms  p(90)=125.75µs p(95)=138.99µs p(99.9)=533.63µs
     http_req_sending...............: avg=28.52µs  min=6.33µs  med=17.32µs  max=60.89ms  p(90)=22.2µs   p(95)=23.9µs   p(99.9)=523.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.53ms min=6.25ms  med=187.29ms max=611.36ms p(90)=241.42ms p(95)=410.33ms p(99.9)=549.39ms
     http_reqs......................: 29323   242.235017/s
     iteration_duration.............: avg=205.63ms min=42.65ms med=187.78ms max=611.71ms p(90)=242.04ms p(95)=411.64ms p(99.9)=549.79ms
     iterations.....................: 29223   241.408925/s
     success_rate...................: 100.00% ✓ 29223      ✗ 0    
     vus............................: 22      min=22       max=50 
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

     checks.........................: 100.00% ✓ 85575      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=6.51µs   min=1.27µs  med=3.46µs   max=3.73ms   p(90)=4.77µs   p(95)=5.33µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=2.86µs   min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=209.47ms min=8.81ms  med=206.38ms max=418.59ms p(90)=221.98ms p(95)=228.21ms p(99.9)=298.81ms
       { expected_response:true }...: avg=209.47ms min=8.81ms  med=206.38ms max=418.59ms p(90)=221.98ms p(95)=228.21ms p(99.9)=298.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28625
     http_req_receiving.............: avg=192.71µs min=34.4µs  med=94.41µs  max=193.77ms p(90)=125.94µs p(95)=138.9µs  p(99.9)=1.59ms  
     http_req_sending...............: avg=30.49µs  min=6.24µs  med=17.99µs  max=57.65ms  p(90)=22.54µs  p(95)=24.39µs  p(99.9)=769.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.24ms min=8.7ms   med=206.26ms max=307.11ms p(90)=221.85ms p(95)=227.86ms p(99.9)=295.74ms
     http_reqs......................: 28625   236.333093/s
     iteration_duration.............: avg=210.48ms min=56.94ms med=206.67ms max=427.72ms p(90)=222.26ms p(95)=228.57ms p(99.9)=300.16ms
     iterations.....................: 28525   235.507475/s
     success_rate...................: 100.00% ✓ 28525      ✗ 0    
     vus............................: 46      min=46       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

