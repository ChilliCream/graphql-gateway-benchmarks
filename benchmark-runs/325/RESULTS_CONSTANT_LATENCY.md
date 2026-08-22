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
| fusion-nightly | 16.6.2-p.5 | 1,887 | 1,935 | 1,877 | 1.0% |  |
| fusion | 16.6.1 | 1,875 | 1,924 | 1,868 | 1.0% |  |
| fusion-nightly-net11 | 16.6.2-p.5 | 1,875 | 1,926 | 1,864 | 1.2% |  |
| hive-router | v0.0.84 | 1,819 | 1,886 | 1,809 | 1.4% |  |
| fusion-nightly-fed | 16.6.2-p.5 | 1,798 | 1,848 | 1,792 | 1.0% |  |
| grafbase | 0.53.5 | 1,286 | 1,321 | 1,277 | 1.2% |  |
| cosmo | 0.334.0 | 1,228 | 1,267 | 1,224 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 580 | 599 | 578 | 1.2% |  |
| apollo-router | v2.16.1 | 403 | 431 | 397 | 3.1% |  |
| hive-gateway | 2.10.8 | 258 | 263 | 257 | 0.8% |  |
| apollo-gateway | 2.14.3 | 255 | 260 | 255 | 0.7% |  |
| feddi | 5ff8b6165878 | 17 | 17 | 16 | 3.1% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690069      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=3.02µs   min=801ns   med=2.1µs   max=4.23ms   p(90)=3.71µs   p(95)=4.43µs  p(99.9)=32.26µs
     http_req_connecting............: avg=480ns    min=0s      med=0s      max=3.79ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.86ms  min=17.47ms med=25.24ms max=299.25ms p(90)=30.28ms  p(95)=32.13ms p(99.9)=49.63ms
       { expected_response:true }...: avg=25.86ms  min=17.47ms med=25.24ms max=299.25ms p(90)=30.28ms  p(95)=32.13ms p(99.9)=49.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230123
     http_req_receiving.............: avg=297.35µs min=50.93µs med=92.63µs max=252.09ms p(90)=721.17µs p(95)=1.22ms  p(99.9)=8.26ms 
     http_req_sending...............: avg=31.61µs  min=4.39µs  med=8.52µs  max=130.74ms p(90)=18.26µs  p(95)=35.71µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.53ms  min=17.35ms med=24.94ms max=274.51ms p(90)=29.88ms  p(95)=31.7ms  p(99.9)=47.9ms 
     http_reqs......................: 230123  1887.383329/s
     iteration_duration.............: avg=26.07ms  min=17.66ms med=25.45ms max=313.36ms p(90)=30.48ms  p(95)=32.33ms p(99.9)=49.92ms
     iterations.....................: 230023  1886.563166/s
     success_rate...................: 100.00% ✓ 230023      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685947      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.91µs   min=872ns   med=1.98µs  max=8.23ms   p(90)=3.79µs   p(95)=4.53µs  p(99.9)=31.07µs
     http_req_connecting............: avg=387ns    min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.01ms  min=17.43ms med=25.43ms max=306.18ms p(90)=30.41ms  p(95)=32.21ms p(99.9)=50.14ms
       { expected_response:true }...: avg=26.01ms  min=17.43ms med=25.43ms max=306.18ms p(90)=30.41ms  p(95)=32.21ms p(99.9)=50.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228749
     http_req_receiving.............: avg=309.49µs min=50.32µs med=92.65µs max=160.39ms p(90)=784.59µs p(95)=1.31ms  p(99.9)=8.87ms 
     http_req_sending...............: avg=32.28µs  min=4.39µs  med=8.43µs  max=192.5ms  p(90)=18.79µs  p(95)=30.34µs p(99.9)=1.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.67ms  min=17.27ms med=25.11ms max=284.48ms p(90)=30ms     p(95)=31.74ms p(99.9)=48.12ms
     http_reqs......................: 228749  1875.773176/s
     iteration_duration.............: avg=26.23ms  min=17.69ms med=25.63ms max=315.49ms p(90)=30.62ms  p(95)=32.42ms p(99.9)=50.42ms
     iterations.....................: 228649  1874.953162/s
     success_rate...................: 100.00% ✓ 228649      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685524      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=881ns   med=1.95µs  max=5.99ms   p(90)=3.58µs   p(95)=4.31µs  p(99.9)=28.14µs
     http_req_connecting............: avg=410ns    min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.03ms  min=16.7ms  med=25.48ms max=293ms    p(90)=30.34ms  p(95)=32.14ms p(99.9)=48.63ms
       { expected_response:true }...: avg=26.03ms  min=16.7ms  med=25.48ms max=293ms    p(90)=30.34ms  p(95)=32.14ms p(99.9)=48.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228608
     http_req_receiving.............: avg=257.06µs min=48.48µs med=85.78µs max=25.2ms   p(90)=609.57µs p(95)=1.13ms  p(99.9)=7.25ms 
     http_req_sending...............: avg=30.79µs  min=4.49µs  med=8.28µs  max=200.44ms p(90)=18.28µs  p(95)=28.1µs  p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.74ms  min=15.96ms med=25.21ms max=292.38ms p(90)=30ms     p(95)=31.76ms p(99.9)=47.35ms
     http_reqs......................: 228608  1875.031951/s
     iteration_duration.............: avg=26.24ms  min=16.95ms med=25.68ms max=310.5ms  p(90)=30.54ms  p(95)=32.33ms p(99.9)=49.03ms
     iterations.....................: 228508  1874.211756/s
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
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 665466     ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.91µs  min=942ns   med=2.1µs   max=4.12ms   p(90)=3.62µs  p(95)=4.29µs   p(99.9)=29.96µs
     http_req_connecting............: avg=454ns   min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.83ms min=18.23ms med=26.4ms  max=317.49ms p(90)=30.58ms p(95)=32.01ms  p(99.9)=47.54ms
       { expected_response:true }...: avg=26.83ms min=18.23ms med=26.4ms  max=317.49ms p(90)=30.58ms p(95)=32.01ms  p(99.9)=47.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 221922
     http_req_receiving.............: avg=72.98µs min=24.96µs med=49.89µs max=147.15ms p(90)=90.07µs p(95)=112.47µs p(99.9)=1.73ms 
     http_req_sending...............: avg=28.02µs min=4.68µs  med=9.3µs   max=139.88ms p(90)=16.9µs  p(95)=23.08µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.73ms min=18.14ms med=26.32ms max=317.29ms p(90)=30.48ms p(95)=31.9ms   p(99.9)=45.93ms
     http_reqs......................: 221922  1819.78172/s
     iteration_duration.............: avg=27.04ms min=19.09ms med=26.6ms  max=326.55ms p(90)=30.78ms p(95)=32.22ms  p(99.9)=47.91ms
     iterations.....................: 221822  1818.96171/s
     success_rate...................: 100.00% ✓ 221822     ✗ 0     
     vus............................: 50      min=0        max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 657711      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=2.83µs   min=861ns   med=1.97µs  max=3.72ms   p(90)=3.52µs   p(95)=4.23µs  p(99.9)=31.39µs
     http_req_connecting............: avg=452ns    min=0s      med=0s      max=3.69ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.14ms  min=18.02ms med=26.55ms max=297.69ms p(90)=31.79ms  p(95)=33.67ms p(99.9)=50.32ms
       { expected_response:true }...: avg=27.14ms  min=18.02ms med=26.55ms max=297.69ms p(90)=31.79ms  p(95)=33.67ms p(99.9)=50.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219337
     http_req_receiving.............: avg=329.78µs min=50.54µs med=99.14µs max=220.13ms p(90)=835.95µs p(95)=1.33ms  p(99.9)=8.42ms 
     http_req_sending...............: avg=31µs     min=4.58µs  med=8.45µs  max=151.93ms p(90)=17.96µs  p(95)=29.36µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.78ms  min=17.77ms med=26.21ms max=297.25ms p(90)=31.37ms  p(95)=33.2ms  p(99.9)=48.25ms
     http_reqs......................: 219337  1798.255362/s
     iteration_duration.............: avg=27.36ms  min=18.26ms med=26.75ms max=309.1ms  p(90)=31.98ms  p(95)=33.88ms p(99.9)=50.79ms
     iterations.....................: 219237  1797.435503/s
     success_rate...................: 100.00% ✓ 219237      ✗ 0     
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

     checks.........................: 100.00% ✓ 470379      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=4.07µs  min=1.01µs  med=2.89µs  max=3.74ms   p(90)=5.23µs   p(95)=6.27µs   p(99.9)=48.69µs
     http_req_connecting............: avg=643ns   min=0s      med=0s      max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.99ms min=18.42ms med=37.75ms max=322.37ms p(90)=44.66ms  p(95)=46.77ms  p(99.9)=63.55ms
       { expected_response:true }...: avg=37.99ms min=18.42ms med=37.75ms max=322.37ms p(90)=44.66ms  p(95)=46.77ms  p(99.9)=63.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156893
     http_req_receiving.............: avg=93.45µs min=27.49µs med=61.78µs max=242.12ms p(90)=130.91µs p(95)=181.81µs p(99.9)=2.35ms 
     http_req_sending...............: avg=37.97µs min=4.49µs  med=11.24µs max=116.05ms p(90)=25.56µs  p(95)=74.41µs  p(99.9)=2.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.86ms min=18.33ms med=37.63ms max=309.34ms p(90)=44.53ms  p(95)=46.62ms  p(99.9)=62.2ms 
     http_reqs......................: 156893  1286.027587/s
     iteration_duration.............: avg=38.26ms min=21.28ms med=38ms    max=332.04ms p(90)=44.89ms  p(95)=46.99ms  p(99.9)=64ms   
     iterations.....................: 156793  1285.207902/s
     success_rate...................: 100.00% ✓ 156793      ✗ 0     
     vus............................: 14      min=0         max=50  
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

     checks.........................: 100.00% ✓ 449295      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.93µs  min=1.12µs  med=3.03µs  max=3.39ms   p(90)=4.68µs   p(95)=5.41µs   p(99.9)=35.66µs 
     http_req_connecting............: avg=575ns   min=0s      med=0s      max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.81ms min=18.88ms med=39.19ms max=317.2ms  p(90)=47.82ms  p(95)=50.62ms  p(99.9)=66.49ms 
       { expected_response:true }...: avg=39.81ms min=18.88ms med=39.19ms max=317.2ms  p(90)=47.82ms  p(95)=50.62ms  p(99.9)=66.49ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149865
     http_req_receiving.............: avg=82.22µs min=25.06µs med=67.16µs max=29.49ms  p(90)=109.22µs p(95)=128.33µs p(99.9)=980.76µs
     http_req_sending...............: avg=28.49µs min=4.61µs  med=12.63µs max=183.98ms p(90)=20.25µs  p(95)=24.55µs  p(99.9)=1.06ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.7ms  min=18.73ms med=39.08ms max=316.65ms p(90)=47.71ms  p(95)=50.49ms  p(99.9)=65.77ms 
     http_reqs......................: 149865  1228.573643/s
     iteration_duration.............: avg=40.05ms min=23.05ms med=39.42ms max=324.65ms p(90)=48.04ms  p(95)=50.83ms  p(99.9)=66.89ms 
     iterations.....................: 149765  1227.753856/s
     success_rate...................: 100.00% ✓ 149765      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 212502     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   697 kB/s
     http_req_blocked...............: avg=4.28µs  min=1.05µs  med=2.82µs  max=3.37ms   p(90)=4.43µs   p(95)=5.09µs   p(99.9)=51.89µs 
     http_req_connecting............: avg=1.21µs  min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.37ms min=20.59ms med=82.69ms max=314.45ms p(90)=101.6ms  p(95)=109.58ms p(99.9)=194.89ms
       { expected_response:true }...: avg=84.37ms min=20.59ms med=82.69ms max=314.45ms p(90)=101.6ms  p(95)=109.58ms p(99.9)=194.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70934
     http_req_receiving.............: avg=83.97µs min=29.09µs med=73.24µs max=186.38ms p(90)=110.44µs p(95)=124.06µs p(99.9)=583.5µs 
     http_req_sending...............: avg=28.97µs min=4.78µs  med=13.85µs max=185.69ms p(90)=21.28µs  p(95)=23.55µs  p(99.9)=590.16µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.26ms min=20.45ms med=82.58ms max=313.89ms p(90)=101.5ms  p(95)=109.45ms p(99.9)=193.78ms
     http_reqs......................: 70934   580.309135/s
     iteration_duration.............: avg=84.71ms min=33.35ms med=82.95ms max=329.36ms p(90)=101.85ms p(95)=109.89ms p(99.9)=196.41ms
     iterations.....................: 70834   579.491037/s
     success_rate...................: 100.00% ✓ 70834      ✗ 0    
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

     checks.........................: 100.00% ✓ 147717     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   484 kB/s
     http_req_blocked...............: avg=5.98µs   min=1.19µs  med=3.71µs   max=4.17ms   p(90)=5.32µs   p(95)=5.94µs   p(99.9)=519.21µs
     http_req_connecting............: avg=1.98µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=376.35µs
     http_req_duration..............: avg=121.4ms  min=21.37ms med=119.42ms max=341.72ms p(90)=152.1ms  p(95)=162.38ms p(99.9)=209.54ms
       { expected_response:true }...: avg=121.4ms  min=21.37ms med=119.42ms max=341.72ms p(90)=152.1ms  p(95)=162.38ms p(99.9)=209.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49339
     http_req_receiving.............: avg=93.83µs  min=32.09µs med=85.03µs  max=97.64ms  p(90)=117.85µs p(95)=131.22µs p(99.9)=581.73µs
     http_req_sending...............: avg=27.75µs  min=5.58µs  med=17.9µs   max=96.25ms  p(90)=23.63µs  p(95)=25.74µs  p(99.9)=591.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.28ms min=21.22ms med=119.31ms max=341.46ms p(90)=151.97ms p(95)=162.25ms p(99.9)=208.54ms
     http_reqs......................: 49339   403.258047/s
     iteration_duration.............: avg=121.89ms min=40.76ms med=119.72ms max=355.69ms p(90)=152.42ms p(95)=162.72ms p(99.9)=211.64ms
     iterations.....................: 49239   402.440726/s
     success_rate...................: 100.00% ✓ 49239      ✗ 0    
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

     checks.........................: 100.00% ✓ 94440      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=6.16µs   min=1.17µs  med=3.14µs   max=4.18ms   p(90)=4.55µs   p(95)=5.14µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=2.82µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=189.92ms min=17.94ms med=176.7ms  max=656.45ms p(90)=233.8ms  p(95)=268.45ms p(99.9)=558.58ms
       { expected_response:true }...: avg=189.92ms min=17.94ms med=176.7ms  max=656.45ms p(90)=233.8ms  p(95)=268.45ms p(99.9)=558.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31580
     http_req_receiving.............: avg=94.15µs  min=32.77µs med=89.72µs  max=28.39ms  p(90)=120.61µs p(95)=132.48µs p(99.9)=700.88µs
     http_req_sending...............: avg=23.26µs  min=5.01µs  med=17.45µs  max=72.13ms  p(90)=21.85µs  p(95)=23.61µs  p(99.9)=533.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.8ms  min=17.8ms  med=176.59ms max=656.39ms p(90)=233.68ms p(95)=268.32ms p(99.9)=558.47ms
     http_reqs......................: 31580   258.376438/s
     iteration_duration.............: avg=190.75ms min=37.47ms med=177.12ms max=656.67ms p(90)=234.2ms  p(95)=269.61ms p(99.9)=558.9ms 
     iterations.....................: 31480   257.558273/s
     success_rate...................: 100.00% ✓ 31480      ✗ 0    
     vus............................: 44      min=0        max=50 
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

     checks.........................: 100.00% ✓ 93696      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 38 MB   307 kB/s
     http_req_blocked...............: avg=4.68µs   min=1.15µs  med=3.24µs   max=1.9ms    p(90)=4.62µs   p(95)=5.17µs   p(99.9)=538.36µs
     http_req_connecting............: avg=1.2µs    min=0s      med=0s       max=1.86ms   p(90)=0s       p(95)=0s       p(99.9)=516.85µs
     http_req_duration..............: avg=191.4ms  min=23.59ms med=174.42ms max=343.34ms p(90)=248.97ms p(95)=254.62ms p(99.9)=328.05ms
       { expected_response:true }...: avg=191.4ms  min=23.59ms med=174.42ms max=343.34ms p(90)=248.97ms p(95)=254.62ms p(99.9)=328.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31332
     http_req_receiving.............: avg=94.81µs  min=31.07µs med=88.09µs  max=41.73ms  p(90)=118.16µs p(95)=129.46µs p(99.9)=467.46µs
     http_req_sending...............: avg=23.52µs  min=5.38µs  med=17.33µs  max=37.29ms  p(90)=22.07µs  p(95)=23.89µs  p(99.9)=461.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.28ms min=23.5ms  med=174.3ms  max=343.16ms p(90)=248.84ms p(95)=254.51ms p(99.9)=327.66ms
     http_reqs......................: 31332   255.404321/s
     iteration_duration.............: avg=192.23ms min=70.23ms med=175.32ms max=350.69ms p(90)=249.27ms p(95)=254.92ms p(99.9)=328.72ms
     iterations.....................: 31232   254.589167/s
     success_rate...................: 100.00% ✓ 31232      ✗ 0    
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

     checks.........................: 100.00% ✓ 6216      ✗ 0   
     data_received..................: 208 MB  1.6 MB/s
     data_sent......................: 2.6 MB  21 kB/s
     http_req_blocked...............: avg=110.6µs  min=1.39µs   med=3.63µs  max=8.65ms  p(90)=5.26µs   p(95)=5.98µs   p(99.9)=8.51ms
     http_req_connecting............: avg=104.43µs min=0s       med=0s      max=8.47ms  p(90)=0s       p(95)=0s       p(99.9)=8.03ms
     http_req_duration..............: avg=2.78s    min=42.46ms  med=2.9s    max=7.87s   p(90)=3.59s    p(95)=3.78s    p(99.9)=6.77s 
       { expected_response:true }...: avg=2.78s    min=42.46ms  med=2.9s    max=7.87s   p(90)=3.59s    p(95)=3.78s    p(99.9)=6.77s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2172
     http_req_receiving.............: avg=98.57µs  min=39.36µs  med=91.45µs max=2.94ms  p(90)=130.15µs p(95)=149.58µs p(99.9)=1.55ms
     http_req_sending...............: avg=46.62µs  min=6.24µs   med=18.2µs  max=16.78ms p(90)=24.03µs  p(95)=28.04µs  p(99.9)=1.85ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.78s    min=42.16ms  med=2.9s    max=7.87s   p(90)=3.59s    p(95)=3.78s    p(99.9)=6.77s 
     http_reqs......................: 2172    17.069579/s
     iteration_duration.............: avg=2.91s    min=321.96ms med=2.94s   max=7.87s   p(90)=3.61s    p(95)=3.8s     p(99.9)=6.81s 
     iterations.....................: 2072    16.283687/s
     success_rate...................: 100.00% ✓ 2072      ✗ 0   
     vus............................: 18      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

