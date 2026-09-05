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
| fusion | 16.6.4 | 1,904 | 1,943 | 1,898 | 0.8% |  |
| fusion-nightly | 16.7.0-p.2 | 1,889 | 1,946 | 1,882 | 1.1% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 1,876 | 1,926 | 1,861 | 1.1% |  |
| hive-router | v0.0.84 | 1,838 | 1,907 | 1,830 | 1.5% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 1,817 | 1,868 | 1,810 | 1.1% |  |
| grafbase | 0.53.5 | 1,310 | 1,341 | 1,308 | 1.0% |  |
| cosmo | 0.334.0 | 1,162 | 1,202 | 1,152 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 561 | 583 | 558 | 1.4% |  |
| apollo-router | v2.16.1 | 434 | 451 | 433 | 1.4% |  |
| apollo-gateway | 2.14.3 | 267 | 272 | 266 | 0.7% |  |
| hive-gateway | 2.10.8 | 264 | 271 | 263 | 1.0% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 3.1% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 696147      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=3.19µs   min=912ns   med=2.33µs  max=7.75ms   p(90)=3.99µs  p(95)=4.72µs  p(99.9)=33.06µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.63ms  min=16.56ms med=25.02ms max=310.69ms p(90)=29.95ms p(95)=31.79ms p(99.9)=49.69ms
       { expected_response:true }...: avg=25.63ms  min=16.56ms med=25.02ms max=310.69ms p(90)=29.95ms p(95)=31.79ms p(99.9)=49.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232149
     http_req_receiving.............: avg=299.48µs min=50.89µs med=94.13µs max=214.61ms p(90)=729µs   p(95)=1.24ms  p(99.9)=8.45ms 
     http_req_sending...............: avg=33.77µs  min=4.68µs  med=9.28µs  max=164.59ms p(90)=18.95µs p(95)=42.51µs p(99.9)=1.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.29ms  min=16.37ms med=24.71ms max=309.97ms p(90)=29.56ms p(95)=31.35ms p(99.9)=47.83ms
     http_reqs......................: 232149  1904.146997/s
     iteration_duration.............: avg=25.84ms  min=16.76ms med=25.23ms max=319.08ms p(90)=30.16ms p(95)=32.01ms p(99.9)=50.09ms
     iterations.....................: 232049  1903.32677/s
     success_rate...................: 100.00% ✓ 232049      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690621      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.96µs  min=892ns   med=2.11µs  max=10.93ms  p(90)=3.68µs   p(95)=4.41µs  p(99.9)=30.73µs
     http_req_connecting............: avg=384ns   min=0s      med=0s      max=3.11ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.84ms min=17.16ms med=25.25ms max=285.47ms p(90)=30.22ms  p(95)=31.99ms p(99.9)=48.16ms
       { expected_response:true }...: avg=25.84ms min=17.16ms med=25.25ms max=285.47ms p(90)=30.22ms  p(95)=31.99ms p(99.9)=48.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230307
     http_req_receiving.............: avg=314.3µs min=51µs    med=97µs    max=128.94ms p(90)=787.17µs p(95)=1.26ms  p(99.9)=7.85ms 
     http_req_sending...............: avg=31.86µs min=4.55µs  med=8.64µs  max=169.71ms p(90)=16.79µs  p(95)=36.32µs p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.49ms min=17.08ms med=24.92ms max=284.88ms p(90)=29.8ms   p(95)=31.54ms p(99.9)=46.14ms
     http_reqs......................: 230307  1889.137757/s
     iteration_duration.............: avg=26.05ms min=17.38ms med=25.46ms max=318.02ms p(90)=30.42ms  p(95)=32.2ms  p(99.9)=48.69ms
     iterations.....................: 230207  1888.317488/s
     success_rate...................: 100.00% ✓ 230207      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685953      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.78µs   min=861ns   med=1.92µs  max=3.84ms   p(90)=3.65µs   p(95)=4.35µs  p(99.9)=28.51µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=3.8ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.02ms  min=16.85ms med=25.45ms max=305.05ms p(90)=30.32ms  p(95)=32.11ms p(99.9)=49.57ms
       { expected_response:true }...: avg=26.02ms  min=16.85ms med=25.45ms max=305.05ms p(90)=30.32ms  p(95)=32.11ms p(99.9)=49.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228751
     http_req_receiving.............: avg=259.74µs min=49.68µs med=88.5µs  max=154.96ms p(90)=600.98µs p(95)=1.12ms  p(99.9)=7.34ms 
     http_req_sending...............: avg=31.26µs  min=4.32µs  med=8.3µs   max=154.75ms p(90)=18.6µs   p(95)=32.95µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.73ms  min=16.74ms med=25.18ms max=304.67ms p(90)=29.97ms  p(95)=31.71ms p(99.9)=47.88ms
     http_reqs......................: 228751  1876.031324/s
     iteration_duration.............: avg=26.23ms  min=17.1ms  med=25.66ms max=319.18ms p(90)=30.52ms  p(95)=32.32ms p(99.9)=50.22ms
     iterations.....................: 228651  1875.211205/s
     success_rate...................: 100.00% ✓ 228651      ✗ 0     
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

     checks.........................: 100.00% ✓ 672168      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=3.51µs  min=981ns   med=2.67µs  max=6.8ms    p(90)=4.35µs  p(95)=5.08µs   p(99.9)=36.92µs
     http_req_connecting............: avg=459ns   min=0s      med=0s      max=3.52ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.55ms min=18.08ms med=26.09ms max=304.96ms p(90)=30.26ms p(95)=31.73ms  p(99.9)=49.11ms
       { expected_response:true }...: avg=26.55ms min=18.08ms med=26.09ms max=304.96ms p(90)=30.26ms p(95)=31.73ms  p(99.9)=49.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 224156
     http_req_receiving.............: avg=80.79µs min=24.56µs med=53.46µs max=201.87ms p(90)=95.9µs  p(95)=122.34µs p(99.9)=2.18ms 
     http_req_sending...............: avg=32.37µs min=4.59µs  med=10.56µs max=147.21ms p(90)=18.84µs p(95)=26.24µs  p(99.9)=1.43ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.44ms min=18ms    med=26ms    max=304.65ms p(90)=30.15ms p(95)=31.6ms   p(99.9)=48.06ms
     http_reqs......................: 224156  1838.58322/s
     iteration_duration.............: avg=26.77ms min=18.71ms med=26.3ms  max=315.9ms  p(90)=30.47ms p(95)=31.93ms  p(99.9)=49.68ms
     iterations.....................: 224056  1837.762995/s
     success_rate...................: 100.00% ✓ 224056      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 664698      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=3µs      min=851ns   med=2.04µs  max=7ms      p(90)=3.94µs   p(95)=4.72µs  p(99.9)=29.69µs
     http_req_connecting............: avg=429ns    min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.85ms  min=17.46ms med=26.27ms max=280.1ms  p(90)=31.38ms  p(95)=33.18ms p(99.9)=51.11ms
       { expected_response:true }...: avg=26.85ms  min=17.46ms med=26.27ms max=280.1ms  p(90)=31.38ms  p(95)=33.18ms p(99.9)=51.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221666
     http_req_receiving.............: avg=293.23µs min=49.83µs med=94.5µs  max=228ms    p(90)=715.85µs p(95)=1.2ms   p(99.9)=7.65ms 
     http_req_sending...............: avg=33.79µs  min=4.55µs  med=8.71µs  max=228.35ms p(90)=19.54µs  p(95)=28.77µs p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.52ms  min=17.38ms med=25.97ms max=279.74ms p(90)=30.99ms  p(95)=32.75ms p(99.9)=49.49ms
     http_reqs......................: 221666  1817.374522/s
     iteration_duration.............: avg=27.07ms  min=17.62ms med=26.47ms max=320.33ms p(90)=31.58ms  p(95)=33.39ms p(99.9)=51.45ms
     iterations.....................: 221566  1816.554652/s
     success_rate...................: 100.00% ✓ 221566      ✗ 0     
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

     checks.........................: 100.00% ✓ 479202      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.37µs  min=882ns   med=2.22µs  max=3.49ms   p(90)=4.7µs    p(95)=5.72µs   p(99.9)=43.12µs
     http_req_connecting............: avg=548ns   min=0s      med=0s      max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.3ms  min=18.05ms med=36.97ms max=302.87ms p(90)=43.79ms  p(95)=45.76ms  p(99.9)=62.66ms
       { expected_response:true }...: avg=37.3ms  min=18.05ms med=36.97ms max=302.87ms p(90)=43.79ms  p(95)=45.76ms  p(99.9)=62.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159834
     http_req_receiving.............: avg=86.55µs min=27.64µs med=56.46µs max=137.07ms p(90)=125.84µs p(95)=170.03µs p(99.9)=1.95ms 
     http_req_sending...............: avg=35.28µs min=4.64µs  med=9.42µs  max=182.74ms p(90)=24.38µs  p(95)=39.01µs  p(99.9)=1.77ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.17ms min=17.96ms med=36.86ms max=302.14ms p(90)=43.67ms  p(95)=45.64ms  p(99.9)=62.05ms
     http_reqs......................: 159834  1310.460075/s
     iteration_duration.............: avg=37.55ms min=21.41ms med=37.2ms  max=330.74ms p(90)=44.02ms  p(95)=45.98ms  p(99.9)=63.02ms
     iterations.....................: 159734  1309.640187/s
     success_rate...................: 100.00% ✓ 159734      ✗ 0     
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

     checks.........................: 100.00% ✓ 425091      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.33µs  min=1.04µs  med=2.34µs  max=3.84ms   p(90)=3.9µs    p(95)=4.59µs   p(99.9)=34.19µs 
     http_req_connecting............: avg=664ns   min=0s      med=0s      max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.11ms min=18.77ms med=41.5ms  max=317.57ms p(90)=50.84ms  p(95)=53.72ms  p(99.9)=68.55ms 
       { expected_response:true }...: avg=42.11ms min=18.77ms med=41.5ms  max=317.57ms p(90)=50.84ms  p(95)=53.72ms  p(99.9)=68.55ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141797
     http_req_receiving.............: avg=75.99µs min=26.11µs med=62.61µs max=201.43ms p(90)=103.45µs p(95)=121.47µs p(99.9)=730.2µs 
     http_req_sending...............: avg=24.13µs min=4.94µs  med=10.75µs max=194.13ms p(90)=17.92µs  p(95)=21.57µs  p(99.9)=786.58µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.01ms min=18.64ms med=41.41ms max=310.7ms  p(90)=50.74ms  p(95)=53.63ms  p(99.9)=68.14ms 
     http_reqs......................: 141797  1162.196569/s
     iteration_duration.............: avg=42.34ms min=23.16ms med=41.7ms  max=325.66ms p(90)=51.04ms  p(95)=53.93ms  p(99.9)=69.08ms 
     iterations.....................: 141697  1161.376949/s
     success_rate...................: 100.00% ✓ 141697      ✗ 0     
     vus............................: 42      min=0         max=50  
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

     checks.........................: 100.00% ✓ 205695     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   675 kB/s
     http_req_blocked...............: avg=4.28µs  min=992ns   med=2.84µs  max=3.39ms   p(90)=4.37µs   p(95)=4.98µs   p(99.9)=40.75µs 
     http_req_connecting............: avg=1.23µs  min=0s      med=0s      max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.17ms min=21.32ms med=81.47ms max=323.49ms p(90)=122.22ms p(95)=133.07ms p(99.9)=216.58ms
       { expected_response:true }...: avg=87.17ms min=21.32ms med=81.47ms max=323.49ms p(90)=122.22ms p(95)=133.07ms p(99.9)=216.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68665
     http_req_receiving.............: avg=84.97µs min=28.08µs med=73.72µs max=153.91ms p(90)=109.99µs p(95)=122.92µs p(99.9)=608.93µs
     http_req_sending...............: avg=21.62µs min=4.6µs   med=13.71µs max=148.18ms p(90)=20.53µs  p(95)=22.78µs  p(99.9)=632.98µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.07ms min=21.22ms med=81.37ms max=322.79ms p(90)=122.11ms p(95)=132.96ms p(99.9)=216.31ms
     http_reqs......................: 68665   561.682036/s
     iteration_duration.............: avg=87.51ms min=26.03ms med=81.74ms max=338.6ms  p(90)=122.48ms p(95)=133.38ms p(99.9)=218.5ms 
     iterations.....................: 68565   560.864032/s
     success_rate...................: 100.00% ✓ 68565      ✗ 0    
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

     checks.........................: 100.00% ✓ 159180     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   522 kB/s
     http_req_blocked...............: avg=5.92µs   min=1.41µs  med=3.73µs   max=3.56ms   p(90)=5.37µs   p(95)=6.03µs   p(99.9)=82.65µs 
     http_req_connecting............: avg=1.9µs    min=0s      med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.64ms min=20.92ms med=110.85ms max=352.74ms p(90)=140.05ms p(95)=149.12ms p(99.9)=189.86ms
       { expected_response:true }...: avg=112.64ms min=20.92ms med=110.85ms max=352.74ms p(90)=140.05ms p(95)=149.12ms p(99.9)=189.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53160
     http_req_receiving.............: avg=91.79µs  min=31.25µs med=84.42µs  max=82.02ms  p(90)=118.75µs p(95)=132.91µs p(99.9)=599.39µs
     http_req_sending...............: avg=26.51µs  min=5.76µs  med=17.81µs  max=73.12ms  p(90)=23.52µs  p(95)=25.63µs  p(99.9)=580.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.52ms min=20.82ms med=110.74ms max=352.34ms p(90)=139.92ms p(95)=149.01ms p(99.9)=189.76ms
     http_reqs......................: 53160   434.576575/s
     iteration_duration.............: avg=113.1ms  min=33.1ms  med=111.16ms max=362.76ms p(90)=140.35ms p(95)=149.4ms  p(99.9)=191.99ms
     iterations.....................: 53060   433.759087/s
     success_rate...................: 100.00% ✓ 53060      ✗ 0    
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

     checks.........................: 100.00% ✓ 98088      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.33µs  med=3.72µs   max=4.04ms   p(90)=5.28µs   p(95)=5.91µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=182.77ms min=23.48ms med=184.04ms max=390.61ms p(90)=206.64ms p(95)=211.53ms p(99.9)=275.15ms
       { expected_response:true }...: avg=182.77ms min=23.48ms med=184.04ms max=390.61ms p(90)=206.64ms p(95)=211.53ms p(99.9)=275.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32796
     http_req_receiving.............: avg=99.97µs  min=35.56µs med=92.33µs  max=105.11ms p(90)=124.43µs p(95)=137.79µs p(99.9)=522.31µs
     http_req_sending...............: avg=41.72µs  min=5.87µs  med=19.09µs  max=105.59ms p(90)=24.14µs  p(95)=26.15µs  p(99.9)=554.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.63ms min=23.37ms med=183.89ms max=389.97ms p(90)=206.49ms p(95)=211.42ms p(99.9)=274.53ms
     http_reqs......................: 32796   267.414618/s
     iteration_duration.............: avg=183.59ms min=46.77ms med=184.52ms max=415.64ms p(90)=206.97ms p(95)=211.85ms p(99.9)=277.7ms 
     iterations.....................: 32696   266.599231/s
     success_rate...................: 100.00% ✓ 32696      ✗ 0    
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

     checks.........................: 100.00% ✓ 96645      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=7.1µs    min=1.3µs   med=3.92µs   max=3.37ms   p(90)=5.53µs   p(95)=6.21µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=185.5ms  min=17.8ms  med=173.75ms max=624.94ms p(90)=219.95ms p(95)=251.87ms p(99.9)=552.38ms
       { expected_response:true }...: avg=185.5ms  min=17.8ms  med=173.75ms max=624.94ms p(90)=219.95ms p(95)=251.87ms p(99.9)=552.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32315
     http_req_receiving.............: avg=100.65µs min=36.68µs med=94.46µs  max=42.51ms  p(90)=126.81µs p(95)=140.96µs p(99.9)=686.41µs
     http_req_sending...............: avg=30.66µs  min=6.39µs  med=19.48µs  max=70.92ms  p(90)=24.62µs  p(95)=26.74µs  p(99.9)=660.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.37ms min=17.7ms  med=173.62ms max=624.8ms  p(90)=219.81ms p(95)=251.53ms p(99.9)=552.23ms
     http_reqs......................: 32315   264.747354/s
     iteration_duration.............: avg=186.33ms min=38.83ms med=174.17ms max=625.23ms p(90)=220.34ms p(95)=253.36ms p(99.9)=552.75ms
     iterations.....................: 32215   263.928083/s
     success_rate...................: 100.00% ✓ 32215      ✗ 0    
     vus............................: 31      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6477      ✗ 0   
     data_received..................: 216 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=57.64µs  min=1.21µs   med=3.77µs  max=6.04ms  p(90)=5.45µs   p(95)=6.5µs    p(99.9)=5.71ms  
     http_req_connecting............: avg=51.06µs  min=0s       med=0s      max=6.01ms  p(90)=0s       p(95)=0s       p(99.9)=5.59ms  
     http_req_duration..............: avg=2.67s    min=40.25ms  med=2.78s   max=7.38s   p(90)=3.43s    p(95)=3.61s    p(99.9)=6.29s   
       { expected_response:true }...: avg=2.67s    min=40.25ms  med=2.78s   max=7.38s   p(90)=3.43s    p(95)=3.61s    p(99.9)=6.29s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2259
     http_req_receiving.............: avg=100.98µs min=28.97µs  med=95.42µs max=1.67ms  p(90)=136.13µs p(95)=155.25µs p(99.9)=650.06µs
     http_req_sending...............: avg=57.1µs   min=6.21µs   med=19.72µs max=11.79ms p(90)=25.82µs  p(95)=31.63µs  p(99.9)=9.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.67s    min=40.09ms  med=2.78s   max=7.38s   p(90)=3.43s    p(95)=3.61s    p(99.9)=6.29s   
     http_reqs......................: 2259    17.777468/s
     iteration_duration.............: avg=2.8s     min=473.38ms med=2.81s   max=7.38s   p(90)=3.45s    p(95)=3.62s    p(99.9)=6.45s   
     iterations.....................: 2159    16.990506/s
     success_rate...................: 100.00% ✓ 2159      ✗ 0   
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

