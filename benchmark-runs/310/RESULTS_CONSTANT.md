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
| hive-router | v0.0.84 | 3,142 | 3,363 | 3,061 | 3.2% |  |
| fusion | 16.6.0 | 2,585 | 2,733 | 2,570 | 2.1% |  |
| grafbase | 0.53.5 | 2,219 | 2,340 | 2,207 | 2.1% |  |
| cosmo | 0.334.0 | 1,279 | 1,325 | 1,267 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 620 | 636 | 615 | 1.1% |  |
| apollo-router | v2.16.1 | 485 | 505 | 483 | 1.6% |  |
| apollo-gateway | 2.14.3 | 278 | 282 | 277 | 0.7% |  |
| hive-gateway | 2.10.8 | 272 | 281 | 271 | 1.2% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% | non-compatible response (1043 across 6/7 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.0 | 2,475 | 2,574 | 2,465 | 1.5% |  |
| hive-router | v0.0.84 | 2,377 | 2,593 | 2,357 | 3.4% |  |
| grafbase | 0.53.5 | 1,621 | 1,682 | 1,618 | 1.4% |  |
| cosmo | 0.334.0 | 1,189 | 1,238 | 1,184 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 568 | 592 | 567 | 1.5% |  |
| apollo-router | v2.16.1 | 446 | 465 | 445 | 1.5% |  |
| apollo-gateway | 2.14.3 | 269 | 272 | 267 | 0.5% |  |
| hive-gateway | 2.10.8 | 262 | 269 | 261 | 1.1% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 2.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1132725     ✗ 0     
     data_received..................: 33 GB   276 MB/s
     data_sent......................: 454 MB  3.8 MB/s
     http_req_blocked...............: avg=3.09µs  min=972ns   med=2.36µs  max=17.5ms   p(90)=3.71µs  p(95)=4.34µs   p(99.9)=35.27µs
     http_req_connecting............: avg=220ns   min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.66ms min=1.43ms  med=14.88ms max=271.45ms p(90)=22.99ms p(95)=26.42ms  p(99.9)=46.89ms
       { expected_response:true }...: avg=15.66ms min=1.43ms  med=14.88ms max=271.45ms p(90)=22.99ms p(95)=26.42ms  p(99.9)=46.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 377675
     http_req_receiving.............: avg=96.15µs min=24.35µs med=45.74µs max=43.21ms  p(90)=86.46µs p(95)=183.42µs p(99.9)=8.56ms 
     http_req_sending...............: avg=50.17µs min=4.72µs  med=8.95µs  max=254.5ms  p(90)=15.46µs p(95)=103.75µs p(99.9)=6.02ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.52ms min=1.36ms  med=14.76ms max=270.93ms p(90)=22.79ms p(95)=26.13ms  p(99.9)=45.55ms
     http_reqs......................: 377675  3142.48886/s
     iteration_duration.............: avg=15.88ms min=2.12ms  med=15.08ms max=326.8ms  p(90)=23.21ms p(95)=26.67ms  p(99.9)=47.82ms
     iterations.....................: 377575  3141.656798/s
     success_rate...................: 100.00% ✓ 377575      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 932553      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=3.14µs   min=892ns   med=2.34µs  max=18.74ms  p(90)=3.75µs  p(95)=4.37µs  p(99.9)=33.99µs 
     http_req_connecting............: avg=281ns    min=0s      med=0s      max=3.71ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.07ms  min=1.98ms  med=16.51ms max=292.46ms p(90)=30.97ms p(95)=37.42ms p(99.9)=111.75ms
       { expected_response:true }...: avg=19.07ms  min=1.98ms  med=16.51ms max=292.46ms p(90)=30.97ms p(95)=37.42ms p(99.9)=111.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310951
     http_req_receiving.............: avg=563.79µs min=50.66µs med=91.49µs max=170.99ms p(90)=1.09ms  p(95)=1.99ms  p(99.9)=26.27ms 
     http_req_sending...............: avg=44.11µs  min=4.69µs  med=9.09µs  max=84.85ms  p(90)=16.41µs p(95)=92.08µs p(99.9)=4.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.46ms  min=1.86ms  med=15.98ms max=292.22ms p(90)=30.02ms p(95)=36.32ms p(99.9)=109.9ms 
     http_reqs......................: 310951  2585.745262/s
     iteration_duration.............: avg=19.29ms  min=2.8ms   med=16.71ms max=314.14ms p(90)=31.2ms  p(95)=37.68ms p(99.9)=112.35ms
     iterations.....................: 310851  2584.913702/s
     success_rate...................: 100.00% ✓ 310851      ✗ 0     
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

     checks.........................: 100.00% ✓ 800121      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=2.86µs  min=902ns   med=2.06µs  max=12.21ms  p(90)=3.49µs  p(95)=4.21µs   p(99.9)=35.34µs
     http_req_connecting............: avg=349ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.27ms min=1.75ms  med=22.03ms max=294.21ms p(90)=26.5ms  p(95)=28.36ms  p(99.9)=47.02ms
       { expected_response:true }...: avg=22.27ms min=1.75ms  med=22.03ms max=294.21ms p(90)=26.5ms  p(95)=28.36ms  p(99.9)=47.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266807
     http_req_receiving.............: avg=88.19µs min=26.41µs med=51.81µs max=84.49ms  p(90)=91.13µs p(95)=121.61µs p(99.9)=6.81ms 
     http_req_sending...............: avg=38.21µs min=4.73µs  med=9.23µs  max=173.37ms p(90)=16.34µs p(95)=30.22µs  p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.15ms min=1.65ms  med=21.94ms max=290.78ms p(90)=26.36ms p(95)=28.17ms  p(99.9)=45.87ms
     http_reqs......................: 266807  2219.066653/s
     iteration_duration.............: avg=22.48ms min=3.91ms  med=22.22ms max=303.67ms p(90)=26.7ms  p(95)=28.57ms  p(99.9)=47.62ms
     iterations.....................: 266707  2218.23494/s
     success_rate...................: 100.00% ✓ 266707      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 461442      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.32µs  min=1.05µs  med=2.37µs  max=3.87ms   p(90)=3.69µs  p(95)=4.27µs   p(99.9)=31.38µs 
     http_req_connecting............: avg=655ns   min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.78ms min=2.04ms  med=38.36ms max=306.11ms p(90)=54.24ms p(95)=59.17ms  p(99.9)=83.3ms  
       { expected_response:true }...: avg=38.78ms min=2.04ms  med=38.36ms max=306.11ms p(90)=54.24ms p(95)=59.17ms  p(99.9)=83.3ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 153914
     http_req_receiving.............: avg=73.18µs min=27.18µs med=60.37µs max=125.26ms p(90)=94.14µs p(95)=108.99µs p(99.9)=836.37µs
     http_req_sending...............: avg=23.23µs min=4.8µs   med=10.22µs max=160.21ms p(90)=15.31µs p(95)=18.75µs  p(99.9)=913.26µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.68ms min=1.95ms  med=38.28ms max=305.69ms p(90)=54.15ms p(95)=59.07ms  p(99.9)=82.99ms 
     http_reqs......................: 153914  1279.694624/s
     iteration_duration.............: avg=39ms    min=4.26ms  med=38.56ms max=315.77ms p(90)=54.45ms p(95)=59.37ms  p(99.9)=83.82ms 
     iterations.....................: 153814  1278.863189/s
     success_rate...................: 100.00% ✓ 153814      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 223926     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   745 kB/s
     http_req_blocked...............: avg=4.25µs  min=1.13µs  med=2.76µs  max=3.89ms   p(90)=4.22µs   p(95)=4.87µs   p(99.9)=45.74µs 
     http_req_connecting............: avg=1.19µs  min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.04ms min=3.6ms   med=78.3ms  max=323.63ms p(90)=98.62ms  p(95)=108.29ms p(99.9)=189.91ms
       { expected_response:true }...: avg=80.04ms min=3.6ms   med=78.3ms  max=323.63ms p(90)=98.62ms  p(95)=108.29ms p(99.9)=189.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74742
     http_req_receiving.............: avg=78.72µs min=29.26µs med=68.19µs max=114.26ms p(90)=103.88µs p(95)=116.63µs p(99.9)=612.53µs
     http_req_sending...............: avg=19.61µs min=5.04µs  med=12.86µs max=53.76ms  p(90)=19.36µs  p(95)=21.66µs  p(99.9)=614.76µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.94ms min=3.45ms  med=78.21ms max=313.68ms p(90)=98.52ms  p(95)=108.18ms p(99.9)=189.15ms
     http_reqs......................: 74742   620.451236/s
     iteration_duration.............: avg=80.38ms min=21.19ms med=78.54ms max=330.81ms p(90)=98.87ms  p(95)=108.55ms p(99.9)=191.38ms
     iterations.....................: 74642   619.621112/s
     success_rate...................: 100.00% ✓ 74642      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 175233     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   583 kB/s
     http_req_blocked...............: avg=4.36µs   min=1.07µs  med=3.19µs   max=5.08ms   p(90)=4.62µs   p(95)=5.14µs   p(99.9)=55.5µs  
     http_req_connecting............: avg=935ns    min=0s      med=0s       max=4.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.29ms min=4.74ms  med=102.16ms max=299.61ms p(90)=123.33ms p(95)=129.53ms p(99.9)=157.96ms
       { expected_response:true }...: avg=102.29ms min=4.74ms  med=102.16ms max=299.61ms p(90)=123.33ms p(95)=129.53ms p(99.9)=157.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58511
     http_req_receiving.............: avg=80.58µs  min=28.63µs med=74.75µs  max=129.2ms  p(90)=105.15µs p(95)=118.36µs p(99.9)=512.53µs
     http_req_sending...............: avg=20.31µs  min=5.15µs  med=15.29µs  max=54.75ms  p(90)=20.52µs  p(95)=22.28µs  p(99.9)=530.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.19ms min=4.66ms  med=102.06ms max=299.33ms p(90)=123.24ms p(95)=129.42ms p(99.9)=157.56ms
     http_reqs......................: 58511   485.25697/s
     iteration_duration.............: avg=102.72ms min=21.9ms  med=102.44ms max=307.7ms  p(90)=123.57ms p(95)=129.79ms p(99.9)=159.62ms
     iterations.....................: 58411   484.427627/s
     success_rate...................: 100.00% ✓ 58411      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 100791     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   335 kB/s
     http_req_blocked...............: avg=5.81µs   min=1.06µs  med=2.84µs   max=3.57ms   p(90)=4.03µs   p(95)=4.53µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=2.79µs   min=0s      med=0s       max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=1.56ms  
     http_req_duration..............: avg=177.9ms  min=7.56ms  med=179.14ms max=390.08ms p(90)=188.82ms p(95)=193.59ms p(99.9)=270.86ms
       { expected_response:true }...: avg=177.9ms  min=7.56ms  med=179.14ms max=390.08ms p(90)=188.82ms p(95)=193.59ms p(99.9)=270.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33697
     http_req_receiving.............: avg=87.68µs  min=30.31µs med=78.86µs  max=70.57ms  p(90)=108.1µs  p(95)=119.31µs p(99.9)=509.14µs
     http_req_sending...............: avg=23.25µs  min=5.35µs  med=15.32µs  max=68.93ms  p(90)=19.7µs   p(95)=21.3µs   p(99.9)=393.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.79ms min=7.42ms  med=179.04ms max=389.69ms p(90)=188.71ms p(95)=193.48ms p(99.9)=270.27ms
     http_reqs......................: 33697   278.633948/s
     iteration_duration.............: avg=178.67ms min=51.43ms med=179.57ms max=396.39ms p(90)=189.08ms p(95)=193.85ms p(99.9)=279.29ms
     iterations.....................: 33597   277.807067/s
     success_rate...................: 100.00% ✓ 33597      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 98523      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.06µs   min=1.08µs  med=3µs      max=4.11ms   p(90)=4.26µs   p(95)=4.79µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=181.99ms min=5.73ms  med=168.01ms max=638.56ms p(90)=212.67ms p(95)=258.9ms  p(99.9)=555.13ms
       { expected_response:true }...: avg=181.99ms min=5.73ms  med=168.01ms max=638.56ms p(90)=212.67ms p(95)=258.9ms  p(99.9)=555.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32941
     http_req_receiving.............: avg=94.11µs  min=32.27µs med=82.91µs  max=129.37ms p(90)=112.32µs p(95)=124.52µs p(99.9)=673.17µs
     http_req_sending...............: avg=25.86µs  min=5.4µs   med=16.18µs  max=107.39ms p(90)=20.52µs  p(95)=22.11µs  p(99.9)=486.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.87ms min=5.59ms  med=167.9ms  max=638.42ms p(90)=212.53ms p(95)=258.68ms p(99.9)=554.98ms
     http_reqs......................: 32941   272.417698/s
     iteration_duration.............: avg=182.78ms min=44.21ms med=168.37ms max=638.78ms p(90)=213.06ms p(95)=259.53ms p(99.9)=555.42ms
     iterations.....................: 32841   271.590711/s
     success_rate...................: 100.00% ✓ 32841      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
data_received..................: 7.3 MB 121 kB/s
     data_sent......................: 92 kB  1.5 kB/s
     http_req_blocked...............: avg=12.49µs  min=2.81µs  med=3.43µs   max=633.61µs p(90)=4.5µs    p(95)=5.37µs   p(99.9)=589.28µs
     http_req_connecting............: avg=1.37µs   min=0s      med=0s       max=104.65µs p(90)=0s       p(95)=0s       p(99.9)=96.8µs  
     http_req_duration..............: avg=430.23ms min=23.06ms med=35.51ms  max=30.01s   p(90)=45.17ms  p(95)=51.49ms  p(99.9)=27.77s  
       { expected_response:true }...: avg=430.23ms min=23.06ms med=35.51ms  max=30.01s   p(90)=45.17ms  p(95)=51.49ms  p(99.9)=27.77s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 76  
     http_req_receiving.............: avg=135.67µs min=74.21µs med=130.32µs max=335.17µs p(90)=174.62µs p(95)=240.63µs p(99.9)=334.65µs
     http_req_sending...............: avg=19.83µs  min=12.83µs med=18.87µs  max=68.87µs  p(90)=21.88µs  p(95)=23.97µs  p(99.9)=65.97µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=430.08ms min=22.87ms med=35.35ms  max=30.01s   p(90)=45.02ms  p(95)=51.35ms  p(99.9)=27.76s  
     http_reqs......................: 76     1.266653/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 892284      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.81µs   min=871ns   med=2.03µs  max=16.04ms  p(90)=3.45µs  p(95)=4.13µs  p(99.9)=30.94µs 
     http_req_connecting............: avg=297ns    min=0s      med=0s      max=3.86ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.94ms  min=1.56ms  med=16.72ms max=375.82ms p(90)=32.62ms p(95)=39.97ms p(99.9)=153.88ms
       { expected_response:true }...: avg=19.94ms  min=1.56ms  med=16.72ms max=375.82ms p(90)=32.62ms p(95)=39.97ms p(99.9)=153.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297528
     http_req_receiving.............: avg=565.97µs min=50.41µs med=93.35µs max=244.29ms p(90)=1.07ms  p(95)=1.86ms  p(99.9)=26.82ms 
     http_req_sending...............: avg=40.83µs  min=4.58µs  med=8.75µs  max=171.03ms p(90)=17.18µs p(95)=79.43µs p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.34ms  min=1.45ms  med=16.2ms  max=375.74ms p(90)=31.65ms p(95)=38.87ms p(99.9)=151.03ms
     http_reqs......................: 297528  2475.309277/s
     iteration_duration.............: avg=20.16ms  min=2.45ms  med=16.91ms max=376.03ms p(90)=32.85ms p(95)=40.22ms p(99.9)=154.76ms
     iterations.....................: 297428  2474.477319/s
     success_rate...................: 100.00% ✓ 297428      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 857244      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.28µs  min=931ns  med=2.53µs  max=12.78ms  p(90)=4.02µs  p(95)=4.71µs   p(99.9)=38.19µs
     http_req_connecting............: avg=328ns   min=0s     med=0s      max=4.12ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.77ms min=1.61ms med=20.54ms max=299.27ms p(90)=28.99ms p(95)=31.39ms  p(99.9)=49.65ms
       { expected_response:true }...: avg=20.77ms min=1.61ms med=20.54ms max=299.27ms p(90)=28.99ms p(95)=31.39ms  p(99.9)=49.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285848
     http_req_receiving.............: avg=86.93µs min=25.8µs med=52.64µs max=71ms     p(90)=92.08µs p(95)=125.75µs p(99.9)=5.68ms 
     http_req_sending...............: avg=41.62µs min=4.84µs med=10.09µs max=122.68ms p(90)=16.73µs p(95)=71.46µs  p(99.9)=3.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.64ms min=1.56ms med=20.42ms max=280.35ms p(90)=28.85ms p(95)=31.22ms  p(99.9)=48.83ms
     http_reqs......................: 285848  2377.784978/s
     iteration_duration.............: avg=20.98ms min=3ms    med=20.74ms max=309.32ms p(90)=29.2ms  p(95)=31.6ms   p(99.9)=50.29ms
     iterations.....................: 285748  2376.953143/s
     success_rate...................: 100.00% ✓ 285748      ✗ 0     
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

     checks.........................: 100.00% ✓ 584910      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.18µs  min=902ns   med=2.16µs  max=3.85ms   p(90)=4.14µs   p(95)=5.26µs   p(99.9)=43.22µs
     http_req_connecting............: avg=453ns   min=0s      med=0s      max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.52ms min=2.27ms  med=30.06ms max=304.15ms p(90)=40.14ms  p(95)=43.49ms  p(99.9)=64.28ms
       { expected_response:true }...: avg=30.52ms min=2.27ms  med=30.06ms max=304.15ms p(90)=40.14ms  p(95)=43.49ms  p(99.9)=64.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195070
     http_req_receiving.............: avg=92.75µs min=29.39µs med=55.51µs max=103ms    p(90)=125.24µs p(95)=200.64µs p(99.9)=3.37ms 
     http_req_sending...............: avg=39.75µs min=4.66µs  med=9.4µs   max=106.94ms p(90)=23.8µs   p(95)=102.49µs p(99.9)=2.99ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.39ms min=2.17ms  med=29.94ms max=303.62ms p(90)=40ms     p(95)=43.33ms  p(99.9)=63.73ms
     http_reqs......................: 195070  1621.666952/s
     iteration_duration.............: avg=30.76ms min=6.51ms  med=30.28ms max=313.43ms p(90)=40.36ms  p(95)=43.71ms  p(99.9)=64.62ms
     iterations.....................: 194970  1620.835627/s
     success_rate...................: 100.00% ✓ 194970      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 428982      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.3µs   min=992ns   med=2.38µs  max=3.51ms   p(90)=4.03µs   p(95)=4.73µs   p(99.9)=35.99µs 
     http_req_connecting............: avg=590ns   min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.71ms min=2.15ms  med=41.32ms max=297ms    p(90)=58.06ms  p(95)=63.14ms  p(99.9)=85.85ms 
       { expected_response:true }...: avg=41.71ms min=2.15ms  med=41.32ms max=297ms    p(90)=58.06ms  p(95)=63.14ms  p(99.9)=85.85ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143094
     http_req_receiving.............: avg=79.96µs min=26.84µs med=65.26µs max=172.55ms p(90)=107.17µs p(95)=124.15µs p(99.9)=776.95µs
     http_req_sending...............: avg=24.69µs min=5.05µs  med=10.88µs max=223.22ms p(90)=17.8µs   p(95)=21.46µs  p(99.9)=885.31µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.6ms  min=2.03ms  med=41.22ms max=276.55ms p(90)=57.97ms  p(95)=63.02ms  p(99.9)=85.67ms 
     http_reqs......................: 143094  1189.651656/s
     iteration_duration.............: avg=41.95ms min=3.77ms  med=41.54ms max=314.38ms p(90)=58.28ms  p(95)=63.36ms  p(99.9)=86.46ms 
     iterations.....................: 142994  1188.820279/s
     success_rate...................: 100.00% ✓ 142994      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 205335     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   683 kB/s
     http_req_blocked...............: avg=4.93µs  min=1.25µs  med=3.28µs  max=4.05ms   p(90)=4.8µs    p(95)=5.46µs   p(99.9)=49.55µs 
     http_req_connecting............: avg=1.38µs  min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.28ms min=3.86ms  med=85.27ms max=307.93ms p(90)=108.27ms p(95)=119.49ms p(99.9)=208.08ms
       { expected_response:true }...: avg=87.28ms min=3.86ms  med=85.27ms max=307.93ms p(90)=108.27ms p(95)=119.49ms p(99.9)=208.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68545
     http_req_receiving.............: avg=84.56µs min=32.93µs med=76.52µs max=63.97ms  p(90)=111.62µs p(95)=124.3µs  p(99.9)=615.63µs
     http_req_sending...............: avg=26.83µs min=5.51µs  med=14.47µs max=131.2ms  p(90)=21.07µs  p(95)=23.39µs  p(99.9)=629.79µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.17ms min=3.77ms  med=85.17ms max=307.79ms p(90)=108.17ms p(95)=119.32ms p(99.9)=207.86ms
     http_reqs......................: 68545   568.710278/s
     iteration_duration.............: avg=87.66ms min=21.58ms med=85.54ms max=325.49ms p(90)=108.52ms p(95)=119.77ms p(99.9)=210.17ms
     iterations.....................: 68445   567.880589/s
     success_rate...................: 100.00% ✓ 68445      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 161184     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   536 kB/s
     http_req_blocked...............: avg=8.72µs   min=1.1µs   med=3.38µs   max=9.72ms   p(90)=4.92µs   p(95)=5.53µs   p(99.9)=141.29µs
     http_req_connecting............: avg=4.79µs   min=0s      med=0s       max=9.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.22ms min=5.2ms   med=109.29ms max=311.04ms p(90)=146.51ms p(95)=157.58ms p(99.9)=203.83ms
       { expected_response:true }...: avg=111.22ms min=5.2ms   med=109.29ms max=311.04ms p(90)=146.51ms p(95)=157.58ms p(99.9)=203.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53828
     http_req_receiving.............: avg=90.38µs  min=29.39µs med=83.77µs  max=75.41ms  p(90)=115.31µs p(95)=128.1µs  p(99.9)=600.49µs
     http_req_sending...............: avg=31.16µs  min=5.32µs  med=17.26µs  max=147.34ms p(90)=22.87µs  p(95)=24.9µs   p(99.9)=685.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.1ms  min=5.09ms  med=109.17ms max=309.69ms p(90)=146.4ms  p(95)=157.46ms p(99.9)=202.87ms
     http_reqs......................: 53828   446.158092/s
     iteration_duration.............: avg=111.69ms min=27.86ms med=109.62ms max=323.77ms p(90)=146.81ms p(95)=157.9ms  p(99.9)=204.81ms
     iterations.....................: 53728   445.329234/s
     success_rate...................: 100.00% ✓ 53728      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 97491      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=6.02µs   min=1.45µs  med=3.5µs    max=3.49ms   p(90)=4.85µs   p(95)=5.44µs   p(99.9)=744.1µs 
     http_req_connecting............: avg=2.25µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=691.3µs 
     http_req_duration..............: avg=183.89ms min=7.71ms  med=184.73ms max=344.16ms p(90)=194.72ms p(95)=198.63ms p(99.9)=275.58ms
       { expected_response:true }...: avg=183.89ms min=7.71ms  med=184.73ms max=344.16ms p(90)=194.72ms p(95)=198.63ms p(99.9)=275.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32597
     http_req_receiving.............: avg=93.06µs  min=33.05µs med=88.58µs  max=19ms     p(90)=120.23µs p(95)=131.96µs p(99.9)=541.59µs
     http_req_sending...............: avg=23.81µs  min=6.18µs  med=17.77µs  max=36.07ms  p(90)=22.43µs  p(95)=24.27µs  p(99.9)=536.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.77ms min=7.57ms  med=184.61ms max=343.95ms p(90)=194.6ms  p(95)=198.48ms p(99.9)=275.49ms
     http_reqs......................: 32597   269.499631/s
     iteration_duration.............: avg=184.71ms min=35.8ms  med=185.07ms max=359.49ms p(90)=195ms    p(95)=198.91ms p(99.9)=277.18ms
     iterations.....................: 32497   268.672869/s
     success_rate...................: 100.00% ✓ 32497      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 94815      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=6.43µs   min=1.17µs  med=3.15µs   max=4.12ms   p(90)=4.43µs   p(95)=4.97µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=3.07µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=189.11ms min=6.12ms  med=175.95ms max=674.61ms p(90)=218.11ms p(95)=265.9ms  p(99.9)=626.66ms
       { expected_response:true }...: avg=189.11ms min=6.12ms  med=175.95ms max=674.61ms p(90)=218.11ms p(95)=265.9ms  p(99.9)=626.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31705
     http_req_receiving.............: avg=97.46µs  min=30.15µs med=87.28µs  max=115.28ms p(90)=116.96µs p(95)=128.26µs p(99.9)=798.34µs
     http_req_sending...............: avg=23.82µs  min=5.53µs  med=17.26µs  max=64.47ms  p(90)=21.52µs  p(95)=23.24µs  p(99.9)=573.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.99ms min=6.04ms  med=175.83ms max=674.51ms p(90)=217.99ms p(95)=265.66ms p(99.9)=626.54ms
     http_reqs......................: 31705   262.303054/s
     iteration_duration.............: avg=189.96ms min=67.7ms  med=176.3ms  max=674.87ms p(90)=218.43ms p(95)=267.09ms p(99.9)=626.9ms 
     iterations.....................: 31605   261.47573/s
     success_rate...................: 100.00% ✓ 31605      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7080      ✗ 0   
     data_received..................: 236 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=74.15µs  min=1.65µs   med=3.61µs  max=9.26ms  p(90)=5.18µs   p(95)=6.21µs   p(99.9)=8.76ms  
     http_req_connecting............: avg=68.95µs  min=0s       med=0s      max=9.22ms  p(90)=0s       p(95)=0s       p(99.9)=8.73ms  
     http_req_duration..............: avg=2.45s    min=33.51ms  med=2.53s   max=4.28s   p(90)=3.22s    p(95)=3.46s    p(99.9)=4.15s   
       { expected_response:true }...: avg=2.45s    min=33.51ms  med=2.53s   max=4.28s   p(90)=3.22s    p(95)=3.46s    p(99.9)=4.15s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2460
     http_req_receiving.............: avg=101.28µs min=39.61µs  med=94.38µs max=7.61ms  p(90)=133.42µs p(95)=150.28µs p(99.9)=487.44µs
     http_req_sending...............: avg=96.5µs   min=6.07µs   med=18.68µs max=16.96ms p(90)=23.99µs  p(95)=28.3µs   p(99.9)=4.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.45s    min=33.35ms  med=2.53s   max=4.28s   p(90)=3.22s    p(95)=3.46s    p(99.9)=4.15s   
     http_reqs......................: 2460    19.568794/s
     iteration_duration.............: avg=2.55s    min=923.42ms med=2.56s   max=4.28s   p(90)=3.24s    p(95)=3.47s    p(99.9)=4.15s   
     iterations.....................: 2360    18.773314/s
     success_rate...................: 100.00% ✓ 2360      ✗ 0   
     vus............................: 34      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

