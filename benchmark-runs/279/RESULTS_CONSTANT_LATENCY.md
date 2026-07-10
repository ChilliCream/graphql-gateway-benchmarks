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
| fusion-nightly | 16.5.0-p.12 | 1,858 | 1,906 | 1,847 | 1.1% |  |
| hive-router | v0.0.78 | 1,858 | 1,911 | 1,842 | 1.2% |  |
| fusion-nightly-net11 | 16.5.0-p.12 | 1,832 | 1,886 | 1,825 | 1.1% |  |
| fusion | 16.4.0 | 1,828 | 1,886 | 1,826 | 1.1% |  |
| fusion-nightly-fed | 16.5.0-p.12 | 1,741 | 1,793 | 1,738 | 1.1% |  |
| grafbase | 0.53.5 | 1,292 | 1,329 | 1,285 | 1.1% |  |
| cosmo | 0.329.0 | 1,146 | 1,194 | 1,138 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.2 | 548 | 569 | 545 | 1.4% |  |
| apollo-router | v2.16.0 | 428 | 449 | 428 | 1.7% |  |
| apollo-gateway | 2.14.2 | 269 | 272 | 269 | 0.4% |  |
| hive-gateway | 2.10.2 | 262 | 270 | 260 | 1.3% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.9% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 679458      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.81µs   min=892ns   med=2.02µs  max=3.65ms   p(90)=3.51µs   p(95)=4.21µs  p(99.9)=26.87µs
     http_req_connecting............: avg=427ns    min=0s      med=0s      max=3.61ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.26ms  min=17.35ms med=25.68ms max=292.8ms  p(90)=30.71ms  p(95)=32.55ms p(99.9)=49.58ms
       { expected_response:true }...: avg=26.26ms  min=17.35ms med=25.68ms max=292.8ms  p(90)=30.71ms  p(95)=32.55ms p(99.9)=49.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226586
     http_req_receiving.............: avg=339.01µs min=50.41µs med=98.28µs max=101.13ms p(90)=862.41µs p(95)=1.35ms  p(99.9)=8.83ms 
     http_req_sending...............: avg=29.64µs  min=4.68µs  med=8.53µs  max=113.67ms p(90)=17.56µs  p(95)=27µs    p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.9ms   min=17.19ms med=25.33ms max=292.09ms p(90)=30.26ms  p(95)=32.07ms p(99.9)=47.13ms
     http_reqs......................: 226586  1858.228449/s
     iteration_duration.............: avg=26.48ms  min=17.55ms med=25.89ms max=327.01ms p(90)=30.91ms  p(95)=32.75ms p(99.9)=50.23ms
     iterations.....................: 226486  1857.408351/s
     success_rate...................: 100.00% ✓ 226486      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 679407      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.87µs  min=892ns   med=2.04µs  max=6.8ms    p(90)=3.64µs  p(95)=4.34µs   p(99.9)=31.29µs
     http_req_connecting............: avg=418ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.27ms min=17.89ms med=25.83ms max=298.78ms p(90)=29.97ms p(95)=31.37ms  p(99.9)=47.62ms
       { expected_response:true }...: avg=26.27ms min=17.89ms med=25.83ms max=298.78ms p(90)=29.97ms p(95)=31.37ms  p(99.9)=47.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226569
     http_req_receiving.............: avg=73.43µs min=24.23µs med=49.62µs max=130.28ms p(90)=92µs    p(95)=118.02µs p(99.9)=1.74ms 
     http_req_sending...............: avg=28.25µs min=4.6µs   med=9.04µs  max=115.67ms p(90)=17.79µs p(95)=25.14µs  p(99.9)=1.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.17ms min=17.78ms med=25.74ms max=298.2ms  p(90)=29.86ms p(95)=31.25ms  p(99.9)=46.29ms
     http_reqs......................: 226569  1858.157672/s
     iteration_duration.............: avg=26.48ms min=18.03ms med=26.03ms max=317.45ms p(90)=30.17ms p(95)=31.57ms  p(99.9)=47.96ms
     iterations.....................: 226469  1857.337543/s
     success_rate...................: 100.00% ✓ 226469      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 670017      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=3.5µs   min=1.03µs  med=2.65µs  max=8.43ms   p(90)=4.29µs  p(95)=5.04µs  p(99.9)=38.08µs
     http_req_connecting............: avg=398ns   min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.63ms min=17.45ms med=26.02ms max=298.07ms p(90)=31.08ms p(95)=32.93ms p(99.9)=52.18ms
       { expected_response:true }...: avg=26.63ms min=17.45ms med=26.02ms max=298.07ms p(90)=31.08ms p(95)=32.93ms p(99.9)=52.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223439
     http_req_receiving.............: avg=356.1µs min=50.97µs med=100.5µs max=39.64ms  p(90)=952.3µs p(95)=1.52ms  p(99.9)=8.99ms 
     http_req_sending...............: avg=37.42µs min=5.06µs  med=9.9µs   max=180.35ms p(90)=18.93µs p(95)=43.08µs p(99.9)=1.96ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.23ms min=17.19ms med=25.65ms max=287.38ms p(90)=30.59ms p(95)=32.41ms p(99.9)=50.82ms
     http_reqs......................: 223439  1832.753064/s
     iteration_duration.............: avg=26.85ms min=17.69ms med=26.24ms max=311.57ms p(90)=31.29ms p(95)=33.14ms p(99.9)=52.57ms
     iterations.....................: 223339  1831.932816/s
     success_rate...................: 100.00% ✓ 223339      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 668535      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=3.43µs   min=1.02µs  med=2.58µs   max=9.86ms   p(90)=4.12µs   p(95)=4.82µs  p(99.9)=34.35µs
     http_req_connecting............: avg=439ns    min=0s      med=0s       max=3.48ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.69ms  min=17.78ms med=26.07ms  max=300.21ms p(90)=31.32ms  p(95)=33.26ms p(99.9)=50.1ms 
       { expected_response:true }...: avg=26.69ms  min=17.78ms med=26.07ms  max=300.21ms p(90)=31.32ms  p(95)=33.26ms p(99.9)=50.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 222945
     http_req_receiving.............: avg=358.92µs min=52.28µs med=103.29µs max=97.4ms   p(90)=931.38µs p(95)=1.45ms  p(99.9)=8.54ms 
     http_req_sending...............: avg=33.91µs  min=4.65µs  med=9.73µs   max=136.37ms p(90)=18.88µs  p(95)=33.3µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.3ms   min=17.69ms med=25.69ms  max=299.68ms p(90)=30.85ms  p(95)=32.78ms p(99.9)=48.53ms
     http_reqs......................: 222945  1828.129528/s
     iteration_duration.............: avg=26.91ms  min=17.94ms med=26.28ms  max=310.25ms p(90)=31.53ms  p(95)=33.48ms p(99.9)=50.57ms
     iterations.....................: 222845  1827.309537/s
     success_rate...................: 100.00% ✓ 222845      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 636936      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 255 MB  2.1 MB/s
     http_req_blocked...............: avg=2.85µs   min=812ns   med=1.97µs   max=3.69ms   p(90)=3.72µs   p(95)=4.49µs  p(99.9)=30.63µs
     http_req_connecting............: avg=463ns    min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=28.03ms  min=18.56ms med=27.47ms  max=299.84ms p(90)=32.83ms  p(95)=34.72ms p(99.9)=51.07ms
       { expected_response:true }...: avg=28.03ms  min=18.56ms med=27.47ms  max=299.84ms p(90)=32.83ms  p(95)=34.72ms p(99.9)=51.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 212412
     http_req_receiving.............: avg=340.86µs min=50.18µs med=101.71µs max=152.92ms p(90)=881.49µs p(95)=1.37ms  p(99.9)=7.66ms 
     http_req_sending...............: avg=29.92µs  min=4.34µs  med=8.58µs   max=110.56ms p(90)=19.12µs  p(95)=28.77µs p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.66ms  min=18.21ms med=27.11ms  max=299.58ms p(90)=32.39ms  p(95)=34.23ms p(99.9)=49.65ms
     http_reqs......................: 212412  1741.015039/s
     iteration_duration.............: avg=28.25ms  min=18.79ms med=27.67ms  max=319.82ms p(90)=33.03ms  p(95)=34.92ms p(99.9)=51.35ms
     iterations.....................: 212312  1740.195398/s
     success_rate...................: 100.00% ✓ 212312      ✗ 0     
     vus............................: 37      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 472545      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.6 MB/s
     http_req_blocked...............: avg=3.22µs  min=841ns   med=2.14µs  max=3.99ms   p(90)=4.53µs   p(95)=5.52µs  p(99.9)=41.59µs
     http_req_connecting............: avg=473ns   min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=37.83ms min=18.31ms med=37.56ms max=288.5ms  p(90)=44.37ms  p(95)=46.36ms p(99.9)=60.24ms
       { expected_response:true }...: avg=37.83ms min=18.31ms med=37.56ms max=288.5ms  p(90)=44.37ms  p(95)=46.36ms p(99.9)=60.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157615
     http_req_receiving.............: avg=82.22µs min=26.32µs med=55.44µs max=22.87ms  p(90)=123.39µs p(95)=168.1µs p(99.9)=1.6ms  
     http_req_sending...............: avg=30.59µs min=4.6µs   med=9.09µs  max=147.02ms p(90)=23.27µs  p(95)=37.27µs p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=37.71ms min=18.17ms med=37.45ms max=287.02ms p(90)=44.26ms  p(95)=46.25ms p(99.9)=59.13ms
     http_reqs......................: 157615  1292.160019/s
     iteration_duration.............: avg=38.08ms min=21.2ms  med=37.78ms max=324.47ms p(90)=44.58ms  p(95)=46.57ms p(99.9)=60.76ms
     iterations.....................: 157515  1291.340199/s
     success_rate...................: 100.00% ✓ 157515      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 419226      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.61µs  min=1.03µs  med=2.98µs  max=2.38ms   p(90)=4.6µs    p(95)=5.33µs   p(99.9)=38.09µs 
     http_req_connecting............: avg=317ns   min=0s      med=0s      max=2.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.68ms min=18.77ms med=42.03ms max=322.75ms p(90)=51.7ms   p(95)=54.87ms  p(99.9)=70.74ms 
       { expected_response:true }...: avg=42.68ms min=18.77ms med=42.03ms max=322.75ms p(90)=51.7ms   p(95)=54.87ms  p(99.9)=70.74ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139842
     http_req_receiving.............: avg=82.01µs min=27.97µs med=67.61µs max=58.53ms  p(90)=110.43µs p(95)=130.28µs p(99.9)=933.11µs
     http_req_sending...............: avg=30.81µs min=5.36µs  med=12.76µs max=219.75ms p(90)=19.69µs  p(95)=23.61µs  p(99.9)=923.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.57ms min=18.62ms med=41.93ms max=285.08ms p(90)=51.59ms  p(95)=54.75ms  p(99.9)=70.11ms 
     http_reqs......................: 139842  1146.198939/s
     iteration_duration.............: avg=42.92ms min=23.18ms med=42.26ms max=329.67ms p(90)=51.92ms  p(95)=55.08ms  p(99.9)=71.01ms 
     iterations.....................: 139742  1145.379301/s
     success_rate...................: 100.00% ✓ 139742      ✗ 0     
     vus............................: 30      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 200853     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   659 kB/s
     http_req_blocked...............: avg=5.09µs  min=1.18µs  med=3.46µs  max=3.81ms   p(90)=5.03µs   p(95)=5.71µs   p(99.9)=46.98µs 
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.26ms min=20.58ms med=87.33ms max=322.71ms p(90)=109.41ms p(95)=118.88ms p(99.9)=205.37ms
       { expected_response:true }...: avg=89.26ms min=20.58ms med=87.33ms max=322.71ms p(90)=109.41ms p(95)=118.88ms p(99.9)=205.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67051
     http_req_receiving.............: avg=99.05µs min=32.08µs med=81.9µs  max=170.38ms p(90)=117.69µs p(95)=131.81µs p(99.9)=665.79µs
     http_req_sending...............: avg=26.08µs min=5.38µs  med=16µs    max=129.85ms p(90)=22.38µs  p(95)=24.63µs  p(99.9)=649.43µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.13ms min=20.48ms med=87.22ms max=322.46ms p(90)=109.29ms p(95)=118.77ms p(99.9)=204.2ms 
     http_reqs......................: 67051   548.374016/s
     iteration_duration.............: avg=89.62ms min=39.43ms med=87.6ms  max=331.87ms p(90)=109.67ms p(95)=119.19ms p(99.9)=206.74ms
     iterations.....................: 66951   547.55617/s
     success_rate...................: 100.00% ✓ 66951      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 156885     ✗ 0    
     data_received..................: 4.6 GB  37 MB/s
     data_sent......................: 63 MB   514 kB/s
     http_req_blocked...............: avg=5.16µs   min=1.12µs  med=3.26µs   max=4.08ms   p(90)=4.78µs   p(95)=5.38µs   p(99.9)=104.66µs
     http_req_connecting............: avg=1.68µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.3ms  min=21.62ms med=112.4ms  max=345.41ms p(90)=142.39ms p(95)=151.95ms p(99.9)=191.88ms
       { expected_response:true }...: avg=114.3ms  min=21.62ms med=112.4ms  max=345.41ms p(90)=142.39ms p(95)=151.95ms p(99.9)=191.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52395
     http_req_receiving.............: avg=156.2µs  min=29.18µs med=83.82µs  max=157.08ms p(90)=115.4µs  p(95)=128.47µs p(99.9)=1.03ms  
     http_req_sending...............: avg=23.77µs  min=5.06µs  med=16.97µs  max=103.6ms  p(90)=22.24µs  p(95)=24.18µs  p(99.9)=550.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.12ms min=21.47ms med=112.28ms max=210.9ms  p(90)=142.26ms p(95)=151.79ms p(99.9)=191.39ms
     http_reqs......................: 52395   428.194732/s
     iteration_duration.............: avg=114.76ms min=25.5ms  med=112.71ms max=368.51ms p(90)=142.69ms p(95)=152.22ms p(99.9)=194.57ms
     iterations.....................: 52295   427.377489/s
     success_rate...................: 100.00% ✓ 52295      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98835      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   323 kB/s
     http_req_blocked...............: avg=6.49µs   min=1.17µs  med=3.26µs   max=4.02ms   p(90)=4.71µs   p(95)=5.28µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=181.47ms min=23.36ms med=187.34ms max=400.63ms p(90)=194.99ms p(95)=198.74ms p(99.9)=278.96ms
       { expected_response:true }...: avg=181.47ms min=23.36ms med=187.34ms max=400.63ms p(90)=194.99ms p(95)=198.74ms p(99.9)=278.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33045
     http_req_receiving.............: avg=100.88µs min=32.74µs med=89.8µs   max=199.95ms p(90)=121.15µs p(95)=133.33µs p(99.9)=502.53µs
     http_req_sending...............: avg=33.72µs  min=5.7µs   med=18.05µs  max=111.25ms p(90)=22.85µs  p(95)=24.86µs  p(99.9)=502.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.33ms min=23.2ms  med=187.23ms max=400.05ms p(90)=194.88ms p(95)=198.62ms p(99.9)=276.73ms
     http_reqs......................: 33045   269.379637/s
     iteration_duration.............: avg=182.26ms min=43.24ms med=187.62ms max=421.94ms p(90)=195.28ms p(95)=199.03ms p(99.9)=281.4ms 
     iterations.....................: 32945   268.564446/s
     success_rate...................: 100.00% ✓ 32945      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95826      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=7.72µs   min=1.63µs  med=3.88µs   max=3.98ms   p(90)=5.44µs   p(95)=6.08µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=187.11ms min=17.59ms med=174.42ms max=665.88ms p(90)=223.12ms p(95)=247.66ms p(99.9)=610.19ms
       { expected_response:true }...: avg=187.11ms min=17.59ms med=174.42ms max=665.88ms p(90)=223.12ms p(95)=247.66ms p(99.9)=610.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32042
     http_req_receiving.............: avg=102.02µs min=37.54µs med=94.25µs  max=30.23ms  p(90)=126.88µs p(95)=141.14µs p(99.9)=895.04µs
     http_req_sending...............: avg=31.8µs   min=6.6µs   med=19.21µs  max=102.27ms p(90)=24.24µs  p(95)=26.23µs  p(99.9)=557.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.98ms min=17.44ms med=174.28ms max=665.76ms p(90)=222.99ms p(95)=247.32ms p(99.9)=610.08ms
     http_reqs......................: 32042   262.504783/s
     iteration_duration.............: avg=187.94ms min=33.23ms med=174.79ms max=666.12ms p(90)=223.48ms p(95)=248.32ms p(99.9)=610.67ms
     iterations.....................: 31942   261.685531/s
     success_rate...................: 100.00% ✓ 31942      ✗ 0    
     vus............................: 34      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 6567      ✗ 0   
     data_received..................: 219 MB  1.7 MB/s
     data_sent......................: 2.7 MB  22 kB/s
     http_req_blocked...............: avg=51.24µs min=1.41µs   med=3.52µs  max=4.76ms  p(90)=5.14µs   p(95)=5.9µs    p(99.9)=4.72ms  
     http_req_connecting............: avg=45.83µs min=0s       med=0s      max=4.71ms  p(90)=0s       p(95)=0s       p(99.9)=4.67ms  
     http_req_duration..............: avg=2.64s   min=40.49ms  med=2.73s   max=12.72s  p(90)=3.38s    p(95)=3.61s    p(99.9)=11.16s  
       { expected_response:true }...: avg=2.64s   min=40.49ms  med=2.73s   max=12.72s  p(90)=3.38s    p(95)=3.61s    p(99.9)=11.16s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2289
     http_req_receiving.............: avg=97.09µs min=35.12µs  med=91.23µs max=2.08ms  p(90)=132.44µs p(95)=147.26µs p(99.9)=673.78µs
     http_req_sending...............: avg=60.72µs min=6.43µs   med=18.42µs max=23.41ms p(90)=23.64µs  p(95)=28.13µs  p(99.9)=9.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.64s   min=40.34ms  med=2.73s   max=12.72s  p(90)=3.38s    p(95)=3.61s    p(99.9)=11.16s  
     http_reqs......................: 2289    17.986276/s
     iteration_duration.............: avg=2.76s   min=476.27ms med=2.75s   max=12.72s  p(90)=3.4s     p(95)=3.64s    p(99.9)=11.17s  
     iterations.....................: 2189    17.200506/s
     success_rate...................: 100.00% ✓ 2189      ✗ 0   
     vus............................: 15      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

