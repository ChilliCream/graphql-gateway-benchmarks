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
| hive-router | v0.0.43 | 2,942 | 3,135 | 2,913 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.5 | 2,146 | 2,191 | 2,127 | 0.9% |  |
| grafbase | 0.53.2 | 2,020 | 2,103 | 1,994 | 1.9% |  |
| cosmo | 0.298.0 | 1,267 | 1,288 | 1,261 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 622 | 634 | 614 | 1.1% |  |
| apollo-router | v2.12.1 | 397 | 408 | 392 | 1.4% |  |
| hive-gateway | 2.5.14 | 269 | 274 | 267 | 0.9% |  |
| apollo-gateway | 2.13.3 | 249 | 251 | 248 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,432 | 2,554 | 2,406 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.5 | 2,038 | 2,079 | 2,022 | 0.8% |  |
| grafbase | 0.53.2 | 1,517 | 1,531 | 1,497 | 0.7% |  |
| cosmo | 0.298.0 | 1,214 | 1,225 | 1,206 | 0.5% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 577 | 589 | 571 | 1.1% |  |
| apollo-router | v2.12.1 | 367 | 378 | 362 | 1.4% |  |
| hive-gateway | 2.5.14 | 260 | 264 | 256 | 1.0% |  |
| apollo-gateway | 2.13.3 | 238 | 241 | 236 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1060887     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 425 MB  3.5 MB/s
     http_req_blocked...............: avg=2.85µs   min=1µs     med=2.03µs  max=17.35ms  p(90)=3.1µs   p(95)=3.71µs   p(99.9)=31.46µs
     http_req_connecting............: avg=313ns    min=0s      med=0s      max=4.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.73ms  min=1.67ms  med=15.91ms max=315.92ms p(90)=24.7ms  p(95)=28.24ms  p(99.9)=50.82ms
       { expected_response:true }...: avg=16.73ms  min=1.67ms  med=15.91ms max=315.92ms p(90)=24.7ms  p(95)=28.24ms  p(99.9)=50.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 353729
     http_req_receiving.............: avg=120.85µs min=26.23µs med=50.12µs max=65.54ms  p(90)=96.41µs p(95)=265.09µs p(99.9)=11.17ms
     http_req_sending...............: avg=56.26µs  min=5.08µs  med=9.07µs  max=271.97ms p(90)=15.46µs p(95)=120.72µs p(99.9)=7.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.56ms  min=1.58ms  med=15.77ms max=315.38ms p(90)=24.47ms p(95)=27.91ms  p(99.9)=49.26ms
     http_reqs......................: 353729  2942.817617/s
     iteration_duration.............: avg=16.95ms  min=2.12ms  med=16.11ms max=348.68ms p(90)=24.92ms p(95)=28.48ms  p(99.9)=51.77ms
     iterations.....................: 353629  2941.985676/s
     success_rate...................: 100.00% ✓ 353629      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 774345      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=2.77µs   min=982ns   med=2.04µs   max=10.85ms  p(90)=3.04µs   p(95)=3.6µs    p(99.9)=29.18µs 
     http_req_connecting............: avg=381ns    min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.01ms  min=2.44ms  med=14.52ms  max=390.28ms p(90)=51.96ms  p(95)=70.28ms  p(99.9)=166.93ms
       { expected_response:true }...: avg=23.01ms  min=2.44ms  med=14.52ms  max=390.28ms p(90)=51.96ms  p(95)=70.28ms  p(99.9)=166.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258215
     http_req_receiving.............: avg=659.34µs min=50.87µs med=107.95µs max=326.05ms p(90)=951.89µs p(95)=1.46ms   p(99.9)=59.59ms 
     http_req_sending...............: avg=41.67µs  min=5.21µs  med=9.08µs   max=144.96ms p(90)=14.69µs  p(95)=102.35µs p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.31ms  min=2.3ms   med=14ms     max=390.19ms p(90)=50.59ms  p(95)=68.84ms  p(99.9)=165.61ms
     http_reqs......................: 258215  2146.493633/s
     iteration_duration.............: avg=23.23ms  min=3.45ms  med=14.74ms  max=390.5ms  p(90)=52.18ms  p(95)=70.52ms  p(99.9)=167.28ms
     iterations.....................: 258115  2145.662351/s
     success_rate...................: 100.00% ✓ 258115      ✗ 0     
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

     checks.........................: 100.00% ✓ 728688      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=2.94µs   min=992ns   med=2.12µs  max=16.75ms  p(90)=3.39µs  p(95)=4.08µs   p(99.9)=36.84µs
     http_req_connecting............: avg=225ns    min=0s      med=0s      max=2.64ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.46ms  min=1.96ms  med=24.2ms  max=283.97ms p(90)=29.36ms p(95)=31.58ms  p(99.9)=53.56ms
       { expected_response:true }...: avg=24.46ms  min=1.96ms  med=24.2ms  max=283.97ms p(90)=29.36ms p(95)=31.58ms  p(99.9)=53.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 242996
     http_req_receiving.............: avg=107.18µs min=29.77µs med=57.27µs max=32.65ms  p(90)=96.44µs p(95)=177.15µs p(99.9)=8.6ms  
     http_req_sending...............: avg=46.14µs  min=5.21µs  med=9.87µs  max=207.29ms p(90)=16.52µs p(95)=111.53µs p(99.9)=3.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.3ms   min=1.9ms   med=24.09ms max=283.51ms p(90)=29.19ms p(95)=31.34ms  p(99.9)=52.49ms
     http_reqs......................: 242996  2020.614056/s
     iteration_duration.............: avg=24.69ms  min=4.15ms  med=24.41ms max=327.2ms  p(90)=29.58ms p(95)=31.82ms  p(99.9)=54ms   
     iterations.....................: 242896  2019.782514/s
     success_rate...................: 100.00% ✓ 242896      ✗ 0     
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

     checks.........................: 100.00% ✓ 457200      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.36µs  min=1µs     med=2.38µs  max=4.08ms   p(90)=3.71µs  p(95)=4.32µs   p(99.9)=34.31µs
     http_req_connecting............: avg=656ns   min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.13ms min=2.17ms  med=38.59ms max=328.74ms p(90)=55.09ms p(95)=60.06ms  p(99.9)=84.76ms
       { expected_response:true }...: avg=39.13ms min=2.17ms  med=38.59ms max=328.74ms p(90)=55.09ms p(95)=60.06ms  p(99.9)=84.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152500
     http_req_receiving.............: avg=82.41µs min=27.36µs med=59.89µs max=183.91ms p(90)=95.22µs p(95)=113.19µs p(99.9)=2.13ms 
     http_req_sending...............: avg=26.55µs min=5.38µs  med=10.54µs max=125.99ms p(90)=16.26µs p(95)=20.44µs  p(99.9)=1.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.02ms min=2.08ms  med=38.49ms max=328.1ms  p(90)=54.97ms p(95)=59.94ms  p(99.9)=84.45ms
     http_reqs......................: 152500  1267.98929/s
     iteration_duration.............: avg=39.36ms min=4.01ms  med=38.79ms max=362.97ms p(90)=55.29ms p(95)=60.26ms  p(99.9)=85.2ms 
     iterations.....................: 152400  1267.157822/s
     success_rate...................: 100.00% ✓ 152400      ✗ 0     
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

     checks.........................: 100.00% ✓ 224715     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   748 kB/s
     http_req_blocked...............: avg=4.39µs  min=1.09µs  med=2.77µs  max=7.1ms    p(90)=4.35µs   p(95)=4.95µs   p(99.9)=41.72µs 
     http_req_connecting............: avg=1.2µs   min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.78ms min=3.74ms  med=78.91ms max=329.28ms p(90)=127.51ms p(95)=139.34ms p(99.9)=236.05ms
       { expected_response:true }...: avg=79.78ms min=3.74ms  med=78.91ms max=329.28ms p(90)=127.51ms p(95)=139.34ms p(99.9)=236.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75005
     http_req_receiving.............: avg=87.93µs min=29.89µs med=73.35µs max=188.88ms p(90)=107.74µs p(95)=120.49µs p(99.9)=1ms     
     http_req_sending...............: avg=25.49µs min=5.57µs  med=12.83µs max=143.66ms p(90)=19.6µs   p(95)=21.94µs  p(99.9)=937.03µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.66ms min=3.62ms  med=78.8ms  max=328.55ms p(90)=127.39ms p(95)=139.2ms  p(99.9)=235.7ms 
     http_reqs......................: 75005   622.449071/s
     iteration_duration.............: avg=80.11ms min=16.09ms med=79.18ms max=362.29ms p(90)=127.74ms p(95)=139.64ms p(99.9)=237.98ms
     iterations.....................: 74905   621.619195/s
     success_rate...................: 100.00% ✓ 74905      ✗ 0    
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

     checks.........................: 100.00% ✓ 143673     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   477 kB/s
     http_req_blocked...............: avg=5.53µs   min=1.12µs  med=3.17µs   max=4.49ms   p(90)=4.58µs   p(95)=5.13µs   p(99.9)=176.85µs
     http_req_connecting............: avg=2.06µs   min=0s      med=0s       max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=101.42µs
     http_req_duration..............: avg=124.82ms min=5.57ms  med=124.68ms max=353.2ms  p(90)=150.78ms p(95)=158.8ms  p(99.9)=197.03ms
       { expected_response:true }...: avg=124.82ms min=5.57ms  med=124.68ms max=353.2ms  p(90)=150.78ms p(95)=158.8ms  p(99.9)=197.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47991
     http_req_receiving.............: avg=177.14µs min=30.83µs med=80.32µs  max=187.7ms  p(90)=111.74µs p(95)=123.61µs p(99.9)=2.12ms  
     http_req_sending...............: avg=25.52µs  min=5.92µs  med=15.03µs  max=140.13ms p(90)=20.77µs  p(95)=22.62µs  p(99.9)=666.17µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.62ms min=5.45ms  med=124.56ms max=211.06ms p(90)=150.66ms p(95)=158.63ms p(99.9)=189.36ms
     http_reqs......................: 47991   397.556691/s
     iteration_duration.............: avg=125.32ms min=7.97ms  med=124.95ms max=361.87ms p(90)=151.04ms p(95)=159.08ms p(99.9)=198.91ms
     iterations.....................: 47891   396.728293/s
     success_rate...................: 100.00% ✓ 47891      ✗ 0    
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

     checks.........................: 100.00% ✓ 97530      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=6.95µs   min=1.05µs  med=3.56µs   max=4.06ms   p(90)=5.03µs   p(95)=5.69µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=183.81ms min=5.75ms  med=191.93ms max=705.24ms p(90)=265.29ms p(95)=379.73ms p(99.9)=553.43ms
       { expected_response:true }...: avg=183.81ms min=5.75ms  med=191.93ms max=705.24ms p(90)=265.29ms p(95)=379.73ms p(99.9)=553.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32610
     http_req_receiving.............: avg=99.95µs  min=34.14µs med=94.27µs  max=16.41ms  p(90)=127.47µs p(95)=140.96µs p(99.9)=784.85µs
     http_req_sending...............: avg=35.16µs  min=5.67µs  med=17.9µs   max=157.62ms p(90)=23.01µs  p(95)=24.97µs  p(99.9)=760.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.67ms min=5.66ms  med=191.78ms max=705.11ms p(90)=265.17ms p(95)=379.58ms p(99.9)=553.32ms
     http_reqs......................: 32610   269.870174/s
     iteration_duration.............: avg=184.66ms min=14.85ms med=192.9ms  max=705.48ms p(90)=265.75ms p(95)=381.38ms p(99.9)=553.66ms
     iterations.....................: 32510   269.042605/s
     success_rate...................: 100.00% ✓ 32510      ✗ 0    
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
     http_req_blocked...............: avg=6.5µs    min=1.21µs  med=3.33µs   max=3.88ms   p(90)=4.59µs   p(95)=5.09µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.98µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=198.3ms  min=8.51ms  med=192.39ms max=347.44ms p(90)=222.42ms p(95)=230.36ms p(99.9)=288.79ms
       { expected_response:true }...: avg=198.3ms  min=8.51ms  med=192.39ms max=347.44ms p(90)=222.42ms p(95)=230.36ms p(99.9)=288.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30242
     http_req_receiving.............: avg=94.22µs  min=33.35µs med=89.38µs  max=19.49ms  p(90)=120.11µs p(95)=131.47µs p(99.9)=699.91µs
     http_req_sending...............: avg=22.29µs  min=6.14µs  med=16.68µs  max=26.58ms  p(90)=21µs     p(95)=22.74µs  p(99.9)=650µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.18ms min=8.39ms  med=192.27ms max=347.31ms p(90)=222.31ms p(95)=230.2ms  p(99.9)=288.7ms 
     http_reqs......................: 30242   249.726933/s
     iteration_duration.............: avg=199.19ms min=37.2ms  med=192.73ms max=354.53ms p(90)=222.76ms p(95)=230.66ms p(99.9)=289.99ms
     iterations.....................: 30142   248.901171/s
     success_rate...................: 100.00% ✓ 30142      ✗ 0    
     vus............................: 41      min=41       max=50 
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

     checks.........................: 100.00% ✓ 877146      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=3.06µs   min=1.01µs  med=2.18µs  max=18.32ms  p(90)=3.61µs   p(95)=4.42µs   p(99.9)=35.91µs
     http_req_connecting............: avg=387ns    min=0s      med=0s      max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.27ms  min=1.81ms  med=19.71ms max=323.66ms p(90)=28.21ms  p(95)=31.4ms   p(99.9)=53ms   
       { expected_response:true }...: avg=20.27ms  min=1.81ms  med=19.71ms max=323.66ms p(90)=28.21ms  p(95)=31.4ms   p(99.9)=53ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 292482
     http_req_receiving.............: avg=113.07µs min=27.22µs med=53.07µs max=250.43ms p(90)=102.22µs p(95)=260.06µs p(99.9)=8.84ms 
     http_req_sending...............: avg=55.04µs  min=5.23µs  med=9.81µs  max=127.97ms p(90)=18.41µs  p(95)=124.82µs p(99.9)=6.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.11ms  min=1.72ms  med=19.57ms max=323.3ms  p(90)=28.01ms  p(95)=31.11ms  p(99.9)=52.06ms
     http_reqs......................: 292482  2432.65039/s
     iteration_duration.............: avg=20.51ms  min=2.8ms   med=19.92ms max=345.91ms p(90)=28.43ms  p(95)=31.64ms  p(99.9)=53.59ms
     iterations.....................: 292382  2431.818664/s
     success_rate...................: 100.00% ✓ 292382      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 734895      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 295 MB  2.4 MB/s
     http_req_blocked...............: avg=3.09µs   min=1.01µs  med=2.19µs  max=17.22ms  p(90)=3.67µs  p(95)=4.46µs   p(99.9)=33.82µs 
     http_req_connecting............: avg=324ns    min=0s      med=0s      max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.25ms  min=1.86ms  med=16.97ms max=742.44ms p(90)=50.27ms p(95)=68.36ms  p(99.9)=170.74ms
       { expected_response:true }...: avg=24.25ms  min=1.86ms  med=16.97ms max=742.44ms p(90)=50.27ms p(95)=68.36ms  p(99.9)=170.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245065
     http_req_receiving.............: avg=682.61µs min=51.08µs med=105.7µs max=154.23ms p(90)=1.13ms  p(95)=1.81ms   p(99.9)=57.02ms 
     http_req_sending...............: avg=41.73µs  min=5.25µs  med=9.7µs   max=127.14ms p(90)=18.54µs p(95)=111.42µs p(99.9)=2.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.52ms  min=1.73ms  med=16.42ms max=732.2ms  p(90)=48.85ms p(95)=66.78ms  p(99.9)=169.55ms
     http_reqs......................: 245065  2038.07745/s
     iteration_duration.............: avg=24.48ms  min=2.8ms   med=17.19ms max=742.61ms p(90)=50.5ms  p(95)=68.58ms  p(99.9)=173.07ms
     iterations.....................: 244965  2037.245802/s
     success_rate...................: 100.00% ✓ 244965      ✗ 0     
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

     checks.........................: 100.00% ✓ 547245      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=6.2µs   min=962ns   med=2.32µs  max=26.33ms  p(90)=4.64µs   p(95)=5.85µs   p(99.9)=43.59µs
     http_req_connecting............: avg=3.17µs  min=0s      med=0s      max=26.3ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.61ms min=2.42ms  med=31.78ms max=304.7ms  p(90)=43.31ms  p(95)=47.97ms  p(99.9)=89.08ms
       { expected_response:true }...: avg=32.61ms min=2.42ms  med=31.78ms max=304.7ms  p(90)=43.31ms  p(95)=47.97ms  p(99.9)=89.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182515
     http_req_receiving.............: avg=108.5µs min=30.02µs med=60.18µs max=49.58ms  p(90)=133.45µs p(95)=285.17µs p(99.9)=5.02ms 
     http_req_sending...............: avg=49.35µs min=5.39µs  med=10.23µs max=79.19ms  p(90)=24.67µs  p(95)=135.36µs p(99.9)=4.89ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.45ms min=2.35ms  med=31.65ms max=294.01ms p(90)=43.11ms  p(95)=47.75ms  p(99.9)=88.76ms
     http_reqs......................: 182515  1517.230409/s
     iteration_duration.............: avg=32.88ms min=3.97ms  med=32.02ms max=331.86ms p(90)=43.55ms  p(95)=48.22ms  p(99.9)=89.71ms
     iterations.....................: 182415  1516.399118/s
     success_rate...................: 100.00% ✓ 182415      ✗ 0     
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

     checks.........................: 100.00% ✓ 437928      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 176 MB  1.5 MB/s
     http_req_blocked...............: avg=3.09µs  min=1µs     med=2.32µs  max=3.06ms   p(90)=3.92µs  p(95)=4.61µs   p(99.9)=37.04µs
     http_req_connecting............: avg=392ns   min=0s      med=0s      max=3.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.85ms min=2.07ms  med=40.37ms max=323.96ms p(90)=57.22ms p(95)=62.25ms  p(99.9)=87.66ms
       { expected_response:true }...: avg=40.85ms min=2.07ms  med=40.37ms max=323.96ms p(90)=57.22ms p(95)=62.25ms  p(99.9)=87.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146076
     http_req_receiving.............: avg=83.72µs min=28.56µs med=65.44µs max=24.08ms  p(90)=103.5µs p(95)=121.59µs p(99.9)=1.94ms 
     http_req_sending...............: avg=28.95µs min=5.24µs  med=11.06µs max=154.88ms p(90)=18.01µs p(95)=21.82µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.74ms min=2ms     med=40.27ms max=321.65ms p(90)=57.11ms p(95)=62.14ms  p(99.9)=87.33ms
     http_reqs......................: 146076  1214.367663/s
     iteration_duration.............: avg=41.09ms min=4.48ms  med=40.59ms max=342.05ms p(90)=57.43ms p(95)=62.46ms  p(99.9)=88.14ms
     iterations.....................: 145976  1213.536337/s
     success_rate...................: 100.00% ✓ 145976      ✗ 0     
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

     checks.........................: 100.00% ✓ 208395     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   693 kB/s
     http_req_blocked...............: avg=4.92µs  min=1.14µs  med=3.24µs  max=4.14ms   p(90)=4.78µs   p(95)=5.4µs    p(99.9)=47.6µs  
     http_req_connecting............: avg=1.47µs  min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.01ms min=4.07ms  med=83.96ms max=372.47ms p(90)=108.33ms p(95)=119.97ms p(99.9)=216.51ms
       { expected_response:true }...: avg=86.01ms min=4.07ms  med=83.96ms max=372.47ms p(90)=108.33ms p(95)=119.97ms p(99.9)=216.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69565
     http_req_receiving.............: avg=87.79µs min=31.05µs med=79.77µs max=50.41ms  p(90)=113.67µs p(95)=126.64µs p(99.9)=963.87µs
     http_req_sending...............: avg=23.35µs min=5.82µs  med=13.77µs max=93.56ms  p(90)=20.51µs  p(95)=22.64µs  p(99.9)=731.28µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.9ms  min=3.94ms  med=83.86ms max=371.83ms p(90)=108.23ms p(95)=119.84ms p(99.9)=216.4ms 
     http_reqs......................: 69565   577.15035/s
     iteration_duration.............: avg=86.38ms min=13.95ms med=84.22ms max=382.29ms p(90)=108.59ms p(95)=120.26ms p(99.9)=218.77ms
     iterations.....................: 69465   576.320693/s
     success_rate...................: 100.00% ✓ 69465      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 132891     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   441 kB/s
     http_req_blocked...............: avg=4.92µs   min=1.26µs  med=3.39µs   max=3.82ms   p(90)=4.84µs   p(95)=5.38µs   p(99.9)=261.53µs
     http_req_connecting............: avg=1.32µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=140.06µs
     http_req_duration..............: avg=134.92ms min=6.07ms  med=132.32ms max=360.6ms  p(90)=178.9ms  p(95)=192.62ms p(99.9)=248.03ms
       { expected_response:true }...: avg=134.92ms min=6.07ms  med=132.32ms max=360.6ms  p(90)=178.9ms  p(95)=192.62ms p(99.9)=248.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44397
     http_req_receiving.............: avg=92.78µs  min=32.86µs med=87.34µs  max=28.95ms  p(90)=118.31µs p(95)=130.44µs p(99.9)=797.03µs
     http_req_sending...............: avg=23.56µs  min=5.74µs  med=16.57µs  max=57.72ms  p(90)=21.77µs  p(95)=23.57µs  p(99.9)=742.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.81ms min=5.95ms  med=132.22ms max=360.31ms p(90)=178.79ms p(95)=192.5ms  p(99.9)=247.93ms
     http_reqs......................: 44397   367.615603/s
     iteration_duration.............: avg=135.49ms min=28.97ms med=132.65ms max=374.73ms p(90)=179.25ms p(95)=192.9ms  p(99.9)=251.98ms
     iterations.....................: 44297   366.787584/s
     success_rate...................: 100.00% ✓ 44297      ✗ 0    
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

     checks.........................: 100.00% ✓ 94107      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=5.4µs    min=1.23µs  med=3.46µs   max=3.23ms   p(90)=4.79µs   p(95)=5.35µs   p(99.9)=489.39µs
     http_req_connecting............: avg=1.68µs   min=0s      med=0s       max=3.06ms   p(90)=0s       p(95)=0s       p(99.9)=452.92µs
     http_req_duration..............: avg=190.52ms min=5.98ms  med=173.56ms max=595.22ms p(90)=224.81ms p(95)=401.78ms p(99.9)=530.47ms
       { expected_response:true }...: avg=190.52ms min=5.98ms  med=173.56ms max=595.22ms p(90)=224.81ms p(95)=401.78ms p(99.9)=530.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31469
     http_req_receiving.............: avg=101.89µs min=34.23µs med=91.35µs  max=65.32ms  p(90)=123.05µs p(95)=135.63µs p(99.9)=789.69µs
     http_req_sending...............: avg=28.55µs  min=5.91µs  med=17.03µs  max=101.36ms p(90)=21.88µs  p(95)=23.64µs  p(99.9)=754.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.39ms min=5.9ms   med=173.43ms max=595.12ms p(90)=224.69ms p(95)=401.57ms p(99.9)=530.38ms
     http_reqs......................: 31469   260.205937/s
     iteration_duration.............: avg=191.37ms min=38.62ms med=173.93ms max=595.43ms p(90)=225.22ms p(95)=402.36ms p(99.9)=530.72ms
     iterations.....................: 31369   259.379072/s
     success_rate...................: 100.00% ✓ 31369      ✗ 0    
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

     checks.........................: 100.00% ✓ 86418      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.28µs   min=1.27µs  med=3.44µs   max=4.51ms   p(90)=4.71µs   p(95)=5.26µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.72µs   min=0s      med=0s       max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=207.42ms min=8.62ms  med=205.76ms max=439.4ms  p(90)=219.3ms  p(95)=226.73ms p(99.9)=297.34ms
       { expected_response:true }...: avg=207.42ms min=8.62ms  med=205.76ms max=439.4ms  p(90)=219.3ms  p(95)=226.73ms p(99.9)=297.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28906
     http_req_receiving.............: avg=108.36µs min=33.75µs med=93.59µs  max=119.26ms p(90)=125.7µs  p(95)=138.38µs p(99.9)=775.45µs
     http_req_sending...............: avg=32.13µs  min=5.96µs  med=17.42µs  max=97.28ms  p(90)=21.94µs  p(95)=23.79µs  p(99.9)=549.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.28ms min=8.48ms  med=205.63ms max=438.83ms p(90)=219.17ms p(95)=226.61ms p(99.9)=297ms   
     http_reqs......................: 28906   238.693246/s
     iteration_duration.............: avg=208.42ms min=43.05ms med=206.03ms max=467.03ms p(90)=219.57ms p(95)=227ms    p(99.9)=319.42ms
     iterations.....................: 28806   237.867489/s
     success_rate...................: 100.00% ✓ 28806      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

