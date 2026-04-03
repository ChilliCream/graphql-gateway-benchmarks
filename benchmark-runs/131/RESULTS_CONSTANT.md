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
| hive-router | v0.0.43 | 3,070 | 3,253 | 2,992 | 2.6% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,137 | 2,188 | 2,121 | 1.0% |  |
| grafbase | 0.53.2 | 2,065 | 2,113 | 2,041 | 1.3% |  |
| cosmo | 0.298.0 | 1,309 | 1,316 | 1,269 | 1.6% | non-compatible response (7 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 614 | 630 | 610 | 1.1% |  |
| apollo-router | v2.12.1 | 394 | 405 | 389 | 1.3% |  |
| hive-gateway | 2.5.14 | 272 | 277 | 268 | 1.2% |  |
| apollo-gateway | 2.13.3 | 246 | 247 | 244 | 0.4% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,488 | 2,616 | 2,456 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,945 | 1,988 | 1,913 | 1.1% |  |
| grafbase | 0.53.2 | 1,517 | 1,547 | 1,495 | 1.1% |  |
| cosmo | 0.298.0 | 1,192 | 1,207 | 1,184 | 0.8% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 575 | 588 | 568 | 1.2% |  |
| hive-gateway | 2.5.14 | 268 | 269 | 264 | 0.7% |  |
| apollo-gateway | 2.13.3 | 241 | 244 | 240 | 0.6% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1106790     ✗ 0     
     data_received..................: 32 GB   269 MB/s
     data_sent......................: 444 MB  3.7 MB/s
     http_req_blocked...............: avg=2.75µs  min=972ns  med=2.14µs  max=15.49ms  p(90)=3.37µs   p(95)=4.01µs   p(99.9)=31.98µs
     http_req_connecting............: avg=119ns   min=0s     med=0s      max=2.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.02ms min=1.71ms med=14.99ms max=289.73ms p(90)=23.69ms  p(95)=27.91ms  p(99.9)=52.02ms
       { expected_response:true }...: avg=16.02ms min=1.71ms med=14.99ms max=289.73ms p(90)=23.69ms  p(95)=27.91ms  p(99.9)=52.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 369030
     http_req_receiving.............: avg=147.6µs min=26.9µs med=48.62µs max=50.32ms  p(90)=100.79µs p(95)=287.79µs p(99.9)=14.06ms
     http_req_sending...............: avg=62.63µs min=5.22µs med=9.06µs  max=64.43ms  p(90)=15.55µs  p(95)=123.99µs p(99.9)=14.54ms
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.81ms min=1.62ms med=14.84ms max=289.02ms p(90)=23.36ms  p(95)=27.37ms  p(99.9)=50.65ms
     http_reqs......................: 369030  3070.021364/s
     iteration_duration.............: avg=16.25ms min=2.01ms med=15.2ms  max=328.92ms p(90)=23.92ms  p(95)=28.18ms  p(99.9)=53.84ms
     iterations.....................: 368930  3069.189448/s
     success_rate...................: 100.00% ✓ 368930      ✗ 0     
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

     checks.........................: 100.00% ✓ 771264      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.17µs   min=1.03µs  med=2.34µs   max=13.1ms   p(90)=3.52µs   p(95)=4.13µs   p(99.9)=36.05µs 
     http_req_connecting............: avg=377ns    min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.09ms  min=2.51ms  med=14.82ms  max=304.2ms  p(90)=51.42ms  p(95)=70.05ms  p(99.9)=168.5ms 
       { expected_response:true }...: avg=23.09ms  min=2.51ms  med=14.82ms  max=304.2ms  p(90)=51.42ms  p(95)=70.05ms  p(99.9)=168.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 257188
     http_req_receiving.............: avg=677.83µs min=51.26µs med=107.03µs max=213.5ms  p(90)=977.68µs p(95)=1.54ms   p(99.9)=60.9ms  
     http_req_sending...............: avg=47.73µs  min=5.21µs  med=9.55µs   max=244.46ms p(90)=15.73µs  p(95)=111.77µs p(99.9)=3.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.36ms  min=2.41ms  med=14.3ms   max=303.55ms p(90)=50ms     p(95)=68.51ms  p(99.9)=166.82ms
     http_reqs......................: 257188  2137.748273/s
     iteration_duration.............: avg=23.32ms  min=3.36ms  med=15.04ms  max=330.04ms p(90)=51.66ms  p(95)=70.29ms  p(99.9)=170.15ms
     iterations.....................: 257088  2136.917073/s
     success_rate...................: 100.00% ✓ 257088      ✗ 0     
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

     checks.........................: 100.00% ✓ 745059      ✗ 0     
     data_received..................: 22 GB   182 MB/s
     data_sent......................: 299 MB  2.5 MB/s
     http_req_blocked...............: avg=3.59µs   min=1.03µs  med=2.59µs  max=10.94ms  p(90)=4.24µs   p(95)=5.08µs   p(99.9)=45.23µs
     http_req_connecting............: avg=424ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.9ms   min=2.04ms  med=23.66ms max=337.88ms p(90)=28.69ms  p(95)=30.96ms  p(99.9)=52.88ms
       { expected_response:true }...: avg=23.9ms   min=2.04ms  med=23.66ms max=337.88ms p(90)=28.69ms  p(95)=30.96ms  p(99.9)=52.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 248453
     http_req_receiving.............: avg=112.75µs min=29.04µs med=60.6µs  max=108.75ms p(90)=106.89µs p(95)=222.7µs  p(99.9)=8.28ms 
     http_req_sending...............: avg=48.4µs   min=5.28µs  med=10.94µs max=165.64ms p(90)=19.14µs  p(95)=125.03µs p(99.9)=3.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.74ms  min=1.94ms  med=23.54ms max=337.75ms p(90)=28.51ms  p(95)=30.71ms  p(99.9)=52.07ms
     http_reqs......................: 248453  2065.88356/s
     iteration_duration.............: avg=24.14ms  min=3.44ms  med=23.87ms max=346.96ms p(90)=28.92ms  p(95)=31.21ms  p(99.9)=53.76ms
     iterations.....................: 248353  2065.052061/s
     success_rate...................: 100.00% ✓ 248353      ✗ 0     
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

     checks.........................: 100.00% ✓ 472038      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 189 MB  1.6 MB/s
     http_req_blocked...............: avg=3.24µs  min=972ns   med=2.23µs  max=4.09ms   p(90)=3.55µs  p(95)=4.16µs   p(99.9)=31.17µs
     http_req_connecting............: avg=698ns   min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.89ms min=2.15ms  med=37.32ms max=330.71ms p(90)=53.34ms p(95)=58.36ms  p(99.9)=81.83ms
       { expected_response:true }...: avg=37.89ms min=2.15ms  med=37.32ms max=330.71ms p(90)=53.34ms p(95)=58.36ms  p(99.9)=81.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157446
     http_req_receiving.............: avg=81.89µs min=28.65µs med=60.94µs max=126.01ms p(90)=96.58µs p(95)=114.42µs p(99.9)=1.95ms 
     http_req_sending...............: avg=25.19µs min=5.35µs  med=10.64µs max=78.09ms  p(90)=16.24µs p(95)=20.16µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.78ms min=2.05ms  med=37.22ms max=291.29ms p(90)=53.23ms p(95)=58.25ms  p(99.9)=81.36ms
     http_reqs......................: 157446  1309.048416/s
     iteration_duration.............: avg=38.12ms min=4.08ms  med=37.52ms max=340.81ms p(90)=53.54ms p(95)=58.57ms  p(99.9)=82.42ms
     iterations.....................: 157346  1308.216989/s
     success_rate...................: 100.00% ✓ 157346      ✗ 0     
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

     checks.........................: 100.00% ✓ 222009     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   739 kB/s
     http_req_blocked...............: avg=4.43µs  min=1.05µs  med=2.63µs  max=4.29ms   p(90)=4.14µs  p(95)=4.73µs   p(99.9)=43.42µs 
     http_req_connecting............: avg=1.45µs  min=0s      med=0s      max=4.25ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.75ms min=3.69ms  med=78.38ms max=370.33ms p(90)=97.9ms  p(95)=107.33ms p(99.9)=202.48ms
       { expected_response:true }...: avg=80.75ms min=3.69ms  med=78.38ms max=370.33ms p(90)=97.9ms  p(95)=107.33ms p(99.9)=202.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74103
     http_req_receiving.............: avg=84.59µs min=31.44µs med=71.87µs max=61.44ms  p(90)=105.8µs p(95)=118.92µs p(99.9)=1.06ms  
     http_req_sending...............: avg=23.96µs min=5.55µs  med=12.06µs max=228.04ms p(90)=17.9µs  p(95)=20.24µs  p(99.9)=708.87µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.64ms min=3.63ms  med=78.28ms max=369.59ms p(90)=97.8ms  p(95)=107.2ms  p(99.9)=201.88ms
     http_reqs......................: 74103   614.887678/s
     iteration_duration.............: avg=81.09ms min=20.09ms med=78.6ms  max=381.13ms p(90)=98.15ms p(95)=107.6ms  p(99.9)=205.43ms
     iterations.....................: 74003   614.057903/s
     success_rate...................: 100.00% ✓ 74003      ✗ 0    
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

     checks.........................: 100.00% ✓ 142536     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   474 kB/s
     http_req_blocked...............: avg=5.69µs   min=1.18µs  med=3.22µs   max=4.25ms   p(90)=4.6µs    p(95)=5.13µs   p(99.9)=283.45µs
     http_req_connecting............: avg=2.23µs   min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=203.85µs
     http_req_duration..............: avg=125.79ms min=5.5ms   med=125.53ms max=376.54ms p(90)=151.9ms  p(95)=159.77ms p(99.9)=198.17ms
       { expected_response:true }...: avg=125.79ms min=5.5ms   med=125.53ms max=376.54ms p(90)=151.9ms  p(95)=159.77ms p(99.9)=198.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47612
     http_req_receiving.............: avg=90.25µs  min=30.6µs  med=82.43µs  max=125.94ms p(90)=113.78µs p(95)=125.04µs p(99.9)=639.19µs
     http_req_sending...............: avg=28.6µs   min=5.7µs   med=15.13µs  max=178.57ms p(90)=20.59µs  p(95)=22.33µs  p(99.9)=583.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.67ms min=5.4ms   med=125.43ms max=375.79ms p(90)=151.8ms  p(95)=159.65ms p(99.9)=196.96ms
     http_reqs......................: 47612   394.427829/s
     iteration_duration.............: avg=126.31ms min=29.24ms med=125.82ms max=387.1ms  p(90)=152.17ms p(95)=160.06ms p(99.9)=200.85ms
     iterations.....................: 47512   393.599408/s
     success_rate...................: 100.00% ✓ 47512      ✗ 0    
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

     checks.........................: 100.00% ✓ 98508      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.88µs   min=1.25µs  med=3.3µs    max=4.87ms   p(90)=4.69µs   p(95)=5.31µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=3.4µs    min=0s      med=0s       max=4.83ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=181.99ms min=5.86ms  med=165.05ms max=652.98ms p(90)=216.29ms p(95)=267.53ms p(99.9)=566.43ms
       { expected_response:true }...: avg=181.99ms min=5.86ms  med=165.05ms max=652.98ms p(90)=216.29ms p(95)=267.53ms p(99.9)=566.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32936
     http_req_receiving.............: avg=97.78µs  min=33.74µs med=91.01µs  max=48.53ms  p(90)=123.11µs p(95)=135.94µs p(99.9)=597.92µs
     http_req_sending...............: avg=26.07µs  min=6.23µs  med=16.22µs  max=83.28ms  p(90)=21.67µs  p(95)=23.52µs  p(99.9)=545.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.87ms min=5.73ms  med=164.93ms max=652.89ms p(90)=216.18ms p(95)=267.4ms  p(99.9)=566.34ms
     http_reqs......................: 32936   272.615324/s
     iteration_duration.............: avg=182.82ms min=38.66ms med=165.43ms max=653.19ms p(90)=216.7ms  p(95)=269.05ms p(99.9)=566.73ms
     iterations.....................: 32836   271.787612/s
     success_rate...................: 100.00% ✓ 32836      ✗ 0    
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

     checks.........................: 100.00% ✓ 89154      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=7.07µs   min=1.18µs  med=3.19µs   max=4.69ms   p(90)=4.39µs   p(95)=4.91µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.62µs   min=0s      med=0s       max=4.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=201.11ms min=8.48ms  med=214.82ms max=379.27ms p(90)=269ms    p(95)=279.52ms p(99.9)=351.45ms
       { expected_response:true }...: avg=201.11ms min=8.48ms  med=214.82ms max=379.27ms p(90)=269ms    p(95)=279.52ms p(99.9)=351.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29818
     http_req_receiving.............: avg=95.52µs  min=32.59µs med=87.77µs  max=91.49ms  p(90)=119.05µs p(95)=131.16µs p(99.9)=643.38µs
     http_req_sending...............: avg=28.78µs  min=6.02µs  med=15.67µs  max=130.52ms p(90)=20.52µs  p(95)=22.28µs  p(99.9)=589.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.98ms min=8.39ms  med=214.39ms max=378.99ms p(90)=268.9ms  p(95)=279.39ms p(99.9)=350.85ms
     http_reqs......................: 29818   246.252875/s
     iteration_duration.............: avg=202.02ms min=63.73ms med=216.82ms max=391.43ms p(90)=269.3ms  p(95)=279.81ms p(99.9)=352.78ms
     iterations.....................: 29718   245.427022/s
     success_rate...................: 100.00% ✓ 29718      ✗ 0    
     vus............................: 35      min=35       max=50 
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

     checks.........................: 100.00% ✓ 897243      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 360 MB  3.0 MB/s
     http_req_blocked...............: avg=2.79µs   min=1.03µs  med=2.12µs  max=10.62ms  p(90)=3.53µs   p(95)=4.36µs   p(99.9)=33.44µs
     http_req_connecting............: avg=183ns    min=0s      med=0s      max=2.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.81ms  min=1.85ms  med=19.23ms max=321.63ms p(90)=27.48ms  p(95)=30.76ms  p(99.9)=53.08ms
       { expected_response:true }...: avg=19.81ms  min=1.85ms  med=19.23ms max=321.63ms p(90)=27.48ms  p(95)=30.76ms  p(99.9)=53.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299181
     http_req_receiving.............: avg=119.77µs min=27.31µs med=52.41µs max=111.81ms p(90)=103.91µs p(95)=270.37µs p(99.9)=10.17ms
     http_req_sending...............: avg=53.09µs  min=5.21µs  med=9.72µs  max=73.47ms  p(90)=18.36µs  p(95)=125.17µs p(99.9)=5.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.64ms  min=1.77ms  med=19.09ms max=321.13ms p(90)=27.26ms  p(95)=30.44ms  p(99.9)=52.3ms 
     http_reqs......................: 299181  2488.254032/s
     iteration_duration.............: avg=20.05ms  min=3.3ms   med=19.44ms max=331.5ms  p(90)=27.71ms  p(95)=31.01ms  p(99.9)=53.65ms
     iterations.....................: 299081  2487.422344/s
     success_rate...................: 100.00% ✓ 299081      ✗ 0     
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

     checks.........................: 100.00% ✓ 701301      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 281 MB  2.3 MB/s
     http_req_blocked...............: avg=2.9µs    min=1µs     med=2.15µs   max=4.41ms   p(90)=3.57µs  p(95)=4.3µs    p(99.9)=35.2µs  
     http_req_connecting............: avg=336ns    min=0s      med=0s       max=4.14ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.42ms  min=1.88ms  med=17.53ms  max=514.68ms p(90)=53.39ms p(95)=70.87ms  p(99.9)=194.58ms
       { expected_response:true }...: avg=25.42ms  min=1.88ms  med=17.53ms  max=514.68ms p(90)=53.39ms p(95)=70.87ms  p(99.9)=194.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 233867
     http_req_receiving.............: avg=697.51µs min=51.48µs med=106.57µs max=196.18ms p(90)=1.15ms  p(95)=1.83ms   p(99.9)=58.18ms 
     http_req_sending...............: avg=41.35µs  min=4.95µs  med=9.38µs   max=221.28ms p(90)=17.55µs p(95)=106.93µs p(99.9)=2.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.68ms  min=1.76ms  med=16.98ms  max=513.58ms p(90)=51.99ms p(95)=69.39ms  p(99.9)=191.04ms
     http_reqs......................: 233867  1945.060184/s
     iteration_duration.............: avg=25.65ms  min=2.71ms  med=17.75ms  max=514.89ms p(90)=53.63ms p(95)=71.12ms  p(99.9)=195.65ms
     iterations.....................: 233767  1944.228489/s
     success_rate...................: 100.00% ✓ 233767      ✗ 0     
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

     checks.........................: 100.00% ✓ 547587      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.44µs   min=962ns   med=2.32µs  max=14.2ms   p(90)=4.61µs   p(95)=5.73µs   p(99.9)=43.71µs
     http_req_connecting............: avg=441ns    min=0s      med=0s      max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.6ms   min=2.44ms  med=31.62ms max=323.2ms  p(90)=43.37ms  p(95)=48.34ms  p(99.9)=88.59ms
       { expected_response:true }...: avg=32.6ms   min=2.44ms  med=31.62ms max=323.2ms  p(90)=43.37ms  p(95)=48.34ms  p(99.9)=88.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182629
     http_req_receiving.............: avg=113.21µs min=29.65µs med=62.84µs max=60.68ms  p(90)=133.81µs p(95)=271.73µs p(99.9)=5.55ms 
     http_req_sending...............: avg=46.27µs  min=5.41µs  med=10.52µs max=133.92ms p(90)=23.98µs  p(95)=131.26µs p(99.9)=3.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.44ms  min=2.32ms  med=31.48ms max=322.2ms  p(90)=43.16ms  p(95)=48.1ms   p(99.9)=88.18ms
     http_reqs......................: 182629  1517.878175/s
     iteration_duration.............: avg=32.86ms  min=4.01ms  med=31.85ms max=334.05ms p(90)=43.61ms  p(95)=48.58ms  p(99.9)=89.41ms
     iterations.....................: 182529  1517.047048/s
     success_rate...................: 100.00% ✓ 182529      ✗ 0     
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

     checks.........................: 100.00% ✓ 429912      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.22µs   min=1.04µs  med=2.52µs  max=2.45ms   p(90)=4.05µs   p(95)=4.73µs   p(99.9)=37.23µs
     http_req_connecting............: avg=349ns    min=0s      med=0s      max=2.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.61ms  min=2.22ms  med=41.08ms max=339.45ms p(90)=58.43ms  p(95)=63.62ms  p(99.9)=90.03ms
       { expected_response:true }...: avg=41.61ms  min=2.22ms  med=41.08ms max=339.45ms p(90)=58.43ms  p(95)=63.62ms  p(99.9)=90.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143404
     http_req_receiving.............: avg=125.84µs min=29.69µs med=65.71µs max=252.8ms  p(90)=103.88µs p(95)=123.31µs p(99.9)=4.1ms  
     http_req_sending...............: avg=29.16µs  min=5.4µs   med=11.65µs max=189.06ms p(90)=18.37µs  p(95)=22.41µs  p(99.9)=1.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.46ms  min=2.06ms  med=40.96ms max=122.34ms p(90)=58.31ms  p(95)=63.48ms  p(99.9)=87.28ms
     http_reqs......................: 143404  1192.012003/s
     iteration_duration.............: avg=41.86ms  min=4.39ms  med=41.29ms max=348.93ms p(90)=58.65ms  p(95)=63.84ms  p(99.9)=90.57ms
     iterations.....................: 143304  1191.180777/s
     success_rate...................: 100.00% ✓ 143304      ✗ 0     
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

     checks.........................: 100.00% ✓ 207897     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   692 kB/s
     http_req_blocked...............: avg=4.87µs  min=1.09µs  med=2.94µs  max=4.3ms    p(90)=4.52µs   p(95)=5.13µs   p(99.9)=45.03µs 
     http_req_connecting............: avg=1.64µs  min=0s      med=0s      max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.22ms min=3.86ms  med=84.38ms max=341.67ms p(90)=112.69ms p(95)=125.36ms p(99.9)=224.1ms 
       { expected_response:true }...: avg=86.22ms min=3.86ms  med=84.38ms max=341.67ms p(90)=112.69ms p(95)=125.36ms p(99.9)=224.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 69399
     http_req_receiving.............: avg=87.56µs min=31.06µs med=78.73µs max=33.4ms   p(90)=112.92µs p(95)=126.06µs p(99.9)=895.36µs
     http_req_sending...............: avg=27.13µs min=5.58µs  med=13.6µs  max=111.32ms p(90)=20.12µs  p(95)=22.35µs  p(99.9)=837.62µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.11ms min=3.79ms  med=84.27ms max=340.92ms p(90)=112.59ms p(95)=125.25ms p(99.9)=224.02ms
     http_reqs......................: 69399   575.806939/s
     iteration_duration.............: avg=86.59ms min=19.81ms med=84.63ms max=358.26ms p(90)=112.95ms p(95)=125.68ms p(99.9)=227.03ms
     iterations.....................: 69299   574.977234/s
     success_rate...................: 100.00% ✓ 69299      ✗ 0    
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

     checks.........................: 100.00% ✓ 96984      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   322 kB/s
     http_req_blocked...............: avg=6.76µs   min=1.21µs  med=3.5µs    max=3.99ms   p(90)=4.95µs   p(95)=5.56µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=3.09µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=184.84ms min=5.93ms  med=168.34ms max=605.34ms p(90)=220.41ms p(95)=378.8ms  p(99.9)=535.68ms
       { expected_response:true }...: avg=184.84ms min=5.93ms  med=168.34ms max=605.34ms p(90)=220.41ms p(95)=378.8ms  p(99.9)=535.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32428
     http_req_receiving.............: avg=105.02µs min=34.89µs med=96.28µs  max=133.9ms  p(90)=128.06µs p(95)=140.96µs p(99.9)=532.84µs
     http_req_sending...............: avg=23.5µs   min=6.39µs  med=17.95µs  max=52.25ms  p(90)=22.97µs  p(95)=24.65µs  p(99.9)=503.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.71ms min=5.81ms  med=168.22ms max=605.25ms p(90)=220.25ms p(95)=378.63ms p(99.9)=535.57ms
     http_reqs......................: 32428   268.308089/s
     iteration_duration.............: avg=185.7ms  min=35.83ms med=168.72ms max=605.57ms p(90)=220.84ms p(95)=379.72ms p(99.9)=536.02ms
     iterations.....................: 32328   267.480693/s
     success_rate...................: 100.00% ✓ 32328      ✗ 0    
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

     checks.........................: 100.00% ✓ 87552      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.02µs   min=1.18µs  med=3.38µs   max=4.18ms   p(90)=4.72µs   p(95)=5.27µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=204.73ms min=8.59ms  med=205.6ms  max=445.05ms p(90)=215.66ms p(95)=222ms    p(99.9)=290.16ms
       { expected_response:true }...: avg=204.73ms min=8.59ms  med=205.6ms  max=445.05ms p(90)=215.66ms p(95)=222ms    p(99.9)=290.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29284
     http_req_receiving.............: avg=112.91µs min=33.54µs med=94.49µs  max=191.2ms  p(90)=126.77µs p(95)=140.11µs p(99.9)=644.04µs
     http_req_sending...............: avg=25.86µs  min=6.07µs  med=17.59µs  max=64.44ms  p(90)=22.37µs  p(95)=24.17µs  p(99.9)=547.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.59ms min=8.44ms  med=205.48ms max=407.44ms p(90)=215.53ms p(95)=221.87ms p(99.9)=289.76ms
     http_reqs......................: 29284   241.827673/s
     iteration_duration.............: avg=205.74ms min=39.53ms med=206.05ms max=454.06ms p(90)=215.95ms p(95)=222.3ms  p(99.9)=307.57ms
     iterations.....................: 29184   241.001871/s
     success_rate...................: 100.00% ✓ 29184      ✗ 0    
     vus............................: 45      min=45       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

