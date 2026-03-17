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
| hive-router | v0.0.41 | 2,635 | 2,635 | 2,586 | 1.3% |  |
| grafbase | 0.53.2 | 2,268 | 2,268 | 2,108 | 5.0% | non-compatible response (96858 across 2/2 runs) |
| hotchocolate | 16.0.0-p.11.47 | 1,631 | 1,631 | 1,610 | 0.9% |  |
| cosmo | 0.291.0 | 1,217 | 1,217 | 1,172 | 2.6% | non-compatible response (6 across 1/2 runs) |
| hive-gateway-router-runtime | 2.5.6 | 484 | 484 | 480 | 0.6% |  |
| apollo-router | v2.12.0 | 400 | 400 | 391 | 1.6% | non-compatible response (9285 across 2/2 runs) |
| hive-gateway | 2.5.6 | 248 | 248 | 246 | 0.6% |  |
| apollo-gateway | 2.13.2 | 221 | 221 | 218 | 1.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,204 | 2,204 | 2,166 | 1.2% |  |
| grafbase | 0.53.2 | 1,563 | 1,563 | 1,502 | 2.8% | non-compatible response (13050 across 2/2 runs) |
| hotchocolate | 16.0.0-p.11.47 | 1,523 | 1,523 | 1,448 | 3.5% | non-compatible response (2 across 2/2 runs) |
| cosmo | 0.291.0 | 1,129 | 1,129 | 1,089 | 2.5% | non-compatible response (9 across 2/2 runs) |
| hive-gateway-router-runtime | 2.5.6 | 470 | 470 | 468 | 0.3% |  |
| apollo-router | v2.12.0 | 372 | 372 | 362 | 1.9% | non-compatible response (8179 across 2/2 runs) |
| hive-gateway | 2.5.6 | 242 | 242 | 239 | 0.9% |  |
| apollo-gateway | 2.13.2 | 204 | 204 | 201 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 485022      ✗ 0     
     data_received..................: 14 GB   231 MB/s
     data_sent......................: 196 MB  3.2 MB/s
     http_req_blocked...............: avg=23.17µs  min=1.09µs  med=2.55µs  max=57.82ms  p(90)=3.99µs   p(95)=5.06µs   p(99.9)=1.96ms  
     http_req_connecting............: avg=19.76µs  min=0s      med=0s      max=57.78ms  p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=87.36ms  min=1.43ms  med=82.02ms max=374.26ms p(90)=170.21ms p(95)=186.03ms p(99.9)=238.44ms
       { expected_response:true }...: avg=87.36ms  min=1.43ms  med=82.02ms max=374.26ms p(90)=170.21ms p(95)=186.03ms p(99.9)=238.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162674
     http_req_receiving.............: avg=265.75µs min=28.91µs med=57.52µs max=63.01ms  p(90)=205.69µs p(95)=407.69µs p(99.9)=28.79ms 
     http_req_sending...............: avg=81.03µs  min=5.25µs  med=10.11µs max=247.98ms p(90)=18.41µs  p(95)=132.72µs p(99.9)=11.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.01ms  min=1.38ms  med=81.72ms max=339.92ms p(90)=169.53ms p(95)=185.28ms p(99.9)=236.35ms
     http_reqs......................: 162674  2635.489331/s
     iteration_duration.............: avg=88.18ms  min=1.92ms  med=82.98ms max=398.51ms p(90)=170.69ms p(95)=186.51ms p(99.9)=239.95ms
     iterations.....................: 161674  2619.288282/s
     success_rate...................: 100.00% ✓ 161674      ✗ 0     
     vus............................: 91      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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
     ✗ no graphql errors
      ↳  56% — ✓ 78618 / ✗ 61619
     ✗ valid response structure
      ↳  99% — ✓ 140131 / ✗ 106

     checks.........................: 85.32% ✓ 358986      ✗ 61725 
     data_received..................: 11 GB  171 MB/s
     data_sent......................: 170 MB 2.7 MB/s
     http_req_blocked...............: avg=9.4µs    min=1µs      med=2.36µs  max=49.6ms   p(90)=3.98µs   p(95)=4.98µs   p(99.9)=284.64µs
     http_req_connecting............: avg=6.44µs   min=0s       med=0s      max=49.38ms  p(90)=0s       p(95)=0s       p(99.9)=202.07µs
     http_req_duration..............: avg=96.58ms  min=288.97µs med=98ms    max=11.85s   p(90)=163.44ms p(95)=177.16ms p(99.9)=549.82ms
       { expected_response:true }...: avg=96.58ms  min=288.97µs med=98ms    max=11.85s   p(90)=163.44ms p(95)=177.16ms p(99.9)=549.82ms
     http_req_failed................: 0.00%  ✓ 0           ✗ 141237
     http_req_receiving.............: avg=134.64µs min=11.89µs  med=57.36µs max=124.2ms  p(90)=113.66µs p(95)=332.98µs p(99.9)=14.46ms 
     http_req_sending...............: avg=66.39µs  min=5.05µs   med=10.57µs max=236.87ms p(90)=18.64µs  p(95)=124.84µs p(99.9)=7.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.38ms  min=254.17µs med=97.82ms max=11.85s   p(90)=163.14ms p(95)=176.83ms p(99.9)=544.1ms 
     http_reqs......................: 141237 2268.473872/s
     iteration_duration.............: avg=97.52ms  min=367.42µs med=98.96ms max=11.85s   p(90)=163.85ms p(95)=177.54ms p(99.9)=583.15ms
     iterations.....................: 140237 2252.412402/s
     success_rate...................: 56.06% ✓ 78618       ✗ 61619 
     vus............................: 70     min=0         max=500 
     vus_max........................: 500    min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 306003      ✗ 0     
     data_received..................: 9.0 GB  143 MB/s
     data_sent......................: 124 MB  2.0 MB/s
     http_req_blocked...............: avg=14.01µs  min=1.01µs med=2.1µs    max=53.23ms  p(90)=3.36µs   p(95)=4.2µs    p(99.9)=1.02ms  
     http_req_connecting............: avg=11.06µs  min=0s     med=0s       max=53.17ms  p(90)=0s       p(95)=0s       p(99.9)=880.24µs
     http_req_duration..............: avg=138.52ms min=2.71ms med=72.51ms  max=3.68s    p(90)=346.07ms p(95)=465.85ms p(99.9)=1.62s   
       { expected_response:true }...: avg=138.52ms min=2.71ms med=72.51ms  max=3.68s    p(90)=346.07ms p(95)=465.85ms p(99.9)=1.62s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 103002
     http_req_receiving.............: avg=4.46ms   min=53.7µs med=108.15µs max=672.37ms p(90)=2.71ms   p(95)=8.28ms   p(99.9)=384.38ms
     http_req_sending...............: avg=58.06µs  min=5.3µs  med=9.45µs   max=266.47ms p(90)=15.36µs  p(95)=22.03µs  p(99.9)=7.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134ms    min=2.63ms med=71.07ms  max=3.68s    p(90)=332.33ms p(95)=444.6ms  p(99.9)=1.62s   
     http_reqs......................: 103002  1631.558201/s
     iteration_duration.............: avg=140.14ms min=3.73ms med=74.29ms  max=3.68s    p(90)=348.3ms  p(95)=467.84ms p(99.9)=1.62s   
     iterations.....................: 102001  1615.702297/s
     success_rate...................: 100.00% ✓ 102001      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 225081      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=7.33µs   min=1.11µs  med=2.48µs   max=47.97ms  p(90)=3.97µs   p(95)=4.84µs   p(99.9)=666.95µs
     http_req_connecting............: avg=4.07µs   min=0s      med=0s       max=47.9ms   p(90)=0s       p(95)=0s       p(99.9)=593.61µs
     http_req_duration..............: avg=187.62ms min=2.04ms  med=188.44ms max=586.65ms p(90)=346.6ms  p(95)=370.41ms p(99.9)=507.59ms
       { expected_response:true }...: avg=187.62ms min=2.04ms  med=188.44ms max=586.65ms p(90)=346.6ms  p(95)=370.41ms p(99.9)=507.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76027
     http_req_receiving.............: avg=78.2µs   min=30.07µs med=61.17µs  max=14.49ms  p(90)=95.29µs  p(95)=110.65µs p(99.9)=1.82ms  
     http_req_sending...............: avg=29.93µs  min=5.21µs  med=11µs     max=58.54ms  p(90)=17.28µs  p(95)=21.06µs  p(99.9)=3.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.51ms min=1.96ms  med=188.32ms max=586.54ms p(90)=346.49ms p(95)=370.31ms p(99.9)=507.38ms
     http_reqs......................: 76027   1217.341628/s
     iteration_duration.............: avg=190.36ms min=4.38ms  med=191.48ms max=586.92ms p(90)=347.39ms p(95)=371.04ms p(99.9)=508.05ms
     iterations.....................: 75027   1201.329664/s
     success_rate...................: 100.00% ✓ 75027       ✗ 0    
     vus............................: 79      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 91266      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   582 kB/s
     http_req_blocked...............: avg=9.04µs   min=1.13µs  med=2.63µs   max=5.18ms  p(90)=4.29µs   p(95)=5.26µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=5.18µs   min=0s      med=0s       max=5.1ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=456.64ms min=4.21ms  med=430.26ms max=1.84s   p(90)=898.59ms p(95)=971.27ms p(99.9)=1.38s   
       { expected_response:true }...: avg=456.64ms min=4.21ms  med=430.26ms max=1.84s   p(90)=898.59ms p(95)=971.27ms p(99.9)=1.38s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31422
     http_req_receiving.............: avg=85.34µs  min=31.26µs med=71.21µs  max=85.9ms  p(90)=105.52µs p(95)=117.77µs p(99.9)=912.64µs
     http_req_sending...............: avg=25.74µs  min=5.54µs  med=12.52µs  max=63.14ms p(90)=19.12µs  p(95)=22.46µs  p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=456.52ms min=4.11ms  med=430.18ms max=1.84s   p(90)=898.5ms  p(95)=971.19ms p(99.9)=1.38s   
     http_reqs......................: 31422   484.173988/s
     iteration_duration.............: avg=471.84ms min=24.62ms med=450.03ms max=1.84s   p(90)=903.12ms p(95)=974.31ms p(99.9)=1.39s   
     iterations.....................: 30422   468.76523/s
     success_rate...................: 100.00% ✓ 30422      ✗ 0    
     vus............................: 55      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  81% — ✓ 20677 / ✗ 4780
     ✗ valid response structure
      ↳  99% — ✓ 25418 / ✗ 39

     checks.........................: 93.69% ✓ 71552      ✗ 4819 
     data_received..................: 2.1 GB 31 MB/s
     data_sent......................: 32 MB  483 kB/s
     http_req_blocked...............: avg=21.23µs  min=1.17µs  med=2.93µs   max=89.36ms  p(90)=4.48µs   p(95)=5.4µs    p(99.9)=2.29ms  
     http_req_connecting............: avg=17.26µs  min=0s      med=0s       max=89.27ms  p(90)=0s       p(95)=0s       p(99.9)=2.27ms  
     http_req_duration..............: avg=529.66ms min=5.37ms  med=488.85ms max=9.99s    p(90)=836.3ms  p(95)=942.29ms p(99.9)=8.74s   
       { expected_response:true }...: avg=529.66ms min=5.37ms  med=488.85ms max=9.99s    p(90)=836.3ms  p(95)=942.29ms p(99.9)=8.74s   
     http_req_failed................: 0.00%  ✓ 0          ✗ 26457
     http_req_receiving.............: avg=99.64µs  min=18.16µs med=73.45µs  max=143.98ms p(90)=111.4µs  p(95)=123.87µs p(99.9)=763.31µs
     http_req_sending...............: avg=38.62µs  min=5.86µs  med=13.38µs  max=81.02ms  p(90)=19.89µs  p(95)=22.68µs  p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=529.52ms min=5.31ms  med=488.79ms max=9.99s    p(90)=836.12ms p(95)=942.11ms p(99.9)=8.74s   
     http_reqs......................: 26457  400.708273/s
     iteration_duration.............: avg=550.69ms min=37.83ms med=502.75ms max=10s      p(90)=841.61ms p(95)=949.55ms p(99.9)=8.77s   
     iterations.....................: 25457  385.56263/s
     success_rate...................: 81.22% ✓ 20677      ✗ 4780 
     vus............................: 64     min=0        max=500
     vus_max........................: 500    min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47190      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=12.08µs  min=1.18µs  med=3.27µs   max=3.09ms   p(90)=4.85µs   p(95)=6.23µs   p(99.9)=2ms    
     http_req_connecting............: avg=7.31µs   min=0s      med=0s       max=3.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.98ms 
     http_req_duration..............: avg=795.48ms min=5.72ms  med=767.53ms max=18.96s   p(90)=1.43s    p(95)=1.57s    p(99.9)=15.01s 
       { expected_response:true }...: avg=795.48ms min=5.72ms  med=767.53ms max=18.96s   p(90)=1.43s    p(95)=1.57s    p(99.9)=15.01s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16730
     http_req_receiving.............: avg=194.36µs min=35.56µs med=85.51µs  max=159.82ms p(90)=122.61µs p(95)=135.53µs p(99.9)=35.89ms
     http_req_sending...............: avg=28.38µs  min=6.23µs  med=15.19µs  max=27.75ms  p(90)=21.32µs  p(95)=25.75µs  p(99.9)=3.31ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=795.26ms min=5.63ms  med=767.45ms max=18.96s   p(90)=1.43s    p(95)=1.57s    p(99.9)=15.01s 
     http_reqs......................: 16730   248.007828/s
     iteration_duration.............: avg=846.07ms min=22.95ms med=814.26ms max=18.96s   p(90)=1.45s    p(95)=1.58s    p(99.9)=15.3s  
     iterations.....................: 15730   233.18369/s
     success_rate...................: 100.00% ✓ 15730      ✗ 0    
     vus............................: 89      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42840      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 19 MB   271 kB/s
     http_req_blocked...............: avg=16.1µs   min=1.26µs  med=3.29µs   max=16.87ms p(90)=4.93µs   p(95)=6.36µs   p(99.9)=2.56ms  
     http_req_connecting............: avg=11.15µs  min=0s      med=0s       max=16.81ms p(90)=0s       p(95)=0s       p(99.9)=2.54ms  
     http_req_duration..............: avg=463.84ms min=8.42ms  med=529.1ms  max=1.35s   p(90)=781.45ms p(95)=838.36ms p(99.9)=1.17s   
       { expected_response:true }...: avg=463.84ms min=8.42ms  med=529.1ms  max=1.35s   p(90)=781.45ms p(95)=838.36ms p(99.9)=1.17s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15280
     http_req_receiving.............: avg=92.45µs  min=36.8µs  med=86.59µs  max=2.89ms  p(90)=123.76µs p(95)=137.16µs p(99.9)=656.27µs
     http_req_sending...............: avg=25.47µs  min=6.01µs  med=15.85µs  max=7.21ms  p(90)=22µs     p(95)=26.75µs  p(99.9)=2.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=463.72ms min=8.32ms  med=529.01ms max=1.35s   p(90)=781.36ms p(95)=838.26ms p(99.9)=1.17s   
     http_reqs......................: 15280   221.06346/s
     iteration_duration.............: avg=496.16ms min=14.55ms med=559.66ms max=1.36s   p(90)=787.47ms p(95)=844.87ms p(99.9)=1.18s   
     iterations.....................: 14280   206.595956/s
     success_rate...................: 100.00% ✓ 14280      ✗ 0    
     vus............................: 101     min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 406452      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=16.16µs  min=1.09µs  med=2.81µs   max=50.16ms  p(90)=4.44µs   p(95)=5.58µs   p(99.9)=2.01ms  
     http_req_connecting............: avg=12.61µs  min=0s      med=0s       max=50.08ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=104.22ms min=1.58ms  med=99.48ms  max=329.68ms p(90)=200.12ms p(95)=216.58ms p(99.9)=265.55ms
       { expected_response:true }...: avg=104.22ms min=1.58ms  med=99.48ms  max=329.68ms p(90)=200.12ms p(95)=216.58ms p(99.9)=265.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136484
     http_req_receiving.............: avg=142.83µs min=28.19µs med=61.84µs  max=172.76ms p(90)=160.53µs p(95)=404.62µs p(99.9)=11.3ms  
     http_req_sending...............: avg=69.9µs   min=5.29µs  med=11.26µs  max=114.68ms p(90)=21.06µs  p(95)=138.74µs p(99.9)=8.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.01ms min=1.53ms  med=99.26ms  max=328.96ms p(90)=199.89ms p(95)=216.3ms  p(99.9)=264.5ms 
     http_reqs......................: 136484  2204.517728/s
     iteration_duration.............: avg=105.26ms min=3.97ms  med=100.65ms max=363.42ms p(90)=200.68ms p(95)=217.11ms p(99.9)=266.63ms
     iterations.....................: 135484  2188.365522/s
     success_rate...................: 100.00% ✓ 135484      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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
     ✗ no graphql errors
      ↳  90% — ✓ 87685 / ✗ 9235
     ✗ valid response structure
      ↳  99% — ✓ 96907 / ✗ 13

     checks.........................: 96.81% ✓ 281512      ✗ 9248 
     data_received..................: 8.3 GB 132 MB/s
     data_sent......................: 118 MB 1.9 MB/s
     http_req_blocked...............: avg=5.75µs   min=1.01µs  med=2.68µs  max=26.22ms  p(90)=5.04µs   p(95)=6.33µs   p(99.9)=243.59µs
     http_req_connecting............: avg=2.33µs   min=0s      med=0s      max=26.16ms  p(90)=0s       p(95)=0s       p(99.9)=166.64µs
     http_req_duration..............: avg=93.22ms  min=2.18ms  med=69.96ms max=34.72s   p(90)=109.82ms p(95)=125.02ms p(99.9)=273.13ms
       { expected_response:true }...: avg=93.22ms  min=2.18ms  med=69.96ms max=34.72s   p(90)=109.82ms p(95)=125.02ms p(99.9)=273.13ms
     http_req_failed................: 0.00%  ✓ 0           ✗ 97921
     http_req_receiving.............: avg=115.75µs min=15.25µs med=64.07µs max=157.43ms p(90)=123.39µs p(95)=238.44µs p(99.9)=6.82ms  
     http_req_sending...............: avg=53.66µs  min=5.4µs   med=11.23µs max=182.99ms p(90)=22.31µs  p(95)=36.2µs   p(99.9)=5.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.05ms  min=2.09ms  med=69.79ms max=34.72s   p(90)=109.61ms p(95)=124.84ms p(99.9)=272.88ms
     http_reqs......................: 97921  1563.050486/s
     iteration_duration.............: avg=94.42ms  min=2.5ms   med=70.53ms max=34.72s   p(90)=110.28ms p(95)=125.48ms p(99.9)=276.05ms
     iterations.....................: 96920  1547.072162/s
     success_rate...................: 90.47% ✓ 87685       ✗ 9235 
     vus............................: 87     min=0         max=500
     vus_max........................: 500    min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  99% — ✓ 94287 / ✗ 1
     ✓ valid response structure

     checks.........................: 99.99% ✓ 282863      ✗ 1    
     data_received..................: 8.4 GB 134 MB/s
     data_sent......................: 115 MB 1.8 MB/s
     http_req_blocked...............: avg=14.69µs  min=1.07µs  med=2.65µs   max=67.63ms  p(90)=4.28µs   p(95)=5.27µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=11.25µs  min=0s      med=0s       max=67.48ms  p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=149.63ms min=1.91ms  med=78.85ms  max=2.72s    p(90)=379.14ms p(95)=515.2ms  p(99.9)=1.56s   
       { expected_response:true }...: avg=149.63ms min=1.91ms  med=78.85ms  max=2.72s    p(90)=379.14ms p(95)=515.2ms  p(99.9)=1.56s   
     http_req_failed................: 0.00%  ✓ 0           ✗ 95288
     http_req_receiving.............: avg=4.65ms   min=53.12µs med=116.06µs max=886.13ms p(90)=2.54ms   p(95)=8.03ms   p(99.9)=481.41ms
     http_req_sending...............: avg=54.15µs  min=5.53µs  med=10.83µs  max=259.41ms p(90)=18.68µs  p(95)=28.32µs  p(99.9)=6.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=144.93ms min=1.81ms  med=77.12ms  max=2.71s    p(90)=365.27ms p(95)=491.8ms  p(99.9)=1.55s   
     http_reqs......................: 95288  1523.400401/s
     iteration_duration.............: avg=151.5ms  min=3.2ms   med=80.62ms  max=2.72s    p(90)=380.91ms p(95)=517.62ms p(99.9)=1.57s   
     iterations.....................: 94288  1507.413074/s
     success_rate...................: 99.99% ✓ 94287       ✗ 1    
     vus............................: 84     min=0         max=495
     vus_max........................: 500    min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  99% — ✓ 69545 / ✗ 4
     ✓ valid response structure

     checks.........................: 99.99% ✓ 208643      ✗ 4    
     data_received..................: 6.2 GB 99 MB/s
     data_sent......................: 85 MB  1.4 MB/s
     http_req_blocked...............: avg=10.22µs  min=1.1µs   med=2.21µs   max=58.66ms  p(90)=3.76µs   p(95)=4.65µs   p(99.9)=698.92µs
     http_req_connecting............: avg=7.19µs   min=0s      med=0s       max=58.6ms   p(90)=0s       p(95)=0s       p(99.9)=608.57µs
     http_req_duration..............: avg=202.26ms min=2.07ms  med=201.88ms max=572.76ms p(90)=374.12ms p(95)=400.43ms p(99.9)=492.91ms
       { expected_response:true }...: avg=202.26ms min=2.07ms  med=201.88ms max=572.76ms p(90)=374.12ms p(95)=400.43ms p(99.9)=492.91ms
     http_req_failed................: 0.00%  ✓ 0           ✗ 70549
     http_req_receiving.............: avg=93.59µs  min=21.99µs med=62.07µs  max=141.49ms p(90)=97.05µs  p(95)=111.85µs p(99.9)=2.05ms  
     http_req_sending...............: avg=34.4µs   min=5.35µs  med=10.61µs  max=201.48ms p(90)=16.83µs  p(95)=20.18µs  p(99.9)=3.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.13ms min=2ms     med=201.75ms max=572.71ms p(90)=374.04ms p(95)=400.32ms p(99.9)=492.82ms
     http_reqs......................: 70549  1129.1092/s
     iteration_duration.............: avg=205.42ms min=5.75ms  med=205.51ms max=572.98ms p(90)=375.01ms p(95)=401.13ms p(99.9)=493.22ms
     iterations.....................: 69549  1113.104591/s
     success_rate...................: 99.99% ✓ 69545       ✗ 4    
     vus............................: 81     min=0         max=492
     vus_max........................: 500    min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88869      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   566 kB/s
     http_req_blocked...............: avg=9.56µs   min=1.22µs  med=3.23µs   max=27.87ms  p(90)=4.98µs   p(95)=5.94µs   p(99.9)=998.46µs
     http_req_connecting............: avg=5.18µs   min=0s      med=0s       max=27.81ms  p(90)=0s       p(95)=0s       p(99.9)=856.54µs
     http_req_duration..............: avg=468.72ms min=4.33ms  med=446.28ms max=1.86s    p(90)=917.32ms p(95)=997.76ms p(99.9)=1.45s   
       { expected_response:true }...: avg=468.72ms min=4.33ms  med=446.28ms max=1.86s    p(90)=917.32ms p(95)=997.76ms p(99.9)=1.45s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30623
     http_req_receiving.............: avg=87.22µs  min=31.77µs med=80.19µs  max=19.86ms  p(90)=115.27µs p(95)=128.52µs p(99.9)=809.77µs
     http_req_sending...............: avg=38.54µs  min=5.74µs  med=14.7µs   max=235.41ms p(90)=21.47µs  p(95)=24.61µs  p(99.9)=2.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=468.59ms min=4.21ms  med=446.16ms max=1.86s    p(90)=917.13ms p(95)=997.67ms p(99.9)=1.45s   
     http_reqs......................: 30623   470.202846/s
     iteration_duration.............: avg=484.77ms min=31.72ms med=468.89ms max=1.86s    p(90)=923.01ms p(95)=1s       p(99.9)=1.45s   
     iterations.....................: 29623   454.848281/s
     success_rate...................: 100.00% ✓ 29623      ✗ 0    
     vus............................: 66      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  82% — ✓ 19581 / ✗ 4196
     ✗ valid response structure
      ↳  99% — ✓ 23711 / ✗ 66

     checks.........................: 94.02% ✓ 67070      ✗ 4262 
     data_received..................: 1.9 GB 29 MB/s
     data_sent......................: 30 MB  451 kB/s
     http_req_blocked...............: avg=16.88µs  min=1.24µs  med=3.19µs   max=83.9ms  p(90)=4.71µs   p(95)=5.46µs   p(99.9)=2.05ms
     http_req_connecting............: avg=12.6µs   min=0s      med=0s       max=83.8ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms
     http_req_duration..............: avg=538.93ms min=5.78ms  med=527.18ms max=15.82s  p(90)=937.2ms  p(95)=1.02s    p(99.9)=6.85s 
       { expected_response:true }...: avg=538.93ms min=5.78ms  med=527.18ms max=15.82s  p(90)=937.2ms  p(95)=1.02s    p(99.9)=6.85s 
     http_req_failed................: 0.00%  ✓ 0          ✗ 24778
     http_req_receiving.............: avg=93.06µs  min=14.05µs med=77.58µs  max=25.09ms p(90)=114.97µs p(95)=127.21µs p(99.9)=1.45ms
     http_req_sending...............: avg=30.5µs   min=5.92µs  med=14.81µs  max=41.5ms  p(90)=20.72µs  p(95)=23.3µs   p(99.9)=2.65ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=538.8ms  min=5.67ms  med=527.1ms  max=15.82s  p(90)=937.09ms p(95)=1.02s    p(99.9)=6.85s 
     http_reqs......................: 24778  372.863436/s
     iteration_duration.............: avg=561.76ms min=15.36ms med=546.83ms max=15.82s  p(90)=942.4ms  p(95)=1.03s    p(99.9)=6.93s 
     iterations.....................: 23777  357.800223/s
     success_rate...................: 82.35% ✓ 19581      ✗ 4196 
     vus............................: 87     min=0        max=500
     vus_max........................: 500    min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46083      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=16.33µs  min=1.24µs  med=3.49µs   max=38.35ms  p(90)=5.23µs   p(95)=6.58µs   p(99.9)=2.46ms 
     http_req_connecting............: avg=11.1µs   min=0s      med=0s       max=38.29ms  p(90)=0s       p(95)=0s       p(99.9)=2.44ms 
     http_req_duration..............: avg=874.84ms min=5.82ms  med=804.85ms max=4.01s    p(90)=1.75s    p(95)=1.93s    p(99.9)=3.47s  
       { expected_response:true }...: avg=874.84ms min=5.82ms  med=804.85ms max=4.01s    p(90)=1.75s    p(95)=1.93s    p(99.9)=3.47s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16361
     http_req_receiving.............: avg=193.15µs min=37.12µs med=91.91µs  max=193.52ms p(90)=130.94µs p(95)=144.28µs p(99.9)=15.75ms
     http_req_sending...............: avg=36.74µs  min=6.13µs  med=16.82µs  max=73.2ms   p(90)=22.76µs  p(95)=27.27µs  p(99.9)=3.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=874.61ms min=5.72ms  med=804.74ms max=4.01s    p(90)=1.75s    p(95)=1.93s    p(99.9)=3.47s  
     http_reqs......................: 16361   242.883452/s
     iteration_duration.............: avg=931.85ms min=42.69ms med=855.4ms  max=4.02s    p(90)=1.77s    p(95)=1.94s    p(99.9)=3.48s  
     iterations.....................: 15361   228.038182/s
     success_rate...................: 100.00% ✓ 15361      ✗ 0    
     vus............................: 85      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 39660      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=15.13µs min=1.24µs  med=3.45µs   max=3.32ms p(90)=5.09µs   p(95)=6.7µs    p(99.9)=2.66ms  
     http_req_connecting............: avg=9.94µs  min=0s      med=0s       max=3.29ms p(90)=0s       p(95)=0s       p(99.9)=2.63ms  
     http_req_duration..............: avg=1s      min=8.65ms  med=933.22ms max=3.6s   p(90)=2.04s    p(95)=2.17s    p(99.9)=3.15s   
       { expected_response:true }...: avg=1s      min=8.65ms  med=933.22ms max=3.6s   p(90)=2.04s    p(95)=2.17s    p(99.9)=3.15s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14220
     http_req_receiving.............: avg=96.71µs min=35.13µs med=90.86µs  max=2.56ms p(90)=131.02µs p(95)=143.31µs p(99.9)=748.95µs
     http_req_sending...............: avg=25.77µs min=6.04µs  med=16.88µs  max=8.56ms p(90)=22.85µs  p(95)=28.08µs  p(99.9)=1.91ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s      min=8.54ms  med=933.09ms max=3.6s   p(90)=2.04s    p(95)=2.17s    p(99.9)=3.15s   
     http_reqs......................: 14220   204.518576/s
     iteration_duration.............: avg=1.07s   min=36.02ms med=1.01s    max=3.6s   p(90)=2.06s    p(95)=2.18s    p(99.9)=3.23s   
     iterations.....................: 13220   190.136117/s
     success_rate...................: 100.00% ✓ 13220      ✗ 0    
     vus............................: 90      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB
