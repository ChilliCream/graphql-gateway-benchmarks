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
| hive-router | v0.0.49 | 3,087 | 3,265 | 3,048 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,112 | 2,158 | 2,101 | 0.9% |  |
| grafbase | 0.53.3 | 2,107 | 2,141 | 2,062 | 1.3% |  |
| cosmo | 0.307.0 | 1,279 | 1,299 | 1,271 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 545 | 555 | 542 | 0.9% |  |
| apollo-router | v2.13.1 | 405 | 413 | 396 | 1.5% |  |
| hive-gateway | 2.5.25 | 249 | 255 | 246 | 1.2% |  |
| apollo-gateway | 2.13.3 | 247 | 250 | 247 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,425 | 2,556 | 2,392 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,964 | 2,013 | 1,944 | 1.1% |  |
| grafbase | 0.53.3 | 1,524 | 1,565 | 1,517 | 1.1% |  |
| cosmo | 0.307.0 | 1,213 | 1,232 | 1,206 | 0.8% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 516 | 530 | 510 | 1.4% |  |
| apollo-router | v2.13.1 | 402 | 411 | 398 | 1.1% |  |
| hive-gateway | 2.5.25 | 248 | 252 | 246 | 0.8% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 233 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1112916     ✗ 0     
     data_received..................: 33 GB   271 MB/s
     data_sent......................: 446 MB  3.7 MB/s
     http_req_blocked...............: avg=2.96µs   min=961ns   med=2.14µs  max=26.65ms  p(90)=3.42µs  p(95)=4.08µs   p(99.9)=33.19µs
     http_req_connecting............: avg=272ns    min=0s      med=0s      max=3.72ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.92ms  min=1.61ms  med=14.84ms max=246.1ms  p(90)=23.64ms p(95)=27.98ms  p(99.9)=51.68ms
       { expected_response:true }...: avg=15.92ms  min=1.61ms  med=14.84ms max=246.1ms  p(90)=23.64ms p(95)=27.98ms  p(99.9)=51.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 371072
     http_req_receiving.............: avg=161.69µs min=27.61µs med=47.56µs max=167.86ms p(90)=98.03µs p(95)=286.55µs p(99.9)=18.01ms
     http_req_sending...............: avg=61.85µs  min=5.19µs  med=9.05µs  max=169.61ms p(90)=15.36µs p(95)=121.54µs p(99.9)=11.86ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.7ms   min=1.53ms  med=14.69ms max=88.84ms  p(90)=23.3ms  p(95)=27.47ms  p(99.9)=49.63ms
     http_reqs......................: 371072  3087.147019/s
     iteration_duration.............: avg=16.16ms  min=2.12ms  med=15.05ms max=418.86ms p(90)=23.88ms p(95)=28.28ms  p(99.9)=53.39ms
     iterations.....................: 370972  3086.315066/s
     success_rate...................: 100.00% ✓ 370972      ✗ 0     
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

     checks.........................: 100.00% ✓ 762099      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=2.81µs   min=1.02µs  med=2.19µs   max=16.84ms  p(90)=3.29µs   p(95)=3.84µs  p(99.9)=34.15µs 
     http_req_connecting............: avg=194ns    min=0s      med=0s       max=2.62ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.38ms  min=2.38ms  med=14.64ms  max=328.61ms p(90)=53.18ms  p(95)=71.63ms p(99.9)=167ms   
       { expected_response:true }...: avg=23.38ms  min=2.38ms  med=14.64ms  max=328.61ms p(90)=53.18ms  p(95)=71.63ms p(99.9)=167ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 254133
     http_req_receiving.............: avg=658.99µs min=52.44µs med=110.42µs max=208.98ms p(90)=946.75µs p(95)=1.45ms  p(99.9)=62.07ms 
     http_req_sending...............: avg=41.62µs  min=5.21µs  med=9.11µs   max=131.02ms p(90)=14.65µs  p(95)=99.45µs p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.68ms  min=2.28ms  med=14.12ms  max=328.39ms p(90)=51.89ms  p(95)=70.21ms p(99.9)=164.79ms
     http_reqs......................: 254133  2112.811263/s
     iteration_duration.............: avg=23.61ms  min=3.26ms  med=14.85ms  max=338.02ms p(90)=53.42ms  p(95)=71.86ms p(99.9)=167.9ms 
     iterations.....................: 254033  2111.979883/s
     success_rate...................: 100.00% ✓ 254033      ✗ 0     
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

     checks.........................: 100.00% ✓ 759843      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.16µs   min=981ns   med=2.45µs  max=7.41ms   p(90)=4.01µs   p(95)=4.82µs   p(99.9)=44.99µs
     http_req_connecting............: avg=216ns    min=0s      med=0s      max=3.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.43ms  min=1.95ms  med=23.2ms  max=296.14ms p(90)=28.19ms  p(95)=30.52ms  p(99.9)=52.45ms
       { expected_response:true }...: avg=23.43ms  min=1.95ms  med=23.2ms  max=296.14ms p(90)=28.19ms  p(95)=30.52ms  p(99.9)=52.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253381
     http_req_receiving.............: avg=123.57µs min=29.57µs med=58.47µs max=204.75ms p(90)=105.34µs p(95)=241.16µs p(99.9)=9.67ms 
     http_req_sending...............: avg=51.37µs  min=5.17µs  med=10.34µs max=230.59ms p(90)=18.69µs  p(95)=125.91µs p(99.9)=4ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.26ms  min=1.89ms  med=23.08ms max=139.04ms p(90)=28ms     p(95)=30.25ms  p(99.9)=50.81ms
     http_reqs......................: 253381  2107.004433/s
     iteration_duration.............: avg=23.67ms  min=3.26ms  med=23.41ms max=381.26ms p(90)=28.41ms  p(95)=30.77ms  p(99.9)=53.07ms
     iterations.....................: 253281  2106.172877/s
     success_rate...................: 100.00% ✓ 253281      ✗ 0     
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

     checks.........................: 100.00% ✓ 461292      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.27µs  min=981ns   med=2.42µs  max=3.77ms   p(90)=3.74µs  p(95)=4.36µs   p(99.9)=36.97µs
     http_req_connecting............: avg=522ns   min=0s      med=0s      max=3.41ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.77ms min=2.12ms  med=38.23ms max=318.84ms p(90)=54.8ms  p(95)=59.98ms  p(99.9)=85.59ms
       { expected_response:true }...: avg=38.77ms min=2.12ms  med=38.23ms max=318.84ms p(90)=54.8ms  p(95)=59.98ms  p(99.9)=85.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153864
     http_req_receiving.............: avg=81.6µs  min=28.95µs med=61.14µs max=41.3ms   p(90)=97.16µs p(95)=116.01µs p(99.9)=1.98ms 
     http_req_sending...............: avg=25.37µs min=5.09µs  med=10.48µs max=66.14ms  p(90)=16.02µs p(95)=20.25µs  p(99.9)=1.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.67ms min=2.05ms  med=38.13ms max=317.68ms p(90)=54.69ms p(95)=59.85ms  p(99.9)=85.27ms
     http_reqs......................: 153864  1279.249501/s
     iteration_duration.............: avg=39.01ms min=3.98ms  med=38.44ms max=329.97ms p(90)=55.01ms p(95)=60.18ms  p(99.9)=86.19ms
     iterations.....................: 153764  1278.418085/s
     success_rate...................: 100.00% ✓ 153764      ✗ 0     
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

     checks.........................: 100.00% ✓ 197121     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   656 kB/s
     http_req_blocked...............: avg=5.06µs  min=1.14µs  med=3.11µs  max=4.48ms   p(90)=4.62µs   p(95)=5.27µs   p(99.9)=47.79µs 
     http_req_connecting............: avg=1.63µs  min=0s      med=0s      max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.92ms min=4.27ms  med=85.48ms max=349.33ms p(90)=120.34ms p(95)=136.24ms p(99.9)=233.72ms
       { expected_response:true }...: avg=90.92ms min=4.27ms  med=85.48ms max=349.33ms p(90)=120.34ms p(95)=136.24ms p(99.9)=233.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65807
     http_req_receiving.............: avg=88.99µs min=31.23µs med=78.18µs max=161.51ms p(90)=112.66µs p(95)=126.06µs p(99.9)=878.06µs
     http_req_sending...............: avg=26.79µs min=5.87µs  med=13.93µs max=176.64ms p(90)=20.89µs  p(95)=23.15µs  p(99.9)=748.94µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.8ms  min=4.16ms  med=85.37ms max=327.38ms p(90)=120.23ms p(95)=136.12ms p(99.9)=233.39ms
     http_reqs......................: 65807   545.868033/s
     iteration_duration.............: avg=91.32ms min=22.26ms med=85.74ms max=361.41ms p(90)=120.57ms p(95)=136.61ms p(99.9)=241.01ms
     iterations.....................: 65707   545.038535/s
     success_rate...................: 100.00% ✓ 65707      ✗ 0    
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

     checks.........................: 100.00% ✓ 146478     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   487 kB/s
     http_req_blocked...............: avg=5.49µs   min=1.28µs  med=3.07µs   max=4.64ms   p(90)=4.42µs   p(95)=4.97µs   p(99.9)=510.05µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=478.93µs
     http_req_duration..............: avg=122.42ms min=5.56ms  med=122.17ms max=372.3ms  p(90)=148.39ms p(95)=155.95ms p(99.9)=192.32ms
       { expected_response:true }...: avg=122.42ms min=5.56ms  med=122.17ms max=372.3ms  p(90)=148.39ms p(95)=155.95ms p(99.9)=192.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48926
     http_req_receiving.............: avg=87.79µs  min=33.06µs med=78.67µs  max=111.93ms p(90)=110.65µs p(95)=122.74µs p(99.9)=708.94µs
     http_req_sending...............: avg=24.25µs  min=6.12µs  med=14.24µs  max=99.54ms  p(90)=19.92µs  p(95)=21.75µs  p(99.9)=528.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.31ms min=5.45ms  med=122.06ms max=371.99ms p(90)=148.28ms p(95)=155.84ms p(99.9)=191.64ms
     http_reqs......................: 48926   405.366391/s
     iteration_duration.............: avg=122.92ms min=41.76ms med=122.44ms max=382.7ms  p(90)=148.65ms p(95)=156.24ms p(99.9)=195.06ms
     iterations.....................: 48826   404.537861/s
     success_rate...................: 100.00% ✓ 48826      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 90102      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   299 kB/s
     http_req_blocked...............: avg=6.88µs   min=1.15µs  med=3.3µs    max=4.07ms   p(90)=4.67µs   p(95)=5.29µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.31µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=198.98ms min=6.3ms   med=187.82ms max=660.69ms p(90)=254.07ms p(95)=404.14ms p(99.9)=556.23ms
       { expected_response:true }...: avg=198.98ms min=6.3ms   med=187.82ms max=660.69ms p(90)=254.07ms p(95)=404.14ms p(99.9)=556.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30134
     http_req_receiving.............: avg=97µs     min=30.95µs med=92.07µs  max=16.05ms  p(90)=124.41µs p(95)=137.56µs p(99.9)=590.86µs
     http_req_sending...............: avg=29.04µs  min=5.28µs  med=16.73µs  max=92.17ms  p(90)=21.97µs  p(95)=23.91µs  p(99.9)=575.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.85ms min=6.16ms  med=187.7ms  max=660.61ms p(90)=253.91ms p(95)=404.03ms p(99.9)=556.12ms
     http_reqs......................: 30134   249.258769/s
     iteration_duration.............: avg=199.91ms min=27.88ms med=188.23ms max=660.86ms p(90)=254.59ms p(95)=405.41ms p(99.9)=556.54ms
     iterations.....................: 30034   248.431601/s
     success_rate...................: 100.00% ✓ 30034      ✗ 0    
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

     checks.........................: 100.00% ✓ 89658      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=6.99µs   min=1.26µs  med=3.3µs    max=4.64ms   p(90)=4.57µs   p(95)=5.11µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=3.47µs   min=0s      med=0s       max=4.6ms    p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=199.92ms min=8.45ms  med=201.37ms max=437.88ms p(90)=222.75ms p(95)=226.02ms p(99.9)=293.56ms
       { expected_response:true }...: avg=199.92ms min=8.45ms  med=201.37ms max=437.88ms p(90)=222.75ms p(95)=226.02ms p(99.9)=293.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29986
     http_req_receiving.............: avg=96.64µs  min=30.51µs med=90.49µs  max=37.51ms  p(90)=121.42µs p(95)=133.55µs p(99.9)=558.51µs
     http_req_sending...............: avg=42.79µs  min=5.91µs  med=16.42µs  max=113.85ms p(90)=21.28µs  p(95)=23.08µs  p(99.9)=525.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.78ms min=8.36ms  med=201.26ms max=437.7ms  p(90)=222.63ms p(95)=225.9ms  p(99.9)=292.71ms
     http_reqs......................: 29986   247.710352/s
     iteration_duration.............: avg=200.87ms min=33.6ms  med=201.7ms  max=459.97ms p(90)=223.03ms p(95)=226.3ms  p(99.9)=306.24ms
     iterations.....................: 29886   246.884265/s
     success_rate...................: 100.00% ✓ 29886      ✗ 0    
     vus............................: 27      min=27       max=50 
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

     checks.........................: 100.00% ✓ 874737      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=2.94µs   min=961ns   med=2.12µs  max=13.84ms  p(90)=3.43µs   p(95)=4.2µs    p(99.9)=32.49µs
     http_req_connecting............: avg=342ns    min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.33ms  min=1.79ms  med=19.79ms max=309.6ms  p(90)=28.17ms  p(95)=31.33ms  p(99.9)=53.95ms
       { expected_response:true }...: avg=20.33ms  min=1.79ms  med=19.79ms max=309.6ms  p(90)=28.17ms  p(95)=31.33ms  p(99.9)=53.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291679
     http_req_receiving.............: avg=114.53µs min=27.64µs med=52.48µs max=190.8ms  p(90)=100.14µs p(95)=249.71µs p(99.9)=8.93ms 
     http_req_sending...............: avg=53.84µs  min=5.23µs  med=9.41µs  max=178.7ms  p(90)=17.32µs  p(95)=120.01µs p(99.9)=6.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.16ms  min=1.7ms   med=19.66ms max=298.08ms p(90)=27.97ms  p(95)=31.02ms  p(99.9)=52.73ms
     http_reqs......................: 291679  2425.956121/s
     iteration_duration.............: avg=20.56ms  min=3.4ms   med=20ms    max=331.9ms  p(90)=28.39ms  p(95)=31.57ms  p(99.9)=54.7ms 
     iterations.....................: 291579  2425.124399/s
     success_rate...................: 100.00% ✓ 291579      ✗ 0     
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

     checks.........................: 100.00% ✓ 708246      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=3.5µs    min=972ns  med=2.44µs   max=7.08ms   p(90)=3.85µs  p(95)=4.56µs   p(99.9)=36.54µs 
     http_req_connecting............: avg=685ns    min=0s     med=0s       max=7.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.17ms  min=1.87ms med=17.01ms  max=578.82ms p(90)=53.8ms  p(95)=71.02ms  p(99.9)=184.66ms
       { expected_response:true }...: avg=25.17ms  min=1.87ms med=17.01ms  max=578.82ms p(90)=53.8ms  p(95)=71.02ms  p(99.9)=184.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236182
     http_req_receiving.............: avg=667.97µs min=51.8µs med=108.22µs max=178.67ms p(90)=1.11ms  p(95)=1.78ms   p(99.9)=58.99ms 
     http_req_sending...............: avg=42.56µs  min=4.95µs med=9.9µs    max=36.22ms  p(90)=17.51µs p(95)=109.97µs p(99.9)=3.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.46ms  min=1.74ms med=16.46ms  max=515.48ms p(90)=52.51ms p(95)=69.51ms  p(99.9)=183.35ms
     http_reqs......................: 236182  1964.288237/s
     iteration_duration.............: avg=25.4ms   min=2.68ms med=17.23ms  max=579.07ms p(90)=54.05ms p(95)=71.26ms  p(99.9)=186.91ms
     iterations.....................: 236082  1963.456553/s
     success_rate...................: 100.00% ✓ 236082      ✗ 0     
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

     checks.........................: 100.00% ✓ 550008      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.52µs   min=982ns   med=2.4µs   max=3.94ms   p(90)=4.63µs   p(95)=5.75µs   p(99.9)=40.04µs
     http_req_connecting............: avg=553ns    min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.45ms  min=2.38ms  med=31.51ms max=336.41ms p(90)=42.94ms  p(95)=47.81ms  p(99.9)=92.66ms
       { expected_response:true }...: avg=32.45ms  min=2.38ms  med=31.51ms max=336.41ms p(90)=42.94ms  p(95)=47.81ms  p(99.9)=92.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183436
     http_req_receiving.............: avg=116.69µs min=28.99µs med=62.83µs max=288.02ms p(90)=135.15µs p(95)=275.68µs p(99.9)=6.21ms 
     http_req_sending...............: avg=48.92µs  min=5.43µs  med=10.5µs  max=273.16ms p(90)=24.2µs   p(95)=134.44µs p(99.9)=3.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.29ms  min=2.29ms  med=31.37ms max=307.85ms p(90)=42.76ms  p(95)=47.57ms  p(99.9)=91.85ms
     http_reqs......................: 183436  1524.595217/s
     iteration_duration.............: avg=32.72ms  min=4.96ms  med=31.75ms max=347.12ms p(90)=43.18ms  p(95)=48.06ms  p(99.9)=93.42ms
     iterations.....................: 183336  1523.764085/s
     success_rate...................: 100.00% ✓ 183336      ✗ 0     
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

     checks.........................: 100.00% ✓ 437499      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.55µs  min=1.02µs  med=2.61µs  max=3.74ms   p(90)=4.17µs   p(95)=4.86µs   p(99.9)=36.9µs 
     http_req_connecting............: avg=626ns   min=0s      med=0s      max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.88ms min=2.2ms   med=40.37ms max=320.86ms p(90)=57.56ms  p(95)=62.67ms  p(99.9)=88.38ms
       { expected_response:true }...: avg=40.88ms min=2.2ms   med=40.37ms max=320.86ms p(90)=57.56ms  p(95)=62.67ms  p(99.9)=88.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145933
     http_req_receiving.............: avg=88.16µs min=28.99µs med=67.38µs max=26.74ms  p(90)=107.11µs p(95)=127.62µs p(99.9)=2.01ms 
     http_req_sending...............: avg=27.47µs min=5.23µs  med=11.58µs max=122.11ms p(90)=18.32µs  p(95)=22.47µs  p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.77ms min=2.1ms   med=40.26ms max=320.3ms  p(90)=57.42ms  p(95)=62.55ms  p(99.9)=88.08ms
     http_reqs......................: 145933  1213.179646/s
     iteration_duration.............: avg=41.13ms min=4.02ms  med=40.59ms max=332.77ms p(90)=57.77ms  p(95)=62.89ms  p(99.9)=88.88ms
     iterations.....................: 145833  1212.34832/s
     success_rate...................: 100.00% ✓ 145833      ✗ 0     
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

     checks.........................: 100.00% ✓ 186438     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   620 kB/s
     http_req_blocked...............: avg=5.03µs  min=1.2µs   med=3.14µs  max=4.22ms   p(90)=4.63µs   p(95)=5.22µs   p(99.9)=47.54µs 
     http_req_connecting............: avg=1.66µs  min=0s      med=0s      max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.15ms min=4.22ms  med=93.09ms max=360.13ms p(90)=118.65ms p(95)=133.15ms p(99.9)=228.05ms
       { expected_response:true }...: avg=96.15ms min=4.22ms  med=93.09ms max=360.13ms p(90)=118.65ms p(95)=133.15ms p(99.9)=228.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62246
     http_req_receiving.............: avg=88.56µs min=31.65µs med=81.2µs  max=57.13ms  p(90)=115.34µs p(95)=128.17µs p(99.9)=778.29µs
     http_req_sending...............: avg=24.84µs min=6.02µs  med=14.37µs max=152.18ms p(90)=20.81µs  p(95)=22.94µs  p(99.9)=623.99µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.04ms min=4.15ms  med=92.97ms max=359.15ms p(90)=118.54ms p(95)=133.02ms p(99.9)=227.91ms
     http_reqs......................: 62246   516.199006/s
     iteration_duration.............: avg=96.56ms min=35.71ms med=93.34ms max=382ms    p(90)=118.93ms p(95)=133.48ms p(99.9)=230ms   
     iterations.....................: 62146   515.369717/s
     success_rate...................: 100.00% ✓ 62146      ✗ 0    
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

     checks.........................: 100.00% ✓ 145365     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   483 kB/s
     http_req_blocked...............: avg=5.27µs   min=1.13µs  med=3.55µs   max=3.66ms   p(90)=5.04µs   p(95)=5.62µs   p(99.9)=143.95µs
     http_req_connecting............: avg=1.5µs    min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=80.98µs 
     http_req_duration..............: avg=123.32ms min=5.89ms  med=121.11ms max=352.42ms p(90)=163.5ms  p(95)=176.06ms p(99.9)=227.11ms
       { expected_response:true }...: avg=123.32ms min=5.89ms  med=121.11ms max=352.42ms p(90)=163.5ms  p(95)=176.06ms p(99.9)=227.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48555
     http_req_receiving.............: avg=99.76µs  min=31.8µs  med=88.23µs  max=143.97ms p(90)=119.81µs p(95)=131.85µs p(99.9)=759µs   
     http_req_sending...............: avg=34.65µs  min=5.99µs  med=17.44µs  max=181.77ms p(90)=22.65µs  p(95)=24.48µs  p(99.9)=859.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.19ms min=5.8ms   med=120.99ms max=351.46ms p(90)=163.35ms p(95)=175.93ms p(99.9)=225.88ms
     http_reqs......................: 48555   402.15168/s
     iteration_duration.............: avg=123.86ms min=18.61ms med=121.44ms max=363.35ms p(90)=163.84ms p(95)=176.41ms p(99.9)=232.7ms 
     iterations.....................: 48455   401.323441/s
     success_rate...................: 100.00% ✓ 48455      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 89856      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   298 kB/s
     http_req_blocked...............: avg=6.84µs   min=1.28µs  med=3.54µs   max=4.35ms   p(90)=5.01µs   p(95)=5.61µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=199.49ms min=6.34ms  med=192.24ms max=739.39ms p(90)=251.67ms p(95)=380.17ms p(99.9)=540.12ms
       { expected_response:true }...: avg=199.49ms min=6.34ms  med=192.24ms max=739.39ms p(90)=251.67ms p(95)=380.17ms p(99.9)=540.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30052
     http_req_receiving.............: avg=103.82µs min=32.07µs med=98.07µs  max=26.02ms  p(90)=130.51µs p(95)=143.7µs  p(99.9)=637.53µs
     http_req_sending...............: avg=37.01µs  min=5.87µs  med=18.53µs  max=120.43ms p(90)=23.39µs  p(95)=25.15µs  p(99.9)=883.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.35ms min=6.23ms  med=192.1ms  max=739.27ms p(90)=251.56ms p(95)=380.03ms p(99.9)=540.01ms
     http_reqs......................: 30052   248.38559/s
     iteration_duration.............: avg=200.45ms min=45.27ms med=192.71ms max=739.71ms p(90)=252.2ms  p(95)=381.59ms p(99.9)=540.47ms
     iterations.....................: 29952   247.559071/s
     success_rate...................: 100.00% ✓ 29952      ✗ 0    
     vus............................: 2       min=2        max=50 
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

     checks.........................: 100.00% ✓ 85443      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=7.07µs   min=1.27µs  med=3.36µs   max=4.13ms   p(90)=4.69µs   p(95)=5.26µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=209.77ms min=8.89ms  med=217.45ms max=425.24ms p(90)=253.71ms p(95)=261.61ms p(99.9)=328.79ms
       { expected_response:true }...: avg=209.77ms min=8.89ms  med=217.45ms max=425.24ms p(90)=253.71ms p(95)=261.61ms p(99.9)=328.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28581
     http_req_receiving.............: avg=114.38µs min=33.98µs med=93.74µs  max=95.07ms  p(90)=125.8µs  p(95)=138.75µs p(99.9)=799.07µs
     http_req_sending...............: avg=31.69µs  min=5.73µs  med=17.57µs  max=95.82ms  p(90)=22.23µs  p(95)=24.08µs  p(99.9)=511.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.62ms min=8.73ms  med=217.32ms max=418.41ms p(90)=253.61ms p(95)=261.49ms p(99.9)=328.29ms
     http_reqs......................: 28581   235.923591/s
     iteration_duration.............: avg=210.79ms min=34.36ms med=217.85ms max=443.15ms p(90)=254.01ms p(95)=261.94ms p(99.9)=332.14ms
     iterations.....................: 28481   235.098135/s
     success_rate...................: 100.00% ✓ 28481      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

