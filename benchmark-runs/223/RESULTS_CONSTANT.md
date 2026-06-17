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
| hive-router | v0.0.65 | 2,921 | 3,154 | 2,860 | 3.3% |  |
| fusion-nightly | 16.2.0-p.1 | 2,135 | 2,181 | 2,120 | 0.9% |  |
| fusion | 16.1.4 | 2,112 | 2,154 | 2,094 | 0.9% |  |
| grafbase | 0.53.5 | 2,095 | 2,149 | 2,082 | 1.1% |  |
| cosmo | 0.321.1 | 1,182 | 1,207 | 1,178 | 1.0% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 572 | 582 | 569 | 0.8% |  |
| apollo-router | v2.15.0 | 442 | 451 | 438 | 1.0% |  |
| apollo-gateway | 2.14.1 | 247 | 248 | 246 | 0.3% |  |
| hive-gateway | 2.8.2 | 240 | 245 | 238 | 1.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,486 | 2,608 | 2,464 | 1.8% |  |
| fusion | 16.1.4 | 1,956 | 2,002 | 1,938 | 1.1% |  |
| fusion-nightly | 16.2.0-p.1 | 1,913 | 1,968 | 1,892 | 1.3% |  |
| grafbase | 0.53.5 | 1,521 | 1,551 | 1,503 | 1.1% |  |
| cosmo | 0.321.1 | 1,155 | 1,175 | 1,154 | 0.8% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 528 | 541 | 522 | 1.2% |  |
| apollo-router | v2.15.0 | 412 | 423 | 408 | 1.3% |  |
| hive-gateway | 2.8.2 | 242 | 247 | 240 | 0.9% |  |
| apollo-gateway | 2.14.1 | 238 | 241 | 237 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1053459     ✗ 0     
     data_received..................: 31 GB   256 MB/s
     data_sent......................: 422 MB  3.5 MB/s
     http_req_blocked...............: avg=2.84µs   min=1µs     med=2.1µs   max=11.19ms  p(90)=3.29µs   p(95)=3.96µs   p(99.9)=34.26µs
     http_req_connecting............: avg=268ns    min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.85ms  min=1.62ms  med=16.18ms max=341.57ms p(90)=24.12ms  p(95)=27.77ms  p(99.9)=50.99ms
       { expected_response:true }...: avg=16.85ms  min=1.62ms  med=16.18ms max=341.57ms p(90)=24.12ms  p(95)=27.77ms  p(99.9)=50.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 351253
     http_req_receiving.............: avg=129.16µs min=27.46µs med=49.92µs max=35.33ms  p(90)=100.06µs p(95)=276.34µs p(99.9)=12.43ms
     http_req_sending...............: avg=61.42µs  min=4.95µs  med=9.17µs  max=229.24ms p(90)=15.92µs  p(95)=122.61µs p(99.9)=9.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.66ms  min=1.56ms  med=16.03ms max=320.16ms p(90)=23.85ms  p(95)=27.34ms  p(99.9)=49.15ms
     http_reqs......................: 351253  2921.902081/s
     iteration_duration.............: avg=17.07ms  min=2.1ms   med=16.38ms max=352.96ms p(90)=24.34ms  p(95)=28.02ms  p(99.9)=52.13ms
     iterations.....................: 351153  2921.07023/s
     success_rate...................: 100.00% ✓ 351153      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.2.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 770361      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.02µs   min=1.01µs  med=2.09µs   max=7.42ms   p(90)=3.25µs   p(95)=3.87µs   p(99.9)=30.84µs 
     http_req_connecting............: avg=522ns    min=0s      med=0s       max=5.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.12ms  min=2.45ms  med=14.79ms  max=324.36ms p(90)=51.45ms  p(95)=69.86ms  p(99.9)=167.84ms
       { expected_response:true }...: avg=23.12ms  min=2.45ms  med=14.79ms  max=324.36ms p(90)=51.45ms  p(95)=69.86ms  p(99.9)=167.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256887
     http_req_receiving.............: avg=625.05µs min=50.72µs med=102.61µs max=149.67ms p(90)=970.99µs p(95)=1.49ms   p(99.9)=57.49ms 
     http_req_sending...............: avg=42.19µs  min=5.02µs  med=9.04µs   max=98.96ms  p(90)=15.3µs   p(95)=109.38µs p(99.9)=2.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.45ms  min=2.36ms  med=14.28ms  max=261.92ms p(90)=50.29ms  p(95)=68.63ms  p(99.9)=166.07ms
     http_reqs......................: 256887  2135.49201/s
     iteration_duration.............: avg=23.35ms  min=3.27ms  med=15.01ms  max=350.61ms p(90)=51.69ms  p(95)=70.11ms  p(99.9)=169.49ms
     iterations.....................: 256787  2134.660714/s
     success_rate...................: 100.00% ✓ 256787      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 761934      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.22µs   min=1.04µs  med=2.35µs   max=6.58ms   p(90)=3.48µs   p(95)=4.07µs   p(99.9)=31.82µs 
     http_req_connecting............: avg=509ns    min=0s      med=0s       max=4.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.38ms  min=2.48ms  med=14.63ms  max=347.16ms p(90)=53.09ms  p(95)=71.75ms  p(99.9)=171.71ms
       { expected_response:true }...: avg=23.38ms  min=2.48ms  med=14.63ms  max=347.16ms p(90)=53.09ms  p(95)=71.75ms  p(99.9)=171.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 254078
     http_req_receiving.............: avg=692.76µs min=52.22µs med=111.55µs max=289.68ms p(90)=973.88µs p(95)=1.51ms   p(99.9)=63.17ms 
     http_req_sending...............: avg=47.18µs  min=4.99µs  med=9.57µs   max=165.59ms p(90)=15.85µs  p(95)=113.57µs p(99.9)=3.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.64ms  min=2.36ms  med=14.09ms  max=347.07ms p(90)=51.54ms  p(95)=70.13ms  p(99.9)=168.64ms
     http_reqs......................: 254078  2112.118703/s
     iteration_duration.............: avg=23.61ms  min=3.31ms  med=14.85ms  max=347.37ms p(90)=53.35ms  p(95)=71.98ms  p(99.9)=173.38ms
     iterations.....................: 253978  2111.287416/s
     success_rate...................: 100.00% ✓ 253978      ✗ 0     
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

     checks.........................: 100.00% ✓ 755562      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.22µs   min=992ns   med=2.22µs  max=11.42ms  p(90)=3.66µs  p(95)=4.45µs   p(99.9)=40.38µs
     http_req_connecting............: avg=409ns    min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.57ms  min=1.89ms  med=23.32ms max=317.03ms p(90)=28.31ms p(95)=30.6ms   p(99.9)=54.19ms
       { expected_response:true }...: avg=23.57ms  min=1.89ms  med=23.32ms max=317.03ms p(90)=28.31ms p(95)=30.6ms   p(99.9)=54.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 251954
     http_req_receiving.............: avg=109.59µs min=29.59µs med=57.13µs max=35.2ms   p(90)=99.76µs p(95)=201.84µs p(99.9)=9.27ms 
     http_req_sending...............: avg=44.28µs  min=4.62µs  med=9.97µs  max=108.71ms p(90)=17.49µs p(95)=118.42µs p(99.9)=3.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.42ms  min=1.82ms  med=23.21ms max=316.36ms p(90)=28.14ms p(95)=30.33ms  p(99.9)=52.98ms
     http_reqs......................: 251954  2095.290714/s
     iteration_duration.............: avg=23.81ms  min=4.07ms  med=23.53ms max=329.58ms p(90)=28.53ms p(95)=30.84ms  p(99.9)=54.83ms
     iterations.....................: 251854  2094.459097/s
     success_rate...................: 100.00% ✓ 251854      ✗ 0     
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

     checks.........................: 100.00% ✓ 426507      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=2.7µs   min=1.02µs  med=2.04µs  max=3.29ms   p(90)=3.14µs  p(95)=3.7µs    p(99.9)=32.59µs
     http_req_connecting............: avg=392ns   min=0s      med=0s      max=3.24ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.97ms min=2.13ms  med=41.48ms max=349.13ms p(90)=59.17ms p(95)=64.66ms  p(99.9)=90.03ms
       { expected_response:true }...: avg=41.97ms min=2.13ms  med=41.48ms max=349.13ms p(90)=59.17ms p(95)=64.66ms  p(99.9)=90.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142269
     http_req_receiving.............: avg=119.3µs min=28.61µs med=58.18µs max=307ms    p(90)=89.88µs p(95)=105.33µs p(99.9)=1.94ms 
     http_req_sending...............: avg=22.1µs  min=5.21µs  med=9.83µs  max=38.35ms  p(90)=14.55µs p(95)=18.39µs  p(99.9)=1.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.82ms min=2.06ms  med=41.38ms max=114.18ms p(90)=59.06ms p(95)=64.5ms   p(99.9)=87.7ms 
     http_reqs......................: 142269  1182.871867/s
     iteration_duration.............: avg=42.19ms min=3.89ms  med=41.67ms max=365.04ms p(90)=59.37ms p(95)=64.85ms  p(99.9)=90.46ms
     iterations.....................: 142169  1182.040433/s
     success_rate...................: 100.00% ✓ 142169      ✗ 0     
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

     checks.........................: 100.00% ✓ 206529     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   687 kB/s
     http_req_blocked...............: avg=4.9µs   min=1.19µs  med=3.04µs  max=3.98ms   p(90)=4.66µs   p(95)=5.31µs   p(99.9)=48.99µs 
     http_req_connecting............: avg=1.56µs  min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.8ms  min=3.96ms  med=84.92ms max=360.94ms p(90)=109.19ms p(95)=121.43ms p(99.9)=219.91ms
       { expected_response:true }...: avg=86.8ms  min=3.96ms  med=84.92ms max=360.94ms p(90)=109.19ms p(95)=121.43ms p(99.9)=219.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68943
     http_req_receiving.............: avg=87.09µs min=31.08µs med=77.65µs max=54.58ms  p(90)=112.45µs p(95)=125.43µs p(99.9)=857.49µs
     http_req_sending...............: avg=27.15µs min=5.57µs  med=13.64µs max=148.92ms p(90)=20.95µs  p(95)=23.35µs  p(99.9)=635.94µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.69ms min=3.9ms   med=84.8ms  max=360.02ms p(90)=109.06ms p(95)=121.3ms  p(99.9)=219.79ms
     http_reqs......................: 68943   572.005252/s
     iteration_duration.............: avg=87.16ms min=27.09ms med=85.18ms max=380.26ms p(90)=109.43ms p(95)=121.71ms p(99.9)=220.89ms
     iterations.....................: 68843   571.175574/s
     success_rate...................: 100.00% ✓ 68843      ✗ 0    
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

     checks.........................: 100.00% ✓ 159696     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   531 kB/s
     http_req_blocked...............: avg=5.42µs   min=1.16µs  med=3.29µs   max=4.13ms   p(90)=4.73µs   p(95)=5.27µs   p(99.9)=115.93µs
     http_req_connecting............: avg=1.93µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.27ms min=5.3ms   med=112.02ms max=365.04ms p(90)=135.8ms  p(95)=142.65ms p(99.9)=173.86ms
       { expected_response:true }...: avg=112.27ms min=5.3ms   med=112.02ms max=365.04ms p(90)=135.8ms  p(95)=142.65ms p(99.9)=173.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53332
     http_req_receiving.............: avg=152.11µs min=32.43µs med=82.56µs  max=264.99ms p(90)=114.49µs p(95)=126.36µs p(99.9)=887.85µs
     http_req_sending...............: avg=23.12µs  min=5.53µs  med=15.59µs  max=70.94ms  p(90)=21.31µs  p(95)=23.13µs  p(99.9)=625.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.09ms min=5.23ms  med=111.89ms max=350.19ms p(90)=135.65ms p(95)=142.46ms p(99.9)=170.66ms
     http_reqs......................: 53332   442.009462/s
     iteration_duration.............: avg=112.73ms min=21.13ms med=112.29ms max=376.65ms p(90)=136.06ms p(95)=142.92ms p(99.9)=176.7ms 
     iterations.....................: 53232   441.180674/s
     success_rate...................: 100.00% ✓ 53232      ✗ 0    
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

     checks.........................: 100.00% ✓ 89745      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   298 kB/s
     http_req_blocked...............: avg=5.71µs   min=1.26µs  med=3.28µs   max=3.5ms    p(90)=4.52µs   p(95)=5.02µs   p(99.9)=678.45µs
     http_req_connecting............: avg=2.26µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=637.32µs
     http_req_duration..............: avg=199.78ms min=8.48ms  med=205.7ms  max=328.77ms p(90)=211.52ms p(95)=215.05ms p(99.9)=287.64ms
       { expected_response:true }...: avg=199.78ms min=8.48ms  med=205.7ms  max=328.77ms p(90)=211.52ms p(95)=215.05ms p(99.9)=287.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30015
     http_req_receiving.............: avg=96.02µs  min=34.57µs med=89.07µs  max=34.64ms  p(90)=119.52µs p(95)=131.25µs p(99.9)=769.22µs
     http_req_sending...............: avg=24.61µs  min=6.04µs  med=16.59µs  max=45.38ms  p(90)=21.32µs  p(95)=23.02µs  p(99.9)=663.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.66ms min=8.36ms  med=205.59ms max=328.59ms p(90)=211.39ms p(95)=214.93ms p(99.9)=287.5ms 
     http_reqs......................: 30015   247.928655/s
     iteration_duration.............: avg=200.69ms min=54ms    med=205.94ms max=352.1ms  p(90)=211.79ms p(95)=215.31ms p(99.9)=287.99ms
     iterations.....................: 29915   247.102639/s
     success_rate...................: 100.00% ✓ 29915      ✗ 0    
     vus............................: 37      min=37       max=50 
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

     checks.........................: 100.00% ✓ 86754      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=13.03µs  min=1.34µs  med=3.7µs    max=11.69ms  p(90)=5.17µs   p(95)=5.83µs   p(99.9)=4.39ms  
     http_req_connecting............: avg=8.94µs   min=0s      med=0s       max=11.52ms  p(90)=0s       p(95)=0s       p(99.9)=4.15ms  
     http_req_duration..............: avg=206.61ms min=6.21ms  med=187.34ms max=750.27ms p(90)=237.54ms p(95)=387.83ms p(99.9)=672.11ms
       { expected_response:true }...: avg=206.61ms min=6.21ms  med=187.34ms max=750.27ms p(90)=237.54ms p(95)=387.83ms p(99.9)=672.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29018
     http_req_receiving.............: avg=194.32µs min=34.41µs med=98.74µs  max=227.48ms p(90)=131.74µs p(95)=145.99µs p(99.9)=1.51ms  
     http_req_sending...............: avg=44.36µs  min=6.39µs  med=18.09µs  max=246.66ms p(90)=23.37µs  p(95)=25.3µs   p(99.9)=1.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.37ms min=6.06ms  med=187.17ms max=750.18ms p(90)=237.2ms  p(95)=386.95ms p(99.9)=671.98ms
     http_reqs......................: 29018   240.031771/s
     iteration_duration.............: avg=207.61ms min=38.54ms med=187.73ms max=750.49ms p(90)=238.18ms p(95)=389.6ms  p(99.9)=672.39ms
     iterations.....................: 28918   239.204588/s
     success_rate...................: 100.00% ✓ 28918      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 896286      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=3.36µs   min=1.01µs  med=2.56µs  max=7.29ms   p(90)=4.16µs   p(95)=5.01µs   p(99.9)=37.83µs
     http_req_connecting............: avg=331ns    min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.83ms  min=1.71ms  med=19.22ms max=352.33ms p(90)=27.51ms  p(95)=30.74ms  p(99.9)=52.89ms
       { expected_response:true }...: avg=19.83ms  min=1.71ms  med=19.22ms max=352.33ms p(90)=27.51ms  p(95)=30.74ms  p(99.9)=52.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298862
     http_req_receiving.............: avg=124.83µs min=28.08µs med=55.71µs max=203.2ms  p(90)=112.55µs p(95)=291.01µs p(99.9)=9.56ms 
     http_req_sending...............: avg=54.79µs  min=5.14µs  med=10.43µs max=34.37ms  p(90)=19.84µs  p(95)=134.11µs p(99.9)=5.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.65ms  min=1.62ms  med=19.07ms max=322.73ms p(90)=27.3ms   p(95)=30.43ms  p(99.9)=52.02ms
     http_reqs......................: 298862  2486.0628/s
     iteration_duration.............: avg=20.07ms  min=3.34ms  med=19.44ms max=362.95ms p(90)=27.74ms  p(95)=30.99ms  p(99.9)=53.39ms
     iterations.....................: 298762  2485.230956/s
     success_rate...................: 100.00% ✓ 298762      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 705546      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 283 MB  2.4 MB/s
     http_req_blocked...............: avg=2.99µs   min=1µs     med=2.17µs  max=4.24ms   p(90)=3.47µs  p(95)=4.14µs   p(99.9)=33.3µs  
     http_req_connecting............: avg=418ns    min=0s      med=0s      max=4.21ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.26ms  min=1.88ms  med=17.1ms  max=569.29ms p(90)=53.78ms p(95)=71.12ms  p(99.9)=191.22ms
       { expected_response:true }...: avg=25.26ms  min=1.88ms  med=17.1ms  max=569.29ms p(90)=53.78ms p(95)=71.12ms  p(99.9)=191.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 235282
     http_req_receiving.............: avg=687.97µs min=51.82µs med=106µs   max=137.3ms  p(90)=1.13ms  p(95)=1.8ms    p(99.9)=58.75ms 
     http_req_sending...............: avg=43.02µs  min=5.4µs   med=9.6µs   max=255.8ms  p(90)=17.73µs p(95)=109.69µs p(99.9)=2.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.53ms  min=1.75ms  med=16.54ms max=569.21ms p(90)=52.47ms p(95)=69.6ms   p(99.9)=189.13ms
     http_reqs......................: 235282  1956.352165/s
     iteration_duration.............: avg=25.5ms   min=2.69ms  med=17.32ms max=569.42ms p(90)=54.02ms p(95)=71.36ms  p(99.9)=194.69ms
     iterations.....................: 235182  1955.520673/s
     success_rate...................: 100.00% ✓ 235182      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.2.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690006      ✗ 0     
     data_received..................: 20 GB   168 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.96µs   min=1µs     med=2.09µs   max=16.97ms  p(90)=3.29µs  p(95)=3.92µs  p(99.9)=33.46µs 
     http_req_connecting............: avg=381ns    min=0s      med=0s       max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.84ms  min=1.97ms  med=17.6ms   max=667.29ms p(90)=54.62ms p(95)=72.51ms p(99.9)=191.75ms
       { expected_response:true }...: avg=25.84ms  min=1.97ms  med=17.6ms   max=667.29ms p(90)=54.62ms p(95)=72.51ms p(99.9)=191.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230102
     http_req_receiving.............: avg=669.39µs min=50.15µs med=105.93µs max=303.4ms  p(90)=1.15ms  p(95)=1.81ms  p(99.9)=56.29ms 
     http_req_sending...............: avg=39.82µs  min=5.15µs  med=9.37µs   max=49.1ms   p(90)=17.52µs p(95)=88.79µs p(99.9)=2.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.13ms  min=1.84ms  med=17.04ms  max=667.21ms p(90)=53.48ms p(95)=71.05ms p(99.9)=189.88ms
     http_reqs......................: 230102  1913.576876/s
     iteration_duration.............: avg=26.07ms  min=2.86ms  med=17.82ms  max=667.51ms p(90)=54.85ms p(95)=72.74ms p(99.9)=193.04ms
     iterations.....................: 230002  1912.745255/s
     success_rate...................: 100.00% ✓ 230002      ✗ 0     
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

     checks.........................: 100.00% ✓ 548850      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.53µs   min=1µs     med=2.38µs  max=3.9ms    p(90)=4.71µs   p(95)=5.89µs   p(99.9)=43.14µs
     http_req_connecting............: avg=511ns    min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.51ms  min=2.42ms  med=31.67ms max=290.88ms p(90)=42.87ms  p(95)=47.49ms  p(99.9)=91.69ms
       { expected_response:true }...: avg=32.51ms  min=2.42ms  med=31.67ms max=290.88ms p(90)=42.87ms  p(95)=47.49ms  p(99.9)=91.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183050
     http_req_receiving.............: avg=113.68µs min=29.95µs med=62.27µs max=152.25ms p(90)=136.42µs p(95)=282.76µs p(99.9)=5.27ms 
     http_req_sending...............: avg=45.31µs  min=5.35µs  med=10.64µs max=228.42ms p(90)=24.89µs  p(95)=135.51µs p(99.9)=3.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.35ms  min=2.3ms   med=31.53ms max=290.03ms p(90)=42.69ms  p(95)=47.26ms  p(99.9)=91.55ms
     http_reqs......................: 183050  1521.615166/s
     iteration_duration.............: avg=32.78ms  min=3.86ms  med=31.9ms  max=342.62ms p(90)=43.11ms  p(95)=47.74ms  p(99.9)=92.38ms
     iterations.....................: 182950  1520.783909/s
     success_rate...................: 100.00% ✓ 182950      ✗ 0     
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

     checks.........................: 100.00% ✓ 416619      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.79µs  min=1.1µs  med=2.61µs  max=4.17ms   p(90)=4.22µs   p(95)=4.9µs    p(99.9)=38.06µs
     http_req_connecting............: avg=832ns   min=0s     med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.94ms min=2.25ms med=42.4ms  max=360.41ms p(90)=60.45ms  p(95)=66.07ms  p(99.9)=92.02ms
       { expected_response:true }...: avg=42.94ms min=2.25ms med=42.4ms  max=360.41ms p(90)=60.45ms  p(95)=66.07ms  p(99.9)=92.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138973
     http_req_receiving.............: avg=87.6µs  min=29.3µs med=69.39µs max=163.59ms p(90)=108.41µs p(95)=126.52µs p(99.9)=1.6ms  
     http_req_sending...............: avg=27.18µs min=5.47µs med=12.12µs max=152.35ms p(90)=19.29µs  p(95)=22.9µs   p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.82ms min=2.18ms med=42.29ms max=359.96ms p(90)=60.33ms  p(95)=65.96ms  p(99.9)=91.7ms 
     http_reqs......................: 138973  1155.266965/s
     iteration_duration.............: avg=43.19ms min=4.32ms med=42.62ms max=371.24ms p(90)=60.67ms  p(95)=66.3ms   p(99.9)=92.88ms
     iterations.....................: 138873  1154.435676/s
     success_rate...................: 100.00% ✓ 138873      ✗ 0     
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

     checks.........................: 100.00% ✓ 190923     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   635 kB/s
     http_req_blocked...............: avg=4.79µs  min=1.11µs  med=2.82µs  max=24.89ms  p(90)=4.38µs   p(95)=4.95µs   p(99.9)=45.51µs 
     http_req_connecting............: avg=1.72µs  min=0s      med=0s      max=24.82ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.91ms min=4.05ms  med=91.43ms max=318.07ms p(90)=114.34ms p(95)=125.5ms  p(99.9)=226.22ms
       { expected_response:true }...: avg=93.91ms min=4.05ms  med=91.43ms max=318.07ms p(90)=114.34ms p(95)=125.5ms  p(99.9)=226.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63741
     http_req_receiving.............: avg=88.31µs min=32.3µs  med=78.8µs  max=101.15ms p(90)=113.32µs p(95)=126.16µs p(99.9)=827.4µs 
     http_req_sending...............: avg=26.98µs min=5.49µs  med=13.29µs max=158.49ms p(90)=19.79µs  p(95)=21.98µs  p(99.9)=800.3µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.79ms min=3.99ms  med=91.33ms max=317.09ms p(90)=114.21ms p(95)=125.38ms p(99.9)=225.38ms
     http_reqs......................: 63741   528.629361/s
     iteration_duration.............: avg=94.29ms min=20.49ms med=91.68ms max=345.89ms p(90)=114.59ms p(95)=125.87ms p(99.9)=229.75ms
     iterations.....................: 63641   527.800021/s
     success_rate...................: 100.00% ✓ 63641      ✗ 0    
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

     checks.........................: 100.00% ✓ 149103     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   495 kB/s
     http_req_blocked...............: avg=4.77µs   min=1.16µs  med=3.48µs   max=7.58ms   p(90)=5.03µs   p(95)=5.61µs   p(99.9)=67.34µs 
     http_req_connecting............: avg=1.09µs   min=0s      med=0s       max=7.53ms   p(90)=0s       p(95)=0s       p(99.9)=47.92µs 
     http_req_duration..............: avg=120.24ms min=5.72ms  med=117.88ms max=350.63ms p(90)=159.62ms p(95)=171.57ms p(99.9)=220.47ms
       { expected_response:true }...: avg=120.24ms min=5.72ms  med=117.88ms max=350.63ms p(90)=159.62ms p(95)=171.57ms p(99.9)=220.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49801
     http_req_receiving.............: avg=92.67µs  min=31.42µs med=86.97µs  max=46.1ms   p(90)=118.21µs p(95)=129.95µs p(99.9)=832.11µs
     http_req_sending...............: avg=21.34µs  min=5.53µs  med=17.43µs  max=16.92ms  p(90)=22.75µs  p(95)=24.64µs  p(99.9)=547.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.12ms min=5.59ms  med=117.78ms max=350.25ms p(90)=159.51ms p(95)=171.47ms p(99.9)=220.18ms
     http_reqs......................: 49801   412.552762/s
     iteration_duration.............: avg=120.74ms min=21.13ms med=118.2ms  max=361.34ms p(90)=159.95ms p(95)=171.89ms p(99.9)=222.47ms
     iterations.....................: 49701   411.724359/s
     success_rate...................: 100.00% ✓ 49701      ✗ 0    
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

     checks.........................: 100.00% ✓ 87642      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=7.37µs   min=1.25µs  med=3.72µs   max=4.54ms   p(90)=5.2µs    p(95)=5.81µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.38µs   min=0s      med=0s       max=4.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=204.52ms min=6.74ms  med=192.38ms max=709.4ms  p(90)=248.41ms p(95)=296.87ms p(99.9)=615.6ms 
       { expected_response:true }...: avg=204.52ms min=6.74ms  med=192.38ms max=709.4ms  p(90)=248.41ms p(95)=296.87ms p(99.9)=615.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29314
     http_req_receiving.............: avg=112.09µs min=32.66µs med=99.27µs  max=200.3ms  p(90)=130.76µs p(95)=144.26µs p(99.9)=782.5µs 
     http_req_sending...............: avg=29.81µs  min=6.37µs  med=18.87µs  max=93.38ms  p(90)=23.88µs  p(95)=25.61µs  p(99.9)=593.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.37ms min=6.59ms  med=192.25ms max=709.29ms p(90)=248.3ms  p(95)=296.59ms p(99.9)=615.45ms
     http_reqs......................: 29314   242.128887/s
     iteration_duration.............: avg=205.51ms min=39.73ms med=192.77ms max=709.62ms p(90)=248.84ms p(95)=299.8ms  p(99.9)=615.93ms
     iterations.....................: 29214   241.302903/s
     success_rate...................: 100.00% ✓ 29214      ✗ 0    
     vus............................: 32      min=32       max=50 
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

     checks.........................: 100.00% ✓ 86427      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=5.76µs   min=1.29µs  med=3.56µs   max=2.8ms    p(90)=4.97µs   p(95)=5.55µs   p(99.9)=806.64µs
     http_req_connecting............: avg=2.02µs   min=0s      med=0s       max=2.77ms   p(90)=0s       p(95)=0s       p(99.9)=779.37µs
     http_req_duration..............: avg=207.38ms min=8.72ms  med=207.25ms max=406.03ms p(90)=216.56ms p(95)=222.69ms p(99.9)=301.12ms
       { expected_response:true }...: avg=207.38ms min=8.72ms  med=207.25ms max=406.03ms p(90)=216.56ms p(95)=222.69ms p(99.9)=301.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28909
     http_req_receiving.............: avg=176.85µs min=35.54µs med=95.31µs  max=145.3ms  p(90)=127.3µs  p(95)=140.72µs p(99.9)=1.76ms  
     http_req_sending...............: avg=25.03µs  min=6.4µs   med=18.09µs  max=39.86ms  p(90)=22.96µs  p(95)=24.81µs  p(99.9)=653.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.17ms min=8.58ms  med=207.13ms max=337.6ms  p(90)=216.43ms p(95)=222.56ms p(99.9)=299.86ms
     http_reqs......................: 28909   238.743325/s
     iteration_duration.............: avg=208.38ms min=19.64ms med=207.61ms max=417.3ms  p(90)=216.87ms p(95)=223.02ms p(99.9)=302.02ms
     iterations.....................: 28809   237.917481/s
     success_rate...................: 100.00% ✓ 28809      ✗ 0    
     vus............................: 43      min=43       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

