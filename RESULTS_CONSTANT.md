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
| hive-router | v0.0.49 | 2,927 | 3,100 | 2,889 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,191 | 2,237 | 2,180 | 0.8% |  |
| grafbase | 0.53.3 | 2,085 | 2,131 | 2,065 | 1.1% |  |
| cosmo | 0.307.0 | 1,273 | 1,288 | 1,261 | 0.8% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 539 | 548 | 536 | 0.7% |  |
| apollo-router | v2.13.1 | 430 | 440 | 427 | 1.0% |  |
| hive-gateway | 2.5.25 | 255 | 259 | 254 | 0.7% |  |
| apollo-gateway | 2.13.3 | 241 | 243 | 240 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,375 | 2,509 | 2,347 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,949 | 1,991 | 1,929 | 1.0% |  |
| grafbase | 0.53.3 | 1,539 | 1,559 | 1,514 | 1.1% |  |
| cosmo | 0.307.0 | 1,213 | 1,230 | 1,203 | 0.8% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 521 | 532 | 515 | 1.2% |  |
| apollo-router | v2.13.1 | 401 | 410 | 399 | 1.0% |  |
| hive-gateway | 2.5.25 | 244 | 249 | 242 | 1.0% |  |
| apollo-gateway | 2.13.3 | 236 | 239 | 234 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1055340     ✗ 0     
     data_received..................: 31 GB   257 MB/s
     data_sent......................: 423 MB  3.5 MB/s
     http_req_blocked...............: avg=4.43µs   min=1.01µs med=2.06µs  max=41.87ms  p(90)=3.14µs  p(95)=3.76µs   p(99.9)=34.7µs 
     http_req_connecting............: avg=1.92µs   min=0s     med=0s      max=41.83ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.82ms  min=1.62ms med=15.95ms max=281.54ms p(90)=24.84ms p(95)=28.47ms  p(99.9)=51.29ms
       { expected_response:true }...: avg=16.82ms  min=1.62ms med=15.95ms max=281.54ms p(90)=24.84ms p(95)=28.47ms  p(99.9)=51.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 351880
     http_req_receiving.............: avg=127.22µs min=28µs   med=51.23µs max=183.11ms p(90)=99.83µs p(95)=271.94µs p(99.9)=12.26ms
     http_req_sending...............: avg=62.38µs  min=5.22µs med=9.29µs  max=178.62ms p(90)=16µs    p(95)=123.96µs p(99.9)=7.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.63ms  min=1.56ms med=15.81ms max=206.52ms p(90)=24.6ms  p(95)=28.12ms  p(99.9)=49.66ms
     http_reqs......................: 351880  2927.516516/s
     iteration_duration.............: avg=17.04ms  min=2.23ms med=16.16ms max=333.69ms p(90)=25.06ms p(95)=28.71ms  p(99.9)=52.33ms
     iterations.....................: 351780  2926.684551/s
     success_rate...................: 100.00% ✓ 351780      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 790494      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 317 MB  2.6 MB/s
     http_req_blocked...............: avg=2.85µs   min=982ns   med=2µs     max=11.4ms   p(90)=3.08µs   p(95)=3.67µs   p(99.9)=31.41µs 
     http_req_connecting............: avg=459ns    min=0s      med=0s      max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.53ms  min=2.38ms  med=14.35ms max=354.51ms p(90)=50.11ms  p(95)=68.57ms  p(99.9)=166.36ms
       { expected_response:true }...: avg=22.53ms  min=2.38ms  med=14.35ms max=354.51ms p(90)=50.11ms  p(95)=68.57ms  p(99.9)=166.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263598
     http_req_receiving.............: avg=654.87µs min=50.92µs med=104.3µs max=266.01ms p(90)=928.41µs p(95)=1.43ms   p(99.9)=62.38ms 
     http_req_sending...............: avg=41.8µs   min=5.22µs  med=9.15µs  max=77.42ms  p(90)=15.61µs  p(95)=109.84µs p(99.9)=3.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.83ms  min=2.29ms  med=13.86ms max=306.08ms p(90)=48.78ms  p(95)=67.17ms  p(99.9)=161.54ms
     http_reqs......................: 263598  2191.316696/s
     iteration_duration.............: avg=22.76ms  min=3.19ms  med=14.57ms max=371.85ms p(90)=50.35ms  p(95)=68.81ms  p(99.9)=168.18ms
     iterations.....................: 263498  2190.485385/s
     success_rate...................: 100.00% ✓ 263498      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 751983      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 301 MB  2.5 MB/s
     http_req_blocked...............: avg=3.08µs   min=902ns   med=2.24µs  max=12.26ms  p(90)=3.74µs   p(95)=4.56µs   p(99.9)=45.67µs
     http_req_connecting............: avg=209ns    min=0s      med=0s      max=2.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.69ms  min=2.05ms  med=23.45ms max=324.97ms p(90)=28.34ms  p(95)=30.58ms  p(99.9)=53.59ms
       { expected_response:true }...: avg=23.69ms  min=2.05ms  med=23.45ms max=324.97ms p(90)=28.34ms  p(95)=30.58ms  p(99.9)=53.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 250761
     http_req_receiving.............: avg=110.78µs min=28.35µs med=57.79µs max=147.55ms p(90)=102.93µs p(95)=214.02µs p(99.9)=8.53ms 
     http_req_sending...............: avg=46.47µs  min=5.18µs  med=10.34µs max=143.72ms p(90)=18.48µs  p(95)=120.61µs p(99.9)=3.32ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.53ms  min=1.91ms  med=23.33ms max=312.81ms p(90)=28.16ms  p(95)=30.3ms   p(99.9)=52.62ms
     http_reqs......................: 250761  2085.241651/s
     iteration_duration.............: avg=23.92ms  min=3.56ms  med=23.66ms max=335.27ms p(90)=28.56ms  p(95)=30.82ms  p(99.9)=54.09ms
     iterations.....................: 250661  2084.410085/s
     success_rate...................: 100.00% ✓ 250661      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 459177      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=2.81µs   min=1.03µs  med=2.06µs  max=3.32ms   p(90)=3.31µs  p(95)=3.91µs   p(99.9)=35.58µs
     http_req_connecting............: avg=415ns    min=0s      med=0s      max=3.28ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.96ms  min=2.13ms  med=38.42ms max=372.24ms p(90)=54.89ms p(95)=59.85ms  p(99.9)=83.5ms 
       { expected_response:true }...: avg=38.96ms  min=2.13ms  med=38.42ms max=372.24ms p(90)=54.89ms p(95)=59.85ms  p(99.9)=83.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153159
     http_req_receiving.............: avg=119.64µs min=29.15µs med=59.43µs max=316.98ms p(90)=94.69µs p(95)=113.33µs p(99.9)=2.6ms  
     http_req_sending...............: avg=25.49µs  min=5.27µs  med=10µs    max=219.95ms p(90)=15.63µs p(95)=19.64µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.82ms  min=2.02ms  med=38.32ms max=106.11ms p(90)=54.76ms p(95)=59.67ms  p(99.9)=81.52ms
     http_reqs......................: 153159  1273.409923/s
     iteration_duration.............: avg=39.19ms  min=4.06ms  med=38.61ms max=383.07ms p(90)=55.09ms p(95)=60.05ms  p(99.9)=83.84ms
     iterations.....................: 153059  1272.578493/s
     success_rate...................: 100.00% ✓ 153059      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 194664     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   648 kB/s
     http_req_blocked...............: avg=4.28µs  min=1.09µs  med=2.38µs  max=4ms      p(90)=3.92µs   p(95)=4.52µs   p(99.9)=49.53µs 
     http_req_connecting............: avg=1.49µs  min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.09ms min=4.08ms  med=89.38ms max=360.93ms p(90)=111.93ms p(95)=124.52ms p(99.9)=219.62ms
       { expected_response:true }...: avg=92.09ms min=4.08ms  med=89.38ms max=360.93ms p(90)=111.93ms p(95)=124.52ms p(99.9)=219.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64988
     http_req_receiving.............: avg=87.43µs min=31.07µs med=74.15µs max=128.98ms p(90)=108.97µs p(95)=121.64µs p(99.9)=882.33µs
     http_req_sending...............: avg=23.27µs min=5.56µs  med=12.22µs max=237.53ms p(90)=19.17µs  p(95)=21.36µs  p(99.9)=591.34µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.98ms min=4ms     med=89.29ms max=359.67ms p(90)=111.83ms p(95)=124.32ms p(99.9)=218.8ms 
     http_reqs......................: 64988   539.228438/s
     iteration_duration.............: avg=92.47ms min=21.22ms med=89.61ms max=376.59ms p(90)=112.18ms p(95)=124.82ms p(99.9)=221.81ms
     iterations.....................: 64888   538.398702/s
     success_rate...................: 100.00% ✓ 64888      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 155697     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 62 MB   517 kB/s
     http_req_blocked...............: avg=5.31µs   min=1.17µs  med=3.05µs   max=4.18ms   p(90)=4.46µs   p(95)=4.97µs   p(99.9)=122.11µs
     http_req_connecting............: avg=2.05µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.14ms min=5.43ms  med=114.93ms max=344.23ms p(90)=139.07ms p(95)=146.13ms p(99.9)=179.62ms
       { expected_response:true }...: avg=115.14ms min=5.43ms  med=114.93ms max=344.23ms p(90)=139.07ms p(95)=146.13ms p(99.9)=179.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51999
     http_req_receiving.............: avg=87.88µs  min=29.65µs med=83.42µs  max=30.03ms  p(90)=114.14µs p(95)=125.82µs p(99.9)=680.26µs
     http_req_sending...............: avg=28.03µs  min=5.97µs  med=15.28µs  max=116.13ms p(90)=20.31µs  p(95)=22.07µs  p(99.9)=600.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.02ms min=5.35ms  med=114.82ms max=343.57ms p(90)=138.96ms p(95)=145.98ms p(99.9)=179.32ms
     http_reqs......................: 51999   430.927743/s
     iteration_duration.............: avg=115.63ms min=25.85ms med=115.21ms max=359.8ms  p(90)=139.34ms p(95)=146.4ms  p(99.9)=185.02ms
     iterations.....................: 51899   430.09902/s
     success_rate...................: 100.00% ✓ 51899      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 92496      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   307 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.24µs  med=3.45µs   max=4.22ms   p(90)=4.94µs   p(95)=5.59µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.35µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=193.82ms min=6.29ms  med=208.73ms max=728.21ms p(90)=269.49ms p(95)=419.67ms p(99.9)=580.07ms
       { expected_response:true }...: avg=193.82ms min=6.29ms  med=208.73ms max=728.21ms p(90)=269.49ms p(95)=419.67ms p(99.9)=580.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30932
     http_req_receiving.............: avg=102.97µs min=32.28µs med=97.13µs  max=58.56ms  p(90)=129.46µs p(95)=143.21µs p(99.9)=569.9µs 
     http_req_sending...............: avg=27.72µs  min=6.09µs  med=17.47µs  max=84.39ms  p(90)=22.82µs  p(95)=24.76µs  p(99.9)=557.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.69ms min=6.19ms  med=208.62ms max=728.12ms p(90)=269.4ms  p(95)=419.57ms p(99.9)=579.96ms
     http_reqs......................: 30932   255.659566/s
     iteration_duration.............: avg=194.73ms min=21.6ms  med=209.14ms max=728.4ms  p(90)=269.87ms p(95)=420.43ms p(99.9)=580.41ms
     iterations.....................: 30832   254.833044/s
     success_rate...................: 100.00% ✓ 30832      ✗ 0    
     vus............................: 4       min=4        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 87291      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=6.6µs    min=1.19µs  med=3.13µs   max=4.24ms   p(90)=4.33µs   p(95)=4.8µs    p(99.9)=1.51ms  
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=205.38ms min=8.49ms  med=214.28ms max=404.96ms p(90)=256.09ms p(95)=265.46ms p(99.9)=330.19ms
       { expected_response:true }...: avg=205.38ms min=8.49ms  med=214.28ms max=404.96ms p(90)=256.09ms p(95)=265.46ms p(99.9)=330.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29197
     http_req_receiving.............: avg=181.83µs min=31.51µs med=89.89µs  max=161.49ms p(90)=121.39µs p(95)=133.1µs  p(99.9)=16.97ms 
     http_req_sending...............: avg=36.59µs  min=5.94µs  med=15.57µs  max=177.56ms p(90)=20.24µs  p(95)=22.01µs  p(99.9)=634.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.16ms min=8.33ms  med=214.13ms max=345.92ms p(90)=255.54ms p(95)=265.12ms p(99.9)=325.42ms
     http_reqs......................: 29197   241.162584/s
     iteration_duration.............: avg=206.33ms min=17.39ms med=214.93ms max=421.12ms p(90)=256.47ms p(95)=265.79ms p(99.9)=333.34ms
     iterations.....................: 29097   240.3366/s
     success_rate...................: 100.00% ✓ 29097      ✗ 0    
     vus............................: 32      min=32       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 856458      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=3.09µs   min=992ns   med=2.16µs  max=13.35ms  p(90)=3.58µs   p(95)=4.37µs   p(99.9)=34.85µs
     http_req_connecting............: avg=358ns    min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.77ms  min=1.84ms  med=20.29ms max=323.62ms p(90)=28.8ms   p(95)=31.85ms  p(99.9)=53.42ms
       { expected_response:true }...: avg=20.77ms  min=1.84ms  med=20.29ms max=323.62ms p(90)=28.8ms   p(95)=31.85ms  p(99.9)=53.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285586
     http_req_receiving.............: avg=113.93µs min=27.86µs med=54.39µs max=76.83ms  p(90)=101.44µs p(95)=248.43µs p(99.9)=9.11ms 
     http_req_sending...............: avg=50.44µs  min=5.36µs  med=9.58µs  max=156.33ms p(90)=17.5µs   p(95)=120.32µs p(99.9)=5ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.61ms  min=1.75ms  med=20.15ms max=323.1ms  p(90)=28.6ms   p(95)=31.56ms  p(99.9)=52.59ms
     http_reqs......................: 285586  2375.462471/s
     iteration_duration.............: avg=21ms     min=3.82ms  med=20.49ms max=346.89ms p(90)=29.02ms  p(95)=32.09ms  p(99.9)=54.06ms
     iterations.....................: 285486  2374.630686/s
     success_rate...................: 100.00% ✓ 285486      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 703065      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 282 MB  2.3 MB/s
     http_req_blocked...............: avg=3.04µs   min=992ns  med=2.08µs   max=13.28ms  p(90)=3.34µs  p(95)=4.01µs  p(99.9)=34.59µs 
     http_req_connecting............: avg=458ns    min=0s     med=0s       max=4.09ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.36ms  min=1.97ms med=17.23ms  max=496.87ms p(90)=53.87ms p(95)=71.11ms p(99.9)=193.71ms
       { expected_response:true }...: avg=25.36ms  min=1.97ms med=17.23ms  max=496.87ms p(90)=53.87ms p(95)=71.11ms p(99.9)=193.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 234455
     http_req_receiving.............: avg=687.69µs min=51µs   med=106.64µs max=180.97ms p(90)=1.12ms  p(95)=1.79ms  p(99.9)=56.32ms 
     http_req_sending...............: avg=40.76µs  min=5.24µs med=9.39µs   max=130.19ms p(90)=17.01µs p(95)=97µs    p(99.9)=2.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.63ms  min=1.85ms med=16.67ms  max=496.65ms p(90)=52.56ms p(95)=69.65ms p(99.9)=190.33ms
     http_reqs......................: 234455  1949.308651/s
     iteration_duration.............: avg=25.59ms  min=2.82ms med=17.45ms  max=497.06ms p(90)=54.11ms p(95)=71.35ms p(99.9)=196.87ms
     iterations.....................: 234355  1948.47723/s
     success_rate...................: 100.00% ✓ 234355      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 555180      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.8 MB/s
     http_req_blocked...............: avg=3.53µs  min=932ns   med=2.33µs  max=4.69ms   p(90)=4.64µs   p(95)=5.84µs   p(99.9)=43.26µs
     http_req_connecting............: avg=565ns   min=0s      med=0s      max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.14ms min=2.3ms   med=31.21ms max=335.8ms  p(90)=42.75ms  p(95)=47.67ms  p(99.9)=88.03ms
       { expected_response:true }...: avg=32.14ms min=2.3ms   med=31.21ms max=335.8ms  p(90)=42.75ms  p(95)=47.67ms  p(99.9)=88.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185160
     http_req_receiving.............: avg=111.4µs min=30.23µs med=61.06µs max=112.49ms p(90)=134.77µs p(95)=279.23µs p(99.9)=5.58ms 
     http_req_sending...............: avg=53.11µs min=5.27µs  med=10.47µs max=290.77ms p(90)=24.55µs  p(95)=133.71µs p(99.9)=3.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.98ms min=2.23ms  med=31.07ms max=324.22ms p(90)=42.56ms  p(95)=47.43ms  p(99.9)=87.4ms 
     http_reqs......................: 185160  1539.195547/s
     iteration_duration.............: avg=32.41ms min=3.6ms   med=31.45ms max=345.94ms p(90)=43ms     p(95)=47.92ms  p(99.9)=88.77ms
     iterations.....................: 185060  1538.364269/s
     success_rate...................: 100.00% ✓ 185060      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 437613      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.5µs   min=1.04µs  med=2.33µs  max=4.5ms    p(90)=3.93µs   p(95)=4.57µs   p(99.9)=33.26µs
     http_req_connecting............: avg=788ns   min=0s      med=0s      max=4.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.88ms min=2.11ms  med=40.32ms max=304.51ms p(90)=57.37ms  p(95)=62.54ms  p(99.9)=88.34ms
       { expected_response:true }...: avg=40.88ms min=2.11ms  med=40.32ms max=304.51ms p(90)=57.37ms  p(95)=62.54ms  p(99.9)=88.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145971
     http_req_receiving.............: avg=85.38µs min=27.92µs med=63.21µs max=123.38ms p(90)=102.08µs p(95)=122.56µs p(99.9)=2.11ms 
     http_req_sending...............: avg=30.78µs min=5.27µs  med=10.82µs max=161.62ms p(90)=17.73µs  p(95)=21.76µs  p(99.9)=1.45ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.76ms min=2.05ms  med=40.21ms max=304.21ms p(90)=57.25ms  p(95)=62.39ms  p(99.9)=87.79ms
     http_reqs......................: 145971  1213.568988/s
     iteration_duration.............: avg=41.12ms min=3.59ms  med=40.53ms max=352.06ms p(90)=57.58ms  p(95)=62.75ms  p(99.9)=89.26ms
     iterations.....................: 145871  1212.737611/s
     success_rate...................: 100.00% ✓ 145871      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 188508     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   627 kB/s
     http_req_blocked...............: avg=4.58µs  min=1.08µs  med=2.65µs  max=4.24ms   p(90)=4.2µs    p(95)=4.78µs   p(99.9)=53.16µs 
     http_req_connecting............: avg=1.64µs  min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.11ms min=4.52ms  med=92.29ms max=365.17ms p(90)=115.37ms p(95)=128.87ms p(99.9)=228.95ms
       { expected_response:true }...: avg=95.11ms min=4.52ms  med=92.29ms max=365.17ms p(90)=115.37ms p(95)=128.87ms p(99.9)=228.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62936
     http_req_receiving.............: avg=91.68µs min=31.69µs med=80.21µs max=175.15ms p(90)=115.45µs p(95)=129.54µs p(99.9)=912.83µs
     http_req_sending...............: avg=29.55µs min=5.83µs  med=13.43µs max=203.19ms p(90)=20.22µs  p(95)=22.31µs  p(99.9)=736.83µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.99ms min=4.37ms  med=92.18ms max=364.5ms  p(90)=115.24ms p(95)=128.62ms p(99.9)=227.89ms
     http_reqs......................: 62936   521.849667/s
     iteration_duration.............: avg=95.51ms min=38.38ms med=92.53ms max=381.33ms p(90)=115.63ms p(95)=129.18ms p(99.9)=232.33ms
     iterations.....................: 62836   521.020492/s
     success_rate...................: 100.00% ✓ 62836      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 145158     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   482 kB/s
     http_req_blocked...............: avg=5.54µs   min=1.14µs  med=3.24µs   max=4.39ms   p(90)=4.67µs   p(95)=5.22µs   p(99.9)=167.13µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=111.42µs
     http_req_duration..............: avg=123.49ms min=5.92ms  med=121.14ms max=369.98ms p(90)=163.62ms p(95)=175.84ms p(99.9)=227.16ms
       { expected_response:true }...: avg=123.49ms min=5.92ms  med=121.14ms max=369.98ms p(90)=163.62ms p(95)=175.84ms p(99.9)=227.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48486
     http_req_receiving.............: avg=101.99µs min=30.3µs  med=87.48µs  max=204.67ms p(90)=118.68µs p(95)=130.7µs  p(99.9)=677.71µs
     http_req_sending...............: avg=24.99µs  min=5.63µs  med=16.32µs  max=65.21ms  p(90)=21.35µs  p(95)=23.21µs  p(99.9)=635.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.37ms min=5.81ms  med=121.02ms max=360.65ms p(90)=163.51ms p(95)=175.66ms p(99.9)=226.72ms
     http_reqs......................: 48486   401.6935/s
     iteration_duration.............: avg=124.02ms min=31.48ms med=121.44ms max=377.44ms p(90)=163.91ms p(95)=176.14ms p(99.9)=229.79ms
     iterations.....................: 48386   400.865027/s
     success_rate...................: 100.00% ✓ 48386      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 88425      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=7.25µs   min=1.11µs  med=3.37µs   max=4.15ms   p(90)=4.73µs   p(95)=5.3µs    p(99.9)=1.93ms  
     http_req_connecting............: avg=3.69µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=202.74ms min=6.68ms  med=184.34ms max=653.3ms  p(90)=242.89ms p(95)=412.45ms p(99.9)=547.53ms
       { expected_response:true }...: avg=202.74ms min=6.68ms  med=184.34ms max=653.3ms  p(90)=242.89ms p(95)=412.45ms p(99.9)=547.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29575
     http_req_receiving.............: avg=173.23µs min=34.46µs med=96.89µs  max=181.8ms  p(90)=128.85µs p(95)=141.92µs p(99.9)=1.17ms  
     http_req_sending...............: avg=27.4µs   min=5.78µs  med=17.6µs   max=75.94ms  p(90)=22.48µs  p(95)=24.26µs  p(99.9)=564.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.54ms min=6.52ms  med=184.23ms max=653.14ms p(90)=242.54ms p(95)=412.34ms p(99.9)=547.42ms
     http_reqs......................: 29575   244.450248/s
     iteration_duration.............: avg=203.71ms min=36.1ms  med=184.73ms max=653.58ms p(90)=243.34ms p(95)=414.13ms p(99.9)=547.79ms
     iterations.....................: 29475   243.623705/s
     success_rate...................: 100.00% ✓ 29475      ✗ 0    
     vus............................: 1       min=1        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 85689      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=7.03µs   min=1.18µs  med=3.2µs    max=4ms      p(90)=4.46µs   p(95)=4.98µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.68µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=209.17ms min=8.59ms  med=209.13ms max=444.35ms p(90)=219.45ms p(95)=226.31ms p(99.9)=293.02ms
       { expected_response:true }...: avg=209.17ms min=8.59ms  med=209.13ms max=444.35ms p(90)=219.45ms p(95)=226.31ms p(99.9)=293.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28663
     http_req_receiving.............: avg=108.17µs min=36.1µs  med=92.47µs  max=230.85ms p(90)=124µs    p(95)=136.92µs p(99.9)=806.56µs
     http_req_sending...............: avg=47.68µs  min=5.73µs  med=16.26µs  max=169.8ms  p(90)=20.98µs  p(95)=22.86µs  p(99.9)=620.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.01ms min=8.49ms  med=209ms    max=443.89ms p(90)=219.32ms p(95)=226.14ms p(99.9)=292.28ms
     http_reqs......................: 28663   236.683811/s
     iteration_duration.............: avg=210.18ms min=46.67ms med=209.54ms max=470.04ms p(90)=219.72ms p(95)=226.62ms p(99.9)=318.46ms
     iterations.....................: 28563   235.858065/s
     success_rate...................: 100.00% ✓ 28563      ✗ 0    
     vus............................: 39      min=39       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

