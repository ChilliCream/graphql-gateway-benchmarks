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
| hive-router | v0.0.49 | 2,903 | 3,091 | 2,827 | 3.0% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,196 | 2,256 | 2,188 | 1.1% |  |
| grafbase | 0.53.3 | 2,012 | 2,086 | 1,992 | 1.6% |  |
| cosmo | 0.307.0 | 1,271 | 1,291 | 1,258 | 0.9% | non-compatible response (2 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 528 | 540 | 524 | 1.1% |  |
| apollo-router | v2.13.1 | 431 | 441 | 426 | 1.2% |  |
| hive-gateway | 2.5.25 | 251 | 255 | 248 | 1.1% |  |
| apollo-gateway | 2.13.3 | 243 | 246 | 241 | 0.7% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,382 | 2,524 | 2,353 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,011 | 2,061 | 1,991 | 1.2% |  |
| grafbase | 0.53.3 | 1,542 | 1,575 | 1,534 | 0.9% |  |
| cosmo | 0.307.0 | 1,171 | 1,197 | 1,163 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.25 | 502 | 518 | 497 | 1.5% |  |
| apollo-router | v2.13.1 | 372 | 384 | 367 | 1.6% |  |
| hive-gateway | 2.5.25 | 251 | 257 | 248 | 1.2% |  |
| apollo-gateway | 2.13.3 | 235 | 239 | 234 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1046496     ✗ 0     
     data_received..................: 31 GB   255 MB/s
     data_sent......................: 419 MB  3.5 MB/s
     http_req_blocked...............: avg=2.78µs   min=981ns   med=1.95µs  max=20.43ms  p(90)=3.03µs  p(95)=3.64µs   p(99.9)=27.61µs
     http_req_connecting............: avg=325ns    min=0s      med=0s      max=4.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.96ms  min=1.62ms  med=16.06ms max=315.59ms p(90)=25.05ms p(95)=28.95ms  p(99.9)=52.55ms
       { expected_response:true }...: avg=16.96ms  min=1.62ms  med=16.06ms max=315.59ms p(90)=25.05ms p(95)=28.95ms  p(99.9)=52.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 348932
     http_req_receiving.............: avg=132.52µs min=27.42µs med=47.35µs max=269.25ms p(90)=90.25µs p(95)=257.55µs p(99.9)=16.24ms
     http_req_sending...............: avg=53.49µs  min=5.15µs  med=8.63µs  max=207.88ms p(90)=14.28µs p(95)=115.27µs p(99.9)=6.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.78ms  min=1.54ms  med=15.93ms max=291.89ms p(90)=24.79ms p(95)=28.55ms  p(99.9)=50.85ms
     http_reqs......................: 348932  2903.078745/s
     iteration_duration.............: avg=17.19ms  min=2.17ms  med=16.27ms max=343.12ms p(90)=25.28ms p(95)=29.2ms   p(99.9)=53.59ms
     iterations.....................: 348832  2902.246756/s
     success_rate...................: 100.00% ✓ 348832      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 792489      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 318 MB  2.6 MB/s
     http_req_blocked...............: avg=2.95µs   min=942ns  med=2.05µs   max=12.93ms  p(90)=3.3µs    p(95)=3.95µs  p(99.9)=34.9µs  
     http_req_connecting............: avg=392ns    min=0s     med=0s       max=4.03ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.47ms  min=2.45ms med=14.66ms  max=352.27ms p(90)=49.29ms  p(95)=67.2ms  p(99.9)=163.02ms
       { expected_response:true }...: avg=22.47ms  min=2.45ms med=14.66ms  max=352.27ms p(90)=49.29ms  p(95)=67.2ms  p(99.9)=163.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 264263
     http_req_receiving.............: avg=674.36µs min=50.2µs med=100.08µs max=209.84ms p(90)=979.21µs p(95)=1.55ms  p(99.9)=58.69ms 
     http_req_sending...............: avg=42.52µs  min=5.27µs med=9.16µs   max=137.11ms p(90)=15.66µs  p(95)=102.6µs p(99.9)=3.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.75ms  min=2.37ms med=14.14ms  max=346.33ms p(90)=47.85ms  p(95)=65.72ms p(99.9)=159.27ms
     http_reqs......................: 264263  2196.781357/s
     iteration_duration.............: avg=22.7ms   min=3.26ms med=14.87ms  max=384ms    p(90)=49.52ms  p(95)=67.43ms p(99.9)=163.94ms
     iterations.....................: 264163  2195.950071/s
     success_rate...................: 100.00% ✓ 264163      ✗ 0     
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

     checks.........................: 100.00% ✓ 725844      ✗ 0     
     data_received..................: 21 GB   177 MB/s
     data_sent......................: 291 MB  2.4 MB/s
     http_req_blocked...............: avg=3.15µs   min=972ns   med=2.21µs  max=12.32ms  p(90)=3.72µs   p(95)=4.52µs   p(99.9)=40.3µs 
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.55ms  min=1.88ms  med=24.29ms max=345.29ms p(90)=29.49ms  p(95)=31.8ms   p(99.9)=53.64ms
       { expected_response:true }...: avg=24.55ms  min=1.88ms  med=24.29ms max=345.29ms p(90)=29.49ms  p(95)=31.8ms   p(99.9)=53.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 242048
     http_req_receiving.............: avg=129.09µs min=29.47µs med=58.66µs max=211.28ms p(90)=100.75µs p(95)=174.27µs p(99.9)=10.58ms
     http_req_sending...............: avg=44.73µs  min=5.31µs  med=10.21µs max=267.37ms p(90)=17.75µs  p(95)=104.52µs p(99.9)=3.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.38ms  min=1.83ms  med=24.18ms max=134.3ms  p(90)=29.31ms  p(95)=31.54ms  p(99.9)=52.38ms
     http_reqs......................: 242048  2012.707924/s
     iteration_duration.............: avg=24.79ms  min=3.34ms  med=24.5ms  max=363.72ms p(90)=29.71ms  p(95)=32.04ms  p(99.9)=54.16ms
     iterations.....................: 241948  2011.876392/s
     success_rate...................: 100.00% ✓ 241948      ✗ 0     
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

     checks.........................: 100.00% ✓ 458583      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=2.64µs  min=1.01µs  med=2.07µs  max=2.16ms   p(90)=3.37µs  p(95)=4.02µs   p(99.9)=30.84µs
     http_req_connecting............: avg=243ns   min=0s      med=0s      max=2.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.02ms min=2.14ms  med=38.48ms max=330.93ms p(90)=55.05ms p(95)=60.21ms  p(99.9)=84.78ms
       { expected_response:true }...: avg=39.02ms min=2.14ms  med=38.48ms max=330.93ms p(90)=55.05ms p(95)=60.21ms  p(99.9)=84.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152961
     http_req_receiving.............: avg=113.7µs min=27.44µs med=58.61µs max=249.11ms p(90)=93.72µs p(95)=111.74µs p(99.9)=2.16ms 
     http_req_sending...............: avg=24.3µs  min=5.11µs  med=9.84µs  max=47.96ms  p(90)=15.39µs p(95)=19.35µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.88ms min=2.08ms  med=38.38ms max=121.43ms p(90)=54.94ms p(95)=60.08ms  p(99.9)=83.21ms
     http_reqs......................: 152961  1271.727813/s
     iteration_duration.............: avg=39.24ms min=3.11ms  med=38.68ms max=339.36ms p(90)=55.24ms p(95)=60.41ms  p(99.9)=85.31ms
     iterations.....................: 152861  1270.896407/s
     success_rate...................: 100.00% ✓ 152861      ✗ 0     
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

     checks.........................: 100.00% ✓ 190944     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   635 kB/s
     http_req_blocked...............: avg=4.7µs   min=1.18µs  med=2.71µs  max=4ms      p(90)=4.31µs   p(95)=4.92µs   p(99.9)=44.27µs 
     http_req_connecting............: avg=1.64µs  min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.9ms  min=4.14ms  med=91.08ms max=363.21ms p(90)=115.72ms p(95)=129.03ms p(99.9)=222.63ms
       { expected_response:true }...: avg=93.9ms  min=4.14ms  med=91.08ms max=363.21ms p(90)=115.72ms p(95)=129.03ms p(99.9)=222.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63748
     http_req_receiving.............: avg=88.28µs min=31.36µs med=74.61µs max=115.53ms p(90)=108.99µs p(95)=121.67µs p(99.9)=963.09µs
     http_req_sending...............: avg=21.53µs min=5.51µs  med=12.65µs max=82.01ms  p(90)=19.09µs  p(95)=21.32µs  p(99.9)=668.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.79ms min=4.02ms  med=90.98ms max=359.86ms p(90)=115.6ms  p(95)=128.91ms p(99.9)=222.33ms
     http_reqs......................: 63748   528.732818/s
     iteration_duration.............: avg=94.28ms min=21.56ms med=91.31ms max=377.11ms p(90)=115.98ms p(95)=129.32ms p(99.9)=224.92ms
     iterations.....................: 63648   527.903407/s
     success_rate...................: 100.00% ✓ 63648      ✗ 0    
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

     checks.........................: 100.00% ✓ 155817     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   518 kB/s
     http_req_blocked...............: avg=5.66µs   min=1.08µs  med=3.36µs   max=4.12ms   p(90)=4.86µs   p(95)=5.46µs   p(99.9)=94.4µs  
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.08ms min=5.39ms  med=114.84ms max=352.1ms  p(90)=138.97ms p(95)=146.13ms p(99.9)=180.11ms
       { expected_response:true }...: avg=115.08ms min=5.39ms  med=114.84ms max=352.1ms  p(90)=138.97ms p(95)=146.13ms p(99.9)=180.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52039
     http_req_receiving.............: avg=89.44µs  min=31.63µs med=83.02µs  max=80.96ms  p(90)=114.55µs p(95)=126.96µs p(99.9)=715.31µs
     http_req_sending...............: avg=27.65µs  min=5.84µs  med=15.55µs  max=80.3ms   p(90)=21.18µs  p(95)=23.04µs  p(99.9)=725.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.97ms min=5.28ms  med=114.73ms max=351.17ms p(90)=138.86ms p(95)=146.01ms p(99.9)=180.03ms
     http_reqs......................: 52039   431.209913/s
     iteration_duration.............: avg=115.55ms min=24.43ms med=115.13ms max=375.65ms p(90)=139.23ms p(95)=146.37ms p(99.9)=181.81ms
     iterations.....................: 51939   430.381284/s
     success_rate...................: 100.00% ✓ 51939      ✗ 0    
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

     checks.........................: 100.00% ✓ 90897      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   301 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.29µs  med=3.44µs   max=4.12ms   p(90)=4.84µs   p(95)=5.44µs   p(99.9)=1.13ms  
     http_req_connecting............: avg=2.92µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=197.3ms  min=6.1ms   med=180.22ms max=615.3ms  p(90)=231.79ms p(95)=376.2ms  p(99.9)=569.73ms
       { expected_response:true }...: avg=197.3ms  min=6.1ms   med=180.22ms max=615.3ms  p(90)=231.79ms p(95)=376.2ms  p(99.9)=569.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30399
     http_req_receiving.............: avg=97.38µs  min=32.3µs  med=93.09µs  max=16.91ms  p(90)=124.67µs p(95)=137.51µs p(99.9)=588.68µs
     http_req_sending...............: avg=24.33µs  min=6.44µs  med=17.25µs  max=40.67ms  p(90)=22.5µs   p(95)=24.43µs  p(99.9)=579.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.18ms min=5.98ms  med=180.1ms  max=615.21ms p(90)=231.64ms p(95)=376.06ms p(99.9)=569.52ms
     http_reqs......................: 30399   251.030737/s
     iteration_duration.............: avg=198.2ms  min=32.82ms med=180.59ms max=615.5ms  p(90)=232.32ms p(95)=378.87ms p(99.9)=569.98ms
     iterations.....................: 30299   250.204951/s
     success_rate...................: 100.00% ✓ 30299      ✗ 0    
     vus............................: 13      min=13       max=50 
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

     checks.........................: 100.00% ✓ 88083      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7µs      min=1.23µs  med=3.22µs   max=4.73ms   p(90)=4.45µs   p(95)=4.96µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.66µs   min=0s      med=0s       max=4.69ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=203.5ms  min=8.6ms   med=206.07ms max=443.91ms p(90)=214.6ms  p(95)=220.48ms p(99.9)=291.74ms
       { expected_response:true }...: avg=203.5ms  min=8.6ms   med=206.07ms max=443.91ms p(90)=214.6ms  p(95)=220.48ms p(99.9)=291.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29461
     http_req_receiving.............: avg=95.51µs  min=33.25µs med=88.78µs  max=51.43ms  p(90)=120µs    p(95)=132.59µs p(99.9)=560.59µs
     http_req_sending...............: avg=43.26µs  min=5.68µs  med=15.87µs  max=192.86ms p(90)=20.74µs  p(95)=22.52µs  p(99.9)=569.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.37ms min=8.49ms  med=205.96ms max=443.81ms p(90)=214.47ms p(95)=220.35ms p(99.9)=291.3ms 
     http_reqs......................: 29461   243.320279/s
     iteration_duration.............: avg=204.47ms min=46.46ms med=206.31ms max=450.14ms p(90)=214.86ms p(95)=220.81ms p(99.9)=309.92ms
     iterations.....................: 29361   242.494373/s
     success_rate...................: 100.00% ✓ 29361      ✗ 0    
     vus............................: 39      min=39       max=50 
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

     checks.........................: 100.00% ✓ 859140      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.98µs   min=962ns   med=2.22µs  max=11.82ms  p(90)=3.7µs    p(95)=4.54µs   p(99.9)=29.17µs
     http_req_connecting............: avg=182ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.71ms  min=1.94ms  med=20.28ms max=328.55ms p(90)=28.53ms  p(95)=31.43ms  p(99.9)=53.5ms 
       { expected_response:true }...: avg=20.71ms  min=1.94ms  med=20.28ms max=328.55ms p(90)=28.53ms  p(95)=31.43ms  p(99.9)=53.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 286480
     http_req_receiving.............: avg=131.17µs min=28.22µs med=54.55µs max=286.78ms p(90)=101.53µs p(95)=239.93µs p(99.9)=9.5ms  
     http_req_sending...............: avg=50.06µs  min=5.18µs  med=9.77µs  max=243.56ms p(90)=17.87µs  p(95)=121.54µs p(99.9)=4.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.53ms  min=1.84ms  med=20.15ms max=148.63ms p(90)=28.35ms  p(95)=31.18ms  p(99.9)=51.75ms
     http_reqs......................: 286480  2382.132038/s
     iteration_duration.............: avg=20.94ms  min=3.1ms   med=20.49ms max=350.66ms p(90)=28.74ms  p(95)=31.66ms  p(99.9)=53.92ms
     iterations.....................: 286380  2381.30052/s
     success_rate...................: 100.00% ✓ 286380      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 725208      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 291 MB  2.4 MB/s
     http_req_blocked...............: avg=3.1µs    min=1.03µs  med=2.13µs  max=30.7ms   p(90)=3.63µs  p(95)=4.43µs   p(99.9)=33.19µs 
     http_req_connecting............: avg=523ns    min=0s      med=0s      max=30.65ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.57ms  min=2ms     med=17.06ms max=538.33ms p(90)=51.23ms p(95)=67.61ms  p(99.9)=183.77ms
       { expected_response:true }...: avg=24.57ms  min=2ms     med=17.06ms max=538.33ms p(90)=51.23ms p(95)=67.61ms  p(99.9)=183.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241836
     http_req_receiving.............: avg=664.73µs min=50.14µs med=102.9µs max=171.36ms p(90)=1.12ms  p(95)=1.8ms    p(99.9)=56.73ms 
     http_req_sending...............: avg=42.46µs  min=5.19µs  med=9.49µs  max=163.91ms p(90)=17.73µs p(95)=107.61µs p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.87ms  min=1.77ms  med=16.53ms max=538.25ms p(90)=49.92ms p(95)=66.13ms  p(99.9)=181.25ms
     http_reqs......................: 241836  2011.03896/s
     iteration_duration.............: avg=24.81ms  min=2.54ms  med=17.28ms max=538.48ms p(90)=51.47ms p(95)=67.86ms  p(99.9)=186.24ms
     iterations.....................: 241736  2010.207389/s
     success_rate...................: 100.00% ✓ 241736      ✗ 0     
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

     checks.........................: 100.00% ✓ 556500      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.9 MB/s
     http_req_blocked...............: avg=3.76µs   min=961ns   med=2.33µs  max=6.29ms   p(90)=4.71µs   p(95)=5.91µs   p(99.9)=43.61µs
     http_req_connecting............: avg=787ns    min=0s      med=0s      max=6.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.07ms  min=2.34ms  med=31.09ms max=340.73ms p(90)=42.86ms  p(95)=47.81ms  p(99.9)=93.03ms
       { expected_response:true }...: avg=32.07ms  min=2.34ms  med=31.09ms max=340.73ms p(90)=42.86ms  p(95)=47.81ms  p(99.9)=93.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185600
     http_req_receiving.............: avg=115.69µs min=29.83µs med=60.84µs max=239.99ms p(90)=134.05µs p(95)=281.61µs p(99.9)=6.24ms 
     http_req_sending...............: avg=49.1µs   min=5.25µs  med=10.22µs max=168.09ms p(90)=23.73µs  p(95)=134.25µs p(99.9)=3.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.9ms   min=2.27ms  med=30.95ms max=340.07ms p(90)=42.66ms  p(95)=47.57ms  p(99.9)=92.06ms
     http_reqs......................: 185600  1542.738264/s
     iteration_duration.............: avg=32.33ms  min=3.76ms  med=31.33ms max=371.35ms p(90)=43.1ms   p(95)=48.05ms  p(99.9)=93.97ms
     iterations.....................: 185500  1541.907047/s
     success_rate...................: 100.00% ✓ 185500      ✗ 0     
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

     checks.........................: 100.00% ✓ 422574      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.11µs  min=990ns  med=2.33µs  max=4.01ms   p(90)=3.92µs   p(95)=4.59µs   p(99.9)=34.01µs
     http_req_connecting............: avg=397ns   min=0s     med=0s      max=3.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.34ms min=2.11ms med=41.8ms  max=323.78ms p(90)=59.57ms  p(95)=64.91ms  p(99.9)=90.44ms
       { expected_response:true }...: avg=42.34ms min=2.11ms med=41.8ms  max=323.78ms p(90)=59.57ms  p(95)=64.91ms  p(99.9)=90.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140958
     http_req_receiving.............: avg=82.34µs min=29.7µs med=65.78µs max=84.94ms  p(90)=103.89µs p(95)=121.87µs p(99.9)=1.57ms 
     http_req_sending...............: avg=28.73µs min=5.48µs med=11.27µs max=228.77ms p(90)=17.81µs  p(95)=21.23µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.23ms min=2.04ms med=41.69ms max=308.75ms p(90)=59.47ms  p(95)=64.8ms   p(99.9)=90.13ms
     http_reqs......................: 140958  1171.847256/s
     iteration_duration.............: avg=42.58ms min=4.41ms med=42.01ms max=339.87ms p(90)=59.78ms  p(95)=65.11ms  p(99.9)=91.13ms
     iterations.....................: 140858  1171.015911/s
     success_rate...................: 100.00% ✓ 140858      ✗ 0     
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

     checks.........................: 100.00% ✓ 181344     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   603 kB/s
     http_req_blocked...............: avg=4.99µs  min=1.16µs  med=2.94µs  max=4.15ms   p(90)=4.5µs    p(95)=5.1µs    p(99.9)=42µs    
     http_req_connecting............: avg=1.76µs  min=0s      med=0s      max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.87ms min=4.18ms  med=96.01ms max=358.13ms p(90)=118.81ms p(95)=131.7ms  p(99.9)=231.26ms
       { expected_response:true }...: avg=98.87ms min=4.18ms  med=96.01ms max=358.13ms p(90)=118.81ms p(95)=131.7ms  p(99.9)=231.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60548
     http_req_receiving.............: avg=87.84µs min=31.54µs med=78.97µs max=71.44ms  p(90)=112.33µs p(95)=124.6µs  p(99.9)=757.03µs
     http_req_sending...............: avg=31.99µs min=5.54µs  med=13.58µs max=179.27ms p(90)=19.87µs  p(95)=21.88µs  p(99.9)=708.95µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.75ms min=4.11ms  med=95.91ms max=357.56ms p(90)=118.7ms  p(95)=131.55ms p(99.9)=230.94ms
     http_reqs......................: 60548   502.167328/s
     iteration_duration.............: avg=99.27ms min=31.74ms med=96.25ms max=392.25ms p(90)=119.06ms p(95)=131.99ms p(99.9)=232.38ms
     iterations.....................: 60448   501.337957/s
     success_rate...................: 100.00% ✓ 60448      ✗ 0    
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

     checks.........................: 100.00% ✓ 134613     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   447 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.22µs  med=3.47µs   max=4.7ms    p(90)=4.99µs   p(95)=5.58µs   p(99.9)=572.19µs
     http_req_connecting............: avg=2.39µs   min=0s      med=0s       max=4.66ms   p(90)=0s       p(95)=0s       p(99.9)=548.44µs
     http_req_duration..............: avg=133.2ms  min=5.82ms  med=130.66ms max=360.72ms p(90)=176.2ms  p(95)=189.49ms p(99.9)=244.09ms
       { expected_response:true }...: avg=133.2ms  min=5.82ms  med=130.66ms max=360.72ms p(90)=176.2ms  p(95)=189.49ms p(99.9)=244.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44971
     http_req_receiving.............: avg=97.51µs  min=34.12µs med=88.03µs  max=145.96ms p(90)=119.9µs  p(95)=132.56µs p(99.9)=733.12µs
     http_req_sending...............: avg=27.25µs  min=6.13µs  med=16.57µs  max=96.18ms  p(90)=21.98µs  p(95)=23.81µs  p(99.9)=616.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.08ms min=5.73ms  med=130.55ms max=360.14ms p(90)=176.08ms p(95)=189.35ms p(99.9)=243.8ms 
     http_reqs......................: 44971   372.374319/s
     iteration_duration.............: avg=133.77ms min=31.81ms med=130.98ms max=368.98ms p(90)=176.49ms p(95)=189.82ms p(99.9)=248.19ms
     iterations.....................: 44871   371.546287/s
     success_rate...................: 100.00% ✓ 44871      ✗ 0    
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

     checks.........................: 100.00% ✓ 90948      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   302 kB/s
     http_req_blocked...............: avg=5.58µs   min=1.3µs   med=3.65µs   max=2.36ms   p(90)=5.15µs   p(95)=5.75µs   p(99.9)=801.4µs 
     http_req_connecting............: avg=1.73µs   min=0s      med=0s       max=2.33ms   p(90)=0s       p(95)=0s       p(99.9)=775.01µs
     http_req_duration..............: avg=197.08ms min=6.47ms  med=180.99ms max=618.54ms p(90)=232.17ms p(95)=404.85ms p(99.9)=536.52ms
       { expected_response:true }...: avg=197.08ms min=6.47ms  med=180.99ms max=618.54ms p(90)=232.17ms p(95)=404.85ms p(99.9)=536.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30416
     http_req_receiving.............: avg=101.61µs min=35.52µs med=97.9µs   max=4.96ms   p(90)=129.75µs p(95)=143.09µs p(99.9)=698.11µs
     http_req_sending...............: avg=25.51µs  min=6.14µs  med=18.51µs  max=67.51ms  p(90)=23.43µs  p(95)=25.19µs  p(99.9)=532.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.95ms min=6.32ms  med=180.86ms max=618.42ms p(90)=232.05ms p(95)=404.75ms p(99.9)=536.42ms
     http_reqs......................: 30416   251.591912/s
     iteration_duration.............: avg=198.01ms min=48.79ms med=181.38ms max=618.79ms p(90)=232.62ms p(95)=405.47ms p(99.9)=536.94ms
     iterations.....................: 30316   250.764742/s
     success_rate...................: 100.00% ✓ 30316      ✗ 0    
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

     checks.........................: 100.00% ✓ 85269      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=7.55µs   min=1.3µs   med=3.55µs   max=4.72ms   p(90)=4.93µs   p(95)=5.49µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=3.84µs   min=0s      med=0s       max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=210.23ms min=8.57ms  med=214.22ms max=438.62ms p(90)=225.47ms p(95)=233.1ms  p(99.9)=299.57ms
       { expected_response:true }...: avg=210.23ms min=8.57ms  med=214.22ms max=438.62ms p(90)=225.47ms p(95)=233.1ms  p(99.9)=299.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28523
     http_req_receiving.............: avg=99.46µs  min=32.2µs  med=94.99µs  max=9.99ms   p(90)=126.18µs p(95)=139.24µs p(99.9)=581.75µs
     http_req_sending...............: avg=29.82µs  min=6.15µs  med=17.68µs  max=66.29ms  p(90)=22.42µs  p(95)=24.22µs  p(99.9)=605.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.1ms  min=8.41ms  med=214.1ms  max=438.15ms p(90)=225.33ms p(95)=232.99ms p(99.9)=299.33ms
     http_reqs......................: 28523   235.545613/s
     iteration_duration.............: avg=211.23ms min=45.88ms med=214.53ms max=453.68ms p(90)=225.76ms p(95)=233.47ms p(99.9)=301.85ms
     iterations.....................: 28423   234.719803/s
     success_rate...................: 100.00% ✓ 28423      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

