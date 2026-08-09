## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,737 | 2,915 | 2,708 | 2.4% |  |
| fusion | 16.6.0 | 2,445 | 2,570 | 2,426 | 2.0% |  |
| cosmo | 0.334.0 | 1,225 | 1,262 | 1,221 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 564 | 576 | 562 | 0.8% |  |
| hive-gateway | 2.10.8 | 260 | 266 | 258 | 1.0% |  |
| apollo-gateway | 2.14.3 | 235 | 241 | 233 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (11911 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (509792 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.0 | 2,389 | 2,488 | 2,375 | 1.6% |  |
| hive-router | v0.0.84 | 2,376 | 2,506 | 2,357 | 2.1% |  |
| cosmo | 0.334.0 | 1,169 | 1,209 | 1,160 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 536 | 551 | 532 | 1.2% |  |
| hive-gateway | 2.10.8 | 240 | 247 | 239 | 1.3% |  |
| apollo-gateway | 2.14.3 | 238 | 242 | 237 | 0.6% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (43818 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (382074 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 504051      ✗ 0     
     data_received..................: 15 GB   240 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=20.26µs min=931ns   med=2.67µs  max=53.27ms  p(90)=4.27µs   p(95)=5.36µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=16.63µs min=0s      med=0s      max=53.2ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=84.08ms min=1.43ms  med=78.63ms max=262.65ms p(90)=163.5ms  p(95)=177.3ms  p(99.9)=229.9ms 
       { expected_response:true }...: avg=84.08ms min=1.43ms  med=78.63ms max=262.65ms p(90)=163.5ms  p(95)=177.3ms  p(99.9)=229.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 169017
     http_req_receiving.............: avg=148.4µs min=25.76µs med=51.6µs  max=134.64ms p(90)=143.09µs p(95)=347.38µs p(99.9)=18.61ms 
     http_req_sending...............: avg=67.17µs min=4.8µs   med=9.96µs  max=38.39ms  p(90)=18.17µs  p(95)=123.5µs  p(99.9)=9.26ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.86ms min=1.38ms  med=78.39ms max=256.93ms p(90)=163.25ms p(95)=176.99ms p(99.9)=228.08ms
     http_reqs......................: 169017  2737.453613/s
     iteration_duration.............: avg=84.84ms min=2.44ms  med=79.47ms max=369.27ms p(90)=163.92ms p(95)=177.78ms p(99.9)=230.59ms
     iterations.....................: 168017  2721.257292/s
     success_rate...................: 100.00% ✓ 168017      ✗ 0     
     vus............................: 90      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453756      ✗ 0     
     data_received..................: 13 GB   214 MB/s
     data_sent......................: 183 MB  2.9 MB/s
     http_req_blocked...............: avg=13.64µs min=902ns   med=2.11µs  max=72.84ms  p(90)=3.37µs   p(95)=4.32µs   p(99.9)=808.76µs
     http_req_connecting............: avg=10.97µs min=0s      med=0s      max=72.68ms  p(90)=0s       p(95)=0s       p(99.9)=759.79µs
     http_req_duration..............: avg=93.45ms min=1.93ms  med=82.52ms max=1.18s    p(90)=175.74ms p(95)=200.52ms p(99.9)=678.72ms
       { expected_response:true }...: avg=93.45ms min=1.93ms  med=82.52ms max=1.18s    p(90)=175.74ms p(95)=200.52ms p(99.9)=678.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152252
     http_req_receiving.............: avg=1.26ms  min=51.14µs med=99.28µs max=870.85ms p(90)=1.73ms   p(95)=4.32ms   p(99.9)=75ms    
     http_req_sending...............: avg=56.44µs min=4.54µs  med=8.84µs  max=124.98ms p(90)=15.86µs  p(95)=96.86µs  p(99.9)=7.65ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.13ms min=1.85ms  med=81.52ms max=1.18s    p(90)=174.2ms  p(95)=198.19ms p(99.9)=675.88ms
     http_reqs......................: 152252  2445.680011/s
     iteration_duration.............: avg=94.3ms  min=3.42ms  med=83.52ms max=1.18s    p(90)=176.22ms p(95)=201.15ms p(99.9)=679.2ms 
     iterations.....................: 151252  2429.616642/s
     success_rate...................: 100.00% ✓ 151252      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 226707      ✗ 0    
     data_received..................: 6.7 GB  108 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=11.78µs  min=1.05µs  med=2.7µs    max=220ms    p(90)=4.39µs   p(95)=5.32µs   p(99.9)=534.33µs
     http_req_connecting............: avg=5.5µs    min=0s      med=0s       max=14.44ms  p(90)=0s       p(95)=0s       p(99.9)=402.81µs
     http_req_duration..............: avg=186.32ms min=1.83ms  med=187.66ms max=558.63ms p(90)=341.72ms p(95)=366.14ms p(99.9)=472.61ms
       { expected_response:true }...: avg=186.32ms min=1.83ms  med=187.66ms max=558.63ms p(90)=341.72ms p(95)=366.14ms p(99.9)=472.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76569
     http_req_receiving.............: avg=75.77µs  min=27.05µs med=59.79µs  max=219.37ms p(90)=96.9µs   p(95)=112.01µs p(99.9)=1.19ms  
     http_req_sending...............: avg=32.6µs   min=5.23µs  med=11.31µs  max=156.34ms p(90)=18.14µs  p(95)=22.03µs  p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.21ms min=1.78ms  med=187.57ms max=558.56ms p(90)=341.59ms p(95)=366ms    p(99.9)=472.53ms
     http_reqs......................: 76569   1225.74666/s
     iteration_duration.............: avg=189.02ms min=4.27ms  med=190.49ms max=558.79ms p(90)=342.64ms p(95)=366.86ms p(99.9)=472.84ms
     iterations.....................: 75569   1209.738267/s
     success_rate...................: 100.00% ✓ 75569       ✗ 0    
     vus............................: 78      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 105762     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   678 kB/s
     http_req_blocked...............: avg=7.29µs   min=1.28µs  med=2.83µs   max=15.98ms  p(90)=4.46µs   p(95)=5.42µs   p(99.9)=630.32µs
     http_req_connecting............: avg=3.33µs   min=0s      med=0s       max=15.91ms  p(90)=0s       p(95)=0s       p(99.9)=580.87µs
     http_req_duration..............: avg=395.55ms min=3.53ms  med=367.25ms max=1.67s    p(90)=780.51ms p(95)=842.21ms p(99.9)=1.28s   
       { expected_response:true }...: avg=395.55ms min=3.53ms  med=367.25ms max=1.67s    p(90)=780.51ms p(95)=842.21ms p(99.9)=1.28s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36254
     http_req_receiving.............: avg=79.14µs  min=32.3µs  med=68.61µs  max=14.19ms  p(90)=105.62µs p(95)=120.58µs p(99.9)=900.49µs
     http_req_sending...............: avg=32.92µs  min=5.49µs  med=12.84µs  max=146.86ms p(90)=19.26µs  p(95)=22.23µs  p(99.9)=2.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=395.43ms min=3.48ms  med=367.15ms max=1.67s    p(90)=780.41ms p(95)=842.1ms  p(99.9)=1.28s   
     http_reqs......................: 36254   564.51009/s
     iteration_duration.............: avg=407.01ms min=23.94ms med=380.66ms max=1.67s    p(90)=783.71ms p(95)=844.7ms  p(99.9)=1.28s   
     iterations.....................: 35254   548.939116/s
     success_rate...................: 100.00% ✓ 35254      ✗ 0    
     vus............................: 66      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 49203      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   313 kB/s
     http_req_blocked...............: avg=13.63µs  min=1.19µs  med=3.42µs   max=11.66ms p(90)=5.22µs   p(95)=6.56µs   p(99.9)=2.04ms
     http_req_connecting............: avg=8.66µs   min=0s      med=0s       max=11.6ms  p(90)=0s       p(95)=0s       p(99.9)=2.02ms
     http_req_duration..............: avg=818.88ms min=5.44ms  med=717.37ms max=19.16s  p(90)=1.45s    p(95)=1.6s     p(99.9)=17.81s
       { expected_response:true }...: avg=818.88ms min=5.44ms  med=717.37ms max=19.16s  p(90)=1.45s    p(95)=1.6s     p(99.9)=17.81s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17401
     http_req_receiving.............: avg=100.71µs min=32.59µs med=92.52µs  max=9.67ms  p(90)=130.61µs p(95)=146.02µs p(99.9)=1.68ms
     http_req_sending...............: avg=52.46µs  min=5.91µs  med=18.02µs  max=158.8ms p(90)=23.29µs  p(95)=27.56µs  p(99.9)=2.52ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=818.73ms min=5.36ms  med=717.26ms max=19.16s  p(90)=1.45s    p(95)=1.6s     p(99.9)=17.81s
     http_reqs......................: 17401   260.210356/s
     iteration_duration.............: avg=868.96ms min=23.56ms med=776.58ms max=19.16s  p(90)=1.47s    p(95)=1.62s    p(99.9)=17.84s
     iterations.....................: 16401   245.256597/s
     success_rate...................: 100.00% ✓ 16401      ✗ 0    
     vus............................: 8       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48603      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   288 kB/s
     http_req_blocked...............: avg=14.8µs   min=1.11µs  med=3.16µs   max=10.52ms p(90)=4.82µs   p(95)=6.13µs   p(99.9)=2.23ms  
     http_req_connecting............: avg=9.97µs   min=0s      med=0s       max=10.46ms p(90)=0s       p(95)=0s       p(99.9)=2.21ms  
     http_req_duration..............: avg=374.01ms min=7.47ms  med=426.93ms max=1.09s   p(90)=632.43ms p(95)=668.17ms p(99.9)=928.62ms
       { expected_response:true }...: avg=374.01ms min=7.47ms  med=426.93ms max=1.09s   p(90)=632.43ms p(95)=668.17ms p(99.9)=928.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17201
     http_req_receiving.............: avg=96.87µs  min=31.74µs med=84.41µs  max=52.06ms p(90)=123.15µs p(95)=138.04µs p(99.9)=1.06ms  
     http_req_sending...............: avg=34.04µs  min=5.51µs  med=16.67µs  max=85.95ms p(90)=22µs     p(95)=26.58µs  p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=373.88ms min=7.33ms  med=426.76ms max=1.09s   p(90)=632.32ms p(95)=668.05ms p(99.9)=928.48ms
     http_reqs......................: 17201   235.430728/s
     iteration_duration.............: avg=397.1ms  min=8.55ms  med=441.25ms max=1.1s    p(90)=635.96ms p(95)=673.18ms p(99.9)=934.78ms
     iterations.....................: 16201   221.743691/s
     success_rate...................: 100.00% ✓ 16201      ✗ 0    
     vus............................: 54      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 440799      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=24.68µs min=932ns   med=2.94µs   max=80.74ms  p(90)=4.85µs   p(95)=6.11µs   p(99.9)=2.76ms  
     http_req_connecting............: avg=20.49µs min=0s      med=0s       max=78.26ms  p(90)=0s       p(95)=0s       p(99.9)=2.63ms  
     http_req_duration..............: avg=96.13ms min=1.51ms  med=81.71ms  max=1.43s    p(90)=185.01ms p(95)=217.16ms p(99.9)=660.89ms
       { expected_response:true }...: avg=96.13ms min=1.51ms  med=81.71ms  max=1.43s    p(90)=185.01ms p(95)=217.16ms p(99.9)=660.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147933
     http_req_receiving.............: avg=1.42ms  min=54.11µs med=107.18µs max=849.49ms p(90)=1.62ms   p(95)=4.19ms   p(99.9)=95.9ms  
     http_req_sending...............: avg=76.83µs min=4.83µs  med=10.66µs  max=101.38ms p(90)=21.25µs  p(95)=121.83µs p(99.9)=10.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.63ms min=1.43ms  med=80.3ms   max=1.43s    p(90)=183.07ms p(95)=213.3ms  p(99.9)=642.74ms
     http_reqs......................: 147933  2389.550515/s
     iteration_duration.............: avg=97.07ms min=3.13ms  med=82.86ms  max=1.43s    p(90)=185.65ms p(95)=217.94ms p(99.9)=661.47ms
     iterations.....................: 146933  2373.39759/s
     success_rate...................: 100.00% ✓ 146933      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 437820      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=16.4µs   min=842ns   med=2.44µs  max=53.45ms  p(90)=4.36µs   p(95)=5.57µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=13.25µs  min=0s      med=0s      max=53.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=96.8ms   min=1.47ms  med=91.56ms max=347.71ms p(90)=186.54ms p(95)=202.52ms p(99.9)=251.13ms
       { expected_response:true }...: avg=96.8ms   min=1.47ms  med=91.56ms max=347.71ms p(90)=186.54ms p(95)=202.52ms p(99.9)=251.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146940
     http_req_receiving.............: avg=125.59µs min=28.05µs med=56.17µs max=56.16ms  p(90)=126.36µs p(95)=335.78µs p(99.9)=11.08ms 
     http_req_sending...............: avg=64.52µs  min=4.91µs  med=10.66µs max=197.66ms p(90)=22.12µs  p(95)=119.51µs p(99.9)=8.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.61ms  min=1.43ms  med=91.36ms max=347.02ms p(90)=186.31ms p(95)=202.26ms p(99.9)=250.3ms 
     http_reqs......................: 146940  2376.14421/s
     iteration_duration.............: avg=97.7ms   min=3.06ms  med=92.59ms max=357.19ms p(90)=187.03ms p(95)=202.96ms p(99.9)=251.95ms
     iterations.....................: 145940  2359.973363/s
     success_rate...................: 100.00% ✓ 145940      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 216708      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.62µs   min=962ns  med=2.45µs   max=14.77ms  p(90)=4.29µs   p(95)=5.29µs   p(99.9)=477.21µs
     http_req_connecting............: avg=2.46µs   min=0s     med=0s       max=14.7ms   p(90)=0s       p(95)=0s       p(99.9)=398.57µs
     http_req_duration..............: avg=194.84ms min=1.99ms med=196.43ms max=546.06ms p(90)=360.52ms p(95)=386.91ms p(99.9)=482.42ms
       { expected_response:true }...: avg=194.84ms min=1.99ms med=196.43ms max=546.06ms p(90)=360.52ms p(95)=386.91ms p(99.9)=482.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73236
     http_req_receiving.............: avg=76.9µs   min=26.9µs med=62.77µs  max=27.29ms  p(90)=104.03µs p(95)=120.16µs p(99.9)=1.25ms  
     http_req_sending...............: avg=32.05µs  min=5.12µs med=11.37µs  max=95.29ms  p(90)=19.55µs  p(95)=23.36µs  p(99.9)=3.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.73ms min=1.91ms med=196.33ms max=545.96ms p(90)=360.42ms p(95)=386.81ms p(99.9)=482.18ms
     http_reqs......................: 73236   1169.905448/s
     iteration_duration.............: avg=197.79ms min=4.83ms med=199.68ms max=546.25ms p(90)=361.52ms p(95)=387.56ms p(99.9)=483.16ms
     iterations.....................: 72236   1153.93099/s
     success_rate...................: 100.00% ✓ 72236       ✗ 0    
     vus............................: 84      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 101175     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   644 kB/s
     http_req_blocked...............: avg=9.59µs   min=1.1µs   med=3.38µs   max=9.52ms   p(90)=5.15µs   p(95)=6.13µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=5.06µs   min=0s      med=0s       max=9.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=413.05ms min=3.75ms  med=385.13ms max=1.9s     p(90)=819.79ms p(95)=888.86ms p(99.9)=1.29s   
       { expected_response:true }...: avg=413.05ms min=3.75ms  med=385.13ms max=1.9s     p(90)=819.79ms p(95)=888.86ms p(99.9)=1.29s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34725
     http_req_receiving.............: avg=88.84µs  min=30.62µs med=74.99µs  max=103.29ms p(90)=115.58µs p(95)=130.45µs p(99.9)=984.57µs
     http_req_sending...............: avg=32.38µs  min=5.56µs  med=15.5µs   max=135.68ms p(90)=22.72µs  p(95)=25.96µs  p(99.9)=2.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=412.93ms min=3.68ms  med=385.04ms max=1.9s     p(90)=819.69ms p(95)=888.72ms p(99.9)=1.29s   
     http_reqs......................: 34725   536.554239/s
     iteration_duration.............: avg=425.57ms min=13.19ms med=398.69ms max=1.9s     p(90)=823.73ms p(95)=891.42ms p(99.9)=1.3s    
     iterations.....................: 33725   521.102713/s
     success_rate...................: 100.00% ✓ 33725      ✗ 0    
     vus............................: 90      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45621     ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   288 kB/s
     http_req_blocked...............: avg=15.45µs  min=1.11µs  med=3.29µs   max=9.46ms  p(90)=5.09µs   p(95)=6.99µs   p(99.9)=2.61ms
     http_req_connecting............: avg=10.33µs  min=0s      med=0s       max=9.39ms  p(90)=0s       p(95)=0s       p(99.9)=2.59ms
     http_req_duration..............: avg=898.61ms min=5.71ms  med=807.11ms max=5.37s   p(90)=1.82s    p(95)=2.01s    p(99.9)=4.32s 
       { expected_response:true }...: avg=898.61ms min=5.71ms  med=807.11ms max=5.37s   p(90)=1.82s    p(95)=2.01s    p(99.9)=4.32s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 16207
     http_req_receiving.............: avg=116.97µs min=37.33µs med=95.89µs  max=99.77ms p(90)=135.53µs p(95)=152.15µs p(99.9)=2.34ms
     http_req_sending...............: avg=38.03µs  min=5.45µs  med=17.91µs  max=65.6ms  p(90)=23.55µs  p(95)=29.3µs   p(99.9)=3.41ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=898.46ms min=5.63ms  med=807ms    max=5.37s   p(90)=1.82s    p(95)=2.01s    p(99.9)=4.32s 
     http_reqs......................: 16207   240.12113/s
     iteration_duration.............: avg=957.74ms min=28.25ms med=886.46ms max=5.39s   p(90)=1.83s    p(95)=2.03s    p(99.9)=4.4s  
     iterations.....................: 15207   225.30524/s
     success_rate...................: 100.00% ✓ 15207     ✗ 0    
     vus............................: 76      min=0       max=500
     vus_max........................: 500     min=500     max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46089      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   287 kB/s
     http_req_blocked...............: avg=15.05µs  min=1.37µs  med=3.61µs   max=5.39ms  p(90)=5.46µs   p(95)=7.12µs   p(99.9)=2.28ms
     http_req_connecting............: avg=9.52µs   min=0s      med=0s       max=4.46ms  p(90)=0s       p(95)=0s       p(99.9)=2.26ms
     http_req_duration..............: avg=887.69ms min=7.65ms  med=798.1ms  max=3.02s   p(90)=1.81s    p(95)=1.91s    p(99.9)=2.78s 
       { expected_response:true }...: avg=887.69ms min=7.65ms  med=798.1ms  max=3.02s   p(90)=1.81s    p(95)=1.91s    p(99.9)=2.78s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16363
     http_req_receiving.............: avg=101.95µs min=32.79µs med=94.34µs  max=12.06ms p(90)=133.41µs p(95)=150.06µs p(99.9)=1.06ms
     http_req_sending...............: avg=37.23µs  min=5.88µs  med=18.58µs  max=85.75ms p(90)=24.65µs  p(95)=29.7µs   p(99.9)=2.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=887.55ms min=7.55ms  med=797.99ms max=3.02s   p(90)=1.81s    p(95)=1.91s    p(99.9)=2.78s 
     http_reqs......................: 16363   238.779342/s
     iteration_duration.............: avg=945.49ms min=48.48ms med=884.63ms max=3.04s   p(90)=1.83s    p(95)=1.91s    p(99.9)=2.79s 
     iterations.....................: 15363   224.186704/s
     success_rate...................: 100.00% ✓ 15363      ✗ 0    
     vus............................: 84      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

