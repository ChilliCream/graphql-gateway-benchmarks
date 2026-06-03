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
| hive-router | v0.0.49 | 2,714 | 2,837 | 2,669 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,034 | 2,088 | 2,014 | 1.3% |  |
| cosmo | 0.307.0 | 1,170 | 1,190 | 1,161 | 1.3% | non-compatible response (14 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 493 | 500 | 486 | 1.0% |  |
| hive-gateway | 2.5.25 | 222 | 225 | 219 | 0.9% |  |
| apollo-gateway | 2.13.3 | 202 | 205 | 200 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (19829 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (471566 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,207 | 2,316 | 2,164 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,895 | 1,931 | 1,720 | 3.3% |  |
| cosmo | 0.307.0 | 1,114 | 1,114 | 1,108 | 0.4% | non-compatible response (13 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 468 | 479 | 463 | 1.3% |  |
| hive-gateway | 2.5.25 | 213 | 219 | 211 | 1.3% |  |
| apollo-gateway | 2.13.3 | 207 | 211 | 205 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (18605 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (245350 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 500994      ✗ 0     
     data_received..................: 15 GB   238 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=32.17µs min=952ns   med=2.3µs   max=79.2ms   p(90)=3.9µs    p(95)=5.03µs   p(99.9)=8.56ms  
     http_req_connecting............: avg=28.96µs min=0s      med=0s      max=79.01ms  p(90)=0s       p(95)=0s       p(99.9)=7.76ms  
     http_req_duration..............: avg=84.48ms min=1.56ms  med=79.6ms  max=393.34ms p(90)=160.44ms p(95)=180.42ms p(99.9)=254.55ms
       { expected_response:true }...: avg=84.48ms min=1.56ms  med=79.6ms  max=393.34ms p(90)=160.44ms p(95)=180.42ms p(99.9)=254.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167998
     http_req_receiving.............: avg=381.7µs min=27.64µs med=56.13µs max=240.9ms  p(90)=230.32µs p(95)=421.1µs  p(99.9)=44.99ms 
     http_req_sending...............: avg=93.11µs min=5.14µs  med=9.98µs  max=126.54ms p(90)=19.68µs  p(95)=135.37µs p(99.9)=15.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.01ms min=1.51ms  med=79.29ms max=303.52ms p(90)=159.61ms p(95)=178.81ms p(99.9)=251.1ms 
     http_reqs......................: 167998  2714.686541/s
     iteration_duration.............: avg=85.36ms min=2.56ms  med=80.51ms max=414.54ms p(90)=161.14ms p(95)=181.24ms p(99.9)=258.24ms
     iterations.....................: 166998  2698.5275/s
     success_rate...................: 100.00% ✓ 166998      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 380340      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 154 MB  2.4 MB/s
     http_req_blocked...............: avg=16.24µs  min=992ns   med=2.29µs   max=43.9ms   p(90)=3.67µs   p(95)=4.56µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=13.2µs   min=0s      med=0s       max=43.73ms  p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=111.4ms  min=2.38ms  med=101.61ms max=816.43ms p(90)=216.62ms p(95)=251.72ms p(99.9)=437.4ms 
       { expected_response:true }...: avg=111.4ms  min=2.38ms  med=101.61ms max=816.43ms p(90)=216.62ms p(95)=251.72ms p(99.9)=437.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 127780
     http_req_receiving.............: avg=1.69ms   min=51.77µs med=115.99µs max=711.37ms p(90)=1.35ms   p(95)=4.49ms   p(99.9)=139.94ms
     http_req_sending...............: avg=61.37µs  min=5.29µs  med=9.77µs   max=271.77ms p(90)=17.55µs  p(95)=117.8µs  p(99.9)=8.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.64ms min=2.3ms   med=100.49ms max=766.48ms p(90)=213.19ms p(95)=245.27ms p(99.9)=425.54ms
     http_reqs......................: 127780  2034.488625/s
     iteration_duration.............: avg=112.54ms min=3.58ms  med=103.05ms max=816.58ms p(90)=217.4ms  p(95)=252.43ms p(99.9)=437.82ms
     iterations.....................: 126780  2018.566817/s
     success_rate...................: 100.00% ✓ 126780      ✗ 0     
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

     checks.........................: 100.00% ✓ 216528      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.02µs   min=1.09µs  med=2.53µs   max=30.2ms   p(90)=4.01µs   p(95)=4.81µs   p(99.9)=370.51µs
     http_req_connecting............: avg=2.86µs   min=0s      med=0s       max=30.14ms  p(90)=0s       p(95)=0s       p(99.9)=312.49µs
     http_req_duration..............: avg=195.03ms min=2.09ms  med=197.6ms  max=613.23ms p(90)=356.94ms p(95)=382.12ms p(99.9)=520.83ms
       { expected_response:true }...: avg=195.03ms min=2.09ms  med=197.6ms  max=613.23ms p(90)=356.94ms p(95)=382.12ms p(99.9)=520.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73176
     http_req_receiving.............: avg=78.41µs  min=30.73µs med=60.9µs   max=242.19ms p(90)=94.49µs  p(95)=107.94µs p(99.9)=1.73ms  
     http_req_sending...............: avg=29.5µs   min=5.56µs  med=10.98µs  max=36.99ms  p(90)=16.88µs  p(95)=20.29µs  p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.93ms min=2.02ms  med=197.47ms max=613.18ms p(90)=356.83ms p(95)=382.05ms p(99.9)=520.75ms
     http_reqs......................: 73176   1170.232693/s
     iteration_duration.............: avg=197.98ms min=6.1ms   med=201.06ms max=613.43ms p(90)=357.71ms p(95)=382.83ms p(99.9)=521.97ms
     iterations.....................: 72176   1154.240664/s
     success_rate...................: 100.00% ✓ 72176       ✗ 0    
     vus............................: 81      min=0         max=496
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

     checks.........................: 100.00% ✓ 93108      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   593 kB/s
     http_req_blocked...............: avg=7.68µs   min=1.14µs  med=2.88µs   max=4.08ms  p(90)=4.63µs   p(95)=5.65µs   p(99.9)=850.57µs
     http_req_connecting............: avg=3.63µs   min=0s      med=0s       max=2.71ms  p(90)=0s       p(95)=0s       p(99.9)=758.42µs
     http_req_duration..............: avg=448.19ms min=4.01ms  med=417.92ms max=1.81s   p(90)=887.3ms  p(95)=964.17ms p(99.9)=1.42s   
       { expected_response:true }...: avg=448.19ms min=4.01ms  med=417.92ms max=1.81s   p(90)=887.3ms  p(95)=964.17ms p(99.9)=1.42s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32036
     http_req_receiving.............: avg=86.87µs  min=31.22µs med=76.21µs  max=29.3ms  p(90)=112.63µs p(95)=126.28µs p(99.9)=1.03ms  
     http_req_sending...............: avg=30.25µs  min=5.9µs   med=13.45µs  max=110.9ms p(90)=20.62µs  p(95)=24.06µs  p(99.9)=2.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.07ms min=3.9ms   med=417.84ms max=1.81s   p(90)=887.22ms p(95)=964.08ms p(99.9)=1.42s   
     http_reqs......................: 32036   493.559282/s
     iteration_duration.............: avg=462.85ms min=19.45ms med=435.5ms  max=1.82s   p(90)=891.17ms p(95)=966.93ms p(99.9)=1.42s   
     iterations.....................: 31036   478.152887/s
     success_rate...................: 100.00% ✓ 31036      ✗ 0    
     vus............................: 53      min=0        max=499
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

     checks.........................: 100.00% ✓ 42618      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   268 kB/s
     http_req_blocked...............: avg=12.69µs  min=1.33µs  med=3.62µs   max=2.86ms p(90)=5.52µs   p(95)=7.18µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=7.34µs   min=0s      med=0s       max=2.83ms p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=934.07ms min=6.4ms   med=823.29ms max=19.49s p(90)=1.62s    p(95)=1.78s    p(99.9)=17.6s   
       { expected_response:true }...: avg=934.07ms min=6.4ms   med=823.29ms max=19.49s p(90)=1.62s    p(95)=1.78s    p(99.9)=17.6s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15206
     http_req_receiving.............: avg=105.02µs min=37.28µs med=99.34µs  max=3.28ms p(90)=139.85µs p(95)=152.62µs p(99.9)=963.05µs
     http_req_sending...............: avg=28.98µs  min=6.29µs  med=17.96µs  max=8.16ms p(90)=24.17µs  p(95)=28.97µs  p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=933.94ms min=6.31ms  med=823.18ms max=19.49s p(90)=1.62s    p(95)=1.78s    p(99.9)=17.6s   
     http_reqs......................: 15206   222.505123/s
     iteration_duration.............: avg=999.75ms min=100.3ms med=893.83ms max=19.49s p(90)=1.63s    p(95)=1.79s    p(99.9)=17.76s  
     iterations.....................: 14206   207.872405/s
     success_rate...................: 100.00% ✓ 14206      ✗ 0    
     vus............................: 67      min=0        max=497
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

     checks.........................: 100.00% ✓ 42060      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=14.69µs  min=1.3µs   med=3.61µs   max=8.09ms p(90)=5.36µs   p(95)=7.04µs   p(99.9)=2.03ms
     http_req_connecting............: avg=9.17µs   min=0s      med=0s       max=7.94ms p(90)=0s       p(95)=0s       p(99.9)=1.88ms
     http_req_duration..............: avg=411.96ms min=8.36ms  med=491.6ms  max=1.22s  p(90)=688.05ms p(95)=747.96ms p(99.9)=1.04s 
       { expected_response:true }...: avg=411.96ms min=8.36ms  med=491.6ms  max=1.22s  p(90)=688.05ms p(95)=747.96ms p(99.9)=1.04s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15020
     http_req_receiving.............: avg=110.96µs min=35.64µs med=96.18µs  max=68.6ms p(90)=135.79µs p(95)=148.92µs p(99.9)=933µs 
     http_req_sending...............: avg=32.08µs  min=5.92µs  med=17.76µs  max=76.1ms p(90)=23.72µs  p(95)=28.74µs  p(99.9)=2.29ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=411.82ms min=8.27ms  med=491.49ms max=1.22s  p(90)=687.9ms  p(95)=747.81ms p(99.9)=1.04s 
     http_reqs......................: 15020   202.153807/s
     iteration_duration.............: avg=441.21ms min=14.36ms med=512.14ms max=1.23s  p(90)=692.15ms p(95)=753.78ms p(99.9)=1.05s 
     iterations.....................: 14020   188.694832/s
     success_rate...................: 100.00% ✓ 14020      ✗ 0    
     vus............................: 63      min=0        max=494
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

     checks.........................: 100.00% ✓ 408552      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=22.71µs  min=1.03µs  med=2.95µs  max=64.33ms  p(90)=4.74µs   p(95)=6.02µs   p(99.9)=4.21ms  
     http_req_connecting............: avg=18.84µs  min=0s      med=0s      max=64.29ms  p(90)=0s       p(95)=0s       p(99.9)=4.02ms  
     http_req_duration..............: avg=103.68ms min=1.64ms  med=97.97ms max=328.56ms p(90)=199.87ms p(95)=218.4ms  p(99.9)=271.15ms
       { expected_response:true }...: avg=103.68ms min=1.64ms  med=97.97ms max=328.56ms p(90)=199.87ms p(95)=218.4ms  p(99.9)=271.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137184
     http_req_receiving.............: avg=242.88µs min=28.19µs med=63.13µs max=59.7ms   p(90)=181.99µs p(95)=432.66µs p(99.9)=29.72ms 
     http_req_sending...............: avg=80.99µs  min=5.22µs  med=11.73µs max=168.53ms p(90)=22.1µs   p(95)=141.74µs p(99.9)=11.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.36ms min=1.59ms  med=97.65ms max=328.44ms p(90)=199.37ms p(95)=217.72ms p(99.9)=267.38ms
     http_reqs......................: 137184  2207.879413/s
     iteration_duration.............: avg=104.73ms min=4.59ms  med=99.15ms max=366.14ms p(90)=200.45ms p(95)=218.88ms p(99.9)=272.25ms
     iterations.....................: 136184  2191.785121/s
     success_rate...................: 100.00% ✓ 136184      ✗ 0     
     vus............................: 63      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 351111      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=17.47µs  min=972ns   med=2.71µs   max=76.06ms  p(90)=4.36µs   p(95)=5.44µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=13.94µs  min=0s      med=0s       max=75.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=120.61ms min=1.79ms  med=109.54ms max=784.44ms p(90)=234.99ms p(95)=267.17ms p(99.9)=589.55ms
       { expected_response:true }...: avg=120.61ms min=1.79ms  med=109.54ms max=784.44ms p(90)=234.99ms p(95)=267.17ms p(99.9)=589.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118037
     http_req_receiving.............: avg=1.65ms   min=53.52µs med=118.83µs max=239.91ms p(90)=1.71ms   p(95)=4.61ms   p(99.9)=126.96ms
     http_req_sending...............: avg=64.2µs   min=5.36µs  med=11µs     max=68.78ms  p(90)=20.19µs  p(95)=120.9µs  p(99.9)=9.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.89ms min=1.68ms  med=108.28ms max=784.34ms p(90)=232.11ms p(95)=261.92ms p(99.9)=587.3ms 
     http_reqs......................: 118037  1895.514301/s
     iteration_duration.............: avg=121.93ms min=2.84ms  med=111.23ms max=784.65ms p(90)=235.8ms  p(95)=268.12ms p(99.9)=590.06ms
     iterations.....................: 117037  1879.455656/s
     success_rate...................: 100.00% ✓ 117037      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 206406      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.25µs   min=1.09µs  med=2.74µs   max=27.18ms  p(90)=4.41µs   p(95)=5.38µs   p(99.9)=648.97µs
     http_req_connecting............: avg=3.81µs   min=0s      med=0s       max=27.1ms   p(90)=0s       p(95)=0s       p(99.9)=578.94µs
     http_req_duration..............: avg=204.44ms min=2.09ms  med=205.51ms max=700.34ms p(90)=377.42ms p(95)=405.75ms p(99.9)=552.13ms
       { expected_response:true }...: avg=204.44ms min=2.09ms  med=205.51ms max=700.34ms p(90)=377.42ms p(95)=405.75ms p(99.9)=552.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69802
     http_req_receiving.............: avg=126.53µs min=29.99µs med=66.84µs  max=225.94ms p(90)=103.52µs p(95)=120.03µs p(99.9)=2.91ms  
     http_req_sending...............: avg=39.32µs  min=5.47µs  med=11.86µs  max=334.33ms p(90)=18.56µs  p(95)=22.27µs  p(99.9)=3.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.27ms min=2.03ms  med=205.25ms max=700.29ms p(90)=377.27ms p(95)=405.61ms p(99.9)=552.06ms
     http_reqs......................: 69802   1114.358604/s
     iteration_duration.............: avg=207.67ms min=4.88ms  med=209.01ms max=700.54ms p(90)=378.4ms  p(95)=406.58ms p(99.9)=553.04ms
     iterations.....................: 68802   1098.394038/s
     success_rate...................: 100.00% ✓ 68802       ✗ 0    
     vus............................: 87      min=0         max=497
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

     checks.........................: 100.00% ✓ 88758      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   563 kB/s
     http_req_blocked...............: avg=8.81µs   min=1.18µs  med=3.09µs   max=19.28ms  p(90)=4.82µs   p(95)=5.77µs   p(99.9)=772.47µs
     http_req_connecting............: avg=4.61µs   min=0s      med=0s       max=19.23ms  p(90)=0s       p(95)=0s       p(99.9)=703.97µs
     http_req_duration..............: avg=469.79ms min=4.1ms   med=439.32ms max=2.13s    p(90)=929.98ms p(95)=1s       p(99.9)=1.52s   
       { expected_response:true }...: avg=469.79ms min=4.1ms   med=439.32ms max=2.13s    p(90)=929.98ms p(95)=1s       p(99.9)=1.52s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30586
     http_req_receiving.............: avg=176.32µs min=31.79µs med=81.72µs  max=178.34ms p(90)=118.7µs  p(95)=132.72µs p(99.9)=23.74ms 
     http_req_sending...............: avg=33.22µs  min=5.51µs  med=14.44µs  max=274.24ms p(90)=21.51µs  p(95)=24.77µs  p(99.9)=2.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=469.58ms min=4.01ms  med=439.24ms max=2.13s    p(90)=929.87ms p(95)=1s       p(99.9)=1.52s   
     http_reqs......................: 30586   468.643087/s
     iteration_duration.............: avg=485.89ms min=7.92ms  med=456.95ms max=2.13s    p(90)=935.19ms p(95)=1s       p(99.9)=1.52s   
     iterations.....................: 29586   453.320944/s
     success_rate...................: 100.00% ✓ 29586      ✗ 0    
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

     checks.........................: 100.00% ✓ 40839      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   256 kB/s
     http_req_blocked...............: avg=17.11µs  min=1.27µs  med=3.69µs   max=9.41ms  p(90)=5.57µs   p(95)=7.55µs   p(99.9)=2.72ms  
     http_req_connecting............: avg=11.3µs   min=0s      med=0s       max=9.35ms  p(90)=0s       p(95)=0s       p(99.9)=2.61ms  
     http_req_duration..............: avg=999.28ms min=6.47ms  med=902.19ms max=6.35s   p(90)=1.98s    p(95)=2.2s     p(99.9)=5.62s   
       { expected_response:true }...: avg=999.28ms min=6.47ms  med=902.19ms max=6.35s   p(90)=1.98s    p(95)=2.2s     p(99.9)=5.62s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14613
     http_req_receiving.............: avg=105.82µs min=33.81µs med=100.7µs  max=1.91ms  p(90)=140.35µs p(95)=153.49µs p(99.9)=727.47µs
     http_req_sending...............: avg=35.7µs   min=6.11µs  med=18.14µs  max=47.46ms p(90)=24.2µs   p(95)=29.93µs  p(99.9)=3.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=999.14ms min=6.37ms  med=902.07ms max=6.35s   p(90)=1.98s    p(95)=2.2s     p(99.9)=5.62s   
     http_reqs......................: 14613   213.243322/s
     iteration_duration.............: avg=1.07s    min=66.11ms med=981.57ms max=6.36s   p(90)=2.01s    p(95)=2.22s    p(99.9)=5.65s   
     iterations.....................: 13613   198.650608/s
     success_rate...................: 100.00% ✓ 13613      ✗ 0    
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

     checks.........................: 100.00% ✓ 40494     ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=15.93µs  min=1.29µs  med=3.47µs   max=5.75ms  p(90)=5.2µs   p(95)=6.89µs   p(99.9)=2.54ms  
     http_req_connecting............: avg=10.47µs  min=0s      med=0s       max=5.69ms  p(90)=0s      p(95)=0s       p(99.9)=2.43ms  
     http_req_duration..............: avg=1s       min=8.75ms  med=915.22ms max=4.28s   p(90)=2.05s   p(95)=2.19s    p(99.9)=3.59s   
       { expected_response:true }...: avg=1s       min=8.75ms  med=915.22ms max=4.28s   p(90)=2.05s   p(95)=2.19s    p(99.9)=3.59s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 14498
     http_req_receiving.............: avg=100.89µs min=37.7µs  med=94.59µs  max=10.49ms p(90)=133.4µs p(95)=146.23µs p(99.9)=811.49µs
     http_req_sending...............: avg=31.23µs  min=5.96µs  med=17.64µs  max=32.86ms p(90)=23.22µs p(95)=28.8µs   p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s       min=8.63ms  med=915.09ms max=4.28s   p(90)=2.05s   p(95)=2.19s    p(99.9)=3.59s   
     http_reqs......................: 14498   207.33256/s
     iteration_duration.............: avg=1.07s    min=32.95ms med=1.02s    max=4.29s   p(90)=2.07s   p(95)=2.21s    p(99.9)=3.6s    
     iterations.....................: 13498   193.03179/s
     success_rate...................: 100.00% ✓ 13498     ✗ 0    
     vus............................: 27      min=0       max=500
     vus_max........................: 500     min=500     max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

