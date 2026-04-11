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
| hive-router | v0.0.43 | 2,841 | 2,945 | 2,816 | 1.7% |  |
| hotchocolate | 16.0.0-rc.1.29 | 2,044 | 2,079 | 2,022 | 0.9% |  |
| cosmo | 0.298.0 | 1,186 | 1,211 | 1,184 | 1.0% | non-compatible response (5 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 563 | 571 | 558 | 0.8% |  |
| hive-gateway | 2.5.14 | 250 | 253 | 245 | 1.0% |  |
| apollo-gateway | 2.13.3 | 204 | 209 | 201 | 1.4% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (31165 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (511422 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,334 | 2,437 | 2,308 | 1.9% |  |
| hotchocolate | 16.0.0-rc.1.29 | 1,892 | 1,951 | 1,865 | 1.3% |  |
| cosmo | 0.298.0 | 1,135 | 1,158 | 1,074 | 3.8% | non-compatible response (14 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 546 | 553 | 538 | 1.1% |  |
| hive-gateway | 2.5.14 | 242 | 246 | 240 | 0.7% |  |
| apollo-gateway | 2.13.3 | 208 | 210 | 207 | 0.4% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (25808 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (268699 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 524601      ✗ 0     
     data_received..................: 15 GB   249 MB/s
     data_sent......................: 211 MB  3.4 MB/s
     http_req_blocked...............: avg=36.3µs   min=1.03µs  med=2.24µs  max=115.15ms p(90)=3.72µs   p(95)=4.87µs   p(99.9)=9.14ms  
     http_req_connecting............: avg=32.97µs  min=0s      med=0s      max=114.94ms p(90)=0s       p(95)=0s       p(99.9)=8.79ms  
     http_req_duration..............: avg=80.72ms  min=1.52ms  med=73.96ms max=369.84ms p(90)=157.43ms p(95)=176.38ms p(99.9)=241.16ms
       { expected_response:true }...: avg=80.72ms  min=1.52ms  med=73.96ms max=369.84ms p(90)=157.43ms p(95)=176.38ms p(99.9)=241.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175867
     http_req_receiving.............: avg=592.98µs min=28.35µs med=54.69µs max=280.32ms p(90)=263.25µs p(95)=435.01µs p(99.9)=58.51ms 
     http_req_sending...............: avg=106.81µs min=5.41µs  med=9.82µs  max=153.88ms p(90)=18.23µs  p(95)=133.39µs p(99.9)=19.43ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.02ms  min=1.46ms  med=73.59ms max=275.06ms p(90)=156.15ms p(95)=173.57ms p(99.9)=231.17ms
     http_reqs......................: 175867  2841.868027/s
     iteration_duration.............: avg=81.52ms  min=2.42ms  med=74.83ms max=388.84ms p(90)=158.01ms p(95)=177.13ms p(99.9)=242.76ms
     iterations.....................: 174867  2825.708839/s
     success_rate...................: 100.00% ✓ 174867      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 382647      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=13.01µs  min=1.01µs  med=2.23µs   max=40.45ms  p(90)=3.5µs    p(95)=4.48µs   p(99.9)=1.05ms  
     http_req_connecting............: avg=10.04µs  min=0s      med=0s       max=40.4ms   p(90)=0s       p(95)=0s       p(99.9)=964.76µs
     http_req_duration..............: avg=110.72ms min=2.44ms  med=106.76ms max=528.65ms p(90)=211.09ms p(95)=232.85ms p(99.9)=361.31ms
       { expected_response:true }...: avg=110.72ms min=2.44ms  med=106.76ms max=528.65ms p(90)=211.09ms p(95)=232.85ms p(99.9)=361.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128549
     http_req_receiving.............: avg=1.1ms    min=52.71µs med=147.24µs max=303.7ms  p(90)=1.26ms   p(95)=2.86ms   p(99.9)=95.46ms 
     http_req_sending...............: avg=59.05µs  min=5.4µs   med=9.79µs   max=55.08ms  p(90)=18.32µs  p(95)=121.23µs p(99.9)=8.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.56ms min=2.34ms  med=105.62ms max=507ms    p(90)=209.47ms p(95)=230.47ms p(99.9)=357.67ms
     http_reqs......................: 128549  2044.965698/s
     iteration_duration.............: avg=111.85ms min=3.54ms  med=108.12ms max=528.84ms p(90)=211.69ms p(95)=233.52ms p(99.9)=361.98ms
     iterations.....................: 127549  2029.057634/s
     success_rate...................: 100.00% ✓ 127549      ✗ 0     
     vus............................: 96      min=0         max=500 
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

     checks.........................: 100.00% ✓ 219726      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=5.86µs   min=1.08µs  med=2.17µs   max=9.9ms    p(90)=3.61µs   p(95)=4.54µs   p(99.9)=587.24µs
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=9.84ms   p(90)=0s       p(95)=0s       p(99.9)=484.06µs
     http_req_duration..............: avg=192.22ms min=2.08ms  med=192.72ms max=576.48ms p(90)=356.79ms p(95)=384.57ms p(99.9)=504.86ms
       { expected_response:true }...: avg=192.22ms min=2.08ms  med=192.72ms max=576.48ms p(90)=356.79ms p(95)=384.57ms p(99.9)=504.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74242
     http_req_receiving.............: avg=83.44µs  min=28.95µs med=60.81µs  max=179.26ms p(90)=96.14µs  p(95)=111.11µs p(99.9)=1.9ms   
     http_req_sending...............: avg=29.1µs   min=5.36µs  med=10.39µs  max=90.51ms  p(90)=16.55µs  p(95)=20.18µs  p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.11ms min=2.02ms  med=192.59ms max=576.42ms p(90)=356.69ms p(95)=384.48ms p(99.9)=504.78ms
     http_reqs......................: 74242   1186.957032/s
     iteration_duration.............: avg=195.09ms min=4.79ms  med=195.85ms max=576.63ms p(90)=357.7ms  p(95)=385.29ms p(99.9)=505.35ms
     iterations.....................: 73242   1170.969356/s
     success_rate...................: 100.00% ✓ 73242       ✗ 0    
     vus............................: 82      min=0         max=496
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

     checks.........................: 100.00% ✓ 106167     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   677 kB/s
     http_req_blocked...............: avg=9.29µs   min=1.16µs  med=2.72µs   max=29.82ms  p(90)=4.47µs   p(95)=5.54µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=5.62µs   min=0s      med=0s       max=29.73ms  p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=394.21ms min=3.73ms  med=366.67ms max=1.53s    p(90)=777ms    p(95)=847.34ms p(99.9)=1.18s   
       { expected_response:true }...: avg=394.21ms min=3.73ms  med=366.67ms max=1.53s    p(90)=777ms    p(95)=847.34ms p(99.9)=1.18s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36389
     http_req_receiving.............: avg=83.33µs  min=33.42µs med=73.82µs  max=19.1ms   p(90)=110.1µs  p(95)=124.05µs p(99.9)=879.74µs
     http_req_sending...............: avg=43.42µs  min=5.8µs   med=12.61µs  max=175.58ms p(90)=19.84µs  p(95)=23.3µs   p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=394.08ms min=3.62ms  med=366.57ms max=1.53s    p(90)=776.91ms p(95)=847.26ms p(99.9)=1.18s   
     http_reqs......................: 36389   563.909223/s
     iteration_duration.............: avg=405.59ms min=19.62ms med=381.55ms max=1.53s    p(90)=780.52ms p(95)=850.1ms  p(99.9)=1.18s   
     iterations.....................: 35389   548.412528/s
     success_rate...................: 100.00% ✓ 35389      ✗ 0    
     vus............................: 81      min=0        max=498
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

     checks.........................: 100.00% ✓ 47619      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=14.17µs  min=1.24µs  med=3.73µs   max=42.66ms p(90)=5.72µs  p(95)=7.17µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=8.74µs   min=0s      med=0s       max=42.6ms  p(90)=0s      p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=841.85ms min=5.65ms  med=730.27ms max=17.63s  p(90)=1.47s   p(95)=1.64s    p(99.9)=16.66s  
       { expected_response:true }...: avg=841.85ms min=5.65ms  med=730.27ms max=17.63s  p(90)=1.47s   p(95)=1.64s    p(99.9)=16.66s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16873
     http_req_receiving.............: avg=107.67µs min=35.34µs med=100.04µs max=39.36ms p(90)=138.6µs p(95)=152.17µs p(99.9)=882.77µs
     http_req_sending...............: avg=33.95µs  min=5.96µs  med=18.35µs  max=43ms    p(90)=24.6µs  p(95)=29.22µs  p(99.9)=3.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=841.71ms min=5.58ms  med=730.13ms max=17.63s  p(90)=1.47s   p(95)=1.64s    p(99.9)=16.66s  
     http_reqs......................: 16873   250.109112/s
     iteration_duration.............: avg=894.96ms min=58.59ms med=784.33ms max=17.63s  p(90)=1.49s   p(95)=1.65s    p(99.9)=16.67s  
     iterations.....................: 15873   235.286075/s
     success_rate...................: 100.00% ✓ 15873      ✗ 0    
     vus............................: 81      min=0        max=499
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

     checks.........................: 100.00% ✓ 42531      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=15.23µs  min=1.15µs  med=3.41µs   max=4.26ms  p(90)=5.08µs   p(95)=6.55µs   p(99.9)=2.78ms
     http_req_connecting............: avg=10.14µs  min=0s      med=0s       max=4.22ms  p(90)=0s       p(95)=0s       p(99.9)=2.75ms
     http_req_duration..............: avg=483.77ms min=8.47ms  med=539.48ms max=1.41s   p(90)=819.55ms p(95)=900.42ms p(99.9)=1.2s  
       { expected_response:true }...: avg=483.77ms min=8.47ms  med=539.48ms max=1.41s   p(90)=819.55ms p(95)=900.42ms p(99.9)=1.2s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15177
     http_req_receiving.............: avg=136.35µs min=34.21µs med=93.41µs  max=74.12ms p(90)=133.65µs p(95)=146.57µs p(99.9)=2.79ms
     http_req_sending...............: avg=27.99µs  min=6.31µs  med=16.77µs  max=11.42ms p(90)=22.51µs  p(95)=27µs     p(99.9)=2.99ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=483.61ms min=8.36ms  med=539.39ms max=1.41s   p(90)=819.42ms p(95)=900.33ms p(99.9)=1.2s  
     http_reqs......................: 15177   204.042814/s
     iteration_duration.............: avg=517.75ms min=9ms     med=564.73ms max=1.42s   p(90)=826.15ms p(95)=906.58ms p(99.9)=1.21s 
     iterations.....................: 14177   190.598601/s
     success_rate...................: 100.00% ✓ 14177      ✗ 0    
     vus............................: 61      min=0        max=497
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

     checks.........................: 100.00% ✓ 432282      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=24.26µs  min=972ns   med=2.46µs  max=68.35ms  p(90)=4.21µs   p(95)=5.52µs   p(99.9)=3.68ms  
     http_req_connecting............: avg=20.98µs  min=0s      med=0s      max=65.78ms  p(90)=0s       p(95)=0s       p(99.9)=3.59ms  
     http_req_duration..............: avg=97.99ms  min=1.68ms  med=92.43ms max=326.39ms p(90)=188.88ms p(95)=204.69ms p(99.9)=257.33ms
       { expected_response:true }...: avg=97.99ms  min=1.68ms  med=92.43ms max=326.39ms p(90)=188.88ms p(95)=204.69ms p(99.9)=257.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145094
     http_req_receiving.............: avg=246.03µs min=29.59µs med=59.85µs max=106.67ms p(90)=188.5µs  p(95)=428.14µs p(99.9)=29.19ms 
     http_req_sending...............: avg=84.25µs  min=5.43µs  med=10.88µs max=180.17ms p(90)=21.47µs  p(95)=139.3µs  p(99.9)=12.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.65ms  min=1.61ms  med=92.18ms max=325.17ms p(90)=188.3ms  p(95)=204.03ms p(99.9)=255.76ms
     http_reqs......................: 145094  2334.369824/s
     iteration_duration.............: avg=98.95ms  min=3.24ms  med=93.53ms max=366.54ms p(90)=189.46ms p(95)=205.19ms p(99.9)=258.72ms
     iterations.....................: 144094  2318.281152/s
     success_rate...................: 100.00% ✓ 144094      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 350802      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=11.86µs  min=972ns   med=2.34µs   max=73.87ms  p(90)=3.9µs    p(95)=5µs      p(99.9)=1.06ms  
     http_req_connecting............: avg=8.81µs   min=0s      med=0s       max=73.75ms  p(90)=0s       p(95)=0s       p(99.9)=988.38µs
     http_req_duration..............: avg=120.71ms min=1.83ms  med=114.57ms max=858.43ms p(90)=226.5ms  p(95)=251.11ms p(99.9)=641.46ms
       { expected_response:true }...: avg=120.71ms min=1.83ms  med=114.57ms max=858.43ms p(90)=226.5ms  p(95)=251.11ms p(99.9)=641.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117934
     http_req_receiving.............: avg=1.3ms    min=52.28µs med=147.28µs max=257.32ms p(90)=1.53ms   p(95)=3.38ms   p(99.9)=94.42ms 
     http_req_sending...............: avg=56.9µs   min=5.44µs  med=10.22µs  max=78.79ms  p(90)=19.78µs  p(95)=121.72µs p(99.9)=7.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.34ms min=1.75ms  med=113.16ms max=858.34ms p(90)=224.62ms p(95)=248.17ms p(99.9)=639.39ms
     http_reqs......................: 117934  1892.822142/s
     iteration_duration.............: avg=122.01ms min=3.06ms  med=115.92ms max=858.64ms p(90)=227.07ms p(95)=251.84ms p(99.9)=642.77ms
     iterations.....................: 116934  1876.772299/s
     success_rate...................: 100.00% ✓ 116934      ✗ 0     
     vus............................: 72      min=0         max=495 
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

     checks.........................: 100.00% ✓ 210303      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=7.46µs   min=1.05µs  med=2.38µs   max=35.52ms  p(90)=4.09µs   p(95)=5.11µs   p(99.9)=531.83µs
     http_req_connecting............: avg=4.33µs   min=0s      med=0s       max=35.45ms  p(90)=0s       p(95)=0s       p(99.9)=466.2µs 
     http_req_duration..............: avg=200.72ms min=2.12ms  med=201ms    max=551.88ms p(90)=371.65ms p(95)=399.27ms p(99.9)=479.6ms 
       { expected_response:true }...: avg=200.72ms min=2.12ms  med=201ms    max=551.88ms p(90)=371.65ms p(95)=399.27ms p(99.9)=479.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 71101
     http_req_receiving.............: avg=83.67µs  min=29.15µs med=65.12µs  max=122.66ms p(90)=103.5µs  p(95)=119.29µs p(99.9)=1.8ms   
     http_req_sending...............: avg=31.14µs  min=5.33µs  med=11.41µs  max=66.34ms  p(90)=18.41µs  p(95)=22.11µs  p(99.9)=3.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.6ms  min=2.05ms  med=200.9ms  max=551.81ms p(90)=371.52ms p(95)=399.16ms p(99.9)=479.52ms
     http_reqs......................: 71101   1135.724103/s
     iteration_duration.............: avg=203.83ms min=4.27ms  med=204.42ms max=552.11ms p(90)=372.53ms p(95)=400.06ms p(99.9)=479.91ms
     iterations.....................: 70101   1119.750712/s
     success_rate...................: 100.00% ✓ 70101       ✗ 0    
     vus............................: 86      min=0         max=498
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

     checks.........................: 100.00% ✓ 103086     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 43 MB   656 kB/s
     http_req_blocked...............: avg=10.67µs  min=1.16µs  med=3.16µs   max=35.22ms p(90)=4.97µs   p(95)=5.98µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=6.57µs   min=0s      med=0s       max=35.15ms p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=405.63ms min=3.77ms  med=374.46ms max=1.71s   p(90)=798.51ms p(95)=866.9ms  p(99.9)=1.3s    
       { expected_response:true }...: avg=405.63ms min=3.77ms  med=374.46ms max=1.71s   p(90)=798.51ms p(95)=866.9ms  p(99.9)=1.3s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 35362
     http_req_receiving.............: avg=87.75µs  min=33.22µs med=79.87µs  max=19.04ms p(90)=116.68µs p(95)=130.33µs p(99.9)=835.75µs
     http_req_sending...............: avg=30.49µs  min=5.52µs  med=14.11µs  max=81.87ms p(90)=21.25µs  p(95)=24.44µs  p(99.9)=2.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=405.52ms min=3.69ms  med=374.36ms max=1.71s   p(90)=798.38ms p(95)=866.77ms p(99.9)=1.3s    
     http_reqs......................: 35362   546.029321/s
     iteration_duration.............: avg=417.67ms min=14.95ms med=392.95ms max=1.72s   p(90)=802.32ms p(95)=869.88ms p(99.9)=1.31s   
     iterations.....................: 34362   530.588189/s
     success_rate...................: 100.00% ✓ 34362      ✗ 0    
     vus............................: 94      min=0        max=500
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

     checks.........................: 100.00% ✓ 46329      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   292 kB/s
     http_req_blocked...............: avg=13.59µs  min=1.32µs  med=3.5µs    max=4.84ms  p(90)=5.37µs   p(95)=6.84µs   p(99.9)=1.96ms
     http_req_connecting............: avg=8.27µs   min=0s      med=0s       max=4.78ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms
     http_req_duration..............: avg=885.18ms min=5.91ms  med=807.56ms max=4.5s    p(90)=1.76s    p(95)=1.99s    p(99.9)=3.97s 
       { expected_response:true }...: avg=885.18ms min=5.91ms  med=807.56ms max=4.5s    p(90)=1.76s    p(95)=1.99s    p(99.9)=3.97s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16443
     http_req_receiving.............: avg=111.04µs min=36.46µs med=97.11µs  max=77.57ms p(90)=136.36µs p(95)=148.82µs p(99.9)=1.13ms
     http_req_sending...............: avg=33.14µs  min=6.34µs  med=17.73µs  max=27.77ms p(90)=23.96µs  p(95)=28.73µs  p(99.9)=4.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=885.03ms min=5.82ms  med=807.45ms max=4.5s    p(90)=1.76s    p(95)=1.99s    p(99.9)=3.97s 
     http_reqs......................: 16443   242.947172/s
     iteration_duration.............: avg=942.5ms  min=44.49ms med=874.73ms max=4.51s   p(90)=1.77s    p(95)=2.01s    p(99.9)=4.01s 
     iterations.....................: 15443   228.17206/s
     success_rate...................: 100.00% ✓ 15443      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 40878      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=16.88µs  min=1.28µs  med=3.61µs   max=27.46ms p(90)=5.48µs   p(95)=7.25µs   p(99.9)=2.44ms  
     http_req_connecting............: avg=11.41µs  min=0s      med=0s       max=27.39ms p(90)=0s       p(95)=0s       p(99.9)=2.41ms  
     http_req_duration..............: avg=997.01ms min=8.72ms  med=904.19ms max=4.25s   p(90)=2.01s    p(95)=2.14s    p(99.9)=3.67s   
       { expected_response:true }...: avg=997.01ms min=8.72ms  med=904.19ms max=4.25s   p(90)=2.01s    p(95)=2.14s    p(99.9)=3.67s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14626
     http_req_receiving.............: avg=104.15µs min=34.25µs med=97.7µs   max=22.65ms p(90)=137.11µs p(95)=149.75µs p(99.9)=573.91µs
     http_req_sending...............: avg=27.49µs  min=5.88µs  med=18.38µs  max=8.36ms  p(90)=24.28µs  p(95)=29.53µs  p(99.9)=2.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=996.88ms min=8.58ms  med=904.06ms max=4.25s   p(90)=2.01s    p(95)=2.14s    p(99.9)=3.67s   
     http_reqs......................: 14626   208.714557/s
     iteration_duration.............: avg=1.06s    min=41.39ms med=988.95ms max=4.26s   p(90)=2.04s    p(95)=2.16s    p(99.9)=3.69s   
     iterations.....................: 13626   194.444452/s
     success_rate...................: 100.00% ✓ 13626      ✗ 0    
     vus............................: 59      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

