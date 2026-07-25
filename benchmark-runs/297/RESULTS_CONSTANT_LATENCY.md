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
| fusion-nightly | 16.6.0-p.3 | 1,880 | 1,926 | 1,870 | 0.9% |  |
| fusion | 16.5.1 | 1,876 | 1,923 | 1,871 | 0.9% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 1,861 | 1,913 | 1,855 | 1.0% |  |
| hive-router | v0.0.83 | 1,853 | 1,919 | 1,845 | 1.3% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 1,765 | 1,798 | 1,754 | 0.9% |  |
| grafbase | 0.53.5 | 1,306 | 1,338 | 1,298 | 1.0% |  |
| cosmo | 0.331.1 | 1,163 | 1,213 | 1,156 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.4 | 557 | 580 | 555 | 1.4% |  |
| apollo-router | v2.16.0 | 398 | 417 | 396 | 1.8% |  |
| apollo-gateway | 2.14.2 | 258 | 263 | 257 | 0.7% |  |
| hive-gateway | 2.10.4 | 254 | 261 | 253 | 1.3% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 18 | 4.3% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687390      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.74µs   min=881ns   med=2.03µs  max=3.26ms   p(90)=3.93µs   p(95)=4.69µs  p(99.9)=30.03µs
     http_req_connecting............: avg=250ns    min=0s      med=0s      max=3.25ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.96ms  min=17.25ms med=25.39ms max=300.68ms p(90)=30.32ms  p(95)=32.09ms p(99.9)=49.5ms 
       { expected_response:true }...: avg=25.96ms  min=17.25ms med=25.39ms max=300.68ms p(90)=30.32ms  p(95)=32.09ms p(99.9)=49.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 229230
     http_req_receiving.............: avg=294.46µs min=48.99µs med=90.86µs max=228.97ms p(90)=726.58µs p(95)=1.22ms  p(99.9)=8.11ms 
     http_req_sending...............: avg=32.75µs  min=4.4µs   med=8.36µs  max=187.94ms p(90)=18.08µs  p(95)=32.52µs p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.63ms  min=17ms    med=25.08ms max=286.75ms p(90)=29.93ms  p(95)=31.68ms p(99.9)=47.9ms 
     http_reqs......................: 229230  1880.036648/s
     iteration_duration.............: avg=26.17ms  min=17.42ms med=25.59ms max=307.69ms p(90)=30.52ms  p(95)=32.29ms p(99.9)=49.97ms
     iterations.....................: 229130  1879.216495/s
     success_rate...................: 100.00% ✓ 229130      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686025      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=881ns   med=1.97µs  max=10.03ms  p(90)=3.6µs    p(95)=4.34µs  p(99.9)=27.19µs
     http_req_connecting............: avg=416ns    min=0s      med=0s      max=3.62ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.02ms  min=17.55ms med=25.42ms max=300.41ms p(90)=30.4ms   p(95)=32.26ms p(99.9)=49.74ms
       { expected_response:true }...: avg=26.02ms  min=17.55ms med=25.42ms max=300.41ms p(90)=30.4ms   p(95)=32.26ms p(99.9)=49.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228775
     http_req_receiving.............: avg=314.45µs min=49.7µs  med=95.99µs max=208.41ms p(90)=789.23µs p(95)=1.25ms  p(99.9)=8.37ms 
     http_req_sending...............: avg=31.95µs  min=4.33µs  med=8.4µs   max=181.49ms p(90)=18.27µs  p(95)=29.93µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.67ms  min=17.44ms med=25.1ms  max=300.29ms p(90)=29.99ms  p(95)=31.8ms  p(99.9)=47.91ms
     http_reqs......................: 228775  1876.100335/s
     iteration_duration.............: avg=26.23ms  min=17.8ms  med=25.62ms max=308.81ms p(90)=30.6ms   p(95)=32.46ms p(99.9)=50.01ms
     iterations.....................: 228675  1875.280272/s
     success_rate...................: 100.00% ✓ 228675      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 680679      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.26µs   min=922ns   med=2.4µs   max=8.51ms   p(90)=4.05µs   p(95)=4.78µs  p(99.9)=32.82µs
     http_req_connecting............: avg=439ns    min=0s      med=0s      max=3.71ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.21ms  min=16.64ms med=25.62ms max=307.88ms p(90)=30.58ms  p(95)=32.42ms p(99.9)=50.1ms 
       { expected_response:true }...: avg=26.21ms  min=16.64ms med=25.62ms max=307.88ms p(90)=30.58ms  p(95)=32.42ms p(99.9)=50.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 226993
     http_req_receiving.............: avg=336.46µs min=51.42µs med=96.73µs max=218.02ms p(90)=877.57µs p(95)=1.43ms  p(99.9)=8.36ms 
     http_req_sending...............: avg=32.48µs  min=4.67µs  med=9.23µs  max=219.35ms p(90)=18.67µs  p(95)=32.43µs p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.84ms  min=16.56ms med=25.27ms max=307.22ms p(90)=30.14ms  p(95)=31.92ms p(99.9)=48.69ms
     http_reqs......................: 226993  1861.836945/s
     iteration_duration.............: avg=26.43ms  min=16.81ms med=25.83ms max=333.77ms p(90)=30.78ms  p(95)=32.62ms p(99.9)=50.73ms
     iterations.....................: 226893  1861.016727/s
     success_rate...................: 100.00% ✓ 226893      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 677670      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.88µs  min=882ns   med=2.07µs  max=3.98ms   p(90)=3.74µs  p(95)=4.44µs   p(99.9)=26.81µs
     http_req_connecting............: avg=424ns   min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.34ms min=17.78ms med=25.9ms  max=298.96ms p(90)=30.08ms p(95)=31.5ms   p(99.9)=47.75ms
       { expected_response:true }...: avg=26.34ms min=17.78ms med=25.9ms  max=298.96ms p(90)=30.08ms p(95)=31.5ms   p(99.9)=47.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225990
     http_req_receiving.............: avg=70.54µs min=24.64µs med=47.55µs max=33.33ms  p(90)=90.35µs p(95)=114.97µs p(99.9)=1.79ms 
     http_req_sending...............: avg=27.65µs min=4.48µs  med=9.05µs  max=131.78ms p(90)=18.1µs  p(95)=24.4µs   p(99.9)=1.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.24ms min=17.72ms med=25.81ms max=298.46ms p(90)=29.98ms p(95)=31.39ms  p(99.9)=46.5ms 
     http_reqs......................: 225990  1853.270521/s
     iteration_duration.............: avg=26.55ms min=18.03ms med=26.1ms  max=312.25ms p(90)=30.28ms p(95)=31.7ms   p(99.9)=48.37ms
     iterations.....................: 225890  1852.450454/s
     success_rate...................: 100.00% ✓ 225890      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 645492      ✗ 0     
     data_received..................: 19 GB   155 MB/s
     data_sent......................: 259 MB  2.1 MB/s
     http_req_blocked...............: avg=3.6µs   min=822ns   med=2.07µs  max=8.46ms   p(90)=3.84µs   p(95)=4.57µs  p(99.9)=33.59µs
     http_req_connecting............: avg=1.02µs  min=0s      med=0s      max=8.42ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.66ms min=17.65ms med=27.1ms  max=304ms    p(90)=32.38ms  p(95)=34.24ms p(99.9)=51.74ms
       { expected_response:true }...: avg=27.66ms min=17.65ms med=27.1ms  max=304ms    p(90)=32.38ms  p(95)=34.24ms p(99.9)=51.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 215264
     http_req_receiving.............: avg=330.3µs min=50.24µs med=98.39µs max=163.82ms p(90)=866.92µs p(95)=1.38ms  p(99.9)=7.74ms 
     http_req_sending...............: avg=30.53µs min=4.38µs  med=8.59µs  max=168.31ms p(90)=18.68µs  p(95)=29.84µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.3ms  min=17.54ms med=26.75ms max=303.02ms p(90)=31.95ms  p(95)=33.77ms p(99.9)=50.38ms
     http_reqs......................: 215264  1765.051593/s
     iteration_duration.............: avg=27.87ms min=17.83ms med=27.31ms max=314.49ms p(90)=32.58ms  p(95)=34.44ms p(99.9)=52.24ms
     iterations.....................: 215164  1764.231645/s
     success_rate...................: 100.00% ✓ 215164      ✗ 0     
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

     checks.........................: 100.00% ✓ 477678      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3.49µs   min=822ns   med=2.21µs  max=8.66ms   p(90)=4.81µs   p(95)=5.82µs  p(99.9)=44.74µs
     http_req_connecting............: avg=595ns    min=0s      med=0s      max=3.32ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=37.42ms  min=18.06ms med=37.05ms max=316.37ms p(90)=44.02ms  p(95)=46.11ms p(99.9)=63.78ms
       { expected_response:true }...: avg=37.42ms  min=18.06ms med=37.05ms max=316.37ms p(90)=44.02ms  p(95)=46.11ms p(99.9)=63.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159326
     http_req_receiving.............: avg=110.09µs min=27.57µs med=55.85µs max=225.23ms p(90)=124.44µs p(95)=168.7µs p(99.9)=2.49ms 
     http_req_sending...............: avg=33.79µs  min=4.39µs  med=9.25µs  max=91.22ms  p(90)=24.01µs  p(95)=46.51µs p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=37.27ms  min=17.97ms med=36.94ms max=244.51ms p(90)=43.89ms  p(95)=45.96ms p(99.9)=62.77ms
     http_reqs......................: 159326  1306.132197/s
     iteration_duration.............: avg=37.67ms  min=20.58ms med=37.28ms max=326.56ms p(90)=44.24ms  p(95)=46.32ms p(99.9)=64.51ms
     iterations.....................: 159226  1305.312411/s
     success_rate...................: 100.00% ✓ 159226      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 425595      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.42µs  min=972ns   med=2.19µs  max=20.45ms  p(90)=3.74µs  p(95)=4.45µs   p(99.9)=38.67µs 
     http_req_connecting............: avg=879ns   min=0s      med=0s      max=20.4ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.06ms min=18.53ms med=41.4ms  max=313.83ms p(90)=50.88ms p(95)=53.98ms  p(99.9)=70.2ms  
       { expected_response:true }...: avg=42.06ms min=18.53ms med=41.4ms  max=313.83ms p(90)=50.88ms p(95)=53.98ms  p(99.9)=70.2ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 141965
     http_req_receiving.............: avg=79.53µs min=27.78µs med=65.32µs max=111.96ms p(90)=105.9µs p(95)=124.05µs p(99.9)=834.45µs
     http_req_sending...............: avg=21.94µs min=4.67µs  med=10.56µs max=103.39ms p(90)=17.57µs p(95)=21.31µs  p(99.9)=807.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.95ms min=18.43ms med=41.31ms max=313.45ms p(90)=50.77ms p(95)=53.87ms  p(99.9)=69.96ms 
     http_reqs......................: 141965  1163.631895/s
     iteration_duration.............: avg=42.28ms min=21.99ms med=41.6ms  max=322.7ms  p(90)=51.08ms p(95)=54.18ms  p(99.9)=70.62ms 
     iterations.....................: 141865  1162.812234/s
     success_rate...................: 100.00% ✓ 141865      ✗ 0     
     vus............................: 35      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 204300     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   670 kB/s
     http_req_blocked...............: avg=4.84µs  min=1.16µs  med=3.25µs  max=3.22ms   p(90)=4.72µs   p(95)=5.35µs   p(99.9)=50.81µs 
     http_req_connecting............: avg=1.27µs  min=0s      med=0s      max=3.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.77ms min=20.41ms med=86.48ms max=335.22ms p(90)=104.06ms p(95)=112.85ms p(99.9)=204.71ms
       { expected_response:true }...: avg=87.77ms min=20.41ms med=86.48ms max=335.22ms p(90)=104.06ms p(95)=112.85ms p(99.9)=204.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68200
     http_req_receiving.............: avg=86.73µs min=31.53µs med=78.18µs max=70.27ms  p(90)=113.58µs p(95)=127.21µs p(99.9)=641.49µs
     http_req_sending...............: avg=27.17µs min=5.46µs  med=15.13µs max=175.98ms p(90)=21.72µs  p(95)=24.1µs   p(99.9)=635.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.65ms min=20.25ms med=86.38ms max=334.31ms p(90)=103.96ms p(95)=112.73ms p(99.9)=203.85ms
     http_reqs......................: 68200   557.919612/s
     iteration_duration.............: avg=88.11ms min=27.5ms  med=86.74ms max=342.69ms p(90)=104.31ms p(95)=113.12ms p(99.9)=205.46ms
     iterations.....................: 68100   557.101548/s
     success_rate...................: 100.00% ✓ 68100      ✗ 0    
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

     checks.........................: 100.00% ✓ 146061     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   479 kB/s
     http_req_blocked...............: avg=5.25µs   min=1.09µs  med=3.21µs   max=3.43ms   p(90)=4.71µs   p(95)=5.29µs   p(99.9)=162.92µs
     http_req_connecting............: avg=1.84µs   min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=80.17µs 
     http_req_duration..............: avg=122.77ms min=21.3ms  med=120.86ms max=347.09ms p(90)=153.57ms p(95)=163.53ms p(99.9)=210.57ms
       { expected_response:true }...: avg=122.77ms min=21.3ms  med=120.86ms max=347.09ms p(90)=153.57ms p(95)=163.53ms p(99.9)=210.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48787
     http_req_receiving.............: avg=93.09µs  min=29.8µs  med=82.06µs  max=142.56ms p(90)=112.97µs p(95)=125.32µs p(99.9)=497.18µs
     http_req_sending...............: avg=33.9µs   min=4.95µs  med=16.48µs  max=225.37ms p(90)=21.77µs  p(95)=23.67µs  p(99.9)=605.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.64ms min=21.14ms med=120.75ms max=325.46ms p(90)=153.46ms p(95)=163.39ms p(99.9)=209.09ms
     http_reqs......................: 48787   398.781888/s
     iteration_duration.............: avg=123.26ms min=31.98ms med=121.17ms max=347.28ms p(90)=153.88ms p(95)=163.85ms p(99.9)=212.45ms
     iterations.....................: 48687   397.964494/s
     success_rate...................: 100.00% ✓ 48687      ✗ 0    
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

     checks.........................: 100.00% ✓ 94740      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.14µs  med=3.2µs    max=3.58ms   p(90)=4.59µs   p(95)=5.16µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=189.27ms min=23.29ms med=194.38ms max=398.01ms p(90)=202.81ms p(95)=207.1ms  p(99.9)=275.38ms
       { expected_response:true }...: avg=189.27ms min=23.29ms med=194.38ms max=398.01ms p(90)=202.81ms p(95)=207.1ms  p(99.9)=275.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31680
     http_req_receiving.............: avg=97.12µs  min=32.32µs med=86.71µs  max=177.85ms p(90)=116.07µs p(95)=126.7µs  p(99.9)=511.62µs
     http_req_sending...............: avg=25.63µs  min=5.55µs  med=17.73µs  max=53.08ms  p(90)=22.23µs  p(95)=24.01µs  p(99.9)=438.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.15ms min=23.11ms med=194.27ms max=392.36ms p(90)=202.7ms  p(95)=206.96ms p(99.9)=275.19ms
     http_reqs......................: 31680   258.27582/s
     iteration_duration.............: avg=190.09ms min=58.34ms med=194.65ms max=416.31ms p(90)=203.1ms  p(95)=207.38ms p(99.9)=277.98ms
     iterations.....................: 31580   257.460555/s
     success_rate...................: 100.00% ✓ 31580      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93129      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   306 kB/s
     http_req_blocked...............: avg=7.92µs   min=1.16µs  med=3.02µs   max=9.02ms   p(90)=4.36µs   p(95)=4.87µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=4.33µs   min=0s      med=0s       max=7.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=192.62ms min=17.62ms med=179.04ms max=705.49ms p(90)=238.62ms p(95)=274.49ms p(99.9)=595.43ms
       { expected_response:true }...: avg=192.62ms min=17.62ms med=179.04ms max=705.49ms p(90)=238.62ms p(95)=274.49ms p(99.9)=595.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31143
     http_req_receiving.............: avg=89.64µs  min=31.18µs med=86.26µs  max=16.69ms  p(90)=116.63µs p(95)=128.28µs p(99.9)=669.08µs
     http_req_sending...............: avg=38.31µs  min=5.6µs   med=16.86µs  max=159.59ms p(90)=21.44µs  p(95)=23.21µs  p(99.9)=3.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.49ms min=17.48ms med=178.93ms max=705.37ms p(90)=238.52ms p(95)=274.39ms p(99.9)=595.32ms
     http_reqs......................: 31143   254.81619/s
     iteration_duration.............: avg=193.46ms min=34.29ms med=179.41ms max=705.7ms  p(90)=239.02ms p(95)=276.12ms p(99.9)=595.73ms
     iterations.....................: 31043   253.997977/s
     success_rate...................: 100.00% ✓ 31043      ✗ 0    
     vus............................: 45      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7380      ✗ 0   
     data_received..................: 245 MB  1.9 MB/s
     data_sent......................: 3.1 MB  24 kB/s
     http_req_blocked...............: avg=83.22µs  min=1.48µs   med=3.89µs  max=9.91ms  p(90)=5.55µs  p(95)=6.33µs   p(99.9)=9.68ms  
     http_req_connecting............: avg=77.14µs  min=0s       med=0s      max=9.88ms  p(90)=0s      p(95)=0s       p(99.9)=9.65ms  
     http_req_duration..............: avg=2.35s    min=36.79ms  med=2.4s    max=5.21s   p(90)=3.15s   p(95)=3.4s     p(99.9)=4.35s   
       { expected_response:true }...: avg=2.35s    min=36.79ms  med=2.4s    max=5.21s   p(90)=3.15s   p(95)=3.4s     p(99.9)=4.35s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2560
     http_req_receiving.............: avg=106.26µs min=31.93µs  med=97.95µs max=2.78ms  p(90)=143.9µs p(95)=163.95µs p(99.9)=796.86µs
     http_req_sending...............: avg=63.76µs  min=6.03µs   med=20.26µs max=18.06ms p(90)=26.22µs p(95)=30.86µs  p(99.9)=7.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.35s    min=36.61ms  med=2.4s    max=5.21s   p(90)=3.15s   p(95)=3.4s     p(99.9)=4.34s   
     http_reqs......................: 2560    20.238446/s
     iteration_duration.............: avg=2.45s    min=657.81ms med=2.42s   max=5.21s   p(90)=3.16s   p(95)=3.42s    p(99.9)=4.35s   
     iterations.....................: 2460    19.447881/s
     success_rate...................: 100.00% ✓ 2460      ✗ 0   
     vus............................: 29      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

