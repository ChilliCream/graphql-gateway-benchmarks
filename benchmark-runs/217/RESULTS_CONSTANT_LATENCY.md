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
| hive-router | v0.0.65 | 1,573 | 1,599 | 1,566 | 0.8% |  |
| hotchocolate | 16.1.3 | 1,447 | 1,459 | 1,436 | 0.6% |  |
| grafbase | 0.53.5 | 1,141 | 1,154 | 1,125 | 0.9% |  |
| cosmo | 0.321.1 | 1,096 | 1,105 | 1,080 | 0.9% | non-compatible response (7 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 516 | 531 | 512 | 1.2% |  |
| apollo-router | v2.15.0 | 376 | 387 | 372 | 1.3% |  |
| apollo-gateway | 2.14.1 | 234 | 236 | 234 | 0.4% |  |
| hive-gateway | 2.8.2 | 228 | 235 | 225 | 1.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 575841      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.39µs  min=992ns   med=2.45µs  max=4.01ms   p(90)=4.36µs   p(95)=5.34µs   p(99.9)=37.41µs
     http_req_connecting............: avg=445ns   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31ms    min=13.61ms med=30.74ms max=312.37ms p(90)=36.8ms   p(95)=38.74ms  p(99.9)=59.72ms
       { expected_response:true }...: avg=31ms    min=13.61ms med=30.74ms max=312.37ms p(90)=36.8ms   p(95)=38.74ms  p(99.9)=59.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192047
     http_req_receiving.............: avg=88.86µs min=27.64µs med=55.21µs max=171.39ms p(90)=109.55µs p(95)=162.08µs p(99.9)=2.71ms 
     http_req_sending...............: avg=36.56µs min=5.14µs  med=9.91µs  max=109.11ms p(90)=20.33µs  p(95)=67.53µs  p(99.9)=1.9ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.87ms min=13.49ms med=30.63ms max=311.17ms p(90)=36.67ms  p(95)=38.59ms  p(99.9)=58.53ms
     http_reqs......................: 192047  1573.713233/s
     iteration_duration.............: avg=31.25ms min=13.94ms med=30.97ms max=358ms    p(90)=37.02ms  p(95)=38.96ms  p(99.9)=60.02ms
     iterations.....................: 191947  1572.893792/s
     success_rate...................: 100.00% ✓ 191947      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 529533      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.56µs   min=962ns   med=2.26µs   max=40.35ms  p(90)=3.95µs  p(95)=4.83µs   p(99.9)=35.55µs
     http_req_connecting............: avg=823ns    min=0s      med=0s       max=40.29ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.74ms  min=13.78ms med=32.38ms  max=672.13ms p(90)=41.32ms p(95)=45.13ms  p(99.9)=86.36ms
       { expected_response:true }...: avg=33.74ms  min=13.78ms med=32.38ms  max=672.13ms p(90)=41.32ms p(95)=45.13ms  p(99.9)=86.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176611
     http_req_receiving.............: avg=812.04µs min=50.51µs med=113.14µs max=129.33ms p(90)=2.31ms  p(95)=3.49ms   p(99.9)=21.17ms
     http_req_sending...............: avg=39.53µs  min=5.25µs  med=9.26µs   max=158.01ms p(90)=19.86µs p(95)=108.78µs p(99.9)=2.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.88ms  min=13.65ms med=31.58ms  max=671.59ms p(90)=40.16ms p(95)=43.83ms  p(99.9)=84.81ms
     http_reqs......................: 176611  1447.254473/s
     iteration_duration.............: avg=33.98ms  min=14.02ms med=32.61ms  max=672.34ms p(90)=41.54ms p(95)=45.36ms  p(99.9)=87.21ms
     iterations.....................: 176511  1446.435014/s
     success_rate...................: 100.00% ✓ 176511      ✗ 0     
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

     checks.........................: 100.00% ✓ 417435      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.67µs  min=951ns   med=2.32µs  max=4.09ms   p(90)=4.71µs   p(95)=5.84µs   p(99.9)=40.02µs
     http_req_connecting............: avg=761ns   min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.84ms min=17.21ms med=42.34ms max=340.03ms p(90)=52.1ms   p(95)=55.26ms  p(99.9)=78.73ms
       { expected_response:true }...: avg=42.84ms min=17.21ms med=42.34ms max=340.03ms p(90)=52.1ms   p(95)=55.26ms  p(99.9)=78.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139245
     http_req_receiving.............: avg=95.48µs min=28.76µs med=59µs    max=136.77ms p(90)=127.98µs p(95)=188.6µs  p(99.9)=3.2ms  
     http_req_sending...............: avg=38.83µs min=5.29µs  med=9.86µs  max=155.5ms  p(90)=23.24µs  p(95)=103.03µs p(99.9)=2.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.7ms  min=17.05ms med=42.22ms max=339.59ms p(90)=51.95ms  p(95)=55.11ms  p(99.9)=78.3ms 
     http_reqs......................: 139245  1141.306954/s
     iteration_duration.............: avg=43.11ms min=17.53ms med=42.58ms max=359.05ms p(90)=52.34ms  p(95)=55.49ms  p(99.9)=79.86ms
     iterations.....................: 139145  1140.487314/s
     success_rate...................: 100.00% ✓ 139145      ✗ 0     
     vus............................: 41      min=0         max=50  
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

     checks.........................: 100.00% ✓ 401289      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 161 MB  1.3 MB/s
     http_req_blocked...............: avg=3.69µs  min=1.07µs  med=2.56µs  max=4.25ms   p(90)=4.16µs   p(95)=4.91µs   p(99.9)=38.36µs
     http_req_connecting............: avg=715ns   min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.6ms  min=19.27ms med=44ms    max=327.45ms p(90)=54.2ms   p(95)=57.38ms  p(99.9)=74.04ms
       { expected_response:true }...: avg=44.6ms  min=19.27ms med=44ms    max=327.45ms p(90)=54.2ms   p(95)=57.38ms  p(99.9)=74.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133863
     http_req_receiving.............: avg=88.4µs  min=28.91µs med=65.22µs max=134.55ms p(90)=108.79µs p(95)=132.55µs p(99.9)=1.97ms 
     http_req_sending...............: avg=28.85µs min=5.5µs   med=11.01µs max=138.27ms p(90)=18.4µs   p(95)=22.82µs  p(99.9)=1.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.49ms min=19.15ms med=43.89ms max=319.08ms p(90)=54.08ms  p(95)=57.26ms  p(99.9)=73.61ms
     http_reqs......................: 133863  1096.95486/s
     iteration_duration.............: avg=44.84ms min=19.47ms med=44.21ms max=359.96ms p(90)=54.4ms   p(95)=57.59ms  p(99.9)=74.86ms
     iterations.....................: 133763  1096.135399/s
     success_rate...................: 100.00% ✓ 133763      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 189342     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   620 kB/s
     http_req_blocked...............: avg=5.25µs  min=1.14µs  med=3.01µs  max=4.77ms   p(90)=4.58µs   p(95)=5.22µs   p(99.9)=52.36µs 
     http_req_connecting............: avg=1.97µs  min=0s      med=0s      max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.71ms min=18.91ms med=97ms    max=354.17ms p(90)=122.98ms p(95)=132.57ms p(99.9)=236.99ms
       { expected_response:true }...: avg=94.71ms min=18.91ms med=97ms    max=354.17ms p(90)=122.98ms p(95)=132.57ms p(99.9)=236.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63214
     http_req_receiving.............: avg=87.24µs min=31.57µs med=77.42µs max=84.35ms  p(90)=113.79µs p(95)=127.52µs p(99.9)=890.6µs 
     http_req_sending...............: avg=24.2µs  min=5.67µs  med=13.74µs max=93.84ms  p(90)=20.6µs   p(95)=23.09µs  p(99.9)=717.76µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.6ms  min=18.74ms med=96.9ms  max=353.86ms p(90)=122.87ms p(95)=132.45ms p(99.9)=236.72ms
     http_reqs......................: 63214   516.295771/s
     iteration_duration.............: avg=95.08ms min=26.44ms med=97.27ms max=379.16ms p(90)=123.23ms p(95)=132.89ms p(99.9)=239.68ms
     iterations.....................: 63114   515.479029/s
     success_rate...................: 100.00% ✓ 63114      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 138021     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   452 kB/s
     http_req_blocked...............: avg=5.96µs   min=1.23µs  med=3.44µs   max=3.98ms   p(90)=4.97µs   p(95)=5.58µs   p(99.9)=340.53µs
     http_req_connecting............: avg=2.31µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=301.12µs
     http_req_duration..............: avg=129.94ms min=20.86ms med=128.18ms max=366.18ms p(90)=161.9ms  p(95)=172.61ms p(99.9)=222.72ms
       { expected_response:true }...: avg=129.94ms min=20.86ms med=128.18ms max=366.18ms p(90)=161.9ms  p(95)=172.61ms p(99.9)=222.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46107
     http_req_receiving.............: avg=90.01µs  min=32.38µs med=84.61µs  max=13.64ms  p(90)=117.44µs p(95)=130.74µs p(99.9)=667.47µs
     http_req_sending...............: avg=31.33µs  min=5.89µs  med=15.95µs  max=173.73ms p(90)=21.9µs   p(95)=23.95µs  p(99.9)=591.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.82ms min=20.71ms med=128.08ms max=365.56ms p(90)=161.78ms p(95)=172.48ms p(99.9)=221.78ms
     http_reqs......................: 46107   376.532648/s
     iteration_duration.............: avg=130.46ms min=49.6ms  med=128.47ms max=384.71ms p(90)=162.2ms  p(95)=172.9ms  p(99.9)=230.67ms
     iterations.....................: 46007   375.715998/s
     success_rate...................: 100.00% ✓ 46007      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 85986      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=5.31µs   min=1.24µs  med=3.58µs   max=1.88ms   p(90)=5.11µs   p(95)=5.73µs   p(99.9)=732.39µs
     http_req_connecting............: avg=1.46µs   min=0s      med=0s       max=1.85ms   p(90)=0s       p(95)=0s       p(99.9)=675.93µs
     http_req_duration..............: avg=208.53ms min=22.2ms  med=208.31ms max=415.4ms  p(90)=221.52ms p(95)=226.45ms p(99.9)=303.92ms
       { expected_response:true }...: avg=208.53ms min=22.2ms  med=208.31ms max=415.4ms  p(90)=221.52ms p(95)=226.45ms p(99.9)=303.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28762
     http_req_receiving.............: avg=104.69µs min=33.11µs med=93.83µs  max=143.42ms p(90)=127.87µs p(95)=141.48µs p(99.9)=518.22µs
     http_req_sending...............: avg=38.95µs  min=5.75µs  med=17.71µs  max=115.84ms p(90)=23.22µs  p(95)=25.21µs  p(99.9)=680.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.38ms min=21.99ms med=208.17ms max=415.09ms p(90)=221.38ms p(95)=226.3ms  p(99.9)=303.71ms
     http_reqs......................: 28762   234.156867/s
     iteration_duration.............: avg=209.46ms min=69.08ms med=208.61ms max=430.08ms p(90)=221.79ms p(95)=226.81ms p(99.9)=306.54ms
     iterations.....................: 28662   233.342748/s
     success_rate...................: 100.00% ✓ 28662      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 83580      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 34 MB   274 kB/s
     http_req_blocked...............: avg=7.42µs   min=1.21µs  med=3.62µs   max=4.03ms   p(90)=5.12µs   p(95)=5.77µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.56µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=214.53ms min=19.88ms med=199.81ms max=689.55ms p(90)=252.92ms p(95)=287.88ms p(99.9)=634.96ms
       { expected_response:true }...: avg=214.53ms min=19.88ms med=199.81ms max=689.55ms p(90)=252.92ms p(95)=287.88ms p(99.9)=634.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27960
     http_req_receiving.............: avg=103.29µs min=35.58µs med=95.42µs  max=56.85ms  p(90)=128.08µs p(95)=141.9µs  p(99.9)=639.28µs
     http_req_sending...............: avg=36.07µs  min=6.16µs  med=17.71µs  max=87.37ms  p(90)=22.99µs  p(95)=24.85µs  p(99.9)=574.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.39ms min=19.74ms med=199.67ms max=689.44ms p(90)=252.79ms p(95)=287.57ms p(99.9)=634.83ms
     http_reqs......................: 27960   228.109175/s
     iteration_duration.............: avg=215.52ms min=47.89ms med=200.24ms max=689.8ms  p(90)=253.34ms p(95)=290.07ms p(99.9)=635.29ms
     iterations.....................: 27860   227.293334/s
     success_rate...................: 100.00% ✓ 27860      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

