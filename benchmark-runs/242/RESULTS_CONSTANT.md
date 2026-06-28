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
| hive-router | v0.0.72 | 2,963 | 3,144 | 2,944 | 2.2% |  |
| fusion-nightly | 16.4.0-p.5 | 2,242 | 2,295 | 2,235 | 0.9% |  |
| fusion | 16.3.0 | 2,180 | 2,227 | 2,169 | 0.8% |  |
| grafbase | 0.53.5 | 2,016 | 2,073 | 2,000 | 1.2% |  |
| cosmo | 0.326.0 | 1,195 | 1,217 | 1,190 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 555 | 567 | 554 | 0.8% |  |
| apollo-router | v2.15.1 | 418 | 436 | 406 | 2.4% |  |
| apollo-gateway | 2.14.1 | 247 | 249 | 244 | 0.7% |  |
| hive-gateway | 2.9.0 | 236 | 241 | 235 | 1.0% |  |
| feddi | 77271dc84a06 | — | — | — | — | non-compatible response (1597 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,343 | 2,442 | 2,315 | 1.7% |  |
| fusion-nightly | 16.4.0-p.5 | 2,109 | 2,158 | 2,097 | 0.9% |  |
| fusion | 16.3.0 | 2,057 | 2,104 | 2,045 | 0.9% |  |
| grafbase | 0.53.5 | 1,506 | 1,526 | 1,498 | 0.6% |  |
| cosmo | 0.326.0 | 1,125 | 1,147 | 1,121 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 539 | 552 | 535 | 1.0% |  |
| apollo-router | v2.15.1 | 394 | 406 | 392 | 1.3% |  |
| hive-gateway | 2.9.0 | 244 | 249 | 241 | 1.0% |  |
| apollo-gateway | 2.14.1 | 236 | 239 | 235 | 0.6% |  |
| feddi | 77271dc84a06 | 24 | 24 | 23 | 2.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1068321     ✗ 0     
     data_received..................: 31 GB   260 MB/s
     data_sent......................: 428 MB  3.6 MB/s
     http_req_blocked...............: avg=2.77µs   min=1.03µs  med=2.17µs  max=23.25ms  p(90)=3.41µs   p(95)=4.07µs   p(99.9)=36.54µs
     http_req_connecting............: avg=146ns    min=0s      med=0s      max=2.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.61ms  min=1.64ms  med=15.74ms max=358.07ms p(90)=24.41ms  p(95)=27.97ms  p(99.9)=51.04ms
       { expected_response:true }...: avg=16.61ms  min=1.64ms  med=15.74ms max=358.07ms p(90)=24.41ms  p(95)=27.97ms  p(99.9)=51.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 356207
     http_req_receiving.............: avg=151.51µs min=28.32µs med=51.85µs max=323.73ms p(90)=107.14µs p(95)=287.13µs p(99.9)=12.58ms
     http_req_sending...............: avg=57.98µs  min=5.15µs  med=9.33µs  max=162.93ms p(90)=16.33µs  p(95)=126.82µs p(99.9)=6.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.4ms   min=1.58ms  med=15.58ms max=150.97ms p(90)=24.15ms  p(95)=27.6ms   p(99.9)=48.83ms
     http_reqs......................: 356207  2963.45077/s
     iteration_duration.............: avg=16.83ms  min=2.13ms  med=15.95ms max=368.21ms p(90)=24.63ms  p(95)=28.23ms  p(99.9)=52.31ms
     iterations.....................: 356107  2962.618824/s
     success_rate...................: 100.00% ✓ 356107      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 808770      ✗ 0     
     data_received..................: 24 GB   197 MB/s
     data_sent......................: 324 MB  2.7 MB/s
     http_req_blocked...............: avg=2.89µs  min=972ns   med=2.13µs   max=14.11ms  p(90)=3.51µs  p(95)=4.21µs   p(99.9)=30.57µs 
     http_req_connecting............: avg=275ns   min=0s      med=0s       max=3.72ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.01ms min=2.31ms  med=18.69ms  max=301.73ms p(90)=37.9ms  p(95)=47.38ms  p(99.9)=112.43ms
       { expected_response:true }...: avg=22.01ms min=2.31ms  med=18.69ms  max=301.73ms p(90)=37.9ms  p(95)=47.38ms  p(99.9)=112.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 269690
     http_req_receiving.............: avg=1.02ms  min=51.68µs med=305.42µs max=155.43ms p(90)=2.13ms  p(95)=3.2ms    p(99.9)=38.09ms 
     http_req_sending...............: avg=46.73µs min=5.24µs  med=9.27µs   max=195.4ms  p(90)=17.44µs p(95)=113.54µs p(99.9)=3.73ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=20.94ms min=2.19ms  med=17.63ms  max=300.81ms p(90)=36.44ms p(95)=45.71ms  p(99.9)=110.24ms
     http_reqs......................: 269690  2242.219439/s
     iteration_duration.............: avg=22.24ms min=3.16ms  med=18.91ms  max=331.3ms  p(90)=38.15ms p(95)=47.63ms  p(99.9)=113.66ms
     iterations.....................: 269590  2241.388032/s
     success_rate...................: 100.00% ✓ 269590      ✗ 0     
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

     checks.........................: 100.00% ✓ 786681      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=2.98µs   min=992ns   med=2.12µs   max=21.78ms  p(90)=3.3µs   p(95)=3.9µs    p(99.9)=30.85µs 
     http_req_connecting............: avg=406ns    min=0s      med=0s       max=4.31ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.63ms  min=2.51ms  med=15.07ms  max=325ms    p(90)=49.08ms p(95)=66.58ms  p(99.9)=164.34ms
       { expected_response:true }...: avg=22.63ms  min=2.51ms  med=15.07ms  max=325ms    p(90)=49.08ms p(95)=66.58ms  p(99.9)=164.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262327
     http_req_receiving.............: avg=910.64µs min=51.44µs med=127.61µs max=183.36ms p(90)=1.35ms  p(95)=2.22ms   p(99.9)=60.17ms 
     http_req_sending...............: avg=45.28µs  min=5.18µs  med=9.25µs   max=164.13ms p(90)=16.23µs p(95)=108.87µs p(99.9)=3.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.68ms  min=2.39ms  med=14.31ms  max=324.4ms  p(90)=47.28ms p(95)=64.64ms  p(99.9)=161.63ms
     http_reqs......................: 262327  2180.643941/s
     iteration_duration.............: avg=22.87ms  min=3.25ms  med=15.29ms  max=343.9ms  p(90)=49.31ms p(95)=66.82ms  p(99.9)=165.45ms
     iterations.....................: 262227  2179.812672/s
     success_rate...................: 100.00% ✓ 262227      ✗ 0     
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

     checks.........................: 100.00% ✓ 727161      ✗ 0     
     data_received..................: 21 GB   177 MB/s
     data_sent......................: 291 MB  2.4 MB/s
     http_req_blocked...............: avg=3.16µs   min=962ns   med=2.47µs  max=12.84ms  p(90)=3.98µs   p(95)=4.72µs   p(99.9)=40.99µs
     http_req_connecting............: avg=179ns    min=0s      med=0s      max=1.84ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.5ms   min=1.92ms  med=24.25ms max=313.53ms p(90)=29.32ms  p(95)=31.48ms  p(99.9)=53.23ms
       { expected_response:true }...: avg=24.5ms   min=1.92ms  med=24.25ms max=313.53ms p(90)=29.32ms  p(95)=31.48ms  p(99.9)=53.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 242487
     http_req_receiving.............: avg=107.93µs min=29.15µs med=60.48µs max=66.3ms   p(90)=103.88µs p(95)=190.31µs p(99.9)=7.5ms  
     http_req_sending...............: avg=43.21µs  min=4.93µs  med=10.45µs max=108.71ms p(90)=17.41µs  p(95)=114µs    p(99.9)=2.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.35ms  min=1.82ms  med=24.14ms max=313.1ms  p(90)=29.16ms  p(95)=31.25ms  p(99.9)=52.12ms
     http_reqs......................: 242487  2016.566288/s
     iteration_duration.............: avg=24.74ms  min=3.46ms  med=24.47ms max=342.96ms p(90)=29.55ms  p(95)=31.73ms  p(99.9)=54.41ms
     iterations.....................: 242387  2015.73467/s
     success_rate...................: 100.00% ✓ 242387      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431127      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.73µs  min=1.01µs  med=2.11µs  max=8.65ms   p(90)=3.42µs  p(95)=4.02µs   p(99.9)=36.17µs
     http_req_connecting............: avg=1.25µs  min=0s      med=0s      max=8.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.5ms  min=2.11ms  med=41ms    max=314.6ms  p(90)=58.65ms p(95)=64.04ms  p(99.9)=90.74ms
       { expected_response:true }...: avg=41.5ms  min=2.11ms  med=41ms    max=314.6ms  p(90)=58.65ms p(95)=64.04ms  p(99.9)=90.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143809
     http_req_receiving.............: avg=79.98µs min=27.44µs med=60.79µs max=201.01ms p(90)=95.49µs p(95)=111.36µs p(99.9)=1.73ms 
     http_req_sending...............: avg=24.23µs min=5.06µs  med=9.87µs  max=179.43ms p(90)=15.07µs p(95)=18.67µs  p(99.9)=1.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.4ms  min=1.97ms  med=40.9ms  max=275.56ms p(90)=58.55ms p(95)=63.92ms  p(99.9)=90.27ms
     http_reqs......................: 143809  1195.746046/s
     iteration_duration.............: avg=41.74ms min=3.72ms  med=41.2ms  max=340.63ms p(90)=58.85ms p(95)=64.23ms  p(99.9)=91.19ms
     iterations.....................: 143709  1194.914564/s
     success_rate...................: 100.00% ✓ 143709      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 200541     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 80 MB   667 kB/s
     http_req_blocked...............: avg=4.71µs  min=1.15µs  med=2.99µs  max=4.18ms   p(90)=4.51µs   p(95)=5.12µs   p(99.9)=58.46µs 
     http_req_connecting............: avg=1.4µs   min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.41ms min=4.01ms  med=87.16ms max=345.5ms  p(90)=110.06ms p(95)=121.81ms p(99.9)=224.53ms
       { expected_response:true }...: avg=89.41ms min=4.01ms  med=87.16ms max=345.5ms  p(90)=110.06ms p(95)=121.81ms p(99.9)=224.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66947
     http_req_receiving.............: avg=85.54µs min=32.28µs med=76.93µs max=50.33ms  p(90)=110.96µs p(95)=123.01µs p(99.9)=928.75µs
     http_req_sending...............: avg=28.38µs min=5.79µs  med=13.3µs  max=201.9ms  p(90)=19.98µs  p(95)=22.38µs  p(99.9)=817.87µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.29ms min=3.94ms  med=87.05ms max=345.03ms p(90)=109.94ms p(95)=121.67ms p(99.9)=224.1ms 
     http_reqs......................: 66947   555.406121/s
     iteration_duration.............: avg=89.77ms min=26.46ms med=87.4ms  max=383.79ms p(90)=110.3ms  p(95)=122.06ms p(99.9)=226.42ms
     iterations.....................: 66847   554.5765/s
     success_rate...................: 100.00% ✓ 66847      ✗ 0    
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

     checks.........................: 100.00% ✓ 151137     ✗ 0    
     data_received..................: 4.4 GB  37 MB/s
     data_sent......................: 61 MB   502 kB/s
     http_req_blocked...............: avg=6.67µs   min=1.28µs  med=3.19µs   max=56.26ms  p(90)=4.53µs   p(95)=5.05µs   p(99.9)=525.93µs
     http_req_connecting............: avg=3.24µs   min=0s      med=0s       max=56.2ms   p(90)=0s       p(95)=0s       p(99.9)=387.03µs
     http_req_duration..............: avg=118.62ms min=5.3ms   med=118.38ms max=368.1ms  p(90)=143.07ms p(95)=150.65ms p(99.9)=187.12ms
       { expected_response:true }...: avg=118.62ms min=5.3ms   med=118.38ms max=368.1ms  p(90)=143.07ms p(95)=150.65ms p(99.9)=187.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50479
     http_req_receiving.............: avg=92.78µs  min=33.16µs med=81.54µs  max=92.84ms  p(90)=112.81µs p(95)=124.66µs p(99.9)=701.72µs
     http_req_sending...............: avg=31.18µs  min=5.93µs  med=14.72µs  max=207.88ms p(90)=20.24µs  p(95)=22.01µs  p(99.9)=592.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.5ms  min=5.16ms  med=118.27ms max=367.64ms p(90)=142.94ms p(95)=150.51ms p(99.9)=186.63ms
     http_reqs......................: 50479   418.37705/s
     iteration_duration.............: avg=119.11ms min=37.35ms med=118.66ms max=379.15ms p(90)=143.35ms p(95)=150.93ms p(99.9)=189.66ms
     iterations.....................: 50379   417.548236/s
     success_rate...................: 100.00% ✓ 50379      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89568      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=6.97µs   min=1.36µs  med=3.36µs   max=4.24ms   p(90)=4.62µs   p(95)=5.13µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.47µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=200.13ms min=8.54ms  med=198.79ms max=483.98ms p(90)=210.46ms p(95)=215.21ms p(99.9)=291.99ms
       { expected_response:true }...: avg=200.13ms min=8.54ms  med=198.79ms max=483.98ms p(90)=210.46ms p(95)=215.21ms p(99.9)=291.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29956
     http_req_receiving.............: avg=106.97µs min=32.9µs  med=88.98µs  max=222.23ms p(90)=120.46µs p(95)=132.58µs p(99.9)=837.18µs
     http_req_sending...............: avg=37.89µs  min=6.15µs  med=15.99µs  max=301.14ms p(90)=20.91µs  p(95)=22.73µs  p(99.9)=597.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.98ms min=8.43ms  med=198.67ms max=439.11ms p(90)=210.35ms p(95)=215.08ms p(99.9)=289.17ms
     http_reqs......................: 29956   247.39647/s
     iteration_duration.............: avg=201.1ms  min=39.18ms med=199.15ms max=484.19ms p(90)=210.74ms p(95)=215.5ms  p(99.9)=318.82ms
     iterations.....................: 29856   246.570604/s
     success_rate...................: 100.00% ✓ 29856      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85599      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=7.16µs   min=1.3µs   med=3.49µs   max=4.03ms   p(90)=4.82µs   p(95)=5.4µs    p(99.9)=1.82ms  
     http_req_connecting............: avg=3.49µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=209.4ms  min=6.51ms  med=190.65ms max=714.13ms p(90)=243.22ms p(95)=411.79ms p(99.9)=617.01ms
       { expected_response:true }...: avg=209.4ms  min=6.51ms  med=190.65ms max=714.13ms p(90)=243.22ms p(95)=411.79ms p(99.9)=617.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28633
     http_req_receiving.............: avg=99.78µs  min=34.78µs med=91.41µs  max=46.19ms  p(90)=124.33µs p(95)=137.42µs p(99.9)=613.23µs
     http_req_sending...............: avg=35.94µs  min=6.12µs  med=16.36µs  max=203.02ms p(90)=21.84µs  p(95)=23.75µs  p(99.9)=525.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.26ms min=6.36ms  med=190.54ms max=714.05ms p(90)=243.05ms p(95)=411.7ms  p(99.9)=616.92ms
     http_reqs......................: 28633   236.819766/s
     iteration_duration.............: avg=210.41ms min=27.36ms med=191.04ms max=714.43ms p(90)=243.68ms p(95)=413.87ms p(99.9)=617.29ms
     iterations.....................: 28533   235.99268/s
     success_rate...................: 100.00% ✓ 28533      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 845004      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 339 MB  2.8 MB/s
     http_req_blocked...............: avg=3.27µs   min=1.03µs  med=2.59µs  max=12.09ms  p(90)=4.16µs   p(95)=4.98µs   p(99.9)=39.36µs
     http_req_connecting............: avg=140ns    min=0s      med=0s      max=2.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.05ms  min=1.8ms   med=20.48ms max=302.73ms p(90)=29.47ms  p(95)=32.74ms  p(99.9)=54.91ms
       { expected_response:true }...: avg=21.05ms  min=1.8ms   med=20.48ms max=302.73ms p(90)=29.47ms  p(95)=32.74ms  p(99.9)=54.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 281768
     http_req_receiving.............: avg=125.02µs min=27.94µs med=56.88µs max=36.71ms  p(90)=109.61µs p(95)=279.5µs  p(99.9)=10.41ms
     http_req_sending...............: avg=56.11µs  min=5.53µs  med=10.4µs  max=193.99ms p(90)=18.91µs  p(95)=130.51µs p(99.9)=5.92ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.87ms  min=1.73ms  med=20.33ms max=302.04ms p(90)=29.24ms  p(95)=32.43ms  p(99.9)=53.8ms 
     http_reqs......................: 281768  2343.69726/s
     iteration_duration.............: avg=21.29ms  min=3.2ms   med=20.71ms max=311.94ms p(90)=29.7ms   p(95)=32.99ms  p(99.9)=55.43ms
     iterations.....................: 281668  2342.865477/s
     success_rate...................: 100.00% ✓ 281668      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 760467      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=2.87µs  min=972ns   med=2.25µs   max=2.5ms    p(90)=3.87µs  p(95)=4.64µs   p(99.9)=31.83µs 
     http_req_connecting............: avg=195ns   min=0s      med=0s       max=2.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.42ms min=1.77ms  med=20.86ms  max=314ms    p(90)=38.52ms p(95)=46.58ms  p(99.9)=101.06ms
       { expected_response:true }...: avg=23.42ms min=1.77ms  med=20.86ms  max=314ms    p(90)=38.52ms p(95)=46.58ms  p(99.9)=101.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253589
     http_req_receiving.............: avg=1.1ms   min=52.28µs med=291.03µs max=303.34ms p(90)=2.47ms  p(95)=3.75ms   p(99.9)=34.83ms 
     http_req_sending...............: avg=50.39µs min=5.38µs  med=9.54µs   max=250.72ms p(90)=19.44µs p(95)=118.59µs p(99.9)=4.36ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.26ms min=1.67ms  med=19.71ms  max=305.67ms p(90)=36.95ms p(95)=44.86ms  p(99.9)=98.7ms  
     http_reqs......................: 253589  2109.200887/s
     iteration_duration.............: avg=23.66ms min=2.16ms  med=21.08ms  max=364.97ms p(90)=38.75ms p(95)=46.83ms  p(99.9)=101.8ms 
     iterations.....................: 253489  2108.369147/s
     success_rate...................: 100.00% ✓ 253489      ✗ 0     
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

     checks.........................: 100.00% ✓ 741840      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 297 MB  2.5 MB/s
     http_req_blocked...............: avg=3.53µs   min=982ns   med=2.55µs   max=11.6ms   p(90)=4.1µs   p(95)=4.86µs   p(99.9)=36.37µs 
     http_req_connecting............: avg=482ns    min=0s      med=0s       max=4.66ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.01ms  min=1.8ms   med=17.87ms  max=370.98ms p(90)=47.16ms p(95)=63.1ms   p(99.9)=156.77ms
       { expected_response:true }...: avg=24.01ms  min=1.8ms   med=17.87ms  max=370.98ms p(90)=47.16ms p(95)=63.1ms   p(99.9)=156.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 247380
     http_req_receiving.............: avg=934.88µs min=51.65µs med=123.13µs max=301.17ms p(90)=1.61ms  p(95)=2.61ms   p(99.9)=59.3ms  
     http_req_sending...............: avg=46.27µs  min=5.23µs  med=10.15µs  max=31.37ms  p(90)=18.7µs  p(95)=115.52µs p(99.9)=3.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.03ms  min=1.71ms  med=17.08ms  max=257.46ms p(90)=45.41ms p(95)=61.28ms  p(99.9)=151.48ms
     http_reqs......................: 247380  2057.559667/s
     iteration_duration.............: avg=24.25ms  min=2.49ms  med=18.1ms   max=393.2ms  p(90)=47.42ms p(95)=63.36ms  p(99.9)=158.03ms
     iterations.....................: 247280  2056.727926/s
     success_rate...................: 100.00% ✓ 247280      ✗ 0     
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

     checks.........................: 100.00% ✓ 543498      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 218 MB  1.8 MB/s
     http_req_blocked...............: avg=3.49µs   min=912ns   med=2.32µs  max=11.64ms  p(90)=4.57µs   p(95)=5.72µs   p(99.9)=40.51µs
     http_req_connecting............: avg=416ns    min=0s      med=0s      max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.84ms  min=2.49ms  med=32.08ms max=337.26ms p(90)=43.43ms  p(95)=48.04ms  p(99.9)=84.75ms
       { expected_response:true }...: avg=32.84ms  min=2.49ms  med=32.08ms max=337.26ms p(90)=43.43ms  p(95)=48.04ms  p(99.9)=84.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181266
     http_req_receiving.............: avg=111.17µs min=29.71µs med=60.08µs max=196.42ms p(90)=133.28µs p(95)=278.84µs p(99.9)=5.16ms 
     http_req_sending...............: avg=44.27µs  min=5.38µs  med=10.12µs max=197.78ms p(90)=24.03µs  p(95)=134.48µs p(99.9)=2.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.68ms  min=2.37ms  med=31.94ms max=282.11ms p(90)=43.25ms  p(95)=47.82ms  p(99.9)=84.21ms
     http_reqs......................: 181266  1506.510736/s
     iteration_duration.............: avg=33.11ms  min=3.83ms  med=32.32ms max=356.37ms p(90)=43.66ms  p(95)=48.28ms  p(99.9)=86ms   
     iterations.....................: 181166  1505.679631/s
     success_rate...................: 100.00% ✓ 181166      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 405957      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 163 MB  1.4 MB/s
     http_req_blocked...............: avg=3.49µs  min=1.04µs med=2.58µs  max=28.59ms  p(90)=4.21µs   p(95)=4.88µs   p(99.9)=37.7µs 
     http_req_connecting............: avg=351ns   min=0s     med=0s      max=2.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.07ms min=2.22ms med=43.53ms max=335.09ms p(90)=61.76ms  p(95)=67.31ms  p(99.9)=93.78ms
       { expected_response:true }...: avg=44.07ms min=2.22ms med=43.53ms max=335.09ms p(90)=61.76ms  p(95)=67.31ms  p(99.9)=93.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135419
     http_req_receiving.............: avg=87.1µs  min=30.2µs med=71.69µs max=42.24ms  p(90)=111.26µs p(95)=128.58µs p(99.9)=1.64ms 
     http_req_sending...............: avg=27.49µs min=5.46µs med=11.66µs max=166.24ms p(90)=18.33µs  p(95)=21.92µs  p(99.9)=1.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.96ms min=2.15ms med=43.43ms max=334.87ms p(90)=61.64ms  p(95)=67.18ms  p(99.9)=93.34ms
     http_reqs......................: 135419  1125.747785/s
     iteration_duration.............: avg=44.33ms min=4.47ms med=43.75ms max=347.15ms p(90)=61.97ms  p(95)=67.52ms  p(99.9)=94.36ms
     iterations.....................: 135319  1124.916478/s
     success_rate...................: 100.00% ✓ 135319      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 194967     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   648 kB/s
     http_req_blocked...............: avg=5.24µs  min=1.09µs  med=3.21µs  max=5.19ms   p(90)=4.75µs   p(95)=5.36µs   p(99.9)=47.72µs 
     http_req_connecting............: avg=1.8µs   min=0s      med=0s      max=5.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.95ms min=4.21ms  med=92.46ms max=359.11ms p(90)=121.49ms p(95)=134.4ms  p(99.9)=243.71ms
       { expected_response:true }...: avg=91.95ms min=4.21ms  med=92.46ms max=359.11ms p(90)=121.49ms p(95)=134.4ms  p(99.9)=243.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65089
     http_req_receiving.............: avg=96.07µs min=30.54µs med=80.84µs max=241.94ms p(90)=115.31µs p(95)=128.48µs p(99.9)=824.33µs
     http_req_sending...............: avg=24.42µs min=5.64µs  med=14.21µs max=120.28ms p(90)=20.95µs  p(95)=23.12µs  p(99.9)=663.29µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.83ms min=4.08ms  med=92.35ms max=358.35ms p(90)=121.35ms p(95)=134.27ms p(99.9)=243.36ms
     http_reqs......................: 65089   539.834674/s
     iteration_duration.............: avg=92.34ms min=21.58ms med=92.71ms max=367.91ms p(90)=121.75ms p(95)=134.77ms p(99.9)=245.57ms
     iterations.....................: 64989   539.005294/s
     success_rate...................: 100.00% ✓ 64989      ✗ 0    
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

     checks.........................: 100.00% ✓ 142545     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   474 kB/s
     http_req_blocked...............: avg=5.69µs   min=1.13µs  med=3.57µs   max=3.94ms   p(90)=5µs      p(95)=5.57µs   p(99.9)=274.4µs 
     http_req_connecting............: avg=1.94µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=158.8µs 
     http_req_duration..............: avg=125.76ms min=5.72ms  med=123.41ms max=365.15ms p(90)=166.37ms p(95)=178.72ms p(99.9)=231.51ms
       { expected_response:true }...: avg=125.76ms min=5.72ms  med=123.41ms max=365.15ms p(90)=166.37ms p(95)=178.72ms p(99.9)=231.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47615
     http_req_receiving.............: avg=97.15µs  min=31.59µs med=88.34µs  max=82.7ms   p(90)=120.1µs  p(95)=132.82µs p(99.9)=721.2µs 
     http_req_sending...............: avg=26.81µs  min=5.88µs  med=16.81µs  max=74.91ms  p(90)=22.16µs  p(95)=24.1µs   p(99.9)=885.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.64ms min=5.6ms   med=123.29ms max=356.78ms p(90)=166.24ms p(95)=178.59ms p(99.9)=231.42ms
     http_reqs......................: 47615   394.44725/s
     iteration_duration.............: avg=126.3ms  min=31.15ms med=123.77ms max=376.38ms p(90)=166.68ms p(95)=179.11ms p(99.9)=234.03ms
     iterations.....................: 47515   393.618841/s
     success_rate...................: 100.00% ✓ 47515      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88524      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=7.08µs   min=1.26µs  med=3.61µs   max=3.98ms   p(90)=5.03µs   p(95)=5.64µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=3.26µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=202.54ms min=6.45ms  med=206.44ms max=751.3ms  p(90)=281.22ms p(95)=341.73ms p(99.9)=667.56ms
       { expected_response:true }...: avg=202.54ms min=6.45ms  med=206.44ms max=751.3ms  p(90)=281.22ms p(95)=341.73ms p(99.9)=667.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29608
     http_req_receiving.............: avg=104.15µs min=35.45µs med=97.12µs  max=74.68ms  p(90)=129.34µs p(95)=142.4µs  p(99.9)=833.28µs
     http_req_sending...............: avg=26.85µs  min=6.2µs   med=18.23µs  max=70.29ms  p(90)=23.1µs   p(95)=24.83µs  p(99.9)=600.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.4ms  min=6.36ms  med=206.31ms max=751.2ms  p(90)=281.04ms p(95)=341.62ms p(99.9)=667.44ms
     http_reqs......................: 29608   244.649851/s
     iteration_duration.............: avg=203.49ms min=17.94ms med=206.9ms  max=751.49ms p(90)=281.82ms p(95)=344.95ms p(99.9)=667.86ms
     iterations.....................: 29508   243.823554/s
     success_rate...................: 100.00% ✓ 29508      ✗ 0    
     vus............................: 9       min=9        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85641      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=7.37µs   min=1.31µs  med=3.42µs   max=4.14ms   p(90)=4.7µs    p(95)=5.25µs   p(99.9)=1.93ms  
     http_req_connecting............: avg=3.79µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=209.35ms min=8.7ms   med=212.41ms max=427.05ms p(90)=224.37ms p(95)=228.96ms p(99.9)=309.04ms
       { expected_response:true }...: avg=209.35ms min=8.7ms   med=212.41ms max=427.05ms p(90)=224.37ms p(95)=228.96ms p(99.9)=309.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28647
     http_req_receiving.............: avg=103.58µs min=34.56µs med=92.18µs  max=84.11ms  p(90)=124.21µs p(95)=137.34µs p(99.9)=582.09µs
     http_req_sending...............: avg=31.89µs  min=6.1µs   med=17.1µs   max=126.96ms p(90)=21.93µs  p(95)=23.75µs  p(99.9)=606.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.22ms min=8.55ms  med=212.29ms max=426.76ms p(90)=224.25ms p(95)=228.83ms p(99.9)=308.93ms
     http_reqs......................: 28647   236.494374/s
     iteration_duration.............: avg=210.35ms min=42.59ms med=212.68ms max=436.46ms p(90)=224.62ms p(95)=229.24ms p(99.9)=311.82ms
     iterations.....................: 28547   235.668828/s
     success_rate...................: 100.00% ✓ 28547      ✗ 0    
     vus............................: 48      min=48       max=50 
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

     checks.........................: 100.00% ✓ 8754      ✗ 0   
     data_received..................: 289 MB  2.3 MB/s
     data_sent......................: 3.6 MB  29 kB/s
     http_req_blocked...............: avg=83.14µs  min=1.42µs   med=3.86µs   max=9.12ms p(90)=5.54µs   p(95)=6.3µs    p(99.9)=8.3ms   
     http_req_connecting............: avg=77.54µs  min=0s       med=0s       max=9.08ms p(90)=0s       p(95)=0s       p(99.9)=8.25ms  
     http_req_duration..............: avg=2s       min=24.82ms  med=2.02s    max=4.13s  p(90)=2.87s    p(95)=3.12s    p(99.9)=3.93s   
       { expected_response:true }...: avg=2s       min=24.82ms  med=2.02s    max=4.13s  p(90)=2.87s    p(95)=3.12s    p(99.9)=3.93s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 3018
     http_req_receiving.............: avg=111.51µs min=34.17µs  med=109.08µs max=1.82ms p(90)=148.69µs p(95)=162.67µs p(99.9)=518.66µs
     http_req_sending...............: avg=99.72µs  min=6.66µs   med=20.76µs  max=25.3ms p(90)=25.48µs  p(95)=27.69µs  p(99.9)=8.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2s       min=24.7ms   med=2.02s    max=4.13s  p(90)=2.87s    p(95)=3.11s    p(99.9)=3.93s   
     http_reqs......................: 3018    24.105491/s
     iteration_duration.............: avg=2.07s    min=142.92ms med=2.05s    max=4.13s  p(90)=2.89s    p(95)=3.13s    p(99.9)=3.93s   
     iterations.....................: 2918    23.306767/s
     success_rate...................: 100.00% ✓ 2918      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

