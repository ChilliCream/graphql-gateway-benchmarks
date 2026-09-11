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
| hive-router | v0.0.84 | 2,720 | 2,897 | 2,663 | 2.5% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,598 | 2,676 | 2,578 | 1.5% |  |
| fusion-nightly | 16.7.0-p.5 | 2,506 | 2,615 | 2,480 | 1.8% |  |
| fusion | 16.6.4 | 2,449 | 2,618 | 2,436 | 2.4% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,365 | 2,413 | 2,329 | 1.1% |  |
| cosmo | 0.334.0 | 1,200 | 1,244 | 1,174 | 2.0% |  |
| hive-gateway-router-runtime | 2.10.8 | 572 | 583 | 567 | 1.1% |  |
| hive-gateway | 2.10.8 | 253 | 259 | 250 | 1.0% |  |
| apollo-gateway | 2.14.3 | 229 | 238 | 227 | 1.4% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (3492 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (581522 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.7.0-p.5 | 2,400 | 2,507 | 2,392 | 1.7% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,359 | 2,458 | 2,353 | 1.6% |  |
| fusion | 16.6.4 | 2,323 | 2,414 | 2,307 | 1.6% |  |
| hive-router | v0.0.84 | 2,207 | 2,379 | 2,194 | 3.0% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,177 | 2,257 | 2,152 | 1.6% |  |
| cosmo | 0.334.0 | 1,132 | 1,171 | 1,122 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 519 | 534 | 516 | 1.1% |  |
| hive-gateway | 2.10.8 | 240 | 245 | 237 | 1.1% |  |
| apollo-gateway | 2.14.3 | 237 | 241 | 236 | 0.6% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (32740 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (399454 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 500763      ✗ 0     
     data_received..................: 15 GB   239 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=12.02µs  min=832ns   med=2.04µs  max=56.96ms  p(90)=3.35µs   p(95)=4.39µs   p(99.9)=771.01µs
     http_req_connecting............: avg=9.27µs   min=0s      med=0s      max=56.87ms  p(90)=0s       p(95)=0s       p(99.9)=747.37µs
     http_req_duration..............: avg=84.68ms  min=1.36ms  med=79.38ms max=339.39ms p(90)=163.95ms p(95)=176.7ms  p(99.9)=217.11ms
       { expected_response:true }...: avg=84.68ms  min=1.36ms  med=79.38ms max=339.39ms p(90)=163.95ms p(95)=176.7ms  p(99.9)=217.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167921
     http_req_receiving.............: avg=117.87µs min=26.21µs med=49.93µs max=49.87ms  p(90)=112.65µs p(95)=301.75µs p(99.9)=12.67ms 
     http_req_sending...............: avg=58.72µs  min=4.29µs  med=8.88µs  max=203.99ms p(90)=15.83µs  p(95)=102.91µs p(99.9)=7.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.5ms   min=1.29ms  med=79.18ms max=339.21ms p(90)=163.75ms p(95)=176.45ms p(99.9)=216.28ms
     http_reqs......................: 167921  2720.038037/s
     iteration_duration.............: avg=85.4ms   min=1.91ms  med=80.18ms max=353.47ms p(90)=164.35ms p(95)=177.02ms p(99.9)=218.36ms
     iterations.....................: 166921  2703.839717/s
     success_rate...................: 100.00% ✓ 166921      ✗ 0     
     vus............................: 90      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 482193      ✗ 0     
     data_received..................: 14 GB   228 MB/s
     data_sent......................: 194 MB  3.1 MB/s
     http_req_blocked...............: avg=16.58µs min=892ns   med=2.14µs   max=67.31ms  p(90)=3.58µs   p(95)=4.71µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=13.86µs min=0s      med=0s       max=67.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=87.91ms min=1.89ms  med=83.47ms  max=456.05ms p(90)=168.26ms p(95)=184.05ms p(99.9)=246.48ms
       { expected_response:true }...: avg=87.91ms min=1.89ms  med=83.47ms  max=456.05ms p(90)=168.26ms p(95)=184.05ms p(99.9)=246.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161731
     http_req_receiving.............: avg=1.44ms  min=50.53µs med=226.55µs max=284.91ms p(90)=3.52ms   p(95)=5.25ms   p(99.9)=34.56ms 
     http_req_sending...............: avg=65.64µs min=4.43µs  med=8.91µs   max=262.79ms p(90)=18.28µs  p(95)=104.89µs p(99.9)=8.54ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.4ms  min=1.79ms  med=81.68ms  max=455.96ms p(90)=166.72ms p(95)=182.55ms p(99.9)=244.76ms
     http_reqs......................: 161731  2598.905229/s
     iteration_duration.............: avg=88.7ms  min=5ms     med=84.39ms  max=456.27ms p(90)=168.7ms  p(95)=184.5ms  p(99.9)=247.61ms
     iterations.....................: 160731  2582.835921/s
     success_rate...................: 100.00% ✓ 160731      ✗ 0     
     vus............................: 67      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 465921      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=18.58µs min=882ns   med=2.16µs  max=68.64ms  p(90)=3.71µs   p(95)=4.82µs   p(99.9)=3.83ms  
     http_req_connecting............: avg=15.53µs min=0s      med=0s      max=68.52ms  p(90)=0s       p(95)=0s       p(99.9)=3.72ms  
     http_req_duration..............: avg=90.98ms min=1.93ms  med=79.36ms max=1.47s    p(90)=173.98ms p(95)=200.35ms p(99.9)=639.84ms
       { expected_response:true }...: avg=90.98ms min=1.93ms  med=79.36ms max=1.47s    p(90)=173.98ms p(95)=200.35ms p(99.9)=639.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156307
     http_req_receiving.............: avg=1.26ms  min=53.56µs med=97.74µs max=580.39ms p(90)=1.39ms   p(95)=3.62ms   p(99.9)=109.34ms
     http_req_sending...............: avg=70.77µs min=4.65µs  med=9.04µs  max=220.81ms p(90)=17.51µs  p(95)=104.87µs p(99.9)=9.86ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.64ms min=1.84ms  med=78.36ms max=1.47s    p(90)=172.11ms p(95)=197.68ms p(99.9)=637.91ms
     http_reqs......................: 156307  2506.394154/s
     iteration_duration.............: avg=91.84ms min=3.13ms  med=80.24ms max=1.47s    p(90)=174.54ms p(95)=200.92ms p(99.9)=641.21ms
     iterations.....................: 155307  2490.359081/s
     success_rate...................: 100.00% ✓ 155307      ✗ 0     
     vus............................: 73      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 454911      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 183 MB  2.9 MB/s
     http_req_blocked...............: avg=16.34µs min=902ns   med=2.08µs  max=79.45ms p(90)=3.45µs   p(95)=4.51µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=13.3µs  min=0s      med=0s      max=79.4ms  p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=93.3ms  min=1.94ms  med=82.48ms max=1.85s   p(90)=170.78ms p(95)=199.01ms p(99.9)=923.29ms
       { expected_response:true }...: avg=93.3ms  min=1.94ms  med=82.48ms max=1.85s   p(90)=170.78ms p(95)=199.01ms p(99.9)=923.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152637
     http_req_receiving.............: avg=1.73ms  min=49.84µs med=99.45µs max=1.25s   p(90)=1.75ms   p(95)=4.71ms   p(99.9)=133.55ms
     http_req_sending...............: avg=57.71µs min=4.56µs  med=8.76µs  max=95.41ms p(90)=15.86µs  p(95)=97.54µs  p(99.9)=7.88ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.51ms min=1.87ms  med=81.33ms max=1.85s   p(90)=168.98ms p(95)=195.1ms  p(99.9)=891.29ms
     http_reqs......................: 152637  2449.657605/s
     iteration_duration.............: avg=94.16ms min=3.49ms  med=83.34ms max=1.85s   p(90)=171.32ms p(95)=199.8ms  p(99.9)=924.45ms
     iterations.....................: 151637  2433.608694/s
     success_rate...................: 100.00% ✓ 151637      ✗ 0     
     vus............................: 74      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436827      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=16.99µs min=791ns  med=2.47µs   max=68.81ms  p(90)=4.07µs   p(95)=5.13µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=13.49µs min=0s     med=0s       max=68.65ms  p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=97.11ms min=1.63ms med=82.36ms  max=1.65s    p(90)=186.42ms p(95)=219.8ms  p(99.9)=832.32ms
       { expected_response:true }...: avg=97.11ms min=1.63ms med=82.36ms  max=1.65s    p(90)=186.42ms p(95)=219.8ms  p(99.9)=832.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146609
     http_req_receiving.............: avg=1.51ms  min=52µs   med=100.84µs max=977.46ms p(90)=1.66ms   p(95)=4.66ms   p(99.9)=102.93ms
     http_req_sending...............: avg=65.03µs min=4.47µs med=9.67µs   max=219.84ms p(90)=18.27µs  p(95)=106.81µs p(99.9)=8.89ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.52ms min=1.56ms med=81.06ms  max=1.56s    p(90)=184.18ms p(95)=215.51ms p(99.9)=821.27ms
     http_reqs......................: 146609  2365.146843/s
     iteration_duration.............: avg=98.02ms min=2.45ms med=83.49ms  max=1.65s    p(90)=187.09ms p(95)=220.73ms p(99.9)=833.05ms
     iterations.....................: 145609  2349.014498/s
     success_rate...................: 100.00% ✓ 145609      ✗ 0     
     vus............................: 55      min=0         max=498 
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

     checks.........................: 100.00% ✓ 222060      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.77µs   min=1.08µs  med=2.5µs    max=14.62ms  p(90)=4.07µs   p(95)=4.91µs   p(99.9)=534.96µs
     http_req_connecting............: avg=2.62µs   min=0s      med=0s       max=14.58ms  p(90)=0s       p(95)=0s       p(99.9)=452.02µs
     http_req_duration..............: avg=190.15ms min=1.81ms  med=189.83ms max=556.73ms p(90)=353.42ms p(95)=380.23ms p(99.9)=481.2ms 
       { expected_response:true }...: avg=190.15ms min=1.81ms  med=189.83ms max=556.73ms p(90)=353.42ms p(95)=380.23ms p(99.9)=481.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 75020
     http_req_receiving.............: avg=74.1µs   min=27.37µs med=59.87µs  max=130.6ms  p(90)=96.42µs  p(95)=111.34µs p(99.9)=1.06ms  
     http_req_sending...............: avg=30.04µs  min=4.59µs  med=10.79µs  max=151.59ms p(90)=17.09µs  p(95)=20.99µs  p(99.9)=3.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.05ms min=1.76ms  med=189.73ms max=556.65ms p(90)=353.25ms p(95)=380.16ms p(99.9)=481.14ms
     http_reqs......................: 75020   1200.70141/s
     iteration_duration.............: avg=192.95ms min=4.86ms  med=192.78ms max=556.95ms p(90)=354.23ms p(95)=380.73ms p(99.9)=481.42ms
     iterations.....................: 74020   1184.696326/s
     success_rate...................: 100.00% ✓ 74020       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 107364     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   688 kB/s
     http_req_blocked...............: avg=7.41µs   min=1.06µs  med=2.79µs   max=11.27ms p(90)=4.61µs   p(95)=5.6µs    p(99.9)=763.6µs 
     http_req_connecting............: avg=3.58µs   min=0s      med=0s       max=11.17ms p(90)=0s       p(95)=0s       p(99.9)=690.59µs
     http_req_duration..............: avg=389.85ms min=3.45ms  med=365.59ms max=1.52s   p(90)=762.47ms p(95)=821.49ms p(99.9)=1.24s   
       { expected_response:true }...: avg=389.85ms min=3.45ms  med=365.59ms max=1.52s   p(90)=762.47ms p(95)=821.49ms p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36788
     http_req_receiving.............: avg=82.21µs  min=30.6µs  med=69.59µs  max=83.76ms p(90)=108.8µs  p(95)=123.29µs p(99.9)=993.91µs
     http_req_sending...............: avg=29.04µs  min=5.18µs  med=13.68µs  max=91.42ms p(90)=21.1µs   p(95)=24.11µs  p(99.9)=2.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.74ms min=3.38ms  med=365.52ms max=1.52s   p(90)=762.37ms p(95)=821.4ms  p(99.9)=1.24s   
     http_reqs......................: 36788   572.869016/s
     iteration_duration.............: avg=400.96ms min=22.63ms med=378.5ms  max=1.53s   p(90)=765.63ms p(95)=823.85ms p(99.9)=1.25s   
     iterations.....................: 35788   557.296845/s
     success_rate...................: 100.00% ✓ 35788      ✗ 0    
     vus............................: 65      min=0        max=496
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

     checks.........................: 100.00% ✓ 48228      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   305 kB/s
     http_req_blocked...............: avg=10.09µs  min=1.15µs  med=3.17µs   max=3.75ms   p(90)=4.88µs   p(95)=6.13µs  p(99.9)=1.07ms
     http_req_connecting............: avg=5.32µs   min=0s      med=0s       max=3.69ms   p(90)=0s       p(95)=0s      p(99.9)=1.01ms
     http_req_duration..............: avg=839.61ms min=5.62ms  med=720.99ms max=18.23s   p(90)=1.4s     p(95)=1.56s   p(99.9)=16.24s
       { expected_response:true }...: avg=839.61ms min=5.62ms  med=720.99ms max=18.23s   p(90)=1.4s     p(95)=1.56s   p(99.9)=16.24s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17076
     http_req_receiving.............: avg=95.85µs  min=33.26µs med=87.65µs  max=30.88ms  p(90)=124.25µs p(95)=139.3µs p(99.9)=1.02ms
     http_req_sending...............: avg=32.22µs  min=5.81µs  med=17.31µs  max=123.12ms p(90)=22.77µs  p(95)=26.7µs  p(99.9)=2.62ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=839.49ms min=5.53ms  med=720.87ms max=18.23s   p(90)=1.4s     p(95)=1.56s   p(99.9)=16.24s
     http_reqs......................: 17076   253.455917/s
     iteration_duration.............: avg=891.85ms min=32.55ms med=773.83ms max=18.23s   p(90)=1.42s    p(95)=1.57s   p(99.9)=16.97s
     iterations.....................: 16076   238.613101/s
     success_rate...................: 100.00% ✓ 16076      ✗ 0    
     vus............................: 77      min=0        max=500
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

     checks.........................: 100.00% ✓ 47445      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   281 kB/s
     http_req_blocked...............: avg=13.16µs  min=1.07µs  med=2.98µs   max=3.53ms   p(90)=4.54µs   p(95)=5.8µs    p(99.9)=2.22ms  
     http_req_connecting............: avg=8.68µs   min=0s      med=0s       max=3.49ms   p(90)=0s       p(95)=0s       p(99.9)=2.2ms   
     http_req_duration..............: avg=387.41ms min=7.53ms  med=436.29ms max=1.18s    p(90)=672.01ms p(95)=723.71ms p(99.9)=1.03s   
       { expected_response:true }...: avg=387.41ms min=7.53ms  med=436.29ms max=1.18s    p(90)=672.01ms p(95)=723.71ms p(99.9)=1.03s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16815
     http_req_receiving.............: avg=99.53µs  min=30.89µs med=79.72µs  max=127.81ms p(90)=118.97µs p(95)=132.6µs  p(99.9)=998.24µs
     http_req_sending...............: avg=24.81µs  min=5.66µs  med=15.49µs  max=7.31ms   p(90)=20.59µs  p(95)=24.9µs   p(99.9)=2.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.28ms min=7.42ms  med=436.18ms max=1.18s    p(90)=671.93ms p(95)=723.53ms p(99.9)=1.03s   
     http_reqs......................: 16815   229.514729/s
     iteration_duration.............: avg=411.89ms min=8.27ms  med=449.57ms max=1.19s    p(90)=677.3ms  p(95)=729.55ms p(99.9)=1.04s   
     iterations.....................: 15815   215.865325/s
     success_rate...................: 100.00% ✓ 15815      ✗ 0    
     vus............................: 63      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443202      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=16.92µs min=871ns   med=2.35µs   max=83.86ms  p(90)=4.21µs   p(95)=5.44µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=13.91µs min=0s      med=0s       max=83.71ms  p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=95.67ms min=1.59ms  med=84.03ms  max=1.25s    p(90)=178.36ms p(95)=209.38ms p(99.9)=696.85ms
       { expected_response:true }...: avg=95.67ms min=1.59ms  med=84.03ms  max=1.25s    p(90)=178.36ms p(95)=209.38ms p(99.9)=696.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148734
     http_req_receiving.............: avg=1.54ms  min=51.71µs med=104.02µs max=744.54ms p(90)=1.62ms   p(95)=4.38ms   p(99.9)=90.29ms 
     http_req_sending...............: avg=67.86µs min=4.54µs  med=9.48µs   max=196.06ms p(90)=20.04µs  p(95)=106.01µs p(99.9)=8.99ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.05ms min=1.51ms  med=82.79ms  max=1.25s    p(90)=176.54ms p(95)=206.1ms  p(99.9)=689.82ms
     http_reqs......................: 148734  2400.52521/s
     iteration_duration.............: avg=96.58ms min=2.7ms   med=85.06ms  max=1.25s    p(90)=178.94ms p(95)=210.08ms p(99.9)=697.24ms
     iterations.....................: 147734  2384.385489/s
     success_rate...................: 100.00% ✓ 147734      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 434553      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=14.11µs min=841ns   med=2.19µs   max=54.41ms  p(90)=3.86µs   p(95)=5.04µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=10.99µs min=0s      med=0s       max=54.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=97.53ms min=1.49ms  med=92.39ms  max=466.91ms p(90)=185.84ms p(95)=203.21ms p(99.9)=314.44ms
       { expected_response:true }...: avg=97.53ms min=1.49ms  med=92.39ms  max=466.91ms p(90)=185.84ms p(95)=203.21ms p(99.9)=314.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145851
     http_req_receiving.............: avg=1.48ms  min=52.28µs med=156.85µs max=238.18ms p(90)=3.33ms   p(95)=5.37ms   p(99.9)=41.89ms 
     http_req_sending...............: avg=60.94µs min=4.78µs  med=9.23µs   max=140.99ms p(90)=20.12µs  p(95)=105.54µs p(99.9)=8.24ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.99ms min=1.4ms   med=90.81ms  max=466.84ms p(90)=184.13ms p(95)=201.4ms  p(99.9)=296.32ms
     http_reqs......................: 145851  2359.100158/s
     iteration_duration.............: avg=98.45ms min=3.96ms  med=93.49ms  max=467.07ms p(90)=186.32ms p(95)=203.65ms p(99.9)=314.91ms
     iterations.....................: 144851  2342.925431/s
     success_rate...................: 100.00% ✓ 144851      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428322      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=13.78µs min=832ns  med=2.19µs   max=61.79ms  p(90)=3.86µs   p(95)=4.97µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=10.83µs min=0s     med=0s       max=61.72ms  p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=99.04ms min=1.47ms med=86.35ms  max=1.71s    p(90)=182.76ms p(95)=211.71ms p(99.9)=863.62ms
       { expected_response:true }...: avg=99.04ms min=1.47ms med=86.35ms  max=1.71s    p(90)=182.76ms p(95)=211.71ms p(99.9)=863.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143774
     http_req_receiving.............: avg=1.73ms  min=52.6µs med=109.72µs max=821.44ms p(90)=2.18ms   p(95)=5.52ms   p(99.9)=95.75ms 
     http_req_sending...............: avg=59.09µs min=4.59µs med=9.08µs   max=180.4ms  p(90)=18.41µs  p(95)=95.43µs  p(99.9)=7.71ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.25ms min=1.39ms med=84.81ms  max=1.71s    p(90)=180.82ms p(95)=208.43ms p(99.9)=853.97ms
     http_reqs......................: 143774  2323.854094/s
     iteration_duration.............: avg=99.98ms min=2.8ms  med=87.46ms  max=1.71s    p(90)=183.34ms p(95)=212.47ms p(99.9)=864.5ms 
     iterations.....................: 142774  2307.690851/s
     success_rate...................: 100.00% ✓ 142774      ✗ 0     
     vus............................: 33      min=0         max=500 
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

     checks.........................: 100.00% ✓ 407484      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 164 MB  2.7 MB/s
     http_req_blocked...............: avg=14.02µs  min=1.03µs  med=2.85µs   max=48.85ms  p(90)=4.61µs   p(95)=5.82µs   p(99.9)=695.28µs
     http_req_connecting............: avg=10.48µs  min=0s      med=0s       max=48.78ms  p(90)=0s       p(95)=0s       p(99.9)=586.31µs
     http_req_duration..............: avg=103.97ms min=1.55ms  med=98.86ms  max=304.54ms p(90)=200.45ms p(95)=215.47ms p(99.9)=257.89ms
       { expected_response:true }...: avg=103.97ms min=1.55ms  med=98.86ms  max=304.54ms p(90)=200.45ms p(95)=215.47ms p(99.9)=257.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136828
     http_req_receiving.............: avg=119.75µs min=28.36µs med=58.75µs  max=191.46ms p(90)=125.4µs  p(95)=348.99µs p(99.9)=8.41ms  
     http_req_sending...............: avg=66.02µs  min=4.95µs  med=11.29µs  max=230.1ms  p(90)=20.39µs  p(95)=126.18µs p(99.9)=8.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.79ms min=1.47ms  med=98.68ms  max=298.72ms p(90)=200.2ms  p(95)=215.23ms p(99.9)=256.67ms
     http_reqs......................: 136828  2207.273659/s
     iteration_duration.............: avg=105ms    min=3.41ms  med=100.06ms max=345.35ms p(90)=200.96ms p(95)=215.87ms p(99.9)=259.29ms
     iterations.....................: 135828  2191.14192/s
     success_rate...................: 100.00% ✓ 135828      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403191      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=16.5µs   min=1.04µs  med=2.91µs   max=49.31ms  p(90)=4.66µs   p(95)=5.82µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=12.62µs  min=0s      med=0s       max=49.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=105.11ms min=1.7ms   med=91.77ms  max=1.16s    p(90)=200.36ms p(95)=228.3ms  p(99.9)=702.14ms
       { expected_response:true }...: avg=105.11ms min=1.7ms   med=91.77ms  max=1.16s    p(90)=200.36ms p(95)=228.3ms  p(99.9)=702.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135397
     http_req_receiving.............: avg=1.7ms    min=52.86µs med=115.07µs max=626.98ms p(90)=1.98ms   p(95)=5.45ms   p(99.9)=90.57ms 
     http_req_sending...............: avg=65.29µs  min=5.1µs   med=10.91µs  max=114.27ms p(90)=20.18µs  p(95)=116.6µs  p(99.9)=8.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.34ms min=1.58ms  med=90.64ms  max=1.15s    p(90)=197.79ms p(95)=224.03ms p(99.9)=680.63ms
     http_reqs......................: 135397  2177.649235/s
     iteration_duration.............: avg=106.15ms min=3.34ms  med=92.98ms  max=1.16s    p(90)=200.92ms p(95)=229.06ms p(99.9)=703.91ms
     iterations.....................: 134397  2161.565797/s
     success_rate...................: 100.00% ✓ 134397      ✗ 0     
     vus............................: 65      min=0         max=496 
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

     checks.........................: 100.00% ✓ 209391      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=9.29µs   min=982ns   med=2.28µs   max=77.59ms  p(90)=3.98µs   p(95)=4.91µs   p(99.9)=410.47µs
     http_req_connecting............: avg=6.27µs   min=0s      med=0s       max=76.89ms  p(90)=0s       p(95)=0s       p(99.9)=351.88µs
     http_req_duration..............: avg=201.63ms min=1.9ms   med=201.94ms max=544.49ms p(90)=372.95ms p(95)=399.19ms p(99.9)=475.51ms
       { expected_response:true }...: avg=201.63ms min=1.9ms   med=201.94ms max=544.49ms p(90)=372.95ms p(95)=399.19ms p(99.9)=475.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70797
     http_req_receiving.............: avg=75.27µs  min=28.06µs med=62.8µs   max=42.75ms  p(90)=102.21µs p(95)=118.38µs p(99.9)=898.9µs 
     http_req_sending...............: avg=40.77µs  min=5.04µs  med=10.73µs  max=196.22ms p(90)=17.61µs  p(95)=21.39µs  p(99.9)=3.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.52ms min=1.84ms  med=201.82ms max=544.44ms p(90)=372.85ms p(95)=399.08ms p(99.9)=475.46ms
     http_reqs......................: 70797   1132.28489/s
     iteration_duration.............: avg=204.77ms min=4.64ms  med=205.51ms max=544.69ms p(90)=373.9ms  p(95)=399.76ms p(99.9)=476.05ms
     iterations.....................: 69797   1116.291488/s
     success_rate...................: 100.00% ✓ 69797       ✗ 0    
     vus............................: 81      min=0         max=492
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

     checks.........................: 100.00% ✓ 97938      ✗ 0    
     data_received..................: 2.9 GB  46 MB/s
     data_sent......................: 40 MB   624 kB/s
     http_req_blocked...............: avg=8.63µs   min=1.06µs  med=2.82µs   max=11.26ms  p(90)=4.62µs   p(95)=5.6µs    p(99.9)=1.39ms
     http_req_connecting............: avg=4.81µs   min=0s      med=0s       max=11.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.37ms
     http_req_duration..............: avg=426.75ms min=3.88ms  med=390.47ms max=2s       p(90)=846.6ms  p(95)=922.76ms p(99.9)=1.32s 
       { expected_response:true }...: avg=426.75ms min=3.88ms  med=390.47ms max=2s       p(90)=846.6ms  p(95)=922.76ms p(99.9)=1.32s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33646
     http_req_receiving.............: avg=87.01µs  min=30.21µs med=72.84µs  max=165.55ms p(90)=111.94µs p(95)=125.78µs p(99.9)=1.03ms
     http_req_sending...............: avg=41.45µs  min=5.09µs  med=13.25µs  max=187.61ms p(90)=20.6µs   p(95)=23.56µs  p(99.9)=3.19ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=426.62ms min=3.81ms  med=390.39ms max=2s       p(90)=846.51ms p(95)=922.68ms p(99.9)=1.32s 
     http_reqs......................: 33646   519.787388/s
     iteration_duration.............: avg=440.04ms min=23.1ms  med=409.63ms max=2s       p(90)=851ms    p(95)=925.77ms p(99.9)=1.33s 
     iterations.....................: 32646   504.338675/s
     success_rate...................: 100.00% ✓ 32646      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 46095      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   289 kB/s
     http_req_blocked...............: avg=14.73µs  min=1.55µs  med=3.86µs   max=5.15ms  p(90)=5.7µs    p(95)=7.75µs   p(99.9)=2.28ms
     http_req_connecting............: avg=8.91µs   min=0s      med=0s       max=5.09ms  p(90)=0s       p(95)=0s       p(99.9)=2.26ms
     http_req_duration..............: avg=889.97ms min=5.66ms  med=809.5ms  max=5.02s   p(90)=1.73s    p(95)=1.98s    p(99.9)=4.11s 
       { expected_response:true }...: avg=889.97ms min=5.66ms  med=809.5ms  max=5.02s   p(90)=1.73s    p(95)=1.98s    p(99.9)=4.11s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16365
     http_req_receiving.............: avg=102.37µs min=37.92µs med=93.04µs  max=27.53ms p(90)=130.62µs p(95)=147.14µs p(99.9)=1.16ms
     http_req_sending...............: avg=33.76µs  min=6.75µs  med=17.79µs  max=28.89ms p(90)=23.58µs  p(95)=28.75µs  p(99.9)=2.95ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=889.83ms min=5.57ms  med=809.38ms max=5.02s   p(90)=1.73s    p(95)=1.98s    p(99.9)=4.11s 
     http_reqs......................: 16365   240.982359/s
     iteration_duration.............: avg=947.88ms min=24.61ms med=871.91ms max=5.03s   p(90)=1.77s    p(95)=2s       p(99.9)=4.16s 
     iterations.....................: 15365   226.256887/s
     success_rate...................: 100.00% ✓ 15365      ✗ 0    
     vus............................: 12      min=0        max=500
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

     checks.........................: 100.00% ✓ 45963      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   285 kB/s
     http_req_blocked...............: avg=11.32µs  min=1.13µs  med=3.35µs   max=2.91ms  p(90)=5.22µs   p(95)=6.9µs    p(99.9)=1.2ms   
     http_req_connecting............: avg=6.21µs   min=0s      med=0s       max=2.83ms  p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=890.25ms min=7.73ms  med=803.22ms max=3.14s   p(90)=1.81s    p(95)=1.92s    p(99.9)=2.9s    
       { expected_response:true }...: avg=890.25ms min=7.73ms  med=803.22ms max=3.14s   p(90)=1.81s    p(95)=1.92s    p(99.9)=2.9s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 16321
     http_req_receiving.............: avg=100.35µs min=32.96µs med=92.32µs  max=18.69ms p(90)=131.96µs p(95)=148.96µs p(99.9)=964.96µs
     http_req_sending...............: avg=30.26µs  min=5.73µs  med=17.74µs  max=28.72ms p(90)=23.67µs  p(95)=28.81µs  p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=890.12ms min=7.61ms  med=803.13ms max=3.14s   p(90)=1.81s    p(95)=1.92s    p(99.9)=2.9s    
     http_reqs......................: 16321   237.741086/s
     iteration_duration.............: avg=948.32ms min=73.7ms  med=876.19ms max=3.15s   p(90)=1.82s    p(95)=1.93s    p(99.9)=2.91s   
     iterations.....................: 15321   223.17451/s
     success_rate...................: 100.00% ✓ 15321      ✗ 0    
     vus............................: 89      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

