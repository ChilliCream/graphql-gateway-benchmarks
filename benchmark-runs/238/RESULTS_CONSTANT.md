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
| hive-router | v0.0.72 | 2,845 | 3,046 | 2,822 | 2.6% |  |
| fusion | 16.2.3 | 2,186 | 2,242 | 2,181 | 0.9% |  |
| fusion-nightly | 16.4.0-p.1 | 2,173 | 2,227 | 2,157 | 1.1% |  |
| grafbase | 0.53.5 | 2,083 | 2,147 | 2,067 | 1.2% |  |
| cosmo | 0.326.0 | 1,158 | 1,181 | 1,148 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 550 | 565 | 544 | 1.3% |  |
| apollo-router | v2.15.1 | 443 | 454 | 439 | 1.1% |  |
| apollo-gateway | 2.14.1 | 246 | 249 | 245 | 0.5% |  |
| hive-gateway | 2.9.0 | 239 | 243 | 237 | 0.8% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,282 | 2,420 | 2,251 | 2.5% |  |
| fusion-nightly | 16.4.0-p.1 | 2,030 | 2,079 | 2,020 | 1.0% |  |
| fusion | 16.2.3 | 1,989 | 2,043 | 1,975 | 1.2% |  |
| grafbase | 0.53.5 | 1,516 | 1,531 | 1,508 | 0.5% |  |
| cosmo | 0.326.0 | 1,123 | 1,146 | 1,117 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 536 | 550 | 529 | 1.1% |  |
| apollo-router | v2.15.1 | 413 | 423 | 409 | 1.1% |  |
| hive-gateway | 2.9.0 | 242 | 247 | 238 | 1.2% |  |
| apollo-gateway | 2.14.1 | 236 | 240 | 233 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1025928     ✗ 0     
     data_received..................: 30 GB   250 MB/s
     data_sent......................: 411 MB  3.4 MB/s
     http_req_blocked...............: avg=3.23µs  min=1µs     med=2.28µs  max=18.39ms  p(90)=3.47µs  p(95)=4.1µs    p(99.9)=35.85µs
     http_req_connecting............: avg=296ns   min=0s      med=0s      max=4.79ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.3ms  min=1.66ms  med=16.38ms max=329ms    p(90)=25.96ms p(95)=29.72ms  p(99.9)=52.57ms
       { expected_response:true }...: avg=17.3ms  min=1.66ms  med=16.38ms max=329ms    p(90)=25.96ms p(95)=29.72ms  p(99.9)=52.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 342076
     http_req_receiving.............: avg=128µs   min=28.59µs med=52.17µs max=116.19ms p(90)=99.69µs p(95)=274.51µs p(99.9)=12.31ms
     http_req_sending...............: avg=61.87µs min=5.2µs   med=9.24µs  max=165.1ms  p(90)=15.73µs p(95)=123.1µs  p(99.9)=14.24ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.11ms min=1.58ms  med=16.22ms max=327.98ms p(90)=25.7ms  p(95)=29.35ms  p(99.9)=50.97ms
     http_reqs......................: 342076  2845.817167/s
     iteration_duration.............: avg=17.53ms min=2.12ms  med=16.58ms max=367.55ms p(90)=26.19ms p(95)=29.98ms  p(99.9)=53.61ms
     iterations.....................: 341976  2844.985242/s
     success_rate...................: 100.00% ✓ 341976      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 788646      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 316 MB  2.6 MB/s
     http_req_blocked...............: avg=3.05µs   min=1.02µs  med=2.36µs   max=17.05ms  p(90)=3.59µs  p(95)=4.23µs   p(99.9)=36.06µs 
     http_req_connecting............: avg=268ns    min=0s      med=0s       max=4.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.57ms  min=2.47ms  med=15.13ms  max=337.6ms  p(90)=48.39ms p(95)=65.91ms  p(99.9)=162.35ms
       { expected_response:true }...: avg=22.57ms  min=2.47ms  med=15.13ms  max=337.6ms  p(90)=48.39ms p(95)=65.91ms  p(99.9)=162.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262982
     http_req_receiving.............: avg=928.99µs min=52.82µs med=127.68µs max=275.08ms p(90)=1.39ms  p(95)=2.27ms   p(99.9)=60.88ms 
     http_req_sending...............: avg=47.25µs  min=5.31µs  med=9.59µs   max=181.93ms p(90)=16.67µs p(95)=114.09µs p(99.9)=3.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.6ms   min=2.37ms  med=14.34ms  max=337.51ms p(90)=46.59ms p(95)=63.92ms  p(99.9)=159.65ms
     http_reqs......................: 262982  2186.046778/s
     iteration_duration.............: avg=22.81ms  min=3.2ms   med=15.35ms  max=345.88ms p(90)=48.64ms p(95)=66.17ms  p(99.9)=163.68ms
     iterations.....................: 262882  2185.215524/s
     success_rate...................: 100.00% ✓ 262882      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 783825      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=3.31µs  min=1.02µs med=2.35µs   max=14.27ms  p(90)=3.57µs  p(95)=4.18µs   p(99.9)=33.68µs 
     http_req_connecting............: avg=394ns   min=0s     med=0s       max=4.05ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.71ms min=2.3ms  med=19.37ms  max=294.29ms p(90)=38.95ms p(95)=48.58ms  p(99.9)=114.67ms
       { expected_response:true }...: avg=22.71ms min=2.3ms  med=19.37ms  max=294.29ms p(90)=38.95ms p(95)=48.58ms  p(99.9)=114.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261375
     http_req_receiving.............: avg=1.05ms  min=51.6µs med=319.13µs max=97.84ms  p(90)=2.21ms  p(95)=3.3ms    p(99.9)=39.23ms 
     http_req_sending...............: avg=47.46µs min=5.44µs med=9.54µs   max=151.05ms p(90)=16.69µs p(95)=115.58µs p(99.9)=4.13ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.61ms min=2.18ms med=18.28ms  max=293.7ms  p(90)=37.4ms  p(95)=46.8ms   p(99.9)=112.68ms
     http_reqs......................: 261375  2173.30465/s
     iteration_duration.............: avg=22.95ms min=3.05ms med=19.6ms   max=343.46ms p(90)=39.2ms  p(95)=48.84ms  p(99.9)=115.65ms
     iterations.....................: 261275  2172.473161/s
     success_rate...................: 100.00% ✓ 261275      ✗ 0     
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

     checks.........................: 100.00% ✓ 751536      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 301 MB  2.5 MB/s
     http_req_blocked...............: avg=4.33µs   min=911ns   med=2.69µs  max=16.17ms  p(90)=4.2µs    p(95)=4.98µs   p(99.9)=44.63µs
     http_req_connecting............: avg=1.02µs   min=0s      med=0s      max=11.44ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.69ms  min=1.95ms  med=23.43ms max=330.5ms  p(90)=28.72ms  p(95)=31.4ms   p(99.9)=54.57ms
       { expected_response:true }...: avg=23.69ms  min=1.95ms  med=23.43ms max=330.5ms  p(90)=28.72ms  p(95)=31.4ms   p(99.9)=54.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 250612
     http_req_receiving.............: avg=138.44µs min=30.26µs med=60.53µs max=203.11ms p(90)=107.48µs p(95)=239.8µs  p(99.9)=11.25ms
     http_req_sending...............: avg=56.86µs  min=4.96µs  med=10.8µs  max=113.57ms p(90)=18.87µs  p(95)=125.45µs p(99.9)=6.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.5ms   min=1.85ms  med=23.31ms max=132.04ms p(90)=28.51ms  p(95)=31.08ms  p(99.9)=52.91ms
     http_reqs......................: 250612  2083.980488/s
     iteration_duration.............: avg=23.94ms  min=3.26ms  med=23.65ms max=350.33ms p(90)=28.95ms  p(95)=31.67ms  p(99.9)=55.09ms
     iterations.....................: 250512  2083.148932/s
     success_rate...................: 100.00% ✓ 250512      ✗ 0     
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

     checks.........................: 100.00% ✓ 417795      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.13µs  min=1.07µs  med=2.53µs  max=2.27ms   p(90)=3.93µs   p(95)=4.56µs   p(99.9)=35.93µs
     http_req_connecting............: avg=284ns   min=0s      med=0s      max=2.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.83ms min=2.15ms  med=42.27ms max=334.94ms p(90)=60.46ms  p(95)=66.03ms  p(99.9)=93.55ms
       { expected_response:true }...: avg=42.83ms min=2.15ms  med=42.27ms max=334.94ms p(90)=60.46ms  p(95)=66.03ms  p(99.9)=93.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139365
     http_req_receiving.............: avg=90.19µs min=30.64µs med=67.35µs max=260.63ms p(90)=104.27µs p(95)=122.32µs p(99.9)=2.08ms 
     http_req_sending...............: avg=25.99µs min=5.32µs  med=11.13µs max=86.25ms  p(90)=16.5µs   p(95)=20.33µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.72ms min=2.02ms  med=42.16ms max=329.02ms p(90)=60.34ms  p(95)=65.9ms   p(99.9)=92.85ms
     http_reqs......................: 139365  1158.573189/s
     iteration_duration.............: avg=43.08ms min=3.88ms  med=42.47ms max=342.46ms p(90)=60.66ms  p(95)=66.24ms  p(99.9)=94.15ms
     iterations.....................: 139265  1157.741866/s
     success_rate...................: 100.00% ✓ 139265      ✗ 0     
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

     checks.........................: 100.00% ✓ 198765     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   661 kB/s
     http_req_blocked...............: avg=4.85µs  min=1.09µs  med=2.86µs  max=4.34ms   p(90)=4.43µs   p(95)=5.04µs   p(99.9)=47.01µs 
     http_req_connecting............: avg=1.62µs  min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.2ms  min=4.04ms  med=89.11ms max=356.72ms p(90)=112.84ms p(95)=124.26ms p(99.9)=217.36ms
       { expected_response:true }...: avg=90.2ms  min=4.04ms  med=89.11ms max=356.72ms p(90)=112.84ms p(95)=124.26ms p(99.9)=217.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66355
     http_req_receiving.............: avg=87.45µs min=31.81µs med=77.81µs max=63.59ms  p(90)=112.78µs p(95)=126.58µs p(99.9)=940.93µs
     http_req_sending...............: avg=24.06µs min=5.8µs   med=13.14µs max=130.54ms p(90)=19.85µs  p(95)=22.19µs  p(99.9)=660.8µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.09ms min=3.92ms  med=89ms    max=346.61ms p(90)=112.71ms p(95)=124.12ms p(99.9)=216.97ms
     http_reqs......................: 66355   550.540611/s
     iteration_duration.............: avg=90.57ms min=22.7ms  med=89.35ms max=363.58ms p(90)=113.11ms p(95)=124.53ms p(99.9)=220.08ms
     iterations.....................: 66255   549.710921/s
     success_rate...................: 100.00% ✓ 66255      ✗ 0    
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

     checks.........................: 100.00% ✓ 160239     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   533 kB/s
     http_req_blocked...............: avg=5.18µs   min=1.11µs  med=3.39µs   max=3.77ms   p(90)=4.81µs   p(95)=5.37µs   p(99.9)=62.78µs 
     http_req_connecting............: avg=1.62µs   min=0s      med=0s       max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.89ms min=5.31ms  med=111.7ms  max=347.06ms p(90)=134.84ms p(95)=141.54ms p(99.9)=171.8ms 
       { expected_response:true }...: avg=111.89ms min=5.31ms  med=111.7ms  max=347.06ms p(90)=134.84ms p(95)=141.54ms p(99.9)=171.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 53513
     http_req_receiving.............: avg=94.96µs  min=32.37µs med=85.9µs   max=90.25ms  p(90)=116.92µs p(95)=129.44µs p(99.9)=678.01µs
     http_req_sending...............: avg=22.62µs  min=5.83µs  med=16.09µs  max=43ms     p(90)=21.47µs  p(95)=23.34µs  p(99.9)=614.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.77ms min=5.18ms  med=111.6ms  max=296.73ms p(90)=134.72ms p(95)=141.43ms p(99.9)=171.64ms
     http_reqs......................: 53513   443.458702/s
     iteration_duration.............: avg=112.36ms min=23.47ms med=111.98ms max=357.98ms p(90)=135.11ms p(95)=141.8ms  p(99.9)=173.01ms
     iterations.....................: 53413   442.630009/s
     success_rate...................: 100.00% ✓ 53413      ✗ 0    
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

     checks.........................: 100.00% ✓ 89223      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=14.58µs  min=1.27µs  med=3.32µs   max=10.14ms  p(90)=4.49µs   p(95)=5µs      p(99.9)=5.98ms  
     http_req_connecting............: avg=10.85µs  min=0s      med=0s       max=10.01ms  p(90)=0s       p(95)=0s       p(99.9)=5.86ms  
     http_req_duration..............: avg=200.9ms  min=8.37ms  med=198.83ms max=420.9ms  p(90)=215.11ms p(95)=219.92ms p(99.9)=299.04ms
       { expected_response:true }...: avg=200.9ms  min=8.37ms  med=198.83ms max=420.9ms  p(90)=215.11ms p(95)=219.92ms p(99.9)=299.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29841
     http_req_receiving.............: avg=97.92µs  min=34.26µs med=89.83µs  max=142.25ms p(90)=119.42µs p(95)=130.57µs p(99.9)=534.11µs
     http_req_sending...............: avg=36.06µs  min=6.07µs  med=16.37µs  max=148.13ms p(90)=20.74µs  p(95)=22.38µs  p(99.9)=637.77µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.77ms min=8.28ms  med=198.7ms  max=420.17ms p(90)=215ms    p(95)=219.79ms p(99.9)=298.31ms
     http_reqs......................: 29841   246.502268/s
     iteration_duration.............: avg=201.85ms min=29.12ms med=199.9ms  max=435.18ms p(90)=215.37ms p(95)=220.2ms  p(99.9)=302.57ms
     iterations.....................: 29741   245.676216/s
     success_rate...................: 100.00% ✓ 29741      ✗ 0    
     vus............................: 34      min=34       max=50 
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

     checks.........................: 100.00% ✓ 86640      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=5.12µs   min=1.35µs  med=3.59µs   max=1.99ms   p(90)=5.01µs   p(95)=5.67µs   p(99.9)=550.09µs
     http_req_connecting............: avg=1.31µs   min=0s      med=0s       max=1.96ms   p(90)=0s       p(95)=0s       p(99.9)=505.72µs
     http_req_duration..............: avg=206.92ms min=6.54ms  med=189.19ms max=777.56ms p(90)=237.38ms p(95)=368.4ms  p(99.9)=671.88ms
       { expected_response:true }...: avg=206.92ms min=6.54ms  med=189.19ms max=777.56ms p(90)=237.38ms p(95)=368.4ms  p(99.9)=671.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28980
     http_req_receiving.............: avg=105.87µs min=34.73µs med=98.36µs  max=76.67ms  p(90)=130.76µs p(95)=144.23µs p(99.9)=642.09µs
     http_req_sending...............: avg=25.71µs  min=6.38µs  med=17.85µs  max=39.37ms  p(90)=22.96µs  p(95)=24.9µs   p(99.9)=609.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.78ms min=6.4ms   med=189.07ms max=777.44ms p(90)=237.26ms p(95)=368.27ms p(99.9)=671.78ms
     http_reqs......................: 28980   239.589275/s
     iteration_duration.............: avg=207.91ms min=51.44ms med=189.52ms max=777.8ms  p(90)=237.84ms p(95)=373.56ms p(99.9)=672.16ms
     iterations.....................: 28880   238.762535/s
     success_rate...................: 100.00% ✓ 28880      ✗ 0    
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

     checks.........................: 100.00% ✓ 823278      ✗ 0     
     data_received..................: 24 GB   200 MB/s
     data_sent......................: 330 MB  2.7 MB/s
     http_req_blocked...............: avg=3.15µs   min=982ns   med=2.27µs  max=10.02ms  p(90)=3.74µs   p(95)=4.54µs   p(99.9)=32.89µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.62ms  min=1.97ms  med=21.21ms max=304.31ms p(90)=29.85ms  p(95)=32.81ms  p(99.9)=54.83ms
       { expected_response:true }...: avg=21.62ms  min=1.97ms  med=21.21ms max=304.31ms p(90)=29.85ms  p(95)=32.81ms  p(99.9)=54.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 274526
     http_req_receiving.............: avg=105.94µs min=28.59µs med=57.29µs max=29.08ms  p(90)=104.07µs p(95)=241.53µs p(99.9)=7.11ms 
     http_req_sending...............: avg=51.27µs  min=5.26µs  med=10.11µs max=247.33ms p(90)=18.07µs  p(95)=123.7µs  p(99.9)=5.02ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.47ms  min=1.88ms  med=21.08ms max=303.91ms p(90)=29.66ms  p(95)=32.57ms  p(99.9)=54.05ms
     http_reqs......................: 274526  2282.924813/s
     iteration_duration.............: avg=21.85ms  min=3.21ms  med=21.43ms max=366.32ms p(90)=30.07ms  p(95)=33.04ms  p(99.9)=55.21ms
     iterations.....................: 274426  2282.093226/s
     success_rate...................: 100.00% ✓ 274426      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 732144      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 293 MB  2.4 MB/s
     http_req_blocked...............: avg=3.61µs  min=1µs     med=2.62µs   max=26.76ms  p(90)=4.17µs  p(95)=4.96µs  p(99.9)=40.09µs 
     http_req_connecting............: avg=415ns   min=0s      med=0s       max=4ms      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=24.33ms min=1.87ms  med=21.63ms  max=339.56ms p(90)=40.3ms  p(95)=48.84ms p(99.9)=105.57ms
       { expected_response:true }...: avg=24.33ms min=1.87ms  med=21.63ms  max=339.56ms p(90)=40.3ms  p(95)=48.84ms p(99.9)=105.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244148
     http_req_receiving.............: avg=1.18ms  min=53.05µs med=366.07µs max=306.41ms p(90)=2.53ms  p(95)=3.79ms  p(99.9)=39.27ms 
     http_req_sending...............: avg=46.31µs min=5.45µs  med=10.47µs  max=101.95ms p(90)=19.79µs p(95)=120.8µs p(99.9)=3.39ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=23.1ms  min=1.74ms  med=20.38ms  max=183.25ms p(90)=38.66ms p(95)=47.01ms p(99.9)=102.06ms
     http_reqs......................: 244148  2030.468934/s
     iteration_duration.............: avg=24.57ms min=2.73ms  med=21.86ms  max=350.81ms p(90)=40.54ms p(95)=49.09ms p(99.9)=106.02ms
     iterations.....................: 244048  2029.637279/s
     success_rate...................: 100.00% ✓ 244048      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 717522      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3µs      min=992ns   med=2.31µs   max=11.49ms  p(90)=3.73µs  p(95)=4.41µs   p(99.9)=35.34µs 
     http_req_connecting............: avg=270ns    min=0s      med=0s       max=3.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.84ms  min=1.9ms   med=17.91ms  max=366.05ms p(90)=50.74ms p(95)=68.01ms  p(99.9)=167.33ms
       { expected_response:true }...: avg=24.84ms  min=1.9ms   med=17.91ms  max=366.05ms p(90)=50.74ms p(95)=68.01ms  p(99.9)=167.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239274
     http_req_receiving.............: avg=988.33µs min=52.17µs med=136.58µs max=325.44ms p(90)=1.57ms  p(95)=2.5ms    p(99.9)=63.99ms 
     http_req_sending...............: avg=41.94µs  min=5.33µs  med=9.96µs   max=70.46ms  p(90)=18.35µs p(95)=109.88µs p(99.9)=2.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.81ms  min=1.76ms  med=17.08ms  max=321.15ms p(90)=48.78ms p(95)=65.93ms  p(99.9)=162.56ms
     http_reqs......................: 239274  1989.881455/s
     iteration_duration.............: avg=25.07ms  min=2.52ms  med=18.13ms  max=373.65ms p(90)=50.99ms p(95)=68.27ms  p(99.9)=168.39ms
     iterations.....................: 239174  1989.049822/s
     success_rate...................: 100.00% ✓ 239174      ✗ 0     
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

     checks.........................: 100.00% ✓ 547182      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.67µs   min=972ns   med=2.49µs  max=4.63ms   p(90)=4.87µs   p(95)=6.06µs   p(99.9)=42.8µs 
     http_req_connecting............: avg=587ns    min=0s      med=0s      max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.61ms  min=2.47ms  med=31.75ms max=353.43ms p(90)=43.24ms  p(95)=47.88ms  p(99.9)=89.02ms
       { expected_response:true }...: avg=32.61ms  min=2.47ms  med=31.75ms max=353.43ms p(90)=43.24ms  p(95)=47.88ms  p(99.9)=89.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182494
     http_req_receiving.............: avg=115.76µs min=30.81µs med=63.49µs max=161.29ms p(90)=139.37µs p(95)=287.1µs  p(99.9)=5.58ms 
     http_req_sending...............: avg=48.54µs  min=5.35µs  med=10.89µs max=156.63ms p(90)=25.71µs  p(95)=139.26µs p(99.9)=3.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.44ms  min=2.34ms  med=31.61ms max=337.76ms p(90)=43.05ms  p(95)=47.64ms  p(99.9)=88.35ms
     http_reqs......................: 182494  1516.883808/s
     iteration_duration.............: avg=32.88ms  min=4.8ms   med=32ms    max=365.47ms p(90)=43.48ms  p(95)=48.14ms  p(99.9)=89.93ms
     iterations.....................: 182394  1516.052611/s
     success_rate...................: 100.00% ✓ 182394      ✗ 0     
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

     checks.........................: 100.00% ✓ 405162      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.96µs  min=1.04µs  med=2.84µs  max=3.99ms   p(90)=4.44µs   p(95)=5.15µs   p(99.9)=39.76µs
     http_req_connecting............: avg=724ns   min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.15ms min=2.41ms  med=43.65ms max=322.76ms p(90)=61.94ms  p(95)=67.42ms  p(99.9)=94.61ms
       { expected_response:true }...: avg=44.15ms min=2.41ms  med=43.65ms max=322.76ms p(90)=61.94ms  p(95)=67.42ms  p(99.9)=94.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135154
     http_req_receiving.............: avg=92.3µs  min=29.71µs med=73.69µs max=100.4ms  p(90)=112.94µs p(95)=131.28µs p(99.9)=1.8ms  
     http_req_sending...............: avg=28.92µs min=5.49µs  med=12.84µs max=105.8ms  p(90)=19.62µs  p(95)=23.43µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.03ms min=2.3ms   med=43.53ms max=322.24ms p(90)=61.81ms  p(95)=67.28ms  p(99.9)=94.33ms
     http_reqs......................: 135154  1123.439826/s
     iteration_duration.............: avg=44.42ms min=4.17ms  med=43.87ms max=338.83ms p(90)=62.15ms  p(95)=67.65ms  p(99.9)=95.38ms
     iterations.....................: 135054  1122.608597/s
     success_rate...................: 100.00% ✓ 135054      ✗ 0     
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

     checks.........................: 100.00% ✓ 193893     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   645 kB/s
     http_req_blocked...............: avg=4.75µs  min=1.07µs  med=3.07µs   max=4.21ms   p(90)=4.66µs   p(95)=5.28µs   p(99.9)=51.6µs  
     http_req_connecting............: avg=1.43µs  min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.47ms min=4.04ms  med=100.2ms  max=360.37ms p(90)=125.64ms p(95)=136.95ms p(99.9)=241.17ms
       { expected_response:true }...: avg=92.47ms min=4.04ms  med=100.2ms  max=360.37ms p(90)=125.64ms p(95)=136.95ms p(99.9)=241.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64731
     http_req_receiving.............: avg=89.24µs min=32.74µs med=81.41µs  max=52.38ms  p(90)=116.91µs p(95)=130µs    p(99.9)=908.77µs
     http_req_sending...............: avg=22.7µs  min=5.74µs  med=14.33µs  max=99.98ms  p(90)=21.05µs  p(95)=23.22µs  p(99.9)=679.32µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.36ms min=3.97ms  med=100.09ms max=360.12ms p(90)=125.54ms p(95)=136.8ms  p(99.9)=241.02ms
     http_reqs......................: 64731   536.807752/s
     iteration_duration.............: avg=92.86ms min=17.42ms med=100.46ms max=368.07ms p(90)=125.92ms p(95)=137.26ms p(99.9)=243.7ms 
     iterations.....................: 64631   535.978462/s
     success_rate...................: 100.00% ✓ 64631      ✗ 0    
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

     checks.........................: 100.00% ✓ 149316     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   496 kB/s
     http_req_blocked...............: avg=6.12µs   min=1.23µs  med=3.63µs   max=4.54ms   p(90)=5.15µs   p(95)=5.77µs   p(99.9)=143.41µs
     http_req_connecting............: avg=2.24µs   min=0s      med=0s       max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=85.82µs 
     http_req_duration..............: avg=120.06ms min=5.62ms  med=117.48ms max=359.15ms p(90)=159.24ms p(95)=171.15ms p(99.9)=216.18ms
       { expected_response:true }...: avg=120.06ms min=5.62ms  med=117.48ms max=359.15ms p(90)=159.24ms p(95)=171.15ms p(99.9)=216.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49872
     http_req_receiving.............: avg=141.04µs min=32.44µs med=89.8µs   max=267.06ms p(90)=121.65µs p(95)=134.9µs  p(99.9)=819.64µs
     http_req_sending...............: avg=30.56µs  min=6.19µs  med=17.48µs  max=87.82ms  p(90)=22.7µs   p(95)=24.6µs   p(99.9)=696.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.89ms min=5.54ms  med=117.33ms max=301.11ms p(90)=159.02ms p(95)=170.94ms p(99.9)=214.63ms
     http_reqs......................: 49872   413.15052/s
     iteration_duration.............: avg=120.57ms min=25.45ms med=117.82ms max=369.08ms p(90)=159.55ms p(95)=171.5ms  p(99.9)=221.5ms 
     iterations.....................: 49772   412.322098/s
     success_rate...................: 100.00% ✓ 49772      ✗ 0    
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

     checks.........................: 100.00% ✓ 87726      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=7.72µs   min=1.25µs  med=3.77µs   max=4.96ms   p(90)=5.24µs   p(95)=5.86µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.68µs   min=0s      med=0s       max=4.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=204.33ms min=6.57ms  med=192.36ms max=776.37ms p(90)=245.85ms p(95)=311.34ms p(99.9)=630.76ms
       { expected_response:true }...: avg=204.33ms min=6.57ms  med=192.36ms max=776.37ms p(90)=245.85ms p(95)=311.34ms p(99.9)=630.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29342
     http_req_receiving.............: avg=107.66µs min=36.28µs med=100.4µs  max=57.25ms  p(90)=131.8µs  p(95)=145.65µs p(99.9)=747.24µs
     http_req_sending...............: avg=29.45µs  min=5.85µs  med=18.4µs   max=81.49ms  p(90)=23.23µs  p(95)=25.03µs  p(99.9)=624.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.19ms min=6.42ms  med=192.25ms max=776.27ms p(90)=245.75ms p(95)=311.2ms  p(99.9)=630.63ms
     http_reqs......................: 29342   242.403253/s
     iteration_duration.............: avg=205.31ms min=59ms    med=192.91ms max=776.63ms p(90)=246.24ms p(95)=313.53ms p(99.9)=631.05ms
     iterations.....................: 29242   241.577123/s
     success_rate...................: 100.00% ✓ 29242      ✗ 0    
     vus............................: 20      min=20       max=50 
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

     checks.........................: 100.00% ✓ 85593      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=5.74µs   min=1.29µs  med=3.58µs   max=2.91ms   p(90)=4.92µs   p(95)=5.47µs   p(99.9)=790.55µs
     http_req_connecting............: avg=1.99µs   min=0s      med=0s       max=2.87ms   p(90)=0s       p(95)=0s       p(99.9)=765.04µs
     http_req_duration..............: avg=209.4ms  min=8.91ms  med=208.8ms  max=431.69ms p(90)=225ms    p(95)=229.79ms p(99.9)=315.53ms
       { expected_response:true }...: avg=209.4ms  min=8.91ms  med=208.8ms  max=431.69ms p(90)=225ms    p(95)=229.79ms p(99.9)=315.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28631
     http_req_receiving.............: avg=144.21µs min=34.99µs med=96.25µs  max=128.92ms p(90)=127.69µs p(95)=140.49µs p(99.9)=20.54ms 
     http_req_sending...............: avg=28.86µs  min=6.26µs  med=17.29µs  max=73.58ms  p(90)=22µs     p(95)=23.69µs  p(99.9)=881.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.23ms min=8.74ms  med=208.67ms max=399.84ms p(90)=224.87ms p(95)=229.62ms p(99.9)=314.8ms 
     http_reqs......................: 28631   236.366044/s
     iteration_duration.............: avg=210.43ms min=19.46ms med=209.08ms max=439.33ms p(90)=225.27ms p(95)=230.11ms p(99.9)=320.27ms
     iterations.....................: 28531   235.540484/s
     success_rate...................: 100.00% ✓ 28531      ✗ 0    
     vus............................: 46      min=46       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

