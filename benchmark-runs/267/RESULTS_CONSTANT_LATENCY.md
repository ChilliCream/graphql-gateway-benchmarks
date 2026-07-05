## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 1,870 | 1,920 | 1,859 | 1.1% |  |
| fusion | 16.3.0 | 1,834 | 1,883 | 1,827 | 1.0% |  |
| fusion-nightly | 16.4.0-p.14 | 1,834 | 1,872 | 1,824 | 0.8% |  |
| fusion-nightly-net11 | 16.4.0-p.14 | 1,819 | 1,863 | 1,810 | 1.0% |  |
| grafbase | 0.53.5 | 1,301 | 1,333 | 1,291 | 1.0% |  |
| cosmo | 0.326.1 | 1,251 | 1,293 | 1,245 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.0 | 545 | 570 | 543 | 1.6% |  |
| apollo-router | v2.15.1 | 434 | 454 | 431 | 2.0% |  |
| apollo-gateway | 2.14.2 | 262 | 266 | 261 | 0.7% |  |
| hive-gateway | 2.10.0 | 257 | 264 | 256 | 1.0% |  |
| feddi | 77271dc84a06 | 15 | 16 | 15 | 2.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683826      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.23µs  min=901ns   med=2.44µs  max=3.93ms   p(90)=4.15µs  p(95)=4.91µs   p(99.9)=36.42µs
     http_req_connecting............: avg=414ns   min=0s      med=0s      max=3.89ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.09ms min=17.42ms med=25.63ms max=286.11ms p(90)=29.74ms p(95)=31.16ms  p(99.9)=47.44ms
       { expected_response:true }...: avg=26.09ms min=17.42ms med=25.63ms max=286.11ms p(90)=29.74ms p(95)=31.16ms  p(99.9)=47.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228042
     http_req_receiving.............: avg=78.12µs min=25.78µs med=52.69µs max=152.88ms p(90)=97.41µs p(95)=124.58µs p(99.9)=2.21ms 
     http_req_sending...............: avg=34.64µs min=4.51µs  med=10.13µs max=120.72ms p(90)=19.04µs p(95)=27.21µs  p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=25.98ms min=17.28ms med=25.54ms max=285.96ms p(90)=29.62ms p(95)=31.03ms  p(99.9)=46.08ms
     http_reqs......................: 228042  1870.030574/s
     iteration_duration.............: avg=26.31ms min=17.62ms med=25.84ms max=315.07ms p(90)=29.95ms p(95)=31.37ms  p(99.9)=47.89ms
     iterations.....................: 227942  1869.210536/s
     success_rate...................: 100.00% ✓ 227942      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 670839      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.94µs   min=892ns   med=2.03µs  max=7.93ms   p(90)=3.77µs   p(95)=4.51µs  p(99.9)=34.77µs
     http_req_connecting............: avg=432ns    min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.6ms   min=17.41ms med=26.03ms max=308.24ms p(90)=31.04ms  p(95)=32.89ms p(99.9)=51.28ms
       { expected_response:true }...: avg=26.6ms   min=17.41ms med=26.03ms max=308.24ms p(90)=31.04ms  p(95)=32.89ms p(99.9)=51.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223713
     http_req_receiving.............: avg=331.73µs min=50.03µs med=96.1µs  max=236.17ms p(90)=810.44µs p(95)=1.3ms   p(99.9)=7.72ms 
     http_req_sending...............: avg=32.26µs  min=4.74µs  med=8.83µs  max=200.21ms p(90)=19.4µs   p(95)=29.89µs p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.24ms  min=17.31ms med=25.7ms  max=247.42ms p(90)=30.63ms  p(95)=32.45ms p(99.9)=50.19ms
     http_reqs......................: 223713  1834.364212/s
     iteration_duration.............: avg=26.82ms  min=17.62ms med=26.24ms max=321.49ms p(90)=31.25ms  p(95)=33.1ms  p(99.9)=51.61ms
     iterations.....................: 223613  1833.544249/s
     success_rate...................: 100.00% ✓ 223613      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 670746      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.74µs   min=862ns   med=1.92µs   max=4.11ms   p(90)=3.47µs   p(95)=4.19µs  p(99.9)=29.39µs
     http_req_connecting............: avg=408ns    min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.62ms  min=17.81ms med=26.03ms  max=303.72ms p(90)=31.19ms  p(95)=33.09ms p(99.9)=48.44ms
       { expected_response:true }...: avg=26.62ms  min=17.81ms med=26.03ms  max=303.72ms p(90)=31.19ms  p(95)=33.09ms p(99.9)=48.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223682
     http_req_receiving.............: avg=342.85µs min=50.55µs med=101.68µs max=224.22ms p(90)=878.78µs p(95)=1.35ms  p(99.9)=7.49ms 
     http_req_sending...............: avg=28.06µs  min=4.55µs  med=8.46µs   max=86.52ms  p(90)=17.67µs  p(95)=26.72µs p(99.9)=1.39ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.24ms  min=17.43ms med=25.68ms  max=299.54ms p(90)=30.75ms  p(95)=32.61ms p(99.9)=46.81ms
     http_reqs......................: 223682  1834.4868/s
     iteration_duration.............: avg=26.82ms  min=17.99ms med=26.23ms  max=323.8ms  p(90)=31.38ms  p(95)=33.29ms p(99.9)=48.8ms 
     iterations.....................: 223582  1833.666668/s
     success_rate...................: 100.00% ✓ 223582      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 665421      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.71µs   min=842ns   med=1.89µs  max=4.04ms   p(90)=3.48µs   p(95)=4.22µs  p(99.9)=26.51µs
     http_req_connecting............: avg=420ns    min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.83ms  min=17.74ms med=26.28ms max=299.9ms  p(90)=31.16ms  p(95)=33ms    p(99.9)=50.07ms
       { expected_response:true }...: avg=26.83ms  min=17.74ms med=26.28ms max=299.9ms  p(90)=31.16ms  p(95)=33ms    p(99.9)=50.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221907
     http_req_receiving.............: avg=344.15µs min=49.1µs  med=93.95µs max=42.61ms  p(90)=922.54µs p(95)=1.46ms  p(99.9)=8.47ms 
     http_req_sending...............: avg=31.11µs  min=4.25µs  med=8.11µs  max=239.7ms  p(90)=17.76µs  p(95)=26.88µs p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.45ms  min=17.61ms med=25.93ms max=299.24ms p(90)=30.7ms   p(95)=32.48ms p(99.9)=48.22ms
     http_reqs......................: 221907  1819.965976/s
     iteration_duration.............: avg=27.04ms  min=17.98ms med=26.48ms max=308.56ms p(90)=31.36ms  p(95)=33.2ms  p(99.9)=50.6ms 
     iterations.....................: 221807  1819.145828/s
     success_rate...................: 100.00% ✓ 221807      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 475845      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3.94µs  min=942ns   med=2.86µs  max=6.9ms    p(90)=5.17µs   p(95)=6.17µs  p(99.9)=43.91µs
     http_req_connecting............: avg=543ns   min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=37.55ms min=17.93ms med=37.25ms max=306.79ms p(90)=44.24ms  p(95)=46.34ms p(99.9)=60.97ms
       { expected_response:true }...: avg=37.55ms min=17.93ms med=37.25ms max=306.79ms p(90)=44.24ms  p(95)=46.34ms p(99.9)=60.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158715
     http_req_receiving.............: avg=94.03µs min=26.8µs  med=61.05µs max=219.53ms p(90)=128.06µs p(95)=179.3µs p(99.9)=2.13ms 
     http_req_sending...............: avg=37.2µs  min=4.64µs  med=11.37µs max=167.04ms p(90)=25.18µs  p(95)=75.78µs p(99.9)=2.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=37.42ms min=17.83ms med=37.13ms max=306.18ms p(90)=44.1ms   p(95)=46.19ms p(99.9)=60.23ms
     http_reqs......................: 158715  1301.156535/s
     iteration_duration.............: avg=37.81ms min=21.12ms med=37.49ms max=320.91ms p(90)=44.46ms  p(95)=46.56ms p(99.9)=61.4ms 
     iterations.....................: 158615  1300.336728/s
     success_rate...................: 100.00% ✓ 158615      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 457797      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.89µs  min=1.05µs  med=2.96µs  max=3.89ms   p(90)=4.67µs  p(95)=5.45µs   p(99.9)=38.48µs
     http_req_connecting............: avg=601ns   min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.07ms min=18.39ms med=38.47ms max=313.07ms p(90)=47ms    p(95)=49.7ms   p(99.9)=65.34ms
       { expected_response:true }...: avg=39.07ms min=18.39ms med=38.47ms max=313.07ms p(90)=47ms    p(95)=49.7ms   p(99.9)=65.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152699
     http_req_receiving.............: avg=85.34µs min=28.54µs med=68.6µs  max=61.45ms  p(90)=110.6µs p(95)=129.96µs p(99.9)=1.18ms 
     http_req_sending...............: avg=27.79µs min=4.89µs  med=12.52µs max=143.34ms p(90)=20µs    p(95)=24.53µs  p(99.9)=1.02ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.95ms min=18.27ms med=38.37ms max=302.98ms p(90)=46.89ms p(95)=49.56ms  p(99.9)=65.06ms
     http_reqs......................: 152699  1251.711322/s
     iteration_duration.............: avg=39.31ms min=22.14ms med=38.7ms  max=322.28ms p(90)=47.22ms p(95)=49.91ms  p(99.9)=65.68ms
     iterations.....................: 152599  1250.891597/s
     success_rate...................: 100.00% ✓ 152599      ✗ 0     
     vus............................: 14      min=0         max=50  
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

     checks.........................: 100.00% ✓ 199683     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   655 kB/s
     http_req_blocked...............: avg=5.05µs  min=1.25µs  med=3.3µs   max=4ms      p(90)=4.85µs   p(95)=5.56µs   p(99.9)=49.89µs 
     http_req_connecting............: avg=1.46µs  min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.78ms min=20.85ms med=88.19ms max=319.49ms p(90)=107.39ms p(95)=116.68ms p(99.9)=206.89ms
       { expected_response:true }...: avg=89.78ms min=20.85ms med=88.19ms max=319.49ms p(90)=107.39ms p(95)=116.68ms p(99.9)=206.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66661
     http_req_receiving.............: avg=86.52µs min=31.52µs med=79.5µs  max=9.07ms   p(90)=115.04µs p(95)=128.61µs p(99.9)=675.9µs 
     http_req_sending...............: avg=25.81µs min=5.36µs  med=15.27µs max=112.22ms p(90)=21.56µs  p(95)=23.79µs  p(99.9)=626.53µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.66ms min=20.69ms med=88.08ms max=318.84ms p(90)=107.28ms p(95)=116.52ms p(99.9)=206.72ms
     http_reqs......................: 66661   545.203623/s
     iteration_duration.............: avg=90.15ms min=35.48ms med=88.46ms max=330.43ms p(90)=107.66ms p(95)=117ms    p(99.9)=208.74ms
     iterations.....................: 66561   544.385748/s
     success_rate...................: 100.00% ✓ 66561      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 159090     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   521 kB/s
     http_req_blocked...............: avg=5.66µs   min=1.41µs  med=3.75µs   max=3.53ms   p(90)=5.37µs   p(95)=6.03µs   p(99.9)=75.22µs 
     http_req_connecting............: avg=1.63µs   min=0s      med=0s       max=3.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.7ms  min=20.5ms  med=110.76ms max=333.64ms p(90)=140.64ms p(95)=149.78ms p(99.9)=190.95ms
       { expected_response:true }...: avg=112.7ms  min=20.5ms  med=110.76ms max=333.64ms p(90)=140.64ms p(95)=149.78ms p(99.9)=190.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53130
     http_req_receiving.............: avg=93.53µs  min=31.27µs med=86.08µs  max=75.93ms  p(90)=118.13µs p(95)=130.9µs  p(99.9)=617.01µs
     http_req_sending...............: avg=28.99µs  min=6.2µs   med=18.87µs  max=110.36ms p(90)=24.55µs  p(95)=26.73µs  p(99.9)=561.88µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.57ms min=20.35ms med=110.65ms max=332.98ms p(90)=140.51ms p(95)=149.65ms p(99.9)=190.45ms
     http_reqs......................: 53130   434.238139/s
     iteration_duration.............: avg=113.16ms min=35.29ms med=111.08ms max=341.67ms p(90)=140.97ms p(95)=150.1ms  p(99.9)=192.66ms
     iterations.....................: 53030   433.420827/s
     success_rate...................: 100.00% ✓ 53030      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 96300      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=6.97µs   min=1.25µs  med=3.76µs   max=3.96ms   p(90)=5.31µs   p(95)=5.9µs    p(99.9)=1.38ms  
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=186.21ms min=22.79ms med=185.91ms max=394.28ms p(90)=198.9ms  p(95)=203.8ms  p(99.9)=272.98ms
       { expected_response:true }...: avg=186.21ms min=22.79ms med=185.91ms max=394.28ms p(90)=198.9ms  p(95)=203.8ms  p(99.9)=272.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32200
     http_req_receiving.............: avg=100.68µs min=37.08µs med=91.95µs  max=66.39ms  p(90)=124.42µs p(95)=136.93µs p(99.9)=528.38µs
     http_req_sending...............: avg=30.26µs  min=5.92µs  med=18.89µs  max=90.51ms  p(90)=23.99µs  p(95)=25.91µs  p(99.9)=491.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.08ms min=22.69ms med=185.8ms  max=394.13ms p(90)=198.76ms p(95)=203.66ms p(99.9)=272.34ms
     http_reqs......................: 32200   262.465838/s
     iteration_duration.............: avg=187.05ms min=61.62ms med=186.25ms max=411.31ms p(90)=199.2ms  p(95)=204.12ms p(99.9)=277.22ms
     iterations.....................: 32100   261.650727/s
     success_rate...................: 100.00% ✓ 32100      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 94161      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=6.43µs   min=1.11µs  med=3.15µs   max=4.1ms    p(90)=4.48µs   p(95)=5.02µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=3.06µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=190.43ms min=17.92ms med=179.1ms  max=660.93ms p(90)=223.77ms p(95)=254.65ms p(99.9)=561.59ms
       { expected_response:true }...: avg=190.43ms min=17.92ms med=179.1ms  max=660.93ms p(90)=223.77ms p(95)=254.65ms p(99.9)=561.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31487
     http_req_receiving.............: avg=91.17µs  min=31.28µs med=88.5µs   max=8.75ms   p(90)=118.53µs p(95)=131.38µs p(99.9)=621.43µs
     http_req_sending...............: avg=26.29µs  min=5.15µs  med=17.03µs  max=51.87ms  p(90)=21.43µs  p(95)=23.29µs  p(99.9)=478.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.31ms min=17.79ms med=178.97ms max=660.81ms p(90)=223.66ms p(95)=254.55ms p(99.9)=561.49ms
     http_reqs......................: 31487   257.666777/s
     iteration_duration.............: avg=191.27ms min=55.65ms med=179.47ms max=661.19ms p(90)=224.19ms p(95)=256.39ms p(99.9)=561.93ms
     iterations.....................: 31387   256.848449/s
     success_rate...................: 100.00% ✓ 31387      ✗ 0    
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

     checks.........................: 100.00% ✓ 5760      ✗ 0   
     data_received..................: 193 MB  1.5 MB/s
     data_sent......................: 2.4 MB  19 kB/s
     http_req_blocked...............: avg=38.02µs min=1.27µs  med=3.13µs  max=8.98ms p(90)=4.72µs   p(95)=5.87µs   p(99.9)=2.74ms  
     http_req_connecting............: avg=27.57µs min=0s      med=0s      max=2.89ms p(90)=0s       p(95)=0s       p(99.9)=2.51ms  
     http_req_duration..............: avg=3s      min=48.16ms med=3.1s    max=13.8s  p(90)=3.95s    p(95)=4.14s    p(99.9)=12.5s   
       { expected_response:true }...: avg=3s      min=48.16ms med=3.1s    max=13.8s  p(90)=3.95s    p(95)=4.14s    p(99.9)=12.5s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2020
     http_req_receiving.............: avg=94.15µs min=34.32µs med=90.78µs max=1.38ms p(90)=128.63µs p(95)=142.11µs p(99.9)=331.03µs
     http_req_sending...............: avg=40.06µs min=5.87µs  med=17.71µs max=8.41ms p(90)=22.74µs  p(95)=28.69µs  p(99.9)=2.7ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=3s      min=48.02ms med=3.1s    max=13.8s  p(90)=3.95s    p(95)=4.14s    p(99.9)=12.5s   
     http_reqs......................: 2020    15.80567/s
     iteration_duration.............: avg=3.16s   min=1.06s   med=3.13s   max=13.81s p(90)=3.97s    p(95)=4.16s    p(99.9)=12.56s  
     iterations.....................: 1920    15.023211/s
     success_rate...................: 100.00% ✓ 1920      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

