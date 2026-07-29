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
| fusion-nightly | 16.6.0-p.6 | 1,877 | 1,932 | 1,873 | 1.1% |  |
| hive-router | v0.0.84 | 1,869 | 1,928 | 1,852 | 1.3% |  |
| fusion-nightly-net11 | 16.6.0-p.6 | 1,852 | 1,905 | 1,846 | 1.1% |  |
| fusion | 16.5.1 | 1,850 | 1,906 | 1,839 | 1.1% |  |
| fusion-nightly-fed | 16.6.0-p.6 | 1,756 | 1,810 | 1,740 | 1.3% |  |
| grafbase | 0.53.5 | 1,288 | 1,313 | 1,283 | 0.8% |  |
| cosmo | 0.334.0 | 1,167 | 1,216 | 1,160 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 557 | 576 | 553 | 1.3% |  |
| apollo-router | v2.16.1 | 396 | 415 | 393 | 1.9% |  |
| hive-gateway | 2.10.8 | 263 | 270 | 262 | 1.0% |  |
| apollo-gateway | 2.14.3 | 262 | 264 | 259 | 0.6% |  |
| feddi | 5ff8b6165878 | 22 | 22 | 21 | 2.4% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686352      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.82µs   min=951ns   med=2.01µs  max=3.86ms   p(90)=3.76µs   p(95)=4.55µs  p(99.9)=29.3µs 
     http_req_connecting............: avg=388ns    min=0s      med=0s      max=3.82ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26ms     min=17.23ms med=25.42ms max=297.99ms p(90)=30.37ms  p(95)=32.16ms p(99.9)=49.37ms
       { expected_response:true }...: avg=26ms     min=17.23ms med=25.42ms max=297.99ms p(90)=30.37ms  p(95)=32.16ms p(99.9)=49.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228884
     http_req_receiving.............: avg=288.55µs min=49.78µs med=90.57µs max=140.36ms p(90)=720.23µs p(95)=1.23ms  p(99.9)=7.49ms 
     http_req_sending...............: avg=31.84µs  min=4.61µs  med=8.56µs  max=128.12ms p(90)=19.18µs  p(95)=29.78µs p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.68ms  min=17.11ms med=25.12ms max=297.37ms p(90)=29.98ms  p(95)=31.74ms p(99.9)=48.12ms
     http_reqs......................: 228884  1877.023427/s
     iteration_duration.............: avg=26.21ms  min=17.46ms med=25.63ms max=307.19ms p(90)=30.57ms  p(95)=32.37ms p(99.9)=49.72ms
     iterations.....................: 228784  1876.203351/s
     success_rate...................: 100.00% ✓ 228784      ✗ 0     
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

     checks.........................: 100.00% ✓ 683670      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.35µs  min=952ns   med=2.64µs  max=3.27ms   p(90)=4.4µs   p(95)=5.17µs   p(99.9)=37µs   
     http_req_connecting............: avg=357ns   min=0s      med=0s      max=3.24ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.1ms  min=17.75ms med=25.64ms max=300.85ms p(90)=29.78ms p(95)=31.23ms  p(99.9)=47.82ms
       { expected_response:true }...: avg=26.1ms  min=17.75ms med=25.64ms max=300.85ms p(90)=29.78ms p(95)=31.23ms  p(99.9)=47.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227990
     http_req_receiving.............: avg=77.75µs min=24.96µs med=52.9µs  max=99.9ms   p(90)=96.43µs p(95)=122.72µs p(99.9)=2.22ms 
     http_req_sending...............: avg=31.35µs min=4.74µs  med=10.52µs max=185.29ms p(90)=19.2µs  p(95)=26.69µs  p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=25.99ms min=17.64ms med=25.54ms max=300.35ms p(90)=29.67ms p(95)=31.1ms   p(99.9)=46.56ms
     http_reqs......................: 227990  1869.763127/s
     iteration_duration.............: avg=26.31ms min=18.22ms med=25.84ms max=310.7ms  p(90)=29.99ms p(95)=31.44ms  p(99.9)=48.28ms
     iterations.....................: 227890  1868.943019/s
     success_rate...................: 100.00% ✓ 227890      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 677352      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.68µs  min=822ns   med=1.99µs  max=8.94ms   p(90)=3.61µs   p(95)=4.34µs  p(99.9)=31.69µs
     http_req_connecting............: avg=209ns   min=0s      med=0s      max=2.41ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.34ms min=17.24ms med=25.8ms  max=309.01ms p(90)=30.64ms  p(95)=32.4ms  p(99.9)=48.6ms 
       { expected_response:true }...: avg=26.34ms min=17.24ms med=25.8ms  max=309.01ms p(90)=30.64ms  p(95)=32.4ms  p(99.9)=48.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 225884
     http_req_receiving.............: avg=337µs   min=50.41µs med=96.73µs max=105.59ms p(90)=909.25µs p(95)=1.43ms  p(99.9)=7.65ms 
     http_req_sending...............: avg=30.17µs min=4.59µs  med=8.44µs  max=176.54ms p(90)=18.36µs  p(95)=29.37µs p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.98ms min=17.15ms med=25.45ms max=294.42ms p(90)=30.19ms  p(95)=31.91ms p(99.9)=47.28ms
     http_reqs......................: 225884  1852.450883/s
     iteration_duration.............: avg=26.56ms min=17.4ms  med=26ms    max=316.42ms p(90)=30.84ms  p(95)=32.61ms p(99.9)=48.93ms
     iterations.....................: 225784  1851.630794/s
     success_rate...................: 100.00% ✓ 225784      ✗ 0     
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

     checks.........................: 100.00% ✓ 676665      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.96µs   min=861ns   med=2.03µs  max=8.74ms   p(90)=3.77µs   p(95)=4.47µs  p(99.9)=34.01µs
     http_req_connecting............: avg=406ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.38ms  min=17.59ms med=25.8ms  max=294.51ms p(90)=30.86ms  p(95)=32.7ms  p(99.9)=49.85ms
       { expected_response:true }...: avg=26.38ms  min=17.59ms med=25.8ms  max=294.51ms p(90)=30.86ms  p(95)=32.7ms  p(99.9)=49.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225655
     http_req_receiving.............: avg=351.86µs min=50.78µs med=96.45µs max=254.2ms  p(90)=843.54µs p(95)=1.34ms  p(99.9)=9.52ms 
     http_req_sending...............: avg=29.42µs  min=4.56µs  med=8.44µs  max=35.68ms  p(90)=18.6µs   p(95)=29.2µs  p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26ms     min=17.49ms med=25.45ms max=251.77ms p(90)=30.43ms  p(95)=32.24ms p(99.9)=47.43ms
     http_reqs......................: 225655  1850.385599/s
     iteration_duration.............: avg=26.59ms  min=17.77ms med=26ms    max=303.57ms p(90)=31.06ms  p(95)=32.91ms p(99.9)=50.3ms 
     iterations.....................: 225555  1849.565592/s
     success_rate...................: 100.00% ✓ 225555      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 642492      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 258 MB  2.1 MB/s
     http_req_blocked...............: avg=2.88µs  min=842ns   med=1.99µs  max=3.87ms   p(90)=3.58µs   p(95)=4.3µs   p(99.9)=31.96µs
     http_req_connecting............: avg=480ns   min=0s      med=0s      max=3.83ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.79ms min=18.07ms med=27.24ms max=302.77ms p(90)=32.54ms  p(95)=34.37ms p(99.9)=49.34ms
       { expected_response:true }...: avg=27.79ms min=18.07ms med=27.24ms max=302.77ms p(90)=32.54ms  p(95)=34.37ms p(99.9)=49.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 214264
     http_req_receiving.............: avg=331.9µs min=49.98µs med=100.6µs max=68.32ms  p(90)=863.44µs p(95)=1.35ms  p(99.9)=7.38ms 
     http_req_sending...............: avg=31.34µs min=4.64µs  med=8.7µs   max=170.75ms p(90)=19.15µs  p(95)=28.3µs  p(99.9)=1.47ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.42ms min=17.88ms med=26.89ms max=302.25ms p(90)=32.08ms  p(95)=33.91ms p(99.9)=47.99ms
     http_reqs......................: 214264  1756.352731/s
     iteration_duration.............: avg=28ms    min=18.29ms med=27.44ms max=311.64ms p(90)=32.74ms  p(95)=34.57ms p(99.9)=49.98ms
     iterations.....................: 214164  1755.533017/s
     success_rate...................: 100.00% ✓ 214164      ✗ 0     
     vus............................: 30      min=0         max=50  
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

     checks.........................: 100.00% ✓ 471147      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=4.3µs   min=1.07µs  med=3.08µs  max=5.55ms   p(90)=5.38µs   p(95)=6.38µs  p(99.9)=47.26µs
     http_req_connecting............: avg=641ns   min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=37.93ms min=17.33ms med=37.6ms  max=326.2ms  p(90)=44.67ms  p(95)=46.83ms p(99.9)=64.11ms
       { expected_response:true }...: avg=37.93ms min=17.33ms med=37.6ms  max=326.2ms  p(90)=44.67ms  p(95)=46.83ms p(99.9)=64.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157149
     http_req_receiving.............: avg=92.9µs  min=28.37µs med=62.63µs max=46.38ms  p(90)=130.92µs p(95)=178.4µs p(99.9)=2.29ms 
     http_req_sending...............: avg=37.17µs min=5µs     med=11.72µs max=154.27ms p(90)=25.65µs  p(95)=53.99µs p(99.9)=1.98ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=37.8ms  min=17.19ms med=37.48ms max=326.03ms p(90)=44.54ms  p(95)=46.68ms p(99.9)=62.68ms
     http_reqs......................: 157149  1288.067415/s
     iteration_duration.............: avg=38.19ms min=21.75ms med=37.85ms max=336.21ms p(90)=44.89ms  p(95)=47.06ms p(99.9)=64.96ms
     iterations.....................: 157049  1287.247767/s
     success_rate...................: 100.00% ✓ 157049      ✗ 0     
     vus............................: 26      min=0         max=50  
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

     checks.........................: 100.00% ✓ 426918      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.12µs  min=972ns   med=2.17µs  max=3.19ms   p(90)=3.71µs   p(95)=4.39µs   p(99.9)=37.28µs 
     http_req_connecting............: avg=618ns   min=0s      med=0s      max=3.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.93ms min=18.18ms med=41.32ms max=313.28ms p(90)=50.65ms  p(95)=53.6ms   p(99.9)=68.69ms 
       { expected_response:true }...: avg=41.93ms min=18.18ms med=41.32ms max=313.28ms p(90)=50.65ms  p(95)=53.6ms   p(99.9)=68.69ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142406
     http_req_receiving.............: avg=73.97µs min=27.54µs med=62.45µs max=18.13ms  p(90)=101.88µs p(95)=119.54µs p(99.9)=727.74µs
     http_req_sending...............: avg=21.43µs min=4.91µs  med=10.37µs max=97.35ms  p(90)=17.54µs  p(95)=21.11µs  p(99.9)=804.51µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.84ms min=18.05ms med=41.23ms max=312.85ms p(90)=50.55ms  p(95)=53.5ms   p(99.9)=68.55ms 
     http_reqs......................: 142406  1167.310448/s
     iteration_duration.............: avg=42.15ms min=22.06ms med=41.52ms max=331.3ms  p(90)=50.86ms  p(95)=53.8ms   p(99.9)=68.93ms 
     iterations.....................: 142306  1166.490742/s
     success_rate...................: 100.00% ✓ 142306      ✗ 0     
     vus............................: 12      min=0         max=50  
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

     checks.........................: 100.00% ✓ 204282     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   670 kB/s
     http_req_blocked...............: avg=4.95µs  min=1.24µs  med=3.28µs  max=4.31ms   p(90)=4.82µs   p(95)=5.51µs   p(99.9)=47.89µs 
     http_req_connecting............: avg=1.39µs  min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.77ms min=20.32ms med=86ms    max=324.09ms p(90)=105.58ms p(95)=113.72ms p(99.9)=205.36ms
       { expected_response:true }...: avg=87.77ms min=20.32ms med=86ms    max=324.09ms p(90)=105.58ms p(95)=113.72ms p(99.9)=205.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68194
     http_req_receiving.............: avg=87.69µs min=30.26µs med=77.61µs max=113.04ms p(90)=112.3µs  p(95)=125.59µs p(99.9)=694.94µs
     http_req_sending...............: avg=28.66µs min=5.59µs  med=14.82µs max=171.48ms p(90)=21.31µs  p(95)=23.69µs  p(99.9)=644.3µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.65ms min=20.15ms med=85.89ms max=319.86ms p(90)=105.48ms p(95)=113.61ms p(99.9)=204ms   
     http_reqs......................: 68194   557.884657/s
     iteration_duration.............: avg=88.12ms min=33.61ms med=86.26ms max=338.95ms p(90)=105.83ms p(95)=114.03ms p(99.9)=207.07ms
     iterations.....................: 68094   557.066572/s
     success_rate...................: 100.00% ✓ 68094      ✗ 0    
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

     checks.........................: 100.00% ✓ 145239     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=5.5µs    min=1.08µs  med=3.45µs   max=3.44ms   p(90)=4.96µs   p(95)=5.57µs   p(99.9)=186.41µs
     http_req_connecting............: avg=1.77µs   min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=81.64µs 
     http_req_duration..............: avg=123.48ms min=21.47ms med=121.43ms max=340.24ms p(90)=154.73ms p(95)=165.34ms p(99.9)=212.66ms
       { expected_response:true }...: avg=123.48ms min=21.47ms med=121.43ms max=340.24ms p(90)=154.73ms p(95)=165.34ms p(99.9)=212.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48513
     http_req_receiving.............: avg=86.99µs  min=34.09µs med=81.66µs  max=38.82ms  p(90)=114.47µs p(95)=126.2µs  p(99.9)=596µs   
     http_req_sending...............: avg=25.84µs  min=6.09µs  med=16.91µs  max=87.55ms  p(90)=22.74µs  p(95)=24.75µs  p(99.9)=553.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.36ms min=21.07ms med=121.33ms max=339.68ms p(90)=154.61ms p(95)=165.25ms p(99.9)=212.56ms
     http_reqs......................: 48513   396.499287/s
     iteration_duration.............: avg=123.97ms min=52.53ms med=121.75ms max=347.85ms p(90)=155.03ms p(95)=165.65ms p(99.9)=216.31ms
     iterations.....................: 48413   395.681982/s
     success_rate...................: 100.00% ✓ 48413      ✗ 0    
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

     checks.........................: 100.00% ✓ 96396      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=6.3µs    min=1.17µs  med=3.21µs   max=4.1ms    p(90)=4.64µs   p(95)=5.26µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=186.02ms min=17.89ms med=168.56ms max=706.07ms p(90)=237.89ms p(95)=276.88ms p(99.9)=575.1ms 
       { expected_response:true }...: avg=186.02ms min=17.89ms med=168.56ms max=706.07ms p(90)=237.89ms p(95)=276.88ms p(99.9)=575.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32232
     http_req_receiving.............: avg=93.87µs  min=29.6µs  med=90.57µs  max=7.16ms   p(90)=121.73µs p(95)=134.46µs p(99.9)=549.82µs
     http_req_sending...............: avg=29.57µs  min=5.32µs  med=18.13µs  max=90.47ms  p(90)=22.81µs  p(95)=24.71µs  p(99.9)=571.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.9ms  min=17.8ms  med=168.45ms max=705.9ms  p(90)=237.78ms p(95)=276.79ms p(99.9)=575ms   
     http_reqs......................: 32232   263.816866/s
     iteration_duration.............: avg=186.83ms min=55.71ms med=168.96ms max=706.39ms p(90)=238.31ms p(95)=278.74ms p(99.9)=575.37ms
     iterations.....................: 32132   262.998373/s
     success_rate...................: 100.00% ✓ 32132      ✗ 0    
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

     checks.........................: 100.00% ✓ 96459      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=6.63µs   min=1.17µs  med=3.16µs   max=3.58ms   p(90)=4.61µs   p(95)=5.18µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=3.17µs   min=0s      med=0s       max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=185.88ms min=23.77ms med=187.62ms max=399.5ms  p(90)=209.57ms p(95)=215.31ms p(99.9)=291.78ms
       { expected_response:true }...: avg=185.88ms min=23.77ms med=187.62ms max=399.5ms  p(90)=209.57ms p(95)=215.31ms p(99.9)=291.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32253
     http_req_receiving.............: avg=95.02µs  min=31.82µs med=91.41µs  max=18ms     p(90)=122.13µs p(95)=134.39µs p(99.9)=579.47µs
     http_req_sending...............: avg=35.59µs  min=5.38µs  med=17.87µs  max=200.6ms  p(90)=22.76µs  p(95)=24.63µs  p(99.9)=564.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.75ms min=23.62ms med=187.51ms max=399.22ms p(90)=209.45ms p(95)=215.19ms p(99.9)=291.39ms
     http_reqs......................: 32253   262.961938/s
     iteration_duration.............: avg=186.69ms min=38.51ms med=188.03ms max=409.66ms p(90)=209.87ms p(95)=215.62ms p(99.9)=294.78ms
     iterations.....................: 32153   262.146628/s
     success_rate...................: 100.00% ✓ 32153      ✗ 0    
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

     checks.........................: 100.00% ✓ 8175      ✗ 0   
     data_received..................: 270 MB  2.1 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=102.25µs min=1.23µs  med=3.19µs  max=8.16ms p(90)=4.77µs   p(95)=5.6µs    p(99.9)=7.85ms 
     http_req_connecting............: avg=96.5µs   min=0s      med=0s      max=8.09ms p(90)=0s       p(95)=0s       p(99.9)=7.8ms  
     http_req_duration..............: avg=2.14s    min=37.29ms med=2.2s    max=4.09s  p(90)=2.71s    p(95)=2.87s    p(99.9)=3.65s  
       { expected_response:true }...: avg=2.14s    min=37.29ms med=2.2s    max=4.09s  p(90)=2.71s    p(95)=2.87s    p(99.9)=3.65s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2825
     http_req_receiving.............: avg=100.65µs min=29.76µs med=92.57µs max=8.91ms p(90)=135.96µs p(95)=152.24µs p(99.9)=642.9µs
     http_req_sending...............: avg=36.57µs  min=5.25µs  med=18.25µs max=4.24ms p(90)=23.41µs  p(95)=27.77µs  p(99.9)=3.32ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.14s    min=37.19ms med=2.2s    max=4.09s  p(90)=2.71s    p(95)=2.87s    p(99.9)=3.65s  
     http_reqs......................: 2825    22.330651/s
     iteration_duration.............: avg=2.21s    min=146.7ms med=2.22s   max=4.09s  p(90)=2.73s    p(95)=2.88s    p(99.9)=3.66s  
     iterations.....................: 2725    21.540185/s
     success_rate...................: 100.00% ✓ 2725      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

