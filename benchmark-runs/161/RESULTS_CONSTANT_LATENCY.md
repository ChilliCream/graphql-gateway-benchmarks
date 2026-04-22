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
| hive-router | v0.0.49 | 1,576 | 1,611 | 1,569 | 0.9% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,454 | 1,474 | 1,443 | 0.6% |  |
| grafbase | 0.53.3 | 1,138 | 1,151 | 1,126 | 0.7% |  |
| cosmo | 0.307.0 | 1,130 | 1,148 | 1,127 | 0.7% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 501 | 514 | 494 | 1.3% |  |
| apollo-router | v2.13.1 | 375 | 389 | 370 | 1.5% |  |
| hive-gateway | 2.5.25 | 245 | 250 | 242 | 1.1% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 233 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 576684      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.64µs   min=992ns   med=2.11µs  max=8.66ms   p(90)=4.02µs   p(95)=4.92µs   p(99.9)=35.93µs
     http_req_connecting............: avg=995ns    min=0s      med=0s      max=8.62ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.97ms  min=14.67ms med=30.69ms max=333.78ms p(90)=36.89ms  p(95)=38.89ms  p(99.9)=56.43ms
       { expected_response:true }...: avg=30.97ms  min=14.67ms med=30.69ms max=333.78ms p(90)=36.89ms  p(95)=38.89ms  p(99.9)=56.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192328
     http_req_receiving.............: avg=114.23µs min=27.42µs med=51.6µs  max=279.44ms p(90)=103.61µs p(95)=152.32µs p(99.9)=2.95ms 
     http_req_sending...............: avg=32.75µs  min=4.99µs  med=9.21µs  max=30.34ms  p(90)=19.68µs  p(95)=60.98µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.82ms  min=14.54ms med=30.59ms max=75.07ms  p(90)=36.77ms  p(95)=38.75ms  p(99.9)=53.46ms
     http_reqs......................: 192328  1576.253783/s
     iteration_duration.............: avg=31.2ms   min=14.97ms med=30.91ms max=370.18ms p(90)=37.1ms   p(95)=39.1ms   p(99.9)=57.2ms 
     iterations.....................: 192228  1575.434218/s
     success_rate...................: 100.00% ✓ 192228      ✗ 0     
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

     checks.........................: 100.00% ✓ 532083      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=2.8µs    min=982ns   med=2µs      max=3.01ms   p(90)=3.74µs  p(95)=4.66µs   p(99.9)=27.19µs
     http_req_connecting............: avg=293ns    min=0s      med=0s       max=2.77ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.58ms  min=14.03ms med=32.46ms  max=478.52ms p(90)=41.15ms p(95)=44.73ms  p(99.9)=80.7ms 
       { expected_response:true }...: avg=33.58ms  min=14.03ms med=32.46ms  max=478.52ms p(90)=41.15ms p(95)=44.73ms  p(99.9)=80.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 177461
     http_req_receiving.............: avg=746.99µs min=50.94µs med=111.43µs max=65.63ms  p(90)=2.16ms  p(95)=3.28ms   p(99.9)=16.02ms
     http_req_sending...............: avg=37.3µs   min=5.13µs  med=8.93µs   max=136.66ms p(90)=19.76µs p(95)=106.63µs p(99.9)=2.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.8ms   min=13.92ms med=31.69ms  max=475.65ms p(90)=40.12ms p(95)=43.55ms  p(99.9)=79.93ms
     http_reqs......................: 177461  1454.217935/s
     iteration_duration.............: avg=33.82ms  min=14.21ms med=32.68ms  max=478.75ms p(90)=41.36ms p(95)=44.94ms  p(99.9)=81.5ms 
     iterations.....................: 177361  1453.398477/s
     success_rate...................: 100.00% ✓ 177361      ✗ 0     
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

     checks.........................: 100.00% ✓ 416451      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.65µs  min=982ns   med=2.22µs  max=4.31ms   p(90)=4.65µs  p(95)=5.81µs  p(99.9)=42.24µs
     http_req_connecting............: avg=771ns   min=0s      med=0s      max=4.28ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=42.93ms min=14ms    med=42.44ms max=339.37ms p(90)=52.13ms p(95)=55.21ms p(99.9)=78.92ms
       { expected_response:true }...: avg=42.93ms min=14ms    med=42.44ms max=339.37ms p(90)=52.13ms p(95)=55.21ms p(99.9)=78.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138917
     http_req_receiving.............: avg=96.21µs min=28.84µs med=59.64µs max=162.14ms p(90)=129.6µs p(95)=193.4µs p(99.9)=2.75ms 
     http_req_sending...............: avg=43.19µs min=5.26µs  med=9.99µs  max=236.79ms p(90)=23.81µs p(95)=103µs   p(99.9)=2.55ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=42.79ms min=13.89ms med=42.32ms max=319.07ms p(90)=51.99ms p(95)=55.06ms p(99.9)=78.22ms
     http_reqs......................: 138917  1138.645605/s
     iteration_duration.............: avg=43.21ms min=18.34ms med=42.68ms max=350.3ms  p(90)=52.37ms p(95)=55.44ms p(99.9)=79.71ms
     iterations.....................: 138817  1137.825946/s
     success_rate...................: 100.00% ✓ 138817      ✗ 0     
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

     checks.........................: 100.00% ✓ 413580      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.61µs  min=1.05µs  med=2.27µs  max=4.72ms   p(90)=3.96µs   p(95)=4.72µs  p(99.9)=39.31µs
     http_req_connecting............: avg=907ns   min=0s      med=0s      max=4.68ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=43.27ms min=19.33ms med=42.65ms max=322.21ms p(90)=52.67ms  p(95)=55.85ms p(99.9)=75.22ms
       { expected_response:true }...: avg=43.27ms min=19.33ms med=42.65ms max=322.21ms p(90)=52.67ms  p(95)=55.85ms p(99.9)=75.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137960
     http_req_receiving.............: avg=85.28µs min=28.14µs med=63.43µs max=101.75ms p(90)=108.58µs p(95)=135.1µs p(99.9)=1.77ms 
     http_req_sending...............: avg=26.14µs min=5.06µs  med=10.39µs max=165.54ms p(90)=18.36µs  p(95)=23.2µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=43.16ms min=19.25ms med=42.54ms max=321.71ms p(90)=52.55ms  p(95)=55.72ms p(99.9)=74.76ms
     http_reqs......................: 137960  1130.423351/s
     iteration_duration.............: avg=43.51ms min=20.86ms med=42.85ms max=364.02ms p(90)=52.87ms  p(95)=56.04ms p(99.9)=75.48ms
     iterations.....................: 137860  1129.603966/s
     success_rate...................: 100.00% ✓ 137860      ✗ 0     
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

     checks.........................: 100.00% ✓ 183834     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   602 kB/s
     http_req_blocked...............: avg=5.08µs  min=1.11µs  med=3.14µs  max=4.71ms   p(90)=4.73µs   p(95)=5.36µs   p(99.9)=46.38µs 
     http_req_connecting............: avg=1.67µs  min=0s      med=0s      max=4.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.57ms min=20.05ms med=94.23ms max=395.77ms p(90)=121.87ms p(95)=132.69ms p(99.9)=235.79ms
       { expected_response:true }...: avg=97.57ms min=20.05ms med=94.23ms max=395.77ms p(90)=121.87ms p(95)=132.69ms p(99.9)=235.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61378
     http_req_receiving.............: avg=93.9µs  min=32.03µs med=80.05µs max=197.24ms p(90)=116.69µs p(95)=130.49µs p(99.9)=853.68µs
     http_req_sending...............: avg=24.28µs min=5.55µs  med=14.48µs max=121.98ms p(90)=21.3µs   p(95)=23.6µs   p(99.9)=616.35µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.46ms min=19.89ms med=94.12ms max=395.1ms  p(90)=121.76ms p(95)=132.54ms p(99.9)=235.06ms
     http_reqs......................: 61378   501.113121/s
     iteration_duration.............: avg=97.94ms min=34.43ms med=94.49ms max=402.93ms p(90)=122.14ms p(95)=132.96ms p(99.9)=237.01ms
     iterations.....................: 61278   500.296684/s
     success_rate...................: 100.00% ✓ 61278      ✗ 0    
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

     checks.........................: 100.00% ✓ 137628     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   451 kB/s
     http_req_blocked...............: avg=5.93µs   min=1.14µs  med=3.52µs   max=3.99ms   p(90)=5.09µs   p(95)=5.72µs   p(99.9)=281.63µs
     http_req_connecting............: avg=2.2µs    min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=259.38µs
     http_req_duration..............: avg=130.28ms min=18.24ms med=128.27ms max=380.66ms p(90)=162.92ms p(95)=173.73ms p(99.9)=224.89ms
       { expected_response:true }...: avg=130.28ms min=18.24ms med=128.27ms max=380.66ms p(90)=162.92ms p(95)=173.73ms p(99.9)=224.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45976
     http_req_receiving.............: avg=93.31µs  min=31.18µs med=88.05µs  max=11.75ms  p(90)=121.14µs p(95)=134.69µs p(99.9)=809.94µs
     http_req_sending...............: avg=32.3µs   min=5.56µs  med=16.76µs  max=127.41ms p(90)=22.49µs  p(95)=24.56µs  p(99.9)=676.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.16ms min=18.09ms med=128.13ms max=379.98ms p(90)=162.8ms  p(95)=173.6ms  p(99.9)=224.05ms
     http_reqs......................: 45976   375.372307/s
     iteration_duration.............: avg=130.81ms min=39.77ms med=128.59ms max=406.56ms p(90)=163.21ms p(95)=174.07ms p(99.9)=230.3ms 
     iterations.....................: 45876   374.555854/s
     success_rate...................: 100.00% ✓ 45876      ✗ 0    
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

     checks.........................: 100.00% ✓ 89973      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=7.5µs    min=1.27µs  med=3.69µs   max=4.51ms   p(90)=5.32µs   p(95)=6.02µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=199.34ms min=18.68ms med=178.47ms max=630.76ms p(90)=273.21ms p(95)=390.01ms p(99.9)=573.07ms
       { expected_response:true }...: avg=199.34ms min=18.68ms med=178.47ms max=630.76ms p(90)=273.21ms p(95)=390.01ms p(99.9)=573.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30091
     http_req_receiving.............: avg=111.03µs min=32.64µs med=99.42µs  max=237.53ms p(90)=132.54µs p(95)=146.52µs p(99.9)=532.39µs
     http_req_sending...............: avg=30µs     min=6.72µs  med=18.62µs  max=98.46ms  p(90)=23.88µs  p(95)=25.77µs  p(99.9)=547.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.2ms  min=18.51ms med=178.34ms max=630.62ms p(90)=273.07ms p(95)=389.86ms p(99.9)=573ms   
     http_reqs......................: 30091   245.818772/s
     iteration_duration.............: avg=200.26ms min=39.93ms med=179.05ms max=631.01ms p(90)=273.69ms p(95)=390.64ms p(99.9)=573.5ms 
     iterations.....................: 29991   245.001854/s
     success_rate...................: 100.00% ✓ 29991      ✗ 0    
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

     checks.........................: 100.00% ✓ 86370      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   282 kB/s
     http_req_blocked...............: avg=7.3µs    min=1.27µs  med=3.36µs   max=4.18ms   p(90)=4.76µs   p(95)=5.33µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=207.58ms min=22.19ms med=213.28ms max=443.72ms p(90)=224.65ms p(95)=229.91ms p(99.9)=300.77ms
       { expected_response:true }...: avg=207.58ms min=22.19ms med=213.28ms max=443.72ms p(90)=224.65ms p(95)=229.91ms p(99.9)=300.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28890
     http_req_receiving.............: avg=99.64µs  min=32.19µs med=91.68µs  max=91.5ms   p(90)=125.41µs p(95)=138.19µs p(99.9)=531.07µs
     http_req_sending...............: avg=37.36µs  min=6.17µs  med=17µs     max=137.1ms  p(90)=22.17µs  p(95)=24.06µs  p(99.9)=670.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.44ms min=21.8ms  med=213.17ms max=443.26ms p(90)=224.52ms p(95)=229.77ms p(99.9)=299.63ms
     http_reqs......................: 28890   235.212183/s
     iteration_duration.............: avg=208.52ms min=53.99ms med=213.56ms max=452.41ms p(90)=224.9ms  p(95)=230.2ms  p(99.9)=331.12ms
     iterations.....................: 28790   234.398018/s
     success_rate...................: 100.00% ✓ 28790      ✗ 0    
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

