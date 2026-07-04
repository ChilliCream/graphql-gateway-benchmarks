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
| hive-router | v0.0.74 | 2,809 | 3,057 | 2,783 | 3.4% |  |
| fusion | 16.3.0 | 2,146 | 2,193 | 2,143 | 0.9% |  |
| fusion-nightly | 16.4.0-p.14 | 2,134 | 2,200 | 2,124 | 1.3% |  |
| grafbase | 0.53.5 | 2,000 | 2,072 | 1,991 | 1.4% |  |
| cosmo | 0.326.1 | 1,146 | 1,171 | 1,140 | 1.0% |  |
| hive-gateway-router-runtime | 2.10.0 | 539 | 548 | 533 | 0.8% |  |
| apollo-router | v2.15.1 | 404 | 418 | 400 | 1.6% |  |
| hive-gateway | 2.10.0 | 247 | 251 | 245 | 0.9% |  |
| apollo-gateway | 2.14.2 | 245 | 247 | 242 | 0.6% |  |
| feddi | 77271dc84a06 | 15 | 16 | 15 | 2.2% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,325 | 2,477 | 2,290 | 2.6% |  |
| fusion-nightly | 16.4.0-p.14 | 2,095 | 2,144 | 2,090 | 0.9% |  |
| fusion | 16.3.0 | 2,030 | 2,079 | 2,023 | 0.9% |  |
| grafbase | 0.53.5 | 1,493 | 1,529 | 1,487 | 1.0% |  |
| cosmo | 0.326.1 | 1,076 | 1,103 | 1,068 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.0 | 506 | 518 | 502 | 1.0% |  |
| apollo-router | v2.15.1 | 375 | 387 | 371 | 1.6% |  |
| hive-gateway | 2.10.0 | 237 | 242 | 236 | 0.8% |  |
| apollo-gateway | 2.14.2 | 236 | 237 | 235 | 0.3% |  |
| feddi | 77271dc84a06 | 16 | 17 | 16 | 2.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1012761     ✗ 0     
     data_received..................: 30 GB   246 MB/s
     data_sent......................: 406 MB  3.4 MB/s
     http_req_blocked...............: avg=3.04µs  min=1.01µs  med=2.11µs  max=21.43ms  p(90)=3.39µs  p(95)=4.03µs   p(99.9)=30.92µs
     http_req_connecting............: avg=293ns   min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.53ms min=1.68ms  med=16.7ms  max=333.04ms p(90)=25.98ms p(95)=29.53ms  p(99.9)=50.41ms
       { expected_response:true }...: avg=17.53ms min=1.68ms  med=16.7ms  max=333.04ms p(90)=25.98ms p(95)=29.53ms  p(99.9)=50.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 337687
     http_req_receiving.............: avg=97.17µs min=26.88µs med=46.27µs max=81.37ms  p(90)=85.36µs p(95)=173.56µs p(99.9)=8.84ms 
     http_req_sending...............: avg=53.84µs min=5.38µs  med=9.06µs  max=297.05ms p(90)=15.85µs p(95)=103.71µs p(99.9)=7.46ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.38ms min=1.63ms  med=16.58ms max=332.47ms p(90)=25.77ms p(95)=29.24ms  p(99.9)=49.2ms 
     http_reqs......................: 337687  2809.193464/s
     iteration_duration.............: avg=17.76ms min=2.36ms  med=16.91ms max=347.61ms p(90)=26.21ms p(95)=29.79ms  p(99.9)=51.21ms
     iterations.....................: 337587  2808.361571/s
     success_rate...................: 100.00% ✓ 337587      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 774372      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=4.73µs   min=1.09µs  med=2.47µs   max=17.89ms  p(90)=3.8µs   p(95)=4.42µs   p(99.9)=38.91µs 
     http_req_connecting............: avg=1.66µs   min=0s      med=0s       max=17.55ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.99ms  min=2.36ms  med=19.66ms  max=390.93ms p(90)=37.35ms p(95)=45.15ms  p(99.9)=151.23ms
       { expected_response:true }...: avg=22.99ms  min=2.36ms  med=19.66ms  max=390.93ms p(90)=37.35ms p(95)=45.15ms  p(99.9)=151.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258224
     http_req_receiving.............: avg=832.32µs min=55.42µs med=104.37µs max=306.82ms p(90)=1.47ms  p(95)=3.1ms    p(99.9)=33.13ms 
     http_req_sending...............: avg=46.91µs  min=5.17µs  med=9.73µs   max=33.57ms  p(90)=17.15µs p(95)=100.82µs p(99.9)=4.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.11ms  min=2.2ms   med=18.88ms  max=390.8ms  p(90)=36ms    p(95)=43.58ms  p(99.9)=146.91ms
     http_reqs......................: 258224  2146.706019/s
     iteration_duration.............: avg=23.23ms  min=3.85ms  med=19.88ms  max=391.14ms p(90)=37.6ms  p(95)=45.41ms  p(99.9)=152.51ms
     iterations.....................: 258124  2145.874684/s
     success_rate...................: 100.00% ✓ 258124      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 769968      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.5µs    min=1.16µs  med=2.58µs   max=17.08ms  p(90)=3.92µs  p(95)=4.53µs  p(99.9)=36.19µs
     http_req_connecting............: avg=454ns    min=0s      med=0s       max=4.63ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=23.12ms  min=2.28ms  med=21.43ms  max=334.84ms p(90)=36.9ms  p(95)=42.61ms p(99.9)=75.96ms
       { expected_response:true }...: avg=23.12ms  min=2.28ms  med=21.43ms  max=334.84ms p(90)=36.9ms  p(95)=42.61ms p(99.9)=75.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256756
     http_req_receiving.............: avg=903.92µs min=56.67µs med=179.03µs max=187.18ms p(90)=1.86ms  p(95)=3.29ms  p(99.9)=26.07ms
     http_req_sending...............: avg=45.56µs  min=5.41µs  med=10.05µs  max=219.4ms  p(90)=17.15µs p(95)=96.75µs p(99.9)=3.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.17ms  min=2.17ms  med=20.49ms  max=318.45ms p(90)=35.66ms p(95)=41.22ms p(99.9)=74.08ms
     http_reqs......................: 256756  2134.939075/s
     iteration_duration.............: avg=23.36ms  min=3.73ms  med=21.65ms  max=362.5ms  p(90)=37.15ms p(95)=42.86ms p(99.9)=76.82ms
     iterations.....................: 256656  2134.10757/s
     success_rate...................: 100.00% ✓ 256656      ✗ 0     
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

     checks.........................: 100.00% ✓ 721365      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 289 MB  2.4 MB/s
     http_req_blocked...............: avg=3.89µs   min=1.18µs  med=2.87µs  max=11.71ms  p(90)=4.49µs   p(95)=5.31µs   p(99.9)=44.66µs
     http_req_connecting............: avg=482ns    min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.69ms  min=1.99ms  med=24.45ms max=331.59ms p(90)=29.33ms  p(95)=31.29ms  p(99.9)=52.52ms
       { expected_response:true }...: avg=24.69ms  min=1.99ms  med=24.45ms max=331.59ms p(90)=29.33ms  p(95)=31.29ms  p(99.9)=52.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 240555
     http_req_receiving.............: avg=101.89µs min=30.75µs med=61.94µs max=125.66ms p(90)=104.17µs p(95)=139.95µs p(99.9)=7.4ms  
     http_req_sending...............: avg=46.67µs  min=5.63µs  med=12.04µs max=219.71ms p(90)=19.51µs  p(95)=88.38µs  p(99.9)=2.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.54ms  min=1.9ms   med=24.33ms max=330.78ms p(90)=29.18ms  p(95)=31.09ms  p(99.9)=51.05ms
     http_reqs......................: 240555  2000.548273/s
     iteration_duration.............: avg=24.94ms  min=3.29ms  med=24.67ms max=360.47ms p(90)=29.57ms  p(95)=31.55ms  p(99.9)=52.98ms
     iterations.....................: 240455  1999.716634/s
     success_rate...................: 100.00% ✓ 240455      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413553      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=5.39µs  min=1.24µs  med=2.75µs  max=16.89ms  p(90)=4.07µs   p(95)=4.69µs   p(99.9)=36.06µs
     http_req_connecting............: avg=2.33µs  min=0s      med=0s      max=16.81ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.28ms min=2.15ms  med=42.72ms max=324.1ms  p(90)=61.03ms  p(95)=66.45ms  p(99.9)=93.25ms
       { expected_response:true }...: avg=43.28ms min=2.15ms  med=42.72ms max=324.1ms  p(90)=61.03ms  p(95)=66.45ms  p(99.9)=93.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137951
     http_req_receiving.............: avg=84.72µs min=29.07µs med=65.11µs max=158.08ms p(90)=100.95µs p(95)=116.85µs p(99.9)=1.41ms 
     http_req_sending...............: avg=29.3µs  min=5.53µs  med=11.72µs max=166.85ms p(90)=17.08µs  p(95)=21.2µs   p(99.9)=1.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.16ms min=2.08ms  med=42.62ms max=320.97ms p(90)=60.93ms  p(95)=66.34ms  p(99.9)=92.85ms
     http_reqs......................: 137951  1146.955182/s
     iteration_duration.............: avg=43.52ms min=3.87ms  med=42.93ms max=339.18ms p(90)=61.24ms  p(95)=66.66ms  p(99.9)=93.52ms
     iterations.....................: 137851  1146.12376/s
     success_rate...................: 100.00% ✓ 137851      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 194988     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   649 kB/s
     http_req_blocked...............: avg=4.23µs  min=1.4µs   med=3.07µs  max=5.4ms    p(90)=4.48µs   p(95)=5.11µs   p(99.9)=46.03µs 
     http_req_connecting............: avg=799ns   min=0s      med=0s      max=2.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.96ms min=4.11ms  med=89.74ms max=365.57ms p(90)=112.86ms p(95)=123.89ms p(99.9)=206.85ms
       { expected_response:true }...: avg=91.96ms min=4.11ms  med=89.74ms max=365.57ms p(90)=112.86ms p(95)=123.89ms p(99.9)=206.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65096
     http_req_receiving.............: avg=86.05µs min=32.21µs med=70.74µs max=96.94ms  p(90)=104.78µs p(95)=116.84µs p(99.9)=1.65ms  
     http_req_sending...............: avg=23.1µs  min=5.85µs  med=14.15µs max=91.66ms  p(90)=19.9µs   p(95)=22.42µs  p(99.9)=674.41µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.85ms min=4.04ms  med=89.64ms max=364.84ms p(90)=112.75ms p(95)=123.78ms p(99.9)=206.41ms
     http_reqs......................: 65096   539.994267/s
     iteration_duration.............: avg=92.32ms min=15.84ms med=89.97ms max=385.33ms p(90)=113.09ms p(95)=124.17ms p(99.9)=209.45ms
     iterations.....................: 64996   539.164731/s
     success_rate...................: 100.00% ✓ 64996      ✗ 0    
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

     checks.........................: 100.00% ✓ 146172     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   486 kB/s
     http_req_blocked...............: avg=5.44µs   min=1.23µs  med=2.91µs   max=4.41ms   p(90)=4.29µs   p(95)=4.82µs   p(99.9)=524.35µs
     http_req_connecting............: avg=2.26µs   min=0s      med=0s       max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=228.52µs
     http_req_duration..............: avg=122.7ms  min=5.33ms  med=122.48ms max=374.37ms p(90)=148.39ms p(95)=156.01ms p(99.9)=190.1ms 
       { expected_response:true }...: avg=122.7ms  min=5.33ms  med=122.48ms max=374.37ms p(90)=148.39ms p(95)=156.01ms p(99.9)=190.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48824
     http_req_receiving.............: avg=82.32µs  min=31.28µs med=75.17µs  max=6.41ms   p(90)=106.39µs p(95)=118.41µs p(99.9)=1.2ms   
     http_req_sending...............: avg=23µs     min=6.03µs  med=15.58µs  max=77.88ms  p(90)=20.76µs  p(95)=22.76µs  p(99.9)=601.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.59ms min=5.26ms  med=122.37ms max=374.14ms p(90)=148.29ms p(95)=155.9ms  p(99.9)=189.6ms 
     http_reqs......................: 48824   404.587944/s
     iteration_duration.............: avg=123.18ms min=23.34ms med=122.74ms max=385.68ms p(90)=148.63ms p(95)=156.26ms p(99.9)=194.53ms
     iterations.....................: 48724   403.759278/s
     success_rate...................: 100.00% ✓ 48724      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89445      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=7.58µs   min=1.37µs  med=3.67µs   max=4.17ms   p(90)=5.12µs   p(95)=5.72µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=200.41ms min=6.94ms  med=185.27ms max=711.21ms p(90)=245.07ms p(95)=301.04ms p(99.9)=612.98ms
       { expected_response:true }...: avg=200.41ms min=6.94ms  med=185.27ms max=711.21ms p(90)=245.07ms p(95)=301.04ms p(99.9)=612.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29915
     http_req_receiving.............: avg=100.69µs min=39µs    med=93.32µs  max=49.44ms  p(90)=124.28µs p(95)=136.95µs p(99.9)=994.01µs
     http_req_sending...............: avg=32.77µs  min=6.69µs  med=18.01µs  max=85.47ms  p(90)=22.74µs  p(95)=24.82µs  p(99.9)=694.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.28ms min=6.82ms  med=185.15ms max=711.08ms p(90)=244.93ms p(95)=300.94ms p(99.9)=612.87ms
     http_reqs......................: 29915   247.059114/s
     iteration_duration.............: avg=201.36ms min=37.75ms med=185.67ms max=711.45ms p(90)=245.47ms p(95)=303.19ms p(99.9)=613.61ms
     iterations.....................: 29815   246.233244/s
     success_rate...................: 100.00% ✓ 29815      ✗ 0    
     vus............................: 35      min=35       max=50 
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

     checks.........................: 100.00% ✓ 88962      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=7.14µs   min=1.27µs  med=2.95µs   max=4.6ms    p(90)=4.29µs   p(95)=4.79µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=3.92µs   min=0s      med=0s       max=4.55ms   p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=201.51ms min=8.63ms  med=214.03ms max=448.45ms p(90)=230.71ms p(95)=235.4ms  p(99.9)=299.94ms
       { expected_response:true }...: avg=201.51ms min=8.63ms  med=214.03ms max=448.45ms p(90)=230.71ms p(95)=235.4ms  p(99.9)=299.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29754
     http_req_receiving.............: avg=89.52µs  min=31.69µs med=84.04µs  max=14.33ms  p(90)=113.82µs p(95)=124.31µs p(99.9)=1.13ms  
     http_req_sending...............: avg=25.89µs  min=6.37µs  med=16.32µs  max=68.56ms  p(90)=20.68µs  p(95)=22.55µs  p(99.9)=584.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.4ms  min=8.5ms   med=213.91ms max=446.08ms p(90)=230.6ms  p(95)=235.3ms  p(99.9)=299.85ms
     http_reqs......................: 29754   245.77058/s
     iteration_duration.............: avg=202.46ms min=49.54ms med=214.52ms max=460.43ms p(90)=230.95ms p(95)=235.65ms p(99.9)=304.82ms
     iterations.....................: 29654   244.944572/s
     success_rate...................: 100.00% ✓ 29654      ✗ 0    
     vus............................: 32      min=32       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 5688      ✗ 0   
     data_received..................: 191 MB  1.5 MB/s
     data_sent......................: 2.4 MB  19 kB/s
     http_req_blocked...............: avg=176.79µs min=1.54µs  med=3.69µs  max=11.4ms  p(90)=5.31µs   p(95)=6.42µs   p(99.9)=10.57ms
     http_req_connecting............: avg=169.29µs min=0s      med=0s      max=11.35ms p(90)=0s       p(95)=0s       p(99.9)=10.46ms
     http_req_duration..............: avg=3.04s    min=44.3ms  med=3.11s   max=4.74s   p(90)=3.9s     p(95)=4.14s    p(99.9)=4.73s  
       { expected_response:true }...: avg=3.04s    min=44.3ms  med=3.11s   max=4.74s   p(90)=3.9s     p(95)=4.14s    p(99.9)=4.73s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 1996
     http_req_receiving.............: avg=103.9µs  min=36.38µs med=91.41µs max=6.13ms  p(90)=132.94µs p(95)=147.15µs p(99.9)=2.57ms 
     http_req_sending...............: avg=58.67µs  min=8.03µs  med=19.09µs max=16.39ms p(90)=24.42µs  p(95)=29.75µs  p(99.9)=5.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=3.04s    min=44.18ms med=3.11s   max=4.74s   p(90)=3.9s     p(95)=4.14s    p(99.9)=4.73s  
     http_reqs......................: 1996    15.609839/s
     iteration_duration.............: avg=3.2s     min=1.39s   med=3.13s   max=4.74s   p(90)=3.92s    p(95)=4.16s    p(99.9)=4.73s  
     iterations.....................: 1896    14.827783/s
     success_rate...................: 100.00% ✓ 1896      ✗ 0   
     vus............................: 31      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 838710      ✗ 0     
     data_received..................: 25 GB   203 MB/s
     data_sent......................: 336 MB  2.8 MB/s
     http_req_blocked...............: avg=3.66µs   min=942ns   med=2.77µs  max=15.44ms  p(90)=4.41µs  p(95)=5.19µs   p(99.9)=39.77µs
     http_req_connecting............: avg=396ns    min=0s      med=0s      max=4.34ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.21ms  min=1.92ms  med=20.81ms max=314.53ms p(90)=29.82ms p(95)=32.57ms  p(99.9)=53.34ms
       { expected_response:true }...: avg=21.21ms  min=1.92ms  med=20.81ms max=314.53ms p(90)=29.82ms p(95)=32.57ms  p(99.9)=53.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 279670
     http_req_receiving.............: avg=100.63µs min=27.68µs med=54.3µs  max=137.16ms p(90)=98.09µs p(95)=167.54µs p(99.9)=8.01ms 
     http_req_sending...............: avg=49.62µs  min=5.3µs   med=11µs    max=272.63ms p(90)=19.56µs p(95)=112.9µs  p(99.9)=3.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.06ms  min=1.84ms  med=20.68ms max=313.82ms p(90)=29.66ms p(95)=32.35ms  p(99.9)=51.91ms
     http_reqs......................: 279670  2325.674794/s
     iteration_duration.............: avg=21.45ms  min=3.31ms  med=21.03ms max=423.68ms p(90)=30.06ms p(95)=32.83ms  p(99.9)=53.97ms
     iterations.....................: 279570  2324.843216/s
     success_rate...................: 100.00% ✓ 279570      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 755502      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.44µs   min=1.04µs  med=2.39µs  max=14.8ms   p(90)=4.1µs   p(95)=4.83µs  p(99.9)=37.21µs
     http_req_connecting............: avg=467ns    min=0s      med=0s      max=4.57ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=23.57ms  min=1.87ms  med=21.94ms max=335.75ms p(90)=37.77ms p(95)=43.49ms p(99.9)=78.35ms
       { expected_response:true }...: avg=23.57ms  min=1.87ms  med=21.94ms max=335.75ms p(90)=37.77ms p(95)=43.49ms p(99.9)=78.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 251934
     http_req_receiving.............: avg=936.37µs min=55.03µs med=231.1µs max=299.96ms p(90)=1.94ms  p(95)=3.27ms  p(99.9)=26.19ms
     http_req_sending...............: avg=45.79µs  min=5.21µs  med=9.69µs  max=249.11ms p(90)=18.95µs p(95)=87.22µs p(99.9)=2.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.59ms  min=1.76ms  med=20.98ms max=301.21ms p(90)=36.51ms p(95)=42.19ms p(99.9)=76.09ms
     http_reqs......................: 251934  2095.258522/s
     iteration_duration.............: avg=23.81ms  min=3.14ms  med=22.17ms max=354.41ms p(90)=38.01ms p(95)=43.74ms p(99.9)=78.74ms
     iterations.....................: 251834  2094.426853/s
     success_rate...................: 100.00% ✓ 251834      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 732372      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=7.41µs  min=1.02µs  med=2.35µs   max=189.17ms p(90)=4.03µs  p(95)=4.74µs  p(99.9)=40.03µs 
     http_req_connecting............: avg=4.48µs  min=0s      med=0s       max=182.41ms p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=24.32ms min=1.96ms  med=20.13ms  max=694.24ms p(90)=40.14ms p(95)=49.24ms p(99.9)=189.63ms
       { expected_response:true }...: avg=24.32ms min=1.96ms  med=20.13ms  max=694.24ms p(90)=40.14ms p(95)=49.24ms p(99.9)=189.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244224
     http_req_receiving.............: avg=858.3µs min=54.31µs med=110.89µs max=194.21ms p(90)=1.5ms   p(95)=3.04ms  p(99.9)=34.44ms 
     http_req_sending...............: avg=47.23µs min=5.26µs  med=10.06µs  max=110.56ms p(90)=20.11µs p(95)=90.29µs p(99.9)=3.63ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=23.42ms min=1.85ms  med=19.34ms  max=694.14ms p(90)=38.71ms p(95)=47.56ms p(99.9)=187.16ms
     http_reqs......................: 244224  2030.924851/s
     iteration_duration.............: avg=24.56ms min=3.61ms  med=20.35ms  max=694.42ms p(90)=40.39ms p(95)=49.49ms p(99.9)=192.03ms
     iterations.....................: 244124  2030.093269/s
     success_rate...................: 100.00% ✓ 244124      ✗ 0     
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

     checks.........................: 100.00% ✓ 538803     ✗ 0     
     data_received..................: 16 GB   131 MB/s
     data_sent......................: 216 MB  1.8 MB/s
     http_req_blocked...............: avg=4.59µs  min=1.17µs med=3.19µs  max=17.15ms  p(90)=5.4µs    p(95)=6.44µs   p(99.9)=56.01µs
     http_req_connecting............: avg=624ns   min=0s     med=0s      max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.11ms min=2.61ms med=32.62ms max=350.96ms p(90)=44.05ms  p(95)=47.84ms  p(99.9)=72.81ms
       { expected_response:true }...: avg=33.11ms min=2.61ms med=32.62ms max=350.96ms p(90)=44.05ms  p(95)=47.84ms  p(99.9)=72.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 179701
     http_req_receiving.............: avg=115.3µs min=31µs   med=64.16µs max=112.82ms p(90)=143.71µs p(95)=265.7µs  p(99.9)=5.4ms  
     http_req_sending...............: avg=52.96µs min=5.64µs med=11.83µs max=222.2ms  p(90)=26.86µs  p(95)=138.02µs p(99.9)=4ms    
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.94ms min=2.52ms med=32.47ms max=318.22ms p(90)=43.87ms  p(95)=47.61ms  p(99.9)=72.21ms
     http_reqs......................: 179701  1493.54903/s
     iteration_duration.............: avg=33.39ms min=5.9ms  med=32.87ms max=370.32ms p(90)=44.31ms  p(95)=48.09ms  p(99.9)=73.25ms
     iterations.....................: 179601  1492.7179/s
     success_rate...................: 100.00% ✓ 179601     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 388314      ✗ 0     
     data_received..................: 11 GB   94 MB/s
     data_sent......................: 156 MB  1.3 MB/s
     http_req_blocked...............: avg=3.95µs  min=1.14µs  med=2.77µs  max=4.53ms   p(90)=4.32µs   p(95)=5.03µs   p(99.9)=37.67µs 
     http_req_connecting............: avg=865ns   min=0s      med=0s      max=4.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=46.08ms min=2.35ms  med=45.56ms max=342.33ms p(90)=64.39ms  p(95)=70.09ms  p(99.9)=99.68ms 
       { expected_response:true }...: avg=46.08ms min=2.35ms  med=45.56ms max=342.33ms p(90)=64.39ms  p(95)=70.09ms  p(99.9)=99.68ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 129538
     http_req_receiving.............: avg=90.16µs min=29.84µs med=71.88µs max=151.77ms p(90)=113.31µs p(95)=131.11µs p(99.9)=1.44ms  
     http_req_sending...............: avg=30.54µs min=5.47µs  med=13.42µs max=151.99ms p(90)=20.18µs  p(95)=24.4µs   p(99.9)=1.13ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=45.96ms min=2.25ms  med=45.45ms max=334.78ms p(90)=64.27ms  p(95)=69.97ms  p(99.9)=99.26ms 
     http_reqs......................: 129538  1076.748934/s
     iteration_duration.............: avg=46.34ms min=4.5ms   med=45.79ms max=355.79ms p(90)=64.61ms  p(95)=70.31ms  p(99.9)=100.75ms
     iterations.....................: 129438  1075.917711/s
     success_rate...................: 100.00% ✓ 129438      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 182949     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   608 kB/s
     http_req_blocked...............: avg=9.59µs  min=1.42µs  med=3.27µs  max=12.53ms  p(90)=4.77µs   p(95)=5.43µs   p(99.9)=99.44µs 
     http_req_connecting............: avg=5.94µs  min=0s      med=0s      max=12.49ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.99ms min=4.62ms  med=95.55ms max=358.39ms p(90)=121.52ms p(95)=134.57ms p(99.9)=224.37ms
       { expected_response:true }...: avg=97.99ms min=4.62ms  med=95.55ms max=358.39ms p(90)=121.52ms p(95)=134.57ms p(99.9)=224.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61083
     http_req_receiving.............: avg=92.16µs min=33.39µs med=79.83µs max=88.34ms  p(90)=114.44µs p(95)=126.84µs p(99.9)=1.19ms  
     http_req_sending...............: avg=30.4µs  min=6.42µs  med=16.2µs  max=157ms    p(90)=21.87µs  p(95)=24.23µs  p(99.9)=847.21µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.87ms min=4.5ms   med=95.44ms max=347.8ms  p(90)=121.4ms  p(95)=134.42ms p(99.9)=223.63ms
     http_reqs......................: 61083   506.468688/s
     iteration_duration.............: avg=98.4ms  min=11.48ms med=95.81ms max=397.77ms p(90)=121.78ms p(95)=134.85ms p(99.9)=227.53ms
     iterations.....................: 60983   505.639539/s
     success_rate...................: 100.00% ✓ 60983      ✗ 0    
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

     checks.........................: 100.00% ✓ 135723     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 54 MB   451 kB/s
     http_req_blocked...............: avg=6.4µs    min=1.56µs  med=3.66µs   max=4.54ms   p(90)=5.17µs   p(95)=5.76µs   p(99.9)=406.7µs 
     http_req_connecting............: avg=2.42µs   min=0s      med=0s       max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=340.67µs
     http_req_duration..............: avg=132.11ms min=6.13ms  med=129.26ms max=362.76ms p(90)=174.74ms p(95)=188.08ms p(99.9)=245.58ms
       { expected_response:true }...: avg=132.11ms min=6.13ms  med=129.26ms max=362.76ms p(90)=174.74ms p(95)=188.08ms p(99.9)=245.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45341
     http_req_receiving.............: avg=100.19µs min=34.49µs med=84.57µs  max=187.43ms p(90)=114.93µs p(95)=125.88µs p(99.9)=991.75µs
     http_req_sending...............: avg=32.43µs  min=6.7µs   med=18.04µs  max=154.56ms p(90)=23.29µs  p(95)=25.59µs  p(99.9)=657.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=131.97ms min=5.99ms  med=129.15ms max=362.27ms p(90)=174.62ms p(95)=187.93ms p(99.9)=244.99ms
     http_reqs......................: 45341   375.457832/s
     iteration_duration.............: avg=132.66ms min=36.82ms med=129.61ms max=388.63ms p(90)=175.06ms p(95)=188.36ms p(99.9)=249.08ms
     iterations.....................: 45241   374.629757/s
     success_rate...................: 100.00% ✓ 45241      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85947      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.77µs   min=1.66µs  med=3.87µs   max=4.25ms   p(90)=5.44µs   p(95)=6.11µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=3.56µs   min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=208.61ms min=6.79ms  med=201.5ms  max=730.75ms p(90)=262.56ms p(95)=327.07ms p(99.9)=636.24ms
       { expected_response:true }...: avg=208.61ms min=6.79ms  med=201.5ms  max=730.75ms p(90)=262.56ms p(95)=327.07ms p(99.9)=636.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28749
     http_req_receiving.............: avg=101µs    min=37.82µs med=95.36µs  max=5.59ms   p(90)=127.28µs p(95)=140.57µs p(99.9)=1.02ms  
     http_req_sending...............: avg=33.14µs  min=6.74µs  med=19.93µs  max=100.46ms p(90)=24.72µs  p(95)=27.16µs  p(99.9)=968.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.48ms min=6.65ms  med=201.39ms max=730.65ms p(90)=262.44ms p(95)=326.96ms p(99.9)=636.11ms
     http_reqs......................: 28749   237.559084/s
     iteration_duration.............: avg=209.62ms min=43ms    med=201.99ms max=730.95ms p(90)=263.06ms p(95)=328.64ms p(99.9)=636.56ms
     iterations.....................: 28649   236.732763/s
     success_rate...................: 100.00% ✓ 28649      ✗ 0    
     vus............................: 7       min=7        max=50 
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

     checks.........................: 100.00% ✓ 85635      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=12.31µs  min=1.25µs  med=3.18µs   max=9.12ms   p(90)=4.53µs   p(95)=5.09µs   p(99.9)=4.59ms  
     http_req_connecting............: avg=8.51µs   min=0s      med=0s       max=9.09ms   p(90)=0s       p(95)=0s       p(99.9)=4.19ms  
     http_req_duration..............: avg=209.33ms min=8.94ms  med=206.33ms max=409.59ms p(90)=271.2ms  p(95)=278.15ms p(99.9)=357.58ms
       { expected_response:true }...: avg=209.33ms min=8.94ms  med=206.33ms max=409.59ms p(90)=271.2ms  p(95)=278.15ms p(99.9)=357.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28645
     http_req_receiving.............: avg=96.36µs  min=32.59µs med=89.98µs  max=45.48ms  p(90)=120.08µs p(95)=131.36µs p(99.9)=1.15ms  
     http_req_sending...............: avg=32.57µs  min=5.93µs  med=17.49µs  max=90.34ms  p(90)=21.95µs  p(95)=24.04µs  p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.2ms  min=8.85ms  med=206.21ms max=403.52ms p(90)=271.06ms p(95)=278.03ms p(99.9)=357.46ms
     http_reqs......................: 28645   236.489506/s
     iteration_duration.............: avg=210.33ms min=45.8ms  med=206.72ms max=458.79ms p(90)=271.5ms  p(95)=278.43ms p(99.9)=361.22ms
     iterations.....................: 28545   235.663919/s
     success_rate...................: 100.00% ✓ 28545      ✗ 0    
     vus............................: 45      min=45       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 6057      ✗ 0   
     data_received..................: 203 MB  1.6 MB/s
     data_sent......................: 2.5 MB  20 kB/s
     http_req_blocked...............: avg=63.15µs  min=1.82µs  med=3.66µs  max=4.81ms  p(90)=5.42µs   p(95)=6.65µs   p(99.9)=4.49ms
     http_req_connecting............: avg=57.88µs  min=0s      med=0s      max=4.76ms  p(90)=0s       p(95)=0s       p(99.9)=4.46ms
     http_req_duration..............: avg=2.85s    min=35.56ms med=2.99s   max=4.98s   p(90)=3.71s    p(95)=3.96s    p(99.9)=4.65s 
       { expected_response:true }...: avg=2.85s    min=35.56ms med=2.99s   max=4.98s   p(90)=3.71s    p(95)=3.96s    p(99.9)=4.65s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2119
     http_req_receiving.............: avg=114.06µs min=40.8µs  med=92.78µs max=8.35ms  p(90)=134.59µs p(95)=151.14µs p(99.9)=5.59ms
     http_req_sending...............: avg=60.7µs   min=8.16µs  med=19.37µs max=18.02ms p(90)=25.06µs  p(95)=30.14µs  p(99.9)=8.41ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.85s    min=35.45ms med=2.99s   max=4.98s   p(90)=3.71s    p(95)=3.96s    p(99.9)=4.65s 
     http_reqs......................: 2119    16.671132/s
     iteration_duration.............: avg=2.99s    min=1.14s   med=3.02s   max=4.98s   p(90)=3.73s    p(95)=3.97s    p(99.9)=4.66s 
     iterations.....................: 2019    15.884387/s
     success_rate...................: 100.00% ✓ 2019      ✗ 0   
     vus............................: 10      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB

