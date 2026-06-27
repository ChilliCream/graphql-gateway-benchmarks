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
| hive-router | v0.0.72 | 1,554 | 1,581 | 1,544 | 0.8% |  |
| fusion | 16.3.0 | 1,541 | 1,560 | 1,532 | 0.6% |  |
| grafbase | 0.53.5 | 1,115 | 1,135 | 1,105 | 0.8% |  |
| cosmo | 0.326.0 | 1,102 | 1,119 | 1,096 | 0.7% |  |
| hive-gateway-router-runtime | 2.9.0 | 511 | 529 | 506 | 1.5% |  |
| apollo-router | v2.15.1 | 385 | 388 | 379 | 0.8% |  |
| apollo-gateway | 2.14.1 | 230 | 233 | 224 | 1.2% |  |
| hive-gateway | 2.9.0 | 227 | 233 | 225 | 1.1% |  |
| fusion-nightly | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 568923      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=3.1µs   min=982ns   med=2.05µs  max=6.87ms   p(90)=3.85µs   p(95)=4.77µs   p(99.9)=35.34µs
     http_req_connecting............: avg=535ns   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.39ms min=14.16ms med=31.11ms max=326.37ms p(90)=37.35ms  p(95)=39.31ms  p(99.9)=58.24ms
       { expected_response:true }...: avg=31.39ms min=14.16ms med=31.11ms max=326.37ms p(90)=37.35ms  p(95)=39.31ms  p(99.9)=58.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189741
     http_req_receiving.............: avg=86.49µs min=27.81µs med=53.23µs max=230.21ms p(90)=104.59µs p(95)=149.09µs p(99.9)=2.59ms 
     http_req_sending...............: avg=32.81µs min=5.1µs   med=9.26µs  max=188.42ms p(90)=19.51µs  p(95)=33.9µs   p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.27ms min=14.01ms med=31ms    max=299.82ms p(90)=37.22ms  p(95)=39.17ms  p(99.9)=56.9ms 
     http_reqs......................: 189741  1554.952486/s
     iteration_duration.............: avg=31.63ms min=14.43ms med=31.33ms max=337.66ms p(90)=37.56ms  p(95)=39.53ms  p(99.9)=58.82ms
     iterations.....................: 189641  1554.132973/s
     success_rate...................: 100.00% ✓ 189641      ✗ 0     
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

     checks.........................: 100.00% ✓ 564111      ✗ 0     
     data_received..................: 17 GB   135 MB/s
     data_sent......................: 226 MB  1.9 MB/s
     http_req_blocked...............: avg=3.11µs  min=1µs     med=2.15µs   max=3.84ms   p(90)=3.86µs  p(95)=4.72µs   p(99.9)=34.7µs 
     http_req_connecting............: avg=484ns   min=0s      med=0s       max=3.81ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.65ms min=14.26ms med=31.1ms   max=339.17ms p(90)=38.9ms  p(95)=41.58ms  p(99.9)=60.61ms
       { expected_response:true }...: avg=31.65ms min=14.26ms med=31.1ms   max=339.17ms p(90)=38.9ms  p(95)=41.58ms  p(99.9)=60.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188137
     http_req_receiving.............: avg=604.6µs min=50.79µs med=111.53µs max=260.42ms p(90)=1.69ms  p(95)=2.65ms   p(99.9)=14.6ms 
     http_req_sending...............: avg=38.47µs min=5.21µs  med=9.36µs   max=157.77ms p(90)=19.88µs p(95)=101.39µs p(99.9)=2.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.01ms min=14.14ms med=30.49ms  max=337.97ms p(90)=38.05ms p(95)=40.67ms  p(99.9)=57.95ms
     http_reqs......................: 188137  1541.992294/s
     iteration_duration.............: avg=31.9ms  min=14.41ms med=31.32ms  max=362.83ms p(90)=39.12ms p(95)=41.8ms   p(99.9)=61.06ms
     iterations.....................: 188037  1541.172683/s
     success_rate...................: 100.00% ✓ 188037      ✗ 0     
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

     checks.........................: 100.00% ✓ 407946      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.45µs  min=982ns   med=2.19µs  max=3.67ms   p(90)=4.58µs   p(95)=5.75µs   p(99.9)=39.87µs
     http_req_connecting............: avg=622ns   min=0s      med=0s      max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.84ms min=17.41ms med=43.34ms max=328.57ms p(90)=53.29ms  p(95)=56.55ms  p(99.9)=80.54ms
       { expected_response:true }...: avg=43.84ms min=17.41ms med=43.34ms max=328.57ms p(90)=53.29ms  p(95)=56.55ms  p(99.9)=80.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136082
     http_req_receiving.............: avg=98.17µs min=30.15µs med=60.06µs max=230.92ms p(90)=131.16µs p(95)=206.48µs p(99.9)=3.17ms 
     http_req_sending...............: avg=37.86µs min=5.2µs   med=9.85µs  max=113.02ms p(90)=23.47µs  p(95)=111.85µs p(99.9)=2.47ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.7ms  min=17.36ms med=43.21ms max=323.87ms p(90)=53.14ms  p(95)=56.38ms  p(99.9)=79.95ms
     http_reqs......................: 136082  1115.147114/s
     iteration_duration.............: avg=44.11ms min=17.61ms med=43.59ms max=353.42ms p(90)=53.52ms  p(95)=56.79ms  p(99.9)=80.94ms
     iterations.....................: 135982  1114.327647/s
     success_rate...................: 100.00% ✓ 135982      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 403443      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.72µs  min=1.02µs  med=2.37µs  max=4.43ms   p(90)=4.16µs   p(95)=4.91µs   p(99.9)=39.04µs
     http_req_connecting............: avg=927ns   min=0s      med=0s      max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.36ms min=19.58ms med=43.73ms max=338.8ms  p(90)=53.97ms  p(95)=57.26ms  p(99.9)=75.67ms
       { expected_response:true }...: avg=44.36ms min=19.58ms med=43.73ms max=338.8ms  p(90)=53.97ms  p(95)=57.26ms  p(99.9)=75.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134581
     http_req_receiving.............: avg=93.99µs min=29.14µs med=67.74µs max=135.16ms p(90)=114.02µs p(95)=139.29µs p(99.9)=2.23ms 
     http_req_sending...............: avg=27.04µs min=5.25µs  med=10.96µs max=175.01ms p(90)=18.78µs  p(95)=23.27µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.24ms min=19.48ms med=43.62ms max=310.12ms p(90)=53.85ms  p(95)=57.13ms  p(99.9)=74.57ms
     http_reqs......................: 134581  1102.64737/s
     iteration_duration.............: avg=44.61ms min=21.5ms  med=43.94ms max=351.06ms p(90)=54.17ms  p(95)=57.47ms  p(99.9)=76.16ms
     iterations.....................: 134481  1101.828052/s
     success_rate...................: 100.00% ✓ 134481      ✗ 0     
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

     checks.........................: 100.00% ✓ 187689     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   615 kB/s
     http_req_blocked...............: avg=4.86µs  min=1.13µs  med=2.97µs  max=4.07ms   p(90)=4.59µs   p(95)=5.25µs   p(99.9)=51.67µs 
     http_req_connecting............: avg=1.63µs  min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.54ms min=21.34ms med=93.43ms max=366.31ms p(90)=113.82ms p(95)=121.76ms p(99.9)=226.08ms
       { expected_response:true }...: avg=95.54ms min=21.34ms med=93.43ms max=366.31ms p(90)=113.82ms p(95)=121.76ms p(99.9)=226.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62663
     http_req_receiving.............: avg=94.04µs min=31.39µs med=78.92µs max=205.57ms p(90)=114.4µs  p(95)=127.87µs p(99.9)=976.94µs
     http_req_sending...............: avg=26.68µs min=5.83µs  med=13.64µs max=121.66ms p(90)=20.15µs  p(95)=22.56µs  p(99.9)=723.18µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.42ms min=21.21ms med=93.32ms max=365.6ms  p(90)=113.7ms  p(95)=121.62ms p(99.9)=225.75ms
     http_reqs......................: 62663   511.749654/s
     iteration_duration.............: avg=95.91ms min=30.38ms med=93.69ms max=376.79ms p(90)=114.06ms p(95)=122.06ms p(99.9)=228.74ms
     iterations.....................: 62563   510.932985/s
     success_rate...................: 100.00% ✓ 62563      ✗ 0    
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

     checks.........................: 100.00% ✓ 141498     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 57 MB   463 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.1µs   med=3.7µs    max=4.03ms   p(90)=5.31µs   p(95)=5.94µs   p(99.9)=240.23µs
     http_req_connecting............: avg=2.14µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=196.2µs 
     http_req_duration..............: avg=126.73ms min=20.03ms med=124.74ms max=359.28ms p(90)=158ms    p(95)=168.55ms p(99.9)=214.44ms
       { expected_response:true }...: avg=126.73ms min=20.03ms med=124.74ms max=359.28ms p(90)=158ms    p(95)=168.55ms p(99.9)=214.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47266
     http_req_receiving.............: avg=95.18µs  min=30.81µs med=88µs     max=41.05ms  p(90)=122.33µs p(95)=135.79µs p(99.9)=864.01µs
     http_req_sending...............: avg=29.74µs  min=5.57µs  med=16.82µs  max=167.52ms p(90)=22.67µs  p(95)=24.8µs   p(99.9)=649.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=126.61ms min=19.87ms med=124.62ms max=358.69ms p(90)=157.88ms p(95)=168.43ms p(99.9)=213.68ms
     http_reqs......................: 47266   385.877018/s
     iteration_duration.............: avg=127.24ms min=41.68ms med=125.05ms max=374.87ms p(90)=158.3ms  p(95)=168.89ms p(99.9)=216.94ms
     iterations.....................: 47166   385.060623/s
     success_rate...................: 100.00% ✓ 47166      ✗ 0    
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

     checks.........................: 100.00% ✓ 84612      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   277 kB/s
     http_req_blocked...............: avg=5.66µs   min=1.22µs  med=3.37µs   max=4.2ms    p(90)=4.81µs   p(95)=5.41µs   p(99.9)=872.04µs
     http_req_connecting............: avg=1.95µs   min=0s      med=0s       max=2.69ms   p(90)=0s       p(95)=0s       p(99.9)=821.9µs 
     http_req_duration..............: avg=211.91ms min=23.82ms med=211.57ms max=387.12ms p(90)=226.36ms p(95)=231.79ms p(99.9)=317.32ms
       { expected_response:true }...: avg=211.91ms min=23.82ms med=211.57ms max=387.12ms p(90)=226.36ms p(95)=231.79ms p(99.9)=317.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28304
     http_req_receiving.............: avg=101.92µs min=31.89µs med=93.05µs  max=90.87ms  p(90)=125.37µs p(95)=137.96µs p(99.9)=855.93µs
     http_req_sending...............: avg=30.14µs  min=6.13µs  med=16.93µs  max=61.4ms   p(90)=22.09µs  p(95)=24.1µs   p(99.9)=648.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.78ms min=23.65ms med=211.46ms max=386.64ms p(90)=226.22ms p(95)=231.65ms p(99.9)=316.69ms
     http_reqs......................: 28304   230.383977/s
     iteration_duration.............: avg=212.87ms min=68.83ms med=211.88ms max=408.64ms p(90)=226.62ms p(95)=232.09ms p(99.9)=320.75ms
     iterations.....................: 28204   229.570014/s
     success_rate...................: 100.00% ✓ 28204      ✗ 0    
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

     checks.........................: 100.00% ✓ 83097      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   273 kB/s
     http_req_blocked...............: avg=7.45µs   min=1.25µs  med=3.56µs   max=3.87ms   p(90)=5.04µs   p(95)=5.64µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=3.7µs    min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=215.75ms min=19.41ms med=200.38ms max=693.05ms p(90)=257.11ms p(95)=294.2ms  p(99.9)=644.09ms
       { expected_response:true }...: avg=215.75ms min=19.41ms med=200.38ms max=693.05ms p(90)=257.11ms p(95)=294.2ms  p(99.9)=644.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27799
     http_req_receiving.............: avg=105.53µs min=33.16µs med=95.9µs   max=105.77ms p(90)=127.44µs p(95)=140.76µs p(99.9)=564.8µs 
     http_req_sending...............: avg=32.3µs   min=6.02µs  med=17.33µs  max=130.98ms p(90)=22.38µs  p(95)=24.17µs  p(99.9)=731.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.62ms min=19.24ms med=200.26ms max=692.96ms p(90)=256.97ms p(95)=294.04ms p(99.9)=643.98ms
     http_reqs......................: 27799   227.064862/s
     iteration_duration.............: avg=216.75ms min=62.59ms med=200.85ms max=693.29ms p(90)=257.54ms p(95)=296.32ms p(99.9)=644.33ms
     iterations.....................: 27699   226.248052/s
     success_rate...................: 100.00% ✓ 27699      ✗ 0    
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

