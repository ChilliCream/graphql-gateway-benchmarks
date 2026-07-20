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
| hive-router | v0.0.83 | 3,045 | 3,290 | 2,989 | 3.4% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,659 | 2,753 | 2,638 | 1.5% |  |
| fusion-nightly | 16.5.1-p.2 | 2,486 | 2,587 | 2,469 | 1.6% |  |
| fusion | 16.5.0 | 2,481 | 2,583 | 2,470 | 1.6% |  |
| grafbase | 0.53.5 | 2,140 | 2,263 | 2,093 | 2.4% |  |
| cosmo | 0.331.1 | 1,321 | 1,364 | 1,315 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.4 | 626 | 643 | 610 | 1.5% |  |
| apollo-router | v2.16.0 | 448 | 469 | 444 | 2.0% |  |
| apollo-gateway | 2.14.2 | 280 | 283 | 277 | 0.7% |  |
| hive-gateway | 2.10.4 | 277 | 285 | 274 | 1.2% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% |  |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,448 | 2,651 | 2,430 | 3.3% |  |
| fusion-nightly | 16.5.1-p.2 | 2,434 | 2,530 | 2,425 | 1.5% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,368 | 2,489 | 2,353 | 2.0% |  |
| fusion | 16.5.0 | 2,337 | 2,433 | 2,313 | 2.0% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 2,207 | 2,309 | 2,202 | 1.8% |  |
| grafbase | 0.53.5 | 1,622 | 1,688 | 1,618 | 1.5% |  |
| cosmo | 0.331.1 | 1,230 | 1,277 | 1,223 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 592 | 614 | 588 | 1.4% |  |
| apollo-router | v2.16.0 | 451 | 469 | 436 | 2.2% |  |
| apollo-gateway | 2.14.2 | 263 | 268 | 262 | 0.8% |  |
| hive-gateway | 2.10.4 | 261 | 268 | 260 | 1.1% |  |
| feddi | 5ff8b6165878 | 19 | 20 | 19 | 2.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1097757     ✗ 0     
     data_received..................: 32 GB   267 MB/s
     data_sent......................: 440 MB  3.7 MB/s
     http_req_blocked...............: avg=2.71µs  min=881ns   med=1.98µs  max=13.95ms  p(90)=3.35µs  p(95)=4.04µs  p(99.9)=29.79µs
     http_req_connecting............: avg=265ns   min=0s      med=0s      max=3.77ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=16.18ms min=1.44ms  med=15.52ms max=282.7ms  p(90)=23.44ms p(95)=26.57ms p(99.9)=46.45ms
       { expected_response:true }...: avg=16.18ms min=1.44ms  med=15.52ms max=282.7ms  p(90)=23.44ms p(95)=26.57ms p(99.9)=46.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 366019
     http_req_receiving.............: avg=87.12µs min=26.36µs med=45.12µs max=62.71ms  p(90)=83.8µs  p(95)=147.6µs p(99.9)=7.19ms 
     http_req_sending...............: avg=49.33µs min=4.72µs  med=8.35µs  max=183.77ms p(90)=15.16µs p(95)=92.27µs p(99.9)=6.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=16.04ms min=1.37ms  med=15.41ms max=282.16ms p(90)=23.27ms p(95)=26.31ms p(99.9)=45.45ms
     http_reqs......................: 366019  3045.580474/s
     iteration_duration.............: avg=16.38ms min=1.91ms  med=15.71ms max=297.9ms  p(90)=23.64ms p(95)=26.79ms p(99.9)=47.24ms
     iterations.....................: 365919  3044.748391/s
     success_rate...................: 100.00% ✓ 365919      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 958842      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 384 MB  3.2 MB/s
     http_req_blocked...............: avg=2.61µs   min=881ns   med=1.85µs   max=12.17ms  p(90)=3.08µs  p(95)=3.68µs  p(99.9)=26.6µs 
     http_req_connecting............: avg=301ns    min=0s      med=0s       max=3.48ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.55ms  min=1.91ms  med=17.69ms  max=281.05ms p(90)=26.65ms p(95)=30.16ms p(99.9)=50.92ms
       { expected_response:true }...: avg=18.55ms  min=1.91ms  med=17.69ms  max=281.05ms p(90)=26.65ms p(95)=30.16ms p(99.9)=50.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 319714
     http_req_receiving.............: avg=655.47µs min=49.46µs med=101.07µs max=72.06ms  p(90)=1.67ms  p(95)=2.46ms  p(99.9)=19.25ms
     http_req_sending...............: avg=43.85µs  min=4.46µs  med=8.09µs   max=127.68ms p(90)=15.38µs p(95)=79.29µs p(99.9)=4.87ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.85ms  min=1.8ms   med=16.99ms  max=280.76ms p(90)=25.81ms p(95)=29.31ms p(99.9)=49.14ms
     http_reqs......................: 319714  2659.128906/s
     iteration_duration.............: avg=18.76ms  min=3.35ms  med=17.88ms  max=292.71ms p(90)=26.86ms p(95)=30.38ms p(99.9)=51.42ms
     iterations.....................: 319614  2658.297185/s
     success_rate...................: 100.00% ✓ 319614      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 896880      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=2.88µs   min=921ns   med=2.08µs  max=15.6ms   p(90)=3.34µs  p(95)=3.89µs  p(99.9)=31µs    
     http_req_connecting............: avg=325ns    min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.85ms  min=2.07ms  med=17.04ms max=338.96ms p(90)=32.38ms p(95)=39.28ms p(99.9)=124.57ms
       { expected_response:true }...: avg=19.85ms  min=2.07ms  med=17.04ms max=338.96ms p(90)=32.38ms p(95)=39.28ms p(99.9)=124.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299060
     http_req_receiving.............: avg=594.67µs min=52.27µs med=91.95µs max=164.1ms  p(90)=1.1ms   p(95)=2.01ms  p(99.9)=26.15ms 
     http_req_sending...............: avg=43.66µs  min=4.74µs  med=8.3µs   max=162.22ms p(90)=14.14µs p(95)=74.53µs p(99.9)=4.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.21ms  min=1.98ms  med=16.48ms max=338.84ms p(90)=31.37ms p(95)=38.16ms p(99.9)=122.59ms
     http_reqs......................: 299060  2486.648683/s
     iteration_duration.............: avg=20.06ms  min=3.01ms  med=17.23ms max=339.12ms p(90)=32.59ms p(95)=39.5ms  p(99.9)=126.13ms
     iterations.....................: 298960  2485.817195/s
     success_rate...................: 100.00% ✓ 298960      ✗ 0     
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

     checks.........................: 100.00% ✓ 894831      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=3.02µs  min=1.05µs  med=2.3µs   max=7.09ms   p(90)=3.52µs  p(95)=4.08µs  p(99.9)=32.6µs  
     http_req_connecting............: avg=336ns   min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.89ms min=1.96ms  med=16.97ms max=387.54ms p(90)=32.43ms p(95)=39.46ms p(99.9)=134.62ms
       { expected_response:true }...: avg=19.89ms min=1.96ms  med=16.97ms max=387.54ms p(90)=32.43ms p(95)=39.46ms p(99.9)=134.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298377
     http_req_receiving.............: avg=583.7µs min=51.94µs med=95.32µs max=240.74ms p(90)=1.09ms  p(95)=1.94ms  p(99.9)=25.79ms 
     http_req_sending...............: avg=42.3µs  min=4.6µs   med=8.69µs  max=151.37ms p(90)=14.43µs p(95)=82.32µs p(99.9)=3.75ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.27ms min=1.86ms  med=16.43ms max=387.13ms p(90)=31.47ms p(95)=38.32ms p(99.9)=133.08ms
     http_reqs......................: 298377  2481.406694/s
     iteration_duration.............: avg=20.1ms  min=2.99ms  med=17.16ms max=387.74ms p(90)=32.64ms p(95)=39.68ms p(99.9)=136.38ms
     iterations.....................: 298277  2480.575059/s
     success_rate...................: 100.00% ✓ 298277      ✗ 0     
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

     checks.........................: 100.00% ✓ 771684      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.37µs  min=1.07µs  med=2.59µs  max=12.52ms  p(90)=4.09µs  p(95)=4.82µs  p(99.9)=36.9µs 
     http_req_connecting............: avg=341ns   min=0s      med=0s      max=3.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=23.1ms  min=1.69ms  med=22.87ms max=307.41ms p(90)=27.49ms p(95)=29.26ms p(99.9)=48.62ms
       { expected_response:true }...: avg=23.1ms  min=1.69ms  med=22.87ms max=307.41ms p(90)=27.49ms p(95)=29.26ms p(99.9)=48.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257328
     http_req_receiving.............: avg=89.22µs min=29.86µs med=57.44µs max=97.47ms  p(90)=94.12µs p(95)=119.9µs p(99.9)=6.01ms 
     http_req_sending...............: avg=36.24µs min=4.98µs  med=10.33µs max=133.32ms p(90)=16.32µs p(95)=26.31µs p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.97ms min=1.57ms  med=22.76ms max=306.74ms p(90)=27.36ms p(95)=29.09ms p(99.9)=47.41ms
     http_reqs......................: 257328  2140.381263/s
     iteration_duration.............: avg=23.31ms min=4.78ms  med=23.06ms max=322.44ms p(90)=27.69ms p(95)=29.47ms p(99.9)=49.19ms
     iterations.....................: 257228  2139.549491/s
     success_rate...................: 100.00% ✓ 257228      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 476640      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=2.94µs  min=922ns   med=2.09µs  max=3.4ms    p(90)=3.62µs  p(95)=4.26µs   p(99.9)=33.45µs 
     http_req_connecting............: avg=522ns   min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.53ms min=2.05ms  med=37.14ms max=317.17ms p(90)=52.37ms p(95)=56.96ms  p(99.9)=78.1ms  
       { expected_response:true }...: avg=37.53ms min=2.05ms  med=37.14ms max=317.17ms p(90)=52.37ms p(95)=56.96ms  p(99.9)=78.1ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 158980
     http_req_receiving.............: avg=69.3µs  min=25.76µs med=57.13µs max=39.29ms  p(90)=93.21µs p(95)=108.17µs p(99.9)=845.57µs
     http_req_sending...............: avg=22.89µs min=4.6µs   med=9.8µs   max=119.2ms  p(90)=16.62µs p(95)=20.45µs  p(99.9)=998.91µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.44ms min=1.98ms  med=37.05ms max=316.64ms p(90)=52.28ms p(95)=56.86ms  p(99.9)=77.94ms 
     http_reqs......................: 158980  1321.826199/s
     iteration_duration.............: avg=37.75ms min=3.66ms  med=37.34ms max=327.14ms p(90)=52.58ms p(95)=57.16ms  p(99.9)=78.49ms 
     iterations.....................: 158880  1320.994757/s
     success_rate...................: 100.00% ✓ 158880      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 226158     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   753 kB/s
     http_req_blocked...............: avg=4.35µs  min=1.1µs   med=3.05µs  max=3.61ms   p(90)=4.6µs    p(95)=5.31µs   p(99.9)=44.78µs 
     http_req_connecting............: avg=1.03µs  min=0s      med=0s      max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.25ms min=3.67ms  med=75.84ms max=304.29ms p(90)=120.59ms p(95)=131.61ms p(99.9)=214.89ms
       { expected_response:true }...: avg=79.25ms min=3.67ms  med=75.84ms max=304.29ms p(90)=120.59ms p(95)=131.61ms p(99.9)=214.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75486
     http_req_receiving.............: avg=80.28µs min=26.44µs med=68.09µs max=108.77ms p(90)=105.5µs  p(95)=119.38µs p(99.9)=677.98µs
     http_req_sending...............: avg=21.75µs min=5.05µs  med=13.25µs max=98.9ms   p(90)=20.49µs  p(95)=22.88µs  p(99.9)=700.18µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.15ms min=3.55ms  med=75.74ms max=281.11ms p(90)=120.49ms p(95)=131.5ms  p(99.9)=214.62ms
     http_reqs......................: 75486   626.565712/s
     iteration_duration.............: avg=79.59ms min=20.96ms med=76.15ms max=318.42ms p(90)=120.83ms p(95)=131.85ms p(99.9)=216.84ms
     iterations.....................: 75386   625.73567/s
     success_rate...................: 100.00% ✓ 75386      ✗ 0    
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

     checks.........................: 100.00% ✓ 162126     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=4.46µs   min=1.3µs   med=3.24µs   max=2.38ms   p(90)=4.6µs    p(95)=5.15µs   p(99.9)=74.66µs 
     http_req_connecting............: avg=972ns    min=0s      med=0s       max=2.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.58ms min=4.62ms  med=110.49ms max=299.6ms  p(90)=133.43ms p(95)=140.43ms p(99.9)=171.75ms
       { expected_response:true }...: avg=110.58ms min=4.62ms  med=110.49ms max=299.6ms  p(90)=133.43ms p(95)=140.43ms p(99.9)=171.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54142
     http_req_receiving.............: avg=81.43µs  min=29.52µs med=76.45µs  max=22.77ms  p(90)=107.6µs  p(95)=120.21µs p(99.9)=567.65µs
     http_req_sending...............: avg=25.38µs  min=5.85µs  med=16.26µs  max=130.72ms p(90)=21.83µs  p(95)=23.62µs  p(99.9)=583.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.48ms min=4.5ms   med=110.4ms  max=299.39ms p(90)=133.33ms p(95)=140.33ms p(99.9)=171.55ms
     http_reqs......................: 54142   448.933269/s
     iteration_duration.............: avg=111.04ms min=13.96ms med=110.79ms max=325.82ms p(90)=133.7ms  p(95)=140.7ms  p(99.9)=172.8ms 
     iterations.....................: 54042   448.104092/s
     success_rate...................: 100.00% ✓ 54042      ✗ 0    
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

     checks.........................: 100.00% ✓ 101541     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.59µs   min=1.3µs   med=3.31µs   max=4.35ms   p(90)=4.59µs   p(95)=5.15µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=3.08µs   min=0s      med=0s       max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=176.56ms min=7.46ms  med=162.05ms max=356.97ms p(90)=231.68ms p(95)=237.84ms p(99.9)=305.68ms
       { expected_response:true }...: avg=176.56ms min=7.46ms  med=162.05ms max=356.97ms p(90)=231.68ms p(95)=237.84ms p(99.9)=305.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33947
     http_req_receiving.............: avg=94.17µs  min=33.69µs med=80.58µs  max=124.28ms p(90)=111.91µs p(95)=122.81µs p(99.9)=500.24µs
     http_req_sending...............: avg=26.73µs  min=5.96µs  med=16.34µs  max=71.44ms  p(90)=21.13µs  p(95)=22.97µs  p(99.9)=499.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.44ms min=7.33ms  med=161.95ms max=356.88ms p(90)=231.57ms p(95)=237.71ms p(99.9)=305.16ms
     http_reqs......................: 33947   280.706315/s
     iteration_duration.............: avg=177.35ms min=44.65ms med=162.36ms max=366.24ms p(90)=231.99ms p(95)=238.15ms p(99.9)=306.49ms
     iterations.....................: 33847   279.879419/s
     success_rate...................: 100.00% ✓ 33847      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100107     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   333 kB/s
     http_req_blocked...............: avg=6.94µs   min=1.33µs  med=3.52µs   max=8.91ms   p(90)=4.93µs   p(95)=5.55µs   p(99.9)=877.27µs
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=8.88ms   p(90)=0s       p(95)=0s       p(99.9)=704.91µs
     http_req_duration..............: avg=179.09ms min=5.58ms  med=163.51ms max=710.82ms p(90)=205.36ms p(95)=239.09ms p(99.9)=601.12ms
       { expected_response:true }...: avg=179.09ms min=5.58ms  med=163.51ms max=710.82ms p(90)=205.36ms p(95)=239.09ms p(99.9)=601.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33469
     http_req_receiving.............: avg=101.97µs min=35.23µs med=91.09µs  max=63.89ms  p(90)=120.37µs p(95)=132.52µs p(99.9)=760.41µs
     http_req_sending...............: avg=25.72µs  min=6.38µs  med=18.27µs  max=68.93ms  p(90)=22.75µs  p(95)=24.55µs  p(99.9)=603.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.96ms min=5.49ms  med=163.4ms  max=710.73ms p(90)=205.25ms p(95)=238.82ms p(99.9)=600.85ms
     http_reqs......................: 33469   277.065657/s
     iteration_duration.............: avg=179.9ms  min=36.08ms med=163.85ms max=711.02ms p(90)=205.73ms p(95)=240.31ms p(99.9)=601.45ms
     iterations.....................: 33369   276.237829/s
     success_rate...................: 100.00% ✓ 33369      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
data_received..................: 2.3 MB 38 kB/s
     data_sent......................: 30 kB  499 B/s
     http_req_blocked...............: avg=106.33µs min=2.6µs   med=3.31µs  max=2.46ms   p(90)=5.08µs  p(95)=7.82µs   p(99.9)=2.41ms  
     http_req_connecting............: avg=98.84µs  min=0s      med=0s      max=2.37ms   p(90)=0s      p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=1.28s    min=27.01ms med=38.32ms max=30.02s   p(90)=47.79ms p(95)=52.62ms  p(99.9)=29.33s  
       { expected_response:true }...: avg=1.28s    min=27.01ms med=38.32ms max=30.02s   p(90)=47.79ms p(95)=52.62ms  p(99.9)=29.33s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 24  
     http_req_receiving.............: avg=141.48µs min=87.18µs med=120.6µs max=349.92µs p(90)=230.2µs p(95)=305.07µs p(99.9)=349.06µs
     http_req_sending...............: avg=26.52µs  min=14.21µs med=18.07µs max=142.51µs p(90)=30.45µs p(95)=80.3µs   p(99.9)=141.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.28s    min=26.85ms med=38.03ms max=30.02s   p(90)=47.56ms p(95)=52.46ms  p(99.9)=29.33s  
     http_reqs......................: 24     0.399999/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 882597      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 354 MB  2.9 MB/s
     http_req_blocked...............: avg=3.43µs  min=1µs     med=2.6µs   max=16.14ms  p(90)=4.13µs  p(95)=4.85µs   p(99.9)=38.62µs
     http_req_connecting............: avg=295ns   min=0s      med=0s      max=3.39ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.17ms min=1.51ms  med=19.95ms max=289.1ms  p(90)=27.95ms p(95)=30.4ms   p(99.9)=50.15ms
       { expected_response:true }...: avg=20.17ms min=1.51ms  med=19.95ms max=289.1ms  p(90)=27.95ms p(95)=30.4ms   p(99.9)=50.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 294299
     http_req_receiving.............: avg=91.08µs min=26.38µs med=53.05µs max=82.47ms  p(90)=93.45µs p(95)=131.28µs p(99.9)=6.51ms 
     http_req_sending...............: avg=42.36µs min=4.92µs  med=10.34µs max=33.14ms  p(90)=17.24µs p(95)=81.98µs  p(99.9)=3.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.03ms min=1.45ms  med=19.84ms max=288.49ms p(90)=27.81ms p(95)=30.21ms  p(99.9)=49.16ms
     http_reqs......................: 294299  2448.331669/s
     iteration_duration.............: avg=20.38ms min=2.95ms  med=20.16ms max=308.49ms p(90)=28.16ms p(95)=30.62ms  p(99.9)=50.54ms
     iterations.....................: 294199  2447.49975/s
     success_rate...................: 100.00% ✓ 294199      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 877707      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=2.97µs   min=841ns   med=2.06µs  max=17.72ms  p(90)=3.61µs  p(95)=4.33µs  p(99.9)=28.44µs 
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.28ms  min=1.58ms  med=17.07ms max=304.97ms p(90)=33.13ms p(95)=40.52ms p(99.9)=140.13ms
       { expected_response:true }...: avg=20.28ms  min=1.58ms  med=17.07ms max=304.97ms p(90)=33.13ms p(95)=40.52ms p(99.9)=140.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292669
     http_req_receiving.............: avg=555.79µs min=50.38µs med=92.75µs max=201.36ms p(90)=1.06ms  p(95)=1.82ms  p(99.9)=25.97ms 
     http_req_sending...............: avg=40.19µs  min=4.65µs  med=8.75µs  max=100.25ms p(90)=17.18µs p(95)=74.23µs p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.68ms  min=1.46ms  med=16.56ms max=304.34ms p(90)=32.18ms p(95)=39.44ms p(99.9)=138.74ms
     http_reqs......................: 292669  2434.724499/s
     iteration_duration.............: avg=20.49ms  min=2.69ms  med=17.27ms max=333.65ms p(90)=33.36ms p(95)=40.77ms p(99.9)=140.89ms
     iterations.....................: 292569  2433.892595/s
     success_rate...................: 100.00% ✓ 292569      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 853620      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=3.42µs   min=992ns  med=2.55µs   max=18.44ms  p(90)=4.05µs  p(95)=4.75µs  p(99.9)=35.85µs
     http_req_connecting............: avg=350ns    min=0s     med=0s       max=3.74ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.85ms  min=1.54ms med=19.96ms  max=290.77ms p(90)=30.18ms p(95)=33.89ms p(99.9)=55.39ms
       { expected_response:true }...: avg=20.85ms  min=1.54ms med=19.96ms  max=290.77ms p(90)=30.18ms p(95)=33.89ms p(99.9)=55.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284640
     http_req_receiving.............: avg=820.05µs min=53.3µs med=135.77µs max=44.38ms  p(90)=2.03ms  p(95)=3.02ms  p(99.9)=22.07ms
     http_req_sending...............: avg=43.4µs   min=4.62µs med=9.6µs    max=58.51ms  p(90)=18.26µs p(95)=90.02µs p(99.9)=3.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.99ms  min=1.43ms med=19.09ms  max=290.28ms p(90)=29.16ms p(95)=32.82ms p(99.9)=53.45ms
     http_reqs......................: 284640  2368.080819/s
     iteration_duration.............: avg=21.07ms  min=2.95ms med=20.16ms  max=313ms    p(90)=30.39ms p(95)=34.12ms p(99.9)=55.85ms
     iterations.....................: 284540  2367.248863/s
     success_rate...................: 100.00% ✓ 284540      ✗ 0     
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

     checks.........................: 100.00% ✓ 842556      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 338 MB  2.8 MB/s
     http_req_blocked...............: avg=2.65µs   min=852ns   med=1.92µs  max=13.98ms  p(90)=3.23µs  p(95)=3.86µs  p(99.9)=28.67µs 
     http_req_connecting............: avg=294ns    min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.14ms  min=1.61ms  med=17.5ms  max=479.37ms p(90)=35.03ms p(95)=43.14ms p(99.9)=161.79ms
       { expected_response:true }...: avg=21.14ms  min=1.61ms  med=17.5ms  max=479.37ms p(90)=35.03ms p(95)=43.14ms p(99.9)=161.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280952
     http_req_receiving.............: avg=608.25µs min=50.11µs med=93.94µs max=218.26ms p(90)=1.11ms  p(95)=1.91ms  p(99.9)=29.35ms 
     http_req_sending...............: avg=38.36µs  min=4.64µs  med=8.22µs  max=99.62ms  p(90)=14.85µs p(95)=37.99µs p(99.9)=2.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.5ms   min=1.47ms  med=16.95ms max=478.44ms p(90)=33.95ms p(95)=41.86ms p(99.9)=160.36ms
     http_reqs......................: 280952  2337.313944/s
     iteration_duration.............: avg=21.35ms  min=2.6ms   med=17.7ms  max=479.51ms p(90)=35.25ms p(95)=43.35ms p(99.9)=163.16ms
     iterations.....................: 280852  2336.482017/s
     success_rate...................: 100.00% ✓ 280852      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 796263      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 319 MB  2.7 MB/s
     http_req_blocked...............: avg=3µs      min=892ns   med=2.19µs  max=4.31ms   p(90)=3.89µs  p(95)=4.66µs  p(99.9)=34.13µs 
     http_req_connecting............: avg=358ns    min=0s      med=0s      max=3.75ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.37ms  min=2.06ms  med=19.18ms max=366.48ms p(90)=35.71ms p(95)=43.59ms p(99.9)=145.15ms
       { expected_response:true }...: avg=22.37ms  min=2.06ms  med=19.18ms max=366.48ms p(90)=35.71ms p(95)=43.59ms p(99.9)=145.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 265521
     http_req_receiving.............: avg=608.38µs min=51.44µs med=99.2µs  max=294.34ms p(90)=1.14ms  p(95)=1.94ms  p(99.9)=29.14ms 
     http_req_sending...............: avg=38.53µs  min=4.65µs  med=9.34µs  max=50.09ms  p(90)=19.62µs p(95)=68.77µs p(99.9)=2.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.72ms  min=1.92ms  med=18.64ms max=366.38ms p(90)=34.68ms p(95)=42.41ms p(99.9)=139.94ms
     http_reqs......................: 265521  2207.936049/s
     iteration_duration.............: avg=22.59ms  min=3.23ms  med=19.39ms max=366.7ms  p(90)=35.93ms p(95)=43.83ms p(99.9)=145.69ms
     iterations.....................: 265421  2207.104501/s
     success_rate...................: 100.00% ✓ 265421      ✗ 0     
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

     checks.........................: 100.00% ✓ 585213      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 235 MB  1.9 MB/s
     http_req_blocked...............: avg=3.38µs  min=902ns   med=2.27µs  max=4.69ms   p(90)=4.5µs    p(95)=5.6µs    p(99.9)=44.7µs 
     http_req_connecting............: avg=460ns   min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.51ms min=2.31ms  med=29.95ms max=299.51ms p(90)=40.14ms  p(95)=43.47ms  p(99.9)=64.62ms
       { expected_response:true }...: avg=30.51ms min=2.31ms  med=29.95ms max=299.51ms p(90)=40.14ms  p(95)=43.47ms  p(99.9)=64.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195171
     http_req_receiving.............: avg=92.64µs min=26.66µs med=54.32µs max=228.96ms p(90)=124.15µs p(95)=200.6µs  p(99.9)=3.56ms 
     http_req_sending...............: avg=40.17µs min=4.08µs  med=9.23µs  max=148.06ms p(90)=23.46µs  p(95)=103.07µs p(99.9)=2.94ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.37ms min=2.19ms  med=29.84ms max=277.79ms p(90)=39.99ms  p(95)=43.31ms  p(99.9)=64.12ms
     http_reqs......................: 195171  1622.589685/s
     iteration_duration.............: avg=30.74ms min=6.32ms  med=30.17ms max=320.36ms p(90)=40.35ms  p(95)=43.69ms  p(99.9)=65.18ms
     iterations.....................: 195071  1621.758317/s
     success_rate...................: 100.00% ✓ 195071      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443571      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=4.02µs  min=1.09µs  med=3.03µs  max=3.78ms   p(90)=4.69µs  p(95)=5.43µs   p(99.9)=39.56µs
     http_req_connecting............: avg=682ns   min=0s      med=0s      max=3.73ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.31ms min=2.18ms  med=39.95ms max=300.88ms p(90)=55.97ms p(95)=60.85ms  p(99.9)=83.89ms
       { expected_response:true }...: avg=40.31ms min=2.18ms  med=39.95ms max=300.88ms p(90)=55.97ms p(95)=60.85ms  p(99.9)=83.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147957
     http_req_receiving.............: avg=83.52µs min=27.49µs med=68.48µs max=108.69ms p(90)=108.1µs p(95)=126.23µs p(99.9)=1.18ms 
     http_req_sending...............: avg=29.5µs  min=5.37µs  med=13.07µs max=192.04ms p(90)=20.03µs p(95)=24.44µs  p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.19ms min=2.09ms  med=39.85ms max=286.05ms p(90)=55.85ms p(95)=60.72ms  p(99.9)=83.42ms
     http_reqs......................: 147957  1230.011193/s
     iteration_duration.............: avg=40.57ms min=3.99ms  med=40.18ms max=315.1ms  p(90)=56.2ms  p(95)=61.08ms  p(99.9)=84.63ms
     iterations.....................: 147857  1229.179863/s
     success_rate...................: 100.00% ✓ 147857      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 213813     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 86 MB   711 kB/s
     http_req_blocked...............: avg=4.99µs  min=1.22µs  med=3.36µs  max=3.36ms   p(90)=4.93µs   p(95)=5.63µs   p(99.9)=52.2µs  
     http_req_connecting............: avg=1.35µs  min=0s      med=0s      max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.82ms min=3.98ms  med=81.85ms max=326.22ms p(90)=102.14ms p(95)=112.09ms p(99.9)=198.2ms 
       { expected_response:true }...: avg=83.82ms min=3.98ms  med=81.85ms max=326.22ms p(90)=102.14ms p(95)=112.09ms p(99.9)=198.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 71371
     http_req_receiving.............: avg=86.98µs min=30.22µs med=76.29µs max=104.59ms p(90)=112.38µs p(95)=126.03µs p(99.9)=711.7µs 
     http_req_sending...............: avg=32.98µs min=5.51µs  med=15.38µs max=200.44ms p(90)=22.29µs  p(95)=24.73µs  p(99.9)=628.69µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.7ms  min=3.84ms  med=81.74ms max=317.18ms p(90)=102.02ms p(95)=111.91ms p(99.9)=197.42ms
     http_reqs......................: 71371   592.072944/s
     iteration_duration.............: avg=84.19ms min=20.06ms med=82.12ms max=336.91ms p(90)=102.42ms p(95)=112.4ms  p(99.9)=199.99ms
     iterations.....................: 71271   591.243373/s
     success_rate...................: 100.00% ✓ 71271      ✗ 0    
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

     checks.........................: 100.00% ✓ 163011     ✗ 0    
     data_received..................: 4.8 GB  40 MB/s
     data_sent......................: 65 MB   542 kB/s
     http_req_blocked...............: avg=5.59µs   min=1.16µs  med=3.77µs   max=3.39ms   p(90)=5.36µs   p(95)=5.99µs   p(99.9)=66.45µs 
     http_req_connecting............: avg=1.56µs   min=0s      med=0s       max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=109.95ms min=5.41ms  med=107.87ms max=312.83ms p(90)=144.69ms p(95)=156.02ms p(99.9)=201.88ms
       { expected_response:true }...: avg=109.95ms min=5.41ms  med=107.87ms max=312.83ms p(90)=144.69ms p(95)=156.02ms p(99.9)=201.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54437
     http_req_receiving.............: avg=88.43µs  min=30.88µs med=84.62µs  max=21.17ms  p(90)=115.67µs p(95)=127.91µs p(99.9)=589.89µs
     http_req_sending...............: avg=27.01µs  min=5.71µs  med=18.19µs  max=86.51ms  p(90)=23.58µs  p(95)=25.64µs  p(99.9)=565.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.84ms min=5.27ms  med=107.76ms max=312.27ms p(90)=144.59ms p(95)=155.91ms p(99.9)=201.61ms
     http_reqs......................: 54437   451.204742/s
     iteration_duration.............: avg=110.44ms min=18.62ms med=108.19ms max=321ms    p(90)=144.99ms p(95)=156.34ms p(99.9)=204.52ms
     iterations.....................: 54337   450.375885/s
     success_rate...................: 100.00% ✓ 54337      ✗ 0    
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

     checks.........................: 100.00% ✓ 95454      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.24µs  med=3.65µs   max=2.79ms   p(90)=5.08µs   p(95)=5.67µs   p(99.9)=950.05µs
     http_req_connecting............: avg=1.92µs   min=0s      med=0s       max=2.74ms   p(90)=0s       p(95)=0s       p(99.9)=894.08µs
     http_req_duration..............: avg=187.81ms min=7.84ms  med=189.63ms max=361.91ms p(90)=209.73ms p(95)=215.12ms p(99.9)=288.29ms
       { expected_response:true }...: avg=187.81ms min=7.84ms  med=189.63ms max=361.91ms p(90)=209.73ms p(95)=215.12ms p(99.9)=288.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31918
     http_req_receiving.............: avg=96.74µs  min=32.47µs med=90.08µs  max=68.97ms  p(90)=120.63µs p(95)=132.02µs p(99.9)=478.81µs
     http_req_sending...............: avg=33.5µs   min=5.86µs  med=18.14µs  max=150.46ms p(90)=22.81µs  p(95)=24.73µs  p(99.9)=557µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.68ms min=7.74ms  med=189.52ms max=353.84ms p(90)=209.59ms p(95)=215ms    p(99.9)=287.84ms
     http_reqs......................: 31918   263.824916/s
     iteration_duration.............: avg=188.67ms min=54.38ms med=190.01ms max=377.28ms p(90)=210.01ms p(95)=215.44ms p(99.9)=290.38ms
     iterations.....................: 31818   262.998345/s
     success_rate...................: 100.00% ✓ 31818      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94512      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.87µs   min=1.1µs   med=3.16µs   max=5.81ms   p(90)=4.5µs    p(95)=5.03µs   p(99.9)=929.8µs 
     http_req_connecting............: avg=3.44µs   min=0s      med=0s       max=5.78ms   p(90)=0s       p(95)=0s       p(99.9)=874.21µs
     http_req_duration..............: avg=189.71ms min=6.25ms  med=174ms    max=648.29ms p(90)=222.4ms  p(95)=268.45ms p(99.9)=568.16ms
       { expected_response:true }...: avg=189.71ms min=6.25ms  med=174ms    max=648.29ms p(90)=222.4ms  p(95)=268.45ms p(99.9)=568.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31604
     http_req_receiving.............: avg=89.79µs  min=31.85µs med=87.87µs  max=6.04ms   p(90)=117.84µs p(95)=129.53µs p(99.9)=561.36µs
     http_req_sending...............: avg=20.96µs  min=5.33µs  med=16.71µs  max=13.98ms  p(90)=21.01µs  p(95)=22.73µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.6ms  min=6.12ms  med=173.89ms max=648.24ms p(90)=222.32ms p(95)=268.27ms p(99.9)=568.05ms
     http_reqs......................: 31604   261.466321/s
     iteration_duration.............: avg=190.54ms min=25.39ms med=174.31ms max=648.48ms p(90)=222.79ms p(95)=269.51ms p(99.9)=568.41ms
     iterations.....................: 31504   260.639001/s
     success_rate...................: 100.00% ✓ 31504      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 7212      ✗ 0   
     data_received..................: 240 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=118.86µs min=1.41µs   med=3.83µs  max=9.01ms  p(90)=5.62µs   p(95)=6.48µs   p(99.9)=8.44ms  
     http_req_connecting............: avg=113.04µs min=0s       med=0s      max=8.96ms  p(90)=0s       p(95)=0s       p(99.9)=8.39ms  
     http_req_duration..............: avg=2.41s    min=29.59ms  med=2.46s   max=4.7s    p(90)=3.26s    p(95)=3.48s    p(99.9)=4.35s   
       { expected_response:true }...: avg=2.41s    min=29.59ms  med=2.46s   max=4.7s    p(90)=3.26s    p(95)=3.48s    p(99.9)=4.35s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2504
     http_req_receiving.............: avg=101.14µs min=33.25µs  med=95.61µs max=2.35ms  p(90)=136.73µs p(95)=152.26µs p(99.9)=392.19µs
     http_req_sending...............: avg=59.56µs  min=6.7µs    med=19.55µs max=27.63ms p(90)=24.87µs  p(95)=30µs     p(99.9)=2.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.41s    min=29.44ms  med=2.46s   max=4.7s    p(90)=3.26s    p(95)=3.48s    p(99.9)=4.34s   
     http_reqs......................: 2504    19.887021/s
     iteration_duration.............: avg=2.51s    min=456.63ms med=2.5s    max=4.71s   p(90)=3.28s    p(95)=3.5s     p(99.9)=4.35s   
     iterations.....................: 2404    19.092811/s
     success_rate...................: 100.00% ✓ 2404      ✗ 0   
     vus............................: 34      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

