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
| hive-router | v0.0.49 | 1,585 | 1,606 | 1,577 | 0.6% |  |
| hotchocolate | 16.1.0-p.14 | 1,472 | 1,482 | 1,461 | 0.5% |  |
| cosmo | 0.307.0 | 1,157 | 1,169 | 1,152 | 0.5% | non-compatible response (3 across 2/9 runs) |
| grafbase | 0.53.3 | 1,130 | 1,151 | 1,122 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 514 | 523 | 509 | 0.8% |  |
| apollo-router | v2.13.1 | 396 | 405 | 394 | 1.0% |  |
| apollo-gateway | 2.13.3 | 231 | 234 | 230 | 0.5% |  |
| hive-gateway | 2.5.25 | 228 | 231 | 217 | 1.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579990      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.2µs   min=962ns   med=2.14µs  max=4.51ms   p(90)=3.97µs   p(95)=4.93µs   p(99.9)=31.49µs
     http_req_connecting............: avg=588ns   min=0s      med=0s      max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.79ms min=13.99ms med=30.54ms max=344.78ms p(90)=36.57ms  p(95)=38.46ms  p(99.9)=57.27ms
       { expected_response:true }...: avg=30.79ms min=13.99ms med=30.54ms max=344.78ms p(90)=36.57ms  p(95)=38.46ms  p(99.9)=57.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193430
     http_req_receiving.............: avg=83.02µs min=27.06µs med=52.67µs max=99.91ms  p(90)=103.16µs p(95)=147.12µs p(99.9)=2.43ms 
     http_req_sending...............: avg=32.03µs min=5.03µs  med=9.27µs  max=83.87ms  p(90)=19.52µs  p(95)=34.59µs  p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.67ms min=13.93ms med=30.43ms max=344.22ms p(90)=36.45ms  p(95)=38.33ms  p(99.9)=56.44ms
     http_reqs......................: 193430  1585.42879/s
     iteration_duration.............: avg=31.02ms min=14.17ms med=30.76ms max=355.31ms p(90)=36.78ms  p(95)=38.68ms  p(99.9)=57.91ms
     iterations.....................: 193330  1584.609151/s
     success_rate...................: 100.00% ✓ 193330      ✗ 0     
     vus............................: 37      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 538416      ✗ 0     
     data_received..................: 16 GB   129 MB/s
     data_sent......................: 216 MB  1.8 MB/s
     http_req_blocked...............: avg=3.83µs   min=982ns   med=2.22µs   max=105.26ms p(90)=4.06µs  p(95)=4.95µs   p(99.9)=38.81µs
     http_req_connecting............: avg=481ns    min=0s      med=0s       max=3.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.17ms  min=14.49ms med=32.12ms  max=875.12ms p(90)=40.36ms p(95)=43.24ms  p(99.9)=96.87ms
       { expected_response:true }...: avg=33.17ms  min=14.49ms med=32.12ms  max=875.12ms p(90)=40.36ms p(95)=43.24ms  p(99.9)=96.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179572
     http_req_receiving.............: avg=783.15µs min=51.38µs med=112.91µs max=148.07ms p(90)=2.29ms  p(95)=3.41ms   p(99.9)=16.6ms 
     http_req_sending...............: avg=35.96µs  min=5.15µs  med=9.31µs   max=98.31ms  p(90)=19.99µs p(95)=107.46µs p(99.9)=2.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.35ms  min=14.14ms med=31.33ms  max=874.9ms  p(90)=39.28ms p(95)=42.09ms  p(99.9)=95.3ms 
     http_reqs......................: 179572  1472.161475/s
     iteration_duration.............: avg=33.42ms  min=14.7ms  med=32.35ms  max=875.36ms p(90)=40.58ms p(95)=43.45ms  p(99.9)=97.77ms
     iterations.....................: 179472  1471.341659/s
     success_rate...................: 100.00% ✓ 179472      ✗ 0     
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

     checks.........................: 100.00% ✓ 423369      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.03µs  med=2.26µs  max=4.08ms   p(90)=3.96µs   p(95)=4.73µs   p(99.9)=33.92µs
     http_req_connecting............: avg=723ns   min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.27ms min=18.65ms med=41.66ms max=357.5ms  p(90)=51.42ms  p(95)=54.58ms  p(99.9)=71.75ms
       { expected_response:true }...: avg=42.27ms min=18.65ms med=41.66ms max=357.5ms  p(90)=51.42ms  p(95)=54.58ms  p(99.9)=71.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141223
     http_req_receiving.............: avg=84.33µs min=28.12µs med=62.72µs max=81.54ms  p(90)=107.93µs p(95)=133.83µs p(99.9)=1.87ms 
     http_req_sending...............: avg=28.69µs min=5.18µs  med=10.4µs  max=215.09ms p(90)=18.31µs  p(95)=22.96µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.15ms min=18.4ms  med=41.56ms max=329.44ms p(90)=51.31ms  p(95)=54.46ms  p(99.9)=71.11ms
     http_reqs......................: 141223  1157.188461/s
     iteration_duration.............: avg=42.5ms  min=19.04ms med=41.87ms max=365.78ms p(90)=51.63ms  p(95)=54.79ms  p(99.9)=72.24ms
     iterations.....................: 141123  1156.369056/s
     success_rate...................: 100.00% ✓ 141123      ✗ 0     
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

     checks.........................: 100.00% ✓ 413619      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs  min=951ns   med=2.21µs  max=4.78ms   p(90)=4.58µs   p(95)=5.73µs   p(99.9)=46.91µs
     http_req_connecting............: avg=821ns   min=0s      med=0s      max=4.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.23ms min=16.6ms  med=42.84ms max=317.6ms  p(90)=52.49ms  p(95)=55.78ms  p(99.9)=80.29ms
       { expected_response:true }...: avg=43.23ms min=16.6ms  med=42.84ms max=317.6ms  p(90)=52.49ms  p(95)=55.78ms  p(99.9)=80.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137973
     http_req_receiving.............: avg=95.72µs min=29.32µs med=59.51µs max=135.85ms p(90)=130.86µs p(95)=204.17µs p(99.9)=2.91ms 
     http_req_sending...............: avg=34.94µs min=5.2µs   med=9.67µs  max=49.77ms  p(90)=23.41µs  p(95)=108.88µs p(99.9)=2.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.1ms  min=16.47ms med=42.72ms max=317.01ms p(90)=52.34ms  p(95)=55.61ms  p(99.9)=80.19ms
     http_reqs......................: 137973  1130.747144/s
     iteration_duration.............: avg=43.51ms min=16.79ms med=43.08ms max=364.55ms p(90)=52.73ms  p(95)=56.02ms  p(99.9)=81.02ms
     iterations.....................: 137873  1129.927602/s
     success_rate...................: 100.00% ✓ 137873      ✗ 0     
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

     checks.........................: 100.00% ✓ 188541     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   617 kB/s
     http_req_blocked...............: avg=4.78µs  min=1.22µs  med=3.09µs  max=5.81ms   p(90)=4.76µs   p(95)=5.42µs   p(99.9)=50.83µs 
     http_req_connecting............: avg=1.33µs  min=0s      med=0s      max=5.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.13ms min=22.38ms med=95.56ms max=372.01ms p(90)=134.05ms p(95)=146.28ms p(99.9)=246.43ms
       { expected_response:true }...: avg=95.13ms min=22.38ms med=95.56ms max=372.01ms p(90)=134.05ms p(95)=146.28ms p(99.9)=246.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62947
     http_req_receiving.............: avg=88.91µs min=30.7µs  med=78.21µs max=91.17ms  p(90)=114.7µs  p(95)=128.48µs p(99.9)=902.02µs
     http_req_sending...............: avg=27.54µs min=5.56µs  med=13.84µs max=114.58ms p(90)=20.7µs   p(95)=23.05µs  p(99.9)=754.86µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.01ms min=22.27ms med=95.46ms max=367.3ms  p(90)=133.92ms p(95)=146.15ms p(99.9)=245.68ms
     http_reqs......................: 62947   514.011501/s
     iteration_duration.............: avg=95.49ms min=23.96ms med=95.84ms max=382.6ms  p(90)=134.29ms p(95)=146.55ms p(99.9)=248.67ms
     iterations.....................: 62847   513.194923/s
     success_rate...................: 100.00% ✓ 62847      ✗ 0    
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

     checks.........................: 100.00% ✓ 145461     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=5.71µs   min=1.09µs  med=3.26µs   max=4.38ms   p(90)=4.86µs   p(95)=5.48µs   p(99.9)=837.94µs
     http_req_connecting............: avg=2.18µs   min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=780.43µs
     http_req_duration..............: avg=123.26ms min=20.94ms med=121.59ms max=389.5ms  p(90)=153.48ms p(95)=163.41ms p(99.9)=210.03ms
       { expected_response:true }...: avg=123.26ms min=20.94ms med=121.59ms max=389.5ms  p(90)=153.48ms p(95)=163.41ms p(99.9)=210.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48587
     http_req_receiving.............: avg=96.79µs  min=31.31µs med=84.38µs  max=152.14ms p(90)=118.12µs p(95)=130.44µs p(99.9)=752.21µs
     http_req_sending...............: avg=26.47µs  min=5.52µs  med=15.85µs  max=169.42ms p(90)=21.87µs  p(95)=24.03µs  p(99.9)=604.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.14ms min=20.8ms  med=121.47ms max=340.52ms p(90)=153.35ms p(95)=163.28ms p(99.9)=207.95ms
     http_reqs......................: 48587   396.7499/s
     iteration_duration.............: avg=123.76ms min=43.89ms med=121.88ms max=410.2ms  p(90)=153.75ms p(95)=163.68ms p(99.9)=213.76ms
     iterations.....................: 48487   395.933324/s
     success_rate...................: 100.00% ✓ 48487      ✗ 0    
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

     checks.........................: 100.00% ✓ 84948      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.27µs   min=1.26µs  med=3.34µs   max=4.73ms   p(90)=4.79µs   p(95)=5.41µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.72µs   min=0s      med=0s       max=4.66ms   p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=211.07ms min=23.81ms med=215.37ms max=426.96ms p(90)=227.52ms p(95)=233.18ms p(99.9)=309.33ms
       { expected_response:true }...: avg=211.07ms min=23.81ms med=215.37ms max=426.96ms p(90)=227.52ms p(95)=233.18ms p(99.9)=309.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28416
     http_req_receiving.............: avg=99.18µs  min=30.62µs med=91.35µs  max=75.43ms  p(90)=124.47µs p(95)=137.61µs p(99.9)=715.15µs
     http_req_sending...............: avg=46.92µs  min=5.68µs  med=16.62µs  max=192.49ms p(90)=22.23µs  p(95)=24.31µs  p(99.9)=656.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.92ms min=23.64ms med=215.26ms max=426.19ms p(90)=227.4ms  p(95)=233.03ms p(99.9)=308.05ms
     http_reqs......................: 28416   231.308672/s
     iteration_duration.............: avg=212.03ms min=65.77ms med=215.66ms max=452.37ms p(90)=227.81ms p(95)=233.48ms p(99.9)=319.18ms
     iterations.....................: 28316   230.494664/s
     success_rate...................: 100.00% ✓ 28316      ✗ 0    
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

     checks.........................: 100.00% ✓ 83460      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 34 MB   274 kB/s
     http_req_blocked...............: avg=7.57µs   min=1.19µs  med=3.49µs   max=4.06ms   p(90)=4.94µs   p(95)=5.5µs    p(99.9)=2.12ms  
     http_req_connecting............: avg=3.9µs    min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=2.1ms   
     http_req_duration..............: avg=214.82ms min=18.87ms med=192.32ms max=701.56ms p(90)=313.16ms p(95)=443.13ms p(99.9)=637.08ms
       { expected_response:true }...: avg=214.82ms min=18.87ms med=192.32ms max=701.56ms p(90)=313.16ms p(95)=443.13ms p(99.9)=637.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27920
     http_req_receiving.............: avg=101.05µs min=36.13µs med=93.82µs  max=40.62ms  p(90)=126.61µs p(95)=140.14µs p(99.9)=613.63µs
     http_req_sending...............: avg=28.13µs  min=6.07µs  med=17.02µs  max=119.76ms p(90)=22.32µs  p(95)=24.11µs  p(99.9)=560.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.69ms min=18.72ms med=192.19ms max=701.37ms p(90)=313.02ms p(95)=443.02ms p(99.9)=636.94ms
     http_reqs......................: 27920   228.417515/s
     iteration_duration.............: avg=215.81ms min=61.94ms med=193.62ms max=701.83ms p(90)=313.5ms  p(95)=443.99ms p(99.9)=637.44ms
     iterations.....................: 27820   227.599401/s
     success_rate...................: 100.00% ✓ 27820      ✗ 0    
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

