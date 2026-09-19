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
| hive-router | v0.0.84 | 2,757 | 2,929 | 2,741 | 2.5% |  |
| fusion | 16.6.6 | 2,533 | 2,613 | 2,528 | 1.2% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,517 | 2,635 | 2,498 | 1.9% |  |
| fusion-nightly | 16.7.0-p.8 | 2,445 | 2,567 | 2,431 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,397 | 2,470 | 2,382 | 1.2% |  |
| cosmo | 0.334.0 | 1,183 | 1,230 | 1,175 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 557 | 571 | 556 | 0.9% |  |
| hive-gateway | 2.10.8 | 253 | 260 | 249 | 1.4% |  |
| apollo-gateway | 2.14.3 | 232 | 240 | 230 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (5921 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (509388 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,474 | 2,565 | 2,462 | 1.4% |  |
| fusion | 16.6.6 | 2,412 | 2,513 | 2,398 | 1.6% |  |
| fusion-nightly | 16.7.0-p.8 | 2,295 | 2,396 | 2,281 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,258 | 2,336 | 2,249 | 1.3% |  |
| hive-router | v0.0.84 | 2,199 | 2,380 | 2,178 | 3.2% |  |
| cosmo | 0.334.0 | 1,157 | 1,200 | 1,151 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 543 | 555 | 540 | 1.0% |  |
| hive-gateway | 2.10.8 | 244 | 252 | 241 | 1.4% |  |
| apollo-gateway | 2.14.3 | 234 | 238 | 232 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (61235 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (452984 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 507576      ✗ 0     
     data_received..................: 15 GB   242 MB/s
     data_sent......................: 204 MB  3.3 MB/s
     http_req_blocked...............: avg=22.71µs  min=902ns   med=2.58µs  max=63.61ms  p(90)=4.22µs   p(95)=5.37µs   p(99.9)=2.2ms   
     http_req_connecting............: avg=19.27µs  min=0s      med=0s      max=63.5ms   p(90)=0s       p(95)=0s       p(99.9)=2.05ms  
     http_req_duration..............: avg=83.45ms  min=1.41ms  med=77.74ms max=339.55ms p(90)=161.72ms p(95)=177.74ms p(99.9)=234ms   
       { expected_response:true }...: avg=83.45ms  min=1.41ms  med=77.74ms max=339.55ms p(90)=161.72ms p(95)=177.74ms p(99.9)=234ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 170192
     http_req_receiving.............: avg=156.27µs min=25.47µs med=51.9µs  max=69.38ms  p(90)=153.41µs p(95)=357.49µs p(99.9)=19.71ms 
     http_req_sending...............: avg=78.47µs  min=4.28µs  med=9.55µs  max=322.39ms p(90)=18.81µs  p(95)=125.99µs p(99.9)=10.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.21ms  min=1.36ms  med=77.45ms max=338.93ms p(90)=161.44ms p(95)=177.42ms p(99.9)=232.72ms
     http_reqs......................: 170192  2757.884949/s
     iteration_duration.............: avg=84.25ms  min=2.08ms  med=78.63ms max=360.48ms p(90)=162.26ms p(95)=178.25ms p(99.9)=235.1ms 
     iterations.....................: 169192  2741.680398/s
     success_rate...................: 100.00% ✓ 169192      ✗ 0     
     vus............................: 89      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 471336      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=17.42µs min=872ns   med=2.11µs  max=75.71ms  p(90)=3.56µs   p(95)=4.61µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=14.44µs min=0s      med=0s      max=75.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=89.94ms min=2.01ms  med=76.8ms  max=1.5s     p(90)=170.88ms p(95)=194.93ms p(99.9)=691.93ms
       { expected_response:true }...: avg=89.94ms min=2.01ms  med=76.8ms  max=1.5s     p(90)=170.88ms p(95)=194.93ms p(99.9)=691.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158112
     http_req_receiving.............: avg=1.47ms  min=51.57µs med=96.44µs max=757.61ms p(90)=1.61ms   p(95)=4.32ms   p(99.9)=112.33ms
     http_req_sending...............: avg=67.51µs min=4.46µs  med=8.74µs  max=195.57ms p(90)=16.36µs  p(95)=103.56µs p(99.9)=9.39ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.4ms  min=1.91ms  med=75.76ms max=1.5s     p(90)=168.7ms  p(95)=191.19ms p(99.9)=663.19ms
     http_reqs......................: 158112  2533.055443/s
     iteration_duration.............: avg=90.78ms min=3.23ms  med=77.59ms max=1.5s     p(90)=171.45ms p(95)=195.61ms p(99.9)=694.39ms
     iterations.....................: 157112  2517.034803/s
     success_rate...................: 100.00% ✓ 157112      ✗ 0     
     vus............................: 76      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 466407      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=18.94µs min=961ns   med=2.59µs   max=71.51ms  p(90)=4.14µs   p(95)=5.25µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=15.59µs min=0s      med=0s       max=71.43ms  p(90)=0s       p(95)=0s       p(99.9)=1.93ms  
     http_req_duration..............: avg=90.87ms min=1.86ms  med=86.37ms  max=391.87ms p(90)=174.58ms p(95)=191.78ms p(99.9)=253.79ms
       { expected_response:true }...: avg=90.87ms min=1.86ms  med=86.37ms  max=391.87ms p(90)=174.58ms p(95)=191.78ms p(99.9)=253.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156469
     http_req_receiving.............: avg=1.36ms  min=52.52µs med=185.97µs max=247.62ms p(90)=3.29ms   p(95)=4.96ms   p(99.9)=33.14ms 
     http_req_sending...............: avg=65.95µs min=4.62µs  med=9.72µs   max=190.31ms p(90)=19.19µs  p(95)=117.65µs p(99.9)=8.76ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.44ms min=1.77ms  med=84.86ms  max=389.74ms p(90)=173.12ms p(95)=190.42ms p(99.9)=252.49ms
     http_reqs......................: 156469  2517.648169/s
     iteration_duration.............: avg=91.71ms min=5.28ms  med=87.28ms  max=392.1ms  p(90)=175.08ms p(95)=192.33ms p(99.9)=255.1ms 
     iterations.....................: 155469  2501.557773/s
     success_rate...................: 100.00% ✓ 155469      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 454929      ✗ 0     
     data_received..................: 13 GB   214 MB/s
     data_sent......................: 183 MB  2.9 MB/s
     http_req_blocked...............: avg=20.55µs min=912ns  med=2.54µs   max=86.36ms  p(90)=4.08µs   p(95)=5.17µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=17.09µs min=0s     med=0s       max=72.04ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=93.22ms min=2ms    med=82.04ms  max=1.09s    p(90)=178.95ms p(95)=205.58ms p(99.9)=630.74ms
       { expected_response:true }...: avg=93.22ms min=2ms    med=82.04ms  max=1.09s    p(90)=178.95ms p(95)=205.58ms p(99.9)=630.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152643
     http_req_receiving.............: avg=1.4ms   min=52.1µs med=100.64µs max=697.14ms p(90)=1.65ms   p(95)=4.52ms   p(99.9)=86ms    
     http_req_sending...............: avg=66.21µs min=4.71µs med=9.48µs   max=86.81ms  p(90)=17.69µs  p(95)=110.49µs p(99.9)=9.64ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.75ms min=1.9ms  med=80.93ms  max=1.09s    p(90)=177.24ms p(95)=202.75ms p(99.9)=590.78ms
     http_reqs......................: 152643  2445.358139/s
     iteration_duration.............: avg=94.08ms min=3.72ms med=83.04ms  max=1.09s    p(90)=179.54ms p(95)=206.25ms p(99.9)=632.14ms
     iterations.....................: 151643  2429.338025/s
     success_rate...................: 100.00% ✓ 151643      ✗ 0     
     vus............................: 76      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443235      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=14.64µs min=832ns   med=2.11µs  max=52.24ms  p(90)=3.56µs   p(95)=4.63µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=11.39µs min=0s      med=0s      max=52.2ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=95.68ms min=1.63ms  med=83.41ms max=1.84s    p(90)=179.3ms  p(95)=205.93ms p(99.9)=877.86ms
       { expected_response:true }...: avg=95.68ms min=1.63ms  med=83.41ms max=1.84s    p(90)=179.3ms  p(95)=205.93ms p(99.9)=877.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148745
     http_req_receiving.............: avg=1.62ms  min=51.61µs med=98.24µs max=850.97ms p(90)=1.55ms   p(95)=3.87ms   p(99.9)=206.43ms
     http_req_sending...............: avg=58.32µs min=4.52µs  med=9.03µs  max=166.21ms p(90)=17.02µs  p(95)=96.44µs  p(99.9)=8.04ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.99ms min=1.57ms  med=82.22ms max=1.45s    p(90)=177.73ms p(95)=203.71ms p(99.9)=788.57ms
     http_reqs......................: 148745  2397.033996/s
     iteration_duration.............: avg=96.57ms min=2.69ms  med=84.4ms  max=1.84s    p(90)=179.84ms p(95)=206.57ms p(99.9)=878.19ms
     iterations.....................: 147745  2380.91894/s
     success_rate...................: 100.00% ✓ 147745      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 218868      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=6.11µs   min=1.1µs   med=2.63µs   max=25.67ms  p(90)=4.2µs    p(95)=5.07µs   p(99.9)=439.31µs
     http_req_connecting............: avg=2.8µs    min=0s      med=0s       max=25.6ms   p(90)=0s       p(95)=0s       p(99.9)=385.94µs
     http_req_duration..............: avg=192.97ms min=1.97ms  med=193.66ms max=551.47ms p(90)=356.63ms p(95)=383.64ms p(99.9)=486.37ms
       { expected_response:true }...: avg=192.97ms min=1.97ms  med=193.66ms max=551.47ms p(90)=356.63ms p(95)=383.64ms p(99.9)=486.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73956
     http_req_receiving.............: avg=73.14µs  min=28.05µs med=59.65µs  max=89.88ms  p(90)=96.33µs  p(95)=110.47µs p(99.9)=971.08µs
     http_req_sending...............: avg=27.23µs  min=5.16µs  med=10.99µs  max=156.66ms p(90)=16.85µs  p(95)=20.41µs  p(99.9)=2.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.87ms min=1.88ms  med=193.55ms max=551.39ms p(90)=356.53ms p(95)=383.56ms p(99.9)=486.3ms 
     http_reqs......................: 73956   1183.142978/s
     iteration_duration.............: avg=195.84ms min=5.22ms  med=196.7ms  max=551.64ms p(90)=357.5ms  p(95)=384.36ms p(99.9)=487.05ms
     iterations.....................: 72956   1167.145048/s
     success_rate...................: 100.00% ✓ 72956       ✗ 0    
     vus............................: 80      min=0         max=492
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 104700     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   670 kB/s
     http_req_blocked...............: avg=7.35µs   min=1.02µs  med=2.46µs   max=5.71ms   p(90)=4.14µs   p(95)=5.09µs   p(99.9)=964.05µs
     http_req_connecting............: avg=3.93µs   min=0s      med=0s       max=5.65ms   p(90)=0s       p(95)=0s       p(99.9)=932.6µs 
     http_req_duration..............: avg=399.43ms min=3.6ms   med=370.9ms  max=1.61s    p(90)=788.55ms p(95)=855.99ms p(99.9)=1.3s    
       { expected_response:true }...: avg=399.43ms min=3.6ms   med=370.9ms  max=1.61s    p(90)=788.55ms p(95)=855.99ms p(99.9)=1.3s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 35900
     http_req_receiving.............: avg=78.42µs  min=28.26µs med=64.16µs  max=128.41ms p(90)=102.27µs p(95)=115.64µs p(99.9)=886.28µs
     http_req_sending...............: avg=24.19µs  min=4.86µs  med=11.72µs  max=115.06ms p(90)=18.95µs  p(95)=21.97µs  p(99.9)=1.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=399.33ms min=3.51ms  med=370.81ms max=1.61s    p(90)=788.45ms p(95)=855.91ms p(99.9)=1.3s    
     http_reqs......................: 35900   557.855359/s
     iteration_duration.............: avg=411.08ms min=15.1ms  med=385.42ms max=1.61s    p(90)=792.44ms p(95)=858.23ms p(99.9)=1.31s   
     iterations.....................: 34900   542.316213/s
     success_rate...................: 100.00% ✓ 34900      ✗ 0    
     vus............................: 73      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48318      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   305 kB/s
     http_req_blocked...............: avg=10.5µs   min=1.3µs   med=3.78µs   max=15.18ms p(90)=5.54µs   p(95)=6.81µs   p(99.9)=675.55µs
     http_req_connecting............: avg=5.14µs   min=0s      med=0s       max=15.11ms p(90)=0s       p(95)=0s       p(99.9)=648.89µs
     http_req_duration..............: avg=830.9ms  min=5.71ms  med=720.23ms max=16.23s  p(90)=1.46s    p(95)=1.69s    p(99.9)=14.62s  
       { expected_response:true }...: avg=830.9ms  min=5.71ms  med=720.23ms max=16.23s  p(90)=1.46s    p(95)=1.69s    p(99.9)=14.62s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17106
     http_req_receiving.............: avg=100.72µs min=33.63µs med=91.5µs   max=11.45ms p(90)=129.23µs p(95)=145.06µs p(99.9)=1.78ms  
     http_req_sending...............: avg=26.27µs  min=6.01µs  med=17.98µs  max=8.91ms  p(90)=23.92µs  p(95)=27.89µs  p(99.9)=2.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=830.78ms min=5.62ms  med=720.12ms max=16.23s  p(90)=1.46s    p(95)=1.69s    p(99.9)=14.62s  
     http_reqs......................: 17106   253.097707/s
     iteration_duration.............: avg=882.48ms min=47.84ms med=781.75ms max=16.23s  p(90)=1.48s    p(95)=1.7s     p(99.9)=14.64s  
     iterations.....................: 16106   238.301863/s
     success_rate...................: 100.00% ✓ 16106      ✗ 0    
     vus............................: 87      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48087      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   285 kB/s
     http_req_blocked...............: avg=17.26µs  min=1.12µs  med=2.96µs   max=6.45ms  p(90)=4.53µs   p(95)=5.93µs   p(99.9)=3.94ms  
     http_req_connecting............: avg=12.2µs   min=0s      med=0s       max=6.3ms   p(90)=0s       p(95)=0s       p(99.9)=3.82ms  
     http_req_duration..............: avg=389.25ms min=7.45ms  med=453.09ms max=1.15s   p(90)=650.99ms p(95)=710.64ms p(99.9)=987.26ms
       { expected_response:true }...: avg=389.25ms min=7.45ms  med=453.09ms max=1.15s   p(90)=650.99ms p(95)=710.64ms p(99.9)=987.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17029
     http_req_receiving.............: avg=90.93µs  min=32.53µs med=84.03µs  max=10.81ms p(90)=122.06µs p(95)=135.93µs p(99.9)=899µs   
     http_req_sending...............: avg=31.01µs  min=5.3µs   med=16.14µs  max=22.89ms p(90)=21.22µs  p(95)=25.62µs  p(99.9)=3.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.13ms min=7.37ms  med=452.99ms max=1.15s   p(90)=650.88ms p(95)=710.54ms p(99.9)=987.17ms
     http_reqs......................: 17029   232.792811/s
     iteration_duration.............: avg=413.48ms min=11.77ms med=469.61ms max=1.16s   p(90)=656.27ms p(95)=715.1ms  p(99.9)=996.26ms
     iterations.....................: 16029   219.122437/s
     success_rate...................: 100.00% ✓ 16029      ✗ 0    
     vus............................: 57      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 455433      ✗ 0     
     data_received..................: 13 GB   217 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=17.08µs min=851ns   med=2.19µs   max=57.72ms  p(90)=3.96µs   p(95)=5.17µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=13.88µs min=0s      med=0s       max=48.68ms  p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=93.05ms min=1.47ms  med=88ms     max=371.91ms p(90)=178.29ms p(95)=195.03ms p(99.9)=265.98ms
       { expected_response:true }...: avg=93.05ms min=1.47ms  med=88ms     max=371.91ms p(90)=178.29ms p(95)=195.03ms p(99.9)=265.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152811
     http_req_receiving.............: avg=1.41ms  min=52.66µs med=139.41µs max=220.11ms p(90)=3.31ms   p(95)=5.23ms   p(99.9)=42.94ms 
     http_req_sending...............: avg=63.73µs min=4.68µs  med=9.08µs   max=65.21ms  p(90)=20.85µs  p(95)=109.46µs p(99.9)=8.82ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.58ms min=1.4ms   med=86.55ms  max=362.35ms p(90)=176.52ms p(95)=193.18ms p(99.9)=263.57ms
     http_reqs......................: 152811  2474.252778/s
     iteration_duration.............: avg=93.92ms min=3.76ms  med=88.94ms  max=372.12ms p(90)=178.71ms p(95)=195.48ms p(99.9)=267.12ms
     iterations.....................: 151811  2458.06119/s
     success_rate...................: 100.00% ✓ 151811      ✗ 0     
     vus............................: 91      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 445158      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=25.74µs min=1.08µs  med=2.98µs   max=72.14ms  p(90)=4.8µs    p(95)=6.04µs   p(99.9)=2.49ms  
     http_req_connecting............: avg=21.65µs min=0s      med=0s       max=72.07ms  p(90)=0s       p(95)=0s       p(99.9)=2.2ms   
     http_req_duration..............: avg=95.24ms min=1.47ms  med=82.15ms  max=1.89s    p(90)=178.25ms p(95)=208.53ms p(99.9)=970.87ms
       { expected_response:true }...: avg=95.24ms min=1.47ms  med=82.15ms  max=1.89s    p(90)=178.25ms p(95)=208.53ms p(99.9)=970.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149386
     http_req_receiving.............: avg=1.43ms  min=52.18µs med=106.05µs max=1.11s    p(90)=1.42ms   p(95)=3.79ms   p(99.9)=80.35ms 
     http_req_sending...............: avg=76.7µs  min=5.01µs  med=11.14µs  max=137.74ms p(90)=22.03µs  p(95)=126.76µs p(99.9)=10.65ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.73ms min=1.4ms   med=81.14ms  max=1.89s    p(90)=176.33ms p(95)=205.62ms p(99.9)=941.2ms 
     http_reqs......................: 149386  2412.668709/s
     iteration_duration.............: avg=96.16ms min=2.76ms  med=83.22ms  max=1.89s    p(90)=178.89ms p(95)=209.38ms p(99.9)=971.56ms
     iterations.....................: 148386  2396.518141/s
     success_rate...................: 100.00% ✓ 148386      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423612      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=20.02µs  min=921ns   med=2.73µs   max=76.93ms  p(90)=4.52µs   p(95)=5.69µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=16.54µs  min=0s      med=0s       max=76.87ms  p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=100.07ms min=1.52ms  med=85.85ms  max=1.21s    p(90)=190.81ms p(95)=226.38ms p(99.9)=708.41ms
       { expected_response:true }...: avg=100.07ms min=1.52ms  med=85.85ms  max=1.21s    p(90)=190.81ms p(95)=226.38ms p(99.9)=708.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142204
     http_req_receiving.............: avg=1.8ms    min=53.42µs med=112.44µs max=593.22ms p(90)=2.09ms   p(95)=5.77ms   p(99.9)=119.3ms 
     http_req_sending...............: avg=65.31µs  min=4.96µs  med=10.73µs  max=147.51ms p(90)=20.76µs  p(95)=114.2µs  p(99.9)=9.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.2ms   min=1.44ms  med=84.5ms   max=1.21s    p(90)=188.2ms  p(95)=221.91ms p(99.9)=668.37ms
     http_reqs......................: 142204  2295.939909/s
     iteration_duration.............: avg=101.05ms min=2.57ms  med=87ms     max=1.21s    p(90)=191.5ms  p(95)=227.38ms p(99.9)=709.39ms
     iterations.....................: 141204  2279.794513/s
     success_rate...................: 100.00% ✓ 141204      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 418257      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=15.99µs  min=862ns   med=2.47µs   max=76.78ms  p(90)=4.48µs   p(95)=5.62µs   p(99.9)=995.66µs
     http_req_connecting............: avg=12.68µs  min=0s      med=0s       max=76.69ms  p(90)=0s       p(95)=0s       p(99.9)=944.63µs
     http_req_duration..............: avg=101.26ms min=1.8ms   med=84.76ms  max=1.86s    p(90)=190.39ms p(95)=224.14ms p(99.9)=1.12s   
       { expected_response:true }...: avg=101.26ms min=1.8ms   med=84.76ms  max=1.86s    p(90)=190.39ms p(95)=224.14ms p(99.9)=1.12s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 140419
     http_req_receiving.............: avg=1.56ms   min=50.37µs med=105.71µs max=987.46ms p(90)=1.61ms   p(95)=4.18ms   p(99.9)=158.44ms
     http_req_sending...............: avg=67.71µs  min=4.85µs  med=10.46µs  max=219.46ms p(90)=21.72µs  p(95)=105.92µs p(99.9)=8.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.63ms  min=1.71ms  med=83.48ms  max=1.86s    p(90)=188.61ms p(95)=220.84ms p(99.9)=1.02s   
     http_reqs......................: 140419  2258.219849/s
     iteration_duration.............: avg=102.33ms min=3.02ms  med=85.88ms  max=1.86s    p(90)=191.2ms  p(95)=225.39ms p(99.9)=1.12s   
     iterations.....................: 139419  2242.137839/s
     success_rate...................: 100.00% ✓ 139419      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 406332      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=14.92µs  min=990ns   med=2.97µs  max=53.37ms  p(90)=4.8µs    p(95)=6.03µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=11µs     min=0s      med=0s      max=53.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=104.27ms min=1.57ms  med=98.35ms max=330.59ms p(90)=202.6ms  p(95)=220.04ms p(99.9)=270.99ms
       { expected_response:true }...: avg=104.27ms min=1.57ms  med=98.35ms max=330.59ms p(90)=202.6ms  p(95)=220.04ms p(99.9)=270.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136444
     http_req_receiving.............: avg=122.37µs min=27.96µs med=59.25µs max=141.06ms p(90)=126.94µs p(95)=354.93µs p(99.9)=8.7ms   
     http_req_sending...............: avg=60.62µs  min=5.11µs  med=11.24µs max=38.27ms  p(90)=20.83µs  p(95)=128.12µs p(99.9)=7.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.09ms min=1.52ms  med=98.19ms max=330.21ms p(90)=202.4ms  p(95)=219.8ms  p(99.9)=270.68ms
     http_reqs......................: 136444  2199.663209/s
     iteration_duration.............: avg=105.3ms  min=3.48ms  med=99.54ms max=345.53ms p(90)=203.13ms p(95)=220.57ms p(99.9)=272.49ms
     iterations.....................: 135444  2183.541846/s
     success_rate...................: 100.00% ✓ 135444      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214503      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.37µs   min=971ns   med=2.49µs   max=15.37ms  p(90)=4.34µs   p(95)=5.32µs   p(99.9)=421.56µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=15.32ms  p(90)=0s       p(95)=0s       p(99.9)=357.28µs
     http_req_duration..............: avg=196.82ms min=2.11ms  med=198.37ms max=515.73ms p(90)=362.84ms p(95)=389.34ms p(99.9)=469.59ms
       { expected_response:true }...: avg=196.82ms min=2.11ms  med=198.37ms max=515.73ms p(90)=362.84ms p(95)=389.34ms p(99.9)=469.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72501
     http_req_receiving.............: avg=76.61µs  min=28.73µs med=64.26µs  max=9.21ms   p(90)=105.12µs p(95)=120.74µs p(99.9)=1.16ms  
     http_req_sending...............: avg=29.6µs   min=4.97µs  med=11.61µs  max=178.03ms p(90)=19.77µs  p(95)=23.3µs   p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.71ms min=2.04ms  med=198.24ms max=515.65ms p(90)=362.75ms p(95)=389.25ms p(99.9)=469.52ms
     http_reqs......................: 72501   1157.264549/s
     iteration_duration.............: avg=199.81ms min=4.91ms  med=201.53ms max=515.9ms  p(90)=363.74ms p(95)=390.1ms  p(99.9)=470.08ms
     iterations.....................: 71501   1141.3025/s
     success_rate...................: 100.00% ✓ 71501       ✗ 0    
     vus............................: 86      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 102351     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   652 kB/s
     http_req_blocked...............: avg=8.11µs   min=1.11µs  med=2.68µs   max=3.67ms   p(90)=4.45µs   p(95)=5.44µs   p(99.9)=1.38ms
     http_req_connecting............: avg=4.36µs   min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms
     http_req_duration..............: avg=408.48ms min=3.78ms  med=380.48ms max=1.67s    p(90)=807.75ms p(95)=876.5ms  p(99.9)=1.31s 
       { expected_response:true }...: avg=408.48ms min=3.78ms  med=380.48ms max=1.67s    p(90)=807.75ms p(95)=876.5ms  p(99.9)=1.31s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35117
     http_req_receiving.............: avg=82.72µs  min=28.95µs med=71.98µs  max=11.47ms  p(90)=112.43µs p(95)=126.3µs  p(99.9)=1.11ms
     http_req_sending...............: avg=29.11µs  min=4.78µs  med=13.65µs  max=134.17ms p(90)=20.89µs  p(95)=23.86µs  p(99.9)=2.38ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=408.37ms min=3.64ms  med=380.18ms max=1.67s    p(90)=807.65ms p(95)=876.37ms p(99.9)=1.31s 
     http_reqs......................: 35117   543.00202/s
     iteration_duration.............: avg=420.68ms min=13.14ms med=394.81ms max=1.68s    p(90)=811.64ms p(95)=879.91ms p(99.9)=1.31s 
     iterations.....................: 34117   527.539366/s
     success_rate...................: 100.00% ✓ 34117      ✗ 0    
     vus............................: 85      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46593      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   293 kB/s
     http_req_blocked...............: avg=12.79µs  min=1.2µs   med=3.87µs   max=16.29ms p(90)=5.85µs   p(95)=7.98µs   p(99.9)=1.3ms 
     http_req_connecting............: avg=7.08µs   min=0s      med=0s       max=16.17ms p(90)=0s       p(95)=0s       p(99.9)=1.28ms
     http_req_duration..............: avg=880.44ms min=5.81ms  med=788.2ms  max=4.86s   p(90)=1.77s    p(95)=2.01s    p(99.9)=4.21s 
       { expected_response:true }...: avg=880.44ms min=5.81ms  med=788.2ms  max=4.86s   p(90)=1.77s    p(95)=2.01s    p(99.9)=4.21s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16531
     http_req_receiving.............: avg=106.47µs min=28.92µs med=96.5µs   max=27.31ms p(90)=136.46µs p(95)=151.51µs p(99.9)=1.6ms 
     http_req_sending...............: avg=36.43µs  min=6.34µs  med=19.44µs  max=79.09ms p(90)=25.27µs  p(95)=30.42µs  p(99.9)=1.81ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=880.3ms  min=5.72ms  med=788.02ms max=4.86s   p(90)=1.77s    p(95)=2.01s    p(99.9)=4.21s 
     http_reqs......................: 16531   244.511562/s
     iteration_duration.............: avg=937.18ms min=35.37ms med=859.59ms max=4.89s   p(90)=1.8s     p(95)=2.03s    p(99.9)=4.23s 
     iterations.....................: 15531   229.720469/s
     success_rate...................: 100.00% ✓ 15531      ✗ 0    
     vus............................: 91      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45456      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   282 kB/s
     http_req_blocked...............: avg=12.91µs  min=1.15µs  med=3.25µs   max=3ms     p(90)=5.12µs   p(95)=6.75µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=7.78µs   min=0s      med=0s       max=2.98ms  p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=899.65ms min=7.65ms  med=805.41ms max=3.16s   p(90)=1.84s    p(95)=1.95s    p(99.9)=2.86s   
       { expected_response:true }...: avg=899.65ms min=7.65ms  med=805.41ms max=3.16s   p(90)=1.84s    p(95)=1.95s    p(99.9)=2.86s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16152
     http_req_receiving.............: avg=97.96µs  min=34.58µs med=91.79µs  max=9.04ms  p(90)=132.36µs p(95)=147.48µs p(99.9)=938.16µs
     http_req_sending...............: avg=51.63µs  min=5.46µs  med=17.2µs   max=76.19ms p(90)=23.11µs  p(95)=28.6µs   p(99.9)=5.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=899.5ms  min=7.58ms  med=805.29ms max=3.16s   p(90)=1.84s    p(95)=1.95s    p(99.9)=2.86s   
     http_reqs......................: 16152   234.612013/s
     iteration_duration.............: avg=958.99ms min=41.49ms med=886.08ms max=3.16s   p(90)=1.85s    p(95)=1.96s    p(99.9)=2.87s   
     iterations.....................: 15152   220.086752/s
     success_rate...................: 100.00% ✓ 15152      ✗ 0    
     vus............................: 101     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

