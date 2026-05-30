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
| hive-router | v0.0.49 | 3,048 | 3,249 | 3,029 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,190 | 2,241 | 2,180 | 0.9% |  |
| grafbase | 0.53.3 | 2,108 | 2,166 | 2,091 | 1.1% |  |
| cosmo | 0.307.0 | 1,282 | 1,304 | 1,278 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 555 | 563 | 550 | 0.8% |  |
| apollo-router | v2.13.1 | 402 | 413 | 398 | 1.3% |  |
| apollo-gateway | 2.13.3 | 248 | 250 | 246 | 0.6% |  |
| hive-gateway | 2.5.25 | 244 | 246 | 242 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,356 | 2,481 | 2,326 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,985 | 2,040 | 1,972 | 1.1% |  |
| grafbase | 0.53.3 | 1,529 | 1,547 | 1,512 | 0.8% |  |
| cosmo | 0.307.0 | 1,183 | 1,203 | 1,174 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 514 | 526 | 510 | 1.1% |  |
| apollo-router | v2.13.1 | 392 | 403 | 385 | 1.5% |  |
| apollo-gateway | 2.13.3 | 239 | 242 | 239 | 0.5% |  |
| hive-gateway | 2.5.25 | 238 | 242 | 237 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1098984     ✗ 0     
     data_received..................: 32 GB   267 MB/s
     data_sent......................: 440 MB  3.7 MB/s
     http_req_blocked...............: avg=3.2µs    min=972ns   med=2.42µs  max=21.25ms  p(90)=3.69µs   p(95)=4.39µs   p(99.9)=36.66µs
     http_req_connecting............: avg=305ns    min=0s      med=0s      max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.13ms  min=1.63ms  med=15.11ms max=324.88ms p(90)=23.95ms  p(95)=28.03ms  p(99.9)=52.13ms
       { expected_response:true }...: avg=16.13ms  min=1.63ms  med=15.11ms max=324.88ms p(90)=23.95ms  p(95)=28.03ms  p(99.9)=52.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 366428
     http_req_receiving.............: avg=149.48µs min=27.72µs med=50.91µs max=289.03ms p(90)=107.44µs p(95)=297.56µs p(99.9)=13.92ms
     http_req_sending...............: avg=64.77µs  min=5.4µs   med=9.54µs  max=206.52ms p(90)=16.42µs  p(95)=128.72µs p(99.9)=11.96ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.92ms  min=1.58ms  med=14.95ms max=320.4ms  p(90)=23.62ms  p(95)=27.57ms  p(99.9)=50.19ms
     http_reqs......................: 366428  3048.250001/s
     iteration_duration.............: avg=16.37ms  min=2.16ms  med=15.33ms max=342.06ms p(90)=24.19ms  p(95)=28.3ms   p(99.9)=53.86ms
     iterations.....................: 366328  3047.418119/s
     success_rate...................: 100.00% ✓ 366328      ✗ 0     
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

     checks.........................: 100.00% ✓ 790278      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 317 MB  2.6 MB/s
     http_req_blocked...............: avg=3.25µs   min=982ns   med=2.22µs   max=18.07ms  p(90)=3.42µs   p(95)=4.03µs   p(99.9)=34.42µs 
     http_req_connecting............: avg=422ns    min=0s      med=0s       max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.53ms  min=2.43ms  med=14.59ms  max=328.16ms p(90)=49.36ms  p(95)=67.95ms  p(99.9)=165.93ms
       { expected_response:true }...: avg=22.53ms  min=2.43ms  med=14.59ms  max=328.16ms p(90)=49.36ms  p(95)=67.95ms  p(99.9)=165.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263526
     http_req_receiving.............: avg=633.65µs min=50.87µs med=102.07µs max=175.5ms  p(90)=968.52µs p(95)=1.51ms   p(99.9)=53.93ms 
     http_req_sending...............: avg=46.04µs  min=5.29µs  med=9.17µs   max=234.36ms p(90)=15.32µs  p(95)=111.03µs p(99.9)=3.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.85ms  min=2.33ms  med=14.09ms  max=328.06ms p(90)=48.04ms  p(95)=66.48ms  p(99.9)=162.69ms
     http_reqs......................: 263526  2190.493129/s
     iteration_duration.............: avg=22.77ms  min=3.06ms  med=14.81ms  max=344.36ms p(90)=49.6ms   p(95)=68.19ms  p(99.9)=167.8ms 
     iterations.....................: 263426  2189.661904/s
     success_rate...................: 100.00% ✓ 263426      ✗ 0     
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

     checks.........................: 100.00% ✓ 760503      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.53µs   min=972ns  med=2.4µs   max=19.05ms  p(90)=3.98µs   p(95)=4.82µs   p(99.9)=47.92µs
     http_req_connecting............: avg=470ns    min=0s     med=0s      max=4.84ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.41ms  min=1.88ms med=23.15ms max=322.01ms p(90)=28.32ms  p(95)=30.94ms  p(99.9)=52.95ms
       { expected_response:true }...: avg=23.41ms  min=1.88ms med=23.15ms max=322.01ms p(90)=28.32ms  p(95)=30.94ms  p(99.9)=52.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253601
     http_req_receiving.............: avg=120.57µs min=28.8µs med=57.02µs max=169.65ms p(90)=103.36µs p(95)=241.03µs p(99.9)=10.35ms
     http_req_sending...............: avg=51.38µs  min=5.31µs med=10.1µs  max=128.32ms p(90)=18.21µs  p(95)=124.04µs p(99.9)=5.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.24ms  min=1.82ms med=23.03ms max=301.16ms p(90)=28.12ms  p(95)=30.6ms   p(99.9)=51.79ms
     http_reqs......................: 253601  2108.75663/s
     iteration_duration.............: avg=23.66ms  min=3.27ms med=23.37ms max=340.36ms p(90)=28.55ms  p(95)=31.2ms   p(99.9)=53.56ms
     iterations.....................: 253501  2107.925105/s
     success_rate...................: 100.00% ✓ 253501      ✗ 0     
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

     checks.........................: 100.00% ✓ 462324      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.09µs  min=1.1µs   med=2.47µs  max=4.08ms   p(90)=3.91µs  p(95)=4.57µs   p(99.9)=35.94µs
     http_req_connecting............: avg=274ns   min=0s      med=0s      max=2.38ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.69ms min=2.14ms  med=38.11ms max=307.25ms p(90)=54.55ms p(95)=59.55ms  p(99.9)=85.45ms
       { expected_response:true }...: avg=38.69ms min=2.14ms  med=38.11ms max=307.25ms p(90)=54.55ms p(95)=59.55ms  p(99.9)=85.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154208
     http_req_receiving.............: avg=83.69µs min=29.31µs med=61.65µs max=48.72ms  p(90)=98.02µs p(95)=116.67µs p(99.9)=2.24ms 
     http_req_sending...............: avg=29.8µs  min=5.2µs   med=10.72µs max=129.38ms p(90)=16.52µs p(95)=20.95µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.58ms min=2.06ms  med=38ms    max=306.55ms p(90)=54.45ms p(95)=59.41ms  p(99.9)=85.18ms
     http_reqs......................: 154208  1282.196752/s
     iteration_duration.............: avg=38.92ms min=3.86ms  med=38.31ms max=340.56ms p(90)=54.77ms p(95)=59.76ms  p(99.9)=85.92ms
     iterations.....................: 154108  1281.36528/s
     success_rate...................: 100.00% ✓ 154108      ✗ 0     
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

     checks.........................: 100.00% ✓ 200595     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 80 MB   667 kB/s
     http_req_blocked...............: avg=4.33µs  min=1.09µs  med=2.96µs  max=3.45ms   p(90)=4.61µs   p(95)=5.27µs   p(99.9)=44.36µs 
     http_req_connecting............: avg=1.08µs  min=0s      med=0s      max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.37ms min=4.11ms  med=87.12ms max=330.13ms p(90)=109.44ms p(95)=120.97ms p(99.9)=213.23ms
       { expected_response:true }...: avg=89.37ms min=4.11ms  med=87.12ms max=330.13ms p(90)=109.44ms p(95)=120.97ms p(99.9)=213.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66965
     http_req_receiving.............: avg=85.09µs min=31.84µs med=75.92µs max=42.02ms  p(90)=110.73µs p(95)=123.36µs p(99.9)=975.88µs
     http_req_sending...............: avg=27.22µs min=5.57µs  med=13.21µs max=183.09ms p(90)=20.06µs  p(95)=22.38µs  p(99.9)=654.26µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.26ms min=3.99ms  med=87.02ms max=329.74ms p(90)=109.31ms p(95)=120.87ms p(99.9)=213.04ms
     http_reqs......................: 66965   555.562799/s
     iteration_duration.............: avg=89.74ms min=25.4ms  med=87.36ms max=340.65ms p(90)=109.69ms p(95)=121.29ms p(99.9)=215ms   
     iterations.....................: 66865   554.733167/s
     success_rate...................: 100.00% ✓ 66865      ✗ 0    
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

     checks.........................: 100.00% ✓ 145530     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 58 MB   484 kB/s
     http_req_blocked...............: avg=4.9µs    min=1.21µs  med=3.34µs   max=3.66ms   p(90)=4.75µs   p(95)=5.31µs   p(99.9)=158.62µs
     http_req_connecting............: avg=1.38µs   min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=79.98µs 
     http_req_duration..............: avg=123.23ms min=5.4ms   med=123.08ms max=341.69ms p(90)=149.05ms p(95)=156.86ms p(99.9)=190.75ms
       { expected_response:true }...: avg=123.23ms min=5.4ms   med=123.08ms max=341.69ms p(90)=149.05ms p(95)=156.86ms p(99.9)=190.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48610
     http_req_receiving.............: avg=89.58µs  min=30.3µs  med=81.22µs  max=52.73ms  p(90)=113.12µs p(95)=125.14µs p(99.9)=658.96µs
     http_req_sending...............: avg=26.19µs  min=5.76µs  med=15.31µs  max=134.95ms p(90)=20.77µs  p(95)=22.54µs  p(99.9)=588.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.11ms min=5.29ms  med=122.97ms max=337.97ms p(90)=148.94ms p(95)=156.75ms p(99.9)=190.45ms
     http_reqs......................: 48610   402.681994/s
     iteration_duration.............: avg=123.73ms min=28.85ms med=123.37ms max=351.37ms p(90)=149.32ms p(95)=157.13ms p(99.9)=194.25ms
     iterations.....................: 48510   401.853601/s
     success_rate...................: 100.00% ✓ 48510      ✗ 0    
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

     checks.........................: 100.00% ✓ 90054      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   299 kB/s
     http_req_blocked...............: avg=5.93µs   min=1.26µs  med=3.35µs   max=3.2ms    p(90)=4.62µs   p(95)=5.14µs   p(99.9)=868.64µs
     http_req_connecting............: avg=2.42µs   min=0s      med=0s       max=3.17ms   p(90)=0s       p(95)=0s       p(99.9)=838.55µs
     http_req_duration..............: avg=199.11ms min=8.41ms  med=200.65ms max=355.96ms p(90)=208.08ms p(95)=213.05ms p(99.9)=284.41ms
       { expected_response:true }...: avg=199.11ms min=8.41ms  med=200.65ms max=355.96ms p(90)=208.08ms p(95)=213.05ms p(99.9)=284.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30118
     http_req_receiving.............: avg=94.33µs  min=33.65µs med=87.7µs   max=35.49ms  p(90)=119.92µs p(95)=132.24µs p(99.9)=781.87µs
     http_req_sending...............: avg=24.99µs  min=6.11µs  med=15.87µs  max=40.28ms  p(90)=20.95µs  p(95)=22.71µs  p(99.9)=656.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.99ms min=8.27ms  med=200.54ms max=355.56ms p(90)=207.96ms p(95)=212.94ms p(99.9)=284.31ms
     http_reqs......................: 30118   248.804678/s
     iteration_duration.............: avg=200.01ms min=43.54ms med=200.93ms max=362.72ms p(90)=208.33ms p(95)=213.32ms p(99.9)=284.8ms 
     iterations.....................: 30018   247.978578/s
     success_rate...................: 100.00% ✓ 30018      ✗ 0    
     vus............................: 31      min=31       max=50 
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

     checks.........................: 100.00% ✓ 88221      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   293 kB/s
     http_req_blocked...............: avg=7.52µs   min=1.11µs  med=3.78µs   max=4.05ms   p(90)=5.41µs   p(95)=6.09µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=3.4µs    min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=203.14ms min=6.65ms  med=192.26ms max=686.78ms p(90)=245.32ms p(95)=455.79ms p(99.9)=602ms   
       { expected_response:true }...: avg=203.14ms min=6.65ms  med=192.26ms max=686.78ms p(90)=245.32ms p(95)=455.79ms p(99.9)=602ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 29507
     http_req_receiving.............: avg=103.69µs min=33.49µs med=100.42µs max=5.12ms   p(90)=132.57µs p(95)=146.09µs p(99.9)=505.21µs
     http_req_sending...............: avg=32.65µs  min=6.01µs  med=18.95µs  max=139.73ms p(90)=24.11µs  p(95)=26.1µs   p(99.9)=596.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203ms    min=6.53ms  med=192.14ms max=686.67ms p(90)=245.18ms p(95)=455.71ms p(99.9)=601.88ms
     http_reqs......................: 29507   244.010254/s
     iteration_duration.............: avg=204.13ms min=48.19ms med=192.7ms  max=687.01ms p(90)=245.89ms p(95)=456.31ms p(99.9)=602.37ms
     iterations.....................: 29407   243.183297/s
     success_rate...................: 100.00% ✓ 29407      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 849747      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 341 MB  2.8 MB/s
     http_req_blocked...............: avg=2.84µs   min=1.01µs  med=2.28µs  max=6.6ms    p(90)=3.7µs    p(95)=4.48µs   p(99.9)=33.03µs
     http_req_connecting............: avg=147ns    min=0s      med=0s      max=1.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.94ms  min=1.86ms  med=20.52ms max=372.65ms p(90)=28.95ms  p(95)=31.91ms  p(99.9)=53.11ms
       { expected_response:true }...: avg=20.94ms  min=1.86ms  med=20.52ms max=372.65ms p(90)=28.95ms  p(95)=31.91ms  p(99.9)=53.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 283349
     http_req_receiving.............: avg=130.93µs min=28.43µs med=53.95µs max=298.78ms p(90)=101.39µs p(95)=251.04µs p(99.9)=9.59ms 
     http_req_sending...............: avg=49.8µs   min=5.31µs  med=9.78µs  max=37.03ms  p(90)=17.55µs  p(95)=123.48µs p(99.9)=4.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.76ms  min=1.76ms  med=20.39ms max=77.77ms  p(90)=28.77ms  p(95)=31.63ms  p(99.9)=52.05ms
     http_reqs......................: 283349  2356.600506/s
     iteration_duration.............: avg=21.17ms  min=3.45ms  med=20.74ms max=382.18ms p(90)=29.18ms  p(95)=32.14ms  p(99.9)=53.63ms
     iterations.....................: 283249  2355.76881/s
     success_rate...................: 100.00% ✓ 283249      ✗ 0     
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

     checks.........................: 100.00% ✓ 716109      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 287 MB  2.4 MB/s
     http_req_blocked...............: avg=3.39µs   min=961ns   med=2.54µs   max=9.04ms   p(90)=4.06µs  p(95)=4.84µs   p(99.9)=37.99µs 
     http_req_connecting............: avg=374ns    min=0s      med=0s       max=4.16ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.88ms  min=1.95ms  med=17.37ms  max=525.78ms p(90)=51.84ms p(95)=68.14ms  p(99.9)=188.39ms
       { expected_response:true }...: avg=24.88ms  min=1.95ms  med=17.37ms  max=525.78ms p(90)=51.84ms p(95)=68.14ms  p(99.9)=188.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 238803
     http_req_receiving.............: avg=709.84µs min=51.66µs med=105.44µs max=357.17ms p(90)=1.15ms  p(95)=1.88ms   p(99.9)=59.83ms 
     http_req_sending...............: avg=44µs     min=5.34µs  med=10.25µs  max=34.84ms  p(90)=19.16µs p(95)=116.56µs p(99.9)=3.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.13ms  min=1.84ms  med=16.8ms   max=525.66ms p(90)=50.45ms p(95)=66.61ms  p(99.9)=180.98ms
     http_reqs......................: 238803  1985.923821/s
     iteration_duration.............: avg=25.12ms  min=2.49ms  med=17.6ms   max=526.19ms p(90)=52.08ms p(95)=68.4ms   p(99.9)=188.99ms
     iterations.....................: 238703  1985.092205/s
     success_rate...................: 100.00% ✓ 238703      ✗ 0     
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

     checks.........................: 100.00% ✓ 551571      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.68µs   min=992ns   med=2.42µs  max=4.47ms   p(90)=4.86µs   p(95)=6.07µs   p(99.9)=42.97µs
     http_req_connecting............: avg=619ns    min=0s      med=0s      max=4.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.35ms  min=2.39ms  med=31.49ms max=328.7ms  p(90)=43.02ms  p(95)=47.65ms  p(99.9)=86.89ms
       { expected_response:true }...: avg=32.35ms  min=2.39ms  med=31.49ms max=328.7ms  p(90)=43.02ms  p(95)=47.65ms  p(99.9)=86.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183957
     http_req_receiving.............: avg=116.52µs min=30.48µs med=61.79µs max=227.43ms p(90)=135.72µs p(95)=286.17µs p(99.9)=5.85ms 
     http_req_sending...............: avg=47.47µs  min=5.31µs  med=10.51µs max=190.31ms p(90)=24.83µs  p(95)=137.74µs p(99.9)=3.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.19ms  min=2.29ms  med=31.36ms max=303.72ms p(90)=42.81ms  p(95)=47.42ms  p(99.9)=86.5ms 
     http_reqs......................: 183957  1529.075565/s
     iteration_duration.............: avg=32.62ms  min=4.65ms  med=31.74ms max=354.65ms p(90)=43.27ms  p(95)=47.91ms  p(99.9)=87.74ms
     iterations.....................: 183857  1528.244352/s
     success_rate...................: 100.00% ✓ 183857      ✗ 0     
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

     checks.........................: 100.00% ✓ 426708      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.79µs  min=1.04µs med=2.68µs  max=3.96ms   p(90)=4.16µs   p(95)=4.84µs   p(99.9)=35.74µs
     http_req_connecting............: avg=734ns   min=0s     med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.92ms min=2.15ms med=41.34ms max=348.35ms p(90)=59.14ms  p(95)=64.39ms  p(99.9)=90.64ms
       { expected_response:true }...: avg=41.92ms min=2.15ms med=41.34ms max=348.35ms p(90)=59.14ms  p(95)=64.39ms  p(99.9)=90.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142336
     http_req_receiving.............: avg=98.4µs  min=30.3µs med=67.28µs max=107.27ms p(90)=105.31µs p(95)=123.63µs p(99.9)=1.97ms 
     http_req_sending...............: avg=25.6µs  min=5.44µs med=11.66µs max=94.14ms  p(90)=17.78µs  p(95)=21.58µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.8ms  min=2.04ms med=41.23ms max=263.3ms  p(90)=59.02ms  p(95)=64.26ms  p(99.9)=90.04ms
     http_reqs......................: 142336  1183.350409/s
     iteration_duration.............: avg=42.17ms min=3.84ms med=41.56ms max=358.57ms p(90)=59.35ms  p(95)=64.6ms   p(99.9)=91.45ms
     iterations.....................: 142236  1182.519031/s
     success_rate...................: 100.00% ✓ 142236      ✗ 0     
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

     checks.........................: 100.00% ✓ 185910     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   618 kB/s
     http_req_blocked...............: avg=5.31µs  min=1.24µs  med=3.16µs  max=4.63ms   p(90)=4.69µs   p(95)=5.32µs   p(99.9)=71.03µs 
     http_req_connecting............: avg=1.85µs  min=0s      med=0s      max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.42ms min=4.39ms  med=94.04ms max=388ms    p(90)=116.57ms p(95)=129.71ms p(99.9)=222.76ms
       { expected_response:true }...: avg=96.42ms min=4.39ms  med=94.04ms max=388ms    p(90)=116.57ms p(95)=129.71ms p(99.9)=222.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62070
     http_req_receiving.............: avg=90.59µs min=30.73µs med=80.78µs max=125.93ms p(90)=114.42µs p(95)=126.83µs p(99.9)=933.39µs
     http_req_sending...............: avg=19.35µs min=5.77µs  med=13.73µs max=13.3ms   p(90)=20.13µs  p(95)=22.16µs  p(99.9)=627.6µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.31ms min=4.31ms  med=93.94ms max=387.81ms p(90)=116.44ms p(95)=129.6ms  p(99.9)=222.64ms
     http_reqs......................: 62070   514.729452/s
     iteration_duration.............: avg=96.83ms min=21.8ms  med=94.3ms  max=401.03ms p(90)=116.85ms p(95)=130.02ms p(99.9)=226.53ms
     iterations.....................: 61970   513.90018/s
     success_rate...................: 100.00% ✓ 61970      ✗ 0    
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

     checks.........................: 100.00% ✓ 142044     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 57 MB   472 kB/s
     http_req_blocked...............: avg=5.76µs   min=1.27µs  med=3.46µs   max=4.63ms   p(90)=4.92µs   p(95)=5.5µs    p(99.9)=231.05µs
     http_req_connecting............: avg=1.93µs   min=0s      med=0s       max=4.5ms    p(90)=0s       p(95)=0s       p(99.9)=130.47µs
     http_req_duration..............: avg=126.25ms min=5.88ms  med=123.59ms max=338.32ms p(90)=167.63ms p(95)=180.12ms p(99.9)=229.74ms
       { expected_response:true }...: avg=126.25ms min=5.88ms  med=123.59ms max=338.32ms p(90)=167.63ms p(95)=180.12ms p(99.9)=229.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47448
     http_req_receiving.............: avg=90.2µs   min=31.37µs med=84.85µs  max=30.57ms  p(90)=116.33µs p(95)=128.46µs p(99.9)=713.89µs
     http_req_sending...............: avg=29.93µs  min=6.09µs  med=15.67µs  max=147.33ms p(90)=21.11µs  p(95)=22.91µs  p(99.9)=744.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=126.13ms min=5.76ms  med=123.47ms max=337.93ms p(90)=167.51ms p(95)=180.02ms p(99.9)=229.48ms
     http_reqs......................: 47448   392.955472/s
     iteration_duration.............: avg=126.76ms min=18.23ms med=123.92ms max=351.41ms p(90)=167.96ms p(95)=180.42ms p(99.9)=231.17ms
     iterations.....................: 47348   392.12729/s
     success_rate...................: 100.00% ✓ 47348      ✗ 0    
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

     checks.........................: 100.00% ✓ 86670      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=6.62µs   min=1.31µs  med=3.64µs   max=3.47ms   p(90)=5.03µs   p(95)=5.62µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.66µs   min=0s      med=0s       max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=206.82ms min=8.57ms  med=206.53ms max=433.14ms p(90)=222.75ms p(95)=236.24ms p(99.9)=305.65ms
       { expected_response:true }...: avg=206.82ms min=8.57ms  med=206.53ms max=433.14ms p(90)=222.75ms p(95)=236.24ms p(99.9)=305.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28990
     http_req_receiving.............: avg=190.64µs min=30.83µs med=95.42µs  max=260.6ms  p(90)=128.7µs  p(95)=142.39µs p(99.9)=1.17ms  
     http_req_sending...............: avg=40.39µs  min=6.26µs  med=17.61µs  max=185.62ms p(90)=22.55µs  p(95)=24.31µs  p(99.9)=946.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.59ms min=8.47ms  med=206.28ms max=377.67ms p(90)=222.56ms p(95)=235.91ms p(99.9)=304ms   
     http_reqs......................: 28990   239.392377/s
     iteration_duration.............: avg=207.83ms min=48.82ms med=207.07ms max=443.87ms p(90)=223.07ms p(95)=236.62ms p(99.9)=318.72ms
     iterations.....................: 28890   238.566601/s
     success_rate...................: 100.00% ✓ 28890      ✗ 0    
     vus............................: 39      min=39       max=50 
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

     checks.........................: 100.00% ✓ 86196      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.66µs   min=1.24µs  med=3.74µs   max=4.68ms   p(90)=5.29µs   p(95)=5.95µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.64µs   min=0s      med=0s       max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=207.94ms min=6.67ms  med=187.98ms max=681.92ms p(90)=242.13ms p(95)=449.25ms p(99.9)=582.27ms
       { expected_response:true }...: avg=207.94ms min=6.67ms  med=187.98ms max=681.92ms p(90)=242.13ms p(95)=449.25ms p(99.9)=582.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28832
     http_req_receiving.............: avg=111.65µs min=35.16µs med=100.45µs max=91.98ms  p(90)=132.29µs p(95)=146.1µs  p(99.9)=812.2µs 
     http_req_sending...............: avg=36.73µs  min=6.17µs  med=18.78µs  max=198.79ms p(90)=23.76µs  p(95)=25.58µs  p(99.9)=611.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.79ms min=6.53ms  med=187.84ms max=681.82ms p(90)=241.98ms p(95)=449.1ms  p(99.9)=582.12ms
     http_reqs......................: 28832   238.366123/s
     iteration_duration.............: avg=208.96ms min=30.84ms med=188.35ms max=682.16ms p(90)=242.68ms p(95)=449.85ms p(99.9)=582.57ms
     iterations.....................: 28732   237.539382/s
     success_rate...................: 100.00% ✓ 28732      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

