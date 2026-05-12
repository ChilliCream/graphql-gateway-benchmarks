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
| hive-router | v0.0.49 | 2,673 | 2,789 | 2,634 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,077 | 2,123 | 2,066 | 0.9% |  |
| cosmo | 0.307.0 | 1,197 | 1,213 | 1,195 | 0.8% | non-compatible response (13 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 488 | 495 | 486 | 0.7% |  |
| hive-gateway | 2.5.25 | 227 | 231 | 226 | 0.8% |  |
| apollo-gateway | 2.13.3 | 201 | 206 | 199 | 1.0% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (40849 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (546410 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,185 | 2,287 | 2,139 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,915 | 1,958 | 1,906 | 1.0% |  |
| cosmo | 0.307.0 | 1,118 | 1,125 | 1,110 | 0.6% | non-compatible response (13 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 478 | 484 | 472 | 0.9% |  |
| hive-gateway | 2.5.25 | 229 | 232 | 226 | 0.9% |  |
| apollo-gateway | 2.13.3 | 206 | 208 | 205 | 0.5% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (15062 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (290988 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 493383      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=25.16µs  min=961ns   med=2.24µs  max=80.42ms  p(90)=3.71µs   p(95)=4.85µs   p(99.9)=7.88ms  
     http_req_connecting............: avg=22.1µs   min=0s      med=0s      max=67.6ms   p(90)=0s       p(95)=0s       p(99.9)=7.36ms  
     http_req_duration..............: avg=85.85ms  min=1.58ms  med=80.87ms max=298.12ms p(90)=164.84ms p(95)=179.53ms p(99.9)=240.84ms
       { expected_response:true }...: avg=85.85ms  min=1.58ms  med=80.87ms max=298.12ms p(90)=164.84ms p(95)=179.53ms p(99.9)=240.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165461
     http_req_receiving.............: avg=291.26µs min=28.06µs med=55.12µs max=93.42ms  p(90)=176.36µs p(95)=394.7µs  p(99.9)=33.94ms 
     http_req_sending...............: avg=84.9µs   min=5.2µs   med=9.73µs  max=195.8ms  p(90)=18.14µs  p(95)=127.49µs p(99.9)=12.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.47ms  min=1.53ms  med=80.53ms max=279.49ms p(90)=164.13ms p(95)=178.71ms p(99.9)=239.77ms
     http_reqs......................: 165461  2673.766417/s
     iteration_duration.............: avg=86.68ms  min=2.43ms  med=81.77ms max=400.35ms p(90)=165.3ms  p(95)=180.03ms p(99.9)=243.45ms
     iterations.....................: 164461  2657.606921/s
     success_rate...................: 100.00% ✓ 164461      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 388698      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=16.53µs  min=1.01µs  med=2.23µs   max=82.72ms  p(90)=3.58µs   p(95)=4.55µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=13.67µs  min=0s      med=0s       max=82.64ms  p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=108.97ms min=2.4ms   med=99.99ms  max=606.19ms p(90)=211.78ms p(95)=248.28ms p(99.9)=445.02ms
       { expected_response:true }...: avg=108.97ms min=2.4ms   med=99.99ms  max=606.19ms p(90)=211.78ms p(95)=248.28ms p(99.9)=445.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130566
     http_req_receiving.............: avg=2.01ms   min=50.09µs med=111.82µs max=334.38ms p(90)=1.27ms   p(95)=4.5ms    p(99.9)=155.83ms
     http_req_sending...............: avg=63.48µs  min=5.22µs  med=9.84µs   max=96.83ms  p(90)=18.44µs  p(95)=119.59µs p(99.9)=8.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.89ms min=2.32ms  med=98.92ms  max=583.07ms p(90)=208.01ms p(95)=239.85ms p(99.9)=398.39ms
     http_reqs......................: 130566  2077.389293/s
     iteration_duration.............: avg=110.1ms  min=3.44ms  med=101.19ms max=622.81ms p(90)=212.46ms p(95)=249.02ms p(99.9)=445.52ms
     iterations.....................: 129566  2061.478648/s
     success_rate...................: 100.00% ✓ 129566      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 221538      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.36µs   min=1.12µs  med=2.48µs   max=22.22ms  p(90)=4.12µs   p(95)=5.06µs   p(99.9)=530.84µs
     http_req_connecting............: avg=3.19µs   min=0s      med=0s       max=22.17ms  p(90)=0s       p(95)=0s       p(99.9)=469.56µs
     http_req_duration..............: avg=190.64ms min=2.01ms  med=191.97ms max=640.27ms p(90)=353.03ms p(95)=378.39ms p(99.9)=456.36ms
       { expected_response:true }...: avg=190.64ms min=2.01ms  med=191.97ms max=640.27ms p(90)=353.03ms p(95)=378.39ms p(99.9)=456.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74846
     http_req_receiving.............: avg=86.44µs  min=30.04µs med=62.35µs  max=119.07ms p(90)=98.36µs  p(95)=115.41µs p(99.9)=2.31ms  
     http_req_sending...............: avg=37.26µs  min=5.44µs  med=10.83µs  max=178.17ms p(90)=17.45µs  p(95)=21.48µs  p(99.9)=4.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.52ms min=1.96ms  med=191.83ms max=640.18ms p(90)=352.91ms p(95)=378.3ms  p(99.9)=456.29ms
     http_reqs......................: 74846   1197.065825/s
     iteration_duration.............: avg=193.47ms min=4.87ms  med=195.45ms max=640.49ms p(90)=353.93ms p(95)=379.15ms p(99.9)=456.75ms
     iterations.....................: 73846   1181.072107/s
     success_rate...................: 100.00% ✓ 73846       ✗ 0    
     vus............................: 80      min=0         max=496
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 92124      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   586 kB/s
     http_req_blocked...............: avg=13.98µs  min=1.18µs  med=3.04µs   max=16.38ms p(90)=4.88µs   p(95)=5.94µs   p(99.9)=3.4ms   
     http_req_connecting............: avg=9.06µs   min=0s      med=0s       max=16.31ms p(90)=0s       p(95)=0s       p(99.9)=2.82ms  
     http_req_duration..............: avg=453.06ms min=4.05ms  med=419.44ms max=1.67s   p(90)=897.48ms p(95)=976.49ms p(99.9)=1.42s   
       { expected_response:true }...: avg=453.06ms min=4.05ms  med=419.44ms max=1.67s   p(90)=897.48ms p(95)=976.49ms p(99.9)=1.42s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31708
     http_req_receiving.............: avg=91.53µs  min=30.18µs med=77.47µs  max=86.89ms p(90)=114.09µs p(95)=128.3µs  p(99.9)=941.36µs
     http_req_sending...............: avg=28.42µs  min=5.61µs  med=13.23µs  max=35.93ms p(90)=20.76µs  p(95)=24.26µs  p(99.9)=3.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=452.94ms min=3.95ms  med=419.33ms max=1.67s   p(90)=897.3ms  p(95)=976.42ms p(99.9)=1.42s   
     http_reqs......................: 31708   488.432508/s
     iteration_duration.............: avg=468.03ms min=15.84ms med=437.3ms  max=1.67s   p(90)=902.36ms p(95)=980.66ms p(99.9)=1.42s   
     iterations.....................: 30708   473.02843/s
     success_rate...................: 100.00% ✓ 30708      ✗ 0    
     vus............................: 53      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 43382      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=17.32µs  min=1.16µs  med=3.59µs   max=24.95ms p(90)=5.35µs   p(95)=6.89µs   p(99.9)=2.75ms  
     http_req_connecting............: avg=11.98µs  min=0s      med=0s       max=24.87ms p(90)=0s       p(95)=0s       p(99.9)=2.73ms  
     http_req_duration..............: avg=913.07ms min=6.14ms  med=808.23ms max=18.98s  p(90)=1.59s    p(95)=1.73s    p(99.9)=16.33s  
       { expected_response:true }...: avg=913.07ms min=6.14ms  med=808.23ms max=18.98s  p(90)=1.59s    p(95)=1.73s    p(99.9)=16.33s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15461
     http_req_receiving.............: avg=106.2µs  min=33.87µs med=94.56µs  max=41.77ms p(90)=133.81µs p(95)=147.08µs p(99.9)=987.64µs
     http_req_sending...............: avg=30.71µs  min=6.43µs  med=17.42µs  max=26.82ms p(90)=23.61µs  p(95)=28.81µs  p(99.9)=2.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=912.94ms min=6.05ms  med=808.08ms max=18.98s  p(90)=1.59s    p(95)=1.73s    p(99.9)=16.33s  
     http_reqs......................: 15461   227.446454/s
     iteration_duration.............: avg=975.2ms  min=25.23ms med=881.96ms max=18.98s  p(90)=1.61s    p(95)=1.73s    p(99.9)=16.53s  
     iterations.....................: 14460   212.720764/s
     success_rate...................: 100.00% ✓ 14460      ✗ 0    
     vus............................: 47      min=0        max=500
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

     checks.........................: 100.00% ✓ 41892      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   247 kB/s
     http_req_blocked...............: avg=14.1µs   min=1.22µs  med=3.44µs   max=3.48ms  p(90)=5.12µs   p(95)=6.65µs   p(99.9)=2.12ms 
     http_req_connecting............: avg=8.67µs   min=0s      med=0s       max=3.4ms   p(90)=0s       p(95)=0s       p(99.9)=1.9ms  
     http_req_duration..............: avg=478.38ms min=8.38ms  med=544.62ms max=1.42s   p(90)=847.04ms p(95)=914.29ms p(99.9)=1.27s  
       { expected_response:true }...: avg=478.38ms min=8.38ms  med=544.62ms max=1.42s   p(90)=847.04ms p(95)=914.29ms p(99.9)=1.27s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14964
     http_req_receiving.............: avg=106.64µs min=33.26µs med=91.15µs  max=69.53ms p(90)=131.37µs p(95)=144.94µs p(99.9)=966.2µs
     http_req_sending...............: avg=38.6µs   min=5.65µs  med=16.74µs  max=82.87ms p(90)=22.76µs  p(95)=27.86µs  p(99.9)=3.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=478.24ms min=8.25ms  med=544.49ms max=1.42s   p(90)=846.95ms p(95)=913.59ms p(99.9)=1.27s  
     http_reqs......................: 14964   201.528589/s
     iteration_duration.............: avg=512.55ms min=9.03ms  med=571.3ms  max=1.43s   p(90)=856.39ms p(95)=923.21ms p(99.9)=1.27s  
     iterations.....................: 13964   188.061027/s
     success_rate...................: 100.00% ✓ 13964      ✗ 0    
     vus............................: 63      min=0        max=495
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 403254      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=19.93µs  min=1.01µs  med=2.44µs   max=87.05ms  p(90)=4.11µs   p(95)=5.36µs   p(99.9)=4.54ms  
     http_req_connecting............: avg=16.69µs  min=0s      med=0s       max=86.86ms  p(90)=0s       p(95)=0s       p(99.9)=4.16ms  
     http_req_duration..............: avg=105.04ms min=1.6ms   med=100.11ms max=388.31ms p(90)=200.24ms p(95)=216.68ms p(99.9)=275.53ms
       { expected_response:true }...: avg=105.04ms min=1.6ms   med=100.11ms max=388.31ms p(90)=200.24ms p(95)=216.68ms p(99.9)=275.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135418
     http_req_receiving.............: avg=190.72µs min=28.98µs med=60.91µs  max=247.85ms p(90)=161.01µs p(95)=398.65µs p(99.9)=18.8ms  
     http_req_sending...............: avg=73.23µs  min=5.29µs  med=10.73µs  max=323.67ms p(90)=20.82µs  p(95)=134.59µs p(99.9)=9.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.78ms min=1.55ms  med=99.86ms  max=316.84ms p(90)=199.88ms p(95)=216.33ms p(99.9)=272.96ms
     http_reqs......................: 135418  2185.007658/s
     iteration_duration.............: avg=106.1ms  min=2.71ms  med=101.34ms max=409.94ms p(90)=200.78ms p(95)=217.16ms p(99.9)=277.17ms
     iterations.....................: 134418  2168.872376/s
     success_rate...................: 100.00% ✓ 134418      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 354456      ✗ 0     
     data_received..................: 10 GB   168 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=16.33µs  min=1.02µs  med=2.33µs   max=59.65ms  p(90)=4.03µs   p(95)=5.17µs   p(99.9)=2.65ms  
     http_req_connecting............: avg=13.23µs  min=0s      med=0s       max=59.59ms  p(90)=0s       p(95)=0s       p(99.9)=2.53ms  
     http_req_duration..............: avg=119.47ms min=1.79ms  med=111.59ms max=838.77ms p(90)=229.29ms p(95)=257.9ms  p(99.9)=677.72ms
       { expected_response:true }...: avg=119.47ms min=1.79ms  med=111.59ms max=838.77ms p(90)=229.29ms p(95)=257.9ms  p(99.9)=677.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119152
     http_req_receiving.............: avg=1.34ms   min=52.28µs med=114.12µs max=321.21ms p(90)=1.54ms   p(95)=3.73ms   p(99.9)=140.94ms
     http_req_sending...............: avg=62.38µs  min=5.22µs  med=9.93µs   max=121.8ms  p(90)=19.89µs  p(95)=120.43µs p(99.9)=8.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.06ms min=1.69ms  med=110.56ms max=838.65ms p(90)=227.01ms p(95)=254.1ms  p(99.9)=676.37ms
     http_reqs......................: 119152  1915.317779/s
     iteration_duration.............: avg=120.77ms min=3.26ms  med=112.98ms max=838.97ms p(90)=229.97ms p(95)=258.57ms p(99.9)=678.3ms 
     iterations.....................: 118152  1899.243203/s
     success_rate...................: 100.00% ✓ 118152      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 207186      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.59µs   min=1.17µs  med=2.79µs   max=13.84ms  p(90)=4.54µs   p(95)=5.52µs   p(99.9)=651.14µs
     http_req_connecting............: avg=4.1µs    min=0s      med=0s       max=13.78ms  p(90)=0s       p(95)=0s       p(99.9)=588.19µs
     http_req_duration..............: avg=203.74ms min=2.11ms  med=204.4ms  max=655.91ms p(90)=375.62ms p(95)=405.39ms p(99.9)=572.64ms
       { expected_response:true }...: avg=203.74ms min=2.11ms  med=204.4ms  max=655.91ms p(90)=375.62ms p(95)=405.39ms p(99.9)=572.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70062
     http_req_receiving.............: avg=86.02µs  min=29.46µs med=67.4µs   max=130.59ms p(90)=104.84µs p(95)=121.29µs p(99.9)=1.9ms   
     http_req_sending...............: avg=32.89µs  min=5.52µs  med=11.99µs  max=83.13ms  p(90)=19.06µs  p(95)=23.06µs  p(99.9)=3.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.62ms min=2.01ms  med=204.26ms max=655.85ms p(90)=375.52ms p(95)=405.31ms p(99.9)=572.57ms
     http_reqs......................: 70062   1118.256219/s
     iteration_duration.............: avg=206.95ms min=5.07ms  med=208ms    max=656.05ms p(90)=376.62ms p(95)=406.22ms p(99.9)=573.24ms
     iterations.....................: 69062   1102.295267/s
     success_rate...................: 100.00% ✓ 69062       ✗ 0    
     vus............................: 87      min=0         max=499
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 90588      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   574 kB/s
     http_req_blocked...............: avg=8.94µs   min=1.25µs  med=3.12µs   max=4.31ms   p(90)=4.94µs   p(95)=5.94µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=4.74µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=1.05ms  
     http_req_duration..............: avg=460.43ms min=4.16ms  med=426.67ms max=1.99s    p(90)=907.94ms p(95)=981.49ms p(99.9)=1.5s    
       { expected_response:true }...: avg=460.43ms min=4.16ms  med=426.67ms max=1.99s    p(90)=907.94ms p(95)=981.49ms p(99.9)=1.5s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 31196
     http_req_receiving.............: avg=93.84µs  min=32.37µs med=81.89µs  max=120.26ms p(90)=118.65µs p(95)=132.41µs p(99.9)=996.45µs
     http_req_sending...............: avg=30.19µs  min=5.66µs  med=14.51µs  max=120.09ms p(90)=21.72µs  p(95)=24.93µs  p(99.9)=2.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=460.31ms min=4.06ms  med=426.57ms max=1.99s    p(90)=907.85ms p(95)=981.4ms  p(99.9)=1.5s    
     http_reqs......................: 31196   478.458013/s
     iteration_duration.............: avg=475.88ms min=19.37ms med=443.84ms max=1.99s    p(90)=911.67ms p(95)=984.31ms p(99.9)=1.5s    
     iterations.....................: 30196   463.120854/s
     success_rate...................: 100.00% ✓ 30196      ✗ 0    
     vus............................: 69      min=0        max=496
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 43899      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=18.13µs  min=1.18µs  med=3.79µs   max=50.02ms p(90)=5.72µs   p(95)=7.45µs   p(99.9)=2.67ms 
     http_req_connecting............: avg=12.62µs  min=0s      med=0s       max=49.96ms p(90)=0s       p(95)=0s       p(99.9)=2.64ms 
     http_req_duration..............: avg=933ms    min=6.27ms  med=848.88ms max=5.18s   p(90)=1.82s    p(95)=2s       p(99.9)=4.75s  
       { expected_response:true }...: avg=933ms    min=6.27ms  med=848.88ms max=5.18s   p(90)=1.82s    p(95)=2s       p(99.9)=4.75s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15633
     http_req_receiving.............: avg=103.47µs min=36.18µs med=97.76µs  max=3.27ms  p(90)=137.13µs p(95)=149.76µs p(99.9)=967.3µs
     http_req_sending...............: avg=33.41µs  min=6.1µs   med=18.35µs  max=40.77ms p(90)=24.26µs  p(95)=29.31µs  p(99.9)=3.16ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=932.86ms min=6.16ms  med=848.75ms max=5.18s   p(90)=1.82s    p(95)=2s       p(99.9)=4.75s  
     http_reqs......................: 15633   229.633803/s
     iteration_duration.............: avg=996.74ms min=54.7ms  med=936.37ms max=5.18s   p(90)=1.86s    p(95)=2.05s    p(99.9)=4.77s  
     iterations.....................: 14633   214.94476/s
     success_rate...................: 100.00% ✓ 14633      ✗ 0    
     vus............................: 59      min=0        max=499
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

     checks.........................: 100.00% ✓ 40329      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=13.97µs min=1.23µs  med=3.55µs  max=6.22ms p(90)=5.3µs    p(95)=7.01µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=8.72µs  min=0s      med=0s      max=6.14ms p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=1s      min=8.75ms  med=921ms   max=3.91s  p(90)=2.03s    p(95)=2.19s    p(99.9)=3.56s   
       { expected_response:true }...: avg=1s      min=8.75ms  med=921ms   max=3.91s  p(90)=2.03s    p(95)=2.19s    p(99.9)=3.56s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14443
     http_req_receiving.............: avg=99.93µs min=35.53µs med=93.99µs max=3.94ms p(90)=133.32µs p(95)=146.11µs p(99.9)=804.17µs
     http_req_sending...............: avg=41.26µs min=6.04µs  med=17.08µs max=91.2ms p(90)=22.96µs  p(95)=27.77µs  p(99.9)=4.12ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s      min=8.63ms  med=920.9ms max=3.91s  p(90)=2.03s    p(95)=2.19s    p(99.9)=3.56s   
     http_reqs......................: 14443   206.914871/s
     iteration_duration.............: avg=1.08s   min=63.76ms med=1.02s   max=3.91s  p(90)=2.04s    p(95)=2.2s     p(99.9)=3.6s    
     iterations.....................: 13443   192.588563/s
     success_rate...................: 100.00% ✓ 13443      ✗ 0    
     vus............................: 99      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

