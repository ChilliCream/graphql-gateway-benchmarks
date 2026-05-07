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
| hive-router | v0.0.49 | 1,584 | 1,611 | 1,573 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,449 | 1,461 | 1,443 | 0.4% |  |
| cosmo | 0.307.0 | 1,133 | 1,150 | 1,126 | 0.7% | non-compatible response (3 across 2/9 runs) |
| grafbase | 0.53.3 | 1,128 | 1,145 | 1,120 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 505 | 514 | 500 | 0.9% |  |
| apollo-router | v2.13.1 | 381 | 389 | 372 | 1.5% |  |
| hive-gateway | 2.5.25 | 239 | 245 | 236 | 1.2% |  |
| apollo-gateway | 2.13.3 | 234 | 235 | 232 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579594      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.43µs  min=972ns   med=2.49µs  max=4.15ms   p(90)=4.35µs  p(95)=5.3µs    p(99.9)=37.96µs
     http_req_connecting............: avg=456ns   min=0s      med=0s      max=4.09ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.8ms  min=14.08ms med=30.52ms max=328.77ms p(90)=36.59ms p(95)=38.58ms  p(99.9)=58.9ms 
       { expected_response:true }...: avg=30.8ms  min=14.08ms med=30.52ms max=328.77ms p(90)=36.59ms p(95)=38.58ms  p(99.9)=58.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 193298
     http_req_receiving.............: avg=88.37µs min=27.99µs med=54.37µs max=211.21ms p(90)=105.8µs p(95)=150.15µs p(99.9)=2.83ms 
     http_req_sending...............: avg=36.78µs min=5.17µs  med=10.04µs max=294.57ms p(90)=20.46µs p(95)=38.61µs  p(99.9)=1.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.68ms min=13.96ms med=30.42ms max=328.04ms p(90)=36.46ms p(95)=38.43ms  p(99.9)=57.75ms
     http_reqs......................: 193298  1584.33945/s
     iteration_duration.............: avg=31.05ms min=14.36ms med=30.75ms max=354.34ms p(90)=36.81ms p(95)=38.8ms   p(99.9)=59.23ms
     iterations.....................: 193198  1583.519815/s
     success_rate...................: 100.00% ✓ 193198      ✗ 0     
     vus............................: 32      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 530298      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=2.99µs   min=972ns   med=2.16µs   max=2.95ms   p(90)=3.94µs  p(95)=4.81µs   p(99.9)=33.77µs
     http_req_connecting............: avg=356ns    min=0s      med=0s       max=2.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.69ms  min=13.51ms med=32.65ms  max=529.65ms p(90)=41.35ms p(95)=44.51ms  p(99.9)=83.86ms
       { expected_response:true }...: avg=33.69ms  min=13.51ms med=32.65ms  max=529.65ms p(90)=41.35ms p(95)=44.51ms  p(99.9)=83.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176866
     http_req_receiving.............: avg=794.43µs min=50.25µs med=116.44µs max=80.48ms  p(90)=2.27ms  p(95)=3.45ms   p(99.9)=18.65ms
     http_req_sending...............: avg=37.88µs  min=4.97µs  med=9.19µs   max=149.66ms p(90)=19.83µs p(95)=106.68µs p(99.9)=2.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.86ms  min=13.43ms med=31.85ms  max=527.81ms p(90)=40.22ms p(95)=43.39ms  p(99.9)=81.72ms
     http_reqs......................: 176866  1449.391621/s
     iteration_duration.............: avg=33.93ms  min=13.72ms med=32.87ms  max=529.85ms p(90)=41.57ms p(95)=44.73ms  p(99.9)=84.15ms
     iterations.....................: 176766  1448.572135/s
     success_rate...................: 100.00% ✓ 176766      ✗ 0     
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

     checks.........................: 100.00% ✓ 414576      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.6µs   min=1.01µs  med=2.1µs   max=5.56ms   p(90)=3.65µs   p(95)=4.39µs   p(99.9)=33.35µs
     http_req_connecting............: avg=1.11µs  min=0s      med=0s      max=5.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.18ms min=15.72ms med=42.53ms max=312.66ms p(90)=52.62ms  p(95)=55.83ms  p(99.9)=74.13ms
       { expected_response:true }...: avg=43.18ms min=15.72ms med=42.53ms max=312.66ms p(90)=52.62ms  p(95)=55.83ms  p(99.9)=74.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138292
     http_req_receiving.............: avg=81.95µs min=27.2µs  med=61.87µs max=54.47ms  p(90)=104.47µs p(95)=129.44µs p(99.9)=1.83ms 
     http_req_sending...............: avg=26.22µs min=5.18µs  med=10.01µs max=197.6ms  p(90)=17.41µs  p(95)=21.88µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.07ms min=15.61ms med=42.43ms max=309.32ms p(90)=52.5ms   p(95)=55.7ms   p(99.9)=73.63ms
     http_reqs......................: 138292  1133.278517/s
     iteration_duration.............: avg=43.41ms min=18.69ms med=42.73ms max=355.59ms p(90)=52.82ms  p(95)=56.03ms  p(99.9)=74.77ms
     iterations.....................: 138192  1132.459035/s
     success_rate...................: 100.00% ✓ 138192      ✗ 0     
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

     checks.........................: 100.00% ✓ 412653      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.31µs   min=982ns   med=2.22µs  max=9.23ms   p(90)=4.66µs   p(95)=5.81µs   p(99.9)=48.69µs
     http_req_connecting............: avg=361ns    min=0s      med=0s      max=2.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.34ms  min=15.73ms med=42.91ms max=345.66ms p(90)=52.59ms  p(95)=55.69ms  p(99.9)=79.78ms
       { expected_response:true }...: avg=43.34ms  min=15.73ms med=42.91ms max=345.66ms p(90)=52.59ms  p(95)=55.69ms  p(99.9)=79.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137651
     http_req_receiving.............: avg=133.96µs min=27.8µs  med=60.03µs max=237.57ms p(90)=133.11µs p(95)=217.76µs p(99.9)=4.16ms 
     http_req_sending...............: avg=37.94µs  min=5.05µs  med=10.04µs max=137.38ms p(90)=24.29µs  p(95)=113.07µs p(99.9)=2.37ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.17ms  min=15.66ms med=42.78ms max=158.11ms p(90)=52.42ms  p(95)=55.52ms  p(99.9)=79.21ms
     http_reqs......................: 137651  1128.074467/s
     iteration_duration.............: avg=43.61ms  min=15.97ms med=43.15ms max=371.83ms p(90)=52.82ms  p(95)=55.93ms  p(99.9)=80.54ms
     iterations.....................: 137551  1127.254949/s
     success_rate...................: 100.00% ✓ 137551      ✗ 0     
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

     checks.........................: 100.00% ✓ 185355     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   607 kB/s
     http_req_blocked...............: avg=5.01µs  min=1.15µs  med=3.11µs  max=4.08ms   p(90)=4.7µs    p(95)=5.35µs   p(99.9)=50.48µs 
     http_req_connecting............: avg=1.65µs  min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.75ms min=20.89ms med=94.39ms max=346.57ms p(90)=115.19ms p(95)=125.53ms p(99.9)=224.72ms
       { expected_response:true }...: avg=96.75ms min=20.89ms med=94.39ms max=346.57ms p(90)=115.19ms p(95)=125.53ms p(99.9)=224.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61885
     http_req_receiving.............: avg=94.6µs  min=31.76µs med=79.05µs max=252.57ms p(90)=115.72µs p(95)=129.28µs p(99.9)=903.58µs
     http_req_sending...............: avg=27.18µs min=4.97µs  med=14.2µs  max=129.97ms p(90)=20.81µs  p(95)=23.24µs  p(99.9)=653.14µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.63ms min=20.7ms  med=94.28ms max=346ms    p(90)=115.08ms p(95)=125.35ms p(99.9)=224.09ms
     http_reqs......................: 61885   505.310332/s
     iteration_duration.............: avg=97.11ms min=36.45ms med=94.64ms max=378.9ms  p(90)=115.44ms p(95)=125.83ms p(99.9)=227.81ms
     iterations.....................: 61785   504.493801/s
     success_rate...................: 100.00% ✓ 61785      ✗ 0    
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

     checks.........................: 100.00% ✓ 139794     ✗ 0    
     data_received..................: 4.1 GB  33 MB/s
     data_sent......................: 56 MB   458 kB/s
     http_req_blocked...............: avg=4.43µs   min=1.17µs  med=3.31µs   max=2.44ms   p(90)=4.79µs   p(95)=5.36µs   p(99.9)=155.61µs
     http_req_connecting............: avg=922ns    min=0s      med=0s       max=2.37ms   p(90)=0s       p(95)=0s       p(99.9)=120.96µs
     http_req_duration..............: avg=128.3ms  min=20.25ms med=126.55ms max=385.29ms p(90)=159.83ms p(95)=170.39ms p(99.9)=218.78ms
       { expected_response:true }...: avg=128.3ms  min=20.25ms med=126.55ms max=385.29ms p(90)=159.83ms p(95)=170.39ms p(99.9)=218.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46698
     http_req_receiving.............: avg=92.69µs  min=31.48µs med=85.91µs  max=79.71ms  p(90)=119.27µs p(95)=131.53µs p(99.9)=619.65µs
     http_req_sending...............: avg=26.3µs   min=5.93µs  med=16.32µs  max=105.44ms p(90)=21.96µs  p(95)=23.93µs  p(99.9)=603.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.18ms min=20.09ms med=126.44ms max=384.91ms p(90)=159.71ms p(95)=170.25ms p(99.9)=218.24ms
     http_reqs......................: 46698   381.198659/s
     iteration_duration.............: avg=128.8ms  min=33.31ms med=126.83ms max=395.23ms p(90)=160.11ms p(95)=170.69ms p(99.9)=221.45ms
     iterations.....................: 46598   380.382352/s
     success_rate...................: 100.00% ✓ 46598      ✗ 0    
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

     checks.........................: 100.00% ✓ 87429      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=5.56µs   min=1.31µs  med=3.62µs   max=2.4ms    p(90)=5.09µs   p(95)=5.72µs   p(99.9)=827.13µs
     http_req_connecting............: avg=1.66µs   min=0s      med=0s       max=2.37ms   p(90)=0s       p(95)=0s       p(99.9)=723.37µs
     http_req_duration..............: avg=205.05ms min=17.83ms med=191.02ms max=645.58ms p(90)=246.76ms p(95)=408.97ms p(99.9)=538.9ms 
       { expected_response:true }...: avg=205.05ms min=17.83ms med=191.02ms max=645.58ms p(90)=246.76ms p(95)=408.97ms p(99.9)=538.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29243
     http_req_receiving.............: avg=102.9µs  min=37.11µs med=98.16µs  max=23.71ms  p(90)=131.58µs p(95)=145.65µs p(99.9)=578.05µs
     http_req_sending...............: avg=27.22µs  min=6.13µs  med=17.79µs  max=55.29ms  p(90)=23.12µs  p(95)=25µs     p(99.9)=486.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.92ms min=17.7ms  med=190.89ms max=645.15ms p(90)=246.64ms p(95)=408.86ms p(99.9)=538.81ms
     http_reqs......................: 29243   239.308561/s
     iteration_duration.............: avg=205.98ms min=70.46ms med=191.42ms max=651.44ms p(90)=247.24ms p(95)=409.48ms p(99.9)=540.18ms
     iterations.....................: 29143   238.490216/s
     success_rate...................: 100.00% ✓ 29143      ✗ 0    
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

     checks.........................: 100.00% ✓ 86037      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=7.27µs   min=1.27µs  med=3.31µs   max=4.51ms   p(90)=4.59µs   p(95)=5.14µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=208.4ms  min=21.46ms med=212.57ms max=416.18ms p(90)=224.74ms p(95)=231.28ms p(99.9)=299.2ms 
       { expected_response:true }...: avg=208.4ms  min=21.46ms med=212.57ms max=416.18ms p(90)=224.74ms p(95)=231.28ms p(99.9)=299.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28779
     http_req_receiving.............: avg=94.12µs  min=33.09µs med=90.41µs  max=1.94ms   p(90)=122.46µs p(95)=134.65µs p(99.9)=524.93µs
     http_req_sending...............: avg=28.79µs  min=6.21µs  med=16.49µs  max=70.01ms  p(90)=21.58µs  p(95)=23.58µs  p(99.9)=469.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.28ms min=21.3ms  med=212.46ms max=415.82ms p(90)=224.62ms p(95)=231.15ms p(99.9)=299.1ms 
     http_reqs......................: 28779   234.300328/s
     iteration_duration.............: avg=209.34ms min=57.71ms med=212.84ms max=450.12ms p(90)=225ms    p(95)=231.58ms p(99.9)=310.03ms
     iterations.....................: 28679   233.486192/s
     success_rate...................: 100.00% ✓ 28679      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

