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
| hive-router | v0.0.49 | 1,586 | 1,613 | 1,582 | 0.8% |  |
| hotchocolate | 16.1.3-p.1 | 1,461 | 1,474 | 1,446 | 0.7% |  |
| cosmo | 0.307.0 | 1,163 | 1,177 | 1,154 | 0.7% |  |
| grafbase | 0.53.3 | 1,131 | 1,152 | 1,122 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 522 | 535 | 519 | 1.1% |  |
| apollo-router | v2.13.1 | 370 | 378 | 359 | 1.8% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 234 | 0.5% |  |
| hive-gateway | 2.5.25 | 228 | 234 | 226 | 1.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 580416      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.47µs  min=981ns   med=2.32µs  max=4.53ms   p(90)=4.23µs   p(95)=5.15µs   p(99.9)=37.76µs
     http_req_connecting............: avg=631ns   min=0s      med=0s      max=4.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.76ms min=14.22ms med=30.49ms max=343.37ms p(90)=36.52ms  p(95)=38.46ms  p(99.9)=57.35ms
       { expected_response:true }...: avg=30.76ms min=14.22ms med=30.49ms max=343.37ms p(90)=36.52ms  p(95)=38.46ms  p(99.9)=57.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193572
     http_req_receiving.............: avg=86.2µs  min=26.95µs med=53.12µs max=164.36ms p(90)=106.36µs p(95)=159.27µs p(99.9)=2.73ms 
     http_req_sending...............: avg=37.12µs min=5.13µs  med=9.7µs   max=214.41ms p(90)=20.3µs   p(95)=80.6µs   p(99.9)=2.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.63ms min=14.1ms  med=30.38ms max=342.89ms p(90)=36.4ms   p(95)=38.31ms  p(99.9)=56.4ms 
     http_reqs......................: 193572  1586.309217/s
     iteration_duration.............: avg=31ms    min=14.47ms med=30.72ms max=359.94ms p(90)=36.74ms  p(95)=38.68ms  p(99.9)=57.82ms
     iterations.....................: 193472  1585.489724/s
     success_rate...................: 100.00% ✓ 193472      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 535020      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.17µs   min=942ns   med=2.03µs  max=5.4ms    p(90)=3.84µs  p(95)=4.74µs   p(99.9)=29.61µs
     http_req_connecting............: avg=591ns    min=0s      med=0s      max=4.51ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.39ms  min=14.8ms  med=32.59ms max=336.97ms p(90)=40.83ms p(95)=43.65ms  p(99.9)=95.55ms
       { expected_response:true }...: avg=33.39ms  min=14.8ms  med=32.59ms max=336.97ms p(90)=40.83ms p(95)=43.65ms  p(99.9)=95.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178440
     http_req_receiving.............: avg=795.15µs min=51.22µs med=115.1µs max=168.35ms p(90)=2.31ms  p(95)=3.44ms   p(99.9)=14.97ms
     http_req_sending...............: avg=36.36µs  min=4.94µs  med=9.02µs  max=114.41ms p(90)=20.34µs p(95)=107.66µs p(99.9)=2.43ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.56ms  min=14.68ms med=31.79ms max=329.06ms p(90)=39.74ms p(95)=42.46ms  p(99.9)=94.23ms
     http_reqs......................: 178440  1461.65742/s
     iteration_duration.............: avg=33.64ms  min=15.08ms med=32.82ms max=355.17ms p(90)=41.05ms p(95)=43.87ms  p(99.9)=96.05ms
     iterations.....................: 178340  1460.838289/s
     success_rate...................: 100.00% ✓ 178340      ✗ 0     
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

     checks.........................: 100.00% ✓ 425646      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.35µs  min=992ns   med=2.15µs  max=4.2ms    p(90)=3.75µs  p(95)=4.51µs   p(99.9)=36.11µs
     http_req_connecting............: avg=761ns   min=0s      med=0s      max=4.16ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.04ms min=15.57ms med=41.4ms  max=338.93ms p(90)=51.19ms p(95)=54.25ms  p(99.9)=70.59ms
       { expected_response:true }...: avg=42.04ms min=15.57ms med=41.4ms  max=338.93ms p(90)=51.19ms p(95)=54.25ms  p(99.9)=70.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141982
     http_req_receiving.............: avg=82.34µs min=27.01µs med=61.02µs max=84.52ms  p(90)=105.6µs p(95)=131.54µs p(99.9)=1.83ms 
     http_req_sending...............: avg=28.44µs min=5.16µs  med=10.09µs max=220.66ms p(90)=18.05µs p(95)=22.94µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.93ms min=15.43ms med=41.3ms  max=338.26ms p(90)=51.08ms p(95)=54.14ms  p(99.9)=69.88ms
     http_reqs......................: 141982  1163.542116/s
     iteration_duration.............: avg=42.28ms min=20.1ms  med=41.6ms  max=357.17ms p(90)=51.39ms p(95)=54.45ms  p(99.9)=71.2ms 
     iterations.....................: 141882  1162.722616/s
     success_rate...................: 100.00% ✓ 141882      ✗ 0     
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

     checks.........................: 100.00% ✓ 414117      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.97µs  min=992ns   med=2.2µs   max=40.43ms  p(90)=4.58µs   p(95)=5.76µs   p(99.9)=44.96µs
     http_req_connecting............: avg=875ns   min=0s      med=0s      max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.18ms min=16.6ms  med=42.7ms  max=347.86ms p(90)=52.4ms   p(95)=55.64ms  p(99.9)=82.09ms
       { expected_response:true }...: avg=43.18ms min=16.6ms  med=42.7ms  max=347.86ms p(90)=52.4ms   p(95)=55.64ms  p(99.9)=82.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138139
     http_req_receiving.............: avg=94.42µs min=28.95µs med=59.33µs max=81.76ms  p(90)=129.64µs p(95)=202.97µs p(99.9)=2.68ms 
     http_req_sending...............: avg=37.33µs min=4.99µs  med=9.79µs  max=117.75ms p(90)=23.29µs  p(95)=107.71µs p(99.9)=2.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.05ms min=16.48ms med=42.58ms max=347.23ms p(90)=52.26ms  p(95)=55.51ms  p(99.9)=81.56ms
     http_reqs......................: 138139  1131.970332/s
     iteration_duration.............: avg=43.46ms min=16.86ms med=42.95ms max=358.58ms p(90)=52.63ms  p(95)=55.88ms  p(99.9)=82.87ms
     iterations.....................: 138039  1131.150889/s
     success_rate...................: 100.00% ✓ 138039      ✗ 0     
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

     checks.........................: 100.00% ✓ 191685     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   628 kB/s
     http_req_blocked...............: avg=5.95µs  min=1.19µs  med=3.28µs  max=100.16ms p(90)=4.89µs   p(95)=5.55µs   p(99.9)=48.84µs 
     http_req_connecting............: avg=2.43µs  min=0s      med=0s      max=100.1ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.54ms min=22.76ms med=90.86ms max=338.34ms p(90)=112.92ms p(95)=122.62ms p(99.9)=226.08ms
       { expected_response:true }...: avg=93.54ms min=22.76ms med=90.86ms max=338.34ms p(90)=112.92ms p(95)=122.62ms p(99.9)=226.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63995
     http_req_receiving.............: avg=93.72µs min=31.52µs med=80.46µs max=115.26ms p(90)=117.75µs p(95)=132.01µs p(99.9)=993.51µs
     http_req_sending...............: avg=24.33µs min=5.37µs  med=14.78µs max=63.34ms  p(90)=21.77µs  p(95)=24.21µs  p(99.9)=732.01µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.42ms min=22.58ms med=90.76ms max=330.69ms p(90)=112.81ms p(95)=122.43ms p(99.9)=225.49ms
     http_reqs......................: 63995   522.522195/s
     iteration_duration.............: avg=93.91ms min=31.74ms med=91.13ms max=376.31ms p(90)=113.21ms p(95)=122.96ms p(99.9)=228.24ms
     iterations.....................: 63895   521.70569/s
     success_rate...................: 100.00% ✓ 63895      ✗ 0    
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

     checks.........................: 100.00% ✓ 135735     ✗ 0    
     data_received..................: 4.0 GB  32 MB/s
     data_sent......................: 54 MB   444 kB/s
     http_req_blocked...............: avg=6.83µs   min=1.12µs  med=3.38µs   max=6.06ms   p(90)=4.93µs   p(95)=5.57µs   p(99.9)=572.21µs
     http_req_connecting............: avg=3.21µs   min=0s      med=0s       max=6.03ms   p(90)=0s       p(95)=0s       p(99.9)=440.9µs 
     http_req_duration..............: avg=132.11ms min=19.1ms  med=130.18ms max=380.47ms p(90)=165.46ms p(95)=176.9ms  p(99.9)=229.5ms 
       { expected_response:true }...: avg=132.11ms min=19.1ms  med=130.18ms max=380.47ms p(90)=165.46ms p(95)=176.9ms  p(99.9)=229.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 45345
     http_req_receiving.............: avg=91.24µs  min=31.21µs med=85.99µs  max=15.43ms  p(90)=119.93µs p(95)=132.84µs p(99.9)=779.42µs
     http_req_sending...............: avg=24.93µs  min=5.77µs  med=16.09µs  max=63.36ms  p(90)=22.4µs   p(95)=24.5µs   p(99.9)=682.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132ms    min=18.98ms med=130.06ms max=379.53ms p(90)=165.35ms p(95)=176.8ms  p(99.9)=229.39ms
     http_reqs......................: 45345   370.142888/s
     iteration_duration.............: avg=132.64ms min=40.6ms  med=130.47ms max=390.51ms p(90)=165.75ms p(95)=177.24ms p(99.9)=234.61ms
     iterations.....................: 45245   369.326607/s
     success_rate...................: 100.00% ✓ 45245      ✗ 0    
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

     checks.........................: 100.00% ✓ 86601      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=4.99µs   min=1.28µs  med=3.48µs   max=1.98ms   p(90)=4.89µs   p(95)=5.48µs   p(99.9)=549.43µs
     http_req_connecting............: avg=1.32µs   min=0s      med=0s       max=1.95ms   p(90)=0s       p(95)=0s       p(99.9)=510.3µs 
     http_req_duration..............: avg=207.05ms min=21.62ms med=210.55ms max=380.16ms p(90)=224.16ms p(95)=230.05ms p(99.9)=301.45ms
       { expected_response:true }...: avg=207.05ms min=21.62ms med=210.55ms max=380.16ms p(90)=224.16ms p(95)=230.05ms p(99.9)=301.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28967
     http_req_receiving.............: avg=154.7µs  min=32.7µs  med=93.68µs  max=167.41ms p(90)=126.89µs p(95)=140.7µs  p(99.9)=1.33ms  
     http_req_sending...............: avg=21.03µs  min=6.21µs  med=17.6µs   max=8.96ms   p(90)=22.96µs  p(95)=25.04µs  p(99.9)=484.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.88ms min=21.46ms med=210.44ms max=311.61ms p(90)=224.02ms p(95)=229.83ms p(99.9)=299.55ms
     http_reqs......................: 28967   235.764977/s
     iteration_duration.............: avg=207.98ms min=80.97ms med=210.86ms max=392.7ms  p(90)=224.46ms p(95)=230.41ms p(99.9)=303.23ms
     iterations.....................: 28867   234.951068/s
     success_rate...................: 100.00% ✓ 28867      ✗ 0    
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

     checks.........................: 100.00% ✓ 83427      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 34 MB   274 kB/s
     http_req_blocked...............: avg=5.32µs   min=1.26µs  med=3.47µs   max=2.19ms   p(90)=4.91µs   p(95)=5.51µs   p(99.9)=722.12µs
     http_req_connecting............: avg=1.59µs   min=0s      med=0s       max=2.16ms   p(90)=0s       p(95)=0s       p(99.9)=655.92µs
     http_req_duration..............: avg=214.91ms min=19.05ms med=197.78ms max=684.42ms p(90)=258.88ms p(95)=456.79ms p(99.9)=606.84ms
       { expected_response:true }...: avg=214.91ms min=19.05ms med=197.78ms max=684.42ms p(90)=258.88ms p(95)=456.79ms p(99.9)=606.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27909
     http_req_receiving.............: avg=106.23µs min=36.28µs med=97.03µs  max=77.12ms  p(90)=129.61µs p(95)=143.62µs p(99.9)=702.92µs
     http_req_sending...............: avg=31.84µs  min=6.34µs  med=17.77µs  max=73.74ms  p(90)=22.92µs  p(95)=24.7µs   p(99.9)=581.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.77ms min=18.94ms med=197.64ms max=684.3ms  p(90)=258.74ms p(95)=456.61ms p(99.9)=606.72ms
     http_reqs......................: 27909   228.059001/s
     iteration_duration.............: avg=215.9ms  min=61.42ms med=198.21ms max=684.68ms p(90)=259.28ms p(95)=457.39ms p(99.9)=607.25ms
     iterations.....................: 27809   227.241849/s
     success_rate...................: 100.00% ✓ 27809      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

