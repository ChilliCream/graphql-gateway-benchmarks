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
| hive-router | v0.0.84 | 2,965 | 3,209 | 2,931 | 3.2% |  |
| fusion | 16.6.0 | 2,593 | 2,728 | 2,566 | 2.0% |  |
| grafbase | 0.53.5 | 2,111 | 2,223 | 2,091 | 2.2% |  |
| cosmo | 0.334.0 | 1,277 | 1,324 | 1,269 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 621 | 640 | 616 | 1.2% |  |
| apollo-router | v2.16.1 | 484 | 501 | 482 | 1.3% |  |
| hive-gateway | 2.10.8 | 282 | 290 | 282 | 1.0% |  |
| apollo-gateway | 2.14.3 | 278 | 282 | 276 | 0.8% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,572 | 2,737 | 2,557 | 2.5% |  |
| fusion | 16.6.0 | 2,390 | 2,507 | 2,369 | 2.0% |  |
| grafbase | 0.53.5 | 1,636 | 1,689 | 1,629 | 1.3% |  |
| cosmo | 0.334.0 | 1,227 | 1,275 | 1,221 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 570 | 589 | 567 | 1.2% |  |
| apollo-router | v2.16.1 | 441 | 453 | 432 | 1.4% |  |
| hive-gateway | 2.10.8 | 270 | 278 | 270 | 1.0% |  |
| apollo-gateway | 2.14.3 | 269 | 273 | 266 | 0.8% |  |
| feddi | 5ff8b6165878 | 20 | 20 | 19 | 1.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1068804     ✗ 0     
     data_received..................: 31 GB   260 MB/s
     data_sent......................: 428 MB  3.6 MB/s
     http_req_blocked...............: avg=2.62µs  min=871ns   med=1.87µs  max=18.26ms  p(90)=2.96µs  p(95)=3.48µs   p(99.9)=26.8µs 
     http_req_connecting............: avg=233ns   min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.63ms min=1.44ms  med=15.97ms max=269.9ms  p(90)=24.49ms p(95)=27.52ms  p(99.9)=46.93ms
       { expected_response:true }...: avg=16.63ms min=1.44ms  med=15.97ms max=269.9ms  p(90)=24.49ms p(95)=27.52ms  p(99.9)=46.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 356368
     http_req_receiving.............: avg=84.3µs  min=26.36µs med=44.89µs max=138.25ms p(90)=78.11µs p(95)=126.94µs p(99.9)=6.96ms 
     http_req_sending...............: avg=42.38µs min=4.52µs  med=7.98µs  max=150.99ms p(90)=13.46µs p(95)=80.6µs   p(99.9)=4.69ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.5ms  min=1.39ms  med=15.87ms max=269.31ms p(90)=24.33ms p(95)=27.31ms  p(99.9)=46.02ms
     http_reqs......................: 356368  2965.194675/s
     iteration_duration.............: avg=16.83ms min=1.77ms  med=16.16ms max=303.21ms p(90)=24.69ms p(95)=27.73ms  p(99.9)=47.63ms
     iterations.....................: 356268  2964.362615/s
     success_rate...................: 100.00% ✓ 356268      ✗ 0     
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

     checks.........................: 100.00% ✓ 935145      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=2.69µs   min=822ns   med=1.93µs  max=14.4ms   p(90)=3.21µs  p(95)=3.83µs  p(99.9)=28.76µs 
     http_req_connecting............: avg=301ns    min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.02ms  min=2.02ms  med=16.35ms max=302.07ms p(90)=30.93ms p(95)=37.52ms p(99.9)=116.4ms 
       { expected_response:true }...: avg=19.02ms  min=2.02ms  med=16.35ms max=302.07ms p(90)=30.93ms p(95)=37.52ms p(99.9)=116.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 311815
     http_req_receiving.............: avg=547.54µs min=50.24µs med=90.88µs max=179.97ms p(90)=1.04ms  p(95)=1.86ms  p(99.9)=24.57ms 
     http_req_sending...............: avg=42.67µs  min=4.41µs  med=8.26µs  max=168.47ms p(90)=15.02µs p(95)=83.82µs p(99.9)=3.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.43ms  min=1.89ms  med=15.84ms max=301.43ms p(90)=30.02ms p(95)=36.44ms p(99.9)=114.2ms 
     http_reqs......................: 311815  2593.001995/s
     iteration_duration.............: avg=19.23ms  min=3.06ms  med=16.54ms max=312.07ms p(90)=31.15ms p(95)=37.76ms p(99.9)=118.21ms
     iterations.....................: 311715  2592.170411/s
     success_rate...................: 100.00% ✓ 311715      ✗ 0     
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

     checks.........................: 100.00% ✓ 761313      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.18µs  min=982ns   med=2.53µs  max=6.01ms   p(90)=3.98µs  p(95)=4.68µs   p(99.9)=38.31µs
     http_req_connecting............: avg=272ns   min=0s      med=0s      max=3.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.41ms min=1.72ms  med=23.18ms max=289.9ms  p(90)=27.76ms p(95)=29.48ms  p(99.9)=49.33ms
       { expected_response:true }...: avg=23.41ms min=1.72ms  med=23.18ms max=289.9ms  p(90)=27.76ms p(95)=29.48ms  p(99.9)=49.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253871
     http_req_receiving.............: avg=87.35µs min=28.26µs med=57.77µs max=62.07ms  p(90)=94.95µs p(95)=119.79µs p(99.9)=5.04ms 
     http_req_sending...............: avg=36.17µs min=4.9µs   med=10.25µs max=121.52ms p(90)=17.07µs p(95)=25.21µs  p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.29ms min=1.67ms  med=23.08ms max=289.09ms p(90)=27.63ms p(95)=29.32ms  p(99.9)=48.17ms
     http_reqs......................: 253871  2111.678223/s
     iteration_duration.............: avg=23.63ms min=3.97ms  med=23.38ms max=302.76ms p(90)=27.97ms p(95)=29.69ms  p(99.9)=50ms   
     iterations.....................: 253771  2110.846431/s
     success_rate...................: 100.00% ✓ 253771      ✗ 0     
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

     checks.........................: 100.00% ✓ 460548      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.44µs  min=1.02µs  med=2.52µs  max=3.92ms   p(90)=3.9µs   p(95)=4.51µs   p(99.9)=32.33µs 
     http_req_connecting............: avg=623ns   min=0s      med=0s      max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.84ms min=2.04ms  med=38.47ms max=297.62ms p(90)=54.25ms p(95)=59.04ms  p(99.9)=81.92ms 
       { expected_response:true }...: avg=38.84ms min=2.04ms  med=38.47ms max=297.62ms p(90)=54.25ms p(95)=59.04ms  p(99.9)=81.92ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153616
     http_req_receiving.............: avg=74.31µs min=26.43µs med=59.98µs max=168.25ms p(90)=94.67µs p(95)=110.78µs p(99.9)=916.35µs
     http_req_sending...............: avg=26.26µs min=4.88µs  med=10.41µs max=197.48ms p(90)=15.66µs p(95)=19.36µs  p(99.9)=984.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.74ms min=1.97ms  med=38.37ms max=297.28ms p(90)=54.15ms p(95)=58.94ms  p(99.9)=81.56ms 
     http_reqs......................: 153616  1277.254992/s
     iteration_duration.............: avg=39.07ms min=3.75ms  med=38.67ms max=308.47ms p(90)=54.45ms p(95)=59.24ms  p(99.9)=82.23ms 
     iterations.....................: 153516  1276.423532/s
     success_rate...................: 100.00% ✓ 153516      ✗ 0     
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

     checks.........................: 100.00% ✓ 224415     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   747 kB/s
     http_req_blocked...............: avg=4.51µs   min=1.11µs  med=3.02µs  max=4.15ms   p(90)=4.59µs   p(95)=5.27µs   p(99.9)=44.37µs 
     http_req_connecting............: avg=1.21µs   min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.88ms  min=3.65ms  med=78.09ms max=334.93ms p(90)=97.52ms  p(95)=106.28ms p(99.9)=188.4ms 
       { expected_response:true }...: avg=79.88ms  min=3.65ms  med=78.09ms max=334.93ms p(90)=97.52ms  p(95)=106.28ms p(99.9)=188.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 74905
     http_req_receiving.............: avg=135.05µs min=29.06µs med=69.28µs max=231.37ms p(90)=106.04µs p(95)=119.06µs p(99.9)=722.53µs
     http_req_sending...............: avg=22.02µs  min=5.39µs  med=13.99µs max=96.12ms  p(90)=21.07µs  p(95)=23.37µs  p(99.9)=636.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.72ms  min=3.58ms  med=78ms    max=217.22ms p(90)=97.4ms   p(95)=106.03ms p(99.9)=184.92ms
     http_reqs......................: 74905   621.677094/s
     iteration_duration.............: avg=80.21ms  min=8.81ms  med=78.33ms max=344.54ms p(90)=97.77ms  p(95)=106.53ms p(99.9)=189.65ms
     iterations.....................: 74805   620.84714/s
     success_rate...................: 100.00% ✓ 74805      ✗ 0    
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

     checks.........................: 100.00% ✓ 175068     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   582 kB/s
     http_req_blocked...............: avg=4.61µs   min=982ns   med=2.96µs   max=3.44ms   p(90)=4.39µs   p(95)=4.93µs   p(99.9)=50.24µs 
     http_req_connecting............: avg=1.46µs   min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.41ms min=4.63ms  med=102.15ms max=298.54ms p(90)=123.41ms p(95)=129.53ms p(99.9)=159.8ms 
       { expected_response:true }...: avg=102.41ms min=4.63ms  med=102.15ms max=298.54ms p(90)=123.41ms p(95)=129.53ms p(99.9)=159.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 58456
     http_req_receiving.............: avg=82.73µs  min=28.18µs med=74.48µs  max=117.55ms p(90)=105.3µs  p(95)=118.43µs p(99.9)=566.57µs
     http_req_sending...............: avg=32.84µs  min=4.97µs  med=15.61µs  max=187.34ms p(90)=21.12µs  p(95)=22.92µs  p(99.9)=553.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.29ms min=4.55ms  med=102.05ms max=297.98ms p(90)=123.3ms  p(95)=129.41ms p(99.9)=158.43ms
     http_reqs......................: 58456   484.809355/s
     iteration_duration.............: avg=102.83ms min=27.88ms med=102.41ms max=323.96ms p(90)=123.67ms p(95)=129.78ms p(99.9)=160.67ms
     iterations.....................: 58356   483.979997/s
     success_rate...................: 100.00% ✓ 58356      ✗ 0    
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

     checks.........................: 100.00% ✓ 102198     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=6.12µs   min=1.04µs  med=3.17µs   max=4.15ms   p(90)=4.58µs   p(95)=5.14µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=175.42ms min=5.53ms  med=160.45ms max=697.11ms p(90)=201.5ms  p(95)=246.07ms p(99.9)=542.51ms
       { expected_response:true }...: avg=175.42ms min=5.53ms  med=160.45ms max=697.11ms p(90)=201.5ms  p(95)=246.07ms p(99.9)=542.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34166
     http_req_receiving.............: avg=94.99µs  min=31.71µs med=90.32µs  max=99.79ms  p(90)=119.84µs p(95)=131.72µs p(99.9)=682.29µs
     http_req_sending...............: avg=35.04µs  min=5.46µs  med=17.65µs  max=103.79ms p(90)=22.05µs  p(95)=23.76µs  p(99.9)=622.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.29ms min=5.44ms  med=160.34ms max=697.02ms p(90)=201.29ms p(95)=245.84ms p(99.9)=542.43ms
     http_reqs......................: 34166   282.848293/s
     iteration_duration.............: avg=176.22ms min=41.79ms med=160.79ms max=697.31ms p(90)=201.9ms  p(95)=247.1ms  p(99.9)=542.75ms
     iterations.....................: 34066   282.020428/s
     success_rate...................: 100.00% ✓ 34066      ✗ 0    
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

     checks.........................: 100.00% ✓ 100671     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=5.64µs   min=1.02µs  med=2.9µs    max=3.96ms   p(90)=4.12µs   p(95)=4.61µs   p(99.9)=1.11ms  
     http_req_connecting............: avg=2.59µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=178.08ms min=7.56ms  med=179.68ms max=387.19ms p(90)=197.55ms p(95)=202.63ms p(99.9)=265.76ms
       { expected_response:true }...: avg=178.08ms min=7.56ms  med=179.68ms max=387.19ms p(90)=197.55ms p(95)=202.63ms p(99.9)=265.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33657
     http_req_receiving.............: avg=84.21µs  min=29.98µs med=78µs     max=76.97ms  p(90)=107.97µs p(95)=119µs    p(99.9)=433.62µs
     http_req_sending...............: avg=24.01µs  min=5.11µs  med=15.14µs  max=69.94ms  p(90)=19.5µs   p(95)=21.15µs  p(99.9)=499.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.97ms min=7.43ms  med=179.57ms max=387.1ms  p(90)=197.45ms p(95)=202.52ms p(99.9)=265.49ms
     http_reqs......................: 33657   278.338577/s
     iteration_duration.............: avg=178.87ms min=45.49ms med=180ms    max=398.63ms p(90)=197.81ms p(95)=202.89ms p(99.9)=272.05ms
     iterations.....................: 33557   277.511592/s
     success_rate...................: 100.00% ✓ 33557      ✗ 0    
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
data_received..................: 6.4 MB 107 kB/s
     data_sent......................: 82 kB  1.4 kB/s
     http_req_blocked...............: avg=5.97µs   min=2.65µs  med=3.42µs   max=154.67µs p(90)=4.81µs   p(95)=5.32µs   p(99.9)=145.05µs
     http_req_connecting............: avg=1.3µs    min=0s      med=0s       max=87.45µs  p(90)=0s       p(95)=0s       p(99.9)=81.68µs 
     http_req_duration..............: avg=489.13ms min=24.61ms med=42.49ms  max=30.01s   p(90)=48.54ms  p(95)=49.88ms  p(99.9)=28.03s  
       { expected_response:true }...: avg=489.13ms min=24.61ms med=42.49ms  max=30.01s   p(90)=48.54ms  p(95)=49.88ms  p(99.9)=28.03s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 67  
     http_req_receiving.............: avg=134.98µs min=72.7µs  med=129.42µs max=370.48µs p(90)=182.14µs p(95)=202.67µs p(99.9)=369.63µs
     http_req_sending...............: avg=23.14µs  min=14.29µs med=18.2µs   max=258.08µs p(90)=21.68µs  p(95)=29.19µs  p(99.9)=244.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=488.97ms min=24.45ms med=42.28ms  max=30.01s   p(90)=48.39ms  p(95)=49.55ms  p(99.9)=28.03s  
     http_reqs......................: 67     1.116661/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
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

     checks.........................: 100.00% ✓ 927171      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=2.96µs  min=932ns   med=2.19µs  max=11.04ms  p(90)=3.75µs  p(95)=4.53µs   p(99.9)=35.72µs
     http_req_connecting............: avg=305ns   min=0s      med=0s      max=3.92ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.19ms min=1.55ms  med=18.89ms max=289.04ms p(90)=26.5ms  p(95)=28.88ms  p(99.9)=48.31ms
       { expected_response:true }...: avg=19.19ms min=1.55ms  med=18.89ms max=289.04ms p(90)=26.5ms  p(95)=28.88ms  p(99.9)=48.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309157
     http_req_receiving.............: avg=84.97µs min=26.49µs med=49.87µs max=144.22ms p(90)=90.42µs p(95)=127.06µs p(99.9)=5.84ms 
     http_req_sending...............: avg=43.49µs min=4.74µs  med=9.41µs  max=105.55ms p(90)=16.98µs p(95)=75.35µs  p(99.9)=3.9ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.06ms min=1.5ms   med=18.78ms max=288.88ms p(90)=26.36ms p(95)=28.7ms   p(99.9)=47.17ms
     http_reqs......................: 309157  2572.108053/s
     iteration_duration.............: avg=19.4ms  min=2.83ms  med=19.09ms max=307.67ms p(90)=26.71ms p(95)=29.09ms  p(99.9)=48.84ms
     iterations.....................: 309057  2571.276078/s
     success_rate...................: 100.00% ✓ 309057      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 861927      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=3.21µs   min=932ns   med=2.41µs  max=13.56ms  p(90)=3.88µs  p(95)=4.53µs  p(99.9)=33.72µs 
     http_req_connecting............: avg=290ns    min=0s      med=0s      max=3.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.65ms  min=1.58ms  med=17.22ms max=340.72ms p(90)=33.93ms p(95)=41.74ms p(99.9)=148.07ms
       { expected_response:true }...: avg=20.65ms  min=1.58ms  med=17.22ms max=340.72ms p(90)=33.93ms p(95)=41.74ms p(99.9)=148.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287409
     http_req_receiving.............: avg=612.34µs min=52.01µs med=99.74µs max=258.11ms p(90)=1.14ms  p(95)=1.97ms  p(99.9)=28.2ms  
     http_req_sending...............: avg=44.07µs  min=4.86µs  med=9.35µs  max=137.72ms p(90)=16.51µs p(95)=84.92µs p(99.9)=4.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20ms     min=1.5ms   med=16.67ms max=340.65ms p(90)=32.88ms p(95)=40.53ms p(99.9)=146.75ms
     http_reqs......................: 287409  2390.951737/s
     iteration_duration.............: avg=20.87ms  min=2.69ms  med=17.43ms max=340.88ms p(90)=34.15ms p(95)=41.98ms p(99.9)=148.76ms
     iterations.....................: 287309  2390.119839/s
     success_rate...................: 100.00% ✓ 287309      ✗ 0     
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

     checks.........................: 100.00% ✓ 590094      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=4.1µs    min=1.06µs  med=3.01µs  max=4.59ms   p(90)=5.34µs   p(95)=6.42µs   p(99.9)=48.98µs
     http_req_connecting............: avg=471ns    min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.23ms  min=2.22ms  med=29.78ms max=327.46ms p(90)=40.3ms   p(95)=43.77ms  p(99.9)=67.65ms
       { expected_response:true }...: avg=30.23ms  min=2.22ms  med=29.78ms max=327.46ms p(90)=40.3ms   p(95)=43.77ms  p(99.9)=67.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196798
     http_req_receiving.............: avg=109.73µs min=27.64µs med=60.29µs max=175.1ms  p(90)=135.86µs p(95)=236.47µs p(99.9)=5.94ms 
     http_req_sending...............: avg=47.16µs  min=4.91µs  med=11.11µs max=176.29ms p(90)=26.07µs  p(95)=124.26µs p(99.9)=3.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.07ms  min=2.12ms  med=29.65ms max=306.78ms p(90)=40.12ms  p(95)=43.56ms  p(99.9)=67.19ms
     http_reqs......................: 196798  1636.10872/s
     iteration_duration.............: avg=30.49ms  min=3.6ms   med=30.02ms max=336.52ms p(90)=40.53ms  p(95)=44.01ms  p(99.9)=68.24ms
     iterations.....................: 196698  1635.277356/s
     success_rate...................: 100.00% ✓ 196698      ✗ 0     
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

     checks.........................: 100.00% ✓ 442755      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=5.15µs  min=1.24µs  med=3.19µs  max=116.54ms p(90)=4.88µs   p(95)=5.62µs   p(99.9)=40µs    
     http_req_connecting............: avg=1.65µs  min=0s      med=0s      max=116.46ms p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.38ms min=2.16ms  med=40.01ms max=292.18ms p(90)=56.03ms  p(95)=60.81ms  p(99.9)=83.33ms 
       { expected_response:true }...: avg=40.38ms min=2.16ms  med=40.01ms max=292.18ms p(90)=56.03ms  p(95)=60.81ms  p(99.9)=83.33ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147685
     http_req_receiving.............: avg=83.08µs min=27.97µs med=70.63µs max=54.35ms  p(90)=109.27µs p(95)=125.89µs p(99.9)=903.26µs
     http_req_sending...............: avg=27.6µs  min=5.33µs  med=12.88µs max=160.57ms p(90)=19.71µs  p(95)=23.76µs  p(99.9)=1.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.27ms min=2ms     med=39.9ms  max=277.13ms p(90)=55.92ms  p(95)=60.69ms  p(99.9)=83.09ms 
     http_reqs......................: 147685  1227.829827/s
     iteration_duration.............: avg=40.64ms min=4.03ms  med=40.24ms max=302.96ms p(90)=56.25ms  p(95)=61.04ms  p(99.9)=84.11ms 
     iterations.....................: 147585  1226.998442/s
     success_rate...................: 100.00% ✓ 147585      ✗ 0     
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

     checks.........................: 100.00% ✓ 205875     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   685 kB/s
     http_req_blocked...............: avg=4.59µs  min=1.16µs  med=3.07µs  max=3.55ms   p(90)=4.55µs   p(95)=5.18µs   p(99.9)=44.32µs 
     http_req_connecting............: avg=1.27µs  min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.08ms min=3.91ms  med=84.17ms max=319.82ms p(90)=110.14ms p(95)=122.48ms p(99.9)=204.13ms
       { expected_response:true }...: avg=87.08ms min=3.91ms  med=84.17ms max=319.82ms p(90)=110.14ms p(95)=122.48ms p(99.9)=204.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68725
     http_req_receiving.............: avg=89.78µs min=30.13µs med=74.64µs max=228.68ms p(90)=110.69µs p(95)=123.85µs p(99.9)=610.95µs
     http_req_sending...............: avg=26.46µs min=5.01µs  med=14.36µs max=96.77ms  p(90)=20.94µs  p(95)=23.16µs  p(99.9)=601.85µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.97ms min=3.84ms  med=84.07ms max=318.86ms p(90)=110.03ms p(95)=122.32ms p(99.9)=203.15ms
     http_reqs......................: 68725   570.13031/s
     iteration_duration.............: avg=87.44ms min=35.43ms med=84.42ms max=350.55ms p(90)=110.38ms p(95)=122.78ms p(99.9)=205.47ms
     iterations.....................: 68625   569.300728/s
     success_rate...................: 100.00% ✓ 68625      ✗ 0    
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

     checks.........................: 100.00% ✓ 159417     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   530 kB/s
     http_req_blocked...............: avg=4.68µs   min=1.35µs  med=3.66µs   max=2.96ms   p(90)=5.13µs   p(95)=5.73µs   p(99.9)=107.2µs 
     http_req_connecting............: avg=768ns    min=0s      med=0s       max=2.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.45ms min=5.18ms  med=110.15ms max=325.63ms p(90)=149.02ms p(95)=160.65ms p(99.9)=207.06ms
       { expected_response:true }...: avg=112.45ms min=5.18ms  med=110.15ms max=325.63ms p(90)=149.02ms p(95)=160.65ms p(99.9)=207.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53239
     http_req_receiving.............: avg=92.17µs  min=30.53µs med=83.67µs  max=195.46ms p(90)=114.72µs p(95)=126.81µs p(99.9)=595.6µs 
     http_req_sending...............: avg=24.9µs   min=5.79µs  med=17.65µs  max=61.29ms  p(90)=22.99µs  p(95)=24.99µs  p(99.9)=562.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.33ms min=5.04ms  med=110.05ms max=325.24ms p(90)=148.88ms p(95)=160.51ms p(99.9)=206.82ms
     http_reqs......................: 53239   441.277156/s
     iteration_duration.............: avg=112.93ms min=16.36ms med=110.46ms max=344.42ms p(90)=149.32ms p(95)=160.93ms p(99.9)=209.95ms
     iterations.....................: 53139   440.448295/s
     success_rate...................: 100.00% ✓ 53139      ✗ 0    
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

     checks.........................: 100.00% ✓ 98001      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=7.19µs   min=1.5µs   med=3.84µs   max=3.79ms   p(90)=5.42µs   p(95)=6.08µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=3.03µs   min=0s      med=0s       max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=182.93ms min=5.8ms   med=170.11ms max=671.17ms p(90)=217.1ms  p(95)=262.3ms  p(99.9)=547.31ms
       { expected_response:true }...: avg=182.93ms min=5.8ms   med=170.11ms max=671.17ms p(90)=217.1ms  p(95)=262.3ms  p(99.9)=547.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32767
     http_req_receiving.............: avg=99.22µs  min=38.28µs med=93.74µs  max=9.08ms   p(90)=125.96µs p(95)=140.16µs p(99.9)=787.45µs
     http_req_sending...............: avg=33.46µs  min=6.48µs  med=19.11µs  max=135.9ms  p(90)=24.02µs  p(95)=25.95µs  p(99.9)=550.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.8ms  min=5.71ms  med=169.98ms max=671.08ms p(90)=216.92ms p(95)=262.16ms p(99.9)=547.19ms
     http_reqs......................: 32767   270.880435/s
     iteration_duration.............: avg=183.78ms min=52.71ms med=170.49ms max=671.36ms p(90)=217.56ms p(95)=263.74ms p(99.9)=547.73ms
     iterations.....................: 32667   270.053749/s
     success_rate...................: 100.00% ✓ 32667      ✗ 0    
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

     checks.........................: 100.00% ✓ 97335      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=7.19µs   min=1.41µs  med=3.77µs   max=4.14ms   p(90)=5.24µs   p(95)=5.85µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=3.15µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=184.14ms min=7.9ms   med=182.34ms max=372.83ms p(90)=228.29ms p(95)=234.11ms p(99.9)=303.72ms
       { expected_response:true }...: avg=184.14ms min=7.9ms   med=182.34ms max=372.83ms p(90)=228.29ms p(95)=234.11ms p(99.9)=303.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32545
     http_req_receiving.............: avg=95.91µs  min=35.82µs med=91.61µs  max=10.28ms  p(90)=122.75µs p(95)=135.93µs p(99.9)=583.84µs
     http_req_sending...............: avg=29.02µs  min=6.86µs  med=18.55µs  max=77.35ms  p(90)=23.53µs  p(95)=25.6µs   p(99.9)=481.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.01ms min=7.79ms  med=182.22ms max=372.51ms p(90)=228.18ms p(95)=233.98ms p(99.9)=303.6ms 
     http_reqs......................: 32545   269.010793/s
     iteration_duration.............: avg=185ms    min=26.15ms med=184.25ms max=381.96ms p(90)=228.61ms p(95)=234.4ms  p(99.9)=305.56ms
     iterations.....................: 32445   268.184212/s
     success_rate...................: 100.00% ✓ 32445      ✗ 0    
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

     checks.........................: 100.00% ✓ 7422      ✗ 0   
     data_received..................: 246 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=104.68µs min=1.39µs   med=3.78µs  max=9.75ms  p(90)=5.46µs   p(95)=6.14µs   p(99.9)=8.74ms 
     http_req_connecting............: avg=99.26µs  min=0s       med=0s      max=9.71ms  p(90)=0s       p(95)=0s       p(99.9)=8.71ms 
     http_req_duration..............: avg=2.34s    min=27.12ms  med=2.41s   max=4.64s   p(90)=3.18s    p(95)=3.41s    p(99.9)=4.38s  
       { expected_response:true }...: avg=2.34s    min=27.12ms  med=2.41s   max=4.64s   p(90)=3.18s    p(95)=3.41s    p(99.9)=4.38s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2574
     http_req_receiving.............: avg=98.88µs  min=40µs     med=93.28µs max=1.91ms  p(90)=135.55µs p(95)=154.78µs p(99.9)=362.2µs
     http_req_sending...............: avg=69.16µs  min=7.37µs   med=19.71µs max=18.81ms p(90)=25.83µs  p(95)=30.42µs  p(99.9)=3.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.34s    min=26.97ms  med=2.41s   max=4.64s   p(90)=3.18s    p(95)=3.41s    p(99.9)=4.38s  
     http_reqs......................: 2574    20.508493/s
     iteration_duration.............: avg=2.44s    min=458.31ms med=2.44s   max=4.64s   p(90)=3.19s    p(95)=3.42s    p(99.9)=4.38s  
     iterations.....................: 2474    19.711737/s
     success_rate...................: 100.00% ✓ 2474      ✗ 0   
     vus............................: 44      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

