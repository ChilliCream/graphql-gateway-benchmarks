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
| hive-router | v0.0.49 | 1,579 | 1,603 | 1,568 | 0.6% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,464 | 1,480 | 1,456 | 0.5% |  |
| cosmo | 0.307.0 | 1,164 | 1,180 | 1,159 | 0.6% |  |
| grafbase | 0.53.3 | 1,150 | 1,161 | 1,138 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 502 | 511 | 494 | 1.0% |  |
| apollo-router | v2.13.1 | 368 | 375 | 362 | 1.2% |  |
| apollo-gateway | 2.13.3 | 239 | 240 | 237 | 0.5% |  |
| hive-gateway | 2.5.25 | 238 | 242 | 236 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577734      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.11µs  min=982ns   med=2.1µs   max=4.3ms    p(90)=3.9µs   p(95)=4.83µs   p(99.9)=30.51µs
     http_req_connecting............: avg=540ns   min=0s      med=0s      max=4.25ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.91ms min=14.61ms med=30.65ms max=348.51ms p(90)=36.71ms p(95)=38.63ms  p(99.9)=56.66ms
       { expected_response:true }...: avg=30.91ms min=14.61ms med=30.65ms max=348.51ms p(90)=36.71ms p(95)=38.63ms  p(99.9)=56.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192678
     http_req_receiving.............: avg=82.03µs min=27.51µs med=51.5µs  max=125.89ms p(90)=101.9µs p(95)=146.46µs p(99.9)=2.64ms 
     http_req_sending...............: avg=32.43µs min=5.09µs  med=9.11µs  max=159.99ms p(90)=19.41µs p(95)=34.17µs  p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.8ms  min=14.39ms med=30.55ms max=347.95ms p(90)=36.6ms  p(95)=38.5ms   p(99.9)=55.55ms
     http_reqs......................: 192678  1579.1528/s
     iteration_duration.............: avg=31.14ms min=14.87ms med=30.87ms max=357.46ms p(90)=36.92ms p(95)=38.84ms  p(99.9)=57.1ms 
     iterations.....................: 192578  1578.333218/s
     success_rate...................: 100.00% ✓ 192578      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 535740      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 215 MB  1.8 MB/s
     http_req_blocked...............: avg=3.48µs   min=982ns   med=2.05µs   max=67.99ms  p(90)=3.83µs  p(95)=4.75µs   p(99.9)=26.94µs
     http_req_connecting............: avg=568ns    min=0s      med=0s       max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.34ms  min=14.04ms med=32.32ms  max=528.19ms p(90)=40.79ms p(95)=43.96ms  p(99.9)=81.79ms
       { expected_response:true }...: avg=33.34ms  min=14.04ms med=32.32ms  max=528.19ms p(90)=40.79ms p(95)=43.96ms  p(99.9)=81.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178680
     http_req_receiving.............: avg=807.96µs min=50.08µs med=115.01µs max=239.38ms p(90)=2.36ms  p(95)=3.52ms   p(99.9)=14.49ms
     http_req_sending...............: avg=35.55µs  min=4.75µs  med=8.87µs   max=115.98ms p(90)=19.9µs  p(95)=108.08µs p(99.9)=2.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.5ms   min=13.89ms med=31.52ms  max=528.08ms p(90)=39.67ms p(95)=42.74ms  p(99.9)=80.23ms
     http_reqs......................: 178680  1464.570457/s
     iteration_duration.............: avg=33.58ms  min=14.34ms med=32.54ms  max=528.39ms p(90)=41.01ms p(95)=44.2ms   p(99.9)=82.42ms
     iterations.....................: 178580  1463.750796/s
     success_rate...................: 100.00% ✓ 178580      ✗ 0     
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

     checks.........................: 100.00% ✓ 426069      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.36µs  min=1.02µs  med=2.19µs  max=4.36ms   p(90)=3.87µs   p(95)=4.64µs   p(99.9)=38.02µs
     http_req_connecting............: avg=753ns   min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42ms    min=15.97ms med=41.38ms max=322.78ms p(90)=51.1ms   p(95)=54.19ms  p(99.9)=76.03ms
       { expected_response:true }...: avg=42ms    min=15.97ms med=41.38ms max=322.78ms p(90)=51.1ms   p(95)=54.19ms  p(99.9)=76.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142123
     http_req_receiving.............: avg=85.33µs min=28.18µs med=61.77µs max=94.25ms  p(90)=107.69µs p(95)=134.42µs p(99.9)=2ms    
     http_req_sending...............: avg=28.81µs min=5.2µs   med=10.27µs max=193.87ms p(90)=18.35µs  p(95)=23.22µs  p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.89ms min=15.77ms med=41.27ms max=308.31ms p(90)=50.99ms  p(95)=54.07ms  p(99.9)=74.73ms
     http_reqs......................: 142123  1164.663948/s
     iteration_duration.............: avg=42.24ms min=20.59ms med=41.58ms max=360.81ms p(90)=51.3ms   p(95)=54.39ms  p(99.9)=77.08ms
     iterations.....................: 142023  1163.844472/s
     success_rate...................: 100.00% ✓ 142023      ✗ 0     
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

     checks.........................: 100.00% ✓ 420738      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs  min=990ns   med=2.27µs  max=4.26ms   p(90)=4.79µs  p(95)=5.99µs   p(99.9)=42.16µs
     http_req_connecting............: avg=715ns   min=0s      med=0s      max=4.23ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.5ms  min=17.5ms  med=41.97ms max=357.73ms p(90)=51.6ms  p(95)=54.79ms  p(99.9)=77.85ms
       { expected_response:true }...: avg=42.5ms  min=17.5ms  med=41.97ms max=357.73ms p(90)=51.6ms  p(95)=54.79ms  p(99.9)=77.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140346
     http_req_receiving.............: avg=98.64µs min=29.48µs med=60.42µs max=97.5ms   p(90)=134.2µs p(95)=216.28µs p(99.9)=3.2ms  
     http_req_sending...............: avg=37.86µs min=5.22µs  med=9.9µs   max=93.03ms  p(90)=24.61µs p(95)=114.27µs p(99.9)=2.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.36ms min=17.33ms med=41.85ms max=357.28ms p(90)=51.46ms p(95)=54.62ms  p(99.9)=77.38ms
     http_reqs......................: 140346  1150.297034/s
     iteration_duration.............: avg=42.77ms min=18.08ms med=42.21ms max=372.94ms p(90)=51.84ms p(95)=55.03ms  p(99.9)=78.42ms
     iterations.....................: 140246  1149.477419/s
     success_rate...................: 100.00% ✓ 140246      ✗ 0     
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

     checks.........................: 100.00% ✓ 184125     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   603 kB/s
     http_req_blocked...............: avg=4.52µs  min=1.04µs  med=2.72µs  max=18.38ms  p(90)=4.32µs   p(95)=4.93µs   p(99.9)=58.51µs 
     http_req_connecting............: avg=1.5µs   min=0s      med=0s      max=18.33ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.4ms  min=21.62ms med=94ms    max=376.59ms p(90)=120.95ms p(95)=132.39ms p(99.9)=235.43ms
       { expected_response:true }...: avg=97.4ms  min=21.62ms med=94ms    max=376.59ms p(90)=120.95ms p(95)=132.39ms p(99.9)=235.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61475
     http_req_receiving.............: avg=86.19µs min=32.26µs med=74.77µs max=77.88ms  p(90)=111.81µs p(95)=125.18µs p(99.9)=941.66µs
     http_req_sending...............: avg=20.43µs min=5.35µs  med=12.66µs max=34.25ms  p(90)=19.45µs  p(95)=21.89µs  p(99.9)=862.01µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.29ms min=21.46ms med=93.9ms  max=374.3ms  p(90)=120.84ms p(95)=132.29ms p(99.9)=234.67ms
     http_reqs......................: 61475   502.139666/s
     iteration_duration.............: avg=97.77ms min=32.46ms med=94.24ms max=383.13ms p(90)=121.21ms p(95)=132.68ms p(99.9)=236.83ms
     iterations.....................: 61375   501.322847/s
     success_rate...................: 100.00% ✓ 61375      ✗ 0    
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

     checks.........................: 100.00% ✓ 134889     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   442 kB/s
     http_req_blocked...............: avg=5.48µs   min=1.19µs  med=3.2µs    max=4.13ms   p(90)=4.62µs   p(95)=5.15µs   p(99.9)=288.1µs 
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=125.86µs
     http_req_duration..............: avg=132.97ms min=19.24ms med=131.12ms max=358.1ms  p(90)=166.09ms p(95)=177.13ms p(99.9)=225.95ms
       { expected_response:true }...: avg=132.97ms min=19.24ms med=131.12ms max=358.1ms  p(90)=166.09ms p(95)=177.13ms p(99.9)=225.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45063
     http_req_receiving.............: avg=96.46µs  min=31.63µs med=82.92µs  max=186.29ms p(90)=115.34µs p(95)=127.35µs p(99.9)=683.67µs
     http_req_sending...............: avg=30.88µs  min=5.97µs  med=15.1µs   max=136.5ms  p(90)=20.54µs  p(95)=22.64µs  p(99.9)=678.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.84ms min=19.14ms med=131ms    max=357.18ms p(90)=165.97ms p(95)=177.01ms p(99.9)=225.52ms
     http_reqs......................: 45063   368.002783/s
     iteration_duration.............: avg=133.47ms min=42.01ms med=131.42ms max=377.2ms  p(90)=166.37ms p(95)=177.4ms  p(99.9)=227.4ms 
     iterations.....................: 44963   367.186143/s
     success_rate...................: 100.00% ✓ 44963      ✗ 0    
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

     checks.........................: 100.00% ✓ 88026      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=5.98µs   min=1.22µs  med=3.49µs   max=3.35ms   p(90)=4.98µs   p(95)=5.58µs   p(99.9)=792.72µs
     http_req_connecting............: avg=2.28µs   min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=755.16µs
     http_req_duration..............: avg=203.67ms min=20.77ms med=203.15ms max=376.48ms p(90)=218.28ms p(95)=224.03ms p(99.9)=297.16ms
       { expected_response:true }...: avg=203.67ms min=20.77ms med=203.15ms max=376.48ms p(90)=218.28ms p(95)=224.03ms p(99.9)=297.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29442
     http_req_receiving.............: avg=125.38µs min=32.48µs med=94.89µs  max=156.81ms p(90)=129.2µs  p(95)=143.32µs p(99.9)=694.18µs
     http_req_sending...............: avg=32.56µs  min=5.64µs  med=17.71µs  max=120.43ms p(90)=23.3µs   p(95)=25.28µs  p(99.9)=607.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.51ms min=20.6ms  med=203ms    max=375.78ms p(90)=218.15ms p(95)=223.85ms p(99.9)=296.39ms
     http_reqs......................: 29442   239.684672/s
     iteration_duration.............: avg=204.57ms min=62.02ms med=203.49ms max=404.82ms p(90)=218.56ms p(95)=224.35ms p(99.9)=299.48ms
     iterations.....................: 29342   238.870581/s
     success_rate...................: 100.00% ✓ 29342      ✗ 0    
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

     checks.........................: 100.00% ✓ 87261      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.43µs   min=1.36µs  med=3.56µs   max=3.97ms   p(90)=5.02µs   p(95)=5.66µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.56µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=205.54ms min=18.63ms med=168.52ms max=699.48ms p(90)=336.02ms p(95)=396.67ms p(99.9)=618.29ms
       { expected_response:true }...: avg=205.54ms min=18.63ms med=168.52ms max=699.48ms p(90)=336.02ms p(95)=396.67ms p(99.9)=618.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29187
     http_req_receiving.............: avg=103.68µs min=34.33µs med=95.86µs  max=65.56ms  p(90)=129.26µs p(95)=142.58µs p(99.9)=574.35µs
     http_req_sending...............: avg=24.23µs  min=6.18µs  med=17.5µs   max=44.96ms  p(90)=22.76µs  p(95)=24.66µs  p(99.9)=656.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.42ms min=18.46ms med=168.41ms max=699.4ms  p(90)=335.89ms p(95)=396.53ms p(99.9)=618.15ms
     http_reqs......................: 29187   238.568672/s
     iteration_duration.............: avg=206.47ms min=55.78ms med=168.93ms max=699.73ms p(90)=336.7ms  p(95)=397.1ms  p(99.9)=618.59ms
     iterations.....................: 29087   237.751292/s
     success_rate...................: 100.00% ✓ 29087      ✗ 0    
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

