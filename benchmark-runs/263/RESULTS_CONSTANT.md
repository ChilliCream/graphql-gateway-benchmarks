## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,973 | 3,168 | 2,953 | 2.5% |  |
| fusion-nightly | 16.4.0-p.14 | 2,200 | 2,254 | 2,194 | 1.0% |  |
| fusion | 16.3.0 | 2,093 | 2,158 | 2,067 | 1.6% |  |
| grafbase | 0.53.5 | 1,984 | 2,068 | 1,981 | 1.6% |  |
| cosmo | 0.326.1 | 1,186 | 1,210 | 1,182 | 0.8% |  |
| hive-gateway-router-runtime | 2.10.0 | 545 | 556 | 543 | 0.9% |  |
| apollo-router | v2.15.1 | 404 | 419 | 401 | 1.7% |  |
| hive-gateway | 2.10.0 | 250 | 254 | 248 | 0.7% |  |
| apollo-gateway | 2.14.2 | 246 | 248 | 245 | 0.4% |  |
| feddi | 77271dc84a06 | 19 | 19 | 18 | 2.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,262 | 2,403 | 2,252 | 2.4% |  |
| fusion | 16.3.0 | 2,035 | 2,088 | 2,028 | 1.0% |  |
| fusion-nightly | 16.4.0-p.14 | 2,011 | 2,075 | 2,003 | 1.4% |  |
| grafbase | 0.53.5 | 1,544 | 1,580 | 1,538 | 1.0% |  |
| cosmo | 0.326.1 | 1,069 | 1,096 | 1,062 | 1.0% |  |
| hive-gateway-router-runtime | 2.10.0 | 521 | 532 | 520 | 0.9% |  |
| apollo-router | v2.15.1 | 405 | 416 | 403 | 1.0% |  |
| hive-gateway | 2.10.0 | 239 | 243 | 238 | 0.8% |  |
| apollo-gateway | 2.14.2 | 234 | 235 | 233 | 0.3% |  |
| feddi | 77271dc84a06 | 14 | 15 | 14 | 3.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1071873     ✗ 0     
     data_received..................: 31 GB   261 MB/s
     data_sent......................: 430 MB  3.6 MB/s
     http_req_blocked...............: avg=4.81µs   min=1.02µs  med=2.15µs  max=21.78ms  p(90)=3.57µs  p(95)=4.25µs   p(99.9)=37.72µs
     http_req_connecting............: avg=1.7µs    min=0s      med=0s      max=18.77ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.55ms  min=1.57ms  med=15.63ms max=306.47ms p(90)=24.32ms p(95)=28.19ms  p(99.9)=49.83ms
       { expected_response:true }...: avg=16.55ms  min=1.57ms  med=15.63ms max=306.47ms p(90)=24.32ms p(95)=28.19ms  p(99.9)=49.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 357391
     http_req_receiving.............: avg=108.29µs min=26.31µs med=45.24µs max=169.12ms p(90)=88.78µs p(95)=197.71µs p(99.9)=11.22ms
     http_req_sending...............: avg=59.59µs  min=4.63µs  med=8.97µs  max=182.65ms p(90)=16.4µs  p(95)=107.54µs p(99.9)=16.02ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.38ms  min=1.49ms  med=15.5ms  max=278.88ms p(90)=24.09ms p(95)=27.82ms  p(99.9)=48.28ms
     http_reqs......................: 357391  2973.330391/s
     iteration_duration.............: avg=16.78ms  min=2.24ms  med=15.84ms max=339.7ms  p(90)=24.56ms p(95)=28.47ms  p(99.9)=50.79ms
     iterations.....................: 357291  2972.498437/s
     success_rate...................: 100.00% ✓ 357291      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 793641      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 318 MB  2.6 MB/s
     http_req_blocked...............: avg=3.31µs   min=1.12µs  med=2.68µs   max=12.62ms  p(90)=4.13µs  p(95)=4.78µs   p(99.9)=38.69µs
     http_req_connecting............: avg=149ns    min=0s      med=0s       max=1.76ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.43ms  min=2.27ms  med=20.8ms   max=440.75ms p(90)=35.89ms p(95)=41.36ms  p(99.9)=72.19ms
       { expected_response:true }...: avg=22.43ms  min=2.27ms  med=20.8ms   max=440.75ms p(90)=35.89ms p(95)=41.36ms  p(99.9)=72.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 264647
     http_req_receiving.............: avg=894.71µs min=53.33µs med=172.27µs max=367.57ms p(90)=1.84ms  p(95)=3.21ms   p(99.9)=25.64ms
     http_req_sending...............: avg=45.25µs  min=5.36µs  med=10.17µs  max=28.29ms  p(90)=18.11µs p(95)=101.82µs p(99.9)=3.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.49ms  min=2.16ms  med=19.88ms  max=109.64ms p(90)=34.74ms p(95)=40.06ms  p(99.9)=69.89ms
     http_reqs......................: 264647  2200.489046/s
     iteration_duration.............: avg=22.67ms  min=3.62ms  med=21.02ms  max=450.16ms p(90)=36.13ms p(95)=41.62ms  p(99.9)=72.59ms
     iterations.....................: 264547  2199.657565/s
     success_rate...................: 100.00% ✓ 264547      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 755106      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=4.34µs   min=1.18µs  med=2.59µs   max=16.88ms  p(90)=3.91µs  p(95)=4.52µs  p(99.9)=35.07µs 
     http_req_connecting............: avg=1.11µs   min=0s      med=0s       max=10.24ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.58ms  min=2.36ms  med=19.97ms  max=395.12ms p(90)=38.47ms p(95)=46.72ms p(99.9)=163.09ms
       { expected_response:true }...: avg=23.58ms  min=2.36ms  med=19.97ms  max=395.12ms p(90)=38.47ms p(95)=46.72ms p(99.9)=163.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 251802
     http_req_receiving.............: avg=828.05µs min=55.04µs med=105.77µs max=160.94ms p(90)=1.5ms   p(95)=3.12ms  p(99.9)=32.8ms  
     http_req_sending...............: avg=41.62µs  min=5.43µs  med=9.94µs   max=94.91ms  p(90)=16.76µs p(95)=90.82µs p(99.9)=2.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.71ms  min=2.25ms  med=19.19ms  max=394.13ms p(90)=37.11ms p(95)=45.17ms p(99.9)=161.56ms
     http_reqs......................: 251802  2093.514564/s
     iteration_duration.............: avg=23.82ms  min=3.49ms  med=20.2ms   max=395.3ms  p(90)=38.71ms p(95)=46.97ms p(99.9)=164.25ms
     iterations.....................: 251702  2092.683151/s
     success_rate...................: 100.00% ✓ 251702      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 715683      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 287 MB  2.4 MB/s
     http_req_blocked...............: avg=3.21µs  min=1.12µs  med=2.4µs   max=10.79ms  p(90)=3.85µs  p(95)=4.61µs   p(99.9)=37.99µs
     http_req_connecting............: avg=336ns   min=0s      med=0s      max=3.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.9ms  min=1.94ms  med=24.67ms max=337.44ms p(90)=29.43ms p(95)=31.17ms  p(99.9)=50.18ms
       { expected_response:true }...: avg=24.9ms  min=1.94ms  med=24.67ms max=337.44ms p(90)=29.43ms p(95)=31.17ms  p(99.9)=50.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 238661
     http_req_receiving.............: avg=89.84µs min=29.39µs med=58.32µs max=39.05ms  p(90)=97.51µs p(95)=125.08µs p(99.9)=5.52ms 
     http_req_sending...............: avg=39.29µs min=5.32µs  med=11.03µs max=169.38ms p(90)=18.42µs p(95)=34.12µs  p(99.9)=1.77ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.77ms min=1.88ms  med=24.56ms max=336.81ms p(90)=29.29ms p(95)=31.01ms  p(99.9)=48.75ms
     http_reqs......................: 238661  1984.761319/s
     iteration_duration.............: avg=25.14ms min=4.18ms  med=24.88ms max=362.96ms p(90)=29.65ms p(95)=31.4ms   p(99.9)=50.84ms
     iterations.....................: 238561  1983.929695/s
     success_rate...................: 100.00% ✓ 238561      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427821      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.38µs  min=1.08µs  med=2.37µs  max=3.94ms   p(90)=3.77µs  p(95)=4.39µs   p(99.9)=34.55µs
     http_req_connecting............: avg=699ns   min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.83ms min=2.09ms  med=41.32ms max=363.88ms p(90)=58.83ms p(95)=64.04ms  p(99.9)=91.67ms
       { expected_response:true }...: avg=41.83ms min=2.09ms  med=41.32ms max=363.88ms p(90)=58.83ms p(95)=64.04ms  p(99.9)=91.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142707
     http_req_receiving.............: avg=76.82µs min=28.34µs med=61.36µs max=66.43ms  p(90)=96.53µs p(95)=112.03µs p(99.9)=1.62ms 
     http_req_sending...............: avg=25.5µs  min=5.36µs  med=10.68µs max=120.06ms p(90)=16.96µs p(95)=20.97µs  p(99.9)=1.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.73ms min=2ms     med=41.22ms max=363.24ms p(90)=58.73ms p(95)=63.93ms  p(99.9)=91.26ms
     http_reqs......................: 142707  1186.626636/s
     iteration_duration.............: avg=42.06ms min=3.1ms   med=41.54ms max=376.19ms p(90)=59.03ms p(95)=64.25ms  p(99.9)=92ms   
     iterations.....................: 142607  1185.795123/s
     success_rate...................: 100.00% ✓ 142607      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 197202     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   656 kB/s
     http_req_blocked...............: avg=5.87µs  min=1.19µs  med=2.54µs  max=82.18ms  p(90)=3.98µs   p(95)=4.59µs   p(99.9)=50.56µs 
     http_req_connecting............: avg=1.75µs  min=0s      med=0s      max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.96ms min=4.17ms  med=88.28ms max=358.88ms p(90)=111.42ms p(95)=123.34ms p(99.9)=209.12ms
       { expected_response:true }...: avg=90.96ms min=4.17ms  med=88.28ms max=358.88ms p(90)=111.42ms p(95)=123.34ms p(99.9)=209.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65834
     http_req_receiving.............: avg=84.26µs min=31.6µs  med=67.68µs max=126.48ms p(90)=103.76µs p(95)=116.32µs p(99.9)=2.59ms  
     http_req_sending...............: avg=22.24µs min=5.68µs  med=13.05µs max=86.53ms  p(90)=19.8µs   p(95)=22µs     p(99.9)=632.4µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.85ms min=4.11ms  med=88.18ms max=358.59ms p(90)=111.31ms p(95)=123.23ms p(99.9)=208.63ms
     http_reqs......................: 65834   545.916357/s
     iteration_duration.............: avg=91.32ms min=35.16ms med=88.51ms max=378.11ms p(90)=111.65ms p(95)=123.6ms  p(99.9)=211.4ms 
     iterations.....................: 65734   545.087125/s
     success_rate...................: 100.00% ✓ 65734      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 146310     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   486 kB/s
     http_req_blocked...............: avg=5.76µs   min=1.45µs  med=3.37µs   max=4.52ms   p(90)=4.77µs   p(95)=5.36µs   p(99.9)=249.94µs
     http_req_connecting............: avg=2.14µs   min=0s      med=0s       max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=223.93µs
     http_req_duration..............: avg=122.55ms min=5.32ms  med=122.27ms max=386.46ms p(90)=147.92ms p(95)=155.69ms p(99.9)=191.79ms
       { expected_response:true }...: avg=122.55ms min=5.32ms  med=122.27ms max=386.46ms p(90)=147.92ms p(95)=155.69ms p(99.9)=191.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48870
     http_req_receiving.............: avg=90.45µs  min=33.64µs med=80.71µs  max=151.02ms p(90)=110.91µs p(95)=122.02µs p(99.9)=1.02ms  
     http_req_sending...............: avg=26.61µs  min=6.58µs  med=16.72µs  max=169.94ms p(90)=21.81µs  p(95)=23.93µs  p(99.9)=602.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.43ms min=5.22ms  med=122.16ms max=386.1ms  p(90)=147.81ms p(95)=155.58ms p(99.9)=191.23ms
     http_reqs......................: 48870   404.937915/s
     iteration_duration.............: avg=123.07ms min=25.62ms med=122.55ms max=401.83ms p(90)=148.18ms p(95)=155.97ms p(99.9)=196.67ms
     iterations.....................: 48770   404.109312/s
     success_rate...................: 100.00% ✓ 48770      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90570      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   301 kB/s
     http_req_blocked...............: avg=7.74µs   min=1.47µs  med=3.62µs   max=4.79ms   p(90)=5.12µs   p(95)=5.76µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.81µs   min=0s      med=0s       max=4.75ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=197.95ms min=6.54ms  med=180.88ms max=720.25ms p(90)=232.31ms p(95)=280.87ms p(99.9)=601.39ms
       { expected_response:true }...: avg=197.95ms min=6.54ms  med=180.88ms max=720.25ms p(90)=232.31ms p(95)=280.87ms p(99.9)=601.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30290
     http_req_receiving.............: avg=109.83µs min=37.74µs med=90.8µs   max=109.23ms p(90)=121.77µs p(95)=133.89µs p(99.9)=2.09ms  
     http_req_sending...............: avg=29.05µs  min=7.31µs  med=17.97µs  max=144.7ms  p(90)=22.98µs  p(95)=25.18µs  p(99.9)=600.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.81ms min=6.45ms  med=180.76ms max=720.15ms p(90)=232.19ms p(95)=280.69ms p(99.9)=601.26ms
     http_reqs......................: 30290   250.395441/s
     iteration_duration.............: avg=198.87ms min=31.94ms med=181.24ms max=720.45ms p(90)=232.7ms  p(95)=282.09ms p(99.9)=601.73ms
     iterations.....................: 30190   249.568781/s
     success_rate...................: 100.00% ✓ 30190      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 89400      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=9.59µs   min=1.42µs  med=3.27µs   max=8.35ms   p(90)=4.64µs   p(95)=5.23µs   p(99.9)=3.04ms  
     http_req_connecting............: avg=5.83µs   min=0s      med=0s       max=8.32ms   p(90)=0s       p(95)=0s       p(99.9)=2.44ms  
     http_req_duration..............: avg=200.58ms min=8.71ms  med=203.39ms max=384.7ms  p(90)=214.22ms p(95)=218.62ms p(99.9)=288.17ms
       { expected_response:true }...: avg=200.58ms min=8.71ms  med=203.39ms max=384.7ms  p(90)=214.22ms p(95)=218.62ms p(99.9)=288.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29900
     http_req_receiving.............: avg=89.79µs  min=36.21µs med=81.72µs  max=10.77ms  p(90)=112.66µs p(95)=123.05µs p(99.9)=1.49ms  
     http_req_sending...............: avg=23.05µs  min=6.61µs  med=16.51µs  max=9.17ms   p(90)=21.4µs   p(95)=23.4µs   p(99.9)=2.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.46ms min=8.63ms  med=203.26ms max=384.39ms p(90)=214.09ms p(95)=218.51ms p(99.9)=287.98ms
     http_reqs......................: 29900   246.964035/s
     iteration_duration.............: avg=201.46ms min=28.75ms med=204.18ms max=394.04ms p(90)=214.46ms p(95)=218.87ms p(99.9)=288.78ms
     iterations.....................: 29800   246.138068/s
     success_rate...................: 100.00% ✓ 29800      ✗ 0    
     vus............................: 35      min=35       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7053      ✗ 0   
     data_received..................: 235 MB  1.9 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=122.51µs min=1.65µs   med=3.75µs  max=12.59ms p(90)=5.3µs    p(95)=6.22µs   p(99.9)=11.06ms
     http_req_connecting............: avg=111.06µs min=0s       med=0s      max=12.28ms p(90)=0s       p(95)=0s       p(99.9)=11.03ms
     http_req_duration..............: avg=2.46s    min=26.62ms  med=2.51s   max=5.47s   p(90)=3.41s    p(95)=3.67s    p(99.9)=4.83s  
       { expected_response:true }...: avg=2.46s    min=26.62ms  med=2.51s   max=5.47s   p(90)=3.41s    p(95)=3.67s    p(99.9)=4.83s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2451
     http_req_receiving.............: avg=122.02µs min=37.26µs  med=94.09µs max=29.05ms p(90)=131.76µs p(95)=149.24µs p(99.9)=3.89ms 
     http_req_sending...............: avg=78.32µs  min=7.58µs   med=20.04µs max=18.25ms p(90)=25µs     p(95)=29.72µs  p(99.9)=5.87ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.46s    min=26.46ms  med=2.51s   max=5.47s   p(90)=3.41s    p(95)=3.67s    p(99.9)=4.83s  
     http_reqs......................: 2451    19.530986/s
     iteration_duration.............: avg=2.56s    min=209.54ms med=2.55s   max=5.48s   p(90)=3.41s    p(95)=3.7s     p(99.9)=4.88s  
     iterations.....................: 2351    18.734128/s
     success_rate...................: 100.00% ✓ 2351      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 815748      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 327 MB  2.7 MB/s
     http_req_blocked...............: avg=3.99µs  min=1.04µs  med=2.31µs  max=12.14ms  p(90)=3.8µs   p(95)=4.53µs   p(99.9)=36.55µs
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=11.96ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.82ms min=2.03ms  med=21.68ms max=329.19ms p(90)=30.02ms p(95)=32.45ms  p(99.9)=51.66ms
       { expected_response:true }...: avg=21.82ms min=2.03ms  med=21.68ms max=329.19ms p(90)=30.02ms p(95)=32.45ms  p(99.9)=51.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 272016
     http_req_receiving.............: avg=92.25µs min=28.57µs med=54.46µs max=40.76ms  p(90)=95.06µs p(95)=132.62µs p(99.9)=6.56ms 
     http_req_sending...............: avg=45.87µs min=5.34µs  med=10.18µs max=113.43ms p(90)=18.02µs p(95)=90.94µs  p(99.9)=3.9ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.68ms min=1.95ms  med=21.56ms max=328.76ms p(90)=29.87ms p(95)=32.26ms  p(99.9)=50.55ms
     http_reqs......................: 272016  2262.089132/s
     iteration_duration.............: avg=22.05ms min=3.1ms   med=21.89ms max=347.06ms p(90)=30.24ms p(95)=32.69ms  p(99.9)=52.48ms
     iterations.....................: 271916  2261.257531/s
     success_rate...................: 100.00% ✓ 271916      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 733965      ✗ 0     
     data_received..................: 22 GB   178 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=3.42µs   min=972ns   med=2.35µs  max=11.21ms  p(90)=4.08µs  p(95)=4.82µs  p(99.9)=37.89µs 
     http_req_connecting............: avg=439ns    min=0s      med=0s      max=4.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=24.27ms  min=1.97ms  med=19.93ms max=482.11ms p(90)=40.32ms p(95)=49.7ms  p(99.9)=191.34ms
       { expected_response:true }...: avg=24.27ms  min=1.97ms  med=19.93ms max=482.11ms p(90)=40.32ms p(95)=49.7ms  p(99.9)=191.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244755
     http_req_receiving.............: avg=839.97µs min=53.76µs med=110µs   max=416.48ms p(90)=1.48ms  p(95)=2.91ms  p(99.9)=36.06ms 
     http_req_sending...............: avg=43.05µs  min=5.19µs  med=9.8µs   max=222.79ms p(90)=19.64µs p(95)=88.43µs p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=23.39ms  min=1.86ms  med=19.15ms max=482.01ms p(90)=38.94ms p(95)=48.03ms p(99.9)=189.22ms
     http_reqs......................: 244755  2035.3502/s
     iteration_duration.............: avg=24.51ms  min=3.49ms  med=20.16ms max=482.3ms  p(90)=40.57ms p(95)=49.96ms p(99.9)=194.24ms
     iterations.....................: 244655  2034.518613/s
     success_rate...................: 100.00% ✓ 244655      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 725430      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 291 MB  2.4 MB/s
     http_req_blocked...............: avg=3.72µs   min=1.1µs   med=2.78µs   max=9.78ms   p(90)=4.28µs  p(95)=4.95µs  p(99.9)=40.37µs
     http_req_connecting............: avg=507ns    min=0s      med=0s       max=4.69ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=24.55ms  min=1.91ms  med=22.89ms  max=339.22ms p(90)=39.21ms p(95)=45.08ms p(99.9)=80.65ms
       { expected_response:true }...: avg=24.55ms  min=1.91ms  med=22.89ms  max=339.22ms p(90)=39.21ms p(95)=45.08ms p(99.9)=80.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241910
     http_req_receiving.............: avg=980.75µs min=56.77µs med=241.24µs max=251.73ms p(90)=2.03ms  p(95)=3.49ms  p(99.9)=26.06ms
     http_req_sending...............: avg=43.63µs  min=5.26µs  med=11.09µs  max=104.61ms p(90)=19.78µs p(95)=93.84µs p(99.9)=2.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=23.53ms  min=1.8ms   med=21.88ms  max=308.58ms p(90)=37.89ms p(95)=43.66ms p(99.9)=78.33ms
     http_reqs......................: 241910  2011.843291/s
     iteration_duration.............: avg=24.8ms   min=3.69ms  med=23.12ms  max=359.07ms p(90)=39.46ms p(95)=45.33ms p(99.9)=81.4ms 
     iterations.....................: 241810  2011.011642/s
     success_rate...................: 100.00% ✓ 241810      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 557283      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.9 MB/s
     http_req_blocked...............: avg=4µs     min=1.07µs  med=2.51µs  max=14.62ms  p(90)=4.65µs   p(95)=5.62µs   p(99.9)=44.53µs
     http_req_connecting............: avg=708ns   min=0s      med=0s      max=4.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.02ms min=2.5ms   med=31.56ms max=351.33ms p(90)=42.31ms  p(95)=45.92ms  p(99.9)=68.89ms
       { expected_response:true }...: avg=32.02ms min=2.5ms   med=31.56ms max=351.33ms p(90)=42.31ms  p(95)=45.92ms  p(99.9)=68.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185861
     http_req_receiving.............: avg=99.1µs  min=29.15µs med=57.43µs max=139.51ms p(90)=128.05µs p(95)=223.18µs p(99.9)=4.11ms 
     http_req_sending...............: avg=47.11µs min=5.48µs  med=10.55µs max=218.84ms p(90)=24.97µs  p(95)=122.55µs p(99.9)=3.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.87ms min=2.41ms  med=31.43ms max=350.73ms p(90)=42.16ms  p(95)=45.73ms  p(99.9)=68.3ms 
     http_reqs......................: 185861  1544.811119/s
     iteration_duration.............: avg=32.29ms min=7.07ms  med=31.8ms  max=360.4ms  p(90)=42.56ms  p(95)=46.18ms  p(99.9)=69.94ms
     iterations.....................: 185761  1543.979954/s
     success_rate...................: 100.00% ✓ 185761      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 385815      ✗ 0     
     data_received..................: 11 GB   94 MB/s
     data_sent......................: 155 MB  1.3 MB/s
     http_req_blocked...............: avg=3.97µs  min=1.24µs  med=2.97µs  max=4.44ms   p(90)=4.46µs  p(95)=5.13µs   p(99.9)=38.29µs
     http_req_connecting............: avg=678ns   min=0s      med=0s      max=4.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=46.38ms min=2.36ms  med=45.83ms max=353.06ms p(90)=65.05ms p(95)=70.8ms   p(99.9)=97.84ms
       { expected_response:true }...: avg=46.38ms min=2.36ms  med=45.83ms max=353.06ms p(90)=65.05ms p(95)=70.8ms   p(99.9)=97.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128705
     http_req_receiving.............: avg=87.99µs min=29.38µs med=71.25µs max=201.42ms p(90)=109.7µs p(95)=127.28µs p(99.9)=1.18ms 
     http_req_sending...............: avg=31.16µs min=5.81µs  med=13.57µs max=154.15ms p(90)=19.69µs p(95)=23.83µs  p(99.9)=1.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=46.26ms min=2.29ms  med=45.73ms max=347.22ms p(90)=64.94ms p(95)=70.67ms  p(99.9)=97.33ms
     http_reqs......................: 128705  1069.799868/s
     iteration_duration.............: avg=46.64ms min=5.57ms  med=46.06ms max=362.28ms p(90)=65.28ms p(95)=71.02ms  p(99.9)=98.48ms
     iterations.....................: 128605  1068.968665/s
     success_rate...................: 100.00% ✓ 128605      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 188427     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   626 kB/s
     http_req_blocked...............: avg=5.08µs  min=1.18µs  med=2.98µs  max=4.58ms   p(90)=4.47µs   p(95)=5.13µs   p(99.9)=48.42µs 
     http_req_connecting............: avg=1.83µs  min=0s      med=0s      max=4.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.15ms min=4.46ms  med=92.96ms max=363.58ms p(90)=117.34ms p(95)=129.24ms p(99.9)=214.4ms 
       { expected_response:true }...: avg=95.15ms min=4.46ms  med=92.96ms max=363.58ms p(90)=117.34ms p(95)=129.24ms p(99.9)=214.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 62909
     http_req_receiving.............: avg=93.38µs min=31.34µs med=78.16µs max=201.65ms p(90)=113.17µs p(95)=125.63µs p(99.9)=1.31ms  
     http_req_sending...............: avg=20.64µs min=5.84µs  med=15.38µs max=30.04ms  p(90)=21.39µs  p(95)=23.84µs  p(99.9)=639µs   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.04ms min=4.35ms  med=92.85ms max=348.13ms p(90)=117.22ms p(95)=129.11ms p(99.9)=214.14ms
     http_reqs......................: 62909   521.586665/s
     iteration_duration.............: avg=95.55ms min=27.14ms med=93.19ms max=394.05ms p(90)=117.57ms p(95)=129.53ms p(99.9)=216.98ms
     iterations.....................: 62809   520.757552/s
     success_rate...................: 100.00% ✓ 62809      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 146634     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   487 kB/s
     http_req_blocked...............: avg=6.12µs   min=1.35µs  med=3.88µs   max=11.38ms  p(90)=5.4µs    p(95)=6.05µs   p(99.9)=132.65µs
     http_req_connecting............: avg=1.67µs   min=0s      med=0s       max=9.82ms   p(90)=0s       p(95)=0s       p(99.9)=99.46µs 
     http_req_duration..............: avg=122.26ms min=5.97ms  med=119.9ms  max=362ms    p(90)=161.57ms p(95)=174.2ms  p(99.9)=221.93ms
       { expected_response:true }...: avg=122.26ms min=5.97ms  med=119.9ms  max=362ms    p(90)=161.57ms p(95)=174.2ms  p(99.9)=221.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48978
     http_req_receiving.............: avg=93.68µs  min=34.16µs med=87.58µs  max=39.94ms  p(90)=119.25µs p(95)=131.3µs  p(99.9)=801.28µs
     http_req_sending...............: avg=27.64µs  min=6.96µs  med=18.98µs  max=76.26ms  p(90)=24.23µs  p(95)=26.57µs  p(99.9)=759.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.14ms min=5.83ms  med=119.78ms max=358.38ms p(90)=161.44ms p(95)=174.08ms p(99.9)=221.59ms
     http_reqs......................: 48978   405.697885/s
     iteration_duration.............: avg=122.77ms min=22.23ms med=120.22ms max=371.3ms  p(90)=161.88ms p(95)=174.49ms p(99.9)=225.11ms
     iterations.....................: 48878   404.869558/s
     success_rate...................: 100.00% ✓ 48878      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86595      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=8.13µs   min=1.5µs   med=3.76µs   max=4.64ms   p(90)=5.28µs   p(95)=5.94µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=4.04µs   min=0s      med=0s       max=4.6ms    p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=207.06ms min=6.71ms  med=191.96ms max=764.35ms p(90)=242.96ms p(95)=305.72ms p(99.9)=611.81ms
       { expected_response:true }...: avg=207.06ms min=6.71ms  med=191.96ms max=764.35ms p(90)=242.96ms p(95)=305.72ms p(99.9)=611.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28965
     http_req_receiving.............: avg=123.81µs min=37.82µs med=93.74µs  max=145.47ms p(90)=125.08µs p(95)=137.9µs  p(99.9)=1.89ms  
     http_req_sending...............: avg=26.63µs  min=6.77µs  med=19.23µs  max=40.28ms  p(90)=23.94µs  p(95)=26.17µs  p(99.9)=510.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.91ms min=6.59ms  med=191.81ms max=764.2ms  p(90)=242.76ms p(95)=305.46ms p(99.9)=611.71ms
     http_reqs......................: 28965   239.329592/s
     iteration_duration.............: avg=208.04ms min=25.82ms med=192.3ms  max=764.62ms p(90)=243.37ms p(95)=307.38ms p(99.9)=612.11ms
     iterations.....................: 28865   238.50332/s
     success_rate...................: 100.00% ✓ 28865      ✗ 0    
     vus............................: 8       min=8        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 84801      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=17.35µs  min=1.6µs   med=3.56µs   max=14.19ms  p(90)=5.02µs   p(95)=5.63µs   p(99.9)=8.1ms   
     http_req_connecting............: avg=12.73µs  min=0s      med=0s       max=12.52ms  p(90)=0s       p(95)=0s       p(99.9)=7.67ms  
     http_req_duration..............: avg=211.34ms min=9.14ms  med=210.58ms max=459.4ms  p(90)=217.28ms p(95)=222.35ms p(99.9)=297.66ms
       { expected_response:true }...: avg=211.34ms min=9.14ms  med=210.58ms max=459.4ms  p(90)=217.28ms p(95)=222.35ms p(99.9)=297.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28367
     http_req_receiving.............: avg=111.2µs  min=35.52µs med=92.31µs  max=122.09ms p(90)=123.98µs p(95)=135.84µs p(99.9)=1.53ms  
     http_req_sending...............: avg=27.24µs  min=6.64µs  med=19µs     max=49.67ms  p(90)=23.73µs  p(95)=26.03µs  p(99.9)=1.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.2ms  min=9.03ms  med=210.46ms max=444.52ms p(90)=217.16ms p(95)=222.23ms p(99.9)=296.93ms
     http_reqs......................: 28367   234.175348/s
     iteration_duration.............: avg=212.38ms min=48.5ms  med=210.83ms max=473.56ms p(90)=217.55ms p(95)=222.67ms p(99.9)=321.2ms 
     iterations.....................: 28267   233.349828/s
     success_rate...................: 100.00% ✓ 28267      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 5367      ✗ 0   
     data_received..................: 181 MB  1.4 MB/s
     data_sent......................: 2.3 MB  18 kB/s
     http_req_blocked...............: avg=74.18µs  min=1.31µs  med=3.09µs  max=4.87ms  p(90)=4.62µs   p(95)=5.57µs   p(99.9)=4.55ms
     http_req_connecting............: avg=69.7µs   min=0s      med=0s      max=4.83ms  p(90)=0s       p(95)=0s       p(99.9)=4.52ms
     http_req_duration..............: avg=3.21s    min=49.1ms  med=3.3s    max=5.38s   p(90)=4.1s     p(95)=4.33s    p(99.9)=5.33s 
       { expected_response:true }...: avg=3.21s    min=49.1ms  med=3.3s    max=5.38s   p(90)=4.1s     p(95)=4.33s    p(99.9)=5.33s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 1889
     http_req_receiving.............: avg=133.96µs min=32.98µs med=88.83µs max=46.61ms p(90)=127.26µs p(95)=142.89µs p(99.9)=7.45ms
     http_req_sending...............: avg=82.68µs  min=6.8µs   med=17.6µs  max=55.97ms p(90)=22.44µs  p(95)=27.38µs  p(99.9)=4.51ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=3.21s    min=48.99ms med=3.3s    max=5.38s   p(90)=4.1s     p(95)=4.33s    p(99.9)=5.33s 
     http_reqs......................: 1889    14.726759/s
     iteration_duration.............: avg=3.39s    min=1.57s   med=3.34s   max=5.38s   p(90)=4.12s    p(95)=4.34s    p(99.9)=5.34s 
     iterations.....................: 1789    13.947153/s
     success_rate...................: 100.00% ✓ 1789      ✗ 0   
     vus............................: 23      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB

