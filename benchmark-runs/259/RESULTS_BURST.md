## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,688 | 2,850 | 2,660 | 2.2% |  |
| fusion-nightly | 16.4.0-p.14 | 2,114 | 2,163 | 2,104 | 1.0% |  |
| fusion | 16.3.0 | 2,047 | 2,082 | 2,035 | 0.7% |  |
| grafbase | 0.53.5 | 1,829 | 1,887 | 1,821 | 1.1% |  |
| cosmo | 0.326.1 | 1,113 | 1,135 | 1,106 | 0.9% |  |
| hive-gateway-router-runtime | 2.10.0 | 500 | 507 | 498 | 0.6% |  |
| apollo-router | v2.15.1 | 378 | 393 | 377 | 2.4% | non-compatible response (187 across 6/9 runs) |
| hive-gateway | 2.10.0 | 226 | 230 | 224 | 0.9% |  |
| apollo-gateway | 2.14.2 | 216 | 218 | 214 | 0.5% |  |
| feddi | 77271dc84a06 | 16 | 16 | 9 | 30.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,239 | 2,357 | 2,223 | 2.0% |  |
| fusion | 16.3.0 | 1,963 | 2,011 | 1,958 | 1.0% |  |
| fusion-nightly | 16.4.0-p.14 | 1,960 | 2,009 | 1,951 | 1.1% |  |
| grafbase | 0.53.5 | 1,357 | 1,407 | 1,350 | 1.5% |  |
| cosmo | 0.326.1 | 1,066 | 1,087 | 1,060 | 0.9% |  |
| hive-gateway-router-runtime | 2.10.0 | 470 | 475 | 465 | 0.7% |  |
| apollo-router | v2.15.1 | 323 | 337 | 321 | 1.5% |  |
| hive-gateway | 2.10.0 | 209 | 214 | 208 | 0.9% |  |
| apollo-gateway | 2.14.2 | 201 | 203 | 200 | 0.4% |  |
| feddi | 77271dc84a06 | 16 | 16 | 16 | 0.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 495768      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=23.93µs  min=1.04µs  med=2.34µs  max=68.84ms  p(90)=3.87µs   p(95)=5.08µs   p(99.9)=2.62ms  
     http_req_connecting............: avg=20.51µs  min=0s      med=0s      max=68.75ms  p(90)=0s       p(95)=0s       p(99.9)=2.47ms  
     http_req_duration..............: avg=85.45ms  min=1.6ms   med=80.02ms max=367.87ms p(90)=164.92ms p(95)=179.65ms p(99.9)=241.89ms
       { expected_response:true }...: avg=85.45ms  min=1.6ms   med=80.02ms max=367.87ms p(90)=164.92ms p(95)=179.65ms p(99.9)=241.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166256
     http_req_receiving.............: avg=174.68µs min=27.76µs med=52.35µs max=148.71ms p(90)=134.92µs p(95)=345.58µs p(99.9)=24.38ms 
     http_req_sending...............: avg=77.87µs  min=5.28µs  med=10.05µs max=234.89ms p(90)=19.61µs  p(95)=119.52µs p(99.9)=11.16ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.2ms   min=1.55ms  med=79.81ms max=366.74ms p(90)=164.65ms p(95)=179.2ms  p(99.9)=238.3ms 
     http_reqs......................: 166256  2688.398712/s
     iteration_duration.............: avg=86.27ms  min=2.37ms  med=80.98ms max=399.29ms p(90)=165.41ms p(95)=180.2ms  p(99.9)=243.54ms
     iterations.....................: 165256  2672.228476/s
     success_rate...................: 100.00% ✓ 165256      ✗ 0     
     vus............................: 51      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 393681      ✗ 0     
     data_received..................: 12 GB   185 MB/s
     data_sent......................: 159 MB  2.5 MB/s
     http_req_blocked...............: avg=18.5µs   min=1.13µs  med=2.89µs   max=62ms     p(90)=4.52µs   p(95)=5.73µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=14.75µs  min=0s      med=0s       max=61.94ms  p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=107.59ms min=2.27ms  med=101.65ms max=485.13ms p(90)=205.33ms p(95)=222.36ms p(99.9)=313.08ms
       { expected_response:true }...: avg=107.59ms min=2.27ms  med=101.65ms max=485.13ms p(90)=205.33ms p(95)=222.36ms p(99.9)=313.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132227
     http_req_receiving.............: avg=988.46µs min=55.12µs med=121.7µs  max=331.5ms  p(90)=1.72ms   p(95)=3.3ms    p(99.9)=39.53ms 
     http_req_sending...............: avg=74.97µs  min=5.54µs  med=11.16µs  max=151.46ms p(90)=22.21µs  p(95)=125.59µs p(99.9)=9.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.53ms min=2.14ms  med=100.66ms max=471.66ms p(90)=204.08ms p(95)=220.95ms p(99.9)=308.42ms
     http_reqs......................: 132227  2114.89425/s
     iteration_duration.............: avg=108.69ms min=4.21ms  med=102.92ms max=485.35ms p(90)=205.87ms p(95)=222.87ms p(99.9)=313.63ms
     iterations.....................: 131227  2098.899829/s
     success_rate...................: 100.00% ✓ 131227      ✗ 0     
     vus............................: 82      min=0         max=492 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 381864      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=15.86µs  min=1.03µs  med=2.33µs   max=79.96ms  p(90)=3.84µs   p(95)=4.93µs   p(99.9)=1.18ms  
     http_req_connecting............: avg=12.14µs  min=0s      med=0s       max=68.51ms  p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=110.97ms min=2.34ms  med=95.52ms  max=2.08s    p(90)=210.17ms p(95)=245.47ms p(99.9)=815.87ms
       { expected_response:true }...: avg=110.97ms min=2.34ms  med=95.52ms  max=2.08s    p(90)=210.17ms p(95)=245.47ms p(99.9)=815.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128288
     http_req_receiving.............: avg=2.86ms   min=54.14µs med=114.51µs max=765.56ms p(90)=3.41ms   p(95)=9.6ms    p(99.9)=235.99ms
     http_req_sending...............: avg=59.92µs  min=4.97µs  med=9.79µs   max=42.94ms  p(90)=18.46µs  p(95)=95.73µs  p(99.9)=8.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.05ms min=2.23ms  med=93.66ms  max=2.08s    p(90)=206.23ms p(95)=238.5ms  p(99.9)=797.63ms
     http_reqs......................: 128288  2047.428606/s
     iteration_duration.............: avg=112.12ms min=4.82ms  med=96.71ms  max=2.08s    p(90)=210.81ms p(95)=246.31ms p(99.9)=816.81ms
     iterations.....................: 127288  2031.468979/s
     success_rate...................: 100.00% ✓ 127288      ✗ 0     
     vus............................: 90      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 338772      ✗ 0     
     data_received..................: 10 GB   161 MB/s
     data_sent......................: 137 MB  2.2 MB/s
     http_req_blocked...............: avg=19.79µs  min=1.07µs  med=3.1µs    max=50.53ms  p(90)=4.93µs   p(95)=6.37µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=15.67µs  min=0s      med=0s       max=50.35ms  p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=124.98ms min=1.94ms  med=115.62ms max=477.53ms p(90)=245.75ms p(95)=273.42ms p(99.9)=375.45ms
       { expected_response:true }...: avg=124.98ms min=1.94ms  med=115.62ms max=477.53ms p(90)=245.75ms p(95)=273.42ms p(99.9)=375.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 113924
     http_req_receiving.............: avg=118.02µs min=31.38µs med=64.81µs  max=41.6ms   p(90)=117.9µs  p(95)=315.15µs p(99.9)=7.2ms   
     http_req_sending...............: avg=62.59µs  min=5.84µs  med=12.68µs  max=131.54ms p(90)=21.95µs  p(95)=114.54µs p(99.9)=8.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.8ms  min=1.85ms  med=115.44ms max=477.47ms p(90)=245.55ms p(95)=273.2ms  p(99.9)=375.37ms
     http_reqs......................: 113924  1829.375774/s
     iteration_duration.............: avg=126.38ms min=6.58ms  med=117.22ms max=477.68ms p(90)=246.5ms  p(95)=274.17ms p(99.9)=376.86ms
     iterations.....................: 112924  1813.317912/s
     success_rate...................: 100.00% ✓ 112924      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 205767      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.23µs   min=1.1µs   med=2.33µs   max=18.49ms  p(90)=3.88µs   p(95)=4.83µs   p(99.9)=658.45µs
     http_req_connecting............: avg=4.2µs    min=0s      med=0s       max=18.34ms  p(90)=0s       p(95)=0s       p(99.9)=604.27µs
     http_req_duration..............: avg=205.13ms min=2.11ms  med=203.28ms max=610.4ms  p(90)=379.91ms p(95)=406.16ms p(99.9)=498.12ms
       { expected_response:true }...: avg=205.13ms min=2.11ms  med=203.28ms max=610.4ms  p(90)=379.91ms p(95)=406.16ms p(99.9)=498.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69589
     http_req_receiving.............: avg=86.72µs  min=29.52µs med=62.82µs  max=155.49ms p(90)=97.66µs  p(95)=111.29µs p(99.9)=1.44ms  
     http_req_sending...............: avg=28.37µs  min=5.5µs   med=10.65µs  max=99.65ms  p(90)=17.17µs  p(95)=21.06µs  p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.01ms min=2ms     med=203.12ms max=610.27ms p(90)=379.83ms p(95)=406.07ms p(99.9)=498.06ms
     http_reqs......................: 69589   1113.695319/s
     iteration_duration.............: avg=208.36ms min=4.61ms  med=207.25ms max=610.59ms p(90)=380.72ms p(95)=406.87ms p(99.9)=498.57ms
     iterations.....................: 68589   1097.691421/s
     success_rate...................: 100.00% ✓ 68589       ✗ 0    
     vus............................: 81      min=0         max=493
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 94305      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   601 kB/s
     http_req_blocked...............: avg=8.21µs   min=1.24µs  med=2.68µs   max=6.81ms   p(90)=4.4µs    p(95)=5.49µs   p(99.9)=1.04ms  
     http_req_connecting............: avg=4.35µs   min=0s      med=0s       max=6.75ms   p(90)=0s       p(95)=0s       p(99.9)=959.19µs
     http_req_duration..............: avg=442.47ms min=4.07ms  med=410.01ms max=2.11s    p(90)=870.34ms p(95)=947.56ms p(99.9)=1.41s   
       { expected_response:true }...: avg=442.47ms min=4.07ms  med=410.01ms max=2.11s    p(90)=870.34ms p(95)=947.56ms p(99.9)=1.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32435
     http_req_receiving.............: avg=82.86µs  min=32.87µs med=73.29µs  max=19.9ms   p(90)=110.43µs p(95)=124.32µs p(99.9)=890.22µs
     http_req_sending...............: avg=37.69µs  min=5.22µs  med=13.66µs  max=237.02ms p(90)=20.67µs  p(95)=24.27µs  p(99.9)=2.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=442.35ms min=3.94ms  med=409.9ms  max=2.11s    p(90)=870.25ms p(95)=947.48ms p(99.9)=1.41s   
     http_reqs......................: 32435   500.93739/s
     iteration_duration.............: avg=456.77ms min=26.9ms  med=425.91ms max=2.12s    p(90)=874.14ms p(95)=951.21ms p(99.9)=1.42s   
     iterations.....................: 31435   485.493043/s
     success_rate...................: 100.00% ✓ 31435      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 71928      ✗ 0    
     data_received..................: 2.2 GB  33 MB/s
     data_sent......................: 30 MB   455 kB/s
     http_req_blocked...............: avg=10.41µs  min=1.58µs  med=3.72µs   max=3.28ms   p(90)=5.48µs   p(95)=6.61µs   p(99.9)=1.6ms 
     http_req_connecting............: avg=5.36µs   min=0s      med=0s       max=3.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.56ms
     http_req_duration..............: avg=578.13ms min=5.08ms  med=422.7ms  max=28.06s   p(90)=647.46ms p(95)=711.01ms p(99.9)=27.16s
       { expected_response:true }...: avg=578.13ms min=5.08ms  med=422.7ms  max=28.06s   p(90)=647.46ms p(95)=711.01ms p(99.9)=27.16s
     http_req_failed................: 0.00%   ✓ 0          ✗ 24976
     http_req_receiving.............: avg=91.53µs  min=35.27µs med=83.93µs  max=5.4ms    p(90)=119.97µs p(95)=134.3µs  p(99.9)=1.1ms 
     http_req_sending...............: avg=38.68µs  min=6.97µs  med=18.25µs  max=133.61ms p(90)=24.07µs  p(95)=28.65µs  p(99.9)=2.4ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=578ms    min=5.02ms  med=422.62ms max=28.06s   p(90)=647.35ms p(95)=710.92ms p(99.9)=27.16s
     http_reqs......................: 24976   378.954864/s
     iteration_duration.............: avg=602.48ms min=14.54ms med=435.6ms  max=28.06s   p(90)=650.77ms p(95)=715.48ms p(99.9)=27.23s
     iterations.....................: 23976   363.782104/s
     success_rate...................: 100.00% ✓ 23976      ✗ 0    
     vus............................: 53      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 43257      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   272 kB/s
     http_req_blocked...............: avg=16.78µs  min=1.58µs  med=3.98µs   max=9.18ms  p(90)=5.89µs   p(95)=7.94µs   p(99.9)=2.97ms
     http_req_connecting............: avg=10.81µs  min=0s      med=0s       max=9.1ms   p(90)=0s       p(95)=0s       p(99.9)=2.94ms
     http_req_duration..............: avg=947.42ms min=6.52ms  med=861.56ms max=5.9s    p(90)=1.87s    p(95)=2.15s    p(99.9)=4.97s 
       { expected_response:true }...: avg=947.42ms min=6.52ms  med=861.56ms max=5.9s    p(90)=1.87s    p(95)=2.15s    p(99.9)=4.97s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15419
     http_req_receiving.............: avg=103.19µs min=39.15µs med=95.51µs  max=6.86ms  p(90)=135.36µs p(95)=151.93µs p(99.9)=1.11ms
     http_req_sending...............: avg=31.95µs  min=7.16µs  med=18.82µs  max=17.18ms p(90)=25.33µs  p(95)=32.36µs  p(99.9)=2.72ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=947.28ms min=6.42ms  med=861.4ms  max=5.9s    p(90)=1.87s    p(95)=2.15s    p(99.9)=4.97s 
     http_reqs......................: 15419   226.195597/s
     iteration_duration.............: avg=1.01s    min=26.94ms med=957.27ms max=5.91s   p(90)=1.89s    p(95)=2.18s    p(99.9)=5.04s 
     iterations.....................: 14419   211.52567/s
     success_rate...................: 100.00% ✓ 14419      ✗ 0    
     vus............................: 63      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 42147      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   260 kB/s
     http_req_blocked...............: avg=10.88µs  min=1.33µs  med=3.08µs   max=2.21ms  p(90)=4.84µs   p(95)=6.36µs   p(99.9)=1.12ms
     http_req_connecting............: avg=5.99µs   min=0s      med=0s       max=2.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.09ms
     http_req_duration..............: avg=967.2ms  min=8.56ms  med=877.03ms max=3.86s   p(90)=1.96s    p(95)=2.11s    p(99.9)=3.29s 
       { expected_response:true }...: avg=967.2ms  min=8.56ms  med=877.03ms max=3.86s   p(90)=1.96s    p(95)=2.11s    p(99.9)=3.29s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15049
     http_req_receiving.............: avg=96.09µs  min=32.84µs med=88.33µs  max=19.05ms p(90)=124.14µs p(95)=139.14µs p(99.9)=1.02ms
     http_req_sending...............: avg=30.16µs  min=6.22µs  med=16.75µs  max=61.1ms  p(90)=22.44µs  p(95)=28.74µs  p(99.9)=2.26ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=967.08ms min=8.42ms  med=876.88ms max=3.85s   p(90)=1.96s    p(95)=2.11s    p(99.9)=3.29s 
     http_reqs......................: 15049   216.962651/s
     iteration_duration.............: avg=1.03s    min=31.2ms  med=972.91ms max=3.86s   p(90)=1.98s    p(95)=2.12s    p(99.9)=3.32s 
     iterations.....................: 14049   202.54557/s
     success_rate...................: 100.00% ✓ 14049      ✗ 0    
     vus............................: 78      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 2985      ✗ 0    
     data_received..................: 191 MB  1.6 MB/s
     data_sent......................: 2.9 MB  24 kB/s
     http_req_blocked...............: avg=38.59µs min=1.41µs   med=3.25µs  max=2.93ms p(90)=4.84µs   p(95)=10.2µs   p(99.9)=2.72ms 
     http_req_connecting............: avg=32.18µs min=0s       med=0s      max=2.89ms p(90)=0s       p(95)=0s       p(99.9)=2.69ms 
     http_req_duration..............: avg=2.55s   min=24.84ms  med=63.73ms max=50.26s p(90)=6.2s     p(95)=7.75s    p(99.9)=49.97s 
       { expected_response:true }...: avg=2.55s   min=24.84ms  med=63.73ms max=50.26s p(90)=6.2s     p(95)=7.75s    p(99.9)=49.97s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 1995 
     http_req_receiving.............: avg=105.6µs min=34.35µs  med=98.11µs max=1.19ms p(90)=140.42µs p(95)=161.36µs p(99.9)=337.5µs
     http_req_sending...............: avg=76.59µs min=6.31µs   med=18.45µs max=39.8ms p(90)=23.59µs  p(95)=39.21µs  p(99.9)=9.84ms 
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.55s   min=24.7ms   med=63.58ms max=50.26s p(90)=6.2s     p(95)=7.75s    p(99.9)=49.97s 
     http_reqs......................: 1995    16.276728/s
     iteration_duration.............: avg=5.05s   min=590.91ms med=3.99s   max=50.26s p(90)=7.74s    p(95)=9.33s    p(99.9)=50.17s 
     iterations.....................: 995     8.117967/s
     success_rate...................: 100.00% ✓ 995       ✗ 0    
     vus............................: 35      min=0       max=500
     vus_max........................: 500     min=500     max=500
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

     checks.........................: 100.00% ✓ 414318      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=28.56µs  min=1.12µs  med=3.31µs  max=85.68ms  p(90)=5.38µs   p(95)=6.83µs   p(99.9)=3.27ms  
     http_req_connecting............: avg=23.96µs  min=0s      med=0s      max=74.95ms  p(90)=0s       p(95)=0s       p(99.9)=3.2ms   
     http_req_duration..............: avg=102.21ms min=1.74ms  med=95.75ms max=418ms    p(90)=197.09ms p(95)=215.41ms p(99.9)=268.18ms
       { expected_response:true }...: avg=102.21ms min=1.74ms  med=95.75ms max=418ms    p(90)=197.09ms p(95)=215.41ms p(99.9)=268.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139106
     http_req_receiving.............: avg=210.01µs min=29.84µs med=64.13µs max=280.77ms p(90)=180.34µs p(95)=422.66µs p(99.9)=23.58ms 
     http_req_sending...............: avg=88.59µs  min=5.59µs  med=12.98µs max=139.17ms p(90)=26.04µs  p(95)=151.79µs p(99.9)=12.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.91ms min=1.69ms  med=95.5ms  max=307.36ms p(90)=196.66ms p(95)=214.97ms p(99.9)=266.01ms
     http_reqs......................: 139106  2239.794335/s
     iteration_duration.............: avg=103.26ms min=4.67ms  med=97.01ms max=428.76ms p(90)=197.69ms p(95)=216.01ms p(99.9)=269.54ms
     iterations.....................: 138106  2223.692986/s
     success_rate...................: 100.00% ✓ 138106      ✗ 0     
     vus............................: 63      min=0         max=497 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 363987      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 147 MB  2.4 MB/s
     http_req_blocked...............: avg=15.83µs  min=1.05µs  med=2.49µs   max=47.3ms   p(90)=4.22µs   p(95)=5.45µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=12.63µs  min=0s      med=0s       max=47.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.56ms  
     http_req_duration..............: avg=116.4ms  min=1.82ms  med=101.38ms max=2.41s    p(90)=219ms    p(95)=251.88ms p(99.9)=862.4ms 
       { expected_response:true }...: avg=116.4ms  min=1.82ms  med=101.38ms max=2.41s    p(90)=219ms    p(95)=251.88ms p(99.9)=862.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 122329
     http_req_receiving.............: avg=2.63ms   min=55.26µs med=123.45µs max=730.72ms p(90)=3.66ms   p(95)=10.93ms  p(99.9)=138.98ms
     http_req_sending...............: avg=64.37µs  min=5.53µs  med=10.46µs  max=114.57ms p(90)=20.8µs   p(95)=103.99µs p(99.9)=8.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.7ms  min=1.73ms  med=99.33ms  max=2.41s    p(90)=215.76ms p(95)=247.55ms p(99.9)=838.49ms
     http_reqs......................: 122329  1963.935062/s
     iteration_duration.............: avg=117.65ms min=3.92ms  med=102.81ms max=2.41s    p(90)=219.72ms p(95)=252.71ms p(99.9)=863.95ms
     iterations.....................: 121329  1947.880529/s
     success_rate...................: 100.00% ✓ 121329      ✗ 0     
     vus............................: 72      min=0         max=494 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 362547      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 146 MB  2.4 MB/s
     http_req_blocked...............: avg=10.41µs  min=1.02µs med=2.36µs   max=30.3ms   p(90)=3.9µs    p(95)=5.05µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=7.29µs   min=0s     med=0s       max=30.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=116.79ms min=1.73ms med=111.88ms max=597.66ms p(90)=221.84ms p(95)=240ms    p(99.9)=378.67ms
       { expected_response:true }...: avg=116.79ms min=1.73ms med=111.88ms max=597.66ms p(90)=221.84ms p(95)=240ms    p(99.9)=378.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 121849
     http_req_receiving.............: avg=1.12ms   min=55.7µs med=135.5µs  max=334.15ms p(90)=1.95ms   p(95)=3.6ms    p(99.9)=41.78ms 
     http_req_sending...............: avg=52.98µs  min=5.37µs med=10.05µs  max=107.31ms p(90)=19.48µs  p(95)=100.4µs  p(99.9)=6.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.61ms min=1.62ms med=110.74ms max=597.18ms p(90)=220.44ms p(95)=238.39ms p(99.9)=377.6ms 
     http_reqs......................: 121849  1960.143671/s
     iteration_duration.............: avg=118.02ms min=4.15ms med=113.23ms max=597.88ms p(90)=222.43ms p(95)=240.52ms p(99.9)=379.27ms
     iterations.....................: 120849  1944.057009/s
     success_rate...................: 100.00% ✓ 120849      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 253104      ✗ 0    
     data_received..................: 7.5 GB  119 MB/s
     data_sent......................: 103 MB  1.6 MB/s
     http_req_blocked...............: avg=11.84µs  min=1.13µs  med=3.52µs   max=45.08ms  p(90)=6.03µs   p(95)=7.59µs   p(99.9)=1.12ms  
     http_req_connecting............: avg=7.27µs   min=0s      med=0s       max=44.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=166.94ms min=2.36ms  med=155.23ms max=639.24ms p(90)=332.08ms p(95)=376.99ms p(99.9)=546.65ms
       { expected_response:true }...: avg=166.94ms min=2.36ms  med=155.23ms max=639.24ms p(90)=332.08ms p(95)=376.99ms p(99.9)=546.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 85368
     http_req_receiving.............: avg=157.57µs min=31.24µs med=75.69µs  max=170.32ms p(90)=136.8µs  p(95)=223.47µs p(99.9)=7.13ms  
     http_req_sending...............: avg=56.91µs  min=6.08µs  med=14.83µs  max=46.17ms  p(90)=26.6µs   p(95)=63.24µs  p(99.9)=6.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=166.73ms min=2.28ms  med=154.98ms max=638.98ms p(90)=331.9ms  p(95)=376.86ms p(99.9)=546.58ms
     http_reqs......................: 85368   1357.012918/s
     iteration_duration.............: avg=169.24ms min=7.19ms  med=158.12ms max=639.48ms p(90)=333.33ms p(95)=377.89ms p(99.9)=547.01ms
     iterations.....................: 84368   1341.116881/s
     success_rate...................: 100.00% ✓ 84368       ✗ 0    
     vus............................: 53      min=0         max=499
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 197826      ✗ 0    
     data_received..................: 5.9 GB  93 MB/s
     data_sent......................: 80 MB   1.3 MB/s
     http_req_blocked...............: avg=6.05µs   min=1.1µs   med=2.63µs   max=9.27ms   p(90)=4.54µs   p(95)=5.63µs   p(99.9)=531.58µs
     http_req_connecting............: avg=2.67µs   min=0s      med=0s       max=9.2ms    p(90)=0s       p(95)=0s       p(99.9)=468.59µs
     http_req_duration..............: avg=213.22ms min=2.25ms  med=215.02ms max=668.75ms p(90)=391.81ms p(95)=423.42ms p(99.9)=556.17ms
       { expected_response:true }...: avg=213.22ms min=2.25ms  med=215.02ms max=668.75ms p(90)=391.81ms p(95)=423.42ms p(99.9)=556.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 66942
     http_req_receiving.............: avg=83.36µs  min=28.48µs med=69.65µs  max=42.47ms  p(90)=110.88µs p(95)=126.75µs p(99.9)=1.17ms  
     http_req_sending...............: avg=31.84µs  min=5.44µs  med=12.8µs   max=104.3ms  p(90)=20.52µs  p(95)=24.58µs  p(99.9)=3.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.1ms  min=2.19ms  med=214.92ms max=668.68ms p(90)=391.7ms  p(95)=423.25ms p(99.9)=556.07ms
     http_reqs......................: 66942   1066.290221/s
     iteration_duration.............: avg=216.73ms min=4.66ms  med=218.98ms max=668.91ms p(90)=393.01ms p(95)=424.19ms p(99.9)=557.06ms
     iterations.....................: 65942   1050.361652/s
     success_rate...................: 100.00% ✓ 65942       ✗ 0    
     vus............................: 94      min=0         max=500
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 89157      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   565 kB/s
     http_req_blocked...............: avg=10.14µs  min=1.42µs  med=3.48µs   max=11.46ms p(90)=5.27µs   p(95)=6.44µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=5.47µs   min=0s      med=0s       max=11.41ms p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=467.55ms min=4.36ms  med=428.39ms max=2.24s   p(90)=932.45ms p(95)=1.01s    p(99.9)=1.52s   
       { expected_response:true }...: avg=467.55ms min=4.36ms  med=428.39ms max=2.24s   p(90)=932.45ms p(95)=1.01s    p(99.9)=1.52s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30719
     http_req_receiving.............: avg=97.86µs  min=33.94µs med=80.65µs  max=98.48ms p(90)=117.51µs p(95)=132.32µs p(99.9)=923.53µs
     http_req_sending...............: avg=34.39µs  min=6.5µs   med=16.61µs  max=193.8ms p(90)=23.63µs  p(95)=27.64µs  p(99.9)=2.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=467.42ms min=4.29ms  med=428.26ms max=2.24s   p(90)=932.37ms p(95)=1.01s    p(99.9)=1.52s   
     http_reqs......................: 30719   470.608956/s
     iteration_duration.............: avg=483.54ms min=23.77ms med=449.17ms max=2.25s   p(90)=937.64ms p(95)=1.01s    p(99.9)=1.53s   
     iterations.....................: 29719   455.289155/s
     success_rate...................: 100.00% ✓ 29719      ✗ 0    
     vus............................: 69      min=0        max=496
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 61761      ✗ 0    
     data_received..................: 1.9 GB  28 MB/s
     data_sent......................: 26 MB   388 kB/s
     http_req_blocked...............: avg=10.97µs  min=1.51µs  med=3.67µs   max=5.12ms   p(90)=5.51µs   p(95)=6.91µs   p(99.9)=1.47ms
     http_req_connecting............: avg=5.77µs   min=0s      med=0s       max=5.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.45ms
     http_req_duration..............: avg=669.27ms min=5.92ms  med=628.85ms max=4.48s    p(90)=1.32s    p(95)=1.52s    p(99.9)=2.62s 
       { expected_response:true }...: avg=669.27ms min=5.92ms  med=628.85ms max=4.48s    p(90)=1.32s    p(95)=1.52s    p(99.9)=2.62s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 21587
     http_req_receiving.............: avg=153.2µs  min=35.82µs med=85.91µs  max=212.55ms p(90)=123.25µs p(95)=139.37µs p(99.9)=1.53ms
     http_req_sending...............: avg=55.34µs  min=5.75µs  med=18.09µs  max=190.54ms p(90)=24.71µs  p(95)=29.63µs  p(99.9)=5.06ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=669.06ms min=5.84ms  med=628.74ms max=4.48s    p(90)=1.32s    p(95)=1.52s    p(99.9)=2.62s 
     http_reqs......................: 21587   323.454933/s
     iteration_duration.............: avg=701.93ms min=20.02ms med=676.22ms max=4.48s    p(90)=1.34s    p(95)=1.53s    p(99.9)=2.64s 
     iterations.....................: 20587   308.471149/s
     success_rate...................: 100.00% ✓ 20587      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40530      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   252 kB/s
     http_req_blocked...............: avg=12.15µs  min=1.3µs   med=3.15µs   max=2.6ms   p(90)=5.06µs   p(95)=7.36µs  p(99.9)=1.48ms
     http_req_connecting............: avg=7.11µs   min=0s      med=0s       max=2.58ms  p(90)=0s       p(95)=0s      p(99.9)=1.45ms
     http_req_duration..............: avg=1s       min=7ms     med=898.58ms max=6.32s   p(90)=1.97s    p(95)=2.23s   p(99.9)=5.72s 
       { expected_response:true }...: avg=1s       min=7ms     med=898.58ms max=6.32s   p(90)=1.97s    p(95)=2.23s   p(99.9)=5.72s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14510
     http_req_receiving.............: avg=104.72µs min=35.41µs med=90.03µs  max=96.72ms p(90)=127.29µs p(95)=141.9µs p(99.9)=1.2ms 
     http_req_sending...............: avg=36.04µs  min=6.08µs  med=17.44µs  max=43.67ms p(90)=23.65µs  p(95)=30.02µs p(99.9)=2.75ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=6.92ms  med=898.47ms max=6.32s   p(90)=1.97s    p(95)=2.23s   p(99.9)=5.72s 
     http_reqs......................: 14510   209.869398/s
     iteration_duration.............: avg=1.08s    min=29.81ms med=991.86ms max=6.33s   p(90)=2.01s    p(95)=2.25s   p(99.9)=5.75s 
     iterations.....................: 13510   195.405622/s
     success_rate...................: 100.00% ✓ 13510      ✗ 0    
     vus............................: 54      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 39381      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   242 kB/s
     http_req_blocked...............: avg=16.14µs  min=1.53µs  med=3.65µs   max=3.91ms  p(90)=5.57µs   p(95)=7.95µs   p(99.9)=2.57ms
     http_req_connecting............: avg=10.38µs  min=0s      med=0s       max=3.87ms  p(90)=0s       p(95)=0s       p(99.9)=2.54ms
     http_req_duration..............: avg=1.03s    min=9.12ms  med=942.02ms max=4.57s   p(90)=2.1s     p(95)=2.24s    p(99.9)=3.97s 
       { expected_response:true }...: avg=1.03s    min=9.12ms  med=942.02ms max=4.57s   p(90)=2.1s     p(95)=2.24s    p(99.9)=3.97s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14127
     http_req_receiving.............: avg=108.46µs min=38.78µs med=94.28µs  max=35.01ms p(90)=134.38µs p(95)=151.63µs p(99.9)=1.46ms
     http_req_sending...............: avg=32.72µs  min=6.87µs  med=18.21µs  max=14.49ms p(90)=24.55µs  p(95)=31.62µs  p(99.9)=3.63ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.03s    min=9.03ms  med=941.94ms max=4.56s   p(90)=2.1s     p(95)=2.24s    p(99.9)=3.97s 
     http_reqs......................: 14127   201.446618/s
     iteration_duration.............: avg=1.11s    min=22.86ms med=1.03s    max=4.57s   p(90)=2.11s    p(95)=2.26s    p(99.9)=4.08s 
     iterations.....................: 13127   187.18693/s
     success_rate...................: 100.00% ✓ 13127      ✗ 0    
     vus............................: 63      min=0        max=499
     vus_max........................: 500     min=500      max=500
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
data_received..................: 93 MB  1.5 MB/s
     data_sent......................: 1.2 MB 19 kB/s
     http_req_blocked...............: avg=4.09µs   min=2.63µs  med=3.49µs   max=221.09µs p(90)=4.85µs   p(95)=5.32µs   p(99.9)=54.62µs 
     http_req_connecting............: avg=119ns    min=0s      med=0s       max=116.19µs p(90)=0s       p(95)=0s       p(99.9)=3.6µs   
     http_req_duration..............: avg=61.73ms  min=27.32ms med=42.72ms  max=18.98s   p(90)=51.33ms  p(95)=53.59ms  p(99.9)=692.05ms
       { expected_response:true }...: avg=61.73ms  min=27.32ms med=42.72ms  max=18.98s   p(90)=51.33ms  p(95)=53.59ms  p(99.9)=692.05ms
     http_req_failed................: 0.00%  ✓ 0         ✗ 970  
     http_req_receiving.............: avg=112.76µs min=70.14µs med=107.38µs max=361.78µs p(90)=146.69µs p(95)=166.78µs p(99.9)=349.01µs
     http_req_sending...............: avg=19.75µs  min=13.55µs med=19.12µs  max=184.59µs p(90)=21.66µs  p(95)=23.19µs  p(99.9)=136.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=61.6ms   min=27.22ms med=42.6ms   max=18.98s   p(90)=51.21ms  p(95)=53.45ms  p(99.9)=691.86ms
     http_reqs......................: 970    16.166514/s
     vus............................: 0      min=0       max=0  
     vus_max........................: 500    min=500     max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB

