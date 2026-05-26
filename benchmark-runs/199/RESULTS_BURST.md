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
| hive-router | v0.0.49 | 2,758 | 2,845 | 2,721 | 1.5% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,042 | 2,073 | 2,025 | 0.9% |  |
| cosmo | 0.307.0 | 1,186 | 1,192 | 1,180 | 0.4% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 485 | 489 | 482 | 0.6% |  |
| hive-gateway | 2.5.25 | 234 | 237 | 217 | 2.9% |  |
| apollo-gateway | 2.13.3 | 202 | 206 | 199 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (25451 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (492636 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,203 | 2,302 | 2,174 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,900 | 1,934 | 1,788 | 2.2% |  |
| cosmo | 0.307.0 | 1,114 | 1,129 | 1,106 | 1.0% | non-compatible response (8 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 468 | 473 | 463 | 0.8% |  |
| hive-gateway | 2.5.25 | 229 | 229 | 226 | 0.5% |  |
| apollo-gateway | 2.13.3 | 211 | 213 | 210 | 0.5% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (26457 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (252448 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 509073      ✗ 0     
     data_received..................: 15 GB   242 MB/s
     data_sent......................: 205 MB  3.3 MB/s
     http_req_blocked...............: avg=32.04µs  min=962ns   med=2.33µs  max=79.09ms  p(90)=3.9µs    p(95)=5.06µs   p(99.9)=9.28ms  
     http_req_connecting............: avg=28.9µs   min=0s      med=0s      max=79.03ms  p(90)=0s       p(95)=0s       p(99.9)=9ms     
     http_req_duration..............: avg=83.2ms   min=1.57ms  med=77.43ms max=401.22ms p(90)=161.24ms p(95)=180.25ms p(99.9)=251.28ms
       { expected_response:true }...: avg=83.2ms   min=1.57ms  med=77.43ms max=401.22ms p(90)=161.24ms p(95)=180.25ms p(99.9)=251.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 170691
     http_req_receiving.............: avg=463.78µs min=27.85µs med=56.23µs max=249.06ms p(90)=247.6µs  p(95)=423.87µs p(99.9)=48.19ms 
     http_req_sending...............: avg=88.63µs  min=5.31µs  med=9.99µs  max=58.44ms  p(90)=18.66µs  p(95)=132.49µs p(99.9)=13.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.65ms  min=1.49ms  med=77.1ms  max=308.01ms p(90)=160.31ms p(95)=178.59ms p(99.9)=242.53ms
     http_reqs......................: 170691  2758.558589/s
     iteration_duration.............: avg=84.01ms  min=2.36ms  med=78.28ms max=422.03ms p(90)=161.79ms p(95)=180.89ms p(99.9)=253.77ms
     iterations.....................: 169691  2742.397464/s
     success_rate...................: 100.00% ✓ 169691      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 381915      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=15.71µs  min=992ns  med=2.19µs   max=58.2ms   p(90)=3.43µs   p(95)=4.3µs    p(99.9)=1.5ms   
     http_req_connecting............: avg=12.68µs  min=0s     med=0s       max=58.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=110.94ms min=2.36ms med=101.77ms max=657.01ms p(90)=215.66ms p(95)=255.25ms p(99.9)=471.87ms
       { expected_response:true }...: avg=110.94ms min=2.36ms med=101.77ms max=657.01ms p(90)=215.66ms p(95)=255.25ms p(99.9)=471.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128305
     http_req_receiving.............: avg=2.07ms   min=51.4µs med=115.93µs max=327.18ms p(90)=1.41ms   p(95)=4.84ms   p(99.9)=155.34ms
     http_req_sending...............: avg=62.9µs   min=5.11µs med=9.49µs   max=146.06ms p(90)=16.6µs   p(95)=116.16µs p(99.9)=9.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.81ms min=2.28ms med=100.65ms max=542.65ms p(90)=212.39ms p(95)=247.29ms p(99.9)=411ms   
     http_reqs......................: 128305  2042.476034/s
     iteration_duration.............: avg=112.07ms min=3.94ms med=103.2ms  max=657.28ms p(90)=216.45ms p(95)=256.02ms p(99.9)=472.74ms
     iterations.....................: 127305  2026.557121/s
     success_rate...................: 100.00% ✓ 127305      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 219267      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=29.77µs  min=1.05µs  med=2.44µs   max=94.91ms  p(90)=3.87µs   p(95)=4.65µs   p(99.9)=583.09µs
     http_req_connecting............: avg=26.51µs  min=0s      med=0s       max=91.27ms  p(90)=0s       p(95)=0s       p(99.9)=461.68µs
     http_req_duration..............: avg=192.57ms min=1.99ms  med=193.82ms max=655.71ms p(90)=355.91ms p(95)=380.94ms p(99.9)=512.48ms
       { expected_response:true }...: avg=192.57ms min=1.99ms  med=193.82ms max=655.71ms p(90)=355.91ms p(95)=380.94ms p(99.9)=512.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74089
     http_req_receiving.............: avg=88.39µs  min=28.99µs med=59.98µs  max=170.69ms p(90)=92.28µs  p(95)=105.2µs  p(99.9)=1.88ms  
     http_req_sending...............: avg=81.35µs  min=5.45µs  med=10.51µs  max=254.7ms  p(90)=15.84µs  p(95)=19.25µs  p(99.9)=4.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.4ms  min=1.93ms  med=193.65ms max=655.64ms p(90)=355.81ms p(95)=380.84ms p(99.9)=512.2ms 
     http_reqs......................: 74089   1186.296611/s
     iteration_duration.............: avg=195.47ms min=3.93ms  med=197.2ms  max=655.87ms p(90)=356.71ms p(95)=381.65ms p(99.9)=514.42ms
     iterations.....................: 73089   1170.284833/s
     success_rate...................: 100.00% ✓ 73089       ✗ 0    
     vus............................: 77      min=0         max=493
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

     checks.........................: 100.00% ✓ 91626      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   583 kB/s
     http_req_blocked...............: avg=9.25µs   min=1.2µs   med=3µs      max=4.83ms  p(90)=4.72µs   p(95)=5.74µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=5.23µs   min=0s      med=0s       max=4.76ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=455.41ms min=4.07ms  med=422.6ms  max=1.91s   p(90)=902.65ms p(95)=977.86ms p(99.9)=1.41s   
       { expected_response:true }...: avg=455.41ms min=4.07ms  med=422.6ms  max=1.91s   p(90)=902.65ms p(95)=977.86ms p(99.9)=1.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31542
     http_req_receiving.............: avg=89.06µs  min=34.26µs med=77.81µs  max=46.31ms p(90)=113.38µs p(95)=127.28µs p(99.9)=812.73µs
     http_req_sending...............: avg=29.84µs  min=6.07µs  med=13.26µs  max=47.75ms p(90)=20.29µs  p(95)=23.95µs  p(99.9)=2.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=455.29ms min=4.01ms  med=422.45ms max=1.91s   p(90)=902.57ms p(95)=977.74ms p(99.9)=1.41s   
     http_reqs......................: 31542   485.401995/s
     iteration_duration.............: avg=470.53ms min=30.68ms med=440.35ms max=1.92s   p(90)=906.78ms p(95)=981.55ms p(99.9)=1.42s   
     iterations.....................: 30542   470.012927/s
     success_rate...................: 100.00% ✓ 30542      ✗ 0    
     vus............................: 54      min=0        max=499
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

     checks.........................: 100.00% ✓ 44963      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   282 kB/s
     http_req_blocked...............: avg=14.28µs  min=1.25µs  med=3.85µs   max=5.91ms  p(90)=5.81µs   p(95)=7.64µs   p(99.9)=1.94ms
     http_req_connecting............: avg=8.66µs   min=0s      med=0s       max=5.85ms  p(90)=0s       p(95)=0s       p(99.9)=1.92ms
     http_req_duration..............: avg=906.72ms min=6.06ms  med=785.45ms max=18.61s  p(90)=1.58s    p(95)=1.73s    p(99.9)=17.98s
       { expected_response:true }...: avg=906.72ms min=6.06ms  med=785.45ms max=18.61s  p(90)=1.58s    p(95)=1.73s    p(99.9)=17.98s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15988
     http_req_receiving.............: avg=109.92µs min=37.56µs med=101.02µs max=18.8ms  p(90)=141.71µs p(95)=155.37µs p(99.9)=1.17ms
     http_req_sending...............: avg=32.21µs  min=6.02µs  med=18.52µs  max=15.89ms p(90)=25.1µs   p(95)=31.34µs  p(99.9)=3.01ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=906.58ms min=5.96ms  med=785.31ms max=18.61s  p(90)=1.58s    p(95)=1.73s    p(99.9)=17.98s
     http_reqs......................: 15988   234.842624/s
     iteration_duration.............: avg=966.14ms min=43.12ms med=879.71ms max=18.61s  p(90)=1.59s    p(95)=1.75s    p(99.9)=18s   
     iterations.....................: 14987   220.139255/s
     success_rate...................: 100.00% ✓ 14987      ✗ 0    
     vus............................: 61      min=0        max=499
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

     checks.........................: 100.00% ✓ 42213      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   248 kB/s
     http_req_blocked...............: avg=14.44µs  min=1.15µs  med=3.31µs   max=3.42ms  p(90)=4.95µs   p(95)=6.43µs   p(99.9)=2.25ms
     http_req_connecting............: avg=9.37µs   min=0s      med=0s       max=3.4ms   p(90)=0s       p(95)=0s       p(99.9)=2.19ms
     http_req_duration..............: avg=467.43ms min=8.72ms  med=525.4ms  max=1.43s   p(90)=844.15ms p(95)=944.23ms p(99.9)=1.35s 
       { expected_response:true }...: avg=467.43ms min=8.72ms  med=525.4ms  max=1.43s   p(90)=844.15ms p(95)=944.23ms p(99.9)=1.35s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15071
     http_req_receiving.............: avg=100.76µs min=34.64µs med=88.71µs  max=35.84ms p(90)=128.7µs  p(95)=142.44µs p(99.9)=1.11ms
     http_req_sending...............: avg=29.4µs   min=6.28µs  med=15.97µs  max=26.89ms p(90)=21.96µs  p(95)=26.99µs  p(99.9)=2.51ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=467.3ms  min=8.58ms  med=525.32ms max=1.43s   p(90)=844.08ms p(95)=944.06ms p(99.9)=1.35s 
     http_reqs......................: 15071   202.287419/s
     iteration_duration.............: avg=500.51ms min=9.03ms  med=548.32ms max=1.44s   p(90)=858.58ms p(95)=948.65ms p(99.9)=1.36s 
     iterations.....................: 14071   188.865123/s
     success_rate...................: 100.00% ✓ 14071      ✗ 0    
     vus............................: 72      min=0        max=499
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

     checks.........................: 100.00% ✓ 407199      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=24.77µs  min=971ns   med=2.84µs  max=66.82ms  p(90)=4.71µs   p(95)=5.94µs   p(99.9)=2.93ms  
     http_req_connecting............: avg=20.9µs   min=0s      med=0s      max=66.65ms  p(90)=0s       p(95)=0s       p(99.9)=2.78ms  
     http_req_duration..............: avg=104.02ms min=1.61ms  med=97.23ms max=328.54ms p(90)=201.61ms p(95)=219.5ms  p(99.9)=272.79ms
       { expected_response:true }...: avg=104.02ms min=1.61ms  med=97.23ms max=328.54ms p(90)=201.61ms p(95)=219.5ms  p(99.9)=272.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136733
     http_req_receiving.............: avg=239.76µs min=29.41µs med=63.12µs max=150.73ms p(90)=185.94µs p(95)=440.45µs p(99.9)=26.88ms 
     http_req_sending...............: avg=80.39µs  min=5.44µs  med=11.34µs max=118.01ms p(90)=21.86µs  p(95)=143.79µs p(99.9)=11.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.7ms  min=1.56ms  med=97.02ms max=310.42ms p(90)=200.96ms p(95)=218.85ms p(99.9)=269.76ms
     http_reqs......................: 136733  2203.378684/s
     iteration_duration.............: avg=105.08ms min=4.45ms  med=98.41ms max=351.24ms p(90)=202.21ms p(95)=220.04ms p(99.9)=273.95ms
     iterations.....................: 135733  2187.264222/s
     success_rate...................: 100.00% ✓ 135733      ✗ 0     
     vus............................: 60      min=0         max=497 
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

     checks.........................: 100.00% ✓ 351486      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=15.08µs  min=992ns   med=2.67µs   max=64.28ms  p(90)=4.31µs   p(95)=5.37µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=11.61µs  min=0s      med=0s       max=64.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=120.47ms min=1.71ms  med=111.97ms max=655.69ms p(90)=231.44ms p(95)=265.42ms p(99.9)=510.33ms
       { expected_response:true }...: avg=120.47ms min=1.71ms  med=111.97ms max=655.69ms p(90)=231.44ms p(95)=265.42ms p(99.9)=510.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118162
     http_req_receiving.............: avg=2.04ms   min=52.55µs med=119.55µs max=275.92ms p(90)=1.93ms   p(95)=5.56ms   p(99.9)=154.89ms
     http_req_sending...............: avg=66.36µs  min=5.3µs   med=10.66µs  max=222.42ms p(90)=19.36µs  p(95)=121.3µs  p(99.9)=8.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.36ms min=1.63ms  med=110.55ms max=655.61ms p(90)=227.69ms p(95)=258.81ms p(99.9)=508.06ms
     http_reqs......................: 118162  1900.674449/s
     iteration_duration.............: avg=121.78ms min=2.91ms  med=113.45ms max=655.88ms p(90)=232.3ms  p(95)=266.26ms p(99.9)=510.64ms
     iterations.....................: 117162  1884.589121/s
     success_rate...................: 100.00% ✓ 117162      ✗ 0     
     vus............................: 65      min=0         max=496 
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

     checks.........................: 100.00% ✓ 206271      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.21µs   min=1.05µs med=2.75µs   max=51.92ms  p(90)=4.5µs    p(95)=5.47µs   p(99.9)=605.28µs
     http_req_connecting............: avg=3.77µs   min=0s     med=0s       max=51.86ms  p(90)=0s       p(95)=0s       p(99.9)=539.29µs
     http_req_duration..............: avg=204.63ms min=2.1ms  med=203.43ms max=588.69ms p(90)=379.27ms p(95)=408.69ms p(99.9)=514.11ms
       { expected_response:true }...: avg=204.63ms min=2.1ms  med=203.43ms max=588.69ms p(90)=379.27ms p(95)=408.69ms p(99.9)=514.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69757
     http_req_receiving.............: avg=85.11µs  min=30.3µs med=65.83µs  max=155.14ms p(90)=103.13µs p(95)=118.86µs p(99.9)=1.92ms  
     http_req_sending...............: avg=32.59µs  min=5.69µs med=12.02µs  max=153.71ms p(90)=18.54µs  p(95)=22.13µs  p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.51ms min=2.04ms med=203.32ms max=588.6ms  p(90)=379.13ms p(95)=408.59ms p(99.9)=514.01ms
     http_reqs......................: 69757   1114.276948/s
     iteration_duration.............: avg=207.85ms min=4.9ms  med=207.11ms max=588.87ms p(90)=380.27ms p(95)=409.43ms p(99.9)=514.87ms
     iterations.....................: 68757   1098.303255/s
     success_rate...................: 100.00% ✓ 68757       ✗ 0    
     vus............................: 85      min=0         max=498
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

     checks.........................: 100.00% ✓ 88704      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   562 kB/s
     http_req_blocked...............: avg=11.33µs  min=1.25µs  med=3.25µs   max=34.96ms p(90)=5.01µs   p(95)=6µs      p(99.9)=1.67ms  
     http_req_connecting............: avg=7.01µs   min=0s      med=0s       max=34.89ms p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=469.88ms min=4.2ms   med=437.15ms max=1.96s   p(90)=922.51ms p(95)=1s       p(99.9)=1.51s   
       { expected_response:true }...: avg=469.88ms min=4.2ms   med=437.15ms max=1.96s   p(90)=922.51ms p(95)=1s       p(99.9)=1.51s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30568
     http_req_receiving.............: avg=100.55µs min=33.82µs med=81.39µs  max=106ms   p(90)=117.75µs p(95)=131.17µs p(99.9)=830.93µs
     http_req_sending...............: avg=29µs     min=6.09µs  med=14.16µs  max=64.47ms p(90)=21.43µs  p(95)=24.52µs  p(99.9)=3.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=469.75ms min=4.14ms  med=437.04ms max=1.96s   p(90)=922.36ms p(95)=1s       p(99.9)=1.51s   
     http_reqs......................: 30568   468.108518/s
     iteration_duration.............: avg=486.01ms min=32.21ms med=455.4ms  max=1.97s   p(90)=926.52ms p(95)=1.01s    p(99.9)=1.52s   
     iterations.....................: 29568   452.794839/s
     success_rate...................: 100.00% ✓ 29568      ✗ 0    
     vus............................: 72      min=0        max=496
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

     checks.........................: 100.00% ✓ 43869      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   275 kB/s
     http_req_blocked...............: avg=14.68µs  min=1.2µs   med=3.83µs   max=8.28ms  p(90)=5.72µs  p(95)=7.41µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=8.87µs   min=0s      med=0s       max=8.21ms  p(90)=0s      p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=933.67ms min=6.32ms  med=846.57ms max=5.43s   p(90)=1.88s   p(95)=2.05s    p(99.9)=4.72s   
       { expected_response:true }...: avg=933.67ms min=6.32ms  med=846.57ms max=5.43s   p(90)=1.88s   p(95)=2.05s    p(99.9)=4.72s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15623
     http_req_receiving.............: avg=111.39µs min=33.24µs med=100.12µs max=42.11ms p(90)=140.3µs p(95)=152.45µs p(99.9)=802.64µs
     http_req_sending...............: avg=31.57µs  min=6.82µs  med=18.5µs   max=43.11ms p(90)=24.67µs p(95)=29.55µs  p(99.9)=2.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=933.52ms min=6.23ms  med=846.45ms max=5.43s   p(90)=1.88s   p(95)=2.05s    p(99.9)=4.72s   
     http_reqs......................: 15623   229.171496/s
     iteration_duration.............: avg=997.58ms min=32.52ms med=941.36ms max=5.44s   p(90)=1.89s   p(95)=2.06s    p(99.9)=4.75s   
     iterations.....................: 14623   214.502643/s
     success_rate...................: 100.00% ✓ 14623      ✗ 0    
     vus............................: 66      min=0        max=500
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

     checks.........................: 100.00% ✓ 41307      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   254 kB/s
     http_req_blocked...............: avg=15.64µs  min=1.3µs   med=3.76µs   max=4.89ms   p(90)=5.67µs   p(95)=7.41µs   p(99.9)=2.35ms 
     http_req_connecting............: avg=10.08µs  min=0s      med=0s       max=4.84ms   p(90)=0s       p(95)=0s       p(99.9)=2.32ms 
     http_req_duration..............: avg=986.98ms min=8.66ms  med=894.4ms  max=3.88s    p(90)=2.02s    p(95)=2.14s    p(99.9)=3.53s  
       { expected_response:true }...: avg=986.98ms min=8.66ms  med=894.4ms  max=3.88s    p(90)=2.02s    p(95)=2.14s    p(99.9)=3.53s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14769
     http_req_receiving.............: avg=269.08µs min=36.63µs med=99.82µs  max=117.31ms p(90)=139.94µs p(95)=154.11µs p(99.9)=88.34ms
     http_req_sending...............: avg=32.72µs  min=6.38µs  med=18.55µs  max=30.18ms  p(90)=24.81µs  p(95)=30.24µs  p(99.9)=2.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=986.68ms min=8.55ms  med=894.31ms max=3.88s    p(90)=2.02s    p(95)=2.14s    p(99.9)=3.53s  
     http_reqs......................: 14769   211.365068/s
     iteration_duration.............: avg=1.05s    min=12.64ms med=970.28ms max=3.89s    p(90)=2.04s    p(95)=2.15s    p(99.9)=3.54s  
     iterations.....................: 13769   197.053668/s
     success_rate...................: 100.00% ✓ 13769      ✗ 0    
     vus............................: 10      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

