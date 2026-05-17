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
| hive-router | v0.0.49 | 2,927 | 3,127 | 2,879 | 2.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,098 | 2,160 | 2,088 | 1.1% |  |
| grafbase | 0.53.3 | 2,045 | 2,115 | 2,017 | 1.6% |  |
| cosmo | 0.307.0 | 1,251 | 1,271 | 1,234 | 1.1% |  |
| hive-gateway-router-runtime | 2.5.25 | 528 | 540 | 523 | 1.1% |  |
| apollo-router | v2.13.1 | 400 | 413 | 394 | 1.7% |  |
| hive-gateway | 2.5.25 | 251 | 256 | 249 | 1.0% |  |
| apollo-gateway | 2.13.3 | 245 | 247 | 244 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,378 | 2,513 | 2,328 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,933 | 1,993 | 1,917 | 1.3% |  |
| grafbase | 0.53.3 | 1,519 | 1,556 | 1,517 | 0.9% |  |
| cosmo | 0.307.0 | 1,191 | 1,196 | 1,161 | 1.3% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 515 | 527 | 508 | 1.2% |  |
| apollo-router | v2.13.1 | 396 | 401 | 384 | 1.5% |  |
| hive-gateway | 2.5.25 | 238 | 244 | 236 | 1.2% |  |
| apollo-gateway | 2.13.3 | 237 | 241 | 235 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1055373     ✗ 0     
     data_received..................: 31 GB   257 MB/s
     data_sent......................: 423 MB  3.5 MB/s
     http_req_blocked...............: avg=3.3µs    min=1.06µs  med=2.38µs  max=23.84ms  p(90)=3.57µs  p(95)=4.21µs   p(99.9)=35.84µs
     http_req_connecting............: avg=301ns    min=0s      med=0s      max=4.61ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.8ms   min=1.62ms  med=15.77ms max=328.86ms p(90)=25.04ms p(95)=29.43ms  p(99.9)=52.58ms
       { expected_response:true }...: avg=16.8ms   min=1.62ms  med=15.77ms max=328.86ms p(90)=25.04ms p(95)=29.43ms  p(99.9)=52.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 351891
     http_req_receiving.............: avg=155.69µs min=28.24µs med=48.55µs max=246.34ms p(90)=95.62µs p(95)=281.95µs p(99.9)=16.16ms
     http_req_sending...............: avg=65.85µs  min=5.24µs  med=9.31µs  max=278.26ms p(90)=15.35µs p(95)=123.48µs p(99.9)=17.06ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.58ms  min=1.55ms  med=15.61ms max=90.22ms  p(90)=24.71ms p(95)=28.95ms  p(99.9)=50.73ms
     http_reqs......................: 351891  2927.654329/s
     iteration_duration.............: avg=17.04ms  min=2.24ms  med=15.98ms max=353.79ms p(90)=25.27ms p(95)=29.72ms  p(99.9)=54.26ms
     iterations.....................: 351791  2926.822351/s
     success_rate...................: 100.00% ✓ 351791      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 756789      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.3µs    min=1.01µs  med=2.42µs   max=12.51ms  p(90)=3.59µs   p(95)=4.19µs   p(99.9)=39.02µs 
     http_req_connecting............: avg=390ns    min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.54ms  min=2.37ms  med=14.92ms  max=314.06ms p(90)=52.96ms  p(95)=71.42ms  p(99.9)=171.29ms
       { expected_response:true }...: avg=23.54ms  min=2.37ms  med=14.92ms  max=314.06ms p(90)=52.96ms  p(95)=71.42ms  p(99.9)=171.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252363
     http_req_receiving.............: avg=660.45µs min=52.79µs med=112.09µs max=183.74ms p(90)=979.49µs p(95)=1.51ms   p(99.9)=57.54ms 
     http_req_sending...............: avg=42.35µs  min=5.37µs  med=9.75µs   max=85.2ms   p(90)=15.98µs  p(95)=111.01µs p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.83ms  min=2.29ms  med=14.4ms   max=313.93ms p(90)=51.52ms  p(95)=69.91ms  p(99.9)=169.45ms
     http_reqs......................: 252363  2098.056704/s
     iteration_duration.............: avg=23.77ms  min=3.38ms  med=15.14ms  max=329.66ms p(90)=53.19ms  p(95)=71.66ms  p(99.9)=172.87ms
     iterations.....................: 252263  2097.225339/s
     success_rate...................: 100.00% ✓ 252263      ✗ 0     
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

     checks.........................: 100.00% ✓ 737802      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 296 MB  2.5 MB/s
     http_req_blocked...............: avg=3.68µs   min=1.05µs  med=2.6µs   max=17.2ms   p(90)=3.99µs   p(95)=4.71µs   p(99.9)=42.12µs
     http_req_connecting............: avg=430ns    min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.14ms  min=2.05ms  med=23.89ms max=302.85ms p(90)=29.12ms  p(95)=31.51ms  p(99.9)=53.85ms
       { expected_response:true }...: avg=24.14ms  min=2.05ms  med=23.89ms max=302.85ms p(90)=29.12ms  p(95)=31.51ms  p(99.9)=53.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 246034
     http_req_receiving.............: avg=113.18µs min=30.39µs med=59.53µs max=223.26ms p(90)=101.72µs p(95)=196.95µs p(99.9)=9.18ms 
     http_req_sending...............: avg=49.15µs  min=5.09µs  med=10.59µs max=117.96ms p(90)=17.25µs  p(95)=119.5µs  p(99.9)=4.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.98ms  min=1.94ms  med=23.77ms max=302.44ms p(90)=28.94ms  p(95)=31.24ms  p(99.9)=53.11ms
     http_reqs......................: 246034  2045.878379/s
     iteration_duration.............: avg=24.38ms  min=3.69ms  med=24.1ms  max=348.13ms p(90)=29.35ms  p(95)=31.76ms  p(99.9)=54.39ms
     iterations.....................: 245934  2045.046836/s
     success_rate...................: 100.00% ✓ 245934      ✗ 0     
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

     checks.........................: 100.00% ✓ 451260      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.04µs  med=2.39µs  max=4.61ms   p(90)=3.67µs  p(95)=4.26µs  p(99.9)=34.85µs
     http_req_connecting............: avg=700ns   min=0s      med=0s      max=4.58ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=39.65ms min=2.17ms  med=39.09ms max=317.68ms p(90)=55.99ms p(95)=61.02ms p(99.9)=85.17ms
       { expected_response:true }...: avg=39.65ms min=2.17ms  med=39.09ms max=317.68ms p(90)=55.99ms p(95)=61.02ms p(99.9)=85.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150520
     http_req_receiving.............: avg=80.6µs  min=28.46µs med=60.31µs max=83.44ms  p(90)=95.12µs p(95)=112.8µs p(99.9)=1.98ms 
     http_req_sending...............: avg=29.2µs  min=5µs     med=10.46µs max=253.46ms p(90)=15.46µs p(95)=19.63µs p(99.9)=1.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=39.54ms min=2.07ms  med=38.99ms max=316.87ms p(90)=55.88ms p(95)=60.89ms p(99.9)=84.62ms
     http_reqs......................: 150520  1251.511067/s
     iteration_duration.............: avg=39.88ms min=3.95ms  med=39.29ms max=335.76ms p(90)=56.2ms  p(95)=61.22ms p(99.9)=85.85ms
     iterations.....................: 150420  1250.679609/s
     success_rate...................: 100.00% ✓ 150420      ✗ 0     
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

     checks.........................: 100.00% ✓ 190788     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   634 kB/s
     http_req_blocked...............: avg=4.58µs  min=1.08µs  med=2.73µs  max=4.14ms   p(90)=4.18µs   p(95)=4.76µs   p(99.9)=45.1µs  
     http_req_connecting............: avg=1.52µs  min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.98ms min=4.11ms  med=91.98ms max=361.9ms  p(90)=114.98ms p(95)=126.99ms p(99.9)=220.53ms
       { expected_response:true }...: avg=93.98ms min=4.11ms  med=91.98ms max=361.9ms  p(90)=114.98ms p(95)=126.99ms p(99.9)=220.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63696
     http_req_receiving.............: avg=85.38µs min=32.33µs med=74.36µs max=88.31ms  p(90)=107.65µs p(95)=119.87µs p(99.9)=932.69µs
     http_req_sending...............: avg=21.91µs min=5.81µs  med=12.47µs max=88.88ms  p(90)=18.47µs  p(95)=20.72µs  p(99.9)=657.57µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.88ms min=4ms     med=91.88ms max=331.01ms p(90)=114.88ms p(95)=126.89ms p(99.9)=219.76ms
     http_reqs......................: 63696   528.238433/s
     iteration_duration.............: avg=94.37ms min=19.14ms med=92.22ms max=387.58ms p(90)=115.23ms p(95)=127.33ms p(99.9)=223.25ms
     iterations.....................: 63596   527.409121/s
     success_rate...................: 100.00% ✓ 63596      ✗ 0    
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

     checks.........................: 100.00% ✓ 144762     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   481 kB/s
     http_req_blocked...............: avg=4.27µs   min=1.23µs  med=3.2µs    max=4.61ms   p(90)=4.57µs   p(95)=5.1µs    p(99.9)=160.78µs
     http_req_connecting............: avg=803ns    min=0s      med=0s       max=2.2ms    p(90)=0s       p(95)=0s       p(99.9)=74.04µs 
     http_req_duration..............: avg=123.88ms min=5.44ms  med=123.55ms max=365.74ms p(90)=150ms    p(95)=157.55ms p(99.9)=196.43ms
       { expected_response:true }...: avg=123.88ms min=5.44ms  med=123.55ms max=365.74ms p(90)=150ms    p(95)=157.55ms p(99.9)=196.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48354
     http_req_receiving.............: avg=88.69µs  min=31.13µs med=80.18µs  max=126.51ms p(90)=112.71µs p(95)=124.31µs p(99.9)=736.18µs
     http_req_sending...............: avg=26.45µs  min=5.96µs  med=14.48µs  max=131.29ms p(90)=20.05µs  p(95)=21.94µs  p(99.9)=624.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.76ms min=5.3ms   med=123.44ms max=364.99ms p(90)=149.89ms p(95)=157.43ms p(99.9)=196.24ms
     http_reqs......................: 48354   400.617569/s
     iteration_duration.............: avg=124.38ms min=39.28ms med=123.84ms max=380.95ms p(90)=150.26ms p(95)=157.81ms p(99.9)=199.19ms
     iterations.....................: 48254   399.789059/s
     success_rate...................: 100.00% ✓ 48254      ✗ 0    
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

     checks.........................: 100.00% ✓ 91098      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   302 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.29µs  med=3.54µs   max=4.32ms   p(90)=5.04µs   p(95)=5.67µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=196.82ms min=6.09ms  med=182.42ms max=623.11ms p(90)=235.7ms  p(95)=387.02ms p(99.9)=538.64ms
       { expected_response:true }...: avg=196.82ms min=6.09ms  med=182.42ms max=623.11ms p(90)=235.7ms  p(95)=387.02ms p(99.9)=538.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30466
     http_req_receiving.............: avg=103.75µs min=35.82µs med=97.15µs  max=43.66ms  p(90)=129.89µs p(95)=143.18µs p(99.9)=778.81µs
     http_req_sending...............: avg=32.72µs  min=6.23µs  med=17.66µs  max=99.02ms  p(90)=22.68µs  p(95)=24.57µs  p(99.9)=614.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.68ms min=6.02ms  med=182.3ms  max=623ms    p(90)=235.58ms p(95)=386.92ms p(99.9)=538.54ms
     http_reqs......................: 30466   251.794235/s
     iteration_duration.............: avg=197.77ms min=40.69ms med=182.78ms max=623.33ms p(90)=236.52ms p(95)=388.17ms p(99.9)=538.94ms
     iterations.....................: 30366   250.967759/s
     success_rate...................: 100.00% ✓ 30366      ✗ 0    
     vus............................: 4       min=4        max=50 
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

     checks.........................: 100.00% ✓ 88854      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.25µs  med=3.2µs    max=4.33ms   p(90)=4.4µs    p(95)=4.88µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=3.43µs   min=0s      med=0s       max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=201.75ms min=8.37ms  med=201.56ms max=461.04ms p(90)=211.3ms  p(95)=217.65ms p(99.9)=284.16ms
       { expected_response:true }...: avg=201.75ms min=8.37ms  med=201.56ms max=461.04ms p(90)=211.3ms  p(95)=217.65ms p(99.9)=284.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29718
     http_req_receiving.............: avg=296.44µs min=33.89µs med=87.59µs  max=268.88ms p(90)=118.56µs p(95)=129.94µs p(99.9)=119.12ms
     http_req_sending...............: avg=24.47µs  min=6.09µs  med=15.5µs   max=113.9ms  p(90)=20.33µs  p(95)=22.04µs  p(99.9)=621.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.42ms min=8.23ms  med=201.36ms max=288.99ms p(90)=211.1ms  p(95)=217.28ms p(99.9)=278.24ms
     http_reqs......................: 29718   245.487685/s
     iteration_duration.............: avg=202.7ms  min=15.3ms  med=201.91ms max=468.98ms p(90)=211.57ms p(95)=217.99ms p(99.9)=311.26ms
     iterations.....................: 29618   244.661628/s
     success_rate...................: 100.00% ✓ 29618      ✗ 0    
     vus............................: 30      min=30       max=50 
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

     checks.........................: 100.00% ✓ 857478      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.59µs   min=1.03µs  med=2.7µs   max=13.01ms  p(90)=4.23µs   p(95)=5.07µs  p(99.9)=40.76µs
     http_req_connecting............: avg=386ns    min=0s      med=0s      max=4.34ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.74ms  min=1.81ms  med=20.3ms  max=337.36ms p(90)=28.63ms  p(95)=31.66ms p(99.9)=53.64ms
       { expected_response:true }...: avg=20.74ms  min=1.81ms  med=20.3ms  max=337.36ms p(90)=28.63ms  p(95)=31.66ms p(99.9)=53.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285926
     http_req_receiving.............: avg=116.48µs min=28.77µs med=58.29µs max=129.33ms p(90)=111.26µs p(95)=281µs   p(99.9)=8.5ms  
     http_req_sending...............: avg=58.85µs  min=5.43µs  med=11.1µs  max=131.9ms  p(90)=19.83µs  p(95)=134.5µs p(99.9)=6.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=20.56ms  min=1.71ms  med=20.15ms max=336.62ms p(90)=28.43ms  p(95)=31.38ms p(99.9)=52.65ms
     http_reqs......................: 285926  2378.146326/s
     iteration_duration.............: avg=20.98ms  min=2.64ms  med=20.52ms max=364.94ms p(90)=28.87ms  p(95)=31.9ms  p(99.9)=54.34ms
     iterations.....................: 285826  2377.314591/s
     success_rate...................: 100.00% ✓ 285826      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 697185      ✗ 0     
     data_received..................: 20 GB   170 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=3.47µs   min=1.03µs  med=2.56µs   max=13.76ms  p(90)=3.94µs  p(95)=4.63µs   p(99.9)=36.49µs 
     http_req_connecting............: avg=453ns    min=0s      med=0s       max=4.25ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.56ms  min=2ms     med=17.59ms  max=595.25ms p(90)=54.03ms p(95)=71.15ms  p(99.9)=192.69ms
       { expected_response:true }...: avg=25.56ms  min=2ms     med=17.59ms  max=595.25ms p(90)=54.03ms p(95)=71.15ms  p(99.9)=192.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232495
     http_req_receiving.............: avg=693.96µs min=52.38µs med=108.45µs max=369.99ms p(90)=1.13ms  p(95)=1.83ms   p(99.9)=56.52ms 
     http_req_sending...............: avg=45.33µs  min=5.18µs  med=10.13µs  max=163.71ms p(90)=17.47µs p(95)=107.12µs p(99.9)=3.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.82ms  min=1.85ms  med=17ms     max=595.15ms p(90)=52.76ms p(95)=69.76ms  p(99.9)=188.69ms
     http_reqs......................: 232495  1933.481177/s
     iteration_duration.............: avg=25.8ms   min=2.9ms   med=17.81ms  max=595.49ms p(90)=54.27ms p(95)=71.41ms  p(99.9)=196.68ms
     iterations.....................: 232395  1932.649554/s
     success_rate...................: 100.00% ✓ 232395      ✗ 0     
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

     checks.........................: 100.00% ✓ 548115      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.94µs   min=992ns   med=2.69µs  max=10.87ms  p(90)=4.99µs  p(95)=6.15µs   p(99.9)=43.2µs 
     http_req_connecting............: avg=603ns    min=0s      med=0s      max=4.28ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.55ms  min=2.37ms  med=31.69ms max=326.06ms p(90)=43.23ms p(95)=47.98ms  p(99.9)=84.16ms
       { expected_response:true }...: avg=32.55ms  min=2.37ms  med=31.69ms max=326.06ms p(90)=43.23ms p(95)=47.98ms  p(99.9)=84.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182805
     http_req_receiving.............: avg=118.44µs min=29.82µs med=63.97µs max=155.18ms p(90)=140µs   p(95)=302.44µs p(99.9)=6.37ms 
     http_req_sending...............: avg=50.59µs  min=5.21µs  med=11.31µs max=144.26ms p(90)=25.58µs p(95)=143.41µs p(99.9)=3.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.38ms  min=2.27ms  med=31.55ms max=325.6ms  p(90)=43.03ms p(95)=47.73ms  p(99.9)=83.59ms
     http_reqs......................: 182805  1519.676412/s
     iteration_duration.............: avg=32.82ms  min=3.86ms  med=31.94ms max=370.67ms p(90)=43.48ms p(95)=48.23ms  p(99.9)=84.84ms
     iterations.....................: 182705  1518.845102/s
     success_rate...................: 100.00% ✓ 182705      ✗ 0     
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

     checks.........................: 100.00% ✓ 429666      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.58µs   min=1.12µs  med=2.68µs  max=3.65ms   p(90)=4.08µs   p(95)=4.7µs    p(99.9)=38.05µs
     http_req_connecting............: avg=586ns    min=0s      med=0s      max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.63ms  min=2.08ms  med=41ms    max=358.63ms p(90)=58.73ms  p(95)=64.1ms   p(99.9)=89.85ms
       { expected_response:true }...: avg=41.63ms  min=2.08ms  med=41ms    max=358.63ms p(90)=58.73ms  p(95)=64.1ms   p(99.9)=89.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143322
     http_req_receiving.............: avg=114.48µs min=29.33µs med=65.18µs max=207.07ms p(90)=101.66µs p(95)=119.23µs p(99.9)=2.09ms 
     http_req_sending...............: avg=26.27µs  min=5.47µs  med=11.43µs max=23.64ms  p(90)=16.93µs  p(95)=20.76µs  p(99.9)=1.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.49ms  min=2.02ms  med=40.9ms  max=151.61ms p(90)=58.61ms  p(95)=63.96ms  p(99.9)=89.17ms
     http_reqs......................: 143322  1191.473826/s
     iteration_duration.............: avg=41.88ms  min=3.71ms  med=41.22ms max=370.57ms p(90)=58.95ms  p(95)=64.32ms  p(99.9)=90.38ms
     iterations.....................: 143222  1190.6425/s
     success_rate...................: 100.00% ✓ 143222      ✗ 0     
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

     checks.........................: 100.00% ✓ 186033     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   619 kB/s
     http_req_blocked...............: avg=5.91µs  min=1.18µs  med=3.13µs  max=10.58ms  p(90)=4.63µs   p(95)=5.22µs   p(99.9)=55.02µs 
     http_req_connecting............: avg=2.49µs  min=0s      med=0s      max=10.54ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.37ms min=4.29ms  med=96.7ms  max=333.16ms p(90)=121.56ms p(95)=134.29ms p(99.9)=228.78ms
       { expected_response:true }...: avg=96.37ms min=4.29ms  med=96.7ms  max=333.16ms p(90)=121.56ms p(95)=134.29ms p(99.9)=228.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62111
     http_req_receiving.............: avg=90.64µs min=32.95µs med=81.61µs max=73.86ms  p(90)=114.97µs p(95)=127.46µs p(99.9)=968.83µs
     http_req_sending...............: avg=23.63µs min=5.96µs  med=14.09µs max=48.78ms  p(90)=20.4µs   p(95)=22.54µs  p(99.9)=803.8µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.26ms min=4.22ms  med=96.59ms max=332.38ms p(90)=121.43ms p(95)=134.19ms p(99.9)=228.7ms 
     http_reqs......................: 62111   515.090637/s
     iteration_duration.............: avg=96.77ms min=35.26ms med=96.95ms max=355.79ms p(90)=121.81ms p(95)=134.66ms p(99.9)=230.01ms
     iterations.....................: 62011   514.261331/s
     success_rate...................: 100.00% ✓ 62011      ✗ 0    
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

     checks.........................: 100.00% ✓ 143403     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=5.68µs   min=1.26µs  med=3.47µs   max=4.36ms   p(90)=4.93µs   p(95)=5.49µs   p(99.9)=173.93µs
     http_req_connecting............: avg=1.98µs   min=0s      med=0s       max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=102.41µs
     http_req_duration..............: avg=125.01ms min=5.85ms  med=122.27ms max=343.03ms p(90)=165.8ms  p(95)=178.59ms p(99.9)=227.34ms
       { expected_response:true }...: avg=125.01ms min=5.85ms  med=122.27ms max=343.03ms p(90)=165.8ms  p(95)=178.59ms p(99.9)=227.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47901
     http_req_receiving.............: avg=91.91µs  min=31.38µs med=86.85µs  max=18.12ms  p(90)=118.21µs p(95)=130.32µs p(99.9)=654.34µs
     http_req_sending...............: avg=42.03µs  min=6.01µs  med=16.63µs  max=220.62ms p(90)=21.92µs  p(95)=23.77µs  p(99.9)=852.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.88ms min=5.72ms  med=122.16ms max=342.46ms p(90)=165.67ms p(95)=178.45ms p(99.9)=226.63ms
     http_reqs......................: 47901   396.731817/s
     iteration_duration.............: avg=125.55ms min=13.73ms med=122.61ms max=353.86ms p(90)=166.12ms p(95)=178.94ms p(99.9)=229.96ms
     iterations.....................: 47801   395.903584/s
     success_rate...................: 100.00% ✓ 47801      ✗ 0    
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

     checks.........................: 100.00% ✓ 86349      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.46µs   min=1.21µs  med=3.47µs   max=4.16ms   p(90)=4.81µs   p(95)=5.35µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=207.6ms  min=6.48ms  med=198.76ms max=633.44ms p(90)=258.36ms p(95)=399.21ms p(99.9)=563.1ms 
       { expected_response:true }...: avg=207.6ms  min=6.48ms  med=198.76ms max=633.44ms p(90)=258.36ms p(95)=399.21ms p(99.9)=563.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28883
     http_req_receiving.............: avg=112.27µs min=34.13µs med=94.05µs  max=81.25ms  p(90)=125.64µs p(95)=139.33µs p(99.9)=834.3µs 
     http_req_sending...............: avg=29.81µs  min=6.04µs  med=17.2µs   max=121.25ms p(90)=22.1µs   p(95)=23.8µs   p(99.9)=649.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.46ms min=6.35ms  med=198.62ms max=633.33ms p(90)=258.24ms p(95)=399.06ms p(99.9)=563.03ms
     http_reqs......................: 28883   238.810096/s
     iteration_duration.............: avg=208.61ms min=35.49ms med=199.22ms max=633.65ms p(90)=259.07ms p(95)=400.41ms p(99.9)=563.3ms 
     iterations.....................: 28783   237.983277/s
     success_rate...................: 100.00% ✓ 28783      ✗ 0    
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

     checks.........................: 100.00% ✓ 86088      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=6.75µs   min=1.24µs  med=3.24µs   max=3.83ms   p(90)=4.49µs   p(95)=5.01µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=3.26µs   min=0s      med=0s       max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=208.21ms min=8.73ms  med=199.74ms max=447.89ms p(90)=236.72ms p(95)=245.87ms p(99.9)=316.12ms
       { expected_response:true }...: avg=208.21ms min=8.73ms  med=199.74ms max=447.89ms p(90)=236.72ms p(95)=245.87ms p(99.9)=316.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28796
     http_req_receiving.............: avg=97.91µs  min=32.73µs med=91.51µs  max=40.25ms  p(90)=122.74µs p(95)=134.89µs p(99.9)=645.2µs 
     http_req_sending...............: avg=35.63µs  min=6.12µs  med=16.27µs  max=110.12ms p(90)=21.24µs  p(95)=23.01µs  p(99.9)=554.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.07ms min=8.59ms  med=199.62ms max=447.27ms p(90)=236.61ms p(95)=245.74ms p(99.9)=315.99ms
     http_reqs......................: 28796   237.770386/s
     iteration_duration.............: avg=209.22ms min=43.16ms med=199.99ms max=478.13ms p(90)=237.01ms p(95)=246.17ms p(99.9)=333.95ms
     iterations.....................: 28696   236.94468/s
     success_rate...................: 100.00% ✓ 28696      ✗ 0    
     vus............................: 43      min=43       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

