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
| hive-router | v0.0.43 | 1,580 | 1,610 | 1,571 | 0.9% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,464 | 1,481 | 1,431 | 1.1% |  |
| cosmo | 0.298.0 | 1,139 | 1,150 | 1,134 | 0.5% | non-compatible response (3 across 2/9 runs) |
| grafbase | 0.53.2 | 1,137 | 1,155 | 1,124 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.14 | 573 | 590 | 564 | 1.4% |  |
| apollo-router | v2.12.1 | 362 | 370 | 353 | 1.5% |  |
| hive-gateway | 2.5.14 | 257 | 263 | 255 | 1.1% |  |
| apollo-gateway | 2.13.3 | 238 | 239 | 237 | 0.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578337      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.26µs  min=961ns   med=2.23µs  max=4.52ms   p(90)=4.06µs   p(95)=4.95µs   p(99.9)=36.28µs
     http_req_connecting............: avg=544ns   min=0s      med=0s      max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.87ms min=13.13ms med=30.6ms  max=335.62ms p(90)=36.71ms  p(95)=38.65ms  p(99.9)=57.36ms
       { expected_response:true }...: avg=30.87ms min=13.13ms med=30.6ms  max=335.62ms p(90)=36.71ms  p(95)=38.65ms  p(99.9)=57.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192879
     http_req_receiving.............: avg=83.61µs min=27.56µs med=52.35µs max=148.42ms p(90)=104.38µs p(95)=149.18µs p(99.9)=2.33ms 
     http_req_sending...............: avg=35.36µs min=5.06µs  med=9.54µs  max=143.71ms p(90)=19.7µs   p(95)=46.7µs   p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.75ms min=13.06ms med=30.5ms  max=335.1ms  p(90)=36.58ms  p(95)=38.51ms  p(99.9)=56.13ms
     http_reqs......................: 192879  1580.813375/s
     iteration_duration.............: avg=31.11ms min=13.28ms med=30.82ms max=356.65ms p(90)=36.92ms  p(95)=38.86ms  p(99.9)=58.05ms
     iterations.....................: 192779  1579.993787/s
     success_rate...................: 100.00% ✓ 192779      ✗ 0     
     vus............................: 49      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 535503      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 215 MB  1.8 MB/s
     http_req_blocked...............: avg=3.13µs   min=972ns   med=2.05µs   max=4.03ms   p(90)=3.93µs  p(95)=4.82µs   p(99.9)=26.8µs 
     http_req_connecting............: avg=573ns    min=0s      med=0s       max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.36ms  min=14.12ms med=32.56ms  max=355.35ms p(90)=40.84ms p(95)=43.66ms  p(99.9)=98.75ms
       { expected_response:true }...: avg=33.36ms  min=14.12ms med=32.56ms  max=355.35ms p(90)=40.84ms p(95)=43.66ms  p(99.9)=98.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178601
     http_req_receiving.............: avg=751.56µs min=51.31µs med=112.92µs max=149.36ms p(90)=2.19ms  p(95)=3.29ms   p(99.9)=15.33ms
     http_req_sending...............: avg=38.58µs  min=5.26µs  med=9.16µs   max=205.24ms p(90)=20.75µs p(95)=108.23µs p(99.9)=2.31ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.57ms  min=14.01ms med=31.8ms   max=354.51ms p(90)=39.83ms p(95)=42.59ms  p(99.9)=97.95ms
     http_reqs......................: 178601  1464.029096/s
     iteration_duration.............: avg=33.6ms   min=14.35ms med=32.78ms  max=368.03ms p(90)=41.06ms p(95)=43.87ms  p(99.9)=99.3ms 
     iterations.....................: 178501  1463.209375/s
     success_rate...................: 100.00% ✓ 178501      ✗ 0     
     vus............................: 25      min=0         max=50  
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

     checks.........................: 100.00% ✓ 417096      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.66µs  min=1.09µs  med=2.56µs  max=4.21ms   p(90)=4.2µs   p(95)=4.95µs   p(99.9)=38.24µs
     http_req_connecting............: avg=739ns   min=0s      med=0s      max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.91ms min=19.41ms med=42.32ms max=330.09ms p(90)=52.25ms p(95)=55.39ms  p(99.9)=72.33ms
       { expected_response:true }...: avg=42.91ms min=19.41ms med=42.32ms max=330.09ms p(90)=52.25ms p(95)=55.39ms  p(99.9)=72.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139132
     http_req_receiving.............: avg=87.85µs min=26.81µs med=64.11µs max=165.99ms p(90)=108.1µs p(95)=132.55µs p(99.9)=1.88ms 
     http_req_sending...............: avg=29.37µs min=5.24µs  med=11.14µs max=144.33ms p(90)=18.78µs p(95)=23.3µs   p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.79ms min=19.28ms med=42.22ms max=321.17ms p(90)=52.13ms p(95)=55.27ms  p(99.9)=71.71ms
     http_reqs......................: 139132  1139.954287/s
     iteration_duration.............: avg=43.15ms min=19.67ms med=42.53ms max=342.49ms p(90)=52.45ms p(95)=55.58ms  p(99.9)=72.83ms
     iterations.....................: 139032  1139.134954/s
     success_rate...................: 100.00% ✓ 139032      ✗ 0     
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

     checks.........................: 100.00% ✓ 416289      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.66µs  min=922ns   med=2.28µs  max=4.12ms   p(90)=4.78µs   p(95)=5.93µs   p(99.9)=46.38µs
     http_req_connecting............: avg=729ns   min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.95ms min=15.43ms med=42.43ms max=343.14ms p(90)=52.33ms  p(95)=55.74ms  p(99.9)=84.04ms
       { expected_response:true }...: avg=42.95ms min=15.43ms med=42.43ms max=343.14ms p(90)=52.33ms  p(95)=55.74ms  p(99.9)=84.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138863
     http_req_receiving.............: avg=97.79µs min=29.21µs med=59.52µs max=156.66ms p(90)=131.98µs p(95)=220.6µs  p(99.9)=3.13ms 
     http_req_sending...............: avg=41.66µs min=5.15µs  med=10.08µs max=97.26ms  p(90)=24.23µs  p(95)=114.21µs p(99.9)=2.95ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.81ms min=15.31ms med=42.3ms  max=342.53ms p(90)=52.19ms  p(95)=55.55ms  p(99.9)=83.42ms
     http_reqs......................: 138863  1137.978754/s
     iteration_duration.............: avg=43.23ms min=16.66ms med=42.67ms max=353.24ms p(90)=52.56ms  p(95)=55.98ms  p(99.9)=84.88ms
     iterations.....................: 138763  1137.159257/s
     success_rate...................: 100.00% ✓ 138763      ✗ 0     
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

     checks.........................: 100.00% ✓ 210357     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   689 kB/s
     http_req_blocked...............: avg=4.78µs   min=1.14µs  med=3.08µs  max=3.94ms   p(90)=4.68µs   p(95)=5.34µs   p(99.9)=47.95µs 
     http_req_connecting............: avg=1.44µs   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.23ms  min=21.88ms med=83.06ms max=330.62ms p(90)=99.53ms  p(95)=107.2ms  p(99.9)=207.54ms
       { expected_response:true }...: avg=85.23ms  min=21.88ms med=83.06ms max=330.62ms p(90)=99.53ms  p(95)=107.2ms  p(99.9)=207.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70219
     http_req_receiving.............: avg=127.99µs min=30.6µs  med=77.74µs max=223.18ms p(90)=113.72µs p(95)=127.71µs p(99.9)=1.04ms  
     http_req_sending...............: avg=24.28µs  min=5.7µs   med=13.83µs max=112.42ms p(90)=20.47µs  p(95)=22.92µs  p(99.9)=741.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.08ms  min=21.72ms med=82.95ms max=330.12ms p(90)=99.43ms  p(95)=106.98ms p(99.9)=205.75ms
     http_reqs......................: 70219   573.592055/s
     iteration_duration.............: avg=85.57ms  min=33.45ms med=83.3ms  max=374.93ms p(90)=99.76ms  p(95)=107.49ms p(99.9)=208.62ms
     iterations.....................: 70119   572.775194/s
     success_rate...................: 100.00% ✓ 70119      ✗ 0    
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

     checks.........................: 100.00% ✓ 132810     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   435 kB/s
     http_req_blocked...............: avg=5.79µs   min=1.2µs   med=3.31µs   max=4.02ms   p(90)=4.85µs   p(95)=5.45µs   p(99.9)=464.83µs
     http_req_connecting............: avg=2.29µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=433.06µs
     http_req_duration..............: avg=135.06ms min=20.16ms med=132.81ms max=368.76ms p(90)=169.34ms p(95)=180.69ms p(99.9)=230.33ms
       { expected_response:true }...: avg=135.06ms min=20.16ms med=132.81ms max=368.76ms p(90)=169.34ms p(95)=180.69ms p(99.9)=230.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44370
     http_req_receiving.............: avg=92.64µs  min=29.28µs med=84.62µs  max=70.84ms  p(90)=118.18µs p(95)=130.73µs p(99.9)=681.13µs
     http_req_sending...............: avg=20.89µs  min=5.88µs  med=15.57µs  max=48.42ms  p(90)=21.46µs  p(95)=23.63µs  p(99.9)=626.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.95ms min=20.02ms med=132.69ms max=368.17ms p(90)=169.24ms p(95)=180.58ms p(99.9)=230.12ms
     http_reqs......................: 44370   362.203127/s
     iteration_duration.............: avg=135.57ms min=42.49ms med=133.11ms max=378.9ms  p(90)=169.63ms p(95)=180.99ms p(99.9)=234.2ms 
     iterations.....................: 44270   361.386802/s
     success_rate...................: 100.00% ✓ 44270      ✗ 0    
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

     checks.........................: 100.00% ✓ 94206      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=7.27µs   min=1.22µs  med=3.74µs   max=4.54ms   p(90)=5.31µs   p(95)=5.94µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=3.23µs   min=0s      med=0s       max=4.49ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=190.32ms min=18.54ms med=176.77ms max=562.15ms p(90)=225.48ms p(95)=392.02ms p(99.9)=511.5ms 
       { expected_response:true }...: avg=190.32ms min=18.54ms med=176.77ms max=562.15ms p(90)=225.48ms p(95)=392.02ms p(99.9)=511.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31502
     http_req_receiving.............: avg=102.08µs min=33.37µs med=97.78µs  max=4.29ms   p(90)=130.9µs  p(95)=144.84µs p(99.9)=586.23µs
     http_req_sending...............: avg=41.71µs  min=6.41µs  med=18.38µs  max=169.85ms p(90)=23.74µs  p(95)=25.61µs  p(99.9)=571.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.18ms min=18.33ms med=176.64ms max=562.04ms p(90)=225.29ms p(95)=391.94ms p(99.9)=511.4ms 
     http_reqs......................: 31502   257.817673/s
     iteration_duration.............: avg=191.19ms min=32.52ms med=177.16ms max=562.4ms  p(90)=225.91ms p(95)=393.31ms p(99.9)=511.72ms
     iterations.....................: 31402   256.999256/s
     success_rate...................: 100.00% ✓ 31402      ✗ 0    
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

     checks.........................: 100.00% ✓ 87480      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.03µs   min=1.2µs   med=3.54µs   max=3.85ms   p(90)=5.02µs   p(95)=5.63µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=3.29µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=204.95ms min=20.88ms med=214.63ms max=423.52ms p(90)=236.4ms  p(95)=241.86ms p(99.9)=313.31ms
       { expected_response:true }...: avg=204.95ms min=20.88ms med=214.63ms max=423.52ms p(90)=236.4ms  p(95)=241.86ms p(99.9)=313.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29260
     http_req_receiving.............: avg=100.04µs min=33.31µs med=93.78µs  max=31.32ms  p(90)=127.89µs p(95)=141.7µs  p(99.9)=573.95µs
     http_req_sending...............: avg=28.72µs  min=6.14µs  med=17.72µs  max=75.8ms   p(90)=23.19µs  p(95)=25.28µs  p(99.9)=574.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.83ms min=20.72ms med=214.51ms max=422.83ms p(90)=236.28ms p(95)=241.75ms p(99.9)=313.2ms 
     http_reqs......................: 29260   238.175408/s
     iteration_duration.............: avg=205.89ms min=64.37ms med=215.63ms max=452.14ms p(90)=236.71ms p(95)=242.22ms p(99.9)=317.57ms
     iterations.....................: 29160   237.361412/s
     success_rate...................: 100.00% ✓ 29160      ✗ 0    
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

