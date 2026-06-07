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
| hive-router | v0.0.49 | 1,582 | 1,606 | 1,574 | 0.6% |  |
| hotchocolate | 16.1.3-p.1 | 1,440 | 1,460 | 1,431 | 0.6% |  |
| cosmo | 0.307.0 | 1,161 | 1,178 | 1,158 | 0.6% |  |
| grafbase | 0.53.3 | 1,135 | 1,152 | 1,120 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.25 | 514 | 525 | 509 | 0.9% |  |
| apollo-router | v2.13.1 | 396 | 404 | 393 | 0.9% |  |
| hive-gateway | 2.5.25 | 236 | 239 | 233 | 0.7% |  |
| apollo-gateway | 2.13.3 | 232 | 233 | 231 | 0.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578955      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.3µs   min=972ns   med=2.24µs  max=5.29ms   p(90)=4.01µs   p(95)=4.93µs  p(99.9)=35.68µs
     http_req_connecting............: avg=567ns   min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.84ms min=14.7ms  med=30.57ms max=320.2ms  p(90)=36.74ms  p(95)=38.67ms p(99.9)=58.31ms
       { expected_response:true }...: avg=30.84ms min=14.7ms  med=30.57ms max=320.2ms  p(90)=36.74ms  p(95)=38.67ms p(99.9)=58.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193085
     http_req_receiving.............: avg=83.53µs min=27.47µs med=51.49µs max=81.09ms  p(90)=102.15µs p(95)=151.5µs p(99.9)=2.64ms 
     http_req_sending...............: avg=39.16µs min=5.09µs  med=9.34µs  max=291ms    p(90)=19.43µs  p(95)=53.88µs p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.72ms min=14.65ms med=30.47ms max=319.84ms p(90)=36.61ms  p(95)=38.53ms p(99.9)=57.14ms
     http_reqs......................: 193085  1582.758044/s
     iteration_duration.............: avg=31.08ms min=14.86ms med=30.79ms max=358.42ms p(90)=36.95ms  p(95)=38.89ms p(99.9)=58.68ms
     iterations.....................: 192985  1581.938323/s
     success_rate...................: 100.00% ✓ 192985      ✗ 0     
     vus............................: 11      min=0         max=50  
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

     checks.........................: 100.00% ✓ 526896      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.32µs   min=981ns   med=2.28µs   max=4.27ms   p(90)=4.01µs  p(95)=4.86µs  p(99.9)=31.78µs
     http_req_connecting............: avg=586ns    min=0s      med=0s       max=4.18ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=33.91ms  min=14.52ms med=32.71ms  max=483.28ms p(90)=41.63ms p(95)=45.29ms p(99.9)=83.88ms
       { expected_response:true }...: avg=33.91ms  min=14.52ms med=32.71ms  max=483.28ms p(90)=41.63ms p(95)=45.29ms p(99.9)=83.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175732
     http_req_receiving.............: avg=870.04µs min=51µs    med=120.83µs max=280.04ms p(90)=2.41ms  p(95)=3.56ms  p(99.9)=20.3ms 
     http_req_sending...............: avg=37.24µs  min=5.22µs  med=9.32µs   max=281.52ms p(90)=19.84µs p(95)=107.2µs p(99.9)=2.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=33ms     min=13.52ms med=31.88ms  max=481.33ms p(90)=40.49ms p(95)=44.03ms p(99.9)=79.48ms
     http_reqs......................: 175732  1440.363965/s
     iteration_duration.............: avg=34.15ms  min=14.75ms med=32.94ms  max=483.42ms p(90)=41.86ms p(95)=45.53ms p(99.9)=84.44ms
     iterations.....................: 175632  1439.544328/s
     success_rate...................: 100.00% ✓ 175632      ✗ 0     
     vus............................: 28      min=0         max=50  
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

     checks.........................: 100.00% ✓ 425001      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.78µs  min=1.04µs  med=2.68µs  max=4.12ms   p(90)=4.39µs   p(95)=5.19µs   p(99.9)=38.44µs
     http_req_connecting............: avg=721ns   min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.1ms  min=18.11ms med=41.52ms max=338.02ms p(90)=51.2ms   p(95)=54.34ms  p(99.9)=72.79ms
       { expected_response:true }...: avg=42.1ms  min=18.11ms med=41.52ms max=338.02ms p(90)=51.2ms   p(95)=54.34ms  p(99.9)=72.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141767
     http_req_receiving.............: avg=90.45µs min=28.39µs med=65.07µs max=128.08ms p(90)=111.84µs p(95)=141.02µs p(99.9)=1.95ms 
     http_req_sending...............: avg=28.42µs min=5.32µs  med=11.15µs max=57.66ms  p(90)=19.26µs  p(95)=25.01µs  p(99.9)=1.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.99ms min=18ms    med=41.42ms max=323.68ms p(90)=51.08ms  p(95)=54.2ms   p(99.9)=72.35ms
     http_reqs......................: 141767  1161.601104/s
     iteration_duration.............: avg=42.34ms min=18.35ms med=41.74ms max=357.25ms p(90)=51.42ms  p(95)=54.55ms  p(99.9)=73.13ms
     iterations.....................: 141667  1160.78173/s
     success_rate...................: 100.00% ✓ 141667      ✗ 0     
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

     checks.........................: 100.00% ✓ 415317      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.29µs  min=982ns   med=2.3µs   max=3.37ms   p(90)=4.71µs   p(95)=5.86µs   p(99.9)=49.11µs
     http_req_connecting............: avg=327ns   min=0s      med=0s      max=2.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.06ms min=15.01ms med=42.62ms max=350.7ms  p(90)=52.34ms  p(95)=55.48ms  p(99.9)=77.2ms 
       { expected_response:true }...: avg=43.06ms min=15.01ms med=42.62ms max=350.7ms  p(90)=52.34ms  p(95)=55.48ms  p(99.9)=77.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 138539
     http_req_receiving.............: avg=134µs   min=29.71µs med=60.41µs max=253.22ms p(90)=130.94µs p(95)=204.12µs p(99.9)=3.54ms 
     http_req_sending...............: avg=36.07µs min=5.36µs  med=10.04µs max=90.56ms  p(90)=23.84µs  p(95)=111.39µs p(99.9)=1.93ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.89ms min=14.88ms med=42.5ms  max=102.81ms p(90)=52.18ms  p(95)=55.31ms  p(99.9)=76.63ms
     http_reqs......................: 138539  1135.467399/s
     iteration_duration.............: avg=43.33ms min=18.32ms med=42.87ms max=380.27ms p(90)=52.57ms  p(95)=55.71ms  p(99.9)=77.68ms
     iterations.....................: 138439  1134.647798/s
     success_rate...................: 100.00% ✓ 138439      ✗ 0     
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

     checks.........................: 100.00% ✓ 188586     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   618 kB/s
     http_req_blocked...............: avg=4.21µs  min=1.21µs  med=3.21µs  max=2.18ms   p(90)=4.84µs   p(95)=5.52µs   p(99.9)=48.43µs 
     http_req_connecting............: avg=754ns   min=0s      med=0s      max=2.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.08ms min=18.87ms med=99.37ms max=335.81ms p(90)=125.63ms p(95)=136.55ms p(99.9)=232.23ms
       { expected_response:true }...: avg=95.08ms min=18.87ms med=99.37ms max=335.81ms p(90)=125.63ms p(95)=136.55ms p(99.9)=232.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62962
     http_req_receiving.............: avg=94.81µs min=31.36µs med=79.6µs  max=179.49ms p(90)=116.88µs p(95)=131.36µs p(99.9)=928.35µs
     http_req_sending...............: avg=28.93µs min=5.64µs  med=14.14µs max=130.58ms p(90)=20.77µs  p(95)=23.21µs  p(99.9)=738.59µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.96ms min=18.68ms med=99.26ms max=335.47ms p(90)=125.5ms  p(95)=136.43ms p(99.9)=231.81ms
     http_reqs......................: 62962   514.318651/s
     iteration_duration.............: avg=95.46ms min=27.52ms med=99.65ms max=385.53ms p(90)=125.88ms p(95)=136.87ms p(99.9)=233.57ms
     iterations.....................: 62862   513.501779/s
     success_rate...................: 100.00% ✓ 62862      ✗ 0    
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

     checks.........................: 100.00% ✓ 145251     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=5.87µs   min=1.23µs  med=3.52µs   max=4.13ms   p(90)=5.12µs   p(95)=5.76µs   p(99.9)=223.37µs
     http_req_connecting............: avg=2.11µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=98.57µs 
     http_req_duration..............: avg=123.46ms min=18ms    med=121.41ms max=342.38ms p(90)=153.46ms p(95)=163.5ms  p(99.9)=206.57ms
       { expected_response:true }...: avg=123.46ms min=18ms    med=121.41ms max=342.38ms p(90)=153.46ms p(95)=163.5ms  p(99.9)=206.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48517
     http_req_receiving.............: avg=92.7µs   min=32.37µs med=85.99µs  max=31.41ms  p(90)=119.13µs p(95)=132.25µs p(99.9)=714.35µs
     http_req_sending...............: avg=24.49µs  min=5.94µs  med=16.28µs  max=96.13ms  p(90)=22.14µs  p(95)=24.32µs  p(99.9)=620.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.34ms min=17.89ms med=121.29ms max=341.2ms  p(90)=153.36ms p(95)=163.37ms p(99.9)=206.36ms
     http_reqs......................: 48517   396.140246/s
     iteration_duration.............: avg=123.95ms min=42.35ms med=121.72ms max=357.55ms p(90)=153.79ms p(95)=163.82ms p(99.9)=209.97ms
     iterations.....................: 48417   395.323748/s
     success_rate...................: 100.00% ✓ 48417      ✗ 0    
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

     checks.........................: 100.00% ✓ 86535      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=5.94µs   min=1.29µs  med=3.56µs   max=3.61ms   p(90)=5.08µs   p(95)=5.73µs   p(99.9)=730.14µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=710.36µs
     http_req_duration..............: avg=207.18ms min=19.51ms med=192.61ms max=632.37ms p(90)=242.65ms p(95)=446.12ms p(99.9)=567.92ms
       { expected_response:true }...: avg=207.18ms min=19.51ms med=192.61ms max=632.37ms p(90)=242.65ms p(95)=446.12ms p(99.9)=567.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28945
     http_req_receiving.............: avg=132.42µs min=34.42µs med=97.02µs  max=84.37ms  p(90)=129.9µs  p(95)=143.86µs p(99.9)=1.41ms  
     http_req_sending...............: avg=35.33µs  min=5.82µs  med=18.23µs  max=109.76ms p(90)=23.42µs  p(95)=25.34µs  p(99.9)=678.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.01ms min=19.34ms med=192.48ms max=632.25ms p(90)=242.51ms p(95)=445.98ms p(99.9)=567.85ms
     http_reqs......................: 28945   236.584862/s
     iteration_duration.............: avg=208.14ms min=57.7ms  med=193.06ms max=632.65ms p(90)=243.14ms p(95)=447.1ms  p(99.9)=568.24ms
     iterations.....................: 28845   235.767502/s
     success_rate...................: 100.00% ✓ 28845      ✗ 0    
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

     checks.........................: 100.00% ✓ 85446      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.06µs   min=1.18µs  med=3.47µs   max=3.95ms   p(90)=4.85µs   p(95)=5.44µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.39µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=209.84ms min=20.46ms med=219.08ms max=433.97ms p(90)=253.19ms p(95)=260.26ms p(99.9)=326.34ms
       { expected_response:true }...: avg=209.84ms min=20.46ms med=219.08ms max=433.97ms p(90)=253.19ms p(95)=260.26ms p(99.9)=326.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28582
     http_req_receiving.............: avg=104.74µs min=34.37µs med=91.04µs  max=155.61ms p(90)=124.42µs p(95)=137.66µs p(99.9)=502.59µs
     http_req_sending...............: avg=22.71µs  min=6.1µs   med=16.77µs  max=44.3ms   p(90)=22.11µs  p(95)=24.11µs  p(99.9)=569.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.71ms min=20.31ms med=218.93ms max=433.32ms p(90)=253.07ms p(95)=260.12ms p(99.9)=325.9ms 
     http_reqs......................: 28582   232.612632/s
     iteration_duration.............: avg=210.81ms min=39.55ms med=219.81ms max=460.67ms p(90)=253.5ms  p(95)=260.57ms p(99.9)=333.77ms
     iterations.....................: 28482   231.798789/s
     success_rate...................: 100.00% ✓ 28482      ✗ 0    
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

