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
| hive-router | v0.0.49 | 1,585 | 1,612 | 1,575 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,466 | 1,478 | 1,454 | 0.5% |  |
| grafbase | 0.53.3 | 1,150 | 1,174 | 1,145 | 0.8% |  |
| cosmo | 0.307.0 | 1,135 | 1,156 | 1,132 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 511 | 523 | 506 | 1.2% |  |
| apollo-router | v2.13.1 | 382 | 385 | 378 | 0.5% |  |
| hive-gateway | 2.5.25 | 241 | 245 | 239 | 0.9% |  |
| apollo-gateway | 2.13.3 | 236 | 237 | 235 | 0.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579921      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.19µs   min=990ns   med=2.23µs  max=9.3ms    p(90)=4.07µs   p(95)=5.01µs   p(99.9)=33.16µs
     http_req_connecting............: avg=419ns    min=0s      med=0s      max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.79ms  min=13.8ms  med=30.55ms max=320.3ms  p(90)=36.55ms  p(95)=38.46ms  p(99.9)=57.45ms
       { expected_response:true }...: avg=30.79ms  min=13.8ms  med=30.55ms max=320.3ms  p(90)=36.55ms  p(95)=38.46ms  p(99.9)=57.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193407
     http_req_receiving.............: avg=100.76µs min=26.99µs med=52.68µs max=235.86ms p(90)=103.84µs p(95)=147.69µs p(99.9)=2.59ms 
     http_req_sending...............: avg=33.09µs  min=5.07µs  med=9.67µs  max=40.46ms  p(90)=20.11µs  p(95)=36.68µs  p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.65ms  min=13.74ms med=30.44ms max=270.83ms p(90)=36.43ms  p(95)=38.32ms  p(99.9)=55.58ms
     http_reqs......................: 193407  1585.019487/s
     iteration_duration.............: avg=31.03ms  min=13.95ms med=30.77ms max=342.25ms p(90)=36.76ms  p(95)=38.68ms  p(99.9)=57.91ms
     iterations.....................: 193307  1584.199962/s
     success_rate...................: 100.00% ✓ 193307      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 536466      ✗ 0     
     data_received..................: 16 GB   129 MB/s
     data_sent......................: 215 MB  1.8 MB/s
     http_req_blocked...............: avg=3.18µs  min=982ns   med=2.11µs   max=4.64ms   p(90)=3.78µs  p(95)=4.63µs   p(99.9)=26.73µs
     http_req_connecting............: avg=580ns   min=0s      med=0s       max=4.6ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.3ms  min=14.22ms med=32.22ms  max=522.46ms p(90)=40.94ms p(95)=44.2ms   p(99.9)=85.74ms
       { expected_response:true }...: avg=33.3ms  min=14.22ms med=32.22ms  max=522.46ms p(90)=40.94ms p(95)=44.2ms   p(99.9)=85.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178922
     http_req_receiving.............: avg=767.8µs min=51.18µs med=113.89µs max=141.69ms p(90)=2.21ms  p(95)=3.35ms   p(99.9)=15.25ms
     http_req_sending...............: avg=36.65µs min=4.84µs  med=9.09µs   max=109.02ms p(90)=19.85µs p(95)=102.23µs p(99.9)=2.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.5ms  min=14.06ms med=31.46ms  max=519.96ms p(90)=39.89ms p(95)=43ms     p(99.9)=84.45ms
     http_reqs......................: 178922  1466.098531/s
     iteration_duration.............: avg=33.54ms min=14.4ms  med=32.44ms  max=522.62ms p(90)=41.15ms p(95)=44.43ms  p(99.9)=87.6ms 
     iterations.....................: 178822  1465.279125/s
     success_rate...................: 100.00% ✓ 178822      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 420867      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.6µs   min=981ns   med=2.22µs  max=4.32ms   p(90)=4.57µs   p(95)=5.66µs   p(99.9)=42.77µs
     http_req_connecting............: avg=740ns   min=0s      med=0s      max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.5ms  min=17.08ms med=41.98ms max=357.9ms  p(90)=51.66ms  p(95)=54.96ms  p(99.9)=77.7ms 
       { expected_response:true }...: avg=42.5ms  min=17.08ms med=41.98ms max=357.9ms  p(90)=51.66ms  p(95)=54.96ms  p(99.9)=77.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 140389
     http_req_receiving.............: avg=142.9µs min=30.35µs med=58.38µs max=309.57ms p(90)=130.53µs p(95)=201.17µs p(99.9)=3.65ms 
     http_req_sending...............: avg=36.08µs min=5.27µs  med=9.87µs  max=31.23ms  p(90)=23.65µs  p(95)=109.54µs p(99.9)=2.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.33ms min=16.93ms med=41.86ms max=109.48ms p(90)=51.5ms   p(95)=54.77ms  p(99.9)=75.58ms
     http_reqs......................: 140389  1150.342734/s
     iteration_duration.............: avg=42.76ms min=17.87ms med=42.23ms max=369.19ms p(90)=51.89ms  p(95)=55.19ms  p(99.9)=78.01ms
     iterations.....................: 140289  1149.523337/s
     success_rate...................: 100.00% ✓ 140289      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 415515      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.22µs  min=1.03µs  med=2.07µs  max=4.24ms   p(90)=3.54µs   p(95)=4.3µs    p(99.9)=32.71µs
     http_req_connecting............: avg=799ns   min=0s      med=0s      max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.08ms min=19.28ms med=42.46ms max=283.76ms p(90)=52.51ms  p(95)=55.63ms  p(99.9)=72.18ms
       { expected_response:true }...: avg=43.08ms min=19.28ms med=42.46ms max=283.76ms p(90)=52.51ms  p(95)=55.63ms  p(99.9)=72.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138605
     http_req_receiving.............: avg=80.11µs min=29.03µs med=60.85µs max=26.09ms  p(90)=103.61µs p(95)=128.03µs p(99.9)=1.63ms 
     http_req_sending...............: avg=25µs    min=4.93µs  med=10.07µs max=148.5ms  p(90)=17.57µs  p(95)=21.91µs  p(99.9)=1.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.97ms min=19.13ms med=42.36ms max=283.33ms p(90)=52.39ms  p(95)=55.52ms  p(99.9)=71.87ms
     http_reqs......................: 138605  1135.680091/s
     iteration_duration.............: avg=43.31ms min=20.87ms med=42.66ms max=360.51ms p(90)=52.7ms   p(95)=55.83ms  p(99.9)=72.42ms
     iterations.....................: 138505  1134.860727/s
     success_rate...................: 100.00% ✓ 138505      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 187683     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   615 kB/s
     http_req_blocked...............: avg=4.9µs    min=1.1µs   med=2.91µs  max=4.45ms   p(90)=4.54µs   p(95)=5.17µs   p(99.9)=47.86µs 
     http_req_connecting............: avg=1.71µs   min=0s      med=0s      max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.56ms  min=20.66ms med=93.71ms max=361.91ms p(90)=111.46ms p(95)=121.29ms p(99.9)=215.57ms
       { expected_response:true }...: avg=95.56ms  min=20.66ms med=93.71ms max=361.91ms p(90)=111.46ms p(95)=121.29ms p(99.9)=215.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62661
     http_req_receiving.............: avg=159.53µs min=32.45µs med=78.17µs max=245.37ms p(90)=114.84µs p(95)=128.76µs p(99.9)=1.2ms   
     http_req_sending...............: avg=20.72µs  min=5.61µs  med=13.99µs max=22.04ms  p(90)=20.93µs  p(95)=23.33µs  p(99.9)=670.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.38ms  min=20.49ms med=93.61ms max=234.96ms p(90)=111.35ms p(95)=120.94ms p(99.9)=213ms   
     http_reqs......................: 62661   511.788617/s
     iteration_duration.............: avg=95.91ms  min=30.5ms  med=93.95ms max=384.48ms p(90)=111.7ms  p(95)=121.63ms p(99.9)=216.8ms 
     iterations.....................: 62561   510.971859/s
     success_rate...................: 100.00% ✓ 62561      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 140349     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 56 MB   460 kB/s
     http_req_blocked...............: avg=5.4µs    min=1.18µs  med=3.15µs   max=3.96ms   p(90)=4.6µs    p(95)=5.19µs   p(99.9)=293.92µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=253.72µs
     http_req_duration..............: avg=127.8ms  min=21.92ms med=125.77ms max=378.53ms p(90)=159.56ms p(95)=170.17ms p(99.9)=218.12ms
       { expected_response:true }...: avg=127.8ms  min=21.92ms med=125.77ms max=378.53ms p(90)=159.56ms p(95)=170.17ms p(99.9)=218.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46883
     http_req_receiving.............: avg=89.54µs  min=32.01µs med=81.95µs  max=77.28ms  p(90)=114.51µs p(95)=126.1µs  p(99.9)=648.07µs
     http_req_sending...............: avg=29.39µs  min=6.05µs  med=15.37µs  max=181.26ms p(90)=21.04µs  p(95)=23.04µs  p(99.9)=569.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=127.68ms min=21.81ms med=125.65ms max=332.61ms p(90)=159.43ms p(95)=170.05ms p(99.9)=217.6ms 
     http_reqs......................: 46883   382.798183/s
     iteration_duration.............: avg=128.29ms min=47.19ms med=126.06ms max=386.92ms p(90)=159.86ms p(95)=170.46ms p(99.9)=223.09ms
     iterations.....................: 46783   381.981686/s
     success_rate...................: 100.00% ✓ 46783      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 88263      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=8.17µs   min=1.23µs  med=3.43µs   max=7.64ms   p(90)=4.92µs   p(95)=5.57µs   p(99.9)=2.44ms  
     http_req_connecting............: avg=4.5µs    min=0s      med=0s       max=7.6ms    p(90)=0s       p(95)=0s       p(99.9)=2.4ms   
     http_req_duration..............: avg=203.14ms min=18.69ms med=188.01ms max=588.79ms p(90)=254.12ms p(95)=402.62ms p(99.9)=530.74ms
       { expected_response:true }...: avg=203.14ms min=18.69ms med=188.01ms max=588.79ms p(90)=254.12ms p(95)=402.62ms p(99.9)=530.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29521
     http_req_receiving.............: avg=108.35µs min=37.37µs med=96.44µs  max=80.79ms  p(90)=128.73µs p(95)=141.89µs p(99.9)=940.98µs
     http_req_sending...............: avg=33.07µs  min=6.13µs  med=18.15µs  max=71.17ms  p(90)=23.24µs  p(95)=25.12µs  p(99.9)=4.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203ms    min=18.53ms med=187.89ms max=588.7ms  p(90)=253.98ms p(95)=402.26ms p(99.9)=530.63ms
     http_reqs......................: 29521   241.492385/s
     iteration_duration.............: avg=204.08ms min=41.82ms med=188.46ms max=589.08ms p(90)=254.55ms p(95)=404.41ms p(99.9)=532.9ms 
     iterations.....................: 29421   240.674349/s
     success_rate...................: 100.00% ✓ 29421      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 86772      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=6.99µs   min=1.16µs  med=3.31µs   max=4.03ms   p(90)=4.67µs   p(95)=5.25µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=206.66ms min=22.96ms med=226.9ms  max=421.63ms p(90)=241.35ms p(95)=246.81ms p(99.9)=324.72ms
       { expected_response:true }...: avg=206.66ms min=22.96ms med=226.9ms  max=421.63ms p(90)=241.35ms p(95)=246.81ms p(99.9)=324.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29024
     http_req_receiving.............: avg=191.61µs min=33.03µs med=91.56µs  max=194.86ms p(90)=124.47µs p(95)=137.47µs p(99.9)=1.85ms  
     http_req_sending...............: avg=37.65µs  min=6.15µs  med=17.11µs  max=183.93ms p(90)=22.19µs  p(95)=24.19µs  p(99.9)=579.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.43ms min=22.79ms med=226.76ms max=413.2ms  p(90)=241.18ms p(95)=246.57ms p(99.9)=319.58ms
     http_reqs......................: 29024   236.19973/s
     iteration_duration.............: avg=207.56ms min=66.36ms med=227.19ms max=430.71ms p(90)=241.62ms p(95)=247.09ms p(99.9)=325.99ms
     iterations.....................: 28924   235.385921/s
     success_rate...................: 100.00% ✓ 28924      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

