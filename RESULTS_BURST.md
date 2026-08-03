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
| hive-router | v0.0.84 | 2,787 | 2,968 | 2,738 | 2.7% |  |
| fusion | 16.5.1 | 2,514 | 2,601 | 2,497 | 1.4% |  |
| fusion-nightly-net11 | 16.6.0-p.13 | 2,507 | 2,614 | 2,495 | 1.8% |  |
| fusion-nightly | 16.6.0-p.13 | 2,463 | 2,552 | 2,448 | 1.5% |  |
| cosmo | 0.334.0 | 1,194 | 1,237 | 1,185 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 563 | 576 | 561 | 1.0% |  |
| hive-gateway | 2.10.8 | 258 | 265 | 252 | 1.6% |  |
| apollo-gateway | 2.14.3 | 231 | 237 | 230 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (8512 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (570411 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.6.0-p.13 | 2,393 | 2,493 | 2,386 | 1.6% |  |
| fusion-nightly-net11 | 16.6.0-p.13 | 2,367 | 2,469 | 2,355 | 1.6% |  |
| fusion | 16.5.1 | 2,336 | 2,430 | 2,330 | 1.5% |  |
| fusion-nightly-fed | 16.6.0-p.13 | 2,207 | 2,297 | 2,195 | 1.6% |  |
| hive-router | v0.0.84 | 2,191 | 2,356 | 2,170 | 2.8% |  |
| cosmo | 0.334.0 | 1,121 | 1,167 | 1,110 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 531 | 547 | 527 | 1.4% |  |
| hive-gateway | 2.10.8 | 247 | 255 | 246 | 1.2% |  |
| apollo-gateway | 2.14.3 | 234 | 239 | 233 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (25234 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (291177 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 512664      ✗ 0     
     data_received..................: 15 GB   245 MB/s
     data_sent......................: 207 MB  3.3 MB/s
     http_req_blocked...............: avg=23.96µs  min=1.01µs  med=2.75µs  max=61.2ms   p(90)=4.54µs   p(95)=5.78µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=20.15µs  min=0s      med=0s      max=61.15ms  p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=82.67ms  min=1.47ms  med=78.39ms max=376.61ms p(90)=158.44ms p(95)=174.08ms p(99.9)=230.37ms
       { expected_response:true }...: avg=82.67ms  min=1.47ms  med=78.39ms max=376.61ms p(90)=158.44ms p(95)=174.08ms p(99.9)=230.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 171888
     http_req_receiving.............: avg=223.81µs min=25.97µs med=52.7µs  max=284.68ms p(90)=164.42µs p(95)=367.81µs p(99.9)=27.51ms 
     http_req_sending...............: avg=76.7µs   min=4.72µs  med=10.11µs max=293.17ms p(90)=20.11µs  p(95)=127.61µs p(99.9)=10.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.37ms  min=1.42ms  med=78.19ms max=259.51ms p(90)=157.92ms p(95)=173.59ms p(99.9)=224.89ms
     http_reqs......................: 171888  2787.350182/s
     iteration_duration.............: avg=83.42ms  min=2.08ms  med=79.16ms max=392.2ms  p(90)=158.92ms p(95)=174.56ms p(99.9)=231.49ms
     iterations.....................: 170888  2771.134098/s
     success_rate...................: 100.00% ✓ 170888      ✗ 0     
     vus............................: 87      min=0         max=496 
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

     checks.........................: 100.00% ✓ 467496      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=20.24µs min=972ns   med=2.51µs  max=111.68ms p(90)=4.09µs   p(95)=5.22µs   p(99.9)=2.37ms  
     http_req_connecting............: avg=16.92µs min=0s      med=0s      max=111.55ms p(90)=0s       p(95)=0s       p(99.9)=2.2ms   
     http_req_duration..............: avg=90.66ms min=1.96ms  med=77.16ms max=1.18s    p(90)=173.48ms p(95)=200.91ms p(99.9)=628.99ms
       { expected_response:true }...: avg=90.66ms min=1.96ms  med=77.16ms max=1.18s    p(90)=173.48ms p(95)=200.91ms p(99.9)=628.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156832
     http_req_receiving.............: avg=1.52ms  min=48.18µs med=98.23µs max=544.26ms p(90)=1.54ms   p(95)=4.22ms   p(99.9)=130.06ms
     http_req_sending...............: avg=72.3µs  min=4.76µs  med=9.48µs  max=142.28ms p(90)=17.64µs  p(95)=115.2µs  p(99.9)=10.65ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.06ms min=1.87ms  med=76.07ms max=1.18s    p(90)=171.33ms p(95)=198.02ms p(99.9)=603.61ms
     http_reqs......................: 156832  2514.016179/s
     iteration_duration.............: avg=91.52ms min=3.47ms  med=78.15ms max=1.18s    p(90)=174.03ms p(95)=201.77ms p(99.9)=629.59ms
     iterations.....................: 155832  2497.986184/s
     success_rate...................: 100.00% ✓ 155832      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 465711      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=18.1µs   min=962ns   med=2.46µs   max=57.24ms  p(90)=3.92µs   p(95)=4.9µs    p(99.9)=1.35ms  
     http_req_connecting............: avg=14.85µs  min=0s      med=0s       max=49.63ms  p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=91.01ms  min=1.89ms  med=86.07ms  max=315.62ms p(90)=174.19ms p(95)=190.88ms p(99.9)=246.98ms
       { expected_response:true }...: avg=91.01ms  min=1.89ms  med=86.07ms  max=315.62ms p(90)=174.19ms p(95)=190.88ms p(99.9)=246.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156237
     http_req_receiving.............: avg=757.68µs min=51.64µs med=121.85µs max=304.6ms  p(90)=1.51ms   p(95)=2.44ms   p(99.9)=26.65ms 
     http_req_sending...............: avg=66.14µs  min=4.62µs  med=9.41µs   max=283.46ms p(90)=17.69µs  p(95)=114.92µs p(99.9)=8.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.19ms  min=1.81ms  med=85.14ms  max=297.6ms  p(90)=173.35ms p(95)=190ms    p(99.9)=245.67ms
     http_reqs......................: 156237  2507.213518/s
     iteration_duration.............: avg=91.85ms  min=3.69ms  med=87.01ms  max=348.11ms p(90)=174.7ms  p(95)=191.33ms p(99.9)=247.67ms
     iterations.....................: 155237  2491.166016/s
     success_rate...................: 100.00% ✓ 155237      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 458277      ✗ 0     
     data_received..................: 14 GB   216 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=18.8µs  min=931ns   med=2.46µs  max=63.01ms  p(90)=3.94µs   p(95)=5.02µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=15.63µs min=0s      med=0s      max=62.94ms  p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=92.51ms min=1.96ms  med=80.96ms max=1.4s     p(90)=172.95ms p(95)=200.89ms p(99.9)=796.62ms
       { expected_response:true }...: avg=92.51ms min=1.96ms  med=80.96ms max=1.4s     p(90)=172.95ms p(95)=200.89ms p(99.9)=796.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153759
     http_req_receiving.............: avg=1.43ms  min=51.93µs med=99.54µs max=715.93ms p(90)=1.64ms   p(95)=4.5ms    p(99.9)=88.59ms 
     http_req_sending...............: avg=62.26µs min=4.68µs  med=9.34µs  max=99.38ms  p(90)=16.67µs  p(95)=109.73µs p(99.9)=8.79ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.01ms min=1.88ms  med=79.88ms max=1.4s     p(90)=171ms    p(95)=197.94ms p(99.9)=735.12ms
     http_reqs......................: 153759  2463.621543/s
     iteration_duration.............: avg=93.38ms min=3.21ms  med=81.84ms max=1.4s     p(90)=173.54ms p(95)=201.57ms p(99.9)=796.86ms
     iterations.....................: 152759  2447.598926/s
     success_rate...................: 100.00% ✓ 152759      ✗ 0     
     vus............................: 76      min=0         max=493 
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

     checks.........................: 100.00% ✓ 220920      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.26µs   min=1.1µs   med=2.64µs   max=14.25ms  p(90)=4.26µs   p(95)=5.15µs   p(99.9)=607.15µs
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=14.06ms  p(90)=0s       p(95)=0s       p(99.9)=548.45µs
     http_req_duration..............: avg=191.18ms min=2.01ms  med=191.75ms max=508.77ms p(90)=356ms    p(95)=382.32ms p(99.9)=457.18ms
       { expected_response:true }...: avg=191.18ms min=2.01ms  med=191.75ms max=508.77ms p(90)=356ms    p(95)=382.32ms p(99.9)=457.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74640
     http_req_receiving.............: avg=74.53µs  min=28.75µs med=61.36µs  max=44.44ms  p(90)=98.28µs  p(95)=113.71µs p(99.9)=1.2ms   
     http_req_sending...............: avg=30.31µs  min=5.33µs  med=11.21µs  max=106.95ms p(90)=17.65µs  p(95)=21.31µs  p(99.9)=3.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.08ms min=1.92ms  med=191.64ms max=508.67ms p(90)=355.88ms p(95)=382.21ms p(99.9)=457.11ms
     http_reqs......................: 74640   1194.189338/s
     iteration_duration.............: avg=194.01ms min=4.05ms  med=194.76ms max=508.95ms p(90)=356.88ms p(95)=382.96ms p(99.9)=457.73ms
     iterations.....................: 73640   1178.190017/s
     success_rate...................: 100.00% ✓ 73640       ✗ 0    
     vus............................: 79      min=0         max=493
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

     checks.........................: 100.00% ✓ 105540     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 43 MB   676 kB/s
     http_req_blocked...............: avg=9.14µs   min=1.21µs  med=3.08µs   max=16.05ms  p(90)=4.81µs   p(95)=5.85µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=5.06µs   min=0s      med=0s       max=15.98ms  p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=396.51ms min=3.48ms  med=364.98ms max=1.61s    p(90)=785.06ms p(95)=845.21ms p(99.9)=1.22s   
       { expected_response:true }...: avg=396.51ms min=3.48ms  med=364.98ms max=1.61s    p(90)=785.06ms p(95)=845.21ms p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36180
     http_req_receiving.............: avg=86.61µs  min=30.63µs med=69.21µs  max=157.37ms p(90)=107.84µs p(95)=122.08µs p(99.9)=920.55µs
     http_req_sending...............: avg=25.63µs  min=5.35µs  med=13.46µs  max=69.79ms  p(90)=20.6µs   p(95)=23.67µs  p(99.9)=2.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=396.4ms  min=3.42ms  med=364.86ms max=1.61s    p(90)=784.97ms p(95)=845.1ms  p(99.9)=1.22s   
     http_reqs......................: 36180   563.233903/s
     iteration_duration.............: avg=408.02ms min=21.12ms med=378.87ms max=1.61s    p(90)=788.33ms p(95)=848.75ms p(99.9)=1.23s   
     iterations.....................: 35180   547.666354/s
     success_rate...................: 100.00% ✓ 35180      ✗ 0    
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

     checks.........................: 100.00% ✓ 48978      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   311 kB/s
     http_req_blocked...............: avg=14.24µs  min=1.17µs  med=3.38µs   max=13.83ms  p(90)=5.14µs   p(95)=6.51µs   p(99.9)=2.31ms
     http_req_connecting............: avg=9.3µs    min=0s      med=0s       max=13.77ms  p(90)=0s       p(95)=0s       p(99.9)=2.26ms
     http_req_duration..............: avg=830.73ms min=5.26ms  med=733.62ms max=17.4s    p(90)=1.44s    p(95)=1.67s    p(99.9)=16.83s
       { expected_response:true }...: avg=830.73ms min=5.26ms  med=733.62ms max=17.4s    p(90)=1.44s    p(95)=1.67s    p(99.9)=16.83s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17326
     http_req_receiving.............: avg=103.76µs min=34.16µs med=92.05µs  max=100.55ms p(90)=129.28µs p(95)=145.66µs p(99.9)=1.16ms
     http_req_sending...............: avg=47.95µs  min=5.22µs  med=17.84µs  max=145.05ms p(90)=23.18µs  p(95)=27.17µs  p(99.9)=3.53ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=830.57ms min=5.18ms  med=733.5ms  max=17.4s    p(90)=1.44s    p(95)=1.67s    p(99.9)=16.83s
     http_reqs......................: 17326   258.598635/s
     iteration_duration.............: avg=881.7ms  min=24.51ms med=794.72ms max=17.4s    p(90)=1.46s    p(95)=1.68s    p(99.9)=16.84s
     iterations.....................: 16326   243.673168/s
     success_rate...................: 100.00% ✓ 16326      ✗ 0    
     vus............................: 48      min=0        max=500
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

     checks.........................: 100.00% ✓ 47754      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   284 kB/s
     http_req_blocked...............: avg=14.37µs  min=1.27µs  med=3.36µs   max=11.35ms p(90)=5µs      p(95)=6.35µs   p(99.9)=2.26ms  
     http_req_connecting............: avg=9.41µs   min=0s      med=0s       max=11.29ms p(90)=0s       p(95)=0s       p(99.9)=2.24ms  
     http_req_duration..............: avg=390.78ms min=7.25ms  med=462.56ms max=1.04s   p(90)=642.48ms p(95)=690.21ms p(99.9)=970.7ms 
       { expected_response:true }...: avg=390.78ms min=7.25ms  med=462.56ms max=1.04s   p(90)=642.48ms p(95)=690.21ms p(99.9)=970.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16918
     http_req_receiving.............: avg=94.91µs  min=35.58µs med=81.47µs  max=74.07ms p(90)=118.01µs p(95)=133.12µs p(99.9)=1.05ms  
     http_req_sending...............: avg=37.26µs  min=6.21µs  med=16.62µs  max=76.12ms p(90)=22.39µs  p(95)=26.99µs  p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=390.65ms min=7.17ms  med=462.46ms max=1.04s   p(90)=642.39ms p(95)=690.04ms p(99.9)=970.59ms
     http_reqs......................: 16918   231.889869/s
     iteration_duration.............: avg=415.31ms min=12.63ms med=476.01ms max=1.04s   p(90)=648.39ms p(95)=695.09ms p(99.9)=978.21ms
     iterations.....................: 15918   218.183174/s
     success_rate...................: 100.00% ✓ 15918      ✗ 0    
     vus............................: 50      min=0        max=498
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 441213      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=15.89µs min=861ns   med=2.18µs   max=83.32ms p(90)=3.87µs   p(95)=5.01µs   p(99.9)=1.04ms  
     http_req_connecting............: avg=12.95µs min=0s      med=0s       max=83.16ms p(90)=0s       p(95)=0s       p(99.9)=909.91µs
     http_req_duration..............: avg=96.06ms min=1.51ms  med=84.67ms  max=1.83s   p(90)=179.37ms p(95)=208.63ms p(99.9)=878.81ms
       { expected_response:true }...: avg=96.06ms min=1.51ms  med=84.67ms  max=1.83s   p(90)=179.37ms p(95)=208.63ms p(99.9)=878.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148071
     http_req_receiving.............: avg=1.73ms  min=53.42µs med=102.55µs max=1.75s   p(90)=1.65ms   p(95)=4.39ms   p(99.9)=125.15ms
     http_req_sending...............: avg=60.25µs min=4.24µs  med=9.18µs   max=68.69ms p(90)=18.9µs   p(95)=102.21µs p(99.9)=8.13ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.26ms min=1.42ms  med=83.45ms  max=1.83s   p(90)=177.86ms p(95)=205.29ms p(99.9)=826.9ms 
     http_reqs......................: 148071  2393.300991/s
     iteration_duration.............: avg=97.04ms min=2.66ms  med=85.73ms  max=1.83s   p(90)=179.94ms p(95)=209.6ms  p(99.9)=880.64ms
     iterations.....................: 147071  2377.137792/s
     success_rate...................: 100.00% ✓ 147071      ✗ 0     
     vus............................: 51      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 435804      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=13.36µs  min=861ns  med=2.15µs   max=55.75ms  p(90)=3.73µs   p(95)=4.8µs    p(99.9)=1.17ms  
     http_req_connecting............: avg=10.56µs  min=0s     med=0s       max=55.7ms   p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=97.24ms  min=1.42ms med=92.88ms  max=378.76ms p(90)=184.71ms p(95)=200.1ms  p(99.9)=261.07ms
       { expected_response:true }...: avg=97.24ms  min=1.42ms med=92.88ms  max=378.76ms p(90)=184.71ms p(95)=200.1ms  p(99.9)=261.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146268
     http_req_receiving.............: avg=841.55µs min=52.7µs med=120.74µs max=280.96ms p(90)=1.64ms   p(95)=2.66ms   p(99.9)=31.66ms 
     http_req_sending...............: avg=58.29µs  min=4.63µs med=9.14µs   max=146.15ms p(90)=19.26µs  p(95)=105.84µs p(99.9)=7.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.34ms  min=1.36ms med=92.05ms  max=378.68ms p(90)=183.78ms p(95)=199.04ms p(99.9)=258.67ms
     http_reqs......................: 146268  2367.023016/s
     iteration_duration.............: avg=98.15ms  min=3.76ms med=94.01ms  max=378.98ms p(90)=185.13ms p(95)=200.58ms p(99.9)=262.29ms
     iterations.....................: 145268  2350.840235/s
     success_rate...................: 100.00% ✓ 145268      ✗ 0     
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

     checks.........................: 100.00% ✓ 431199      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=16.56µs min=872ns   med=2.24µs   max=89.52ms  p(90)=3.87µs   p(95)=5.03µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=13.45µs min=0s      med=0s       max=89.45ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=98.3ms  min=1.6ms   med=82.34ms  max=1.48s    p(90)=185.46ms p(95)=214.86ms p(99.9)=736.11ms
       { expected_response:true }...: avg=98.3ms  min=1.6ms   med=82.34ms  max=1.48s    p(90)=185.46ms p(95)=214.86ms p(99.9)=736.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144733
     http_req_receiving.............: avg=1.53ms  min=51.85µs med=103.45µs max=1.21s    p(90)=1.73ms   p(95)=4.32ms   p(99.9)=132.92ms
     http_req_sending...............: avg=69.5µs  min=4.98µs  med=9.75µs   max=182.38ms p(90)=20.54µs  p(95)=108.07µs p(99.9)=8.66ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.7ms  min=1.5ms   med=81.17ms  max=1.43s    p(90)=183.35ms p(95)=211.52ms p(99.9)=705.13ms
     http_reqs......................: 144733  2336.488513/s
     iteration_duration.............: avg=99.24ms min=2.96ms  med=83.35ms  max=1.48s    p(90)=186.09ms p(95)=215.66ms p(99.9)=738.1ms 
     iterations.....................: 143733  2320.345073/s
     success_rate...................: 100.00% ✓ 143733      ✗ 0     
     vus............................: 54      min=0         max=499 
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

     checks.........................: 100.00% ✓ 409536      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=22.44µs  min=1.06µs  med=3.12µs   max=107.84ms p(90)=5.07µs   p(95)=6.31µs   p(99.9)=2.72ms  
     http_req_connecting............: avg=18.31µs  min=0s      med=0s       max=107.77ms p(90)=0s       p(95)=0s       p(99.9)=2.64ms  
     http_req_duration..............: avg=103.46ms min=1.78ms  med=93.5ms   max=1.39s    p(90)=196.83ms p(95)=223.76ms p(99.9)=795.75ms
       { expected_response:true }...: avg=103.46ms min=1.78ms  med=93.5ms   max=1.39s    p(90)=196.83ms p(95)=223.76ms p(99.9)=795.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137512
     http_req_receiving.............: avg=1.5ms    min=53.99µs med=111.99µs max=1.1s     p(90)=1.6ms    p(95)=4.15ms   p(99.9)=96.11ms 
     http_req_sending...............: avg=76.03µs  min=5.01µs  med=11.55µs  max=156.89ms p(90)=22.65µs  p(95)=129.15µs p(99.9)=9.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.88ms min=1.65ms  med=92.35ms  max=1.39s    p(90)=194.89ms p(95)=220.72ms p(99.9)=694.93ms
     http_reqs......................: 137512  2207.806789/s
     iteration_duration.............: avg=104.5ms  min=3.05ms  med=94.68ms  max=1.39s    p(90)=197.49ms p(95)=224.58ms p(99.9)=796.69ms
     iterations.....................: 136512  2191.751414/s
     success_rate...................: 100.00% ✓ 136512      ✗ 0     
     vus............................: 69      min=0         max=495 
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

     checks.........................: 100.00% ✓ 404814      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=15.27µs  min=1.14µs  med=2.98µs   max=47.48ms  p(90)=4.78µs   p(95)=5.99µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=11.4µs   min=0s      med=0s       max=47.42ms  p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=104.66ms min=1.61ms  med=99.06ms  max=305.65ms p(90)=203.16ms p(95)=220.45ms p(99.9)=271.15ms
       { expected_response:true }...: avg=104.66ms min=1.61ms  med=99.06ms  max=305.65ms p(90)=203.16ms p(95)=220.45ms p(99.9)=271.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135938
     http_req_receiving.............: avg=131.03µs min=28.56µs med=58.52µs  max=56.02ms  p(90)=138.87µs p(95)=369.13µs p(99.9)=11.01ms 
     http_req_sending...............: avg=67.58µs  min=5.23µs  med=11.48µs  max=278.99ms p(90)=20.96µs  p(95)=132.53µs p(99.9)=8.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.46ms min=1.56ms  med=98.86ms  max=305ms    p(90)=202.92ms p(95)=220.14ms p(99.9)=270.37ms
     http_reqs......................: 135938  2191.481544/s
     iteration_duration.............: avg=105.7ms  min=3.73ms  med=100.28ms max=361.49ms p(90)=203.64ms p(95)=220.93ms p(99.9)=272.02ms
     iterations.....................: 134938  2175.36036/s
     success_rate...................: 100.00% ✓ 134938      ✗ 0     
     vus............................: 58      min=0         max=498 
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

     checks.........................: 100.00% ✓ 207981      ✗ 0    
     data_received..................: 6.2 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=5.8µs    min=972ns   med=2.4µs    max=10.74ms  p(90)=4.22µs   p(95)=5.2µs    p(99.9)=571.23µs
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=10.67ms  p(90)=0s       p(95)=0s       p(99.9)=528.47µs
     http_req_duration..............: avg=202.94ms min=2.07ms  med=204.65ms max=529.28ms p(90)=375.63ms p(95)=402.66ms p(99.9)=480.67ms
       { expected_response:true }...: avg=202.94ms min=2.07ms  med=204.65ms max=529.28ms p(90)=375.63ms p(95)=402.66ms p(99.9)=480.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70327
     http_req_receiving.............: avg=80.26µs  min=27.65µs med=66.36µs  max=32.29ms  p(90)=109µs    p(95)=124.71µs p(99.9)=1.39ms  
     http_req_sending...............: avg=28.76µs  min=5.19µs  med=11.04µs  max=101.6ms  p(90)=18.47µs  p(95)=22.06µs  p(99.9)=3.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.83ms min=2.01ms  med=204.54ms max=529.24ms p(90)=375.52ms p(95)=402.56ms p(99.9)=480.6ms 
     http_reqs......................: 70327   1121.83763/s
     iteration_duration.............: avg=206.1ms  min=4.54ms  med=208.13ms max=529.47ms p(90)=376.55ms p(95)=403.27ms p(99.9)=481.01ms
     iterations.....................: 69327   1105.885896/s
     success_rate...................: 100.00% ✓ 69327       ✗ 0    
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

     checks.........................: 100.00% ✓ 100302     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   638 kB/s
     http_req_blocked...............: avg=8.8µs    min=1µs     med=3.31µs   max=3.93ms   p(90)=5.17µs   p(95)=6.25µs   p(99.9)=1.3ms 
     http_req_connecting............: avg=4.41µs   min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=1.25ms
     http_req_duration..............: avg=416.72ms min=3.9ms   med=380.08ms max=1.66s    p(90)=823.57ms p(95)=915.29ms p(99.9)=1.33s 
       { expected_response:true }...: avg=416.72ms min=3.9ms   med=380.08ms max=1.66s    p(90)=823.57ms p(95)=915.29ms p(99.9)=1.33s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34434
     http_req_receiving.............: avg=88.54µs  min=28.67µs med=75.21µs  max=55.47ms  p(90)=115.43µs p(95)=129.6µs  p(99.9)=1.18ms
     http_req_sending...............: avg=38.38µs  min=5.41µs  med=14.87µs  max=177.95ms p(90)=22.22µs  p(95)=25.42µs  p(99.9)=3.33ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=416.59ms min=3.84ms  med=379.97ms max=1.66s    p(90)=823.46ms p(95)=915.19ms p(99.9)=1.33s 
     http_reqs......................: 34434   531.049194/s
     iteration_duration.............: avg=429.42ms min=11.91ms med=397ms    max=1.67s    p(90)=828.43ms p(95)=918.47ms p(99.9)=1.34s 
     iterations.....................: 33434   515.62696/s
     success_rate...................: 100.00% ✓ 33434      ✗ 0    
     vus............................: 95      min=0        max=500
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

     checks.........................: 100.00% ✓ 47310      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   297 kB/s
     http_req_blocked...............: avg=13.71µs  min=1.16µs  med=3.5µs    max=9.47ms  p(90)=5.29µs   p(95)=6.92µs  p(99.9)=1.75ms
     http_req_connecting............: avg=8.55µs   min=0s      med=0s       max=9.4ms   p(90)=0s       p(95)=0s      p(99.9)=1.72ms
     http_req_duration..............: avg=866.8ms  min=6.03ms  med=778.08ms max=4.89s   p(90)=1.74s    p(95)=1.93s   p(99.9)=3.85s 
       { expected_response:true }...: avg=866.8ms  min=6.03ms  med=778.08ms max=4.89s   p(90)=1.74s    p(95)=1.93s   p(99.9)=3.85s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16770
     http_req_receiving.............: avg=103.62µs min=32.63µs med=93.26µs  max=58.8ms  p(90)=131.69µs p(95)=147.2µs p(99.9)=1.2ms 
     http_req_sending...............: avg=27.79µs  min=5.82µs  med=18.52µs  max=31.71ms p(90)=23.93µs  p(95)=28.98µs p(99.9)=2.11ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=866.66ms min=5.88ms  med=777.96ms max=4.89s   p(90)=1.74s    p(95)=1.93s   p(99.9)=3.85s 
     http_reqs......................: 16770   247.119358/s
     iteration_duration.............: avg=921.78ms min=31.05ms med=856.78ms max=4.9s    p(90)=1.76s    p(95)=1.94s   p(99.9)=3.87s 
     iterations.....................: 15770   232.383558/s
     success_rate...................: 100.00% ✓ 15770      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 45384      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=15.59µs  min=1.14µs  med=3.48µs   max=10.48ms  p(90)=5.34µs   p(95)=6.96µs   p(99.9)=2.44ms
     http_req_connecting............: avg=10.35µs  min=0s      med=0s       max=10.42ms  p(90)=0s       p(95)=0s       p(99.9)=2.41ms
     http_req_duration..............: avg=901.13ms min=7.8ms   med=821.62ms max=3.23s    p(90)=1.84s    p(95)=1.96s    p(99.9)=2.8s  
       { expected_response:true }...: avg=901.13ms min=7.8ms   med=821.62ms max=3.23s    p(90)=1.84s    p(95)=1.96s    p(99.9)=2.8s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16128
     http_req_receiving.............: avg=100.4µs  min=32.86µs med=91.85µs  max=9.94ms   p(90)=134.27µs p(95)=150.29µs p(99.9)=1.08ms
     http_req_sending...............: avg=42.46µs  min=5.54µs  med=18.18µs  max=107.51ms p(90)=23.99µs  p(95)=29.26µs  p(99.9)=2.69ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=900.99ms min=7.71ms  med=821.46ms max=3.23s    p(90)=1.84s    p(95)=1.96s    p(99.9)=2.8s  
     http_reqs......................: 16128   234.174623/s
     iteration_duration.............: avg=960.67ms min=43.79ms med=904.39ms max=3.24s    p(90)=1.86s    p(95)=1.96s    p(99.9)=2.82s 
     iterations.....................: 15128   219.654868/s
     success_rate...................: 100.00% ✓ 15128      ✗ 0    
     vus............................: 2       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

