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
| hive-router | v0.0.43 | 2,930 | 3,127 | 2,888 | 2.6% |  |
| hotchocolate | 16.0.0-rc.1.21 | 2,100 | 2,128 | 2,065 | 1.1% |  |
| grafbase | 0.53.2 | 2,027 | 2,082 | 2,002 | 1.3% |  |
| cosmo | 0.298.0 | 1,236 | 1,243 | 1,232 | 0.5% | non-compatible response (7 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 624 | 635 | 617 | 0.8% |  |
| apollo-router | v2.12.1 | 395 | 406 | 391 | 1.3% |  |
| hive-gateway | 2.5.14 | 271 | 276 | 268 | 0.9% |  |
| apollo-gateway | 2.13.3 | 241 | 242 | 238 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,400 | 2,524 | 2,373 | 2.0% |  |
| hotchocolate | 16.0.0-rc.1.21 | 1,953 | 1,986 | 1,936 | 0.9% |  |
| grafbase | 0.53.2 | 1,527 | 1,548 | 1,514 | 0.7% |  |
| cosmo | 0.298.0 | 1,186 | 1,191 | 1,171 | 0.7% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 578 | 591 | 573 | 1.1% |  |
| apollo-router | v2.12.1 | 370 | 380 | 365 | 1.4% |  |
| hive-gateway | 2.5.14 | 269 | 273 | 266 | 0.8% |  |
| apollo-gateway | 2.13.3 | 239 | 241 | 236 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1056612     ✗ 0     
     data_received..................: 31 GB   257 MB/s
     data_sent......................: 423 MB  3.5 MB/s
     http_req_blocked...............: avg=3.46µs   min=1.09µs  med=2.37µs  max=26.68ms  p(90)=3.5µs    p(95)=4.13µs   p(99.9)=32.99µs
     http_req_connecting............: avg=300ns    min=0s      med=0s      max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.79ms  min=1.61ms  med=15.76ms max=326.25ms p(90)=25.02ms  p(95)=29.09ms  p(99.9)=52.77ms
       { expected_response:true }...: avg=16.79ms  min=1.61ms  med=15.76ms max=326.25ms p(90)=25.02ms  p(95)=29.09ms  p(99.9)=52.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 352304
     http_req_receiving.............: avg=143.72µs min=28.16µs med=51.11µs max=172.04ms p(90)=103.55µs p(95)=296.96µs p(99.9)=14.09ms
     http_req_sending...............: avg=63.24µs  min=5.36µs  med=9.33µs  max=236.98ms p(90)=15.58µs  p(95)=127.84µs p(99.9)=11.62ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.58ms  min=1.55ms  med=15.61ms max=325.75ms p(90)=24.74ms  p(95)=28.62ms  p(99.9)=51.09ms
     http_reqs......................: 352304  2930.663444/s
     iteration_duration.............: avg=17.02ms  min=2.24ms  med=15.97ms max=341.09ms p(90)=25.25ms  p(95)=29.36ms  p(99.9)=54.07ms
     iterations.....................: 352204  2929.831588/s
     success_rate...................: 100.00% ✓ 352204      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 757680      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 304 MB  2.5 MB/s
     http_req_blocked...............: avg=3.35µs   min=1.05µs  med=2.38µs   max=12.17ms  p(90)=3.53µs   p(95)=4.13µs   p(99.9)=35.74µs 
     http_req_connecting............: avg=416ns    min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.51ms  min=2.47ms  med=15.29ms  max=359.95ms p(90)=51.61ms  p(95)=70.43ms  p(99.9)=164.06ms
       { expected_response:true }...: avg=23.51ms  min=2.47ms  med=15.29ms  max=359.95ms p(90)=51.61ms  p(95)=70.43ms  p(99.9)=164.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252660
     http_req_receiving.............: avg=653.16µs min=50.88µs med=106.06µs max=155.66ms p(90)=999.31µs p(95)=1.55ms   p(99.9)=58.13ms 
     http_req_sending...............: avg=47.61µs  min=5.06µs  med=9.4µs    max=213.92ms p(90)=15.37µs  p(95)=111.87µs p(99.9)=4.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.81ms  min=2.38ms  med=14.76ms  max=359.2ms  p(90)=50.21ms  p(95)=69.16ms  p(99.9)=163.04ms
     http_reqs......................: 252660  2100.177022/s
     iteration_duration.............: avg=23.74ms  min=3.53ms  med=15.51ms  max=370.6ms  p(90)=51.83ms  p(95)=70.68ms  p(99.9)=165.04ms
     iterations.....................: 252560  2099.345795/s
     success_rate...................: 100.00% ✓ 252560      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 731163      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 293 MB  2.4 MB/s
     http_req_blocked...............: avg=3.56µs   min=932ns  med=2.61µs  max=6.03ms   p(90)=4.08µs   p(95)=4.85µs   p(99.9)=43.58µs
     http_req_connecting............: avg=468ns    min=0s     med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.36ms  min=2.03ms med=24.11ms max=330.83ms p(90)=29.36ms  p(95)=31.83ms  p(99.9)=54.28ms
       { expected_response:true }...: avg=24.36ms  min=2.03ms med=24.11ms max=330.83ms p(90)=29.36ms  p(95)=31.83ms  p(99.9)=54.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 243821
     http_req_receiving.............: avg=117.47µs min=27.4µs med=59.96µs max=212.24ms p(90)=105.21µs p(95)=230.62µs p(99.9)=10.14ms
     http_req_sending...............: avg=51.22µs  min=5.07µs med=10.73µs max=217.62ms p(90)=18.07µs  p(95)=127.41µs p(99.9)=3.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.19ms  min=1.92ms med=23.99ms max=310.81ms p(90)=29.17ms  p(95)=31.55ms  p(99.9)=53.03ms
     http_reqs......................: 243821  2027.52671/s
     iteration_duration.............: avg=24.6ms   min=3.89ms med=24.33ms max=346.33ms p(90)=29.59ms  p(95)=32.08ms  p(99.9)=55ms   
     iterations.....................: 243721  2026.695146/s
     success_rate...................: 100.00% ✓ 243721      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 445746      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.14µs  min=1.05µs  med=2.36µs  max=4.95ms   p(90)=3.65µs  p(95)=4.25µs   p(99.9)=35.14µs
     http_req_connecting............: avg=420ns   min=0s      med=0s      max=2.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.13ms min=2.19ms  med=39.58ms max=316.28ms p(90)=56.69ms p(95)=61.91ms  p(99.9)=86.58ms
       { expected_response:true }...: avg=40.13ms min=2.19ms  med=39.58ms max=316.28ms p(90)=56.69ms p(95)=61.91ms  p(99.9)=86.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148682
     http_req_receiving.............: avg=81.27µs min=29.37µs med=59.91µs max=36.18ms  p(90)=94.99µs p(95)=113.62µs p(99.9)=2.07ms 
     http_req_sending...............: avg=25.18µs min=5.12µs  med=10.55µs max=78.08ms  p(90)=15.46µs p(95)=19.78µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.03ms min=2.07ms  med=39.49ms max=300.19ms p(90)=56.57ms p(95)=61.78ms  p(99.9)=86.18ms
     http_reqs......................: 148682  1236.04967/s
     iteration_duration.............: avg=40.37ms min=4.04ms  med=39.79ms max=333.98ms p(90)=56.89ms p(95)=62.12ms  p(99.9)=86.96ms
     iterations.....................: 148582  1235.218332/s
     success_rate...................: 100.00% ✓ 148582      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 225324     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   750 kB/s
     http_req_blocked...............: avg=4.86µs  min=1.21µs  med=2.88µs  max=4.85ms   p(90)=4.48µs  p(95)=5.13µs   p(99.9)=43.5µs  
     http_req_connecting............: avg=1.67µs  min=0s      med=0s      max=4.81ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.52ms min=3.73ms  med=76.96ms max=320.16ms p(90)=96.61ms p(95)=106.32ms p(99.9)=200.37ms
       { expected_response:true }...: avg=79.52ms min=3.73ms  med=76.96ms max=320.16ms p(90)=96.61ms p(95)=106.32ms p(99.9)=200.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75208
     http_req_receiving.............: avg=85.67µs min=31.7µs  med=76.11µs max=21.01ms  p(90)=112.2µs p(95)=126.31µs p(99.9)=913.61µs
     http_req_sending...............: avg=28.84µs min=5.71µs  med=12.91µs max=243.73ms p(90)=19.3µs  p(95)=21.83µs  p(99.9)=784.04µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.41ms min=3.62ms  med=76.86ms max=320.01ms p(90)=96.5ms  p(95)=106.2ms  p(99.9)=200.13ms
     http_reqs......................: 75208   624.178265/s
     iteration_duration.............: avg=79.89ms min=15.41ms med=77.2ms  max=362.52ms p(90)=96.85ms p(95)=106.66ms p(99.9)=202.5ms 
     iterations.....................: 75108   623.348329/s
     success_rate...................: 100.00% ✓ 75108      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 143025     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   475 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.2µs   med=3.16µs   max=4.69ms   p(90)=4.53µs   p(95)=5.07µs   p(99.9)=315.76µs
     http_req_connecting............: avg=2.22µs   min=0s      med=0s       max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=197.22µs
     http_req_duration..............: avg=125.38ms min=5.59ms  med=125.05ms max=347.23ms p(90)=151.86ms p(95)=159.86ms p(99.9)=192.92ms
       { expected_response:true }...: avg=125.38ms min=5.59ms  med=125.05ms max=347.23ms p(90)=151.86ms p(95)=159.86ms p(99.9)=192.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47775
     http_req_receiving.............: avg=86.26µs  min=31.39µs med=79.78µs  max=31.77ms  p(90)=111.34µs p(95)=123.07µs p(99.9)=664.99µs
     http_req_sending...............: avg=23.81µs  min=5.75µs  med=14.39µs  max=163.95ms p(90)=19.87µs  p(95)=21.82µs  p(99.9)=577.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.27ms min=5.53ms  med=124.95ms max=347.12ms p(90)=151.75ms p(95)=159.74ms p(99.9)=192.75ms
     http_reqs......................: 47775   395.768962/s
     iteration_duration.............: avg=125.9ms  min=42.34ms med=125.36ms max=359.75ms p(90)=152.12ms p(95)=160.13ms p(99.9)=195.71ms
     iterations.....................: 47675   394.94056/s
     success_rate...................: 100.00% ✓ 47675      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 98448      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=7.44µs   min=1.25µs  med=3.74µs   max=4.23ms   p(90)=5.33µs   p(95)=6µs      p(99.9)=1.82ms  
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=182.14ms min=5.6ms   med=163.67ms max=593.84ms p(90)=212.97ms p(95)=396.87ms p(99.9)=532.06ms
       { expected_response:true }...: avg=182.14ms min=5.6ms   med=163.67ms max=593.84ms p(90)=212.97ms p(95)=396.87ms p(99.9)=532.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32916
     http_req_receiving.............: avg=103.77µs min=33.51µs med=98.13µs  max=41.27ms  p(90)=130.47µs p(95)=144.19µs p(99.9)=646.07µs
     http_req_sending...............: avg=36.89µs  min=6.23µs  med=18.04µs  max=130.02ms p(90)=23.39µs  p(95)=25.34µs  p(99.9)=560.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.99ms min=5.51ms  med=163.54ms max=593.71ms p(90)=212.83ms p(95)=396.78ms p(99.9)=531.94ms
     http_reqs......................: 32916   271.971789/s
     iteration_duration.............: avg=182.98ms min=28.05ms med=164.02ms max=594.06ms p(90)=213.46ms p(95)=397.75ms p(99.9)=532.43ms
     iterations.....................: 32816   271.145529/s
     success_rate...................: 100.00% ✓ 32816      ✗ 0    
     vus............................: 12      min=12       max=50 
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

     checks.........................: 100.00% ✓ 87297      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=5.45µs   min=1.31µs med=3.2µs    max=3.37ms   p(90)=4.45µs   p(95)=4.96µs   p(99.9)=759.82µs
     http_req_connecting............: avg=2.1µs    min=0s     med=0s       max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=728.96µs
     http_req_duration..............: avg=205.42ms min=8.4ms  med=204.19ms max=353.64ms p(90)=212.33ms p(95)=218.75ms p(99.9)=284.88ms
       { expected_response:true }...: avg=205.42ms min=8.4ms  med=204.19ms max=353.64ms p(90)=212.33ms p(95)=218.75ms p(99.9)=284.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29199
     http_req_receiving.............: avg=92.48µs  min=31.7µs med=87.52µs  max=19.99ms  p(90)=118.35µs p(95)=130.32µs p(99.9)=659.18µs
     http_req_sending...............: avg=24.95µs  min=6µs    med=15.34µs  max=46.22ms  p(90)=20.4µs   p(95)=22.22µs  p(99.9)=581.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.3ms  min=8.23ms med=204.08ms max=353.46ms p(90)=212.23ms p(95)=218.62ms p(99.9)=284.76ms
     http_reqs......................: 29199   241.176421/s
     iteration_duration.............: avg=206.35ms min=62.3ms med=204.43ms max=360.68ms p(90)=212.62ms p(95)=219.1ms  p(99.9)=286.5ms 
     iterations.....................: 29099   240.350446/s
     success_rate...................: 100.00% ✓ 29099      ✗ 0    
     vus............................: 32      min=32       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 865440      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=3.59µs  min=1µs     med=2.76µs  max=15.54ms  p(90)=4.32µs   p(95)=5.13µs   p(99.9)=40.3µs 
     http_req_connecting............: avg=172ns   min=0s      med=0s      max=2.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.55ms min=1.86ms  med=20.01ms max=315.72ms p(90)=28.52ms  p(95)=31.83ms  p(99.9)=54.31ms
       { expected_response:true }...: avg=20.55ms min=1.86ms  med=20.01ms max=315.72ms p(90)=28.52ms  p(95)=31.83ms  p(99.9)=54.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288580
     http_req_receiving.............: avg=125.2µs min=27.76µs med=55.05µs max=245.13ms p(90)=107.04µs p(95)=275.64µs p(99.9)=10.07ms
     http_req_sending...............: avg=55.16µs min=5.36µs  med=10.4µs  max=194.42ms p(90)=18.67µs  p(95)=130.07µs p(99.9)=5.83ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.37ms min=1.76ms  med=19.86ms max=314.89ms p(90)=28.31ms  p(95)=31.5ms   p(99.9)=53.08ms
     http_reqs......................: 288580  2400.081522/s
     iteration_duration.............: avg=20.78ms min=3.5ms   med=20.23ms max=342.12ms p(90)=28.75ms  p(95)=32.08ms  p(99.9)=55.08ms
     iterations.....................: 288480  2399.249835/s
     success_rate...................: 100.00% ✓ 288480      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 704418      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 282 MB  2.3 MB/s
     http_req_blocked...............: avg=3.5µs    min=1.01µs  med=2.57µs   max=10.29ms  p(90)=4.06µs  p(95)=4.83µs   p(99.9)=35.53µs 
     http_req_connecting............: avg=459ns    min=0s      med=0s       max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.3ms   min=1.88ms  med=17.27ms  max=560.63ms p(90)=53.21ms p(95)=70.6ms   p(99.9)=205.22ms
       { expected_response:true }...: avg=25.3ms   min=1.88ms  med=17.27ms  max=560.63ms p(90)=53.21ms p(95)=70.6ms   p(99.9)=205.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 234906
     http_req_receiving.............: avg=692.46µs min=51.06µs med=111.92µs max=195.92ms p(90)=1.12ms  p(95)=1.79ms   p(99.9)=60.33ms 
     http_req_sending...............: avg=43.86µs  min=5.28µs  med=10.35µs  max=125.85ms p(90)=18.84µs p(95)=118.73µs p(99.9)=2.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.56ms  min=1.79ms  med=16.72ms  max=560.54ms p(90)=51.88ms p(95)=69.08ms  p(99.9)=200.29ms
     http_reqs......................: 234906  1953.748884/s
     iteration_duration.............: avg=25.54ms  min=2.53ms  med=17.49ms  max=560.84ms p(90)=53.47ms p(95)=70.84ms  p(99.9)=210.01ms
     iterations.....................: 234806  1952.917169/s
     success_rate...................: 100.00% ✓ 234806      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 551055      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.86µs   min=992ns   med=2.58µs  max=11.98ms  p(90)=4.93µs   p(95)=6.06µs   p(99.9)=43.12µs
     http_req_connecting............: avg=501ns    min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.38ms  min=2.42ms  med=31.52ms max=338.15ms p(90)=43.16ms  p(95)=48.08ms  p(99.9)=86.77ms
       { expected_response:true }...: avg=32.38ms  min=2.42ms  med=31.52ms max=338.15ms p(90)=43.16ms  p(95)=48.08ms  p(99.9)=86.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183785
     http_req_receiving.............: avg=114.52µs min=30.16µs med=61.57µs max=113.79ms p(90)=135.89µs p(95)=290.06µs p(99.9)=5.99ms 
     http_req_sending...............: avg=47.32µs  min=5.38µs  med=10.52µs max=109.72ms p(90)=24.28µs  p(95)=138.91µs p(99.9)=3.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.22ms  min=2.31ms  med=31.38ms max=336.96ms p(90)=42.97ms  p(95)=47.82ms  p(99.9)=86.36ms
     http_reqs......................: 183785  1527.5765/s
     iteration_duration.............: avg=32.65ms  min=3.57ms  med=31.76ms max=356.6ms  p(90)=43.4ms   p(95)=48.33ms  p(99.9)=88.52ms
     iterations.....................: 183685  1526.745325/s
     success_rate...................: 100.00% ✓ 183685      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 427974      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.86µs  min=1.06µs  med=2.8µs   max=4.09ms   p(90)=4.32µs  p(95)=4.98µs   p(99.9)=37.91µs
     http_req_connecting............: avg=744ns   min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.8ms  min=2.29ms  med=41.26ms max=313.45ms p(90)=58.82ms p(95)=64.25ms  p(99.9)=90.39ms
       { expected_response:true }...: avg=41.8ms  min=2.29ms  med=41.26ms max=313.45ms p(90)=58.82ms p(95)=64.25ms  p(99.9)=90.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142758
     http_req_receiving.............: avg=84.5µs  min=30.06µs med=67.25µs max=27.01ms  p(90)=104.4µs p(95)=122.21µs p(99.9)=1.82ms 
     http_req_sending...............: avg=31.43µs min=5.54µs  med=12.02µs max=227.84ms p(90)=17.95µs p(95)=21.61µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.68ms min=2.15ms  med=41.15ms max=312.83ms p(90)=58.7ms  p(95)=64.14ms  p(99.9)=89.89ms
     http_reqs......................: 142758  1186.854461/s
     iteration_duration.............: avg=42.05ms min=4.24ms  med=41.48ms max=339.1ms  p(90)=59.04ms p(95)=64.46ms  p(99.9)=90.86ms
     iterations.....................: 142658  1186.023086/s
     success_rate...................: 100.00% ✓ 142658      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 208788     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   695 kB/s
     http_req_blocked...............: avg=4.53µs  min=1.14µs  med=2.89µs  max=3.92ms   p(90)=4.44µs   p(95)=5.03µs   p(99.9)=45.99µs 
     http_req_connecting............: avg=1.36µs  min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.87ms min=3.91ms  med=82.82ms max=321.52ms p(90)=109.27ms p(95)=121.74ms p(99.9)=220.37ms
       { expected_response:true }...: avg=85.87ms min=3.91ms  med=82.82ms max=321.52ms p(90)=109.27ms p(95)=121.74ms p(99.9)=220.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69696
     http_req_receiving.............: avg=86.39µs min=31.22µs med=77.35µs max=64.9ms   p(90)=111.02µs p(95)=123.27µs p(99.9)=920.64µs
     http_req_sending...............: avg=22.61µs min=5.59µs  med=13.07µs max=75.67ms  p(90)=19.09µs  p(95)=21.26µs  p(99.9)=675.35µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.77ms min=3.83ms  med=82.71ms max=321ms    p(90)=109.16ms p(95)=121.61ms p(99.9)=220.03ms
     http_reqs......................: 69696   578.242955/s
     iteration_duration.............: avg=86.22ms min=23.2ms  med=83.08ms max=347.9ms  p(90)=109.5ms  p(95)=122.02ms p(99.9)=222.05ms
     iterations.....................: 69596   577.413291/s
     success_rate...................: 100.00% ✓ 69596      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 133740     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   444 kB/s
     http_req_blocked...............: avg=5.77µs   min=1.21µs  med=3.27µs   max=4.08ms   p(90)=4.72µs   p(95)=5.28µs   p(99.9)=502.33µs
     http_req_connecting............: avg=2.26µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=355.92µs
     http_req_duration..............: avg=134.06ms min=6.05ms  med=131.63ms max=353.53ms p(90)=177.63ms p(95)=190.96ms p(99.9)=246.65ms
       { expected_response:true }...: avg=134.06ms min=6.05ms  med=131.63ms max=353.53ms p(90)=177.63ms p(95)=190.96ms p(99.9)=246.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44680
     http_req_receiving.............: avg=104.54µs min=29.5µs  med=83.55µs  max=180.12ms p(90)=114.75µs p(95)=126.41µs p(99.9)=770.65µs
     http_req_sending...............: avg=25.33µs  min=5.88µs  med=15.06µs  max=110.87ms p(90)=20.68µs  p(95)=22.57µs  p(99.9)=555.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.93ms min=5.93ms  med=131.51ms max=352.91ms p(90)=177.51ms p(95)=190.83ms p(99.9)=245.8ms 
     http_reqs......................: 44680   370.018292/s
     iteration_duration.............: avg=134.62ms min=33.91ms med=131.95ms max=361.66ms p(90)=177.98ms p(95)=191.28ms p(99.9)=251.1ms 
     iterations.....................: 44580   369.19014/s
     success_rate...................: 100.00% ✓ 44580      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 97470      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=7.03µs   min=1.28µs  med=3.67µs   max=4.15ms   p(90)=5.19µs   p(95)=5.81µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=3.14µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=183.95ms min=5.92ms  med=184.85ms max=628.86ms p(90)=241.36ms p(95)=377.8ms  p(99.9)=547.62ms
       { expected_response:true }...: avg=183.95ms min=5.92ms  med=184.85ms max=628.86ms p(90)=241.36ms p(95)=377.8ms  p(99.9)=547.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32590
     http_req_receiving.............: avg=105.35µs min=36.3µs  med=97.21µs  max=52.65ms  p(90)=129.11µs p(95)=142.91µs p(99.9)=768.99µs
     http_req_sending...............: avg=29.54µs  min=6.31µs  med=17.92µs  max=113.63ms p(90)=22.97µs  p(95)=24.72µs  p(99.9)=608.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.82ms min=5.82ms  med=184.72ms max=628.77ms p(90)=241.24ms p(95)=377.44ms p(99.9)=546.99ms
     http_reqs......................: 32590   269.584676/s
     iteration_duration.............: avg=184.8ms  min=43.37ms med=185.31ms max=629.06ms p(90)=241.81ms p(95)=379.16ms p(99.9)=547.93ms
     iterations.....................: 32490   268.757476/s
     success_rate...................: 100.00% ✓ 32490      ✗ 0    
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

     checks.........................: 100.00% ✓ 86676      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=5.79µs   min=1.32µs  med=3.39µs   max=3.49ms   p(90)=4.7µs    p(95)=5.24µs   p(99.9)=881.24µs
     http_req_connecting............: avg=2.21µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=854.25µs
     http_req_duration..............: avg=206.82ms min=8.71ms  med=212.77ms max=416.76ms p(90)=220.96ms p(95)=225.54ms p(99.9)=297.09ms
       { expected_response:true }...: avg=206.82ms min=8.71ms  med=212.77ms max=416.76ms p(90)=220.96ms p(95)=225.54ms p(99.9)=297.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28992
     http_req_receiving.............: avg=98.45µs  min=33.06µs med=92.6µs   max=32.59ms  p(90)=123.75µs p(95)=135.65µs p(99.9)=643.88µs
     http_req_sending...............: avg=33.26µs  min=6.03µs  med=16.76µs  max=151.09ms p(90)=21.52µs  p(95)=23.34µs  p(99.9)=488.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.69ms min=8.55ms  med=212.66ms max=416.63ms p(90)=220.85ms p(95)=225.43ms p(99.9)=296.98ms
     http_reqs......................: 28992   239.426854/s
     iteration_duration.............: avg=207.8ms  min=50.49ms med=213.03ms max=422.86ms p(90)=221.23ms p(95)=225.84ms p(99.9)=298.44ms
     iterations.....................: 28892   238.601016/s
     success_rate...................: 100.00% ✓ 28892      ✗ 0    
     vus............................: 40      min=40       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

