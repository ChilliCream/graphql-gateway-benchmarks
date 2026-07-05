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
| fusion | 16.3.0 | 1,760 | 1,795 | 1,756 | 0.8% |  |
| hive-router | v0.0.74 | 1,746 | 1,794 | 1,730 | 1.2% |  |
| fusion-nightly | 16.4.0-p.14 | 1,739 | 1,787 | 1,727 | 1.1% |  |
| grafbase | 0.53.5 | 1,222 | 1,239 | 1,218 | 0.6% |  |
| cosmo | 0.326.1 | 1,118 | 1,140 | 1,106 | 1.0% |  |
| hive-gateway-router-runtime | 2.10.0 | 500 | 511 | 495 | 1.1% |  |
| apollo-router | v2.15.1 | 379 | 396 | 372 | 2.3% |  |
| apollo-gateway | 2.14.2 | 232 | 234 | 232 | 0.4% |  |
| hive-gateway | 2.10.0 | 231 | 235 | 229 | 1.0% |  |
| feddi | 77271dc84a06 | 16 | 17 | 16 | 2.1% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 643626      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 258 MB  2.1 MB/s
     http_req_blocked...............: avg=4.56µs   min=1.15µs  med=2.88µs   max=12.67ms  p(90)=4.53µs   p(95)=5.27µs  p(99.9)=42.27µs
     http_req_connecting............: avg=1.06µs   min=0s      med=0s       max=12.64ms  p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.71ms  min=17.96ms med=27.06ms  max=347.48ms p(90)=32.52ms  p(95)=34.56ms p(99.9)=52.98ms
       { expected_response:true }...: avg=27.71ms  min=17.96ms med=27.06ms  max=347.48ms p(90)=32.52ms  p(95)=34.56ms p(99.9)=52.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 214642
     http_req_receiving.............: avg=381.69µs min=53.96µs med=109.17µs max=166.2ms  p(90)=940.26µs p(95)=1.47ms  p(99.9)=9.55ms 
     http_req_sending...............: avg=38.5µs   min=5.24µs  med=10.91µs  max=163.18ms p(90)=20.38µs  p(95)=74.95µs p(99.9)=2.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.29ms  min=17.84ms med=26.66ms  max=344.6ms  p(90)=32.01ms  p(95)=34.04ms p(99.9)=51.6ms 
     http_reqs......................: 214642  1760.154133/s
     iteration_duration.............: avg=27.95ms  min=18.19ms med=27.29ms  max=362.44ms p(90)=32.75ms  p(95)=34.8ms  p(99.9)=53.51ms
     iterations.....................: 214542  1759.334092/s
     success_rate...................: 100.00% ✓ 214542      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 638691      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 256 MB  2.1 MB/s
     http_req_blocked...............: avg=3.26µs  min=1.07µs  med=2.4µs   max=4.19ms   p(90)=4.06µs  p(95)=4.78µs   p(99.9)=30.66µs
     http_req_connecting............: avg=451ns   min=0s      med=0s      max=4.16ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=27.94ms min=17.99ms med=27.49ms max=342.84ms p(90)=31.91ms p(95)=33.47ms  p(99.9)=51.55ms
       { expected_response:true }...: avg=27.94ms min=17.99ms med=27.49ms max=342.84ms p(90)=31.91ms p(95)=33.47ms  p(99.9)=51.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 212997
     http_req_receiving.............: avg=80.25µs min=27.76µs med=54.03µs max=168.27ms p(90)=97.98µs p(95)=123.86µs p(99.9)=2.35ms 
     http_req_sending...............: avg=34.52µs min=5.23µs  med=10.33µs max=295.58ms p(90)=19.16µs p(95)=27.36µs  p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=27.83ms min=17.85ms med=27.39ms max=341.92ms p(90)=31.8ms  p(95)=33.33ms  p(99.9)=49.9ms 
     http_reqs......................: 212997  1746.546302/s
     iteration_duration.............: avg=28.17ms min=19.27ms med=27.7ms  max=358.38ms p(90)=32.13ms p(95)=33.68ms  p(99.9)=52.23ms
     iterations.....................: 212897  1745.726316/s
     success_rate...................: 100.00% ✓ 212897      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 636159      ✗ 0     
     data_received..................: 19 GB   153 MB/s
     data_sent......................: 255 MB  2.1 MB/s
     http_req_blocked...............: avg=3.53µs   min=1.15µs  med=2.83µs   max=4.63ms   p(90)=4.44µs  p(95)=5.15µs  p(99.9)=40.26µs
     http_req_connecting............: avg=281ns    min=0s      med=0s       max=2.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=28.04ms  min=18.19ms med=27.39ms  max=335.55ms p(90)=32.82ms p(95)=34.82ms p(99.9)=55.56ms
       { expected_response:true }...: avg=28.04ms  min=18.19ms med=27.39ms  max=335.55ms p(90)=32.82ms p(95)=34.82ms p(99.9)=55.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 212153
     http_req_receiving.............: avg=395.24µs min=54.87µs med=108.37µs max=136.46ms p(90)=1.01ms  p(95)=1.57ms  p(99.9)=9.66ms 
     http_req_sending...............: avg=37.51µs  min=5.48µs  med=10.89µs  max=123.93ms p(90)=20.69µs p(95)=82.8µs  p(99.9)=1.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.6ms   min=17.98ms med=26.98ms  max=335.12ms p(90)=32.28ms p(95)=34.28ms p(99.9)=54.47ms
     http_reqs......................: 212153  1739.716105/s
     iteration_duration.............: avg=28.28ms  min=18.84ms med=27.62ms  max=363.08ms p(90)=33.04ms p(95)=35.05ms p(99.9)=55.91ms
     iterations.....................: 212053  1738.896076/s
     success_rate...................: 100.00% ✓ 212053      ✗ 0     
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

     checks.........................: 100.00% ✓ 447237      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=4.03µs  min=1.07µs  med=2.59µs  max=4.96ms   p(90)=4.8µs    p(95)=5.74µs   p(99.9)=44.04µs
     http_req_connecting............: avg=840ns   min=0s      med=0s      max=4.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.97ms min=18.38ms med=39.65ms max=367.16ms p(90)=47.16ms  p(95)=49.47ms  p(99.9)=66.86ms
       { expected_response:true }...: avg=39.97ms min=18.38ms med=39.65ms max=367.16ms p(90)=47.16ms  p(95)=49.47ms  p(99.9)=66.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149179
     http_req_receiving.............: avg=93.8µs  min=30.2µs  med=59.03µs max=130.71ms p(90)=128.73µs p(95)=182.82µs p(99.9)=2.37ms 
     http_req_sending...............: avg=38.27µs min=5.47µs  med=10.7µs  max=168.92ms p(90)=25.07µs  p(95)=98.04µs  p(99.9)=2.06ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.83ms min=18.24ms med=39.53ms max=366.77ms p(90)=47.03ms  p(95)=49.32ms  p(99.9)=65.17ms
     http_reqs......................: 149179  1222.851719/s
     iteration_duration.............: avg=40.24ms min=22.73ms med=39.89ms max=379.97ms p(90)=47.4ms   p(95)=49.71ms  p(99.9)=67.67ms
     iterations.....................: 149079  1222.031998/s
     success_rate...................: 100.00% ✓ 149079      ✗ 0     
     vus............................: 32      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 408939      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=4.04µs  min=1.3µs   med=3.24µs  max=3.3ms    p(90)=4.88µs   p(95)=5.64µs   p(99.9)=40.28µs
     http_req_connecting............: avg=456ns   min=0s      med=0s      max=3.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.75ms min=18.93ms med=43.1ms  max=366.56ms p(90)=53.33ms  p(95)=56.53ms  p(99.9)=72.9ms 
       { expected_response:true }...: avg=43.75ms min=18.93ms med=43.1ms  max=366.56ms p(90)=53.33ms  p(95)=56.53ms  p(99.9)=72.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 136413
     http_req_receiving.............: avg=90.75µs min=29.44µs med=72.15µs max=275.4ms  p(90)=112.93µs p(95)=131.37µs p(99.9)=1.28ms 
     http_req_sending...............: avg=29.12µs min=5.94µs  med=14.09µs max=110.51ms p(90)=21.31µs  p(95)=26.2µs   p(99.9)=1.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.63ms min=18.76ms med=42.99ms max=366.15ms p(90)=53.21ms  p(95)=56.42ms  p(99.9)=72.69ms
     http_reqs......................: 136413  1118.133874/s
     iteration_duration.............: avg=44ms    min=22.77ms med=43.32ms max=386.27ms p(90)=53.56ms  p(95)=56.76ms  p(99.9)=73.21ms
     iterations.....................: 136313  1117.314206/s
     success_rate...................: 100.00% ✓ 136313      ✗ 0     
     vus............................: 29      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 183258     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   601 kB/s
     http_req_blocked...............: avg=5.85µs  min=1.17µs  med=3.19µs  max=4.98ms   p(90)=4.81µs   p(95)=5.51µs   p(99.9)=56.86µs 
     http_req_connecting............: avg=2.36µs  min=0s      med=0s      max=4.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.87ms min=20.97ms med=94.23ms max=396.29ms p(90)=124.95ms p(95)=136.49ms p(99.9)=231.94ms
       { expected_response:true }...: avg=97.87ms min=20.97ms med=94.23ms max=396.29ms p(90)=124.95ms p(95)=136.49ms p(99.9)=231.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61186
     http_req_receiving.............: avg=92.84µs min=31.92µs med=79.57µs max=189.36ms p(90)=114.7µs  p(95)=127.15µs p(99.9)=1.22ms  
     http_req_sending...............: avg=28.17µs min=5.92µs  med=15.19µs max=167.5ms  p(90)=21.6µs   p(95)=24.14µs  p(99.9)=916.02µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.75ms min=20.86ms med=94.11ms max=395.45ms p(90)=124.83ms p(95)=136.37ms p(99.9)=230.76ms
     http_reqs......................: 61186   500.571765/s
     iteration_duration.............: avg=98.24ms min=36.61ms med=94.48ms max=414.36ms p(90)=125.2ms  p(95)=136.76ms p(99.9)=233.42ms
     iterations.....................: 61086   499.75365/s
     success_rate...................: 100.00% ✓ 61086      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 138930     ✗ 0    
     data_received..................: 4.1 GB  33 MB/s
     data_sent......................: 56 MB   455 kB/s
     http_req_blocked...............: avg=6.17µs   min=1.18µs  med=3.24µs   max=4.98ms   p(90)=4.65µs   p(95)=5.22µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=2.68µs   min=0s      med=0s       max=4.93ms   p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=129.11ms min=20.81ms med=126.82ms max=379.95ms p(90)=162.5ms  p(95)=173.6ms  p(99.9)=220.22ms
       { expected_response:true }...: avg=129.11ms min=20.81ms med=126.82ms max=379.95ms p(90)=162.5ms  p(95)=173.6ms  p(99.9)=220.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46410
     http_req_receiving.............: avg=93.54µs  min=31.38µs med=85.24µs  max=141.94ms p(90)=116.04µs p(95)=127.58µs p(99.9)=748.49µs
     http_req_sending...............: avg=31.25µs  min=5.78µs  med=17.3µs   max=132.24ms p(90)=22.42µs  p(95)=24.59µs  p(99.9)=588.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.98ms min=20.7ms  med=126.71ms max=379.28ms p(90)=162.39ms p(95)=173.48ms p(99.9)=219.78ms
     http_reqs......................: 46410   379.295917/s
     iteration_duration.............: avg=129.6ms  min=46.38ms med=127.12ms max=396.31ms p(90)=162.78ms p(95)=173.9ms  p(99.9)=223.38ms
     iterations.....................: 46310   378.478645/s
     success_rate...................: 100.00% ✓ 46310      ✗ 0    
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

     checks.........................: 100.00% ✓ 85164      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.65µs   min=1.37µs  med=3.72µs   max=4.26ms   p(90)=5.23µs   p(95)=5.87µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.58µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=210.55ms min=23.64ms med=200.87ms max=430.33ms p(90)=258.09ms p(95)=263.32ms p(99.9)=337.26ms
       { expected_response:true }...: avg=210.55ms min=23.64ms med=200.87ms max=430.33ms p(90)=258.09ms p(95)=263.32ms p(99.9)=337.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28488
     http_req_receiving.............: avg=107.21µs min=38.4µs  med=94.45µs  max=178.61ms p(90)=125.78µs p(95)=138.51µs p(99.9)=1.04ms  
     http_req_sending...............: avg=35.38µs  min=7.28µs  med=19.19µs  max=139.61ms p(90)=24.09µs  p(95)=26.4µs   p(99.9)=907.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.41ms min=23.49ms med=200.74ms max=429.17ms p(90)=257.97ms p(95)=263.2ms  p(99.9)=335.66ms
     http_reqs......................: 28488   232.080043/s
     iteration_duration.............: avg=211.53ms min=72.68ms med=201.2ms  max=463.66ms p(90)=258.38ms p(95)=263.61ms p(99.9)=344.98ms
     iterations.....................: 28388   231.265384/s
     success_rate...................: 100.00% ✓ 28388      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84672      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=8.25µs   min=1.7µs   med=3.88µs   max=4.56ms   p(90)=5.42µs   p(95)=6.08µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=4.04µs   min=0s      med=0s       max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=211.74ms min=19ms    med=195ms    max=726.81ms p(90)=267.46ms p(95)=314.96ms p(99.9)=640.82ms
       { expected_response:true }...: avg=211.74ms min=19ms    med=195ms    max=726.81ms p(90)=267.46ms p(95)=314.96ms p(99.9)=640.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28324
     http_req_receiving.............: avg=100.17µs min=40.59µs med=93.59µs  max=9.57ms   p(90)=125.8µs  p(95)=139.01µs p(99.9)=866.23µs
     http_req_sending...............: avg=26.58µs  min=6.98µs  med=19.16µs  max=112.5ms  p(90)=24.22µs  p(95)=26.43µs  p(99.9)=516.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.62ms min=18.88ms med=194.88ms max=726.65ms p(90)=267.36ms p(95)=314.82ms p(99.9)=640.68ms
     http_reqs......................: 28324   231.802759/s
     iteration_duration.............: avg=212.71ms min=74.72ms med=195.41ms max=727.04ms p(90)=267.92ms p(95)=316.33ms p(99.9)=641.17ms
     iterations.....................: 28224   230.984362/s
     success_rate...................: 100.00% ✓ 28224      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 6210      ✗ 0   
     data_received..................: 208 MB  1.6 MB/s
     data_sent......................: 2.6 MB  20 kB/s
     http_req_blocked...............: avg=75.26µs  min=1.43µs  med=3.39µs  max=7.68ms p(90)=4.91µs  p(95)=5.87µs   p(99.9)=7.03ms
     http_req_connecting............: avg=67.9µs   min=0s      med=0s      max=7.28ms p(90)=0s      p(95)=0s       p(99.9)=7ms   
     http_req_duration..............: avg=2.79s    min=45.08ms med=2.9s    max=8.51s  p(90)=3.57s   p(95)=3.78s    p(99.9)=6.2s  
       { expected_response:true }...: avg=2.79s    min=45.08ms med=2.9s    max=8.51s  p(90)=3.57s   p(95)=3.78s    p(99.9)=6.2s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2170
     http_req_receiving.............: avg=105.47µs min=42.83µs med=95.6µs  max=5.51ms p(90)=134.3µs p(95)=147.49µs p(99.9)=2.03ms
     http_req_sending...............: avg=42.48µs  min=6.3µs   med=18.95µs max=9.47ms p(90)=24.79µs p(95)=29.15µs  p(99.9)=3.8ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s     p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.79s    min=44.98ms med=2.9s    max=8.51s  p(90)=3.57s   p(95)=3.78s    p(99.9)=6.2s  
     http_reqs......................: 2170    16.909217/s
     iteration_duration.............: avg=2.93s    min=880ms   med=2.92s   max=8.52s  p(90)=3.59s   p(95)=3.8s     p(99.9)=6.22s 
     iterations.....................: 2070    16.12999/s
     success_rate...................: 100.00% ✓ 2070      ✗ 0   
     vus............................: 24      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 7.0.0-27-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=120 GB

