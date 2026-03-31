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
| hive-router | v0.0.43 | 2,813 | 2,929 | 2,780 | 1.8% |  |
| hotchocolate | 16.0.0-rc.1.21 | 2,044 | 2,062 | 2,016 | 0.7% |  |
| cosmo | 0.298.0 | 1,188 | 1,196 | 1,188 | 0.4% | non-compatible response (6 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 557 | 568 | 555 | 0.9% |  |
| hive-gateway | 2.5.14 | 249 | 254 | 246 | 0.9% |  |
| apollo-gateway | 2.13.3 | 198 | 204 | 194 | 1.7% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (42490 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (475593 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,217 | 2,314 | 2,159 | 2.3% |  |
| hotchocolate | 16.0.0-rc.1.21 | 1,885 | 1,930 | 1,863 | 1.1% |  |
| cosmo | 0.298.0 | 1,141 | 1,158 | 1,137 | 0.9% | non-compatible response (11 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 539 | 548 | 528 | 1.1% |  |
| hive-gateway | 2.5.14 | 238 | 241 | 234 | 0.9% |  |
| apollo-gateway | 2.13.3 | 208 | 211 | 207 | 0.7% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (31295 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (344826 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 519519      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=42.77µs  min=921ns   med=2.7µs   max=100.19ms p(90)=4.4µs    p(95)=5.6µs    p(99.9)=13.08ms 
     http_req_connecting............: avg=39.28µs  min=0s      med=0s      max=100.12ms p(90)=0s       p(95)=0s       p(99.9)=12.99ms 
     http_req_duration..............: avg=81.33ms  min=1.6ms   med=72.82ms max=322.34ms p(90)=160.48ms p(95)=183.83ms p(99.9)=269.3ms 
       { expected_response:true }...: avg=81.33ms  min=1.6ms   med=72.82ms max=322.34ms p(90)=160.48ms p(95)=183.83ms p(99.9)=269.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 174173
     http_req_receiving.............: avg=585.29µs min=29.62µs med=57.36µs max=128.96ms p(90)=268.18µs p(95)=449.55µs p(99.9)=73.48ms 
     http_req_sending...............: avg=105.4µs  min=5.49µs  med=10.33µs max=71.78ms  p(90)=20.03µs  p(95)=141.49µs p(99.9)=19.16ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.64ms  min=1.55ms  med=72.46ms max=307ms    p(90)=159.17ms p(95)=181.41ms p(99.9)=251.33ms
     http_reqs......................: 174173  2813.856401/s
     iteration_duration.............: avg=82.31ms  min=2.26ms  med=73.79ms max=450.12ms p(90)=161.36ms p(95)=184.98ms p(99.9)=278.87ms
     iterations.....................: 173173  2797.700875/s
     success_rate...................: 100.00% ✓ 173173      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 382653      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=15.7µs   min=1.06µs  med=2.74µs   max=56.08ms  p(90)=4.25µs   p(95)=5.33µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=12.14µs  min=0s      med=0s       max=55.99ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=110.69ms min=2.44ms  med=106.69ms max=508.85ms p(90)=210.3ms  p(95)=233.6ms  p(99.9)=362.44ms
       { expected_response:true }...: avg=110.69ms min=2.44ms  med=106.69ms max=508.85ms p(90)=210.3ms  p(95)=233.6ms  p(99.9)=362.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128551
     http_req_receiving.............: avg=1.31ms   min=52.98µs med=148.88µs max=259.96ms p(90)=1.32ms   p(95)=3.27ms   p(99.9)=123.21ms
     http_req_sending...............: avg=63.11µs  min=5.56µs  med=10.57µs  max=101.86ms p(90)=19.49µs  p(95)=128.56µs p(99.9)=8.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.3ms  min=2.35ms  med=105.34ms max=508.75ms p(90)=208.56ms p(95)=230.48ms p(99.9)=356.18ms
     http_reqs......................: 128551  2044.208573/s
     iteration_duration.............: avg=111.84ms min=3.92ms  med=108.06ms max=509.05ms p(90)=210.89ms p(95)=234.39ms p(99.9)=365.65ms
     iterations.....................: 127551  2028.306646/s
     success_rate...................: 100.00% ✓ 127551      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 219744      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=5.11µs   min=1.16µs  med=2.62µs   max=7.24ms   p(90)=4.19µs   p(95)=5.09µs   p(99.9)=458.58µs
     http_req_connecting............: avg=1.84µs   min=0s      med=0s       max=7.17ms   p(90)=0s       p(95)=0s       p(99.9)=397.54µs
     http_req_duration..............: avg=192.19ms min=2.07ms  med=191.67ms max=581.17ms p(90)=358.88ms p(95)=386.03ms p(99.9)=500.39ms
       { expected_response:true }...: avg=192.19ms min=2.07ms  med=191.67ms max=581.17ms p(90)=358.88ms p(95)=386.03ms p(99.9)=500.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74248
     http_req_receiving.............: avg=76.68µs  min=30.29µs med=62.34µs  max=41.51ms  p(90)=95.94µs  p(95)=109.34µs p(99.9)=1.27ms  
     http_req_sending...............: avg=28.07µs  min=5.69µs  med=10.95µs  max=13.83ms  p(90)=16.77µs  p(95)=20.21µs  p(99.9)=3.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.09ms min=2ms     med=191.55ms max=581.1ms  p(90)=358.8ms  p(95)=385.93ms p(99.9)=500.34ms
     http_reqs......................: 74248   1188.491663/s
     iteration_duration.............: avg=195.05ms min=5.46ms  med=194.7ms  max=581.36ms p(90)=359.77ms p(95)=386.83ms p(99.9)=500.72ms
     iterations.....................: 73248   1172.48461/s
     success_rate...................: 100.00% ✓ 73248       ✗ 0    
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

     checks.........................: 100.00% ✓ 104871     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   669 kB/s
     http_req_blocked...............: avg=9.77µs   min=1.12µs  med=3.03µs   max=21.28ms  p(90)=4.78µs   p(95)=5.79µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=5.75µs   min=0s      med=0s       max=21.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=398.95ms min=3.65ms  med=373.73ms max=1.49s    p(90)=785.97ms p(95)=853.72ms p(99.9)=1.24s   
       { expected_response:true }...: avg=398.95ms min=3.65ms  med=373.73ms max=1.49s    p(90)=785.97ms p(95)=853.72ms p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35957
     http_req_receiving.............: avg=89.71µs  min=31.74µs med=75.59µs  max=161.48ms p(90)=111.29µs p(95)=124.91µs p(99.9)=911.75µs
     http_req_sending...............: avg=33.45µs  min=5.7µs   med=13.16µs  max=90.85ms  p(90)=20.16µs  p(95)=23.66µs  p(99.9)=3.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=398.83ms min=3.59ms  med=373.58ms max=1.49s    p(90)=785.88ms p(95)=853.65ms p(99.9)=1.24s   
     http_reqs......................: 35957   557.574767/s
     iteration_duration.............: avg=410.61ms min=20.92ms med=388.36ms max=1.49s    p(90)=790.19ms p(95)=856.7ms  p(99.9)=1.25s   
     iterations.....................: 34957   542.068057/s
     success_rate...................: 100.00% ✓ 34957      ✗ 0    
     vus............................: 80      min=0        max=498
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

     checks.........................: 100.00% ✓ 47532      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=15.29µs  min=1.38µs  med=3.73µs   max=31.62ms p(90)=5.62µs   p(95)=7.14µs   p(99.9)=1.18ms 
     http_req_connecting............: avg=9.76µs   min=0s      med=0s       max=31.56ms p(90)=0s       p(95)=0s       p(99.9)=1.13ms 
     http_req_duration..............: avg=847.8ms  min=5.69ms  med=744.19ms max=18.28s  p(90)=1.47s    p(95)=1.64s    p(99.9)=17.11s 
       { expected_response:true }...: avg=847.8ms  min=5.69ms  med=744.19ms max=18.28s  p(90)=1.47s    p(95)=1.64s    p(99.9)=17.11s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16844
     http_req_receiving.............: avg=185µs    min=39.47µs med=97.26µs  max=91.2ms  p(90)=137.69µs p(95)=150.86µs p(99.9)=42.66ms
     http_req_sending...............: avg=28.15µs  min=6.56µs  med=17.65µs  max=20.33ms p(90)=24.33µs  p(95)=28.84µs  p(99.9)=2.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=847.58ms min=5.58ms  med=744.04ms max=18.28s  p(90)=1.47s    p(95)=1.64s    p(99.9)=17.11s 
     http_reqs......................: 16844   249.929055/s
     iteration_duration.............: avg=901.35ms min=22.21ms med=805.49ms max=18.28s  p(90)=1.49s    p(95)=1.65s    p(99.9)=17.12s 
     iterations.....................: 15844   235.091187/s
     success_rate...................: 100.00% ✓ 15844      ✗ 0    
     vus............................: 73      min=0        max=499
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

     checks.........................: 100.00% ✓ 41202      ✗ 0    
     data_received..................: 1.3 GB  17 MB/s
     data_sent......................: 18 MB   243 kB/s
     http_req_blocked...............: avg=13.67µs  min=1.17µs med=3.45µs   max=3.13ms  p(90)=5.15µs   p(95)=7.08µs   p(99.9)=1.82ms 
     http_req_connecting............: avg=8.48µs   min=0s     med=0s       max=3.11ms  p(90)=0s       p(95)=0s       p(99.9)=1.78ms 
     http_req_duration..............: avg=483.23ms min=8.45ms med=538.97ms max=1.46s   p(90)=870.93ms p(95)=932.31ms p(99.9)=1.32s  
       { expected_response:true }...: avg=483.23ms min=8.45ms med=538.97ms max=1.46s   p(90)=870.93ms p(95)=932.31ms p(99.9)=1.32s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14734
     http_req_receiving.............: avg=158.22µs min=35µs   med=91.72µs  max=92.84ms p(90)=132.09µs p(95)=144.33µs p(99.9)=16.36ms
     http_req_sending...............: avg=31.62µs  min=6.17µs med=16.6µs   max=42.75ms p(90)=22.89µs  p(95)=27.75µs  p(99.9)=2.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=483.04ms min=8.32ms med=538.87ms max=1.46s   p(90)=870.8ms  p(95)=932.21ms p(99.9)=1.32s  
     http_reqs......................: 14734   198.122652/s
     iteration_duration.............: avg=518.28ms min=8.86ms med=567.81ms max=1.47s   p(90)=879.14ms p(95)=939.03ms p(99.9)=1.33s  
     iterations.....................: 13734   184.676022/s
     success_rate...................: 100.00% ✓ 13734      ✗ 0    
     vus............................: 66      min=0        max=497
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

     checks.........................: 100.00% ✓ 410523      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=21.46µs  min=1.05µs  med=2.98µs  max=56.71ms  p(90)=4.78µs   p(95)=6.07µs   p(99.9)=2.76ms  
     http_req_connecting............: avg=17.59µs  min=0s      med=0s      max=56.63ms  p(90)=0s       p(95)=0s       p(99.9)=2.4ms   
     http_req_duration..............: avg=103.15ms min=1.68ms  med=98.19ms max=307.8ms  p(90)=199.14ms p(95)=216.24ms p(99.9)=268.36ms
       { expected_response:true }...: avg=103.15ms min=1.68ms  med=98.19ms max=307.8ms  p(90)=199.14ms p(95)=216.24ms p(99.9)=268.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137841
     http_req_receiving.............: avg=244.23µs min=29.83µs med=64.58µs max=149.44ms p(90)=179.89µs p(95)=430.7µs  p(99.9)=27.76ms 
     http_req_sending...............: avg=79.9µs   min=5.17µs  med=11.9µs  max=89.49ms  p(90)=22.65µs  p(95)=142.98µs p(99.9)=11.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.83ms min=1.62ms  med=97.93ms max=307.74ms p(90)=198.66ms p(95)=215.69ms p(99.9)=266.59ms
     http_reqs......................: 137841  2217.208459/s
     iteration_duration.............: avg=104.2ms  min=3.38ms  med=99.31ms max=417.3ms  p(90)=199.69ms p(95)=216.81ms p(99.9)=269.3ms 
     iterations.....................: 136841  2201.123198/s
     success_rate...................: 100.00% ✓ 136841      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 349143      ✗ 0     
     data_received..................: 10 GB   165 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=13.87µs  min=1.08µs  med=2.82µs   max=89.55ms  p(90)=4.47µs   p(95)=5.57µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=10.36µs  min=0s      med=0s       max=89.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=121.33ms min=1.81ms  med=114.41ms max=780.29ms p(90)=230.04ms p(95)=252.53ms p(99.9)=620.35ms
       { expected_response:true }...: avg=121.33ms min=1.81ms  med=114.41ms max=780.29ms p(90)=230.04ms p(95)=252.53ms p(99.9)=620.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117381
     http_req_receiving.............: avg=1.37ms   min=51.92µs med=148.33µs max=225.94ms p(90)=1.65ms   p(95)=3.48ms   p(99.9)=111.21ms
     http_req_sending...............: avg=62.32µs  min=5.45µs  med=11.03µs  max=200.4ms  p(90)=20.55µs  p(95)=125.51µs p(99.9)=7.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.88ms min=1.71ms  med=113ms    max=777.51ms p(90)=228.1ms  p(95)=249.93ms p(99.9)=617.5ms 
     http_reqs......................: 117381  1885.991754/s
     iteration_duration.............: avg=122.65ms min=2.84ms  med=115.86ms max=780.51ms p(90)=230.67ms p(95)=253.22ms p(99.9)=620.57ms
     iterations.....................: 116381  1869.924488/s
     success_rate...................: 100.00% ✓ 116381      ✗ 0     
     vus............................: 69      min=0         max=495 
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

     checks.........................: 100.00% ✓ 211362      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=8.79µs   min=1.23µs  med=2.98µs   max=64.3ms   p(90)=4.85µs   p(95)=5.88µs   p(99.9)=541.27µs
     http_req_connecting............: avg=5.08µs   min=0s      med=0s       max=64.22ms  p(90)=0s       p(95)=0s       p(99.9)=469.51µs
     http_req_duration..............: avg=199.74ms min=2.11ms  med=198.76ms max=627.88ms p(90)=371.28ms p(95)=400.51ms p(99.9)=516.49ms
       { expected_response:true }...: avg=199.74ms min=2.11ms  med=198.76ms max=627.88ms p(90)=371.28ms p(95)=400.51ms p(99.9)=516.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71454
     http_req_receiving.............: avg=95.15µs  min=30.05µs med=70.59µs  max=82.9ms   p(90)=111.99µs p(95)=131.57µs p(99.9)=3.24ms  
     http_req_sending...............: avg=40.06µs  min=5.74µs  med=12.54µs  max=124.18ms p(90)=20.21µs  p(95)=24.71µs  p(99.9)=4.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.61ms min=2.05ms  med=198.58ms max=627.81ms p(90)=371.15ms p(95)=400.37ms p(99.9)=516.08ms
     http_reqs......................: 71454   1141.128318/s
     iteration_duration.............: avg=202.84ms min=5.55ms  med=202.3ms  max=628.1ms  p(90)=372.17ms p(95)=401.3ms  p(99.9)=517.14ms
     iterations.....................: 70454   1125.158206/s
     success_rate...................: 100.00% ✓ 70454       ✗ 0    
     vus............................: 87      min=0         max=496
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

     checks.........................: 100.00% ✓ 101667     ✗ 0    
     data_received..................: 3.1 GB  47 MB/s
     data_sent......................: 42 MB   648 kB/s
     http_req_blocked...............: avg=9.33µs   min=1.16µs  med=3.27µs   max=10.88ms  p(90)=5µs      p(95)=5.96µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=4.92µs   min=0s      med=0s       max=10.7ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=411.12ms min=3.74ms  med=380.74ms max=1.87s    p(90)=816.86ms p(95)=890.79ms p(99.9)=1.26s   
       { expected_response:true }...: avg=411.12ms min=3.74ms  med=380.74ms max=1.87s    p(90)=816.86ms p(95)=890.79ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34889
     http_req_receiving.............: avg=90.37µs  min=30.6µs  med=79.97µs  max=106.92ms p(90)=114.42µs p(95)=127.77µs p(99.9)=811.96µs
     http_req_sending...............: avg=31.77µs  min=5.72µs  med=14.1µs   max=90.37ms  p(90)=21.05µs  p(95)=24.32µs  p(99.9)=3.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=411ms    min=3.68ms  med=380.59ms max=1.87s    p(90)=816.73ms p(95)=890.66ms p(99.9)=1.26s   
     http_reqs......................: 34889   539.718716/s
     iteration_duration.............: avg=423.49ms min=22.07ms med=396.77ms max=1.87s    p(90)=820.54ms p(95)=893.79ms p(99.9)=1.27s   
     iterations.....................: 33889   524.249121/s
     success_rate...................: 100.00% ✓ 33889      ✗ 0    
     vus............................: 86      min=0        max=498
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

     checks.........................: 100.00% ✓ 45594      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   286 kB/s
     http_req_blocked...............: avg=13.01µs  min=1.35µs  med=3.72µs   max=4.14ms  p(90)=5.62µs  p(95)=7.19µs   p(99.9)=1.64ms
     http_req_connecting............: avg=7.4µs    min=0s      med=0s       max=3ms     p(90)=0s      p(95)=0s       p(99.9)=1.56ms
     http_req_duration..............: avg=898.75ms min=5.92ms  med=826.16ms max=5.16s   p(90)=1.78s   p(95)=2s       p(99.9)=4.27s 
       { expected_response:true }...: avg=898.75ms min=5.92ms  med=826.16ms max=5.16s   p(90)=1.78s   p(95)=2s       p(99.9)=4.27s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16198
     http_req_receiving.............: avg=107.69µs min=37.31µs med=98.27µs  max=35.19ms p(90)=139.2µs p(95)=152.52µs p(99.9)=1.07ms
     http_req_sending...............: avg=33.03µs  min=6.33µs  med=17.72µs  max=29.2ms  p(90)=23.95µs p(95)=28.9µs   p(99.9)=2.88ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=898.6ms  min=5.82ms  med=826.06ms max=5.16s   p(90)=1.78s   p(95)=2s       p(99.9)=4.27s 
     http_reqs......................: 16198   238.654402/s
     iteration_duration.............: avg=957.91ms min=63.87ms med=898.34ms max=5.17s   p(90)=1.82s   p(95)=2.01s    p(99.9)=4.28s 
     iterations.....................: 15198   223.92083/s
     success_rate...................: 100.00% ✓ 15198      ✗ 0    
     vus............................: 8       min=0        max=500
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

     checks.........................: 100.00% ✓ 40593      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   250 kB/s
     http_req_blocked...............: avg=21.15µs min=1.31µs  med=3.62µs   max=32.2ms  p(90)=5.46µs   p(95)=7.27µs   p(99.9)=2.83ms  
     http_req_connecting............: avg=15.4µs  min=0s      med=0s       max=32.13ms p(90)=0s       p(95)=0s       p(99.9)=2.76ms  
     http_req_duration..............: avg=1s      min=8.65ms  med=919.85ms max=4.11s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.79s   
       { expected_response:true }...: avg=1s      min=8.65ms  med=919.85ms max=4.11s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.79s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14531
     http_req_receiving.............: avg=109.1µs min=34.59µs med=98.17µs  max=41.59ms p(90)=139.41µs p(95)=152.22µs p(99.9)=895.02µs
     http_req_sending...............: avg=31.26µs min=6.09µs  med=17.49µs  max=39.38ms p(90)=23.61µs  p(95)=29.09µs  p(99.9)=2.35ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s      min=8.55ms  med=919.71ms max=4.11s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.79s   
     http_reqs......................: 14531   208.042025/s
     iteration_duration.............: avg=1.07s   min=75.44ms med=1s       max=4.12s   p(90)=2.04s    p(95)=2.19s    p(99.9)=3.81s   
     iterations.....................: 13531   193.724908/s
     success_rate...................: 100.00% ✓ 13531      ✗ 0    
     vus............................: 102     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

