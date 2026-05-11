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
| hive-router | v0.0.49 | 1,580 | 1,601 | 1,574 | 0.5% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,448 | 1,456 | 1,437 | 0.4% |  |
| cosmo | 0.307.0 | 1,160 | 1,173 | 1,152 | 0.6% | non-compatible response (4 across 3/9 runs) |
| grafbase | 0.53.3 | 1,135 | 1,152 | 1,128 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 501 | 510 | 495 | 0.9% |  |
| apollo-router | v2.13.1 | 397 | 405 | 394 | 0.9% |  |
| hive-gateway | 2.5.25 | 241 | 244 | 239 | 0.8% |  |
| apollo-gateway | 2.13.3 | 236 | 237 | 234 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578301      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.1µs   min=951ns   med=2.06µs  max=4.12ms   p(90)=3.88µs   p(95)=4.89µs   p(99.9)=35.46µs
     http_req_connecting............: avg=514ns   min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.88ms min=13.92ms med=30.6ms  max=343.2ms  p(90)=36.7ms   p(95)=38.73ms  p(99.9)=57.66ms
       { expected_response:true }...: avg=30.88ms min=13.92ms med=30.6ms  max=343.2ms  p(90)=36.7ms   p(95)=38.73ms  p(99.9)=57.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192867
     http_req_receiving.............: avg=84.95µs min=27.64µs med=51.35µs max=230.53ms p(90)=101.87µs p(95)=151.62µs p(99.9)=2.93ms 
     http_req_sending...............: avg=33.63µs min=4.99µs  med=9µs     max=145.92ms p(90)=18.8µs   p(95)=58.77µs  p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.76ms min=13.84ms med=30.5ms  max=342.61ms p(90)=36.58ms  p(95)=38.57ms  p(99.9)=56.21ms
     http_reqs......................: 192867  1580.987674/s
     iteration_duration.............: avg=31.11ms min=14.19ms med=30.82ms max=354.65ms p(90)=36.92ms  p(95)=38.93ms  p(99.9)=58.27ms
     iterations.....................: 192767  1580.167944/s
     success_rate...................: 100.00% ✓ 192767      ✗ 0     
     vus............................: 27      min=0         max=50  
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

     checks.........................: 100.00% ✓ 529764      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.25µs   min=932ns   med=2.1µs    max=4.63ms   p(90)=4µs     p(95)=4.91µs   p(99.9)=26.63µs
     http_req_connecting............: avg=652ns    min=0s      med=0s       max=4.54ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.72ms  min=13.89ms med=32.55ms  max=487.85ms p(90)=41.51ms p(95)=45.23ms  p(99.9)=81.72ms
       { expected_response:true }...: avg=33.72ms  min=13.89ms med=32.55ms  max=487.85ms p(90)=41.51ms p(95)=45.23ms  p(99.9)=81.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176688
     http_req_receiving.............: avg=802.56µs min=49.59µs med=110.64µs max=81.17ms  p(90)=2.33ms  p(95)=3.54ms   p(99.9)=18.27ms
     http_req_sending...............: avg=38.76µs  min=4.83µs  med=8.98µs   max=175.69ms p(90)=19.99µs p(95)=106.44µs p(99.9)=2.39ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.88ms  min=13.79ms med=31.75ms  max=485.43ms p(90)=40.34ms p(95)=43.87ms  p(99.9)=80.17ms
     http_reqs......................: 176688  1448.016617/s
     iteration_duration.............: avg=33.96ms  min=14.09ms med=32.78ms  max=488.09ms p(90)=41.73ms p(95)=45.46ms  p(99.9)=82.25ms
     iterations.....................: 176588  1447.197084/s
     success_rate...................: 100.00% ✓ 176588      ✗ 0     
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

     checks.........................: 100.00% ✓ 424590      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.65µs  min=1.06µs  med=2.51µs  max=4.02ms   p(90)=4.22µs   p(95)=5.03µs   p(99.9)=40µs   
     http_req_connecting............: avg=726ns   min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.14ms min=19.24ms med=41.55ms max=359.79ms p(90)=51.24ms  p(95)=54.31ms  p(99.9)=70.82ms
       { expected_response:true }...: avg=42.14ms min=19.24ms med=41.55ms max=359.79ms p(90)=51.24ms  p(95)=54.31ms  p(99.9)=70.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141630
     http_req_receiving.............: avg=91.85µs min=28.53µs med=64.61µs max=228.14ms p(90)=111.37µs p(95)=138.27µs p(99.9)=2.1ms  
     http_req_sending...............: avg=28.31µs min=5.24µs  med=10.93µs max=138.78ms p(90)=18.79µs  p(95)=24.15µs  p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.02ms min=19.15ms med=41.44ms max=350.13ms p(90)=51.12ms  p(95)=54.18ms  p(99.9)=70.35ms
     http_reqs......................: 141630  1160.568024/s
     iteration_duration.............: avg=42.38ms min=19.82ms med=41.76ms max=369.91ms p(90)=51.45ms  p(95)=54.53ms  p(99.9)=71.2ms 
     iterations.....................: 141530  1159.748587/s
     success_rate...................: 100.00% ✓ 141530      ✗ 0     
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

     checks.........................: 100.00% ✓ 415494      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.46µs  min=962ns   med=2.21µs  max=3.93ms   p(90)=4.67µs   p(95)=5.84µs   p(99.9)=47.12µs
     http_req_connecting............: avg=606ns   min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.04ms min=15.96ms med=42.58ms max=326.75ms p(90)=52.33ms  p(95)=55.52ms  p(99.9)=81.73ms
       { expected_response:true }...: avg=43.04ms min=15.96ms med=42.58ms max=326.75ms p(90)=52.33ms  p(95)=55.52ms  p(99.9)=81.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138598
     http_req_receiving.............: avg=94.41µs min=28.61µs med=58.18µs max=91.02ms  p(90)=127.16µs p(95)=191.52µs p(99.9)=2.98ms 
     http_req_sending...............: avg=41.89µs min=5.15µs  med=9.67µs  max=195.79ms p(90)=22.92µs  p(95)=105.53µs p(99.9)=2.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.91ms min=15.89ms med=42.46ms max=326.24ms p(90)=52.18ms  p(95)=55.34ms  p(99.9)=80.7ms 
     http_reqs......................: 138598  1135.941046/s
     iteration_duration.............: avg=43.31ms min=16.22ms med=42.83ms max=354.36ms p(90)=52.56ms  p(95)=55.76ms  p(99.9)=83.01ms
     iterations.....................: 138498  1135.121451/s
     success_rate...................: 100.00% ✓ 138498      ✗ 0     
     vus............................: 42      min=0         max=50  
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

     checks.........................: 100.00% ✓ 183828     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   602 kB/s
     http_req_blocked...............: avg=4.49µs  min=1.19µs  med=3.09µs  max=3.54ms   p(90)=4.71µs   p(95)=5.38µs   p(99.9)=48.97µs 
     http_req_connecting............: avg=1.12µs  min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.56ms min=21.55ms med=90.6ms  max=354.49ms p(90)=136.23ms p(95)=148.12ms p(99.9)=246.96ms
       { expected_response:true }...: avg=97.56ms min=21.55ms med=90.6ms  max=354.49ms p(90)=136.23ms p(95)=148.12ms p(99.9)=246.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61376
     http_req_receiving.............: avg=87.11µs min=31.01µs med=77.17µs max=56ms     p(90)=113.53µs p(95)=126.97µs p(99.9)=875.34µs
     http_req_sending...............: avg=20.64µs min=5.67µs  med=13.8µs  max=25.82ms  p(90)=20.67µs  p(95)=23.12µs  p(99.9)=747.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.45ms min=21.39ms med=90.5ms  max=353.64ms p(90)=136.12ms p(95)=148.01ms p(99.9)=246.74ms
     http_reqs......................: 61376   501.275282/s
     iteration_duration.............: avg=97.93ms min=28.94ms med=90.92ms max=370.71ms p(90)=136.48ms p(95)=148.46ms p(99.9)=248.09ms
     iterations.....................: 61276   500.458554/s
     success_rate...................: 100.00% ✓ 61276      ✗ 0    
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

     checks.........................: 100.00% ✓ 145647     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 58 MB   477 kB/s
     http_req_blocked...............: avg=5.46µs   min=1.19µs  med=3.63µs   max=3.23ms   p(90)=5.23µs   p(95)=5.86µs   p(99.9)=216.66µs
     http_req_connecting............: avg=1.59µs   min=0s      med=0s       max=3.19ms   p(90)=0s       p(95)=0s       p(99.9)=135.56µs
     http_req_duration..............: avg=123.13ms min=19.96ms med=121.24ms max=388.53ms p(90)=153.15ms p(95)=163.23ms p(99.9)=212.76ms
       { expected_response:true }...: avg=123.13ms min=19.96ms med=121.24ms max=388.53ms p(90)=153.15ms p(95)=163.23ms p(99.9)=212.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48649
     http_req_receiving.............: avg=94.06µs  min=32.36µs med=86.59µs  max=42.82ms  p(90)=120.06µs p(95)=133.8µs  p(99.9)=735.79µs
     http_req_sending...............: avg=37.07µs  min=5.99µs  med=16.62µs  max=260.5ms  p(90)=22.45µs  p(95)=24.68µs  p(99.9)=738.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.99ms min=19.85ms med=121.13ms max=387.63ms p(90)=153.04ms p(95)=163.09ms p(99.9)=211.45ms
     http_reqs......................: 48649   397.178395/s
     iteration_duration.............: avg=123.62ms min=42.63ms med=121.55ms max=398.33ms p(90)=153.44ms p(95)=163.54ms p(99.9)=217.74ms
     iterations.....................: 48549   396.361979/s
     success_rate...................: 100.00% ✓ 48549      ✗ 0    
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

     checks.........................: 100.00% ✓ 88245      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.76µs   min=1.3µs   med=3.5µs    max=4.78ms   p(90)=4.92µs   p(95)=5.55µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=4.01µs   min=0s      med=0s       max=4.74ms   p(90)=0s       p(95)=0s       p(99.9)=1.93ms  
     http_req_duration..............: avg=203.19ms min=16.98ms med=191.21ms max=587.68ms p(90)=237.14ms p(95)=390.46ms p(99.9)=539.94ms
       { expected_response:true }...: avg=203.19ms min=16.98ms med=191.21ms max=587.68ms p(90)=237.14ms p(95)=390.46ms p(99.9)=539.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29515
     http_req_receiving.............: avg=111.71µs min=34.33µs med=92.02µs  max=127.67ms p(90)=124.67µs p(95)=138.22µs p(99.9)=882.28µs
     http_req_sending...............: avg=27.07µs  min=6.35µs  med=16.63µs  max=60.91ms  p(90)=22.3µs   p(95)=24.24µs  p(99.9)=594.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.05ms min=16.56ms med=191.09ms max=587.59ms p(90)=237.02ms p(95)=390.17ms p(99.9)=539.83ms
     http_reqs......................: 29515   241.541284/s
     iteration_duration.............: avg=204.11ms min=49.96ms med=191.61ms max=587.98ms p(90)=237.49ms p(95)=393.28ms p(99.9)=540.18ms
     iterations.....................: 29415   240.722916/s
     success_rate...................: 100.00% ✓ 29415      ✗ 0    
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

     checks.........................: 100.00% ✓ 86766      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=7.1µs    min=1.16µs  med=3.44µs   max=3.99ms   p(90)=4.87µs   p(95)=5.45µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=206.66ms min=23.65ms med=213.04ms max=417.83ms p(90)=236.51ms p(95)=242.59ms p(99.9)=314.48ms
       { expected_response:true }...: avg=206.66ms min=23.65ms med=213.04ms max=417.83ms p(90)=236.51ms p(95)=242.59ms p(99.9)=314.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29022
     http_req_receiving.............: avg=102.04µs min=33.53µs med=92.02µs  max=66.87ms  p(90)=126.18µs p(95)=139.68µs p(99.9)=646.26µs
     http_req_sending...............: avg=33.41µs  min=6.27µs  med=16.56µs  max=154.96ms p(90)=22.31µs  p(95)=24.35µs  p(99.9)=516.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.53ms min=23.48ms med=212.9ms  max=417.22ms p(90)=236.37ms p(95)=242.47ms p(99.9)=314.37ms
     http_reqs......................: 29022   236.156435/s
     iteration_duration.............: avg=207.61ms min=58.54ms med=213.64ms max=450.06ms p(90)=236.8ms  p(95)=242.92ms p(99.9)=321.25ms
     iterations.....................: 28922   235.34272/s
     success_rate...................: 100.00% ✓ 28922      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

