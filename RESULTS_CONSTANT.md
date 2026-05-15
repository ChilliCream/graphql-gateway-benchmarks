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
| hive-router | v0.0.49 | 2,832 | 3,051 | 2,757 | 3.5% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,138 | 2,187 | 2,112 | 1.1% |  |
| grafbase | 0.53.3 | 2,031 | 2,092 | 2,003 | 1.4% |  |
| cosmo | 0.307.0 | 1,275 | 1,296 | 1,269 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 547 | 561 | 542 | 1.1% |  |
| apollo-router | v2.13.1 | 430 | 440 | 426 | 1.2% |  |
| hive-gateway | 2.5.25 | 252 | 257 | 249 | 1.1% |  |
| apollo-gateway | 2.13.3 | 242 | 245 | 241 | 0.7% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,346 | 2,489 | 2,316 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,990 | 2,025 | 1,881 | 2.0% |  |
| grafbase | 0.53.3 | 1,502 | 1,541 | 1,492 | 1.1% |  |
| cosmo | 0.307.0 | 1,201 | 1,232 | 1,197 | 1.2% | non-compatible response (4 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 514 | 527 | 508 | 1.3% |  |
| apollo-router | v2.13.1 | 398 | 409 | 393 | 1.3% |  |
| hive-gateway | 2.5.25 | 244 | 250 | 239 | 1.5% |  |
| apollo-gateway | 2.13.3 | 235 | 239 | 233 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1021275     ✗ 0     
     data_received..................: 30 GB   249 MB/s
     data_sent......................: 409 MB  3.4 MB/s
     http_req_blocked...............: avg=2.79µs   min=931ns   med=1.98µs  max=12.67ms  p(90)=3.09µs  p(95)=3.72µs   p(99.9)=30.09µs
     http_req_connecting............: avg=291ns    min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.39ms  min=1.71ms  med=16.58ms max=318.79ms p(90)=25.52ms p(95)=29.07ms  p(99.9)=51.28ms
       { expected_response:true }...: avg=17.39ms  min=1.71ms  med=16.58ms max=318.79ms p(90)=25.52ms p(95)=29.07ms  p(99.9)=51.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 340525
     http_req_receiving.............: avg=119.73µs min=27.42µs med=49.81µs max=40.53ms  p(90)=95.03µs p(95)=258.5µs  p(99.9)=10.84ms
     http_req_sending...............: avg=54.37µs  min=4.99µs  med=8.9µs   max=185.08ms p(90)=15.3µs  p(95)=119.05µs p(99.9)=6.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.22ms  min=1.63ms  med=16.44ms max=315.27ms p(90)=25.28ms p(95)=28.74ms  p(99.9)=50.08ms
     http_reqs......................: 340525  2832.788438/s
     iteration_duration.............: avg=17.61ms  min=2.18ms  med=16.78ms max=333.21ms p(90)=25.74ms p(95)=29.32ms  p(99.9)=51.89ms
     iterations.....................: 340425  2831.956549/s
     success_rate...................: 100.00% ✓ 340425      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 771519      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.09µs   min=1.03µs  med=2.28µs   max=6.03ms   p(90)=3.45µs  p(95)=4.07µs   p(99.9)=36.53µs 
     http_req_connecting............: avg=413ns    min=0s      med=0s       max=4.63ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.08ms  min=2.39ms  med=14.76ms  max=324.72ms p(90)=51.24ms p(95)=69.45ms  p(99.9)=169.95ms
       { expected_response:true }...: avg=23.08ms  min=2.39ms  med=14.76ms  max=324.72ms p(90)=51.24ms p(95)=69.45ms  p(99.9)=169.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257273
     http_req_receiving.............: avg=648.28µs min=49.42µs med=110.27µs max=177.1ms  p(90)=952.6µs p(95)=1.47ms   p(99.9)=60.58ms 
     http_req_sending...............: avg=43.92µs  min=5.23µs  med=9.74µs   max=214.48ms p(90)=16.7µs  p(95)=112.61µs p(99.9)=2.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.39ms  min=2.3ms   med=14.25ms  max=300.75ms p(90)=49.89ms p(95)=68.07ms  p(99.9)=165.44ms
     http_reqs......................: 257273  2138.906717/s
     iteration_duration.............: avg=23.32ms  min=3.25ms  med=14.98ms  max=353.5ms  p(90)=51.47ms p(95)=69.68ms  p(99.9)=171.3ms 
     iterations.....................: 257173  2138.07534/s
     success_rate...................: 100.00% ✓ 257173      ✗ 0     
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

     checks.........................: 100.00% ✓ 732558      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=3.69µs   min=1.02µs med=2.51µs  max=12.77ms  p(90)=4.02µs   p(95)=4.8µs    p(99.9)=41.79µs
     http_req_connecting............: avg=500ns    min=0s     med=0s      max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.31ms  min=1.91ms med=24.05ms max=340.99ms p(90)=29.3ms   p(95)=31.75ms  p(99.9)=54.86ms
       { expected_response:true }...: avg=24.31ms  min=1.91ms med=24.05ms max=340.99ms p(90)=29.3ms   p(95)=31.75ms  p(99.9)=54.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244286
     http_req_receiving.............: avg=122.71µs min=29.7µs med=60.69µs max=208.29ms p(90)=107.76µs p(95)=231.78µs p(99.9)=10.22ms
     http_req_sending...............: avg=49.17µs  min=4.98µs med=10.69µs max=111.66ms p(90)=18.96µs  p(95)=126.34µs p(99.9)=3.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.14ms  min=1.82ms med=23.93ms max=283.89ms p(90)=29.12ms  p(95)=31.46ms  p(99.9)=53.97ms
     http_reqs......................: 244286  2031.484176/s
     iteration_duration.............: avg=24.56ms  min=3.86ms med=24.27ms max=351.1ms  p(90)=29.53ms  p(95)=32.01ms  p(99.9)=55.71ms
     iterations.....................: 244186  2030.652576/s
     success_rate...................: 100.00% ✓ 244186      ✗ 0     
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

     checks.........................: 100.00% ✓ 459864      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.05µs  min=992ns   med=2.45µs  max=2ms      p(90)=3.86µs  p(95)=4.5µs    p(99.9)=37.43µs
     http_req_connecting............: avg=262ns   min=0s      med=0s      max=1.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.89ms min=2.17ms  med=38.35ms max=333.43ms p(90)=54.76ms p(95)=59.65ms  p(99.9)=84.03ms
       { expected_response:true }...: avg=38.89ms min=2.17ms  med=38.35ms max=333.43ms p(90)=54.76ms p(95)=59.65ms  p(99.9)=84.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153388
     http_req_receiving.............: avg=84.25µs min=27.49µs med=60.91µs max=102.97ms p(90)=98.46µs p(95)=117.67µs p(99.9)=2.18ms 
     http_req_sending...............: avg=26.68µs min=5.03µs  med=10.78µs max=120.43ms p(90)=16.88µs p(95)=21.15µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.78ms min=2.08ms  med=38.24ms max=323.42ms p(90)=54.64ms p(95)=59.52ms  p(99.9)=83.74ms
     http_reqs......................: 153388  1275.214864/s
     iteration_duration.............: avg=39.13ms min=4ms     med=38.56ms max=358.62ms p(90)=54.95ms p(95)=59.86ms  p(99.9)=84.48ms
     iterations.....................: 153288  1274.383498/s
     success_rate...................: 100.00% ✓ 153288      ✗ 0     
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

     checks.........................: 100.00% ✓ 197733     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   658 kB/s
     http_req_blocked...............: avg=5.29µs  min=1.16µs  med=3.1µs   max=4.63ms   p(90)=4.71µs   p(95)=5.33µs   p(99.9)=51.83µs 
     http_req_connecting............: avg=1.87µs  min=0s      med=0s      max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.66ms min=4.1ms   med=84.56ms max=364.38ms p(90)=127.51ms p(95)=142.06ms p(99.9)=243.57ms
       { expected_response:true }...: avg=90.66ms min=4.1ms   med=84.56ms max=364.38ms p(90)=127.51ms p(95)=142.06ms p(99.9)=243.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66011
     http_req_receiving.............: avg=88.2µs  min=31.49µs med=79.33µs max=89.96ms  p(90)=113.51µs p(95)=126.21µs p(99.9)=883.96µs
     http_req_sending...............: avg=24.59µs min=5.33µs  med=13.99µs max=146.65ms p(90)=20.48µs  p(95)=22.7µs   p(99.9)=742.16µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.54ms min=4.03ms  med=84.46ms max=364.13ms p(90)=127.41ms p(95)=141.94ms p(99.9)=243.13ms
     http_reqs......................: 66011   547.603331/s
     iteration_duration.............: avg=91.04ms min=23.76ms med=84.84ms max=383.35ms p(90)=127.77ms p(95)=142.41ms p(99.9)=246.34ms
     iterations.....................: 65911   546.773767/s
     success_rate...................: 100.00% ✓ 65911      ✗ 0    
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

     checks.........................: 100.00% ✓ 155463     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 62 MB   517 kB/s
     http_req_blocked...............: avg=5.67µs   min=1.12µs  med=3.52µs   max=4.52ms   p(90)=4.98µs   p(95)=5.57µs   p(99.9)=69.9µs  
     http_req_connecting............: avg=1.96µs   min=0s      med=0s       max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.31ms min=5.32ms  med=115.08ms max=386.19ms p(90)=139.24ms p(95)=146.34ms p(99.9)=183.4ms 
       { expected_response:true }...: avg=115.31ms min=5.32ms  med=115.08ms max=386.19ms p(90)=139.24ms p(95)=146.34ms p(99.9)=183.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 51921
     http_req_receiving.............: avg=105.39µs min=31.73µs med=86.01µs  max=185.81ms p(90)=116.97µs p(95)=129.29µs p(99.9)=941.11µs
     http_req_sending...............: avg=30.21µs  min=5.78µs  med=16.17µs  max=122.49ms p(90)=21.35µs  p(95)=23.19µs  p(99.9)=666.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.17ms min=5.2ms   med=114.97ms max=358.38ms p(90)=139.12ms p(95)=146.21ms p(99.9)=181.09ms
     http_reqs......................: 51921   430.276532/s
     iteration_duration.............: avg=115.8ms  min=23.82ms med=115.37ms max=398.24ms p(90)=139.5ms  p(95)=146.59ms p(99.9)=186.43ms
     iterations.....................: 51821   429.447818/s
     success_rate...................: 100.00% ✓ 51821      ✗ 0    
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

     checks.........................: 100.00% ✓ 91344      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   303 kB/s
     http_req_blocked...............: avg=7.36µs   min=1.11µs  med=3.66µs   max=3.93ms   p(90)=5.18µs   p(95)=5.85µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=196.26ms min=6.4ms   med=179.07ms max=637.48ms p(90)=234.41ms p(95)=398.49ms p(99.9)=531.38ms
       { expected_response:true }...: avg=196.26ms min=6.4ms   med=179.07ms max=637.48ms p(90)=234.41ms p(95)=398.49ms p(99.9)=531.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30548
     http_req_receiving.............: avg=109.9µs  min=34.35µs med=98.86µs  max=107.74ms p(90)=131.11µs p(95)=144.02µs p(99.9)=619.11µs
     http_req_sending...............: avg=32.85µs  min=5.9µs   med=17.9µs   max=101.07ms p(90)=22.97µs  p(95)=24.96µs  p(99.9)=620.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.12ms min=6.26ms  med=178.92ms max=637.35ms p(90)=234.25ms p(95)=398.36ms p(99.9)=531.27ms
     http_reqs......................: 30548   252.593791/s
     iteration_duration.............: avg=197.19ms min=49.02ms med=179.44ms max=637.69ms p(90)=234.94ms p(95)=400.01ms p(99.9)=531.86ms
     iterations.....................: 30448   251.766916/s
     success_rate...................: 100.00% ✓ 30448      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 87645      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=7.17µs   min=1.21µs med=3.37µs   max=4.37ms   p(90)=4.61µs   p(95)=5.11µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.61µs   min=0s     med=0s       max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=204.55ms min=8.27ms med=208.98ms max=448.5ms  p(90)=221.09ms p(95)=231.42ms p(99.9)=293.5ms 
       { expected_response:true }...: avg=204.55ms min=8.27ms med=208.98ms max=448.5ms  p(90)=221.09ms p(95)=231.42ms p(99.9)=293.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29315
     http_req_receiving.............: avg=110.22µs min=33.1µs med=89.84µs  max=104.94ms p(90)=120.6µs  p(95)=131.67µs p(99.9)=769.22µs
     http_req_sending...............: avg=32.72µs  min=5.75µs med=16.06µs  max=133.57ms p(90)=20.88µs  p(95)=22.5µs   p(99.9)=589.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.41ms min=8.14ms med=208.87ms max=432.22ms p(90)=220.95ms p(95)=231.28ms p(99.9)=293.38ms
     http_reqs......................: 29315   242.107944/s
     iteration_duration.............: avg=205.52ms min=51ms   med=209.26ms max=456.92ms p(90)=221.35ms p(95)=231.84ms p(99.9)=300.38ms
     iterations.....................: 29215   241.28206/s
     success_rate...................: 100.00% ✓ 29215      ✗ 0    
     vus............................: 40      min=40       max=50 
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

     checks.........................: 100.00% ✓ 846132      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 339 MB  2.8 MB/s
     http_req_blocked...............: avg=6.26µs   min=982ns  med=2.49µs  max=30.62ms  p(90)=4.03µs   p(95)=4.83µs   p(99.9)=35.4µs 
     http_req_connecting............: avg=3.29µs   min=0s     med=0s      max=30.59ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.02ms  min=1.76ms med=20.5ms  max=279.87ms p(90)=29.28ms  p(95)=32.5ms   p(99.9)=55.99ms
       { expected_response:true }...: avg=21.02ms  min=1.76ms med=20.5ms  max=279.87ms p(90)=29.28ms  p(95)=32.5ms   p(99.9)=55.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282144
     http_req_receiving.............: avg=123.89µs min=28.4µs med=57.34µs max=147.83ms p(90)=109.56µs p(95)=274.41µs p(99.9)=9.88ms 
     http_req_sending...............: avg=56.09µs  min=5.28µs med=10.5µs  max=87.78ms  p(90)=19.18µs  p(95)=129.78µs p(99.9)=6.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.84ms  min=1.64ms med=20.36ms max=279.66ms p(90)=29.07ms  p(95)=32.19ms  p(99.9)=55.14ms
     http_reqs......................: 282144  2346.963432/s
     iteration_duration.............: avg=21.26ms  min=2.98ms med=20.72ms max=341.21ms p(90)=29.51ms  p(95)=32.75ms  p(99.9)=56.36ms
     iterations.....................: 282044  2346.1316/s
     success_rate...................: 100.00% ✓ 282044      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 717804      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.59µs   min=1µs     med=2.67µs   max=11.26ms  p(90)=4.28µs  p(95)=5.06µs   p(99.9)=38.69µs 
     http_req_connecting............: avg=416ns    min=0s      med=0s       max=4.57ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.82ms  min=1.99ms  med=17.31ms  max=698.8ms  p(90)=52ms    p(95)=69.2ms   p(99.9)=177.36ms
       { expected_response:true }...: avg=24.82ms  min=1.99ms  med=17.31ms  max=698.8ms  p(90)=52ms    p(95)=69.2ms   p(99.9)=177.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239368
     http_req_receiving.............: avg=725.32µs min=51.15µs med=111.09µs max=286.4ms  p(90)=1.15ms  p(95)=1.85ms   p(99.9)=59.73ms 
     http_req_sending...............: avg=43.64µs  min=5.22µs  med=10.46µs  max=250.38ms p(90)=19.32µs p(95)=115.04µs p(99.9)=2.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.05ms  min=1.86ms  med=16.73ms  max=696.51ms p(90)=50.58ms p(95)=67.73ms  p(99.9)=170.18ms
     http_reqs......................: 239368  1990.542369/s
     iteration_duration.............: avg=25.06ms  min=2.88ms  med=17.54ms  max=699.06ms p(90)=52.25ms p(95)=69.44ms  p(99.9)=179.79ms
     iterations.....................: 239268  1989.710787/s
     success_rate...................: 100.00% ✓ 239268      ✗ 0     
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

     checks.........................: 100.00% ✓ 542142      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 217 MB  1.8 MB/s
     http_req_blocked...............: avg=3.46µs   min=952ns   med=2.32µs  max=4.86ms   p(90)=4.69µs   p(95)=5.89µs   p(99.9)=46.11µs
     http_req_connecting............: avg=498ns    min=0s      med=0s      max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.92ms  min=2.55ms  med=32.1ms  max=333.22ms p(90)=43.76ms  p(95)=48.4ms   p(99.9)=89.23ms
       { expected_response:true }...: avg=32.92ms  min=2.55ms  med=32.1ms  max=333.22ms p(90)=43.76ms  p(95)=48.4ms   p(99.9)=89.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180814
     http_req_receiving.............: avg=128.25µs min=28.75µs med=61.89µs max=131.99ms p(90)=137.38µs p(95)=289.84µs p(99.9)=6.41ms 
     http_req_sending...............: avg=46.98µs  min=5.27µs  med=10.3µs  max=127.71ms p(90)=24.22µs  p(95)=138.83µs p(99.9)=3.39ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.74ms  min=2.43ms  med=31.96ms max=206.18ms p(90)=43.55ms  p(95)=48.17ms  p(99.9)=87.55ms
     http_reqs......................: 180814  1502.885911/s
     iteration_duration.............: avg=33.19ms  min=3.91ms  med=32.35ms max=364.27ms p(90)=44ms     p(95)=48.65ms  p(99.9)=89.83ms
     iterations.....................: 180714  1502.054733/s
     success_rate...................: 100.00% ✓ 180714      ✗ 0     
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

     checks.........................: 100.00% ✓ 433491      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.42µs  min=1.02µs  med=2.63µs  max=3.18ms   p(90)=4.32µs   p(95)=5.02µs   p(99.9)=38.6µs 
     http_req_connecting............: avg=449ns   min=0s      med=0s      max=3.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.26ms min=2.32ms  med=40.67ms max=313.95ms p(90)=57.88ms  p(95)=63.22ms  p(99.9)=88.96ms
       { expected_response:true }...: avg=41.26ms min=2.32ms  med=40.67ms max=313.95ms p(90)=57.88ms  p(95)=63.22ms  p(99.9)=88.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144597
     http_req_receiving.............: avg=85.59µs min=28.86µs med=68.37µs max=25.33ms  p(90)=108.12µs p(95)=127.52µs p(99.9)=1.78ms 
     http_req_sending...............: avg=29.27µs min=5.32µs  med=11.93µs max=113.75ms p(90)=18.88µs  p(95)=22.74µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.15ms min=2.2ms   med=40.56ms max=313.12ms p(90)=57.77ms  p(95)=63.09ms  p(99.9)=88.57ms
     http_reqs......................: 144597  1201.92457/s
     iteration_duration.............: avg=41.51ms min=3.84ms  med=40.89ms max=358.29ms p(90)=58.1ms   p(95)=63.44ms  p(99.9)=89.41ms
     iterations.....................: 144497  1201.093347/s
     success_rate...................: 100.00% ✓ 144497      ✗ 0     
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

     checks.........................: 100.00% ✓ 185712     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   618 kB/s
     http_req_blocked...............: avg=5.26µs   min=1.06µs  med=3.31µs  max=4.65ms   p(90)=4.87µs   p(95)=5.47µs   p(99.9)=53.04µs 
     http_req_connecting............: avg=1.63µs   min=0s      med=0s      max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.55ms  min=4.19ms  med=93.78ms max=378.8ms  p(90)=117.33ms p(95)=130.33ms p(99.9)=224.05ms
       { expected_response:true }...: avg=96.55ms  min=4.19ms  med=93.78ms max=378.8ms  p(90)=117.33ms p(95)=130.33ms p(99.9)=224.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62004
     http_req_receiving.............: avg=168.32µs min=31.54µs med=84.15µs max=258.8ms  p(90)=118.41µs p(95)=131.61µs p(99.9)=1.31ms  
     http_req_sending...............: avg=28.33µs  min=5.63µs  med=14.55µs max=247.45ms p(90)=20.83µs  p(95)=23.01µs  p(99.9)=747.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.35ms  min=4.12ms  med=93.66ms max=241.19ms p(90)=117.2ms  p(95)=129.94ms p(99.9)=220.45ms
     http_reqs......................: 62004   514.160759/s
     iteration_duration.............: avg=96.94ms  min=9.85ms  med=94.03ms max=389.93ms p(90)=117.58ms p(95)=130.62ms p(99.9)=225.3ms 
     iterations.....................: 61904   513.331521/s
     success_rate...................: 100.00% ✓ 61904      ✗ 0    
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

     checks.........................: 100.00% ✓ 143883     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   478 kB/s
     http_req_blocked...............: avg=5.94µs   min=1.14µs  med=3.68µs   max=4.23ms   p(90)=5.21µs   p(95)=5.79µs   p(99.9)=208.47µs
     http_req_connecting............: avg=1.99µs   min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=125.1µs 
     http_req_duration..............: avg=124.59ms min=5.92ms  med=122.17ms max=367.18ms p(90)=165.16ms p(95)=177.68ms p(99.9)=229.25ms
       { expected_response:true }...: avg=124.59ms min=5.92ms  med=122.17ms max=367.18ms p(90)=165.16ms p(95)=177.68ms p(99.9)=229.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48061
     http_req_receiving.............: avg=151.36µs min=31.62µs med=89.92µs  max=149.79ms p(90)=121.35µs p(95)=134.33µs p(99.9)=1.27ms  
     http_req_sending...............: avg=30.07µs  min=5.82µs  med=17µs     max=197.42ms p(90)=22.23µs  p(95)=24.13µs  p(99.9)=793.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.41ms min=5.8ms   med=122.02ms max=272.07ms p(90)=165.02ms p(95)=177.52ms p(99.9)=227.01ms
     http_reqs......................: 48061   398.049914/s
     iteration_duration.............: avg=125.13ms min=8.27ms  med=122.49ms max=377.2ms  p(90)=165.46ms p(95)=178.02ms p(99.9)=232.93ms
     iterations.....................: 47961   397.221696/s
     success_rate...................: 100.00% ✓ 47961      ✗ 0    
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

     checks.........................: 100.00% ✓ 88350      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=7.74µs   min=1.16µs  med=3.65µs   max=4.16ms   p(90)=5.09µs   p(95)=5.67µs   p(99.9)=2.01ms  
     http_req_connecting............: avg=3.9µs    min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=202.91ms min=6.46ms  med=155.75ms max=851.27ms p(90)=323.51ms p(95)=386.87ms p(99.9)=652.31ms
       { expected_response:true }...: avg=202.91ms min=6.46ms  med=155.75ms max=851.27ms p(90)=323.51ms p(95)=386.87ms p(99.9)=652.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29550
     http_req_receiving.............: avg=101.21µs min=33.56µs med=97.6µs   max=1.62ms   p(90)=128.79µs p(95)=141.94µs p(99.9)=509.55µs
     http_req_sending...............: avg=22.14µs  min=5.6µs   med=17.94µs  max=9.31ms   p(90)=22.8µs   p(95)=24.53µs  p(99.9)=618.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.79ms min=6.36ms  med=155.61ms max=851.16ms p(90)=323.39ms p(95)=386.76ms p(99.9)=652.19ms
     http_reqs......................: 29550   244.331651/s
     iteration_duration.............: avg=203.84ms min=34.61ms med=156.2ms  max=851.55ms p(90)=323.95ms p(95)=387.53ms p(99.9)=652.59ms
     iterations.....................: 29450   243.504809/s
     success_rate...................: 100.00% ✓ 29450      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 85422      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=6.19µs   min=1.26µs  med=3.58µs   max=4.14ms   p(90)=4.91µs   p(95)=5.47µs   p(99.9)=805.09µs
     http_req_connecting............: avg=2.45µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=782.06µs
     http_req_duration..............: avg=209.82ms min=8.78ms  med=211.36ms max=411.49ms p(90)=224.18ms p(95)=230.3ms  p(99.9)=295.53ms
       { expected_response:true }...: avg=209.82ms min=8.78ms  med=211.36ms max=411.49ms p(90)=224.18ms p(95)=230.3ms  p(99.9)=295.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28574
     http_req_receiving.............: avg=104.48µs min=30.9µs  med=96.65µs  max=63.99ms  p(90)=128.56µs p(95)=141.27µs p(99.9)=733.47µs
     http_req_sending...............: avg=37.54µs  min=5.72µs  med=17.53µs  max=100.28ms p(90)=22.25µs  p(95)=24.05µs  p(99.9)=765.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.68ms min=8.66ms  med=211.24ms max=411.25ms p(90)=224.06ms p(95)=230.16ms p(99.9)=295.37ms
     http_reqs......................: 28574   235.9805/s
     iteration_duration.............: avg=210.84ms min=72.34ms med=211.75ms max=429.01ms p(90)=224.47ms p(95)=230.59ms p(99.9)=297.88ms
     iterations.....................: 28474   235.154643/s
     success_rate...................: 100.00% ✓ 28474      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

