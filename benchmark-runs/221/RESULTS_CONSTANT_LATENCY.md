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
| hive-router | v0.0.65 | 1,575 | 1,601 | 1,566 | 0.7% |  |
| hotchocolate | 16.1.3 | 1,439 | 1,456 | 1,434 | 0.5% |  |
| grafbase | 0.53.5 | 1,135 | 1,149 | 1,131 | 0.6% |  |
| cosmo | 0.321.1 | 1,109 | 1,121 | 1,102 | 0.7% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 532 | 546 | 528 | 1.1% |  |
| apollo-router | v2.15.0 | 372 | 385 | 367 | 1.6% |  |
| hive-gateway | 2.8.2 | 240 | 245 | 237 | 1.1% |  |
| apollo-gateway | 2.14.1 | 229 | 232 | 228 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 576381      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.31µs  min=1.02µs  med=2.29µs  max=3.98ms   p(90)=4.1µs    p(95)=5.04µs   p(99.9)=37.79µs
     http_req_connecting............: avg=526ns   min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.98ms min=14.59ms med=30.72ms max=344.6ms  p(90)=36.82ms  p(95)=38.77ms  p(99.9)=57.79ms
       { expected_response:true }...: avg=30.98ms min=14.59ms med=30.72ms max=344.6ms  p(90)=36.82ms  p(95)=38.77ms  p(99.9)=57.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192227
     http_req_receiving.............: avg=85.37µs min=27.34µs med=54.17µs max=78.97ms  p(90)=105.82µs p(95)=153.94µs p(99.9)=2.55ms 
     http_req_sending...............: avg=33.94µs min=5.14µs  med=9.6µs   max=122.96ms p(90)=19.98µs  p(95)=42.11µs  p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.86ms min=14.54ms med=30.62ms max=343.75ms p(90)=36.69ms  p(95)=38.63ms  p(99.9)=57.1ms 
     http_reqs......................: 192227  1575.517267/s
     iteration_duration.............: avg=31.22ms min=14.73ms med=30.95ms max=351.68ms p(90)=37.04ms  p(95)=38.98ms  p(99.9)=58.16ms
     iterations.....................: 192127  1574.697654/s
     success_rate...................: 100.00% ✓ 192127      ✗ 0     
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

     checks.........................: 100.00% ✓ 526404      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.16µs   min=952ns   med=2.1µs    max=4.11ms   p(90)=3.8µs   p(95)=4.7µs    p(99.9)=33.24µs
     http_req_connecting............: avg=603ns    min=0s      med=0s       max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.94ms  min=13.94ms med=32.67ms  max=487.47ms p(90)=41.61ms p(95)=45.22ms  p(99.9)=85.5ms 
       { expected_response:true }...: avg=33.94ms  min=13.94ms med=32.67ms  max=487.47ms p(90)=41.61ms p(95)=45.22ms  p(99.9)=85.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 175568
     http_req_receiving.............: avg=827.42µs min=50.3µs  med=116.59µs max=261.3ms  p(90)=2.38ms  p(95)=3.55ms   p(99.9)=16.68ms
     http_req_sending...............: avg=35.52µs  min=5.09µs  med=8.92µs   max=95.87ms  p(90)=19.4µs  p(95)=102.98µs p(99.9)=2.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.08ms  min=13.79ms med=31.85ms  max=486.92ms p(90)=40.43ms p(95)=43.97ms  p(99.9)=82.99ms
     http_reqs......................: 175568  1439.090227/s
     iteration_duration.............: avg=34.18ms  min=14.2ms  med=32.9ms   max=487.83ms p(90)=41.82ms p(95)=45.44ms  p(99.9)=89.67ms
     iterations.....................: 175468  1438.270551/s
     success_rate...................: 100.00% ✓ 175468      ✗ 0     
     vus............................: 40      min=0         max=50  
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

     checks.........................: 100.00% ✓ 415455      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.69µs   min=1µs     med=2.23µs  max=8.86ms   p(90)=4.63µs   p(95)=5.79µs   p(99.9)=46.46µs
     http_req_connecting............: avg=711ns    min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.05ms  min=16.67ms med=42.61ms max=348.78ms p(90)=52.34ms  p(95)=55.59ms  p(99.9)=81.03ms
       { expected_response:true }...: avg=43.05ms  min=16.67ms med=42.61ms max=348.78ms p(90)=52.34ms  p(95)=55.59ms  p(99.9)=81.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138585
     http_req_receiving.............: avg=104.47µs min=29.23µs med=59.33µs max=101.95ms p(90)=129.55µs p(95)=197.48µs p(99.9)=3.61ms 
     http_req_sending...............: avg=35.96µs  min=5.19µs  med=9.7µs   max=129.3ms  p(90)=23.3µs   p(95)=109.34µs p(99.9)=2.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.91ms  min=16.52ms med=42.49ms max=255.74ms p(90)=52.21ms  p(95)=55.43ms  p(99.9)=80.42ms
     http_reqs......................: 138585  1135.652343/s
     iteration_duration.............: avg=43.32ms  min=17.02ms med=42.85ms max=360.54ms p(90)=52.58ms  p(95)=55.83ms  p(99.9)=81.26ms
     iterations.....................: 138485  1134.83288/s
     success_rate...................: 100.00% ✓ 138485      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 406032      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=3.23µs  min=1.03µs  med=2.13µs  max=3.77ms   p(90)=3.67µs   p(95)=4.42µs   p(99.9)=34.73µs
     http_req_connecting............: avg=727ns   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.09ms min=19.18ms med=43.49ms max=343.84ms p(90)=53.57ms  p(95)=56.78ms  p(99.9)=74.12ms
       { expected_response:true }...: avg=44.09ms min=19.18ms med=43.49ms max=343.84ms p(90)=53.57ms  p(95)=56.78ms  p(99.9)=74.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135444
     http_req_receiving.............: avg=82.46µs min=27.77µs med=59.96µs max=259.66ms p(90)=102.76µs p(95)=127.08µs p(99.9)=1.7ms  
     http_req_sending...............: avg=25.17µs min=5.26µs  med=9.95µs  max=225.47ms p(90)=17.37µs  p(95)=21.63µs  p(99.9)=1.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.98ms min=19.08ms med=43.39ms max=343.28ms p(90)=53.47ms  p(95)=56.66ms  p(99.9)=73.98ms
     http_reqs......................: 135444  1109.954424/s
     iteration_duration.............: avg=44.32ms min=19.76ms med=43.69ms max=357.39ms p(90)=53.77ms  p(95)=56.98ms  p(99.9)=74.57ms
     iterations.....................: 135344  1109.134931/s
     success_rate...................: 100.00% ✓ 135344      ✗ 0     
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

     checks.........................: 100.00% ✓ 195339     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   640 kB/s
     http_req_blocked...............: avg=7.71µs  min=1.19µs  med=3.1µs   max=11.23ms  p(90)=4.78µs   p(95)=5.49µs   p(99.9)=53.62µs 
     http_req_connecting............: avg=4.24µs  min=0s      med=0s      max=11.17ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.79ms min=21.7ms  med=90.32ms max=372.35ms p(90)=107.46ms p(95)=115.04ms p(99.9)=216.18ms
       { expected_response:true }...: avg=91.79ms min=21.7ms  med=90.32ms max=372.35ms p(90)=107.46ms p(95)=115.04ms p(99.9)=216.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65213
     http_req_receiving.............: avg=90.27µs min=31.67µs med=78.97µs max=126.11ms p(90)=116.72µs p(95)=131.76µs p(99.9)=919.8µs 
     http_req_sending...............: avg=24.6µs  min=5.61µs  med=14.01µs max=118.63ms p(90)=21.19µs  p(95)=23.75µs  p(99.9)=719.29µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.67ms min=21.53ms med=90.21ms max=356.25ms p(90)=107.35ms p(95)=114.92ms p(99.9)=216.01ms
     http_reqs......................: 65213   532.819362/s
     iteration_duration.............: avg=92.16ms min=40.07ms med=90.56ms max=381.51ms p(90)=107.7ms  p(95)=115.3ms  p(99.9)=218.92ms
     iterations.....................: 65113   532.002318/s
     success_rate...................: 100.00% ✓ 65113      ✗ 0    
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

     checks.........................: 100.00% ✓ 136413     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   447 kB/s
     http_req_blocked...............: avg=4.31µs   min=1.3µs   med=3.29µs   max=1.92ms   p(90)=4.81µs   p(95)=5.42µs   p(99.9)=167.63µs
     http_req_connecting............: avg=825ns    min=0s      med=0s       max=1.89ms   p(90)=0s       p(95)=0s       p(99.9)=117.23µs
     http_req_duration..............: avg=131.49ms min=20.06ms med=129.41ms max=371.42ms p(90)=164.41ms p(95)=175.82ms p(99.9)=224.92ms
       { expected_response:true }...: avg=131.49ms min=20.06ms med=129.41ms max=371.42ms p(90)=164.41ms p(95)=175.82ms p(99.9)=224.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45571
     http_req_receiving.............: avg=92.2µs   min=30.69µs med=83.7µs   max=121.97ms p(90)=117.85µs p(95)=130.71µs p(99.9)=828.45µs
     http_req_sending...............: avg=30.61µs  min=5.83µs  med=15.08µs  max=145.25ms p(90)=21.18µs  p(95)=23.37µs  p(99.9)=633.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=131.36ms min=19.84ms med=129.3ms  max=358.1ms  p(90)=164.28ms p(95)=175.69ms p(99.9)=224.63ms
     http_reqs......................: 45571   372.127758/s
     iteration_duration.............: avg=132ms    min=46.18ms med=129.71ms max=377.43ms p(90)=164.7ms  p(95)=176.1ms  p(99.9)=228.75ms
     iterations.....................: 45471   371.311169/s
     success_rate...................: 100.00% ✓ 45471      ✗ 0    
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

     checks.........................: 100.00% ✓ 87756      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.2µs   med=3.61µs   max=4.1ms    p(90)=5.19µs   p(95)=5.83µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=204.29ms min=19.31ms med=188.13ms max=682.8ms  p(90)=246.53ms p(95)=286.72ms p(99.9)=632.12ms
       { expected_response:true }...: avg=204.29ms min=19.31ms med=188.13ms max=682.8ms  p(90)=246.53ms p(95)=286.72ms p(99.9)=632.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29352
     http_req_receiving.............: avg=103.05µs min=32.94µs med=98.03µs  max=31.08ms  p(90)=130.96µs p(95)=144.41µs p(99.9)=782.16µs
     http_req_sending...............: avg=28.91µs  min=6.02µs  med=18.12µs  max=97.82ms  p(90)=23.55µs  p(95)=25.53µs  p(99.9)=593.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.16ms min=19.22ms med=188.01ms max=682.67ms p(90)=246.37ms p(95)=286.39ms p(99.9)=632.01ms
     http_reqs......................: 29352   240.098423/s
     iteration_duration.............: avg=205.24ms min=63.37ms med=188.55ms max=683.12ms p(90)=247.04ms p(95)=289.62ms p(99.9)=632.46ms
     iterations.....................: 29252   239.280426/s
     success_rate...................: 100.00% ✓ 29252      ✗ 0    
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

     checks.........................: 100.00% ✓ 84204      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   275 kB/s
     http_req_blocked...............: avg=7.17µs   min=1.27µs  med=3.41µs   max=3.81ms   p(90)=4.87µs   p(95)=5.46µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=212.94ms min=21.87ms med=217.43ms max=418.36ms p(90)=261.95ms p(95)=266.41ms p(99.9)=345.05ms
       { expected_response:true }...: avg=212.94ms min=21.87ms med=217.43ms max=418.36ms p(90)=261.95ms p(95)=266.41ms p(99.9)=345.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28168
     http_req_receiving.............: avg=97.41µs  min=33.51µs med=92.12µs  max=12.96ms  p(90)=126.07µs p(95)=139.23µs p(99.9)=624.67µs
     http_req_sending...............: avg=34.04µs  min=6.13µs  med=16.24µs  max=135.31ms p(90)=21.93µs  p(95)=24.04µs  p(99.9)=628.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=212.81ms min=21.71ms med=217.3ms  max=417.69ms p(90)=261.82ms p(95)=266.27ms p(99.9)=344.94ms
     http_reqs......................: 28168   229.220052/s
     iteration_duration.............: avg=213.9ms  min=53.29ms med=227.72ms max=443.35ms p(90)=262.25ms p(95)=266.69ms p(99.9)=347.31ms
     iterations.....................: 28068   228.406292/s
     success_rate...................: 100.00% ✓ 28068      ✗ 0    
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

