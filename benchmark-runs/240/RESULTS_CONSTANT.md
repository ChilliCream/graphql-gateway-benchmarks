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
| hive-router | v0.0.72 | 2,942 | 3,126 | 2,899 | 2.5% |  |
| fusion | 16.3.0 | 2,192 | 2,254 | 2,186 | 1.0% |  |
| grafbase | 0.53.5 | 2,019 | 2,087 | 1,993 | 1.6% |  |
| cosmo | 0.326.0 | 1,189 | 1,213 | 1,184 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 547 | 562 | 542 | 1.2% |  |
| apollo-router | v2.15.1 | 442 | 454 | 438 | 1.2% |  |
| apollo-gateway | 2.14.1 | 243 | 245 | 241 | 0.6% |  |
| hive-gateway | 2.9.0 | 233 | 239 | 231 | 1.1% |  |
| fusion-nightly | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,284 | 2,418 | 2,258 | 2.3% |  |
| fusion | 16.3.0 | 1,986 | 2,040 | 1,967 | 1.2% |  |
| grafbase | 0.53.5 | 1,482 | 1,510 | 1,464 | 1.0% |  |
| cosmo | 0.326.0 | 1,129 | 1,153 | 1,122 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 519 | 537 | 513 | 1.6% |  |
| apollo-router | v2.15.1 | 378 | 392 | 373 | 1.7% |  |
| apollo-gateway | 2.14.1 | 231 | 235 | 229 | 0.8% |  |
| hive-gateway | 2.9.0 | 229 | 234 | 226 | 1.2% |  |
| fusion-nightly | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1060635     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 425 MB  3.5 MB/s
     http_req_blocked...............: avg=5.8µs    min=982ns  med=2.36µs  max=44.1ms   p(90)=3.57µs  p(95)=4.22µs   p(99.9)=36.92µs
     http_req_connecting............: avg=2.77µs   min=0s     med=0s      max=44.06ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.72ms  min=1.68ms med=15.69ms max=303.66ms p(90)=25.08ms p(95)=29.21ms  p(99.9)=52.9ms 
       { expected_response:true }...: avg=16.72ms  min=1.68ms med=15.69ms max=303.66ms p(90)=25.08ms p(95)=29.21ms  p(99.9)=52.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 353645
     http_req_receiving.............: avg=146.55µs min=26.6µs med=49.86µs max=213.29ms p(90)=99.82µs p(95)=283.37µs p(99.9)=14.91ms
     http_req_sending...............: avg=64.24µs  min=4.99µs med=9.45µs  max=61.63ms  p(90)=15.84µs p(95)=122.36µs p(99.9)=15.99ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.51ms  min=1.61ms med=15.54ms max=151.89ms p(90)=24.78ms p(95)=28.78ms  p(99.9)=51.15ms
     http_reqs......................: 353645  2942.089506/s
     iteration_duration.............: avg=16.95ms  min=2.24ms med=15.9ms  max=337.72ms p(90)=25.32ms p(95)=29.49ms  p(99.9)=54.35ms
     iterations.....................: 353545  2941.257573/s
     success_rate...................: 100.00% ✓ 353545      ✗ 0     
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

     checks.........................: 100.00% ✓ 790869      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 317 MB  2.6 MB/s
     http_req_blocked...............: avg=3.04µs   min=972ns  med=2.26µs   max=11.74ms  p(90)=3.49µs  p(95)=4.1µs    p(99.9)=36.25µs 
     http_req_connecting............: avg=370ns    min=0s     med=0s       max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.51ms  min=2.51ms med=14.81ms  max=320.92ms p(90)=48.9ms  p(95)=66.27ms  p(99.9)=160.81ms
       { expected_response:true }...: avg=22.51ms  min=2.51ms med=14.81ms  max=320.92ms p(90)=48.9ms  p(95)=66.27ms  p(99.9)=160.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263723
     http_req_receiving.............: avg=900.14µs min=50.7µs med=125.64µs max=172.37ms p(90)=1.35ms  p(95)=2.19ms   p(99.9)=59.86ms 
     http_req_sending...............: avg=48.02µs  min=5.32µs med=9.43µs   max=211.68ms p(90)=16.15µs p(95)=109.09µs p(99.9)=3.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.56ms  min=2.38ms med=14.07ms  max=320.19ms p(90)=47.17ms p(95)=64.47ms  p(99.9)=158.35ms
     http_reqs......................: 263723  2192.084317/s
     iteration_duration.............: avg=22.75ms  min=3.12ms med=15.04ms  max=346.68ms p(90)=49.15ms p(95)=66.53ms  p(99.9)=162.1ms 
     iterations.....................: 263623  2191.25311/s
     success_rate...................: 100.00% ✓ 263623      ✗ 0     
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

     checks.........................: 100.00% ✓ 728430      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.05µs   min=861ns   med=2.18µs  max=7.8ms    p(90)=3.51µs  p(95)=4.22µs   p(99.9)=38.62µs
     http_req_connecting............: avg=404ns    min=0s      med=0s      max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.47ms  min=1.94ms  med=24.21ms max=319.27ms p(90)=29.26ms p(95)=31.35ms  p(99.9)=54.41ms
       { expected_response:true }...: avg=24.47ms  min=1.94ms  med=24.21ms max=319.27ms p(90)=29.26ms p(95)=31.35ms  p(99.9)=54.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 242910
     http_req_receiving.............: avg=105.07µs min=30.14µs med=58.88µs max=226.74ms p(90)=98.46µs p(95)=153.81µs p(99.9)=8ms    
     http_req_sending...............: avg=44.87µs  min=4.67µs  med=9.72µs  max=155.58ms p(90)=15.8µs  p(95)=79.59µs  p(99.9)=3.22ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.32ms  min=1.86ms  med=24.11ms max=318.39ms p(90)=29.09ms p(95)=31.12ms  p(99.9)=53.16ms
     http_reqs......................: 242910  2019.95114/s
     iteration_duration.............: avg=24.7ms   min=4.38ms  med=24.42ms max=348.57ms p(90)=29.48ms p(95)=31.58ms  p(99.9)=54.75ms
     iterations.....................: 242810  2019.119577/s
     success_rate...................: 100.00% ✓ 242810      ✗ 0     
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

     checks.........................: 100.00% ✓ 428850      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.18µs  min=1.03µs  med=2.38µs  max=3.14ms   p(90)=3.84µs   p(95)=4.49µs   p(99.9)=34.99µs
     http_req_connecting............: avg=453ns   min=0s      med=0s      max=3.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.72ms min=2.11ms  med=41.15ms max=316.14ms p(90)=58.98ms  p(95)=64.46ms  p(99.9)=91.32ms
       { expected_response:true }...: avg=41.72ms min=2.11ms  med=41.15ms max=316.14ms p(90)=58.98ms  p(95)=64.46ms  p(99.9)=91.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143050
     http_req_receiving.............: avg=84.24µs min=29.32µs med=65.78µs max=145.8ms  p(90)=102.53µs p(95)=119.83µs p(99.9)=1.56ms 
     http_req_sending...............: avg=26.98µs min=5.48µs  med=10.77µs max=191.46ms p(90)=16.38µs  p(95)=20.09µs  p(99.9)=1.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.61ms min=2.01ms  med=41.05ms max=303.86ms p(90)=58.87ms  p(95)=64.35ms  p(99.9)=90.63ms
     http_reqs......................: 143050  1189.310521/s
     iteration_duration.............: avg=41.96ms min=4.49ms  med=41.36ms max=330.96ms p(90)=59.19ms  p(95)=64.67ms  p(99.9)=91.84ms
     iterations.....................: 142950  1188.479126/s
     success_rate...................: 100.00% ✓ 142950      ✗ 0     
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

     checks.........................: 100.00% ✓ 197706     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   658 kB/s
     http_req_blocked...............: avg=4.72µs  min=1.09µs  med=2.84µs  max=3.93ms   p(90)=4.44µs   p(95)=5.04µs   p(99.9)=46.74µs 
     http_req_connecting............: avg=1.59µs  min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.7ms  min=4ms     med=88.72ms max=356.99ms p(90)=115.1ms  p(95)=127.68ms p(99.9)=220.8ms 
       { expected_response:true }...: avg=90.7ms  min=4ms     med=88.72ms max=356.99ms p(90)=115.1ms  p(95)=127.68ms p(99.9)=220.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 66002
     http_req_receiving.............: avg=84.44µs min=30.53µs med=76.2µs  max=69.61ms  p(90)=109.52µs p(95)=121.93µs p(99.9)=826.06µs
     http_req_sending...............: avg=31.97µs min=5.54µs  med=12.57µs max=198.97ms p(90)=18.71µs  p(95)=21.05µs  p(99.9)=682.13µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.58ms min=3.92ms  med=88.61ms max=354.63ms p(90)=114.97ms p(95)=127.56ms p(99.9)=220.32ms
     http_reqs......................: 66002   547.539578/s
     iteration_duration.............: avg=91.06ms min=16.18ms med=88.97ms max=368.48ms p(90)=115.34ms p(95)=127.97ms p(99.9)=223.4ms 
     iterations.....................: 65902   546.709998/s
     success_rate...................: 100.00% ✓ 65902      ✗ 0    
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

     checks.........................: 100.00% ✓ 160035     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   532 kB/s
     http_req_blocked...............: avg=4.46µs   min=1.12µs  med=3.48µs   max=2.01ms   p(90)=4.96µs   p(95)=5.52µs   p(99.9)=78.72µs 
     http_req_connecting............: avg=778ns    min=0s      med=0s       max=1.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.03ms min=5.21ms  med=111.82ms max=351.74ms p(90)=135.08ms p(95)=141.8ms  p(99.9)=174.48ms
       { expected_response:true }...: avg=112.03ms min=5.21ms  med=111.82ms max=351.74ms p(90)=135.08ms p(95)=141.8ms  p(99.9)=174.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53445
     http_req_receiving.............: avg=99.2µs   min=31.59µs med=85.58µs  max=191.85ms p(90)=117.57µs p(95)=129.7µs  p(99.9)=860.12µs
     http_req_sending...............: avg=27.01µs  min=6.16µs  med=16.13µs  max=150.24ms p(90)=21.62µs  p(95)=23.42µs  p(99.9)=654.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.9ms  min=5.15ms  med=111.71ms max=332.57ms p(90)=134.97ms p(95)=141.67ms p(99.9)=172.27ms
     http_reqs......................: 53445   442.890059/s
     iteration_duration.............: avg=112.5ms  min=17.49ms med=112.1ms  max=377.16ms p(90)=135.34ms p(95)=142.07ms p(99.9)=176.46ms
     iterations.....................: 53345   442.061375/s
     success_rate...................: 100.00% ✓ 53345      ✗ 0    
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

     checks.........................: 100.00% ✓ 88134      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=6.67µs   min=1.23µs  med=3.25µs   max=4.27ms   p(90)=4.51µs   p(95)=5.02µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=3.26µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=203.4ms  min=8.42ms  med=196.16ms max=443.62ms p(90)=233.42ms p(95)=237.64ms p(99.9)=311.09ms
       { expected_response:true }...: avg=203.4ms  min=8.42ms  med=196.16ms max=443.62ms p(90)=233.42ms p(95)=237.64ms p(99.9)=311.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29478
     http_req_receiving.............: avg=94.6µs   min=33.16µs med=87.94µs  max=79.15ms  p(90)=118.87µs p(95)=130.02µs p(99.9)=480.64µs
     http_req_sending...............: avg=32µs     min=5.79µs  med=15.44µs  max=115.44ms p(90)=20.44µs  p(95)=22.26µs  p(99.9)=899.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.28ms min=8.34ms  med=195.95ms max=439.89ms p(90)=233.31ms p(95)=237.52ms p(99.9)=310.99ms
     http_reqs......................: 29478   243.479225/s
     iteration_duration.............: avg=204.36ms min=57.99ms med=201.84ms max=449.79ms p(90)=233.68ms p(95)=237.92ms p(99.9)=316.72ms
     iterations.....................: 29378   242.653256/s
     success_rate...................: 100.00% ✓ 29378      ✗ 0    
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

     checks.........................: 100.00% ✓ 84492      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=5.47µs   min=1.15µs  med=3.53µs   max=3.13ms   p(90)=4.89µs   p(95)=5.51µs   p(99.9)=649.91µs
     http_req_connecting............: avg=1.75µs   min=0s      med=0s       max=3.09ms   p(90)=0s       p(95)=0s       p(99.9)=626.82µs
     http_req_duration..............: avg=212.27ms min=6.64ms  med=195.35ms max=739.19ms p(90)=251.96ms p(95)=425.52ms p(99.9)=618.84ms
       { expected_response:true }...: avg=212.27ms min=6.64ms  med=195.35ms max=739.19ms p(90)=251.96ms p(95)=425.52ms p(99.9)=618.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28264
     http_req_receiving.............: avg=100.15µs min=32.94µs med=93.04µs  max=35.56ms  p(90)=124.95µs p(95)=137.26µs p(99.9)=564.48µs
     http_req_sending...............: avg=27.1µs   min=6.03µs  med=16.84µs  max=41.01ms  p(90)=21.98µs  p(95)=23.81µs  p(99.9)=568.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=212.15ms min=6.56ms  med=195.22ms max=739.07ms p(90)=251.77ms p(95)=425.44ms p(99.9)=618.74ms
     http_reqs......................: 28264   233.187074/s
     iteration_duration.............: avg=213.28ms min=53.03ms med=195.73ms max=739.46ms p(90)=252.48ms p(95)=426.74ms p(99.9)=619.09ms
     iterations.....................: 28164   232.362042/s
     success_rate...................: 100.00% ✓ 28164      ✗ 0    
     vus............................: 26      min=26       max=50 
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

     checks.........................: 100.00% ✓ 823851      ✗ 0     
     data_received..................: 24 GB   200 MB/s
     data_sent......................: 330 MB  2.7 MB/s
     http_req_blocked...............: avg=3.01µs   min=952ns   med=2.11µs  max=16.81ms  p(90)=3.51µs   p(95)=4.3µs    p(99.9)=35.48µs
     http_req_connecting............: avg=287ns    min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.61ms  min=1.86ms  med=21.2ms  max=308.39ms p(90)=29.81ms  p(95)=32.69ms  p(99.9)=55.24ms
       { expected_response:true }...: avg=21.61ms  min=1.86ms  med=21.2ms  max=308.39ms p(90)=29.81ms  p(95)=32.69ms  p(99.9)=55.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 274717
     http_req_receiving.............: avg=108.03µs min=27.84µs med=55.73µs max=90.3ms   p(90)=101.55µs p(95)=234.16µs p(99.9)=7.5ms  
     http_req_sending...............: avg=47.9µs   min=5.2µs   med=9.65µs  max=103.05ms p(90)=17.22µs  p(95)=120.35µs p(99.9)=4.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.45ms  min=1.74ms  med=21.07ms max=305.78ms p(90)=29.62ms  p(95)=32.45ms  p(99.9)=54.09ms
     http_reqs......................: 274717  2284.72554/s
     iteration_duration.............: avg=21.83ms  min=3.81ms  med=21.41ms max=335.55ms p(90)=30.03ms  p(95)=32.93ms  p(99.9)=55.7ms 
     iterations.....................: 274617  2283.893875/s
     success_rate...................: 100.00% ✓ 274617      ✗ 0     
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

     checks.........................: 100.00% ✓ 716313      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 287 MB  2.4 MB/s
     http_req_blocked...............: avg=3.14µs   min=931ns   med=2.37µs  max=5.79ms   p(90)=3.77µs  p(95)=4.49µs   p(99.9)=33.74µs 
     http_req_connecting............: avg=332ns    min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.87ms  min=1.88ms  med=17.97ms max=316.99ms p(90)=50.81ms p(95)=67.88ms  p(99.9)=168.2ms 
       { expected_response:true }...: avg=24.87ms  min=1.88ms  med=17.97ms max=316.99ms p(90)=50.81ms p(95)=67.88ms  p(99.9)=168.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 238871
     http_req_receiving.............: avg=969.78µs min=52.09µs med=140.8µs max=187.42ms p(90)=1.59ms  p(95)=2.54ms   p(99.9)=60.19ms 
     http_req_sending...............: avg=42.17µs  min=5.28µs  med=10.15µs max=165.61ms p(90)=18.61µs p(95)=113.39µs p(99.9)=2.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.86ms  min=1.74ms  med=17.14ms max=311.82ms p(90)=48.93ms p(95)=65.86ms  p(99.9)=164.04ms
     http_reqs......................: 238871  1986.653546/s
     iteration_duration.............: avg=25.12ms  min=2.65ms  med=18.19ms max=335.42ms p(90)=51.06ms p(95)=68.17ms  p(99.9)=170.02ms
     iterations.....................: 238771  1985.821861/s
     success_rate...................: 100.00% ✓ 238771      ✗ 0     
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

     checks.........................: 100.00% ✓ 534942      ✗ 0     
     data_received..................: 16 GB   130 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.49µs   min=982ns   med=2.34µs  max=15.6ms   p(90)=4.67µs   p(95)=5.81µs   p(99.9)=38.99µs
     http_req_connecting............: avg=471ns    min=0s      med=0s      max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.37ms  min=2.53ms  med=32.53ms max=325.31ms p(90)=44.28ms  p(95)=49.13ms  p(99.9)=89.91ms
       { expected_response:true }...: avg=33.37ms  min=2.53ms  med=32.53ms max=325.31ms p(90)=44.28ms  p(95)=49.13ms  p(99.9)=89.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178414
     http_req_receiving.............: avg=115.54µs min=27.78µs med=62.16µs max=96.22ms  p(90)=137.33µs p(95)=290.78µs p(99.9)=6.14ms 
     http_req_sending...............: avg=47.19µs  min=5.08µs  med=10.38µs max=96.92ms  p(90)=24.27µs  p(95)=137.76µs p(99.9)=3.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.2ms   min=2.42ms  med=32.39ms max=324.12ms p(90)=44.09ms  p(95)=48.87ms  p(99.9)=89.4ms 
     http_reqs......................: 178414  1482.894761/s
     iteration_duration.............: avg=33.63ms  min=4.01ms  med=32.77ms max=336.41ms p(90)=44.53ms  p(95)=49.37ms  p(99.9)=90.92ms
     iterations.....................: 178314  1482.063607/s
     success_rate...................: 100.00% ✓ 178314      ✗ 0     
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

     checks.........................: 100.00% ✓ 407559      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 163 MB  1.4 MB/s
     http_req_blocked...............: avg=3.55µs   min=1.05µs  med=2.43µs  max=4.39ms   p(90)=4.1µs    p(95)=4.79µs   p(99.9)=35.95µs
     http_req_connecting............: avg=721ns    min=0s      med=0s      max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.9ms   min=2.41ms  med=43.44ms max=351.33ms p(90)=61.28ms  p(95)=66.8ms   p(99.9)=92.11ms
       { expected_response:true }...: avg=43.9ms   min=2.41ms  med=43.44ms max=351.33ms p(90)=61.28ms  p(95)=66.8ms   p(99.9)=92.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135953
     http_req_receiving.............: avg=121.92µs min=30.04µs med=71.73µs max=257.48ms p(90)=111.07µs p(95)=128.38µs p(99.9)=2ms    
     http_req_sending...............: avg=24.6µs   min=5.44µs  med=11.63µs max=164.47ms p(90)=18.47µs  p(95)=21.93µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.75ms  min=2.32ms  med=43.32ms max=119.24ms p(90)=61.17ms  p(95)=66.68ms  p(99.9)=91.74ms
     http_reqs......................: 135953  1129.967858/s
     iteration_duration.............: avg=44.16ms  min=4.79ms  med=43.65ms max=360.14ms p(90)=61.5ms   p(95)=67.03ms  p(99.9)=92.84ms
     iterations.....................: 135853  1129.136712/s
     success_rate...................: 100.00% ✓ 135853      ✗ 0     
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

     checks.........................: 100.00% ✓ 187764     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 75 MB   624 kB/s
     http_req_blocked...............: avg=4.63µs  min=1.13µs  med=2.97µs  max=4.14ms   p(90)=4.55µs   p(95)=5.15µs   p(99.9)=47.89µs 
     http_req_connecting............: avg=1.38µs  min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.49ms min=4.32ms  med=91.88ms max=328.9ms  p(90)=124.65ms p(95)=138.16ms p(99.9)=236.01ms
       { expected_response:true }...: avg=95.49ms min=4.32ms  med=91.88ms max=328.9ms  p(90)=124.65ms p(95)=138.16ms p(99.9)=236.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62688
     http_req_receiving.............: avg=89.91µs min=32.32µs med=81.36µs max=101.37ms p(90)=115.05µs p(95)=127.53µs p(99.9)=930.08µs
     http_req_sending...............: avg=22.62µs min=5.65µs  med=13.59µs max=67.43ms  p(90)=19.83µs  p(95)=21.92µs  p(99.9)=698.9µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.38ms min=4.23ms  med=91.77ms max=328.3ms  p(90)=124.54ms p(95)=138.06ms p(99.9)=235.65ms
     http_reqs......................: 62688   519.815035/s
     iteration_duration.............: avg=95.89ms min=22.66ms med=92.17ms max=338.14ms p(90)=124.94ms p(95)=138.49ms p(99.9)=238.84ms
     iterations.....................: 62588   518.985825/s
     success_rate...................: 100.00% ✓ 62588      ✗ 0    
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

     checks.........................: 100.00% ✓ 136851     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   455 kB/s
     http_req_blocked...............: avg=5.96µs   min=1.22µs  med=3.52µs   max=4.16ms   p(90)=5µs      p(95)=5.58µs   p(99.9)=356.06µs
     http_req_connecting............: avg=2.24µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=328.02µs
     http_req_duration..............: avg=131.02ms min=5.8ms   med=128.72ms max=359.96ms p(90)=173.14ms p(95)=186.58ms p(99.9)=239.14ms
       { expected_response:true }...: avg=131.02ms min=5.8ms   med=128.72ms max=359.96ms p(90)=173.14ms p(95)=186.58ms p(99.9)=239.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45717
     http_req_receiving.............: avg=94.33µs  min=31.96µs med=88.15µs  max=25.35ms  p(90)=120.31µs p(95)=132.87µs p(99.9)=838.73µs
     http_req_sending...............: avg=23.26µs  min=6.02µs  med=16.49µs  max=71.62ms  p(90)=21.8µs   p(95)=23.66µs  p(99.9)=794.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.9ms  min=5.67ms  med=128.61ms max=353.76ms p(90)=173.05ms p(95)=186.47ms p(99.9)=239.01ms
     http_reqs......................: 45717   378.649662/s
     iteration_duration.............: avg=131.57ms min=30.36ms med=129.05ms max=371.3ms  p(90)=173.47ms p(95)=186.94ms p(99.9)=241.35ms
     iterations.....................: 45617   377.821415/s
     success_rate...................: 100.00% ✓ 45617      ✗ 0    
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

     checks.........................: 100.00% ✓ 83940      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.31µs  med=3.44µs   max=4.12ms   p(90)=4.73µs   p(95)=5.26µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=213.57ms min=8.62ms  med=219.48ms max=443.63ms p(90)=228.06ms p(95)=232.9ms  p(99.9)=311.31ms
       { expected_response:true }...: avg=213.57ms min=8.62ms  med=219.48ms max=443.63ms p(90)=228.06ms p(95)=232.9ms  p(99.9)=311.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28080
     http_req_receiving.............: avg=241.4µs  min=34.35µs med=94.4µs   max=248.66ms p(90)=125.48µs p(95)=138.78µs p(99.9)=9.54ms  
     http_req_sending...............: avg=25.04µs  min=5.9µs   med=16.84µs  max=41.55ms  p(90)=21.53µs  p(95)=23.34µs  p(99.9)=568.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.3ms  min=8.49ms  med=219.35ms max=315.77ms p(90)=227.87ms p(95)=232.66ms p(99.9)=309.46ms
     http_reqs......................: 28080   231.837661/s
     iteration_duration.............: avg=214.6ms  min=44.46ms med=219.75ms max=451.51ms p(90)=228.34ms p(95)=233.18ms p(99.9)=315.17ms
     iterations.....................: 27980   231.012029/s
     success_rate...................: 100.00% ✓ 27980      ✗ 0    
     vus............................: 47      min=47       max=50 
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

     checks.........................: 100.00% ✓ 82989      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   275 kB/s
     http_req_blocked...............: avg=7.55µs   min=1.19µs  med=3.52µs   max=3.99ms   p(90)=4.87µs   p(95)=5.45µs   p(99.9)=2.03ms  
     http_req_connecting............: avg=3.83µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=215.98ms min=6.97ms  med=197.53ms max=767.35ms p(90)=269.72ms p(95)=321.97ms p(99.9)=650.32ms
       { expected_response:true }...: avg=215.98ms min=6.97ms  med=197.53ms max=767.35ms p(90)=269.72ms p(95)=321.97ms p(99.9)=650.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27763
     http_req_receiving.............: avg=147.45µs min=35.39µs med=95.86µs  max=90.79ms  p(90)=126.87µs p(95)=140.24µs p(99.9)=2.73ms  
     http_req_sending...............: avg=38.68µs  min=6.28µs  med=17.39µs  max=164.78ms p(90)=22.26µs  p(95)=24.05µs  p(99.9)=575.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.79ms min=6.88ms  med=197.38ms max=767.24ms p(90)=269.56ms p(95)=320.26ms p(99.9)=650.2ms 
     http_reqs......................: 27763   229.222957/s
     iteration_duration.............: avg=217.03ms min=33.01ms med=197.95ms max=767.59ms p(90)=270.33ms p(95)=324.4ms  p(99.9)=650.59ms
     iterations.....................: 27663   228.397316/s
     success_rate...................: 100.00% ✓ 27663      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

