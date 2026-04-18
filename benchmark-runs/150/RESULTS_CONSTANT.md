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
| hive-router | v0.0.43 | 2,894 | 3,038 | 2,869 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.5 | 2,199 | 2,256 | 2,190 | 1.1% |  |
| grafbase | 0.53.2 | 2,005 | 2,072 | 1,979 | 1.4% |  |
| cosmo | 0.298.0 | 1,273 | 1,275 | 1,268 | 0.3% | non-compatible response (13 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 625 | 637 | 621 | 0.9% |  |
| apollo-router | v2.12.1 | 426 | 435 | 421 | 1.2% |  |
| hive-gateway | 2.5.14 | 273 | 279 | 269 | 1.3% |  |
| apollo-gateway | 2.13.3 | 247 | 249 | 245 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,377 | 2,509 | 2,341 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.5 | 2,007 | 2,054 | 1,735 | 4.8% |  |
| grafbase | 0.53.2 | 1,532 | 1,560 | 1,517 | 0.9% |  |
| cosmo | 0.298.0 | 1,167 | 1,185 | 1,163 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 596 | 612 | 589 | 1.3% |  |
| apollo-router | v2.12.1 | 386 | 395 | 381 | 1.1% |  |
| hive-gateway | 2.5.14 | 262 | 269 | 258 | 1.7% |  |
| apollo-gateway | 2.13.3 | 236 | 238 | 234 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1043274     ✗ 0     
     data_received..................: 31 GB   254 MB/s
     data_sent......................: 418 MB  3.5 MB/s
     http_req_blocked...............: avg=6.16µs   min=992ns   med=2.04µs  max=199.61ms p(90)=3.18µs   p(95)=3.82µs   p(99.9)=31.5µs 
     http_req_connecting............: avg=3.62µs   min=0s      med=0s      max=199.44ms p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.01ms  min=1.61ms  med=16.21ms max=282.52ms p(90)=24.77ms  p(95)=28.33ms  p(99.9)=51.21ms
       { expected_response:true }...: avg=17.01ms  min=1.61ms  med=16.21ms max=282.52ms p(90)=24.77ms  p(95)=28.33ms  p(99.9)=51.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 347858
     http_req_receiving.............: avg=124.44µs min=28.65µs med=51.65µs max=37.27ms  p(90)=102.36µs p(95)=277.69µs p(99.9)=10.34ms
     http_req_sending...............: avg=60.51µs  min=5.22µs  med=9.2µs   max=113.64ms p(90)=15.98µs  p(95)=124.05µs p(99.9)=7.92ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.82ms  min=1.55ms  med=16.06ms max=180.11ms p(90)=24.51ms  p(95)=28ms     p(99.9)=50.02ms
     http_reqs......................: 347858  2894.082533/s
     iteration_duration.............: avg=17.24ms  min=2.08ms  med=16.41ms max=333.06ms p(90)=24.99ms  p(95)=28.58ms  p(99.9)=52.72ms
     iterations.....................: 347758  2893.250561/s
     success_rate...................: 100.00% ✓ 347758      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 793458      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 318 MB  2.6 MB/s
     http_req_blocked...............: avg=2.53µs  min=1.01µs  med=2.02µs   max=10.05ms  p(90)=3.09µs   p(95)=3.69µs   p(99.9)=30.01µs 
     http_req_connecting............: avg=167ns   min=0s      med=0s       max=2.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.44ms min=2.4ms   med=14.39ms  max=309.85ms p(90)=49.86ms  p(95)=68.08ms  p(99.9)=166.66ms
       { expected_response:true }...: avg=22.44ms min=2.4ms   med=14.39ms  max=309.85ms p(90)=49.86ms  p(95)=68.08ms  p(99.9)=166.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 264586
     http_req_receiving.............: avg=622µs   min=50.45µs med=108.05µs max=162.73ms p(90)=946.85µs p(95)=1.46ms   p(99.9)=55.2ms  
     http_req_sending...............: avg=43.06µs min=5.15µs  med=9.25µs   max=278.79ms p(90)=15.88µs  p(95)=110.04µs p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.78ms min=2.28ms  med=13.89ms  max=309.5ms  p(90)=48.62ms  p(95)=66.86ms  p(99.9)=164.59ms
     http_reqs......................: 264586  2199.709255/s
     iteration_duration.............: avg=22.67ms min=3ms     med=14.6ms   max=336.26ms p(90)=50.11ms  p(95)=68.31ms  p(99.9)=167.45ms
     iterations.....................: 264486  2198.877877/s
     success_rate...................: 100.00% ✓ 264486      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 723231      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=3.23µs   min=982ns   med=2.25µs  max=16.46ms  p(90)=3.78µs   p(95)=4.59µs   p(99.9)=39.43µs
     http_req_connecting............: avg=384ns    min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.64ms  min=1.85ms  med=24.39ms max=331.7ms  p(90)=29.48ms  p(95)=31.62ms  p(99.9)=53.48ms
       { expected_response:true }...: avg=24.64ms  min=1.85ms  med=24.39ms max=331.7ms  p(90)=29.48ms  p(95)=31.62ms  p(99.9)=53.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241177
     http_req_receiving.............: avg=109.82µs min=30.11µs med=59.92µs max=80.64ms  p(90)=102.39µs p(95)=174.34µs p(99.9)=8.69ms 
     http_req_sending...............: avg=42.23µs  min=5.21µs  med=10.48µs max=153.25ms p(90)=17.79µs  p(95)=99.99µs  p(99.9)=2.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.48ms  min=1.79ms  med=24.28ms max=330.95ms p(90)=29.31ms  p(95)=31.36ms  p(99.9)=52.33ms
     http_reqs......................: 241177  2005.682061/s
     iteration_duration.............: avg=24.87ms  min=3.87ms  med=24.6ms  max=343.09ms p(90)=29.7ms   p(95)=31.85ms  p(99.9)=54.23ms
     iterations.....................: 241077  2004.850438/s
     success_rate...................: 100.00% ✓ 241077      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459426      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.07µs  min=1.03µs  med=2.08µs  max=4.09ms   p(90)=3.45µs  p(95)=4.1µs    p(99.9)=30.04µs
     http_req_connecting............: avg=663ns   min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.94ms min=2.11ms  med=38.44ms max=301.52ms p(90)=54.88ms p(95)=59.85ms  p(99.9)=83.39ms
       { expected_response:true }...: avg=38.94ms min=2.11ms  med=38.44ms max=301.52ms p(90)=54.88ms p(95)=59.85ms  p(99.9)=83.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153242
     http_req_receiving.............: avg=79.57µs min=28.98µs med=59.34µs max=201.74ms p(90)=95.31µs p(95)=113.07µs p(99.9)=1.92ms 
     http_req_sending...............: avg=26.03µs min=5.31µs  med=10.17µs max=110.06ms p(90)=16.25µs p(95)=19.8µs   p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.83ms min=2.04ms  med=38.34ms max=300.74ms p(90)=54.76ms p(95)=59.72ms  p(99.9)=83.09ms
     http_reqs......................: 153242  1273.902899/s
     iteration_duration.............: avg=39.17ms min=3.92ms  med=38.63ms max=327.96ms p(90)=55.07ms p(95)=60.05ms  p(99.9)=83.95ms
     iterations.....................: 153142  1273.071597/s
     success_rate...................: 100.00% ✓ 153142      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 225771     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   751 kB/s
     http_req_blocked...............: avg=4.58µs  min=1.17µs  med=2.87µs  max=4.27ms   p(90)=4.53µs   p(95)=5.17µs   p(99.9)=46.49µs 
     http_req_connecting............: avg=1.41µs  min=0s      med=0s      max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.39ms min=3.82ms  med=76.5ms  max=357.15ms p(90)=98.61ms  p(95)=109.37ms p(99.9)=201.61ms
       { expected_response:true }...: avg=79.39ms min=3.82ms  med=76.5ms  max=357.15ms p(90)=98.61ms  p(95)=109.37ms p(99.9)=201.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75357
     http_req_receiving.............: avg=180.9µs min=30.77µs med=76.65µs max=254.53ms p(90)=111.28µs p(95)=124.46µs p(99.9)=1.51ms  
     http_req_sending...............: avg=24.8µs  min=5.59µs  med=13.54µs max=276.97ms p(90)=20.18µs  p(95)=22.47µs  p(99.9)=724.58µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.19ms min=3.7ms   med=76.39ms max=230.48ms p(90)=98.47ms  p(95)=108.97ms p(99.9)=198.54ms
     http_reqs......................: 75357   625.365662/s
     iteration_duration.............: avg=79.73ms min=6.28ms  med=76.74ms max=376.15ms p(90)=98.85ms  p(95)=109.65ms p(99.9)=204.24ms
     iterations.....................: 75257   624.535791/s
     success_rate...................: 100.00% ✓ 75257      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 154050     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   512 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.11µs  med=3.31µs   max=4.3ms    p(90)=4.78µs   p(95)=5.35µs   p(99.9)=180.51µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.38ms min=5.59ms  med=116.08ms max=365.5ms  p(90)=140.58ms p(95)=147.75ms p(99.9)=180.51ms
       { expected_response:true }...: avg=116.38ms min=5.59ms  med=116.08ms max=365.5ms  p(90)=140.58ms p(95)=147.75ms p(99.9)=180.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51450
     http_req_receiving.............: avg=89.9µs   min=32.45µs med=83.75µs  max=54.15ms  p(90)=115.47µs p(95)=127.31µs p(99.9)=756.32µs
     http_req_sending...............: avg=27.02µs  min=5.75µs  med=15.37µs  max=102.05ms p(90)=20.88µs  p(95)=22.65µs  p(99.9)=603µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.27ms min=5.48ms  med=115.95ms max=355.83ms p(90)=140.44ms p(95)=147.61ms p(99.9)=180.29ms
     http_reqs......................: 51450   426.284814/s
     iteration_duration.............: avg=116.87ms min=23.03ms med=116.36ms max=374.98ms p(90)=140.82ms p(95)=148.02ms p(99.9)=182.81ms
     iterations.....................: 51350   425.456272/s
     success_rate...................: 100.00% ✓ 51350      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98856      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=6.62µs   min=1.24µs  med=3.43µs   max=4.51ms   p(90)=4.9µs    p(95)=5.51µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=181.34ms min=5.98ms  med=165.38ms max=601.76ms p(90)=210.71ms p(95)=284.58ms p(99.9)=532.35ms
       { expected_response:true }...: avg=181.34ms min=5.98ms  med=165.38ms max=601.76ms p(90)=210.71ms p(95)=284.58ms p(99.9)=532.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33052
     http_req_receiving.............: avg=98.33µs  min=35.4µs  med=93.26µs  max=19.46ms  p(90)=125.37µs p(95)=138.81µs p(99.9)=664.56µs
     http_req_sending...............: avg=32.11µs  min=6.16µs  med=16.77µs  max=133.39ms p(90)=22.04µs  p(95)=23.87µs  p(99.9)=604.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.21ms min=5.83ms  med=165.26ms max=601.67ms p(90)=210.58ms p(95)=283.41ms p(99.9)=532.23ms
     http_reqs......................: 33052   273.298983/s
     iteration_duration.............: avg=182.16ms min=22.44ms med=165.7ms  max=601.95ms p(90)=211.12ms p(95)=295.91ms p(99.9)=532.63ms
     iterations.....................: 32952   272.472107/s
     success_rate...................: 100.00% ✓ 32952      ✗ 0    
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

     checks.........................: 100.00% ✓ 89538      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=6.6µs    min=1.12µs  med=3.19µs   max=3.82ms   p(90)=4.47µs   p(95)=4.98µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=3.24µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=200.2ms  min=8.39ms  med=199.6ms  max=417.9ms  p(90)=224.71ms p(95)=232.96ms p(99.9)=301.42ms
       { expected_response:true }...: avg=200.2ms  min=8.39ms  med=199.6ms  max=417.9ms  p(90)=224.71ms p(95)=232.96ms p(99.9)=301.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29946
     http_req_receiving.............: avg=93.21µs  min=33.62µs med=89.15µs  max=7.07ms   p(90)=120.46µs p(95)=132.35µs p(99.9)=435.4µs 
     http_req_sending...............: avg=30.31µs  min=6.02µs  med=16.13µs  max=118.28ms p(90)=20.78µs  p(95)=22.49µs  p(99.9)=546.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.07ms min=8.25ms  med=199.48ms max=417.3ms  p(90)=224.58ms p(95)=232.82ms p(99.9)=301.14ms
     http_reqs......................: 29946   247.394503/s
     iteration_duration.............: avg=201.15ms min=46.1ms  med=199.89ms max=460.41ms p(90)=225.03ms p(95)=233.31ms p(99.9)=315.71ms
     iterations.....................: 29846   246.568367/s
     success_rate...................: 100.00% ✓ 29846      ✗ 0    
     vus............................: 29      min=29       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 857274      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.22µs   min=992ns   med=2.18µs  max=14.36ms  p(90)=3.65µs   p(95)=4.48µs   p(99.9)=35µs   
     http_req_connecting............: avg=460ns    min=0s      med=0s      max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.75ms  min=1.75ms  med=20.32ms max=314.99ms p(90)=28.76ms  p(95)=31.81ms  p(99.9)=53.74ms
       { expected_response:true }...: avg=20.75ms  min=1.75ms  med=20.32ms max=314.99ms p(90)=28.76ms  p(95)=31.81ms  p(99.9)=53.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285858
     http_req_receiving.............: avg=115.92µs min=28.54µs med=54.51µs max=144.69ms p(90)=103.71µs p(95)=264.58µs p(99.9)=9.09ms 
     http_req_sending...............: avg=53.56µs  min=5.21µs  med=9.81µs  max=174.27ms p(90)=18.19µs  p(95)=124.98µs p(99.9)=4.87ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.58ms  min=1.65ms  med=20.18ms max=314.83ms p(90)=28.55ms  p(95)=31.52ms  p(99.9)=52.71ms
     http_reqs......................: 285858  2377.457225/s
     iteration_duration.............: avg=20.98ms  min=3.72ms  med=20.54ms max=343.1ms  p(90)=28.98ms  p(95)=32.05ms  p(99.9)=54.25ms
     iterations.....................: 285758  2376.625534/s
     success_rate...................: 100.00% ✓ 285758      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 724020      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=2.8µs    min=982ns   med=2.07µs   max=11.1ms   p(90)=3.45µs  p(95)=4.23µs   p(99.9)=34.01µs 
     http_req_connecting............: avg=287ns    min=0s      med=0s       max=3.5ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.61ms  min=1.84ms  med=17.04ms  max=640.97ms p(90)=51.14ms p(95)=67.47ms  p(99.9)=198.14ms
       { expected_response:true }...: avg=24.61ms  min=1.84ms  med=17.04ms  max=640.97ms p(90)=51.14ms p(95)=67.47ms  p(99.9)=198.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241440
     http_req_receiving.............: avg=692.21µs min=51.54µs med=103.36µs max=188.7ms  p(90)=1.14ms  p(95)=1.84ms   p(99.9)=58.83ms 
     http_req_sending...............: avg=42.05µs  min=5.17µs  med=9.43µs   max=157.36ms p(90)=18.11µs p(95)=109.42µs p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.88ms  min=1.7ms   med=16.48ms  max=640.88ms p(90)=49.85ms p(95)=65.96ms  p(99.9)=190.38ms
     http_reqs......................: 241440  2007.863927/s
     iteration_duration.............: avg=24.85ms  min=2.26ms  med=17.26ms  max=641.18ms p(90)=51.37ms p(95)=67.71ms  p(99.9)=203.49ms
     iterations.....................: 241340  2007.032307/s
     success_rate...................: 100.00% ✓ 241340      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 552831      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 222 MB  1.8 MB/s
     http_req_blocked...............: avg=3.58µs   min=932ns   med=2.38µs  max=4.18ms   p(90)=4.88µs   p(95)=6.05µs   p(99.9)=45.25µs
     http_req_connecting............: avg=555ns    min=0s      med=0s      max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.28ms  min=2.42ms  med=31.43ms max=326.76ms p(90)=42.7ms   p(95)=47.28ms  p(99.9)=84.83ms
       { expected_response:true }...: avg=32.28ms  min=2.42ms  med=31.43ms max=326.76ms p(90)=42.7ms   p(95)=47.28ms  p(99.9)=84.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184377
     http_req_receiving.............: avg=111.55µs min=31.04µs med=62.64µs max=107.74ms p(90)=136.08µs p(95)=286.65µs p(99.9)=4.93ms 
     http_req_sending...............: avg=47.13µs  min=5.48µs  med=10.71µs max=146.27ms p(90)=24.94µs  p(95)=138.95µs p(99.9)=3.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.12ms  min=2.29ms  med=31.29ms max=322.23ms p(90)=42.51ms  p(95)=47.05ms  p(99.9)=84.16ms
     http_reqs......................: 184377  1532.39262/s
     iteration_duration.............: avg=32.55ms  min=5.49ms  med=31.67ms max=340.47ms p(90)=42.94ms  p(95)=47.52ms  p(99.9)=85.71ms
     iterations.....................: 184277  1531.561501/s
     success_rate...................: 100.00% ✓ 184277      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 421212      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.24µs  min=1.02µs  med=2.21µs  max=3.77ms   p(90)=3.67µs   p(95)=4.36µs  p(99.9)=35.28µs
     http_req_connecting............: avg=653ns   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=42.48ms min=2.34ms  med=41.96ms max=316.21ms p(90)=59.68ms  p(95)=65.13ms p(99.9)=91.68ms
       { expected_response:true }...: avg=42.48ms min=2.34ms  med=41.96ms max=316.21ms p(90)=59.68ms  p(95)=65.13ms p(99.9)=91.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140504
     http_req_receiving.............: avg=84.92µs min=30.02µs med=64.81µs max=233.92ms p(90)=102.24µs p(95)=121µs   p(99.9)=1.68ms 
     http_req_sending...............: avg=27.9µs  min=5.41µs  med=10.96µs max=162.04ms p(90)=17.43µs  p(95)=21.08µs p(99.9)=1.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=42.37ms min=2.24ms  med=41.84ms max=315.34ms p(90)=59.55ms  p(95)=65ms    p(99.9)=91.15ms
     http_reqs......................: 140504  1167.836778/s
     iteration_duration.............: avg=42.72ms min=3.93ms  med=42.16ms max=339.72ms p(90)=59.89ms  p(95)=65.33ms p(99.9)=92.12ms
     iterations.....................: 140404  1167.005601/s
     success_rate...................: 100.00% ✓ 140404      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 215220     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   716 kB/s
     http_req_blocked...............: avg=4.84µs  min=1.12µs  med=3.09µs  max=4.13ms   p(90)=4.76µs   p(95)=5.41µs   p(99.9)=49.68µs 
     http_req_connecting............: avg=1.42µs  min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.27ms min=4.13ms  med=80.69ms max=360.13ms p(90)=100.5ms  p(95)=110.02ms p(99.9)=208.51ms
       { expected_response:true }...: avg=83.27ms min=4.13ms  med=80.69ms max=360.13ms p(90)=100.5ms  p(95)=110.02ms p(99.9)=208.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71840
     http_req_receiving.............: avg=91.62µs min=30.77µs med=81.17µs max=144.33ms p(90)=115.45µs p(95)=128.71µs p(99.9)=976.62µs
     http_req_sending...............: avg=26.73µs min=5.72µs  med=14.63µs max=189.82ms p(90)=21.29µs  p(95)=23.55µs  p(99.9)=813.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.15ms min=4.01ms  med=80.58ms max=355.29ms p(90)=100.38ms p(95)=109.92ms p(99.9)=207.88ms
     http_reqs......................: 71840   596.036034/s
     iteration_duration.............: avg=83.64ms min=13.56ms med=80.93ms max=370.18ms p(90)=100.75ms p(95)=110.34ms p(99.9)=210.25ms
     iterations.....................: 71740   595.206362/s
     success_rate...................: 100.00% ✓ 71740      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 139896     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 56 MB   465 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.14µs  med=3.48µs   max=3.69ms   p(90)=5.01µs   p(95)=5.6µs    p(99.9)=229.48µs
     http_req_connecting............: avg=1.57µs   min=0s      med=0s       max=3.66ms   p(90)=0s       p(95)=0s       p(99.9)=139.62µs
     http_req_duration..............: avg=128.16ms min=6.12ms  med=125.4ms  max=319.61ms p(90)=170.47ms p(95)=183.8ms  p(99.9)=236.66ms
       { expected_response:true }...: avg=128.16ms min=6.12ms  med=125.4ms  max=319.61ms p(90)=170.47ms p(95)=183.8ms  p(99.9)=236.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46732
     http_req_receiving.............: avg=94.03µs  min=30.77µs med=87.42µs  max=80.16ms  p(90)=119.62µs p(95)=131.85µs p(99.9)=729.03µs
     http_req_sending...............: avg=28.38µs  min=5.79µs  med=16.36µs  max=88.66ms  p(90)=21.77µs  p(95)=23.59µs  p(99.9)=756.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.04ms min=5.99ms  med=125.29ms max=318.62ms p(90)=170.34ms p(95)=183.66ms p(99.9)=236.28ms
     http_reqs......................: 46732   386.965048/s
     iteration_duration.............: avg=128.69ms min=22.19ms med=125.75ms max=342.13ms p(90)=170.78ms p(95)=184.09ms p(99.9)=240.47ms
     iterations.....................: 46632   386.136997/s
     success_rate...................: 100.00% ✓ 46632      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94953      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=7µs      min=1.24µs  med=3.44µs   max=4.14ms   p(90)=4.91µs   p(95)=5.5µs    p(99.9)=1.67ms  
     http_req_connecting............: avg=3.32µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=188.79ms min=5.87ms  med=176.47ms max=619.83ms p(90)=232.42ms p(95)=380.19ms p(99.9)=534.09ms
       { expected_response:true }...: avg=188.79ms min=5.87ms  med=176.47ms max=619.83ms p(90)=232.42ms p(95)=380.19ms p(99.9)=534.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31751
     http_req_receiving.............: avg=104.17µs min=34.95µs med=94.29µs  max=132.98ms p(90)=127.32µs p(95)=140.6µs  p(99.9)=649.46µs
     http_req_sending...............: avg=36.2µs   min=6.15µs  med=17.23µs  max=144.39ms p(90)=22.27µs  p(95)=24.05µs  p(99.9)=726.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.65ms min=5.76ms  med=176.35ms max=619.74ms p(90)=232.3ms  p(95)=380.08ms p(99.9)=533.96ms
     http_reqs......................: 31751   262.551849/s
     iteration_duration.............: avg=189.66ms min=22.05ms med=176.84ms max=620.01ms p(90)=232.83ms p(95)=382.26ms p(99.9)=534.42ms
     iterations.....................: 31651   261.72494/s
     success_rate...................: 100.00% ✓ 31651      ✗ 0    
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

     checks.........................: 100.00% ✓ 85800      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=5.09µs   min=1.25µs  med=3.36µs   max=2.49ms   p(90)=4.68µs   p(95)=5.22µs   p(99.9)=598.39µs
     http_req_connecting............: avg=1.57µs   min=0s      med=0s       max=2.46ms   p(90)=0s       p(95)=0s       p(99.9)=573.07µs
     http_req_duration..............: avg=208.93ms min=8.71ms  med=205.72ms max=359.77ms p(90)=226.02ms p(95)=238.86ms p(99.9)=297.18ms
       { expected_response:true }...: avg=208.93ms min=8.71ms  med=205.72ms max=359.77ms p(90)=226.02ms p(95)=238.86ms p(99.9)=297.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28700
     http_req_receiving.............: avg=99.51µs  min=34.4µs  med=92.92µs  max=47.06ms  p(90)=125.09µs p(95)=137.38µs p(99.9)=817.64µs
     http_req_sending...............: avg=24.86µs  min=5.15µs  med=17.28µs  max=63.6ms   p(90)=22.06µs  p(95)=23.83µs  p(99.9)=586.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.81ms min=8.55ms  med=205.6ms  max=359.58ms p(90)=225.91ms p(95)=238.76ms p(99.9)=297.07ms
     http_reqs......................: 28700   236.970924/s
     iteration_duration.............: avg=209.91ms min=71.63ms med=206.03ms max=368.26ms p(90)=226.32ms p(95)=239.21ms p(99.9)=298.12ms
     iterations.....................: 28600   236.145241/s
     success_rate...................: 100.00% ✓ 28600      ✗ 0    
     vus............................: 46      min=46       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

