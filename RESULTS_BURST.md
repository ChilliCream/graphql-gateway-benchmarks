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
| hive-router | v0.0.43 | 2,693 | 2,816 | 2,655 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.5 | 2,068 | 2,121 | 2,051 | 1.1% |  |
| cosmo | 0.298.0 | 1,169 | 1,170 | 1,165 | 0.2% | non-compatible response (13 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 570 | 580 | 566 | 0.8% |  |
| hive-gateway | 2.5.14 | 249 | 252 | 246 | 0.8% |  |
| apollo-gateway | 2.13.3 | 204 | 207 | 199 | 1.4% | 1 failed requests across 1/9 runs |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (40687 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (508960 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,320 | 2,405 | 2,296 | 1.7% |  |
| hotchocolate | 16.1.0-p.1.5 | 1,967 | 1,998 | 1,942 | 0.8% |  |
| cosmo | 0.298.0 | 1,123 | 1,133 | 1,106 | 1.2% | non-compatible response (18 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 545 | 554 | 537 | 1.0% |  |
| hive-gateway | 2.5.14 | 240 | 245 | 237 | 1.0% |  |
| apollo-gateway | 2.13.3 | 205 | 207 | 203 | 0.6% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (42691 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (392867 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 497364      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=29.4µs   min=1.01µs med=2.22µs  max=90.2ms   p(90)=3.67µs   p(95)=4.8µs    p(99.9)=5.38ms  
     http_req_connecting............: avg=25.85µs  min=0s     med=0s      max=73.96ms  p(90)=0s       p(95)=0s       p(99.9)=4.39ms  
     http_req_duration..............: avg=85.17ms  min=1.54ms med=78.65ms max=368.19ms p(90)=165.04ms p(95)=183.03ms p(99.9)=248.33ms
       { expected_response:true }...: avg=85.17ms  min=1.54ms med=78.65ms max=368.19ms p(90)=165.04ms p(95)=183.03ms p(99.9)=248.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166788
     http_req_receiving.............: avg=406.18µs min=28.6µs med=55.75µs max=57.45ms  p(90)=215.31µs p(95)=415.53µs p(99.9)=43.87ms 
     http_req_sending...............: avg=89.77µs  min=5.42µs med=9.86µs  max=166.32ms p(90)=18.3µs   p(95)=131.73µs p(99.9)=14.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.67ms  min=1.48ms med=78.31ms max=367.87ms p(90)=164.44ms p(95)=181.48ms p(99.9)=244.17ms
     http_reqs......................: 166788  2693.701972/s
     iteration_duration.............: avg=85.99ms  min=2.46ms med=79.56ms max=379.38ms p(90)=165.58ms p(95)=183.65ms p(99.9)=250.19ms
     iterations.....................: 165788  2677.551517/s
     success_rate...................: 100.00% ✓ 165788      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 386559      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=12.32µs  min=1.01µs  med=2.16µs   max=51.14ms  p(90)=3.43µs   p(95)=4.37µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=9.48µs   min=0s      med=0s       max=50.97ms  p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=109.59ms min=2.39ms  med=105.43ms max=596.09ms p(90)=208.15ms p(95)=230.88ms p(99.9)=360.47ms
       { expected_response:true }...: avg=109.59ms min=2.39ms  med=105.43ms max=596.09ms p(90)=208.15ms p(95)=230.88ms p(99.9)=360.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129853
     http_req_receiving.............: avg=1.34ms   min=52.23µs med=154.88µs max=278.8ms  p(90)=1.38ms   p(95)=3.47ms   p(99.9)=113.13ms
     http_req_sending...............: avg=54.55µs  min=5.18µs  med=9.55µs   max=84.46ms  p(90)=17.32µs  p(95)=119.27µs p(99.9)=7.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.19ms min=2.3ms   med=104.2ms  max=500.08ms p(90)=206.15ms p(95)=227.74ms p(99.9)=353.34ms
     http_reqs......................: 129853  2068.607312/s
     iteration_duration.............: avg=110.7ms  min=3.6ms   med=106.64ms max=596.31ms p(90)=208.73ms p(95)=231.53ms p(99.9)=362.91ms
     iterations.....................: 128853  2052.676935/s
     success_rate...................: 100.00% ✓ 128853      ✗ 0     
     vus............................: 93      min=0         max=500 
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

     checks.........................: 100.00% ✓ 216282      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=7.91µs   min=1.02µs  med=2.08µs   max=125.67ms p(90)=3.37µs   p(95)=4.16µs   p(99.9)=414.76µs
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=58.43ms  p(90)=0s       p(95)=0s       p(99.9)=324.65µs
     http_req_duration..............: avg=195.21ms min=2.09ms  med=194.45ms max=527.99ms p(90)=363.72ms p(95)=390.17ms p(99.9)=468.57ms
       { expected_response:true }...: avg=195.21ms min=2.09ms  med=194.45ms max=527.99ms p(90)=363.72ms p(95)=390.17ms p(99.9)=468.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73094
     http_req_receiving.............: avg=82.42µs  min=29.32µs med=59.93µs  max=255.86ms p(90)=93.13µs  p(95)=107.72µs p(99.9)=1.88ms  
     http_req_sending...............: avg=31.32µs  min=5.33µs  med=9.97µs   max=165.63ms p(90)=15.28µs  p(95)=19.03µs  p(99.9)=3.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.09ms min=2.01ms  med=194.33ms max=527.93ms p(90)=363.65ms p(95)=390.07ms p(99.9)=468.48ms
     http_reqs......................: 73094   1169.710271/s
     iteration_duration.............: avg=198.17ms min=4.09ms  med=197.76ms max=528.15ms p(90)=364.49ms p(95)=390.82ms p(99.9)=468.92ms
     iterations.....................: 72094   1153.707449/s
     success_rate...................: 100.00% ✓ 72094       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 107565     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   685 kB/s
     http_req_blocked...............: avg=9.22µs   min=1.11µs  med=2.86µs   max=20.9ms   p(90)=4.78µs   p(95)=5.77µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=5.25µs   min=0s      med=0s       max=20.85ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=389.03ms min=3.67ms  med=358.6ms  max=1.64s    p(90)=767.63ms p(95)=837.05ms p(99.9)=1.22s   
       { expected_response:true }...: avg=389.03ms min=3.67ms  med=358.6ms  max=1.64s    p(90)=767.63ms p(95)=837.05ms p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36855
     http_req_receiving.............: avg=98.58µs  min=31.2µs  med=76.48µs  max=113.35ms p(90)=114.11µs p(95)=128.13µs p(99.9)=853.87µs
     http_req_sending...............: avg=35.45µs  min=5.63µs  med=13.57µs  max=147.65ms p(90)=21.13µs  p(95)=24.47µs  p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=388.89ms min=3.62ms  med=358.52ms max=1.64s    p(90)=767.51ms p(95)=836.97ms p(99.9)=1.22s   
     http_reqs......................: 36855   570.954782/s
     iteration_duration.............: avg=400.11ms min=16.69ms med=374.4ms  max=1.64s    p(90)=771.16ms p(95)=839.27ms p(99.9)=1.23s   
     iterations.....................: 35855   555.46286/s
     success_rate...................: 100.00% ✓ 35855      ✗ 0    
     vus............................: 83      min=0        max=499
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

     checks.........................: 100.00% ✓ 47550      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=13.64µs  min=1.24µs  med=3.81µs   max=3.65ms  p(90)=5.74µs   p(95)=7.29µs   p(99.9)=2.13ms  
     http_req_connecting............: avg=8.2µs    min=0s      med=0s       max=3.62ms  p(90)=0s       p(95)=0s       p(99.9)=2.11ms  
     http_req_duration..............: avg=848.62ms min=5.78ms  med=751.12ms max=19.66s  p(90)=1.42s    p(95)=1.59s    p(99.9)=18.48s  
       { expected_response:true }...: avg=848.62ms min=5.78ms  med=751.12ms max=19.66s  p(90)=1.42s    p(95)=1.59s    p(99.9)=18.48s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16850
     http_req_receiving.............: avg=104.65µs min=33.62µs med=99.04µs  max=4.25ms  p(90)=138.86µs p(95)=152.02µs p(99.9)=808.06µs
     http_req_sending...............: avg=33.47µs  min=6.55µs  med=18.14µs  max=60.03ms p(90)=24.46µs  p(95)=29.49µs  p(99.9)=2.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=848.48ms min=5.63ms  med=751.03ms max=19.66s  p(90)=1.42s    p(95)=1.59s    p(99.9)=18.48s  
     http_reqs......................: 16850   249.212885/s
     iteration_duration.............: avg=902.21ms min=40.5ms  med=818.54ms max=19.66s  p(90)=1.44s    p(95)=1.6s     p(99.9)=18.49s  
     iterations.....................: 15850   234.422803/s
     success_rate...................: 100.00% ✓ 15850      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 42633      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=15.26µs  min=1.21µs  med=3.38µs   max=5.72ms p(90)=5.05µs   p(95)=6.58µs   p(99.9)=2.32ms  
     http_req_connecting............: avg=9.86µs   min=0s      med=0s       max=5.35ms p(90)=0s       p(95)=0s       p(99.9)=2.15ms  
     http_req_duration..............: avg=506.31ms min=8.51ms  med=570.88ms max=1.34s  p(90)=873.96ms p(95)=924.76ms p(99.9)=1.26s   
       { expected_response:true }...: avg=506.31ms min=8.51ms  med=570.88ms max=1.34s  p(90)=873.96ms p(95)=924.76ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15211
     http_req_receiving.............: avg=97.19µs  min=36.7µs  med=90.62µs  max=5.99ms p(90)=130.2µs  p(95)=142.83µs p(99.9)=852.63µs
     http_req_sending...............: avg=29.66µs  min=5.64µs  med=16.41µs  max=8.22ms p(90)=22.23µs  p(95)=27.21µs  p(99.9)=3.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=506.19ms min=8.42ms  med=570.82ms max=1.34s  p(90)=873.86ms p(95)=924.58ms p(99.9)=1.26s   
     http_reqs......................: 15211   204.153458/s
     iteration_duration.............: avg=541.75ms min=14.79ms med=610.72ms max=1.35s  p(90)=879.1ms  p(95)=930.06ms p(99.9)=1.27s   
     iterations.....................: 14211   190.732022/s
     success_rate...................: 100.00% ✓ 14211      ✗ 0    
     vus............................: 63      min=0        max=500
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

     checks.........................: 100.00% ✓ 428253      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=26.82µs  min=992ns   med=2.43µs  max=69.52ms  p(90)=4.23µs   p(95)=5.55µs   p(99.9)=4.59ms  
     http_req_connecting............: avg=23.52µs  min=0s      med=0s      max=69.32ms  p(90)=0s       p(95)=0s       p(99.9)=4.45ms  
     http_req_duration..............: avg=98.91ms  min=1.58ms  med=93.32ms max=346.58ms p(90)=189.37ms p(95)=207.24ms p(99.9)=270.18ms
       { expected_response:true }...: avg=98.91ms  min=1.58ms  med=93.32ms max=346.58ms p(90)=189.37ms p(95)=207.24ms p(99.9)=270.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143751
     http_req_receiving.............: avg=283.45µs min=29.85µs med=60.62µs max=64.17ms  p(90)=200.88µs p(95)=441.51µs p(99.9)=30.69ms 
     http_req_sending...............: avg=83.92µs  min=5.09µs  med=10.91µs max=234.05ms p(90)=21.32µs  p(95)=142.68µs p(99.9)=11.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.54ms  min=1.52ms  med=93.09ms max=345.92ms p(90)=188.82ms p(95)=206.34ms p(99.9)=267.1ms 
     http_reqs......................: 143751  2320.651295/s
     iteration_duration.............: avg=99.89ms  min=4.79ms  med=94.41ms max=382.48ms p(90)=190.01ms p(95)=207.78ms p(99.9)=271.42ms
     iterations.....................: 142751  2304.507746/s
     success_rate...................: 100.00% ✓ 142751      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 364302      ✗ 0     
     data_received..................: 11 GB   173 MB/s
     data_sent......................: 147 MB  2.4 MB/s
     http_req_blocked...............: avg=14.66µs  min=1.01µs  med=2.31µs   max=61.17ms  p(90)=3.85µs   p(95)=4.93µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=11.64µs  min=0s      med=0s       max=61.13ms  p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=116.27ms min=1.8ms   med=109.96ms max=726.15ms p(90)=220.76ms p(95)=245.59ms p(99.9)=582.12ms
       { expected_response:true }...: avg=116.27ms min=1.8ms   med=109.96ms max=726.15ms p(90)=220.76ms p(95)=245.59ms p(99.9)=582.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 122434
     http_req_receiving.............: avg=1.32ms   min=51.29µs med=138.54µs max=238.43ms p(90)=1.56ms   p(95)=3.47ms   p(99.9)=112.32ms
     http_req_sending...............: avg=65.67µs  min=5.19µs  med=10.03µs  max=221.66ms p(90)=19.59µs  p(95)=121.11µs p(99.9)=8.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.88ms min=1.65ms  med=108.58ms max=724.92ms p(90)=218.96ms p(95)=243.16ms p(99.9)=581.81ms
     http_reqs......................: 122434  1967.601799/s
     iteration_duration.............: avg=117.49ms min=2.64ms  med=111.31ms max=726.41ms p(90)=221.41ms p(95)=246.21ms p(99.9)=582.77ms
     iterations.....................: 121434  1951.531085/s
     success_rate...................: 100.00% ✓ 121434      ✗ 0     
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

     checks.........................: 100.00% ✓ 208185      ✗ 0    
     data_received..................: 6.2 GB  98 MB/s
     data_sent......................: 85 MB   1.3 MB/s
     http_req_blocked...............: avg=6.54µs   min=1.06µs  med=2.26µs   max=15.03ms  p(90)=3.87µs   p(95)=4.84µs   p(99.9)=521.54µs
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=14.91ms  p(90)=0s       p(95)=0s       p(99.9)=386.76µs
     http_req_duration..............: avg=202.74ms min=2.11ms  med=203.19ms max=551.75ms p(90)=374.19ms p(95)=402.05ms p(99.9)=489.55ms
       { expected_response:true }...: avg=202.74ms min=2.11ms  med=203.19ms max=551.75ms p(90)=374.19ms p(95)=402.05ms p(99.9)=489.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70395
     http_req_receiving.............: avg=81.9µs   min=29.97µs med=65.7µs   max=42.24ms  p(90)=103.68µs p(95)=119.36µs p(99.9)=1.91ms  
     http_req_sending...............: avg=29.34µs  min=5.36µs  med=10.99µs  max=62.61ms  p(90)=17.67µs  p(95)=21.13µs  p(99.9)=4.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.63ms min=2.04ms  med=203.07ms max=551.39ms p(90)=374.09ms p(95)=401.92ms p(99.9)=489.47ms
     http_reqs......................: 70395   1123.477129/s
     iteration_duration.............: avg=205.91ms min=5.97ms  med=206.77ms max=551.96ms p(90)=375.23ms p(95)=402.73ms p(99.9)=490.06ms
     iterations.....................: 69395   1107.517513/s
     success_rate...................: 100.00% ✓ 69395       ✗ 0    
     vus............................: 88      min=0         max=499
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

     checks.........................: 100.00% ✓ 103113     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 43 MB   655 kB/s
     http_req_blocked...............: avg=9.23µs   min=1.19µs  med=3.16µs   max=6.83ms   p(90)=5.03µs   p(95)=6.06µs   p(99.9)=1.36ms 
     http_req_connecting............: avg=5.08µs   min=0s      med=0s       max=6.77ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms 
     http_req_duration..............: avg=405.62ms min=3.81ms  med=373.2ms  max=1.63s    p(90)=800.59ms p(95)=879.42ms p(99.9)=1.33s  
       { expected_response:true }...: avg=405.62ms min=3.81ms  med=373.2ms  max=1.63s    p(90)=800.59ms p(95)=879.42ms p(99.9)=1.33s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 35371
     http_req_receiving.............: avg=94.69µs  min=32.11µs med=80.71µs  max=195ms    p(90)=117.15µs p(95)=131.49µs p(99.9)=875.1µs
     http_req_sending...............: avg=40.48µs  min=5.74µs  med=14.54µs  max=253.18ms p(90)=21.8µs   p(95)=24.75µs  p(99.9)=2.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=405.49ms min=3.74ms  med=373.07ms max=1.63s    p(90)=800.53ms p(95)=879.33ms p(99.9)=1.33s  
     http_reqs......................: 35371   545.566268/s
     iteration_duration.............: avg=417.67ms min=21.88ms med=388.3ms  max=1.63s    p(90)=805.77ms p(95)=882.59ms p(99.9)=1.34s  
     iterations.....................: 34371   530.142156/s
     success_rate...................: 100.00% ✓ 34371      ✗ 0    
     vus............................: 96      min=0        max=500
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

     checks.........................: 100.00% ✓ 45861      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   289 kB/s
     http_req_blocked...............: avg=17.76µs  min=1.24µs  med=3.82µs   max=27.93ms p(90)=5.79µs  p(95)=7.3µs    p(99.9)=2.64ms
     http_req_connecting............: avg=12.16µs  min=0s      med=0s       max=27.87ms p(90)=0s      p(95)=0s       p(99.9)=2.62ms
     http_req_duration..............: avg=894.33ms min=5.87ms  med=798.57ms max=4.85s   p(90)=1.79s   p(95)=1.96s    p(99.9)=4.29s 
       { expected_response:true }...: avg=894.33ms min=5.87ms  med=798.57ms max=4.85s   p(90)=1.79s   p(95)=1.96s    p(99.9)=4.29s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16287
     http_req_receiving.............: avg=113.48µs min=38.31µs med=101.15µs max=37.97ms p(90)=142.5µs p(95)=155.69µs p(99.9)=1.22ms
     http_req_sending...............: avg=36.5µs   min=6.04µs  med=18.3µs   max=91.18ms p(90)=24.66µs p(95)=29.51µs  p(99.9)=3.01ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=894.18ms min=5.78ms  med=798.43ms max=4.85s   p(90)=1.79s   p(95)=1.96s    p(99.9)=4.29s 
     http_reqs......................: 16287   240.61213/s
     iteration_duration.............: avg=952.92ms min=39.98ms med=877.43ms max=4.86s   p(90)=1.81s   p(95)=1.97s    p(99.9)=4.32s 
     iterations.....................: 15287   225.838867/s
     success_rate...................: 100.00% ✓ 15287      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 40008      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=18.23µs  min=1.3µs   med=3.67µs   max=31.54ms p(90)=5.55µs   p(95)=7.38µs   p(99.9)=2.4ms   
     http_req_connecting............: avg=12.55µs  min=0s      med=0s       max=31.47ms p(90)=0s       p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=1.01s    min=8.63ms  med=961.98ms max=4.28s   p(90)=2.05s    p(95)=2.18s    p(99.9)=3.74s   
       { expected_response:true }...: avg=1.01s    min=8.63ms  med=961.98ms max=4.28s   p(90)=2.05s    p(95)=2.18s    p(99.9)=3.74s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14336
     http_req_receiving.............: avg=104.53µs min=33.11µs med=98.19µs  max=10.69ms p(90)=138.81µs p(95)=151.54µs p(99.9)=907.46µs
     http_req_sending...............: avg=28.15µs  min=6.2µs   med=17.92µs  max=7.55ms  p(90)=23.87µs  p(95)=29.04µs  p(99.9)=2.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.01s    min=8.51ms  med=961.87ms max=4.28s   p(90)=2.05s    p(95)=2.18s    p(99.9)=3.74s   
     http_reqs......................: 14336   205.343623/s
     iteration_duration.............: avg=1.09s    min=43.43ms med=1.02s    max=4.28s   p(90)=2.07s    p(95)=2.19s    p(99.9)=3.76s   
     iterations.....................: 13336   191.019989/s
     success_rate...................: 100.00% ✓ 13336      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

