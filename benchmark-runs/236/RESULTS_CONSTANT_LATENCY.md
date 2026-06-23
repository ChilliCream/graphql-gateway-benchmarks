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
| hive-router | v0.0.72 | 1,561 | 1,584 | 1,546 | 0.7% |  |
| fusion-nightly | 16.3.0-p.1 | 1,552 | 1,571 | 1,548 | 0.5% |  |
| fusion | 16.2.3 | 1,536 | 1,563 | 1,532 | 0.7% |  |
| grafbase | 0.53.5 | 1,121 | 1,141 | 1,112 | 0.9% |  |
| cosmo | 0.324.0 | 1,102 | 1,120 | 1,096 | 0.7% |  |
| hive-gateway-router-runtime | 2.9.0 | 517 | 530 | 511 | 1.2% |  |
| apollo-router | v2.15.1 | 374 | 386 | 368 | 1.6% |  |
| hive-gateway | 2.9.0 | 235 | 240 | 232 | 1.2% |  |
| apollo-gateway | 2.14.1 | 232 | 236 | 231 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 571347      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.45µs  min=962ns   med=2.45µs  max=4.3ms    p(90)=4.32µs   p(95)=5.24µs   p(99.9)=37.61µs
     http_req_connecting............: avg=528ns   min=0s      med=0s      max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.25ms min=14.85ms med=30.94ms max=344.27ms p(90)=37.22ms  p(95)=39.17ms  p(99.9)=57.27ms
       { expected_response:true }...: avg=31.25ms min=14.85ms med=30.94ms max=344.27ms p(90)=37.22ms  p(95)=39.17ms  p(99.9)=57.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190549
     http_req_receiving.............: avg=86.84µs min=27.57µs med=56.56µs max=63.89ms  p(90)=109.34µs p(95)=154.92µs p(99.9)=2.37ms 
     http_req_sending...............: avg=36.76µs min=4.85µs  med=10.12µs max=154.18ms p(90)=20.82µs  p(95)=39.71µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.12ms min=14.78ms med=30.83ms max=332.18ms p(90)=37.09ms  p(95)=39.02ms  p(99.9)=55.89ms
     http_reqs......................: 190549  1561.731219/s
     iteration_duration.............: avg=31.49ms min=15.09ms med=31.17ms max=356.71ms p(90)=37.44ms  p(95)=39.39ms  p(99.9)=57.91ms
     iterations.....................: 190449  1560.911624/s
     success_rate...................: 100.00% ✓ 190449      ✗ 0     
     vus............................: 47      min=0         max=50  
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

     checks.........................: 100.00% ✓ 567927      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=2.94µs   min=982ns   med=2.24µs  max=1.84ms   p(90)=4.08µs  p(95)=4.99µs   p(99.9)=36.4µs 
     http_req_connecting............: avg=225ns    min=0s      med=0s      max=1.81ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.44ms  min=14.59ms med=30.9ms  max=335.84ms p(90)=38.62ms p(95)=41.25ms  p(99.9)=60.51ms
       { expected_response:true }...: avg=31.44ms  min=14.59ms med=30.9ms  max=335.84ms p(90)=38.62ms p(95)=41.25ms  p(99.9)=60.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189409
     http_req_receiving.............: avg=645.84µs min=50.54µs med=112.6µs max=124.47ms p(90)=1.84ms  p(95)=2.83ms   p(99.9)=14.05ms
     http_req_sending...............: avg=37.38µs  min=5.08µs  med=9.32µs  max=154.94ms p(90)=20.59µs p(95)=103.88µs p(99.9)=2.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.76ms  min=14.5ms  med=30.27ms max=335.17ms p(90)=37.69ms p(95)=40.26ms  p(99.9)=57.87ms
     http_reqs......................: 189409  1552.683881/s
     iteration_duration.............: avg=31.68ms  min=14.79ms med=31.13ms max=348.44ms p(90)=38.84ms p(95)=41.47ms  p(99.9)=61.25ms
     iterations.....................: 189309  1551.864129/s
     success_rate...................: 100.00% ✓ 189309      ✗ 0     
     vus............................: 5       min=0         max=50  
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

     checks.........................: 100.00% ✓ 562341      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 225 MB  1.8 MB/s
     http_req_blocked...............: avg=3.2µs    min=971ns   med=2.14µs   max=4.08ms   p(90)=3.85µs  p(95)=4.72µs   p(99.9)=36.6µs 
     http_req_connecting............: avg=566ns    min=0s      med=0s       max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.76ms  min=13.85ms med=31.16ms  max=335.34ms p(90)=39.06ms p(95)=41.77ms  p(99.9)=63.92ms
       { expected_response:true }...: avg=31.76ms  min=13.85ms med=31.16ms  max=335.34ms p(90)=39.06ms p(95)=41.77ms  p(99.9)=63.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 187547
     http_req_receiving.............: avg=611.07µs min=51.16µs med=112.09µs max=84.78ms  p(90)=1.69ms  p(95)=2.63ms   p(99.9)=15.76ms
     http_req_sending...............: avg=39.44µs  min=4.98µs  med=9.27µs   max=148.44ms p(90)=20.23µs p(95)=105.03µs p(99.9)=2.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.11ms  min=13.68ms med=30.55ms  max=334.49ms p(90)=38.23ms p(95)=40.86ms  p(99.9)=60.6ms 
     http_reqs......................: 187547  1536.836383/s
     iteration_duration.............: avg=32ms     min=14.06ms med=31.38ms  max=363.44ms p(90)=39.28ms p(95)=41.99ms  p(99.9)=64.38ms
     iterations.....................: 187447  1536.016942/s
     success_rate...................: 100.00% ✓ 187447      ✗ 0     
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

     checks.........................: 100.00% ✓ 410376      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 165 MB  1.3 MB/s
     http_req_blocked...............: avg=3.22µs  min=972ns   med=2.26µs  max=2.8ms    p(90)=4.71µs   p(95)=5.83µs   p(99.9)=46.97µs
     http_req_connecting............: avg=317ns   min=0s      med=0s      max=2.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.57ms min=18.6ms  med=43.1ms  max=323.56ms p(90)=52.98ms  p(95)=56.29ms  p(99.9)=85.09ms
       { expected_response:true }...: avg=43.57ms min=18.6ms  med=43.1ms  max=323.56ms p(90)=52.98ms  p(95)=56.29ms  p(99.9)=85.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136892
     http_req_receiving.............: avg=98.51µs min=29.66µs med=59.77µs max=188.87ms p(90)=131.29µs p(95)=204.71µs p(99.9)=2.99ms 
     http_req_sending...............: avg=36.09µs min=5.02µs  med=10.01µs max=66.08ms  p(90)=24.2µs   p(95)=109.5µs  p(99.9)=2.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.44ms min=18.45ms med=42.98ms max=322.91ms p(90)=52.84ms  p(95)=56.11ms  p(99.9)=84.87ms
     http_reqs......................: 136892  1121.750643/s
     iteration_duration.............: avg=43.85ms min=19.23ms med=43.35ms max=362.96ms p(90)=53.22ms  p(95)=56.52ms  p(99.9)=85.67ms
     iterations.....................: 136792  1120.931201/s
     success_rate...................: 100.00% ✓ 136792      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403371      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.71µs  min=1.08µs  med=2.63µs  max=4.3ms    p(90)=4.36µs   p(95)=5.12µs   p(99.9)=39.96µs
     http_req_connecting............: avg=677ns   min=0s      med=0s      max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.37ms min=19.21ms med=43.78ms max=334.72ms p(90)=53.99ms  p(95)=57.15ms  p(99.9)=74.96ms
       { expected_response:true }...: avg=44.37ms min=19.21ms med=43.78ms max=334.72ms p(90)=53.99ms  p(95)=57.15ms  p(99.9)=74.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134557
     http_req_receiving.............: avg=92.25µs min=29.62µs med=69.31µs max=230.6ms  p(90)=115.12µs p(95)=140.72µs p(99.9)=1.69ms 
     http_req_sending...............: avg=27.7µs  min=5.38µs  med=11.39µs max=97.47ms  p(90)=19.5µs   p(95)=24.28µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.25ms min=19.04ms med=43.67ms max=334.53ms p(90)=53.86ms  p(95)=57.04ms  p(99.9)=74.64ms
     http_reqs......................: 134557  1102.498614/s
     iteration_duration.............: avg=44.61ms min=20.47ms med=44ms    max=345.77ms p(90)=54.2ms   p(95)=57.37ms  p(99.9)=75.48ms
     iterations.....................: 134457  1101.679259/s
     success_rate...................: 100.00% ✓ 134457      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 189678     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   621 kB/s
     http_req_blocked...............: avg=5.07µs  min=1.17µs  med=3.06µs  max=4.4ms    p(90)=4.64µs   p(95)=5.25µs   p(99.9)=52.78µs 
     http_req_connecting............: avg=1.74µs  min=0s      med=0s      max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.54ms min=18.45ms med=92.99ms max=361.68ms p(90)=115.53ms p(95)=124.43ms p(99.9)=231.44ms
       { expected_response:true }...: avg=94.54ms min=18.45ms med=92.99ms max=361.68ms p(90)=115.53ms p(95)=124.43ms p(99.9)=231.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63326
     http_req_receiving.............: avg=162µs   min=29.95µs med=78.33µs max=243.62ms p(90)=114.35µs p(95)=127.69µs p(99.9)=1.36ms  
     http_req_sending...............: avg=22.94µs min=5.66µs  med=13.99µs max=218.01ms p(90)=21µs     p(95)=23.34µs  p(99.9)=620.68µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.36ms min=18.32ms med=92.88ms max=286.56ms p(90)=115.41ms p(95)=124.29ms p(99.9)=227.15ms
     http_reqs......................: 63326   517.383567/s
     iteration_duration.............: avg=94.91ms min=23.54ms med=93.26ms max=391.27ms p(90)=115.78ms p(95)=124.69ms p(99.9)=235.43ms
     iterations.....................: 63226   516.566551/s
     success_rate...................: 100.00% ✓ 63226      ✗ 0    
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

     checks.........................: 100.00% ✓ 137190     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   449 kB/s
     http_req_blocked...............: avg=5.94µs   min=1.16µs  med=3.41µs   max=4.66ms   p(90)=4.94µs   p(95)=5.55µs   p(99.9)=424.53µs
     http_req_connecting............: avg=2.31µs   min=0s      med=0s       max=4.61ms   p(90)=0s       p(95)=0s       p(99.9)=371.57µs
     http_req_duration..............: avg=130.73ms min=19.46ms med=128.71ms max=363.71ms p(90)=163.28ms p(95)=174.2ms  p(99.9)=223.54ms
       { expected_response:true }...: avg=130.73ms min=19.46ms med=128.71ms max=363.71ms p(90)=163.28ms p(95)=174.2ms  p(99.9)=223.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45830
     http_req_receiving.............: avg=94.04µs  min=30.7µs  med=86.16µs  max=40.23ms  p(90)=119.52µs p(95)=132.53µs p(99.9)=847.74µs
     http_req_sending...............: avg=23.88µs  min=5.75µs  med=16.28µs  max=48.88ms  p(90)=22.18µs  p(95)=24.23µs  p(99.9)=611.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.61ms min=19.35ms med=128.61ms max=362.73ms p(90)=163.17ms p(95)=174.08ms p(99.9)=223.41ms
     http_reqs......................: 45830   374.240546/s
     iteration_duration.............: avg=131.25ms min=55.37ms med=129.02ms max=393.22ms p(90)=163.57ms p(95)=174.48ms p(99.9)=226.39ms
     iterations.....................: 45730   373.423962/s
     success_rate...................: 100.00% ✓ 45730      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 86190      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=7.5µs    min=1.22µs  med=3.48µs   max=4.46ms   p(90)=4.92µs   p(95)=5.56µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.73µs   min=0s      med=0s       max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=208.08ms min=18.86ms med=202.1ms  max=754.96ms p(90)=268.08ms p(95)=311.99ms p(99.9)=661.71ms
       { expected_response:true }...: avg=208.08ms min=18.86ms med=202.1ms  max=754.96ms p(90)=268.08ms p(95)=311.99ms p(99.9)=661.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28830
     http_req_receiving.............: avg=109.06µs min=35.07µs med=96.58µs  max=86.19ms  p(90)=128.37µs p(95)=141.17µs p(99.9)=800.04µs
     http_req_sending...............: avg=26.5µs   min=6.33µs  med=17.9µs   max=66.65ms  p(90)=22.96µs  p(95)=24.86µs  p(99.9)=562.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.95ms min=18.68ms med=201.97ms max=754.86ms p(90)=267.94ms p(95)=311.73ms p(99.9)=661.61ms
     http_reqs......................: 28830   235.685884/s
     iteration_duration.............: avg=209.04ms min=60.34ms med=202.57ms max=755.19ms p(90)=268.5ms  p(95)=313.92ms p(99.9)=662.07ms
     iterations.....................: 28730   234.868382/s
     success_rate...................: 100.00% ✓ 28730      ✗ 0    
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

     checks.........................: 100.00% ✓ 85488      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.03µs   min=1.3µs   med=3.47µs   max=3.9ms    p(90)=4.92µs   p(95)=5.51µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=209.7ms  min=21.36ms med=201.72ms max=415.46ms p(90)=248.3ms  p(95)=254.54ms p(99.9)=327.32ms
       { expected_response:true }...: avg=209.7ms  min=21.36ms med=201.72ms max=415.46ms p(90)=248.3ms  p(95)=254.54ms p(99.9)=327.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28596
     http_req_receiving.............: avg=105.18µs min=34.06µs med=93.47µs  max=119.94ms p(90)=126.85µs p(95)=140.09µs p(99.9)=442.93µs
     http_req_sending...............: avg=28.36µs  min=5.98µs  med=17.64µs  max=62.76ms  p(90)=22.83µs  p(95)=24.9µs   p(99.9)=489.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.57ms min=21.25ms med=201.61ms max=414.91ms p(90)=248.18ms p(95)=254.43ms p(99.9)=327.01ms
     http_reqs......................: 28596   232.734951/s
     iteration_duration.............: avg=210.68ms min=59.41ms med=202.04ms max=453.36ms p(90)=248.63ms p(95)=254.87ms p(99.9)=334.12ms
     iterations.....................: 28496   231.921079/s
     success_rate...................: 100.00% ✓ 28496      ✗ 0    
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

