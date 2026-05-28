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
| hive-router | v0.0.49 | 2,656 | 2,808 | 2,614 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,033 | 2,086 | 1,989 | 1.4% |  |
| cosmo | 0.307.0 | 1,209 | 1,209 | 1,200 | 0.5% | non-compatible response (23 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 487 | 498 | 481 | 1.1% |  |
| hive-gateway | 2.5.25 | 229 | 230 | 225 | 0.8% |  |
| apollo-gateway | 2.13.3 | 203 | 207 | 198 | 1.2% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (15814 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (454342 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,202 | 2,323 | 2,175 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,948 | 1,973 | 1,777 | 3.0% |  |
| cosmo | 0.307.0 | 1,148 | 1,159 | 1,133 | 1.1% | non-compatible response (18 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 482 | 492 | 477 | 1.0% |  |
| hive-gateway | 2.5.25 | 223 | 228 | 221 | 0.9% |  |
| apollo-gateway | 2.13.3 | 206 | 209 | 204 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (12439 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (301817 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 490737      ✗ 0     
     data_received..................: 14 GB   233 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=33.07µs  min=1.04µs  med=2.68µs  max=83.66ms  p(90)=4.28µs   p(95)=5.42µs   p(99.9)=6.89ms  
     http_req_connecting............: avg=29.62µs  min=0s      med=0s      max=83.56ms  p(90)=0s       p(95)=0s       p(99.9)=6.75ms  
     http_req_duration..............: avg=86.31ms  min=1.63ms  med=80.78ms max=291.06ms p(90)=167.6ms  p(95)=184.58ms p(99.9)=243.31ms
       { expected_response:true }...: avg=86.31ms  min=1.63ms  med=80.78ms max=291.06ms p(90)=167.6ms  p(95)=184.58ms p(99.9)=243.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164579
     http_req_receiving.............: avg=364.23µs min=29.04µs med=58.14µs max=149.94ms p(90)=231.71µs p(95)=433.35µs p(99.9)=41.94ms 
     http_req_sending...............: avg=92.1µs   min=5.45µs  med=10.65µs max=201.06ms p(90)=19.76µs  p(95)=139.42µs p(99.9)=13.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.85ms  min=1.55ms  med=80.42ms max=272.17ms p(90)=166.81ms p(95)=183.5ms  p(99.9)=239.33ms
     http_reqs......................: 164579  2656.221917/s
     iteration_duration.............: avg=87.15ms  min=2.25ms  med=81.7ms  max=340.73ms p(90)=168.15ms p(95)=185.2ms  p(99.9)=245.72ms
     iterations.....................: 163579  2640.082423/s
     success_rate...................: 100.00% ✓ 163579      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 379632      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=16.86µs  min=1.04µs  med=2.54µs   max=53.93ms  p(90)=3.98µs   p(95)=4.91µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=13.71µs  min=0s      med=0s       max=53.76ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=111.59ms min=2.35ms  med=100.65ms max=680.4ms  p(90)=219.48ms p(95)=257.16ms p(99.9)=465.57ms
       { expected_response:true }...: avg=111.59ms min=2.35ms  med=100.65ms max=680.4ms  p(90)=219.48ms p(95)=257.16ms p(99.9)=465.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127544
     http_req_receiving.............: avg=1.8ms    min=53.28µs med=116.32µs max=314.27ms p(90)=1.35ms   p(95)=4.5ms    p(99.9)=134.91ms
     http_req_sending...............: avg=65.6µs   min=5.24µs  med=10.15µs  max=120.62ms p(90)=18.02µs  p(95)=122.69µs p(99.9)=8.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.72ms min=2.27ms  med=99.73ms  max=603.03ms p(90)=215.86ms p(95)=250.58ms p(99.9)=432.42ms
     http_reqs......................: 127544  2033.342972/s
     iteration_duration.............: avg=112.74ms min=3.59ms  med=102.02ms max=680.64ms p(90)=220.26ms p(95)=257.93ms p(99.9)=467.25ms
     iterations.....................: 126544  2017.400686/s
     success_rate...................: 100.00% ✓ 126544      ✗ 0     
     vus............................: 91      min=0         max=499 
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

     checks.........................: 100.00% ✓ 223680      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=6.85µs   min=1.21µs  med=2.59µs   max=40.67ms  p(90)=4.2µs    p(95)=5.13µs   p(99.9)=466.87µs
     http_req_connecting............: avg=3.6µs    min=0s      med=0s       max=40.49ms  p(90)=0s       p(95)=0s       p(99.9)=416.1µs 
     http_req_duration..............: avg=188.81ms min=2.01ms  med=191.69ms max=605.26ms p(90)=349.41ms p(95)=376.54ms p(99.9)=505.47ms
       { expected_response:true }...: avg=188.81ms min=2.01ms  med=191.69ms max=605.26ms p(90)=349.41ms p(95)=376.54ms p(99.9)=505.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75560
     http_req_receiving.............: avg=86.25µs  min=30.26µs med=62.46µs  max=140.82ms p(90)=98.12µs  p(95)=114.63µs p(99.9)=2.38ms  
     http_req_sending...............: avg=32.69µs  min=5.53µs  med=11.18µs  max=67.11ms  p(90)=17.65µs  p(95)=21.6µs   p(99.9)=4.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.7ms  min=1.96ms  med=191.57ms max=605.09ms p(90)=349.31ms p(95)=376.45ms p(99.9)=505.38ms
     http_reqs......................: 75560   1209.230905/s
     iteration_duration.............: avg=191.59ms min=4.12ms  med=194.74ms max=605.42ms p(90)=350.41ms p(95)=377.31ms p(99.9)=506.13ms
     iterations.....................: 74560   1193.227319/s
     success_rate...................: 100.00% ✓ 74560       ✗ 0    
     vus............................: 78      min=0         max=493
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

     checks.........................: 100.00% ✓ 92172      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   586 kB/s
     http_req_blocked...............: avg=10.85µs  min=1.21µs  med=3.12µs   max=44.6ms   p(90)=4.89µs   p(95)=5.95µs   p(99.9)=1.53ms
     http_req_connecting............: avg=6.69µs   min=0s      med=0s       max=44.54ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms
     http_req_duration..............: avg=452.86ms min=4.17ms  med=422.24ms max=1.79s    p(90)=885.23ms p(95)=963.92ms p(99.9)=1.47s 
       { expected_response:true }...: avg=452.86ms min=4.17ms  med=422.24ms max=1.79s    p(90)=885.23ms p(95)=963.92ms p(99.9)=1.47s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31724
     http_req_receiving.............: avg=159.08µs min=31.46µs med=79.05µs  max=143.18ms p(90)=115.07µs p(95)=129.65µs p(99.9)=4.17ms
     http_req_sending...............: avg=26.7µs   min=6.03µs  med=13.93µs  max=15.04ms  p(90)=21.39µs  p(95)=24.86µs  p(99.9)=3.16ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=452.67ms min=4.03ms  med=422.16ms max=1.79s    p(90)=885.12ms p(95)=963.84ms p(99.9)=1.47s 
     http_reqs......................: 31724   487.977977/s
     iteration_duration.............: avg=467.81ms min=19.34ms med=440.42ms max=1.79s    p(90)=890.19ms p(95)=967.89ms p(99.9)=1.48s 
     iterations.....................: 30724   472.595996/s
     success_rate...................: 100.00% ✓ 30724      ✗ 0    
     vus............................: 59      min=0        max=498
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

     checks.........................: 100.00% ✓ 43719      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=14.8µs   min=1.3µs   med=3.44µs   max=3.88ms  p(90)=5.14µs   p(95)=6.73µs   p(99.9)=2.61ms  
     http_req_connecting............: avg=9.56µs   min=0s      med=0s       max=3.84ms  p(90)=0s       p(95)=0s       p(99.9)=2.58ms  
     http_req_duration..............: avg=913.83ms min=6.11ms  med=808.81ms max=18.04s  p(90)=1.56s    p(95)=1.76s    p(99.9)=17.06s  
       { expected_response:true }...: avg=913.83ms min=6.11ms  med=808.81ms max=18.04s  p(90)=1.56s    p(95)=1.76s    p(99.9)=17.06s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15573
     http_req_receiving.............: avg=99.77µs  min=37.34µs med=92.55µs  max=18.4ms  p(90)=130.98µs p(95)=144.56µs p(99.9)=886.29µs
     http_req_sending...............: avg=35.75µs  min=6.21µs  med=16.59µs  max=57.85ms p(90)=22.85µs  p(95)=27.92µs  p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=913.69ms min=5.99ms  med=808.65ms max=18.04s  p(90)=1.56s    p(95)=1.76s    p(99.9)=17.06s  
     http_reqs......................: 15573   229.109031/s
     iteration_duration.............: avg=976.54ms min=48.2ms  med=873.86ms max=18.04s  p(90)=1.59s    p(95)=1.77s    p(99.9)=17.11s  
     iterations.....................: 14573   214.397091/s
     success_rate...................: 100.00% ✓ 14573      ✗ 0    
     vus............................: 41      min=0        max=500
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

     checks.........................: 100.00% ✓ 42267      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=17.71µs  min=1.22µs  med=3.47µs   max=19.58ms  p(90)=5.17µs   p(95)=6.78µs   p(99.9)=2.91ms 
     http_req_connecting............: avg=12.41µs  min=0s      med=0s       max=19.52ms  p(90)=0s       p(95)=0s       p(99.9)=2.78ms 
     http_req_duration..............: avg=449.59ms min=8.39ms  med=508.88ms max=1.42s    p(90)=795.74ms p(95)=848.83ms p(99.9)=1.2s   
       { expected_response:true }...: avg=449.59ms min=8.39ms  med=508.88ms max=1.42s    p(90)=795.74ms p(95)=848.83ms p(99.9)=1.2s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15089
     http_req_receiving.............: avg=391.15µs min=33.64µs med=91.93µs  max=273.18ms p(90)=130.6µs  p(95)=143.68µs p(99.9)=104.5ms
     http_req_sending...............: avg=32.72µs  min=5.61µs  med=17.01µs  max=41.64ms  p(90)=22.99µs  p(95)=28.08µs  p(99.9)=3.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=449.17ms min=8.28ms  med=508.66ms max=1.42s    p(90)=795.63ms p(95)=848.64ms p(99.9)=1.2s   
     http_reqs......................: 15089   203.26292/s
     iteration_duration.............: avg=481.5ms  min=14.04ms med=535.16ms max=1.42s    p(90)=801.11ms p(95)=857.27ms p(99.9)=1.22s  
     iterations.....................: 14089   189.791986/s
     success_rate...................: 100.00% ✓ 14089      ✗ 0    
     vus............................: 62      min=0        max=495
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

     checks.........................: 100.00% ✓ 407703      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=27.72µs  min=1.04µs  med=3.11µs  max=77.99ms  p(90)=5µs      p(95)=6.26µs   p(99.9)=3.59ms  
     http_req_connecting............: avg=23.25µs  min=0s      med=0s      max=77.76ms  p(90)=0s       p(95)=0s       p(99.9)=3.41ms  
     http_req_duration..............: avg=103.89ms min=1.62ms  med=98.08ms max=340.81ms p(90)=200.98ms p(95)=217.88ms p(99.9)=278.75ms
       { expected_response:true }...: avg=103.89ms min=1.62ms  med=98.08ms max=340.81ms p(90)=200.98ms p(95)=217.88ms p(99.9)=278.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136901
     http_req_receiving.............: avg=250.68µs min=30.11µs med=64.56µs max=196.6ms  p(90)=207.19µs p(95)=448.08µs p(99.9)=30.38ms 
     http_req_sending...............: avg=89.24µs  min=5.65µs  med=12µs    max=279.31ms p(90)=22.95µs  p(95)=148.86µs p(99.9)=12.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.55ms min=1.54ms  med=97.78ms max=340.73ms p(90)=200.4ms  p(95)=217.21ms p(99.9)=275.01ms
     http_reqs......................: 136901  2202.558267/s
     iteration_duration.............: avg=104.95ms min=3.48ms  med=99.31ms max=369.88ms p(90)=201.54ms p(95)=218.42ms p(99.9)=279.91ms
     iterations.....................: 135901  2186.469573/s
     success_rate...................: 100.00% ✓ 135901      ✗ 0     
     vus............................: 64      min=0         max=496 
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

     checks.........................: 100.00% ✓ 360090      ✗ 0     
     data_received..................: 11 GB   171 MB/s
     data_sent......................: 145 MB  2.3 MB/s
     http_req_blocked...............: avg=13.33µs  min=1.03µs  med=2.3µs    max=100.31ms p(90)=3.79µs   p(95)=4.74µs   p(99.9)=750.43µs
     http_req_connecting............: avg=10.25µs  min=0s      med=0s       max=100.24ms p(90)=0s       p(95)=0s       p(99.9)=579.94µs
     http_req_duration..............: avg=117.6ms  min=1.74ms  med=109.3ms  max=887.45ms p(90)=225.47ms p(95)=255.09ms p(99.9)=774.83ms
       { expected_response:true }...: avg=117.6ms  min=1.74ms  med=109.3ms  max=887.45ms p(90)=225.47ms p(95)=255.09ms p(99.9)=774.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 121030
     http_req_receiving.............: avg=1.47ms   min=50.82µs med=114.83µs max=325.7ms  p(90)=1.69ms   p(95)=4.29ms   p(99.9)=119.22ms
     http_req_sending...............: avg=55.18µs  min=5.31µs  med=9.72µs   max=35.4ms   p(90)=17.69µs  p(95)=118.2µs  p(99.9)=7.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.07ms min=1.66ms  med=108.17ms max=887.36ms p(90)=222.77ms p(95)=250.83ms p(99.9)=774.29ms
     http_reqs......................: 121030  1948.550776/s
     iteration_duration.............: avg=118.88ms min=2.99ms  med=110.8ms  max=887.65ms p(90)=226.32ms p(95)=255.89ms p(99.9)=775.18ms
     iterations.....................: 120030  1932.451042/s
     success_rate...................: 100.00% ✓ 120030      ✗ 0     
     vus............................: 63      min=0         max=497 
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

     checks.........................: 100.00% ✓ 212802      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=10.62µs  min=1.05µs  med=2.93µs   max=23.13ms  p(90)=4.73µs   p(95)=5.74µs   p(99.9)=850.12µs
     http_req_connecting............: avg=6.95µs   min=0s      med=0s       max=22.95ms  p(90)=0s       p(95)=0s       p(99.9)=767.67µs
     http_req_duration..............: avg=198.34ms min=2.09ms  med=197.67ms max=588.11ms p(90)=369.44ms p(95)=399.08ms p(99.9)=501.83ms
       { expected_response:true }...: avg=198.34ms min=2.09ms  med=197.67ms max=588.11ms p(90)=369.44ms p(95)=399.08ms p(99.9)=501.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71934
     http_req_receiving.............: avg=87.96µs  min=29.15µs med=68.22µs  max=80.23ms  p(90)=107.24µs p(95)=124.26µs p(99.9)=1.79ms  
     http_req_sending...............: avg=38.03µs  min=5.73µs  med=12.16µs  max=104.92ms p(90)=19.47µs  p(95)=23.51µs  p(99.9)=4.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.22ms min=2.03ms  med=197.51ms max=588.03ms p(90)=369.34ms p(95)=398.96ms p(99.9)=501.77ms
     http_reqs......................: 71934   1148.810144/s
     iteration_duration.............: avg=201.4ms  min=5.6ms   med=201ms    max=588.36ms p(90)=370.46ms p(95)=399.8ms  p(99.9)=502.21ms
     iterations.....................: 70934   1132.839808/s
     success_rate...................: 100.00% ✓ 70934       ✗ 0    
     vus............................: 86      min=0         max=497
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

     checks.........................: 100.00% ✓ 91440      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   579 kB/s
     http_req_blocked...............: avg=10.01µs  min=1.17µs  med=3.25µs   max=5.36ms   p(90)=5.06µs   p(95)=6.05µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=5.72µs   min=0s      med=0s       max=5.31ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=456.05ms min=4.17ms  med=423.47ms max=1.68s    p(90)=899.61ms p(95)=981.74ms p(99.9)=1.43s   
       { expected_response:true }...: avg=456.05ms min=4.17ms  med=423.47ms max=1.68s    p(90)=899.61ms p(95)=981.74ms p(99.9)=1.43s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31480
     http_req_receiving.............: avg=107.52µs min=31µs    med=81.61µs  max=238.22ms p(90)=117.41µs p(95)=131.12µs p(99.9)=974.89µs
     http_req_sending...............: avg=43.89µs  min=5.96µs  med=14.83µs  max=180.72ms p(90)=22.2µs   p(95)=25.53µs  p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=455.9ms  min=4.09ms  med=423.38ms max=1.68s    p(90)=899.5ms  p(95)=981.66ms p(99.9)=1.43s   
     http_reqs......................: 31480   482.449616/s
     iteration_duration.............: avg=471.24ms min=28.71ms med=442.78ms max=1.69s    p(90)=904.36ms p(95)=985.81ms p(99.9)=1.43s   
     iterations.....................: 30480   467.124024/s
     success_rate...................: 100.00% ✓ 30480      ✗ 0    
     vus............................: 68      min=0        max=496
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

     checks.........................: 100.00% ✓ 42831      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   269 kB/s
     http_req_blocked...............: avg=20.11µs  min=1.19µs  med=3.78µs   max=33.34ms  p(90)=5.71µs   p(95)=7.4µs    p(99.9)=2.81ms
     http_req_connecting............: avg=14.12µs  min=0s      med=0s       max=33.29ms  p(90)=0s       p(95)=0s       p(99.9)=2.61ms
     http_req_duration..............: avg=955.61ms min=6.34ms  med=883.51ms max=5.43s    p(90)=1.88s    p(95)=2.06s    p(99.9)=4.96s 
       { expected_response:true }...: avg=955.61ms min=6.34ms  med=883.51ms max=5.43s    p(90)=1.88s    p(95)=2.06s    p(99.9)=4.96s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15277
     http_req_receiving.............: avg=115.84µs min=35.74µs med=101.35µs max=116.71ms p(90)=141.85µs p(95)=154.09µs p(99.9)=1.22ms
     http_req_sending...............: avg=36.43µs  min=5.87µs  med=18.51µs  max=55.16ms  p(90)=24.74µs  p(95)=29.72µs  p(99.9)=2.46ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=955.46ms min=6.24ms  med=883.43ms max=5.43s    p(90)=1.88s    p(95)=2.06s    p(99.9)=4.96s 
     http_reqs......................: 15277   223.843082/s
     iteration_duration.............: avg=1.02s    min=30.32ms med=956.75ms max=5.44s    p(90)=1.9s     p(95)=2.07s    p(99.9)=5s    
     iterations.....................: 14277   209.190788/s
     success_rate...................: 100.00% ✓ 14277      ✗ 0    
     vus............................: 65      min=0        max=500
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

     checks.........................: 100.00% ✓ 40383      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=18.53µs  min=1.24µs  med=3.63µs   max=44.4ms  p(90)=5.48µs   p(95)=7.34µs   p(99.9)=2.34ms
     http_req_connecting............: avg=12.96µs  min=0s      med=0s       max=44.34ms p(90)=0s       p(95)=0s       p(99.9)=2.31ms
     http_req_duration..............: avg=1s       min=8.62ms  med=923.73ms max=4.03s   p(90)=2.05s    p(95)=2.18s    p(99.9)=3.78s 
       { expected_response:true }...: avg=1s       min=8.62ms  med=923.73ms max=4.03s   p(90)=2.05s    p(95)=2.18s    p(99.9)=3.78s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14461
     http_req_receiving.............: avg=135.41µs min=33.51µs med=98.63µs  max=103.5ms p(90)=140.21µs p(95)=153.66µs p(99.9)=2.17ms
     http_req_sending...............: avg=40.47µs  min=5.64µs  med=18.3µs   max=97.05ms p(90)=24.34µs  p(95)=29.62µs  p(99.9)=3.83ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=8.53ms  med=923.6ms  max=4.03s   p(90)=2.05s    p(95)=2.18s    p(99.9)=3.78s 
     http_reqs......................: 14461   206.936315/s
     iteration_duration.............: avg=1.08s    min=36.22ms med=995.49ms max=4.04s   p(90)=2.06s    p(95)=2.19s    p(99.9)=3.8s  
     iterations.....................: 13461   192.626356/s
     success_rate...................: 100.00% ✓ 13461      ✗ 0    
     vus............................: 21      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

