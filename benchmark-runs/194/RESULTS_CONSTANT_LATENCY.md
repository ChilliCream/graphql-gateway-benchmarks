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
| hive-router | v0.0.49 | 1,589 | 1,609 | 1,573 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,454 | 1,466 | 1,449 | 0.4% |  |
| grafbase | 0.53.3 | 1,149 | 1,167 | 1,140 | 0.8% |  |
| cosmo | 0.307.0 | 1,137 | 1,155 | 1,126 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 491 | 505 | 487 | 1.3% |  |
| apollo-router | v2.13.1 | 366 | 377 | 360 | 1.6% |  |
| hive-gateway | 2.5.25 | 242 | 247 | 239 | 1.2% |  |
| apollo-gateway | 2.13.3 | 233 | 236 | 232 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 581553      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.34µs  min=922ns   med=2.07µs  max=6.55ms   p(90)=3.85µs   p(95)=4.77µs   p(99.9)=31.17µs
     http_req_connecting............: avg=802ns   min=0s      med=0s      max=6.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.71ms min=13.18ms med=30.43ms max=318.16ms p(90)=36.53ms  p(95)=38.5ms   p(99.9)=56.55ms
       { expected_response:true }...: avg=30.71ms min=13.18ms med=30.43ms max=318.16ms p(90)=36.53ms  p(95)=38.5ms   p(99.9)=56.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193951
     http_req_receiving.............: avg=83.08µs min=27.06µs med=51.41µs max=129.44ms p(90)=103.12µs p(95)=153.18µs p(99.9)=2.38ms 
     http_req_sending...............: avg=34.77µs min=5.1µs   med=9.09µs  max=122.11ms p(90)=19.58µs  p(95)=65.37µs  p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.59ms min=13.02ms med=30.32ms max=316.48ms p(90)=36.41ms  p(95)=38.35ms  p(99.9)=55.67ms
     http_reqs......................: 193951  1589.316421/s
     iteration_duration.............: avg=30.94ms min=13.48ms med=30.64ms max=334.02ms p(90)=36.74ms  p(95)=38.71ms  p(99.9)=57.01ms
     iterations.....................: 193851  1588.496979/s
     success_rate...................: 100.00% ✓ 193851      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 532143      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.12µs   min=951ns   med=2.02µs   max=8.2ms    p(90)=3.65µs  p(95)=4.55µs   p(99.9)=33.41µs
     http_req_connecting............: avg=563ns    min=0s      med=0s       max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.57ms  min=13.93ms med=32.51ms  max=532.55ms p(90)=41.17ms p(95)=44.42ms  p(99.9)=86.41ms
       { expected_response:true }...: avg=33.57ms  min=13.93ms med=32.51ms  max=532.55ms p(90)=41.17ms p(95)=44.42ms  p(99.9)=86.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177481
     http_req_receiving.............: avg=770.87µs min=50.83µs med=111.55µs max=125.91ms p(90)=2.2ms   p(95)=3.32ms   p(99.9)=17.4ms 
     http_req_sending...............: avg=38.19µs  min=5.1µs   med=8.9µs    max=224.14ms p(90)=19.78µs p(95)=102.85µs p(99.9)=2.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.76ms  min=13.81ms med=31.73ms  max=532.32ms p(90)=40.14ms p(95)=43.26ms  p(99.9)=84.46ms
     http_reqs......................: 177481  1454.488104/s
     iteration_duration.............: avg=33.81ms  min=14.17ms med=32.73ms  max=532.77ms p(90)=41.39ms p(95)=44.64ms  p(99.9)=87.6ms 
     iterations.....................: 177381  1453.668586/s
     success_rate...................: 100.00% ✓ 177381      ✗ 0     
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

     checks.........................: 100.00% ✓ 420546      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.55µs  min=972ns   med=2.2µs   max=4.11ms   p(90)=4.6µs    p(95)=5.7µs    p(99.9)=44.92µs
     http_req_connecting............: avg=728ns   min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.52ms min=16.14ms med=42.04ms max=327.37ms p(90)=51.67ms  p(95)=54.91ms  p(99.9)=79.41ms
       { expected_response:true }...: avg=42.52ms min=16.14ms med=42.04ms max=327.37ms p(90)=51.67ms  p(95)=54.91ms  p(99.9)=79.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140282
     http_req_receiving.............: avg=93.4µs  min=29.71µs med=57.92µs max=25.4ms   p(90)=129.53µs p(95)=196.75µs p(99.9)=2.95ms 
     http_req_sending...............: avg=38.82µs min=5.13µs  med=9.89µs  max=145.91ms p(90)=24.06µs  p(95)=108.66µs p(99.9)=2.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.38ms min=15.82ms med=41.92ms max=326.81ms p(90)=51.53ms  p(95)=54.75ms  p(99.9)=79.26ms
     http_reqs......................: 140282  1149.844889/s
     iteration_duration.............: avg=42.79ms min=17.37ms med=42.28ms max=350.75ms p(90)=51.9ms   p(95)=55.15ms  p(99.9)=80.02ms
     iterations.....................: 140182  1149.025223/s
     success_rate...................: 100.00% ✓ 140182      ✗ 0     
     vus............................: 25      min=0         max=50  
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

     checks.........................: 100.00% ✓ 416100      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.31µs  min=1.03µs  med=2.15µs  max=4.54ms   p(90)=3.71µs   p(95)=4.49µs   p(99.9)=30.85µs
     http_req_connecting............: avg=785ns   min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.02ms min=17.42ms med=42.42ms max=347.35ms p(90)=52.34ms  p(95)=55.45ms  p(99.9)=72.4ms 
       { expected_response:true }...: avg=43.02ms min=17.42ms med=42.42ms max=347.35ms p(90)=52.34ms  p(95)=55.45ms  p(99.9)=72.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 138800
     http_req_receiving.............: avg=85.3µs  min=27.92µs med=63.13µs max=82.59ms  p(90)=107.56µs p(95)=133.09µs p(99.9)=1.53ms 
     http_req_sending...............: avg=24.59µs min=5.28µs  med=10.35µs max=84.05ms  p(90)=18.04µs  p(95)=22.52µs  p(99.9)=1.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.91ms min=16.94ms med=42.32ms max=329.66ms p(90)=52.23ms  p(95)=55.34ms  p(99.9)=71.95ms
     http_reqs......................: 138800  1137.285826/s
     iteration_duration.............: avg=43.25ms min=20.14ms med=42.63ms max=361.6ms  p(90)=52.55ms  p(95)=55.66ms  p(99.9)=72.85ms
     iterations.....................: 138700  1136.466456/s
     success_rate...................: 100.00% ✓ 138700      ✗ 0     
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

     checks.........................: 100.00% ✓ 180321     ✗ 0    
     data_received..................: 5.3 GB  43 MB/s
     data_sent......................: 72 MB   591 kB/s
     http_req_blocked...............: avg=4.84µs  min=1.1µs   med=2.85µs  max=4.09ms   p(90)=4.37µs   p(95)=5µs      p(99.9)=49.51µs 
     http_req_connecting............: avg=1.71µs  min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.46ms min=19.31ms med=96.97ms max=336.31ms p(90)=118.22ms p(95)=128.11ms p(99.9)=233.5ms 
       { expected_response:true }...: avg=99.46ms min=19.31ms med=96.97ms max=336.31ms p(90)=118.22ms p(95)=128.11ms p(99.9)=233.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 60207
     http_req_receiving.............: avg=88.9µs  min=30.95µs med=77.88µs max=71.2ms   p(90)=113.65µs p(95)=127.67µs p(99.9)=1.01ms  
     http_req_sending...............: avg=27.76µs min=5.76µs  med=13.68µs max=156.29ms p(90)=20.37µs  p(95)=22.83µs  p(99.9)=770.02µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.34ms min=19.16ms med=96.85ms max=335.55ms p(90)=118.09ms p(95)=127.95ms p(99.9)=233.34ms
     http_reqs......................: 60207   491.788021/s
     iteration_duration.............: avg=99.85ms min=33.89ms med=97.21ms max=392.59ms p(90)=118.45ms p(95)=128.45ms p(99.9)=236.79ms
     iterations.....................: 60107   490.971193/s
     success_rate...................: 100.00% ✓ 60107      ✗ 0    
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

     checks.........................: 100.00% ✓ 134253     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   440 kB/s
     http_req_blocked...............: avg=5.68µs   min=1.1µs   med=3.21µs   max=4.04ms   p(90)=4.69µs   p(95)=5.27µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=2.27µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=133.59ms min=21.1ms  med=131.45ms max=377.76ms p(90)=167.32ms p(95)=178.12ms p(99.9)=229.1ms 
       { expected_response:true }...: avg=133.59ms min=21.1ms  med=131.45ms max=377.76ms p(90)=167.32ms p(95)=178.12ms p(99.9)=229.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 44851
     http_req_receiving.............: avg=184.34µs min=30.28µs med=85.62µs  max=251.18ms p(90)=118.84µs p(95)=131.89µs p(99.9)=1.02ms  
     http_req_sending...............: avg=21.62µs  min=5.76µs  med=16.16µs  max=33ms     p(90)=21.93µs  p(95)=24.03µs  p(99.9)=550.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.39ms min=21.01ms med=131.3ms  max=266.02ms p(90)=167.08ms p(95)=177.85ms p(99.9)=224.95ms
     http_reqs......................: 44851   366.136186/s
     iteration_duration.............: avg=134.11ms min=48.51ms med=131.75ms max=395.76ms p(90)=167.61ms p(95)=178.43ms p(99.9)=235.51ms
     iterations.....................: 44751   365.319847/s
     success_rate...................: 100.00% ✓ 44751      ✗ 0    
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

     checks.........................: 100.00% ✓ 88932      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   292 kB/s
     http_req_blocked...............: avg=7.47µs   min=1.3µs   med=3.59µs   max=4.94ms   p(90)=5.12µs   p(95)=5.76µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.61µs   min=0s      med=0s       max=4.9ms    p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=201.66ms min=19.35ms med=189.41ms max=604.36ms p(90)=236.64ms p(95)=395.19ms p(99.9)=536.21ms
       { expected_response:true }...: avg=201.66ms min=19.35ms med=189.41ms max=604.36ms p(90)=236.64ms p(95)=395.19ms p(99.9)=536.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29744
     http_req_receiving.............: avg=114.38µs min=35.57µs med=98.73µs  max=197.41ms p(90)=131.65µs p(95)=145.1µs  p(99.9)=526.37µs
     http_req_sending...............: avg=31.31µs  min=6.27µs  med=18.41µs  max=104.58ms p(90)=23.73µs  p(95)=25.69µs  p(99.9)=573.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.52ms min=19.19ms med=189.27ms max=604.25ms p(90)=236.5ms  p(95)=395.08ms p(99.9)=536.11ms
     http_reqs......................: 29744   242.936281/s
     iteration_duration.............: avg=202.59ms min=40.6ms  med=189.81ms max=604.54ms p(90)=237.04ms p(95)=396.51ms p(99.9)=536.55ms
     iterations.....................: 29644   242.119523/s
     success_rate...................: 100.00% ✓ 29644      ✗ 0    
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

     checks.........................: 100.00% ✓ 85842      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=6.83µs   min=1.24µs  med=3.22µs   max=4.24ms   p(90)=4.59µs   p(95)=5.15µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=3.4µs    min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=208.89ms min=21.28ms med=211.17ms max=405.67ms p(90)=271.53ms p(95)=277.25ms p(99.9)=363.61ms
       { expected_response:true }...: avg=208.89ms min=21.28ms med=211.17ms max=405.67ms p(90)=271.53ms p(95)=277.25ms p(99.9)=363.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28714
     http_req_receiving.............: avg=129µs    min=35.02µs med=93.01µs  max=45.48ms  p(90)=126.11µs p(95)=139.76µs p(99.9)=12.41ms 
     http_req_sending...............: avg=24.66µs  min=6.28µs  med=17.06µs  max=49.36ms  p(90)=22.29µs  p(95)=24.24µs  p(99.9)=782.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.74ms min=21.1ms  med=211ms    max=386.32ms p(90)=271.4ms  p(95)=277.13ms p(99.9)=359.16ms
     http_reqs......................: 28714   233.694574/s
     iteration_duration.............: avg=209.83ms min=48.45ms med=212.74ms max=427.06ms p(90)=271.8ms  p(95)=277.54ms p(99.9)=370.97ms
     iterations.....................: 28614   232.880705/s
     success_rate...................: 100.00% ✓ 28614      ✗ 0    
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

