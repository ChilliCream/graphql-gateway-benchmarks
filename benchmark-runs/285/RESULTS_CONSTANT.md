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
| hive-router | v0.0.78 | 2,974 | 3,188 | 2,912 | 3.0% |  |
| fusion | 16.5.0 | 2,562 | 2,682 | 2,553 | 1.8% |  |
| grafbase | 0.53.5 | 2,165 | 2,277 | 2,150 | 2.1% |  |
| cosmo | 0.329.0 | 1,260 | 1,307 | 1,246 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.2 | 612 | 632 | 609 | 1.4% |  |
| apollo-router | v2.16.0 | 486 | 495 | 470 | 1.4% |  |
| hive-gateway | 2.10.2 | 282 | 288 | 280 | 0.9% |  |
| apollo-gateway | 2.14.2 | 278 | 281 | 276 | 0.6% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1207 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,614 | 2,793 | 2,595 | 2.5% |  |
| fusion | 16.5.0 | 2,355 | 2,461 | 2,327 | 1.8% |  |
| grafbase | 0.53.5 | 1,661 | 1,716 | 1,657 | 1.3% |  |
| cosmo | 0.329.0 | 1,171 | 1,211 | 1,159 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 567 | 588 | 562 | 1.5% |  |
| apollo-router | v2.16.0 | 448 | 467 | 439 | 2.1% |  |
| apollo-gateway | 2.14.2 | 272 | 276 | 272 | 0.5% |  |
| hive-gateway | 2.10.2 | 261 | 268 | 260 | 1.2% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1072176     ✗ 0     
     data_received..................: 31 GB   261 MB/s
     data_sent......................: 430 MB  3.6 MB/s
     http_req_blocked...............: avg=2.88µs  min=852ns   med=2.13µs  max=17.26ms  p(90)=3.47µs  p(95)=4.07µs   p(99.9)=32.57µs
     http_req_connecting............: avg=235ns   min=0s      med=0s      max=3.35ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.57ms min=1.43ms  med=15.88ms max=282.15ms p(90)=24.35ms p(95)=27.46ms  p(99.9)=46.79ms
       { expected_response:true }...: avg=16.57ms min=1.43ms  med=15.88ms max=282.15ms p(90)=24.35ms p(95)=27.46ms  p(99.9)=46.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 357492
     http_req_receiving.............: avg=88.1µs  min=21.95µs med=45.33µs max=123.9ms  p(90)=82.95µs p(95)=153.45µs p(99.9)=7.33ms 
     http_req_sending...............: avg=44.93µs min=4.65µs  med=8.4µs   max=128.79ms p(90)=14.86µs p(95)=94.02µs  p(99.9)=4.65ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.44ms min=1.37ms  med=15.77ms max=281.59ms p(90)=24.18ms p(95)=27.24ms  p(99.9)=45.64ms
     http_reqs......................: 357492  2974.558836/s
     iteration_duration.............: avg=16.77ms min=1.9ms   med=16.07ms max=292.71ms p(90)=24.56ms p(95)=27.68ms  p(99.9)=47.44ms
     iterations.....................: 357392  2973.726773/s
     success_rate...................: 100.00% ✓ 357392      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 924189      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=2.58µs   min=881ns   med=1.84µs  max=6.66ms   p(90)=3µs     p(95)=3.57µs  p(99.9)=30.32µs 
     http_req_connecting............: avg=310ns    min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.26ms  min=2.05ms  med=16.61ms max=388.46ms p(90)=31.15ms p(95)=37.66ms p(99.9)=123.11ms
       { expected_response:true }...: avg=19.26ms  min=2.05ms  med=16.61ms max=388.46ms p(90)=31.15ms p(95)=37.66ms p(99.9)=123.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 308163
     http_req_receiving.............: avg=550.71µs min=49.08µs med=87.9µs  max=181.01ms p(90)=1.03ms  p(95)=1.83ms  p(99.9)=24.73ms 
     http_req_sending...............: avg=41.75µs  min=4.45µs  med=7.99µs  max=259.7ms  p(90)=13.89µs p(95)=73.08µs p(99.9)=3.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.67ms  min=1.92ms  med=16.09ms max=388.38ms p(90)=30.23ms p(95)=36.61ms p(99.9)=120.68ms
     http_reqs......................: 308163  2562.813398/s
     iteration_duration.............: avg=19.46ms  min=3.07ms  med=16.8ms  max=388.59ms p(90)=31.36ms p(95)=37.9ms  p(99.9)=124.55ms
     iterations.....................: 308063  2561.981756/s
     success_rate...................: 100.00% ✓ 308063      ✗ 0     
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

     checks.........................: 100.00% ✓ 780609      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=4.36µs  min=1.04µs  med=2.67µs  max=18.52ms  p(90)=4.25µs  p(95)=5.04µs   p(99.9)=40.74µs
     http_req_connecting............: avg=1µs     min=0s      med=0s      max=9.21ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.82ms min=1.7ms   med=22.58ms max=293.68ms p(90)=27.24ms p(95)=29.21ms  p(99.9)=50.05ms
       { expected_response:true }...: avg=22.82ms min=1.7ms   med=22.58ms max=293.68ms p(90)=27.24ms p(95)=29.21ms  p(99.9)=50.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260303
     http_req_receiving.............: avg=94.41µs min=27.75µs med=57.03µs max=62.88ms  p(90)=98.45µs p(95)=130.46µs p(99.9)=7.13ms 
     http_req_sending...............: avg=40.02µs min=4.99µs  med=10.92µs max=110.99ms p(90)=18.08µs p(95)=36µs     p(99.9)=2.51ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.68ms min=1.63ms  med=22.47ms max=293.18ms p(90)=27.1ms  p(95)=29ms     p(99.9)=48.68ms
     http_reqs......................: 260303  2165.230936/s
     iteration_duration.............: avg=23.04ms min=2.96ms  med=22.78ms max=310.59ms p(90)=27.45ms p(95)=29.44ms  p(99.9)=50.55ms
     iterations.....................: 260203  2164.399124/s
     success_rate...................: 100.00% ✓ 260203      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 454575      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 182 MB  1.5 MB/s
     http_req_blocked...............: avg=3.42µs  min=1.13µs  med=2.52µs  max=3.59ms   p(90)=3.91µs  p(95)=4.5µs   p(99.9)=32.58µs 
     http_req_connecting............: avg=603ns   min=0s      med=0s      max=3.55ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=39.36ms min=2.06ms  med=38.96ms max=291.14ms p(90)=55.1ms  p(95)=59.96ms p(99.9)=83.3ms  
       { expected_response:true }...: avg=39.36ms min=2.06ms  med=38.96ms max=291.14ms p(90)=55.1ms  p(95)=59.96ms p(99.9)=83.3ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 151625
     http_req_receiving.............: avg=71.06µs min=26.06µs med=58.06µs max=54.94ms  p(90)=91.31µs p(95)=106µs   p(99.9)=815.95µs
     http_req_sending...............: avg=21.71µs min=5.13µs  med=10.27µs max=71.32ms  p(90)=15.39µs p(95)=18.95µs p(99.9)=874.72µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=39.27ms min=2ms     med=38.87ms max=290.46ms p(90)=55.01ms p(95)=59.84ms p(99.9)=82.98ms 
     http_reqs......................: 151625  1260.530389/s
     iteration_duration.............: avg=39.59ms min=3.27ms  med=39.16ms max=308.94ms p(90)=55.29ms p(95)=60.16ms p(99.9)=83.82ms 
     iterations.....................: 151525  1259.699041/s
     success_rate...................: 100.00% ✓ 151525      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 220902     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   735 kB/s
     http_req_blocked...............: avg=3.95µs  min=971ns  med=2.39µs  max=3.85ms   p(90)=3.95µs   p(95)=4.55µs   p(99.9)=39.25µs 
     http_req_connecting............: avg=1.25µs  min=0s     med=0s      max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.16ms min=3.62ms med=79.27ms max=316.24ms p(90)=99.35ms  p(95)=108.87ms p(99.9)=194.05ms
       { expected_response:true }...: avg=81.16ms min=3.62ms med=79.27ms max=316.24ms p(90)=99.35ms  p(95)=108.87ms p(99.9)=194.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73734
     http_req_receiving.............: avg=74.11µs min=27.4µs med=64.99µs max=37.2ms   p(90)=100.13µs p(95)=113.62µs p(99.9)=630.66µs
     http_req_sending...............: avg=22.56µs min=5.06µs med=11.9µs  max=93.56ms  p(90)=18.7µs   p(95)=20.71µs  p(99.9)=578.74µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.06ms min=3.54ms med=79.18ms max=316.06ms p(90)=99.26ms  p(95)=108.75ms p(99.9)=193.94ms
     http_reqs......................: 73734   612.048266/s
     iteration_duration.............: avg=81.49ms min=14.8ms med=79.5ms  max=327.37ms p(90)=99.6ms   p(95)=109.11ms p(99.9)=194.98ms
     iterations.....................: 73634   611.21819/s
     success_rate...................: 100.00% ✓ 73634      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 175743     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 71 MB   584 kB/s
     http_req_blocked...............: avg=4.49µs   min=1.02µs  med=2.94µs   max=3.72ms   p(90)=4.39µs   p(95)=4.93µs   p(99.9)=80.27µs 
     http_req_connecting............: avg=1.36µs   min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.02ms min=4.69ms  med=101.72ms max=295.12ms p(90)=123.05ms p(95)=129.28ms p(99.9)=158.24ms
       { expected_response:true }...: avg=102.02ms min=4.69ms  med=101.72ms max=295.12ms p(90)=123.05ms p(95)=129.28ms p(99.9)=158.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58681
     http_req_receiving.............: avg=78.68µs  min=27.19µs med=72.62µs  max=62.27ms  p(90)=104.58µs p(95)=118.16µs p(99.9)=594.16µs
     http_req_sending...............: avg=23.13µs  min=4.9µs   med=13.85µs  max=121.03ms p(90)=19.95µs  p(95)=21.77µs  p(99.9)=504.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.92ms min=4.54ms  med=101.62ms max=294.74ms p(90)=122.93ms p(95)=129.17ms p(99.9)=157.81ms
     http_reqs......................: 58681   486.639292/s
     iteration_duration.............: avg=102.44ms min=27.15ms med=101.99ms max=312.43ms p(90)=123.29ms p(95)=129.55ms p(99.9)=159ms   
     iterations.....................: 58581   485.809995/s
     success_rate...................: 100.00% ✓ 58581      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 102252     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=6.85µs   min=1.24µs  med=3.66µs   max=3.64ms   p(90)=5.15µs   p(95)=5.78µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=2.88µs   min=0s      med=0s       max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=175.35ms min=5.96ms  med=160.22ms max=688.72ms p(90)=201.96ms p(95)=232.73ms p(99.9)=580.81ms
       { expected_response:true }...: avg=175.35ms min=5.96ms  med=160.22ms max=688.72ms p(90)=201.96ms p(95)=232.73ms p(99.9)=580.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34184
     http_req_receiving.............: avg=113.52µs min=35.18µs med=89.64µs  max=157.71ms p(90)=121.37µs p(95)=134.02µs p(99.9)=786.74µs
     http_req_sending...............: avg=30.81µs  min=7.01µs  med=18.66µs  max=73.21ms  p(90)=23.74µs  p(95)=25.56µs  p(99.9)=560.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.2ms  min=5.85ms  med=160.1ms  max=688.6ms  p(90)=201.8ms  p(95)=232.47ms p(99.9)=580.68ms
     http_reqs......................: 34184   282.611389/s
     iteration_duration.............: avg=176.13ms min=30.54ms med=160.56ms max=688.92ms p(90)=202.35ms p(95)=233.75ms p(99.9)=581.1ms 
     iterations.....................: 34084   281.784653/s
     success_rate...................: 100.00% ✓ 34084      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100584     ✗ 0    
     data_received..................: 3.0 GB  24 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=5.44µs   min=1.13µs  med=2.92µs   max=3.31ms   p(90)=4.17µs   p(95)=4.67µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=3.28ms   p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=178.29ms min=7.37ms  med=176.85ms max=317.73ms p(90)=188.12ms p(95)=193.65ms p(99.9)=257.18ms
       { expected_response:true }...: avg=178.29ms min=7.37ms  med=176.85ms max=317.73ms p(90)=188.12ms p(95)=193.65ms p(99.9)=257.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33628
     http_req_receiving.............: avg=84.66µs  min=32.09µs med=81.16µs  max=12.4ms   p(90)=112.04µs p(95)=123.42µs p(99.9)=435.93µs
     http_req_sending...............: avg=20.24µs  min=5.1µs   med=15.51µs  max=34.61ms  p(90)=20µs     p(95)=21.65µs  p(99.9)=567.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.18ms min=7.27ms  med=176.73ms max=317.57ms p(90)=188.02ms p(95)=193.54ms p(99.9)=257.06ms
     http_reqs......................: 33628   278.050037/s
     iteration_duration.............: avg=179.06ms min=39.41ms med=177.15ms max=324.12ms p(90)=188.38ms p(95)=193.96ms p(99.9)=258.76ms
     iterations.....................: 33528   277.223197/s
     success_rate...................: 100.00% ✓ 33528      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 942675      ✗ 0     
     data_received..................: 28 GB   229 MB/s
     data_sent......................: 378 MB  3.1 MB/s
     http_req_blocked...............: avg=2.89µs  min=861ns  med=2.1µs   max=15.6ms   p(90)=3.69µs  p(95)=4.49µs   p(99.9)=35.52µs
     http_req_connecting............: avg=279ns   min=0s     med=0s      max=3.38ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=18.87ms min=1.74ms med=18.43ms max=289.18ms p(90)=26.22ms p(95)=28.84ms  p(99.9)=48.64ms
       { expected_response:true }...: avg=18.87ms min=1.74ms med=18.43ms max=289.18ms p(90)=26.22ms p(95)=28.84ms  p(99.9)=48.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 314325
     http_req_receiving.............: avg=91.88µs min=25.3µs med=47.56µs max=72.67ms  p(90)=89.91µs p(95)=135.03µs p(99.9)=8.25ms 
     http_req_sending...............: avg=44.44µs min=4.7µs  med=9.05µs  max=170.56ms p(90)=16.7µs  p(95)=84.57µs  p(99.9)=4.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.73ms min=1.66ms med=18.32ms max=288.7ms  p(90)=26.07ms p(95)=28.6ms   p(99.9)=47.67ms
     http_reqs......................: 314325  2614.446131/s
     iteration_duration.............: avg=19.08ms min=2.96ms med=18.63ms max=301.87ms p(90)=26.43ms p(95)=29.06ms  p(99.9)=49.2ms 
     iterations.....................: 314225  2613.614366/s
     success_rate...................: 100.00% ✓ 314225      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 848946      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 340 MB  2.8 MB/s
     http_req_blocked...............: avg=3.55µs   min=1.04µs  med=2.62µs  max=26.44ms  p(90)=4.18µs  p(95)=4.91µs  p(99.9)=38.05µs 
     http_req_connecting............: avg=312ns    min=0s      med=0s      max=3.41ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.97ms  min=1.59ms  med=17.58ms max=355.53ms p(90)=34.6ms  p(95)=42.41ms p(99.9)=146.25ms
       { expected_response:true }...: avg=20.97ms  min=1.59ms  med=17.58ms max=355.53ms p(90)=34.6ms  p(95)=42.41ms p(99.9)=146.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 283082
     http_req_receiving.............: avg=605.06µs min=51.89µs med=98.17µs max=164.6ms  p(90)=1.13ms  p(95)=1.98ms  p(99.9)=29.67ms 
     http_req_sending...............: avg=46.55µs  min=4.76µs  med=9.7µs   max=179.14ms p(90)=17.3µs  p(95)=86.65µs p(99.9)=4.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.31ms  min=1.5ms   med=17.02ms max=354.9ms  p(90)=33.53ms p(95)=41.2ms  p(99.9)=143.95ms
     http_reqs......................: 283082  2355.018395/s
     iteration_duration.............: avg=21.19ms  min=2.8ms   med=17.79ms max=355.68ms p(90)=34.82ms p(95)=42.66ms p(99.9)=147.15ms
     iterations.....................: 282982  2354.186474/s
     success_rate...................: 100.00% ✓ 282982      ✗ 0     
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

     checks.........................: 100.00% ✓ 599217      ✗ 0     
     data_received..................: 18 GB   146 MB/s
     data_sent......................: 240 MB  2.0 MB/s
     http_req_blocked...............: avg=4.23µs  min=1.13µs med=3.12µs  max=11.27ms  p(90)=5.39µs   p(95)=6.49µs   p(99.9)=47.71µs
     http_req_connecting............: avg=448ns   min=0s     med=0s      max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.77ms min=2.14ms med=29.13ms max=331.5ms  p(90)=39.35ms  p(95)=42.78ms  p(99.9)=67.27ms
       { expected_response:true }...: avg=29.77ms min=2.14ms med=29.13ms max=331.5ms  p(90)=39.35ms  p(95)=42.78ms  p(99.9)=67.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199839
     http_req_receiving.............: avg=111.1µs min=28µs   med=62.32µs max=257.66ms p(90)=135.27µs p(95)=220.68µs p(99.9)=5.48ms 
     http_req_sending...............: avg=46.76µs min=5.15µs med=11.44µs max=229.37ms p(90)=25.92µs  p(95)=121.84µs p(99.9)=3.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.61ms min=2.07ms med=28.99ms max=330.72ms p(90)=39.17ms  p(95)=42.58ms  p(99.9)=66.33ms
     http_reqs......................: 199839  1661.377134/s
     iteration_duration.............: avg=30.02ms min=6.24ms med=29.36ms max=341.22ms p(90)=39.58ms  p(95)=43.02ms  p(99.9)=67.79ms
     iterations.....................: 199739  1660.545776/s
     success_rate...................: 100.00% ✓ 199739      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 422439      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.78µs  min=1.05µs  med=2.78µs  max=3.68ms   p(90)=4.43µs   p(95)=5.13µs   p(99.9)=38.26µs 
     http_req_connecting............: avg=695ns   min=0s      med=0s      max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.35ms min=2.08ms  med=41.96ms max=305.03ms p(90)=59.07ms  p(95)=64.28ms  p(99.9)=89.1ms  
       { expected_response:true }...: avg=42.35ms min=2.08ms  med=41.96ms max=305.03ms p(90)=59.07ms  p(95)=64.28ms  p(99.9)=89.1ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 140913
     http_req_receiving.............: avg=80.06µs min=27.62µs med=66.5µs  max=140.16ms p(90)=104.45µs p(95)=120.48µs p(99.9)=852.41µs
     http_req_sending...............: avg=24.98µs min=4.9µs   med=11.73µs max=117.84ms p(90)=17.98µs  p(95)=21.49µs  p(99.9)=869.55µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.25ms min=2ms     med=41.86ms max=304.68ms p(90)=58.97ms  p(95)=64.16ms  p(99.9)=88.75ms 
     http_reqs......................: 140913  1171.553339/s
     iteration_duration.............: avg=42.6ms  min=3.69ms  med=42.18ms max=315.56ms p(90)=59.29ms  p(95)=64.49ms  p(99.9)=89.75ms 
     iterations.....................: 140813  1170.721937/s
     success_rate...................: 100.00% ✓ 140813      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 204825     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   681 kB/s
     http_req_blocked...............: avg=4.08µs  min=982ns   med=2.61µs  max=3.38ms   p(90)=4.08µs   p(95)=4.69µs   p(99.9)=44.49µs 
     http_req_connecting............: avg=1.22µs  min=0s      med=0s      max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.53ms min=3.92ms  med=85.6ms  max=329.15ms p(90)=106.59ms p(95)=117.04ms p(99.9)=203.5ms 
       { expected_response:true }...: avg=87.53ms min=3.92ms  med=85.6ms  max=329.15ms p(90)=106.59ms p(95)=117.04ms p(99.9)=203.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 68375
     http_req_receiving.............: avg=84.19µs min=28.97µs med=73.42µs max=167.79ms p(90)=108.72µs p(95)=122.2µs  p(99.9)=678.27µs
     http_req_sending...............: avg=28.28µs min=4.7µs   med=13.32µs max=171.73ms p(90)=19.84µs  p(95)=21.9µs   p(99.9)=600.46µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.42ms min=3.8ms   med=85.51ms max=328.52ms p(90)=106.48ms p(95)=116.91ms p(99.9)=201.87ms
     http_reqs......................: 68375   567.233413/s
     iteration_duration.............: avg=87.89ms min=19.82ms med=85.84ms max=339.04ms p(90)=106.85ms p(95)=117.34ms p(99.9)=204.83ms
     iterations.....................: 68275   566.403821/s
     success_rate...................: 100.00% ✓ 68275      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 161937     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   538 kB/s
     http_req_blocked...............: avg=5.78µs   min=1.35µs  med=3.87µs   max=4.13ms   p(90)=5.44µs   p(95)=6.05µs   p(99.9)=117.99µs
     http_req_connecting............: avg=1.65µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.69ms min=5.24ms  med=108.5ms  max=317.44ms p(90)=145.81ms p(95)=156.76ms p(99.9)=202.35ms
       { expected_response:true }...: avg=110.69ms min=5.24ms  med=108.5ms  max=317.44ms p(90)=145.81ms p(95)=156.76ms p(99.9)=202.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54079
     http_req_receiving.............: avg=95.07µs  min=31.38µs med=87.73µs  max=95.87ms  p(90)=118.83µs p(95)=131.81µs p(99.9)=619.69µs
     http_req_sending...............: avg=23.47µs  min=6.06µs  med=18.33µs  max=38.88ms  p(90)=23.62µs  p(95)=25.74µs  p(99.9)=581.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.57ms min=5.1ms   med=108.4ms  max=316.29ms p(90)=145.69ms p(95)=156.63ms p(99.9)=201.72ms
     http_reqs......................: 54079   448.225625/s
     iteration_duration.............: avg=111.18ms min=22.54ms med=108.83ms max=335.15ms p(90)=146.14ms p(95)=157.09ms p(99.9)=204.24ms
     iterations.....................: 53979   447.39679/s
     success_rate...................: 100.00% ✓ 53979      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98730      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=6.98µs   min=1.49µs  med=3.72µs   max=3.87ms   p(90)=5.19µs   p(95)=5.81µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=2.96µs   min=0s      med=0s       max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=181.61ms min=7.67ms  med=187.58ms max=427.62ms p(90)=195.65ms p(95)=200.2ms  p(99.9)=272.92ms
       { expected_response:true }...: avg=181.61ms min=7.67ms  med=187.58ms max=427.62ms p(90)=195.65ms p(95)=200.2ms  p(99.9)=272.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33010
     http_req_receiving.............: avg=263.48µs min=35.02µs med=91.64µs  max=257.2ms  p(90)=123.53µs p(95)=137.25µs p(99.9)=71.92ms 
     http_req_sending...............: avg=35.1µs   min=6.53µs  med=17.86µs  max=223.8ms  p(90)=22.83µs  p(95)=24.86µs  p(99.9)=460.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.31ms min=7.58ms  med=187.45ms max=278.95ms p(90)=195.45ms p(95)=199.91ms p(99.9)=265.51ms
     http_reqs......................: 33010   272.873593/s
     iteration_duration.............: avg=182.43ms min=17.04ms med=187.87ms max=439.82ms p(90)=195.95ms p(95)=200.51ms p(99.9)=274.4ms 
     iterations.....................: 32910   272.046953/s
     success_rate...................: 100.00% ✓ 32910      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94467      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.28µs   min=1.08µs  med=3.13µs   max=3.42ms   p(90)=4.44µs   p(95)=4.97µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=2.87µs   min=0s      med=0s       max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=189.81ms min=6.28ms  med=175.59ms max=893.59ms p(90)=222.52ms p(95)=272.18ms p(99.9)=568.88ms
       { expected_response:true }...: avg=189.81ms min=6.28ms  med=175.59ms max=893.59ms p(90)=222.52ms p(95)=272.18ms p(99.9)=568.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31589
     http_req_receiving.............: avg=91.22µs  min=31µs    med=84.99µs  max=56.4ms   p(90)=115.45µs p(95)=126.39µs p(99.9)=706.37µs
     http_req_sending...............: avg=30.67µs  min=5.27µs  med=16.62µs  max=81.89ms  p(90)=21.08µs  p(95)=22.75µs  p(99.9)=505.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.69ms min=6.16ms  med=175.49ms max=893.47ms p(90)=222.42ms p(95)=272.08ms p(99.9)=568.77ms
     http_reqs......................: 31589   261.079203/s
     iteration_duration.............: avg=190.66ms min=55.67ms med=175.94ms max=893.79ms p(90)=222.88ms p(95)=273.14ms p(99.9)=569.12ms
     iterations.....................: 31489   260.252715/s
     success_rate...................: 100.00% ✓ 31489      ✗ 0    
     vus............................: 3       min=3        max=50 
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

     checks.........................: 100.00% ✓ 6399      ✗ 0   
     data_received..................: 214 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=83.94µs min=1.58µs   med=3.44µs  max=8.4ms  p(90)=5µs      p(95)=6.03µs  p(99.9)=7.43ms  
     http_req_connecting............: avg=78.23µs min=0s       med=0s      max=7.97ms p(90)=0s       p(95)=0s      p(99.9)=7.38ms  
     http_req_duration..............: avg=2.71s   min=37.68ms  med=2.8s    max=4.79s  p(90)=3.51s    p(95)=3.79s   p(99.9)=4.74s   
       { expected_response:true }...: avg=2.71s   min=37.68ms  med=2.8s    max=4.79s  p(90)=3.51s    p(95)=3.79s   p(99.9)=4.74s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2233
     http_req_receiving.............: avg=94.28µs min=34.29µs  med=89.19µs max=1.45ms p(90)=133.81µs p(95)=151.6µs p(99.9)=464.09µs
     http_req_sending...............: avg=66.48µs min=7.4µs    med=17.76µs max=5.72ms p(90)=23.43µs  p(95)=26.55µs p(99.9)=4.6ms   
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.71s   min=37.56ms  med=2.8s    max=4.79s  p(90)=3.51s    p(95)=3.79s   p(99.9)=4.73s   
     http_reqs......................: 2233    17.661687/s
     iteration_duration.............: avg=2.83s   min=822.37ms med=2.83s   max=4.79s  p(90)=3.54s    p(95)=3.81s   p(99.9)=4.74s   
     iterations.....................: 2133    16.870747/s
     success_rate...................: 100.00% ✓ 2133      ✗ 0   
     vus............................: 27      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

