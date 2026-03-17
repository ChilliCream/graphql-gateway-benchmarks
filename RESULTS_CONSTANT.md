## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,764 | 2,969 | 2,736 | 2.8% |  |
| grafbase | 0.53.2 | 2,107 | 2,165 | 2,087 | 1.2% |  |
| hotchocolate | 16.0.0-p.11.46 | 1,856 | 1,907 | 1,839 | 1.0% |  |
| cosmo | 0.291.0 | 1,284 | 1,304 | 1,275 | 0.7% | non-compatible response (5 across 4/10 runs) |
| hive-gateway-router-runtime | 2.5.6 | 533 | 547 | 529 | 1.2% |  |
| apollo-router | v2.12.0 | 433 | 442 | 428 | 1.0% |  |
| hive-gateway | 2.5.6 | 263 | 268 | 260 | 1.1% |  |
| apollo-gateway | 2.13.2 | 240 | 243 | 238 | 0.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,280 | 2,418 | 2,236 | 2.5% |  |
| hotchocolate | 16.0.0-p.11.46 | 1,676 | 1,710 | 1,633 | 1.6% |  |
| grafbase | 0.53.2 | 1,524 | 1,557 | 1,511 | 1.0% |  |
| cosmo | 0.291.0 | 1,185 | 1,212 | 1,174 | 1.0% | non-compatible response (2 across 2/10 runs) |
| hive-gateway-router-runtime | 2.5.6 | 498 | 513 | 492 | 1.4% |  |
| apollo-router | v2.12.0 | 371 | 382 | 365 | 1.5% | non-compatible response (1 across 1/10 runs) |
| hive-gateway | 2.5.6 | 257 | 261 | 254 | 1.0% |  |
| apollo-gateway | 2.13.2 | 241 | 246 | 240 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 996426      ✗ 0     
     data_received..................: 29 GB   243 MB/s
     data_sent......................: 399 MB  3.3 MB/s
     http_req_blocked...............: avg=3.38µs   min=1µs     med=2.32µs  max=108.62ms p(90)=3.49µs  p(95)=4.13µs   p(99.9)=34.24µs
     http_req_connecting............: avg=227ns    min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.82ms  min=1.58ms  med=16.91ms max=303.91ms p(90)=26.29ms p(95)=30.32ms  p(99.9)=54.22ms
       { expected_response:true }...: avg=17.82ms  min=1.58ms  med=16.91ms max=303.91ms p(90)=26.29ms p(95)=30.32ms  p(99.9)=54.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 332242
     http_req_receiving.............: avg=124.48µs min=28.07µs med=51.22µs max=171.04ms p(90)=99.3µs  p(95)=273.2µs  p(99.9)=11.77ms
     http_req_sending...............: avg=61.36µs  min=5.16µs  med=9.37µs  max=231.63ms p(90)=15.93µs p(95)=124.56µs p(99.9)=12.08ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.64ms  min=1.51ms  med=16.76ms max=284.3ms  p(90)=26.03ms p(95)=29.93ms  p(99.9)=53.02ms
     http_reqs......................: 332242  2764.228334/s
     iteration_duration.............: avg=18.05ms  min=1.93ms  med=17.12ms max=319.48ms p(90)=26.52ms p(95)=30.58ms  p(99.9)=55.48ms
     iterations.....................: 332142  2763.396342/s
     success_rate...................: 100.00% ✓ 332142      ✗ 0     
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

     checks.........................: 100.00% ✓ 760104      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.76µs   min=1.02µs  med=2.65µs  max=20.11ms  p(90)=4.17µs   p(95)=5.01µs   p(99.9)=46.75µs
     http_req_connecting............: avg=404ns    min=0s      med=0s      max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.43ms  min=2.03ms  med=23.15ms max=330.74ms p(90)=28.41ms  p(95)=31.12ms  p(99.9)=54.72ms
       { expected_response:true }...: avg=23.43ms  min=2.03ms  med=23.15ms max=330.74ms p(90)=28.41ms  p(95)=31.12ms  p(99.9)=54.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253468
     http_req_receiving.............: avg=114.26µs min=27.51µs med=60.69µs max=42.81ms  p(90)=107.83µs p(95)=228.47µs p(99.9)=8.97ms 
     http_req_sending...............: avg=52.96µs  min=4.8µs   med=10.97µs max=161.84ms p(90)=19.34µs  p(95)=126.17µs p(99.9)=5.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.26ms  min=1.92ms  med=23.03ms max=330.38ms p(90)=28.21ms  p(95)=30.8ms   p(99.9)=53.92ms
     http_reqs......................: 253468  2107.748783/s
     iteration_duration.............: avg=23.67ms  min=3.27ms  med=23.37ms max=342.2ms  p(90)=28.64ms  p(95)=31.38ms  p(99.9)=55.42ms
     iterations.....................: 253368  2106.917219/s
     success_rate...................: 100.00% ✓ 253368      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.46)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 669840      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=3.33µs   min=1.01µs  med=2.43µs   max=14.01ms  p(90)=3.61µs   p(95)=4.21µs  p(99.9)=35.14µs 
     http_req_connecting............: avg=442ns    min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=26.62ms  min=2.78ms  med=15.01ms  max=440.14ms p(90)=64.57ms  p(95)=85.9ms  p(99.9)=193.9ms 
       { expected_response:true }...: avg=26.62ms  min=2.78ms  med=15.01ms  max=440.14ms p(90)=64.57ms  p(95)=85.9ms  p(99.9)=193.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 223380
     http_req_receiving.............: avg=617.87µs min=51.17µs med=111.01µs max=396.09ms p(90)=741.04µs p(95)=1.13ms  p(99.9)=71.21ms 
     http_req_sending...............: avg=43.68µs  min=5.32µs  med=10.04µs  max=290.93ms p(90)=15.97µs  p(95)=25.93µs p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.96ms  min=2.64ms  med=14.5ms   max=437.9ms  p(90)=63.37ms  p(95)=84.57ms p(99.9)=188.65ms
     http_reqs......................: 223380  1856.185759/s
     iteration_duration.............: avg=26.86ms  min=3.52ms  med=15.23ms  max=440.4ms  p(90)=64.82ms  p(95)=86.14ms p(99.9)=197.21ms
     iterations.....................: 223280  1855.354805/s
     success_rate...................: 100.00% ✓ 223280      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  99% — ✓ 154344 / ✗ 1
     ✓ valid response structure

     checks.........................: 99.99% ✓ 463034      ✗ 1     
     data_received..................: 14 GB  113 MB/s
     data_sent......................: 186 MB 1.5 MB/s
     http_req_blocked...............: avg=5.97µs  min=1.09µs  med=2.44µs  max=72.28ms  p(90)=3.75µs  p(95)=4.37µs   p(99.9)=34.86µs
     http_req_connecting............: avg=3.22µs  min=0s      med=0s      max=72.26ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.63ms min=2.13ms  med=38.04ms max=302.8ms  p(90)=54.56ms p(95)=59.61ms  p(99.9)=84.1ms 
       { expected_response:true }...: avg=38.63ms min=2.13ms  med=38.04ms max=302.8ms  p(90)=54.56ms p(95)=59.61ms  p(99.9)=84.1ms 
     http_req_failed................: 0.00%  ✓ 0           ✗ 154445
     http_req_receiving.............: avg=80.78µs min=29.17µs med=60.58µs max=29.63ms  p(90)=97.02µs p(95)=115.57µs p(99.9)=2.2ms  
     http_req_sending...............: avg=29.62µs min=5.27µs  med=10.55µs max=115.32ms p(90)=16.15µs p(95)=20.18µs  p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.52ms min=2.06ms  med=37.94ms max=300.43ms p(90)=54.44ms p(95)=59.49ms  p(99.9)=83.86ms
     http_reqs......................: 154445 1284.123846/s
     iteration_duration.............: avg=38.87ms min=4.32ms  med=38.25ms max=324.18ms p(90)=54.76ms p(95)=59.82ms  p(99.9)=84.59ms
     iterations.....................: 154345 1283.292402/s
     success_rate...................: 99.99% ✓ 154344      ✗ 1     
     vus............................: 50     min=50        max=50  
     vus_max........................: 50     min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 192774     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 77 MB   641 kB/s
     http_req_blocked...............: avg=5.02µs  min=1.08µs  med=2.99µs  max=4.48ms   p(90)=4.5µs    p(95)=5.1µs    p(99.9)=61.49µs 
     http_req_connecting............: avg=1.65µs  min=0s      med=0s      max=4.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.99ms min=4.36ms  med=88.2ms  max=361.44ms p(90)=132.47ms p(95)=146.3ms  p(99.9)=240.34ms
       { expected_response:true }...: avg=92.99ms min=4.36ms  med=88.2ms  max=361.44ms p(90)=132.47ms p(95)=146.3ms  p(99.9)=240.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64358
     http_req_receiving.............: avg=89.32µs min=31.31µs med=78.98µs max=166ms    p(90)=113.85µs p(95)=126.92µs p(99.9)=903µs   
     http_req_sending...............: avg=26.69µs min=5.5µs   med=13.56µs max=169.98ms p(90)=20.17µs  p(95)=22.45µs  p(99.9)=732.62µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.88ms min=4.26ms  med=88.1ms  max=360.77ms p(90)=132.36ms p(95)=146.17ms p(99.9)=239.95ms
     http_reqs......................: 64358   533.80618/s
     iteration_duration.............: avg=93.39ms min=12.07ms med=88.48ms max=373.02ms p(90)=132.75ms p(95)=146.61ms p(99.9)=242.44ms
     iterations.....................: 64258   532.976748/s
     success_rate...................: 100.00% ✓ 64258      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 156519     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   520 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.19µs  med=3.47µs   max=5.57ms   p(90)=4.9µs    p(95)=5.46µs   p(99.9)=117.89µs
     http_req_connecting............: avg=2.22µs   min=0s      med=0s       max=5.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.54ms min=5.39ms  med=114.27ms max=338.81ms p(90)=138.04ms p(95)=145.21ms p(99.9)=176.93ms
       { expected_response:true }...: avg=114.54ms min=5.39ms  med=114.27ms max=338.81ms p(90)=138.04ms p(95)=145.21ms p(99.9)=176.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52273
     http_req_receiving.............: avg=89.74µs  min=31.86µs med=84.72µs  max=24.7ms   p(90)=115.56µs p(95)=126.78µs p(99.9)=645.43µs
     http_req_sending...............: avg=32.26µs  min=5.81µs  med=16.26µs  max=121.57ms p(90)=21.43µs  p(95)=23.2µs   p(99.9)=1.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.42ms min=5.28ms  med=114.16ms max=334.01ms p(90)=137.92ms p(95)=145.07ms p(99.9)=176.54ms
     http_reqs......................: 52273   433.142248/s
     iteration_duration.............: avg=115.02ms min=22.32ms med=114.56ms max=350.64ms p(90)=138.3ms  p(95)=145.48ms p(99.9)=178.8ms 
     iterations.....................: 52173   432.313632/s
     success_rate...................: 100.00% ✓ 52173      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95232      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.82µs   min=1.29µs  med=3.42µs   max=4.5ms    p(90)=4.78µs   p(95)=5.38µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=188.27ms min=5.88ms  med=181.18ms max=699.03ms p(90)=279.08ms p(95)=396.75ms p(99.9)=576.81ms
       { expected_response:true }...: avg=188.27ms min=5.88ms  med=181.18ms max=699.03ms p(90)=279.08ms p(95)=396.75ms p(99.9)=576.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31844
     http_req_receiving.............: avg=97.7µs   min=35.84µs med=91.71µs  max=24.44ms  p(90)=123.8µs  p(95)=136.34µs p(99.9)=673.03µs
     http_req_sending...............: avg=21.16µs  min=6.23µs  med=16.63µs  max=12.11ms  p(90)=22.05µs  p(95)=24.06µs  p(99.9)=641.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.15ms min=5.74ms  med=181.07ms max=698.93ms p(90)=278.96ms p(95)=396.63ms p(99.9)=576.7ms 
     http_reqs......................: 31844   263.317755/s
     iteration_duration.............: avg=189.11ms min=29.95ms med=181.79ms max=699.24ms p(90)=279.56ms p(95)=398.02ms p(99.9)=577.06ms
     iterations.....................: 31744   262.490855/s
     success_rate...................: 100.00% ✓ 31744      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87042      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=6.27µs   min=1.26µs  med=3.17µs   max=3.88ms   p(90)=4.38µs   p(95)=4.88µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=205.98ms min=8.4ms   med=220.79ms max=419.27ms p(90)=237.64ms p(95)=242.51ms p(99.9)=309.21ms
       { expected_response:true }...: avg=205.98ms min=8.4ms   med=220.79ms max=419.27ms p(90)=237.64ms p(95)=242.51ms p(99.9)=309.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29114
     http_req_receiving.............: avg=121.15µs min=32µs    med=88.75µs  max=77.93ms  p(90)=119.74µs p(95)=131.39µs p(99.9)=1.66ms  
     http_req_sending...............: avg=24.8µs   min=6.19µs  med=15.57µs  max=71.53ms  p(90)=20.39µs  p(95)=22.15µs  p(99.9)=864.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.83ms min=8.27ms  med=220.69ms max=376.28ms p(90)=237.53ms p(95)=242.41ms p(99.9)=309.06ms
     http_reqs......................: 29114   240.412629/s
     iteration_duration.............: avg=206.96ms min=34.02ms med=221.33ms max=441.91ms p(90)=237.93ms p(95)=242.8ms  p(99.9)=311.74ms
     iterations.....................: 29014   239.586866/s
     success_rate...................: 100.00% ✓ 29014      ✗ 0    
     vus............................: 35      min=35       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 822237      ✗ 0     
     data_received..................: 24 GB   199 MB/s
     data_sent......................: 330 MB  2.7 MB/s
     http_req_blocked...............: avg=3.55µs   min=1.04µs  med=2.64µs  max=12.58ms  p(90)=4.08µs   p(95)=4.88µs  p(99.9)=39.97µs
     http_req_connecting............: avg=423ns    min=0s      med=0s      max=4.4ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=21.64ms  min=1.78ms  med=21.18ms max=296.32ms p(90)=29.34ms  p(95)=32.29ms p(99.9)=54.06ms
       { expected_response:true }...: avg=21.64ms  min=1.78ms  med=21.18ms max=296.32ms p(90)=29.34ms  p(95)=32.29ms p(99.9)=54.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 274179
     http_req_receiving.............: avg=108.49µs min=29.22µs med=58.74µs max=49ms     p(90)=107.03µs p(95)=254.5µs p(99.9)=7.41ms 
     http_req_sending...............: avg=54.48µs  min=5.31µs  med=10.91µs max=171.45ms p(90)=18.9µs   p(95)=130.3µs p(99.9)=4.31ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=21.48ms  min=1.71ms  med=21.04ms max=295.79ms p(90)=29.16ms  p(95)=32.04ms p(99.9)=53.33ms
     http_reqs......................: 274179  2280.491036/s
     iteration_duration.............: avg=21.88ms  min=3.47ms  med=21.4ms  max=336.56ms p(90)=29.57ms  p(95)=32.52ms p(99.9)=54.85ms
     iterations.....................: 274079  2279.659284/s
     success_rate...................: 100.00% ✓ 274079      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.46)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 604569      ✗ 0     
     data_received..................: 18 GB   147 MB/s
     data_sent......................: 242 MB  2.0 MB/s
     http_req_blocked...............: avg=3.57µs  min=1.1µs   med=2.68µs   max=5.05ms   p(90)=4.02µs   p(95)=4.67µs  p(99.9)=40.67µs 
     http_req_connecting............: avg=500ns   min=0s      med=0s       max=4.54ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=29.52ms min=2.35ms  med=18.88ms  max=497.5ms  p(90)=67.4ms   p(95)=87.82ms p(99.9)=202.67ms
       { expected_response:true }...: avg=29.52ms min=2.35ms  med=18.88ms  max=497.5ms  p(90)=67.4ms   p(95)=87.82ms p(99.9)=202.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 201623
     http_req_receiving.............: avg=520.1µs min=52.58µs med=115.85µs max=236.61ms p(90)=739.48µs p(95)=1.13ms  p(99.9)=59.8ms  
     http_req_sending...............: avg=36.49µs min=5.45µs  med=11.14µs  max=54.56ms  p(90)=18.11µs  p(95)=26.02µs p(99.9)=2.11ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=28.96ms min=2.23ms  med=18.42ms  max=497.36ms p(90)=66.51ms  p(95)=86.79ms p(99.9)=200.98ms
     http_reqs......................: 201623  1676.186229/s
     iteration_duration.............: avg=29.76ms min=3.14ms  med=19.11ms  max=497.76ms p(90)=67.62ms  p(95)=88.08ms p(99.9)=204.36ms
     iterations.....................: 201523  1675.354883/s
     success_rate...................: 100.00% ✓ 201523      ✗ 0     
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

     checks.........................: 100.00% ✓ 549987      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.71µs   min=1µs     med=2.5µs   max=5.87ms   p(90)=4.92µs   p(95)=6.06µs   p(99.9)=45.68µs
     http_req_connecting............: avg=591ns    min=0s      med=0s      max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.45ms  min=2.44ms  med=31.47ms max=336.56ms p(90)=43.18ms  p(95)=48.08ms  p(99.9)=89.83ms
       { expected_response:true }...: avg=32.45ms  min=2.44ms  med=31.47ms max=336.56ms p(90)=43.18ms  p(95)=48.08ms  p(99.9)=89.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183429
     http_req_receiving.............: avg=126.84µs min=29.84µs med=63.92µs max=188.23ms p(90)=135.88µs p(95)=281.21µs p(99.9)=5.61ms 
     http_req_sending...............: avg=50.82µs  min=5.23µs  med=11.01µs max=187.49ms p(90)=25.26µs  p(95)=137.56µs p(99.9)=3.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.27ms  min=2.32ms  med=31.33ms max=214.64ms p(90)=43ms     p(95)=47.85ms  p(99.9)=88.32ms
     http_reqs......................: 183429  1524.616474/s
     iteration_duration.............: avg=32.72ms  min=4.21ms  med=31.71ms max=352.15ms p(90)=43.42ms  p(95)=48.32ms  p(99.9)=90.63ms
     iterations.....................: 183329  1523.785298/s
     success_rate...................: 100.00% ✓ 183329      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427404      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.79µs  min=1.08µs  med=2.75µs  max=3.96ms   p(90)=4.23µs   p(95)=4.91µs  p(99.9)=40.37µs
     http_req_connecting............: avg=696ns   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=41.85ms min=2.31ms  med=41.31ms max=321.45ms p(90)=58.75ms  p(95)=64.05ms p(99.9)=90.02ms
       { expected_response:true }...: avg=41.85ms min=2.31ms  med=41.31ms max=321.45ms p(90)=58.75ms  p(95)=64.05ms p(99.9)=90.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142568
     http_req_receiving.............: avg=89.02µs min=28.92µs med=68.21µs max=65.18ms  p(90)=107.05µs p(95)=126.7µs p(99.9)=1.88ms 
     http_req_sending...............: avg=32.23µs min=5.26µs  med=11.81µs max=202.63ms p(90)=18.29µs  p(95)=22.49µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.73ms min=2.2ms   med=41.2ms  max=321.33ms p(90)=58.62ms  p(95)=63.92ms p(99.9)=89.35ms
     http_reqs......................: 142568  1185.106028/s
     iteration_duration.............: avg=42.1ms  min=4.62ms  med=41.54ms max=333.74ms p(90)=58.97ms  p(95)=64.26ms p(99.9)=90.64ms
     iterations.....................: 142468  1184.274771/s
     success_rate...................: 100.00% ✓ 142468      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 180237     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 72 MB   599 kB/s
     http_req_blocked...............: avg=6.56µs  min=1.18µs  med=3.22µs  max=51.97ms  p(90)=4.72µs   p(95)=5.3µs    p(99.9)=56.03µs 
     http_req_connecting............: avg=2.22µs  min=0s      med=0s      max=8.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.49ms min=4.44ms  med=96.4ms  max=329.87ms p(90)=119.13ms p(95)=130.69ms p(99.9)=230.75ms
       { expected_response:true }...: avg=99.49ms min=4.44ms  med=96.4ms  max=329.87ms p(90)=119.13ms p(95)=130.69ms p(99.9)=230.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60179
     http_req_receiving.............: avg=92.53µs min=32.34µs med=83.56µs max=90.49ms  p(90)=117.59µs p(95)=131.08µs p(99.9)=975.87µs
     http_req_sending...............: avg=29.87µs min=5.62µs  med=14.13µs max=236.81ms p(90)=20.44µs  p(95)=22.4µs   p(99.9)=838.57µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.37ms min=4.29ms  med=96.3ms  max=327.67ms p(90)=119.01ms p(95)=130.56ms p(99.9)=230.38ms
     http_reqs......................: 60179   498.798164/s
     iteration_duration.............: avg=99.9ms  min=17.19ms med=96.65ms max=348.55ms p(90)=119.41ms p(95)=131.04ms p(99.9)=233.07ms
     iterations.....................: 60079   497.969307/s
     success_rate...................: 100.00% ✓ 60079      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 134259     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   446 kB/s
     http_req_blocked...............: avg=5.45µs   min=1.19µs  med=3.51µs   max=4.6ms    p(90)=4.92µs   p(95)=5.46µs   p(99.9)=308.5µs 
     http_req_connecting............: avg=1.59µs   min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=128.84µs
     http_req_duration..............: avg=133.56ms min=6.05ms  med=131.01ms max=361.11ms p(90)=177.02ms p(95)=190.48ms p(99.9)=246.26ms
       { expected_response:true }...: avg=133.56ms min=6.05ms  med=131.01ms max=361.11ms p(90)=177.02ms p(95)=190.48ms p(99.9)=246.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44853
     http_req_receiving.............: avg=99.98µs  min=31.39µs med=87.41µs  max=234.88ms p(90)=119.06µs p(95)=131.62µs p(99.9)=776.98µs
     http_req_sending...............: avg=31.46µs  min=5.63µs  med=16.58µs  max=223.64ms p(90)=21.95µs  p(95)=23.8µs   p(99.9)=926.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.42ms min=5.96ms  med=130.89ms max=335.52ms p(90)=176.89ms p(95)=190.34ms p(99.9)=246.04ms
     http_reqs......................: 44853   371.368609/s
     iteration_duration.............: avg=134.12ms min=35.75ms med=131.34ms max=376.01ms p(90)=177.33ms p(95)=190.8ms  p(99.9)=249.48ms
     iterations.....................: 44753   370.540641/s
     success_rate...................: 100.00% ✓ 44753      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93096      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   309 kB/s
     http_req_blocked...............: avg=12.49µs  min=1.29µs  med=3.55µs   max=9.98ms   p(90)=4.9µs    p(95)=5.46µs   p(99.9)=4.11ms  
     http_req_connecting............: avg=8.58µs   min=0s      med=0s       max=9.95ms   p(90)=0s       p(95)=0s       p(99.9)=3.94ms  
     http_req_duration..............: avg=192.59ms min=6.02ms  med=176.53ms max=622.4ms  p(90)=227.06ms p(95)=387.44ms p(99.9)=517.58ms
       { expected_response:true }...: avg=192.59ms min=6.02ms  med=176.53ms max=622.4ms  p(90)=227.06ms p(95)=387.44ms p(99.9)=517.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31132
     http_req_receiving.............: avg=103.56µs min=33.45µs med=96.15µs  max=56.96ms  p(90)=127.39µs p(95)=140.68µs p(99.9)=739.15µs
     http_req_sending...............: avg=39.28µs  min=6.18µs  med=17.86µs  max=222.76ms p(90)=22.75µs  p(95)=24.48µs  p(99.9)=3.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.44ms min=5.89ms  med=176.41ms max=622.27ms p(90)=226.91ms p(95)=387.33ms p(99.9)=517.47ms
     http_reqs......................: 31132   257.343722/s
     iteration_duration.............: avg=193.48ms min=29.48ms med=176.88ms max=622.69ms p(90)=227.7ms  p(95)=389.77ms p(99.9)=517.97ms
     iterations.....................: 31032   256.517101/s
     success_rate...................: 100.00% ✓ 31032      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87258      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=5.28µs   min=1.34µs  med=3.6µs    max=2.52ms   p(90)=4.91µs   p(95)=5.45µs   p(99.9)=569.74µs
     http_req_connecting............: avg=1.51µs   min=0s      med=0s       max=2.49ms   p(90)=0s       p(95)=0s       p(99.9)=543.99µs
     http_req_duration..............: avg=205.44ms min=8.59ms  med=205.16ms max=360.44ms p(90)=218.3ms  p(95)=221.85ms p(99.9)=298.79ms
       { expected_response:true }...: avg=205.44ms min=8.59ms  med=205.16ms max=360.44ms p(90)=218.3ms  p(95)=221.85ms p(99.9)=298.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29186
     http_req_receiving.............: avg=104.89µs min=34.52µs med=96.19µs  max=104.24ms p(90)=127.56µs p(95)=140.55µs p(99.9)=703.06µs
     http_req_sending...............: avg=23.09µs  min=5.97µs  med=17.48µs  max=43.08ms  p(90)=22.01µs  p(95)=23.81µs  p(99.9)=594.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.31ms min=8.45ms  med=205.03ms max=359.36ms p(90)=218.18ms p(95)=221.71ms p(99.9)=298.7ms 
     http_reqs......................: 29186   241.04037/s
     iteration_duration.............: avg=206.4ms  min=67.77ms med=205.47ms max=377.36ms p(90)=218.57ms p(95)=222.14ms p(99.9)=299.97ms
     iterations.....................: 29086   240.214493/s
     success_rate...................: 100.00% ✓ 29086      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 996426      ✗ 0     
     data_received..................: 29 GB   243 MB/s
     data_sent......................: 399 MB  3.3 MB/s
     http_req_blocked...............: avg=3.38µs   min=1µs     med=2.32µs  max=108.62ms p(90)=3.49µs  p(95)=4.13µs   p(99.9)=34.24µs
     http_req_connecting............: avg=227ns    min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.82ms  min=1.58ms  med=16.91ms max=303.91ms p(90)=26.29ms p(95)=30.32ms  p(99.9)=54.22ms
       { expected_response:true }...: avg=17.82ms  min=1.58ms  med=16.91ms max=303.91ms p(90)=26.29ms p(95)=30.32ms  p(99.9)=54.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 332242
     http_req_receiving.............: avg=124.48µs min=28.07µs med=51.22µs max=171.04ms p(90)=99.3µs  p(95)=273.2µs  p(99.9)=11.77ms
     http_req_sending...............: avg=61.36µs  min=5.16µs  med=9.37µs  max=231.63ms p(90)=15.93µs p(95)=124.56µs p(99.9)=12.08ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.64ms  min=1.51ms  med=16.76ms max=284.3ms  p(90)=26.03ms p(95)=29.93ms  p(99.9)=53.02ms
     http_reqs......................: 332242  2764.228334/s
     iteration_duration.............: avg=18.05ms  min=1.93ms  med=17.12ms max=319.48ms p(90)=26.52ms p(95)=30.58ms  p(99.9)=55.48ms
     iterations.....................: 332142  2763.396342/s
     success_rate...................: 100.00% ✓ 332142      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 822237      ✗ 0     
     data_received..................: 24 GB   199 MB/s
     data_sent......................: 330 MB  2.7 MB/s
     http_req_blocked...............: avg=3.55µs   min=1.04µs  med=2.64µs  max=12.58ms  p(90)=4.08µs   p(95)=4.88µs  p(99.9)=39.97µs
     http_req_connecting............: avg=423ns    min=0s      med=0s      max=4.4ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=21.64ms  min=1.78ms  med=21.18ms max=296.32ms p(90)=29.34ms  p(95)=32.29ms p(99.9)=54.06ms
       { expected_response:true }...: avg=21.64ms  min=1.78ms  med=21.18ms max=296.32ms p(90)=29.34ms  p(95)=32.29ms p(99.9)=54.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 274179
     http_req_receiving.............: avg=108.49µs min=29.22µs med=58.74µs max=49ms     p(90)=107.03µs p(95)=254.5µs p(99.9)=7.41ms 
     http_req_sending...............: avg=54.48µs  min=5.31µs  med=10.91µs max=171.45ms p(90)=18.9µs   p(95)=130.3µs p(99.9)=4.31ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=21.48ms  min=1.71ms  med=21.04ms max=295.79ms p(90)=29.16ms  p(95)=32.04ms p(99.9)=53.33ms
     http_reqs......................: 274179  2280.491036/s
     iteration_duration.............: avg=21.88ms  min=3.47ms  med=21.4ms  max=336.56ms p(90)=29.57ms  p(95)=32.52ms p(99.9)=54.85ms
     iterations.....................: 274079  2279.659284/s
     success_rate...................: 100.00% ✓ 274079      ✗ 0     
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

     checks.........................: 100.00% ✓ 760104      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.76µs   min=1.02µs  med=2.65µs  max=20.11ms  p(90)=4.17µs   p(95)=5.01µs   p(99.9)=46.75µs
     http_req_connecting............: avg=404ns    min=0s      med=0s      max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.43ms  min=2.03ms  med=23.15ms max=330.74ms p(90)=28.41ms  p(95)=31.12ms  p(99.9)=54.72ms
       { expected_response:true }...: avg=23.43ms  min=2.03ms  med=23.15ms max=330.74ms p(90)=28.41ms  p(95)=31.12ms  p(99.9)=54.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253468
     http_req_receiving.............: avg=114.26µs min=27.51µs med=60.69µs max=42.81ms  p(90)=107.83µs p(95)=228.47µs p(99.9)=8.97ms 
     http_req_sending...............: avg=52.96µs  min=4.8µs   med=10.97µs max=161.84ms p(90)=19.34µs  p(95)=126.17µs p(99.9)=5.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.26ms  min=1.92ms  med=23.03ms max=330.38ms p(90)=28.21ms  p(95)=30.8ms   p(99.9)=53.92ms
     http_reqs......................: 253468  2107.748783/s
     iteration_duration.............: avg=23.67ms  min=3.27ms  med=23.37ms max=342.2ms  p(90)=28.64ms  p(95)=31.38ms  p(99.9)=55.42ms
     iterations.....................: 253368  2106.917219/s
     success_rate...................: 100.00% ✓ 253368      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.46)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 669840      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=3.33µs   min=1.01µs  med=2.43µs   max=14.01ms  p(90)=3.61µs   p(95)=4.21µs  p(99.9)=35.14µs 
     http_req_connecting............: avg=442ns    min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=26.62ms  min=2.78ms  med=15.01ms  max=440.14ms p(90)=64.57ms  p(95)=85.9ms  p(99.9)=193.9ms 
       { expected_response:true }...: avg=26.62ms  min=2.78ms  med=15.01ms  max=440.14ms p(90)=64.57ms  p(95)=85.9ms  p(99.9)=193.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 223380
     http_req_receiving.............: avg=617.87µs min=51.17µs med=111.01µs max=396.09ms p(90)=741.04µs p(95)=1.13ms  p(99.9)=71.21ms 
     http_req_sending...............: avg=43.68µs  min=5.32µs  med=10.04µs  max=290.93ms p(90)=15.97µs  p(95)=25.93µs p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.96ms  min=2.64ms  med=14.5ms   max=437.9ms  p(90)=63.37ms  p(95)=84.57ms p(99.9)=188.65ms
     http_reqs......................: 223380  1856.185759/s
     iteration_duration.............: avg=26.86ms  min=3.52ms  med=15.23ms  max=440.4ms  p(90)=64.82ms  p(95)=86.14ms p(99.9)=197.21ms
     iterations.....................: 223280  1855.354805/s
     success_rate...................: 100.00% ✓ 223280      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.46)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 604569      ✗ 0     
     data_received..................: 18 GB   147 MB/s
     data_sent......................: 242 MB  2.0 MB/s
     http_req_blocked...............: avg=3.57µs  min=1.1µs   med=2.68µs   max=5.05ms   p(90)=4.02µs   p(95)=4.67µs  p(99.9)=40.67µs 
     http_req_connecting............: avg=500ns   min=0s      med=0s       max=4.54ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=29.52ms min=2.35ms  med=18.88ms  max=497.5ms  p(90)=67.4ms   p(95)=87.82ms p(99.9)=202.67ms
       { expected_response:true }...: avg=29.52ms min=2.35ms  med=18.88ms  max=497.5ms  p(90)=67.4ms   p(95)=87.82ms p(99.9)=202.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 201623
     http_req_receiving.............: avg=520.1µs min=52.58µs med=115.85µs max=236.61ms p(90)=739.48µs p(95)=1.13ms  p(99.9)=59.8ms  
     http_req_sending...............: avg=36.49µs min=5.45µs  med=11.14µs  max=54.56ms  p(90)=18.11µs  p(95)=26.02µs p(99.9)=2.11ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=28.96ms min=2.23ms  med=18.42ms  max=497.36ms p(90)=66.51ms  p(95)=86.79ms p(99.9)=200.98ms
     http_reqs......................: 201623  1676.186229/s
     iteration_duration.............: avg=29.76ms min=3.14ms  med=19.11ms  max=497.76ms p(90)=67.62ms  p(95)=88.08ms p(99.9)=204.36ms
     iterations.....................: 201523  1675.354883/s
     success_rate...................: 100.00% ✓ 201523      ✗ 0     
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

     checks.........................: 100.00% ✓ 549987      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.71µs   min=1µs     med=2.5µs   max=5.87ms   p(90)=4.92µs   p(95)=6.06µs   p(99.9)=45.68µs
     http_req_connecting............: avg=591ns    min=0s      med=0s      max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.45ms  min=2.44ms  med=31.47ms max=336.56ms p(90)=43.18ms  p(95)=48.08ms  p(99.9)=89.83ms
       { expected_response:true }...: avg=32.45ms  min=2.44ms  med=31.47ms max=336.56ms p(90)=43.18ms  p(95)=48.08ms  p(99.9)=89.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183429
     http_req_receiving.............: avg=126.84µs min=29.84µs med=63.92µs max=188.23ms p(90)=135.88µs p(95)=281.21µs p(99.9)=5.61ms 
     http_req_sending...............: avg=50.82µs  min=5.23µs  med=11.01µs max=187.49ms p(90)=25.26µs  p(95)=137.56µs p(99.9)=3.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.27ms  min=2.32ms  med=31.33ms max=214.64ms p(90)=43ms     p(95)=47.85ms  p(99.9)=88.32ms
     http_reqs......................: 183429  1524.616474/s
     iteration_duration.............: avg=32.72ms  min=4.21ms  med=31.71ms max=352.15ms p(90)=43.42ms  p(95)=48.32ms  p(99.9)=90.63ms
     iterations.....................: 183329  1523.785298/s
     success_rate...................: 100.00% ✓ 183329      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  99% — ✓ 154344 / ✗ 1
     ✓ valid response structure

     checks.........................: 99.99% ✓ 463034      ✗ 1     
     data_received..................: 14 GB  113 MB/s
     data_sent......................: 186 MB 1.5 MB/s
     http_req_blocked...............: avg=5.97µs  min=1.09µs  med=2.44µs  max=72.28ms  p(90)=3.75µs  p(95)=4.37µs   p(99.9)=34.86µs
     http_req_connecting............: avg=3.22µs  min=0s      med=0s      max=72.26ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.63ms min=2.13ms  med=38.04ms max=302.8ms  p(90)=54.56ms p(95)=59.61ms  p(99.9)=84.1ms 
       { expected_response:true }...: avg=38.63ms min=2.13ms  med=38.04ms max=302.8ms  p(90)=54.56ms p(95)=59.61ms  p(99.9)=84.1ms 
     http_req_failed................: 0.00%  ✓ 0           ✗ 154445
     http_req_receiving.............: avg=80.78µs min=29.17µs med=60.58µs max=29.63ms  p(90)=97.02µs p(95)=115.57µs p(99.9)=2.2ms  
     http_req_sending...............: avg=29.62µs min=5.27µs  med=10.55µs max=115.32ms p(90)=16.15µs p(95)=20.18µs  p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.52ms min=2.06ms  med=37.94ms max=300.43ms p(90)=54.44ms p(95)=59.49ms  p(99.9)=83.86ms
     http_reqs......................: 154445 1284.123846/s
     iteration_duration.............: avg=38.87ms min=4.32ms  med=38.25ms max=324.18ms p(90)=54.76ms p(95)=59.82ms  p(99.9)=84.59ms
     iterations.....................: 154345 1283.292402/s
     success_rate...................: 99.99% ✓ 154344      ✗ 1     
     vus............................: 50     min=50        max=50  
     vus_max........................: 50     min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427404      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.79µs  min=1.08µs  med=2.75µs  max=3.96ms   p(90)=4.23µs   p(95)=4.91µs  p(99.9)=40.37µs
     http_req_connecting............: avg=696ns   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=41.85ms min=2.31ms  med=41.31ms max=321.45ms p(90)=58.75ms  p(95)=64.05ms p(99.9)=90.02ms
       { expected_response:true }...: avg=41.85ms min=2.31ms  med=41.31ms max=321.45ms p(90)=58.75ms  p(95)=64.05ms p(99.9)=90.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142568
     http_req_receiving.............: avg=89.02µs min=28.92µs med=68.21µs max=65.18ms  p(90)=107.05µs p(95)=126.7µs p(99.9)=1.88ms 
     http_req_sending...............: avg=32.23µs min=5.26µs  med=11.81µs max=202.63ms p(90)=18.29µs  p(95)=22.49µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.73ms min=2.2ms   med=41.2ms  max=321.33ms p(90)=58.62ms  p(95)=63.92ms p(99.9)=89.35ms
     http_reqs......................: 142568  1185.106028/s
     iteration_duration.............: avg=42.1ms  min=4.62ms  med=41.54ms max=333.74ms p(90)=58.97ms  p(95)=64.26ms p(99.9)=90.64ms
     iterations.....................: 142468  1184.274771/s
     success_rate...................: 100.00% ✓ 142468      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 192774     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 77 MB   641 kB/s
     http_req_blocked...............: avg=5.02µs  min=1.08µs  med=2.99µs  max=4.48ms   p(90)=4.5µs    p(95)=5.1µs    p(99.9)=61.49µs 
     http_req_connecting............: avg=1.65µs  min=0s      med=0s      max=4.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.99ms min=4.36ms  med=88.2ms  max=361.44ms p(90)=132.47ms p(95)=146.3ms  p(99.9)=240.34ms
       { expected_response:true }...: avg=92.99ms min=4.36ms  med=88.2ms  max=361.44ms p(90)=132.47ms p(95)=146.3ms  p(99.9)=240.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64358
     http_req_receiving.............: avg=89.32µs min=31.31µs med=78.98µs max=166ms    p(90)=113.85µs p(95)=126.92µs p(99.9)=903µs   
     http_req_sending...............: avg=26.69µs min=5.5µs   med=13.56µs max=169.98ms p(90)=20.17µs  p(95)=22.45µs  p(99.9)=732.62µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.88ms min=4.26ms  med=88.1ms  max=360.77ms p(90)=132.36ms p(95)=146.17ms p(99.9)=239.95ms
     http_reqs......................: 64358   533.80618/s
     iteration_duration.............: avg=93.39ms min=12.07ms med=88.48ms max=373.02ms p(90)=132.75ms p(95)=146.61ms p(99.9)=242.44ms
     iterations.....................: 64258   532.976748/s
     success_rate...................: 100.00% ✓ 64258      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 180237     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 72 MB   599 kB/s
     http_req_blocked...............: avg=6.56µs  min=1.18µs  med=3.22µs  max=51.97ms  p(90)=4.72µs   p(95)=5.3µs    p(99.9)=56.03µs 
     http_req_connecting............: avg=2.22µs  min=0s      med=0s      max=8.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.49ms min=4.44ms  med=96.4ms  max=329.87ms p(90)=119.13ms p(95)=130.69ms p(99.9)=230.75ms
       { expected_response:true }...: avg=99.49ms min=4.44ms  med=96.4ms  max=329.87ms p(90)=119.13ms p(95)=130.69ms p(99.9)=230.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60179
     http_req_receiving.............: avg=92.53µs min=32.34µs med=83.56µs max=90.49ms  p(90)=117.59µs p(95)=131.08µs p(99.9)=975.87µs
     http_req_sending...............: avg=29.87µs min=5.62µs  med=14.13µs max=236.81ms p(90)=20.44µs  p(95)=22.4µs   p(99.9)=838.57µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.37ms min=4.29ms  med=96.3ms  max=327.67ms p(90)=119.01ms p(95)=130.56ms p(99.9)=230.38ms
     http_reqs......................: 60179   498.798164/s
     iteration_duration.............: avg=99.9ms  min=17.19ms med=96.65ms max=348.55ms p(90)=119.41ms p(95)=131.04ms p(99.9)=233.07ms
     iterations.....................: 60079   497.969307/s
     success_rate...................: 100.00% ✓ 60079      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 156519     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   520 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.19µs  med=3.47µs   max=5.57ms   p(90)=4.9µs    p(95)=5.46µs   p(99.9)=117.89µs
     http_req_connecting............: avg=2.22µs   min=0s      med=0s       max=5.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.54ms min=5.39ms  med=114.27ms max=338.81ms p(90)=138.04ms p(95)=145.21ms p(99.9)=176.93ms
       { expected_response:true }...: avg=114.54ms min=5.39ms  med=114.27ms max=338.81ms p(90)=138.04ms p(95)=145.21ms p(99.9)=176.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52273
     http_req_receiving.............: avg=89.74µs  min=31.86µs med=84.72µs  max=24.7ms   p(90)=115.56µs p(95)=126.78µs p(99.9)=645.43µs
     http_req_sending...............: avg=32.26µs  min=5.81µs  med=16.26µs  max=121.57ms p(90)=21.43µs  p(95)=23.2µs   p(99.9)=1.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.42ms min=5.28ms  med=114.16ms max=334.01ms p(90)=137.92ms p(95)=145.07ms p(99.9)=176.54ms
     http_reqs......................: 52273   433.142248/s
     iteration_duration.............: avg=115.02ms min=22.32ms med=114.56ms max=350.64ms p(90)=138.3ms  p(95)=145.48ms p(99.9)=178.8ms 
     iterations.....................: 52173   432.313632/s
     success_rate...................: 100.00% ✓ 52173      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 134259     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   446 kB/s
     http_req_blocked...............: avg=5.45µs   min=1.19µs  med=3.51µs   max=4.6ms    p(90)=4.92µs   p(95)=5.46µs   p(99.9)=308.5µs 
     http_req_connecting............: avg=1.59µs   min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=128.84µs
     http_req_duration..............: avg=133.56ms min=6.05ms  med=131.01ms max=361.11ms p(90)=177.02ms p(95)=190.48ms p(99.9)=246.26ms
       { expected_response:true }...: avg=133.56ms min=6.05ms  med=131.01ms max=361.11ms p(90)=177.02ms p(95)=190.48ms p(99.9)=246.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44853
     http_req_receiving.............: avg=99.98µs  min=31.39µs med=87.41µs  max=234.88ms p(90)=119.06µs p(95)=131.62µs p(99.9)=776.98µs
     http_req_sending...............: avg=31.46µs  min=5.63µs  med=16.58µs  max=223.64ms p(90)=21.95µs  p(95)=23.8µs   p(99.9)=926.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.42ms min=5.96ms  med=130.89ms max=335.52ms p(90)=176.89ms p(95)=190.34ms p(99.9)=246.04ms
     http_reqs......................: 44853   371.368609/s
     iteration_duration.............: avg=134.12ms min=35.75ms med=131.34ms max=376.01ms p(90)=177.33ms p(95)=190.8ms  p(99.9)=249.48ms
     iterations.....................: 44753   370.540641/s
     success_rate...................: 100.00% ✓ 44753      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95232      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.82µs   min=1.29µs  med=3.42µs   max=4.5ms    p(90)=4.78µs   p(95)=5.38µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=188.27ms min=5.88ms  med=181.18ms max=699.03ms p(90)=279.08ms p(95)=396.75ms p(99.9)=576.81ms
       { expected_response:true }...: avg=188.27ms min=5.88ms  med=181.18ms max=699.03ms p(90)=279.08ms p(95)=396.75ms p(99.9)=576.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31844
     http_req_receiving.............: avg=97.7µs   min=35.84µs med=91.71µs  max=24.44ms  p(90)=123.8µs  p(95)=136.34µs p(99.9)=673.03µs
     http_req_sending...............: avg=21.16µs  min=6.23µs  med=16.63µs  max=12.11ms  p(90)=22.05µs  p(95)=24.06µs  p(99.9)=641.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.15ms min=5.74ms  med=181.07ms max=698.93ms p(90)=278.96ms p(95)=396.63ms p(99.9)=576.7ms 
     http_reqs......................: 31844   263.317755/s
     iteration_duration.............: avg=189.11ms min=29.95ms med=181.79ms max=699.24ms p(90)=279.56ms p(95)=398.02ms p(99.9)=577.06ms
     iterations.....................: 31744   262.490855/s
     success_rate...................: 100.00% ✓ 31744      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93096      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   309 kB/s
     http_req_blocked...............: avg=12.49µs  min=1.29µs  med=3.55µs   max=9.98ms   p(90)=4.9µs    p(95)=5.46µs   p(99.9)=4.11ms  
     http_req_connecting............: avg=8.58µs   min=0s      med=0s       max=9.95ms   p(90)=0s       p(95)=0s       p(99.9)=3.94ms  
     http_req_duration..............: avg=192.59ms min=6.02ms  med=176.53ms max=622.4ms  p(90)=227.06ms p(95)=387.44ms p(99.9)=517.58ms
       { expected_response:true }...: avg=192.59ms min=6.02ms  med=176.53ms max=622.4ms  p(90)=227.06ms p(95)=387.44ms p(99.9)=517.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31132
     http_req_receiving.............: avg=103.56µs min=33.45µs med=96.15µs  max=56.96ms  p(90)=127.39µs p(95)=140.68µs p(99.9)=739.15µs
     http_req_sending...............: avg=39.28µs  min=6.18µs  med=17.86µs  max=222.76ms p(90)=22.75µs  p(95)=24.48µs  p(99.9)=3.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.44ms min=5.89ms  med=176.41ms max=622.27ms p(90)=226.91ms p(95)=387.33ms p(99.9)=517.47ms
     http_reqs......................: 31132   257.343722/s
     iteration_duration.............: avg=193.48ms min=29.48ms med=176.88ms max=622.69ms p(90)=227.7ms  p(95)=389.77ms p(99.9)=517.97ms
     iterations.....................: 31032   256.517101/s
     success_rate...................: 100.00% ✓ 31032      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87258      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=5.28µs   min=1.34µs  med=3.6µs    max=2.52ms   p(90)=4.91µs   p(95)=5.45µs   p(99.9)=569.74µs
     http_req_connecting............: avg=1.51µs   min=0s      med=0s       max=2.49ms   p(90)=0s       p(95)=0s       p(99.9)=543.99µs
     http_req_duration..............: avg=205.44ms min=8.59ms  med=205.16ms max=360.44ms p(90)=218.3ms  p(95)=221.85ms p(99.9)=298.79ms
       { expected_response:true }...: avg=205.44ms min=8.59ms  med=205.16ms max=360.44ms p(90)=218.3ms  p(95)=221.85ms p(99.9)=298.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29186
     http_req_receiving.............: avg=104.89µs min=34.52µs med=96.19µs  max=104.24ms p(90)=127.56µs p(95)=140.55µs p(99.9)=703.06µs
     http_req_sending...............: avg=23.09µs  min=5.97µs  med=17.48µs  max=43.08ms  p(90)=22.01µs  p(95)=23.81µs  p(99.9)=594.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.31ms min=8.45ms  med=205.03ms max=359.36ms p(90)=218.18ms p(95)=221.71ms p(99.9)=298.7ms 
     http_reqs......................: 29186   241.04037/s
     iteration_duration.............: avg=206.4ms  min=67.77ms med=205.47ms max=377.36ms p(90)=218.57ms p(95)=222.14ms p(99.9)=299.97ms
     iterations.....................: 29086   240.214493/s
     success_rate...................: 100.00% ✓ 29086      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87042      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=6.27µs   min=1.26µs  med=3.17µs   max=3.88ms   p(90)=4.38µs   p(95)=4.88µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=205.98ms min=8.4ms   med=220.79ms max=419.27ms p(90)=237.64ms p(95)=242.51ms p(99.9)=309.21ms
       { expected_response:true }...: avg=205.98ms min=8.4ms   med=220.79ms max=419.27ms p(90)=237.64ms p(95)=242.51ms p(99.9)=309.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29114
     http_req_receiving.............: avg=121.15µs min=32µs    med=88.75µs  max=77.93ms  p(90)=119.74µs p(95)=131.39µs p(99.9)=1.66ms  
     http_req_sending...............: avg=24.8µs   min=6.19µs  med=15.57µs  max=71.53ms  p(90)=20.39µs  p(95)=22.15µs  p(99.9)=864.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.83ms min=8.27ms  med=220.69ms max=376.28ms p(90)=237.53ms p(95)=242.41ms p(99.9)=309.06ms
     http_reqs......................: 29114   240.412629/s
     iteration_duration.............: avg=206.96ms min=34.02ms med=221.33ms max=441.91ms p(90)=237.93ms p(95)=242.8ms  p(99.9)=311.74ms
     iterations.....................: 29014   239.586866/s
     success_rate...................: 100.00% ✓ 29014      ✗ 0    
     vus............................: 35      min=35       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>
