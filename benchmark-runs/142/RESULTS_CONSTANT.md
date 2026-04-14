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
| hive-router | v0.0.43 | 3,009 | 3,205 | 2,981 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.2 | 2,144 | 2,200 | 2,133 | 1.0% |  |
| grafbase | 0.53.2 | 1,969 | 2,038 | 1,946 | 1.6% |  |
| cosmo | 0.298.0 | 1,272 | 1,292 | 1,263 | 0.8% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 625 | 637 | 622 | 0.9% |  |
| apollo-router | v2.12.1 | 406 | 417 | 400 | 1.5% |  |
| hive-gateway | 2.5.14 | 277 | 282 | 275 | 0.9% |  |
| apollo-gateway | 2.13.3 | 246 | 248 | 245 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,414 | 2,559 | 2,391 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,945 | 1,991 | 1,918 | 1.2% |  |
| grafbase | 0.53.2 | 1,526 | 1,545 | 1,479 | 1.3% |  |
| cosmo | 0.298.0 | 1,180 | 1,201 | 1,169 | 0.9% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 589 | 604 | 584 | 1.2% |  |
| apollo-router | v2.12.1 | 367 | 379 | 361 | 1.6% |  |
| hive-gateway | 2.5.14 | 270 | 275 | 267 | 1.1% |  |
| apollo-gateway | 2.13.3 | 243 | 245 | 241 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1084887     ✗ 0     
     data_received..................: 32 GB   264 MB/s
     data_sent......................: 435 MB  3.6 MB/s
     http_req_blocked...............: avg=2.97µs   min=1.05µs  med=2.37µs  max=19.08ms  p(90)=3.54µs  p(95)=4.17µs   p(99.9)=36.66µs
     http_req_connecting............: avg=143ns    min=0s      med=0s      max=2.57ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.34ms  min=1.69ms  med=15.26ms max=356.35ms p(90)=24.47ms p(95)=28.81ms  p(99.9)=53.42ms
       { expected_response:true }...: avg=16.34ms  min=1.69ms  med=15.26ms max=356.35ms p(90)=24.47ms p(95)=28.81ms  p(99.9)=53.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 361729
     http_req_receiving.............: avg=142.95µs min=27.62µs med=48.95µs max=158.25ms p(90)=97.02µs p(95)=279.33µs p(99.9)=15.85ms
     http_req_sending...............: avg=60.83µs  min=5.17µs  med=9.18µs  max=161.57ms p(90)=15.34µs p(95)=121.23µs p(99.9)=11.36ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.14ms  min=1.63ms  med=15.11ms max=312.15ms p(90)=24.16ms p(95)=28.32ms  p(99.9)=51.35ms
     http_reqs......................: 361729  3009.384907/s
     iteration_duration.............: avg=16.58ms  min=2.1ms   med=15.47ms max=365.65ms p(90)=24.7ms  p(95)=29.08ms  p(99.9)=54.98ms
     iterations.....................: 361629  3008.552962/s
     success_rate...................: 100.00% ✓ 361629      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 773676      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.18µs   min=1.02µs med=2.4µs    max=33.82ms  p(90)=3.55µs   p(95)=4.16µs   p(99.9)=36.82µs 
     http_req_connecting............: avg=318ns    min=0s     med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.02ms  min=2.48ms med=14.42ms  max=336.79ms p(90)=52.15ms  p(95)=70.54ms  p(99.9)=170.11ms
       { expected_response:true }...: avg=23.02ms  min=2.48ms med=14.42ms  max=336.79ms p(90)=52.15ms  p(95)=70.54ms  p(99.9)=170.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257992
     http_req_receiving.............: avg=654.38µs min=51.4µs med=110.34µs max=204.44ms p(90)=950.63µs p(95)=1.46ms   p(99.9)=63.99ms 
     http_req_sending...............: avg=43.21µs  min=5.39µs med=9.7µs    max=179.9ms  p(90)=16.14µs  p(95)=113.51µs p(99.9)=2.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.32ms  min=2.36ms med=13.92ms  max=323.68ms p(90)=50.8ms   p(95)=68.99ms  p(99.9)=167.86ms
     http_reqs......................: 257992  2144.550627/s
     iteration_duration.............: avg=23.25ms  min=3.4ms  med=14.63ms  max=345.47ms p(90)=52.39ms  p(95)=70.78ms  p(99.9)=171.63ms
     iterations.....................: 257892  2143.71938/s
     success_rate...................: 100.00% ✓ 257892      ✗ 0     
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

     checks.........................: 100.00% ✓ 710079      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=3.47µs   min=1.08µs med=2.7µs   max=8.44ms   p(90)=4.18µs   p(95)=4.95µs   p(99.9)=39.9µs 
     http_req_connecting............: avg=302ns    min=0s     med=0s      max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.1ms   min=1.92ms med=24.83ms max=333.35ms p(90)=30.22ms  p(95)=32.63ms  p(99.9)=55ms   
       { expected_response:true }...: avg=25.1ms   min=1.92ms med=24.83ms max=333.35ms p(90)=30.22ms  p(95)=32.63ms  p(99.9)=55ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 236793
     http_req_receiving.............: avg=115.09µs min=29.9µs med=61.53µs max=208.07ms p(90)=104.39µs p(95)=187.44µs p(99.9)=8.88ms 
     http_req_sending...............: avg=47.82µs  min=5.25µs med=10.68µs max=123.67ms p(90)=17.62µs  p(95)=117.35µs p(99.9)=3.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.93ms  min=1.85ms med=24.71ms max=332.36ms p(90)=30.04ms  p(95)=32.35ms  p(99.9)=53.79ms
     http_reqs......................: 236793  1969.057341/s
     iteration_duration.............: avg=25.33ms  min=4.17ms med=25.05ms max=362.99ms p(90)=30.44ms  p(95)=32.89ms  p(99.9)=55.51ms
     iterations.....................: 236693  1968.225789/s
     success_rate...................: 100.00% ✓ 236693      ✗ 0     
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

     checks.........................: 100.00% ✓ 458739      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.52µs  min=1.07µs  med=2.41µs  max=4.31ms   p(90)=3.72µs  p(95)=4.36µs   p(99.9)=37.01µs
     http_req_connecting............: avg=777ns   min=0s      med=0s      max=4.27ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.99ms min=2.11ms  med=38.43ms max=324.7ms  p(90)=55.13ms p(95)=60.22ms  p(99.9)=84.27ms
       { expected_response:true }...: avg=38.99ms min=2.11ms  med=38.43ms max=324.7ms  p(90)=55.13ms p(95)=60.22ms  p(99.9)=84.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153013
     http_req_receiving.............: avg=85.77µs min=28.31µs med=61.47µs max=244.66ms p(90)=98.42µs p(95)=117.66µs p(99.9)=2.22ms 
     http_req_sending...............: avg=30.63µs min=5.29µs  med=10.53µs max=184.17ms p(90)=16.17µs p(95)=20.67µs  p(99.9)=1.45ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.87ms min=2.04ms  med=38.33ms max=299.05ms p(90)=55.01ms p(95)=60.08ms  p(99.9)=83.46ms
     http_reqs......................: 153013  1272.381377/s
     iteration_duration.............: avg=39.22ms min=3.8ms   med=38.64ms max=351.74ms p(90)=55.33ms p(95)=60.42ms  p(99.9)=84.68ms
     iterations.....................: 152913  1271.549826/s
     success_rate...................: 100.00% ✓ 152913      ✗ 0     
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

     checks.........................: 100.00% ✓ 225687     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   751 kB/s
     http_req_blocked...............: avg=7.76µs   min=1.2µs   med=2.95µs  max=14.6ms   p(90)=4.49µs   p(95)=5.14µs   p(99.9)=43.11µs 
     http_req_connecting............: avg=4.17µs   min=0s      med=0s      max=13.37ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.43ms  min=3.8ms   med=77.11ms max=336.75ms p(90)=95.87ms  p(95)=104.85ms p(99.9)=197.74ms
       { expected_response:true }...: avg=79.43ms  min=3.8ms   med=77.11ms max=336.75ms p(90)=95.87ms  p(95)=104.85ms p(99.9)=197.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75329
     http_req_receiving.............: avg=157.38µs min=31.86µs med=76.92µs max=235.16ms p(90)=110.69µs p(95)=123.5µs  p(99.9)=1.21ms  
     http_req_sending...............: avg=25.6µs   min=5.91µs  med=13.32µs max=239.7ms  p(90)=20.09µs  p(95)=22.51µs  p(99.9)=833.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.25ms  min=3.69ms  med=77.01ms max=219.45ms p(90)=95.75ms  p(95)=104.72ms p(99.9)=194.8ms 
     http_reqs......................: 75329   625.029568/s
     iteration_duration.............: avg=79.77ms  min=7.96ms  med=77.34ms max=371.63ms p(90)=96.12ms  p(95)=105.12ms p(99.9)=199.79ms
     iterations.....................: 75229   624.199835/s
     success_rate...................: 100.00% ✓ 75229      ✗ 0    
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

     checks.........................: 100.00% ✓ 146748     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   488 kB/s
     http_req_blocked...............: avg=5.49µs   min=1.09µs  med=3.19µs   max=4.3ms    p(90)=4.52µs   p(95)=5.07µs   p(99.9)=184.61µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=112.79µs
     http_req_duration..............: avg=122.18ms min=5.51ms  med=121.91ms max=343.95ms p(90)=147.9ms  p(95)=155.56ms p(99.9)=192.16ms
       { expected_response:true }...: avg=122.18ms min=5.51ms  med=121.91ms max=343.95ms p(90)=147.9ms  p(95)=155.56ms p(99.9)=192.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49016
     http_req_receiving.............: avg=91.07µs  min=30.86µs med=81.49µs  max=105.2ms  p(90)=112.94µs p(95)=124.57µs p(99.9)=773.11µs
     http_req_sending...............: avg=27.76µs  min=5.74µs  med=14.64µs  max=85.27ms  p(90)=20.18µs  p(95)=21.97µs  p(99.9)=692.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.06ms min=5.4ms   med=121.8ms  max=318.59ms p(90)=147.79ms p(95)=155.44ms p(99.9)=191.87ms
     http_reqs......................: 49016   406.122879/s
     iteration_duration.............: avg=122.68ms min=24.41ms med=122.18ms max=366.25ms p(90)=148.15ms p(95)=155.83ms p(99.9)=195.31ms
     iterations.....................: 48916   405.294327/s
     success_rate...................: 100.00% ✓ 48916      ✗ 0    
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

     checks.........................: 100.00% ✓ 100362     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   333 kB/s
     http_req_blocked...............: avg=7.27µs   min=1.29µs  med=3.68µs   max=4.72ms   p(90)=5.22µs   p(95)=5.87µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=3.26µs   min=0s      med=0s       max=4.68ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=178.6ms  min=5.71ms  med=169.51ms max=617.28ms p(90)=216.82ms p(95)=345.94ms p(99.9)=531.45ms
       { expected_response:true }...: avg=178.6ms  min=5.71ms  med=169.51ms max=617.28ms p(90)=216.82ms p(95)=345.94ms p(99.9)=531.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33554
     http_req_receiving.............: avg=103.88µs min=35.5µs  med=97.91µs  max=49.45ms  p(90)=130.16µs p(95)=143.85µs p(99.9)=747.8µs 
     http_req_sending...............: avg=28.06µs  min=6.64µs  med=18.32µs  max=74.62ms  p(90)=23.45µs  p(95)=25.38µs  p(99.9)=598.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.47ms min=5.58ms  med=169.39ms max=617.19ms p(90)=216.69ms p(95)=345.74ms p(99.9)=531.34ms
     http_reqs......................: 33554   277.498059/s
     iteration_duration.............: avg=179.43ms min=31.03ms med=169.86ms max=617.51ms p(90)=217.27ms p(95)=347.84ms p(99.9)=532.65ms
     iterations.....................: 33454   276.67104/s
     success_rate...................: 100.00% ✓ 33454      ✗ 0    
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

     checks.........................: 100.00% ✓ 89127      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=7.12µs   min=1.27µs  med=3.35µs   max=4.36ms   p(90)=4.68µs   p(95)=5.21µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=201.11ms min=8.38ms  med=197.61ms max=406.63ms p(90)=219.46ms p(95)=229.35ms p(99.9)=290.55ms
       { expected_response:true }...: avg=201.11ms min=8.38ms  med=197.61ms max=406.63ms p(90)=219.46ms p(95)=229.35ms p(99.9)=290.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29809
     http_req_receiving.............: avg=98.44µs  min=32.36µs med=91.92µs  max=71ms     p(90)=123.24µs p(95)=135.08µs p(99.9)=531.69µs
     http_req_sending...............: avg=32.68µs  min=5.73µs  med=16.84µs  max=129.72ms p(90)=21.47µs  p(95)=23.36µs  p(99.9)=651.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.98ms min=8.26ms  med=197.49ms max=405.9ms  p(90)=219.32ms p(95)=229.19ms p(99.9)=289.22ms
     http_reqs......................: 29809   246.242892/s
     iteration_duration.............: avg=202.09ms min=42.07ms med=198.87ms max=442.8ms  p(90)=219.83ms p(95)=229.79ms p(99.9)=293.41ms
     iterations.....................: 29709   245.416823/s
     success_rate...................: 100.00% ✓ 29709      ✗ 0    
     vus............................: 32      min=32       max=50 
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

     checks.........................: 100.00% ✓ 870579      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=3.41µs   min=982ns   med=2.59µs  max=10.74ms  p(90)=4.06µs   p(95)=4.87µs   p(99.9)=38.31µs
     http_req_connecting............: avg=336ns    min=0s      med=0s      max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.43ms  min=1.82ms  med=19.88ms max=330.39ms p(90)=28.4ms   p(95)=31.73ms  p(99.9)=54.84ms
       { expected_response:true }...: avg=20.43ms  min=1.82ms  med=19.88ms max=330.39ms p(90)=28.4ms   p(95)=31.73ms  p(99.9)=54.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290293
     http_req_receiving.............: avg=122.02µs min=27.24µs med=54.95µs max=141.51ms p(90)=106.56µs p(95)=273.48µs p(99.9)=9.7ms  
     http_req_sending...............: avg=57.43µs  min=5.34µs  med=10.38µs max=223.9ms  p(90)=18.54µs  p(95)=128.44µs p(99.9)=6.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.25ms  min=1.71ms  med=19.73ms max=297.74ms p(90)=28.18ms  p(95)=31.39ms  p(99.9)=53.77ms
     http_reqs......................: 290293  2414.277044/s
     iteration_duration.............: avg=20.66ms  min=3.43ms  med=20.09ms max=343.21ms p(90)=28.63ms  p(95)=31.97ms  p(99.9)=55.3ms 
     iterations.....................: 290193  2413.445375/s
     success_rate...................: 100.00% ✓ 290193      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 701496      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 281 MB  2.3 MB/s
     http_req_blocked...............: avg=6.4µs    min=1.04µs  med=2.52µs   max=29.6ms   p(90)=3.86µs  p(95)=4.55µs   p(99.9)=36.43µs 
     http_req_connecting............: avg=3.32µs   min=0s      med=0s       max=29.57ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.41ms  min=1.97ms  med=17.28ms  max=577.72ms p(90)=54.13ms p(95)=71.77ms  p(99.9)=187.26ms
       { expected_response:true }...: avg=25.41ms  min=1.97ms  med=17.28ms  max=577.72ms p(90)=54.13ms p(95)=71.77ms  p(99.9)=187.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 233932
     http_req_receiving.............: avg=677.46µs min=51.78µs med=107.39µs max=195.23ms p(90)=1.13ms  p(95)=1.81ms   p(99.9)=56.94ms 
     http_req_sending...............: avg=53.92µs  min=5.39µs  med=10.19µs  max=128.26ms p(90)=17.79µs p(95)=110.44µs p(99.9)=4.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.67ms  min=1.86ms  med=16.72ms  max=576.48ms p(90)=52.9ms  p(95)=70.38ms  p(99.9)=182.55ms
     http_reqs......................: 233932  1945.452817/s
     iteration_duration.............: avg=25.65ms  min=2.56ms  med=17.5ms   max=577.96ms p(90)=54.36ms p(95)=72.02ms  p(99.9)=191.04ms
     iterations.....................: 233832  1944.621185/s
     success_rate...................: 100.00% ✓ 233832      ✗ 0     
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

     checks.........................: 100.00% ✓ 550545      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.8µs    min=981ns   med=2.6µs   max=4.42ms   p(90)=4.98µs   p(95)=6.11µs   p(99.9)=45.68µs
     http_req_connecting............: avg=602ns    min=0s      med=0s      max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.41ms  min=2.38ms  med=31.46ms max=326.22ms p(90)=43.15ms  p(95)=48.01ms  p(99.9)=83.31ms
       { expected_response:true }...: avg=32.41ms  min=2.38ms  med=31.46ms max=326.22ms p(90)=43.15ms  p(95)=48.01ms  p(99.9)=83.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183615
     http_req_receiving.............: avg=117.08µs min=28.85µs med=64.16µs max=170.78ms p(90)=137.31µs p(95)=287.56µs p(99.9)=5.89ms 
     http_req_sending...............: avg=49.86µs  min=5.4µs   med=11.16µs max=197.33ms p(90)=24.59µs  p(95)=136.54µs p(99.9)=3.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.24ms  min=2.27ms  med=31.32ms max=313.61ms p(90)=42.95ms  p(95)=47.77ms  p(99.9)=82.86ms
     http_reqs......................: 183615  1526.185089/s
     iteration_duration.............: avg=32.68ms  min=4.32ms  med=31.71ms max=336.91ms p(90)=43.4ms   p(95)=48.26ms  p(99.9)=84.11ms
     iterations.....................: 183515  1525.353902/s
     success_rate...................: 100.00% ✓ 183515      ✗ 0     
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

     checks.........................: 100.00% ✓ 425823      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.64µs   min=1.02µs  med=2.56µs  max=4.23ms   p(90)=3.92µs  p(95)=4.56µs   p(99.9)=37.72µs
     http_req_connecting............: avg=771ns    min=0s      med=0s      max=4.18ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.02ms  min=2.14ms  med=41.41ms max=354.66ms p(90)=59.23ms p(95)=64.69ms  p(99.9)=91.23ms
       { expected_response:true }...: avg=42.02ms  min=2.14ms  med=41.41ms max=354.66ms p(90)=59.23ms p(95)=64.69ms  p(99.9)=91.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142041
     http_req_receiving.............: avg=139.82µs min=29.18µs med=65.38µs max=311.07ms p(90)=102µs   p(95)=120.12µs p(99.9)=2.87ms 
     http_req_sending...............: avg=26.96µs  min=5.3µs   med=11.29µs max=201.59ms p(90)=17.17µs p(95)=20.87µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.85ms  min=2.08ms  med=41.31ms max=141.42ms p(90)=59.09ms p(95)=64.52ms  p(99.9)=88.18ms
     http_reqs......................: 142041  1180.844226/s
     iteration_duration.............: avg=42.26ms  min=4.02ms  med=41.62ms max=365.55ms p(90)=59.44ms p(95)=64.9ms   p(99.9)=91.8ms 
     iterations.....................: 141941  1180.012886/s
     success_rate...................: 100.00% ✓ 141941      ✗ 0     
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

     checks.........................: 100.00% ✓ 212862     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 85 MB   708 kB/s
     http_req_blocked...............: avg=4.7µs   min=1.06µs  med=3.17µs  max=4.03ms   p(90)=4.69µs   p(95)=5.32µs   p(99.9)=51.53µs 
     http_req_connecting............: avg=1.22µs  min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.2ms  min=3.97ms  med=81.69ms max=321.11ms p(90)=101.64ms p(95)=111.31ms p(99.9)=207.34ms
       { expected_response:true }...: avg=84.2ms  min=3.97ms  med=81.69ms max=321.11ms p(90)=101.64ms p(95)=111.31ms p(99.9)=207.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71054
     http_req_receiving.............: avg=90.91µs min=32.48µs med=81.35µs max=138.53ms p(90)=114.66µs p(95)=127.81µs p(99.9)=941.94µs
     http_req_sending...............: avg=25.36µs min=5.24µs  med=13.98µs max=119.25ms p(90)=20.48µs  p(95)=22.72µs  p(99.9)=719.52µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.08ms min=3.82ms  med=81.58ms max=320.65ms p(90)=101.52ms p(95)=111.16ms p(99.9)=207.15ms
     http_reqs......................: 71054   589.486172/s
     iteration_duration.............: avg=84.57ms min=23.05ms med=81.93ms max=343.47ms p(90)=101.89ms p(95)=111.6ms  p(99.9)=208.37ms
     iterations.....................: 70954   588.656541/s
     success_rate...................: 100.00% ✓ 70954      ✗ 0    
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

     checks.........................: 100.00% ✓ 132672     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   441 kB/s
     http_req_blocked...............: avg=4.47µs   min=1.24µs  med=3.27µs   max=3.26ms   p(90)=4.69µs   p(95)=5.22µs   p(99.9)=246.22µs
     http_req_connecting............: avg=861ns    min=0s      med=0s       max=2.16ms   p(90)=0s       p(95)=0s       p(99.9)=127.16µs
     http_req_duration..............: avg=135.15ms min=6.11ms  med=132.35ms max=358.96ms p(90)=179.63ms p(95)=193.72ms p(99.9)=248.7ms 
       { expected_response:true }...: avg=135.15ms min=6.11ms  med=132.35ms max=358.96ms p(90)=179.63ms p(95)=193.72ms p(99.9)=248.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 44324
     http_req_receiving.............: avg=95.15µs  min=31.28µs med=85.65µs  max=65.75ms  p(90)=117.47µs p(95)=129.65µs p(99.9)=724.96µs
     http_req_sending...............: avg=24.65µs  min=5.69µs  med=15.6µs   max=93.24ms  p(90)=21.08µs  p(95)=22.88µs  p(99.9)=597.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=135.03ms min=5.95ms  med=132.24ms max=353.7ms  p(90)=179.5ms  p(95)=193.6ms  p(99.9)=248.6ms 
     http_reqs......................: 44324   367.013481/s
     iteration_duration.............: avg=135.71ms min=27.5ms  med=132.69ms max=366.79ms p(90)=179.94ms p(95)=194.02ms p(99.9)=250.12ms
     iterations.....................: 44224   366.185457/s
     success_rate...................: 100.00% ✓ 44224      ✗ 0    
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

     checks.........................: 100.00% ✓ 97776      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.92µs   min=1.28µs  med=3.73µs   max=3.88ms   p(90)=5.23µs   p(95)=5.82µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=183.32ms min=6.08ms  med=167.43ms max=610.01ms p(90)=212.85ms p(95)=389.97ms p(99.9)=521.81ms
       { expected_response:true }...: avg=183.32ms min=6.08ms  med=167.43ms max=610.01ms p(90)=212.85ms p(95)=389.97ms p(99.9)=521.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32692
     http_req_receiving.............: avg=102.88µs min=35.28µs med=98.74µs  max=11.7ms   p(90)=130.84µs p(95)=144.48µs p(99.9)=496.05µs
     http_req_sending...............: avg=31.39µs  min=6.18µs  med=18.32µs  max=123.32ms p(90)=23.31µs  p(95)=25.08µs  p(99.9)=507.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.19ms min=5.95ms  med=167.3ms  max=609.9ms  p(90)=212.72ms p(95)=389.86ms p(99.9)=521.69ms
     http_reqs......................: 32692   270.310185/s
     iteration_duration.............: avg=184.18ms min=21.09ms med=167.79ms max=610.28ms p(90)=213.31ms p(95)=390.73ms p(99.9)=522.06ms
     iterations.....................: 32592   269.483346/s
     success_rate...................: 100.00% ✓ 32592      ✗ 0    
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

     checks.........................: 100.00% ✓ 88176      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=8.01µs   min=1.26µs  med=3.55µs   max=4.95ms   p(90)=4.91µs   p(95)=5.51µs   p(99.9)=2.06ms  
     http_req_connecting............: avg=4.24µs   min=0s      med=0s       max=4.88ms   p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=203.26ms min=8.57ms  med=204.23ms max=444.2ms  p(90)=213.96ms p(95)=219.05ms p(99.9)=284.42ms
       { expected_response:true }...: avg=203.26ms min=8.57ms  med=204.23ms max=444.2ms  p(90)=213.96ms p(95)=219.05ms p(99.9)=284.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29492
     http_req_receiving.............: avg=102.89µs min=35.81µs med=95.06µs  max=60.28ms  p(90)=128.1µs  p(95)=141.39µs p(99.9)=680.68µs
     http_req_sending...............: avg=35.44µs  min=6.55µs  med=17.36µs  max=92.79ms  p(90)=22.2µs   p(95)=24.07µs  p(99.9)=524.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.13ms min=8.46ms  med=204.1ms  max=443.85ms p(90)=213.84ms p(95)=218.94ms p(99.9)=284.26ms
     http_reqs......................: 29492   243.543364/s
     iteration_duration.............: avg=204.25ms min=62.25ms med=204.64ms max=470.63ms p(90)=214.24ms p(95)=219.36ms p(99.9)=308.39ms
     iterations.....................: 29392   242.717569/s
     success_rate...................: 100.00% ✓ 29392      ✗ 0    
     vus............................: 48      min=48       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

