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
| hive-router | v0.0.42 | 1,581 | 1,614 | 1,574 | 1.0% |  |
| hotchocolate | 16.0.0-rc.1.14 | 1,421 | 1,436 | 1,405 | 0.6% |  |
| cosmo | 0.295.0 | 1,141 | 1,160 | 1,135 | 0.8% | non-compatible response (3 across 2/9 runs) |
| grafbase | 0.53.2 | 1,127 | 1,150 | 1,121 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.11 | 563 | 579 | 557 | 1.3% |  |
| apollo-router | v2.12.0 | 397 | 404 | 391 | 1.1% |  |
| hive-gateway | 2.5.11 | 259 | 263 | 255 | 1.0% |  |
| apollo-gateway | 2.13.3 | 237 | 238 | 236 | 0.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578718      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.11µs  min=992ns   med=2.09µs  max=4.16ms   p(90)=3.91µs   p(95)=4.89µs   p(99.9)=32.72µs
     http_req_connecting............: avg=536ns   min=0s      med=0s      max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.85ms min=14.05ms med=30.58ms max=294.16ms p(90)=36.74ms  p(95)=38.62ms  p(99.9)=55.41ms
       { expected_response:true }...: avg=30.85ms min=14.05ms med=30.58ms max=294.16ms p(90)=36.74ms  p(95)=38.62ms  p(99.9)=55.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193006
     http_req_receiving.............: avg=82.26µs min=27.86µs med=52.37µs max=31.71ms  p(90)=104.33µs p(95)=152.63µs p(99.9)=2.39ms 
     http_req_sending...............: avg=31.47µs min=5.13µs  med=9.14µs  max=103.83ms p(90)=19.15µs  p(95)=36.62µs  p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.74ms min=13.93ms med=30.47ms max=293.64ms p(90)=36.62ms  p(95)=38.5ms   p(99.9)=53.87ms
     http_reqs......................: 193006  1581.897429/s
     iteration_duration.............: avg=31.09ms min=14.29ms med=30.8ms  max=358.02ms p(90)=36.95ms  p(95)=38.84ms  p(99.9)=55.84ms
     iterations.....................: 192906  1581.077819/s
     success_rate...................: 100.00% ✓ 192906      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 519897      ✗ 0     
     data_received..................: 15 GB   125 MB/s
     data_sent......................: 208 MB  1.7 MB/s
     http_req_blocked...............: avg=3.26µs   min=982ns   med=2.16µs  max=4.25ms   p(90)=3.94µs  p(95)=4.82µs  p(99.9)=34.55µs
     http_req_connecting............: avg=621ns    min=0s      med=0s      max=4.21ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=34.37ms  min=13.67ms med=33.2ms  max=475.9ms  p(90)=42.43ms p(95)=46.13ms p(99.9)=80.35ms
       { expected_response:true }...: avg=34.37ms  min=13.67ms med=33.2ms  max=475.9ms  p(90)=42.43ms p(95)=46.13ms p(99.9)=80.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173399
     http_req_receiving.............: avg=797.87µs min=51.33µs med=114.1µs max=275.03ms p(90)=2.28ms  p(95)=3.43ms  p(99.9)=17.58ms
     http_req_sending...............: avg=39.46µs  min=5.02µs  med=9.11µs  max=107.01ms p(90)=19.74µs p(95)=107µs   p(99.9)=2.98ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=33.53ms  min=13.56ms med=32.4ms  max=475.05ms p(90)=41.35ms p(95)=44.91ms p(99.9)=78.62ms
     http_reqs......................: 173399  1421.002291/s
     iteration_duration.............: avg=34.61ms  min=13.88ms med=33.43ms max=476.04ms p(90)=42.65ms p(95)=46.37ms p(99.9)=81.25ms
     iterations.....................: 173299  1420.182792/s
     success_rate...................: 100.00% ✓ 173299      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 417444      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.65µs   min=1.03µs  med=2.51µs  max=4.02ms   p(90)=4.13µs   p(95)=4.87µs   p(99.9)=38.78µs
     http_req_connecting............: avg=771ns    min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.88ms  min=19.43ms med=42.25ms max=344.24ms p(90)=52.27ms  p(95)=55.47ms  p(99.9)=74.07ms
       { expected_response:true }...: avg=42.88ms  min=19.43ms med=42.25ms max=344.24ms p(90)=52.27ms  p(95)=55.47ms  p(99.9)=74.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139248
     http_req_receiving.............: avg=118.45µs min=29.48µs med=64.77µs max=253.65ms p(90)=110.43µs p(95)=136.82µs p(99.9)=2.17ms 
     http_req_sending...............: avg=26.36µs  min=5.18µs  med=10.9µs  max=72.88ms  p(90)=18.47µs  p(95)=23.27µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.73ms  min=19.33ms med=42.14ms max=184.67ms p(90)=52.14ms  p(95)=55.32ms  p(99.9)=73.25ms
     http_reqs......................: 139248  1141.037777/s
     iteration_duration.............: avg=43.11ms  min=21.15ms med=42.45ms max=354.69ms p(90)=52.47ms  p(95)=55.68ms  p(99.9)=74.45ms
     iterations.....................: 139148  1140.218348/s
     success_rate...................: 100.00% ✓ 139148      ✗ 0     
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

     checks.........................: 100.00% ✓ 412392      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.18µs  min=1.01µs  med=2.24µs  max=2.16ms   p(90)=4.68µs   p(95)=5.88µs   p(99.9)=45.44µs
     http_req_connecting............: avg=305ns   min=0s      med=0s      max=2.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.36ms min=17.25ms med=42.88ms max=317.99ms p(90)=52.71ms  p(95)=55.97ms  p(99.9)=78.46ms
       { expected_response:true }...: avg=43.36ms min=17.25ms med=42.88ms max=317.99ms p(90)=52.71ms  p(95)=55.97ms  p(99.9)=78.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137564
     http_req_receiving.............: avg=95.61µs min=28.8µs  med=60.55µs max=77.06ms  p(90)=132.92µs p(95)=202.72µs p(99.9)=2.52ms 
     http_req_sending...............: avg=37.35µs min=5.23µs  med=9.94µs  max=174.7ms  p(90)=23.84µs  p(95)=109.12µs p(99.9)=2.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.22ms min=17.13ms med=42.76ms max=317.76ms p(90)=52.55ms  p(95)=55.81ms  p(99.9)=78.13ms
     http_reqs......................: 137564  1127.424947/s
     iteration_duration.............: avg=43.63ms min=17.59ms med=43.12ms max=366.7ms  p(90)=52.93ms  p(95)=56.2ms   p(99.9)=78.98ms
     iterations.....................: 137464  1126.605383/s
     success_rate...................: 100.00% ✓ 137464      ✗ 0     
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

     checks.........................: 100.00% ✓ 206571     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   677 kB/s
     http_req_blocked...............: avg=4.89µs  min=1.2µs   med=3.14µs  max=4.56ms   p(90)=4.73µs   p(95)=5.38µs   p(99.9)=46.83µs 
     http_req_connecting............: avg=1.47µs  min=0s      med=0s      max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.8ms  min=18.96ms med=84.66ms max=362.46ms p(90)=102.44ms p(95)=109.77ms p(99.9)=211.31ms
       { expected_response:true }...: avg=86.8ms  min=18.96ms med=84.66ms max=362.46ms p(90)=102.44ms p(95)=109.77ms p(99.9)=211.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68957
     http_req_receiving.............: avg=88.27µs min=32.2µs  med=77.81µs max=61.25ms  p(90)=114.28µs p(95)=128.87µs p(99.9)=891.62µs
     http_req_sending...............: avg=21.76µs min=5.94µs  med=14.2µs  max=70.71ms  p(90)=20.78µs  p(95)=23.21µs  p(99.9)=678µs   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.69ms min=18.84ms med=84.55ms max=361.79ms p(90)=102.33ms p(95)=109.67ms p(99.9)=211.2ms 
     http_reqs......................: 68957   563.430595/s
     iteration_duration.............: avg=87.14ms min=32.91ms med=84.9ms  max=374.21ms p(90)=102.68ms p(95)=110.05ms p(99.9)=212.42ms
     iterations.....................: 68857   562.61352/s
     success_rate...................: 100.00% ✓ 68857      ✗ 0    
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

     checks.........................: 100.00% ✓ 145722     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 58 MB   477 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.24µs  med=3.31µs   max=4.07ms   p(90)=4.86µs   p(95)=5.46µs   p(99.9)=153.96µs
     http_req_connecting............: avg=2.04µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=87.67µs 
     http_req_duration..............: avg=123.08ms min=22.55ms med=121.3ms  max=388.52ms p(90)=153.12ms p(95)=163.27ms p(99.9)=205.89ms
       { expected_response:true }...: avg=123.08ms min=22.55ms med=121.3ms  max=388.52ms p(90)=153.12ms p(95)=163.27ms p(99.9)=205.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48674
     http_req_receiving.............: avg=92.09µs  min=30.12µs med=84.49µs  max=144.6ms  p(90)=118.06µs p(95)=131.04µs p(99.9)=704.9µs 
     http_req_sending...............: avg=24.95µs  min=6.08µs  med=15.6µs   max=86.07ms  p(90)=21.64µs  p(95)=23.84µs  p(99.9)=624.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.96ms min=22.4ms  med=121.18ms max=388ms    p(90)=152.99ms p(95)=163.12ms p(99.9)=205.66ms
     http_reqs......................: 48674   397.351873/s
     iteration_duration.............: avg=123.56ms min=51.03ms med=121.6ms  max=399.4ms  p(90)=153.39ms p(95)=163.56ms p(99.9)=208.47ms
     iterations.....................: 48574   396.53552/s
     success_rate...................: 100.00% ✓ 48574      ✗ 0    
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

     checks.........................: 100.00% ✓ 94836      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=7.53µs   min=1.26µs  med=3.58µs   max=4.72ms   p(90)=5.09µs   p(95)=5.7µs    p(99.9)=1.74ms  
     http_req_connecting............: avg=3.67µs   min=0s      med=0s       max=4.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=189.06ms min=18.4ms  med=177.1ms  max=609.59ms p(90)=226.01ms p(95)=328ms    p(99.9)=550.35ms
       { expected_response:true }...: avg=189.06ms min=18.4ms  med=177.1ms  max=609.59ms p(90)=226.01ms p(95)=328ms    p(99.9)=550.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31712
     http_req_receiving.............: avg=101.87µs min=36.71µs med=96.23µs  max=25.43ms  p(90)=129.51µs p(95)=143.32µs p(99.9)=672.62µs
     http_req_sending...............: avg=26.16µs  min=6.42µs  med=17.58µs  max=68.02ms  p(90)=23.04µs  p(95)=24.94µs  p(99.9)=500.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.94ms min=18.28ms med=176.97ms max=609.46ms p(90)=225.88ms p(95)=327.3ms  p(99.9)=550.24ms
     http_reqs......................: 31712   259.514664/s
     iteration_duration.............: avg=189.9ms  min=41.47ms med=177.51ms max=609.77ms p(90)=226.42ms p(95)=343.71ms p(99.9)=550.65ms
     iterations.....................: 31612   258.696315/s
     success_rate...................: 100.00% ✓ 31612      ✗ 0    
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

     checks.........................: 100.00% ✓ 87291      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=6.54µs   min=1.18µs  med=3.36µs   max=3.72ms   p(90)=4.82µs   p(95)=5.42µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=2.94µs   min=0s      med=0s       max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=205.46ms min=20.51ms med=178.79ms max=421.86ms p(90)=298.2ms  p(95)=305.8ms  p(99.9)=376.31ms
       { expected_response:true }...: avg=205.46ms min=20.51ms med=178.79ms max=421.86ms p(90)=298.2ms  p(95)=305.8ms  p(99.9)=376.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29197
     http_req_receiving.............: avg=98.63µs  min=34.37µs med=92.91µs  max=20.9ms   p(90)=126.87µs p(95)=140.19µs p(99.9)=526.96µs
     http_req_sending...............: avg=32.25µs  min=6.24µs  med=16.84µs  max=94.65ms  p(90)=22.35µs  p(95)=24.42µs  p(99.9)=606.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.33ms min=20.35ms med=178.66ms max=416.75ms p(90)=298.09ms p(95)=305.66ms p(99.9)=376.21ms
     http_reqs......................: 29197   237.626033/s
     iteration_duration.............: avg=206.38ms min=49.18ms med=179.12ms max=431.77ms p(90)=298.54ms p(95)=306.14ms p(99.9)=378.06ms
     iterations.....................: 29097   236.812161/s
     success_rate...................: 100.00% ✓ 29097      ✗ 0    
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

