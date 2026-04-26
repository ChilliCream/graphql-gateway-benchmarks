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
| hive-router | v0.0.49 | 1,579 | 1,603 | 1,568 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,463 | 1,481 | 1,451 | 0.6% |  |
| cosmo | 0.307.0 | 1,140 | 1,156 | 1,130 | 0.8% | non-compatible response (5 across 2/9 runs) |
| grafbase | 0.53.3 | 1,134 | 1,150 | 1,127 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 497 | 510 | 493 | 1.1% |  |
| apollo-router | v2.13.1 | 395 | 404 | 392 | 1.0% |  |
| hive-gateway | 2.5.25 | 244 | 247 | 241 | 0.8% |  |
| apollo-gateway | 2.13.3 | 233 | 234 | 227 | 0.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577944      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.47µs  min=1.01µs  med=2.48µs  max=4.04ms   p(90)=4.28µs   p(95)=5.24µs   p(99.9)=39.48µs
     http_req_connecting............: avg=527ns   min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.89ms min=13.91ms med=30.61ms max=333.95ms p(90)=36.75ms  p(95)=38.73ms  p(99.9)=59.1ms 
       { expected_response:true }...: avg=30.89ms min=13.91ms med=30.61ms max=333.95ms p(90)=36.75ms  p(95)=38.73ms  p(99.9)=59.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 192748
     http_req_receiving.............: avg=87.75µs min=27.32µs med=54.46µs max=230.22ms p(90)=107.15µs p(95)=158.43µs p(99.9)=2.7ms  
     http_req_sending...............: avg=37.39µs min=5.18µs  med=9.99µs  max=119.89ms p(90)=20.47µs  p(95)=81.1µs   p(99.9)=1.96ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.76ms min=13.83ms med=30.5ms  max=333.44ms p(90)=36.63ms  p(95)=38.58ms  p(99.9)=57.88ms
     http_reqs......................: 192748  1579.987986/s
     iteration_duration.............: avg=31.13ms min=14.15ms med=30.83ms max=362.95ms p(90)=36.97ms  p(95)=38.95ms  p(99.9)=59.46ms
     iterations.....................: 192648  1579.16827/s
     success_rate...................: 100.00% ✓ 192648      ✗ 0     
     vus............................: 18      min=0         max=50  
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

     checks.........................: 100.00% ✓ 535218      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 215 MB  1.8 MB/s
     http_req_blocked...............: avg=3.41µs   min=1.01µs  med=2.33µs   max=4.46ms   p(90)=4.03µs  p(95)=4.88µs   p(99.9)=33.42µs
     http_req_connecting............: avg=586ns    min=0s      med=0s       max=4.41ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.37ms  min=14.76ms med=32.14ms  max=481.45ms p(90)=40.89ms p(95)=44.37ms  p(99.9)=86.59ms
       { expected_response:true }...: avg=33.37ms  min=14.76ms med=32.14ms  max=481.45ms p(90)=40.89ms p(95)=44.37ms  p(99.9)=86.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178506
     http_req_receiving.............: avg=731.13µs min=50.7µs  med=110.35µs max=254.37ms p(90)=2.12ms  p(95)=3.23ms   p(99.9)=17.21ms
     http_req_sending...............: avg=36.77µs  min=5.12µs  med=9.53µs   max=157.89ms p(90)=20.5µs  p(95)=107.93µs p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.6ms   min=14.65ms med=31.4ms   max=481.3ms  p(90)=39.89ms p(95)=43.27ms  p(99.9)=86.03ms
     http_reqs......................: 178506  1463.296197/s
     iteration_duration.............: avg=33.62ms  min=14.97ms med=32.37ms  max=481.69ms p(90)=41.12ms p(95)=44.6ms   p(99.9)=89.62ms
     iterations.....................: 178406  1462.476451/s
     success_rate...................: 100.00% ✓ 178406      ✗ 0     
     vus............................: 12      min=0         max=50  
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

     checks.........................: 100.00% ✓ 417306      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.69µs   min=1.13µs  med=2.57µs  max=4.19ms   p(90)=4.2µs    p(95)=4.96µs   p(99.9)=37.12µs
     http_req_connecting............: avg=725ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.89ms  min=17.87ms med=42.32ms max=349.26ms p(90)=52.11ms  p(95)=55.25ms  p(99.9)=72.06ms
       { expected_response:true }...: avg=42.89ms  min=17.87ms med=42.32ms max=349.26ms p(90)=52.11ms  p(95)=55.25ms  p(99.9)=72.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139202
     http_req_receiving.............: avg=127.58µs min=27.84µs med=64.81µs max=259.16ms p(90)=109.79µs p(95)=137.05µs p(99.9)=2.2ms  
     http_req_sending...............: avg=27.41µs  min=5.52µs  med=11.1µs  max=84.63ms  p(90)=18.76µs  p(95)=23.72µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.74ms  min=17.77ms med=42.2ms  max=146.16ms p(90)=51.98ms  p(95)=55.11ms  p(99.9)=71.48ms
     http_reqs......................: 139202  1140.679619/s
     iteration_duration.............: avg=43.13ms  min=20.4ms  med=42.52ms max=358.17ms p(90)=52.32ms  p(95)=55.46ms  p(99.9)=72.39ms
     iterations.....................: 139102  1139.860177/s
     success_rate...................: 100.00% ✓ 139102      ✗ 0     
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

     checks.........................: 100.00% ✓ 415173      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.62µs  min=992ns   med=2.31µs  max=4.13ms   p(90)=4.73µs   p(95)=5.86µs   p(99.9)=43.5µs 
     http_req_connecting............: avg=656ns   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.07ms min=16.43ms med=42.63ms max=325.41ms p(90)=52.31ms  p(95)=55.58ms  p(99.9)=80.36ms
       { expected_response:true }...: avg=43.07ms min=16.43ms med=42.63ms max=325.41ms p(90)=52.31ms  p(95)=55.58ms  p(99.9)=80.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138491
     http_req_receiving.............: avg=99.06µs min=29.25µs med=59.47µs max=144.58ms p(90)=131.39µs p(95)=205.47µs p(99.9)=3.4ms  
     http_req_sending...............: avg=38.07µs min=5.15µs  med=9.97µs  max=153.64ms p(90)=23.84µs  p(95)=111.06µs p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.93ms min=16.34ms med=42.51ms max=325.19ms p(90)=52.17ms  p(95)=55.43ms  p(99.9)=79.93ms
     http_reqs......................: 138491  1134.996472/s
     iteration_duration.............: avg=43.34ms min=16.68ms med=42.87ms max=356.22ms p(90)=52.55ms  p(95)=55.81ms  p(99.9)=81.33ms
     iterations.....................: 138391  1134.176927/s
     success_rate...................: 100.00% ✓ 138391      ✗ 0     
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

     checks.........................: 100.00% ✓ 182574     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   598 kB/s
     http_req_blocked...............: avg=5.15µs   min=1.08µs  med=3.09µs  max=4.27ms   p(90)=4.58µs   p(95)=5.21µs   p(99.9)=54.55µs 
     http_req_connecting............: avg=1.78µs   min=0s      med=0s      max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.22ms  min=18.35ms med=95.32ms max=353.76ms p(90)=119.94ms p(95)=131.22ms p(99.9)=231.25ms
       { expected_response:true }...: avg=98.22ms  min=18.35ms med=95.32ms max=353.76ms p(90)=119.94ms p(95)=131.22ms p(99.9)=231.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60958
     http_req_receiving.............: avg=111.34µs min=30.62µs med=78.63µs max=175.83ms p(90)=113.02µs p(95)=125.72µs p(99.9)=922.71µs
     http_req_sending...............: avg=23.14µs  min=5.68µs  med=14.37µs max=126.01ms p(90)=20.86µs  p(95)=23.16µs  p(99.9)=618.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.08ms  min=18.21ms med=95.2ms  max=353.47ms p(90)=119.8ms  p(95)=131.03ms p(99.9)=230.07ms
     http_reqs......................: 60958   497.884679/s
     iteration_duration.............: avg=98.6ms   min=33.84ms med=95.57ms max=367.8ms  p(90)=120.19ms p(95)=131.59ms p(99.9)=235.27ms
     iterations.....................: 60858   497.067913/s
     success_rate...................: 100.00% ✓ 60858      ✗ 0    
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

     checks.........................: 100.00% ✓ 145188     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=4.74µs   min=1.2µs   med=3.35µs   max=3.07ms   p(90)=4.89µs   p(95)=5.54µs   p(99.9)=159.89µs
     http_req_connecting............: avg=1.12µs   min=0s      med=0s       max=3ms      p(90)=0s       p(95)=0s       p(99.9)=72.44µs 
     http_req_duration..............: avg=123.51ms min=20.2ms  med=121.48ms max=339.17ms p(90)=154.2ms  p(95)=164.34ms p(99.9)=209.84ms
       { expected_response:true }...: avg=123.51ms min=20.2ms  med=121.48ms max=339.17ms p(90)=154.2ms  p(95)=164.34ms p(99.9)=209.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48496
     http_req_receiving.............: avg=175.01µs min=31.32µs med=85.21µs  max=182.09ms p(90)=119µs    p(95)=132.31µs p(99.9)=1.66ms  
     http_req_sending...............: avg=24.83µs  min=5.95µs  med=16.48µs  max=47.4ms   p(90)=22.48µs  p(95)=24.7µs   p(99.9)=667.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.31ms min=20.04ms med=121.37ms max=228.42ms p(90)=154.05ms p(95)=164.04ms p(99.9)=203.79ms
     http_reqs......................: 48496   395.973707/s
     iteration_duration.............: avg=124ms    min=29.56ms med=121.79ms max=388.79ms p(90)=154.49ms p(95)=164.65ms p(99.9)=213.76ms
     iterations.....................: 48396   395.157199/s
     success_rate...................: 100.00% ✓ 48396      ✗ 0    
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

     checks.........................: 100.00% ✓ 89262      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=7.29µs   min=1.27µs  med=3.52µs   max=4.13ms   p(90)=5.04µs   p(95)=5.7µs    p(99.9)=1.73ms  
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=200.87ms min=18.18ms med=187.88ms max=610.98ms p(90)=241.67ms p(95)=385.51ms p(99.9)=557.99ms
       { expected_response:true }...: avg=200.87ms min=18.18ms med=187.88ms max=610.98ms p(90)=241.67ms p(95)=385.51ms p(99.9)=557.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29854
     http_req_receiving.............: avg=103.8µs  min=36.5µs  med=97.39µs  max=59.72ms  p(90)=131.06µs p(95)=145.27µs p(99.9)=617.23µs
     http_req_sending...............: avg=44.22µs  min=6.36µs  med=18.26µs  max=202.63ms p(90)=23.53µs  p(95)=25.5µs   p(99.9)=706.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.72ms min=18.03ms med=187.73ms max=610.88ms p(90)=241.55ms p(95)=385.39ms p(99.9)=557.87ms
     http_reqs......................: 29854   244.010974/s
     iteration_duration.............: avg=201.78ms min=54.5ms  med=188.33ms max=611.22ms p(90)=242.17ms p(95)=387.17ms p(99.9)=558.27ms
     iterations.....................: 29754   243.193627/s
     success_rate...................: 100.00% ✓ 29754      ✗ 0    
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

     checks.........................: 100.00% ✓ 85641      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=7.32µs   min=1.25µs  med=3.36µs   max=4.32ms   p(90)=4.77µs   p(95)=5.36µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=3.71µs   min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=209.35ms min=21.03ms med=224.83ms max=414.71ms p(90)=245.44ms p(95)=255.01ms p(99.9)=320.25ms
       { expected_response:true }...: avg=209.35ms min=21.03ms med=224.83ms max=414.71ms p(90)=245.44ms p(95)=255.01ms p(99.9)=320.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28647
     http_req_receiving.............: avg=104.7µs  min=32.3µs  med=92.26µs  max=128.83ms p(90)=126.62µs p(95)=139.85µs p(99.9)=701.23µs
     http_req_sending...............: avg=28.53µs  min=5.68µs  med=17.13µs  max=106.39ms p(90)=22.62µs  p(95)=24.56µs  p(99.9)=576.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.22ms min=20.9ms  med=224.71ms max=414.05ms p(90)=245.33ms p(95)=254.87ms p(99.9)=319.34ms
     http_reqs......................: 28647   233.180881/s
     iteration_duration.............: avg=210.3ms  min=50.87ms med=225.23ms max=428.85ms p(90)=245.77ms p(95)=255.45ms p(99.9)=322.4ms 
     iterations.....................: 28547   232.366901/s
     success_rate...................: 100.00% ✓ 28547      ✗ 0    
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

