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
| hive-router | v0.0.49 | 1,580 | 1,606 | 1,566 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,459 | 1,471 | 1,448 | 0.6% |  |
| cosmo | 0.307.0 | 1,160 | 1,175 | 1,154 | 0.6% |  |
| grafbase | 0.53.3 | 1,143 | 1,160 | 1,138 | 0.6% |  |
| hive-gateway-router-runtime | 2.5.25 | 509 | 520 | 504 | 1.0% |  |
| apollo-router | v2.13.1 | 367 | 377 | 362 | 1.4% |  |
| apollo-gateway | 2.13.3 | 240 | 242 | 239 | 0.4% |  |
| hive-gateway | 2.5.25 | 231 | 235 | 230 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578151      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.24µs  min=992ns   med=2.18µs  max=4.08ms   p(90)=4.18µs   p(95)=5.2µs    p(99.9)=31.21µs
     http_req_connecting............: avg=531ns   min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.89ms min=14.01ms med=30.62ms max=339.98ms p(90)=36.74ms  p(95)=38.69ms  p(99.9)=57.78ms
       { expected_response:true }...: avg=30.89ms min=14.01ms med=30.62ms max=339.98ms p(90)=36.74ms  p(95)=38.69ms  p(99.9)=57.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192817
     http_req_receiving.............: avg=83.59µs min=27.98µs med=52.42µs max=97.69ms  p(90)=103.49µs p(95)=148.65µs p(99.9)=2.79ms 
     http_req_sending...............: avg=33.62µs min=5.16µs  med=9.34µs  max=116.86ms p(90)=19.8µs   p(95)=39.59µs  p(99.9)=1.75ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.77ms min=13.82ms med=30.52ms max=320.13ms p(90)=36.61ms  p(95)=38.54ms  p(99.9)=56.8ms 
     http_reqs......................: 192817  1580.393035/s
     iteration_duration.............: avg=31.12ms min=14.23ms med=30.84ms max=356.63ms p(90)=36.95ms  p(95)=38.9ms   p(99.9)=58.21ms
     iterations.....................: 192717  1579.573401/s
     success_rate...................: 100.00% ✓ 192717      ✗ 0     
     vus............................: 38      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 533895      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.41µs  min=1µs     med=2.26µs   max=5.2ms    p(90)=4.1µs   p(95)=5.02µs   p(99.9)=37.17µs 
     http_req_connecting............: avg=580ns   min=0s      med=0s       max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=33.46ms min=13.75ms med=32.51ms  max=506.36ms p(90)=40.81ms p(95)=43.68ms  p(99.9)=102.93ms
       { expected_response:true }...: avg=33.46ms min=13.75ms med=32.51ms  max=506.36ms p(90)=40.81ms p(95)=43.68ms  p(99.9)=102.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178065
     http_req_receiving.............: avg=773.3µs min=51.21µs med=115.97µs max=34.13ms  p(90)=2.23ms  p(95)=3.38ms   p(99.9)=16.27ms 
     http_req_sending...............: avg=36.76µs min=5.12µs  med=9.31µs   max=97.33ms  p(90)=20.09µs p(95)=107.59µs p(99.9)=2.31ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=32.65ms min=13.62ms med=31.73ms  max=504.9ms  p(90)=39.8ms  p(95)=42.58ms  p(99.9)=99.29ms 
     http_reqs......................: 178065  1459.293916/s
     iteration_duration.............: avg=33.7ms  min=14.04ms med=32.74ms  max=506.59ms p(90)=41.04ms p(95)=43.9ms   p(99.9)=103.95ms
     iterations.....................: 177965  1458.474387/s
     success_rate...................: 100.00% ✓ 177965      ✗ 0     
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

     checks.........................: 100.00% ✓ 424530      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.78µs  min=1.1µs   med=2.64µs  max=4.6ms    p(90)=4.39µs   p(95)=5.21µs   p(99.9)=41.26µs
     http_req_connecting............: avg=740ns   min=0s      med=0s      max=4.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.14ms min=18.73ms med=41.5ms  max=312.93ms p(90)=51.35ms  p(95)=54.49ms  p(99.9)=72.48ms
       { expected_response:true }...: avg=42.14ms min=18.73ms med=41.5ms  max=312.93ms p(90)=51.35ms  p(95)=54.49ms  p(99.9)=72.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141610
     http_req_receiving.............: avg=89.02µs min=29.05µs med=65.2µs  max=26.78ms  p(90)=112.64µs p(95)=141.43µs p(99.9)=1.95ms 
     http_req_sending...............: avg=29.44µs min=5.42µs  med=11.26µs max=81.04ms  p(90)=19.4µs   p(95)=24.88µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.03ms min=18.68ms med=41.39ms max=312.55ms p(90)=51.23ms  p(95)=54.36ms  p(99.9)=71.69ms
     http_reqs......................: 141610  1160.434773/s
     iteration_duration.............: avg=42.39ms min=18.89ms med=41.72ms max=350.61ms p(90)=51.56ms  p(95)=54.7ms   p(99.9)=73.15ms
     iterations.....................: 141510  1159.615315/s
     success_rate...................: 100.00% ✓ 141510      ✗ 0     
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

     checks.........................: 100.00% ✓ 418482      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.73µs  min=952ns   med=2.33µs  max=4.01ms   p(90)=4.91µs   p(95)=6.04µs   p(99.9)=45.79µs
     http_req_connecting............: avg=706ns   min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.73ms min=18.55ms med=42.27ms max=329.32ms p(90)=52.03ms  p(95)=55.24ms  p(99.9)=81.84ms
       { expected_response:true }...: avg=42.73ms min=18.55ms med=42.27ms max=329.32ms p(90)=52.03ms  p(95)=55.24ms  p(99.9)=81.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139594
     http_req_receiving.............: avg=98.71µs min=29.64µs med=59.24µs max=168.05ms p(90)=132.97µs p(95)=214.22µs p(99.9)=3.18ms 
     http_req_sending...............: avg=42.34µs min=5.18µs  med=10.08µs max=181.24ms p(90)=24.46µs  p(95)=114.12µs p(99.9)=2.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.59ms min=18.09ms med=42.14ms max=328.88ms p(90)=51.88ms  p(95)=55.08ms  p(99.9)=80.65ms
     http_reqs......................: 139594  1143.928126/s
     iteration_duration.............: avg=43ms    min=18.8ms  med=42.51ms max=358.3ms  p(90)=52.26ms  p(95)=55.48ms  p(99.9)=82.17ms
     iterations.....................: 139494  1143.108658/s
     success_rate...................: 100.00% ✓ 139494      ✗ 0     
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

     checks.........................: 100.00% ✓ 186924     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   612 kB/s
     http_req_blocked...............: avg=4.82µs  min=1.22µs  med=3.27µs  max=3.87ms   p(90)=4.98µs   p(95)=5.68µs   p(99.9)=48.27µs 
     http_req_connecting............: avg=1.26µs  min=0s      med=0s      max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.93ms min=22.01ms med=82.7ms  max=365.17ms p(90)=160.02ms p(95)=175.31ms p(99.9)=275.6ms 
       { expected_response:true }...: avg=95.93ms min=22.01ms med=82.7ms  max=365.17ms p(90)=160.02ms p(95)=175.31ms p(99.9)=275.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 62408
     http_req_receiving.............: avg=91.73µs min=31.44µs med=78.56µs max=165.91ms p(90)=115.95µs p(95)=130.74µs p(99.9)=976.2µs 
     http_req_sending...............: avg=22.44µs min=5.81µs  med=14.06µs max=64.28ms  p(90)=21.23µs  p(95)=23.67µs  p(99.9)=776.04µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.82ms min=21.83ms med=82.58ms max=323.18ms p(90)=159.91ms p(95)=175.2ms  p(99.9)=275.3ms 
     http_reqs......................: 62408   509.638661/s
     iteration_duration.............: avg=96.31ms min=28.91ms med=82.97ms max=377.62ms p(90)=160.3ms  p(95)=175.61ms p(99.9)=279.08ms
     iterations.....................: 62308   508.822037/s
     success_rate...................: 100.00% ✓ 62308      ✗ 0    
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

     checks.........................: 100.00% ✓ 134565     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   441 kB/s
     http_req_blocked...............: avg=5.54µs   min=1.18µs  med=3.42µs   max=3.92ms   p(90)=4.97µs   p(95)=5.59µs   p(99.9)=196.54µs
     http_req_connecting............: avg=1.9µs    min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=141.47µs
     http_req_duration..............: avg=133.27ms min=19.82ms med=131.43ms max=391.22ms p(90)=166.56ms p(95)=177.56ms p(99.9)=227.5ms 
       { expected_response:true }...: avg=133.27ms min=19.82ms med=131.43ms max=391.22ms p(90)=166.56ms p(95)=177.56ms p(99.9)=227.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 44955
     http_req_receiving.............: avg=89.53µs  min=31.54µs med=84.42µs  max=6.83ms   p(90)=118.27µs p(95)=130.99µs p(99.9)=745.19µs
     http_req_sending...............: avg=28.05µs  min=6.02µs  med=16.01µs  max=89.43ms  p(90)=21.92µs  p(95)=23.92µs  p(99.9)=775.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.16ms min=19.67ms med=131.31ms max=390.32ms p(90)=166.46ms p(95)=177.46ms p(99.9)=227.42ms
     http_reqs......................: 44955   367.00525/s
     iteration_duration.............: avg=133.8ms  min=27.39ms med=131.75ms max=405.23ms p(90)=166.86ms p(95)=177.9ms  p(99.9)=232.34ms
     iterations.....................: 44855   366.188866/s
     success_rate...................: 100.00% ✓ 44855      ✗ 0    
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

     checks.........................: 100.00% ✓ 88431      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   289 kB/s
     http_req_blocked...............: avg=7.62µs   min=1.26µs  med=3.5µs    max=4.42ms   p(90)=4.99µs   p(95)=5.64µs   p(99.9)=2.13ms  
     http_req_connecting............: avg=3.84µs   min=0s      med=0s       max=4.39ms   p(90)=0s       p(95)=0s       p(99.9)=2.1ms   
     http_req_duration..............: avg=202.75ms min=22.75ms med=225.61ms max=410.31ms p(90)=244.49ms p(95)=249.97ms p(99.9)=321.95ms
       { expected_response:true }...: avg=202.75ms min=22.75ms med=225.61ms max=410.31ms p(90)=244.49ms p(95)=249.97ms p(99.9)=321.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29577
     http_req_receiving.............: avg=98.74µs  min=32.28µs med=93.54µs  max=3.95ms   p(90)=127.84µs p(95)=141.75µs p(99.9)=721.1µs 
     http_req_sending...............: avg=28.25µs  min=5.87µs  med=17.64µs  max=89.74ms  p(90)=23.23µs  p(95)=25.33µs  p(99.9)=655.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.62ms min=22.62ms med=225.5ms  max=409.56ms p(90)=244.37ms p(95)=249.83ms p(99.9)=321.83ms
     http_reqs......................: 29577   240.736911/s
     iteration_duration.............: avg=203.65ms min=57.38ms med=225.9ms  max=422.05ms p(90)=244.8ms  p(95)=250.3ms  p(99.9)=324.62ms
     iterations.....................: 29477   239.922978/s
     success_rate...................: 100.00% ✓ 29477      ✗ 0    
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

     checks.........................: 100.00% ✓ 84720      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.8µs    min=1.14µs  med=3.62µs   max=4.63ms   p(90)=5.16µs   p(95)=5.81µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.95µs   min=0s      med=0s       max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=211.62ms min=19.4ms  med=195.31ms max=684.07ms p(90)=253.46ms p(95)=440.09ms p(99.9)=619.85ms
       { expected_response:true }...: avg=211.62ms min=19.4ms  med=195.31ms max=684.07ms p(90)=253.46ms p(95)=440.09ms p(99.9)=619.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28340
     http_req_receiving.............: avg=116.81µs min=34.07µs med=96.47µs  max=148.02ms p(90)=129.5µs  p(95)=143.42µs p(99.9)=751.5µs 
     http_req_sending...............: avg=37.91µs  min=5.91µs  med=18.24µs  max=145.87ms p(90)=23.62µs  p(95)=25.41µs  p(99.9)=598.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.47ms min=19.27ms med=195.17ms max=683.98ms p(90)=253.32ms p(95)=440.01ms p(99.9)=619.76ms
     http_reqs......................: 28340   231.590539/s
     iteration_duration.............: avg=212.61ms min=59.67ms med=195.74ms max=684.3ms  p(90)=254ms    p(95)=441.21ms p(99.9)=620.13ms
     iterations.....................: 28240   230.773353/s
     success_rate...................: 100.00% ✓ 28240      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

