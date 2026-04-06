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
| hive-router | v0.0.43 | 1,579 | 1,605 | 1,569 | 0.8% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,438 | 1,454 | 1,434 | 0.5% |  |
| cosmo | 0.298.0 | 1,160 | 1,177 | 1,156 | 0.7% | non-compatible response (5 across 3/9 runs) |
| grafbase | 0.53.2 | 1,135 | 1,154 | 1,127 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.14 | 567 | 583 | 562 | 1.1% |  |
| apollo-router | v2.12.1 | 361 | 371 | 356 | 1.4% |  |
| hive-gateway | 2.5.14 | 260 | 265 | 259 | 1.0% |  |
| apollo-gateway | 2.13.3 | 235 | 238 | 233 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577863      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.02µs   min=992ns   med=2.04µs  max=3.96ms   p(90)=3.78µs  p(95)=4.73µs   p(99.9)=32.73µs
     http_req_connecting............: avg=510ns    min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.91ms  min=13.75ms med=30.65ms max=330.38ms p(90)=36.85ms p(95)=38.8ms   p(99.9)=57.97ms
       { expected_response:true }...: avg=30.91ms  min=13.75ms med=30.65ms max=330.38ms p(90)=36.85ms p(95)=38.8ms   p(99.9)=57.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192721
     http_req_receiving.............: avg=106.73µs min=27.11µs med=50.53µs max=255.45ms p(90)=99.7µs  p(95)=146.62µs p(99.9)=2.97ms 
     http_req_sending...............: avg=35.42µs  min=5.05µs  med=8.93µs  max=272.09ms p(90)=18.88µs p(95)=42.37µs  p(99.9)=1.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.77ms  min=13.65ms med=30.54ms max=105.67ms p(90)=36.73ms p(95)=38.65ms  p(99.9)=56.55ms
     http_reqs......................: 192721  1579.735204/s
     iteration_duration.............: avg=31.14ms  min=13.99ms med=30.86ms max=354ms    p(90)=37.06ms p(95)=39ms     p(99.9)=58.36ms
     iterations.....................: 192621  1578.915504/s
     success_rate...................: 100.00% ✓ 192621      ✗ 0     
     vus............................: 25      min=0         max=50  
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

     checks.........................: 100.00% ✓ 526251      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=2.71µs   min=971ns   med=1.98µs  max=2.67ms   p(90)=3.7µs   p(95)=4.56µs   p(99.9)=30.68µs
     http_req_connecting............: avg=259ns    min=0s      med=0s      max=2.64ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.95ms  min=14.29ms med=32.67ms max=481.71ms p(90)=41.67ms p(95)=45.39ms  p(99.9)=87.68ms
       { expected_response:true }...: avg=33.95ms  min=14.29ms med=32.67ms max=481.71ms p(90)=41.67ms p(95)=45.39ms  p(99.9)=87.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175517
     http_req_receiving.............: avg=829.57µs min=50.83µs med=108.5µs max=280.67ms p(90)=2.41ms  p(95)=3.69ms   p(99.9)=19.98ms
     http_req_sending...............: avg=40.52µs  min=5.12µs  med=8.67µs  max=143.89ms p(90)=19.78µs p(95)=106.94µs p(99.9)=2.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.08ms  min=14.21ms med=31.84ms max=481.24ms p(90)=40.51ms p(95)=44.08ms  p(99.9)=84.12ms
     http_reqs......................: 175517  1438.590611/s
     iteration_duration.............: avg=34.19ms  min=14.48ms med=32.89ms max=481.9ms  p(90)=41.89ms p(95)=45.61ms  p(99.9)=91.65ms
     iterations.....................: 175417  1437.77098/s
     success_rate...................: 100.00% ✓ 175417      ✗ 0     
     vus............................: 30      min=0         max=50  
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

     checks.........................: 100.00% ✓ 424452      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.49µs  min=1.06µs  med=2.3µs   max=4.68ms   p(90)=4.02µs  p(95)=4.8µs    p(99.9)=37.99µs
     http_req_connecting............: avg=754ns   min=0s      med=0s      max=4.63ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.16ms min=17.74ms med=41.58ms max=335.79ms p(90)=51.17ms p(95)=54.17ms  p(99.9)=74.78ms
       { expected_response:true }...: avg=42.16ms min=17.74ms med=41.58ms max=335.79ms p(90)=51.17ms p(95)=54.17ms  p(99.9)=74.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141584
     http_req_receiving.............: avg=85.76µs min=28.52µs med=62.7µs  max=166.2ms  p(90)=108.7µs p(95)=135.78µs p(99.9)=1.66ms 
     http_req_sending...............: avg=27.8µs  min=5.22µs  med=10.49µs max=197.67ms p(90)=18.48µs p(95)=23.49µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.05ms min=17.68ms med=41.48ms max=326.58ms p(90)=51.05ms p(95)=54.05ms  p(99.9)=73.81ms
     http_reqs......................: 141584  1160.169942/s
     iteration_duration.............: avg=42.4ms  min=17.94ms med=41.79ms max=343.33ms p(90)=51.37ms p(95)=54.38ms  p(99.9)=75.71ms
     iterations.....................: 141484  1159.35052/s
     success_rate...................: 100.00% ✓ 141484      ✗ 0     
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

     checks.........................: 100.00% ✓ 415503      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=4.86µs   min=992ns   med=2.21µs  max=9.79ms   p(90)=4.64µs   p(95)=5.78µs   p(99.9)=42.18µs
     http_req_connecting............: avg=1.85µs   min=0s      med=0s      max=9.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.03ms  min=17.2ms  med=42.57ms max=356.26ms p(90)=52.3ms   p(95)=55.45ms  p(99.9)=81.14ms
       { expected_response:true }...: avg=43.03ms  min=17.2ms  med=42.57ms max=356.26ms p(90)=52.3ms   p(95)=55.45ms  p(99.9)=81.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138601
     http_req_receiving.............: avg=109.96µs min=28.68µs med=58.15µs max=196.09ms p(90)=128.95µs p(95)=195.72µs p(99.9)=3.12ms 
     http_req_sending...............: avg=37.17µs  min=4.86µs  med=9.85µs  max=116.49ms p(90)=23.91µs  p(95)=103.9µs  p(99.9)=2.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.89ms  min=17.05ms med=42.44ms max=223.61ms p(90)=52.16ms  p(95)=55.29ms  p(99.9)=80.07ms
     http_reqs......................: 138601  1135.956109/s
     iteration_duration.............: avg=43.31ms  min=18.53ms med=42.82ms max=379.93ms p(90)=52.53ms  p(95)=55.67ms  p(99.9)=81.73ms
     iterations.....................: 138501  1135.136521/s
     success_rate...................: 100.00% ✓ 138501      ✗ 0     
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

     checks.........................: 100.00% ✓ 208212     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   682 kB/s
     http_req_blocked...............: avg=4.1µs   min=1.22µs  med=3.04µs  max=3.05ms   p(90)=4.59µs   p(95)=5.24µs   p(99.9)=46.71µs 
     http_req_connecting............: avg=786ns   min=0s      med=0s      max=3ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.12ms min=22.19ms med=84.32ms max=348.1ms  p(90)=104.99ms p(95)=113.25ms p(99.9)=215.87ms
       { expected_response:true }...: avg=86.12ms min=22.19ms med=84.32ms max=348.1ms  p(90)=104.99ms p(95)=113.25ms p(99.9)=215.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69504
     http_req_receiving.............: avg=91.28µs min=32.58µs med=77.25µs max=186.26ms p(90)=113.47µs p(95)=127.9µs  p(99.9)=968.3µs 
     http_req_sending...............: avg=21.64µs min=6.01µs  med=13.48µs max=85.08ms  p(90)=19.93µs  p(95)=22.41µs  p(99.9)=790.76µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.01ms min=22.02ms med=84.21ms max=313.65ms p(90)=104.88ms p(95)=113.14ms p(99.9)=215.58ms
     http_reqs......................: 69504   567.852863/s
     iteration_duration.............: avg=86.46ms min=31.61ms med=84.57ms max=385.2ms  p(90)=105.22ms p(95)=113.54ms p(99.9)=217.2ms 
     iterations.....................: 69404   567.035855/s
     success_rate...................: 100.00% ✓ 69404      ✗ 0    
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

     checks.........................: 100.00% ✓ 132477     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   434 kB/s
     http_req_blocked...............: avg=4.45µs   min=1.14µs  med=3.21µs   max=2.26ms   p(90)=4.7µs    p(95)=5.29µs   p(99.9)=228.17µs
     http_req_connecting............: avg=1.02µs   min=0s      med=0s       max=2.24ms   p(90)=0s       p(95)=0s       p(99.9)=164.13µs
     http_req_duration..............: avg=135.39ms min=21.52ms med=133.46ms max=371.16ms p(90)=169.56ms p(95)=181.3ms  p(99.9)=232.64ms
       { expected_response:true }...: avg=135.39ms min=21.52ms med=133.46ms max=371.16ms p(90)=169.56ms p(95)=181.3ms  p(99.9)=232.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44259
     http_req_receiving.............: avg=94.53µs  min=29.57µs med=84.23µs  max=105.61ms p(90)=118.41µs p(95)=131.28µs p(99.9)=799.23µs
     http_req_sending...............: avg=25.15µs  min=5.4µs   med=15.56µs  max=84.71ms  p(90)=21.3µs   p(95)=23.4µs   p(99.9)=622.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=135.27ms min=21.36ms med=133.35ms max=370.98ms p(90)=169.42ms p(95)=181.16ms p(99.9)=232.04ms
     http_reqs......................: 44259   361.267637/s
     iteration_duration.............: avg=135.91ms min=43.91ms med=133.76ms max=377.88ms p(90)=169.87ms p(95)=181.57ms p(99.9)=235.52ms
     iterations.....................: 44159   360.451379/s
     success_rate...................: 100.00% ✓ 44159      ✗ 0    
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

     checks.........................: 100.00% ✓ 95289      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=7.16µs   min=1.28µs  med=3.6µs    max=4.08ms   p(90)=5.2µs    p(95)=5.83µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=3.33µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=188.16ms min=18.69ms med=175.5ms  max=585.9ms  p(90)=220.25ms p(95)=299.41ms p(99.9)=535.08ms
       { expected_response:true }...: avg=188.16ms min=18.69ms med=175.5ms  max=585.9ms  p(90)=220.25ms p(95)=299.41ms p(99.9)=535.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31863
     http_req_receiving.............: avg=106.83µs min=35.61µs med=96.64µs  max=136.28ms p(90)=130.41µs p(95)=144.48µs p(99.9)=860.08µs
     http_req_sending...............: avg=30.78µs  min=6.16µs  med=17.96µs  max=118.27ms p(90)=23.44µs  p(95)=25.27µs  p(99.9)=754.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.02ms min=18.57ms med=175.37ms max=585.75ms p(90)=220.13ms p(95)=297.77ms p(99.9)=534.96ms
     http_reqs......................: 31863   260.656308/s
     iteration_duration.............: avg=189.01ms min=57.66ms med=175.87ms max=586.19ms p(90)=220.62ms p(95)=338.28ms p(99.9)=535.37ms
     iterations.....................: 31763   259.838255/s
     success_rate...................: 100.00% ✓ 31763      ✗ 0    
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

     checks.........................: 100.00% ✓ 86544      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=7.42µs   min=1.21µs  med=3.51µs   max=4.62ms   p(90)=5.01µs   p(95)=5.6µs    p(99.9)=1.8ms   
     http_req_connecting............: avg=3.62µs   min=0s      med=0s       max=4.57ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=207.19ms min=20.9ms  med=221ms    max=429.65ms p(90)=238.7ms  p(95)=243.82ms p(99.9)=312.19ms
       { expected_response:true }...: avg=207.19ms min=20.9ms  med=221ms    max=429.65ms p(90)=238.7ms  p(95)=243.82ms p(99.9)=312.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28948
     http_req_receiving.............: avg=99.33µs  min=34.58µs med=93.48µs  max=21.13ms  p(90)=127.15µs p(95)=140.59µs p(99.9)=442.78µs
     http_req_sending...............: avg=28.46µs  min=6.15µs  med=17.55µs  max=55.5ms   p(90)=23.08µs  p(95)=25.18µs  p(99.9)=547.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.06ms min=20.75ms med=220.88ms max=427.14ms p(90)=238.58ms p(95)=243.7ms  p(99.9)=312.08ms
     http_reqs......................: 28948   235.626236/s
     iteration_duration.............: avg=208.13ms min=61.08ms med=221.34ms max=440.75ms p(90)=238.98ms p(95)=244.14ms p(99.9)=314.44ms
     iterations.....................: 28848   234.812272/s
     success_rate...................: 100.00% ✓ 28848      ✗ 0    
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

