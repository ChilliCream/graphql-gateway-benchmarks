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
| hive-router | v0.0.49 | 2,877 | 3,030 | 2,816 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,201 | 2,261 | 2,186 | 1.2% |  |
| grafbase | 0.53.3 | 2,037 | 2,100 | 2,022 | 1.3% |  |
| cosmo | 0.307.0 | 1,238 | 1,259 | 1,221 | 1.2% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 534 | 545 | 529 | 1.0% |  |
| apollo-router | v2.13.1 | 399 | 411 | 393 | 1.6% |  |
| hive-gateway | 2.5.25 | 256 | 261 | 254 | 1.0% |  |
| apollo-gateway | 2.13.3 | 240 | 243 | 238 | 0.8% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,480 | 2,604 | 2,456 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,979 | 2,032 | 1,953 | 1.2% |  |
| grafbase | 0.53.3 | 1,551 | 1,569 | 1,517 | 1.2% |  |
| cosmo | 0.307.0 | 1,206 | 1,227 | 1,199 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 506 | 523 | 503 | 1.5% |  |
| apollo-router | v2.13.1 | 372 | 383 | 367 | 1.5% |  |
| hive-gateway | 2.5.25 | 243 | 249 | 240 | 1.5% |  |
| apollo-gateway | 2.13.3 | 232 | 235 | 230 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1037445     ✗ 0     
     data_received..................: 30 GB   252 MB/s
     data_sent......................: 416 MB  3.5 MB/s
     http_req_blocked...............: avg=2.94µs   min=982ns   med=2.21µs  max=17.89ms  p(90)=3.42µs  p(95)=4.06µs   p(99.9)=32.1µs 
     http_req_connecting............: avg=315ns    min=0s      med=0s      max=4.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.11ms  min=1.67ms  med=16.26ms max=362.87ms p(90)=25.24ms p(95)=28.81ms  p(99.9)=50.65ms
       { expected_response:true }...: avg=17.11ms  min=1.67ms  med=16.26ms max=362.87ms p(90)=25.24ms p(95)=28.81ms  p(99.9)=50.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 345915
     http_req_receiving.............: avg=133.05µs min=27.39µs med=50.94µs max=272.63ms p(90)=98.59µs p(95)=265.85µs p(99.9)=11.52ms
     http_req_sending...............: avg=54.11µs  min=5.15µs  med=9.29µs  max=216.77ms p(90)=16.42µs p(95)=122.63µs p(99.9)=5.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.92ms  min=1.61ms  med=16.12ms max=90.47ms  p(90)=25.01ms p(95)=28.48ms  p(99.9)=49.43ms
     http_reqs......................: 345915  2877.676591/s
     iteration_duration.............: avg=17.34ms  min=2.13ms  med=16.47ms max=391.72ms p(90)=25.47ms p(95)=29.05ms  p(99.9)=51.67ms
     iterations.....................: 345815  2876.844688/s
     success_rate...................: 100.00% ✓ 345815      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 794133      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 318 MB  2.6 MB/s
     http_req_blocked...............: avg=2.71µs   min=981ns   med=2µs      max=15.62ms  p(90)=3.11µs  p(95)=3.69µs   p(99.9)=31.63µs 
     http_req_connecting............: avg=173ns    min=0s      med=0s       max=2.39ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.43ms  min=2.42ms  med=14.48ms  max=342.7ms  p(90)=49.51ms p(95)=68.02ms  p(99.9)=161.36ms
       { expected_response:true }...: avg=22.43ms  min=2.42ms  med=14.48ms  max=342.7ms  p(90)=49.51ms p(95)=68.02ms  p(99.9)=161.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 264811
     http_req_receiving.............: avg=642.03µs min=51.56µs med=102.28µs max=247.57ms p(90)=949.9µs p(95)=1.47ms   p(99.9)=58.81ms 
     http_req_sending...............: avg=43.9µs   min=5.28µs  med=8.93µs   max=187.29ms p(90)=15.01µs p(95)=109.42µs p(99.9)=3.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.74ms  min=2.34ms  med=13.98ms  max=316.85ms p(90)=48.17ms p(95)=66.72ms  p(99.9)=157.89ms
     http_reqs......................: 264811  2201.337659/s
     iteration_duration.............: avg=22.65ms  min=3.33ms  med=14.7ms   max=351.98ms p(90)=49.74ms p(95)=68.25ms  p(99.9)=162.23ms
     iterations.....................: 264711  2200.506373/s
     success_rate...................: 100.00% ✓ 264711      ✗ 0     
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

     checks.........................: 100.00% ✓ 734544      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=3.12µs   min=1µs     med=2.15µs  max=7.3ms    p(90)=3.53µs   p(95)=4.28µs   p(99.9)=40.67µs
     http_req_connecting............: avg=458ns    min=0s      med=0s      max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.26ms  min=1.92ms  med=24.01ms max=346.79ms p(90)=29.13ms  p(95)=31.39ms  p(99.9)=54.01ms
       { expected_response:true }...: avg=24.26ms  min=1.92ms  med=24.01ms max=346.79ms p(90)=29.13ms  p(95)=31.39ms  p(99.9)=54.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244948
     http_req_receiving.............: avg=109.66µs min=29.64µs med=57.96µs max=159.32ms p(90)=100.03µs p(95)=185.4µs  p(99.9)=9.42ms 
     http_req_sending...............: avg=48.11µs  min=5.06µs  med=9.65µs  max=156.84ms p(90)=16.62µs  p(95)=112.09µs p(99.9)=4.16ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.1ms   min=1.85ms  med=23.89ms max=346.46ms p(90)=28.96ms  p(95)=31.13ms  p(99.9)=53.09ms
     http_reqs......................: 244948  2037.028601/s
     iteration_duration.............: avg=24.49ms  min=3.81ms  med=24.21ms max=363.62ms p(90)=29.35ms  p(95)=31.63ms  p(99.9)=54.4ms 
     iterations.....................: 244848  2036.196985/s
     success_rate...................: 100.00% ✓ 244848      ✗ 0     
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

     checks.........................: 100.00% ✓ 446661      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.23µs  min=1µs     med=2.21µs  max=4.14ms   p(90)=3.4µs   p(95)=3.97µs   p(99.9)=33.14µs
     http_req_connecting............: avg=709ns   min=0s      med=0s      max=4.12ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.05ms min=2.13ms  med=39.47ms max=319.64ms p(90)=56.66ms p(95)=61.87ms  p(99.9)=87.46ms
       { expected_response:true }...: avg=40.05ms min=2.13ms  med=39.47ms max=319.64ms p(90)=56.66ms p(95)=61.87ms  p(99.9)=87.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148987
     http_req_receiving.............: avg=77.44µs min=29.77µs med=58.28µs max=79.08ms  p(90)=91.49µs p(95)=107.83µs p(99.9)=1.85ms 
     http_req_sending...............: avg=28.42µs min=5.37µs  med=10.1µs  max=250.72ms p(90)=14.95µs p(95)=18.74µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.95ms min=2.03ms  med=39.37ms max=318.88ms p(90)=56.55ms p(95)=61.74ms  p(99.9)=86.77ms
     http_reqs......................: 148987  1238.820559/s
     iteration_duration.............: avg=40.29ms min=3.95ms  med=39.67ms max=344.7ms  p(90)=56.86ms p(95)=62.07ms  p(99.9)=88.12ms
     iterations.....................: 148887  1237.989063/s
     success_rate...................: 100.00% ✓ 148887      ✗ 0     
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

     checks.........................: 100.00% ✓ 193233     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   643 kB/s
     http_req_blocked...............: avg=4.94µs  min=1.12µs  med=2.74µs  max=5.45ms   p(90)=4.25µs   p(95)=4.86µs   p(99.9)=45.51µs 
     http_req_connecting............: avg=1.9µs   min=0s      med=0s      max=5.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.79ms min=4.16ms  med=90.21ms max=357ms    p(90)=112.02ms p(95)=123.69ms p(99.9)=216.55ms
       { expected_response:true }...: avg=92.79ms min=4.16ms  med=90.21ms max=357ms    p(90)=112.02ms p(95)=123.69ms p(99.9)=216.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64511
     http_req_receiving.............: avg=86.33µs min=31.1µs  med=75.95µs max=76.43ms  p(90)=111.15µs p(95)=124.31µs p(99.9)=994.22µs
     http_req_sending...............: avg=24.1µs  min=5.72µs  med=13.04µs max=146ms    p(90)=19.58µs  p(95)=21.8µs   p(99.9)=723.61µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.68ms min=4.03ms  med=90.1ms  max=356.68ms p(90)=111.9ms  p(95)=123.56ms p(99.9)=216.45ms
     http_reqs......................: 64511   534.96926/s
     iteration_duration.............: avg=93.17ms min=27.45ms med=90.45ms max=376.11ms p(90)=112.26ms p(95)=124ms    p(99.9)=218.17ms
     iterations.....................: 64411   534.139991/s
     success_rate...................: 100.00% ✓ 64411      ✗ 0    
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

     checks.........................: 100.00% ✓ 144216     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   479 kB/s
     http_req_blocked...............: avg=5.41µs   min=1.18µs  med=3.02µs   max=4.06ms   p(90)=4.38µs   p(95)=4.89µs   p(99.9)=224.68µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=165.84µs
     http_req_duration..............: avg=124.35ms min=5.57ms  med=124.13ms max=365.6ms  p(90)=150.41ms p(95)=158.37ms p(99.9)=195.09ms
       { expected_response:true }...: avg=124.35ms min=5.57ms  med=124.13ms max=365.6ms  p(90)=150.41ms p(95)=158.37ms p(99.9)=195.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48172
     http_req_receiving.............: avg=92.34µs  min=30.09µs med=80.15µs  max=109.06ms p(90)=111.96µs p(95)=123.77µs p(99.9)=851.48µs
     http_req_sending...............: avg=25.03µs  min=5.62µs  med=14.43µs  max=126.73ms p(90)=20.19µs  p(95)=22µs     p(99.9)=641.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.24ms min=5.43ms  med=124.02ms max=364.92ms p(90)=150.31ms p(95)=158.24ms p(99.9)=194.64ms
     http_reqs......................: 48172   399.040177/s
     iteration_duration.............: avg=124.86ms min=26.02ms med=124.42ms max=380.43ms p(90)=150.66ms p(95)=158.63ms p(99.9)=197ms   
     iterations.....................: 48072   398.211812/s
     success_rate...................: 100.00% ✓ 48072      ✗ 0    
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

     checks.........................: 100.00% ✓ 92583      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   308 kB/s
     http_req_blocked...............: avg=7.08µs   min=1.25µs  med=3.44µs   max=4.54ms   p(90)=4.93µs   p(95)=5.55µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=193.59ms min=6.05ms  med=178.17ms max=658.9ms  p(90)=234.71ms p(95)=325.8ms  p(99.9)=570.74ms
       { expected_response:true }...: avg=193.59ms min=6.05ms  med=178.17ms max=658.9ms  p(90)=234.71ms p(95)=325.8ms  p(99.9)=570.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30961
     http_req_receiving.............: avg=104.85µs min=36.49µs med=97.03µs  max=49.84ms  p(90)=129.79µs p(95)=142.87µs p(99.9)=593.28µs
     http_req_sending...............: avg=30.32µs  min=5.97µs  med=17.91µs  max=58.02ms  p(90)=22.96µs  p(95)=24.77µs  p(99.9)=669.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.46ms min=5.94ms  med=178.04ms max=658.82ms p(90)=234.56ms p(95)=325.7ms  p(99.9)=570.6ms 
     http_reqs......................: 30961   256.161619/s
     iteration_duration.............: avg=194.53ms min=32.38ms med=178.59ms max=659.09ms p(90)=235.27ms p(95)=339.89ms p(99.9)=571.03ms
     iterations.....................: 30861   255.33425/s
     success_rate...................: 100.00% ✓ 30861      ✗ 0    
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

     checks.........................: 100.00% ✓ 87048      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=7.7µs    min=1.22µs  med=3.1µs    max=5.17ms   p(90)=4.35µs   p(95)=4.85µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=4.41µs   min=0s      med=0s       max=5.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=205.94ms min=8.48ms  med=204.56ms max=446.27ms p(90)=220.61ms p(95)=233.51ms p(99.9)=294.02ms
       { expected_response:true }...: avg=205.94ms min=8.48ms  med=204.56ms max=446.27ms p(90)=220.61ms p(95)=233.51ms p(99.9)=294.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29116
     http_req_receiving.............: avg=95.76µs  min=35.36µs med=88.95µs  max=49.01ms  p(90)=119.89µs p(95)=132.37µs p(99.9)=585.91µs
     http_req_sending...............: avg=36.08µs  min=6.33µs  med=15.77µs  max=90.83ms  p(90)=20.49µs  p(95)=22.22µs  p(99.9)=479.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.81ms min=8.39ms  med=204.45ms max=446.06ms p(90)=220.49ms p(95)=233.41ms p(99.9)=293.22ms
     http_reqs......................: 29116   240.431882/s
     iteration_duration.............: avg=206.92ms min=53.48ms med=204.86ms max=458.55ms p(90)=220.9ms  p(95)=234.03ms p(99.9)=310.44ms
     iterations.....................: 29016   239.60611/s
     success_rate...................: 100.00% ✓ 29016      ✗ 0    
     vus............................: 43      min=43       max=50 
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

     checks.........................: 100.00% ✓ 894264      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=3.26µs   min=1µs     med=2.27µs  max=19.13ms  p(90)=3.83µs   p(95)=4.67µs   p(99.9)=39.55µs
     http_req_connecting............: avg=308ns    min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.88ms  min=1.8ms   med=19.25ms max=336.28ms p(90)=27.67ms  p(95)=31.02ms  p(99.9)=53.59ms
       { expected_response:true }...: avg=19.88ms  min=1.8ms   med=19.25ms max=336.28ms p(90)=27.67ms  p(95)=31.02ms  p(99.9)=53.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298188
     http_req_receiving.............: avg=124.52µs min=28.46µs med=53.3µs  max=182.06ms p(90)=106.19µs p(95)=268.49µs p(99.9)=11.03ms
     http_req_sending...............: avg=53.82µs  min=5.23µs  med=9.67µs  max=93.73ms  p(90)=18.33µs  p(95)=124.91µs p(99.9)=6.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.7ms   min=1.73ms  med=19.11ms max=335.48ms p(90)=27.44ms  p(95)=30.68ms  p(99.9)=52.37ms
     http_reqs......................: 298188  2480.038975/s
     iteration_duration.............: avg=20.11ms  min=2.74ms  med=19.47ms max=354.19ms p(90)=27.89ms  p(95)=31.27ms  p(99.9)=54.04ms
     iterations.....................: 298088  2479.207272/s
     success_rate...................: 100.00% ✓ 298088      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 713628      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 286 MB  2.4 MB/s
     http_req_blocked...............: avg=6.08µs   min=972ns  med=2.41µs   max=34.27ms  p(90)=3.87µs  p(95)=4.61µs  p(99.9)=37.41µs 
     http_req_connecting............: avg=3.17µs   min=0s     med=0s       max=34.25ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=24.97ms  min=1.95ms med=17.22ms  max=600.03ms p(90)=52.51ms p(95)=69.35ms p(99.9)=183.53ms
       { expected_response:true }...: avg=24.97ms  min=1.95ms med=17.22ms  max=600.03ms p(90)=52.51ms p(95)=69.35ms p(99.9)=183.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237976
     http_req_receiving.............: avg=697.72µs min=51.6µs med=109.44µs max=156.64ms p(90)=1.13ms  p(95)=1.81ms  p(99.9)=60.74ms 
     http_req_sending...............: avg=45.59µs  min=5.46µs med=10.19µs  max=133.34ms p(90)=18.53µs p(95)=111µs   p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.23ms  min=1.78ms med=16.65ms  max=599.94ms p(90)=51.21ms p(95)=67.86ms p(99.9)=180.27ms
     http_reqs......................: 237976  1979.118842/s
     iteration_duration.............: avg=25.21ms  min=2.67ms med=17.45ms  max=600.23ms p(90)=52.74ms p(95)=69.58ms p(99.9)=186.14ms
     iterations.....................: 237876  1978.287196/s
     success_rate...................: 100.00% ✓ 237876      ✗ 0     
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

     checks.........................: 100.00% ✓ 559581      ✗ 0     
     data_received..................: 16 GB   136 MB/s
     data_sent......................: 224 MB  1.9 MB/s
     http_req_blocked...............: avg=3.46µs   min=992ns   med=2.31µs  max=4.1ms    p(90)=4.57µs   p(95)=5.72µs   p(99.9)=43.26µs
     http_req_connecting............: avg=549ns    min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.89ms  min=2.26ms  med=30.95ms max=355.89ms p(90)=42.45ms  p(95)=47.22ms  p(99.9)=88.72ms
       { expected_response:true }...: avg=31.89ms  min=2.26ms  med=30.95ms max=355.89ms p(90)=42.45ms  p(95)=47.22ms  p(99.9)=88.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 186627
     http_req_receiving.............: avg=112.64µs min=30.94µs med=60.77µs max=203.41ms p(90)=132.23µs p(95)=279.66µs p(99.9)=5.45ms 
     http_req_sending...............: avg=46.61µs  min=5.49µs  med=10.3µs  max=212.25ms p(90)=24.07µs  p(95)=133.16µs p(99.9)=3.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.73ms  min=2.19ms  med=30.82ms max=338.42ms p(90)=42.27ms  p(95)=46.97ms  p(99.9)=88.28ms
     http_reqs......................: 186627  1551.388398/s
     iteration_duration.............: avg=32.15ms  min=4.36ms  med=31.18ms max=364.71ms p(90)=42.69ms  p(95)=47.47ms  p(99.9)=89.41ms
     iterations.....................: 186527  1550.557121/s
     success_rate...................: 100.00% ✓ 186527      ✗ 0     
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

     checks.........................: 100.00% ✓ 435093      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.15µs  min=1µs     med=2.31µs  max=3.46ms   p(90)=3.92µs   p(95)=4.6µs    p(99.9)=33.86µs
     http_req_connecting............: avg=481ns   min=0s      med=0s      max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.11ms min=2.3ms   med=40.61ms max=333.25ms p(90)=57.71ms  p(95)=63.01ms  p(99.9)=87.97ms
       { expected_response:true }...: avg=41.11ms min=2.3ms   med=40.61ms max=333.25ms p(90)=57.71ms  p(95)=63.01ms  p(99.9)=87.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145131
     http_req_receiving.............: avg=84.9µs  min=28.57µs med=64.79µs max=216.42ms p(90)=104.03µs p(95)=123.25µs p(99.9)=1.62ms 
     http_req_sending...............: avg=29.41µs min=5.1µs   med=11.17µs max=193.81ms p(90)=17.81µs  p(95)=21.39µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41ms    min=2.17ms  med=40.51ms max=317.88ms p(90)=57.6ms   p(95)=62.89ms  p(99.9)=87.21ms
     http_reqs......................: 145131  1206.55554/s
     iteration_duration.............: avg=41.36ms min=4ms     med=40.82ms max=339.81ms p(90)=57.92ms  p(95)=63.22ms  p(99.9)=89.19ms
     iterations.....................: 145031  1205.724184/s
     success_rate...................: 100.00% ✓ 145031      ✗ 0     
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

     checks.........................: 100.00% ✓ 182871     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   608 kB/s
     http_req_blocked...............: avg=4.96µs  min=1.2µs   med=3.02µs  max=3.97ms   p(90)=4.51µs   p(95)=5.08µs   p(99.9)=47.52µs 
     http_req_connecting............: avg=1.67µs  min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.04ms min=4.36ms  med=94.23ms max=373.45ms p(90)=119.85ms p(95)=134.9ms  p(99.9)=230.85ms
       { expected_response:true }...: avg=98.04ms min=4.36ms  med=94.23ms max=373.45ms p(90)=119.85ms p(95)=134.9ms  p(99.9)=230.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61057
     http_req_receiving.............: avg=88.57µs min=32.95µs med=81.39µs max=19.44ms  p(90)=115.16µs p(95)=127.96µs p(99.9)=829.95µs
     http_req_sending...............: avg=20.61µs min=6.03µs  med=14.06µs max=48.23ms  p(90)=20.36µs  p(95)=22.4µs   p(99.9)=645.63µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.93ms min=4.21ms  med=94.12ms max=362.74ms p(90)=119.73ms p(95)=134.79ms p(99.9)=230.79ms
     http_reqs......................: 61057   506.232952/s
     iteration_duration.............: avg=98.45ms min=29.17ms med=94.49ms max=386.95ms p(90)=120.11ms p(95)=135.33ms p(99.9)=233.78ms
     iterations.....................: 60957   505.403836/s
     success_rate...................: 100.00% ✓ 60957      ✗ 0    
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

     checks.........................: 100.00% ✓ 134676     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   447 kB/s
     http_req_blocked...............: avg=7.37µs   min=1.22µs  med=3.3µs    max=8.13ms   p(90)=4.75µs   p(95)=5.29µs   p(99.9)=584.92µs
     http_req_connecting............: avg=3.7µs    min=0s      med=0s       max=7.97ms   p(90)=0s       p(95)=0s       p(99.9)=543.24µs
     http_req_duration..............: avg=133.13ms min=6.03ms  med=130.82ms max=311.6ms  p(90)=176.83ms p(95)=190.27ms p(99.9)=240.4ms 
       { expected_response:true }...: avg=133.13ms min=6.03ms  med=130.82ms max=311.6ms  p(90)=176.83ms p(95)=190.27ms p(99.9)=240.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 44992
     http_req_receiving.............: avg=105.31µs min=31.69µs med=87.22µs  max=125.59ms p(90)=118.96µs p(95)=131.48µs p(99.9)=892.31µs
     http_req_sending...............: avg=22.23µs  min=5.79µs  med=16.64µs  max=19.47ms  p(90)=21.83µs  p(95)=23.69µs  p(99.9)=816.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.01ms min=5.89ms  med=130.7ms  max=310.13ms p(90)=176.71ms p(95)=190.12ms p(99.9)=240.1ms 
     http_reqs......................: 44992   372.576422/s
     iteration_duration.............: avg=133.69ms min=21.36ms med=131.17ms max=331.65ms p(90)=177.13ms p(95)=190.56ms p(99.9)=242.41ms
     iterations.....................: 44892   371.748328/s
     success_rate...................: 100.00% ✓ 44892      ✗ 0    
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

     checks.........................: 100.00% ✓ 87978      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.26µs  med=3.45µs   max=4.63ms   p(90)=4.87µs   p(95)=5.46µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=203.78ms min=6.47ms  med=190.86ms max=619.63ms p(90)=253.29ms p(95)=406.45ms p(99.9)=533.56ms
       { expected_response:true }...: avg=203.78ms min=6.47ms  med=190.86ms max=619.63ms p(90)=253.29ms p(95)=406.45ms p(99.9)=533.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29426
     http_req_receiving.............: avg=196.53µs min=35.79µs med=96.82µs  max=189.21ms p(90)=128µs    p(95)=141.06µs p(99.9)=1.33ms  
     http_req_sending...............: avg=43.27µs  min=6.11µs  med=17.98µs  max=231.54ms p(90)=22.65µs  p(95)=24.37µs  p(99.9)=567.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.54ms min=6.32ms  med=190.72ms max=619.53ms p(90)=252.85ms p(95)=406.35ms p(99.9)=533.45ms
     http_reqs......................: 29426   243.110194/s
     iteration_duration.............: avg=204.74ms min=22.52ms med=191.31ms max=619.81ms p(90)=253.72ms p(95)=406.89ms p(99.9)=533.92ms
     iterations.....................: 29326   242.28402/s
     success_rate...................: 100.00% ✓ 29326      ✗ 0    
     vus............................: 22      min=22       max=50 
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

     checks.........................: 100.00% ✓ 84321      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=6.79µs   min=1.22µs  med=3.25µs   max=3.98ms   p(90)=4.51µs   p(95)=5.02µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=212.55ms min=8.64ms  med=211.58ms max=451.16ms p(90)=227.06ms p(95)=238.31ms p(99.9)=304.64ms
       { expected_response:true }...: avg=212.55ms min=8.64ms  med=211.58ms max=451.16ms p(90)=227.06ms p(95)=238.31ms p(99.9)=304.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28207
     http_req_receiving.............: avg=108.41µs min=33.01µs med=91.88µs  max=176.19ms p(90)=123.48µs p(95)=135.41µs p(99.9)=638.73µs
     http_req_sending...............: avg=46.69µs  min=5.69µs  med=17.02µs  max=227.66ms p(90)=21.53µs  p(95)=23.31µs  p(99.9)=948.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=212.4ms  min=8.51ms  med=211.45ms max=450.17ms p(90)=226.93ms p(95)=238.12ms p(99.9)=304.41ms
     http_reqs......................: 28207   232.919108/s
     iteration_duration.............: avg=213.6ms  min=58.57ms med=211.94ms max=461.27ms p(90)=227.36ms p(95)=238.76ms p(99.9)=316.12ms
     iterations.....................: 28107   232.093359/s
     success_rate...................: 100.00% ✓ 28107      ✗ 0    
     vus............................: 45      min=45       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

