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
| hive-router | v0.0.72 | 2,824 | 2,995 | 2,762 | 2.6% |  |
| fusion-nightly | 16.3.0-p.1 | 2,158 | 2,225 | 2,138 | 1.3% |  |
| fusion | 16.2.3 | 2,107 | 2,169 | 2,092 | 1.1% |  |
| grafbase | 0.53.5 | 2,038 | 2,116 | 2,013 | 1.8% |  |
| cosmo | 0.324.0 | 1,192 | 1,218 | 1,186 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 557 | 570 | 552 | 1.1% |  |
| apollo-router | v2.15.1 | 442 | 453 | 438 | 1.2% |  |
| apollo-gateway | 2.14.1 | 246 | 249 | 244 | 0.8% |  |
| hive-gateway | 2.9.0 | 229 | 233 | 226 | 1.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,289 | 2,440 | 2,262 | 2.6% |  |
| fusion-nightly | 16.3.0-p.1 | 2,054 | 2,122 | 2,040 | 1.3% |  |
| fusion | 16.2.3 | 1,993 | 2,052 | 1,978 | 1.2% |  |
| cosmo | 0.324.0 | 1,099 | 1,119 | 1,091 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 519 | 535 | 514 | 1.4% |  |
| apollo-router | v2.15.1 | 394 | 408 | 391 | 1.6% |  |
| hive-gateway | 2.9.0 | 239 | 244 | 236 | 1.0% |  |
| apollo-gateway | 2.14.1 | 238 | 240 | 236 | 0.6% |  |
| grafbase | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1018296     ✗ 0     
     data_received..................: 30 GB   248 MB/s
     data_sent......................: 408 MB  3.4 MB/s
     http_req_blocked...............: avg=3.33µs   min=1.1µs   med=2.48µs  max=25.23ms  p(90)=3.73µs   p(95)=4.39µs   p(99.9)=38.6µs 
     http_req_connecting............: avg=297ns    min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.43ms  min=1.69ms  med=16.57ms max=328.85ms p(90)=25.48ms  p(95)=29.2ms   p(99.9)=52.5ms 
       { expected_response:true }...: avg=17.43ms  min=1.69ms  med=16.57ms max=328.85ms p(90)=25.48ms  p(95)=29.2ms   p(99.9)=52.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 339532
     http_req_receiving.............: avg=131.45µs min=28.62µs med=54.29µs max=135.84ms p(90)=107.31µs p(95)=291.64µs p(99.9)=10.34ms
     http_req_sending...............: avg=62.07µs  min=5.5µs   med=9.82µs  max=118.8ms  p(90)=17.16µs  p(95)=130.67µs p(99.9)=10.69ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.24ms  min=1.64ms  med=16.41ms max=316.7ms  p(90)=25.22ms  p(95)=28.81ms  p(99.9)=51.18ms
     http_reqs......................: 339532  2824.281658/s
     iteration_duration.............: avg=17.66ms  min=2.1ms   med=16.78ms max=340.87ms p(90)=25.7ms   p(95)=29.45ms  p(99.9)=54.16ms
     iterations.....................: 339432  2823.449842/s
     success_rate...................: 100.00% ✓ 339432      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 778779      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=3.09µs  min=1.01µs  med=2.35µs   max=4.23ms   p(90)=3.54µs  p(95)=4.15µs  p(99.9)=35.03µs 
     http_req_connecting............: avg=390ns   min=0s      med=0s       max=4.19ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.86ms min=2.34ms  med=19.34ms  max=323.73ms p(90)=39.67ms p(95)=49.85ms p(99.9)=118.57ms
       { expected_response:true }...: avg=22.86ms min=2.34ms  med=19.34ms  max=323.73ms p(90)=39.67ms p(95)=49.85ms p(99.9)=118.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259693
     http_req_receiving.............: avg=1.07ms  min=52.26µs med=341.25µs max=178.24ms p(90)=2.19ms  p(95)=3.29ms  p(99.9)=41ms    
     http_req_sending...............: avg=44.81µs min=5.19µs  med=9.34µs   max=181.01ms p(90)=16.42µs p(95)=114.1µs p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.74ms min=2.22ms  med=18.25ms  max=322.9ms  p(90)=38.08ms p(95)=47.98ms p(99.9)=117.1ms 
     http_reqs......................: 259693  2158.882379/s
     iteration_duration.............: avg=23.1ms  min=3.3ms   med=19.56ms  max=360.83ms p(90)=39.92ms p(95)=50.11ms p(99.9)=119.7ms 
     iterations.....................: 259593  2158.051058/s
     success_rate...................: 100.00% ✓ 259593      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 760410      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.16µs   min=1µs     med=2.49µs   max=4.39ms   p(90)=3.69µs  p(95)=4.32µs   p(99.9)=36.1µs  
     http_req_connecting............: avg=291ns    min=0s      med=0s       max=3.62ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.42ms  min=2.52ms  med=15.34ms  max=331.04ms p(90)=51.32ms p(95)=69.39ms  p(99.9)=167.46ms
       { expected_response:true }...: avg=23.42ms  min=2.52ms  med=15.34ms  max=331.04ms p(90)=51.32ms p(95)=69.39ms  p(99.9)=167.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253570
     http_req_receiving.............: avg=974.96µs min=53.75µs med=143.03µs max=173.23ms p(90)=1.38ms  p(95)=2.28ms   p(99.9)=67.43ms 
     http_req_sending...............: avg=45.11µs  min=5.2µs   med=9.82µs   max=200.77ms p(90)=16.7µs  p(95)=113.54µs p(99.9)=3.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.4ms   min=2.41ms  med=14.54ms  max=292.42ms p(90)=49.36ms p(95)=67.27ms  p(99.9)=165.45ms
     http_reqs......................: 253570  2107.79615/s
     iteration_duration.............: avg=23.66ms  min=2.93ms  med=15.56ms  max=360.33ms p(90)=51.58ms p(95)=69.66ms  p(99.9)=168.47ms
     iterations.....................: 253470  2106.964902/s
     success_rate...................: 100.00% ✓ 253470      ✗ 0     
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

     checks.........................: 100.00% ✓ 735159      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 295 MB  2.4 MB/s
     http_req_blocked...............: avg=3.68µs  min=1.04µs  med=2.65µs  max=12.48ms  p(90)=4.17µs   p(95)=4.96µs   p(99.9)=43µs   
     http_req_connecting............: avg=456ns   min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.22ms min=1.88ms  med=23.96ms max=307.64ms p(90)=29.3ms   p(95)=31.88ms  p(99.9)=55.09ms
       { expected_response:true }...: avg=24.22ms min=1.88ms  med=23.96ms max=307.64ms p(90)=29.3ms   p(95)=31.88ms  p(99.9)=55.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245153
     http_req_receiving.............: avg=122.8µs min=29.84µs med=61.25µs max=141.46ms p(90)=107.39µs p(95)=220.27µs p(99.9)=10.56ms
     http_req_sending...............: avg=49.12µs min=4.81µs  med=10.93µs max=86.13ms  p(90)=19.01µs  p(95)=123.68µs p(99.9)=4.02ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.05ms min=1.78ms  med=23.83ms max=307.33ms p(90)=29.11ms  p(95)=31.56ms  p(99.9)=53.78ms
     http_reqs......................: 245153  2038.73715/s
     iteration_duration.............: avg=24.47ms min=3.6ms   med=24.18ms max=347.28ms p(90)=29.53ms  p(95)=32.15ms  p(99.9)=55.89ms
     iterations.....................: 245053  2037.905531/s
     success_rate...................: 100.00% ✓ 245053      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 430119      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.14µs   min=1.04µs  med=2.48µs  max=2.52ms   p(90)=3.85µs   p(95)=4.48µs   p(99.9)=36.28µs
     http_req_connecting............: avg=353ns    min=0s      med=0s      max=2.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.6ms   min=2.17ms  med=41.09ms max=348.04ms p(90)=58.85ms  p(95)=64.23ms  p(99.9)=90.23ms
       { expected_response:true }...: avg=41.6ms   min=2.17ms  med=41.09ms max=348.04ms p(90)=58.85ms  p(95)=64.23ms  p(99.9)=90.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143473
     http_req_receiving.............: avg=101.46µs min=29.85µs med=65.23µs max=143.41ms p(90)=101.94µs p(95)=120.87µs p(99.9)=2.23ms 
     http_req_sending...............: avg=25.27µs  min=5.24µs  med=10.91µs max=55.8ms   p(90)=16.72µs  p(95)=20.89µs  p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.47ms  min=2.05ms  med=40.99ms max=207.67ms p(90)=58.72ms  p(95)=64.07ms  p(99.9)=89.77ms
     http_reqs......................: 143473  1192.838801/s
     iteration_duration.............: avg=41.84ms  min=3.83ms  med=41.29ms max=355.63ms p(90)=59.06ms  p(95)=64.44ms  p(99.9)=90.82ms
     iterations.....................: 143373  1192.007398/s
     success_rate...................: 100.00% ✓ 143373      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 201231     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   669 kB/s
     http_req_blocked...............: avg=4.34µs  min=1.18µs  med=2.81µs  max=3.73ms   p(90)=4.29µs   p(95)=4.89µs   p(99.9)=52.86µs 
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.1ms  min=4.15ms  med=86.79ms max=335.48ms p(90)=109.61ms p(95)=121.11ms p(99.9)=219.14ms
       { expected_response:true }...: avg=89.1ms  min=4.15ms  med=86.79ms max=335.48ms p(90)=109.61ms p(95)=121.11ms p(99.9)=219.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67177
     http_req_receiving.............: avg=86.89µs min=30.91µs med=76.93µs max=49.48ms  p(90)=110.84µs p(95)=123.23µs p(99.9)=959.13µs
     http_req_sending...............: avg=25.96µs min=5.91µs  med=13.26µs max=148.8ms  p(90)=19.97µs  p(95)=22.3µs   p(99.9)=705.46µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.99ms min=4.04ms  med=86.68ms max=323.64ms p(90)=109.48ms p(95)=120.97ms p(99.9)=219.04ms
     http_reqs......................: 67177   557.267978/s
     iteration_duration.............: avg=89.46ms min=19.61ms med=87.03ms max=343.73ms p(90)=109.85ms p(95)=121.37ms p(99.9)=220.99ms
     iterations.....................: 67077   556.438426/s
     success_rate...................: 100.00% ✓ 67077      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 160071     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   532 kB/s
     http_req_blocked...............: avg=5.63µs   min=1.13µs  med=3.43µs   max=3.86ms   p(90)=4.84µs   p(95)=5.39µs   p(99.9)=91.66µs 
     http_req_connecting............: avg=2µs      min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.01ms min=5.38ms  med=111.91ms max=361.42ms p(90)=134.85ms p(95)=141.9ms  p(99.9)=174.01ms
       { expected_response:true }...: avg=112.01ms min=5.38ms  med=111.91ms max=361.42ms p(90)=134.85ms p(95)=141.9ms  p(99.9)=174.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53457
     http_req_receiving.............: avg=93.86µs  min=31.88µs med=84.89µs  max=60.69ms  p(90)=116.33µs p(95)=128.33µs p(99.9)=1.01ms  
     http_req_sending...............: avg=32.75µs  min=5.84µs  med=16.4µs   max=277.99ms p(90)=21.95µs  p(95)=23.76µs  p(99.9)=712.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.88ms min=5.21ms  med=111.79ms max=345.17ms p(90)=134.72ms p(95)=141.79ms p(99.9)=172.86ms
     http_reqs......................: 53457   442.919462/s
     iteration_duration.............: avg=112.48ms min=37.14ms med=112.2ms  max=385.31ms p(90)=135.1ms  p(95)=142.18ms p(99.9)=176.83ms
     iterations.....................: 53357   442.090909/s
     success_rate...................: 100.00% ✓ 53357      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89253      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=6.08µs   min=1.3µs   med=3.31µs   max=3.5ms    p(90)=4.59µs   p(95)=5.17µs   p(99.9)=1.18ms  
     http_req_connecting............: avg=2.57µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.01ms  
     http_req_duration..............: avg=200.87ms min=8.59ms  med=200.4ms  max=350.28ms p(90)=210.04ms p(95)=215.16ms p(99.9)=284.34ms
       { expected_response:true }...: avg=200.87ms min=8.59ms  med=200.4ms  max=350.28ms p(90)=210.04ms p(95)=215.16ms p(99.9)=284.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29851
     http_req_receiving.............: avg=100.19µs min=32.45µs med=91.24µs  max=62.45ms  p(90)=122.08µs p(95)=134.59µs p(99.9)=588.55µs
     http_req_sending...............: avg=28.43µs  min=6.12µs  med=16.93µs  max=74.49ms  p(90)=21.51µs  p(95)=23.19µs  p(99.9)=510.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.74ms min=8.47ms  med=200.29ms max=350.17ms p(90)=209.92ms p(95)=215.04ms p(99.9)=284.15ms
     http_reqs......................: 29851   246.57416/s
     iteration_duration.............: avg=201.79ms min=46.96ms med=200.74ms max=356.91ms p(90)=210.31ms p(95)=215.44ms p(99.9)=285.03ms
     iterations.....................: 29751   245.748143/s
     success_rate...................: 100.00% ✓ 29751      ✗ 0    
     vus............................: 32      min=32       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 82836      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   275 kB/s
     http_req_blocked...............: avg=7.7µs    min=1.25µs  med=3.44µs   max=4.13ms   p(90)=4.77µs   p(95)=5.37µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=3.84µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=216.37ms min=6.91ms  med=197.43ms max=754.28ms p(90)=253.24ms p(95)=422.29ms p(99.9)=626.4ms 
       { expected_response:true }...: avg=216.37ms min=6.91ms  med=197.43ms max=754.28ms p(90)=253.24ms p(95)=422.29ms p(99.9)=626.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 27712
     http_req_receiving.............: avg=111.76µs min=37.46µs med=95.74µs  max=97.94ms  p(90)=126.79µs p(95)=140.09µs p(99.9)=574.56µs
     http_req_sending...............: avg=30.99µs  min=5.86µs  med=17.34µs  max=111.91ms p(90)=22.16µs  p(95)=24.04µs  p(99.9)=506.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=216.23ms min=6.78ms  med=197.28ms max=754.14ms p(90)=253.02ms p(95)=422.17ms p(99.9)=626.29ms
     http_reqs......................: 27712   229.098232/s
     iteration_duration.............: avg=217.43ms min=29.52ms med=197.81ms max=754.53ms p(90)=253.72ms p(95)=423.02ms p(99.9)=626.81ms
     iterations.....................: 27612   228.271521/s
     success_rate...................: 100.00% ✓ 27612      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 825651      ✗ 0     
     data_received..................: 24 GB   200 MB/s
     data_sent......................: 331 MB  2.8 MB/s
     http_req_blocked...............: avg=3.53µs  min=1.01µs  med=2.6µs   max=10.15ms  p(90)=4.08µs   p(95)=4.89µs   p(99.9)=40.62µs
     http_req_connecting............: avg=441ns   min=0s      med=0s      max=4.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.54ms min=1.97ms  med=21.03ms max=320.91ms p(90)=29.94ms  p(95)=33.15ms  p(99.9)=56.27ms
       { expected_response:true }...: avg=21.54ms min=1.97ms  med=21.03ms max=320.91ms p(90)=29.94ms  p(95)=33.15ms  p(99.9)=56.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 275317
     http_req_receiving.............: avg=131.3µs min=29.07µs med=58.76µs max=176.25ms p(90)=109.95µs p(95)=268.77µs p(99.9)=10.21ms
     http_req_sending...............: avg=56.4µs  min=5.34µs  med=10.62µs max=238.67ms p(90)=19.36µs  p(95)=129.62µs p(99.9)=6.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.36ms min=1.88ms  med=20.88ms max=173.41ms p(90)=29.71ms  p(95)=32.85ms  p(99.9)=55.08ms
     http_reqs......................: 275317  2289.637487/s
     iteration_duration.............: avg=21.79ms min=2.97ms  med=21.25ms max=332.09ms p(90)=30.17ms  p(95)=33.4ms   p(99.9)=56.88ms
     iterations.....................: 275217  2288.80585/s
     success_rate...................: 100.00% ✓ 275217      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 740538      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 297 MB  2.5 MB/s
     http_req_blocked...............: avg=5.26µs  min=1.01µs  med=2.47µs   max=28.47ms  p(90)=3.89µs  p(95)=4.62µs   p(99.9)=36.28µs 
     http_req_connecting............: avg=2.12µs  min=0s      med=0s       max=28.43ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.04ms min=1.82ms  med=21.18ms  max=317.74ms p(90)=40.26ms p(95)=49.06ms  p(99.9)=107.73ms
       { expected_response:true }...: avg=24.04ms min=1.82ms  med=21.18ms  max=317.74ms p(90)=40.26ms p(95)=49.06ms  p(99.9)=107.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 246946
     http_req_receiving.............: avg=1.13ms  min=52.53µs med=276.66µs max=98.41ms  p(90)=2.5ms   p(95)=3.8ms    p(99.9)=37.35ms 
     http_req_sending...............: avg=50.77µs min=5.15µs  med=9.93µs   max=231.6ms  p(90)=19.19µs p(95)=116.42µs p(99.9)=4.83ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.86ms min=1.69ms  med=20ms     max=302.11ms p(90)=38.71ms p(95)=47.25ms  p(99.9)=105.24ms
     http_reqs......................: 246946  2054.088893/s
     iteration_duration.............: avg=24.29ms min=2.96ms  med=21.41ms  max=339.13ms p(90)=40.51ms p(95)=49.32ms  p(99.9)=108.69ms
     iterations.....................: 246846  2053.257096/s
     success_rate...................: 100.00% ✓ 246846      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 718797      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.16µs   min=1.03µs  med=2.48µs   max=10.88ms  p(90)=3.9µs   p(95)=4.61µs   p(99.9)=33.91µs 
     http_req_connecting............: avg=251ns    min=0s      med=0s       max=2.86ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.78ms  min=1.84ms  med=18.19ms  max=326.02ms p(90)=49.95ms p(95)=66.79ms  p(99.9)=161.53ms
       { expected_response:true }...: avg=24.78ms  min=1.84ms  med=18.19ms  max=326.02ms p(90)=49.95ms p(95)=66.79ms  p(99.9)=161.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239699
     http_req_receiving.............: avg=985.61µs min=52.87µs med=138.05µs max=206.71ms p(90)=1.63ms  p(95)=2.61ms   p(99.9)=59.88ms 
     http_req_sending...............: avg=44.58µs  min=5.34µs  med=10.13µs  max=205.89ms p(90)=18.58µs p(95)=111.12µs p(99.9)=2.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.75ms  min=1.73ms  med=17.35ms  max=325.94ms p(90)=48.01ms p(95)=64.67ms  p(99.9)=158.07ms
     http_reqs......................: 239699  1993.521166/s
     iteration_duration.............: avg=25.03ms  min=2.65ms  med=18.42ms  max=326.21ms p(90)=50.2ms  p(95)=67.05ms  p(99.9)=162.65ms
     iterations.....................: 239599  1992.689489/s
     success_rate...................: 100.00% ✓ 239599      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 396483      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 159 MB  1.3 MB/s
     http_req_blocked...............: avg=4.22µs  min=1.03µs  med=2.93µs  max=4.84ms   p(90)=4.52µs   p(95)=5.24µs   p(99.9)=39.42µs
     http_req_connecting............: avg=958ns   min=0s      med=0s      max=4.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=45.12ms min=2.35ms  med=44.61ms max=340.59ms p(90)=63.31ms  p(95)=68.99ms  p(99.9)=96.74ms
       { expected_response:true }...: avg=45.12ms min=2.35ms  med=44.61ms max=340.59ms p(90)=63.31ms  p(95)=68.99ms  p(99.9)=96.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132261
     http_req_receiving.............: avg=97µs    min=29.71µs med=77.77µs max=159.17ms p(90)=119.42µs p(95)=138.93µs p(99.9)=1.62ms 
     http_req_sending...............: avg=27.86µs min=5.31µs  med=13.47µs max=64.74ms  p(90)=20.52µs  p(95)=24.36µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45ms    min=2.25ms  med=44.49ms max=339.83ms p(90)=63.18ms  p(95)=68.86ms  p(99.9)=96.15ms
     http_reqs......................: 132261  1099.274058/s
     iteration_duration.............: avg=45.39ms min=4.8ms   med=44.84ms max=364.33ms p(90)=63.54ms  p(95)=69.22ms  p(99.9)=97.67ms
     iterations.....................: 132161  1098.442918/s
     success_rate...................: 100.00% ✓ 132161      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 187581     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 75 MB   624 kB/s
     http_req_blocked...............: avg=5.05µs  min=1.1µs   med=3.02µs  max=4.67ms   p(90)=4.51µs   p(95)=5.08µs   p(99.9)=52.82µs 
     http_req_connecting............: avg=1.78µs  min=0s      med=0s      max=4.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.57ms min=4.4ms   med=93.24ms max=366.23ms p(90)=115.57ms p(95)=126.67ms p(99.9)=228.08ms
       { expected_response:true }...: avg=95.57ms min=4.4ms   med=93.24ms max=366.23ms p(90)=115.57ms p(95)=126.67ms p(99.9)=228.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62627
     http_req_receiving.............: avg=93.47µs min=31.17µs med=81.34µs max=167.96ms p(90)=114.65µs p(95)=127.34µs p(99.9)=1.05ms  
     http_req_sending...............: avg=26.87µs min=5.67µs  med=14.08µs max=156.71ms p(90)=20.85µs  p(95)=22.93µs  p(99.9)=731.77µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.45ms min=4.32ms  med=93.14ms max=365.81ms p(90)=115.45ms p(95)=126.51ms p(99.9)=227.68ms
     http_reqs......................: 62627   519.274178/s
     iteration_duration.............: avg=95.98ms min=20.98ms med=93.48ms max=375.43ms p(90)=115.83ms p(95)=127.01ms p(99.9)=230.87ms
     iterations.....................: 62527   518.445025/s
     success_rate...................: 100.00% ✓ 62527      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 142554     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   474 kB/s
     http_req_blocked...............: avg=5.39µs   min=1.16µs  med=3.47µs   max=4.8ms    p(90)=4.98µs   p(95)=5.57µs   p(99.9)=172.07µs
     http_req_connecting............: avg=1.61µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=84.92µs 
     http_req_duration..............: avg=125.78ms min=5.7ms   med=123.05ms max=354.1ms  p(90)=167.12ms p(95)=179.97ms p(99.9)=230.93ms
       { expected_response:true }...: avg=125.78ms min=5.7ms   med=123.05ms max=354.1ms  p(90)=167.12ms p(95)=179.97ms p(99.9)=230.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47618
     http_req_receiving.............: avg=96.6µs   min=32.62µs med=88.9µs   max=133.74ms p(90)=120.52µs p(95)=133.89µs p(99.9)=806.01µs
     http_req_sending...............: avg=23.66µs  min=5.65µs  med=17.31µs  max=62.32ms  p(90)=22.89µs  p(95)=24.79µs  p(99.9)=535.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.66ms min=5.59ms  med=122.93ms max=353.6ms  p(90)=166.99ms p(95)=179.85ms p(99.9)=230.6ms 
     http_reqs......................: 47618   394.416394/s
     iteration_duration.............: avg=126.31ms min=33.11ms med=123.39ms max=364.3ms  p(90)=167.43ms p(95)=180.27ms p(99.9)=233.3ms 
     iterations.....................: 47518   393.588101/s
     success_rate...................: 100.00% ✓ 47518      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86724      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.73µs   min=1.22µs  med=3.55µs   max=4.55ms   p(90)=5.01µs   p(95)=5.6µs    p(99.9)=2.07ms  
     http_req_connecting............: avg=3.85µs   min=0s      med=0s       max=4.5ms    p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=206.77ms min=6.88ms  med=210.18ms max=826.78ms p(90)=279.79ms p(95)=360.02ms p(99.9)=663.94ms
       { expected_response:true }...: avg=206.77ms min=6.88ms  med=210.18ms max=826.78ms p(90)=279.79ms p(95)=360.02ms p(99.9)=663.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29008
     http_req_receiving.............: avg=106.64µs min=34.13µs med=100.43µs max=29.51ms  p(90)=132.1µs  p(95)=144.79µs p(99.9)=449.92µs
     http_req_sending...............: avg=26.47µs  min=5.67µs  med=18.49µs  max=56.38ms  p(90)=23.32µs  p(95)=25.06µs  p(99.9)=629.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.63ms min=6.78ms  med=209.97ms max=826.59ms p(90)=279.65ms p(95)=359.88ms p(99.9)=663.8ms 
     http_reqs......................: 29008   239.311742/s
     iteration_duration.............: avg=207.74ms min=31.31ms med=211.38ms max=827.05ms p(90)=280.14ms p(95)=361.22ms p(99.9)=664.39ms
     iterations.....................: 28908   238.486756/s
     success_rate...................: 100.00% ✓ 28908      ✗ 0    
     vus............................: 35      min=35       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86361      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=4.97µs   min=1.22µs  med=3.49µs   max=1.73ms   p(90)=4.85µs   p(95)=5.4µs    p(99.9)=547.66µs
     http_req_connecting............: avg=1.27µs   min=0s      med=0s       max=1.7ms    p(90)=0s       p(95)=0s       p(99.9)=513.49µs
     http_req_duration..............: avg=207.56ms min=8.71ms  med=208.11ms max=381.42ms p(90)=217.2ms  p(95)=222.23ms p(99.9)=296.04ms
       { expected_response:true }...: avg=207.56ms min=8.71ms  med=208.11ms max=381.42ms p(90)=217.2ms  p(95)=222.23ms p(99.9)=296.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28887
     http_req_receiving.............: avg=136.8µs  min=33.72µs med=94.78µs  max=143.62ms p(90)=126µs    p(95)=138.41µs p(99.9)=919.49µs
     http_req_sending...............: avg=31.8µs   min=6.11µs  med=17.85µs  max=156.54ms p(90)=22.49µs  p(95)=24.3µs   p(99.9)=591.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.39ms min=8.56ms  med=207.97ms max=381.25ms p(90)=217.07ms p(95)=222.06ms p(99.9)=295.63ms
     http_reqs......................: 28887   238.535083/s
     iteration_duration.............: avg=208.54ms min=70.85ms med=208.48ms max=388.27ms p(90)=217.47ms p(95)=222.54ms p(99.9)=297.1ms 
     iterations.....................: 28787   237.709331/s
     success_rate...................: 100.00% ✓ 28787      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

