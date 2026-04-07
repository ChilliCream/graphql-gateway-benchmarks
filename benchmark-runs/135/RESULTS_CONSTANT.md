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
| hive-router | v0.0.43 | 3,024 | 3,223 | 2,994 | 2.4% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,086 | 2,122 | 2,073 | 0.8% |  |
| grafbase | 0.53.2 | 2,041 | 2,113 | 2,023 | 1.5% |  |
| cosmo | 0.298.0 | 1,235 | 1,250 | 1,224 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 612 | 624 | 608 | 0.9% |  |
| apollo-router | v2.12.1 | 426 | 436 | 423 | 1.1% |  |
| hive-gateway | 2.5.14 | 267 | 273 | 263 | 1.2% |  |
| apollo-gateway | 2.13.3 | 244 | 246 | 242 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,395 | 2,531 | 2,362 | 2.3% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,922 | 1,960 | 1,917 | 0.8% |  |
| grafbase | 0.53.2 | 1,512 | 1,542 | 1,502 | 1.0% |  |
| cosmo | 0.298.0 | 1,209 | 1,232 | 1,204 | 0.9% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 576 | 595 | 567 | 1.7% |  |
| apollo-router | v2.12.1 | 397 | 407 | 394 | 1.1% |  |
| hive-gateway | 2.5.14 | 263 | 268 | 260 | 1.0% |  |
| apollo-gateway | 2.13.3 | 235 | 239 | 234 | 0.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1090179     ✗ 0     
     data_received..................: 32 GB   265 MB/s
     data_sent......................: 437 MB  3.6 MB/s
     http_req_blocked...............: avg=3.28µs   min=982ns   med=2.33µs  max=18.97ms  p(90)=3.55µs   p(95)=4.2µs    p(99.9)=35.53µs
     http_req_connecting............: avg=287ns    min=0s      med=0s      max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.27ms  min=1.57ms  med=15.31ms max=345.76ms p(90)=24.04ms  p(95)=27.93ms  p(99.9)=52.58ms
       { expected_response:true }...: avg=16.27ms  min=1.57ms  med=15.31ms max=345.76ms p(90)=24.04ms  p(95)=27.93ms  p(99.9)=52.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 363493
     http_req_receiving.............: avg=138.21µs min=27.63µs med=50.57µs max=127.92ms p(90)=102.17µs p(95)=284.74µs p(99.9)=11.12ms
     http_req_sending...............: avg=63.78µs  min=5.15µs  med=9.34µs  max=188.82ms p(90)=16.14µs  p(95)=125.32µs p(99.9)=14.74ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.07ms  min=1.48ms  med=15.16ms max=253.18ms p(90)=23.76ms  p(95)=27.53ms  p(99.9)=50.03ms
     http_reqs......................: 363493  3024.329511/s
     iteration_duration.............: avg=16.5ms   min=2.14ms  med=15.51ms max=365.19ms p(90)=24.27ms  p(95)=28.2ms   p(99.9)=53.92ms
     iterations.....................: 363393  3023.497492/s
     success_rate...................: 100.00% ✓ 363393      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 752637      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 302 MB  2.5 MB/s
     http_req_blocked...............: avg=3.34µs   min=1.04µs  med=2.37µs   max=14.62ms  p(90)=3.48µs   p(95)=4.05µs   p(99.9)=33.59µs 
     http_req_connecting............: avg=382ns    min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.67ms  min=2.45ms  med=15.03ms  max=341.49ms p(90)=53.33ms  p(95)=72.06ms  p(99.9)=168.2ms 
       { expected_response:true }...: avg=23.67ms  min=2.45ms  med=15.03ms  max=341.49ms p(90)=53.33ms  p(95)=72.06ms  p(99.9)=168.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 250979
     http_req_receiving.............: avg=668.79µs min=52.55µs med=108.83µs max=180.26ms p(90)=978.01µs p(95)=1.52ms   p(99.9)=59.62ms 
     http_req_sending...............: avg=42.08µs  min=5.44µs  med=9.51µs   max=73.13ms  p(90)=15.22µs  p(95)=100.15µs p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.96ms  min=2.34ms  med=14.5ms   max=287.22ms p(90)=51.99ms  p(95)=70.69ms  p(99.9)=165.1ms 
     http_reqs......................: 250979  2086.442196/s
     iteration_duration.............: avg=23.9ms   min=3.54ms  med=15.24ms  max=350.46ms p(90)=53.57ms  p(95)=72.29ms  p(99.9)=169.14ms
     iterations.....................: 250879  2085.610875/s
     success_rate...................: 100.00% ✓ 250879      ✗ 0     
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

     checks.........................: 100.00% ✓ 736119      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 295 MB  2.5 MB/s
     http_req_blocked...............: avg=3.41µs   min=961ns   med=2.37µs  max=14.58ms  p(90)=3.88µs   p(95)=4.64µs   p(99.9)=42.88µs
     http_req_connecting............: avg=414ns    min=0s      med=0s      max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.2ms   min=1.99ms  med=23.94ms max=289.46ms p(90)=29.01ms  p(95)=31.22ms  p(99.9)=53.6ms 
       { expected_response:true }...: avg=24.2ms   min=1.99ms  med=23.94ms max=289.46ms p(90)=29.01ms  p(95)=31.22ms  p(99.9)=53.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 245473
     http_req_receiving.............: avg=109.08µs min=29.69µs med=59.04µs max=32.69ms  p(90)=101.54µs p(95)=189.5µs  p(99.9)=8.32ms 
     http_req_sending...............: avg=44.18µs  min=4.76µs  med=10.15µs max=163.45ms p(90)=17.52µs  p(95)=113.48µs p(99.9)=2.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.05ms  min=1.87ms  med=23.82ms max=288.4ms  p(90)=28.85ms  p(95)=30.96ms  p(99.9)=52.63ms
     http_reqs......................: 245473  2041.252892/s
     iteration_duration.............: avg=24.44ms  min=3.58ms  med=24.15ms max=338.87ms p(90)=29.24ms  p(95)=31.46ms  p(99.9)=54.59ms
     iterations.....................: 245373  2040.421333/s
     success_rate...................: 100.00% ✓ 245373      ✗ 0     
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

     checks.........................: 100.00% ✓ 445392      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.58µs   min=1.1µs   med=2.37µs  max=6.77ms   p(90)=3.57µs  p(95)=4.13µs   p(99.9)=33.38µs
     http_req_connecting............: avg=908ns    min=0s      med=0s      max=6.73ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.17ms  min=2.09ms  med=39.63ms max=353.72ms p(90)=56.75ms p(95)=61.95ms  p(99.9)=85.45ms
       { expected_response:true }...: avg=40.17ms  min=2.09ms  med=39.63ms max=353.72ms p(90)=56.75ms p(95)=61.95ms  p(99.9)=85.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148564
     http_req_receiving.............: avg=111.58µs min=29.19µs med=59.53µs max=252.69ms p(90)=93.2µs  p(95)=109.72µs p(99.9)=1.99ms 
     http_req_sending...............: avg=26.02µs  min=5.31µs  med=10.43µs max=214.82ms p(90)=15.52µs p(95)=19.52µs  p(99.9)=1.37ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.03ms  min=1.99ms  med=39.53ms max=101.12ms p(90)=56.63ms p(95)=61.84ms  p(99.9)=84.92ms
     http_reqs......................: 148564  1235.194007/s
     iteration_duration.............: avg=40.4ms   min=3.49ms  med=39.83ms max=368.34ms p(90)=56.95ms p(95)=62.15ms  p(99.9)=85.84ms
     iterations.....................: 148464  1234.362585/s
     success_rate...................: 100.00% ✓ 148464      ✗ 0     
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

     checks.........................: 100.00% ✓ 221142     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   736 kB/s
     http_req_blocked...............: avg=4.63µs   min=1.16µs  med=2.98µs  max=4.13ms   p(90)=4.5µs    p(95)=5.12µs   p(99.9)=49.41µs 
     http_req_connecting............: avg=1.37µs   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.07ms  min=3.76ms  med=78.12ms max=358.47ms p(90)=102.15ms p(95)=113.34ms p(99.9)=206.02ms
       { expected_response:true }...: avg=81.07ms  min=3.76ms  med=78.12ms max=358.47ms p(90)=102.15ms p(95)=113.34ms p(99.9)=206.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73814
     http_req_receiving.............: avg=159.19µs min=30.67µs med=76.66µs max=254.88ms p(90)=110.75µs p(95)=124.05µs p(99.9)=1.55ms  
     http_req_sending...............: avg=25.14µs  min=5.67µs  med=13.23µs max=250.01ms p(90)=20.09µs  p(95)=22.36µs  p(99.9)=824.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.89ms  min=3.64ms  med=78ms    max=252.92ms p(90)=102.02ms p(95)=112.96ms p(99.9)=202.98ms
     http_reqs......................: 73814   612.379669/s
     iteration_duration.............: avg=81.41ms  min=6.61ms  med=78.35ms max=385.92ms p(90)=102.38ms p(95)=113.63ms p(99.9)=207.05ms
     iterations.....................: 73714   611.550044/s
     success_rate...................: 100.00% ✓ 73714      ✗ 0    
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

     checks.........................: 100.00% ✓ 154212     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   512 kB/s
     http_req_blocked...............: avg=5.85µs   min=1.19µs  med=3.38µs   max=10.19ms  p(90)=4.78µs   p(95)=5.34µs   p(99.9)=176.73µs
     http_req_connecting............: avg=2.06µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.27ms min=5.53ms  med=116.18ms max=362.8ms  p(90)=140.52ms p(95)=147.5ms  p(99.9)=182.19ms
       { expected_response:true }...: avg=116.27ms min=5.53ms  med=116.18ms max=362.8ms  p(90)=140.52ms p(95)=147.5ms  p(99.9)=182.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51504
     http_req_receiving.............: avg=94.14µs  min=32.32µs med=83.75µs  max=86.09ms  p(90)=115.23µs p(95)=127.11µs p(99.9)=903.71µs
     http_req_sending...............: avg=26.82µs  min=5.96µs  med=15.85µs  max=141.46ms p(90)=21.3µs   p(95)=23.04µs  p(99.9)=645.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.15ms min=5.46ms  med=116.07ms max=353.71ms p(90)=140.4ms  p(95)=147.39ms p(99.9)=182.08ms
     http_reqs......................: 51504   426.670166/s
     iteration_duration.............: avg=116.75ms min=25.29ms med=116.46ms max=382.62ms p(90)=140.79ms p(95)=147.79ms p(99.9)=183.75ms
     iterations.....................: 51404   425.841744/s
     success_rate...................: 100.00% ✓ 51404      ✗ 0    
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

     checks.........................: 100.00% ✓ 96696      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=7µs      min=1.13µs  med=3.59µs   max=4.18ms   p(90)=5.06µs   p(95)=5.7µs    p(99.9)=1.55ms  
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=185.5ms  min=5.72ms  med=167.93ms max=631.27ms p(90)=222.54ms p(95)=390.42ms p(99.9)=530.78ms
       { expected_response:true }...: avg=185.5ms  min=5.72ms  med=167.93ms max=631.27ms p(90)=222.54ms p(95)=390.42ms p(99.9)=530.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32332
     http_req_receiving.............: avg=109.21µs min=33.89µs med=97.18µs  max=103.29ms p(90)=130.13µs p(95)=144.24µs p(99.9)=743.2µs 
     http_req_sending...............: avg=25.55µs  min=6.03µs  med=17.93µs  max=70.34ms  p(90)=23.23µs  p(95)=25.09µs  p(99.9)=556.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.37ms min=5.62ms  med=167.81ms max=631.08ms p(90)=222.4ms  p(95)=390.31ms p(99.9)=530.64ms
     http_reqs......................: 32332   267.319652/s
     iteration_duration.............: avg=186.35ms min=52.95ms med=168.29ms max=631.54ms p(90)=222.91ms p(95)=391.28ms p(99.9)=531.08ms
     iterations.....................: 32232   266.492856/s
     success_rate...................: 100.00% ✓ 32232      ✗ 0    
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

     checks.........................: 100.00% ✓ 88599      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=6.64µs   min=1.21µs  med=3.15µs   max=3.88ms   p(90)=4.35µs   p(95)=4.87µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.36µs   min=0s      med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=202.34ms min=8.49ms  med=196.3ms  max=446.07ms p(90)=222.52ms p(95)=230.32ms p(99.9)=294.67ms
       { expected_response:true }...: avg=202.34ms min=8.49ms  med=196.3ms  max=446.07ms p(90)=222.52ms p(95)=230.32ms p(99.9)=294.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29633
     http_req_receiving.............: avg=93.93µs  min=31.15µs med=84.75µs  max=111.49ms p(90)=116.54µs p(95)=127.85µs p(99.9)=528.83µs
     http_req_sending...............: avg=22.48µs  min=5.98µs  med=15.1µs   max=54.93ms  p(90)=20.45µs  p(95)=22.21µs  p(99.9)=481.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.22ms min=8.36ms  med=196.2ms  max=410.5ms  p(90)=222.4ms  p(95)=230.21ms p(99.9)=294.57ms
     http_reqs......................: 29633   244.702555/s
     iteration_duration.............: avg=203.28ms min=42.13ms med=196.57ms max=454.27ms p(90)=222.81ms p(95)=230.57ms p(99.9)=298.63ms
     iterations.....................: 29533   243.876778/s
     success_rate...................: 100.00% ✓ 29533      ✗ 0    
     vus............................: 40      min=40       max=50 
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

     checks.........................: 100.00% ✓ 863970      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.36µs   min=1µs     med=2.58µs  max=11.89ms  p(90)=4.1µs    p(95)=4.86µs   p(99.9)=37.87µs
     http_req_connecting............: avg=227ns    min=0s      med=0s      max=2.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.58ms  min=1.83ms  med=20.07ms max=316.84ms p(90)=28.54ms  p(95)=31.78ms  p(99.9)=54.49ms
       { expected_response:true }...: avg=20.58ms  min=1.83ms  med=20.07ms max=316.84ms p(90)=28.54ms  p(95)=31.78ms  p(99.9)=54.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288090
     http_req_receiving.............: avg=120.14µs min=28.62µs med=55.63µs max=148.74ms p(90)=107.17µs p(95)=269.89µs p(99.9)=9.06ms 
     http_req_sending...............: avg=55µs     min=5.18µs  med=10.16µs max=127.8ms  p(90)=18.48µs  p(95)=127.93µs p(99.9)=6.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.41ms  min=1.77ms  med=19.92ms max=303.63ms p(90)=28.32ms  p(95)=31.45ms  p(99.9)=53.58ms
     http_reqs......................: 288090  2395.870821/s
     iteration_duration.............: avg=20.82ms  min=3.1ms   med=20.29ms max=343.81ms p(90)=28.77ms  p(95)=32.03ms  p(99.9)=54.96ms
     iterations.....................: 287990  2395.039182/s
     success_rate...................: 100.00% ✓ 287990      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 693075      ✗ 0     
     data_received..................: 20 GB   169 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=3.25µs  min=1µs     med=2.32µs   max=11.52ms  p(90)=3.87µs  p(95)=4.6µs    p(99.9)=36.86µs 
     http_req_connecting............: avg=452ns   min=0s      med=0s       max=3.78ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.72ms min=1.92ms  med=17.69ms  max=594.92ms p(90)=54.4ms  p(95)=71.49ms  p(99.9)=189.92ms
       { expected_response:true }...: avg=25.72ms min=1.92ms  med=17.69ms  max=594.92ms p(90)=54.4ms  p(95)=71.49ms  p(99.9)=189.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231125
     http_req_receiving.............: avg=682.7µs min=50.33µs med=109.21µs max=169.76ms p(90)=1.15ms  p(95)=1.83ms   p(99.9)=55.2ms  
     http_req_sending...............: avg=43.06µs min=5.35µs  med=9.85µs   max=173.44ms p(90)=18.44µs p(95)=106.62µs p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.99ms min=1.8ms   med=17.12ms  max=594.82ms p(90)=53.18ms p(95)=70.04ms  p(99.9)=188.09ms
     http_reqs......................: 231125  1922.2086/s
     iteration_duration.............: avg=25.96ms min=2.45ms  med=17.91ms  max=595.06ms p(90)=54.63ms p(95)=71.75ms  p(99.9)=193.01ms
     iterations.....................: 231025  1921.376925/s
     success_rate...................: 100.00% ✓ 231025      ✗ 0     
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

     checks.........................: 100.00% ✓ 545424      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.71µs   min=982ns   med=2.58µs  max=4.32ms   p(90)=4.83µs   p(95)=5.98µs   p(99.9)=44.14µs
     http_req_connecting............: avg=536ns    min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.72ms  min=2.34ms  med=31.81ms max=338.32ms p(90)=43.45ms  p(95)=48.33ms  p(99.9)=84.06ms
       { expected_response:true }...: avg=32.72ms  min=2.34ms  med=31.81ms max=338.32ms p(90)=43.45ms  p(95)=48.33ms  p(99.9)=84.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181908
     http_req_receiving.............: avg=118.13µs min=30.29µs med=62.96µs max=151.07ms p(90)=136.64µs p(95)=283.11µs p(99.9)=5.24ms 
     http_req_sending...............: avg=46.7µs   min=5.41µs  med=10.74µs max=134.75ms p(90)=24.19µs  p(95)=135.71µs p(99.9)=3.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.56ms  min=2.26ms  med=31.68ms max=278.28ms p(90)=43.27ms  p(95)=48.11ms  p(99.9)=82.97ms
     http_reqs......................: 181908  1512.026384/s
     iteration_duration.............: avg=32.99ms  min=5.58ms  med=32.06ms max=356.59ms p(90)=43.7ms   p(95)=48.58ms  p(99.9)=84.99ms
     iterations.....................: 181808  1511.19518/s
     success_rate...................: 100.00% ✓ 181808      ✗ 0     
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

     checks.........................: 100.00% ✓ 436074      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=5.47µs  min=1.12µs  med=2.75µs  max=250.07ms p(90)=4.38µs   p(95)=5.09µs   p(99.9)=41µs   
     http_req_connecting............: avg=2.36µs  min=0s      med=0s      max=250.02ms p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.01ms min=2.27ms  med=40.45ms max=325.2ms  p(90)=57.66ms  p(95)=62.91ms  p(99.9)=88.36ms
       { expected_response:true }...: avg=41.01ms min=2.27ms  med=40.45ms max=325.2ms  p(90)=57.66ms  p(95)=62.91ms  p(99.9)=88.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145458
     http_req_receiving.............: avg=88.71µs min=30.06µs med=68.48µs max=118.66ms p(90)=108.52µs p(95)=128.51µs p(99.9)=1.82ms 
     http_req_sending...............: avg=29.43µs min=5.36µs  med=12.19µs max=169.04ms p(90)=19.13µs  p(95)=22.98µs  p(99.9)=1.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.89ms min=2.15ms  med=40.34ms max=268.83ms p(90)=57.53ms  p(95)=62.77ms  p(99.9)=88.12ms
     http_reqs......................: 145458  1209.20439/s
     iteration_duration.............: avg=41.26ms min=4.58ms  med=40.68ms max=335.5ms  p(90)=57.88ms  p(95)=63.12ms  p(99.9)=89.43ms
     iterations.....................: 145358  1208.373082/s
     success_rate...................: 100.00% ✓ 145358      ✗ 0     
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

     checks.........................: 100.00% ✓ 208218     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   693 kB/s
     http_req_blocked...............: avg=4.61µs  min=1.16µs  med=3.06µs  max=4.28ms   p(90)=4.6µs    p(95)=5.18µs   p(99.9)=50.56µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.09ms min=4.05ms  med=96.49ms max=374.3ms  p(90)=140.69ms p(95)=152.11ms p(99.9)=252.35ms
       { expected_response:true }...: avg=86.09ms min=4.05ms  med=96.49ms max=374.3ms  p(90)=140.69ms p(95)=152.11ms p(99.9)=252.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69506
     http_req_receiving.............: avg=92.17µs min=30.92µs med=80.43µs max=97.48ms  p(90)=114.76µs p(95)=127.89µs p(99.9)=1.02ms  
     http_req_sending...............: avg=24.65µs min=5.47µs  med=13.86µs max=126.86ms p(90)=20.51µs  p(95)=22.71µs  p(99.9)=865.98µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.98ms min=3.92ms  med=96.36ms max=340.44ms p(90)=140.59ms p(95)=151.99ms p(99.9)=251.37ms
     http_reqs......................: 69506   576.63112/s
     iteration_duration.............: avg=86.45ms min=15.49ms med=97.2ms  max=374.63ms p(90)=140.93ms p(95)=152.38ms p(99.9)=254.68ms
     iterations.....................: 69406   575.801506/s
     success_rate...................: 100.00% ✓ 69406      ✗ 0    
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

     checks.........................: 100.00% ✓ 143718     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   477 kB/s
     http_req_blocked...............: avg=6.13µs   min=1.16µs  med=3.62µs   max=4.37ms   p(90)=5.12µs   p(95)=5.7µs    p(99.9)=820.82µs
     http_req_connecting............: avg=2.3µs    min=0s      med=0s       max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=796.9µs 
     http_req_duration..............: avg=124.73ms min=6.05ms  med=122.19ms max=378.05ms p(90)=165.39ms p(95)=177.71ms p(99.9)=227.46ms
       { expected_response:true }...: avg=124.73ms min=6.05ms  med=122.19ms max=378.05ms p(90)=165.39ms p(95)=177.71ms p(99.9)=227.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48006
     http_req_receiving.............: avg=93.9µs   min=32.3µs  med=88.46µs  max=17.02ms  p(90)=119.82µs p(95)=132.13µs p(99.9)=712.56µs
     http_req_sending...............: avg=36.36µs  min=6.17µs  med=17.56µs  max=150.75ms p(90)=22.8µs   p(95)=24.67µs  p(99.9)=585.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.6ms  min=5.9ms   med=122.06ms max=365.41ms p(90)=165.25ms p(95)=177.56ms p(99.9)=226.78ms
     http_reqs......................: 48006   397.570593/s
     iteration_duration.............: avg=125.27ms min=12.11ms med=122.51ms max=393.03ms p(90)=165.73ms p(95)=178.03ms p(99.9)=229.89ms
     iterations.....................: 47906   396.742425/s
     success_rate...................: 100.00% ✓ 47906      ✗ 0    
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

     checks.........................: 100.00% ✓ 95397      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=4.82µs   min=1.29µs  med=3.46µs   max=2.34ms   p(90)=4.81µs   p(95)=5.37µs   p(99.9)=481.62µs
     http_req_connecting............: avg=1.2µs    min=0s      med=0s       max=2.3ms    p(90)=0s       p(95)=0s       p(99.9)=455.06µs
     http_req_duration..............: avg=187.92ms min=5.88ms  med=171.46ms max=634.88ms p(90)=216.78ms p(95)=391.83ms p(99.9)=530.87ms
       { expected_response:true }...: avg=187.92ms min=5.88ms  med=171.46ms max=634.88ms p(90)=216.78ms p(95)=391.83ms p(99.9)=530.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31899
     http_req_receiving.............: avg=97.14µs  min=34.4µs  med=92.49µs  max=20.74ms  p(90)=123.65µs p(95)=136.48µs p(99.9)=577.88µs
     http_req_sending...............: avg=23.49µs  min=6.23µs  med=16.71µs  max=46.87ms  p(90)=21.75µs  p(95)=23.4µs   p(99.9)=630.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.8ms  min=5.74ms  med=171.34ms max=634.74ms p(90)=216.68ms p(95)=391.71ms p(99.9)=530.76ms
     http_reqs......................: 31899   263.965957/s
     iteration_duration.............: avg=188.78ms min=47.93ms med=171.8ms  max=635.23ms p(90)=217.21ms p(95)=393.39ms p(99.9)=531.21ms
     iterations.....................: 31799   263.138451/s
     success_rate...................: 100.00% ✓ 31799      ✗ 0    
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

     checks.........................: 100.00% ✓ 85362      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=6.02µs   min=1.34µs  med=3.55µs   max=3.4ms    p(90)=4.85µs   p(95)=5.38µs   p(99.9)=697.39µs
     http_req_connecting............: avg=2.21µs   min=0s      med=0s       max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=608.62µs
     http_req_duration..............: avg=210.03ms min=8.86ms  med=209.68ms max=354.1ms  p(90)=218.11ms p(95)=223.34ms p(99.9)=292.33ms
       { expected_response:true }...: avg=210.03ms min=8.86ms  med=209.68ms max=354.1ms  p(90)=218.11ms p(95)=223.34ms p(99.9)=292.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28554
     http_req_receiving.............: avg=100.24µs min=34.62µs med=93.34µs  max=22.48ms  p(90)=124.6µs  p(95)=137.36µs p(99.9)=774.11µs
     http_req_sending...............: avg=24.94µs  min=6.25µs  med=17.33µs  max=33.19ms  p(90)=21.97µs  p(95)=23.7µs   p(99.9)=693.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.91ms min=8.72ms  med=209.55ms max=353.9ms  p(90)=217.97ms p(95)=223.21ms p(99.9)=292.22ms
     http_reqs......................: 28554   235.717624/s
     iteration_duration.............: avg=211.02ms min=43.14ms med=209.98ms max=361.17ms p(90)=218.39ms p(95)=223.61ms p(99.9)=293.02ms
     iterations.....................: 28454   234.892109/s
     success_rate...................: 100.00% ✓ 28454      ✗ 0    
     vus............................: 48      min=48       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

