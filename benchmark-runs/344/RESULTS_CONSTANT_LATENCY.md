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
| fusion-nightly | 16.7.0-p.5 | 1,891 | 1,938 | 1,886 | 0.9% |  |
| fusion | 16.6.4 | 1,874 | 1,925 | 1,868 | 1.1% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 1,873 | 1,926 | 1,864 | 1.2% |  |
| hive-router | v0.0.84 | 1,822 | 1,897 | 1,802 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 1,793 | 1,849 | 1,782 | 1.3% |  |
| grafbase | 0.53.5 | 1,315 | 1,338 | 1,310 | 0.8% |  |
| cosmo | 0.334.0 | 1,230 | 1,266 | 1,221 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 554 | 574 | 550 | 1.4% |  |
| apollo-router | v2.16.1 | 433 | 449 | 431 | 1.4% |  |
| apollo-gateway | 2.14.3 | 263 | 268 | 262 | 0.7% |  |
| hive-gateway | 2.10.8 | 252 | 260 | 251 | 1.3% |  |
| feddi | 5ff8b6165878 | 16 | 17 | 16 | 2.8% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 691539      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=882ns   med=2µs     max=5.43ms   p(90)=3.73µs   p(95)=4.47µs  p(99.9)=28.99µs
     http_req_connecting............: avg=381ns    min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.8ms   min=17.68ms med=25.21ms max=304.57ms p(90)=30.15ms  p(95)=31.98ms p(99.9)=49.74ms
       { expected_response:true }...: avg=25.8ms   min=17.68ms med=25.21ms max=304.57ms p(90)=30.15ms  p(95)=31.98ms p(99.9)=49.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230613
     http_req_receiving.............: avg=305.03µs min=48.85µs med=91.88µs max=147.44ms p(90)=766.73µs p(95)=1.28ms  p(99.9)=8.2ms  
     http_req_sending...............: avg=30.94µs  min=4.69µs  med=8.62µs  max=125.34ms p(90)=19.01µs  p(95)=29.11µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.46ms  min=17.43ms med=24.89ms max=304.39ms p(90)=29.73ms  p(95)=31.55ms p(99.9)=48.01ms
     http_reqs......................: 230613  1891.231158/s
     iteration_duration.............: avg=26.02ms  min=17.88ms med=25.41ms max=315.59ms p(90)=30.35ms  p(95)=32.18ms p(99.9)=50.2ms 
     iterations.....................: 230513  1890.411069/s
     success_rate...................: 100.00% ✓ 230513      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685524      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.75µs   min=831ns   med=1.96µs  max=3.95ms   p(90)=3.45µs   p(95)=4.16µs  p(99.9)=30.61µs
     http_req_connecting............: avg=399ns    min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.03ms  min=17.37ms med=25.44ms max=298.5ms  p(90)=30.47ms  p(95)=32.28ms p(99.9)=49.93ms
       { expected_response:true }...: avg=26.03ms  min=17.37ms med=25.44ms max=298.5ms  p(90)=30.47ms  p(95)=32.28ms p(99.9)=49.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228608
     http_req_receiving.............: avg=322.86µs min=51.05µs med=96.59µs max=165.4ms  p(90)=811.24µs p(95)=1.28ms  p(99.9)=8.56ms 
     http_req_sending...............: avg=30.6µs   min=4.61µs  med=8.48µs  max=131.05ms p(90)=17.53µs  p(95)=28.77µs p(99.9)=1.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.68ms  min=17.26ms med=25.11ms max=297.82ms p(90)=30.04ms  p(95)=31.8ms  p(99.9)=48.57ms
     http_reqs......................: 228608  1874.885467/s
     iteration_duration.............: avg=26.24ms  min=17.53ms med=25.64ms max=307.86ms p(90)=30.67ms  p(95)=32.47ms p(99.9)=50.54ms
     iterations.....................: 228508  1874.065336/s
     success_rate...................: 100.00% ✓ 228508      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684993      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.18µs   min=891ns   med=2.51µs  max=7.11ms   p(90)=4.24µs  p(95)=4.97µs  p(99.9)=35.61µs
     http_req_connecting............: avg=214ns    min=0s      med=0s      max=2.42ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.04ms  min=17.28ms med=25.45ms max=305.35ms p(90)=30.3ms  p(95)=32.13ms p(99.9)=51.77ms
       { expected_response:true }...: avg=26.04ms  min=17.28ms med=25.45ms max=305.35ms p(90)=30.3ms  p(95)=32.13ms p(99.9)=51.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228431
     http_req_receiving.............: avg=397.92µs min=49.92µs med=93.31µs max=272.79ms p(90)=1.12ms  p(95)=1.91ms  p(99.9)=11.91ms
     http_req_sending...............: avg=36.01µs  min=4.63µs  med=9.69µs  max=164.22ms p(90)=20.23µs p(95)=52.89µs p(99.9)=1.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.6ms   min=17.19ms med=25.05ms max=290.37ms p(90)=29.72ms p(95)=31.49ms p(99.9)=50.22ms
     http_reqs......................: 228431  1873.544431/s
     iteration_duration.............: avg=26.26ms  min=17.46ms med=25.67ms max=314.05ms p(90)=30.51ms p(95)=32.35ms p(99.9)=52.16ms
     iterations.....................: 228331  1872.724251/s
     success_rate...................: 100.00% ✓ 228331      ✗ 0     
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

     checks.........................: 100.00% ✓ 666618      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.86µs  min=891ns   med=2.05µs  max=8.89ms   p(90)=3.55µs  p(95)=4.25µs   p(99.9)=27.99µs
     http_req_connecting............: avg=390ns   min=0s      med=0s      max=3.31ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.78ms min=18.32ms med=26.35ms max=241.99ms p(90)=30.6ms  p(95)=32.05ms  p(99.9)=47ms   
       { expected_response:true }...: avg=26.78ms min=18.32ms med=26.35ms max=241.99ms p(90)=30.6ms  p(95)=32.05ms  p(99.9)=47ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 222306
     http_req_receiving.............: avg=72.84µs min=25.59µs med=50.41µs max=110.08ms p(90)=89.91µs p(95)=112.99µs p(99.9)=1.78ms 
     http_req_sending...............: avg=28.64µs min=4.48µs  med=8.96µs  max=96.32ms  p(90)=16.81µs p(95)=23.23µs  p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.68ms min=18.18ms med=26.27ms max=241.19ms p(90)=30.5ms  p(95)=31.93ms  p(99.9)=45.7ms 
     http_reqs......................: 222306  1822.867408/s
     iteration_duration.............: avg=26.99ms min=18.91ms med=26.55ms max=311.44ms p(90)=30.79ms p(95)=32.25ms  p(99.9)=47.35ms
     iterations.....................: 222206  1822.047426/s
     success_rate...................: 100.00% ✓ 222206      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 655881      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=2.92µs   min=872ns   med=2.04µs  max=3.75ms   p(90)=3.92µs   p(95)=4.69µs  p(99.9)=32.52µs
     http_req_connecting............: avg=408ns    min=0s      med=0s      max=3.71ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.22ms  min=17.52ms med=26.64ms max=297.98ms p(90)=31.85ms  p(95)=33.71ms p(99.9)=51.57ms
       { expected_response:true }...: avg=27.22ms  min=17.52ms med=26.64ms max=297.98ms p(90)=31.85ms  p(95)=33.71ms p(99.9)=51.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 218727
     http_req_receiving.............: avg=302.16µs min=50.2µs  med=95.92µs max=110.91ms p(90)=750.59µs p(95)=1.25ms  p(99.9)=7.43ms 
     http_req_sending...............: avg=33µs     min=4.21µs  med=8.61µs  max=199.52ms p(90)=19.16µs  p(95)=29.83µs p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.88ms  min=17.37ms med=26.32ms max=297.31ms p(90)=31.45ms  p(95)=33.26ms p(99.9)=49.7ms 
     http_reqs......................: 218727  1793.208911/s
     iteration_duration.............: avg=27.43ms  min=17.7ms  med=26.84ms max=308.29ms p(90)=32.05ms  p(95)=33.91ms p(99.9)=51.83ms
     iterations.....................: 218627  1792.389073/s
     success_rate...................: 100.00% ✓ 218627      ✗ 0     
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

     checks.........................: 100.00% ✓ 480966      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=3.37µs  min=892ns   med=2.2µs   max=3.63ms   p(90)=4.59µs   p(95)=5.52µs   p(99.9)=44.91µs
     http_req_connecting............: avg=577ns   min=0s      med=0s      max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.16ms min=18.16ms med=36.87ms max=312.95ms p(90)=43.73ms  p(95)=45.81ms  p(99.9)=62.7ms 
       { expected_response:true }...: avg=37.16ms min=18.16ms med=36.87ms max=312.95ms p(90)=43.73ms  p(95)=45.81ms  p(99.9)=62.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 160422
     http_req_receiving.............: avg=85.57µs min=26.78µs med=55.02µs max=177.45ms p(90)=124.18µs p(95)=168.85µs p(99.9)=1.84ms 
     http_req_sending...............: avg=35.66µs min=4.6µs   med=9.33µs  max=197.27ms p(90)=24.31µs  p(95)=49.94µs  p(99.9)=1.91ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.04ms min=18.06ms med=36.76ms max=312.58ms p(90)=43.62ms  p(95)=45.67ms  p(99.9)=62ms   
     http_reqs......................: 160422  1315.038022/s
     iteration_duration.............: avg=37.41ms min=20.2ms  med=37.1ms  max=328.35ms p(90)=43.95ms  p(95)=46.02ms  p(99.9)=63.2ms 
     iterations.....................: 160322  1314.218285/s
     success_rate...................: 100.00% ✓ 160322      ✗ 0     
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

     checks.........................: 100.00% ✓ 449922      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.36µs  min=932ns   med=2.39µs  max=3.84ms   p(90)=4.04µs   p(95)=4.74µs   p(99.9)=36.81µs 
     http_req_connecting............: avg=624ns   min=0s      med=0s      max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.77ms min=18.47ms med=39.15ms max=293.12ms p(90)=47.79ms  p(95)=50.56ms  p(99.9)=65.18ms 
       { expected_response:true }...: avg=39.77ms min=18.47ms med=39.15ms max=293.12ms p(90)=47.79ms  p(95)=50.56ms  p(99.9)=65.18ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 150074
     http_req_receiving.............: avg=77.51µs min=27.25µs med=63.19µs max=154ms    p(90)=104.28µs p(95)=121.03µs p(99.9)=875.22µs
     http_req_sending...............: avg=26.14µs min=4.63µs  med=11.06µs max=153.95ms p(90)=18.88µs  p(95)=22.48µs  p(99.9)=858.33µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.66ms min=18.36ms med=39.05ms max=292.59ms p(90)=47.7ms   p(95)=50.46ms  p(99.9)=64.88ms 
     http_reqs......................: 150074  1230.181927/s
     iteration_duration.............: avg=40ms    min=20.83ms med=39.36ms max=305.43ms p(90)=48ms     p(95)=50.75ms  p(99.9)=65.53ms 
     iterations.....................: 149974  1229.36221/s
     success_rate...................: 100.00% ✓ 149974      ✗ 0     
     vus............................: 10      min=0         max=50  
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

     checks.........................: 100.00% ✓ 202950     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   666 kB/s
     http_req_blocked...............: avg=7.22µs  min=1.22µs  med=3.48µs  max=10.63ms  p(90)=5.07µs   p(95)=5.78µs   p(99.9)=46.23µs 
     http_req_connecting............: avg=3.41µs  min=0s      med=0s      max=10.46ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.33ms min=20.81ms med=86.51ms max=322.79ms p(90)=107.11ms p(95)=116.24ms p(99.9)=206.55ms
       { expected_response:true }...: avg=88.33ms min=20.81ms med=86.51ms max=322.79ms p(90)=107.11ms p(95)=116.24ms p(99.9)=206.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67750
     http_req_receiving.............: avg=88.63µs min=31.92µs med=78.31µs max=201.28ms p(90)=113.35µs p(95)=126.71µs p(99.9)=664.48µs
     http_req_sending...............: avg=28.73µs min=5.76µs  med=15.36µs max=207.93ms p(90)=21.94µs  p(95)=24.21µs  p(99.9)=750.35µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.21ms min=20.62ms med=86.4ms  max=321.35ms p(90)=106.98ms p(95)=116.07ms p(99.9)=206.05ms
     http_reqs......................: 67750   554.112749/s
     iteration_duration.............: avg=88.7ms  min=37.63ms med=86.79ms max=349.01ms p(90)=107.38ms p(95)=116.56ms p(99.9)=208.1ms 
     iterations.....................: 67650   553.29487/s
     success_rate...................: 100.00% ✓ 67650      ✗ 0    
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

     checks.........................: 100.00% ✓ 158778     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   520 kB/s
     http_req_blocked...............: avg=5.64µs   min=982ns   med=3.79µs   max=3.42ms   p(90)=5.37µs   p(95)=6.01µs   p(99.9)=72.71µs 
     http_req_connecting............: avg=1.6µs    min=0s      med=0s       max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.93ms min=21.35ms med=111.1ms  max=341.37ms p(90)=140.52ms p(95)=149.87ms p(99.9)=191.94ms
       { expected_response:true }...: avg=112.93ms min=21.35ms med=111.1ms  max=341.37ms p(90)=140.52ms p(95)=149.87ms p(99.9)=191.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53026
     http_req_receiving.............: avg=99.32µs  min=32.93µs med=89.08µs  max=200.66ms p(90)=121.14µs p(95)=134.22µs p(99.9)=573.31µs
     http_req_sending...............: avg=30.01µs  min=4.97µs  med=18.29µs  max=243.99ms p(90)=23.8µs   p(95)=25.95µs  p(99.9)=615.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.8ms  min=21.2ms  med=110.99ms max=340.77ms p(90)=140.38ms p(95)=149.73ms p(99.9)=191.13ms
     http_reqs......................: 53026   433.419228/s
     iteration_duration.............: avg=113.39ms min=36.21ms med=111.41ms max=354.11ms p(90)=140.84ms p(95)=150.19ms p(99.9)=194.19ms
     iterations.....................: 52926   432.601857/s
     success_rate...................: 100.00% ✓ 52926      ✗ 0    
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

     checks.........................: 100.00% ✓ 96756      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=6.67µs   min=1.2µs   med=3.45µs   max=4.02ms   p(90)=4.98µs   p(95)=5.57µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.94µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=185.32ms min=23.46ms med=184.7ms  max=368.87ms p(90)=198.8ms  p(95)=203.29ms p(99.9)=276.61ms
       { expected_response:true }...: avg=185.32ms min=23.46ms med=184.7ms  max=368.87ms p(90)=198.8ms  p(95)=203.29ms p(99.9)=276.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32352
     http_req_receiving.............: avg=93.81µs  min=32.84µs med=90.3µs   max=2.55ms   p(90)=122.25µs p(95)=134.91µs p(99.9)=467.82µs
     http_req_sending...............: avg=27.6µs   min=5.9µs   med=18.44µs  max=100.66ms p(90)=23.6µs   p(95)=25.55µs  p(99.9)=561.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.2ms  min=23.34ms med=184.58ms max=368.28ms p(90)=198.7ms  p(95)=203.19ms p(99.9)=276.49ms
     http_reqs......................: 32352   263.782283/s
     iteration_duration.............: avg=186.12ms min=59.3ms  med=185.02ms max=384.34ms p(90)=199.1ms  p(95)=203.59ms p(99.9)=277.8ms 
     iterations.....................: 32252   262.966932/s
     success_rate...................: 100.00% ✓ 32252      ✗ 0    
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

     checks.........................: 100.00% ✓ 92001      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   303 kB/s
     http_req_blocked...............: avg=7.4µs    min=1.23µs  med=3.77µs   max=4.27ms   p(90)=5.19µs   p(95)=5.82µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=3.33µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=194.88ms min=18.24ms med=181.59ms max=655.5ms  p(90)=234.84ms p(95)=272.26ms p(99.9)=576.72ms
       { expected_response:true }...: avg=194.88ms min=18.24ms med=181.59ms max=655.5ms  p(90)=234.84ms p(95)=272.26ms p(99.9)=576.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30767
     http_req_receiving.............: avg=103.08µs min=39.4µs  med=93.5µs   max=76.67ms  p(90)=125.46µs p(95)=138.19µs p(99.9)=853.28µs
     http_req_sending...............: avg=29.23µs  min=5.71µs  med=18.97µs  max=59.07ms  p(90)=23.8µs   p(95)=25.7µs   p(99.9)=549.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.75ms min=18.1ms  med=181.47ms max=655.39ms p(90)=234.7ms  p(95)=272.13ms p(99.9)=576.64ms
     http_reqs......................: 30767   252.027601/s
     iteration_duration.............: avg=195.76ms min=39.41ms med=181.99ms max=655.77ms p(90)=235.29ms p(95)=273.67ms p(99.9)=577.07ms
     iterations.....................: 30667   251.208452/s
     success_rate...................: 100.00% ✓ 30667      ✗ 0    
     vus............................: 37      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6162      ✗ 0   
     data_received..................: 206 MB  1.6 MB/s
     data_sent......................: 2.6 MB  20 kB/s
     http_req_blocked...............: avg=49.6µs  min=1.2µs   med=3.72µs  max=4.26ms   p(90)=5.38µs   p(95)=6.54µs   p(99.9)=3.91ms  
     http_req_connecting............: avg=44.71µs min=0s      med=0s      max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=3.88ms  
     http_req_duration..............: avg=2.82s   min=39.28ms med=2.93s   max=4.96s    p(90)=3.55s    p(95)=3.76s    p(99.9)=4.67s   
       { expected_response:true }...: avg=2.82s   min=39.28ms med=2.93s   max=4.96s    p(90)=3.55s    p(95)=3.76s    p(99.9)=4.67s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2154
     http_req_receiving.............: avg=98.73µs min=32.87µs med=92.83µs max=434.55µs p(90)=138.62µs p(95)=153.04µs p(99.9)=376.61µs
     http_req_sending...............: avg=71.36µs min=7.05µs  med=18.66µs max=35.7ms   p(90)=24.63µs  p(95)=30.63µs  p(99.9)=11.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.82s   min=39.13ms med=2.93s   max=4.96s    p(90)=3.55s    p(95)=3.76s    p(99.9)=4.67s   
     http_reqs......................: 2154    16.868845/s
     iteration_duration.............: avg=2.95s   min=1.23s   med=2.97s   max=4.96s    p(90)=3.58s    p(95)=3.76s    p(99.9)=4.7s    
     iterations.....................: 2054    16.085705/s
     success_rate...................: 100.00% ✓ 2054      ✗ 0   
     vus............................: 39      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

