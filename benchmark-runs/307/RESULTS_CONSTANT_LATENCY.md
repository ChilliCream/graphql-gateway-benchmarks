## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.6.0-p.15 | 1,892 | 1,927 | 1,876 | 0.9% |  |
| fusion | 16.5.1 | 1,872 | 1,919 | 1,858 | 1.2% |  |
| fusion-nightly-net11 | 16.6.0-p.15 | 1,862 | 1,913 | 1,857 | 1.1% |  |
| fusion-nightly-fed | 16.6.0-p.15 | 1,790 | 1,854 | 1,777 | 1.4% |  |
| grafbase | 0.53.5 | 1,326 | 1,348 | 1,318 | 0.8% |  |
| cosmo | 0.334.0 | 1,229 | 1,267 | 1,222 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 565 | 583 | 559 | 1.3% |  |
| apollo-router | v2.16.1 | 422 | 433 | 411 | 1.9% |  |
| apollo-gateway | 2.14.3 | 261 | 265 | 260 | 0.6% |  |
| hive-gateway | 2.10.8 | 259 | 267 | 256 | 1.3% |  |
| feddi | 5ff8b6165878 | 18 | 18 | 17 | 2.9% |  |
| hive-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 692031      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=3.32µs   min=972ns   med=2.51µs  max=3.98ms   p(90)=4.17µs   p(95)=4.92µs  p(99.9)=36.9µs 
     http_req_connecting............: avg=411ns    min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.78ms  min=17.35ms med=25.19ms max=298.75ms p(90)=30.13ms  p(95)=31.94ms p(99.9)=49.98ms
       { expected_response:true }...: avg=25.78ms  min=17.35ms med=25.19ms max=298.75ms p(90)=30.13ms  p(95)=31.94ms p(99.9)=49.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230777
     http_req_receiving.............: avg=298.81µs min=48.59µs med=94.73µs max=165.01ms p(90)=732.35µs p(95)=1.24ms  p(99.9)=8.25ms 
     http_req_sending...............: avg=32.79µs  min=4.65µs  med=9.67µs  max=109.75ms p(90)=19.16µs  p(95)=31.85µs p(99.9)=1.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.45ms  min=17.21ms med=24.88ms max=298.51ms p(90)=29.73ms  p(95)=31.5ms  p(99.9)=48.2ms 
     http_reqs......................: 230777  1892.506754/s
     iteration_duration.............: avg=26ms     min=17.55ms med=25.39ms max=323.24ms p(90)=30.34ms  p(95)=32.15ms p(99.9)=50.38ms
     iterations.....................: 230677  1891.686695/s
     success_rate...................: 100.00% ✓ 230677      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684447      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.17µs   min=872ns   med=2.51µs  max=2.72ms   p(90)=4.09µs   p(95)=4.79µs  p(99.9)=38.1µs 
     http_req_connecting............: avg=277ns    min=0s      med=0s      max=2.69ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.06ms  min=17.03ms med=25.47ms max=285.91ms p(90)=30.49ms  p(95)=32.33ms p(99.9)=50.83ms
       { expected_response:true }...: avg=26.06ms  min=17.03ms med=25.47ms max=285.91ms p(90)=30.49ms  p(95)=32.33ms p(99.9)=50.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228249
     http_req_receiving.............: avg=324.96µs min=50.69µs med=98.09µs max=81.47ms  p(90)=834.51µs p(95)=1.36ms  p(99.9)=8.04ms 
     http_req_sending...............: avg=33.6µs   min=4.95µs  med=9.73µs  max=100.88ms p(90)=18.99µs  p(95)=36.73µs p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.71ms  min=16.85ms med=25.11ms max=285.4ms  p(90)=30.05ms  p(95)=31.85ms p(99.9)=49.65ms
     http_reqs......................: 228249  1872.013176/s
     iteration_duration.............: avg=26.28ms  min=17.6ms  med=25.68ms max=314.72ms p(90)=30.7ms   p(95)=32.54ms p(99.9)=51.08ms
     iterations.....................: 228149  1871.193014/s
     success_rate...................: 100.00% ✓ 228149      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 680955      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.13µs   min=990ns   med=2.58µs  max=1.53ms   p(90)=4.31µs  p(95)=5.06µs  p(99.9)=35.82µs
     http_req_connecting............: avg=159ns    min=0s      med=0s      max=1.51ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.19ms  min=17.35ms med=25.6ms  max=294.29ms p(90)=30.6ms  p(95)=32.48ms p(99.9)=49.84ms
       { expected_response:true }...: avg=26.19ms  min=17.35ms med=25.6ms  max=294.29ms p(90)=30.6ms  p(95)=32.48ms p(99.9)=49.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227085
     http_req_receiving.............: avg=328.03µs min=51.17µs med=94.22µs max=217.4ms  p(90)=847µs   p(95)=1.44ms  p(99.9)=8.7ms  
     http_req_sending...............: avg=34.15µs  min=4.73µs  med=9.76µs  max=180.29ms p(90)=19.87µs p(95)=47.82µs p(99.9)=1.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.83ms  min=17.21ms med=25.26ms max=293.95ms p(90)=30.16ms p(95)=31.99ms p(99.9)=48.73ms
     http_reqs......................: 227085  1862.597565/s
     iteration_duration.............: avg=26.42ms  min=17.56ms med=25.81ms max=305.73ms p(90)=30.81ms p(95)=32.69ms p(99.9)=50.3ms 
     iterations.....................: 226985  1861.777345/s
     success_rate...................: 100.00% ✓ 226985      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 654801      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 262 MB  2.2 MB/s
     http_req_blocked...............: avg=2.87µs   min=852ns   med=2.02µs  max=6.21ms   p(90)=3.78µs  p(95)=4.5µs   p(99.9)=29.55µs
     http_req_connecting............: avg=401ns    min=0s      med=0s      max=3.56ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.26ms  min=17.59ms med=26.68ms max=299.96ms p(90)=31.87ms p(95)=33.72ms p(99.9)=51.17ms
       { expected_response:true }...: avg=27.26ms  min=17.59ms med=26.68ms max=299.96ms p(90)=31.87ms p(95)=33.72ms p(99.9)=51.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 218367
     http_req_receiving.............: avg=314.01µs min=51.62µs med=98.6µs  max=83.11ms  p(90)=787.2µs p(95)=1.26ms  p(99.9)=8.15ms 
     http_req_sending...............: avg=29.58µs  min=4.39µs  med=8.58µs  max=88.67ms  p(90)=18.97µs p(95)=29.48µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.91ms  min=17.51ms med=26.34ms max=299.31ms p(90)=31.47ms p(95)=33.28ms p(99.9)=49.93ms
     http_reqs......................: 218367  1790.018625/s
     iteration_duration.............: avg=27.48ms  min=17.85ms med=26.88ms max=317.12ms p(90)=32.07ms p(95)=33.92ms p(99.9)=51.5ms 
     iterations.....................: 218267  1789.198896/s
     success_rate...................: 100.00% ✓ 218267      ✗ 0     
     vus............................: 4       min=0         max=50  
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

     checks.........................: 100.00% ✓ 485025      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 194 MB  1.6 MB/s
     http_req_blocked...............: avg=4.09µs  min=1.04µs  med=3.01µs  max=3.55ms   p(90)=5.3µs    p(95)=6.25µs   p(99.9)=46.97µs
     http_req_connecting............: avg=547ns   min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=36.83ms min=18.16ms med=36.55ms max=321.87ms p(90)=43.43ms  p(95)=45.52ms  p(99.9)=62.18ms
       { expected_response:true }...: avg=36.83ms min=18.16ms med=36.55ms max=321.87ms p(90)=43.43ms  p(95)=45.52ms  p(99.9)=62.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161775
     http_req_receiving.............: avg=92.94µs min=27.82µs med=61.48µs max=81.15ms  p(90)=130.14µs p(95)=179.34µs p(99.9)=2.34ms 
     http_req_sending...............: avg=39.03µs min=4.87µs  med=11.81µs max=178.59ms p(90)=25.83µs  p(95)=74.64µs  p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.69ms min=18.01ms med=36.43ms max=315.94ms p(90)=43.29ms  p(95)=45.37ms  p(99.9)=61.3ms 
     http_reqs......................: 161775  1326.252356/s
     iteration_duration.............: avg=37.09ms min=21.05ms med=36.8ms  max=333.21ms p(90)=43.65ms  p(95)=45.75ms  p(99.9)=63.08ms
     iterations.....................: 161675  1325.432543/s
     success_rate...................: 100.00% ✓ 161675      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 449628      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.18µs  min=942ns   med=2.28µs  max=3.41ms   p(90)=3.94µs   p(95)=4.65µs   p(99.9)=37.85µs 
     http_req_connecting............: avg=550ns   min=0s      med=0s      max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.79ms min=18.25ms med=39.17ms max=313.75ms p(90)=47.73ms  p(95)=50.46ms  p(99.9)=64.93ms 
       { expected_response:true }...: avg=39.79ms min=18.25ms med=39.17ms max=313.75ms p(90)=47.73ms  p(95)=50.46ms  p(99.9)=64.93ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149976
     http_req_receiving.............: avg=77.95µs min=26.52µs med=64.61µs max=54.19ms  p(90)=106.65µs p(95)=124.17µs p(99.9)=868.82µs
     http_req_sending...............: avg=22.16µs min=4.68µs  med=10.97µs max=20.36ms  p(90)=18.67µs  p(95)=22.53µs  p(99.9)=927.64µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.69ms min=18.1ms  med=39.07ms max=313.29ms p(90)=47.62ms  p(95)=50.35ms  p(99.9)=64.65ms 
     http_reqs......................: 149976  1229.395283/s
     iteration_duration.............: avg=40.02ms min=21.57ms med=39.38ms max=323.01ms p(90)=47.92ms  p(95)=50.67ms  p(99.9)=65.61ms 
     iterations.....................: 149876  1228.575555/s
     success_rate...................: 100.00% ✓ 149876      ✗ 0     
     vus............................: 14      min=0         max=50  
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

     checks.........................: 100.00% ✓ 206895     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   679 kB/s
     http_req_blocked...............: avg=4.76µs  min=1.18µs  med=3.15µs  max=4.11ms   p(90)=4.66µs   p(95)=5.34µs   p(99.9)=48.96µs 
     http_req_connecting............: avg=1.33µs  min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.66ms min=20.22ms med=84.93ms max=321.76ms p(90)=104.61ms p(95)=112.55ms p(99.9)=198.38ms
       { expected_response:true }...: avg=86.66ms min=20.22ms med=84.93ms max=321.76ms p(90)=104.61ms p(95)=112.55ms p(99.9)=198.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69065
     http_req_receiving.............: avg=86.44µs min=32.12µs med=75.52µs max=122.02ms p(90)=111.3µs  p(95)=124.56µs p(99.9)=638.08µs
     http_req_sending...............: avg=21.27µs min=5.52µs  med=14.6µs  max=31.99ms  p(90)=21.03µs  p(95)=23.4µs   p(99.9)=621.7µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.55ms min=20.13ms med=84.82ms max=321.31ms p(90)=104.5ms  p(95)=112.4ms  p(99.9)=197.99ms
     http_reqs......................: 69065   565.045406/s
     iteration_duration.............: avg=87ms    min=37.19ms med=85.19ms max=336.07ms p(90)=104.86ms p(95)=112.84ms p(99.9)=200.48ms
     iterations.....................: 68965   564.22727/s
     success_rate...................: 100.00% ✓ 68965      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 154677     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   507 kB/s
     http_req_blocked...............: avg=4.28µs   min=1.06µs  med=3.35µs   max=1.6ms    p(90)=4.93µs   p(95)=5.51µs   p(99.9)=90.67µs 
     http_req_connecting............: avg=707ns    min=0s      med=0s       max=1.57ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.94ms min=20.53ms med=114.08ms max=336.2ms  p(90)=144.6ms  p(95)=154.1ms  p(99.9)=198.09ms
       { expected_response:true }...: avg=115.94ms min=20.53ms med=114.08ms max=336.2ms  p(90)=144.6ms  p(95)=154.1ms  p(99.9)=198.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51659
     http_req_receiving.............: avg=92.87µs  min=29.33µs med=83.97µs  max=123.28ms p(90)=114.5µs  p(95)=127.23µs p(99.9)=568.23µs
     http_req_sending...............: avg=25.96µs  min=5.35µs  med=17.05µs  max=95.59ms  p(90)=22.37µs  p(95)=24.41µs  p(99.9)=518.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.82ms min=20.39ms med=113.98ms max=335.68ms p(90)=144.49ms p(95)=153.98ms p(99.9)=197.44ms
     http_reqs......................: 51659   422.267919/s
     iteration_duration.............: avg=116.41ms min=43.55ms med=114.39ms max=345.03ms p(90)=144.92ms p(95)=154.43ms p(99.9)=199.91ms
     iterations.....................: 51559   421.450505/s
     success_rate...................: 100.00% ✓ 51559      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95778      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   314 kB/s
     http_req_blocked...............: avg=9.34µs   min=1.15µs  med=3.13µs   max=97.13ms  p(90)=4.55µs   p(95)=5.14µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=2.93µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=187.24ms min=23.36ms med=185.93ms max=386.13ms p(90)=201.24ms p(95)=207.45ms p(99.9)=275.26ms
       { expected_response:true }...: avg=187.24ms min=23.36ms med=185.93ms max=386.13ms p(90)=201.24ms p(95)=207.45ms p(99.9)=275.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32026
     http_req_receiving.............: avg=97.91µs  min=33.66µs med=90.14µs  max=103.21ms p(90)=122.1µs  p(95)=134.94µs p(99.9)=664.73µs
     http_req_sending...............: avg=31.62µs  min=5.52µs  med=17.67µs  max=109.29ms p(90)=22.72µs  p(95)=24.71µs  p(99.9)=520.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.11ms min=23.17ms med=185.81ms max=385.81ms p(90)=201.12ms p(95)=207.33ms p(99.9)=274.79ms
     http_reqs......................: 32026   261.083112/s
     iteration_duration.............: avg=188.04ms min=60.05ms med=186.22ms max=405.97ms p(90)=201.52ms p(95)=207.79ms p(99.9)=276ms   
     iterations.....................: 31926   260.267889/s
     success_rate...................: 100.00% ✓ 31926      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 94851      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.5µs    min=1.4µs   med=3.7µs    max=3.22ms   p(90)=5.11µs   p(95)=5.72µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=2.55µs   min=0s      med=0s       max=3.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=189.05ms min=18.2ms  med=177.72ms max=615.47ms p(90)=224.61ms p(95)=254.94ms p(99.9)=572.15ms
       { expected_response:true }...: avg=189.05ms min=18.2ms  med=177.72ms max=615.47ms p(90)=224.61ms p(95)=254.94ms p(99.9)=572.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31717
     http_req_receiving.............: avg=97.4µs   min=37.43µs med=91.06µs  max=61.28ms  p(90)=122.3µs  p(95)=134.82µs p(99.9)=705.86µs
     http_req_sending...............: avg=31.13µs  min=6.64µs  med=18.14µs  max=107.03ms p(90)=22.82µs  p(95)=24.75µs  p(99.9)=531.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.92ms min=18.08ms med=177.61ms max=615.32ms p(90)=224.49ms p(95)=254.79ms p(99.9)=572.05ms
     http_reqs......................: 31717   259.833969/s
     iteration_duration.............: avg=189.88ms min=59.35ms med=178.1ms  max=615.85ms p(90)=224.98ms p(95)=255.61ms p(99.9)=572.72ms
     iterations.....................: 31617   259.014743/s
     success_rate...................: 100.00% ✓ 31617      ✗ 0    
     vus............................: 36      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6738      ✗ 0   
     data_received..................: 225 MB  1.8 MB/s
     data_sent......................: 2.8 MB  22 kB/s
     http_req_blocked...............: avg=104.93µs min=1.25µs   med=3.16µs  max=8.86ms p(90)=4.57µs  p(95)=5.44µs   p(99.9)=8.28ms  
     http_req_connecting............: avg=98.93µs  min=0s       med=0s      max=8.64ms p(90)=0s      p(95)=0s       p(99.9)=8.16ms  
     http_req_duration..............: avg=2.59s    min=40.14ms  med=2.68s   max=4.23s  p(90)=3.29s   p(95)=3.43s    p(99.9)=4.1s    
       { expected_response:true }...: avg=2.59s    min=40.14ms  med=2.68s   max=4.23s  p(90)=3.29s   p(95)=3.43s    p(99.9)=4.1s    
     http_req_failed................: 0.00%   ✓ 0         ✗ 2346
     http_req_receiving.............: avg=97.69µs  min=30.43µs  med=90.64µs max=5.7ms  p(90)=129.2µs p(95)=142.63µs p(99.9)=818.05µs
     http_req_sending...............: avg=38.79µs  min=5.94µs   med=18.27µs max=8.19ms p(90)=23.26µs p(95)=27.41µs  p(99.9)=3.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.59s    min=39.97ms  med=2.68s   max=4.23s  p(90)=3.29s   p(95)=3.43s    p(99.9)=4.1s    
     http_reqs......................: 2346    18.375871/s
     iteration_duration.............: avg=2.7s     min=906.18ms med=2.71s   max=4.23s  p(90)=3.3s    p(95)=3.44s    p(99.9)=4.11s   
     iterations.....................: 2246    17.592586/s
     success_rate...................: 100.00% ✓ 2246      ✗ 0   
     vus............................: 43      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

