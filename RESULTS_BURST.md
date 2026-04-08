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
| hive-router | v0.0.43 | 2,707 | 2,822 | 2,664 | 2.0% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,011 | 2,057 | 1,995 | 1.0% |  |
| cosmo | 0.298.0 | 1,172 | 1,181 | 1,159 | 0.8% | non-compatible response (8 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 567 | 573 | 563 | 0.6% |  |
| hive-gateway | 2.5.14 | 245 | 248 | 242 | 0.8% |  |
| apollo-gateway | 2.13.3 | 203 | 206 | 199 | 1.0% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (34620 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (532363 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,197 | 2,313 | 2,161 | 2.2% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,850 | 1,898 | 1,840 | 1.0% |  |
| cosmo | 0.298.0 | 1,134 | 1,137 | 1,103 | 1.6% | non-compatible response (10 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 526 | 535 | 519 | 1.0% |  |
| hive-gateway | 2.5.14 | 248 | 251 | 246 | 0.7% |  |
| apollo-gateway | 2.13.3 | 204 | 207 | 203 | 0.6% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (26033 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (228072 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 499467      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 201 MB  3.3 MB/s
     http_req_blocked...............: avg=29.89µs  min=1.05µs  med=2.72µs  max=101.44ms p(90)=4.31µs   p(95)=5.45µs   p(99.9)=5.8ms   
     http_req_connecting............: avg=26.1µs   min=0s      med=0s      max=101.26ms p(90)=0s       p(95)=0s       p(99.9)=5.52ms  
     http_req_duration..............: avg=84.81ms  min=1.65ms  med=79.27ms max=282.51ms p(90)=163.45ms p(95)=180.54ms p(99.9)=239.5ms 
       { expected_response:true }...: avg=84.81ms  min=1.65ms  med=79.27ms max=282.51ms p(90)=163.45ms p(95)=180.54ms p(99.9)=239.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 167489
     http_req_receiving.............: avg=372.41µs min=28.46µs med=56.76µs max=106.26ms p(90)=212.54µs p(95)=417.06µs p(99.9)=43.8ms  
     http_req_sending...............: avg=92.42µs  min=5.17µs  med=10.34µs max=111.82ms p(90)=19.24µs  p(95)=134.08µs p(99.9)=13.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.35ms  min=1.58ms  med=78.94ms max=276.11ms p(90)=162.47ms p(95)=179.1ms  p(99.9)=237.37ms
     http_reqs......................: 167489  2707.200323/s
     iteration_duration.............: avg=85.63ms  min=2.48ms  med=80.2ms  max=312.43ms p(90)=164.04ms p(95)=181.12ms p(99.9)=240.33ms
     iterations.....................: 166489  2691.036871/s
     success_rate...................: 100.00% ✓ 166489      ✗ 0     
     vus............................: 32      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 375942      ✗ 0     
     data_received..................: 11 GB   176 MB/s
     data_sent......................: 152 MB  2.4 MB/s
     http_req_blocked...............: avg=11.91µs  min=1.1µs   med=2.68µs   max=33.22ms  p(90)=4.12µs   p(95)=5.07µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=8.67µs   min=0s      med=0s       max=33.04ms  p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=112.69ms min=2.39ms  med=107.24ms max=533.24ms p(90)=215.4ms  p(95)=237.79ms p(99.9)=360.15ms
       { expected_response:true }...: avg=112.69ms min=2.39ms  med=107.24ms max=533.24ms p(90)=215.4ms  p(95)=237.79ms p(99.9)=360.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126314
     http_req_receiving.............: avg=1.25ms   min=52.17µs med=158.48µs max=235.65ms p(90)=1.43ms   p(95)=3.42ms   p(99.9)=112.78ms
     http_req_sending...............: avg=59.92µs  min=5.29µs  med=10.22µs  max=204.64ms p(90)=18.45µs  p(95)=123.84µs p(99.9)=8.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.37ms min=2.31ms  med=106ms    max=533.13ms p(90)=213.74ms p(95)=235.18ms p(99.9)=355.9ms 
     http_reqs......................: 126314  2011.868777/s
     iteration_duration.............: avg=113.84ms min=3.51ms  med=108.56ms max=533.45ms p(90)=216.03ms p(95)=238.45ms p(99.9)=360.92ms
     iterations.....................: 125314  1995.941257/s
     success_rate...................: 100.00% ✓ 125314      ✗ 0     
     vus............................: 100     min=0         max=500 
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

     checks.........................: 100.00% ✓ 216915      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.92µs   min=1.08µs  med=2.52µs   max=27.88ms  p(90)=4.01µs   p(95)=4.83µs   p(99.9)=616.7µs 
     http_req_connecting............: avg=3.73µs   min=0s      med=0s       max=27.8ms   p(90)=0s       p(95)=0s       p(99.9)=474.95µs
     http_req_duration..............: avg=194.64ms min=2.07ms  med=196.69ms max=637.48ms p(90)=360.24ms p(95)=387.67ms p(99.9)=496.69ms
       { expected_response:true }...: avg=194.64ms min=2.07ms  med=196.69ms max=637.48ms p(90)=360.24ms p(95)=387.67ms p(99.9)=496.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73305
     http_req_receiving.............: avg=79.41µs  min=28.95µs med=60µs     max=106.59ms p(90)=92.33µs  p(95)=105.87µs p(99.9)=1.57ms  
     http_req_sending...............: avg=28.69µs  min=5.36µs  med=10.64µs  max=21.72ms  p(90)=16.24µs  p(95)=19.78µs  p(99.9)=3.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.53ms min=2ms     med=196.53ms max=637.38ms p(90)=360.13ms p(95)=387.54ms p(99.9)=496.63ms
     http_reqs......................: 73305   1172.794292/s
     iteration_duration.............: avg=197.58ms min=4.88ms  med=200.12ms max=637.71ms p(90)=361.31ms p(95)=388.44ms p(99.9)=497.25ms
     iterations.....................: 72305   1156.795461/s
     success_rate...................: 100.00% ✓ 72305       ✗ 0    
     vus............................: 80      min=0         max=495
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

     checks.........................: 100.00% ✓ 106803     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   681 kB/s
     http_req_blocked...............: avg=8.81µs   min=1.28µs  med=3.18µs   max=13.06ms p(90)=5.07µs   p(95)=6.16µs   p(99.9)=1.19ms
     http_req_connecting............: avg=4.57µs   min=0s      med=0s       max=12.98ms p(90)=0s       p(95)=0s       p(99.9)=1.11ms
     http_req_duration..............: avg=391.83ms min=3.7ms   med=364.7ms  max=1.62s   p(90)=777.32ms p(95)=844.86ms p(99.9)=1.21s 
       { expected_response:true }...: avg=391.83ms min=3.7ms   med=364.7ms  max=1.62s   p(90)=777.32ms p(95)=844.86ms p(99.9)=1.21s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36601
     http_req_receiving.............: avg=92.95µs  min=33.38µs med=77.79µs  max=75.15ms p(90)=114.09µs p(95)=127.95µs p(99.9)=1.06ms
     http_req_sending...............: avg=28.03µs  min=5.55µs  med=13.92µs  max=51.84ms p(90)=21.48µs  p(95)=25.09µs  p(99.9)=2.77ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=391.71ms min=3.61ms  med=364.6ms  max=1.62s   p(90)=777.18ms p(95)=844.75ms p(99.9)=1.21s 
     http_reqs......................: 36601   567.484445/s
     iteration_duration.............: avg=403.06ms min=15.94ms med=379.46ms max=1.63s   p(90)=780.94ms p(95)=847.08ms p(99.9)=1.21s 
     iterations.....................: 35601   551.979829/s
     success_rate...................: 100.00% ✓ 35601      ✗ 0    
     vus............................: 79      min=0        max=497
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

     checks.........................: 100.00% ✓ 46773      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   295 kB/s
     http_req_blocked...............: avg=14.11µs  min=1.22µs  med=3.79µs   max=6.91ms  p(90)=5.64µs   p(95)=7.39µs   p(99.9)=1.9ms 
     http_req_connecting............: avg=8.62µs   min=0s      med=0s       max=6.84ms  p(90)=0s       p(95)=0s       p(99.9)=1.87ms
     http_req_duration..............: avg=864.83ms min=5.77ms  med=739.32ms max=17.02s  p(90)=1.47s    p(95)=1.66s    p(99.9)=15.57s
       { expected_response:true }...: avg=864.83ms min=5.77ms  med=739.32ms max=17.02s  p(90)=1.47s    p(95)=1.66s    p(99.9)=15.57s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16591
     http_req_receiving.............: avg=109.9µs  min=33.57µs med=97.02µs  max=43.48ms p(90)=136.27µs p(95)=149.64µs p(99.9)=1.4ms 
     http_req_sending...............: avg=27.88µs  min=5.99µs  med=17.72µs  max=7.99ms  p(90)=24.1µs   p(95)=28.94µs  p(99.9)=2.75ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=864.69ms min=5.65ms  med=739.21ms max=17.02s  p(90)=1.47s    p(95)=1.66s    p(99.9)=15.57s
     http_reqs......................: 16591   245.110349/s
     iteration_duration.............: avg=920.34ms min=33.46ms med=800.9ms  max=17.02s  p(90)=1.49s    p(95)=1.67s    p(99.9)=15.75s
     iterations.....................: 15591   230.336656/s
     success_rate...................: 100.00% ✓ 15591      ✗ 0    
     vus............................: 91      min=0        max=499
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

     checks.........................: 100.00% ✓ 42396      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=14.48µs  min=1.35µs  med=3.49µs   max=23.55ms p(90)=5.16µs   p(95)=6.69µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=9.32µs   min=0s      med=0s       max=23.49ms p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=465.15ms min=8.46ms  med=506.73ms max=1.51s   p(90)=862.08ms p(95)=955.23ms p(99.9)=1.32s   
       { expected_response:true }...: avg=465.15ms min=8.46ms  med=506.73ms max=1.51s   p(90)=862.08ms p(95)=955.23ms p(99.9)=1.32s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15132
     http_req_receiving.............: avg=95.68µs  min=34.07µs med=89.79µs  max=3.04ms  p(90)=129.03µs p(95)=142.56µs p(99.9)=845.97µs
     http_req_sending...............: avg=35.42µs  min=6.25µs  med=15.84µs  max=56.76ms p(90)=22.42µs  p(95)=26.92µs  p(99.9)=3.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=465.02ms min=8.37ms  med=506.64ms max=1.51s   p(90)=861.97ms p(95)=955.07ms p(99.9)=1.32s   
     http_reqs......................: 15132   203.392063/s
     iteration_duration.............: avg=497.9ms  min=9.09ms  med=530.27ms max=1.52s   p(90)=873.82ms p(95)=959.87ms p(99.9)=1.33s   
     iterations.....................: 14132   189.950874/s
     success_rate...................: 100.00% ✓ 14132      ✗ 0    
     vus............................: 66      min=0        max=498
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

     checks.........................: 100.00% ✓ 405747      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=17.39µs  min=1.01µs  med=2.45µs   max=67.47ms  p(90)=4.04µs   p(95)=5.29µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=14.15µs  min=0s      med=0s       max=67.41ms  p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=104.41ms min=1.62ms  med=99.41ms  max=310.73ms p(90)=199.51ms p(95)=216.64ms p(99.9)=273.6ms 
       { expected_response:true }...: avg=104.41ms min=1.62ms  med=99.41ms  max=310.73ms p(90)=199.51ms p(95)=216.64ms p(99.9)=273.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 136249
     http_req_receiving.............: avg=182.06µs min=28.59µs med=60.45µs  max=132.12ms p(90)=167.15µs p(95)=404.31µs p(99.9)=19.65ms 
     http_req_sending...............: avg=70.12µs  min=5.28µs  med=10.52µs  max=148.18ms p(90)=20.27µs  p(95)=133.05µs p(99.9)=9.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.15ms min=1.56ms  med=99.18ms  max=302.54ms p(90)=199.16ms p(95)=216.15ms p(99.9)=272.83ms
     http_reqs......................: 136249  2197.882646/s
     iteration_duration.............: avg=105.44ms min=4.19ms  med=100.69ms max=349.32ms p(90)=200ms    p(95)=217.21ms p(99.9)=274.41ms
     iterations.....................: 135249  2181.751279/s
     success_rate...................: 100.00% ✓ 135249      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 342738      ✗ 0     
     data_received..................: 10 GB   162 MB/s
     data_sent......................: 138 MB  2.2 MB/s
     http_req_blocked...............: avg=13.59µs  min=1.05µs  med=2.65µs   max=63.27ms  p(90)=4.35µs   p(95)=5.45µs   p(99.9)=1.01ms  
     http_req_connecting............: avg=10.24µs  min=0s      med=0s       max=63.21ms  p(90)=0s       p(95)=0s       p(99.9)=944.32µs
     http_req_duration..............: avg=123.55ms min=1.84ms  med=115.92ms max=879.23ms p(90)=234.06ms p(95)=257.59ms p(99.9)=709.33ms
       { expected_response:true }...: avg=123.55ms min=1.84ms  med=115.92ms max=879.23ms p(90)=234.06ms p(95)=257.59ms p(99.9)=709.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 115246
     http_req_receiving.............: avg=1.28ms   min=52.56µs med=153.6µs  max=215.7ms  p(90)=1.56ms   p(95)=3.34ms   p(99.9)=99.75ms 
     http_req_sending...............: avg=57.25µs  min=5.04µs  med=10.65µs  max=76.72ms  p(90)=19.91µs  p(95)=121.6µs  p(99.9)=7.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.21ms min=1.73ms  med=114.53ms max=879.11ms p(90)=232.4ms  p(95)=255.14ms p(99.9)=707.86ms
     http_reqs......................: 115246  1850.573864/s
     iteration_duration.............: avg=124.91ms min=3.12ms  med=117.39ms max=879.47ms p(90)=234.64ms p(95)=258.3ms  p(99.9)=709.79ms
     iterations.....................: 114246  1834.516266/s
     success_rate...................: 100.00% ✓ 114246      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 209910      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=6.75µs   min=1.17µs  med=2.81µs   max=10.52ms  p(90)=4.5µs    p(95)=5.4µs    p(99.9)=597.78µs
     http_req_connecting............: avg=3.26µs   min=0s      med=0s       max=10.39ms  p(90)=0s       p(95)=0s       p(99.9)=548.37µs
     http_req_duration..............: avg=201.09ms min=2.06ms  med=201.76ms max=640.15ms p(90)=370.95ms p(95)=399.06ms p(99.9)=531.67ms
       { expected_response:true }...: avg=201.09ms min=2.06ms  med=201.76ms max=640.15ms p(90)=370.95ms p(95)=399.06ms p(99.9)=531.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70970
     http_req_receiving.............: avg=80.33µs  min=29.77µs med=64.56µs  max=131.13ms p(90)=99.31µs  p(95)=113.12µs p(99.9)=1.57ms  
     http_req_sending...............: avg=33.84µs  min=5.47µs  med=11.49µs  max=132.63ms p(90)=17.75µs  p(95)=21µs     p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.98ms min=2ms     med=201.64ms max=640.03ms p(90)=370.83ms p(95)=398.88ms p(99.9)=531.58ms
     http_reqs......................: 70970   1134.670783/s
     iteration_duration.............: avg=204.21ms min=4.68ms  med=205.26ms max=640.37ms p(90)=371.98ms p(95)=399.66ms p(99.9)=532.47ms
     iterations.....................: 69970   1118.682749/s
     success_rate...................: 100.00% ✓ 69970       ✗ 0    
     vus............................: 83      min=0         max=495
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

     checks.........................: 100.00% ✓ 99198      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   632 kB/s
     http_req_blocked...............: avg=9.37µs   min=1.24µs  med=3.32µs   max=8.26ms  p(90)=5.08µs   p(95)=6.03µs   p(99.9)=1.43ms
     http_req_connecting............: avg=5.1µs    min=0s      med=0s       max=8.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.36ms
     http_req_duration..............: avg=421.38ms min=3.81ms  med=388.98ms max=1.92s   p(90)=833.75ms p(95)=902.59ms p(99.9)=1.34s 
       { expected_response:true }...: avg=421.38ms min=3.81ms  med=388.98ms max=1.92s   p(90)=833.75ms p(95)=902.59ms p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34066
     http_req_receiving.............: avg=92.94µs  min=31.88µs med=80.71µs  max=90.86ms p(90)=115.63µs p(95)=127.99µs p(99.9)=1ms   
     http_req_sending...............: avg=25.76µs  min=5.91µs  med=14.4µs   max=10.04ms p(90)=21.36µs  p(95)=24.64µs  p(99.9)=2.42ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=421.26ms min=3.72ms  med=388.89ms max=1.92s   p(90)=833.65ms p(95)=902.47ms p(99.9)=1.34s 
     http_reqs......................: 34066   526.470427/s
     iteration_duration.............: avg=434.35ms min=17.74ms med=406.27ms max=1.93s   p(90)=837.58ms p(95)=905.5ms  p(99.9)=1.35s 
     iterations.....................: 33066   511.016002/s
     success_rate...................: 100.00% ✓ 33066      ✗ 0    
     vus............................: 89      min=0        max=500
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

     checks.........................: 100.00% ✓ 47334      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=16.35µs  min=1.32µs  med=3.95µs   max=22.47ms p(90)=5.86µs   p(95)=7.37µs   p(99.9)=2.45ms  
     http_req_connecting............: avg=10.36µs  min=0s      med=0s       max=22.41ms p(90)=0s       p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=867.34ms min=5.81ms  med=791.76ms max=5.1s    p(90)=1.73s    p(95)=1.9s     p(99.9)=3.83s   
       { expected_response:true }...: avg=867.34ms min=5.81ms  med=791.76ms max=5.1s    p(90)=1.73s    p(95)=1.9s     p(99.9)=3.83s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16778
     http_req_receiving.............: avg=106.3µs  min=35.52µs med=99.27µs  max=20.72ms p(90)=137.79µs p(95)=150.48µs p(99.9)=894.42µs
     http_req_sending...............: avg=30.2µs   min=6.58µs  med=18.36µs  max=8.41ms  p(90)=24.54µs  p(95)=29.26µs  p(99.9)=3.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=867.21ms min=5.71ms  med=791.65ms max=5.1s    p(90)=1.73s    p(95)=1.9s     p(99.9)=3.83s   
     http_reqs......................: 16778   248.713553/s
     iteration_duration.............: avg=922.36ms min=28.65ms med=852.17ms max=5.1s    p(90)=1.75s    p(95)=1.93s    p(99.9)=3.89s   
     iterations.....................: 15778   233.889763/s
     success_rate...................: 100.00% ✓ 15778      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 39951      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=16.81µs  min=1.32µs  med=3.69µs   max=25.57ms  p(90)=5.41µs  p(95)=7.07µs   p(99.9)=1.86ms
     http_req_connecting............: avg=11.35µs  min=0s      med=0s       max=25.5ms   p(90)=0s      p(95)=0s       p(99.9)=1.83ms
     http_req_duration..............: avg=1.01s    min=8.8ms   med=927.26ms max=4.41s    p(90)=2.07s   p(95)=2.19s    p(99.9)=3.79s 
       { expected_response:true }...: avg=1.01s    min=8.8ms   med=927.26ms max=4.41s    p(90)=2.07s   p(95)=2.19s    p(99.9)=3.79s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14317
     http_req_receiving.............: avg=109.44µs min=37.71µs med=96.06µs  max=64.24ms  p(90)=135.9µs p(95)=148.05µs p(99.9)=1ms   
     http_req_sending...............: avg=39.84µs  min=6.28µs  med=17.62µs  max=107.75ms p(90)=23.42µs p(95)=28.97µs  p(99.9)=3.72ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.69ms  med=927.18ms max=4.41s    p(90)=2.07s   p(95)=2.19s    p(99.9)=3.79s 
     http_reqs......................: 14317   204.644657/s
     iteration_duration.............: avg=1.09s    min=67.13ms med=1.02s    max=4.42s    p(90)=2.1s    p(95)=2.2s     p(99.9)=3.81s 
     iterations.....................: 13317   190.350835/s
     success_rate...................: 100.00% ✓ 13317      ✗ 0    
     vus............................: 49      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

