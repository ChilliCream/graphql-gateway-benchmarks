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
| hive-router | v0.0.49 | 3,061 | 3,249 | 3,011 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,108 | 2,164 | 2,089 | 1.1% |  |
| grafbase | 0.53.3 | 2,061 | 2,117 | 2,038 | 1.3% |  |
| cosmo | 0.307.0 | 1,246 | 1,260 | 1,231 | 0.9% | non-compatible response (5 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 537 | 548 | 534 | 1.0% |  |
| apollo-router | v2.13.1 | 431 | 439 | 427 | 0.9% |  |
| apollo-gateway | 2.13.3 | 249 | 250 | 248 | 0.3% |  |
| hive-gateway | 2.5.25 | 249 | 252 | 247 | 0.7% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,413 | 2,540 | 2,380 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,921 | 1,987 | 1,909 | 1.3% |  |
| grafbase | 0.53.3 | 1,524 | 1,564 | 1,504 | 1.2% |  |
| cosmo | 0.307.0 | 1,170 | 1,194 | 1,160 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.25 | 513 | 524 | 508 | 1.2% |  |
| apollo-router | v2.13.1 | 372 | 382 | 366 | 1.5% |  |
| hive-gateway | 2.5.25 | 250 | 255 | 247 | 1.1% |  |
| apollo-gateway | 2.13.3 | 238 | 240 | 236 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1103901     ✗ 0     
     data_received..................: 32 GB   269 MB/s
     data_sent......................: 442 MB  3.7 MB/s
     http_req_blocked...............: avg=3.31µs   min=1.07µs  med=2.47µs  max=23.45ms  p(90)=3.75µs   p(95)=4.43µs   p(99.9)=36.08µs
     http_req_connecting............: avg=268ns    min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.06ms  min=1.73ms  med=15.12ms max=314.06ms p(90)=23.66ms  p(95)=27.64ms  p(99.9)=52.53ms
       { expected_response:true }...: avg=16.06ms  min=1.73ms  med=15.12ms max=314.06ms p(90)=23.66ms  p(95)=27.64ms  p(99.9)=52.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 368067
     http_req_receiving.............: avg=148.82µs min=28.05µs med=51.3µs  max=45.68ms  p(90)=107.99µs p(95)=300.65µs p(99.9)=12.3ms 
     http_req_sending...............: avg=61.88µs  min=5.51µs  med=9.62µs  max=195.76ms p(90)=16.71µs  p(95)=127.05µs p(99.9)=9.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.85ms  min=1.68ms  med=14.96ms max=313.44ms p(90)=23.36ms  p(95)=27.19ms  p(99.9)=50.57ms
     http_reqs......................: 368067  3061.859912/s
     iteration_duration.............: avg=16.29ms  min=1.95ms  med=15.33ms max=342.48ms p(90)=23.9ms   p(95)=27.91ms  p(99.9)=54.18ms
     iterations.....................: 367967  3061.028036/s
     success_rate...................: 100.00% ✓ 367967      ✗ 0     
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

     checks.........................: 100.00% ✓ 760575      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=6.16µs   min=1.02µs med=2.39µs   max=24.31ms  p(90)=3.51µs   p(95)=4.09µs   p(99.9)=34µs    
     http_req_connecting............: avg=3.19µs   min=0s     med=0s       max=23.88ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.42ms  min=2.52ms med=14.67ms  max=324.34ms p(90)=53.08ms  p(95)=71.98ms  p(99.9)=170.6ms 
       { expected_response:true }...: avg=23.42ms  min=2.52ms med=14.67ms  max=324.34ms p(90)=53.08ms  p(95)=71.98ms  p(99.9)=170.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 253625
     http_req_receiving.............: avg=669.89µs min=51.5µs med=111.41µs max=298.38ms p(90)=962.52µs p(95)=1.48ms   p(99.9)=61.27ms 
     http_req_sending...............: avg=45.58µs  min=5.35µs med=9.4µs    max=267.82ms p(90)=15.35µs  p(95)=110.07µs p(99.9)=3.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.7ms   min=2.38ms med=14.15ms  max=281.64ms p(90)=51.7ms   p(95)=70.54ms  p(99.9)=167.92ms
     http_reqs......................: 253625  2108.192537/s
     iteration_duration.............: avg=23.65ms  min=3.42ms med=14.88ms  max=346.1ms  p(90)=53.32ms  p(95)=72.23ms  p(99.9)=171.95ms
     iterations.....................: 253525  2107.361313/s
     success_rate...................: 100.00% ✓ 253525      ✗ 0     
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

     checks.........................: 100.00% ✓ 743397      ✗ 0     
     data_received..................: 22 GB   181 MB/s
     data_sent......................: 298 MB  2.5 MB/s
     http_req_blocked...............: avg=3.46µs   min=1.03µs  med=2.59µs  max=13.27ms  p(90)=4.07µs   p(95)=4.87µs   p(99.9)=45.56µs
     http_req_connecting............: avg=262ns    min=0s      med=0s      max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.95ms  min=1.93ms  med=23.72ms max=337.5ms  p(90)=28.98ms  p(95)=31.52ms  p(99.9)=54.84ms
       { expected_response:true }...: avg=23.95ms  min=1.93ms  med=23.72ms max=337.5ms  p(90)=28.98ms  p(95)=31.52ms  p(99.9)=54.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 247899
     http_req_receiving.............: avg=132.73µs min=28.98µs med=60.88µs max=220.48ms p(90)=105.94µs p(95)=224.16µs p(99.9)=11ms   
     http_req_sending...............: avg=48.07µs  min=5.35µs  med=11.04µs max=84.32ms  p(90)=19.04µs  p(95)=123.1µs  p(99.9)=3.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.77ms  min=1.86ms  med=23.6ms  max=116.73ms p(90)=28.8ms   p(95)=31.23ms  p(99.9)=53.53ms
     http_reqs......................: 247899  2061.57212/s
     iteration_duration.............: avg=24.2ms   min=3.28ms  med=23.94ms max=424.93ms p(90)=29.21ms  p(95)=31.78ms  p(99.9)=55.34ms
     iterations.....................: 247799  2060.740503/s
     success_rate...................: 100.00% ✓ 247799      ✗ 0     
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

     checks.........................: 100.00% ✓ 449451      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.27µs   min=1.08µs  med=2.33µs  max=3.86ms   p(90)=3.5µs   p(95)=4.06µs   p(99.9)=32.73µs
     http_req_connecting............: avg=653ns    min=0s      med=0s      max=3.82ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.81ms  min=2.11ms  med=39.24ms max=331.8ms  p(90)=56.19ms p(95)=61.31ms  p(99.9)=84.98ms
       { expected_response:true }...: avg=39.81ms  min=2.11ms  med=39.24ms max=331.8ms  p(90)=56.19ms p(95)=61.31ms  p(99.9)=84.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149917
     http_req_receiving.............: avg=106.17µs min=29.19µs med=59.16µs max=196.52ms p(90)=92.89µs p(95)=110.22µs p(99.9)=2.26ms 
     http_req_sending...............: avg=23.81µs  min=5.14µs  med=10.31µs max=23.49ms  p(90)=15.16µs p(95)=19.2µs   p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.68ms  min=2.01ms  med=39.14ms max=135.07ms p(90)=56.07ms p(95)=61.18ms  p(99.9)=84.2ms 
     http_reqs......................: 149917  1246.369851/s
     iteration_duration.............: avg=40.04ms  min=4.36ms  med=39.44ms max=356.69ms p(90)=56.39ms p(95)=61.5ms   p(99.9)=85.33ms
     iterations.....................: 149817  1245.538478/s
     success_rate...................: 100.00% ✓ 149817      ✗ 0     
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

     checks.........................: 100.00% ✓ 194274     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   646 kB/s
     http_req_blocked...............: avg=4.52µs  min=1.1µs   med=3.06µs  max=3.49ms   p(90)=4.63µs   p(95)=5.27µs   p(99.9)=51.32µs 
     http_req_connecting............: avg=1.15µs  min=0s      med=0s      max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.28ms min=4.28ms  med=89.49ms max=348.28ms p(90)=111.98ms p(95)=124.04ms p(99.9)=215.94ms
       { expected_response:true }...: avg=92.28ms min=4.28ms  med=89.49ms max=348.28ms p(90)=111.98ms p(95)=124.04ms p(99.9)=215.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64858
     http_req_receiving.............: avg=87.42µs min=32.52µs med=77.76µs max=93.44ms  p(90)=112.5µs  p(95)=124.7µs  p(99.9)=981.4µs 
     http_req_sending...............: avg=26.49µs min=5.72µs  med=13.55µs max=119.95ms p(90)=20.3µs   p(95)=22.64µs  p(99.9)=723.3µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.17ms min=4.21ms  med=89.38ms max=347.45ms p(90)=111.86ms p(95)=123.89ms p(99.9)=215.76ms
     http_reqs......................: 64858   537.953846/s
     iteration_duration.............: avg=92.66ms min=27.39ms med=89.72ms max=358.53ms p(90)=112.26ms p(95)=124.35ms p(99.9)=217.57ms
     iterations.....................: 64758   537.124413/s
     success_rate...................: 100.00% ✓ 64758      ✗ 0    
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

     checks.........................: 100.00% ✓ 155835     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   518 kB/s
     http_req_blocked...............: avg=5.73µs   min=1.08µs  med=3.44µs   max=4.23ms   p(90)=4.95µs   p(95)=5.5µs    p(99.9)=141.5µs 
     http_req_connecting............: avg=1.94µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.05ms min=5.62ms  med=114.84ms max=367.31ms p(90)=139.17ms p(95)=146.31ms p(99.9)=180.48ms
       { expected_response:true }...: avg=115.05ms min=5.62ms  med=114.84ms max=367.31ms p(90)=139.17ms p(95)=146.31ms p(99.9)=180.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52045
     http_req_receiving.............: avg=189.43µs min=30.45µs med=85.36µs  max=218.09ms p(90)=116.38µs p(95)=129µs    p(99.9)=1.83ms  
     http_req_sending...............: avg=25.89µs  min=5.41µs  med=16.11µs  max=228.9ms  p(90)=21.53µs  p(95)=23.38µs  p(99.9)=639.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.84ms min=5.49ms  med=114.72ms max=196.3ms  p(90)=139.01ms p(95)=146.12ms p(99.9)=175.2ms 
     http_reqs......................: 52045   431.187963/s
     iteration_duration.............: avg=115.53ms min=7.32ms  med=115.12ms max=380.54ms p(90)=139.47ms p(95)=146.6ms  p(99.9)=181.33ms
     iterations.....................: 51945   430.359472/s
     success_rate...................: 100.00% ✓ 51945      ✗ 0    
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

     checks.........................: 100.00% ✓ 90426      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   300 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.25µs  med=3.38µs   max=4.16ms   p(90)=4.69µs   p(95)=5.22µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=198.23ms min=8.34ms  med=203.57ms max=432ms    p(90)=212.4ms  p(95)=219.32ms p(99.9)=280.4ms 
       { expected_response:true }...: avg=198.23ms min=8.34ms  med=203.57ms max=432ms    p(90)=212.4ms  p(95)=219.32ms p(99.9)=280.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30242
     http_req_receiving.............: avg=98.49µs  min=35.08µs med=90.53µs  max=120.57ms p(90)=121.47µs p(95)=133.96µs p(99.9)=601.55µs
     http_req_sending...............: avg=35.89µs  min=5.89µs  med=16.48µs  max=200.37ms p(90)=21.11µs  p(95)=22.88µs  p(99.9)=567.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.1ms  min=8.2ms   med=203.46ms max=431.34ms p(90)=212.29ms p(95)=219.21ms p(99.9)=280.04ms
     http_reqs......................: 30242   249.836717/s
     iteration_duration.............: avg=199.16ms min=48.38ms med=203.84ms max=446.25ms p(90)=212.69ms p(95)=219.64ms p(99.9)=286.01ms
     iterations.....................: 30142   249.010592/s
     success_rate...................: 100.00% ✓ 30142      ✗ 0    
     vus............................: 26      min=26       max=50 
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

     checks.........................: 100.00% ✓ 90183      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   299 kB/s
     http_req_blocked...............: avg=7.47µs   min=1.32µs  med=3.55µs   max=4.42ms   p(90)=5.03µs   p(95)=5.66µs   p(99.9)=2ms     
     http_req_connecting............: avg=3.6µs    min=0s      med=0s       max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=198.77ms min=6.08ms  med=180.6ms  max=643.27ms p(90)=242.23ms p(95)=402.39ms p(99.9)=533.17ms
       { expected_response:true }...: avg=198.77ms min=6.08ms  med=180.6ms  max=643.27ms p(90)=242.23ms p(95)=402.39ms p(99.9)=533.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30161
     http_req_receiving.............: avg=100.15µs min=33.91µs med=95.25µs  max=15.3ms   p(90)=127.53µs p(95)=141.43µs p(99.9)=508.58µs
     http_req_sending...............: avg=35.8µs   min=6.17µs  med=17.53µs  max=176.49ms p(90)=22.77µs  p(95)=24.64µs  p(99.9)=691.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.63ms min=5.98ms  med=180.47ms max=643.18ms p(90)=242.08ms p(95)=402.23ms p(99.9)=533.08ms
     http_reqs......................: 30161   249.315982/s
     iteration_duration.............: avg=199.72ms min=30.77ms med=181.02ms max=643.61ms p(90)=242.84ms p(95)=403ms    p(99.9)=533.43ms
     iterations.....................: 30061   248.489365/s
     success_rate...................: 100.00% ✓ 30061      ✗ 0    
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

     checks.........................: 100.00% ✓ 870237      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=3.37µs   min=992ns   med=2.6µs   max=23.06ms  p(90)=4.14µs   p(95)=4.96µs   p(99.9)=38.32µs
     http_req_connecting............: avg=231ns    min=0s      med=0s      max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.43ms  min=1.69ms  med=19.86ms max=310.56ms p(90)=28.49ms  p(95)=31.78ms  p(99.9)=53.79ms
       { expected_response:true }...: avg=20.43ms  min=1.69ms  med=19.86ms max=310.56ms p(90)=28.49ms  p(95)=31.78ms  p(99.9)=53.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290179
     http_req_receiving.............: avg=120.92µs min=27.69µs med=55.13µs max=40.73ms  p(90)=107.09µs p(95)=275.78µs p(99.9)=10.27ms
     http_req_sending...............: avg=57.85µs  min=5.32µs  med=10.44µs max=276.43ms p(90)=18.92µs  p(95)=129.1µs  p(99.9)=7.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.25ms  min=1.63ms  med=19.71ms max=310.07ms p(90)=28.26ms  p(95)=31.46ms  p(99.9)=52.53ms
     http_reqs......................: 290179  2413.576335/s
     iteration_duration.............: avg=20.67ms  min=3.15ms  med=20.07ms max=320.59ms p(90)=28.72ms  p(95)=32.03ms  p(99.9)=54.43ms
     iterations.....................: 290079  2412.744581/s
     success_rate...................: 100.00% ✓ 290079      ✗ 0     
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

     checks.........................: 100.00% ✓ 693000      ✗ 0     
     data_received..................: 20 GB   168 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=3.24µs   min=982ns   med=2.52µs   max=14.16ms  p(90)=3.89µs  p(95)=4.59µs   p(99.9)=36.41µs 
     http_req_connecting............: avg=216ns    min=0s      med=0s       max=2.67ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.72ms  min=2.01ms  med=17.44ms  max=567.77ms p(90)=54.4ms  p(95)=71.77ms  p(99.9)=203.64ms
       { expected_response:true }...: avg=25.72ms  min=2.01ms  med=17.44ms  max=567.77ms p(90)=54.4ms  p(95)=71.77ms  p(99.9)=203.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231100
     http_req_receiving.............: avg=708.33µs min=52.69µs med=111.14µs max=215.36ms p(90)=1.13ms  p(95)=1.8ms    p(99.9)=62.12ms 
     http_req_sending...............: avg=46.78µs  min=5.38µs  med=10.16µs  max=189.89ms p(90)=17.98µs p(95)=107.82µs p(99.9)=3.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.96ms  min=1.85ms  med=16.87ms  max=567.19ms p(90)=53.06ms p(95)=70.25ms  p(99.9)=199.96ms
     http_reqs......................: 231100  1921.801369/s
     iteration_duration.............: avg=25.96ms  min=2.51ms  med=17.67ms  max=567.98ms p(90)=54.64ms p(95)=72.03ms  p(99.9)=206.46ms
     iterations.....................: 231000  1920.96978/s
     success_rate...................: 100.00% ✓ 231000      ✗ 0     
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

     checks.........................: 100.00% ✓ 549981      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.93µs   min=972ns   med=2.6µs   max=20.83ms  p(90)=5.06µs   p(95)=6.21µs   p(99.9)=47.56µs
     http_req_connecting............: avg=567ns    min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.45ms  min=2.29ms  med=31.64ms max=368.46ms p(90)=43.08ms  p(95)=47.81ms  p(99.9)=87.18ms
       { expected_response:true }...: avg=32.45ms  min=2.29ms  med=31.64ms max=368.46ms p(90)=43.08ms  p(95)=47.81ms  p(99.9)=87.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183427
     http_req_receiving.............: avg=149.59µs min=30.05µs med=62.83µs max=325.21ms p(90)=139.43µs p(95)=296.34µs p(99.9)=7.05ms 
     http_req_sending...............: avg=49.63µs  min=5.4µs   med=10.78µs max=87.35ms  p(90)=25.16µs  p(95)=138.67µs p(99.9)=4.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.25ms  min=2.23ms  med=31.49ms max=133.86ms p(90)=42.87ms  p(95)=47.54ms  p(99.9)=85.01ms
     http_reqs......................: 183427  1524.813815/s
     iteration_duration.............: avg=32.71ms  min=4.05ms  med=31.88ms max=401.33ms p(90)=43.33ms  p(95)=48.06ms  p(99.9)=87.77ms
     iterations.....................: 183327  1523.982523/s
     success_rate...................: 100.00% ✓ 183327      ✗ 0     
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

     checks.........................: 100.00% ✓ 422013      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.24µs  min=1.07µs  med=2.51µs  max=4.39ms   p(90)=4.05µs   p(95)=4.72µs   p(99.9)=37.3µs 
     http_req_connecting............: avg=346ns   min=0s      med=0s      max=2.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.39ms min=2.13ms  med=41.85ms max=331.48ms p(90)=59.7ms   p(95)=65.12ms  p(99.9)=91.08ms
       { expected_response:true }...: avg=42.39ms min=2.13ms  med=41.85ms max=331.48ms p(90)=59.7ms   p(95)=65.12ms  p(99.9)=91.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140771
     http_req_receiving.............: avg=84.53µs min=30.12µs med=66.12µs max=175.48ms p(90)=103.88µs p(95)=121.51µs p(99.9)=1.69ms 
     http_req_sending...............: avg=29.07µs min=5.56µs  med=11.41µs max=171.3ms  p(90)=17.64µs  p(95)=21.31µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.28ms min=2.06ms  med=41.74ms max=331.06ms p(90)=59.59ms  p(95)=65ms     p(99.9)=90.57ms
     http_reqs......................: 140771  1170.173947/s
     iteration_duration.............: avg=42.64ms min=3.94ms  med=42.06ms max=339.81ms p(90)=59.92ms  p(95)=65.33ms  p(99.9)=92ms   
     iterations.....................: 140671  1169.342686/s
     success_rate...................: 100.00% ✓ 140671      ✗ 0     
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

     checks.........................: 100.00% ✓ 185424     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 74 MB   616 kB/s
     http_req_blocked...............: avg=4.85µs  min=1.15µs  med=3.01µs  max=4.47ms   p(90)=4.58µs   p(95)=5.18µs   p(99.9)=58.24µs 
     http_req_connecting............: avg=1.55µs  min=0s      med=0s      max=4.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.71ms min=4.68ms  med=98.02ms max=338.56ms p(90)=141.99ms p(95)=156.52ms p(99.9)=256ms   
       { expected_response:true }...: avg=96.71ms min=4.68ms  med=98.02ms max=338.56ms p(90)=141.99ms p(95)=156.52ms p(99.9)=256ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 61908
     http_req_receiving.............: avg=89.85µs min=32.86µs med=80.1µs  max=167.74ms p(90)=114.74µs p(95)=127.12µs p(99.9)=834.97µs
     http_req_sending...............: avg=29.28µs min=5.94µs  med=13.96µs max=176.89ms p(90)=20.89µs  p(95)=23.24µs  p(99.9)=688.16µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.59ms min=4.53ms  med=97.9ms  max=337.92ms p(90)=141.87ms p(95)=156.36ms p(99.9)=255.86ms
     http_reqs......................: 61908   513.192035/s
     iteration_duration.............: avg=97.1ms  min=19.13ms med=98.38ms max=358.68ms p(90)=142.26ms p(95)=156.84ms p(99.9)=258.52ms
     iterations.....................: 61808   512.363075/s
     success_rate...................: 100.00% ✓ 61808      ✗ 0    
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

     checks.........................: 100.00% ✓ 134463     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   447 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.2µs   med=3.52µs   max=4.07ms   p(90)=5µs      p(95)=5.57µs   p(99.9)=271.5µs 
     http_req_connecting............: avg=1.85µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=228.15µs
     http_req_duration..............: avg=133.34ms min=5.96ms  med=130.81ms max=350.68ms p(90)=176.43ms p(95)=189.71ms p(99.9)=246.03ms
       { expected_response:true }...: avg=133.34ms min=5.96ms  med=130.81ms max=350.68ms p(90)=176.43ms p(95)=189.71ms p(99.9)=246.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44921
     http_req_receiving.............: avg=143.6µs  min=31.99µs med=89.08µs  max=204.95ms p(90)=121.08µs p(95)=134.13µs p(99.9)=1.1ms   
     http_req_sending...............: avg=31.17µs  min=6.08µs  med=16.56µs  max=210.19ms p(90)=21.9µs   p(95)=23.71µs  p(99.9)=912.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.17ms min=5.85ms  med=130.68ms max=349.87ms p(90)=176.19ms p(95)=189.47ms p(99.9)=242.36ms
     http_reqs......................: 44921   372.002896/s
     iteration_duration.............: avg=133.9ms  min=22.08ms med=131.16ms max=362.03ms p(90)=176.73ms p(95)=190.08ms p(99.9)=251.12ms
     iterations.....................: 44821   371.174769/s
     success_rate...................: 100.00% ✓ 44821      ✗ 0    
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

     checks.........................: 100.00% ✓ 90654      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   301 kB/s
     http_req_blocked...............: avg=7.33µs   min=1.28µs  med=3.74µs   max=4.17ms   p(90)=5.26µs   p(95)=5.84µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=3.38µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=197.75ms min=6.59ms  med=183.09ms max=605.71ms p(90)=244.67ms p(95)=390.31ms p(99.9)=528.17ms
       { expected_response:true }...: avg=197.75ms min=6.59ms  med=183.09ms max=605.71ms p(90)=244.67ms p(95)=390.31ms p(99.9)=528.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30318
     http_req_receiving.............: avg=105.05µs min=37.42µs med=99.39µs  max=54.37ms  p(90)=130.65µs p(95)=144.02µs p(99.9)=641.84µs
     http_req_sending...............: avg=28.63µs  min=6.54µs  med=18.56µs  max=101.6ms  p(90)=23.55µs  p(95)=25.37µs  p(99.9)=548.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.62ms min=6.45ms  med=182.97ms max=605.62ms p(90)=244.53ms p(95)=390.2ms  p(99.9)=528.05ms
     http_reqs......................: 30318   250.505783/s
     iteration_duration.............: avg=198.68ms min=50.68ms med=183.54ms max=605.93ms p(90)=245.14ms p(95)=390.95ms p(99.9)=528.46ms
     iterations.....................: 30218   249.679522/s
     success_rate...................: 100.00% ✓ 30218      ✗ 0    
     vus............................: 19      min=19       max=50 
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

     checks.........................: 100.00% ✓ 86496      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=5.17µs   min=1.3µs   med=3.43µs   max=2.66ms   p(90)=4.8µs    p(95)=5.37µs   p(99.9)=486.53µs
     http_req_connecting............: avg=1.55µs   min=0s      med=0s       max=2.62ms   p(90)=0s       p(95)=0s       p(99.9)=459.82µs
     http_req_duration..............: avg=207.21ms min=8.53ms  med=208.28ms max=409.42ms p(90)=221.77ms p(95)=232.48ms p(99.9)=297.65ms
       { expected_response:true }...: avg=207.21ms min=8.53ms  med=208.28ms max=409.42ms p(90)=221.77ms p(95)=232.48ms p(99.9)=297.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28932
     http_req_receiving.............: avg=104.05µs min=33.98µs med=95.07µs  max=82.42ms  p(90)=127.29µs p(95)=140.24µs p(99.9)=631.54µs
     http_req_sending...............: avg=38.72µs  min=6.12µs  med=17.69µs  max=209.53ms p(90)=22.46µs  p(95)=24.31µs  p(99.9)=725.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.06ms min=8.39ms  med=208.15ms max=409.05ms p(90)=221.62ms p(95)=232.31ms p(99.9)=297.25ms
     http_reqs......................: 28932   238.96792/s
     iteration_duration.............: avg=208.21ms min=43.93ms med=208.68ms max=431.19ms p(90)=222.08ms p(95)=232.87ms p(99.9)=300.2ms 
     iterations.....................: 28832   238.141956/s
     success_rate...................: 100.00% ✓ 28832      ✗ 0    
     vus............................: 35      min=35       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

