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
| hive-router | v0.0.49 | 1,586 | 1,612 | 1,577 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,448 | 1,462 | 1,435 | 0.6% |  |
| cosmo | 0.307.0 | 1,143 | 1,156 | 1,134 | 0.7% |  |
| grafbase | 0.53.3 | 1,124 | 1,151 | 1,115 | 1.1% |  |
| hive-gateway-router-runtime | 2.5.25 | 492 | 509 | 487 | 1.5% |  |
| apollo-router | v2.13.1 | 395 | 404 | 391 | 1.2% |  |
| hive-gateway | 2.5.25 | 237 | 242 | 235 | 1.2% |  |
| apollo-gateway | 2.13.3 | 232 | 233 | 230 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 580398      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.13µs  min=962ns   med=2.08µs  max=4.22ms   p(90)=4µs     p(95)=4.88µs   p(99.9)=34.55µs
     http_req_connecting............: avg=522ns   min=0s      med=0s      max=4.17ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.77ms min=14.52ms med=30.51ms max=350.12ms p(90)=36.49ms p(95)=38.35ms  p(99.9)=57.37ms
       { expected_response:true }...: avg=30.77ms min=14.52ms med=30.51ms max=350.12ms p(90)=36.49ms p(95)=38.35ms  p(99.9)=57.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193566
     http_req_receiving.............: avg=81.88µs min=27.15µs med=51.78µs max=271.49ms p(90)=103.6µs p(95)=145.93µs p(99.9)=2.26ms 
     http_req_sending...............: avg=35.41µs min=5.09µs  med=9.2µs   max=199.62ms p(90)=19.93µs p(95)=38.44µs  p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.65ms min=14.44ms med=30.4ms  max=349.53ms p(90)=36.38ms p(95)=38.21ms  p(99.9)=56.41ms
     http_reqs......................: 193566  1586.426104/s
     iteration_duration.............: avg=31ms    min=14.79ms med=30.73ms max=358.32ms p(90)=36.71ms p(95)=38.56ms  p(99.9)=58.07ms
     iterations.....................: 193466  1585.606525/s
     success_rate...................: 100.00% ✓ 193466      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 530103      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.04µs   min=981ns   med=2.02µs   max=4.4ms    p(90)=3.85µs  p(95)=4.7µs    p(99.9)=29.7µs 
     http_req_connecting............: avg=552ns    min=0s      med=0s       max=4.35ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.7ms   min=14.23ms med=32.51ms  max=478.3ms  p(90)=41.2ms  p(95)=44.83ms  p(99.9)=87.65ms
       { expected_response:true }...: avg=33.7ms   min=14.23ms med=32.51ms  max=478.3ms  p(90)=41.2ms  p(95)=44.83ms  p(99.9)=87.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176801
     http_req_receiving.............: avg=733.54µs min=50.39µs med=109.94µs max=37.34ms  p(90)=2.13ms  p(95)=3.23ms   p(99.9)=16ms   
     http_req_sending...............: avg=38.97µs  min=5.24µs  med=9.01µs   max=240.41ms p(90)=20.29µs p(95)=107.47µs p(99.9)=2.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.93ms  min=14.07ms med=31.76ms  max=477.05ms p(90)=40.2ms  p(95)=43.66ms  p(99.9)=85ms   
     http_reqs......................: 176801  1448.873734/s
     iteration_duration.............: avg=33.94ms  min=14.48ms med=32.74ms  max=478.52ms p(90)=41.42ms p(95)=45.05ms  p(99.9)=89.01ms
     iterations.....................: 176701  1448.05424/s
     success_rate...................: 100.00% ✓ 176701      ✗ 0     
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

     checks.........................: 100.00% ✓ 418428      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=2.85µs  min=1µs     med=2.13µs  max=3.17ms   p(90)=3.72µs   p(95)=4.46µs   p(99.9)=35.31µs
     http_req_connecting............: avg=313ns   min=0s      med=0s      max=2.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.78ms min=19.36ms med=42.16ms max=346.28ms p(90)=52.13ms  p(95)=55.31ms  p(99.9)=71.48ms
       { expected_response:true }...: avg=42.78ms min=19.36ms med=42.16ms max=346.28ms p(90)=52.13ms  p(95)=55.31ms  p(99.9)=71.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139576
     http_req_receiving.............: avg=83.7µs  min=28.05µs med=62.03µs max=157.51ms p(90)=106.96µs p(95)=132.72µs p(99.9)=1.57ms 
     http_req_sending...............: avg=26.24µs min=5.15µs  med=10.11µs max=98.14ms  p(90)=17.97µs  p(95)=22.59µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.67ms min=19.25ms med=42.06ms max=346.08ms p(90)=52.01ms  p(95)=55.18ms  p(99.9)=71.26ms
     http_reqs......................: 139576  1143.611823/s
     iteration_duration.............: avg=43.01ms min=19.84ms med=42.36ms max=362.97ms p(90)=52.33ms  p(95)=55.51ms  p(99.9)=71.89ms
     iterations.....................: 139476  1142.792476/s
     success_rate...................: 100.00% ✓ 139476      ✗ 0     
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

     checks.........................: 100.00% ✓ 411417      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.62µs  min=992ns   med=2.23µs  max=4.02ms   p(90)=4.68µs   p(95)=5.81µs   p(99.9)=43.02µs
     http_req_connecting............: avg=788ns   min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.46ms min=18.22ms med=43ms    max=366.36ms p(90)=52.85ms  p(95)=56.04ms  p(99.9)=81.33ms
       { expected_response:true }...: avg=43.46ms min=18.22ms med=43ms    max=366.36ms p(90)=52.85ms  p(95)=56.04ms  p(99.9)=81.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137239
     http_req_receiving.............: avg=136.8µs min=28.14µs med=59.43µs max=289.07ms p(90)=131.98µs p(95)=209.22µs p(99.9)=4.22ms 
     http_req_sending...............: avg=37.38µs min=5.09µs  med=9.85µs  max=180.26ms p(90)=23.91µs  p(95)=109.53µs p(99.9)=1.93ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.29ms min=18.1ms  med=42.88ms max=195.63ms p(90)=52.71ms  p(95)=55.86ms  p(99.9)=78.34ms
     http_reqs......................: 137239  1124.722431/s
     iteration_duration.............: avg=43.74ms min=18.51ms med=43.24ms max=381.35ms p(90)=53.07ms  p(95)=56.28ms  p(99.9)=81.64ms
     iterations.....................: 137139  1123.902895/s
     success_rate...................: 100.00% ✓ 137139      ✗ 0     
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

     checks.........................: 100.00% ✓ 180609     ✗ 0    
     data_received..................: 5.3 GB  43 MB/s
     data_sent......................: 72 MB   591 kB/s
     http_req_blocked...............: avg=4.97µs  min=1.13µs  med=2.94µs  max=4.73ms   p(90)=4.46µs   p(95)=5.07µs   p(99.9)=53.88µs 
     http_req_connecting............: avg=1.74µs  min=0s      med=0s      max=4.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.3ms  min=18.59ms med=97.28ms max=369.81ms p(90)=116.86ms p(95)=127.07ms p(99.9)=225.8ms 
       { expected_response:true }...: avg=99.3ms  min=18.59ms med=97.28ms max=369.81ms p(90)=116.86ms p(95)=127.07ms p(99.9)=225.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 60303
     http_req_receiving.............: avg=94.31µs min=30.41µs med=77.69µs max=214.74ms p(90)=113.51µs p(95)=126.3µs  p(99.9)=887.02µs
     http_req_sending...............: avg=28.83µs min=5.59µs  med=13.8µs  max=221.02ms p(90)=20.39µs  p(95)=22.55µs  p(99.9)=657.46µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.18ms min=18.48ms med=97.18ms max=369.65ms p(90)=116.75ms p(95)=126.95ms p(99.9)=225.44ms
     http_reqs......................: 60303   492.48948/s
     iteration_duration.............: avg=99.68ms min=34.07ms med=97.53ms max=395.04ms p(90)=117.12ms p(95)=127.41ms p(99.9)=226.93ms
     iterations.....................: 60203   491.672788/s
     success_rate...................: 100.00% ✓ 60203      ✗ 0    
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

     checks.........................: 100.00% ✓ 144981     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=5.55µs   min=1.15µs  med=3.31µs   max=3.93ms   p(90)=4.83µs   p(95)=5.43µs   p(99.9)=170.91µs
     http_req_connecting............: avg=2.04µs   min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=100.15µs
     http_req_duration..............: avg=123.7ms  min=19.55ms med=121.83ms max=349.11ms p(90)=154.23ms p(95)=164.42ms p(99.9)=210.73ms
       { expected_response:true }...: avg=123.7ms  min=19.55ms med=121.83ms max=349.11ms p(90)=154.23ms p(95)=164.42ms p(99.9)=210.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48427
     http_req_receiving.............: avg=139.39µs min=31.54µs med=85.87µs  max=226.46ms p(90)=118.96µs p(95)=131.58µs p(99.9)=914.98µs
     http_req_sending...............: avg=31.71µs  min=5.87µs  med=16.64µs  max=161.94ms p(90)=22.16µs  p(95)=24.23µs  p(99.9)=630.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.53ms min=19.4ms  med=121.7ms  max=348.44ms p(90)=154.06ms p(95)=164.22ms p(99.9)=207.2ms 
     http_reqs......................: 48427   395.332235/s
     iteration_duration.............: avg=124.19ms min=36.93ms med=122.12ms max=369.61ms p(90)=154.51ms p(95)=164.77ms p(99.9)=214.42ms
     iterations.....................: 48327   394.515888/s
     success_rate...................: 100.00% ✓ 48327      ✗ 0    
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

     checks.........................: 100.00% ✓ 86793      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.06µs   min=1.22µs  med=3.46µs   max=3.9ms    p(90)=4.92µs   p(95)=5.52µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.37µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=206.56ms min=19.01ms med=193.83ms max=634.97ms p(90)=243.49ms p(95)=405.54ms p(99.9)=533.27ms
       { expected_response:true }...: avg=206.56ms min=19.01ms med=193.83ms max=634.97ms p(90)=243.49ms p(95)=405.54ms p(99.9)=533.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29031
     http_req_receiving.............: avg=111.53µs min=34.77µs med=96.66µs  max=161.7ms  p(90)=129.71µs p(95)=142.98µs p(99.9)=589.16µs
     http_req_sending...............: avg=31.5µs   min=6.03µs  med=17.86µs  max=61.31ms  p(90)=23.04µs  p(95)=24.98µs  p(99.9)=607.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.41ms min=18.88ms med=193.71ms max=634.85ms p(90)=243.34ms p(95)=405.41ms p(99.9)=533.17ms
     http_reqs......................: 29031   237.409972/s
     iteration_duration.............: avg=207.51ms min=52.75ms med=194.24ms max=635.26ms p(90)=243.98ms p(95)=406.09ms p(99.9)=533.57ms
     iterations.....................: 28931   236.592191/s
     success_rate...................: 100.00% ✓ 28931      ✗ 0    
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

     checks.........................: 100.00% ✓ 85317      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.19µs   min=1.21µs  med=3.39µs   max=4.17ms   p(90)=4.77µs   p(95)=5.35µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.61µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=210.09ms min=24.02ms med=211.64ms max=444.74ms p(90)=237.83ms p(95)=244.88ms p(99.9)=318.76ms
       { expected_response:true }...: avg=210.09ms min=24.02ms med=211.64ms max=444.74ms p(90)=237.83ms p(95)=244.88ms p(99.9)=318.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28539
     http_req_receiving.............: avg=97.94µs  min=34.15µs med=92.7µs   max=13.94ms  p(90)=125.82µs p(95)=139.57µs p(99.9)=706.72µs
     http_req_sending...............: avg=43.76µs  min=6.11µs  med=17.1µs   max=146.64ms p(90)=22.54µs  p(95)=24.57µs  p(99.9)=586.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.95ms min=23.87ms med=211.48ms max=444.11ms p(90)=237.7ms  p(95)=244.74ms p(99.9)=316.87ms
     http_reqs......................: 28539   232.293486/s
     iteration_duration.............: avg=211.08ms min=51.63ms med=212.08ms max=462.31ms p(90)=238.13ms p(95)=245.19ms p(99.9)=339.8ms 
     iterations.....................: 28439   231.479535/s
     success_rate...................: 100.00% ✓ 28439      ✗ 0    
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

