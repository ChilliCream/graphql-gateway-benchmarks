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
| hive-router | v0.0.49 | 2,936 | 3,138 | 2,861 | 3.0% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,101 | 2,169 | 2,085 | 1.3% |  |
| grafbase | 0.53.3 | 2,064 | 2,125 | 2,021 | 1.7% |  |
| cosmo | 0.307.0 | 1,271 | 1,290 | 1,267 | 0.7% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 539 | 555 | 537 | 1.2% |  |
| apollo-router | v2.13.1 | 397 | 410 | 390 | 1.7% |  |
| apollo-gateway | 2.13.3 | 243 | 247 | 241 | 0.9% |  |
| hive-gateway | 2.5.25 | 239 | 244 | 237 | 1.1% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,396 | 2,536 | 2,336 | 2.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,955 | 2,011 | 1,947 | 1.1% |  |
| grafbase | 0.53.3 | 1,520 | 1,554 | 1,502 | 1.1% |  |
| cosmo | 0.307.0 | 1,181 | 1,204 | 1,168 | 1.1% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 515 | 527 | 509 | 1.3% |  |
| apollo-router | v2.13.1 | 370 | 383 | 364 | 1.8% |  |
| apollo-gateway | 2.13.3 | 243 | 245 | 241 | 0.7% |  |
| hive-gateway | 2.5.25 | 230 | 236 | 228 | 1.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1058706     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 424 MB  3.5 MB/s
     http_req_blocked...............: avg=3.18µs  min=992ns   med=2.28µs  max=24.92ms  p(90)=3.51µs  p(95)=4.14µs   p(99.9)=33.73µs
     http_req_connecting............: avg=288ns   min=0s      med=0s      max=4.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.76ms min=1.61ms  med=15.72ms max=325.36ms p(90)=25.05ms p(95)=29.12ms  p(99.9)=51.99ms
       { expected_response:true }...: avg=16.76ms min=1.61ms  med=15.72ms max=325.36ms p(90)=25.05ms p(95)=29.12ms  p(99.9)=51.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 353002
     http_req_receiving.............: avg=136.4µs min=27.66µs med=49.45µs max=33.6ms   p(90)=99.53µs p(95)=284.8µs  p(99.9)=13.58ms
     http_req_sending...............: avg=62.46µs min=5.15µs  med=9.24µs  max=121.82ms p(90)=15.85µs p(95)=122.51µs p(99.9)=15.2ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.56ms min=1.54ms  med=15.57ms max=324.77ms p(90)=24.74ms p(95)=28.69ms  p(99.9)=50.67ms
     http_reqs......................: 353002  2936.603477/s
     iteration_duration.............: avg=16.99ms min=2.04ms  med=15.93ms max=338.28ms p(90)=25.27ms p(95)=29.39ms  p(99.9)=53.08ms
     iterations.....................: 352902  2935.771583/s
     success_rate...................: 100.00% ✓ 352902      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 758145      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 304 MB  2.5 MB/s
     http_req_blocked...............: avg=2.98µs   min=992ns   med=2.35µs   max=11.77ms  p(90)=3.51µs   p(95)=4.1µs    p(99.9)=35.55µs 
     http_req_connecting............: avg=176ns    min=0s      med=0s       max=2.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.5ms   min=2.41ms  med=14.84ms  max=409.47ms p(90)=52.86ms  p(95)=71.9ms   p(99.9)=168.4ms 
       { expected_response:true }...: avg=23.5ms   min=2.41ms  med=14.84ms  max=409.47ms p(90)=52.86ms  p(95)=71.9ms   p(99.9)=168.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 252815
     http_req_receiving.............: avg=681.38µs min=52.78µs med=110.53µs max=348.04ms p(90)=960.88µs p(95)=1.49ms   p(99.9)=64.08ms 
     http_req_sending...............: avg=46.66µs  min=5.09µs  med=9.65µs   max=122.46ms p(90)=15.84µs  p(95)=107.06µs p(99.9)=4.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.77ms  min=2.31ms  med=14.31ms  max=377.03ms p(90)=51.42ms  p(95)=70.4ms   p(99.9)=165.48ms
     http_reqs......................: 252815  2101.447723/s
     iteration_duration.............: avg=23.73ms  min=3.57ms  med=15.05ms  max=409.67ms p(90)=53.1ms   p(95)=72.15ms  p(99.9)=169.88ms
     iterations.....................: 252715  2100.616503/s
     success_rate...................: 100.00% ✓ 252715      ✗ 0     
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

     checks.........................: 100.00% ✓ 744564      ✗ 0     
     data_received..................: 22 GB   181 MB/s
     data_sent......................: 298 MB  2.5 MB/s
     http_req_blocked...............: avg=3.62µs   min=1.06µs  med=2.65µs  max=13.32ms  p(90)=4.27µs  p(95)=5.12µs   p(99.9)=46.78µs
     http_req_connecting............: avg=246ns    min=0s      med=0s      max=2.95ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.92ms  min=1.99ms  med=23.65ms max=314.12ms p(90)=28.86ms p(95)=31.31ms  p(99.9)=54.95ms
       { expected_response:true }...: avg=23.92ms  min=1.99ms  med=23.65ms max=314.12ms p(90)=28.86ms p(95)=31.31ms  p(99.9)=54.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 248288
     http_req_receiving.............: avg=118.25µs min=28.91µs med=59.87µs max=134.78ms p(90)=107.2µs p(95)=227.3µs  p(99.9)=9.88ms 
     http_req_sending...............: avg=51.92µs  min=5.18µs  med=11.03µs max=272.32ms p(90)=19.2µs  p(95)=123.66µs p(99.9)=4.14ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.75ms  min=1.86ms  med=23.53ms max=313.05ms p(90)=28.66ms p(95)=31.02ms  p(99.9)=53.77ms
     http_reqs......................: 248288  2064.65504/s
     iteration_duration.............: avg=24.16ms  min=4.17ms  med=23.86ms max=325.17ms p(90)=29.09ms p(95)=31.57ms  p(99.9)=55.45ms
     iterations.....................: 248188  2063.823484/s
     success_rate...................: 100.00% ✓ 248188      ✗ 0     
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

     checks.........................: 100.00% ✓ 458421      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.57µs  min=1.1µs   med=2.51µs  max=4.12ms   p(90)=3.88µs  p(95)=4.52µs   p(99.9)=38.5µs 
     http_req_connecting............: avg=723ns   min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.02ms min=2.21ms  med=38.46ms max=328.04ms p(90)=54.95ms p(95)=59.99ms  p(99.9)=86.08ms
       { expected_response:true }...: avg=39.02ms min=2.21ms  med=38.46ms max=328.04ms p(90)=54.95ms p(95)=59.99ms  p(99.9)=86.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152907
     http_req_receiving.............: avg=86.24µs min=28.37µs med=62.29µs max=91.73ms  p(90)=98.99µs p(95)=117.87µs p(99.9)=2.25ms 
     http_req_sending...............: avg=26.82µs min=5.23µs  med=10.86µs max=69.06ms  p(90)=16.72µs p(95)=20.8µs   p(99.9)=1.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.91ms min=2.08ms  med=38.35ms max=290.88ms p(90)=54.83ms p(95)=59.85ms  p(99.9)=85.66ms
     http_reqs......................: 152907  1271.225056/s
     iteration_duration.............: avg=39.25ms min=4.11ms  med=38.67ms max=339.93ms p(90)=55.16ms p(95)=60.19ms  p(99.9)=86.55ms
     iterations.....................: 152807  1270.393684/s
     success_rate...................: 100.00% ✓ 152807      ✗ 0     
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

     checks.........................: 100.00% ✓ 194847     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   648 kB/s
     http_req_blocked...............: avg=4.27µs   min=1.12µs  med=2.86µs  max=3.42ms   p(90)=4.37µs   p(95)=5µs      p(99.9)=51.25µs 
     http_req_connecting............: avg=1.1µs    min=0s      med=0s      max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92ms     min=4.17ms  med=89.26ms max=336.38ms p(90)=113.26ms p(95)=126.49ms p(99.9)=218.65ms
       { expected_response:true }...: avg=92ms     min=4.17ms  med=89.26ms max=336.38ms p(90)=113.26ms p(95)=126.49ms p(99.9)=218.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65049
     http_req_receiving.............: avg=154.99µs min=30.74µs med=76.32µs max=231.02ms p(90)=110.28µs p(95)=123.28µs p(99.9)=1.36ms  
     http_req_sending...............: avg=27.69µs  min=5.65µs  med=13.16µs max=251.87ms p(90)=19.61µs  p(95)=21.91µs  p(99.9)=734.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.82ms  min=4.07ms  med=89.17ms max=245.46ms p(90)=113.07ms p(95)=126.1ms  p(99.9)=216.63ms
     http_reqs......................: 65049   539.675308/s
     iteration_duration.............: avg=92.38ms  min=20.62ms med=89.51ms max=350.39ms p(90)=113.5ms  p(95)=126.76ms p(99.9)=221.54ms
     iterations.....................: 64949   538.845664/s
     success_rate...................: 100.00% ✓ 64949      ✗ 0    
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

     checks.........................: 100.00% ✓ 143460     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   477 kB/s
     http_req_blocked...............: avg=5.75µs   min=1.16µs  med=3.19µs   max=4.19ms   p(90)=4.57µs   p(95)=5.11µs   p(99.9)=468.24µs
     http_req_connecting............: avg=2.34µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=304.84µs
     http_req_duration..............: avg=124.98ms min=5.4ms   med=124.68ms max=289.63ms p(90)=151.35ms p(95)=159.33ms p(99.9)=196.65ms
       { expected_response:true }...: avg=124.98ms min=5.4ms   med=124.68ms max=289.63ms p(90)=151.35ms p(95)=159.33ms p(99.9)=196.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47920
     http_req_receiving.............: avg=87.67µs  min=30.01µs med=82.19µs  max=22.99ms  p(90)=113.19µs p(95)=125.17µs p(99.9)=750.77µs
     http_req_sending...............: avg=27.8µs   min=5.64µs  med=14.82µs  max=103.15ms p(90)=20.38µs  p(95)=22.14µs  p(99.9)=576.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.87ms min=5.34ms  med=124.57ms max=289.07ms p(90)=151.24ms p(95)=159.21ms p(99.9)=196.56ms
     http_reqs......................: 47920   397.052586/s
     iteration_duration.............: avg=125.5ms  min=22.12ms med=124.96ms max=365.08ms p(90)=151.61ms p(95)=159.58ms p(99.9)=201.96ms
     iterations.....................: 47820   396.224012/s
     success_rate...................: 100.00% ✓ 47820      ✗ 0    
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

     checks.........................: 100.00% ✓ 88125      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.13µs  med=3.31µs   max=4.16ms   p(90)=4.6µs    p(95)=5.11µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=203.45ms min=8.39ms  med=201.25ms max=388.95ms p(90)=214.61ms p(95)=222.39ms p(99.9)=287.34ms
       { expected_response:true }...: avg=203.45ms min=8.39ms  med=201.25ms max=388.95ms p(90)=214.61ms p(95)=222.39ms p(99.9)=287.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29475
     http_req_receiving.............: avg=98.47µs  min=35.22µs med=91.61µs  max=20.52ms  p(90)=123µs    p(95)=135.48µs p(99.9)=851.82µs
     http_req_sending...............: avg=20.69µs  min=5.89µs  med=16.35µs  max=13.89ms  p(90)=21.01µs  p(95)=22.77µs  p(99.9)=600.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.33ms min=8.28ms  med=201.13ms max=388.78ms p(90)=214.5ms  p(95)=222.27ms p(99.9)=287.07ms
     http_reqs......................: 29475   243.486393/s
     iteration_duration.............: avg=204.37ms min=27.87ms med=201.55ms max=394.67ms p(90)=214.87ms p(95)=222.67ms p(99.9)=288.6ms 
     iterations.....................: 29375   242.660316/s
     success_rate...................: 100.00% ✓ 29375      ✗ 0    
     vus............................: 32      min=32       max=50 
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

     checks.........................: 100.00% ✓ 86661      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=5.15µs   min=1.27µs  med=3.46µs   max=1.83ms   p(90)=4.92µs   p(95)=5.53µs   p(99.9)=700.16µs
     http_req_connecting............: avg=1.47µs   min=0s      med=0s       max=1.79ms   p(90)=0s       p(95)=0s       p(99.9)=675.96µs
     http_req_duration..............: avg=206.84ms min=6.35ms  med=186.6ms  max=744.63ms p(90)=243.17ms p(95)=464.03ms p(99.9)=603.46ms
       { expected_response:true }...: avg=206.84ms min=6.35ms  med=186.6ms  max=744.63ms p(90)=243.17ms p(95)=464.03ms p(99.9)=603.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28987
     http_req_receiving.............: avg=102.04µs min=37.84µs med=96.76µs  max=31.05ms  p(90)=128.7µs  p(95)=141.52µs p(99.9)=458.9µs 
     http_req_sending...............: avg=26.95µs  min=6.46µs  med=17.82µs  max=58.21ms  p(90)=22.79µs  p(95)=24.6µs   p(99.9)=485.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.71ms min=6.21ms  med=186.46ms max=744.49ms p(90)=243.06ms p(95)=463.92ms p(99.9)=603.32ms
     http_reqs......................: 28987   239.741646/s
     iteration_duration.............: avg=207.82ms min=39.03ms med=186.95ms max=744.87ms p(90)=243.77ms p(95)=465.26ms p(99.9)=603.7ms 
     iterations.....................: 28887   238.91458/s
     success_rate...................: 100.00% ✓ 28887      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 864147      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.1µs    min=972ns   med=2.18µs  max=12.48ms  p(90)=3.63µs   p(95)=4.43µs   p(99.9)=30.66µs
     http_req_connecting............: avg=328ns    min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.59ms  min=1.85ms  med=20.14ms max=364.26ms p(90)=28.45ms  p(95)=31.49ms  p(99.9)=52.54ms
       { expected_response:true }...: avg=20.59ms  min=1.85ms  med=20.14ms max=364.26ms p(90)=28.45ms  p(95)=31.49ms  p(99.9)=52.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288149
     http_req_receiving.............: avg=118.24µs min=28.37µs med=53.61µs max=241.81ms p(90)=100.84µs p(95)=253.98µs p(99.9)=8.7ms  
     http_req_sending...............: avg=53.24µs  min=5.27µs  med=9.64µs  max=34.08ms  p(90)=17.74µs  p(95)=122.12µs p(99.9)=6.11ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.42ms  min=1.74ms  med=20.01ms max=177.21ms p(90)=28.26ms  p(95)=31.22ms  p(99.9)=51.72ms
     http_reqs......................: 288149  2396.356563/s
     iteration_duration.............: avg=20.81ms  min=3.3ms   med=20.35ms max=391.67ms p(90)=28.68ms  p(95)=31.73ms  p(99.9)=53.08ms
     iterations.....................: 288049  2395.524925/s
     success_rate...................: 100.00% ✓ 288049      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 705159      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 283 MB  2.3 MB/s
     http_req_blocked...............: avg=6.67µs   min=1.04µs  med=2.6µs    max=30.08ms  p(90)=4.01µs  p(95)=4.74µs   p(99.9)=39.57µs 
     http_req_connecting............: avg=3.61µs   min=0s      med=0s       max=30.04ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.27ms  min=1.97ms  med=17.05ms  max=895.74ms p(90)=54.31ms p(95)=72.75ms  p(99.9)=181.99ms
       { expected_response:true }...: avg=25.27ms  min=1.97ms  med=17.05ms  max=895.74ms p(90)=54.31ms p(95)=72.75ms  p(99.9)=181.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 235153
     http_req_receiving.............: avg=708.03µs min=52.16µs med=113.35µs max=275.08ms p(90)=1.13ms  p(95)=1.78ms   p(99.9)=63.05ms 
     http_req_sending...............: avg=46.64µs  min=5.43µs  med=10.59µs  max=185.71ms p(90)=18.96µs p(95)=114.16µs p(99.9)=3.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.52ms  min=1.84ms  med=16.5ms   max=894ms    p(90)=52.93ms p(95)=71.24ms  p(99.9)=177.18ms
     http_reqs......................: 235153  1955.473701/s
     iteration_duration.............: avg=25.51ms  min=2.54ms  med=17.27ms  max=896ms    p(90)=54.56ms p(95)=72.99ms  p(99.9)=186.39ms
     iterations.....................: 235053  1954.642126/s
     success_rate...................: 100.00% ✓ 235053      ✗ 0     
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

     checks.........................: 100.00% ✓ 548355      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.67µs   min=992ns   med=2.35µs  max=9.28ms   p(90)=4.6µs    p(95)=5.75µs   p(99.9)=47.55µs
     http_req_connecting............: avg=538ns    min=0s      med=0s      max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.54ms  min=2.42ms  med=31.71ms max=351.35ms p(90)=43.14ms  p(95)=47.78ms  p(99.9)=88.28ms
       { expected_response:true }...: avg=32.54ms  min=2.42ms  med=31.71ms max=351.35ms p(90)=43.14ms  p(95)=47.78ms  p(99.9)=88.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182885
     http_req_receiving.............: avg=111.53µs min=29.96µs med=61.73µs max=230.78ms p(90)=133.77µs p(95)=275.67µs p(99.9)=5.21ms 
     http_req_sending...............: avg=48.01µs  min=5.2µs   med=10.31µs max=169.97ms p(90)=24.15µs  p(95)=134.41µs p(99.9)=3.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.39ms  min=2.31ms  med=31.57ms max=350.3ms  p(90)=42.95ms  p(95)=47.53ms  p(99.9)=87.9ms 
     http_reqs......................: 182885  1520.216128/s
     iteration_duration.............: avg=32.81ms  min=4.08ms  med=31.94ms max=360.97ms p(90)=43.37ms  p(95)=48.02ms  p(99.9)=89.29ms
     iterations.....................: 182785  1519.384886/s
     success_rate...................: 100.00% ✓ 182785      ✗ 0     
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

     checks.........................: 100.00% ✓ 426111      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.33µs  min=1.06µs  med=2.68µs  max=4.44ms   p(90)=4.18µs   p(95)=4.85µs  p(99.9)=37.72µs
     http_req_connecting............: avg=287ns   min=0s      med=0s      max=2.37ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=41.98ms min=2.14ms  med=41.43ms max=319.8ms  p(90)=59.06ms  p(95)=64.35ms p(99.9)=91.06ms
       { expected_response:true }...: avg=41.98ms min=2.14ms  med=41.43ms max=319.8ms  p(90)=59.06ms  p(95)=64.35ms p(99.9)=91.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142137
     http_req_receiving.............: avg=88.74µs min=29.63µs med=67.79µs max=222.36ms p(90)=105.62µs p(95)=124.6µs p(99.9)=1.78ms 
     http_req_sending...............: avg=26.73µs min=5.34µs  med=11.83µs max=100.08ms p(90)=18.19µs  p(95)=21.89µs p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.87ms min=2.07ms  med=41.33ms max=319.53ms p(90)=58.94ms  p(95)=64.21ms p(99.9)=90.64ms
     http_reqs......................: 142137  1181.537364/s
     iteration_duration.............: avg=42.23ms min=3.9ms   med=41.65ms max=346.95ms p(90)=59.28ms  p(95)=64.57ms p(99.9)=91.65ms
     iterations.....................: 142037  1180.706098/s
     success_rate...................: 100.00% ✓ 142037      ✗ 0     
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

     checks.........................: 100.00% ✓ 186195     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   619 kB/s
     http_req_blocked...............: avg=4.31µs  min=1.2µs   med=3.16µs  max=3.05ms   p(90)=4.65µs   p(95)=5.25µs   p(99.9)=53.19µs 
     http_req_connecting............: avg=905ns   min=0s      med=0s      max=3.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.29ms min=4.49ms  med=93.24ms max=352.42ms p(90)=117.03ms p(95)=129.97ms p(99.9)=226.59ms
       { expected_response:true }...: avg=96.29ms min=4.49ms  med=93.24ms max=352.42ms p(90)=117.03ms p(95)=129.97ms p(99.9)=226.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62165
     http_req_receiving.............: avg=88.01µs min=30.49µs med=82.03µs max=6.24ms   p(90)=115.36µs p(95)=127.57µs p(99.9)=760.54µs
     http_req_sending...............: avg=31.12µs min=5.79µs  med=14.33µs max=212.44ms p(90)=20.96µs  p(95)=23.09µs  p(99.9)=803.62µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.17ms min=4.35ms  med=93.15ms max=352.09ms p(90)=116.9ms  p(95)=129.84ms p(99.9)=226.45ms
     http_reqs......................: 62165   515.493431/s
     iteration_duration.............: avg=96.68ms min=24.22ms med=93.5ms  max=360.87ms p(90)=117.27ms p(95)=130.3ms  p(99.9)=229.28ms
     iterations.....................: 62065   514.664196/s
     success_rate...................: 100.00% ✓ 62065      ✗ 0    
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

     checks.........................: 100.00% ✓ 133950     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   445 kB/s
     http_req_blocked...............: avg=6µs      min=1.17µs  med=3.38µs   max=4.17ms   p(90)=4.81µs   p(95)=5.36µs   p(99.9)=377.95µs
     http_req_connecting............: avg=2.41µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=346.52µs
     http_req_duration..............: avg=133.86ms min=5.95ms  med=131.35ms max=352.37ms p(90)=177.58ms p(95)=191.24ms p(99.9)=243.61ms
       { expected_response:true }...: avg=133.86ms min=5.95ms  med=131.35ms max=352.37ms p(90)=177.58ms p(95)=191.24ms p(99.9)=243.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44750
     http_req_receiving.............: avg=94.2µs   min=33.65µs med=87µs     max=69.19ms  p(90)=119µs    p(95)=131.37µs p(99.9)=676.51µs
     http_req_sending...............: avg=27.13µs  min=5.91µs  med=16.54µs  max=101.26ms p(90)=21.77µs  p(95)=23.56µs  p(99.9)=610.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.74ms min=5.82ms  med=131.23ms max=348.75ms p(90)=177.45ms p(95)=191.08ms p(99.9)=243.4ms 
     http_reqs......................: 44750   370.542851/s
     iteration_duration.............: avg=134.43ms min=33.62ms med=131.7ms  max=362.98ms p(90)=177.87ms p(95)=191.6ms  p(99.9)=246.98ms
     iterations.....................: 44650   369.714823/s
     success_rate...................: 100.00% ✓ 44650      ✗ 0    
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

     checks.........................: 100.00% ✓ 88056      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7.29µs   min=1.33µs  med=3.42µs   max=4.49ms   p(90)=4.76µs   p(95)=5.31µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=4.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=203.55ms min=8.53ms  med=208.88ms max=404.06ms p(90)=217.03ms p(95)=222.18ms p(99.9)=293.31ms
       { expected_response:true }...: avg=203.55ms min=8.53ms  med=208.88ms max=404.06ms p(90)=217.03ms p(95)=222.18ms p(99.9)=293.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29452
     http_req_receiving.............: avg=99.49µs  min=36.12µs med=94.61µs  max=7.24ms   p(90)=126.44µs p(95)=139.88µs p(99.9)=638.3µs 
     http_req_sending...............: avg=26.7µs   min=6.2µs   med=17.38µs  max=108.32ms p(90)=22.14µs  p(95)=23.92µs  p(99.9)=572.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.42ms min=8.43ms  med=208.77ms max=403.77ms p(90)=216.89ms p(95)=222.05ms p(99.9)=293.21ms
     http_reqs......................: 29452   243.226934/s
     iteration_duration.............: avg=204.54ms min=46.23ms med=209.15ms max=427.28ms p(90)=217.31ms p(95)=222.51ms p(99.9)=298.28ms
     iterations.....................: 29352   242.401092/s
     success_rate...................: 100.00% ✓ 29352      ✗ 0    
     vus............................: 44      min=44       max=50 
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

     checks.........................: 100.00% ✓ 83499      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 34 MB   277 kB/s
     http_req_blocked...............: avg=7.64µs   min=1.14µs  med=3.4µs    max=4.26ms   p(90)=4.77µs   p(95)=5.34µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=4.06µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=214.66ms min=6.67ms  med=194.84ms max=687.73ms p(90)=250.8ms  p(95)=454.9ms  p(99.9)=590.3ms 
       { expected_response:true }...: avg=214.66ms min=6.67ms  med=194.84ms max=687.73ms p(90)=250.8ms  p(95)=454.9ms  p(99.9)=590.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 27933
     http_req_receiving.............: avg=147.69µs min=35.94µs med=96.93µs  max=179.41ms p(90)=129.39µs p(95)=142.73µs p(99.9)=1.48ms  
     http_req_sending...............: avg=40.97µs  min=5.95µs  med=17.52µs  max=233.33ms p(90)=22.47µs  p(95)=24.13µs  p(99.9)=683.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.47ms min=6.57ms  med=194.68ms max=687.63ms p(90)=250.52ms p(95)=454.77ms p(99.9)=590.24ms
     http_reqs......................: 27933   230.910741/s
     iteration_duration.............: avg=215.71ms min=35.96ms med=195.22ms max=687.97ms p(90)=251.31ms p(95)=455.43ms p(99.9)=590.55ms
     iterations.....................: 27833   230.084082/s
     success_rate...................: 100.00% ✓ 27833      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

