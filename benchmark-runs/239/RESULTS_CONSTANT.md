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
| hive-router | v0.0.72 | 2,798 | 2,996 | 2,775 | 2.7% |  |
| fusion-nightly | 16.4.0-p.3 | 2,173 | 2,212 | 2,166 | 0.7% |  |
| fusion | 16.3.0 | 2,131 | 2,179 | 2,113 | 1.0% |  |
| grafbase | 0.53.5 | 2,029 | 2,109 | 2,016 | 1.6% |  |
| cosmo | 0.326.0 | 1,181 | 1,208 | 1,176 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 561 | 574 | 553 | 1.1% |  |
| apollo-router | v2.15.1 | 410 | 423 | 405 | 1.4% |  |
| apollo-gateway | 2.14.1 | 247 | 249 | 246 | 0.4% |  |
| hive-gateway | 2.9.0 | 237 | 243 | 235 | 1.2% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,285 | 2,428 | 2,267 | 2.3% |  |
| fusion-nightly | 16.4.0-p.3 | 2,099 | 2,148 | 2,091 | 0.9% |  |
| fusion | 16.3.0 | 1,986 | 2,041 | 1,978 | 1.1% |  |
| grafbase | 0.53.5 | 1,503 | 1,529 | 1,498 | 0.7% |  |
| cosmo | 0.326.0 | 1,130 | 1,152 | 1,126 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 521 | 535 | 516 | 1.3% |  |
| apollo-router | v2.15.1 | 405 | 412 | 397 | 1.4% |  |
| hive-gateway | 2.9.0 | 241 | 246 | 239 | 1.0% |  |
| apollo-gateway | 2.14.1 | 236 | 238 | 234 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1009038     ✗ 0     
     data_received..................: 30 GB   246 MB/s
     data_sent......................: 404 MB  3.4 MB/s
     http_req_blocked...............: avg=2.81µs   min=992ns   med=2.06µs  max=16.34ms  p(90)=3.13µs  p(95)=3.74µs   p(99.9)=30.59µs
     http_req_connecting............: avg=306ns    min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.6ms   min=1.63ms  med=16.76ms max=323.85ms p(90)=26.12ms p(95)=29.69ms  p(99.9)=52.34ms
       { expected_response:true }...: avg=17.6ms   min=1.63ms  med=16.76ms max=323.85ms p(90)=26.12ms p(95)=29.69ms  p(99.9)=52.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 336446
     http_req_receiving.............: avg=114.72µs min=26.81µs med=50.88µs max=45.71ms  p(90)=93.48µs p(95)=259.12µs p(99.9)=10.82ms
     http_req_sending...............: avg=55.07µs  min=5.11µs  med=9.16µs  max=196.77ms p(90)=15.28µs p(95)=120.98µs p(99.9)=6.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.43ms  min=1.53ms  med=16.61ms max=323.29ms p(90)=25.89ms p(95)=29.38ms  p(99.9)=51.04ms
     http_reqs......................: 336446  2798.953664/s
     iteration_duration.............: avg=17.82ms  min=2.07ms  med=16.96ms max=333.21ms p(90)=26.34ms p(95)=29.94ms  p(99.9)=52.94ms
     iterations.....................: 336346  2798.121747/s
     success_rate...................: 100.00% ✓ 336346      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 783789      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=3.34µs  min=992ns   med=2.39µs   max=16.3ms   p(90)=3.61µs  p(95)=4.25µs   p(99.9)=34.8µs  
     http_req_connecting............: avg=415ns   min=0s      med=0s       max=4.65ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.72ms min=2.29ms  med=19.24ms  max=354.89ms p(90)=39.38ms p(95)=49.44ms  p(99.9)=117.38ms
       { expected_response:true }...: avg=22.72ms min=2.29ms  med=19.24ms  max=354.89ms p(90)=39.38ms p(95)=49.44ms  p(99.9)=117.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261363
     http_req_receiving.............: avg=1.07ms  min=52.32µs med=362.17µs max=321.53ms p(90)=2.14ms  p(95)=3.18ms   p(99.9)=41.66ms 
     http_req_sending...............: avg=44.59µs min=5.14µs  med=9.68µs   max=46.68ms  p(90)=17.29µs p(95)=113.74µs p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.6ms  min=2.16ms  med=18.17ms  max=198.18ms p(90)=37.81ms p(95)=47.62ms  p(99.9)=113.05ms
     http_reqs......................: 261363  2173.145637/s
     iteration_duration.............: avg=22.95ms min=3.25ms  med=19.46ms  max=391.33ms p(90)=39.63ms p(95)=49.69ms  p(99.9)=118.25ms
     iterations.....................: 261263  2172.314171/s
     success_rate...................: 100.00% ✓ 261263      ✗ 0     
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

     checks.........................: 100.00% ✓ 768711      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=2.7µs    min=992ns  med=2.01µs   max=12.29ms  p(90)=3.08µs  p(95)=3.66µs  p(99.9)=31.43µs 
     http_req_connecting............: avg=256ns    min=0s     med=0s       max=3.43ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.17ms  min=2.44ms med=15.17ms  max=407.35ms p(90)=50.87ms p(95)=68.48ms p(99.9)=164.77ms
       { expected_response:true }...: avg=23.17ms  min=2.44ms med=15.17ms  max=407.35ms p(90)=50.87ms p(95)=68.48ms p(99.9)=164.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256337
     http_req_receiving.............: avg=958.11µs min=50.5µs med=139.59µs max=195.27ms p(90)=1.35ms  p(95)=2.19ms  p(99.9)=63.45ms 
     http_req_sending...............: avg=40.89µs  min=5.18µs med=8.88µs   max=91.5ms   p(90)=14.65µs p(95)=95.01µs p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.17ms  min=2.3ms  med=14.38ms  max=405.04ms p(90)=49.01ms p(95)=66.58ms p(99.9)=160.85ms
     http_reqs......................: 256337  2131.090489/s
     iteration_duration.............: avg=23.4ms   min=2.95ms med=15.39ms  max=407.55ms p(90)=51.11ms p(95)=68.72ms p(99.9)=167.1ms 
     iterations.....................: 256237  2130.259126/s
     success_rate...................: 100.00% ✓ 256237      ✗ 0     
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

     checks.........................: 100.00% ✓ 732045      ✗ 0     
     data_received..................: 22 GB   178 MB/s
     data_sent......................: 293 MB  2.4 MB/s
     http_req_blocked...............: avg=3.05µs   min=1.01µs  med=2.15µs  max=9.05ms   p(90)=3.48µs  p(95)=4.2µs    p(99.9)=40.95µs
     http_req_connecting............: avg=430ns    min=0s      med=0s      max=4.36ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.34ms  min=1.93ms  med=24.08ms max=312.4ms  p(90)=29.21ms p(95)=31.45ms  p(99.9)=53.43ms
       { expected_response:true }...: avg=24.34ms  min=1.93ms  med=24.08ms max=312.4ms  p(90)=29.21ms p(95)=31.45ms  p(99.9)=53.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244115
     http_req_receiving.............: avg=110.75µs min=30.16µs med=57.82µs max=286.72ms p(90)=99.18µs p(95)=174.86µs p(99.9)=8.64ms 
     http_req_sending...............: avg=43.37µs  min=5.12µs  med=9.72µs  max=91.93ms  p(90)=16.84µs p(95)=108.45µs p(99.9)=3.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.19ms  min=1.84ms  med=23.97ms max=296.14ms p(90)=29.04ms p(95)=31.21ms  p(99.9)=52.35ms
     http_reqs......................: 244115  2029.875485/s
     iteration_duration.............: avg=24.58ms  min=3.27ms  med=24.29ms max=343.89ms p(90)=29.43ms p(95)=31.69ms  p(99.9)=54.03ms
     iterations.....................: 244015  2029.04396/s
     success_rate...................: 100.00% ✓ 244015      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 426150      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.5µs    min=1.08µs  med=2.45µs  max=4.01ms   p(90)=3.87µs   p(95)=4.51µs  p(99.9)=39.07µs
     http_req_connecting............: avg=707ns    min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=41.99ms  min=2.08ms  med=41.43ms max=301.51ms p(90)=59.37ms  p(95)=64.74ms p(99.9)=91.76ms
       { expected_response:true }...: avg=41.99ms  min=2.08ms  med=41.43ms max=301.51ms p(90)=59.37ms  p(95)=64.74ms p(99.9)=91.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142150
     http_req_receiving.............: avg=106.94µs min=28.97µs med=65.24µs max=183.64ms p(90)=101.77µs p(95)=119.5µs p(99.9)=2.16ms 
     http_req_sending...............: avg=25.27µs  min=5.33µs  med=10.97µs max=185.89ms p(90)=16.88µs  p(95)=20.88µs p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.85ms  min=2.01ms  med=41.32ms max=152.2ms  p(90)=59.26ms  p(95)=64.62ms p(99.9)=91ms   
     http_reqs......................: 142150  1181.794808/s
     iteration_duration.............: avg=42.23ms  min=4.6ms   med=41.63ms max=365.28ms p(90)=59.59ms  p(95)=64.95ms p(99.9)=92.63ms
     iterations.....................: 142050  1180.963436/s
     success_rate...................: 100.00% ✓ 142050      ✗ 0     
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

     checks.........................: 100.00% ✓ 202659     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   674 kB/s
     http_req_blocked...............: avg=4.78µs  min=1.17µs  med=2.78µs  max=4.78ms   p(90)=4.32µs   p(95)=4.95µs   p(99.9)=44.86µs 
     http_req_connecting............: avg=1.7µs   min=0s      med=0s      max=4.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.48ms min=3.95ms  med=86.87ms max=347.83ms p(90)=108.83ms p(95)=119.51ms p(99.9)=220.94ms
       { expected_response:true }...: avg=88.48ms min=3.95ms  med=86.87ms max=347.83ms p(90)=108.83ms p(95)=119.51ms p(99.9)=220.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67653
     http_req_receiving.............: avg=85.29µs min=30.06µs med=75.7µs  max=96.13ms  p(90)=110.81µs p(95)=123.27µs p(99.9)=951.04µs
     http_req_sending...............: avg=25.6µs  min=5.36µs  med=13.18µs max=195.83ms p(90)=20.05µs  p(95)=22.36µs  p(99.9)=629.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.37ms min=3.87ms  med=86.77ms max=347.53ms p(90)=108.72ms p(95)=119.37ms p(99.9)=219.77ms
     http_reqs......................: 67653   561.168367/s
     iteration_duration.............: avg=88.85ms min=37.66ms med=87.1ms  max=380.73ms p(90)=109.08ms p(95)=119.8ms  p(99.9)=225.72ms
     iterations.....................: 67553   560.338887/s
     success_rate...................: 100.00% ✓ 67553      ✗ 0    
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

     checks.........................: 100.00% ✓ 148257     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   493 kB/s
     http_req_blocked...............: avg=5.42µs   min=1.18µs  med=3.17µs   max=4.04ms   p(90)=4.58µs   p(95)=5.12µs   p(99.9)=149.96µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=74.6µs  
     http_req_duration..............: avg=120.94ms min=5.26ms  med=120.66ms max=358.19ms p(90)=146.12ms p(95)=153.57ms p(99.9)=189.71ms
       { expected_response:true }...: avg=120.94ms min=5.26ms  med=120.66ms max=358.19ms p(90)=146.12ms p(95)=153.57ms p(99.9)=189.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49519
     http_req_receiving.............: avg=88.22µs  min=32.18µs med=82.21µs  max=61.9ms   p(90)=113.46µs p(95)=125.36µs p(99.9)=728.61µs
     http_req_sending...............: avg=27.22µs  min=6.06µs  med=14.89µs  max=101.02ms p(90)=20.58µs  p(95)=22.45µs  p(99.9)=622.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.83ms min=5.15ms  med=120.55ms max=357.5ms  p(90)=146.01ms p(95)=153.46ms p(99.9)=189.37ms
     http_reqs......................: 49519   410.28789/s
     iteration_duration.............: avg=121.45ms min=22.56ms med=120.94ms max=390.6ms  p(90)=146.37ms p(95)=153.84ms p(99.9)=194.02ms
     iterations.....................: 49419   409.459344/s
     success_rate...................: 100.00% ✓ 49419      ✗ 0    
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

     checks.........................: 100.00% ✓ 89430      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=7.31µs   min=1.26µs  med=3.33µs   max=4.29ms   p(90)=4.6µs    p(95)=5.13µs   p(99.9)=2.03ms  
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=200.44ms min=8.56ms  med=210.96ms max=423.15ms p(90)=229.48ms p(95)=232.56ms p(99.9)=306.79ms
       { expected_response:true }...: avg=200.44ms min=8.56ms  med=210.96ms max=423.15ms p(90)=229.48ms p(95)=232.56ms p(99.9)=306.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29910
     http_req_receiving.............: avg=95.68µs  min=33.56µs med=91.18µs  max=17.1ms   p(90)=122.61µs p(95)=135.09µs p(99.9)=539.53µs
     http_req_sending...............: avg=27.75µs  min=6µs     med=17.08µs  max=75.36ms  p(90)=21.81µs  p(95)=23.62µs  p(99.9)=575.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.32ms min=8.47ms  med=210.49ms max=422.8ms  p(90)=229.35ms p(95)=232.45ms p(99.9)=306.46ms
     http_reqs......................: 29910   247.031701/s
     iteration_duration.............: avg=201.39ms min=34.09ms med=215.69ms max=433.02ms p(90)=229.76ms p(95)=232.84ms p(99.9)=309.18ms
     iterations.....................: 29810   246.205784/s
     success_rate...................: 100.00% ✓ 29810      ✗ 0    
     vus............................: 34      min=34       max=50 
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

     checks.........................: 100.00% ✓ 85938      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.21µs   min=1.3µs   med=3.43µs   max=4.22ms   p(90)=4.83µs   p(95)=5.46µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=208.56ms min=6.69ms  med=186.64ms max=769.96ms p(90)=269.92ms p(95)=459.77ms p(99.9)=605.27ms
       { expected_response:true }...: avg=208.56ms min=6.69ms  med=186.64ms max=769.96ms p(90)=269.92ms p(95)=459.77ms p(99.9)=605.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28746
     http_req_receiving.............: avg=102.18µs min=36.62µs med=94.4µs   max=68.06ms  p(90)=126.81µs p(95)=140.32µs p(99.9)=589.2µs 
     http_req_sending...............: avg=26.07µs  min=6.36µs  med=17.44µs  max=58.79ms  p(90)=22.7µs   p(95)=24.55µs  p(99.9)=644.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.44ms min=6.59ms  med=186.52ms max=769.82ms p(90)=269.8ms  p(95)=459.65ms p(99.9)=605.14ms
     http_reqs......................: 28746   237.616059/s
     iteration_duration.............: avg=209.58ms min=39.18ms med=187.07ms max=770.2ms  p(90)=270.66ms p(95)=460.58ms p(99.9)=605.55ms
     iterations.....................: 28646   236.789453/s
     success_rate...................: 100.00% ✓ 28646      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 824052      ✗ 0     
     data_received..................: 24 GB   200 MB/s
     data_sent......................: 330 MB  2.7 MB/s
     http_req_blocked...............: avg=3.04µs   min=972ns   med=2.18µs  max=13.92ms  p(90)=3.56µs   p(95)=4.33µs   p(99.9)=37.6µs 
     http_req_connecting............: avg=384ns    min=0s      med=0s      max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.6ms   min=1.98ms  med=21.24ms max=310.03ms p(90)=29.73ms  p(95)=32.54ms  p(99.9)=53.94ms
       { expected_response:true }...: avg=21.6ms   min=1.98ms  med=21.24ms max=310.03ms p(90)=29.73ms  p(95)=32.54ms  p(99.9)=53.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 274784
     http_req_receiving.............: avg=105.64µs min=27.91µs med=55.71µs max=91.2ms   p(90)=101.32µs p(95)=238.51µs p(99.9)=7.21ms 
     http_req_sending...............: avg=48.01µs  min=4.97µs  med=9.84µs  max=156.32ms p(90)=17.79µs  p(95)=121.62µs p(99.9)=3.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.44ms  min=1.86ms  med=21.1ms  max=309.32ms p(90)=29.55ms  p(95)=32.31ms  p(99.9)=53.08ms
     http_reqs......................: 274784  2285.234403/s
     iteration_duration.............: avg=21.83ms  min=3.72ms  med=21.45ms max=334.31ms p(90)=29.95ms  p(95)=32.77ms  p(99.9)=54.5ms 
     iterations.....................: 274684  2284.402755/s
     success_rate...................: 100.00% ✓ 274684      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 757092      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.23µs  min=952ns   med=2.29µs   max=10.17ms  p(90)=3.96µs  p(95)=4.76µs   p(99.9)=31.88µs 
     http_req_connecting............: avg=359ns   min=0s      med=0s       max=4.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.52ms min=1.81ms  med=20.84ms  max=329.79ms p(90)=39.02ms p(95)=47.53ms  p(99.9)=103.42ms
       { expected_response:true }...: avg=23.52ms min=1.81ms  med=20.84ms  max=329.79ms p(90)=39.02ms p(95)=47.53ms  p(99.9)=103.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252464
     http_req_receiving.............: avg=1.11ms  min=51.35µs med=303.27µs max=128.94ms p(90)=2.47ms  p(95)=3.75ms   p(99.9)=37.2ms  
     http_req_sending...............: avg=46.25µs min=5.12µs  med=9.68µs   max=36.99ms  p(90)=19.6µs  p(95)=117.28µs p(99.9)=3.82ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.35ms min=1.67ms  med=19.66ms  max=305.03ms p(90)=37.46ms p(95)=45.65ms  p(99.9)=101.3ms 
     http_reqs......................: 252464  2099.944976/s
     iteration_duration.............: avg=23.76ms min=2.24ms  med=21.07ms  max=345.46ms p(90)=39.27ms p(95)=47.78ms  p(99.9)=104.34ms
     iterations.....................: 252364  2099.113196/s
     success_rate...................: 100.00% ✓ 252364      ✗ 0     
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

     checks.........................: 100.00% ✓ 716340      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 287 MB  2.4 MB/s
     http_req_blocked...............: avg=3.12µs  min=972ns   med=2.15µs   max=13.01ms  p(90)=3.68µs  p(95)=4.43µs   p(99.9)=31.84µs 
     http_req_connecting............: avg=411ns   min=0s      med=0s       max=4.31ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.88ms min=1.84ms  med=18.21ms  max=319.86ms p(90)=50.01ms p(95)=67.14ms  p(99.9)=162.87ms
       { expected_response:true }...: avg=24.88ms min=1.84ms  med=18.21ms  max=319.86ms p(90)=50.01ms p(95)=67.14ms  p(99.9)=162.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 238880
     http_req_receiving.............: avg=1ms     min=51.55µs med=132.71µs max=283.67ms p(90)=1.65ms  p(95)=2.67ms   p(99.9)=62.01ms 
     http_req_sending...............: avg=40.33µs min=5.17µs  med=9.45µs   max=105.04ms p(90)=17.88µs p(95)=100.38µs p(99.9)=2.39ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.83ms min=1.73ms  med=17.35ms  max=311.66ms p(90)=48.08ms p(95)=65.12ms  p(99.9)=161.39ms
     http_reqs......................: 238880  1986.652167/s
     iteration_duration.............: avg=25.11ms min=2.6ms   med=18.44ms  max=351.93ms p(90)=50.26ms p(95)=67.38ms  p(99.9)=166.36ms
     iterations.....................: 238780  1985.820514/s
     success_rate...................: 100.00% ✓ 238780      ✗ 0     
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

     checks.........................: 100.00% ✓ 542433      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 217 MB  1.8 MB/s
     http_req_blocked...............: avg=3.48µs   min=982ns   med=2.34µs  max=13.06ms  p(90)=4.62µs  p(95)=5.84µs   p(99.9)=42.57µs
     http_req_connecting............: avg=425ns    min=0s      med=0s      max=3.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.91ms  min=2.46ms  med=32.06ms max=323.05ms p(90)=43.71ms p(95)=48.35ms  p(99.9)=86.48ms
       { expected_response:true }...: avg=32.91ms  min=2.46ms  med=32.06ms max=323.05ms p(90)=43.71ms p(95)=48.35ms  p(99.9)=86.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180911
     http_req_receiving.............: avg=112.42µs min=30.46µs med=61.68µs max=219.67ms p(90)=137µs   p(95)=292.56µs p(99.9)=4.71ms 
     http_req_sending...............: avg=49.38µs  min=5.27µs  med=10.32µs max=252.37ms p(90)=25.25µs p(95)=137.9µs  p(99.9)=2.99ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.75ms  min=2.34ms  med=31.92ms max=297.77ms p(90)=43.52ms p(95)=48.14ms  p(99.9)=85.96ms
     http_reqs......................: 180911  1503.581995/s
     iteration_duration.............: avg=33.17ms  min=3.65ms  med=32.3ms  max=351.1ms  p(90)=43.95ms p(95)=48.59ms  p(99.9)=87.19ms
     iterations.....................: 180811  1502.750878/s
     success_rate...................: 100.00% ✓ 180811      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 407802      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 163 MB  1.4 MB/s
     http_req_blocked...............: avg=3.65µs  min=1.01µs med=2.49µs  max=3.87ms   p(90)=4.21µs   p(95)=4.89µs  p(99.9)=37.25µs
     http_req_connecting............: avg=774ns   min=0s     med=0s      max=3.83ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=43.88ms min=2.42ms med=43.29ms max=349.54ms p(90)=61.47ms  p(95)=66.91ms p(99.9)=93.86ms
       { expected_response:true }...: avg=43.88ms min=2.42ms med=43.29ms max=349.54ms p(90)=61.47ms  p(95)=66.91ms p(99.9)=93.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136034
     http_req_receiving.............: avg=86.09µs min=29.1µs med=70.04µs max=65.6ms   p(90)=108.93µs p(95)=126.6µs p(99.9)=1.48ms 
     http_req_sending...............: avg=27.01µs min=5.18µs med=11.64µs max=223.47ms p(90)=18.8µs   p(95)=22.32µs p(99.9)=1.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=43.76ms min=2.26ms med=43.19ms max=349.02ms p(90)=61.37ms  p(95)=66.78ms p(99.9)=93.57ms
     http_reqs......................: 136034  1130.711671/s
     iteration_duration.............: avg=44.13ms min=4.37ms med=43.51ms max=356.94ms p(90)=61.7ms   p(95)=67.12ms p(99.9)=94.53ms
     iterations.....................: 135934  1129.880473/s
     success_rate...................: 100.00% ✓ 135934      ✗ 0     
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

     checks.........................: 100.00% ✓ 188367     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   626 kB/s
     http_req_blocked...............: avg=5.04µs  min=1.18µs  med=3.11µs  max=4.1ms    p(90)=4.66µs   p(95)=5.26µs   p(99.9)=46.76µs 
     http_req_connecting............: avg=1.66µs  min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.19ms min=4.29ms  med=91.83ms max=364.91ms p(90)=120.24ms p(95)=134.8ms  p(99.9)=242.42ms
       { expected_response:true }...: avg=95.19ms min=4.29ms  med=91.83ms max=364.91ms p(90)=120.24ms p(95)=134.8ms  p(99.9)=242.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62889
     http_req_receiving.............: avg=91.62µs min=32.35µs med=81.39µs max=133.11ms p(90)=115.79µs p(95)=129.55µs p(99.9)=988.56µs
     http_req_sending...............: avg=26.66µs min=5.48µs  med=14.22µs max=143.63ms p(90)=20.87µs  p(95)=22.99µs  p(99.9)=691.3µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.07ms min=4.16ms  med=91.73ms max=364.42ms p(90)=120.11ms p(95)=134.64ms p(99.9)=242.31ms
     http_reqs......................: 62889   521.482161/s
     iteration_duration.............: avg=95.58ms min=24.22ms med=92.08ms max=372.01ms p(90)=120.51ms p(95)=135.15ms p(99.9)=245.07ms
     iterations.....................: 62789   520.652951/s
     success_rate...................: 100.00% ✓ 62789      ✗ 0    
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

     checks.........................: 100.00% ✓ 146508     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   487 kB/s
     http_req_blocked...............: avg=5.86µs   min=1.21µs  med=3.45µs   max=4.46ms   p(90)=4.93µs   p(95)=5.52µs   p(99.9)=227.35µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=128.86µs
     http_req_duration..............: avg=122.38ms min=5.63ms  med=119.98ms max=366.54ms p(90)=162.04ms p(95)=174.27ms p(99.9)=227.74ms
       { expected_response:true }...: avg=122.38ms min=5.63ms  med=119.98ms max=366.54ms p(90)=162.04ms p(95)=174.27ms p(99.9)=227.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48936
     http_req_receiving.............: avg=151.03µs min=30.8µs  med=86.59µs  max=210.92ms p(90)=117.54µs p(95)=129.5µs  p(99.9)=1.05ms  
     http_req_sending...............: avg=22.42µs  min=5.77µs  med=16.93µs  max=23.2ms   p(90)=22.22µs  p(95)=24.08µs  p(99.9)=611.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.21ms min=5.5ms   med=119.88ms max=250.41ms p(90)=161.83ms p(95)=173.97ms p(99.9)=222.24ms
     http_reqs......................: 48936   405.392652/s
     iteration_duration.............: avg=122.89ms min=24.74ms med=120.29ms max=382.35ms p(90)=162.33ms p(95)=174.58ms p(99.9)=228.39ms
     iterations.....................: 48836   404.564238/s
     success_rate...................: 100.00% ✓ 48836      ✗ 0    
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

     checks.........................: 100.00% ✓ 87396      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.35µs   min=1.17µs  med=3.57µs   max=4.16ms   p(90)=5.07µs   p(95)=5.7µs    p(99.9)=1.87ms  
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=205.12ms min=6.6ms   med=183.1ms  max=778.41ms p(90)=269.44ms p(95)=323.36ms p(99.9)=647.32ms
       { expected_response:true }...: avg=205.12ms min=6.6ms   med=183.1ms  max=778.41ms p(90)=269.44ms p(95)=323.36ms p(99.9)=647.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29232
     http_req_receiving.............: avg=104.49µs min=33.13µs med=98µs     max=26.32ms  p(90)=130.82µs p(95)=144.88µs p(99.9)=713.76µs
     http_req_sending...............: avg=28.67µs  min=6.26µs  med=17.99µs  max=113.87ms p(90)=23.2µs   p(95)=24.94µs  p(99.9)=596.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.98ms min=6.47ms  med=182.95ms max=778.27ms p(90)=269.31ms p(95)=323.28ms p(99.9)=647.23ms
     http_reqs......................: 29232   241.467055/s
     iteration_duration.............: avg=206.11ms min=27.38ms med=183.6ms  max=778.74ms p(90)=269.88ms p(95)=327.78ms p(99.9)=647.62ms
     iterations.....................: 29132   240.641018/s
     success_rate...................: 100.00% ✓ 29132      ✗ 0    
     vus............................: 4       min=4        max=50 
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

     checks.........................: 100.00% ✓ 85686      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=7.45µs   min=1.21µs  med=3.55µs   max=4.59ms   p(90)=4.9µs    p(95)=5.47µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.64µs   min=0s      med=0s       max=4.55ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=209.2ms  min=9ms     med=214.54ms max=450.94ms p(90)=221.68ms p(95)=227.59ms p(99.9)=301.54ms
       { expected_response:true }...: avg=209.2ms  min=9ms     med=214.54ms max=450.94ms p(90)=221.68ms p(95)=227.59ms p(99.9)=301.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28662
     http_req_receiving.............: avg=107.88µs min=33.94µs med=95.67µs  max=111.48ms p(90)=127.94µs p(95)=141.36µs p(99.9)=616.32µs
     http_req_sending...............: avg=31.24µs  min=6.07µs  med=17.91µs  max=89.93ms  p(90)=22.8µs   p(95)=24.6µs   p(99.9)=555.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.06ms min=8.83ms  med=214.42ms max=450.3ms  p(90)=221.55ms p(95)=227.45ms p(99.9)=301.37ms
     http_reqs......................: 28662   236.562043/s
     iteration_duration.............: avg=210.23ms min=52.49ms med=214.82ms max=466.9ms  p(90)=221.98ms p(95)=227.88ms p(99.9)=312.65ms
     iterations.....................: 28562   235.736692/s
     success_rate...................: 100.00% ✓ 28562      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

