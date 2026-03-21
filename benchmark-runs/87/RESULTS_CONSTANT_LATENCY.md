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
| hive-router | v0.0.41 | 1,570 | 1,589 | 1,555 | 0.7% |  |
| hotchocolate | 16.0.0-p.11.53 | 1,414 | 1,431 | 1,393 | 0.7% |  |
| cosmo | 0.291.0 | 1,172 | 1,181 | 1,169 | 0.4% | non-compatible response (4 across 3/9 runs) |
| grafbase | 0.53.2 | 1,123 | 1,151 | 1,115 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.6 | 487 | 501 | 481 | 1.4% |  |
| apollo-router | v2.12.0 | 368 | 379 | 363 | 1.5% |  |
| hive-gateway | 2.5.6 | 257 | 261 | 255 | 0.8% |  |
| apollo-gateway | 2.13.2 | 234 | 237 | 232 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 574245      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 230 MB  1.9 MB/s
     http_req_blocked...............: avg=3.13µs  min=1µs     med=2.31µs  max=10.3ms   p(90)=4.22µs   p(95)=5.13µs  p(99.9)=35µs   
     http_req_connecting............: avg=252ns   min=0s      med=0s      max=2.53ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=31.09ms min=13.98ms med=30.87ms max=347.77ms p(90)=36.92ms  p(95)=38.85ms p(99.9)=57.18ms
       { expected_response:true }...: avg=31.09ms min=13.98ms med=30.87ms max=347.77ms p(90)=36.92ms  p(95)=38.85ms p(99.9)=57.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 191515
     http_req_receiving.............: avg=83.17µs min=27.39µs med=51.53µs max=75.14ms  p(90)=105.06µs p(95)=155.5µs p(99.9)=2.66ms 
     http_req_sending...............: avg=36µs    min=5.05µs  med=9.53µs  max=238.67ms p(90)=20.2µs   p(95)=83.97µs p(99.9)=1.92ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.97ms min=13.88ms med=30.76ms max=347.17ms p(90)=36.8ms   p(95)=38.72ms p(99.9)=55.2ms 
     http_reqs......................: 191515  1570.126439/s
     iteration_duration.............: avg=31.33ms min=14.24ms med=31.09ms max=357.2ms  p(90)=37.14ms  p(95)=39.07ms p(99.9)=57.5ms 
     iterations.....................: 191415  1569.306594/s
     success_rate...................: 100.00% ✓ 191415      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.53)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 517521      ✗ 0     
     data_received..................: 15 GB   124 MB/s
     data_sent......................: 207 MB  1.7 MB/s
     http_req_blocked...............: avg=3.28µs   min=1.02µs  med=2.36µs   max=3.79ms   p(90)=4µs     p(95)=4.77µs  p(99.9)=35.55µs 
     http_req_connecting............: avg=510ns    min=0s      med=0s       max=3.75ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=34.52ms  min=14.27ms med=32.93ms  max=483.66ms p(90)=42.88ms p(95)=47.27ms p(99.9)=194.93ms
       { expected_response:true }...: avg=34.52ms  min=14.27ms med=32.93ms  max=483.66ms p(90)=42.88ms p(95)=47.27ms p(99.9)=194.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 172607
     http_req_receiving.............: avg=583.03µs min=49.18µs med=114.01µs max=146.16ms p(90)=1.59ms  p(95)=2.46ms  p(99.9)=14.71ms 
     http_req_sending...............: avg=36.95µs  min=5.31µs  med=9.83µs   max=248.19ms p(90)=19.49µs p(95)=63µs    p(99.9)=1.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=33.9ms   min=14.18ms med=32.34ms  max=483.55ms p(90)=42.11ms p(95)=46.44ms p(99.9)=185.8ms 
     http_reqs......................: 172607  1414.634331/s
     iteration_duration.............: avg=34.77ms  min=14.42ms med=33.15ms  max=483.86ms p(90)=43.1ms  p(95)=47.5ms  p(99.9)=267.43ms
     iterations.....................: 172507  1413.814762/s
     success_rate...................: 100.00% ✓ 172507      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429141      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.28µs  min=1.02µs  med=2.24µs  max=4.24ms   p(90)=3.9µs    p(95)=4.69µs   p(99.9)=36.03µs
     http_req_connecting............: avg=620ns   min=0s      med=0s      max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.7ms  min=19.38ms med=41.09ms max=346.16ms p(90)=50.74ms  p(95)=53.75ms  p(99.9)=70.63ms
       { expected_response:true }...: avg=41.7ms  min=19.38ms med=41.09ms max=346.16ms p(90)=50.74ms  p(95)=53.75ms  p(99.9)=70.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143147
     http_req_receiving.............: avg=82.78µs min=27.08µs med=61.35µs max=25.3ms   p(90)=107.03µs p(95)=133.71µs p(99.9)=1.9ms  
     http_req_sending...............: avg=27.96µs min=5.05µs  med=10.29µs max=116.77ms p(90)=18.26µs  p(95)=23.01µs  p(99.9)=1.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.59ms min=19.22ms med=40.99ms max=345.99ms p(90)=50.63ms  p(95)=53.63ms  p(99.9)=70.03ms
     http_reqs......................: 143147  1172.962033/s
     iteration_duration.............: avg=41.93ms min=20.67ms med=41.3ms  max=358.37ms p(90)=50.94ms  p(95)=53.95ms  p(99.9)=70.94ms
     iterations.....................: 143047  1172.142622/s
     success_rate...................: 100.00% ✓ 143047      ✗ 0     
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

     checks.........................: 100.00% ✓ 410970      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 165 MB  1.3 MB/s
     http_req_blocked...............: avg=3.16µs  min=961ns   med=2.25µs  max=6.18ms   p(90)=4.54µs   p(95)=5.7µs    p(99.9)=46.99µs
     http_req_connecting............: avg=276ns   min=0s      med=0s      max=1.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.52ms min=15.61ms med=43.05ms max=336.57ms p(90)=53.03ms  p(95)=56.23ms  p(99.9)=78.74ms
       { expected_response:true }...: avg=43.52ms min=15.61ms med=43.05ms max=336.57ms p(90)=53.03ms  p(95)=56.23ms  p(99.9)=78.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137090
     http_req_receiving.............: avg=98.06µs min=29.4µs  med=59.52µs max=213.69ms p(90)=129.73µs p(95)=196.27µs p(99.9)=3ms    
     http_req_sending...............: avg=36.35µs min=5.18µs  med=9.84µs  max=84.13ms  p(90)=23.21µs  p(95)=106.41µs p(99.9)=2.05ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.39ms min=15.51ms med=42.92ms max=321.59ms p(90)=52.88ms  p(95)=56.07ms  p(99.9)=78.29ms
     http_reqs......................: 137090  1123.364012/s
     iteration_duration.............: avg=43.79ms min=16.44ms med=43.29ms max=345.7ms  p(90)=53.26ms  p(95)=56.46ms  p(99.9)=79.37ms
     iterations.....................: 136990  1122.544576/s
     success_rate...................: 100.00% ✓ 136990      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 178779     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 72 MB   585 kB/s
     http_req_blocked...............: avg=4.38µs   min=1.1µs   med=3.14µs  max=3.19ms   p(90)=4.7µs    p(95)=5.31µs   p(99.9)=59.17µs 
     http_req_connecting............: avg=944ns    min=0s      med=0s      max=3.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=100.33ms min=23.18ms med=98.08ms max=346.04ms p(90)=117.56ms p(95)=126.36ms p(99.9)=233.04ms
       { expected_response:true }...: avg=100.33ms min=23.18ms med=98.08ms max=346.04ms p(90)=117.56ms p(95)=126.36ms p(99.9)=233.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59693
     http_req_receiving.............: avg=88.34µs  min=31.49µs med=79.3µs  max=37.81ms  p(90)=115.19µs p(95)=128.5µs  p(99.9)=907.35µs
     http_req_sending...............: avg=21.77µs  min=5.56µs  med=14.23µs max=50.81ms  p(90)=20.75µs  p(95)=23.06µs  p(99.9)=684.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.22ms min=23.01ms med=97.97ms max=345.65ms p(90)=117.46ms p(95)=126.22ms p(99.9)=232.86ms
     http_reqs......................: 59693   487.090971/s
     iteration_duration.............: avg=100.72ms min=37.11ms med=98.32ms max=371.37ms p(90)=117.81ms p(95)=126.66ms p(99.9)=236.47ms
     iterations.....................: 59593   486.274977/s
     success_rate...................: 100.00% ✓ 59593      ✗ 0    
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

     checks.........................: 100.00% ✓ 135057     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   442 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.25µs  med=3.38µs   max=4.16ms   p(90)=4.86µs   p(95)=5.44µs   p(99.9)=935.17µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=767.63µs
     http_req_duration..............: avg=132.78ms min=21.7ms  med=130.57ms max=392.68ms p(90)=166.48ms p(95)=177.34ms p(99.9)=225.81ms
       { expected_response:true }...: avg=132.78ms min=21.7ms  med=130.57ms max=392.68ms p(90)=166.48ms p(95)=177.34ms p(99.9)=225.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45119
     http_req_receiving.............: avg=92.41µs  min=32.48µs med=85.59µs  max=79.64ms  p(90)=118.83µs p(95)=131.16µs p(99.9)=817.96µs
     http_req_sending...............: avg=28.71µs  min=5.99µs  med=15.87µs  max=109.19ms p(90)=21.73µs  p(95)=23.85µs  p(99.9)=623.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.66ms min=21.6ms  med=130.45ms max=392.33ms p(90)=166.36ms p(95)=177.22ms p(99.9)=225.71ms
     http_reqs......................: 45119   368.376506/s
     iteration_duration.............: avg=133.3ms  min=46.01ms med=130.87ms max=407.35ms p(90)=166.81ms p(95)=177.67ms p(99.9)=229.73ms
     iterations.....................: 45019   367.560051/s
     success_rate...................: 100.00% ✓ 45019      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94227      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=5.32µs   min=1.28µs  med=3.6µs    max=3.51ms   p(90)=5.17µs   p(95)=5.8µs    p(99.9)=511.33µs
     http_req_connecting............: avg=1.39µs   min=0s      med=0s       max=2.44ms   p(90)=0s       p(95)=0s       p(99.9)=434.82µs
     http_req_duration..............: avg=190.36ms min=18.84ms med=176.08ms max=629.87ms p(90)=237.93ms p(95)=379.23ms p(99.9)=546.09ms
       { expected_response:true }...: avg=190.36ms min=18.84ms med=176.08ms max=629.87ms p(90)=237.93ms p(95)=379.23ms p(99.9)=546.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31509
     http_req_receiving.............: avg=105.08µs min=35.11µs med=96.64µs  max=43.97ms  p(90)=130.47µs p(95)=143.8µs  p(99.9)=680.53µs
     http_req_sending...............: avg=35.97µs  min=6.29µs  med=17.96µs  max=89.19ms  p(90)=23.62µs  p(95)=25.53µs  p(99.9)=562.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.21ms min=18.69ms med=175.97ms max=629.78ms p(90)=237.8ms  p(95)=379.11ms p(99.9)=545.99ms
     http_reqs......................: 31509   257.428606/s
     iteration_duration.............: avg=191.19ms min=49.74ms med=176.59ms max=630.08ms p(90)=238.36ms p(95)=380.39ms p(99.9)=546.49ms
     iterations.....................: 31409   256.611606/s
     success_rate...................: 100.00% ✓ 31409      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86214      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   282 kB/s
     http_req_blocked...............: avg=6.67µs   min=1.3µs   med=3.48µs   max=3.68ms   p(90)=4.93µs   p(95)=5.52µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.92µs   min=0s      med=0s       max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=208.02ms min=20.86ms med=206.77ms max=389.3ms  p(90)=224.76ms p(95)=231.36ms p(99.9)=296.92ms
       { expected_response:true }...: avg=208.02ms min=20.86ms med=206.77ms max=389.3ms  p(90)=224.76ms p(95)=231.36ms p(99.9)=296.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28838
     http_req_receiving.............: avg=132.9µs  min=33.68µs med=93.51µs  max=160.68ms p(90)=126.88µs p(95)=139.55µs p(99.9)=713.45µs
     http_req_sending...............: avg=21.17µs  min=6.08µs  med=17.44µs  max=10.19ms  p(90)=22.71µs  p(95)=24.74µs  p(99.9)=566.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.87ms min=20.69ms med=206.65ms max=333.35ms p(90)=224.64ms p(95)=231.18ms p(99.9)=294.76ms
     http_reqs......................: 28838   234.75511/s
     iteration_duration.............: avg=208.95ms min=73.21ms med=207.1ms  max=399.35ms p(90)=225.07ms p(95)=231.7ms  p(99.9)=301.8ms 
     iterations.....................: 28738   233.941062/s
     success_rate...................: 100.00% ✓ 28738      ✗ 0    
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

