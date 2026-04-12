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
| hive-router | v0.0.43 | 1,576 | 1,615 | 1,573 | 1.0% |  |
| hotchocolate | 16.0.0-rc.1.29 | 1,461 | 1,474 | 1,436 | 1.0% |  |
| cosmo | 0.298.0 | 1,158 | 1,173 | 1,144 | 0.9% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.2 | 1,127 | 1,147 | 1,123 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.14 | 575 | 590 | 570 | 1.2% |  |
| apollo-router | v2.12.1 | 360 | 371 | 355 | 1.5% |  |
| hive-gateway | 2.5.14 | 258 | 264 | 256 | 1.1% |  |
| apollo-gateway | 2.13.3 | 240 | 242 | 239 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577041      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.95µs   min=982ns   med=2.34µs  max=8.16ms   p(90)=4.22µs   p(95)=5.2µs    p(99.9)=36.5µs 
     http_req_connecting............: avg=1.12µs   min=0s      med=0s      max=8.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.95ms  min=13.42ms med=30.67ms max=343.45ms p(90)=36.82ms  p(95)=38.77ms  p(99.9)=57.49ms
       { expected_response:true }...: avg=30.95ms  min=13.42ms med=30.67ms max=343.45ms p(90)=36.82ms  p(95)=38.77ms  p(99.9)=57.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192447
     http_req_receiving.............: avg=117.87µs min=27.19µs med=53.85µs max=288.43ms p(90)=107.24µs p(95)=157.41µs p(99.9)=3.54ms 
     http_req_sending...............: avg=33.12µs  min=5.01µs  med=9.77µs  max=29.63ms  p(90)=20.22µs  p(95)=59.09µs  p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.8ms   min=13.28ms med=30.57ms max=96.06ms  p(90)=36.7ms   p(95)=38.63ms  p(99.9)=55.28ms
     http_reqs......................: 192447  1576.894767/s
     iteration_duration.............: avg=31.18ms  min=13.65ms med=30.89ms max=357.16ms p(90)=37.04ms  p(95)=38.99ms  p(99.9)=57.94ms
     iterations.....................: 192347  1576.075375/s
     success_rate...................: 100.00% ✓ 192347      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 534858      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.26µs   min=992ns   med=2.14µs   max=6.28ms   p(90)=3.89µs  p(95)=4.77µs   p(99.9)=33.17µs
     http_req_connecting............: avg=587ns    min=0s      med=0s       max=4.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.4ms   min=14.58ms med=32.59ms  max=322.01ms p(90)=40.93ms p(95)=43.78ms  p(99.9)=96.87ms
       { expected_response:true }...: avg=33.4ms   min=14.58ms med=32.59ms  max=322.01ms p(90)=40.93ms p(95)=43.78ms  p(99.9)=96.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178386
     http_req_receiving.............: avg=790.31µs min=50.45µs med=115.27µs max=63.49ms  p(90)=2.3ms   p(95)=3.44ms   p(99.9)=16.31ms
     http_req_sending...............: avg=38.46µs  min=5.15µs  med=9.13µs   max=92.44ms  p(90)=20.15µs p(95)=103.64µs p(99.9)=2.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.57ms  min=14.31ms med=31.78ms  max=321.5ms  p(90)=39.84ms p(95)=42.63ms  p(99.9)=95.94ms
     http_reqs......................: 178386  1461.720576/s
     iteration_duration.............: avg=33.64ms  min=14.87ms med=32.81ms  max=355.44ms p(90)=41.15ms p(95)=44ms     p(99.9)=97.53ms
     iterations.....................: 178286  1460.901162/s
     success_rate...................: 100.00% ✓ 178286      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 423618      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.5µs   min=1.03µs  med=2.37µs  max=4.44ms   p(90)=4.01µs   p(95)=4.77µs   p(99.9)=36.07µs
     http_req_connecting............: avg=745ns   min=0s      med=0s      max=4.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.24ms min=19.24ms med=41.65ms max=317.58ms p(90)=51.39ms  p(95)=54.41ms  p(99.9)=70.88ms
       { expected_response:true }...: avg=42.24ms min=19.24ms med=41.65ms max=317.58ms p(90)=51.39ms  p(95)=54.41ms  p(99.9)=70.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141306
     http_req_receiving.............: avg=84.62µs min=27.37µs med=63.69µs max=167.84ms p(90)=109.78µs p(95)=134.77µs p(99.9)=1.59ms 
     http_req_sending...............: avg=28.22µs min=5.37µs  med=10.77µs max=136.03ms p(90)=18.63µs  p(95)=23.17µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.13ms min=19.09ms med=41.55ms max=317.35ms p(90)=51.28ms  p(95)=54.28ms  p(99.9)=70.64ms
     http_reqs......................: 141306  1158.002622/s
     iteration_duration.............: avg=42.48ms min=19.97ms med=41.85ms max=341.02ms p(90)=51.59ms  p(95)=54.61ms  p(99.9)=71.52ms
     iterations.....................: 141206  1157.183122/s
     success_rate...................: 100.00% ✓ 141206      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 412572      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.35µs  min=992ns   med=2.23µs  max=3.76ms   p(90)=4.64µs   p(95)=5.76µs   p(99.9)=50.45µs
     http_req_connecting............: avg=453ns   min=0s      med=0s      max=3ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.34ms min=17.43ms med=42.89ms max=328.08ms p(90)=52.66ms  p(95)=55.83ms  p(99.9)=78.7ms 
       { expected_response:true }...: avg=43.34ms min=17.43ms med=42.89ms max=328.08ms p(90)=52.66ms  p(95)=55.83ms  p(99.9)=78.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 137624
     http_req_receiving.............: avg=96.45µs min=28.76µs med=60.02µs max=90.41ms  p(90)=133.23µs p(95)=211.84µs p(99.9)=2.76ms 
     http_req_sending...............: avg=38.77µs min=5.09µs  med=9.91µs  max=165.26ms p(90)=23.75µs  p(95)=112.05µs p(99.9)=2.55ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.21ms min=17.27ms med=42.77ms max=327.49ms p(90)=52.52ms  p(95)=55.66ms  p(99.9)=78.34ms
     http_reqs......................: 137624  1127.968365/s
     iteration_duration.............: avg=43.62ms min=18.7ms  med=43.13ms max=362.58ms p(90)=52.9ms   p(95)=56.06ms  p(99.9)=79.19ms
     iterations.....................: 137524  1127.148764/s
     success_rate...................: 100.00% ✓ 137524      ✗ 0     
     vus............................: 27      min=0         max=50  
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

     checks.........................: 100.00% ✓ 210855     ✗ 0    
     data_received..................: 6.2 GB  50 MB/s
     data_sent......................: 85 MB   691 kB/s
     http_req_blocked...............: avg=4.98µs  min=1.12µs  med=3.2µs   max=4.33ms   p(90)=4.76µs   p(95)=5.44µs   p(99.9)=44.89µs 
     http_req_connecting............: avg=1.52µs  min=0s      med=0s      max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.03ms min=19.37ms med=82.65ms max=357.2ms  p(90)=101.41ms p(95)=111.08ms p(99.9)=207.92ms
       { expected_response:true }...: avg=85.03ms min=19.37ms med=82.65ms max=357.2ms  p(90)=101.41ms p(95)=111.08ms p(99.9)=207.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70385
     http_req_receiving.............: avg=126.7µs min=31.16µs med=78.21µs max=160.01ms p(90)=115.15µs p(95)=130.15µs p(99.9)=1.36ms  
     http_req_sending...............: avg=25.67µs min=5.81µs  med=14.07µs max=249.46ms p(90)=20.79µs  p(95)=23.29µs  p(99.9)=717.64µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.88ms min=19.2ms  med=82.53ms max=226.68ms p(90)=101.29ms p(95)=110.9ms  p(99.9)=205.95ms
     http_reqs......................: 70385   575.232649/s
     iteration_duration.............: avg=85.37ms min=24.74ms med=82.9ms  max=373.37ms p(90)=101.66ms p(95)=111.39ms p(99.9)=211.07ms
     iterations.....................: 70285   574.415383/s
     success_rate...................: 100.00% ✓ 70285      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 132147     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   433 kB/s
     http_req_blocked...............: avg=5.29µs   min=1.17µs  med=3.22µs   max=3.95ms   p(90)=4.68µs   p(95)=5.28µs   p(99.9)=183.7µs 
     http_req_connecting............: avg=1.9µs    min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=136.76µs
     http_req_duration..............: avg=135.73ms min=21.72ms med=133.68ms max=360.58ms p(90)=169.99ms p(95)=181.43ms p(99.9)=233.84ms
       { expected_response:true }...: avg=135.73ms min=21.72ms med=133.68ms max=360.58ms p(90)=169.99ms p(95)=181.43ms p(99.9)=233.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44149
     http_req_receiving.............: avg=94.62µs  min=29.52µs med=82.58µs  max=184.29ms p(90)=116.18µs p(95)=128.09µs p(99.9)=817.22µs
     http_req_sending...............: avg=23µs     min=5.78µs  med=15.07µs  max=87.8ms   p(90)=21.05µs  p(95)=23.16µs  p(99.9)=625.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=135.62ms min=21.59ms med=133.59ms max=348.97ms p(90)=169.87ms p(95)=181.31ms p(99.9)=233.38ms
     http_reqs......................: 44149   360.383095/s
     iteration_duration.............: avg=136.25ms min=54.68ms med=133.98ms max=386.68ms p(90)=170.29ms p(95)=181.75ms p(99.9)=236.89ms
     iterations.....................: 44049   359.566806/s
     success_rate...................: 100.00% ✓ 44049      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 94704      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=6.31µs   min=1.2µs   med=3.56µs   max=3.68ms   p(90)=5.11µs   p(95)=5.72µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=2.52µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=189.35ms min=18.76ms med=171.75ms max=619.36ms p(90)=239.75ms p(95)=395.94ms p(99.9)=532.98ms
       { expected_response:true }...: avg=189.35ms min=18.76ms med=171.75ms max=619.36ms p(90)=239.75ms p(95)=395.94ms p(99.9)=532.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31668
     http_req_receiving.............: avg=102.15µs min=34.73µs med=96.7µs   max=12.12ms  p(90)=129.75µs p(95)=143.66µs p(99.9)=834.7µs 
     http_req_sending...............: avg=39.61µs  min=6.07µs  med=17.98µs  max=140.57ms p(90)=23.17µs  p(95)=25.09µs  p(99.9)=1.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.21ms min=18.59ms med=171.63ms max=619.22ms p(90)=239.62ms p(95)=395.76ms p(99.9)=532.86ms
     http_reqs......................: 31668   258.964579/s
     iteration_duration.............: avg=190.19ms min=36.68ms med=172.16ms max=619.6ms  p(90)=240.24ms p(95)=397.34ms p(99.9)=533.24ms
     iterations.....................: 31568   258.146831/s
     success_rate...................: 100.00% ✓ 31568      ✗ 0    
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

     checks.........................: 100.00% ✓ 88272      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=5.21µs   min=1.15µs  med=3.44µs   max=2.12ms   p(90)=4.92µs   p(95)=5.57µs   p(99.9)=719.36µs
     http_req_connecting............: avg=1.57µs   min=0s      med=0s       max=2.09ms   p(90)=0s       p(95)=0s       p(99.9)=691.37µs
     http_req_duration..............: avg=203.13ms min=20.41ms med=203.12ms max=385.47ms p(90)=218.11ms p(95)=224.23ms p(99.9)=290.33ms
       { expected_response:true }...: avg=203.13ms min=20.41ms med=203.12ms max=385.47ms p(90)=218.11ms p(95)=224.23ms p(99.9)=290.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29524
     http_req_receiving.............: avg=103.73µs min=35.04µs med=93.47µs  max=87.42ms  p(90)=126.56µs p(95)=140.14µs p(99.9)=655.54µs
     http_req_sending...............: avg=25.19µs  min=5.95µs  med=17.51µs  max=80.74ms  p(90)=22.87µs  p(95)=24.92µs  p(99.9)=444µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203ms    min=20.25ms med=203ms    max=385.09ms p(90)=217.97ms p(95)=224.11ms p(99.9)=290.06ms
     http_reqs......................: 29524   240.347066/s
     iteration_duration.............: avg=204.05ms min=68.8ms  med=203.49ms max=400.69ms p(90)=218.42ms p(95)=224.61ms p(99.9)=296.25ms
     iterations.....................: 29424   239.532992/s
     success_rate...................: 100.00% ✓ 29424      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

