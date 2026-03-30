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
| hive-router | v0.0.43 | 2,678 | 2,781 | 2,625 | 2.0% |  |
| hotchocolate | 16.0.0-rc.1.21 | 1,982 | 2,027 | 1,964 | 1.0% |  |
| cosmo | 0.298.0 | 1,202 | 1,214 | 1,186 | 1.0% | non-compatible response (12 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 564 | 569 | 559 | 0.5% |  |
| hive-gateway | 2.5.14 | 250 | 252 | 247 | 0.7% |  |
| apollo-gateway | 2.13.3 | 197 | 202 | 194 | 1.3% | 4 failed requests across 1/9 runs |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (39212 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (461798 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,278 | 2,368 | 2,193 | 2.5% |  |
| hotchocolate | 16.0.0-rc.1.21 | 1,896 | 1,934 | 1,882 | 0.9% |  |
| cosmo | 0.298.0 | 1,104 | 1,128 | 1,100 | 1.0% | non-compatible response (10 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 538 | 545 | 532 | 0.8% |  |
| hive-gateway | 2.5.14 | 245 | 247 | 243 | 0.7% |  |
| apollo-gateway | 2.13.3 | 206 | 209 | 206 | 0.5% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (27496 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (295384 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 494079      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=30.2µs   min=1.04µs  med=2.54µs  max=83.22ms  p(90)=4.04µs   p(95)=5.12µs   p(99.9)=5.15ms  
     http_req_connecting............: avg=26.62µs  min=0s      med=0s      max=83.17ms  p(90)=0s       p(95)=0s       p(99.9)=4.46ms  
     http_req_duration..............: avg=85.73ms  min=1.57ms  med=80.18ms max=307.05ms p(90)=166.04ms p(95)=184.98ms p(99.9)=245.55ms
       { expected_response:true }...: avg=85.73ms  min=1.57ms  med=80.18ms max=307.05ms p(90)=166.04ms p(95)=184.98ms p(99.9)=245.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165693
     http_req_receiving.............: avg=360.12µs min=27.81µs med=57.01µs max=199.8ms  p(90)=251.09µs p(95)=430.55µs p(99.9)=40.4ms  
     http_req_sending...............: avg=89.91µs  min=5.35µs  med=10.09µs max=184.85ms p(90)=19.06µs  p(95)=138.25µs p(99.9)=14.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.28ms  min=1.52ms  med=79.76ms max=279.9ms  p(90)=165.28ms p(95)=183.59ms p(99.9)=243.03ms
     http_reqs......................: 165693  2678.88547/s
     iteration_duration.............: avg=86.56ms  min=2.53ms  med=81.11ms max=351.91ms p(90)=166.58ms p(95)=185.68ms p(99.9)=247.92ms
     iterations.....................: 164693  2662.717705/s
     success_rate...................: 100.00% ✓ 164693      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 370854      ✗ 0     
     data_received..................: 11 GB   174 MB/s
     data_sent......................: 150 MB  2.4 MB/s
     http_req_blocked...............: avg=13.4µs   min=1.02µs  med=2.61µs   max=51.48ms  p(90)=4.01µs   p(95)=4.94µs   p(99.9)=910.5µs 
     http_req_connecting............: avg=9.92µs   min=0s      med=0s       max=51.32ms  p(90)=0s       p(95)=0s       p(99.9)=791.82µs
     http_req_duration..............: avg=114.24ms min=2.42ms  med=109.93ms max=577.14ms p(90)=217.24ms p(95)=240.53ms p(99.9)=376.56ms
       { expected_response:true }...: avg=114.24ms min=2.42ms  med=109.93ms max=577.14ms p(90)=217.24ms p(95)=240.53ms p(99.9)=376.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 124618
     http_req_receiving.............: avg=1.32ms   min=52.48µs med=159.49µs max=394ms    p(90)=1.43ms   p(95)=3.51ms   p(99.9)=96.85ms 
     http_req_sending...............: avg=65.17µs  min=5.42µs  med=10.18µs  max=375.96ms p(90)=18.35µs  p(95)=128.83µs p(99.9)=8.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.84ms min=2.32ms  med=108.42ms max=482.54ms p(90)=215.32ms p(95)=237.38ms p(99.9)=370.91ms
     http_reqs......................: 124618  1982.523728/s
     iteration_duration.............: avg=115.41ms min=3.86ms  med=111.31ms max=577.36ms p(90)=217.81ms p(95)=241.08ms p(99.9)=378.05ms
     iterations.....................: 123618  1966.614921/s
     success_rate...................: 100.00% ✓ 123618      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 222387      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.04µs   min=1.07µs  med=2.56µs   max=19.82ms  p(90)=4.14µs   p(95)=5.03µs   p(99.9)=465.56µs
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=19.66ms  p(90)=0s       p(95)=0s       p(99.9)=365.29µs
     http_req_duration..............: avg=189.94ms min=2.04ms  med=190.85ms max=550.94ms p(90)=351.76ms p(95)=375.9ms  p(99.9)=459.89ms
       { expected_response:true }...: avg=189.94ms min=2.04ms  med=190.85ms max=550.94ms p(90)=351.76ms p(95)=375.9ms  p(99.9)=459.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75129
     http_req_receiving.............: avg=78.02µs  min=29.46µs med=60.67µs  max=74.88ms  p(90)=95.37µs  p(95)=109.21µs p(99.9)=1.62ms  
     http_req_sending...............: avg=31.11µs  min=5.03µs  med=10.95µs  max=132.67ms p(90)=16.93µs  p(95)=20.61µs  p(99.9)=3.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.83ms min=1.98ms  med=190.75ms max=550.85ms p(90)=351.66ms p(95)=375.78ms p(99.9)=459.79ms
     http_reqs......................: 75129   1202.250165/s
     iteration_duration.............: avg=192.74ms min=5.57ms  med=193.82ms max=551.1ms  p(90)=352.59ms p(95)=376.53ms p(99.9)=460.9ms 
     iterations.....................: 74129   1186.247687/s
     success_rate...................: 100.00% ✓ 74129       ✗ 0    
     vus............................: 79      min=0         max=496
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 106278     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   678 kB/s
     http_req_blocked...............: avg=9.29µs   min=1.12µs  med=2.89µs   max=24ms     p(90)=4.72µs   p(95)=5.73µs   p(99.9)=1.48ms
     http_req_connecting............: avg=5.47µs   min=0s      med=0s       max=23.94ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms
     http_req_duration..............: avg=393.67ms min=3.74ms  med=367.55ms max=2.01s    p(90)=773.04ms p(95)=832.62ms p(99.9)=1.27s 
       { expected_response:true }...: avg=393.67ms min=3.74ms  med=367.55ms max=2.01s    p(90)=773.04ms p(95)=832.62ms p(99.9)=1.27s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36426
     http_req_receiving.............: avg=159.79µs min=31.52µs med=75µs     max=145.82ms p(90)=110.9µs  p(95)=124.26µs p(99.9)=4.16ms
     http_req_sending...............: avg=29.18µs  min=5.37µs  med=13.31µs  max=131.18ms p(90)=20.47µs  p(95)=23.88µs  p(99.9)=2.15ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=393.48ms min=3.64ms  med=367.46ms max=2.01s    p(90)=772.93ms p(95)=832.5ms  p(99.9)=1.27s 
     http_reqs......................: 36426   564.971151/s
     iteration_duration.............: avg=405.02ms min=16.75ms med=383.07ms max=2.01s    p(90)=777.02ms p(95)=834.84ms p(99.9)=1.27s 
     iterations.....................: 35426   549.461044/s
     success_rate...................: 100.00% ✓ 35426      ✗ 0    
     vus............................: 80      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 48135      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   302 kB/s
     http_req_blocked...............: avg=17.62µs  min=1.31µs  med=3.58µs   max=42.91ms p(90)=5.47µs   p(95)=7.02µs  p(99.9)=2.83ms 
     http_req_connecting............: avg=12.25µs  min=0s      med=0s       max=42.85ms p(90)=0s       p(95)=0s      p(99.9)=2.59ms 
     http_req_duration..............: avg=829.24ms min=5.78ms  med=715.46ms max=17.71s  p(90)=1.44s    p(95)=1.61s   p(99.9)=16.66s 
       { expected_response:true }...: avg=829.24ms min=5.78ms  med=715.46ms max=17.71s  p(90)=1.44s    p(95)=1.61s   p(99.9)=16.66s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17045
     http_req_receiving.............: avg=161.14µs min=34.49µs med=96.82µs  max=66.04ms p(90)=136.56µs p(95)=151.1µs p(99.9)=33.22ms
     http_req_sending...............: avg=32.17µs  min=5.94µs  med=17.43µs  max=78.56ms p(90)=24.08µs  p(95)=28.79µs p(99.9)=2.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=829.05ms min=5.71ms  med=715.29ms max=17.71s  p(90)=1.44s    p(95)=1.61s   p(99.9)=16.66s 
     http_reqs......................: 17045   250.815832/s
     iteration_duration.............: avg=880.97ms min=12.12ms med=787.74ms max=17.71s  p(90)=1.45s    p(95)=1.61s   p(99.9)=16.67s 
     iterations.....................: 16045   236.100911/s
     success_rate...................: 100.00% ✓ 16045      ✗ 0    
     vus............................: 27      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 41337      ✗ 0    
     data_received..................: 1.3 GB  17 MB/s
     data_sent......................: 18 MB   243 kB/s
     http_req_blocked...............: avg=16.48µs  min=1.17µs  med=3.32µs   max=35.74ms p(90)=4.95µs   p(95)=6.54µs   p(99.9)=2.36ms  
     http_req_connecting............: avg=11.57µs  min=0s      med=0s       max=35.66ms p(90)=0s       p(95)=0s       p(99.9)=2.34ms  
     http_req_duration..............: avg=552.3ms  min=8.6ms   med=622.04ms max=1.45s   p(90)=924.91ms p(95)=987.81ms p(99.9)=1.33s   
       { expected_response:true }...: avg=552.3ms  min=8.6ms   med=622.04ms max=1.45s   p(90)=924.91ms p(95)=987.81ms p(99.9)=1.33s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14779
     http_req_receiving.............: avg=97.2µs   min=34.06µs med=89.16µs  max=9.57ms  p(90)=128.87µs p(95)=142.18µs p(99.9)=972.51µs
     http_req_sending...............: avg=25.42µs  min=6.1µs   med=15.74µs  max=8.14ms  p(90)=22.14µs  p(95)=27.3µs   p(99.9)=2.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=552.17ms min=8.51ms  med=621.92ms max=1.45s   p(90)=924.79ms p(95)=987.73ms p(99.9)=1.33s   
     http_reqs......................: 14779   197.949244/s
     iteration_duration.............: avg=592.16ms min=15.31ms med=696.76ms max=1.45s   p(90)=933.36ms p(95)=992.92ms p(99.9)=1.33s   
     iterations.....................: 13779   184.55529/s
     success_rate...................: 100.00% ✓ 13779      ✗ 0    
     vus............................: 68      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 420399      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=27.97µs  min=1.05µs  med=2.93µs  max=66.37ms  p(90)=4.79µs   p(95)=6.12µs   p(99.9)=3.06ms  
     http_req_connecting............: avg=23.9µs   min=0s      med=0s      max=66.13ms  p(90)=0s       p(95)=0s       p(99.9)=2.59ms  
     http_req_duration..............: avg=100.72ms min=1.58ms  med=94.66ms max=377.96ms p(90)=196.14ms p(95)=214.82ms p(99.9)=267.06ms
       { expected_response:true }...: avg=100.72ms min=1.58ms  med=94.66ms max=377.96ms p(90)=196.14ms p(95)=214.82ms p(99.9)=267.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141133
     http_req_receiving.............: avg=342.42µs min=28.71µs med=62.87µs max=75.09ms  p(90)=222.37µs p(95)=464.32µs p(99.9)=34.99ms 
     http_req_sending...............: avg=87.17µs  min=5.47µs  med=11.58µs max=122.23ms p(90)=22.25µs  p(95)=148.11µs p(99.9)=13.31ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.29ms min=1.52ms  med=94.33ms max=363.04ms p(90)=195.31ms p(95)=214.15ms p(99.9)=265.46ms
     http_reqs......................: 141133  2278.60918/s
     iteration_duration.............: avg=101.75ms min=3.43ms  med=95.82ms max=389.02ms p(90)=196.82ms p(95)=215.32ms p(99.9)=269.99ms
     iterations.....................: 140133  2262.464061/s
     success_rate...................: 100.00% ✓ 140133      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 351117      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=17.36µs  min=1.06µs  med=2.87µs   max=48.4ms   p(90)=4.58µs   p(95)=5.72µs   p(99.9)=2.25ms  
     http_req_connecting............: avg=13.65µs  min=0s      med=0s       max=48.24ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=120.58ms min=1.83ms  med=113.33ms max=855.6ms  p(90)=229.43ms p(95)=253.91ms p(99.9)=629.46ms
       { expected_response:true }...: avg=120.58ms min=1.83ms  med=113.33ms max=855.6ms  p(90)=229.43ms p(95)=253.91ms p(99.9)=629.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118039
     http_req_receiving.............: avg=1.38ms   min=53.12µs med=139.88µs max=343.04ms p(90)=1.6ms    p(95)=3.53ms   p(99.9)=108.89ms
     http_req_sending...............: avg=70.31µs  min=5.49µs  med=11.22µs  max=365.52ms p(90)=21.28µs  p(95)=132.87µs p(99.9)=9.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.12ms min=1.71ms  med=112.01ms max=855.52ms p(90)=227.48ms p(95)=251.26ms p(99.9)=627.25ms
     http_reqs......................: 118039  1896.840597/s
     iteration_duration.............: avg=121.91ms min=2.93ms  med=114.71ms max=855.8ms  p(90)=230.16ms p(95)=254.62ms p(99.9)=629.83ms
     iterations.....................: 117039  1880.770988/s
     success_rate...................: 100.00% ✓ 117039      ✗ 0     
     vus............................: 67      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 204429      ✗ 0    
     data_received..................: 6.0 GB  97 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=7.4µs    min=1.19µs  med=2.84µs   max=29.51ms  p(90)=4.61µs   p(95)=5.6µs    p(99.9)=608.98µs
     http_req_connecting............: avg=3.77µs   min=0s      med=0s       max=29.46ms  p(90)=0s       p(95)=0s       p(99.9)=542.04µs
     http_req_duration..............: avg=206.48ms min=2.13ms  med=207.69ms max=600.29ms p(90)=381.07ms p(95)=409.18ms p(99.9)=496.55ms
       { expected_response:true }...: avg=206.48ms min=2.13ms  med=207.69ms max=600.29ms p(90)=381.07ms p(95)=409.18ms p(99.9)=496.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69143
     http_req_receiving.............: avg=83.58µs  min=29.39µs med=68.02µs  max=35.28ms  p(90)=104.96µs p(95)=120.16µs p(99.9)=1.56ms  
     http_req_sending...............: avg=31.64µs  min=5.63µs  med=12.01µs  max=110.18ms p(90)=18.5µs   p(95)=22.06µs  p(99.9)=3.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.37ms min=2.07ms  med=207.57ms max=600.2ms  p(90)=380.98ms p(95)=409.03ms p(99.9)=496.48ms
     http_reqs......................: 69143   1104.100637/s
     iteration_duration.............: avg=209.76ms min=5.73ms  med=211.03ms max=600.48ms p(90)=382.14ms p(95)=410.03ms p(99.9)=497.67ms
     iterations.....................: 68143   1088.132272/s
     success_rate...................: 100.00% ✓ 68143       ✗ 0    
     vus............................: 88      min=0         max=498
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 101409     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   646 kB/s
     http_req_blocked...............: avg=8.1µs    min=1.22µs  med=3.2µs    max=3.91ms   p(90)=5.04µs   p(95)=6.03µs   p(99.9)=910.08µs
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=725.35µs
     http_req_duration..............: avg=412.24ms min=3.69ms  med=379.07ms max=1.65s    p(90)=813.55ms p(95)=896.3ms  p(99.9)=1.3s    
       { expected_response:true }...: avg=412.24ms min=3.69ms  med=379.07ms max=1.65s    p(90)=813.55ms p(95)=896.3ms  p(99.9)=1.3s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 34803
     http_req_receiving.............: avg=247.06µs min=34.15µs med=80.25µs  max=287.12ms p(90)=116.8µs  p(95)=130.59µs p(99.9)=30.42ms 
     http_req_sending...............: avg=28.03µs  min=5.28µs  med=14.48µs  max=59.35ms  p(90)=21.75µs  p(95)=25.07µs  p(99.9)=3.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=411.96ms min=3.63ms  med=378.83ms max=1.65s    p(90)=813.46ms p(95)=896.17ms p(99.9)=1.3s    
     http_reqs......................: 34803   538.308041/s
     iteration_duration.............: avg=424.69ms min=7.89ms  med=395.44ms max=1.66s    p(90)=818.84ms p(95)=899.38ms p(99.9)=1.3s    
     iterations.....................: 33803   522.840752/s
     success_rate...................: 100.00% ✓ 33803      ✗ 0    
     vus............................: 88      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 46812      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=15.21µs  min=1.32µs  med=3.89µs   max=10.96ms p(90)=5.86µs  p(95)=7.55µs   p(99.9)=2.34ms
     http_req_connecting............: avg=9.34µs   min=0s      med=0s       max=10.9ms  p(90)=0s      p(95)=0s       p(99.9)=2.21ms
     http_req_duration..............: avg=876.42ms min=5.9ms   med=797.12ms max=5.16s   p(90)=1.74s   p(95)=1.95s    p(99.9)=3.84s 
       { expected_response:true }...: avg=876.42ms min=5.9ms   med=797.12ms max=5.16s   p(90)=1.74s   p(95)=1.95s    p(99.9)=3.84s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16604
     http_req_receiving.............: avg=110.98µs min=36.98µs med=101.15µs max=49.86ms p(90)=140.2µs p(95)=152.68µs p(99.9)=1.3ms 
     http_req_sending...............: avg=34.48µs  min=6.64µs  med=18.43µs  max=28.25ms p(90)=24.77µs p(95)=29.42µs  p(99.9)=4.29ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=876.27ms min=5.8ms   med=796.71ms max=5.16s   p(90)=1.74s   p(95)=1.95s    p(99.9)=3.84s 
     http_reqs......................: 16604   245.211189/s
     iteration_duration.............: avg=932.64ms min=48.33ms med=866.9ms  max=5.16s   p(90)=1.76s   p(95)=1.96s    p(99.9)=3.86s 
     iterations.....................: 15604   230.44299/s
     success_rate...................: 100.00% ✓ 15604      ✗ 0    
     vus............................: 90      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40254      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=12.78µs  min=1.25µs  med=3.52µs   max=5.09ms  p(90)=5.26µs   p(95)=6.99µs   p(99.9)=1.26ms 
     http_req_connecting............: avg=7.39µs   min=0s      med=0s       max=5.05ms  p(90)=0s       p(95)=0s       p(99.9)=1.23ms 
     http_req_duration..............: avg=1.01s    min=8.7ms   med=929.49ms max=4.2s    p(90)=2.07s    p(95)=2.17s    p(99.9)=3.67s  
       { expected_response:true }...: avg=1.01s    min=8.7ms   med=929.49ms max=4.2s    p(90)=2.07s    p(95)=2.17s    p(99.9)=3.67s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14418
     http_req_receiving.............: avg=104.62µs min=35.02µs med=94.62µs  max=38.12ms p(90)=136.41µs p(95)=149.12µs p(99.9)=749.8µs
     http_req_sending...............: avg=33.75µs  min=5.97µs  med=16.96µs  max=35.7ms  p(90)=23.17µs  p(95)=28.28µs  p(99.9)=3.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=1.01s    min=8.6ms   med=929.34ms max=4.2s    p(90)=2.07s    p(95)=2.17s    p(99.9)=3.67s  
     http_reqs......................: 14418   206.15545/s
     iteration_duration.............: avg=1.08s    min=83.13ms med=999.63ms max=4.21s   p(90)=2.07s    p(95)=2.18s    p(99.9)=3.72s  
     iterations.....................: 13418   191.856972/s
     success_rate...................: 100.00% ✓ 13418      ✗ 0    
     vus............................: 35      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

