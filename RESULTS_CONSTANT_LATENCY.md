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
| hive-router | v0.0.72 | 1,561 | 1,581 | 1,550 | 0.6% |  |
| fusion-nightly | 16.3.0-p.1 | 1,553 | 1,571 | 1,542 | 0.6% |  |
| fusion | 16.2.2 | 1,541 | 1,563 | 1,538 | 0.5% |  |
| grafbase | 0.53.5 | 1,124 | 1,143 | 1,114 | 0.7% |  |
| cosmo | 0.324.0 | 1,065 | 1,087 | 1,058 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 536 | 549 | 533 | 1.1% |  |
| apollo-router | v2.15.1 | 408 | 418 | 405 | 1.1% |  |
| apollo-gateway | 2.14.1 | 237 | 238 | 236 | 0.3% |  |
| hive-gateway | 2.9.0 | 237 | 242 | 235 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 571500      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.58µs  min=1.01µs  med=2.59µs  max=4.34ms   p(90)=4.47µs   p(95)=5.4µs    p(99.9)=36.58µs
     http_req_connecting............: avg=545ns   min=0s      med=0s      max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.24ms min=14.77ms med=30.96ms max=335.43ms p(90)=37.2ms   p(95)=39.13ms  p(99.9)=56.57ms
       { expected_response:true }...: avg=31.24ms min=14.77ms med=30.96ms max=335.43ms p(90)=37.2ms   p(95)=39.13ms  p(99.9)=56.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190600
     http_req_receiving.............: avg=85.69µs min=27.83µs med=56.58µs max=93.25ms  p(90)=108.06µs p(95)=153.31µs p(99.9)=2.25ms 
     http_req_sending...............: avg=35.64µs min=5.18µs  med=10.33µs max=263.1ms  p(90)=20.37µs  p(95)=42.95µs  p(99.9)=1.64ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.12ms min=14.66ms med=30.85ms max=329.86ms p(90)=37.08ms  p(95)=38.99ms  p(99.9)=55.27ms
     http_reqs......................: 190600  1561.749648/s
     iteration_duration.............: avg=31.48ms min=15.03ms med=31.18ms max=348.07ms p(90)=37.42ms  p(95)=39.35ms  p(99.9)=57.1ms 
     iterations.....................: 190500  1560.930262/s
     success_rate...................: 100.00% ✓ 190500      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 568149      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=3.39µs   min=1.01µs  med=2.33µs   max=4.1ms    p(90)=4.08µs  p(95)=4.97µs   p(99.9)=34.77µs
     http_req_connecting............: avg=599ns    min=0s      med=0s       max=4.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.42ms  min=14ms    med=30.87ms  max=347.25ms p(90)=38.6ms  p(95)=41.2ms   p(99.9)=59.64ms
       { expected_response:true }...: avg=31.42ms  min=14ms    med=30.87ms  max=347.25ms p(90)=38.6ms  p(95)=41.2ms   p(99.9)=59.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189483
     http_req_receiving.............: avg=648.44µs min=51.08µs med=116.65µs max=141.17ms p(90)=1.85ms  p(95)=2.8ms    p(99.9)=14.22ms
     http_req_sending...............: avg=36.13µs  min=5.2µs   med=9.63µs   max=206.09ms p(90)=20.65µs p(95)=107.53µs p(99.9)=1.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.74ms  min=13.81ms med=30.21ms  max=331.61ms p(90)=37.72ms p(95)=40.26ms  p(99.9)=55.77ms
     http_reqs......................: 189483  1553.359486/s
     iteration_duration.............: avg=31.67ms  min=14.29ms med=31.09ms  max=358.21ms p(90)=38.82ms p(95)=41.42ms  p(99.9)=59.96ms
     iterations.....................: 189383  1552.539697/s
     success_rate...................: 100.00% ✓ 189383      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 564156      ✗ 0     
     data_received..................: 17 GB   135 MB/s
     data_sent......................: 226 MB  1.9 MB/s
     http_req_blocked...............: avg=3.43µs   min=992ns   med=2.42µs   max=4.15ms   p(90)=4.09µs  p(95)=4.96µs   p(99.9)=38.27µs
     http_req_connecting............: avg=560ns    min=0s      med=0s       max=4.09ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.65ms  min=14.14ms med=31.07ms  max=339.25ms p(90)=38.89ms p(95)=41.49ms  p(99.9)=62.53ms
       { expected_response:true }...: avg=31.65ms  min=14.14ms med=31.07ms  max=339.25ms p(90)=38.89ms p(95)=41.49ms  p(99.9)=62.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188152
     http_req_receiving.............: avg=588.35µs min=51.62µs med=113.81µs max=256.25ms p(90)=1.64ms  p(95)=2.57ms   p(99.9)=12.66ms
     http_req_sending...............: avg=34.21µs  min=5.05µs  med=9.75µs   max=97.07ms  p(90)=20.18µs p(95)=104.87µs p(99.9)=1.96ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.03ms  min=13.92ms med=30.47ms  max=311.08ms p(90)=38.11ms p(95)=40.62ms  p(99.9)=60.56ms
     http_reqs......................: 188152  1541.843955/s
     iteration_duration.............: avg=31.89ms  min=14.3ms  med=31.3ms   max=355.38ms p(90)=39.11ms p(95)=41.71ms  p(99.9)=63.56ms
     iterations.....................: 188052  1541.024488/s
     success_rate...................: 100.00% ✓ 188052      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 411213      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.87µs  min=962ns   med=2.23µs  max=12.57ms  p(90)=4.66µs   p(95)=5.83µs   p(99.9)=50.22µs
     http_req_connecting............: avg=831ns   min=0s      med=0s      max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.48ms min=17.39ms med=43.07ms max=344.71ms p(90)=52.96ms  p(95)=56.25ms  p(99.9)=80.63ms
       { expected_response:true }...: avg=43.48ms min=17.39ms med=43.07ms max=344.71ms p(90)=52.96ms  p(95)=56.25ms  p(99.9)=80.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137171
     http_req_receiving.............: avg=95.79µs min=29.38µs med=58.52µs max=131.58ms p(90)=132.14µs p(95)=212.2µs  p(99.9)=3.11ms 
     http_req_sending...............: avg=39.31µs min=5.29µs  med=9.83µs  max=175.31ms p(90)=24.04µs  p(95)=114.74µs p(99.9)=2.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.35ms min=17.27ms med=42.94ms max=344.31ms p(90)=52.81ms  p(95)=56.1ms   p(99.9)=80.19ms
     http_reqs......................: 137171  1124.209529/s
     iteration_duration.............: avg=43.76ms min=18.24ms med=43.31ms max=361.99ms p(90)=53.2ms   p(95)=56.47ms  p(99.9)=81.36ms
     iterations.....................: 137071  1123.389962/s
     success_rate...................: 100.00% ✓ 137071      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 389817      ✗ 0     
     data_received..................: 11 GB   93 MB/s
     data_sent......................: 156 MB  1.3 MB/s
     http_req_blocked...............: avg=3.63µs  min=1.1µs   med=2.58µs  max=4.04ms   p(90)=4.22µs   p(95)=5.02µs   p(99.9)=41.11µs
     http_req_connecting............: avg=671ns   min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=45.92ms min=19.17ms med=45.33ms max=344.18ms p(90)=55.91ms  p(95)=59.31ms  p(99.9)=77.86ms
       { expected_response:true }...: avg=45.92ms min=19.17ms med=45.33ms max=344.18ms p(90)=55.91ms  p(95)=59.31ms  p(99.9)=77.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130039
     http_req_receiving.............: avg=91.59µs min=29.98µs med=71.09µs max=124.88ms p(90)=118.14µs p(95)=144.96µs p(99.9)=1.56ms 
     http_req_sending...............: avg=26.47µs min=5.26µs  med=11.26µs max=96.73ms  p(90)=18.89µs  p(95)=23.52µs  p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45.8ms  min=19ms    med=45.22ms max=336.95ms p(90)=55.78ms  p(95)=59.19ms  p(99.9)=77.2ms 
     http_reqs......................: 130039  1065.56316/s
     iteration_duration.............: avg=46.17ms min=21.39ms med=45.54ms max=355.32ms p(90)=56.12ms  p(95)=59.53ms  p(99.9)=78.25ms
     iterations.....................: 129939  1064.743742/s
     success_rate...................: 100.00% ✓ 129939      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 196689     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 79 MB   644 kB/s
     http_req_blocked...............: avg=4.18µs  min=1.13µs  med=3.23µs  max=2.18ms   p(90)=4.91µs   p(95)=5.6µs    p(99.9)=49.16µs 
     http_req_connecting............: avg=690ns   min=0s      med=0s      max=2.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.16ms min=19.2ms  med=89.59ms max=361.98ms p(90)=106.12ms p(95)=113.77ms p(99.9)=220.28ms
       { expected_response:true }...: avg=91.16ms min=19.2ms  med=89.59ms max=361.98ms p(90)=106.12ms p(95)=113.77ms p(99.9)=220.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65663
     http_req_receiving.............: avg=90.72µs min=31.33µs med=80.69µs max=57.56ms  p(90)=119.53µs p(95)=135.67µs p(99.9)=1.03ms  
     http_req_sending...............: avg=30.94µs min=5.88µs  med=14.33µs max=211.49ms p(90)=21.6µs   p(95)=24.14µs  p(99.9)=817.74µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.04ms min=19.05ms med=89.47ms max=361.54ms p(90)=105.99ms p(95)=113.59ms p(99.9)=220.1ms 
     http_reqs......................: 65663   536.423031/s
     iteration_duration.............: avg=91.53ms min=38.04ms med=89.84ms max=376.18ms p(90)=106.36ms p(95)=114.06ms p(99.9)=222.88ms
     iterations.....................: 65563   535.606097/s
     success_rate...................: 100.00% ✓ 65563      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 149652     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   490 kB/s
     http_req_blocked...............: avg=4.33µs   min=1.2µs   med=3.37µs   max=1.85ms   p(90)=5.02µs   p(95)=5.65µs   p(99.9)=129µs   
     http_req_connecting............: avg=728ns    min=0s      med=0s       max=1.83ms   p(90)=0s       p(95)=0s       p(99.9)=59.89µs 
     http_req_duration..............: avg=119.83ms min=19.16ms med=118.18ms max=387.93ms p(90)=148.81ms p(95)=158.2ms  p(99.9)=202.06ms
       { expected_response:true }...: avg=119.83ms min=19.16ms med=118.18ms max=387.93ms p(90)=148.81ms p(95)=158.2ms  p(99.9)=202.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49984
     http_req_receiving.............: avg=174.14µs min=31.26µs med=84.75µs  max=252.19ms p(90)=118.86µs p(95)=132.28µs p(99.9)=1.05ms  
     http_req_sending...............: avg=30.04µs  min=5.55µs  med=16.55µs  max=197.12ms p(90)=22.73µs  p(95)=24.92µs  p(99.9)=631.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.63ms min=19.02ms med=118.07ms max=217.84ms p(90)=148.59ms p(95)=157.92ms p(99.9)=195.67ms
     http_reqs......................: 49984   408.235653/s
     iteration_duration.............: avg=120.3ms  min=36.12ms med=118.49ms max=396.11ms p(90)=149.1ms  p(95)=158.49ms p(99.9)=204.78ms
     iterations.....................: 49884   407.41892/s
     success_rate...................: 100.00% ✓ 49884      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 87132      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.58µs   min=1.3µs   med=3.57µs   max=4.52ms   p(90)=5.13µs   p(95)=5.78µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.68µs   min=0s      med=0s       max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=205.75ms min=20.62ms med=204.69ms max=444.55ms p(90)=220.07ms p(95)=225.34ms p(99.9)=305.54ms
       { expected_response:true }...: avg=205.75ms min=20.62ms med=204.69ms max=444.55ms p(90)=220.07ms p(95)=225.34ms p(99.9)=305.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29144
     http_req_receiving.............: avg=105.66µs min=33.2µs  med=94.48µs  max=99.45ms  p(90)=128.74µs p(95)=142.19µs p(99.9)=751.79µs
     http_req_sending...............: avg=30.26µs  min=6.18µs  med=17.7µs   max=87.33ms  p(90)=23.22µs  p(95)=25.26µs  p(99.9)=633.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.62ms min=20.49ms med=204.57ms max=444.38ms p(90)=219.96ms p(95)=225.23ms p(99.9)=305.15ms
     http_reqs......................: 29144   237.222738/s
     iteration_duration.............: avg=206.7ms  min=46.05ms med=205.01ms max=462.47ms p(90)=220.35ms p(95)=225.65ms p(99.9)=333.29ms
     iterations.....................: 29044   236.40877/s
     success_rate...................: 100.00% ✓ 29044      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 86637      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.58µs   min=1.23µs  med=3.75µs   max=4.29ms   p(90)=5.35µs   p(95)=6.01µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=206.91ms min=18.69ms med=192.19ms max=725.15ms p(90)=243.58ms p(95)=279.59ms p(99.9)=627.98ms
       { expected_response:true }...: avg=206.91ms min=18.69ms med=192.19ms max=725.15ms p(90)=243.58ms p(95)=279.59ms p(99.9)=627.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28979
     http_req_receiving.............: avg=105.31µs min=36.8µs  med=99.55µs  max=22.32ms  p(90)=133.86µs p(95)=148µs    p(99.9)=629.94µs
     http_req_sending...............: avg=55.33µs  min=5.92µs  med=18.76µs  max=188.99ms p(90)=24.21µs  p(95)=26.22µs  p(99.9)=559.88µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.75ms min=18.56ms med=192.02ms max=725.05ms p(90)=243.4ms  p(95)=279.33ms p(99.9)=627.89ms
     http_reqs......................: 28979   237.071092/s
     iteration_duration.............: avg=207.89ms min=47.13ms med=192.62ms max=725.4ms  p(90)=243.98ms p(95)=282.08ms p(99.9)=628.3ms 
     iterations.....................: 28879   236.253013/s
     success_rate...................: 100.00% ✓ 28879      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

