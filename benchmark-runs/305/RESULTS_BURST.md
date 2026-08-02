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
| hive-router | v0.0.84 | 2,703 | 2,879 | 2,693 | 2.4% |  |
| fusion-nightly-net11 | 16.6.0-p.13 | 2,588 | 2,662 | 2,534 | 1.5% |  |
| fusion-nightly | 16.6.0-p.13 | 2,419 | 2,520 | 2,392 | 1.8% |  |
| fusion | 16.5.1 | 2,372 | 2,462 | 2,354 | 1.6% |  |
| cosmo | 0.334.0 | 1,222 | 1,268 | 1,219 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 552 | 570 | 549 | 1.3% |  |
| hive-gateway | 2.10.8 | 253 | 260 | 249 | 1.4% |  |
| apollo-gateway | 2.14.3 | 235 | 241 | 233 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (7894 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (551551 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.13 | 2,379 | 2,459 | 2,356 | 1.5% |  |
| fusion | 16.5.1 | 2,350 | 2,445 | 2,341 | 1.6% |  |
| fusion-nightly | 16.6.0-p.13 | 2,297 | 2,396 | 2,285 | 1.6% |  |
| hive-router | v0.0.84 | 2,277 | 2,385 | 2,228 | 2.0% |  |
| fusion-nightly-fed | 16.6.0-p.13 | 2,157 | 2,225 | 2,116 | 1.5% |  |
| cosmo | 0.334.0 | 1,108 | 1,158 | 1,098 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.8 | 524 | 542 | 522 | 1.3% |  |
| hive-gateway | 2.10.8 | 241 | 247 | 238 | 1.1% |  |
| apollo-gateway | 2.14.3 | 234 | 239 | 233 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (18166 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (318872 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 498135      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 201 MB  3.2 MB/s
     http_req_blocked...............: avg=12.2µs   min=882ns   med=2.07µs  max=46.23ms  p(90)=3.47µs   p(95)=4.55µs   p(99.9)=952.43µs
     http_req_connecting............: avg=9.5µs    min=0s      med=0s      max=42.44ms  p(90)=0s       p(95)=0s       p(99.9)=897.82µs
     http_req_duration..............: avg=85.11ms  min=1.47ms  med=80.47ms max=333.97ms p(90)=164.65ms p(95)=177.63ms p(99.9)=222.99ms
       { expected_response:true }...: avg=85.11ms  min=1.47ms  med=80.47ms max=333.97ms p(90)=164.65ms p(95)=177.63ms p(99.9)=222.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167045
     http_req_receiving.............: avg=114.24µs min=25.35µs med=49.51µs max=180.56ms p(90)=116.96µs p(95)=311.15µs p(99.9)=10.08ms 
     http_req_sending...............: avg=59.22µs  min=4.59µs  med=8.93µs  max=84.51ms  p(90)=16.83µs  p(95)=109.1µs  p(99.9)=7.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.94ms  min=1.41ms  med=80.3ms  max=306.36ms p(90)=164.45ms p(95)=177.41ms p(99.9)=222.32ms
     http_reqs......................: 167045  2703.917457/s
     iteration_duration.............: avg=85.86ms  min=2.2ms   med=81.29ms max=344.36ms p(90)=165.04ms p(95)=178.01ms p(99.9)=224.5ms 
     iterations.....................: 166045  2687.730696/s
     success_rate...................: 100.00% ✓ 166045      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 479568      ✗ 0     
     data_received..................: 14 GB   227 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=16.88µs  min=922ns   med=2.09µs   max=62.75ms  p(90)=3.49µs   p(95)=4.54µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=13.77µs  min=0s      med=0s       max=62.59ms  p(90)=0s       p(95)=0s       p(99.9)=966.57µs
     http_req_duration..............: avg=88.39ms  min=1.85ms  med=83.87ms  max=316.76ms p(90)=169.05ms p(95)=184.13ms p(99.9)=238.1ms 
       { expected_response:true }...: avg=88.39ms  min=1.85ms  med=83.87ms  max=316.76ms p(90)=169.05ms p(95)=184.13ms p(99.9)=238.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 160856
     http_req_receiving.............: avg=721.37µs min=51.93µs med=113.81µs max=62.79ms  p(90)=1.51ms   p(95)=2.4ms    p(99.9)=26.39ms 
     http_req_sending...............: avg=63.1µs   min=4.63µs  med=8.8µs    max=260.74ms p(90)=17µs     p(95)=104.35µs p(99.9)=8.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.61ms  min=1.78ms  med=83.06ms  max=316.55ms p(90)=168.21ms p(95)=183.31ms p(99.9)=237.18ms
     http_reqs......................: 160856  2588.182999/s
     iteration_duration.............: avg=89.19ms  min=3.97ms  med=84.79ms  max=339.59ms p(90)=169.5ms  p(95)=184.56ms p(99.9)=239.22ms
     iterations.....................: 159856  2572.092937/s
     success_rate...................: 100.00% ✓ 159856      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 450486      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=15.69µs min=872ns   med=2.05µs   max=64.26ms  p(90)=3.4µs    p(95)=4.43µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=12.86µs min=0s      med=0s       max=64.2ms   p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=94.13ms min=2.01ms  med=80.73ms  max=1.31s    p(90)=177.58ms p(95)=204.22ms p(99.9)=662.36ms
       { expected_response:true }...: avg=94.13ms min=2.01ms  med=80.73ms  max=1.31s    p(90)=177.58ms p(95)=204.22ms p(99.9)=662.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151162
     http_req_receiving.............: avg=1.42ms  min=50.81µs med=100.21µs max=554.37ms p(90)=1.7ms    p(95)=4.76ms   p(99.9)=76.13ms 
     http_req_sending...............: avg=63.7µs  min=4.39µs  med=8.72µs   max=225.22ms p(90)=16.15µs  p(95)=98.34µs  p(99.9)=8.98ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.65ms min=1.93ms  med=79.58ms  max=1.31s    p(90)=175.83ms p(95)=200.53ms p(99.9)=642.18ms
     http_reqs......................: 151162  2419.943473/s
     iteration_duration.............: avg=95.01ms min=3.22ms  med=81.69ms  max=1.31s    p(90)=178.1ms  p(95)=204.85ms p(99.9)=664.17ms
     iterations.....................: 150162  2403.934532/s
     success_rate...................: 100.00% ✓ 150162      ✗ 0     
     vus............................: 76      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441366      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 178 MB  2.8 MB/s
     http_req_blocked...............: avg=18.63µs min=962ns   med=2.58µs  max=67.67ms  p(90)=4.12µs   p(95)=5.16µs   p(99.9)=2.09ms  
     http_req_connecting............: avg=15.13µs min=0s      med=0s      max=67.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=96.04ms min=1.99ms  med=84.94ms max=1.23s    p(90)=182.47ms p(95)=212.37ms p(99.9)=620.17ms
       { expected_response:true }...: avg=96.04ms min=1.99ms  med=84.94ms max=1.23s    p(90)=182.47ms p(95)=212.37ms p(99.9)=620.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148122
     http_req_receiving.............: avg=1.33ms  min=52.97µs med=103.2µs max=424.65ms p(90)=1.61ms   p(95)=4.32ms   p(99.9)=78.18ms 
     http_req_sending...............: avg=66.53µs min=4.54µs  med=9.95µs  max=120.31ms p(90)=18.15µs  p(95)=110.69µs p(99.9)=8.47ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.64ms min=1.89ms  med=83.68ms max=1.23s    p(90)=180.88ms p(95)=209.54ms p(99.9)=613.09ms
     http_reqs......................: 148122  2372.764169/s
     iteration_duration.............: avg=96.95ms min=3.59ms  med=86.04ms max=1.23s    p(90)=183.04ms p(95)=213.14ms p(99.9)=620.45ms
     iterations.....................: 147122  2356.745183/s
     success_rate...................: 100.00% ✓ 147122      ✗ 0     
     vus............................: 77      min=0         max=493 
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

     checks.........................: 100.00% ✓ 226323      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=5.16µs   min=1.06µs  med=2.58µs   max=12.94ms  p(90)=4.25µs   p(95)=5.18µs   p(99.9)=316.46µs
     http_req_connecting............: avg=1.87µs   min=0s      med=0s       max=12.75ms  p(90)=0s       p(95)=0s       p(99.9)=234.44µs
     http_req_duration..............: avg=186.65ms min=1.88ms  med=189.31ms max=574.76ms p(90)=343.98ms p(95)=370.64ms p(99.9)=488.41ms
       { expected_response:true }...: avg=186.65ms min=1.88ms  med=189.31ms max=574.76ms p(90)=343.98ms p(95)=370.64ms p(99.9)=488.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76441
     http_req_receiving.............: avg=75.46µs  min=27.04µs med=60.62µs  max=193.04ms p(90)=97.61µs  p(95)=111.98µs p(99.9)=985.78µs
     http_req_sending...............: avg=32.61µs  min=5.08µs  med=11.02µs  max=141.45ms p(90)=17.81µs  p(95)=21.66µs  p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.54ms min=1.82ms  med=189.19ms max=574.68ms p(90)=343.89ms p(95)=370.55ms p(99.9)=488.29ms
     http_reqs......................: 76441   1222.944459/s
     iteration_duration.............: avg=189.37ms min=3.87ms  med=192.1ms  max=574.94ms p(90)=344.81ms p(95)=371.27ms p(99.9)=489.05ms
     iterations.....................: 75441   1206.945918/s
     success_rate...................: 100.00% ✓ 75441       ✗ 0    
     vus............................: 80      min=0         max=492
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

     checks.........................: 100.00% ✓ 103569     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   664 kB/s
     http_req_blocked...............: avg=7.04µs   min=1.12µs  med=3.1µs    max=3.69ms   p(90)=4.82µs   p(95)=5.83µs   p(99.9)=673.58µs
     http_req_connecting............: avg=2.92µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=643.83µs
     http_req_duration..............: avg=403.93ms min=3.53ms  med=381.77ms max=1.78s    p(90)=790.62ms p(95)=858.62ms p(99.9)=1.26s   
       { expected_response:true }...: avg=403.93ms min=3.53ms  med=381.77ms max=1.78s    p(90)=790.62ms p(95)=858.62ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35523
     http_req_receiving.............: avg=85.46µs  min=28.88µs med=69.58µs  max=196.2ms  p(90)=107.07µs p(95)=120.55µs p(99.9)=1.06ms  
     http_req_sending...............: avg=42.73µs  min=5.44µs  med=13.61µs  max=227.77ms p(90)=20.49µs  p(95)=23.57µs  p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=403.8ms  min=3.47ms  med=381.62ms max=1.78s    p(90)=790.49ms p(95)=858.49ms p(99.9)=1.26s   
     http_reqs......................: 35523   552.841972/s
     iteration_duration.............: avg=415.87ms min=26.28ms med=394.87ms max=1.79s    p(90)=794.12ms p(95)=860.84ms p(99.9)=1.27s   
     iterations.....................: 34523   537.279042/s
     success_rate...................: 100.00% ✓ 34523      ✗ 0    
     vus............................: 68      min=0        max=496
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

     checks.........................: 100.00% ✓ 48009      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   304 kB/s
     http_req_blocked...............: avg=14.13µs  min=1.04µs  med=3.31µs   max=13.31ms p(90)=5µs      p(95)=6.31µs   p(99.9)=2.09ms
     http_req_connecting............: avg=9.32µs   min=0s      med=0s       max=13.24ms p(90)=0s       p(95)=0s       p(99.9)=2.04ms
     http_req_duration..............: avg=843.56ms min=5.43ms  med=727.62ms max=16.44s  p(90)=1.48s    p(95)=1.68s    p(99.9)=14.71s
       { expected_response:true }...: avg=843.56ms min=5.43ms  med=727.62ms max=16.44s  p(90)=1.48s    p(95)=1.68s    p(99.9)=14.71s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17003
     http_req_receiving.............: avg=99.66µs  min=32.97µs med=91.75µs  max=51.13ms p(90)=127.61µs p(95)=141.91µs p(99.9)=1.02ms
     http_req_sending...............: avg=28.21µs  min=5.21µs  med=17.31µs  max=43.87ms p(90)=22.51µs  p(95)=26.57µs  p(99.9)=2.34ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=843.43ms min=5.35ms  med=727.48ms max=16.44s  p(90)=1.48s    p(95)=1.68s    p(99.9)=14.71s
     http_reqs......................: 17003   253.031456/s
     iteration_duration.............: avg=896.32ms min=35.2ms  med=784.69ms max=16.44s  p(90)=1.51s    p(95)=1.69s    p(99.9)=14.75s
     iterations.....................: 16003   238.149879/s
     success_rate...................: 100.00% ✓ 16003      ✗ 0    
     vus............................: 67      min=0        max=497
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

     checks.........................: 100.00% ✓ 48663      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   289 kB/s
     http_req_blocked...............: avg=14.13µs  min=1.23µs  med=3.64µs   max=3.93ms  p(90)=5.36µs   p(95)=6.86µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=8.81µs   min=0s      med=0s       max=3.89ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=376.48ms min=7.42ms  med=437.41ms max=1.03s   p(90)=635.42ms p(95)=675.12ms p(99.9)=940.29ms
       { expected_response:true }...: avg=376.48ms min=7.42ms  med=437.41ms max=1.03s   p(90)=635.42ms p(95)=675.12ms p(99.9)=940.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17221
     http_req_receiving.............: avg=92.8µs   min=33.52µs med=86.4µs   max=6.13ms  p(90)=124.49µs p(95)=139.67µs p(99.9)=967.54µs
     http_req_sending...............: avg=35.27µs  min=5.78µs  med=17.3µs   max=65.43ms p(90)=23.06µs  p(95)=27.55µs  p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=376.35ms min=7.29ms  med=437.32ms max=1.03s   p(90)=635.31ms p(95)=675.03ms p(99.9)=940.18ms
     http_reqs......................: 17221   235.849534/s
     iteration_duration.............: avg=399.69ms min=8.29ms  med=464.11ms max=1.04s   p(90)=640.65ms p(95)=678.36ms p(99.9)=952.1ms 
     iterations.....................: 16221   222.154073/s
     success_rate...................: 100.00% ✓ 16221      ✗ 0    
     vus............................: 55      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438219      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=13.19µs  min=901ns   med=2.19µs   max=48.65ms  p(90)=3.9µs    p(95)=5.07µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=10.01µs  min=0s      med=0s       max=48.59ms  p(90)=0s       p(95)=0s       p(99.9)=869.45µs
     http_req_duration..............: avg=96.7ms   min=1.46ms  med=91.34ms  max=374.22ms p(90)=185.07ms p(95)=200.18ms p(99.9)=260.61ms
       { expected_response:true }...: avg=96.7ms   min=1.46ms  med=91.34ms  max=374.22ms p(90)=185.07ms p(95)=200.18ms p(99.9)=260.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147073
     http_req_receiving.............: avg=795.22µs min=53.12µs med=122.12µs max=86.15ms  p(90)=1.65ms   p(95)=2.68ms   p(99.9)=27.18ms 
     http_req_sending...............: avg=58.57µs  min=4.85µs  med=9.19µs   max=142.37ms p(90)=19.03µs  p(95)=104.49µs p(99.9)=7.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.85ms  min=1.37ms  med=90.41ms  max=374.13ms p(90)=184.04ms p(95)=199.35ms p(99.9)=260.14ms
     http_reqs......................: 147073  2379.965608/s
     iteration_duration.............: avg=97.61ms  min=3.06ms  med=92.33ms  max=374.39ms p(90)=185.51ms p(95)=200.65ms p(99.9)=261.58ms
     iterations.....................: 146073  2363.783402/s
     success_rate...................: 100.00% ✓ 146073      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433791      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=16.75µs min=912ns   med=2.32µs   max=72.73ms  p(90)=4.04µs   p(95)=5.21µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=13.48µs min=0s      med=0s       max=72.56ms  p(90)=0s       p(95)=0s       p(99.9)=1.05ms  
     http_req_duration..............: avg=97.73ms min=1.61ms  med=85.95ms  max=1.18s    p(90)=186.1ms  p(95)=212.55ms p(99.9)=726.72ms
       { expected_response:true }...: avg=97.73ms min=1.61ms  med=85.95ms  max=1.18s    p(90)=186.1ms  p(95)=212.55ms p(99.9)=726.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145597
     http_req_receiving.............: avg=1.36ms  min=49.88µs med=103.43µs max=639.05ms p(90)=1.57ms   p(95)=4.01ms   p(99.9)=106.02ms
     http_req_sending...............: avg=65.43µs min=4.72µs  med=9.54µs   max=120.89ms p(90)=20.4µs   p(95)=110.67µs p(99.9)=8.45ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.3ms  min=1.49ms  med=84.87ms  max=1.18s    p(90)=184.35ms p(95)=209.11ms p(99.9)=689.87ms
     http_reqs......................: 145597  2350.959245/s
     iteration_duration.............: avg=98.66ms min=2.7ms   med=86.86ms  max=1.18s    p(90)=186.7ms  p(95)=213.27ms p(99.9)=729.11ms
     iterations.....................: 144597  2334.812214/s
     success_rate...................: 100.00% ✓ 144597      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423714      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=21.35µs  min=1.07µs  med=2.83µs   max=94.76ms p(90)=4.55µs   p(95)=5.76µs   p(99.9)=2.16ms  
     http_req_connecting............: avg=17.74µs  min=0s      med=0s       max=94.48ms p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=100.08ms min=1.54ms  med=85.94ms  max=1.87s   p(90)=189.3ms  p(95)=221.86ms p(99.9)=1.03s   
       { expected_response:true }...: avg=100.08ms min=1.54ms  med=85.94ms  max=1.87s   p(90)=189.3ms  p(95)=221.86ms p(99.9)=1.03s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 142238
     http_req_receiving.............: avg=1.95ms   min=53.94µs med=112.46µs max=1.15s   p(90)=1.97ms   p(95)=5.14ms   p(99.9)=161.54ms
     http_req_sending...............: avg=72.04µs  min=4.87µs  med=10.68µs  max=99.05ms p(90)=19.95µs  p(95)=117µs    p(99.9)=10ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.05ms  min=1.46ms  med=84.56ms  max=1.87s   p(90)=186.49ms p(95)=217.54ms p(99.9)=950.31ms
     http_reqs......................: 142238  2297.473108/s
     iteration_duration.............: avg=101.07ms min=2.93ms  med=87.09ms  max=1.87s   p(90)=190ms    p(95)=222.84ms p(99.9)=1.03s   
     iterations.....................: 141238  2281.320793/s
     success_rate...................: 100.00% ✓ 141238      ✗ 0     
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

     checks.........................: 100.00% ✓ 420774      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=18.18µs  min=1.05µs  med=2.99µs  max=73.78ms  p(90)=4.81µs   p(95)=6.07µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=14.16µs  min=0s      med=0s      max=73.71ms  p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=100.69ms min=1.54ms  med=96.95ms max=333.38ms p(90)=191.73ms p(95)=207.34ms p(99.9)=263.89ms
       { expected_response:true }...: avg=100.69ms min=1.54ms  med=96.95ms max=333.38ms p(90)=191.73ms p(95)=207.34ms p(99.9)=263.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141258
     http_req_receiving.............: avg=131.64µs min=27.93µs med=59.09µs max=43.06ms  p(90)=159.47µs p(95)=379.59µs p(99.9)=10.88ms 
     http_req_sending...............: avg=66.71µs  min=4.65µs  med=11.75µs max=68.16ms  p(90)=22.73µs  p(95)=137.48µs p(99.9)=8.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.49ms min=1.45ms  med=96.7ms  max=332.79ms p(90)=191.47ms p(95)=207.03ms p(99.9)=263.08ms
     http_reqs......................: 141258  2277.38856/s
     iteration_duration.............: avg=101.67ms min=4.32ms  med=98.07ms max=342.61ms p(90)=192.23ms p(95)=207.79ms p(99.9)=265.45ms
     iterations.....................: 140258  2261.266368/s
     success_rate...................: 100.00% ✓ 140258      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 399879      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=14.83µs  min=901ns   med=2.35µs   max=94.01ms  p(90)=4.12µs   p(95)=5.27µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=11.73µs  min=0s      med=0s       max=93.94ms  p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=105.98ms min=1.82ms  med=94.91ms  max=1.09s    p(90)=200.56ms p(95)=227.71ms p(99.9)=651.37ms
       { expected_response:true }...: avg=105.98ms min=1.82ms  med=94.91ms  max=1.09s    p(90)=200.56ms p(95)=227.71ms p(99.9)=651.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134293
     http_req_receiving.............: avg=1.53ms   min=53.21µs med=111.38µs max=611.62ms p(90)=1.74ms   p(95)=4.27ms   p(99.9)=106.74ms
     http_req_sending...............: avg=59.69µs  min=4.83µs  med=9.91µs   max=140.95ms p(90)=20.3µs   p(95)=101.19µs p(99.9)=7.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.38ms min=1.72ms  med=93.69ms  max=1.09s    p(90)=198.63ms p(95)=224.42ms p(99.9)=629.98ms
     http_reqs......................: 134293  2157.348862/s
     iteration_duration.............: avg=107.04ms min=3.54ms  med=96.1ms   max=1.09s    p(90)=201.17ms p(95)=228.46ms p(99.9)=653.21ms
     iterations.....................: 133293  2141.28437/s
     success_rate...................: 100.00% ✓ 133293      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 205509      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=4.87µs   min=992ns   med=2.36µs   max=5.27ms   p(90)=4.09µs   p(95)=5.08µs   p(99.9)=476.49µs
     http_req_connecting............: avg=1.76µs   min=0s      med=0s       max=5.21ms   p(90)=0s       p(95)=0s       p(99.9)=416.31µs
     http_req_duration..............: avg=205.36ms min=1.93ms  med=204.3ms  max=615.84ms p(90)=379.4ms  p(95)=408.03ms p(99.9)=527.25ms
       { expected_response:true }...: avg=205.36ms min=1.93ms  med=204.3ms  max=615.84ms p(90)=379.4ms  p(95)=408.03ms p(99.9)=527.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69503
     http_req_receiving.............: avg=83.2µs   min=27.93µs med=65.03µs  max=235.35ms p(90)=107.7µs  p(95)=123.46µs p(99.9)=1.03ms  
     http_req_sending...............: avg=28.28µs  min=4.81µs  med=11.14µs  max=120.54ms p(90)=18.73µs  p(95)=22.29µs  p(99.9)=2.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.24ms min=1.86ms  med=204.21ms max=615.77ms p(90)=379.32ms p(95)=407.9ms  p(99.9)=527.17ms
     http_reqs......................: 69503   1108.759483/s
     iteration_duration.............: avg=208.61ms min=5.08ms  med=207.9ms  max=616.04ms p(90)=380.43ms p(95)=408.84ms p(99.9)=527.81ms
     iterations.....................: 68503   1092.806798/s
     success_rate...................: 100.00% ✓ 68503       ✗ 0    
     vus............................: 88      min=0         max=499
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

     checks.........................: 100.00% ✓ 98931      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   630 kB/s
     http_req_blocked...............: avg=10.03µs  min=1.12µs  med=3.25µs   max=38.6ms   p(90)=5.03µs   p(95)=6.15µs   p(99.9)=1.57ms
     http_req_connecting............: avg=5.7µs    min=0s      med=0s       max=38.4ms   p(90)=0s       p(95)=0s       p(99.9)=1.53ms
     http_req_duration..............: avg=422.68ms min=3.82ms  med=394.4ms  max=1.7s     p(90)=830.9ms  p(95)=905.37ms p(99.9)=1.34s 
       { expected_response:true }...: avg=422.68ms min=3.82ms  med=394.4ms  max=1.7s     p(90)=830.9ms  p(95)=905.37ms p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33977
     http_req_receiving.............: avg=89.24µs  min=31.43µs med=75.54µs  max=107.59ms p(90)=113.67µs p(95)=127.76µs p(99.9)=1.06ms
     http_req_sending...............: avg=31.57µs  min=5.74µs  med=14.69µs  max=165.8ms  p(90)=21.64µs  p(95)=24.94µs  p(99.9)=3.21ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=422.55ms min=3.73ms  med=394.25ms max=1.7s     p(90)=830.79ms p(95)=905.27ms p(99.9)=1.34s 
     http_reqs......................: 33977   524.591629/s
     iteration_duration.............: avg=435.76ms min=21.4ms  med=408.93ms max=1.72s    p(90)=835.74ms p(95)=908.73ms p(99.9)=1.35s 
     iterations.....................: 32977   509.152019/s
     success_rate...................: 100.00% ✓ 32977      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 46038      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   290 kB/s
     http_req_blocked...............: avg=15.91µs  min=1.4µs   med=3.77µs   max=14.76ms p(90)=5.56µs   p(95)=7.41µs   p(99.9)=2.14ms
     http_req_connecting............: avg=10.29µs  min=0s      med=0s       max=14.69ms p(90)=0s       p(95)=0s       p(99.9)=2.12ms
     http_req_duration..............: avg=890.56ms min=5.88ms  med=811.91ms max=5.23s   p(90)=1.8s     p(95)=2s       p(99.9)=4.2s  
       { expected_response:true }...: avg=890.56ms min=5.88ms  med=811.91ms max=5.23s   p(90)=1.8s     p(95)=2s       p(99.9)=4.2s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16346
     http_req_receiving.............: avg=98.89µs  min=37.43µs med=88.13µs  max=41.75ms p(90)=124.39µs p(95)=140.44µs p(99.9)=1.11ms
     http_req_sending...............: avg=36.64µs  min=6.84µs  med=17.88µs  max=27.75ms p(90)=23.7µs   p(95)=28.53µs  p(99.9)=5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=890.43ms min=5.79ms  med=811.76ms max=5.23s   p(90)=1.8s     p(95)=2s       p(99.9)=4.2s  
     http_reqs......................: 16346   241.992777/s
     iteration_duration.............: avg=948.61ms min=41.4ms  med=879.6ms  max=5.23s   p(90)=1.82s    p(95)=2.01s    p(99.9)=4.24s 
     iterations.....................: 15346   227.188373/s
     success_rate...................: 100.00% ✓ 15346      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 45360      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=15.89µs  min=1.4µs   med=3.47µs   max=10.57ms  p(90)=5.29µs   p(95)=6.91µs   p(99.9)=2.22ms  
     http_req_connecting............: avg=10.46µs  min=0s      med=0s       max=10.51ms  p(90)=0s       p(95)=0s       p(99.9)=2.2ms   
     http_req_duration..............: avg=901.15ms min=7.78ms  med=809.06ms max=3.29s    p(90)=1.86s    p(95)=2.02s    p(99.9)=2.83s   
       { expected_response:true }...: avg=901.15ms min=7.78ms  med=809.06ms max=3.29s    p(90)=1.86s    p(95)=2.02s    p(99.9)=2.83s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16120
     http_req_receiving.............: avg=110.79µs min=37.92µs med=91.91µs  max=158.38ms p(90)=133.41µs p(95)=150.77µs p(99.9)=995.48µs
     http_req_sending...............: avg=41.89µs  min=5.85µs  med=18.14µs  max=114.13ms p(90)=24.16µs  p(95)=29.35µs  p(99.9)=3.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=901ms    min=7.68ms  med=808.95ms max=3.29s    p(90)=1.86s    p(95)=2.02s    p(99.9)=2.83s   
     http_reqs......................: 16120   234.061465/s
     iteration_duration.............: avg=960.71ms min=32ms    med=907.76ms max=3.29s    p(90)=1.87s    p(95)=2.03s    p(99.9)=2.84s   
     iterations.....................: 15120   219.541523/s
     success_rate...................: 100.00% ✓ 15120      ✗ 0    
     vus............................: 5       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

