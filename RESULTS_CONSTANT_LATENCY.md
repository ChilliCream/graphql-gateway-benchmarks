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
| fusion-nightly | 16.7.0-p.6 | 1,883 | 1,927 | 1,876 | 0.9% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 1,879 | 1,926 | 1,872 | 1.0% |  |
| fusion | 16.6.6 | 1,878 | 1,939 | 1,873 | 1.2% |  |
| hive-router | v0.0.84 | 1,819 | 1,897 | 1,813 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 1,790 | 1,846 | 1,781 | 1.2% |  |
| grafbase | 0.53.5 | 1,313 | 1,338 | 1,305 | 0.8% |  |
| cosmo | 0.334.0 | 1,178 | 1,224 | 1,172 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 567 | 589 | 562 | 1.4% |  |
| apollo-router | v2.16.1 | 399 | 416 | 396 | 1.8% |  |
| apollo-gateway | 2.14.3 | 258 | 262 | 257 | 0.6% |  |
| hive-gateway | 2.10.8 | 253 | 261 | 253 | 1.1% |  |
| feddi | 5ff8b6165878 | 17 | 17 | 16 | 2.9% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688749      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.78µs  min=861ns   med=1.97µs  max=3.95ms   p(90)=3.69µs   p(95)=4.45µs  p(99.9)=29.49µs
     http_req_connecting............: avg=386ns   min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.91ms min=17.04ms med=25.33ms max=320.93ms p(90)=30.26ms  p(95)=32.07ms p(99.9)=50.08ms
       { expected_response:true }...: avg=25.91ms min=17.04ms med=25.33ms max=320.93ms p(90)=30.26ms  p(95)=32.07ms p(99.9)=50.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229683
     http_req_receiving.............: avg=309µs   min=48.71µs med=94µs    max=73.24ms  p(90)=780.24µs p(95)=1.26ms  p(99.9)=8.37ms 
     http_req_sending...............: avg=32.42µs min=4.49µs  med=8.47µs  max=200.58ms p(90)=18.62µs  p(95)=33.51µs p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.57ms min=16.94ms med=25ms    max=320.56ms p(90)=29.84ms  p(95)=31.61ms p(99.9)=48.42ms
     http_reqs......................: 229683  1883.685917/s
     iteration_duration.............: avg=26.12ms min=17.22ms med=25.53ms max=331.01ms p(90)=30.46ms  p(95)=32.27ms p(99.9)=50.67ms
     iterations.....................: 229583  1882.865793/s
     success_rate...................: 100.00% ✓ 229583      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687111      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.04µs   min=842ns   med=1.96µs  max=6.89ms   p(90)=3.63µs  p(95)=4.36µs  p(99.9)=29.54µs
     http_req_connecting............: avg=548ns    min=0s      med=0s      max=6.71ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.96ms  min=17.24ms med=25.41ms max=286.02ms p(90)=30.15ms p(95)=31.92ms p(99.9)=49.09ms
       { expected_response:true }...: avg=25.96ms  min=17.24ms med=25.41ms max=286.02ms p(90)=30.15ms p(95)=31.92ms p(99.9)=49.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229137
     http_req_receiving.............: avg=396.21µs min=49.69µs med=90.01µs max=174.26ms p(90)=1.14ms  p(95)=1.87ms  p(99.9)=12.07ms
     http_req_sending...............: avg=32.89µs  min=4.53µs  med=8.27µs  max=182.62ms p(90)=18.13µs p(95)=31.81µs p(99.9)=1.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.54ms  min=17.14ms med=25.02ms max=285.63ms p(90)=29.56ms p(95)=31.26ms p(99.9)=47.39ms
     http_reqs......................: 229137  1879.414083/s
     iteration_duration.............: avg=26.18ms  min=17.42ms med=25.62ms max=305.84ms p(90)=30.35ms p(95)=32.11ms p(99.9)=49.43ms
     iterations.....................: 229037  1878.593869/s
     success_rate...................: 100.00% ✓ 229037      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686769      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.4µs    min=852ns   med=1.96µs  max=8.95ms   p(90)=3.56µs   p(95)=4.31µs  p(99.9)=32.35µs
     http_req_connecting............: avg=1µs      min=0s      med=0s      max=8.79ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.99ms  min=17.44ms med=25.37ms max=303.82ms p(90)=30.37ms  p(95)=32.27ms p(99.9)=50.26ms
       { expected_response:true }...: avg=25.99ms  min=17.44ms med=25.37ms max=303.82ms p(90)=30.37ms  p(95)=32.27ms p(99.9)=50.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229023
     http_req_receiving.............: avg=331.46µs min=51.37µs med=96.92µs max=251.38ms p(90)=845.67µs p(95)=1.34ms  p(99.9)=8.51ms 
     http_req_sending...............: avg=31.44µs  min=4.35µs  med=8.4µs   max=265.23ms p(90)=17.62µs  p(95)=26.71µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.62ms  min=17.15ms med=25.03ms max=298.85ms p(90)=29.94ms  p(95)=31.78ms p(99.9)=48.75ms
     http_reqs......................: 229023  1878.074919/s
     iteration_duration.............: avg=26.2ms   min=17.59ms med=25.58ms max=335.87ms p(90)=30.57ms  p(95)=32.47ms p(99.9)=50.62ms
     iterations.....................: 228923  1877.254881/s
     success_rate...................: 100.00% ✓ 228923      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 665202      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=3.56µs  min=1.05µs  med=2.73µs  max=4.21ms   p(90)=4.41µs  p(95)=5.15µs   p(99.9)=36.13µs
     http_req_connecting............: avg=449ns   min=0s      med=0s      max=4.17ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.83ms min=18.45ms med=26.37ms max=300.95ms p(90)=30.64ms p(95)=32.13ms  p(99.9)=48.32ms
       { expected_response:true }...: avg=26.83ms min=18.45ms med=26.37ms max=300.95ms p(90)=30.64ms p(95)=32.13ms  p(99.9)=48.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221834
     http_req_receiving.............: avg=78.64µs min=25.19µs med=53.72µs max=155.74ms p(90)=96.5µs  p(95)=123.63µs p(99.9)=2.06ms 
     http_req_sending...............: avg=34.12µs min=4.65µs  med=10.58µs max=216.69ms p(90)=18.64µs p(95)=26.57µs  p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.71ms min=18.37ms med=26.28ms max=300.58ms p(90)=30.52ms p(95)=32ms     p(99.9)=46.84ms
     http_reqs......................: 221834  1819.428399/s
     iteration_duration.............: avg=27.05ms min=18.68ms med=26.58ms max=313.43ms p(90)=30.85ms p(95)=32.34ms  p(99.9)=48.95ms
     iterations.....................: 221734  1818.608223/s
     success_rate...................: 100.00% ✓ 221734      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 654852      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 262 MB  2.2 MB/s
     http_req_blocked...............: avg=2.92µs  min=911ns   med=2.03µs  max=3.61ms   p(90)=3.87µs   p(95)=4.62µs  p(99.9)=30.31µs
     http_req_connecting............: avg=440ns   min=0s      med=0s      max=3.57ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.25ms min=17.98ms med=26.69ms max=299.01ms p(90)=31.86ms  p(95)=33.72ms p(99.9)=50.5ms 
       { expected_response:true }...: avg=27.25ms min=17.98ms med=26.69ms max=299.01ms p(90)=31.86ms  p(95)=33.72ms p(99.9)=50.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 218384
     http_req_receiving.............: avg=299.1µs min=49.74µs med=94.8µs  max=175.41ms p(90)=738.43µs p(95)=1.24ms  p(99.9)=8.02ms 
     http_req_sending...............: avg=31.27µs min=4.52µs  med=8.72µs  max=137.23ms p(90)=19.5µs   p(95)=33.07µs p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.92ms min=17.89ms med=26.37ms max=291.22ms p(90)=31.47ms  p(95)=33.3ms  p(99.9)=49.18ms
     http_reqs......................: 218384  1790.255186/s
     iteration_duration.............: avg=27.47ms min=18.16ms med=26.89ms max=321.93ms p(90)=32.07ms  p(95)=33.92ms p(99.9)=50.83ms
     iterations.....................: 218284  1789.435412/s
     success_rate...................: 100.00% ✓ 218284      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 480375      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=3.48µs  min=871ns   med=2.21µs  max=4.01ms   p(90)=4.63µs   p(95)=5.57µs   p(99.9)=44.09µs
     http_req_connecting............: avg=676ns   min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.2ms  min=18.11ms med=36.94ms max=310.35ms p(90)=43.59ms  p(95)=45.63ms  p(99.9)=60.97ms
       { expected_response:true }...: avg=37.2ms  min=18.11ms med=36.94ms max=310.35ms p(90)=43.59ms  p(95)=45.63ms  p(99.9)=60.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160225
     http_req_receiving.............: avg=84.54µs min=25.46µs med=55.64µs max=112.17ms p(90)=124.85µs p(95)=169.45µs p(99.9)=1.72ms 
     http_req_sending...............: avg=34.95µs min=4.7µs   med=9.33µs  max=166.88ms p(90)=23.81µs  p(95)=55.51µs  p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.09ms min=18ms    med=36.83ms max=310.02ms p(90)=43.48ms  p(95)=45.51ms  p(99.9)=59.75ms
     http_reqs......................: 160225  1313.550457/s
     iteration_duration.............: avg=37.46ms min=21.16ms med=37.17ms max=326.98ms p(90)=43.81ms  p(95)=45.84ms  p(99.9)=61.6ms 
     iterations.....................: 160125  1312.730641/s
     success_rate...................: 100.00% ✓ 160125      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431157      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=2.83µs  min=972ns   med=2.22µs  max=2.16ms   p(90)=3.73µs   p(95)=4.42µs   p(99.9)=33.06µs 
     http_req_connecting............: avg=282ns   min=0s      med=0s      max=2.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.51ms min=18.65ms med=40.87ms max=310.33ms p(90)=50.17ms  p(95)=53.15ms  p(99.9)=68.72ms 
       { expected_response:true }...: avg=41.51ms min=18.65ms med=40.87ms max=310.33ms p(90)=50.17ms  p(95)=53.15ms  p(99.9)=68.72ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143819
     http_req_receiving.............: avg=75.36µs min=27µs    med=61.09µs max=129.14ms p(90)=101.92µs p(95)=120.34µs p(99.9)=719.51µs
     http_req_sending...............: avg=23.29µs min=4.68µs  med=10.56µs max=170.29ms p(90)=17.52µs  p(95)=21.24µs  p(99.9)=885.22µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.41ms min=18.53ms med=40.77ms max=310.16ms p(90)=50.07ms  p(95)=53.05ms  p(99.9)=68.36ms 
     http_reqs......................: 143819  1178.792351/s
     iteration_duration.............: avg=41.74ms min=23.32ms med=41.07ms max=322.94ms p(90)=50.37ms  p(95)=53.36ms  p(99.9)=69.15ms 
     iterations.....................: 143719  1177.972715/s
     success_rate...................: 100.00% ✓ 143719      ✗ 0     
     vus............................: 36      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 207885     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   682 kB/s
     http_req_blocked...............: avg=4.21µs  min=1.06µs  med=2.71µs  max=3.92ms   p(90)=4.31µs   p(95)=4.95µs   p(99.9)=43.68µs 
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.26ms min=20.73ms med=84.39ms max=309.76ms p(90)=106.07ms p(95)=116.38ms p(99.9)=199.49ms
       { expected_response:true }...: avg=86.26ms min=20.73ms med=84.39ms max=309.76ms p(90)=106.07ms p(95)=116.38ms p(99.9)=199.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69395
     http_req_receiving.............: avg=85.47µs min=29.06µs med=74.41µs max=93.43ms  p(90)=111.66µs p(95)=126.03µs p(99.9)=591.69µs
     http_req_sending...............: avg=23.34µs min=5.06µs  med=13.83µs max=90.71ms  p(90)=20.88µs  p(95)=23.12µs  p(99.9)=586.63µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.15ms min=20.63ms med=84.29ms max=308.83ms p(90)=105.96ms p(95)=116.25ms p(99.9)=198.92ms
     http_reqs......................: 69395   567.528259/s
     iteration_duration.............: avg=86.6ms  min=35.19ms med=84.65ms max=336.09ms p(90)=106.33ms p(95)=116.63ms p(99.9)=200.66ms
     iterations.....................: 69295   566.710436/s
     success_rate...................: 100.00% ✓ 69295      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 146229     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   479 kB/s
     http_req_blocked...............: avg=5.17µs   min=1.12µs  med=3.06µs   max=4.04ms   p(90)=4.54µs   p(95)=5.13µs   p(99.9)=593.53µs
     http_req_connecting............: avg=1.92µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=565.21µs
     http_req_duration..............: avg=122.63ms min=20.93ms med=120.54ms max=337.91ms p(90)=153.16ms p(95)=163.61ms p(99.9)=209.61ms
       { expected_response:true }...: avg=122.63ms min=20.93ms med=120.54ms max=337.91ms p(90)=153.16ms p(95)=163.61ms p(99.9)=209.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48843
     http_req_receiving.............: avg=89.95µs  min=30.13µs med=81.31µs  max=138.8ms  p(90)=113.1µs  p(95)=125.15µs p(99.9)=530.42µs
     http_req_sending...............: avg=23.27µs  min=5.23µs  med=15.56µs  max=162.51ms p(90)=21.11µs  p(95)=23.08µs  p(99.9)=512.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.52ms min=20.75ms med=120.43ms max=337.74ms p(90)=153.05ms p(95)=163.48ms p(99.9)=209.3ms 
     http_reqs......................: 48843   399.291484/s
     iteration_duration.............: avg=123.12ms min=32.61ms med=120.85ms max=346.97ms p(90)=153.45ms p(95)=163.9ms  p(99.9)=213.54ms
     iterations.....................: 48743   398.473984/s
     success_rate...................: 100.00% ✓ 48743      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94845      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=5.04µs   min=1.1µs   med=3.01µs   max=2.84ms   p(90)=4.41µs   p(95)=4.96µs   p(99.9)=770.99µs
     http_req_connecting............: avg=1.78µs   min=0s      med=0s       max=2.8ms    p(90)=0s       p(95)=0s       p(99.9)=742.98µs
     http_req_duration..............: avg=189.05ms min=23.43ms med=180.7ms  max=420.37ms p(90)=228.67ms p(95)=234.73ms p(99.9)=304.34ms
       { expected_response:true }...: avg=189.05ms min=23.43ms med=180.7ms  max=420.37ms p(90)=228.67ms p(95)=234.73ms p(99.9)=304.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31715
     http_req_receiving.............: avg=90.5µs   min=31.85µs med=87.1µs   max=5.95ms   p(90)=117.38µs p(95)=128.73µs p(99.9)=587.93µs
     http_req_sending...............: avg=27.66µs  min=5.57µs  med=16.79µs  max=84.04ms  p(90)=21.59µs  p(95)=23.52µs  p(99.9)=446.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.93ms min=23.3ms  med=180.59ms max=419.81ms p(90)=228.57ms p(95)=234.62ms p(99.9)=304.24ms
     http_reqs......................: 31715   258.519071/s
     iteration_duration.............: avg=189.87ms min=46.39ms med=180.98ms max=429.75ms p(90)=228.98ms p(95)=235.02ms p(99.9)=307.5ms 
     iterations.....................: 31615   257.703939/s
     success_rate...................: 100.00% ✓ 31615      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92778      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=6.63µs   min=1.1µs   med=3.28µs   max=4.11ms   p(90)=4.65µs   p(95)=5.21µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=193.27ms min=18.87ms med=182.2ms  max=608.05ms p(90)=225.78ms p(95)=259.05ms p(99.9)=566.41ms
       { expected_response:true }...: avg=193.27ms min=18.87ms med=182.2ms  max=608.05ms p(90)=225.78ms p(95)=259.05ms p(99.9)=566.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31026
     http_req_receiving.............: avg=101.07µs min=31.45µs med=89.99µs  max=90.68ms  p(90)=121.07µs p(95)=133.35µs p(99.9)=771.48µs
     http_req_sending...............: avg=27.19µs  min=5.13µs  med=17.48µs  max=84.91ms  p(90)=22.03µs  p(95)=23.86µs  p(99.9)=536.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.14ms min=18.77ms med=182.09ms max=607.94ms p(90)=225.66ms p(95)=258.69ms p(99.9)=566.29ms
     http_reqs......................: 31026   253.807492/s
     iteration_duration.............: avg=194.11ms min=53.22ms med=182.6ms  max=608.32ms p(90)=226.12ms p(95)=261.07ms p(99.9)=566.77ms
     iterations.....................: 30926   252.989444/s
     success_rate...................: 100.00% ✓ 30926      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6303      ✗ 0   
     data_received..................: 211 MB  1.6 MB/s
     data_sent......................: 2.6 MB  21 kB/s
     http_req_blocked...............: avg=137.18µs min=1.36µs   med=3.52µs  max=8.9ms   p(90)=4.96µs   p(95)=5.92µs   p(99.9)=8.17ms 
     http_req_connecting............: avg=131.5µs  min=0s       med=0s      max=8.85ms  p(90)=0s       p(95)=0s       p(99.9)=8.07ms 
     http_req_duration..............: avg=2.76s    min=43.12ms  med=2.88s   max=4.92s   p(90)=3.53s    p(95)=3.7s     p(99.9)=4.35s  
       { expected_response:true }...: avg=2.76s    min=43.12ms  med=2.88s   max=4.92s   p(90)=3.53s    p(95)=3.7s     p(99.9)=4.35s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2201
     http_req_receiving.............: avg=139.37µs min=35.07µs  med=91.51µs max=56.66ms p(90)=138.27µs p(95)=156.84µs p(99.9)=6.67ms 
     http_req_sending...............: avg=137.32µs min=6.41µs   med=18.2µs  max=94.98ms p(90)=23.12µs  p(95)=27.35µs  p(99.9)=21.36ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.76s    min=42.96ms  med=2.88s   max=4.92s   p(90)=3.53s    p(95)=3.7s     p(99.9)=4.35s  
     http_reqs......................: 2201    17.190846/s
     iteration_duration.............: avg=2.89s    min=994.94ms med=2.91s   max=4.92s   p(90)=3.54s    p(95)=3.71s    p(99.9)=4.36s  
     iterations.....................: 2101    16.409799/s
     success_rate...................: 100.00% ✓ 2101      ✗ 0   
     vus............................: 9       min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

