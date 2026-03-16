## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Comparison

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 3,170 | 3,170 | 3,166 | 0.1% |  |
| grafbase | 0.53.2 | 2,094 | 2,094 | 2,090 | 0.1% |  |
| hotchocolate (rust subgraphs) | 16.0.0-p.11.45 | 1,898 | 1,898 | 1,895 | 0.1% |  |
| hotchocolate (.net subgraphs) | 16.0.0-p.11.45 | 1,710 | 1,710 | 1,691 | 0.8% |  |
| hive-gateway | 2.5.6 | 1,627 | 1,627 | 1,627 | 0.0% |  |
| hive-gateway-router-runtime | 2.5.6 | 1,605 | 1,605 | 1,605 | 0.0% |  |
| cosmo | 0.291.0 | 1,192 | 1,192 | 1,190 | 0.1% |  |
| apollo-router | v2.12.0 | 440 | 440 | 439 | 0.2% |  |
| apollo-gateway | 2.13.2 | 231 | 231 | 230 | 0.3% |  |


<details>
  <summary>Summary for: hive-router (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1142844     ✗ 0     
     data_received..................: 33 GB   278 MB/s
     data_sent......................: 458 MB  3.8 MB/s
     http_req_blocked...............: avg=2.87µs   min=1µs     med=2.06µs  max=25.46ms  p(90)=3.1µs    p(95)=3.71µs   p(99.9)=30.04µs
     http_req_connecting............: avg=309ns    min=0s      med=0s      max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.52ms  min=1.44ms  med=14.83ms max=318.21ms p(90)=22.41ms  p(95)=25.43ms  p(99.9)=47.68ms
       { expected_response:true }...: avg=15.52ms  min=1.44ms  med=14.83ms max=318.21ms p(90)=22.41ms  p(95)=25.43ms  p(99.9)=47.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 381048
     http_req_receiving.............: avg=123.16µs min=27.22µs med=49.74µs max=38.93ms  p(90)=103.59µs p(95)=274.13µs p(99.9)=9.59ms 
     http_req_sending...............: avg=51.28µs  min=4.96µs  med=8.94µs  max=173.55ms p(90)=15.72µs  p(95)=121.59µs p(99.9)=4.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.35ms  min=1.39ms  med=14.69ms max=318.04ms p(90)=22.19ms  p(95)=25.13ms  p(99.9)=46.28ms
     http_reqs......................: 381048  3170.4628/s
     iteration_duration.............: avg=15.74ms  min=2.1ms   med=15.03ms max=342.57ms p(90)=22.63ms  p(95)=25.67ms  p(99.9)=48.76ms
     iterations.....................: 380948  3169.630763/s
     success_rate...................: 100.00% ✓ 380948      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 755202      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=2.75µs  min=1.05µs med=2.17µs  max=13.46ms  p(90)=3.36µs  p(95)=4.03µs   p(99.9)=31.71µs
     http_req_connecting............: avg=200ns   min=0s     med=0s      max=3.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.6ms  min=2.01ms med=23.31ms max=312.62ms p(90)=28.38ms p(95)=30.33ms  p(99.9)=49.67ms
       { expected_response:true }...: avg=23.6ms  min=2.01ms med=23.31ms max=312.62ms p(90)=28.38ms p(95)=30.33ms  p(99.9)=49.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 251834
     http_req_receiving.............: avg=94.29µs min=30µs   med=57.49µs max=195.45ms p(90)=94.26µs p(95)=150.98µs p(99.9)=5.55ms 
     http_req_sending...............: avg=38.55µs min=5.17µs med=9.8µs   max=178.42ms p(90)=15.23µs p(95)=82.13µs  p(99.9)=1.91ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.47ms min=1.9ms  med=23.2ms  max=307.44ms p(90)=28.24ms p(95)=30.14ms  p(99.9)=48.65ms
     http_reqs......................: 251834  2094.225209/s
     iteration_duration.............: avg=23.82ms min=3.81ms med=23.52ms max=344.16ms p(90)=28.59ms p(95)=30.54ms  p(99.9)=50.15ms
     iterations.....................: 251734  2093.393619/s
     success_rate...................: 100.00% ✓ 251734      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.45)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685101      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.73µs   min=1.05µs  med=2.27µs   max=1.85ms   p(90)=3.31µs  p(95)=3.85µs  p(99.9)=32.88µs 
     http_req_connecting............: avg=170ns    min=0s      med=0s       max=1.81ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=26.03ms  min=2.76ms  med=14.33ms  max=564.98ms p(90)=63.89ms p(95)=84.84ms p(99.9)=190.06ms
       { expected_response:true }...: avg=26.03ms  min=2.76ms  med=14.33ms  max=564.98ms p(90)=63.89ms p(95)=84.84ms p(99.9)=190.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228467
     http_req_receiving.............: avg=543.24µs min=52.39µs med=108.29µs max=376.89ms p(90)=698.1µs p(95)=1.04ms  p(99.9)=64.99ms 
     http_req_sending...............: avg=35.83µs  min=5.46µs  med=9.59µs   max=188.38ms p(90)=14.66µs p(95)=25.42µs p(99.9)=1.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.45ms  min=2.63ms  med=13.87ms  max=564.19ms p(90)=62.84ms p(95)=83.82ms p(99.9)=186.97ms
     http_reqs......................: 228467  1898.51789/s
     iteration_duration.............: avg=26.26ms  min=3.54ms  med=14.54ms  max=565.18ms p(90)=64.12ms p(95)=85.06ms p(99.9)=191.74ms
     iterations.....................: 228367  1897.686909/s
     success_rate...................: 100.00% ✓ 228367      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.45)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 616755      ✗ 0     
     data_received..................: 18 GB   150 MB/s
     data_sent......................: 247 MB  2.1 MB/s
     http_req_blocked...............: avg=3.02µs   min=1.03µs  med=2.18µs   max=11.22ms  p(90)=3.36µs   p(95)=3.96µs  p(99.9)=33.91µs 
     http_req_connecting............: avg=426ns    min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=28.95ms  min=2.12ms  med=18.47ms  max=780.66ms p(90)=63.95ms  p(95)=85.79ms p(99.9)=241.35ms
       { expected_response:true }...: avg=28.95ms  min=2.12ms  med=18.47ms  max=780.66ms p(90)=63.95ms  p(95)=85.79ms p(99.9)=241.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 205685
     http_req_receiving.............: avg=537.24µs min=52.38µs med=109.78µs max=200.02ms p(90)=787.02µs p(95)=1.22ms  p(99.9)=63.93ms 
     http_req_sending...............: avg=33.51µs  min=5.4µs   med=9.59µs   max=250.83ms p(90)=15.06µs  p(95)=22.85µs p(99.9)=1.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=28.37ms  min=2ms     med=18ms     max=780.41ms p(90)=62.85ms  p(95)=84.63ms p(99.9)=240.65ms
     http_reqs......................: 205685  1710.062306/s
     iteration_duration.............: avg=29.17ms  min=3.1ms   med=18.69ms  max=780.86ms p(90)=64.17ms  p(95)=86.04ms p(99.9)=244.1ms 
     iterations.....................: 205585  1709.230907/s
     success_rate...................: 100.00% ✓ 205585      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 586485      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 235 MB  2.0 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.1µs   med=2.1µs   max=8.18ms   p(90)=3.09µs  p(95)=3.59µs  p(99.9)=30.42µs
     http_req_connecting............: avg=995ns   min=0s      med=0s      max=7.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.47ms min=1.56ms  med=30ms    max=329.47ms p(90)=45.06ms p(95)=49.95ms p(99.9)=76.66ms
       { expected_response:true }...: avg=30.47ms min=1.56ms  med=30ms    max=329.47ms p(90)=45.06ms p(95)=49.95ms p(99.9)=76.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195595
     http_req_receiving.............: avg=78.46µs min=27.99µs med=51.45µs max=30.78ms  p(90)=81.25µs p(95)=98.92µs p(99.9)=2.92ms 
     http_req_sending...............: avg=25.27µs min=5.38µs  med=9.3µs   max=132.99ms p(90)=13.15µs p(95)=17.14µs p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.37ms min=1.48ms  med=29.9ms  max=328.44ms p(90)=44.94ms p(95)=49.82ms p(99.9)=75.96ms
     http_reqs......................: 195595  1627.31536/s
     iteration_duration.............: avg=30.68ms min=1.94ms  med=30.18ms max=340.91ms p(90)=45.25ms p(95)=50.14ms p(99.9)=77.06ms
     iterations.....................: 195495  1626.483378/s
     success_rate...................: 100.00% ✓ 195495      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578634      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.02µs  min=1.06µs  med=1.92µs  max=7.14ms   p(90)=2.76µs  p(95)=3.22µs  p(99.9)=24.96µs
     http_req_connecting............: avg=864ns   min=0s      med=0s      max=7.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.89ms min=1.58ms  med=30.24ms max=299.25ms p(90)=48.09ms p(95)=54.02ms p(99.9)=87.21ms
       { expected_response:true }...: avg=30.89ms min=1.58ms  med=30.24ms max=299.25ms p(90)=48.09ms p(95)=54.02ms p(99.9)=87.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192978
     http_req_receiving.............: avg=74.42µs min=27.35µs med=50.43µs max=77.16ms  p(90)=77.63µs p(95)=93.58µs p(99.9)=2.66ms 
     http_req_sending...............: avg=25.19µs min=4.98µs  med=8.82µs  max=173.75ms p(90)=12.63µs p(95)=15.98µs p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.79ms min=1.5ms   med=30.15ms max=298.45ms p(90)=47.97ms p(95)=53.92ms p(99.9)=86.76ms
     http_reqs......................: 192978  1605.440195/s
     iteration_duration.............: avg=31.1ms  min=1.88ms  med=30.43ms max=336.66ms p(90)=48.26ms p(95)=54.21ms p(99.9)=87.88ms
     iterations.....................: 192878  1604.608266/s
     success_rate...................: 100.00% ✓ 192878      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429918      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.08µs  med=2.35µs  max=4.26ms   p(90)=3.64µs  p(95)=4.24µs  p(99.9)=35.36µs
     http_req_connecting............: avg=745ns   min=0s      med=0s      max=4.22ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=41.62ms min=2.12ms  med=41.08ms max=342.38ms p(90)=57.61ms p(95)=62.58ms p(99.9)=86.14ms
       { expected_response:true }...: avg=41.62ms min=2.12ms  med=41.08ms max=342.38ms p(90)=57.61ms p(95)=62.58ms p(99.9)=86.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143406
     http_req_receiving.............: avg=78.33µs min=29.12µs med=59.8µs  max=85.35ms  p(90)=93.85µs p(95)=110.5µs p(99.9)=1.64ms 
     http_req_sending...............: avg=25.78µs min=5.52µs  med=10.38µs max=148.9ms  p(90)=15.17µs p(95)=19.07µs p(99.9)=1.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.52ms min=2.01ms  med=40.98ms max=310.78ms p(90)=57.52ms p(95)=62.47ms p(99.9)=85.78ms
     http_reqs......................: 143406  1192.458344/s
     iteration_duration.............: avg=41.86ms min=4.26ms  med=41.28ms max=351.62ms p(90)=57.82ms p(95)=62.78ms p(99.9)=86.57ms
     iterations.....................: 143306  1191.626818/s
     success_rate...................: 100.00% ✓ 143306      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 159237     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   529 kB/s
     http_req_blocked...............: avg=4.04µs   min=1.12µs  med=3.01µs   max=3.01ms   p(90)=4.42µs   p(95)=4.94µs   p(99.9)=78.54µs 
     http_req_connecting............: avg=773ns    min=0s      med=0s       max=2ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.61ms min=5.33ms  med=112.31ms max=346.53ms p(90)=135.95ms p(95)=142.88ms p(99.9)=177.55ms
       { expected_response:true }...: avg=112.61ms min=5.33ms  med=112.31ms max=346.53ms p(90)=135.95ms p(95)=142.88ms p(99.9)=177.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53179
     http_req_receiving.............: avg=85.05µs  min=31.42µs med=76.98µs  max=71.44ms  p(90)=108.55µs p(95)=119.76µs p(99.9)=781.61µs
     http_req_sending...............: avg=24.05µs  min=5.54µs  med=14.06µs  max=104.57ms p(90)=19.63µs  p(95)=21.46µs  p(99.9)=561.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.5ms  min=5.22ms  med=112.21ms max=346.06ms p(90)=135.85ms p(95)=142.74ms p(99.9)=177.39ms
     http_reqs......................: 53179   440.699799/s
     iteration_duration.............: avg=113.07ms min=27.57ms med=112.57ms max=354.55ms p(90)=136.21ms p(95)=143.16ms p(99.9)=180.16ms
     iterations.....................: 53079   439.871089/s
     success_rate...................: 100.00% ✓ 53079      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 83784     ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.56µs   min=1.25µs  med=3.08µs   max=4.38ms   p(90)=4.28µs   p(95)=4.8µs    p(99.9)=2.33ms  
     http_req_connecting............: avg=4.2µs    min=0s      med=0s       max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=2.17ms  
     http_req_duration..............: avg=213.99ms min=8.26ms  med=214.11ms max=400.93ms p(90)=306.58ms p(95)=313.23ms p(99.9)=353.2ms 
       { expected_response:true }...: avg=213.99ms min=8.26ms  med=214.11ms max=400.93ms p(90)=306.58ms p(95)=313.23ms p(99.9)=353.2ms 
     http_req_failed................: 0.00%   ✓ 0         ✗ 28028
     http_req_receiving.............: avg=96.74µs  min=33µs    med=80.29µs  max=101.4ms  p(90)=113.44µs p(95)=124.87µs p(99.9)=616.74µs
     http_req_sending...............: avg=22.83µs  min=6.15µs  med=14.41µs  max=53.59ms  p(90)=19.84µs  p(95)=21.57µs  p(99.9)=493.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.88ms min=8.17ms  med=214.01ms max=400.38ms p(90)=306.47ms p(95)=313.13ms p(99.9)=352.92ms
     http_reqs......................: 28028   231.51684/s
     iteration_duration.............: avg=215.02ms min=48.26ms med=214.44ms max=416.18ms p(90)=306.93ms p(95)=313.52ms p(99.9)=356.02ms
     iterations.....................: 27928   230.69082/s
     success_rate...................: 100.00% ✓ 27928     ✗ 0    
     vus............................: 31      min=31      max=50 
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

