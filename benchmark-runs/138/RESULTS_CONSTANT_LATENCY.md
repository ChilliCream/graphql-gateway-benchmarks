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
| hive-router | v0.0.43 | 1,581 | 1,604 | 1,573 | 0.6% |  |
| hotchocolate | 16.0.0-rc.1.27 | 1,438 | 1,455 | 1,433 | 0.5% |  |
| cosmo | 0.298.0 | 1,149 | 1,161 | 1,137 | 0.8% | non-compatible response (4 across 3/9 runs) |
| grafbase | 0.53.2 | 1,148 | 1,161 | 1,136 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.14 | 562 | 578 | 557 | 1.3% |  |
| apollo-router | v2.12.1 | 370 | 381 | 357 | 1.9% |  |
| hive-gateway | 2.5.14 | 264 | 270 | 262 | 1.1% |  |
| apollo-gateway | 2.13.3 | 234 | 236 | 233 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578910      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.6µs   min=932ns   med=2.48µs  max=7.11ms   p(90)=4.25µs   p(95)=5.2µs    p(99.9)=39.2µs 
     http_req_connecting............: avg=556ns   min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.84ms min=14.28ms med=30.55ms max=331.97ms p(90)=36.69ms  p(95)=38.64ms  p(99.9)=58.86ms
       { expected_response:true }...: avg=30.84ms min=14.28ms med=30.55ms max=331.97ms p(90)=36.69ms  p(95)=38.64ms  p(99.9)=58.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193070
     http_req_receiving.............: avg=84.82µs min=27.68µs med=53.8µs  max=186.72ms p(90)=104.86µs p(95)=152.22µs p(99.9)=2.66ms 
     http_req_sending...............: avg=35.14µs min=5.17µs  med=10.05µs max=140.47ms p(90)=20.4µs   p(95)=70.79µs  p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.72ms min=14.22ms med=30.45ms max=331.58ms p(90)=36.56ms  p(95)=38.5ms   p(99.9)=57.73ms
     http_reqs......................: 193070  1581.514402/s
     iteration_duration.............: avg=31.08ms min=14.5ms  med=30.78ms max=343.65ms p(90)=36.91ms  p(95)=38.86ms  p(99.9)=59.51ms
     iterations.....................: 192970  1580.695262/s
     success_rate...................: 100.00% ✓ 192970      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.27)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 526281      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.88µs   min=982ns   med=2.21µs   max=8.03ms   p(90)=3.92µs  p(95)=4.78µs   p(99.9)=28.08µs
     http_req_connecting............: avg=1.18µs   min=0s      med=0s       max=7.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.95ms  min=13.84ms med=32.72ms  max=470.8ms  p(90)=41.66ms p(95)=45.18ms  p(99.9)=83.6ms 
       { expected_response:true }...: avg=33.95ms  min=13.84ms med=32.72ms  max=470.8ms  p(90)=41.66ms p(95)=45.18ms  p(99.9)=83.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 175527
     http_req_receiving.............: avg=796.66µs min=50.76µs med=113.15µs max=249.92ms p(90)=2.23ms  p(95)=3.4ms    p(99.9)=16.59ms
     http_req_sending...............: avg=37.24µs  min=5.15µs  med=9.22µs   max=248.92ms p(90)=19.77µs p(95)=103.34µs p(99.9)=2.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.11ms  min=13.72ms med=31.93ms  max=469.56ms p(90)=40.61ms p(95)=44.04ms  p(99.9)=81.08ms
     http_reqs......................: 175527  1438.44469/s
     iteration_duration.............: avg=34.19ms  min=14.04ms med=32.94ms  max=471.02ms p(90)=41.88ms p(95)=45.41ms  p(99.9)=84.54ms
     iterations.....................: 175427  1437.625189/s
     success_rate...................: 100.00% ✓ 175427      ✗ 0     
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

     checks.........................: 100.00% ✓ 420642      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.87µs  min=1.05µs  med=2.56µs  max=4.43ms   p(90)=4.17µs   p(95)=4.9µs    p(99.9)=37.11µs
     http_req_connecting............: avg=925ns   min=0s      med=0s      max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.54ms min=19.28ms med=41.94ms max=357.79ms p(90)=51.75ms  p(95)=54.82ms  p(99.9)=71.11ms
       { expected_response:true }...: avg=42.54ms min=19.28ms med=41.94ms max=357.79ms p(90)=51.75ms  p(95)=54.82ms  p(99.9)=71.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140314
     http_req_receiving.............: avg=88.1µs  min=27.75µs med=64.47µs max=267.75ms p(90)=110.12µs p(95)=136.89µs p(99.9)=1.71ms 
     http_req_sending...............: avg=25.87µs min=5.3µs   med=10.98µs max=60.21ms  p(90)=18.78µs  p(95)=23.62µs  p(99.9)=1.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.43ms min=19.08ms med=41.84ms max=357.4ms  p(90)=51.64ms  p(95)=54.69ms  p(99.9)=70.57ms
     http_reqs......................: 140314  1149.845042/s
     iteration_duration.............: avg=42.78ms min=20.29ms med=42.15ms max=369.34ms p(90)=51.97ms  p(95)=55.03ms  p(99.9)=71.55ms
     iterations.....................: 140214  1149.025562/s
     success_rate...................: 100.00% ✓ 140214      ✗ 0     
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

     checks.........................: 100.00% ✓ 420252      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.63µs  min=992ns   med=2.22µs  max=4.35ms   p(90)=4.69µs   p(95)=5.86µs   p(99.9)=45.73µs
     http_req_connecting............: avg=713ns   min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.55ms min=16.56ms med=42.1ms  max=325.15ms p(90)=51.71ms  p(95)=54.88ms  p(99.9)=77.71ms
       { expected_response:true }...: avg=42.55ms min=16.56ms med=42.1ms  max=325.15ms p(90)=51.71ms  p(95)=54.88ms  p(99.9)=77.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140184
     http_req_receiving.............: avg=98.4µs  min=29.99µs med=58.76µs max=275.61ms p(90)=130.95µs p(95)=198.86µs p(99.9)=3.22ms 
     http_req_sending...............: avg=36.64µs min=5.24µs  med=9.74µs  max=245.84ms p(90)=23.63µs  p(95)=107.45µs p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.41ms min=16.41ms med=41.98ms max=318.5ms  p(90)=51.56ms  p(95)=54.71ms  p(99.9)=77.03ms
     http_reqs......................: 140184  1148.702265/s
     iteration_duration.............: avg=42.82ms min=16.87ms med=42.34ms max=357.58ms p(90)=51.95ms  p(95)=55.12ms  p(99.9)=78.63ms
     iterations.....................: 140084  1147.88284/s
     success_rate...................: 100.00% ✓ 140084      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 206298     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   676 kB/s
     http_req_blocked...............: avg=4.77µs   min=1.15µs  med=3.05µs  max=4.07ms   p(90)=4.55µs   p(95)=5.18µs   p(99.9)=45.91µs 
     http_req_connecting............: avg=1.46µs   min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.92ms  min=19.11ms med=83.08ms max=364.81ms p(90)=112.96ms p(95)=121.75ms p(99.9)=226.13ms
       { expected_response:true }...: avg=86.92ms  min=19.11ms med=83.08ms max=364.81ms p(90)=112.96ms p(95)=121.75ms p(99.9)=226.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68866
     http_req_receiving.............: avg=148.28µs min=31.59µs med=76.96µs max=245.24ms p(90)=112.01µs p(95)=125.57µs p(99.9)=1.37ms  
     http_req_sending...............: avg=27.05µs  min=6.05µs  med=13.63µs max=251.43ms p(90)=20.1µs   p(95)=22.43µs  p(99.9)=662.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.75ms  min=18.96ms med=82.96ms max=269.69ms p(90)=112.84ms p(95)=121.58ms p(99.9)=221.46ms
     http_reqs......................: 68866   562.654303/s
     iteration_duration.............: avg=87.26ms  min=32.87ms med=83.32ms max=385.57ms p(90)=113.21ms p(95)=121.98ms p(99.9)=229.2ms 
     iterations.....................: 68766   561.837275/s
     success_rate...................: 100.00% ✓ 68766      ✗ 0    
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

     checks.........................: 100.00% ✓ 136020     ✗ 0    
     data_received..................: 4.0 GB  32 MB/s
     data_sent......................: 55 MB   445 kB/s
     http_req_blocked...............: avg=5.82µs   min=1.19µs  med=3.34µs   max=4.31ms   p(90)=4.9µs    p(95)=5.54µs   p(99.9)=274.11µs
     http_req_connecting............: avg=2.2µs    min=0s      med=0s       max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=118.83µs
     http_req_duration..............: avg=131.87ms min=20.15ms med=129.68ms max=341.5ms  p(90)=165.14ms p(95)=176.41ms p(99.9)=225.51ms
       { expected_response:true }...: avg=131.87ms min=20.15ms med=129.68ms max=341.5ms  p(90)=165.14ms p(95)=176.41ms p(99.9)=225.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45440
     http_req_receiving.............: avg=90.17µs  min=29.75µs med=85.14µs  max=8.53ms   p(90)=118.63µs p(95)=131.83µs p(99.9)=635.33µs
     http_req_sending...............: avg=22.71µs  min=5.92µs  med=16.2µs   max=34.65ms  p(90)=22.2µs   p(95)=24.33µs  p(99.9)=617.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=131.76ms min=20.02ms med=129.57ms max=341.11ms p(90)=165.03ms p(95)=176.29ms p(99.9)=225.24ms
     http_reqs......................: 45440   370.875695/s
     iteration_duration.............: avg=132.38ms min=50.41ms med=129.99ms max=380.21ms p(90)=165.43ms p(95)=176.71ms p(99.9)=227.51ms
     iterations.....................: 45340   370.059507/s
     success_rate...................: 100.00% ✓ 45340      ✗ 0    
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

     checks.........................: 100.00% ✓ 96936      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=7.37µs   min=1.3µs   med=3.68µs   max=4.48ms   p(90)=5.32µs   p(95)=5.96µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=185.07ms min=19ms    med=173.76ms max=591.13ms p(90)=220.45ms p(95)=271.45ms p(99.9)=554.77ms
       { expected_response:true }...: avg=185.07ms min=19ms    med=173.76ms max=591.13ms p(90)=220.45ms p(95)=271.45ms p(99.9)=554.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32412
     http_req_receiving.............: avg=120.54µs min=34.28µs med=97.51µs  max=190.61ms p(90)=131.8µs  p(95)=146.49µs p(99.9)=842.31µs
     http_req_sending...............: avg=32.99µs  min=6.32µs  med=18.13µs  max=103.25ms p(90)=23.73µs  p(95)=25.74µs  p(99.9)=602.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.92ms min=18.89ms med=173.6ms  max=591.04ms p(90)=220.33ms p(95)=270.76ms p(99.9)=554.63ms
     http_reqs......................: 32412   264.702601/s
     iteration_duration.............: avg=185.91ms min=56.56ms med=174.2ms  max=591.35ms p(90)=220.86ms p(95)=276.72ms p(99.9)=555.07ms
     iterations.....................: 32312   263.88592/s
     success_rate...................: 100.00% ✓ 32312      ✗ 0    
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

     checks.........................: 100.00% ✓ 86130      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=7.18µs   min=1.26µs  med=3.51µs   max=4.09ms   p(90)=4.92µs   p(95)=5.52µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.44µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=208.23ms min=21.67ms med=214.09ms max=450.77ms p(90)=225.86ms p(95)=231.43ms p(99.9)=302.62ms
       { expected_response:true }...: avg=208.23ms min=21.67ms med=214.09ms max=450.77ms p(90)=225.86ms p(95)=231.43ms p(99.9)=302.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28810
     http_req_receiving.............: avg=115.22µs min=34µs    med=92.27µs  max=82.3ms   p(90)=125.72µs p(95)=139.82µs p(99.9)=803.02µs
     http_req_sending...............: avg=28.57µs  min=6.21µs  med=16.94µs  max=79.75ms  p(90)=22.3µs   p(95)=24.23µs  p(99.9)=572.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.08ms min=21.47ms med=213.97ms max=429.36ms p(90)=225.74ms p(95)=231.3ms  p(99.9)=302.51ms
     http_reqs......................: 28810   234.389894/s
     iteration_duration.............: avg=209.16ms min=61.3ms  med=214.38ms max=469.74ms p(90)=226.14ms p(95)=231.77ms p(99.9)=319.06ms
     iterations.....................: 28710   233.576323/s
     success_rate...................: 100.00% ✓ 28710      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

