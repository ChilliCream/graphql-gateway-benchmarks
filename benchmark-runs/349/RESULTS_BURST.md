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
| hive-router | v0.0.84 | 2,709 | 2,875 | 2,682 | 2.5% |  |
| fusion | 16.6.6 | 2,550 | 2,677 | 2,517 | 2.1% |  |
| fusion-nightly | 16.7.0-p.6 | 2,547 | 2,669 | 2,527 | 1.9% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,490 | 2,609 | 2,479 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,434 | 2,512 | 2,418 | 1.2% |  |
| cosmo | 0.334.0 | 1,197 | 1,241 | 1,187 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 559 | 571 | 556 | 0.8% |  |
| hive-gateway | 2.10.8 | 257 | 262 | 254 | 1.2% |  |
| apollo-gateway | 2.14.3 | 228 | 235 | 227 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (7487 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (501015 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.6 | 2,415 | 2,526 | 2,408 | 1.7% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,413 | 2,491 | 2,383 | 1.8% |  |
| fusion-nightly | 16.7.0-p.6 | 2,345 | 2,468 | 2,331 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,163 | 2,258 | 2,139 | 1.8% |  |
| hive-router | v0.0.84 | 2,162 | 2,320 | 2,140 | 2.9% |  |
| cosmo | 0.334.0 | 1,161 | 1,200 | 1,157 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 526 | 543 | 523 | 1.3% |  |
| hive-gateway | 2.10.8 | 246 | 254 | 243 | 1.3% |  |
| apollo-gateway | 2.14.3 | 233 | 239 | 233 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (17711 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (281928 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 497895      ✗ 0     
     data_received..................: 15 GB   238 MB/s
     data_sent......................: 201 MB  3.3 MB/s
     http_req_blocked...............: avg=19.86µs  min=1.03µs  med=2.6µs   max=58.55ms  p(90)=4.2µs    p(95)=5.32µs   p(99.9)=2.6ms   
     http_req_connecting............: avg=16.45µs  min=0s      med=0s      max=58.39ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=85.14ms  min=1.4ms   med=79.9ms  max=300.9ms  p(90)=164.77ms p(95)=178.19ms p(99.9)=227.9ms 
       { expected_response:true }...: avg=85.14ms  min=1.4ms   med=79.9ms  max=300.9ms  p(90)=164.77ms p(95)=178.19ms p(99.9)=227.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 166965
     http_req_receiving.............: avg=135.56µs min=25.29µs med=51.42µs max=144.59ms p(90)=140.73µs p(95)=340.26µs p(99.9)=14.8ms  
     http_req_sending...............: avg=64.68µs  min=4.52µs  med=9.67µs  max=103.38ms p(90)=18.04µs  p(95)=120.91µs p(99.9)=8.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.94ms  min=1.34ms  med=79.71ms max=291.72ms p(90)=164.53ms p(95)=177.89ms p(99.9)=226.44ms
     http_reqs......................: 166965  2709.631641/s
     iteration_duration.............: avg=85.9ms   min=2.02ms  med=80.74ms max=338ms    p(90)=165.23ms p(95)=178.65ms p(99.9)=229.02ms
     iterations.....................: 165965  2693.4029/s
     success_rate...................: 100.00% ✓ 165965      ✗ 0     
     vus............................: 85      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 474297      ✗ 0     
     data_received..................: 14 GB   224 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=18.66µs min=881ns   med=2.1µs   max=73.56ms  p(90)=3.52µs   p(95)=4.62µs   p(99.9)=2.28ms  
     http_req_connecting............: avg=15.75µs min=0s      med=0s      max=73.4ms   p(90)=0s       p(95)=0s       p(99.9)=2.22ms  
     http_req_duration..............: avg=89.41ms min=1.97ms  med=79.59ms max=1.84s    p(90)=170.47ms p(95)=197.31ms p(99.9)=755.08ms
       { expected_response:true }...: avg=89.41ms min=1.97ms  med=79.59ms max=1.84s    p(90)=170.47ms p(95)=197.31ms p(99.9)=755.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159099
     http_req_receiving.............: avg=1.25ms  min=48.66µs med=94.85µs max=820.33ms p(90)=1.45ms   p(95)=4.04ms   p(99.9)=82.21ms 
     http_req_sending...............: avg=64.67µs min=4.72µs  med=8.91µs  max=122.29ms p(90)=17.4µs   p(95)=103.85µs p(99.9)=8.53ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.09ms min=1.86ms  med=78.47ms max=1.84s    p(90)=168.53ms p(95)=194.17ms p(99.9)=742.66ms
     http_reqs......................: 159099  2550.182696/s
     iteration_duration.............: avg=90.22ms min=3.08ms  med=80.49ms max=1.84s    p(90)=171.04ms p(95)=197.91ms p(99.9)=757.05ms
     iterations.....................: 158099  2534.153791/s
     success_rate...................: 100.00% ✓ 158099      ✗ 0     
     vus............................: 76      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 473430      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=22.34µs min=902ns  med=2.53µs  max=80.05ms  p(90)=4.16µs   p(95)=5.32µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=18.75µs min=0s     med=0s      max=79.93ms  p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=89.54ms min=1.91ms med=76.42ms max=1.3s     p(90)=172.01ms p(95)=199.23ms p(99.9)=629.83ms
       { expected_response:true }...: avg=89.54ms min=1.91ms med=76.42ms max=1.3s     p(90)=172.01ms p(95)=199.23ms p(99.9)=629.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158810
     http_req_receiving.............: avg=1.46ms  min=51.1µs med=97.74µs max=907.07ms p(90)=1.54ms   p(95)=4.39ms   p(99.9)=94.76ms 
     http_req_sending...............: avg=72.54µs min=4.58µs med=9.52µs  max=277.87ms p(90)=18µs     p(95)=113.43µs p(99.9)=9.53ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.01ms min=1.85ms med=75.09ms max=1.3s     p(90)=169.8ms  p(95)=196.5ms  p(99.9)=623.88ms
     http_reqs......................: 158810  2547.350377/s
     iteration_duration.............: avg=90.38ms min=3.65ms med=77.32ms max=1.3s     p(90)=172.64ms p(95)=199.89ms p(99.9)=630.09ms
     iterations.....................: 157810  2531.310137/s
     success_rate...................: 100.00% ✓ 157810      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 461682      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=13.33µs min=862ns   med=2.04µs   max=52.28ms  p(90)=3.49µs   p(95)=4.54µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=10.36µs min=0s      med=0s       max=52.2ms   p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=91.81ms min=1.9ms   med=87.32ms  max=324.66ms p(90)=175.17ms p(95)=190.58ms p(99.9)=251.85ms
       { expected_response:true }...: avg=91.81ms min=1.9ms   med=87.32ms  max=324.66ms p(90)=175.17ms p(95)=190.58ms p(99.9)=251.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154894
     http_req_receiving.............: avg=1.46ms  min=51.76µs med=250.36µs max=245.14ms p(90)=3.42ms   p(95)=5.23ms   p(99.9)=36.79ms 
     http_req_sending...............: avg=57.92µs min=4.38µs  med=8.58µs   max=237.13ms p(90)=16.95µs  p(95)=100.53µs p(99.9)=7.6ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.29ms min=1.82ms  med=85.64ms  max=324.58ms p(90)=173.49ms p(95)=188.86ms p(99.9)=250.97ms
     http_reqs......................: 154894  2490.410428/s
     iteration_duration.............: avg=92.64ms min=3.52ms  med=88.26ms  max=339.8ms  p(90)=175.62ms p(95)=190.99ms p(99.9)=252.77ms
     iterations.....................: 153894  2474.332268/s
     success_rate...................: 100.00% ✓ 153894      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 449823      ✗ 0     
     data_received..................: 13 GB   214 MB/s
     data_sent......................: 181 MB  2.9 MB/s
     http_req_blocked...............: avg=19.61µs min=971ns  med=2.6µs   max=93.57ms  p(90)=4.21µs   p(95)=5.35µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=15.98µs min=0s     med=0s      max=93.47ms  p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=94.31ms min=1.62ms med=80.59ms max=1.41s    p(90)=178.8ms  p(95)=210.56ms p(99.9)=888.19ms
       { expected_response:true }...: avg=94.31ms min=1.62ms med=80.59ms max=1.41s    p(90)=178.8ms  p(95)=210.56ms p(99.9)=888.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150941
     http_req_receiving.............: avg=1.49ms  min=51.7µs med=100.4µs max=1.25s    p(90)=1.53ms   p(95)=4.22ms   p(99.9)=86.86ms 
     http_req_sending...............: avg=71.05µs min=4.52µs med=9.69µs  max=243.25ms p(90)=18.38µs  p(95)=116.42µs p(99.9)=9.47ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.74ms min=1.54ms med=79.42ms max=1.41s    p(90)=177.04ms p(95)=207.47ms p(99.9)=788.02ms
     http_reqs......................: 150941  2434.186299/s
     iteration_duration.............: avg=95.2ms  min=2.51ms med=81.55ms max=1.41s    p(90)=179.41ms p(95)=211.47ms p(99.9)=888.44ms
     iterations.....................: 149941  2418.059559/s
     success_rate...................: 100.00% ✓ 149941      ✗ 0     
     vus............................: 58      min=0         max=498 
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

     checks.........................: 100.00% ✓ 221322      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.59µs   min=1µs    med=2.17µs   max=22.82ms  p(90)=3.72µs   p(95)=4.61µs   p(99.9)=547.98µs
     http_req_connecting............: avg=2.73µs   min=0s     med=0s       max=22.75ms  p(90)=0s       p(95)=0s       p(99.9)=489.02µs
     http_req_duration..............: avg=190.83ms min=1.91ms med=190.2ms  max=487.69ms p(90)=355.73ms p(95)=380.46ms p(99.9)=445.55ms
       { expected_response:true }...: avg=190.83ms min=1.91ms med=190.2ms  max=487.69ms p(90)=355.73ms p(95)=380.46ms p(99.9)=445.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74774
     http_req_receiving.............: avg=70.63µs  min=27µs   med=57.24µs  max=77.05ms  p(90)=94.58µs  p(95)=110.26µs p(99.9)=986.87µs
     http_req_sending...............: avg=31.82µs  min=4.67µs med=9.74µs   max=213.4ms  p(90)=16.05µs  p(95)=19.9µs   p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.72ms min=1.86ms med=190.08ms max=487.63ms p(90)=355.65ms p(95)=380.39ms p(99.9)=445.49ms
     http_reqs......................: 74774   1197.056576/s
     iteration_duration.............: avg=193.65ms min=5.16ms med=193.52ms max=487.89ms p(90)=356.48ms p(95)=380.98ms p(99.9)=445.81ms
     iterations.....................: 73774   1181.047581/s
     success_rate...................: 100.00% ✓ 73774       ✗ 0    
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

     checks.........................: 100.00% ✓ 104937     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   671 kB/s
     http_req_blocked...............: avg=7.65µs   min=1.13µs  med=3.05µs   max=16.69ms  p(90)=4.75µs   p(95)=5.77µs   p(99.9)=669.12µs
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=16.63ms  p(90)=0s       p(95)=0s       p(99.9)=601.07µs
     http_req_duration..............: avg=398.67ms min=3.57ms  med=373.16ms max=1.57s    p(90)=789.96ms p(95)=852.1ms  p(99.9)=1.27s   
       { expected_response:true }...: avg=398.67ms min=3.57ms  med=373.16ms max=1.57s    p(90)=789.96ms p(95)=852.1ms  p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35979
     http_req_receiving.............: avg=86.78µs  min=28.29µs med=70.76µs  max=140.65ms p(90)=109.63µs p(95)=124.87µs p(99.9)=986.89µs
     http_req_sending...............: avg=28.9µs   min=5.21µs  med=14.03µs  max=56.11ms  p(90)=21.41µs  p(95)=24.42µs  p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=398.55ms min=3.52ms  med=373.09ms max=1.57s    p(90)=789.87ms p(95)=852ms    p(99.9)=1.27s   
     http_reqs......................: 35979   559.285653/s
     iteration_duration.............: avg=410.3ms  min=28.8ms  med=387.7ms  max=1.58s    p(90)=792.98ms p(95)=854.54ms p(99.9)=1.28s   
     iterations.....................: 34979   543.740873/s
     success_rate...................: 100.00% ✓ 34979      ✗ 0    
     vus............................: 71      min=0        max=495
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

     checks.........................: 100.00% ✓ 48831      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=26µs     min=1.51µs  med=3.78µs   max=10.5ms  p(90)=5.68µs   p(95)=7.12µs   p(99.9)=7.74ms
     http_req_connecting............: avg=20.21µs  min=0s      med=0s       max=10.43ms p(90)=0s       p(95)=0s       p(99.9)=7.69ms
     http_req_duration..............: avg=829.04ms min=5.44ms  med=730.8ms  max=17.65s  p(90)=1.43s    p(95)=1.64s    p(99.9)=16.13s
       { expected_response:true }...: avg=829.04ms min=5.44ms  med=730.8ms  max=17.65s  p(90)=1.43s    p(95)=1.64s    p(99.9)=16.13s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17277
     http_req_receiving.............: avg=104.46µs min=40.35µs med=95.29µs  max=31.09ms p(90)=133.11µs p(95)=148.91µs p(99.9)=1.44ms
     http_req_sending...............: avg=33.22µs  min=7.22µs  med=19.18µs  max=31.64ms p(90)=25.18µs  p(95)=29.34µs  p(99.9)=2.67ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=828.9ms  min=5.34ms  med=730.7ms  max=17.65s  p(90)=1.43s    p(95)=1.64s    p(99.9)=16.13s
     http_reqs......................: 17277   257.148418/s
     iteration_duration.............: avg=880.01ms min=43.44ms med=783.49ms max=17.65s  p(90)=1.46s    p(95)=1.65s    p(99.9)=16.2s 
     iterations.....................: 16277   242.264559/s
     success_rate...................: 100.00% ✓ 16277      ✗ 0    
     vus............................: 63      min=0        max=497
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

     checks.........................: 100.00% ✓ 47151      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   280 kB/s
     http_req_blocked...............: avg=19.61µs  min=1.13µs  med=3µs      max=80.42ms p(90)=4.54µs   p(95)=5.84µs   p(99.9)=2.41ms  
     http_req_connecting............: avg=10.19µs  min=0s      med=0s       max=9.85ms  p(90)=0s       p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=380.91ms min=7.65ms  med=444.16ms max=1.13s   p(90)=660.11ms p(95)=699.07ms p(99.9)=995.22ms
       { expected_response:true }...: avg=380.91ms min=7.65ms  med=444.16ms max=1.13s   p(90)=660.11ms p(95)=699.07ms p(99.9)=995.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16717
     http_req_receiving.............: avg=89.84µs  min=30.71µs med=79.59µs  max=70.44ms p(90)=117.39µs p(95)=131.03µs p(99.9)=834.78µs
     http_req_sending...............: avg=38.3µs   min=5.47µs  med=15.78µs  max=81.46ms p(90)=20.85µs  p(95)=25.15µs  p(99.9)=3.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=380.79ms min=7.54ms  med=444.02ms max=1.13s   p(90)=660.02ms p(95)=698.99ms p(99.9)=995.06ms
     http_reqs......................: 16717   228.190805/s
     iteration_duration.............: avg=405.11ms min=8.23ms  med=456.49ms max=1.13s   p(90)=667.22ms p(95)=702.4ms  p(99.9)=1s      
     iterations.....................: 15717   214.54058/s
     success_rate...................: 100.00% ✓ 15717      ✗ 0    
     vus............................: 61      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 445695      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=24.31µs min=1.02µs  med=2.86µs   max=74.92ms  p(90)=4.66µs   p(95)=5.89µs   p(99.9)=2.46ms  
     http_req_connecting............: avg=20.14µs min=0s      med=0s       max=74.74ms  p(90)=0s       p(95)=0s       p(99.9)=2.42ms  
     http_req_duration..............: avg=95.07ms min=1.5ms   med=83.39ms  max=2.83s    p(90)=179.94ms p(95)=208.13ms p(99.9)=703.47ms
       { expected_response:true }...: avg=95.07ms min=1.5ms   med=83.39ms  max=2.83s    p(90)=179.94ms p(95)=208.13ms p(99.9)=703.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149565
     http_req_receiving.............: avg=1.24ms  min=52.95µs med=106.57µs max=945.56ms p(90)=1.46ms   p(95)=3.74ms   p(99.9)=94.13ms 
     http_req_sending...............: avg=81.82µs min=4.73µs  med=10.54µs  max=159.55ms p(90)=21.1µs   p(95)=124.51µs p(99.9)=11.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.74ms min=1.42ms  med=82.21ms  max=2.83s    p(90)=178.42ms p(95)=206.04ms p(99.9)=701.87ms
     http_reqs......................: 149565  2415.633649/s
     iteration_duration.............: avg=96.01ms min=2.7ms   med=84.5ms   max=2.83s    p(90)=180.6ms  p(95)=208.88ms p(99.9)=704.48ms
     iterations.....................: 148565  2399.482587/s
     success_rate...................: 100.00% ✓ 148565      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 444609      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=29.2µs  min=842ns   med=2.26µs   max=206.85ms p(90)=4.07µs   p(95)=5.26µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=25.79µs min=0s      med=0s       max=206.8ms  p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=95.3ms  min=1.45ms  med=90.5ms   max=408.35ms p(90)=181.21ms p(95)=197.42ms p(99.9)=273.48ms
       { expected_response:true }...: avg=95.3ms  min=1.45ms  med=90.5ms   max=408.35ms p(90)=181.21ms p(95)=197.42ms p(99.9)=273.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149203
     http_req_receiving.............: avg=1.43ms  min=52.64µs med=153.74µs max=153.63ms p(90)=3.4ms    p(95)=5.31ms   p(99.9)=41.2ms  
     http_req_sending...............: avg=75.17µs min=4.77µs  med=9.31µs   max=199.05ms p(90)=21.21µs  p(95)=108.55µs p(99.9)=8.71ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.8ms  min=1.37ms  med=88.91ms  max=408.27ms p(90)=179.69ms p(95)=195.79ms p(99.9)=270.29ms
     http_reqs......................: 149203  2413.877432/s
     iteration_duration.............: avg=96.21ms min=4.15ms  med=91.44ms  max=408.51ms p(90)=181.68ms p(95)=197.99ms p(99.9)=275.3ms 
     iterations.....................: 148203  2397.698954/s
     success_rate...................: 100.00% ✓ 148203      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432744      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=16.72µs min=871ns   med=2.23µs   max=112.13ms p(90)=3.81µs   p(95)=4.93µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=13.58µs min=0s      med=0s       max=111.97ms p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=97.9ms  min=1.59ms  med=85.79ms  max=1.05s    p(90)=188.51ms p(95)=220.29ms p(99.9)=586.08ms
       { expected_response:true }...: avg=97.9ms  min=1.59ms  med=85.79ms  max=1.05s    p(90)=188.51ms p(95)=220.29ms p(99.9)=586.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145248
     http_req_receiving.............: avg=1.98ms  min=53.84µs med=110.11µs max=473.29ms p(90)=2.31ms   p(95)=6.38ms   p(99.9)=98.03ms 
     http_req_sending...............: avg=65.89µs min=4.85µs  med=9.33µs   max=108.9ms  p(90)=18.95µs  p(95)=101.88µs p(99.9)=9.14ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.85ms min=1.48ms  med=84.51ms  max=1.05s    p(90)=184.84ms p(95)=213.21ms p(99.9)=566.6ms 
     http_reqs......................: 145248  2345.700346/s
     iteration_duration.............: avg=98.9ms  min=3.22ms  med=86.97ms  max=1.05s    p(90)=189.17ms p(95)=221.17ms p(99.9)=586.77ms
     iterations.....................: 144248  2329.550724/s
     success_rate...................: 100.00% ✓ 144248      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 400620      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=15.51µs  min=932ns   med=2.3µs    max=79.87ms  p(90)=3.96µs   p(95)=5.11µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=12.5µs   min=0s      med=0s       max=79.7ms   p(90)=0s       p(95)=0s       p(99.9)=974.56µs
     http_req_duration..............: avg=105.79ms min=1.71ms  med=92.52ms  max=1.01s    p(90)=201.16ms p(95)=232.64ms p(99.9)=623.99ms
       { expected_response:true }...: avg=105.79ms min=1.71ms  med=92.52ms  max=1.01s    p(90)=201.16ms p(95)=232.64ms p(99.9)=623.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134540
     http_req_receiving.............: avg=1.59ms   min=54.04µs med=112.77µs max=513.16ms p(90)=2.01ms   p(95)=5.13ms   p(99.9)=97.89ms 
     http_req_sending...............: avg=62.56µs  min=4.79µs  med=9.58µs   max=191.82ms p(90)=18.86µs  p(95)=98.78µs  p(99.9)=8.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.13ms min=1.61ms  med=91.29ms  max=1s       p(90)=199.22ms p(95)=228.21ms p(99.9)=617.42ms
     http_reqs......................: 134540  2163.013768/s
     iteration_duration.............: avg=106.83ms min=3.34ms  med=93.69ms  max=1.01s    p(90)=201.82ms p(95)=233.29ms p(99.9)=624.21ms
     iterations.....................: 133540  2146.936663/s
     success_rate...................: 100.00% ✓ 133540      ✗ 0     
     vus............................: 68      min=0         max=496 
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

     checks.........................: 100.00% ✓ 399837      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=15.31µs  min=1.08µs  med=3.02µs   max=46.7ms   p(90)=4.89µs   p(95)=6.18µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=11.3µs   min=0s      med=0s       max=46.62ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=105.95ms min=1.63ms  med=101.36ms max=303.65ms p(90)=205.2ms  p(95)=221.05ms p(99.9)=265.81ms
       { expected_response:true }...: avg=105.95ms min=1.63ms  med=101.36ms max=303.65ms p(90)=205.2ms  p(95)=221.05ms p(99.9)=265.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134279
     http_req_receiving.............: avg=119.28µs min=28.18µs med=60.88µs  max=36.23ms  p(90)=125.55µs p(95)=366.82µs p(99.9)=7.83ms  
     http_req_sending...............: avg=61.59µs  min=5.12µs  med=11.95µs  max=116.73ms p(90)=22.33µs  p(95)=133.09µs p(99.9)=7.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.77ms min=1.54ms  med=101.16ms max=290.1ms  p(90)=204.98ms p(95)=220.81ms p(99.9)=265.3ms 
     http_reqs......................: 134279  2162.940249/s
     iteration_duration.............: avg=107.01ms min=3.39ms  med=102.63ms max=355.52ms p(90)=205.67ms p(95)=221.53ms p(99.9)=266.68ms
     iterations.....................: 133279  2146.832442/s
     success_rate...................: 100.00% ✓ 133279      ✗ 0     
     vus............................: 61      min=0         max=497 
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

     checks.........................: 100.00% ✓ 215169      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.77µs   min=1.12µs  med=3.09µs   max=19.02ms  p(90)=4.92µs   p(95)=5.91µs   p(99.9)=753.33µs
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=18.82ms  p(90)=0s       p(95)=0s       p(99.9)=682.55µs
     http_req_duration..............: avg=196.22ms min=2.03ms  med=197.67ms max=538.55ms p(90)=362.36ms p(95)=388.89ms p(99.9)=468.89ms
       { expected_response:true }...: avg=196.22ms min=2.03ms  med=197.67ms max=538.55ms p(90)=362.36ms p(95)=388.89ms p(99.9)=468.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72723
     http_req_receiving.............: avg=85.49µs  min=28.93µs med=67.35µs  max=148.86ms p(90)=108.87µs p(95)=124.68µs p(99.9)=1.28ms  
     http_req_sending...............: avg=30.55µs  min=5.11µs  med=12.94µs  max=72.36ms  p(90)=20.6µs   p(95)=24.54µs  p(99.9)=3.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.1ms  min=1.97ms  med=197.58ms max=538.48ms p(90)=362.26ms p(95)=388.79ms p(99.9)=468.81ms
     http_reqs......................: 72723   1161.968274/s
     iteration_duration.............: avg=199.2ms  min=5.49ms  med=200.85ms max=538.74ms p(90)=363.28ms p(95)=389.62ms p(99.9)=469.3ms 
     iterations.....................: 71723   1145.990271/s
     success_rate...................: 100.00% ✓ 71723       ✗ 0    
     vus............................: 85      min=0         max=496
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

     checks.........................: 100.00% ✓ 99096      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   632 kB/s
     http_req_blocked...............: avg=9.66µs   min=1.03µs  med=2.78µs  max=51.68ms  p(90)=4.53µs   p(95)=5.54µs   p(99.9)=1.42ms
     http_req_connecting............: avg=4.38µs   min=0s      med=0s      max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms
     http_req_duration..............: avg=421.57ms min=3.84ms  med=390.7ms max=1.79s    p(90)=830.87ms p(95)=906.49ms p(99.9)=1.34s 
       { expected_response:true }...: avg=421.57ms min=3.84ms  med=390.7ms max=1.79s    p(90)=830.87ms p(95)=906.49ms p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34032
     http_req_receiving.............: avg=94.04µs  min=29.86µs med=73.21µs max=192.54ms p(90)=113.26µs p(95)=127.85µs p(99.9)=1.15ms
     http_req_sending...............: avg=36.33µs  min=4.87µs  med=13.41µs max=195.26ms p(90)=21.05µs  p(95)=24.07µs  p(99.9)=2.41ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=421.44ms min=3.74ms  med=390.6ms max=1.79s    p(90)=830.77ms p(95)=906.42ms p(99.9)=1.34s 
     http_reqs......................: 34032   526.086949/s
     iteration_duration.............: avg=434.59ms min=24.69ms med=404.9ms max=1.8s     p(90)=834.7ms  p(95)=909.64ms p(99.9)=1.34s 
     iterations.....................: 33032   510.628352/s
     success_rate...................: 100.00% ✓ 33032      ✗ 0    
     vus............................: 89      min=0        max=500
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

     checks.........................: 100.00% ✓ 46779      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   296 kB/s
     http_req_blocked...............: avg=15.45µs  min=1.65µs  med=3.97µs   max=8.55ms  p(90)=5.97µs   p(95)=7.78µs   p(99.9)=2.21ms
     http_req_connecting............: avg=9.57µs   min=0s      med=0s       max=8.51ms  p(90)=0s       p(95)=0s       p(99.9)=2.19ms
     http_req_duration..............: avg=876.88ms min=5.84ms  med=778.52ms max=4.68s   p(90)=1.75s    p(95)=2.01s    p(99.9)=4.15s 
       { expected_response:true }...: avg=876.88ms min=5.84ms  med=778.52ms max=4.68s   p(90)=1.75s    p(95)=2.01s    p(99.9)=4.15s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16593
     http_req_receiving.............: avg=108.54µs min=38.54µs med=95.74µs  max=46.76ms p(90)=136.18µs p(95)=153.21µs p(99.9)=1.2ms 
     http_req_sending...............: avg=39.2µs   min=6.85µs  med=19.3µs   max=83.95ms p(90)=25.26µs  p(95)=30.3µs   p(99.9)=2.23ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=876.73ms min=5.74ms  med=778.42ms max=4.68s   p(90)=1.75s    p(95)=2.01s    p(99.9)=4.15s 
     http_reqs......................: 16593   246.210652/s
     iteration_duration.............: avg=933.22ms min=38.78ms med=852.06ms max=4.69s   p(90)=1.78s    p(95)=2.03s    p(99.9)=4.16s 
     iterations.....................: 15593   231.372428/s
     success_rate...................: 100.00% ✓ 15593      ✗ 0    
     vus............................: 74      min=0        max=500
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

     checks.........................: 100.00% ✓ 45255      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=19.15µs  min=1.04µs  med=3.24µs   max=6.26ms   p(90)=4.97µs   p(95)=6.65µs   p(99.9)=4.05ms 
     http_req_connecting............: avg=14.14µs  min=0s      med=0s       max=6.24ms   p(90)=0s       p(95)=0s       p(99.9)=3.96ms 
     http_req_duration..............: avg=904ms    min=7.86ms  med=835.34ms max=3.01s    p(90)=1.85s    p(95)=1.95s    p(99.9)=2.81s  
       { expected_response:true }...: avg=904ms    min=7.86ms  med=835.34ms max=3.01s    p(90)=1.85s    p(95)=1.95s    p(99.9)=2.81s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16085
     http_req_receiving.............: avg=177.63µs min=32.41µs med=88.92µs  max=105.27ms p(90)=128.55µs p(95)=144.47µs p(99.9)=37.69ms
     http_req_sending...............: avg=36.53µs  min=5.6µs   med=17.18µs  max=104.77ms p(90)=22.74µs  p(95)=27.94µs  p(99.9)=3.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=903.78ms min=7.72ms  med=835.25ms max=3.01s    p(90)=1.85s    p(95)=1.95s    p(99.9)=2.81s  
     http_reqs......................: 16085   233.230455/s
     iteration_duration.............: avg=963.85ms min=80.79ms med=899.11ms max=3.01s    p(90)=1.87s    p(95)=1.96s    p(99.9)=2.83s  
     iterations.....................: 15085   218.730582/s
     success_rate...................: 100.00% ✓ 15085      ✗ 0    
     vus............................: 45      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

