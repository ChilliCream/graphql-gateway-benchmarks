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
| hive-router | v0.0.84 | 2,685 | 2,834 | 2,617 | 2.6% |  |
| fusion | 16.6.0 | 2,428 | 2,527 | 2,408 | 1.7% |  |
| cosmo | 0.334.0 | 1,229 | 1,273 | 1,225 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 577 | 590 | 575 | 0.9% |  |
| hive-gateway | 2.10.8 | 253 | 260 | 252 | 0.9% |  |
| apollo-gateway | 2.14.3 | 234 | 240 | 232 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (8060 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (516253 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.0 | 2,413 | 2,499 | 2,402 | 1.4% |  |
| hive-router | v0.0.84 | 2,257 | 2,355 | 2,192 | 2.5% |  |
| cosmo | 0.334.0 | 1,169 | 1,209 | 1,168 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 518 | 535 | 515 | 1.3% |  |
| hive-gateway | 2.10.8 | 240 | 243 | 239 | 0.6% |  |
| apollo-gateway | 2.14.3 | 229 | 232 | 227 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (30994 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (367292 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 493848      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=17.91µs  min=931ns   med=2.5µs   max=64.75ms  p(90)=4.16µs   p(95)=5.3µs    p(99.9)=1.66ms  
     http_req_connecting............: avg=14.64µs  min=0s      med=0s      max=64.68ms  p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=85.85ms  min=1.44ms  med=81.21ms max=301.9ms  p(90)=164.78ms p(95)=178.72ms p(99.9)=225.38ms
       { expected_response:true }...: avg=85.85ms  min=1.44ms  med=81.21ms max=301.9ms  p(90)=164.78ms p(95)=178.72ms p(99.9)=225.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165616
     http_req_receiving.............: avg=126.27µs min=27.48µs med=52.99µs max=170.64ms p(90)=135.78µs p(95)=334.78µs p(99.9)=12.11ms 
     http_req_sending...............: avg=68.5µs   min=4.61µs  med=9.44µs  max=278.72ms p(90)=17.99µs  p(95)=119.43µs p(99.9)=9.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.65ms  min=1.36ms  med=81.03ms max=279.89ms p(90)=164.53ms p(95)=178.45ms p(99.9)=224.42ms
     http_reqs......................: 165616  2685.970362/s
     iteration_duration.............: avg=86.61ms  min=2ms     med=82.06ms max=317.6ms  p(90)=165.22ms p(95)=179.12ms p(99.9)=226.24ms
     iterations.....................: 164616  2669.752301/s
     success_rate...................: 100.00% ✓ 164616      ✗ 0     
     vus............................: 86      min=0         max=496 
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

     checks.........................: 100.00% ✓ 451980      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=21.44µs min=1.03µs  med=2.61µs   max=68.85ms  p(90)=4.14µs   p(95)=5.26µs   p(99.9)=2.39ms  
     http_req_connecting............: avg=18.13µs min=0s      med=0s       max=68.67ms  p(90)=0s       p(95)=0s       p(99.9)=2.35ms  
     http_req_duration..............: avg=93.81ms min=1.95ms  med=83.48ms  max=1.27s    p(90)=177.71ms p(95)=207.43ms p(99.9)=615.42ms
       { expected_response:true }...: avg=93.81ms min=1.95ms  med=83.48ms  max=1.27s    p(90)=177.71ms p(95)=207.43ms p(99.9)=615.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151660
     http_req_receiving.............: avg=1.56ms  min=52.69µs med=102.24µs max=509.55ms p(90)=1.62ms   p(95)=4.47ms   p(99.9)=95.48ms 
     http_req_sending...............: avg=71.19µs min=4.4µs   med=9.65µs   max=240.47ms p(90)=17.5µs   p(95)=110.72µs p(99.9)=9.06ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.17ms min=1.88ms  med=82.33ms  max=1.27s    p(90)=175.85ms p(95)=204.39ms p(99.9)=575.06ms
     http_reqs......................: 151660  2428.644302/s
     iteration_duration.............: avg=94.68ms min=3.75ms  med=84.44ms  max=1.27s    p(90)=178.33ms p(95)=208.09ms p(99.9)=616.69ms
     iterations.....................: 150660  2412.630559/s
     success_rate...................: 100.00% ✓ 150660      ✗ 0     
     vus............................: 76      min=0         max=493 
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

     checks.........................: 100.00% ✓ 227568      ✗ 0    
     data_received..................: 6.7 GB  108 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=5.23µs   min=932ns   med=2.21µs   max=12.6ms   p(90)=3.82µs   p(95)=4.74µs   p(99.9)=425.43µs
     http_req_connecting............: avg=2.34µs   min=0s      med=0s       max=12.55ms  p(90)=0s       p(95)=0s       p(99.9)=375.8µs 
     http_req_duration..............: avg=185.65ms min=1.98ms  med=186ms    max=521.19ms p(90)=343.41ms p(95)=369.03ms p(99.9)=449.03ms
       { expected_response:true }...: avg=185.65ms min=1.98ms  med=186ms    max=521.19ms p(90)=343.41ms p(95)=369.03ms p(99.9)=449.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76856
     http_req_receiving.............: avg=71.71µs  min=25.89µs med=56.12µs  max=133.38ms p(90)=92.73µs  p(95)=107.01µs p(99.9)=1.07ms  
     http_req_sending...............: avg=31.88µs  min=4.76µs  med=9.65µs   max=167.38ms p(90)=16.74µs  p(95)=20.69µs  p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.55ms min=1.9ms   med=185.91ms max=521.14ms p(90)=343.31ms p(95)=368.94ms p(99.9)=448.96ms
     http_reqs......................: 76856   1229.369694/s
     iteration_duration.............: avg=188.32ms min=4.38ms  med=188.64ms max=521.38ms p(90)=344.35ms p(95)=369.63ms p(99.9)=449.43ms
     iterations.....................: 75856   1213.37394/s
     success_rate...................: 100.00% ✓ 75856       ✗ 0    
     vus............................: 80      min=0         max=494
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

     checks.........................: 100.00% ✓ 108342     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   693 kB/s
     http_req_blocked...............: avg=7.42µs   min=1.02µs  med=2.48µs   max=4.76ms   p(90)=4.2µs    p(95)=5.16µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=4µs      min=0s      med=0s       max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=386.27ms min=3.62ms  med=358.79ms max=1.49s    p(90)=765.74ms p(95)=825.26ms p(99.9)=1.2s    
       { expected_response:true }...: avg=386.27ms min=3.62ms  med=358.79ms max=1.49s    p(90)=765.74ms p(95)=825.26ms p(99.9)=1.2s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 37114
     http_req_receiving.............: avg=86.3µs   min=28.22µs med=65.73µs  max=211.51ms p(90)=105.98µs p(95)=120.7µs  p(99.9)=939.42µs
     http_req_sending...............: avg=30.54µs  min=4.79µs  med=12.07µs  max=167.64ms p(90)=20.2µs   p(95)=23.1µs   p(99.9)=2.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=386.15ms min=3.55ms  med=358.71ms max=1.49s    p(90)=765.68ms p(95)=825.19ms p(99.9)=1.2s    
     http_reqs......................: 37114   577.506725/s
     iteration_duration.............: avg=397.17ms min=16.52ms med=370.81ms max=1.49s    p(90)=768.67ms p(95)=828.19ms p(99.9)=1.2s    
     iterations.....................: 36114   561.946378/s
     success_rate...................: 100.00% ✓ 36114      ✗ 0    
     vus............................: 68      min=0        max=496
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

     checks.........................: 100.00% ✓ 48435      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   305 kB/s
     http_req_blocked...............: avg=13.33µs  min=1.13µs  med=3.84µs   max=20.78ms p(90)=5.69µs   p(95)=7.12µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=7.74µs   min=0s      med=0s       max=20.72ms p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=832.82ms min=5.95ms  med=725.5ms  max=17.54s  p(90)=1.48s    p(95)=1.67s    p(99.9)=15.59s  
       { expected_response:true }...: avg=832.82ms min=5.95ms  med=725.5ms  max=17.54s  p(90)=1.48s    p(95)=1.67s    p(99.9)=15.59s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17145
     http_req_receiving.............: avg=101.62µs min=34.4µs  med=94.02µs  max=16.71ms p(90)=131.49µs p(95)=148.16µs p(99.9)=971.81µs
     http_req_sending...............: avg=32.09µs  min=6.55µs  med=18.33µs  max=23.45ms p(90)=24.1µs   p(95)=28.32µs  p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=832.69ms min=5.79ms  med=725.24ms max=17.54s  p(90)=1.48s    p(95)=1.67s    p(99.9)=15.59s  
     http_reqs......................: 17145   253.223417/s
     iteration_duration.............: avg=884.43ms min=49.52ms med=773.53ms max=17.54s  p(90)=1.5s     p(95)=1.7s     p(99.9)=15.61s  
     iterations.....................: 16145   238.453897/s
     success_rate...................: 100.00% ✓ 16145      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 48534      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   287 kB/s
     http_req_blocked...............: avg=14.17µs  min=1.37µs  med=3.47µs   max=13.28ms  p(90)=5.14µs   p(95)=6.49µs   p(99.9)=2.21ms  
     http_req_connecting............: avg=9.08µs   min=0s      med=0s       max=13.2ms   p(90)=0s       p(95)=0s       p(99.9)=2.19ms  
     http_req_duration..............: avg=389.51ms min=7.49ms  med=444.69ms max=1.27s    p(90)=667.67ms p(95)=763.18ms p(99.9)=1.1s    
       { expected_response:true }...: avg=389.51ms min=7.49ms  med=444.69ms max=1.27s    p(90)=667.67ms p(95)=763.18ms p(99.9)=1.1s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 17178
     http_req_receiving.............: avg=94.67µs  min=37.22µs med=86.89µs  max=15.02ms  p(90)=126.42µs p(95)=142.49µs p(99.9)=926.63µs
     http_req_sending...............: avg=43.96µs  min=5.37µs  med=17.31µs  max=105.73ms p(90)=22.93µs  p(95)=27.47µs  p(99.9)=4.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.37ms min=7.42ms  med=444.58ms max=1.27s    p(90)=667.5ms  p(95)=763.06ms p(99.9)=1.1s    
     http_reqs......................: 17178   234.630039/s
     iteration_duration.............: avg=413.62ms min=8.42ms  med=464.44ms max=1.28s    p(90)=678.5ms  p(95)=772.1ms  p(99.9)=1.11s   
     iterations.....................: 16178   220.971287/s
     success_rate...................: 100.00% ✓ 16178      ✗ 0    
     vus............................: 59      min=0        max=495
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

     checks.........................: 100.00% ✓ 445179      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=17.68µs min=832ns   med=2.31µs   max=81.8ms   p(90)=4.11µs   p(95)=5.3µs    p(99.9)=1.36ms  
     http_req_connecting............: avg=14.03µs min=0s      med=0s       max=47.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=95.25ms min=1.51ms  med=83.85ms  max=1.52s    p(90)=179.98ms p(95)=210.23ms p(99.9)=792.72ms
       { expected_response:true }...: avg=95.25ms min=1.51ms  med=83.85ms  max=1.52s    p(90)=179.98ms p(95)=210.23ms p(99.9)=792.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149393
     http_req_receiving.............: avg=1.49ms  min=52.15µs med=102.31µs max=1.02s    p(90)=1.69ms   p(95)=4.39ms   p(99.9)=99.07ms 
     http_req_sending...............: avg=69.23µs min=4.63µs  med=9.45µs   max=278.99ms p(90)=19.93µs  p(95)=106.98µs p(99.9)=8.77ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.69ms min=1.42ms  med=82.63ms  max=1.52s    p(90)=177.86ms p(95)=207.37ms p(99.9)=745.46ms
     http_reqs......................: 149393  2413.565352/s
     iteration_duration.............: avg=96.16ms min=2.76ms  med=84.86ms  max=1.52s    p(90)=180.59ms p(95)=210.97ms p(99.9)=798.96ms
     iterations.....................: 148393  2397.409539/s
     success_rate...................: 100.00% ✓ 148393      ✗ 0     
     vus............................: 54      min=0         max=499 
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

     checks.........................: 100.00% ✓ 415788      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=13.29µs  min=972ns   med=2.53µs  max=36.48ms  p(90)=4.26µs   p(95)=5.43µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=9.97µs   min=0s      med=0s      max=36.43ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=101.92ms min=1.45ms  med=96.73ms max=328.96ms p(90)=198.94ms p(95)=214.54ms p(99.9)=268.03ms
       { expected_response:true }...: avg=101.92ms min=1.45ms  med=96.73ms max=328.96ms p(90)=198.94ms p(95)=214.54ms p(99.9)=268.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139596
     http_req_receiving.............: avg=112.15µs min=27.12µs med=55.92µs max=45.88ms  p(90)=111.87µs p(95)=306.58µs p(99.9)=8.12ms  
     http_req_sending...............: avg=55.88µs  min=4.86µs  med=10.47µs max=144.02ms p(90)=18.67µs  p(95)=109.81µs p(99.9)=6.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.75ms min=1.4ms   med=96.54ms max=328.13ms p(90)=198.74ms p(95)=214.32ms p(99.9)=266.66ms
     http_reqs......................: 139596  2257.451549/s
     iteration_duration.............: avg=102.89ms min=4.49ms  med=97.84ms max=349.29ms p(90)=199.44ms p(95)=215ms    p(99.9)=268.83ms
     iterations.....................: 138596  2241.280229/s
     success_rate...................: 100.00% ✓ 138596      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 216606      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.02µs   min=1µs     med=2.45µs   max=6.34ms   p(90)=4.3µs    p(95)=5.32µs   p(99.9)=394.84µs
     http_req_connecting............: avg=1.83µs   min=0s      med=0s       max=6.29ms   p(90)=0s       p(95)=0s       p(99.9)=312.77µs
     http_req_duration..............: avg=194.94ms min=2.07ms  med=195.17ms max=495.83ms p(90)=361.18ms p(95)=386.57ms p(99.9)=455.3ms 
       { expected_response:true }...: avg=194.94ms min=2.07ms  med=195.17ms max=495.83ms p(90)=361.18ms p(95)=386.57ms p(99.9)=455.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 73202
     http_req_receiving.............: avg=82.48µs  min=28.05µs med=65.39µs  max=161.81ms p(90)=107.41µs p(95)=122.64µs p(99.9)=1.13ms  
     http_req_sending...............: avg=30.29µs  min=4.89µs  med=11.93µs  max=128.97ms p(90)=20.03µs  p(95)=23.66µs  p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.83ms min=1.96ms  med=195.02ms max=495.69ms p(90)=361.11ms p(95)=386.47ms p(99.9)=454.79ms
     http_reqs......................: 73202   1169.150438/s
     iteration_duration.............: avg=197.87ms min=5.1ms   med=198.6ms  max=496.08ms p(90)=362ms    p(95)=387.25ms p(99.9)=455.74ms
     iterations.....................: 72202   1153.178874/s
     success_rate...................: 100.00% ✓ 72202       ✗ 0    
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

     checks.........................: 100.00% ✓ 97758      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   623 kB/s
     http_req_blocked...............: avg=8.32µs   min=1.01µs  med=2.71µs   max=20.37ms p(90)=4.47µs   p(95)=5.49µs   p(99.9)=1.21ms
     http_req_connecting............: avg=4.52µs   min=0s      med=0s       max=20.21ms p(90)=0s       p(95)=0s       p(99.9)=1.12ms
     http_req_duration..............: avg=427.18ms min=3.68ms  med=398.47ms max=1.92s   p(90)=837.8ms  p(95)=921.85ms p(99.9)=1.42s 
       { expected_response:true }...: avg=427.18ms min=3.68ms  med=398.47ms max=1.92s   p(90)=837.8ms  p(95)=921.85ms p(99.9)=1.42s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33586
     http_req_receiving.............: avg=81.57µs  min=29.83µs med=71.61µs  max=9ms     p(90)=110.88µs p(95)=124.71µs p(99.9)=1.08ms
     http_req_sending...............: avg=22.69µs  min=5.13µs  med=13.01µs  max=40.81ms p(90)=20.49µs  p(95)=23.35µs  p(99.9)=2.22ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=427.07ms min=3.63ms  med=398.25ms max=1.92s   p(90)=837.72ms p(95)=921.77ms p(99.9)=1.42s 
     http_reqs......................: 33586   518.522678/s
     iteration_duration.............: avg=440.5ms  min=23.1ms  med=413.8ms  max=1.92s   p(90)=843.29ms p(95)=926.19ms p(99.9)=1.45s 
     iterations.....................: 32586   503.084022/s
     success_rate...................: 100.00% ✓ 32586      ✗ 0    
     vus............................: 94      min=0        max=500
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

     checks.........................: 100.00% ✓ 45867      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   288 kB/s
     http_req_blocked...............: avg=14.91µs  min=1.09µs  med=3.24µs   max=20.33ms p(90)=5.04µs  p(95)=6.95µs   p(99.9)=2.1ms 
     http_req_connecting............: avg=9.94µs   min=0s      med=0s       max=20.28ms p(90)=0s      p(95)=0s       p(99.9)=2.07ms
     http_req_duration..............: avg=894.11ms min=6.15ms  med=814.75ms max=5.34s   p(90)=1.79s   p(95)=2.03s    p(99.9)=4.2s  
       { expected_response:true }...: avg=894.11ms min=6.15ms  med=814.75ms max=5.34s   p(90)=1.79s   p(95)=2.03s    p(99.9)=4.2s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16289
     http_req_receiving.............: avg=95.6µs   min=35.76µs med=90.5µs   max=3.7ms   p(90)=126.9µs p(95)=142.66µs p(99.9)=1.15ms
     http_req_sending...............: avg=28.32µs  min=5.52µs  med=17.65µs  max=16.37ms p(90)=23.23µs p(95)=27.92µs  p(99.9)=2.36ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=893.99ms min=6.07ms  med=814.64ms max=5.34s   p(90)=1.79s   p(95)=2.03s    p(99.9)=4.2s  
     http_reqs......................: 16289   240.031066/s
     iteration_duration.............: avg=952.58ms min=48.93ms med=892.93ms max=5.35s   p(90)=1.82s   p(95)=2.04s    p(99.9)=4.23s 
     iterations.....................: 15289   225.295289/s
     success_rate...................: 100.00% ✓ 15289      ✗ 0    
     vus............................: 1       min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 44331      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=14.82µs  min=1.08µs  med=3.36µs   max=10.02ms  p(90)=5.14µs   p(95)=6.76µs   p(99.9)=2.21ms
     http_req_connecting............: avg=9.66µs   min=0s      med=0s       max=9.67ms   p(90)=0s       p(95)=0s       p(99.9)=2.18ms
     http_req_duration..............: avg=921.13ms min=7.78ms  med=871.56ms max=3.29s    p(90)=1.86s    p(95)=1.98s    p(99.9)=2.96s 
       { expected_response:true }...: avg=921.13ms min=7.78ms  med=871.56ms max=3.29s    p(90)=1.86s    p(95)=1.98s    p(99.9)=2.96s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15777
     http_req_receiving.............: avg=122.9µs  min=34.26µs med=91.41µs  max=188.25ms p(90)=133.81µs p(95)=150.78µs p(99.9)=1.06ms
     http_req_sending...............: avg=51.01µs  min=5.81µs  med=17.9µs   max=131.65ms p(90)=23.56µs  p(95)=28.54µs  p(99.9)=4.89ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=920.96ms min=7.68ms  med=871.46ms max=3.29s    p(90)=1.86s    p(95)=1.98s    p(99.9)=2.96s 
     http_reqs......................: 15777   229.529241/s
     iteration_duration.............: avg=983.47ms min=37.66ms med=908.79ms max=3.3s     p(90)=1.88s    p(95)=1.99s    p(99.9)=2.97s 
     iterations.....................: 14777   214.980896/s
     success_rate...................: 100.00% ✓ 14777      ✗ 0    
     vus............................: 87      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

