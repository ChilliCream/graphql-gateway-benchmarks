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
| hive-router | v0.0.49 | 2,910 | 3,137 | 2,853 | 3.2% |  |
| hotchocolate | 16.1.0-p.1.7 | 2,151 | 2,196 | 2,121 | 1.1% |  |
| grafbase | 0.53.3 | 2,066 | 2,139 | 2,037 | 1.4% |  |
| cosmo | 0.307.0 | 1,247 | 1,262 | 1,234 | 0.9% | non-compatible response (5 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 529 | 542 | 524 | 1.2% |  |
| apollo-router | v2.13.1 | 398 | 411 | 393 | 1.5% |  |
| hive-gateway | 2.5.25 | 245 | 250 | 243 | 1.0% |  |
| apollo-gateway | 2.13.3 | 241 | 243 | 239 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,345 | 2,485 | 2,322 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.7 | 1,991 | 2,042 | 1,980 | 1.1% |  |
| grafbase | 0.53.3 | 1,507 | 1,540 | 1,496 | 0.9% |  |
| cosmo | 0.307.0 | 1,200 | 1,224 | 1,195 | 0.8% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 507 | 524 | 500 | 1.5% |  |
| apollo-router | v2.13.1 | 398 | 409 | 394 | 1.3% |  |
| hive-gateway | 2.5.25 | 239 | 246 | 238 | 1.4% |  |
| apollo-gateway | 2.13.3 | 237 | 241 | 235 | 0.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1049133     ✗ 0     
     data_received..................: 31 GB   255 MB/s
     data_sent......................: 420 MB  3.5 MB/s
     http_req_blocked...............: avg=3µs      min=962ns   med=2.14µs  max=22.92ms  p(90)=3.37µs  p(95)=3.99µs   p(99.9)=32.33µs
     http_req_connecting............: avg=302ns    min=0s      med=0s      max=4.67ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.91ms  min=1.6ms   med=15.95ms max=359ms    p(90)=25.12ms p(95)=29.21ms  p(99.9)=51.72ms
       { expected_response:true }...: avg=16.91ms  min=1.6ms   med=15.95ms max=359ms    p(90)=25.12ms p(95)=29.21ms  p(99.9)=51.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 349811
     http_req_receiving.............: avg=151.85µs min=27.86µs med=49.11µs max=155.46ms p(90)=98.44µs p(95)=282.1µs  p(99.9)=15.83ms
     http_req_sending...............: avg=62.22µs  min=5.01µs  med=8.91µs  max=188ms    p(90)=15.27µs p(95)=121.77µs p(99.9)=15.49ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.7ms   min=1.51ms  med=15.79ms max=203.18ms p(90)=24.81ms p(95)=28.73ms  p(99.9)=49.75ms
     http_reqs......................: 349811  2910.333833/s
     iteration_duration.............: avg=17.14ms  min=2.09ms  med=16.16ms max=377.22ms p(90)=25.36ms p(95)=29.48ms  p(99.9)=52.97ms
     iterations.....................: 349711  2909.50186/s
     success_rate...................: 100.00% ✓ 349711      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 776130      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=2.9µs   min=1.02µs  med=2.09µs   max=11.02ms  p(90)=3.21µs   p(95)=3.78µs   p(99.9)=33.45µs 
     http_req_connecting............: avg=414ns   min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.95ms min=2.43ms  med=14.48ms  max=349.32ms p(90)=51.68ms  p(95)=70.31ms  p(99.9)=168.38ms
       { expected_response:true }...: avg=22.95ms min=2.43ms  med=14.48ms  max=349.32ms p(90)=51.68ms  p(95)=70.31ms  p(99.9)=168.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258810
     http_req_receiving.............: avg=675µs   min=51.72µs med=102.61µs max=195.69ms p(90)=975.28µs p(95)=1.52ms   p(99.9)=62.3ms  
     http_req_sending...............: avg=44.99µs min=5.12µs  med=8.87µs   max=153.14ms p(90)=14.55µs  p(95)=104.58µs p(99.9)=3.54ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.23ms min=2.34ms  med=13.97ms  max=349.21ms p(90)=50.23ms  p(95)=68.85ms  p(99.9)=166.27ms
     http_reqs......................: 258810  2151.629365/s
     iteration_duration.............: avg=23.18ms min=3.27ms  med=14.7ms   max=349.54ms p(90)=51.91ms  p(95)=70.54ms  p(99.9)=169.6ms 
     iterations.....................: 258710  2150.798011/s
     success_rate...................: 100.00% ✓ 258710      ✗ 0     
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

     checks.........................: 100.00% ✓ 745068      ✗ 0     
     data_received..................: 22 GB   182 MB/s
     data_sent......................: 299 MB  2.5 MB/s
     http_req_blocked...............: avg=3.02µs   min=1µs     med=2.33µs  max=14.26ms  p(90)=3.9µs    p(95)=4.71µs   p(99.9)=43.14µs
     http_req_connecting............: avg=182ns    min=0s      med=0s      max=2.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.9ms   min=1.95ms  med=23.65ms max=341.54ms p(90)=28.68ms  p(95)=30.98ms  p(99.9)=52.75ms
       { expected_response:true }...: avg=23.9ms   min=1.95ms  med=23.65ms max=341.54ms p(90)=28.68ms  p(95)=30.98ms  p(99.9)=52.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 248456
     http_req_receiving.............: avg=122.08µs min=29.36µs med=59.2µs  max=184.98ms p(90)=105.48µs p(95)=216.38µs p(99.9)=9.28ms 
     http_req_sending...............: avg=47.56µs  min=5.08µs  med=10.72µs max=106.19ms p(90)=19.21µs  p(95)=119.48µs p(99.9)=3.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.73ms  min=1.89ms  med=23.54ms max=182.31ms p(90)=28.5ms   p(95)=30.71ms  p(99.9)=51.46ms
     http_reqs......................: 248456  2066.056128/s
     iteration_duration.............: avg=24.14ms  min=3.78ms  med=23.87ms max=351.07ms p(90)=28.91ms  p(95)=31.22ms  p(99.9)=53.65ms
     iterations.....................: 248356  2065.22457/s
     success_rate...................: 100.00% ✓ 248356      ✗ 0     
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

     checks.........................: 100.00% ✓ 449856      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.01µs  min=1.03µs  med=2.07µs  max=3.79ms   p(90)=3.26µs  p(95)=3.84µs   p(99.9)=31.88µs
     http_req_connecting............: avg=646ns   min=0s      med=0s      max=3.76ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.78ms min=2.15ms  med=39.24ms max=309.16ms p(90)=56.2ms  p(95)=61.28ms  p(99.9)=84.92ms
       { expected_response:true }...: avg=39.78ms min=2.15ms  med=39.24ms max=309.16ms p(90)=56.2ms  p(95)=61.28ms  p(99.9)=84.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150052
     http_req_receiving.............: avg=77.1µs  min=28.33µs med=58µs    max=224.17ms p(90)=90.28µs p(95)=105.46µs p(99.9)=1.54ms 
     http_req_sending...............: avg=22.52µs min=5.26µs  med=9.6µs   max=102.22ms p(90)=14.18µs p(95)=18.01µs  p(99.9)=1.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.68ms min=2.04ms  med=39.14ms max=292.06ms p(90)=56.09ms p(95)=61.17ms  p(99.9)=84.41ms
     http_reqs......................: 150052  1247.545986/s
     iteration_duration.............: avg=40ms    min=4.09ms  med=39.43ms max=338.71ms p(90)=56.39ms p(95)=61.47ms  p(99.9)=85.42ms
     iterations.....................: 149952  1246.714577/s
     success_rate...................: 100.00% ✓ 149952      ✗ 0     
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

     checks.........................: 100.00% ✓ 191295     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   636 kB/s
     http_req_blocked...............: avg=4.69µs  min=1.18µs  med=2.83µs  max=4.1ms    p(90)=4.38µs   p(95)=4.98µs   p(99.9)=44.16µs 
     http_req_connecting............: avg=1.56µs  min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.73ms min=3.95ms  med=90.6ms  max=327.72ms p(90)=115.76ms p(95)=129.59ms p(99.9)=223.15ms
       { expected_response:true }...: avg=93.73ms min=3.95ms  med=90.6ms  max=327.72ms p(90)=115.76ms p(95)=129.59ms p(99.9)=223.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63865
     http_req_receiving.............: avg=94.38µs min=30.24µs med=76.06µs max=201.32ms p(90)=109.91µs p(95)=122.4µs  p(99.9)=832.3µs 
     http_req_sending...............: avg=24.21µs min=5.69µs  med=12.77µs max=153.72ms p(90)=19.07µs  p(95)=21.33µs  p(99.9)=677.48µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.61ms min=3.89ms  med=90.5ms  max=327.07ms p(90)=115.64ms p(95)=129.41ms p(99.9)=222.2ms 
     http_reqs......................: 63865   529.851398/s
     iteration_duration.............: avg=94.1ms  min=22.42ms med=90.84ms max=365.8ms  p(90)=116ms    p(95)=129.93ms p(99.9)=224.85ms
     iterations.....................: 63765   529.021755/s
     success_rate...................: 100.00% ✓ 63765      ✗ 0    
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

     checks.........................: 100.00% ✓ 144057     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   479 kB/s
     http_req_blocked...............: avg=5.71µs   min=1.21µs  med=3.31µs   max=4.2ms    p(90)=4.73µs   p(95)=5.28µs   p(99.9)=251.52µs
     http_req_connecting............: avg=2.14µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=166.4µs 
     http_req_duration..............: avg=124.47ms min=5.51ms  med=124.29ms max=363.19ms p(90)=150.39ms p(95)=158.46ms p(99.9)=193.45ms
       { expected_response:true }...: avg=124.47ms min=5.51ms  med=124.29ms max=363.19ms p(90)=150.39ms p(95)=158.46ms p(99.9)=193.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48119
     http_req_receiving.............: avg=98.58µs  min=32.49µs med=82.31µs  max=128.97ms p(90)=113.67µs p(95)=125.54µs p(99.9)=759.74µs
     http_req_sending...............: avg=23.46µs  min=6.12µs  med=14.86µs  max=93.34ms  p(90)=20.41µs  p(95)=22.22µs  p(99.9)=580.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.35ms min=5.42ms  med=124.18ms max=362.6ms  p(90)=150.27ms p(95)=158.33ms p(99.9)=193.07ms
     http_reqs......................: 48119   398.688038/s
     iteration_duration.............: avg=124.98ms min=17.1ms  med=124.58ms max=387.72ms p(90)=150.64ms p(95)=158.72ms p(99.9)=196.26ms
     iterations.....................: 48019   397.859492/s
     success_rate...................: 100.00% ✓ 48019      ✗ 0    
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

     checks.........................: 100.00% ✓ 88812      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=8.66µs   min=1.35µs  med=3.49µs   max=6.11ms   p(90)=4.9µs    p(95)=5.51µs   p(99.9)=2.27ms  
     http_req_connecting............: avg=4.87µs   min=0s      med=0s       max=6.08ms   p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=201.84ms min=6.24ms  med=184.44ms max=653.24ms p(90)=236.71ms p(95)=415.48ms p(99.9)=540.25ms
       { expected_response:true }...: avg=201.84ms min=6.24ms  med=184.44ms max=653.24ms p(90)=236.71ms p(95)=415.48ms p(99.9)=540.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29704
     http_req_receiving.............: avg=100.34µs min=34.88µs med=94.69µs  max=22.34ms  p(90)=126.74µs p(95)=139.7µs  p(99.9)=654.66µs
     http_req_sending...............: avg=28.43µs  min=6.11µs  med=16.8µs   max=64.92ms  p(90)=21.87µs  p(95)=23.83µs  p(99.9)=645.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.71ms min=6.1ms   med=184.32ms max=653.14ms p(90)=236.6ms  p(95)=415.38ms p(99.9)=540.11ms
     http_reqs......................: 29704   245.679231/s
     iteration_duration.............: avg=202.8ms  min=40.95ms med=184.79ms max=653.47ms p(90)=237.16ms p(95)=416.21ms p(99.9)=540.52ms
     iterations.....................: 29604   244.852139/s
     success_rate...................: 100.00% ✓ 29604      ✗ 0    
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

     checks.........................: 100.00% ✓ 87537      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.01µs   min=1.29µs  med=3.25µs   max=4.25ms   p(90)=4.46µs   p(95)=4.97µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=204.78ms min=8.39ms  med=202.4ms  max=466.99ms p(90)=221.26ms p(95)=230.45ms p(99.9)=293.21ms
       { expected_response:true }...: avg=204.78ms min=8.39ms  med=202.4ms  max=466.99ms p(90)=221.26ms p(95)=230.45ms p(99.9)=293.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29279
     http_req_receiving.............: avg=92.4µs   min=35.65µs med=88.78µs  max=2.64ms   p(90)=119.35µs p(95)=130.87µs p(99.9)=555.55µs
     http_req_sending...............: avg=40.28µs  min=6.2µs   med=15.61µs  max=134.08ms p(90)=20.55µs  p(95)=22.33µs  p(99.9)=649.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.65ms min=8.32ms  med=202.27ms max=466.46ms p(90)=221.14ms p(95)=230.34ms p(99.9)=293.13ms
     http_reqs......................: 29279   241.802546/s
     iteration_duration.............: avg=205.75ms min=53.87ms med=203.61ms max=473.36ms p(90)=221.57ms p(95)=230.91ms p(99.9)=324.53ms
     iterations.....................: 29179   240.97669/s
     success_rate...................: 100.00% ✓ 29179      ✗ 0    
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

     checks.........................: 100.00% ✓ 845535      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 339 MB  2.8 MB/s
     http_req_blocked...............: avg=6.24µs  min=981ns  med=2.12µs  max=46.58ms  p(90)=3.53µs  p(95)=4.32µs   p(99.9)=37.99µs
     http_req_connecting............: avg=3.67µs  min=0s     med=0s      max=46.54ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.04ms min=1.85ms med=20.55ms max=283.27ms p(90)=29.21ms p(95)=32.36ms  p(99.9)=53.58ms
       { expected_response:true }...: avg=21.04ms min=1.85ms med=20.55ms max=283.27ms p(90)=29.21ms p(95)=32.36ms  p(99.9)=53.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 281945
     http_req_receiving.............: avg=113.5µs min=28.2µs med=53.46µs max=38.94ms  p(90)=100.3µs p(95)=245.71µs p(99.9)=9.73ms 
     http_req_sending...............: avg=52.76µs min=5.24µs med=9.48µs  max=94.21ms  p(90)=17.41µs p(95)=120.18µs p(99.9)=7.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.88ms min=1.76ms med=20.42ms max=239.61ms p(90)=29ms    p(95)=32.06ms  p(99.9)=52.74ms
     http_reqs......................: 281945  2345.028066/s
     iteration_duration.............: avg=21.27ms min=4.06ms med=20.77ms max=336.37ms p(90)=29.44ms p(95)=32.59ms  p(99.9)=54.13ms
     iterations.....................: 281845  2344.196333/s
     success_rate...................: 100.00% ✓ 281845      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 718053      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.41µs   min=1.02µs  med=2.41µs   max=6.33ms   p(90)=3.96µs  p(95)=4.7µs   p(99.9)=35.86µs 
     http_req_connecting............: avg=603ns    min=0s      med=0s       max=6.29ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=24.81ms  min=1.99ms  med=17.6ms   max=501.19ms p(90)=50.71ms p(95)=67.2ms  p(99.9)=189.98ms
       { expected_response:true }...: avg=24.81ms  min=1.99ms  med=17.6ms   max=501.19ms p(90)=50.71ms p(95)=67.2ms  p(99.9)=189.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239451
     http_req_receiving.............: avg=699.86µs min=50.57µs med=106.62µs max=283.41ms p(90)=1.17ms  p(95)=1.91ms  p(99.9)=56.32ms 
     http_req_sending...............: avg=48.4µs   min=5.37µs  med=10.07µs  max=191.8ms  p(90)=19.11µs p(95)=116.1µs p(99.9)=3.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.06ms  min=1.84ms  med=17.01ms  max=500.18ms p(90)=49.36ms p(95)=65.72ms p(99.9)=184.22ms
     http_reqs......................: 239451  1991.297221/s
     iteration_duration.............: avg=25.05ms  min=2.46ms  med=17.83ms  max=501.59ms p(90)=50.95ms p(95)=67.47ms p(99.9)=193.27ms
     iterations.....................: 239351  1990.465612/s
     success_rate...................: 100.00% ✓ 239351      ✗ 0     
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

     checks.........................: 100.00% ✓ 543900      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 218 MB  1.8 MB/s
     http_req_blocked...............: avg=3.68µs   min=962ns   med=2.34µs  max=12.22ms  p(90)=4.65µs   p(95)=5.85µs   p(99.9)=40.83µs
     http_req_connecting............: avg=623ns    min=0s      med=0s      max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.82ms  min=2.46ms  med=31.93ms max=344.55ms p(90)=43.68ms  p(95)=48.51ms  p(99.9)=90.77ms
       { expected_response:true }...: avg=32.82ms  min=2.46ms  med=31.93ms max=344.55ms p(90)=43.68ms  p(95)=48.51ms  p(99.9)=90.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181400
     http_req_receiving.............: avg=112.04µs min=30.49µs med=61.22µs max=35.13ms  p(90)=133.94µs p(95)=280.64µs p(99.9)=6.1ms  
     http_req_sending...............: avg=46.22µs  min=5.22µs  med=10.2µs  max=144.96ms p(90)=24.22µs  p(95)=135.22µs p(99.9)=3.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.66ms  min=2.32ms  med=31.79ms max=343.92ms p(90)=43.49ms  p(95)=48.27ms  p(99.9)=90.07ms
     http_reqs......................: 181400  1507.618404/s
     iteration_duration.............: avg=33.08ms  min=5.41ms  med=32.17ms max=363.63ms p(90)=43.91ms  p(95)=48.75ms  p(99.9)=91.37ms
     iterations.....................: 181300  1506.787302/s
     success_rate...................: 100.00% ✓ 181300      ✗ 0     
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

     checks.........................: 100.00% ✓ 433083      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=4.06µs  min=1.07µs  med=2.95µs  max=5.49ms   p(90)=4.59µs   p(95)=5.3µs    p(99.9)=38.05µs
     http_req_connecting............: avg=771ns   min=0s      med=0s      max=5.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.29ms min=2.32ms  med=40.68ms max=319.44ms p(90)=57.96ms  p(95)=63.27ms  p(99.9)=89.76ms
       { expected_response:true }...: avg=41.29ms min=2.32ms  med=40.68ms max=319.44ms p(90)=57.96ms  p(95)=63.27ms  p(99.9)=89.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144461
     http_req_receiving.............: avg=88.57µs min=30.22µs med=69.58µs max=25.79ms  p(90)=110.03µs p(95)=130.27µs p(99.9)=1.81ms 
     http_req_sending...............: avg=35.05µs min=5.44µs  med=12.43µs max=254.47ms p(90)=19.42µs  p(95)=23.46µs  p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.17ms min=2.2ms   med=40.57ms max=318.72ms p(90)=57.83ms  p(95)=63.13ms  p(99.9)=89.04ms
     http_reqs......................: 144461  1200.894756/s
     iteration_duration.............: avg=41.55ms min=3.72ms  med=40.9ms  max=347.51ms p(90)=58.19ms  p(95)=63.49ms  p(99.9)=90.31ms
     iterations.....................: 144361  1200.063462/s
     success_rate...................: 100.00% ✓ 144361      ✗ 0     
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

     checks.........................: 100.00% ✓ 183396     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 74 MB   610 kB/s
     http_req_blocked...............: avg=4.96µs  min=1.17µs  med=3.16µs  max=4.28ms   p(90)=4.67µs   p(95)=5.25µs   p(99.9)=48.92µs 
     http_req_connecting............: avg=1.63µs  min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.76ms min=4.3ms   med=94.73ms max=374.24ms p(90)=117.85ms p(95)=130.54ms p(99.9)=230.94ms
       { expected_response:true }...: avg=97.76ms min=4.3ms   med=94.73ms max=374.24ms p(90)=117.85ms p(95)=130.54ms p(99.9)=230.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61232
     http_req_receiving.............: avg=97.63µs min=32.4µs  med=82.11µs max=286.5ms  p(90)=115.74µs p(95)=128.96µs p(99.9)=833.97µs
     http_req_sending...............: avg=27.52µs min=5.53µs  med=14.17µs max=185.73ms p(90)=20.54µs  p(95)=22.71µs  p(99.9)=671.04µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.64ms min=4.18ms  med=94.62ms max=373.6ms  p(90)=117.7ms  p(95)=130.37ms p(99.9)=230.27ms
     http_reqs......................: 61232   507.79418/s
     iteration_duration.............: avg=98.16ms min=20.26ms med=94.97ms max=385.06ms p(90)=118.1ms  p(95)=130.83ms p(99.9)=235.16ms
     iterations.....................: 61132   506.964884/s
     success_rate...................: 100.00% ✓ 61132      ✗ 0    
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

     checks.........................: 100.00% ✓ 144225     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   479 kB/s
     http_req_blocked...............: avg=5.75µs   min=1.22µs  med=3.77µs   max=3.94ms   p(90)=5.29µs   p(95)=5.89µs   p(99.9)=159.84µs
     http_req_connecting............: avg=1.74µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=103.06µs
     http_req_duration..............: avg=124.32ms min=5.97ms  med=121.94ms max=366.38ms p(90)=164.63ms p(95)=177.21ms p(99.9)=229.87ms
       { expected_response:true }...: avg=124.32ms min=5.97ms  med=121.94ms max=366.38ms p(90)=164.63ms p(95)=177.21ms p(99.9)=229.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48175
     http_req_receiving.............: avg=98.35µs  min=33.57µs med=90.23µs  max=90.96ms  p(90)=121.66µs p(95)=134.4µs  p(99.9)=766.59µs
     http_req_sending...............: avg=30.51µs  min=6.14µs  med=17.52µs  max=113.53ms p(90)=22.86µs  p(95)=24.86µs  p(99.9)=932.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.19ms min=5.84ms  med=121.82ms max=363.5ms  p(90)=164.52ms p(95)=177.09ms p(99.9)=229.18ms
     http_reqs......................: 48175   398.910496/s
     iteration_duration.............: avg=124.84ms min=25.7ms  med=122.29ms max=374.85ms p(90)=164.93ms p(95)=177.51ms p(99.9)=231.2ms 
     iterations.....................: 48075   398.082452/s
     success_rate...................: 100.00% ✓ 48075      ✗ 0    
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

     checks.........................: 100.00% ✓ 86607      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=10.19µs  min=1.35µs  med=3.6µs    max=72.79ms  p(90)=5.02µs   p(95)=5.58µs   p(99.9)=2.13ms  
     http_req_connecting............: avg=3.76µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=1.95ms  
     http_req_duration..............: avg=206.98ms min=6.71ms  med=222.1ms  max=878.2ms  p(90)=320.42ms p(95)=393.34ms p(99.9)=621.89ms
       { expected_response:true }...: avg=206.98ms min=6.71ms  med=222.1ms  max=878.2ms  p(90)=320.42ms p(95)=393.34ms p(99.9)=621.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28969
     http_req_receiving.............: avg=102.25µs min=36.83µs med=98.28µs  max=7.52ms   p(90)=130.01µs p(95)=142.77µs p(99.9)=650.54µs
     http_req_sending...............: avg=28.51µs  min=5.81µs  med=17.65µs  max=85.56ms  p(90)=22.51µs  p(95)=24.27µs  p(99.9)=467.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.84ms min=6.54ms  med=221.97ms max=878.13ms p(90)=320.31ms p(95)=393.21ms p(99.9)=621.8ms 
     http_reqs......................: 28969   239.331074/s
     iteration_duration.............: avg=207.98ms min=57.7ms  med=223.8ms  max=878.36ms p(90)=321.17ms p(95)=394.12ms p(99.9)=622.2ms 
     iterations.....................: 28869   238.504912/s
     success_rate...................: 100.00% ✓ 28869      ✗ 0    
     vus............................: 18      min=18       max=50 
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

     checks.........................: 100.00% ✓ 85989      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.28µs   min=1.33µs  med=3.44µs   max=4.2ms    p(90)=4.71µs   p(95)=5.24µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=3.67µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=208.48ms min=8.58ms  med=202.24ms max=446.41ms p(90)=249.25ms p(95)=254.7ms  p(99.9)=321.4ms 
       { expected_response:true }...: avg=208.48ms min=8.58ms  med=202.24ms max=446.41ms p(90)=249.25ms p(95)=254.7ms  p(99.9)=321.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28763
     http_req_receiving.............: avg=100.71µs min=33.96µs med=95.14µs  max=35.16ms  p(90)=126.15µs p(95)=139.44µs p(99.9)=669µs   
     http_req_sending...............: avg=30.47µs  min=5.95µs  med=17.22µs  max=105.63ms p(90)=21.87µs  p(95)=23.58µs  p(99.9)=586.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.34ms min=8.44ms  med=202.12ms max=445.7ms  p(90)=249.12ms p(95)=254.53ms p(99.9)=321.15ms
     http_reqs......................: 28763   237.457208/s
     iteration_duration.............: avg=209.48ms min=45.12ms med=202.51ms max=455.65ms p(90)=249.53ms p(95)=255.07ms p(99.9)=326.03ms
     iterations.....................: 28663   236.631643/s
     success_rate...................: 100.00% ✓ 28663      ✗ 0    
     vus............................: 44      min=44       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

