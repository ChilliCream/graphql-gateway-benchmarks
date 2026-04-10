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
| hive-router | v0.0.43 | 2,713 | 2,810 | 2,647 | 2.0% |  |
| hotchocolate | 16.0.0-rc.1.27 | 2,023 | 2,074 | 2,010 | 1.1% |  |
| cosmo | 0.298.0 | 1,169 | 1,172 | 1,158 | 0.6% | non-compatible response (12 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 556 | 565 | 553 | 0.8% |  |
| hive-gateway | 2.5.14 | 247 | 253 | 239 | 1.8% |  |
| apollo-gateway | 2.13.3 | 203 | 207 | 200 | 1.3% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (43927 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (461762 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,199 | 2,310 | 2,160 | 2.3% |  |
| hotchocolate | 16.0.0-rc.1.27 | 1,858 | 1,899 | 1,839 | 1.1% |  |
| cosmo | 0.298.0 | 1,155 | 1,162 | 1,141 | 0.8% | non-compatible response (14 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 536 | 547 | 530 | 1.1% |  |
| hive-gateway | 2.5.14 | 251 | 255 | 246 | 1.0% |  |
| apollo-gateway | 2.13.3 | 205 | 207 | 202 | 0.7% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (31905 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (194916 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 501021      ✗ 0     
     data_received..................: 15 GB   238 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=31µs    min=990ns   med=2.47µs  max=83.23ms  p(90)=4µs      p(95)=5.06µs   p(99.9)=4.56ms  
     http_req_connecting............: avg=27.91µs min=0s      med=0s      max=83.18ms  p(90)=0s       p(95)=0s       p(99.9)=4.5ms   
     http_req_duration..............: avg=84.54ms min=1.59ms  med=79.83ms max=331.28ms p(90)=162.61ms p(95)=180.3ms  p(99.9)=256.53ms
       { expected_response:true }...: avg=84.54ms min=1.59ms  med=79.83ms max=331.28ms p(90)=162.61ms p(95)=180.3ms  p(99.9)=256.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168007
     http_req_receiving.............: avg=447.7µs min=29.19µs med=56.43µs max=169.71ms p(90)=255.61µs p(95)=422.93µs p(99.9)=48.49ms 
     http_req_sending...............: avg=92.48µs min=5.32µs  med=10.09µs max=118.75ms p(90)=18.63µs  p(95)=133.59µs p(99.9)=14.59ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84ms    min=1.54ms  med=79.44ms max=309.01ms p(90)=161.8ms  p(95)=178.75ms p(99.9)=251.21ms
     http_reqs......................: 168007  2713.778268/s
     iteration_duration.............: avg=85.36ms min=2.02ms  med=80.76ms max=369.8ms  p(90)=163.16ms p(95)=181ms    p(99.9)=257.87ms
     iterations.....................: 167007  2697.625499/s
     success_rate...................: 100.00% ✓ 167007      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.27)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 378444      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=24.34µs  min=1.01µs  med=2.24µs   max=174.19ms p(90)=3.51µs   p(95)=4.39µs   p(99.9)=2.95ms  
     http_req_connecting............: avg=21.44µs  min=0s      med=0s       max=174.01ms p(90)=0s       p(95)=0s       p(99.9)=2.92ms  
     http_req_duration..............: avg=111.94ms min=2.4ms   med=107.68ms max=522.77ms p(90)=212.3ms  p(95)=234.14ms p(99.9)=364.88ms
       { expected_response:true }...: avg=111.94ms min=2.4ms   med=107.68ms max=522.77ms p(90)=212.3ms  p(95)=234.14ms p(99.9)=364.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127148
     http_req_receiving.............: avg=1.19ms   min=52.19µs med=155.85µs max=169.47ms p(90)=1.34ms   p(95)=3.21ms   p(99.9)=98.06ms 
     http_req_sending...............: avg=62.75µs  min=5.29µs  med=9.49µs   max=224ms    p(90)=16.78µs  p(95)=117.94µs p(99.9)=8.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.68ms min=2.32ms  med=106.33ms max=517.32ms p(90)=210.8ms  p(95)=231.19ms p(99.9)=361.62ms
     http_reqs......................: 127148  2023.862457/s
     iteration_duration.............: avg=113.09ms min=3.45ms  med=109.04ms max=522.97ms p(90)=212.81ms p(95)=234.92ms p(99.9)=365.54ms
     iterations.....................: 126148  2007.945082/s
     success_rate...................: 100.00% ✓ 126148      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 216315      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.5µs    min=1.09µs  med=2.59µs   max=7.41ms   p(90)=4.01µs   p(95)=4.83µs   p(99.9)=457.55µs
     http_req_connecting............: avg=2.28µs   min=0s      med=0s       max=7.23ms   p(90)=0s       p(95)=0s       p(99.9)=416.22µs
     http_req_duration..............: avg=195.22ms min=2.03ms  med=198.12ms max=525.75ms p(90)=360.69ms p(95)=385.7ms  p(99.9)=465.15ms
       { expected_response:true }...: avg=195.22ms min=2.03ms  med=198.12ms max=525.75ms p(90)=360.69ms p(95)=385.7ms  p(99.9)=465.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73105
     http_req_receiving.............: avg=78.42µs  min=29.88µs med=62.63µs  max=114.95ms p(90)=95.58µs  p(95)=109.04µs p(99.9)=1.17ms  
     http_req_sending...............: avg=27.78µs  min=5.41µs  med=10.84µs  max=46.43ms  p(90)=16.6µs   p(95)=19.9µs   p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.11ms min=1.98ms  med=198.01ms max=525.67ms p(90)=360.58ms p(95)=385.62ms p(99.9)=465.1ms 
     http_reqs......................: 73105   1169.531157/s
     iteration_duration.............: avg=198.16ms min=5.09ms  med=201.5ms  max=525.9ms  p(90)=361.53ms p(95)=386.38ms p(99.9)=466.11ms
     iterations.....................: 72105   1153.533193/s
     success_rate...................: 100.00% ✓ 72105       ✗ 0    
     vus............................: 81      min=0         max=494
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

     checks.........................: 100.00% ✓ 104676     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   668 kB/s
     http_req_blocked...............: avg=8.24µs   min=1.19µs  med=2.85µs   max=6.2ms   p(90)=4.6µs    p(95)=5.56µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=4.34µs   min=0s      med=0s       max=6.13ms  p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=399.68ms min=3.66ms  med=370.92ms max=1.94s   p(90)=784.13ms p(95)=861.35ms p(99.9)=1.23s   
       { expected_response:true }...: avg=399.68ms min=3.66ms  med=370.92ms max=1.94s   p(90)=784.13ms p(95)=861.35ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35892
     http_req_receiving.............: avg=86.55µs  min=33.31µs med=74.54µs  max=79.75ms p(90)=110.27µs p(95)=124.07µs p(99.9)=962.03µs
     http_req_sending...............: avg=28.53µs  min=6.06µs  med=12.94µs  max=47.91ms p(90)=20.36µs  p(95)=23.91µs  p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=399.56ms min=3.61ms  med=370.84ms max=1.94s   p(90)=784.01ms p(95)=861.24ms p(99.9)=1.23s   
     http_reqs......................: 35892   556.22505/s
     iteration_duration.............: avg=411.34ms min=18.87ms med=386.22ms max=1.95s   p(90)=788.44ms p(95)=864.34ms p(99.9)=1.24s   
     iterations.....................: 34892   540.727863/s
     success_rate...................: 100.00% ✓ 34892      ✗ 0    
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

     checks.........................: 100.00% ✓ 47166      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   298 kB/s
     http_req_blocked...............: avg=11.32µs  min=1.31µs  med=3.68µs   max=2.37ms   p(90)=5.62µs   p(95)=7.12µs   p(99.9)=1.09ms  
     http_req_connecting............: avg=6.02µs   min=0s      med=0s       max=2.35ms   p(90)=0s       p(95)=0s       p(99.9)=1.06ms  
     http_req_duration..............: avg=856.24ms min=5.71ms  med=746.02ms max=17.85s   p(90)=1.44s    p(95)=1.68s    p(99.9)=16.77s  
       { expected_response:true }...: avg=856.24ms min=5.71ms  med=746.02ms max=17.85s   p(90)=1.44s    p(95)=1.68s    p(99.9)=16.77s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16722
     http_req_receiving.............: avg=113.09µs min=35.34µs med=97.81µs  max=81.65ms  p(90)=138.95µs p(95)=152.58µs p(99.9)=859.92µs
     http_req_sending...............: avg=39.79µs  min=6.26µs  med=17.89µs  max=102.12ms p(90)=24.5µs   p(95)=29.07µs  p(99.9)=2.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=856.08ms min=5.61ms  med=745.88ms max=17.85s   p(90)=1.44s    p(95)=1.68s    p(99.9)=16.77s  
     http_reqs......................: 16722   247.339737/s
     iteration_duration.............: avg=910.75ms min=45.41ms med=807.57ms max=17.86s   p(90)=1.46s    p(95)=1.69s    p(99.9)=16.83s  
     iterations.....................: 15722   232.54846/s
     success_rate...................: 100.00% ✓ 15722      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 42429      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   251 kB/s
     http_req_blocked...............: avg=14.18µs  min=1.32µs  med=3.48µs   max=29.02ms p(90)=5.22µs   p(95)=6.74µs   p(99.9)=1.35ms
     http_req_connecting............: avg=8.93µs   min=0s      med=0s       max=28.96ms p(90)=0s       p(95)=0s       p(99.9)=1.3ms 
     http_req_duration..............: avg=440.15ms min=8.39ms  med=482.63ms max=1.31s   p(90)=761.17ms p(95)=813.43ms p(99.9)=1.15s 
       { expected_response:true }...: avg=440.15ms min=8.39ms  med=482.63ms max=1.31s   p(90)=761.17ms p(95)=813.43ms p(99.9)=1.15s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15143
     http_req_receiving.............: avg=112.47µs min=36.22µs med=92.98µs  max=91.12ms p(90)=133.31µs p(95)=146.44µs p(99.9)=1.1ms 
     http_req_sending...............: avg=33.15µs  min=6.15µs  med=17.74µs  max=36.35ms p(90)=23.79µs  p(95)=28.7µs   p(99.9)=3.32ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=440.01ms min=8.27ms  med=482.52ms max=1.31s   p(90)=760.95ms p(95)=813.34ms p(99.9)=1.15s 
     http_reqs......................: 15143   203.826744/s
     iteration_duration.............: avg=471.17ms min=12.15ms med=504.83ms max=1.32s   p(90)=766.11ms p(95)=820.85ms p(99.9)=1.16s 
     iterations.....................: 14143   190.366614/s
     success_rate...................: 100.00% ✓ 14143      ✗ 0    
     vus............................: 60      min=0        max=495
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

     checks.........................: 100.00% ✓ 407193      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=24.58µs  min=1.08µs  med=2.96µs   max=56.43ms  p(90)=4.75µs   p(95)=6.05µs   p(99.9)=4.28ms  
     http_req_connecting............: avg=20.67µs  min=0s      med=0s       max=56.35ms  p(90)=0s       p(95)=0s       p(99.9)=4.07ms  
     http_req_duration..............: avg=104ms    min=1.69ms  med=98.83ms  max=314.7ms  p(90)=201.75ms p(95)=220.22ms p(99.9)=268.18ms
       { expected_response:true }...: avg=104ms    min=1.69ms  med=98.83ms  max=314.7ms  p(90)=201.75ms p(95)=220.22ms p(99.9)=268.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136731
     http_req_receiving.............: avg=233.83µs min=30.43µs med=63.66µs  max=112.37ms p(90)=175.94µs p(95)=434.43µs p(99.9)=23.99ms 
     http_req_sending...............: avg=80.32µs  min=5.48µs  med=11.66µs  max=166.8ms  p(90)=21.67µs  p(95)=142.83µs p(99.9)=10.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.69ms min=1.63ms  med=98.62ms  max=314.23ms p(90)=201.21ms p(95)=219.6ms  p(99.9)=264.69ms
     http_reqs......................: 136731  2199.94838/s
     iteration_duration.............: avg=105.06ms min=3.17ms  med=100.01ms max=351.33ms p(90)=202.42ms p(95)=220.79ms p(99.9)=270.27ms
     iterations.....................: 135731  2183.858771/s
     success_rate...................: 100.00% ✓ 135731      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.27)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 344094      ✗ 0     
     data_received..................: 10 GB   163 MB/s
     data_sent......................: 139 MB  2.2 MB/s
     http_req_blocked...............: avg=10.17µs  min=1.01µs  med=2.56µs   max=32.92ms  p(90)=4.18µs   p(95)=5.22µs   p(99.9)=867.48µs
     http_req_connecting............: avg=6.87µs   min=0s      med=0s       max=32.87ms  p(90)=0s       p(95)=0s       p(99.9)=787.62µs
     http_req_duration..............: avg=123.09ms min=1.82ms  med=116.74ms max=871.72ms p(90)=231.82ms p(95)=253.34ms p(99.9)=665.35ms
       { expected_response:true }...: avg=123.09ms min=1.82ms  med=116.74ms max=871.72ms p(90)=231.82ms p(95)=253.34ms p(99.9)=665.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 115698
     http_req_receiving.............: avg=1.21ms   min=52.49µs med=157.78µs max=184.23ms p(90)=1.64ms   p(95)=3.34ms   p(99.9)=92.33ms 
     http_req_sending...............: avg=52.61µs  min=5.22µs  med=10.25µs  max=34.75ms  p(90)=18.69µs  p(95)=117.97µs p(99.9)=7.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.83ms min=1.7ms   med=115.47ms max=864.25ms p(90)=230.06ms p(95)=251.05ms p(99.9)=663.43ms
     http_reqs......................: 115698  1858.505058/s
     iteration_duration.............: avg=124.42ms min=2.92ms  med=118.25ms max=871.92ms p(90)=232.37ms p(95)=253.92ms p(99.9)=665.75ms
     iterations.....................: 114698  1842.441642/s
     success_rate...................: 100.00% ✓ 114698      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 214140      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.36µs   min=1.08µs med=2.45µs   max=11.38ms  p(90)=4.19µs   p(95)=5.18µs   p(99.9)=603.17µs
     http_req_connecting............: avg=3.17µs   min=0s     med=0s       max=11.25ms  p(90)=0s       p(95)=0s       p(99.9)=537.91µs
     http_req_duration..............: avg=197.14ms min=2.09ms med=198.21ms max=548.26ms p(90)=363.02ms p(95)=390.32ms p(99.9)=475.38ms
       { expected_response:true }...: avg=197.14ms min=2.09ms med=198.21ms max=548.26ms p(90)=363.02ms p(95)=390.32ms p(99.9)=475.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72380
     http_req_receiving.............: avg=81.22µs  min=30.2µs med=65.97µs  max=61.12ms  p(90)=105.13µs p(95)=120.74µs p(99.9)=1.56ms  
     http_req_sending...............: avg=29.74µs  min=5.4µs  med=11.34µs  max=75.8ms   p(90)=18.68µs  p(95)=22.59µs  p(99.9)=3.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.03ms min=2.03ms med=198.12ms max=548.16ms p(90)=362.92ms p(95)=390.19ms p(99.9)=475.31ms
     http_reqs......................: 72380   1155.200348/s
     iteration_duration.............: avg=200.14ms min=6.32ms med=201.61ms max=548.51ms p(90)=364ms    p(95)=391.11ms p(99.9)=475.72ms
     iterations.....................: 71380   1139.240133/s
     success_rate...................: 100.00% ✓ 71380       ✗ 0    
     vus............................: 89      min=0         max=498
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

     checks.........................: 100.00% ✓ 101385     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   644 kB/s
     http_req_blocked...............: avg=8.77µs   min=1.21µs  med=3.2µs    max=20.53ms  p(90)=5µs      p(95)=6.06µs   p(99.9)=996.04µs
     http_req_connecting............: avg=4.61µs   min=0s      med=0s       max=20.36ms  p(90)=0s       p(95)=0s       p(99.9)=965.17µs
     http_req_duration..............: avg=412.36ms min=3.87ms  med=383.07ms max=1.62s    p(90)=816.64ms p(95)=878.16ms p(99.9)=1.31s   
       { expected_response:true }...: avg=412.36ms min=3.87ms  med=383.07ms max=1.62s    p(90)=816.64ms p(95)=878.16ms p(99.9)=1.31s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34795
     http_req_receiving.............: avg=89.73µs  min=32.27µs med=81.46µs  max=21.19ms  p(90)=117.83µs p(95)=131.69µs p(99.9)=867.36µs
     http_req_sending...............: avg=32.34µs  min=5.93µs  med=14.6µs   max=126.52ms p(90)=21.9µs   p(95)=25.07µs  p(99.9)=2.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=412.24ms min=3.81ms  med=382.91ms max=1.62s    p(90)=816.52ms p(95)=878.07ms p(99.9)=1.31s   
     http_reqs......................: 34795   536.278984/s
     iteration_duration.............: avg=424.81ms min=20.58ms med=398.19ms max=1.62s    p(90)=819.4ms  p(95)=880.9ms  p(99.9)=1.32s   
     iterations.....................: 33795   520.866454/s
     success_rate...................: 100.00% ✓ 33795      ✗ 0    
     vus............................: 24      min=0        max=500
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

     checks.........................: 100.00% ✓ 48015      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=14.88µs  min=1.39µs  med=3.78µs   max=7.58ms p(90)=5.77µs   p(95)=7.31µs   p(99.9)=2.48ms  
     http_req_connecting............: avg=8.93µs   min=0s      med=0s       max=7.5ms  p(90)=0s       p(95)=0s       p(99.9)=2.3ms   
     http_req_duration..............: avg=854.89ms min=5.9ms   med=776.22ms max=4.28s  p(90)=1.71s    p(95)=1.92s    p(99.9)=3.85s   
       { expected_response:true }...: avg=854.89ms min=5.9ms   med=776.22ms max=4.28s  p(90)=1.71s    p(95)=1.92s    p(99.9)=3.85s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 17005
     http_req_receiving.............: avg=107.79µs min=39.79µs med=100.6µs  max=9.39ms p(90)=138.79µs p(95)=150.38µs p(99.9)=991.05µs
     http_req_sending...............: avg=30.85µs  min=6.26µs  med=18.66µs  max=9.32ms p(90)=24.68µs  p(95)=29.47µs  p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=854.76ms min=5.81ms  med=776.12ms max=4.28s  p(90)=1.71s    p(95)=1.92s    p(99.9)=3.85s   
     http_reqs......................: 17005   251.127021/s
     iteration_duration.............: avg=908.36ms min=33.45ms med=845.38ms max=4.29s  p(90)=1.74s    p(95)=1.93s    p(99.9)=3.87s   
     iterations.....................: 16005   236.359187/s
     success_rate...................: 100.00% ✓ 16005      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 40098      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=17.67µs  min=1.34µs  med=3.66µs   max=21.75ms p(90)=5.55µs   p(95)=7.56µs   p(99.9)=2.79ms
     http_req_connecting............: avg=12.13µs  min=0s      med=0s       max=21.69ms p(90)=0s       p(95)=0s       p(99.9)=2.77ms
     http_req_duration..............: avg=1.01s    min=8.61ms  med=931.54ms max=4.46s   p(90)=2.08s    p(95)=2.18s    p(99.9)=3.79s 
       { expected_response:true }...: avg=1.01s    min=8.61ms  med=931.54ms max=4.46s   p(90)=2.08s    p(95)=2.18s    p(99.9)=3.79s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14366
     http_req_receiving.............: avg=106.74µs min=35.47µs med=98.5µs   max=36.81ms p(90)=138.85µs p(95)=151.51µs p(99.9)=1.08ms
     http_req_sending...............: avg=34.46µs  min=6.28µs  med=18.49µs  max=30.54ms p(90)=24.39µs  p(95)=29.75µs  p(99.9)=3.46ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.5ms   med=931.43ms max=4.46s   p(90)=2.08s    p(95)=2.18s    p(99.9)=3.79s 
     http_reqs......................: 14366   205.606376/s
     iteration_duration.............: avg=1.09s    min=32.48ms med=1.01s    max=4.47s   p(90)=2.09s    p(95)=2.19s    p(99.9)=3.83s 
     iterations.....................: 13366   191.294363/s
     success_rate...................: 100.00% ✓ 13366      ✗ 0    
     vus............................: 14      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

