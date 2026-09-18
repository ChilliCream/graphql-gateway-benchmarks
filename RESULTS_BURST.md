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
| hive-router | v0.0.84 | 2,724 | 2,907 | 2,690 | 2.8% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,625 | 2,707 | 2,605 | 1.4% |  |
| fusion | 16.6.6 | 2,558 | 2,663 | 2,546 | 1.5% |  |
| fusion-nightly | 16.7.0-p.7 | 2,541 | 2,644 | 2,522 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,326 | 2,424 | 2,314 | 1.6% |  |
| cosmo | 0.334.0 | 1,224 | 1,258 | 1,217 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.8 | 565 | 585 | 561 | 1.3% |  |
| hive-gateway | 2.10.8 | 249 | 256 | 247 | 1.1% |  |
| apollo-gateway | 2.14.3 | 233 | 239 | 233 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (7659 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (523002 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.6 | 2,379 | 2,479 | 2,328 | 2.1% |  |
| hive-router | v0.0.84 | 2,378 | 2,494 | 2,367 | 1.8% |  |
| fusion-nightly | 16.7.0-p.7 | 2,365 | 2,458 | 2,353 | 1.6% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,343 | 2,450 | 2,331 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,223 | 2,318 | 2,213 | 1.6% |  |
| cosmo | 0.334.0 | 1,163 | 1,194 | 1,152 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 532 | 548 | 529 | 1.2% |  |
| hive-gateway | 2.10.8 | 237 | 246 | 235 | 1.5% |  |
| apollo-gateway | 2.14.3 | 233 | 238 | 231 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (43424 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (329157 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 500727      ✗ 0     
     data_received..................: 15 GB   239 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=16.58µs  min=901ns   med=2.31µs  max=49.9ms   p(90)=3.87µs   p(95)=4.93µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=13.65µs  min=0s      med=0s      max=49.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=84.66ms  min=1.33ms  med=79.54ms max=269.07ms p(90)=163.1ms  p(95)=176.56ms p(99.9)=224.85ms
       { expected_response:true }...: avg=84.66ms  min=1.33ms  med=79.54ms max=269.07ms p(90)=163.1ms  p(95)=176.56ms p(99.9)=224.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167909
     http_req_receiving.............: avg=138.83µs min=26.83µs med=50.81µs max=68.02ms  p(90)=132.67µs p(95)=324.23µs p(99.9)=17.67ms 
     http_req_sending...............: avg=66.97µs  min=4.73µs  med=9.46µs  max=172.97ms p(90)=17.59µs  p(95)=112.66µs p(99.9)=8.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.46ms  min=1.28ms  med=79.33ms max=257.18ms p(90)=162.87ms p(95)=176.23ms p(99.9)=223.46ms
     http_reqs......................: 167909  2724.176767/s
     iteration_duration.............: avg=85.41ms  min=1.99ms  med=80.44ms max=302.6ms  p(90)=163.48ms p(95)=176.96ms p(99.9)=225.64ms
     iterations.....................: 166909  2707.952641/s
     success_rate...................: 100.00% ✓ 166909      ✗ 0     
     vus............................: 85      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 485913      ✗ 0     
     data_received..................: 14 GB   230 MB/s
     data_sent......................: 196 MB  3.2 MB/s
     http_req_blocked...............: avg=21.14µs min=972ns   med=2.61µs   max=66.65ms  p(90)=4.23µs   p(95)=5.36µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=17.39µs min=0s      med=0s       max=59.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=87.21ms min=1.86ms  med=81.93ms  max=333.97ms p(90)=168.12ms p(95)=185.6ms  p(99.9)=251.59ms
       { expected_response:true }...: avg=87.21ms min=1.86ms  med=81.93ms  max=333.97ms p(90)=168.12ms p(95)=185.6ms  p(99.9)=251.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162971
     http_req_receiving.............: avg=1.38ms  min=52.42µs med=151.43µs max=241.66ms p(90)=3.36ms   p(95)=5.17ms   p(99.9)=37.08ms 
     http_req_sending...............: avg=74.02µs min=4.57µs  med=9.71µs   max=148.58ms p(90)=19.53µs  p(95)=119.95µs p(99.9)=10.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.76ms min=1.78ms  med=80.34ms  max=333.49ms p(90)=166.73ms p(95)=184.11ms p(99.9)=249.44ms
     http_reqs......................: 162971  2625.273613/s
     iteration_duration.............: avg=88.02ms min=4.95ms  med=82.87ms  max=342.71ms p(90)=168.6ms  p(95)=186.11ms p(99.9)=253.25ms
     iterations.....................: 161971  2609.164774/s
     success_rate...................: 100.00% ✓ 161971      ✗ 0     
     vus............................: 61      min=0         max=497 
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

     checks.........................: 100.00% ✓ 474933      ✗ 0     
     data_received..................: 14 GB   224 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=19.94µs min=912ns   med=2.14µs  max=78.37ms  p(90)=3.58µs   p(95)=4.66µs   p(99.9)=2.01ms  
     http_req_connecting............: avg=16.75µs min=0s      med=0s      max=78.29ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=89.27ms min=1.93ms  med=78.7ms  max=899.19ms p(90)=171.45ms p(95)=195.67ms p(99.9)=545.55ms
       { expected_response:true }...: avg=89.27ms min=1.93ms  med=78.7ms  max=899.19ms p(90)=171.45ms p(95)=195.67ms p(99.9)=545.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159311
     http_req_receiving.............: avg=1.39ms  min=52.76µs med=94.37µs max=560.96ms p(90)=1.49ms   p(95)=4.22ms   p(99.9)=112.86ms
     http_req_sending...............: avg=63.81µs min=4.69µs  med=8.89µs  max=89.29ms  p(90)=16.57µs  p(95)=102.64µs p(99.9)=8.85ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.81ms min=1.86ms  med=77.57ms max=898.96ms p(90)=169.42ms p(95)=192.62ms p(99.9)=533.76ms
     http_reqs......................: 159311  2558.573095/s
     iteration_duration.............: avg=90.09ms min=3.55ms  med=79.58ms max=899.37ms p(90)=171.98ms p(95)=196.34ms p(99.9)=546.7ms 
     iterations.....................: 158311  2542.512854/s
     success_rate...................: 100.00% ✓ 158311      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 471612      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 190 MB  3.1 MB/s
     http_req_blocked...............: avg=16.38µs min=902ns   med=2.11µs  max=53.3ms   p(90)=3.49µs   p(95)=4.54µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=13.3µs  min=0s      med=0s      max=53.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=89.9ms  min=1.94ms  med=77.42ms max=1.4s     p(90)=168.85ms p(95)=192.11ms p(99.9)=696.85ms
       { expected_response:true }...: avg=89.9ms  min=1.94ms  med=77.42ms max=1.4s     p(90)=168.85ms p(95)=192.11ms p(99.9)=696.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158204
     http_req_receiving.............: avg=1.38ms  min=51.55µs med=96.42µs max=508.98ms p(90)=1.59ms   p(95)=4.5ms    p(99.9)=98.79ms 
     http_req_sending...............: avg=64.64µs min=4.7µs   med=8.91µs  max=218.64ms p(90)=16.97µs  p(95)=103.65µs p(99.9)=8.45ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.45ms min=1.85ms  med=76.27ms max=1.4s     p(90)=167.08ms p(95)=189.39ms p(99.9)=665.97ms
     http_reqs......................: 158204  2541.249232/s
     iteration_duration.............: avg=90.71ms min=3.34ms  med=78.43ms max=1.4s     p(90)=169.31ms p(95)=192.68ms p(99.9)=697.46ms
     iterations.....................: 157204  2525.186115/s
     success_rate...................: 100.00% ✓ 157204      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429789      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=12.14µs min=881ns   med=2.12µs   max=39.46ms  p(90)=3.47µs   p(95)=4.44µs   p(99.9)=964.03µs
     http_req_connecting............: avg=9.42µs  min=0s      med=0s       max=39.39ms  p(90)=0s       p(95)=0s       p(99.9)=898.71µs
     http_req_duration..............: avg=98.66ms min=1.65ms  med=87.75ms  max=1.49s    p(90)=188.19ms p(95)=219.91ms p(99.9)=650.1ms 
       { expected_response:true }...: avg=98.66ms min=1.65ms  med=87.75ms  max=1.49s    p(90)=188.19ms p(95)=219.91ms p(99.9)=650.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144263
     http_req_receiving.............: avg=1.21ms  min=51.08µs med=100.69µs max=517.18ms p(90)=1.66ms   p(95)=3.82ms   p(99.9)=71.05ms 
     http_req_sending...............: avg=53.24µs min=4.42µs  med=8.94µs   max=154.96ms p(90)=15.5µs   p(95)=92.63µs  p(99.9)=7.11ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.39ms min=1.57ms  med=86.58ms  max=1.49s    p(90)=186.4ms  p(95)=217.01ms p(99.9)=649.58ms
     http_reqs......................: 144263  2326.007155/s
     iteration_duration.............: avg=99.59ms min=2.93ms  med=88.77ms  max=1.49s    p(90)=188.77ms p(95)=220.62ms p(99.9)=650.47ms
     iterations.....................: 143263  2309.883776/s
     success_rate...................: 100.00% ✓ 143263      ✗ 0     
     vus............................: 59      min=0         max=498 
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

     checks.........................: 100.00% ✓ 226761      ✗ 0    
     data_received..................: 6.7 GB  108 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=6.07µs   min=1.09µs  med=2.71µs   max=16.53ms  p(90)=4.42µs   p(95)=5.41µs   p(99.9)=441.63µs
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=16.46ms  p(90)=0s       p(95)=0s       p(99.9)=377.99µs
     http_req_duration..............: avg=186.31ms min=1.98ms  med=187.85ms max=577.96ms p(90)=345.13ms p(95)=369.39ms p(99.9)=519.69ms
       { expected_response:true }...: avg=186.31ms min=1.98ms  med=187.85ms max=577.96ms p(90)=345.13ms p(95)=369.39ms p(99.9)=519.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76587
     http_req_receiving.............: avg=77.18µs  min=29.19µs med=62.71µs  max=40.55ms  p(90)=100.04µs p(95)=114.49µs p(99.9)=1.42ms  
     http_req_sending...............: avg=36.71µs  min=5.11µs  med=11.38µs  max=247.18ms p(90)=18.23µs  p(95)=22.52µs  p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.19ms min=1.91ms  med=187.73ms max=577.89ms p(90)=345.02ms p(95)=369.3ms  p(99.9)=519.62ms
     http_reqs......................: 76587   1224.974089/s
     iteration_duration.............: avg=189.01ms min=4.8ms   med=190.76ms max=578.14ms p(90)=345.98ms p(95)=370.03ms p(99.9)=521.08ms
     iterations.....................: 75587   1208.979545/s
     success_rate...................: 100.00% ✓ 75587       ✗ 0    
     vus............................: 81      min=0         max=493
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

     checks.........................: 100.00% ✓ 105906     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   679 kB/s
     http_req_blocked...............: avg=8.67µs   min=1.19µs  med=3.09µs   max=16.82ms  p(90)=4.82µs   p(95)=5.82µs   p(99.9)=1.14ms
     http_req_connecting............: avg=4.62µs   min=0s      med=0s       max=16.75ms  p(90)=0s       p(95)=0s       p(99.9)=1.12ms
     http_req_duration..............: avg=394.97ms min=3.52ms  med=369.22ms max=1.46s    p(90)=775.06ms p(95)=841.19ms p(99.9)=1.25s 
       { expected_response:true }...: avg=394.97ms min=3.52ms  med=369.22ms max=1.46s    p(90)=775.06ms p(95)=841.19ms p(99.9)=1.25s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36302
     http_req_receiving.............: avg=82.04µs  min=30.12µs med=69.64µs  max=31.49ms  p(90)=108.65µs p(95)=123.26µs p(99.9)=1.06ms
     http_req_sending...............: avg=27.63µs  min=5.67µs  med=13.6µs   max=142.92ms p(90)=20.75µs  p(95)=23.77µs  p(99.9)=2.03ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=394.87ms min=3.41ms  med=369.13ms max=1.46s    p(90)=774.98ms p(95)=841.14ms p(99.9)=1.25s 
     http_reqs......................: 36302   565.322526/s
     iteration_duration.............: avg=406.39ms min=20.99ms med=382.09ms max=1.46s    p(90)=778.82ms p(95)=843.72ms p(99.9)=1.25s 
     iterations.....................: 35302   549.749761/s
     success_rate...................: 100.00% ✓ 35302      ✗ 0    
     vus............................: 66      min=0        max=496
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

     checks.........................: 100.00% ✓ 47391      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=13.95µs  min=1.44µs  med=3.51µs   max=21.89ms  p(90)=5.18µs   p(95)=6.58µs   p(99.9)=2.03ms
     http_req_connecting............: avg=8.81µs   min=0s      med=0s       max=21.74ms  p(90)=0s       p(95)=0s       p(99.9)=2ms   
     http_req_duration..............: avg=848.36ms min=5.64ms  med=725.4ms  max=16.95s   p(90)=1.49s    p(95)=1.64s    p(99.9)=15.42s
       { expected_response:true }...: avg=848.36ms min=5.64ms  med=725.4ms  max=16.95s   p(90)=1.49s    p(95)=1.64s    p(99.9)=15.42s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16797
     http_req_receiving.............: avg=96.02µs  min=37.02µs med=87.37µs  max=33.2ms   p(90)=123.33µs p(95)=138.74µs p(99.9)=1.08ms
     http_req_sending...............: avg=37.26µs  min=6.52µs  med=16.86µs  max=127.04ms p(90)=22.52µs  p(95)=27.32µs  p(99.9)=2.56ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=848.23ms min=5.56ms  med=725.33ms max=16.95s   p(90)=1.49s    p(95)=1.64s    p(99.9)=15.42s
     http_reqs......................: 16797   249.601175/s
     iteration_duration.............: avg=902.14ms min=23.99ms med=792.35ms max=16.95s   p(90)=1.52s    p(95)=1.65s    p(99.9)=15.46s
     iterations.....................: 15797   234.741308/s
     success_rate...................: 100.00% ✓ 15797      ✗ 0    
     vus............................: 69      min=0        max=499
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

     checks.........................: 100.00% ✓ 48177      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   286 kB/s
     http_req_blocked...............: avg=11.68µs  min=1.06µs  med=3.05µs   max=4.7ms   p(90)=4.65µs   p(95)=5.98µs   p(99.9)=1.66ms 
     http_req_connecting............: avg=6.98µs   min=0s      med=0s       max=4.56ms  p(90)=0s       p(95)=0s       p(99.9)=1.62ms 
     http_req_duration..............: avg=410.44ms min=7.44ms  med=470.46ms max=1.12s   p(90)=719.64ms p(95)=762.2ms  p(99.9)=1.06s  
       { expected_response:true }...: avg=410.44ms min=7.44ms  med=470.46ms max=1.12s   p(90)=719.64ms p(95)=762.2ms  p(99.9)=1.06s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17059
     http_req_receiving.............: avg=89.79µs  min=32.43µs med=79.9µs   max=47.28ms p(90)=119.12µs p(95)=133.59µs p(99.9)=945.9µs
     http_req_sending...............: avg=29.43µs  min=5.46µs  med=16.39µs  max=43.47ms p(90)=21.92µs  p(95)=26.19µs  p(99.9)=2.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=410.32ms min=7.35ms  med=470.35ms max=1.12s   p(90)=719.54ms p(95)=762.14ms p(99.9)=1.06s  
     http_reqs......................: 17059   233.60468/s
     iteration_duration.............: avg=435.96ms min=10.14ms med=489.16ms max=1.14s   p(90)=724.87ms p(95)=766.69ms p(99.9)=1.07s  
     iterations.....................: 16059   219.910754/s
     success_rate...................: 100.00% ✓ 16059      ✗ 0    
     vus............................: 51      min=0        max=498
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

     checks.........................: 100.00% ✓ 439023      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=16.17µs min=882ns   med=2.28µs   max=86.37ms  p(90)=4.05µs   p(95)=5.22µs   p(99.9)=1.11ms  
     http_req_connecting............: avg=13.03µs min=0s      med=0s       max=86.21ms  p(90)=0s       p(95)=0s       p(99.9)=1.05ms  
     http_req_duration..............: avg=96.57ms min=1.46ms  med=83.78ms  max=1.18s    p(90)=181.59ms p(95)=211.46ms p(99.9)=919.49ms
       { expected_response:true }...: avg=96.57ms min=1.46ms  med=83.78ms  max=1.18s    p(90)=181.59ms p(95)=211.46ms p(99.9)=919.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147341
     http_req_receiving.............: avg=1.6ms   min=52.55µs med=104.01µs max=881.78ms p(90)=1.66ms   p(95)=4.29ms   p(99.9)=104.88ms
     http_req_sending...............: avg=63.72µs min=4.78µs  med=9.34µs   max=166.23ms p(90)=19.83µs  p(95)=105.59µs p(99.9)=8.56ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.9ms  min=1.39ms  med=82.59ms  max=1.18s    p(90)=179.59ms p(95)=208.35ms p(99.9)=741.24ms
     http_reqs......................: 147341  2379.999189/s
     iteration_duration.............: avg=97.49ms min=3.03ms  med=84.93ms  max=1.18s    p(90)=182.24ms p(95)=212.31ms p(99.9)=920.48ms
     iterations.....................: 146341  2363.846189/s
     success_rate...................: 100.00% ✓ 146341      ✗ 0     
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

     checks.........................: 100.00% ✓ 439377      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=21.52µs  min=1.08µs  med=3.11µs  max=62.55ms  p(90)=5.06µs   p(95)=6.35µs   p(99.9)=2.54ms  
     http_req_connecting............: avg=17.72µs  min=0s      med=0s      max=62.49ms  p(90)=0s       p(95)=0s       p(99.9)=2.49ms  
     http_req_duration..............: avg=96.44ms  min=1.55ms  med=90.2ms  max=329.57ms p(90)=187.99ms p(95)=202.85ms p(99.9)=251.84ms
       { expected_response:true }...: avg=96.44ms  min=1.55ms  med=90.2ms  max=329.57ms p(90)=187.99ms p(95)=202.85ms p(99.9)=251.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147459
     http_req_receiving.............: avg=151.53µs min=26.37µs med=59.75µs max=53.4ms   p(90)=166.75µs p(95)=387.41µs p(99.9)=16.06ms 
     http_req_sending...............: avg=78.52µs  min=5.22µs  med=12.26µs max=239.23ms p(90)=24.18µs  p(95)=138.98µs p(99.9)=10.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.21ms  min=1.5ms   med=89.99ms max=329.2ms  p(90)=187.66ms p(95)=202.55ms p(99.9)=249.69ms
     http_reqs......................: 147459  2378.718604/s
     iteration_duration.............: avg=97.36ms  min=3.48ms  med=91.19ms max=350.51ms p(90)=188.47ms p(95)=203.27ms p(99.9)=252.87ms
     iterations.....................: 146459  2362.587214/s
     success_rate...................: 100.00% ✓ 146459      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436284      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=23.76µs min=1.03µs  med=2.83µs  max=73.29ms  p(90)=4.55µs   p(95)=5.78µs   p(99.9)=2.33ms  
     http_req_connecting............: avg=20.01µs min=0s      med=0s      max=73.21ms  p(90)=0s       p(95)=0s       p(99.9)=2.22ms  
     http_req_duration..............: avg=97.14ms min=1.56ms  med=82.96ms max=1.7s     p(90)=186.52ms p(95)=219ms    p(99.9)=668.81ms
       { expected_response:true }...: avg=97.14ms min=1.56ms  med=82.96ms max=1.7s     p(90)=186.52ms p(95)=219ms    p(99.9)=668.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146428
     http_req_receiving.............: avg=1.47ms  min=52.98µs med=107.3µs max=998.74ms p(90)=1.62ms   p(95)=4.28ms   p(99.9)=105.95ms
     http_req_sending...............: avg=77.33µs min=5.11µs  med=10.71µs max=192.81ms p(90)=20.89µs  p(95)=123.25µs p(99.9)=10.65ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.58ms min=1.44ms  med=81.76ms max=1.7s     p(90)=184.26ms p(95)=215.33ms p(99.9)=656.06ms
     http_reqs......................: 146428  2365.16325/s
     iteration_duration.............: avg=98.08ms min=3.04ms  med=84.05ms max=1.7s     p(90)=187.16ms p(95)=219.97ms p(99.9)=669.44ms
     iterations.....................: 145428  2349.010852/s
     success_rate...................: 100.00% ✓ 145428      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431916      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=20.58µs min=1.1µs   med=2.92µs   max=67.79ms  p(90)=4.77µs   p(95)=6µs      p(99.9)=2.17ms  
     http_req_connecting............: avg=16.73µs min=0s      med=0s       max=67.72ms  p(90)=0s       p(95)=0s       p(99.9)=2.08ms  
     http_req_duration..............: avg=98.09ms min=1.5ms   med=92.41ms  max=486.75ms p(90)=188.22ms p(95)=207.67ms p(99.9)=290.64ms
       { expected_response:true }...: avg=98.09ms min=1.5ms   med=92.41ms  max=486.75ms p(90)=188.22ms p(95)=207.67ms p(99.9)=290.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144972
     http_req_receiving.............: avg=1.5ms   min=54.52µs med=149.13µs max=149.54ms p(90)=3.57ms   p(95)=5.83ms   p(99.9)=38.54ms 
     http_req_sending...............: avg=71.98µs min=4.93µs  med=10.72µs  max=166.01ms p(90)=22.37µs  p(95)=124.58µs p(99.9)=9.99ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.51ms min=1.4ms   med=90.68ms  max=485.45ms p(90)=186.29ms p(95)=205.69ms p(99.9)=288.21ms
     http_reqs......................: 144972  2343.366946/s
     iteration_duration.............: avg=99.05ms min=4.25ms  med=93.43ms  max=486.94ms p(90)=188.79ms p(95)=208.17ms p(99.9)=291.71ms
     iterations.....................: 143972  2327.202674/s
     success_rate...................: 100.00% ✓ 143972      ✗ 0     
     vus............................: 4       min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 412413      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=16.11µs  min=882ns   med=2.44µs   max=54.4ms   p(90)=4.49µs   p(95)=5.64µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=12.77µs  min=0s      med=0s       max=54.26ms  p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=102.79ms min=1.74ms  med=91.79ms  max=1.35s    p(90)=191.37ms p(95)=220.54ms p(99.9)=920.38ms
       { expected_response:true }...: avg=102.79ms min=1.74ms  med=91.79ms  max=1.35s    p(90)=191.37ms p(95)=220.54ms p(99.9)=920.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138471
     http_req_receiving.............: avg=1.54ms   min=50.71µs med=106.46µs max=893.18ms p(90)=1.51ms   p(95)=3.78ms   p(99.9)=92.83ms 
     http_req_sending...............: avg=67.32µs  min=4.58µs  med=10.18µs  max=156.81ms p(90)=22.16µs  p(95)=109.32µs p(99.9)=8.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.18ms min=1.66ms  med=90.59ms  max=1.29s    p(90)=189.65ms p(95)=217.75ms p(99.9)=719.53ms
     http_reqs......................: 138471  2223.756949/s
     iteration_duration.............: avg=103.79ms min=3.12ms  med=92.94ms  max=1.35s    p(90)=191.96ms p(95)=221.29ms p(99.9)=929.91ms
     iterations.....................: 137471  2207.69758/s
     success_rate...................: 100.00% ✓ 137471      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 215805      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=7.22µs   min=1.09µs  med=3.15µs   max=26ms     p(90)=5.04µs   p(95)=6.1µs    p(99.9)=506.87µs
     http_req_connecting............: avg=3.29µs   min=0s      med=0s       max=25.92ms  p(90)=0s       p(95)=0s       p(99.9)=407.62µs
     http_req_duration..............: avg=195.65ms min=2.01ms  med=197.89ms max=507.76ms p(90)=361.36ms p(95)=387.29ms p(99.9)=465.35ms
       { expected_response:true }...: avg=195.65ms min=2.01ms  med=197.89ms max=507.76ms p(90)=361.36ms p(95)=387.29ms p(99.9)=465.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72935
     http_req_receiving.............: avg=87.85µs  min=27.83µs med=69.26µs  max=105.6ms  p(90)=111.69µs p(95)=128.44µs p(99.9)=1.89ms  
     http_req_sending...............: avg=37.98µs  min=5.18µs  med=13.26µs  max=200.37ms p(90)=21.05µs  p(95)=25.13µs  p(99.9)=3.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.52ms min=1.92ms  med=197.75ms max=507.71ms p(90)=361.27ms p(95)=387.17ms p(99.9)=465.15ms
     http_reqs......................: 72935   1163.588767/s
     iteration_duration.............: avg=198.63ms min=4.49ms  med=201.11ms max=507.96ms p(90)=362.22ms p(95)=388ms    p(99.9)=466.34ms
     iterations.....................: 71935   1147.634989/s
     success_rate...................: 100.00% ✓ 71935       ✗ 0    
     vus............................: 89      min=0         max=499
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

     checks.........................: 100.00% ✓ 100479     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   639 kB/s
     http_req_blocked...............: avg=8.1µs    min=1.05µs  med=2.87µs   max=7.75ms  p(90)=4.57µs   p(95)=5.57µs   p(99.9)=969.68µs
     http_req_connecting............: avg=4.29µs   min=0s      med=0s       max=7.67ms  p(90)=0s       p(95)=0s       p(99.9)=943.45µs
     http_req_duration..............: avg=416.02ms min=3.8ms   med=389.27ms max=1.77s   p(90)=811.25ms p(95)=886.1ms  p(99.9)=1.36s   
       { expected_response:true }...: avg=416.02ms min=3.8ms   med=389.27ms max=1.77s   p(90)=811.25ms p(95)=886.1ms  p(99.9)=1.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34493
     http_req_receiving.............: avg=83.26µs  min=29.26µs med=73.42µs  max=38.41ms p(90)=112.38µs p(95)=126.01µs p(99.9)=1.08ms  
     http_req_sending...............: avg=25.93µs  min=4.77µs  med=13.71µs  max=65.61ms p(90)=21.03µs  p(95)=23.8µs   p(99.9)=2.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=415.91ms min=3.73ms  med=389.18ms max=1.77s   p(90)=811.15ms p(95)=885.99ms p(99.9)=1.36s   
     http_reqs......................: 34493   532.188069/s
     iteration_duration.............: avg=428.66ms min=18.52ms med=404.88ms max=1.78s   p(90)=815.46ms p(95)=888.73ms p(99.9)=1.36s   
     iterations.....................: 33493   516.759198/s
     success_rate...................: 100.00% ✓ 33493      ✗ 0    
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

     checks.........................: 100.00% ✓ 45396      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   285 kB/s
     http_req_blocked...............: avg=13.51µs  min=1.48µs  med=3.84µs   max=7.61ms  p(90)=5.68µs   p(95)=7.68µs   p(99.9)=1.64ms
     http_req_connecting............: avg=7.61µs   min=0s      med=0s       max=7.56ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms
     http_req_duration..............: avg=903.93ms min=5.9ms   med=818.21ms max=5.3s    p(90)=1.79s    p(95)=2.05s    p(99.9)=4.44s 
       { expected_response:true }...: avg=903.93ms min=5.9ms   med=818.21ms max=5.3s    p(90)=1.79s    p(95)=2.05s    p(99.9)=4.44s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16132
     http_req_receiving.............: avg=100.42µs min=35.9µs  med=92µs     max=8.29ms  p(90)=131.48µs p(95)=148.61µs p(99.9)=1.39ms
     http_req_sending...............: avg=39.34µs  min=6.41µs  med=17.56µs  max=62.47ms p(90)=23.13µs  p(95)=28.45µs  p(99.9)=4.35ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=903.79ms min=5.82ms  med=818.08ms max=5.3s    p(90)=1.79s    p(95)=2.05s    p(99.9)=4.44s 
     http_reqs......................: 16132   237.701865/s
     iteration_duration.............: avg=963.68ms min=28.02ms med=887.43ms max=5.31s   p(90)=1.83s    p(95)=2.07s    p(99.9)=4.51s 
     iterations.....................: 15132   222.96706/s
     success_rate...................: 100.00% ✓ 15132      ✗ 0    
     vus............................: 7       min=0        max=500
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

     checks.........................: 100.00% ✓ 45243      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=14.44µs  min=1.27µs  med=3.55µs   max=5.04ms  p(90)=5.3µs    p(95)=7.01µs   p(99.9)=2.32ms  
     http_req_connecting............: avg=8.98µs   min=0s      med=0s       max=4.98ms  p(90)=0s       p(95)=0s       p(99.9)=2.26ms  
     http_req_duration..............: avg=903.23ms min=7.83ms  med=814.21ms max=3.01s   p(90)=1.83s    p(95)=1.97s    p(99.9)=2.72s   
       { expected_response:true }...: avg=903.23ms min=7.83ms  med=814.21ms max=3.01s   p(90)=1.83s    p(95)=1.97s    p(99.9)=2.72s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16081
     http_req_receiving.............: avg=97.04µs  min=34.16µs med=89.13µs  max=6.15ms  p(90)=129.75µs p(95)=147.57µs p(99.9)=980.62µs
     http_req_sending...............: avg=31.01µs  min=5.98µs  med=17.21µs  max=41.25ms p(90)=23.38µs  p(95)=28.12µs  p(99.9)=1.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=903.11ms min=7.73ms  med=814.1ms  max=3.01s   p(90)=1.83s    p(95)=1.97s    p(99.9)=2.72s   
     http_reqs......................: 16081   233.745299/s
     iteration_duration.............: avg=963.09ms min=42.23ms med=899.19ms max=3.01s   p(90)=1.85s    p(95)=1.97s    p(99.9)=2.78s   
     iterations.....................: 15081   219.209803/s
     success_rate...................: 100.00% ✓ 15081      ✗ 0    
     vus............................: 97      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

