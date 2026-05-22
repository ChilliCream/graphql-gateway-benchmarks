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
| hive-router | v0.0.49 | 1,574 | 1,595 | 1,567 | 0.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,457 | 1,477 | 1,430 | 1.1% |  |
| cosmo | 0.307.0 | 1,165 | 1,180 | 1,157 | 0.7% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.3 | 1,126 | 1,147 | 1,120 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 498 | 511 | 494 | 1.2% |  |
| apollo-router | v2.13.1 | 365 | 376 | 360 | 1.4% |  |
| hive-gateway | 2.5.25 | 240 | 245 | 236 | 1.3% |  |
| apollo-gateway | 2.13.3 | 237 | 239 | 236 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 576060      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.41µs  min=972ns   med=2.39µs  max=4.42ms   p(90)=4.25µs   p(95)=5.2µs    p(99.9)=39.26µs
     http_req_connecting............: avg=536ns   min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.99ms min=14.5ms  med=30.72ms max=334.79ms p(90)=36.85ms  p(95)=38.8ms   p(99.9)=58.71ms
       { expected_response:true }...: avg=30.99ms min=14.5ms  med=30.72ms max=334.79ms p(90)=36.85ms  p(95)=38.8ms   p(99.9)=58.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192120
     http_req_receiving.............: avg=86.62µs min=27.51µs med=54.93µs max=149.67ms p(90)=106.69µs p(95)=156.38µs p(99.9)=2.53ms 
     http_req_sending...............: avg=35.66µs min=4.86µs  med=9.95µs  max=34.95ms  p(90)=20.76µs  p(95)=71.83µs  p(99.9)=2.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.87ms min=14.37ms med=30.62ms max=333.07ms p(90)=36.72ms  p(95)=38.65ms  p(99.9)=57.78ms
     http_reqs......................: 192120  1574.531216/s
     iteration_duration.............: avg=31.23ms min=14.77ms med=30.95ms max=348.06ms p(90)=37.07ms  p(95)=39.02ms  p(99.9)=59.06ms
     iterations.....................: 192020  1573.71166/s
     success_rate...................: 100.00% ✓ 192020      ✗ 0     
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

     checks.........................: 100.00% ✓ 533226      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.23µs   min=912ns   med=2.31µs  max=3.86ms   p(90)=4.11µs  p(95)=5µs      p(99.9)=37.93µs
     http_req_connecting............: avg=407ns    min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.5ms   min=13.97ms med=32.68ms max=337.81ms p(90)=41.07ms p(95)=43.99ms  p(99.9)=98.7ms 
       { expected_response:true }...: avg=33.5ms   min=13.97ms med=32.68ms max=337.81ms p(90)=41.07ms p(95)=43.99ms  p(99.9)=98.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 177842
     http_req_receiving.............: avg=881.52µs min=51.73µs med=120.5µs max=259.13ms p(90)=2.43ms  p(95)=3.65ms   p(99.9)=22.11ms
     http_req_sending...............: avg=39.2µs   min=5.27µs  med=9.55µs  max=279.39ms p(90)=20.52µs p(95)=103.14µs p(99.9)=2.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.58ms  min=13.72ms med=31.83ms max=110.6ms  p(90)=39.87ms p(95)=42.62ms  p(99.9)=95.92ms
     http_reqs......................: 177842  1457.653795/s
     iteration_duration.............: avg=33.74ms  min=14.27ms med=32.9ms  max=364.41ms p(90)=41.3ms  p(95)=44.22ms  p(99.9)=98.96ms
     iterations.....................: 177742  1456.834161/s
     success_rate...................: 100.00% ✓ 177742      ✗ 0     
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

     checks.........................: 100.00% ✓ 426492      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.61µs  min=1.08µs  med=2.53µs  max=4.02ms   p(90)=4.23µs   p(95)=5µs      p(99.9)=36.65µs
     http_req_connecting............: avg=704ns   min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.95ms min=17.19ms med=41.35ms max=333.95ms p(90)=51ms     p(95)=54.09ms  p(99.9)=72.19ms
       { expected_response:true }...: avg=41.95ms min=17.19ms med=41.35ms max=333.95ms p(90)=51ms     p(95)=54.09ms  p(99.9)=72.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142264
     http_req_receiving.............: avg=89.3µs  min=29.06µs med=64.85µs max=88.15ms  p(90)=112.44µs p(95)=140.02µs p(99.9)=1.9ms  
     http_req_sending...............: avg=30.92µs min=5.09µs  med=11.05µs max=178.05ms p(90)=19.3µs   p(95)=24.39µs  p(99.9)=1.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.83ms min=16.81ms med=41.23ms max=323.56ms p(90)=50.89ms  p(95)=53.96ms  p(99.9)=71.32ms
     http_reqs......................: 142264  1165.835979/s
     iteration_duration.............: avg=42.2ms  min=19.66ms med=41.56ms max=366.03ms p(90)=51.22ms  p(95)=54.29ms  p(99.9)=72.64ms
     iterations.....................: 142164  1165.016492/s
     success_rate...................: 100.00% ✓ 142164      ✗ 0     
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

     checks.........................: 100.00% ✓ 411960      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.61µs   min=952ns   med=2.22µs  max=4.54ms   p(90)=4.62µs   p(95)=5.77µs   p(99.9)=49.43µs
     http_req_connecting............: avg=762ns    min=0s      med=0s      max=4.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.42ms  min=17.44ms med=42.97ms max=369.02ms p(90)=52.79ms  p(95)=56.1ms   p(99.9)=81.26ms
       { expected_response:true }...: avg=43.42ms  min=17.44ms med=42.97ms max=369.02ms p(90)=52.79ms  p(95)=56.1ms   p(99.9)=81.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137420
     http_req_receiving.............: avg=132.98µs min=29.44µs med=59.3µs  max=259.84ms p(90)=129.91µs p(95)=199.82µs p(99.9)=3.65ms 
     http_req_sending...............: avg=36.16µs  min=5.14µs  med=9.87µs  max=134.82ms p(90)=24.01µs  p(95)=109.87µs p(99.9)=2.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.25ms  min=17.32ms med=42.84ms max=108.95ms p(90)=52.65ms  p(95)=55.96ms  p(99.9)=80.87ms
     http_reqs......................: 137420  1126.244998/s
     iteration_duration.............: avg=43.68ms  min=18.31ms med=43.21ms max=380.99ms p(90)=53.01ms  p(95)=56.33ms  p(99.9)=81.52ms
     iterations.....................: 137320  1125.425434/s
     success_rate...................: 100.00% ✓ 137320      ✗ 0     
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

     checks.........................: 100.00% ✓ 182724     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   598 kB/s
     http_req_blocked...............: avg=4.13µs   min=1.03µs  med=3.02µs  max=4.14ms   p(90)=4.56µs   p(95)=5.17µs   p(99.9)=48.19µs 
     http_req_connecting............: avg=788ns    min=0s      med=0s      max=2.57ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.15ms  min=19.31ms med=95.62ms max=377.05ms p(90)=118.64ms p(95)=129.3ms  p(99.9)=227.81ms
       { expected_response:true }...: avg=98.15ms  min=19.31ms med=95.62ms max=377.05ms p(90)=118.64ms p(95)=129.3ms  p(99.9)=227.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61008
     http_req_receiving.............: avg=156.68µs min=32.63µs med=78.74µs max=224.54ms p(90)=114.48µs p(95)=127.95µs p(99.9)=1.12ms  
     http_req_sending...............: avg=23.65µs  min=5.55µs  med=14.23µs max=73.2ms   p(90)=20.77µs  p(95)=23.07µs  p(99.9)=720.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.97ms  min=19.14ms med=95.51ms max=249.48ms p(90)=118.52ms p(95)=129.12ms p(99.9)=223.65ms
     http_reqs......................: 61008   498.194739/s
     iteration_duration.............: avg=98.52ms  min=27.12ms med=95.87ms max=384.84ms p(90)=118.9ms  p(95)=129.6ms  p(99.9)=229.83ms
     iterations.....................: 60908   497.378134/s
     success_rate...................: 100.00% ✓ 60908      ✗ 0    
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

     checks.........................: 100.00% ✓ 134025     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   439 kB/s
     http_req_blocked...............: avg=5.82µs   min=1.19µs  med=3.35µs   max=4.05ms   p(90)=4.86µs   p(95)=5.46µs   p(99.9)=438.78µs
     http_req_connecting............: avg=2.27µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=412.83µs
     http_req_duration..............: avg=133.81ms min=19.5ms  med=131.86ms max=363.21ms p(90)=167.42ms p(95)=178.5ms  p(99.9)=224.08ms
       { expected_response:true }...: avg=133.81ms min=19.5ms  med=131.86ms max=363.21ms p(90)=167.42ms p(95)=178.5ms  p(99.9)=224.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44775
     http_req_receiving.............: avg=90.84µs  min=33.96µs med=85.17µs  max=20.34ms  p(90)=118.75µs p(95)=131.5µs  p(99.9)=653.24µs
     http_req_sending...............: avg=28.83µs  min=5.71µs  med=16.38µs  max=172.08ms p(90)=22.28µs  p(95)=24.33µs  p(99.9)=565.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.69ms min=19.36ms med=131.74ms max=362.63ms p(90)=167.29ms p(95)=178.4ms  p(99.9)=223.52ms
     http_reqs......................: 44775   365.547988/s
     iteration_duration.............: avg=134.34ms min=43ms    med=132.18ms max=381ms    p(90)=167.73ms p(95)=178.84ms p(99.9)=227.07ms
     iterations.....................: 44675   364.731577/s
     success_rate...................: 100.00% ✓ 44675      ✗ 0    
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

     checks.........................: 100.00% ✓ 87783      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=5.31µs   min=1.22µs  med=3.56µs   max=2.39ms   p(90)=5.07µs   p(95)=5.68µs   p(99.9)=606.05µs
     http_req_connecting............: avg=1.54µs   min=0s      med=0s       max=2.33ms   p(90)=0s       p(95)=0s       p(99.9)=579.62µs
     http_req_duration..............: avg=204.26ms min=16.6ms  med=191.2ms  max=585.44ms p(90)=243.43ms p(95)=403.68ms p(99.9)=522.79ms
       { expected_response:true }...: avg=204.26ms min=16.6ms  med=191.2ms  max=585.44ms p(90)=243.43ms p(95)=403.68ms p(99.9)=522.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29361
     http_req_receiving.............: avg=102.55µs min=33.75µs med=97.03µs  max=26.97ms  p(90)=130.32µs p(95)=144.01µs p(99.9)=671.94µs
     http_req_sending...............: avg=31.4µs   min=6.2µs   med=18.05µs  max=110ms    p(90)=23.32µs  p(95)=25.24µs  p(99.9)=593.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.12ms min=16.45ms med=191.06ms max=584.81ms p(90)=243.35ms p(95)=403.42ms p(99.9)=522.67ms
     http_reqs......................: 29361   240.034106/s
     iteration_duration.............: avg=205.18ms min=57.94ms med=191.62ms max=591.22ms p(90)=244.01ms p(95)=404.4ms  p(99.9)=523.04ms
     iterations.....................: 29261   239.216579/s
     success_rate...................: 100.00% ✓ 29261      ✗ 0    
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

     checks.........................: 100.00% ✓ 87390      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.55µs   min=1.3µs   med=3.51µs   max=4.24ms   p(90)=4.97µs   p(95)=5.6µs    p(99.9)=1.96ms  
     http_req_connecting............: avg=3.79µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=205.17ms min=21.97ms med=204.49ms max=443.09ms p(90)=219.61ms p(95)=225.39ms p(99.9)=299.25ms
       { expected_response:true }...: avg=205.17ms min=21.97ms med=204.49ms max=443.09ms p(90)=219.61ms p(95)=225.39ms p(99.9)=299.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29230
     http_req_receiving.............: avg=105.31µs min=32.73µs med=92.5µs   max=129.99ms p(90)=126.57µs p(95)=140.32µs p(99.9)=606.04µs
     http_req_sending...............: avg=26.22µs  min=5.74µs  med=17.41µs  max=67.87ms  p(90)=22.79µs  p(95)=24.88µs  p(99.9)=470.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.04ms min=21.76ms med=204.36ms max=442.82ms p(90)=219.5ms  p(95)=225.26ms p(99.9)=298.99ms
     http_reqs......................: 29230   237.814671/s
     iteration_duration.............: avg=206.14ms min=54.54ms med=204.81ms max=472.26ms p(90)=219.91ms p(95)=225.7ms  p(99.9)=320.83ms
     iterations.....................: 29130   237.001073/s
     success_rate...................: 100.00% ✓ 29130      ✗ 0    
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

