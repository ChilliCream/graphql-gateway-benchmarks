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
| hive-router | v0.0.65 | 1,574 | 1,604 | 1,569 | 0.8% |  |
| hotchocolate | 16.1.3 | 1,452 | 1,470 | 1,443 | 0.6% |  |
| grafbase | 0.53.5 | 1,130 | 1,153 | 1,122 | 1.0% |  |
| cosmo | 0.321.1 | 1,102 | 1,109 | 1,090 | 0.8% | non-compatible response (3 across 5/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 518 | 531 | 512 | 1.2% |  |
| apollo-router | v2.15.0 | 408 | 418 | 404 | 1.1% |  |
| apollo-gateway | 2.14.1 | 237 | 238 | 236 | 0.3% |  |
| hive-gateway | 2.8.2 | 234 | 239 | 232 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 575985      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.5µs   min=1.04µs  med=2.54µs  max=3.77ms   p(90)=4.4µs    p(95)=5.35µs  p(99.9)=38.25µs
     http_req_connecting............: avg=504ns   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=31ms    min=13.97ms med=30.72ms max=332.59ms p(90)=36.91ms  p(95)=38.94ms p(99.9)=58.34ms
       { expected_response:true }...: avg=31ms    min=13.97ms med=30.72ms max=332.59ms p(90)=36.91ms  p(95)=38.94ms p(99.9)=58.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192095
     http_req_receiving.............: avg=85.7µs  min=27.05µs med=54.66µs max=27.44ms  p(90)=106.45µs p(95)=155.3µs p(99.9)=2.45ms 
     http_req_sending...............: avg=35.68µs min=5.14µs  med=10.11µs max=85.55ms  p(90)=20.19µs  p(95)=62.16µs p(99.9)=2.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.88ms min=13.91ms med=30.61ms max=331.9ms  p(90)=36.78ms  p(95)=38.79ms p(99.9)=57.21ms
     http_reqs......................: 192095  1574.456672/s
     iteration_duration.............: avg=31.24ms min=14.18ms med=30.94ms max=352.45ms p(90)=37.13ms  p(95)=39.16ms p(99.9)=58.78ms
     iterations.....................: 191995  1573.637048/s
     success_rate...................: 100.00% ✓ 191995      ✗ 0     
     vus............................: 39      min=0         max=50  
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

     checks.........................: 100.00% ✓ 531564      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.44µs   min=982ns   med=2.39µs   max=4.72ms   p(90)=4.25µs  p(95)=5.17µs   p(99.9)=31.95µs
     http_req_connecting............: avg=598ns    min=0s      med=0s       max=4.69ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.6ms   min=14.21ms med=32.49ms  max=484.34ms p(90)=41.21ms p(95)=44.71ms  p(99.9)=82.76ms
       { expected_response:true }...: avg=33.6ms   min=14.21ms med=32.49ms  max=484.34ms p(90)=41.21ms p(95)=44.71ms  p(99.9)=82.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177288
     http_req_receiving.............: avg=763.36µs min=51.54µs med=113.01µs max=189.61ms p(90)=2.26ms  p(95)=3.41ms   p(99.9)=15.32ms
     http_req_sending...............: avg=38.28µs  min=5.25µs  med=9.61µs   max=221.67ms p(90)=20.91µs p(95)=109.38µs p(99.9)=2.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.8ms   min=14.08ms med=31.7ms   max=481.46ms p(90)=40.18ms p(95)=43.6ms   p(99.9)=80.91ms
     http_reqs......................: 177288  1452.983495/s
     iteration_duration.............: avg=33.85ms  min=14.46ms med=32.72ms  max=484.59ms p(90)=41.43ms p(95)=44.94ms  p(99.9)=83.28ms
     iterations.....................: 177188  1452.163934/s
     success_rate...................: 100.00% ✓ 177188      ✗ 0     
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

     checks.........................: 100.00% ✓ 413514      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.55µs  min=1µs     med=2.39µs  max=3.38ms   p(90)=4.89µs   p(95)=5.99µs   p(99.9)=44.91µs
     http_req_connecting............: avg=524ns   min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.24ms min=15.25ms med=42.81ms max=354.01ms p(90)=52.64ms  p(95)=55.73ms  p(99.9)=79.85ms
       { expected_response:true }...: avg=43.24ms min=15.25ms med=42.81ms max=354.01ms p(90)=52.64ms  p(95)=55.73ms  p(99.9)=79.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137938
     http_req_receiving.............: avg=96.24µs min=29.08µs med=58.89µs max=211.12ms p(90)=129.93µs p(95)=198.8µs  p(99.9)=2.88ms 
     http_req_sending...............: avg=37.12µs min=5.1µs   med=9.99µs  max=67.6ms   p(90)=23.63µs  p(95)=111.37µs p(99.9)=2.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.11ms min=15.11ms med=42.69ms max=353.61ms p(90)=52.5ms   p(95)=55.58ms  p(99.9)=79.63ms
     http_reqs......................: 137938  1130.414025/s
     iteration_duration.............: avg=43.52ms min=16.31ms med=43.06ms max=369.47ms p(90)=52.88ms  p(95)=55.97ms  p(99.9)=80.52ms
     iterations.....................: 137838  1129.594517/s
     success_rate...................: 100.00% ✓ 137838      ✗ 0     
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

     checks.........................: 100.00% ✓ 403182      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.63µs  min=1.07µs  med=2.53µs  max=4.41ms   p(90)=4.14µs   p(95)=4.85µs   p(99.9)=36.53µs
     http_req_connecting............: avg=728ns   min=0s      med=0s      max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.39ms min=17.57ms med=43.82ms max=323.81ms p(90)=53.96ms  p(95)=57.18ms  p(99.9)=73.48ms
       { expected_response:true }...: avg=44.39ms min=17.57ms med=43.82ms max=323.81ms p(90)=53.96ms  p(95)=57.18ms  p(99.9)=73.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134494
     http_req_receiving.............: avg=84.17µs min=29.12µs med=63.87µs max=35.48ms  p(90)=106.62µs p(95)=131.21µs p(99.9)=1.82ms 
     http_req_sending...............: avg=24.66µs min=5.4µs   med=10.8µs  max=48.73ms  p(90)=18.01µs  p(95)=22.43µs  p(99.9)=1.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.28ms min=17.47ms med=43.72ms max=323.3ms  p(90)=53.85ms  p(95)=57.07ms  p(99.9)=73.1ms 
     http_reqs......................: 134494  1102.199027/s
     iteration_duration.............: avg=44.63ms min=20.44ms med=44.03ms max=358.75ms p(90)=54.17ms  p(95)=57.39ms  p(99.9)=73.81ms
     iterations.....................: 134394  1101.379512/s
     success_rate...................: 100.00% ✓ 134394      ✗ 0     
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

     checks.........................: 100.00% ✓ 190344     ✗ 0    
     data_received..................: 5.6 GB  45 MB/s
     data_sent......................: 76 MB   623 kB/s
     http_req_blocked...............: avg=5.31µs   min=1.21µs  med=3.32µs  max=4.15ms   p(90)=4.95µs   p(95)=5.61µs   p(99.9)=55.3µs  
     http_req_connecting............: avg=1.7µs    min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.21ms  min=19.39ms med=91.88ms max=361.17ms p(90)=114.61ms p(95)=124.13ms p(99.9)=229.84ms
       { expected_response:true }...: avg=94.21ms  min=19.39ms med=91.88ms max=361.17ms p(90)=114.61ms p(95)=124.13ms p(99.9)=229.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63548
     http_req_receiving.............: avg=131.98µs min=33.46µs med=79.7µs  max=167.77ms p(90)=115.92µs p(95)=130.58µs p(99.9)=1.17ms  
     http_req_sending...............: avg=36.12µs  min=5.76µs  med=14.25µs max=219.15ms p(90)=20.88µs  p(95)=23.32µs  p(99.9)=712.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.05ms  min=19.24ms med=91.77ms max=268.46ms p(90)=114.46ms p(95)=123.9ms  p(99.9)=225.58ms
     http_reqs......................: 63548   518.86612/s
     iteration_duration.............: avg=94.58ms  min=21.81ms med=92.13ms max=378.53ms p(90)=114.85ms p(95)=124.44ms p(99.9)=231.07ms
     iterations.....................: 63448   518.049625/s
     success_rate...................: 100.00% ✓ 63448      ✗ 0    
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

     checks.........................: 100.00% ✓ 149655     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   490 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.18µs  med=3.72µs   max=4.21ms   p(90)=5.36µs   p(95)=6µs      p(99.9)=208.39µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=83.4µs  
     http_req_duration..............: avg=119.82ms min=19.77ms med=118.17ms max=358.76ms p(90)=148.67ms p(95)=158.53ms p(99.9)=203.18ms
       { expected_response:true }...: avg=119.82ms min=19.77ms med=118.17ms max=358.76ms p(90)=148.67ms p(95)=158.53ms p(99.9)=203.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49985
     http_req_receiving.............: avg=156.19µs min=32.16µs med=85.45µs  max=178.64ms p(90)=118.76µs p(95)=131.87µs p(99.9)=1.3ms   
     http_req_sending...............: avg=25.81µs  min=5.44µs  med=16.42µs  max=62.93ms  p(90)=22.22µs  p(95)=24.32µs  p(99.9)=640.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.64ms min=19.66ms med=118.04ms max=233.64ms p(90)=148.51ms p(95)=158.35ms p(99.9)=201.35ms
     http_reqs......................: 49985   408.214231/s
     iteration_duration.............: avg=120.29ms min=27.95ms med=118.47ms max=387.74ms p(90)=148.96ms p(95)=158.82ms p(99.9)=205.68ms
     iterations.....................: 49885   407.397557/s
     success_rate...................: 100.00% ✓ 49885      ✗ 0    
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

     checks.........................: 100.00% ✓ 87387      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.35µs   min=1.32µs  med=3.69µs   max=4.44ms   p(90)=5.15µs   p(95)=5.79µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=3.44µs   min=0s      med=0s       max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=205.14ms min=22.11ms med=202.38ms max=428.8ms  p(90)=234.45ms p(95)=240.92ms p(99.9)=317.12ms
       { expected_response:true }...: avg=205.14ms min=22.11ms med=202.38ms max=428.8ms  p(90)=234.45ms p(95)=240.92ms p(99.9)=317.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29229
     http_req_receiving.............: avg=104.68µs min=35.37µs med=91.81µs  max=83.9ms   p(90)=125.14µs p(95)=138.69µs p(99.9)=558.74µs
     http_req_sending...............: avg=35.44µs  min=6.03µs  med=17.4µs   max=117.66ms p(90)=22.58µs  p(95)=24.59µs  p(99.9)=676.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205ms    min=21.91ms med=202.26ms max=425.18ms p(90)=234.33ms p(95)=240.8ms  p(99.9)=316.99ms
     http_reqs......................: 29229   237.907091/s
     iteration_duration.............: avg=206.09ms min=65.31ms med=202.92ms max=469.91ms p(90)=234.73ms p(95)=241.26ms p(99.9)=327.95ms
     iterations.....................: 29129   237.093149/s
     success_rate...................: 100.00% ✓ 29129      ✗ 0    
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

     checks.........................: 100.00% ✓ 85557      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=7.58µs   min=1.38µs  med=3.83µs   max=4.12ms   p(90)=5.33µs   p(95)=5.97µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=209.56ms min=18.96ms med=195.12ms max=756.28ms p(90)=243.28ms p(95)=270.29ms p(99.9)=678.08ms
       { expected_response:true }...: avg=209.56ms min=18.96ms med=195.12ms max=756.28ms p(90)=243.28ms p(95)=270.29ms p(99.9)=678.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28619
     http_req_receiving.............: avg=102.95µs min=34.7µs  med=97.92µs  max=29.68ms  p(90)=130.19µs p(95)=143.69µs p(99.9)=586.09µs
     http_req_sending...............: avg=28.68µs  min=6.32µs  med=17.99µs  max=54.82ms  p(90)=23.19µs  p(95)=25.06µs  p(99.9)=609.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.43ms min=18.8ms  med=195ms    max=756.14ms p(90)=243.16ms p(95)=270.16ms p(99.9)=677.96ms
     http_reqs......................: 28619   234.103193/s
     iteration_duration.............: avg=210.53ms min=63.95ms med=195.53ms max=756.5ms  p(90)=243.67ms p(95)=271.39ms p(99.9)=678.37ms
     iterations.....................: 28519   233.285194/s
     success_rate...................: 100.00% ✓ 28519      ✗ 0    
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

