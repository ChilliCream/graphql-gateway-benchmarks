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
| hive-router | v0.0.78 | 2,888 | 3,053 | 2,802 | 2.7% |  |
| fusion | 16.5.0 | 2,447 | 2,536 | 2,433 | 1.4% |  |
| cosmo | 0.329.0 | 1,191 | 1,232 | 1,183 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.2 | 572 | 583 | 570 | 0.9% |  |
| hive-gateway | 2.10.2 | 255 | 261 | 253 | 0.9% |  |
| apollo-gateway | 2.14.2 | 234 | 240 | 233 | 0.9% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (9666 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (536852 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,382 | 2,541 | 2,365 | 2.4% |  |
| fusion | 16.5.0 | 2,336 | 2,429 | 2,328 | 1.5% |  |
| cosmo | 0.329.0 | 1,142 | 1,185 | 1,132 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.2 | 525 | 546 | 522 | 1.4% |  |
| hive-gateway | 2.10.2 | 246 | 254 | 244 | 1.2% |  |
| apollo-gateway | 2.14.2 | 231 | 237 | 231 | 1.0% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (31454 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (230846 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 531591      ✗ 0     
     data_received..................: 16 GB   253 MB/s
     data_sent......................: 214 MB  3.5 MB/s
     http_req_blocked...............: avg=17.4µs   min=872ns   med=2.08µs  max=46.78ms  p(90)=3.6µs    p(95)=4.77µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=14.46µs  min=0s      med=0s      max=46.71ms  p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=79.75ms  min=1.36ms  med=73.27ms max=303.06ms p(90)=155.91ms p(95)=168.46ms p(99.9)=216.2ms 
       { expected_response:true }...: avg=79.75ms  min=1.36ms  med=73.27ms max=303.06ms p(90)=155.91ms p(95)=168.46ms p(99.9)=216.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 178197
     http_req_receiving.............: avg=140.37µs min=26.36µs med=50.7µs  max=188.17ms p(90)=141.32µs p(95)=326.04µs p(99.9)=15.13ms 
     http_req_sending...............: avg=70.2µs   min=4.5µs   med=8.97µs  max=247.34ms p(90)=17.63µs  p(95)=112.67µs p(99.9)=9.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.54ms  min=1.3ms   med=73.08ms max=302.63ms p(90)=155.66ms p(95)=168.18ms p(99.9)=215.1ms 
     http_reqs......................: 178197  2888.209658/s
     iteration_duration.............: avg=80.45ms  min=2.38ms  med=74.1ms  max=323.19ms p(90)=156.28ms p(95)=168.85ms p(99.9)=216.98ms
     iterations.....................: 177197  2872.001699/s
     success_rate...................: 100.00% ✓ 177197      ✗ 0     
     vus............................: 88      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 455520      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 184 MB  2.9 MB/s
     http_req_blocked...............: avg=15.24µs min=882ns   med=2.06µs  max=62.75ms p(90)=3.46µs   p(95)=4.52µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=12.39µs min=0s      med=0s      max=62.57ms p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=93.09ms min=2ms     med=81.76ms max=1.54s   p(90)=177.79ms p(95)=200.08ms p(99.9)=620.21ms
       { expected_response:true }...: avg=93.09ms min=2ms     med=81.76ms max=1.54s   p(90)=177.79ms p(95)=200.08ms p(99.9)=620.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152840
     http_req_receiving.............: avg=1.31ms  min=50.53µs med=96.1µs  max=589.8ms p(90)=1.56ms   p(95)=3.99ms   p(99.9)=106.92ms
     http_req_sending...............: avg=62.14µs min=4.55µs  med=8.85µs  max=187.9ms p(90)=17.31µs  p(95)=100.08µs p(99.9)=7.96ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.71ms min=1.9ms   med=80.65ms max=1.54s   p(90)=176.1ms  p(95)=197.88ms p(99.9)=589.88ms
     http_reqs......................: 152840  2447.080789/s
     iteration_duration.............: avg=93.95ms min=3.53ms  med=82.85ms max=1.54s   p(90)=178.3ms  p(95)=200.67ms p(99.9)=621.09ms
     iterations.....................: 151840  2431.070054/s
     success_rate...................: 100.00% ✓ 151840      ✗ 0     
     vus............................: 78      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 220248      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=4.76µs   min=1µs     med=2µs      max=11.56ms  p(90)=3.41µs   p(95)=4.23µs   p(99.9)=446.59µs
     http_req_connecting............: avg=2.12µs   min=0s      med=0s       max=11.5ms   p(90)=0s       p(95)=0s       p(99.9)=390.01µs
     http_req_duration..............: avg=191.79ms min=1.89ms  med=191.21ms max=597.99ms p(90)=356.47ms p(95)=382.5ms  p(99.9)=502.9ms 
       { expected_response:true }...: avg=191.79ms min=1.89ms  med=191.21ms max=597.99ms p(90)=356.47ms p(95)=382.5ms  p(99.9)=502.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 74416
     http_req_receiving.............: avg=67.64µs  min=27.11µs med=55.25µs  max=42.75ms  p(90)=90.08µs  p(95)=103.86µs p(99.9)=859.68µs
     http_req_sending...............: avg=29.85µs  min=4.85µs  med=9.55µs   max=234.81ms p(90)=15.05µs  p(95)=18.78µs  p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.69ms min=1.84ms  med=191.13ms max=597.91ms p(90)=356.38ms p(95)=382.41ms p(99.9)=502.84ms
     http_reqs......................: 74416   1191.207479/s
     iteration_duration.............: avg=194.62ms min=4.29ms  med=194.4ms  max=598.16ms p(90)=357.32ms p(95)=383.16ms p(99.9)=503.38ms
     iterations.....................: 73416   1175.200068/s
     success_rate...................: 100.00% ✓ 73416       ✗ 0    
     vus............................: 78      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 107301     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   687 kB/s
     http_req_blocked...............: avg=8.26µs   min=1.18µs  med=3.07µs   max=20.84ms p(90)=4.81µs   p(95)=5.89µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=4.23µs   min=0s      med=0s       max=20.77ms p(90)=0s       p(95)=0s       p(99.9)=991.02µs
     http_req_duration..............: avg=390.09ms min=3.47ms  med=364.48ms max=1.48s   p(90)=764.91ms p(95)=833.95ms p(99.9)=1.21s   
       { expected_response:true }...: avg=390.09ms min=3.47ms  med=364.48ms max=1.48s   p(90)=764.91ms p(95)=833.95ms p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36767
     http_req_receiving.............: avg=85.32µs  min=31.55µs med=70.97µs  max=98.4ms  p(90)=109.37µs p(95)=122.8µs  p(99.9)=1.46ms  
     http_req_sending...............: avg=22.08µs  min=5.39µs  med=13.4µs   max=19.55ms p(90)=20.6µs   p(95)=23.69µs  p(99.9)=1.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.98ms min=3.37ms  med=364.39ms max=1.48s   p(90)=764.8ms  p(95)=833.78ms p(99.9)=1.21s   
     http_reqs......................: 36767   572.507701/s
     iteration_duration.............: avg=401.24ms min=25.17ms med=376.29ms max=1.48s   p(90)=768.72ms p(95)=836.82ms p(99.9)=1.22s   
     iterations.....................: 35767   556.936464/s
     success_rate...................: 100.00% ✓ 35767      ✗ 0    
     vus............................: 66      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48543      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   308 kB/s
     http_req_blocked...............: avg=20.5µs   min=1.29µs  med=3.77µs   max=96.98ms p(90)=5.5µs    p(95)=6.92µs   p(99.9)=2.37ms  
     http_req_connecting............: avg=9.51µs   min=0s      med=0s       max=15.46ms p(90)=0s       p(95)=0s       p(99.9)=2.33ms  
     http_req_duration..............: avg=827.45ms min=5.36ms  med=701.66ms max=19.49s  p(90)=1.41s    p(95)=1.56s    p(99.9)=18.22s  
       { expected_response:true }...: avg=827.45ms min=5.36ms  med=701.66ms max=19.49s  p(90)=1.41s    p(95)=1.56s    p(99.9)=18.22s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17181
     http_req_receiving.............: avg=101.1µs  min=31.49µs med=90.72µs  max=79.55ms p(90)=128.57µs p(95)=144.14µs p(99.9)=914.49µs
     http_req_sending...............: avg=34.16µs  min=5.64µs  med=18.52µs  max=44.32ms p(90)=24.13µs  p(95)=28.59µs  p(99.9)=3.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=827.31ms min=5.29ms  med=701.52ms max=19.49s  p(90)=1.41s    p(95)=1.56s    p(99.9)=18.22s  
     http_reqs......................: 17181   255.735756/s
     iteration_duration.............: avg=878.66ms min=48.13ms med=771.06ms max=19.49s  p(90)=1.43s    p(95)=1.57s    p(99.9)=18.25s  
     iterations.....................: 16181   240.850956/s
     success_rate...................: 100.00% ✓ 16181      ✗ 0    
     vus............................: 63      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48369      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   287 kB/s
     http_req_blocked...............: avg=11.09µs  min=1.22µs med=3.38µs   max=2.52ms  p(90)=4.94µs   p(95)=6.25µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=6.11µs   min=0s     med=0s       max=2.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=413.9ms  min=7.37ms med=474.88ms max=1.21s   p(90)=701.28ms p(95)=785.36ms p(99.9)=1.1s    
       { expected_response:true }...: avg=413.9ms  min=7.37ms med=474.88ms max=1.21s   p(90)=701.28ms p(95)=785.36ms p(99.9)=1.1s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 17123
     http_req_receiving.............: avg=89.09µs  min=33.3µs med=81.97µs  max=26.75ms p(90)=118.82µs p(95)=132.51µs p(99.9)=682.64µs
     http_req_sending...............: avg=41.3µs   min=5.86µs med=15.92µs  max=90.87ms p(90)=21.31µs  p(95)=25.53µs  p(99.9)=4.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=413.77ms min=7.3ms  med=474.77ms max=1.21s   p(90)=701.16ms p(95)=785.27ms p(99.9)=1.1s    
     http_reqs......................: 17123   234.295135/s
     iteration_duration.............: avg=439.57ms min=8.05ms med=496.13ms max=1.22s   p(90)=707.83ms p(95)=794.88ms p(99.9)=1.12s   
     iterations.....................: 16123   220.612069/s
     success_rate...................: 100.00% ✓ 16123      ✗ 0    
     vus............................: 57      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 440655      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=14.12µs  min=901ns   med=2.42µs  max=45.94ms  p(90)=4.23µs   p(95)=5.46µs   p(99.9)=1ms     
     http_req_connecting............: avg=10.88µs  min=0s      med=0s      max=45.89ms  p(90)=0s       p(95)=0s       p(99.9)=934.31µs
     http_req_duration..............: avg=96.17ms  min=1.69ms  med=91.89ms max=319.22ms p(90)=184.21ms p(95)=199.45ms p(99.9)=251.48ms
       { expected_response:true }...: avg=96.17ms  min=1.69ms  med=91.89ms max=319.22ms p(90)=184.21ms p(95)=199.45ms p(99.9)=251.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147885
     http_req_receiving.............: avg=121.89µs min=24.37µs med=53.86µs max=103.25ms p(90)=126.41µs p(95)=333.29µs p(99.9)=10.72ms 
     http_req_sending...............: avg=59.15µs  min=4.68µs  med=10.25µs max=127.31ms p(90)=20.62µs  p(95)=118.61µs p(99.9)=7.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.99ms  min=1.61ms  med=91.72ms max=314.01ms p(90)=183.98ms p(95)=199.2ms  p(99.9)=250.05ms
     http_reqs......................: 147885  2382.911313/s
     iteration_duration.............: avg=97.08ms  min=4.24ms  med=92.95ms max=328.89ms p(90)=184.68ms p(95)=199.89ms p(99.9)=253.03ms
     iterations.....................: 146885  2366.798041/s
     success_rate...................: 100.00% ✓ 146885      ✗ 0     
     vus............................: 59      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 430986      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=14.55µs min=841ns   med=2.23µs  max=76.51ms  p(90)=3.88µs   p(95)=5.02µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=11.36µs min=0s      med=0s      max=76.42ms  p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=98.42ms min=1.52ms  med=86.61ms max=1.4s     p(90)=183.33ms p(95)=213.21ms p(99.9)=870.4ms 
       { expected_response:true }...: avg=98.42ms min=1.52ms  med=86.61ms max=1.4s     p(90)=183.33ms p(95)=213.21ms p(99.9)=870.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144662
     http_req_receiving.............: avg=1.49ms  min=50.68µs med=103.9µs max=1.12s    p(90)=1.71ms   p(95)=4.47ms   p(99.9)=94.2ms  
     http_req_sending...............: avg=62.31µs min=4.47µs  med=9.51µs  max=165.24ms p(90)=19.24µs  p(95)=98.67µs  p(99.9)=8.47ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.86ms min=1.44ms  med=85.49ms max=1.4s     p(90)=181.71ms p(95)=209.63ms p(99.9)=852.17ms
     http_reqs......................: 144662  2336.517612/s
     iteration_duration.............: avg=99.37ms min=3.07ms  med=87.62ms max=1.4s     p(90)=183.91ms p(95)=214.04ms p(99.9)=874.91ms
     iterations.....................: 143662  2320.366048/s
     success_rate...................: 100.00% ✓ 143662      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 211857      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=6.18µs   min=1.07µs  med=3.05µs   max=9.62ms   p(90)=4.92µs   p(95)=5.97µs   p(99.9)=513.9µs 
     http_req_connecting............: avg=2.46µs   min=0s      med=0s       max=9.56ms   p(90)=0s       p(95)=0s       p(99.9)=441.69µs
     http_req_duration..............: avg=199.27ms min=1.96ms  med=201.61ms max=546.39ms p(90)=369.05ms p(95)=396.44ms p(99.9)=480.25ms
       { expected_response:true }...: avg=199.27ms min=1.96ms  med=201.61ms max=546.39ms p(90)=369.05ms p(95)=396.44ms p(99.9)=480.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71619
     http_req_receiving.............: avg=83.72µs  min=28.28µs med=67.87µs  max=53.08ms  p(90)=109.44µs p(95)=125.07µs p(99.9)=1.32ms  
     http_req_sending...............: avg=33.27µs  min=4.77µs  med=13.29µs  max=106.91ms p(90)=20.76µs  p(95)=24.59µs  p(99.9)=3.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.15ms min=1.91ms  med=201.48ms max=546.03ms p(90)=368.92ms p(95)=396.34ms p(99.9)=480.16ms
     http_reqs......................: 71619   1142.797788/s
     iteration_duration.............: avg=202.34ms min=5.46ms  med=204.77ms max=546.67ms p(90)=370.03ms p(95)=397.24ms p(99.9)=480.76ms
     iterations.....................: 70619   1126.841159/s
     success_rate...................: 100.00% ✓ 70619       ✗ 0    
     vus............................: 88      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99072      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   631 kB/s
     http_req_blocked...............: avg=8.63µs   min=971ns   med=2.75µs   max=10.68ms p(90)=4.48µs   p(95)=5.55µs   p(99.9)=1.63ms
     http_req_connecting............: avg=4.93µs   min=0s      med=0s       max=10.51ms p(90)=0s       p(95)=0s       p(99.9)=1.61ms
     http_req_duration..............: avg=421.69ms min=3.86ms  med=392.48ms max=1.68s   p(90)=834.64ms p(95)=905.6ms  p(99.9)=1.38s 
       { expected_response:true }...: avg=421.69ms min=3.86ms  med=392.48ms max=1.68s   p(90)=834.64ms p(95)=905.6ms  p(99.9)=1.38s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34024
     http_req_receiving.............: avg=95.44µs  min=30.41µs med=74.04µs  max=200.7ms p(90)=113.62µs p(95)=128.7µs  p(99.9)=1.9ms 
     http_req_sending...............: avg=31.49µs  min=4.68µs  med=13.8µs   max=178.2ms p(90)=20.94µs  p(95)=23.87µs  p(99.9)=2.18ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=421.56ms min=3.76ms  med=392.32ms max=1.68s   p(90)=834.56ms p(95)=905.5ms  p(99.9)=1.38s 
     http_reqs......................: 34024   525.650588/s
     iteration_duration.............: avg=434.69ms min=21.84ms med=406.31ms max=1.69s   p(90)=839.03ms p(95)=908.47ms p(99.9)=1.38s 
     iterations.....................: 33024   510.201182/s
     success_rate...................: 100.00% ✓ 33024      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47052      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   296 kB/s
     http_req_blocked...............: avg=13.99µs  min=1.11µs  med=3.27µs   max=3.46ms   p(90)=5µs      p(95)=6.57µs   p(99.9)=2.18ms
     http_req_connecting............: avg=8.98µs   min=0s      med=0s       max=3.31ms   p(90)=0s       p(95)=0s       p(99.9)=2.16ms
     http_req_duration..............: avg=871.22ms min=5.75ms  med=779.83ms max=4.49s    p(90)=1.72s    p(95)=1.97s    p(99.9)=3.83s 
       { expected_response:true }...: avg=871.22ms min=5.75ms  med=779.83ms max=4.49s    p(90)=1.72s    p(95)=1.97s    p(99.9)=3.83s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16684
     http_req_receiving.............: avg=119.27µs min=31.66µs med=93.43µs  max=131.03ms p(90)=131.95µs p(95)=147.55µs p(99.9)=2.24ms
     http_req_sending...............: avg=35.92µs  min=5.65µs  med=18.3µs   max=66.17ms  p(90)=24.07µs  p(95)=29.14µs  p(99.9)=2.71ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=871.06ms min=5.66ms  med=779.74ms max=4.49s    p(90)=1.72s    p(95)=1.97s    p(99.9)=3.83s 
     http_reqs......................: 16684   246.741565/s
     iteration_duration.............: avg=926.8ms  min=44.7ms  med=842.74ms max=4.5s     p(90)=1.75s    p(95)=1.98s    p(99.9)=3.86s 
     iterations.....................: 15684   231.952452/s
     success_rate...................: 100.00% ✓ 15684      ✗ 0    
     vus............................: 78      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 44904      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   278 kB/s
     http_req_blocked...............: avg=16.29µs  min=1.39µs  med=3.54µs   max=16.85ms  p(90)=5.39µs  p(95)=7.24µs   p(99.9)=2.26ms
     http_req_connecting............: avg=9.62µs   min=0s      med=0s       max=13.1ms   p(90)=0s      p(95)=0s       p(99.9)=2.09ms
     http_req_duration..............: avg=909.9ms  min=7.79ms  med=819.96ms max=3.22s    p(90)=1.85s   p(95)=1.98s    p(99.9)=2.84s 
       { expected_response:true }...: avg=909.9ms  min=7.79ms  med=819.96ms max=3.22s    p(90)=1.85s   p(95)=1.98s    p(99.9)=2.84s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15968
     http_req_receiving.............: avg=101.92µs min=35.59µs med=90.85µs  max=14.71ms  p(90)=131.1µs p(95)=148.24µs p(99.9)=1.1ms 
     http_req_sending...............: avg=45.49µs  min=6.38µs  med=18.32µs  max=111.69ms p(90)=24.19µs p(95)=29.88µs  p(99.9)=4.24ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=909.76ms min=7.71ms  med=819.82ms max=3.22s    p(90)=1.85s   p(95)=1.98s    p(99.9)=2.84s 
     http_reqs......................: 15968   231.973721/s
     iteration_duration.............: avg=970.66ms min=34.63ms med=890.07ms max=3.23s    p(90)=1.86s   p(95)=1.98s    p(99.9)=2.87s 
     iterations.....................: 14968   217.446309/s
     success_rate...................: 100.00% ✓ 14968      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

