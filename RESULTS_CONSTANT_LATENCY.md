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
| hive-router | v0.0.42 | 1,591 | 1,624 | 1,583 | 0.8% |  |
| hotchocolate | 16.0.0-rc.1.15 | 1,425 | 1,437 | 1,413 | 0.7% |  |
| grafbase | 0.53.2 | 1,140 | 1,158 | 1,130 | 0.8% |  |
| cosmo | 0.295.0 | 1,139 | 1,156 | 1,130 | 0.8% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 573 | 584 | 567 | 0.9% |  |
| apollo-router | v2.12.0 | 366 | 377 | 362 | 1.4% |  |
| hive-gateway | 2.5.11 | 261 | 268 | 254 | 1.6% |  |
| apollo-gateway | 2.13.3 | 228 | 230 | 217 | 1.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 582300      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.24µs  min=972ns   med=2.14µs  max=5.12ms   p(90)=3.99µs   p(95)=4.96µs   p(99.9)=33.28µs
     http_req_connecting............: avg=537ns   min=0s      med=0s      max=4.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.66ms min=13.92ms med=30.43ms max=317.72ms p(90)=36.35ms  p(95)=38.23ms  p(99.9)=57.02ms
       { expected_response:true }...: avg=30.66ms min=13.92ms med=30.43ms max=317.72ms p(90)=36.35ms  p(95)=38.23ms  p(99.9)=57.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194200
     http_req_receiving.............: avg=84µs    min=27.9µs  med=53.29µs max=112.69ms p(90)=105.83µs p(95)=152.58µs p(99.9)=2.45ms 
     http_req_sending...............: avg=34.17µs min=5.24µs  med=9.31µs  max=153.4ms  p(90)=19.67µs  p(95)=44.51µs  p(99.9)=1.8ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.54ms min=13.85ms med=30.32ms max=317.46ms p(90)=36.23ms  p(95)=38.08ms  p(99.9)=55.65ms
     http_reqs......................: 194200  1591.593629/s
     iteration_duration.............: avg=30.9ms  min=14.1ms  med=30.65ms max=367.49ms p(90)=36.56ms  p(95)=38.45ms  p(99.9)=57.49ms
     iterations.....................: 194100  1590.774065/s
     success_rate...................: 100.00% ✓ 194100      ✗ 0     
     vus............................: 33      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 521325      ✗ 0     
     data_received..................: 15 GB   125 MB/s
     data_sent......................: 209 MB  1.7 MB/s
     http_req_blocked...............: avg=2.76µs   min=962ns   med=2.04µs   max=2.89ms   p(90)=3.69µs  p(95)=4.55µs  p(99.9)=27.38µs
     http_req_connecting............: avg=240ns    min=0s      med=0s       max=2.17ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=34.27ms  min=14.6ms  med=33.08ms  max=467.75ms p(90)=42.07ms p(95)=45.7ms  p(99.9)=91.37ms
       { expected_response:true }...: avg=34.27ms  min=14.6ms  med=33.08ms  max=467.75ms p(90)=42.07ms p(95)=45.7ms  p(99.9)=91.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173875
     http_req_receiving.............: avg=771.25µs min=50.47µs med=110.74µs max=96.41ms  p(90)=2.26ms  p(95)=3.46ms  p(99.9)=15.3ms 
     http_req_sending...............: avg=34.22µs  min=4.82µs  med=8.89µs   max=81.07ms  p(90)=19.2µs  p(95)=96.76µs p(99.9)=2.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=33.47ms  min=14.43ms med=32.3ms   max=467.66ms p(90)=41.01ms p(95)=44.49ms p(99.9)=89.9ms 
     http_reqs......................: 173875  1425.065736/s
     iteration_duration.............: avg=34.52ms  min=14.91ms med=33.3ms   max=467.93ms p(90)=42.29ms p(95)=45.92ms p(99.9)=92.64ms
     iterations.....................: 173775  1424.246144/s
     success_rate...................: 100.00% ✓ 173775      ✗ 0     
     vus............................: 39      min=0         max=50  
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

     checks.........................: 100.00% ✓ 417231      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=4.65µs  min=1.01µs  med=2.21µs  max=9.38ms   p(90)=4.55µs   p(95)=5.65µs   p(99.9)=43.91µs
     http_req_connecting............: avg=1.79µs  min=0s      med=0s      max=8.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.86ms min=15.42ms med=42.49ms max=344.8ms  p(90)=51.96ms  p(95)=55.01ms  p(99.9)=77.1ms 
       { expected_response:true }...: avg=42.86ms min=15.42ms med=42.49ms max=344.8ms  p(90)=51.96ms  p(95)=55.01ms  p(99.9)=77.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139177
     http_req_receiving.............: avg=95.5µs  min=29.03µs med=58.02µs max=153.79ms p(90)=128.76µs p(95)=196.02µs p(99.9)=3.14ms 
     http_req_sending...............: avg=38.75µs min=4.94µs  med=9.54µs  max=145.42ms p(90)=22.86µs  p(95)=105.95µs p(99.9)=2.96ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.73ms min=15.29ms med=42.37ms max=341.17ms p(90)=51.82ms  p(95)=54.87ms  p(99.9)=76.59ms
     http_reqs......................: 139177  1140.737672/s
     iteration_duration.............: avg=43.13ms min=17.69ms med=42.73ms max=356.8ms  p(90)=52.19ms  p(95)=55.24ms  p(99.9)=77.64ms
     iterations.....................: 139077  1139.918041/s
     success_rate...................: 100.00% ✓ 139077      ✗ 0     
     vus............................: 49      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 416856      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.24µs  min=1.08µs  med=2.56µs  max=2.99ms   p(90)=4.13µs   p(95)=4.86µs   p(99.9)=36.31µs
     http_req_connecting............: avg=306ns   min=0s      med=0s      max=2.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.93ms min=19.47ms med=42.35ms max=357.27ms p(90)=52.15ms  p(95)=55.26ms  p(99.9)=72.16ms
       { expected_response:true }...: avg=42.93ms min=19.47ms med=42.35ms max=357.27ms p(90)=52.15ms  p(95)=55.26ms  p(99.9)=72.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139052
     http_req_receiving.............: avg=86.38µs min=28.87µs med=64.57µs max=158.84ms p(90)=107.98µs p(95)=133.07µs p(99.9)=1.76ms 
     http_req_sending...............: avg=29.03µs min=5.48µs  med=10.84µs max=198.68ms p(90)=17.77µs  p(95)=22.37µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.82ms min=19.33ms med=42.24ms max=356.98ms p(90)=52.03ms  p(95)=55.13ms  p(99.9)=71.61ms
     http_reqs......................: 139052  1139.556768/s
     iteration_duration.............: avg=43.17ms min=20.5ms  med=42.56ms max=369.35ms p(90)=52.35ms  p(95)=55.46ms  p(99.9)=72.47ms
     iterations.....................: 138952  1138.737249/s
     success_rate...................: 100.00% ✓ 138952      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 210498     ✗ 0    
     data_received..................: 6.2 GB  50 MB/s
     data_sent......................: 84 MB   689 kB/s
     http_req_blocked...............: avg=4.98µs   min=1.16µs  med=3.13µs  max=4.25ms   p(90)=4.79µs   p(95)=5.46µs   p(99.9)=47.6µs  
     http_req_connecting............: avg=1.54µs   min=0s      med=0s      max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.19ms  min=18.82ms med=87.4ms  max=365.86ms p(90)=108.17ms p(95)=115.61ms p(99.9)=215.11ms
       { expected_response:true }...: avg=85.19ms  min=18.82ms med=87.4ms  max=365.86ms p(90)=108.17ms p(95)=115.61ms p(99.9)=215.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70266
     http_req_receiving.............: avg=156.65µs min=31.86µs med=76.75µs max=290.72ms p(90)=112.5µs  p(95)=126.44µs p(99.9)=1.6ms   
     http_req_sending...............: avg=21.91µs  min=5.54µs  med=13.6µs  max=56.33ms  p(90)=20.23µs  p(95)=22.79µs  p(99.9)=703.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.01ms  min=18.69ms med=87.27ms max=253.83ms p(90)=108.03ms p(95)=115.45ms p(99.9)=213.34ms
     http_reqs......................: 70266   573.9622/s
     iteration_duration.............: avg=85.52ms  min=25.16ms med=87.66ms max=392.08ms p(90)=108.4ms  p(95)=115.88ms p(99.9)=216.07ms
     iterations.....................: 70166   573.145358/s
     success_rate...................: 100.00% ✓ 70166      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 134490     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   440 kB/s
     http_req_blocked...............: avg=6.1µs    min=1.25µs  med=3.35µs   max=4.17ms   p(90)=4.89µs   p(95)=5.5µs    p(99.9)=1.17ms  
     http_req_connecting............: avg=2.48µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.06ms  
     http_req_duration..............: avg=133.31ms min=20.2ms  med=131.29ms max=289.85ms p(90)=167.04ms p(95)=178.33ms p(99.9)=224.68ms
       { expected_response:true }...: avg=133.31ms min=20.2ms  med=131.29ms max=289.85ms p(90)=167.04ms p(95)=178.33ms p(99.9)=224.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44930
     http_req_receiving.............: avg=91.5µs   min=31.81µs med=85.32µs  max=46.85ms  p(90)=118.44µs p(95)=131.28µs p(99.9)=667.71µs
     http_req_sending...............: avg=22.51µs  min=6.15µs  med=15.53µs  max=53.44ms  p(90)=21.55µs  p(95)=23.68µs  p(99.9)=593.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.19ms min=20.07ms med=131.19ms max=289.31ms p(90)=166.94ms p(95)=178.2ms  p(99.9)=224.15ms
     http_reqs......................: 44930   366.774433/s
     iteration_duration.............: avg=133.88ms min=45.16ms med=131.6ms  max=385.75ms p(90)=167.41ms p(95)=178.69ms p(99.9)=233.12ms
     iterations.....................: 44830   365.958109/s
     success_rate...................: 100.00% ✓ 44830      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95589      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=7.2µs    min=1.25µs  med=3.63µs   max=4.77ms   p(90)=5.25µs   p(95)=5.88µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=3.35µs   min=0s      med=0s       max=4.72ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=187.53ms min=18.88ms med=174.86ms max=633.76ms p(90)=219.09ms p(95)=345.45ms p(99.9)=539.84ms
       { expected_response:true }...: avg=187.53ms min=18.88ms med=174.86ms max=633.76ms p(90)=219.09ms p(95)=345.45ms p(99.9)=539.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31963
     http_req_receiving.............: avg=105.81µs min=35.75µs med=98.72µs  max=33.99ms  p(90)=132.6µs  p(95)=147.06µs p(99.9)=824.19µs
     http_req_sending...............: avg=29.11µs  min=5.79µs  med=17.98µs  max=59.89ms  p(90)=23.27µs  p(95)=25.15µs  p(99.9)=707.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.4ms  min=18.76ms med=174.73ms max=633.69ms p(90)=218.95ms p(95)=345.26ms p(99.9)=539.73ms
     http_reqs......................: 31963   261.375686/s
     iteration_duration.............: avg=188.39ms min=42.99ms med=175.26ms max=633.95ms p(90)=219.52ms p(95)=362.52ms p(99.9)=540.15ms
     iterations.....................: 31863   260.557941/s
     success_rate...................: 100.00% ✓ 31863      ✗ 0    
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

     checks.........................: 100.00% ✓ 83802      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   274 kB/s
     http_req_blocked...............: avg=7.13µs   min=1.23µs  med=3.35µs   max=3.86ms   p(90)=4.74µs   p(95)=5.31µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=3.59µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=213.92ms min=23.36ms med=219.09ms max=444.17ms p(90)=237.07ms p(95)=248.68ms p(99.9)=312.24ms
       { expected_response:true }...: avg=213.92ms min=23.36ms med=219.09ms max=444.17ms p(90)=237.07ms p(95)=248.68ms p(99.9)=312.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28034
     http_req_receiving.............: avg=102.62µs min=34.86µs med=91.23µs  max=93.12ms  p(90)=124.54µs p(95)=137.32µs p(99.9)=484.73µs
     http_req_sending...............: avg=34.22µs  min=6.02µs  med=16.61µs  max=93.07ms  p(90)=22.09µs  p(95)=24.06µs  p(99.9)=646.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.79ms min=23.18ms med=218.97ms max=443.64ms p(90)=236.95ms p(95)=248.57ms p(99.9)=311.89ms
     http_reqs......................: 28034   228.15651/s
     iteration_duration.............: avg=214.91ms min=54.28ms med=219.39ms max=469.44ms p(90)=237.37ms p(95)=249.08ms p(99.9)=323.99ms
     iterations.....................: 27934   227.342653/s
     success_rate...................: 100.00% ✓ 27934      ✗ 0    
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

