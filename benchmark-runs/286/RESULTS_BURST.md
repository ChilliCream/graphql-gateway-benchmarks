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
| hive-router | v0.0.83 | 2,676 | 2,847 | 2,665 | 2.4% |  |
| fusion | 16.5.0 | 2,428 | 2,542 | 2,386 | 2.4% |  |
| cosmo | 0.331.1 | 1,193 | 1,237 | 1,188 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 569 | 580 | 567 | 0.9% |  |
| hive-gateway | 2.10.4 | 249 | 257 | 247 | 1.5% |  |
| apollo-gateway | 2.14.2 | 230 | 235 | 229 | 0.8% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (13328 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (551821 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.5.0 | 2,341 | 2,437 | 2,328 | 1.6% |  |
| hive-router | v0.0.83 | 2,202 | 2,362 | 2,183 | 2.9% |  |
| cosmo | 0.331.1 | 1,169 | 1,211 | 1,161 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 527 | 546 | 524 | 1.4% |  |
| hive-gateway | 2.10.4 | 248 | 253 | 246 | 0.9% |  |
| apollo-gateway | 2.14.2 | 232 | 239 | 231 | 1.2% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (36074 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (417451 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 492495      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=18.7µs   min=922ns   med=2.59µs  max=55.16ms  p(90)=4.19µs   p(95)=5.28µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=15.41µs  min=0s      med=0s      max=55.09ms  p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=86.07ms  min=1.36ms  med=79.1ms  max=305.78ms p(90)=170.79ms p(95)=183.28ms p(99.9)=233.22ms
       { expected_response:true }...: avg=86.07ms  min=1.36ms  med=79.1ms  max=305.78ms p(90)=170.79ms p(95)=183.28ms p(99.9)=233.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165165
     http_req_receiving.............: avg=135.83µs min=27.91µs med=53.57µs max=127.43ms p(90)=135.29µs p(95)=340.67µs p(99.9)=14.19ms 
     http_req_sending...............: avg=72.21µs  min=4.8µs   med=9.94µs  max=243.89ms p(90)=18.08µs  p(95)=120.34µs p(99.9)=9.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.87ms  min=1.32ms  med=78.88ms max=305ms    p(90)=170.52ms p(95)=182.96ms p(99.9)=232.35ms
     http_reqs......................: 165165  2676.130671/s
     iteration_duration.............: avg=86.84ms  min=2.07ms  med=79.95ms max=336.96ms p(90)=171.22ms p(95)=183.68ms p(99.9)=234.39ms
     iterations.....................: 164165  2659.9279/s
     success_rate...................: 100.00% ✓ 164165      ✗ 0     
     vus............................: 90      min=0         max=499 
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

     checks.........................: 100.00% ✓ 451500      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=20.14µs min=911ns   med=2.55µs   max=62.71ms  p(90)=4.05µs   p(95)=5.08µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=16.73µs min=0s      med=0s       max=62.53ms  p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=93.88ms min=1.93ms  med=80.94ms  max=1.12s    p(90)=180.1ms  p(95)=207.24ms p(99.9)=652.24ms
       { expected_response:true }...: avg=93.88ms min=1.93ms  med=80.94ms  max=1.12s    p(90)=180.1ms  p(95)=207.24ms p(99.9)=652.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151500
     http_req_receiving.............: avg=1.34ms  min=51.91µs med=100.36µs max=628.58ms p(90)=1.67ms   p(95)=4.43ms   p(99.9)=96.65ms 
     http_req_sending...............: avg=64.21µs min=4.43µs  med=9.45µs   max=103.55ms p(90)=17.22µs  p(95)=112.55µs p(99.9)=8.81ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.47ms min=1.85ms  med=79.66ms  max=1.08s    p(90)=178.47ms p(95)=204.42ms p(99.9)=613.18ms
     http_reqs......................: 151500  2428.56077/s
     iteration_duration.............: avg=94.8ms  min=3.36ms  med=82.04ms  max=1.12s    p(90)=180.81ms p(95)=208.12ms p(99.9)=653.01ms
     iterations.....................: 150500  2412.530666/s
     success_rate...................: 100.00% ✓ 150500      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 220593      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.56µs   min=1µs     med=2.43µs   max=15.06ms  p(90)=3.98µs   p(95)=4.8µs    p(99.9)=455.77µs
     http_req_connecting............: avg=2.45µs   min=0s      med=0s       max=15ms     p(90)=0s       p(95)=0s       p(99.9)=386.56µs
     http_req_duration..............: avg=191.44ms min=1.92ms  med=192.44ms max=500.39ms p(90)=356.34ms p(95)=381.28ms p(99.9)=457.88ms
       { expected_response:true }...: avg=191.44ms min=1.92ms  med=192.44ms max=500.39ms p(90)=356.34ms p(95)=381.28ms p(99.9)=457.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74531
     http_req_receiving.............: avg=69.78µs  min=27.66µs med=57.5µs   max=18.5ms   p(90)=92.61µs  p(95)=107.61µs p(99.9)=969.05µs
     http_req_sending...............: avg=29.92µs  min=4.98µs  med=10.4µs   max=149.16ms p(90)=16.23µs  p(95)=19.73µs  p(99.9)=3.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.34ms min=1.83ms  med=192.31ms max=500.32ms p(90)=356.26ms p(95)=381.18ms p(99.9)=457.8ms 
     http_reqs......................: 74531   1193.136739/s
     iteration_duration.............: avg=194.28ms min=3.45ms  med=195.34ms max=500.56ms p(90)=357.21ms p(95)=382ms    p(99.9)=458.3ms 
     iterations.....................: 73531   1177.128142/s
     success_rate...................: 100.00% ✓ 73531       ✗ 0    
     vus............................: 78      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 106698     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   684 kB/s
     http_req_blocked...............: avg=8.14µs   min=1.18µs  med=3.16µs   max=3.44ms   p(90)=4.96µs   p(95)=5.97µs   p(99.9)=1.13ms
     http_req_connecting............: avg=3.98µs   min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.04ms
     http_req_duration..............: avg=392.29ms min=3.46ms  med=366.21ms max=1.49s    p(90)=772.97ms p(95)=845.42ms p(99.9)=1.18s 
       { expected_response:true }...: avg=392.29ms min=3.46ms  med=366.21ms max=1.49s    p(90)=772.97ms p(95)=845.42ms p(99.9)=1.18s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36566
     http_req_receiving.............: avg=102.34µs min=29.81µs med=72.08µs  max=146.01ms p(90)=110.84µs p(95)=125.23µs p(99.9)=1.28ms
     http_req_sending...............: avg=34.5µs   min=5.58µs  med=13.95µs  max=143.41ms p(90)=21.26µs  p(95)=24.37µs  p(99.9)=2.86ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=392.16ms min=3.39ms  med=366.12ms max=1.49s    p(90)=772.83ms p(95)=845.3ms  p(99.9)=1.18s 
     http_reqs......................: 36566   569.445953/s
     iteration_duration.............: avg=403.54ms min=28.16ms med=381.33ms max=1.49s    p(90)=776.61ms p(95)=848.62ms p(99.9)=1.18s 
     iterations.....................: 35566   553.872854/s
     success_rate...................: 100.00% ✓ 35566      ✗ 0    
     vus............................: 69      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47349      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=13.26µs  min=1.29µs  med=3.61µs   max=3.86ms   p(90)=5.36µs   p(95)=6.76µs   p(99.9)=2.13ms
     http_req_connecting............: avg=8.02µs   min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=2.1ms 
     http_req_duration..............: avg=842.69ms min=5.56ms  med=719.6ms  max=18.15s   p(90)=1.45s    p(95)=1.63s    p(99.9)=16.46s
       { expected_response:true }...: avg=842.69ms min=5.56ms  med=719.6ms  max=18.15s   p(90)=1.45s    p(95)=1.63s    p(99.9)=16.46s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16783
     http_req_receiving.............: avg=102.98µs min=38.26µs med=90.33µs  max=55.91ms  p(90)=128.29µs p(95)=144.89µs p(99.9)=1.17ms
     http_req_sending...............: avg=45.44µs  min=5.56µs  med=17.88µs  max=108.68ms p(90)=23.43µs  p(95)=27.22µs  p(99.9)=3.01ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=842.54ms min=5.48ms  med=719.49ms max=18.15s   p(90)=1.45s    p(95)=1.62s    p(99.9)=16.46s
     http_reqs......................: 16783   249.556691/s
     iteration_duration.............: avg=896.13ms min=20.19ms med=772.29ms max=18.16s   p(90)=1.47s    p(95)=1.64s    p(99.9)=16.54s
     iterations.....................: 15783   234.687079/s
     success_rate...................: 100.00% ✓ 15783      ✗ 0    
     vus............................: 70      min=0        max=497
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

     checks.........................: 100.00% ✓ 47508      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   282 kB/s
     http_req_blocked...............: avg=14.31µs  min=1.24µs  med=3.39µs   max=8.29ms   p(90)=5.06µs   p(95)=6.41µs   p(99.9)=2.34ms  
     http_req_connecting............: avg=9.22µs   min=0s      med=0s       max=8.06ms   p(90)=0s       p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=381.47ms min=7.48ms  med=441.41ms max=1.05s    p(90)=638.09ms p(95)=679.47ms p(99.9)=955.51ms
       { expected_response:true }...: avg=381.47ms min=7.48ms  med=441.41ms max=1.05s    p(90)=638.09ms p(95)=679.47ms p(99.9)=955.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16836
     http_req_receiving.............: avg=235.74µs min=33.38µs med=80.78µs  max=169.99ms p(90)=120.15µs p(95)=135.6µs  p(99.9)=58.9ms  
     http_req_sending...............: avg=43.71µs  min=5.56µs  med=16.24µs  max=111.12ms p(90)=21.86µs  p(95)=26.09µs  p(99.9)=3.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=381.19ms min=7.4ms   med=441.3ms  max=1.05s    p(90)=637.99ms p(95)=679.06ms p(99.9)=955.35ms
     http_reqs......................: 16836   230.262705/s
     iteration_duration.............: avg=405.55ms min=8.51ms  med=464.1ms  max=1.06s    p(90)=641.82ms p(95)=684.75ms p(99.9)=961.45ms
     iterations.....................: 15836   216.585899/s
     success_rate...................: 100.00% ✓ 15836      ✗ 0    
     vus............................: 57      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 431826      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=22.17µs min=972ns   med=2.86µs   max=70.12ms  p(90)=4.64µs   p(95)=5.86µs   p(99.9)=3.09ms  
     http_req_connecting............: avg=18.48µs min=0s      med=0s       max=70.02ms  p(90)=0s       p(95)=0s       p(99.9)=2.94ms  
     http_req_duration..............: avg=98.15ms min=1.53ms  med=84.12ms  max=1.51s    p(90)=187.07ms p(95)=215.58ms p(99.9)=854.07ms
       { expected_response:true }...: avg=98.15ms min=1.53ms  med=84.12ms  max=1.51s    p(90)=187.07ms p(95)=215.58ms p(99.9)=854.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144942
     http_req_receiving.............: avg=1.39ms  min=55.09µs med=107.68µs max=814.64ms p(90)=1.46ms   p(95)=3.9ms    p(99.9)=111.68ms
     http_req_sending...............: avg=74.92µs min=4.61µs  med=10.73µs  max=136.1ms  p(90)=21.1µs   p(95)=126.51µs p(99.9)=10.52ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.68ms min=1.45ms  med=82.89ms  max=1.51s    p(90)=185.35ms p(95)=212.74ms p(99.9)=804.56ms
     http_reqs......................: 144942  2341.429861/s
     iteration_duration.............: avg=99.11ms min=2.6ms   med=85.18ms  max=1.51s    p(90)=187.73ms p(95)=216.45ms p(99.9)=857.25ms
     iterations.....................: 143942  2325.275607/s
     success_rate...................: 100.00% ✓ 143942      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 406905      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=16.71µs  min=992ns  med=3.17µs   max=52.73ms  p(90)=5.11µs   p(95)=6.36µs   p(99.9)=849µs   
     http_req_connecting............: avg=12.81µs  min=0s     med=0s       max=52.49ms  p(90)=0s       p(95)=0s       p(99.9)=824.63µs
     http_req_duration..............: avg=104.12ms min=1.57ms med=98.97ms  max=341.53ms p(90)=201.66ms p(95)=219.12ms p(99.9)=272.19ms
       { expected_response:true }...: avg=104.12ms min=1.57ms med=98.97ms  max=341.53ms p(90)=201.66ms p(95)=219.12ms p(99.9)=272.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136635
     http_req_receiving.............: avg=130.52µs min=26.4µs med=59.55µs  max=123.26ms p(90)=131.96µs p(95)=360.87µs p(99.9)=11.71ms 
     http_req_sending...............: avg=65.54µs  min=5.14µs med=11.81µs  max=161.07ms p(90)=22.06µs  p(95)=130.82µs p(99.9)=8.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.92ms min=1.49ms med=98.76ms  max=341.17ms p(90)=201.39ms p(95)=218.82ms p(99.9)=271.76ms
     http_reqs......................: 136635  2202.408023/s
     iteration_duration.............: avg=105.14ms min=3.45ms med=100.08ms max=350.61ms p(90)=202.18ms p(95)=219.59ms p(99.9)=272.86ms
     iterations.....................: 135635  2186.289107/s
     success_rate...................: 100.00% ✓ 135635      ✗ 0     
     vus............................: 59      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 216660      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.65µs   min=962ns   med=2.34µs   max=14.76ms  p(90)=4.19µs   p(95)=5.17µs   p(99.9)=466.6µs 
     http_req_connecting............: avg=2.57µs   min=0s      med=0s       max=14.59ms  p(90)=0s       p(95)=0s       p(99.9)=406.52µs
     http_req_duration..............: avg=194.9ms  min=2ms     med=196.48ms max=557.71ms p(90)=361.59ms p(95)=387.4ms  p(99.9)=482.32ms
       { expected_response:true }...: avg=194.9ms  min=2ms     med=196.48ms max=557.71ms p(90)=361.59ms p(95)=387.4ms  p(99.9)=482.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73220
     http_req_receiving.............: avg=81.86µs  min=26.36µs med=61.38µs  max=218.01ms p(90)=102.69µs p(95)=118.75µs p(99.9)=1.1ms   
     http_req_sending...............: avg=29.34µs  min=4.99µs  med=11.21µs  max=138.18ms p(90)=19.23µs  p(95)=22.99µs  p(99.9)=3.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.79ms min=1.92ms  med=196.32ms max=557.65ms p(90)=361.5ms  p(95)=387.26ms p(99.9)=482.27ms
     http_reqs......................: 73220   1169.786588/s
     iteration_duration.............: avg=197.83ms min=5.23ms  med=199.6ms  max=557.92ms p(90)=362.53ms p(95)=387.99ms p(99.9)=483.03ms
     iterations.....................: 72220   1153.810262/s
     success_rate...................: 100.00% ✓ 72220       ✗ 0    
     vus............................: 83      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99414     ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   633 kB/s
     http_req_blocked...............: avg=9.33µs   min=1.18µs  med=3.26µs   max=8.07ms   p(90)=5.02µs   p(95)=6.15µs   p(99.9)=1.52ms
     http_req_connecting............: avg=4.95µs   min=0s      med=0s       max=7.22ms   p(90)=0s       p(95)=0s       p(99.9)=1.47ms
     http_req_duration..............: avg=420.33ms min=3.99ms  med=387.71ms max=1.9s     p(90)=828.28ms p(95)=910.23ms p(99.9)=1.34s 
       { expected_response:true }...: avg=420.33ms min=3.99ms  med=387.71ms max=1.9s     p(90)=828.28ms p(95)=910.23ms p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 34138
     http_req_receiving.............: avg=91.11µs  min=32.78µs med=76.81µs  max=89.6ms   p(90)=116.99µs p(95)=132.21µs p(99.9)=1.19ms
     http_req_sending...............: avg=35.36µs  min=5.44µs  med=15.02µs  max=171.76ms p(90)=22.17µs  p(95)=25.56µs  p(99.9)=2.11ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=420.2ms  min=3.86ms  med=387.63ms max=1.9s     p(90)=828.19ms p(95)=910.14ms p(99.9)=1.34s 
     http_reqs......................: 34138   527.26961/s
     iteration_duration.............: avg=433.25ms min=18.88ms med=404.63ms max=1.93s    p(90)=832.1ms  p(95)=913.62ms p(99.9)=1.35s 
     iterations.....................: 33138   511.82437/s
     success_rate...................: 100.00% ✓ 33138     ✗ 0    
     vus............................: 91      min=0       max=500
     vus_max........................: 500     min=500     max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47124      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   298 kB/s
     http_req_blocked...............: avg=13.3µs   min=1.13µs  med=3.51µs   max=3.67ms  p(90)=5.42µs   p(95)=7.19µs   p(99.9)=2.23ms
     http_req_connecting............: avg=8.12µs   min=0s      med=0s       max=3.64ms  p(90)=0s       p(95)=0s       p(99.9)=2.2ms 
     http_req_duration..............: avg=871.01ms min=5.72ms  med=786.53ms max=4.78s   p(90)=1.73s    p(95)=1.99s    p(99.9)=3.99s 
       { expected_response:true }...: avg=871.01ms min=5.72ms  med=786.53ms max=4.78s   p(90)=1.73s    p(95)=1.99s    p(99.9)=3.99s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16708
     http_req_receiving.............: avg=100.28µs min=33.4µs  med=93.09µs  max=18.2ms  p(90)=130.38µs p(95)=146.71µs p(99.9)=1.11ms
     http_req_sending...............: avg=28.08µs  min=5.35µs  med=18.04µs  max=16.07ms p(90)=23.96µs  p(95)=28.7µs   p(99.9)=2.4ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=870.88ms min=5.59ms  med=786.41ms max=4.78s   p(90)=1.73s    p(95)=1.98s    p(99.9)=3.99s 
     http_reqs......................: 16708   248.342999/s
     iteration_duration.............: avg=926.49ms min=29.27ms med=851.66ms max=4.78s   p(90)=1.76s    p(95)=2s       p(99.9)=4.04s 
     iterations.....................: 15708   233.479281/s
     success_rate...................: 100.00% ✓ 15708      ✗ 0    
     vus............................: 69      min=0        max=500
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

     checks.........................: 100.00% ✓ 45093      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=14.98µs  min=1.05µs  med=3.16µs   max=11.1ms   p(90)=4.89µs   p(95)=6.54µs   p(99.9)=2.21ms
     http_req_connecting............: avg=10.02µs  min=0s      med=0s       max=11.03ms  p(90)=0s       p(95)=0s       p(99.9)=2.16ms
     http_req_duration..............: avg=906.77ms min=7.81ms  med=824.24ms max=3.14s    p(90)=1.84s    p(95)=1.98s    p(99.9)=2.87s 
       { expected_response:true }...: avg=906.77ms min=7.81ms  med=824.24ms max=3.14s    p(90)=1.84s    p(95)=1.98s    p(99.9)=2.87s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16031
     http_req_receiving.............: avg=105.27µs min=34.19µs med=88.89µs  max=124.29ms p(90)=129.98µs p(95)=145.75µs p(99.9)=1.22ms
     http_req_sending...............: avg=34.84µs  min=5.45µs  med=16.81µs  max=104.47ms p(90)=22.36µs  p(95)=28.19µs  p(99.9)=2.51ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=906.63ms min=7.73ms  med=824.05ms max=3.13s    p(90)=1.84s    p(95)=1.98s    p(99.9)=2.87s 
     http_reqs......................: 16031   232.507613/s
     iteration_duration.............: avg=967.11ms min=33.36ms med=885.65ms max=3.15s    p(90)=1.86s    p(95)=1.99s    p(99.9)=2.9s  
     iterations.....................: 15031   218.003988/s
     success_rate...................: 100.00% ✓ 15031      ✗ 0    
     vus............................: 31      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

