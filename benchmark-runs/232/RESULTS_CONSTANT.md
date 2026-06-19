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
| hive-router | v0.0.65 | 2,880 | 3,070 | 2,830 | 2.7% |  |
| fusion-nightly | 16.3.0-p.1 | 2,228 | 2,286 | 2,219 | 1.0% |  |
| fusion | 16.2.0 | 2,180 | 2,218 | 2,167 | 0.8% |  |
| grafbase | 0.53.5 | 2,086 | 2,144 | 2,066 | 1.2% |  |
| cosmo | 0.321.1 | 1,176 | 1,197 | 1,173 | 0.9% | non-compatible response (5 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 555 | 567 | 551 | 0.9% |  |
| apollo-router | v2.15.0 | 438 | 449 | 435 | 1.1% |  |
| apollo-gateway | 2.14.1 | 245 | 247 | 243 | 0.5% |  |
| hive-gateway | 2.8.2 | 229 | 234 | 227 | 1.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,343 | 2,467 | 2,312 | 2.2% |  |
| fusion-nightly | 16.3.0-p.1 | 2,034 | 2,085 | 2,021 | 1.0% |  |
| fusion | 16.2.0 | 2,023 | 2,066 | 2,003 | 0.9% |  |
| grafbase | 0.53.5 | 1,474 | 1,505 | 1,460 | 1.1% |  |
| cosmo | 0.321.1 | 1,124 | 1,136 | 1,108 | 1.1% | non-compatible response (6 across 5/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 515 | 533 | 512 | 1.4% |  |
| apollo-router | v2.15.0 | 378 | 390 | 373 | 1.4% |  |
| hive-gateway | 2.8.2 | 236 | 241 | 234 | 0.9% |  |
| apollo-gateway | 2.14.1 | 234 | 239 | 232 | 0.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1038237     ✗ 0     
     data_received..................: 30 GB   253 MB/s
     data_sent......................: 416 MB  3.5 MB/s
     http_req_blocked...............: avg=2.76µs   min=1µs     med=2.06µs  max=19.71ms  p(90)=3.23µs  p(95)=3.9µs    p(99.9)=32.35µs
     http_req_connecting............: avg=119ns    min=0s      med=0s      max=2.51ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.1ms   min=1.63ms  med=16.28ms max=358.27ms p(90)=25.21ms p(95)=28.82ms  p(99.9)=51.49ms
       { expected_response:true }...: avg=17.1ms   min=1.63ms  med=16.28ms max=358.27ms p(90)=25.21ms p(95)=28.82ms  p(99.9)=51.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 346179
     http_req_receiving.............: avg=152.59µs min=27.89µs med=51.19µs max=322.58ms p(90)=101.2µs p(95)=282.44µs p(99.9)=13.11ms
     http_req_sending...............: avg=56.92µs  min=5.25µs  med=9.23µs  max=74.12ms  p(90)=16.04µs p(95)=124.65µs p(99.9)=7.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.89ms  min=1.58ms  med=16.12ms max=151.01ms p(90)=24.95ms p(95)=28.45ms  p(99.9)=49.68ms
     http_reqs......................: 346179  2880.189312/s
     iteration_duration.............: avg=17.32ms  min=2.05ms  med=16.48ms max=368.71ms p(90)=25.43ms p(95)=29.06ms  p(99.9)=52.64ms
     iterations.....................: 346079  2879.357317/s
     success_rate...................: 100.00% ✓ 346079      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 803901      ✗ 0     
     data_received..................: 24 GB   195 MB/s
     data_sent......................: 322 MB  2.7 MB/s
     http_req_blocked...............: avg=3.08µs  min=990ns   med=2.04µs   max=14ms     p(90)=3.23µs  p(95)=3.91µs   p(99.9)=31.64µs 
     http_req_connecting............: avg=399ns   min=0s      med=0s       max=4.18ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.14ms min=2.36ms  med=18.74ms  max=315.08ms p(90)=38.18ms p(95)=47.74ms  p(99.9)=118.29ms
       { expected_response:true }...: avg=22.14ms min=2.36ms  med=18.74ms  max=315.08ms p(90)=38.18ms p(95)=47.74ms  p(99.9)=118.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 268067
     http_req_receiving.............: avg=1.02ms  min=51.54µs med=327.34µs max=288.82ms p(90)=2.12ms  p(95)=3.14ms   p(99.9)=38.83ms 
     http_req_sending...............: avg=46.06µs min=4.94µs  med=9.16µs   max=239.87ms p(90)=16.95µs p(95)=114.07µs p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.07ms min=2.22ms  med=17.69ms  max=284.25ms p(90)=36.65ms p(95)=46.03ms  p(99.9)=115.45ms
     http_reqs......................: 268067  2228.427116/s
     iteration_duration.............: avg=22.38ms min=2.65ms  med=18.96ms  max=338.31ms p(90)=38.43ms p(95)=47.99ms  p(99.9)=120.02ms
     iterations.....................: 267967  2227.595821/s
     success_rate...................: 100.00% ✓ 267967      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 786582      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=3.18µs   min=982ns  med=2.02µs   max=64.55ms  p(90)=3.09µs  p(95)=3.68µs   p(99.9)=32.02µs 
     http_req_connecting............: avg=614ns    min=0s     med=0s       max=64.49ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.64ms  min=2.51ms med=15.05ms  max=315.5ms  p(90)=49.03ms p(95)=66.41ms  p(99.9)=163.98ms
       { expected_response:true }...: avg=22.64ms  min=2.51ms med=15.05ms  max=315.5ms  p(90)=49.03ms p(95)=66.41ms  p(99.9)=163.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262294
     http_req_receiving.............: avg=908.05µs min=51.4µs med=123.61µs max=247.31ms p(90)=1.35ms  p(95)=2.22ms   p(99.9)=61.44ms 
     http_req_sending...............: avg=43.78µs  min=5.28µs med=9.04µs   max=180.66ms p(90)=15.41µs p(95)=109.03µs p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.69ms  min=2.41ms med=14.31ms  max=314.93ms p(90)=47.28ms p(95)=64.51ms  p(99.9)=161.38ms
     http_reqs......................: 262294  2180.39124/s
     iteration_duration.............: avg=22.87ms  min=3.07ms med=15.27ms  max=334.07ms p(90)=49.27ms p(95)=66.68ms  p(99.9)=164.92ms
     iterations.....................: 262194  2179.559963/s
     success_rate...................: 100.00% ✓ 262194      ✗ 0     
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

     checks.........................: 100.00% ✓ 752607      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 302 MB  2.5 MB/s
     http_req_blocked...............: avg=3.14µs   min=932ns   med=2.22µs  max=15.52ms  p(90)=3.76µs   p(95)=4.59µs   p(99.9)=42.13µs
     http_req_connecting............: avg=405ns    min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.67ms  min=1.89ms  med=23.42ms max=365.74ms p(90)=28.44ms  p(95)=30.75ms  p(99.9)=53.56ms
       { expected_response:true }...: avg=23.67ms  min=1.89ms  med=23.42ms max=365.74ms p(90)=28.44ms  p(95)=30.75ms  p(99.9)=53.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 250969
     http_req_receiving.............: avg=140.52µs min=29.12µs med=57.89µs max=327.13ms p(90)=101.84µs p(95)=208.87µs p(99.9)=10.81ms
     http_req_sending...............: avg=45.86µs  min=4.81µs  med=10.15µs max=82.23ms  p(90)=18.2µs   p(95)=120.41µs p(99.9)=3.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.48ms  min=1.81ms  med=23.3ms  max=102.02ms p(90)=28.27ms  p(95)=30.49ms  p(99.9)=51.28ms
     http_reqs......................: 250969  2086.965423/s
     iteration_duration.............: avg=23.9ms   min=3.57ms  med=23.63ms max=385.75ms p(90)=28.67ms  p(95)=31ms     p(99.9)=53.96ms
     iterations.....................: 250869  2086.13386/s
     success_rate...................: 100.00% ✓ 250869      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 424071      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=2.89µs  min=982ns   med=2.27µs  max=2.27ms   p(90)=3.57µs  p(95)=4.16µs   p(99.9)=31.6µs 
     http_req_connecting............: avg=325ns   min=0s      med=0s      max=2.23ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.2ms  min=2.12ms  med=41.65ms max=310.57ms p(90)=59.69ms p(95)=65.22ms  p(99.9)=91.09ms
       { expected_response:true }...: avg=42.2ms  min=2.12ms  med=41.65ms max=310.57ms p(90)=59.69ms p(95)=65.22ms  p(99.9)=91.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141457
     http_req_receiving.............: avg=77.8µs  min=28.23µs med=60.19µs max=25.43ms  p(90)=93.99µs p(95)=110.53µs p(99.9)=1.86ms 
     http_req_sending...............: avg=24.17µs min=5.21µs  med=10.3µs  max=163.72ms p(90)=15.31µs p(95)=19.15µs  p(99.9)=1.06ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.1ms  min=2.05ms  med=41.55ms max=309.69ms p(90)=59.57ms p(95)=65.11ms  p(99.9)=90.75ms
     http_reqs......................: 141457  1176.002626/s
     iteration_duration.............: avg=42.44ms min=3.88ms  med=41.85ms max=343.32ms p(90)=59.89ms p(95)=65.42ms  p(99.9)=91.59ms
     iterations.....................: 141357  1175.171276/s
     success_rate...................: 100.00% ✓ 141357      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 200718     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   668 kB/s
     http_req_blocked...............: avg=5.18µs  min=1.16µs  med=3.14µs  max=4.76ms   p(90)=4.74µs   p(95)=5.4µs    p(99.9)=100.01µs
     http_req_connecting............: avg=1.71µs  min=0s      med=0s      max=4.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.32ms min=4.1ms   med=87.39ms max=369.3ms  p(90)=108.47ms p(95)=118.36ms p(99.9)=213.18ms
       { expected_response:true }...: avg=89.32ms min=4.1ms   med=87.39ms max=369.3ms  p(90)=108.47ms p(95)=118.36ms p(99.9)=213.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67006
     http_req_receiving.............: avg=89.91µs min=29.87µs med=79.48µs max=128.47ms p(90)=114.7µs  p(95)=127.58µs p(99.9)=905.82µs
     http_req_sending...............: avg=24.42µs min=5.51µs  med=13.97µs max=85.17ms  p(90)=21.04µs  p(95)=23.38µs  p(99.9)=717.8µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.21ms min=3.97ms  med=87.29ms max=369.11ms p(90)=108.37ms p(95)=118.19ms p(99.9)=212.83ms
     http_reqs......................: 67006   555.820323/s
     iteration_duration.............: avg=89.69ms min=18.97ms med=87.63ms max=377.14ms p(90)=108.72ms p(95)=118.68ms p(99.9)=214.73ms
     iterations.....................: 66906   554.990814/s
     success_rate...................: 100.00% ✓ 66906      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 158544     ✗ 0    
     data_received..................: 4.6 GB  39 MB/s
     data_sent......................: 64 MB   527 kB/s
     http_req_blocked...............: avg=5.61µs   min=1.14µs  med=3.42µs   max=4.81ms   p(90)=4.83µs   p(95)=5.4µs    p(99.9)=57.02µs 
     http_req_connecting............: avg=1.97µs   min=0s      med=0s       max=4.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.07ms min=5.23ms  med=112.86ms max=386.06ms p(90)=136.49ms p(95)=143.7ms  p(99.9)=179.7ms 
       { expected_response:true }...: avg=113.07ms min=5.23ms  med=112.86ms max=386.06ms p(90)=136.49ms p(95)=143.7ms  p(99.9)=179.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 52948
     http_req_receiving.............: avg=152.4µs  min=31.19µs med=83.9µs   max=171.11ms p(90)=114.69µs p(95)=126.39µs p(99.9)=1.03ms  
     http_req_sending...............: avg=23.06µs  min=5.76µs  med=16.1µs   max=51.22ms  p(90)=21.5µs   p(95)=23.26µs  p(99.9)=687.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.89ms min=5.12ms  med=112.75ms max=236.93ms p(90)=136.36ms p(95)=143.55ms p(99.9)=175.49ms
     http_reqs......................: 52948   438.842453/s
     iteration_duration.............: avg=113.55ms min=13.3ms  med=113.14ms max=395.99ms p(90)=136.77ms p(95)=143.95ms p(99.9)=187.44ms
     iterations.....................: 52848   438.013635/s
     success_rate...................: 100.00% ✓ 52848      ✗ 0    
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

     checks.........................: 100.00% ✓ 88938      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=6.97µs   min=1.16µs  med=3.3µs    max=4.27ms   p(90)=4.57µs   p(95)=5.12µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=201.57ms min=8.58ms  med=201.05ms max=442.37ms p(90)=213.69ms p(95)=218.31ms p(99.9)=294.55ms
       { expected_response:true }...: avg=201.57ms min=8.58ms  med=201.05ms max=442.37ms p(90)=213.69ms p(95)=218.31ms p(99.9)=294.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29746
     http_req_receiving.............: avg=93.09µs  min=32.7µs  med=88.94µs  max=1.47ms   p(90)=120.32µs p(95)=132.34µs p(99.9)=663.54µs
     http_req_sending...............: avg=41.12µs  min=5.93µs  med=16.61µs  max=146.8ms  p(90)=21.43µs  p(95)=23.26µs  p(99.9)=538.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.44ms min=8.46ms  med=200.93ms max=442.07ms p(90)=213.56ms p(95)=218.19ms p(99.9)=294.46ms
     http_reqs......................: 29746   245.683937/s
     iteration_duration.............: avg=202.53ms min=58.46ms med=201.42ms max=456.33ms p(90)=213.95ms p(95)=218.62ms p(99.9)=296.69ms
     iterations.....................: 29646   244.857997/s
     success_rate...................: 100.00% ✓ 29646      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 83148      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   276 kB/s
     http_req_blocked...............: avg=7.93µs   min=1.25µs  med=3.58µs   max=4.29ms   p(90)=4.97µs   p(95)=5.61µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=4.06µs   min=0s      med=0s       max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=215.57ms min=6.91ms  med=203.45ms max=736.59ms p(90)=275.04ms p(95)=423.02ms p(99.9)=656.56ms
       { expected_response:true }...: avg=215.57ms min=6.91ms  med=203.45ms max=736.59ms p(90)=275.04ms p(95)=423.02ms p(99.9)=656.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27816
     http_req_receiving.............: avg=102.52µs min=33.65µs med=94.19µs  max=67.31ms  p(90)=126.22µs p(95)=139.34µs p(99.9)=430.9µs 
     http_req_sending...............: avg=36.99µs  min=6.01µs  med=17.75µs  max=88.96ms  p(90)=22.81µs  p(95)=24.69µs  p(99.9)=468.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.43ms min=6.76ms  med=203.33ms max=736.47ms p(90)=274.87ms p(95)=422.87ms p(99.9)=656.48ms
     http_reqs......................: 27816   229.96661/s
     iteration_duration.............: avg=216.62ms min=56.6ms  med=203.89ms max=736.86ms p(90)=275.63ms p(95)=423.69ms p(99.9)=656.78ms
     iterations.....................: 27716   229.139868/s
     success_rate...................: 100.00% ✓ 27716      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 845097      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 339 MB  2.8 MB/s
     http_req_blocked...............: avg=2.91µs   min=1.01µs  med=2.16µs  max=10.48ms  p(90)=3.57µs   p(95)=4.39µs   p(99.9)=35.6µs 
     http_req_connecting............: avg=293ns    min=0s      med=0s      max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.05ms  min=1.84ms  med=20.51ms max=314.44ms p(90)=29.36ms  p(95)=32.47ms  p(99.9)=54.25ms
       { expected_response:true }...: avg=21.05ms  min=1.84ms  med=20.51ms max=314.44ms p(90)=29.36ms  p(95)=32.47ms  p(99.9)=54.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 281799
     http_req_receiving.............: avg=112.35µs min=28.72µs med=55.47µs max=172.64ms p(90)=104.83µs p(95)=258.88µs p(99.9)=8.64ms 
     http_req_sending...............: avg=50.44µs  min=4.87µs  med=9.97µs  max=154.93ms p(90)=18.11µs  p(95)=127.58µs p(99.9)=4.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.89ms  min=1.76ms  med=20.37ms max=313.41ms p(90)=29.17ms  p(95)=32.21ms  p(99.9)=53.16ms
     http_reqs......................: 281799  2343.725405/s
     iteration_duration.............: avg=21.29ms  min=2.99ms  med=20.73ms max=324.28ms p(90)=29.58ms  p(95)=32.71ms  p(99.9)=55.09ms
     iterations.....................: 281699  2342.893704/s
     success_rate...................: 100.00% ✓ 281699      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 733350      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=2.78µs  min=1.02µs med=2.14µs   max=7.75ms   p(90)=3.6µs   p(95)=4.36µs  p(99.9)=31.09µs 
     http_req_connecting............: avg=169ns   min=0s     med=0s       max=2.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=24.29ms min=1.77ms med=21.44ms  max=309.65ms p(90)=40.56ms p(95)=49.35ms p(99.9)=109.39ms
       { expected_response:true }...: avg=24.29ms min=1.77ms med=21.44ms  max=309.65ms p(90)=40.56ms p(95)=49.35ms p(99.9)=109.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244550
     http_req_receiving.............: avg=1.14ms  min=52µs   med=344.41µs max=194.52ms p(90)=2.5ms   p(95)=3.75ms  p(99.9)=38.7ms  
     http_req_sending...............: avg=48.76µs min=5.24µs med=9.5µs    max=222.09ms p(90)=18.89µs p(95)=112.9µs p(99.9)=3.69ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=23.09ms min=1.63ms med=20.24ms  max=309.28ms p(90)=38.96ms p(95)=47.5ms  p(99.9)=106.57ms
     http_reqs......................: 244550  2034.160048/s
     iteration_duration.............: avg=24.53ms min=2.49ms med=21.66ms  max=343.79ms p(90)=40.8ms  p(95)=49.61ms p(99.9)=110.04ms
     iterations.....................: 244450  2033.328251/s
     success_rate...................: 100.00% ✓ 244450      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 729594      ✗ 0     
     data_received..................: 21 GB   177 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.17µs   min=982ns   med=2.15µs   max=15.6ms   p(90)=3.61µs  p(95)=4.36µs   p(99.9)=34.44µs 
     http_req_connecting............: avg=410ns    min=0s      med=0s       max=3.92ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.42ms  min=1.81ms  med=17.85ms  max=321.53ms p(90)=49.28ms p(95)=65.81ms  p(99.9)=163.88ms
       { expected_response:true }...: avg=24.42ms  min=1.81ms  med=17.85ms  max=321.53ms p(90)=49.28ms p(95)=65.81ms  p(99.9)=163.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 243298
     http_req_receiving.............: avg=951.58µs min=51.85µs med=122.37µs max=179.72ms p(90)=1.59ms  p(95)=2.59ms   p(99.9)=59.87ms 
     http_req_sending...............: avg=44.78µs  min=5.37µs  med=9.5µs    max=204.82ms p(90)=17.99µs p(95)=109.56µs p(99.9)=3.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.42ms  min=1.73ms  med=17.02ms  max=321.08ms p(90)=47.45ms p(95)=63.89ms  p(99.9)=160.79ms
     http_reqs......................: 243298  2023.478356/s
     iteration_duration.............: avg=24.66ms  min=2.61ms  med=18.08ms  max=345.56ms p(90)=49.52ms p(95)=66.07ms  p(99.9)=165.96ms
     iterations.....................: 243198  2022.646668/s
     success_rate...................: 100.00% ✓ 243198      ✗ 0     
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

     checks.........................: 100.00% ✓ 532002      ✗ 0     
     data_received..................: 16 GB   129 MB/s
     data_sent......................: 213 MB  1.8 MB/s
     http_req_blocked...............: avg=3.5µs    min=962ns   med=2.31µs  max=7.88ms   p(90)=4.58µs  p(95)=5.79µs   p(99.9)=49.48µs
     http_req_connecting............: avg=520ns    min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.55ms  min=2.47ms  med=32.64ms max=331.83ms p(90)=44.44ms p(95)=49.28ms  p(99.9)=88.85ms
       { expected_response:true }...: avg=33.55ms  min=2.47ms  med=32.64ms max=331.83ms p(90)=44.44ms p(95)=49.28ms  p(99.9)=88.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177434
     http_req_receiving.............: avg=112.14µs min=30.71µs med=62.78µs max=76.78ms  p(90)=137.6µs p(95)=290.72µs p(99.9)=4.99ms 
     http_req_sending...............: avg=47.02µs  min=5.34µs  med=10.35µs max=206.83ms p(90)=24.29µs p(95)=136.68µs p(99.9)=3.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.39ms  min=2.38ms  med=32.5ms  max=331.09ms p(90)=44.26ms p(95)=49.06ms  p(99.9)=88.66ms
     http_reqs......................: 177434  1474.855529/s
     iteration_duration.............: avg=33.82ms  min=6.17ms  med=32.88ms max=361.22ms p(90)=44.69ms p(95)=49.53ms  p(99.9)=89.84ms
     iterations.....................: 177334  1474.024316/s
     success_rate...................: 100.00% ✓ 177334      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 405711      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 163 MB  1.4 MB/s
     http_req_blocked...............: avg=2.97µs  min=1µs     med=2.18µs  max=3.92ms   p(90)=3.67µs  p(95)=4.32µs   p(99.9)=36.26µs
     http_req_connecting............: avg=388ns   min=0s      med=0s      max=2.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.11ms min=2.3ms   med=43.64ms max=322.28ms p(90)=61.91ms p(95)=67.51ms  p(99.9)=95.47ms
       { expected_response:true }...: avg=44.11ms min=2.3ms   med=43.64ms max=322.28ms p(90)=61.91ms p(95)=67.51ms  p(99.9)=95.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135337
     http_req_receiving.............: avg=99.95µs min=29.25µs med=64.8µs  max=219.38ms p(90)=102.8µs p(95)=120.81µs p(99.9)=1.74ms 
     http_req_sending...............: avg=26.7µs  min=5.05µs  med=10.62µs max=252.43ms p(90)=17.07µs p(95)=20.46µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.98ms min=2.23ms  med=43.53ms max=213.65ms p(90)=61.79ms p(95)=67.38ms  p(99.9)=94.24ms
     http_reqs......................: 135337  1124.970085/s
     iteration_duration.............: avg=44.35ms min=4.84ms  med=43.85ms max=355.1ms  p(90)=62.11ms p(95)=67.72ms  p(99.9)=96.34ms
     iterations.....................: 135237  1124.138848/s
     success_rate...................: 100.00% ✓ 135237      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 186249     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   619 kB/s
     http_req_blocked...............: avg=4.99µs  min=1.18µs  med=3.1µs   max=4.23ms   p(90)=4.65µs   p(95)=5.27µs   p(99.9)=47.78µs 
     http_req_connecting............: avg=1.67µs  min=0s      med=0s      max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.25ms min=4.25ms  med=94.06ms max=332.71ms p(90)=117.98ms p(95)=130.06ms p(99.9)=233.34ms
       { expected_response:true }...: avg=96.25ms min=4.25ms  med=94.06ms max=332.71ms p(90)=117.98ms p(95)=130.06ms p(99.9)=233.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62183
     http_req_receiving.............: avg=93.04µs min=32.7µs  med=83.39µs max=72.39ms  p(90)=118.47µs p(95)=132.65µs p(99.9)=886.08µs
     http_req_sending...............: avg=30.55µs min=5.56µs  med=14.29µs max=196.33ms p(90)=20.9µs   p(95)=23.16µs  p(99.9)=674.11µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.12ms min=4.13ms  med=93.96ms max=332.05ms p(90)=117.86ms p(95)=129.92ms p(99.9)=233.19ms
     http_reqs......................: 62183   515.697961/s
     iteration_duration.............: avg=96.65ms min=18.81ms med=94.31ms max=376.5ms  p(90)=118.23ms p(95)=130.38ms p(99.9)=235.57ms
     iterations.....................: 62083   514.868638/s
     success_rate...................: 100.00% ✓ 62083      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 136815     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   455 kB/s
     http_req_blocked...............: avg=5.9µs    min=1.09µs  med=3.55µs   max=4.24ms   p(90)=5.06µs   p(95)=5.63µs   p(99.9)=257.97µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=157.61µs
     http_req_duration..............: avg=131.04ms min=5.89ms  med=128.84ms max=331.78ms p(90)=172.97ms p(95)=185.82ms p(99.9)=237.11ms
       { expected_response:true }...: avg=131.04ms min=5.89ms  med=128.84ms max=331.78ms p(90)=172.97ms p(95)=185.82ms p(99.9)=237.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45705
     http_req_receiving.............: avg=116.02µs min=33.97µs med=89.52µs  max=202.17ms p(90)=121.14µs p(95)=133.49µs p(99.9)=871.98µs
     http_req_sending...............: avg=29.06µs  min=6.17µs  med=17.25µs  max=102.71ms p(90)=22.38µs  p(95)=24.19µs  p(99.9)=604.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.9ms  min=5.72ms  med=128.71ms max=331.25ms p(90)=172.85ms p(95)=185.68ms p(99.9)=236ms   
     http_reqs......................: 45705   378.537437/s
     iteration_duration.............: avg=131.6ms  min=27.79ms med=129.16ms max=347.32ms p(90)=173.28ms p(95)=186.12ms p(99.9)=239.68ms
     iterations.....................: 45605   377.709218/s
     success_rate...................: 100.00% ✓ 45605      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85509      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=5.25µs   min=1.24µs  med=3.57µs   max=4ms      p(90)=4.95µs   p(95)=5.51µs   p(99.9)=619.9µs 
     http_req_connecting............: avg=1.26µs   min=0s      med=0s       max=1.82ms   p(90)=0s       p(95)=0s       p(99.9)=474.99µs
     http_req_duration..............: avg=209.63ms min=6.56ms  med=191.92ms max=775.52ms p(90)=240.18ms p(95)=301.31ms p(99.9)=631.5ms 
       { expected_response:true }...: avg=209.63ms min=6.56ms  med=191.92ms max=775.52ms p(90)=240.18ms p(95)=301.31ms p(99.9)=631.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28603
     http_req_receiving.............: avg=100.76µs min=33.83µs med=95.23µs  max=20.57ms  p(90)=125.89µs p(95)=138.51µs p(99.9)=555.25µs
     http_req_sending...............: avg=25.98µs  min=6.29µs  med=17.84µs  max=50.37ms  p(90)=22.69µs  p(95)=24.4µs   p(99.9)=522.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.5ms  min=6.41ms  med=191.8ms  max=775.44ms p(90)=240.06ms p(95)=301.17ms p(99.9)=631.41ms
     http_reqs......................: 28603   236.505966/s
     iteration_duration.............: avg=210.64ms min=35.11ms med=192.27ms max=775.72ms p(90)=240.71ms p(95)=304.17ms p(99.9)=631.74ms
     iterations.....................: 28503   235.679108/s
     success_rate...................: 100.00% ✓ 28503      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 84819      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=7.75µs   min=1.29µs  med=3.51µs   max=4.67ms   p(90)=4.82µs   p(95)=5.36µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=4.08µs   min=0s      med=0s       max=4.62ms   p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=211.36ms min=8.67ms  med=198.19ms max=494.24ms p(90)=330.54ms p(95)=342.43ms p(99.9)=436.33ms
       { expected_response:true }...: avg=211.36ms min=8.67ms  med=198.19ms max=494.24ms p(90)=330.54ms p(95)=342.43ms p(99.9)=436.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28373
     http_req_receiving.............: avg=101.55µs min=34.61µs med=92.54µs  max=62.01ms  p(90)=124.01µs p(95)=136.6µs  p(99.9)=686.73µs
     http_req_sending...............: avg=27.61µs  min=5.94µs  med=17.02µs  max=67.21ms  p(90)=22.02µs  p(95)=23.93µs  p(99.9)=533.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.23ms min=8.55ms  med=198.03ms max=494.12ms p(90)=330.42ms p(95)=342.27ms p(99.9)=436.22ms
     http_reqs......................: 28373   234.195499/s
     iteration_duration.............: avg=212.37ms min=51.44ms med=199.65ms max=494.41ms p(90)=330.89ms p(95)=342.83ms p(99.9)=436.56ms
     iterations.....................: 28273   233.370083/s
     success_rate...................: 100.00% ✓ 28273      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

