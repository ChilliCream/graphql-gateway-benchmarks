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
| fusion | 16.6.0 | 1,873 | 1,923 | 1,863 | 1.1% |  |
| fusion-nightly | 16.6.1-p.3 | 1,868 | 1,922 | 1,866 | 1.1% |  |
| fusion-nightly-net11 | 16.6.1-p.3 | 1,860 | 1,913 | 1,849 | 1.2% |  |
| hive-router | v0.0.84 | 1,852 | 1,915 | 1,832 | 1.4% |  |
| fusion-nightly-fed | 16.6.1-p.3 | 1,802 | 1,847 | 1,788 | 1.2% |  |
| grafbase | 0.53.5 | 1,281 | 1,310 | 1,272 | 1.1% |  |
| cosmo | 0.334.0 | 1,165 | 1,212 | 1,162 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 560 | 578 | 556 | 1.4% |  |
| apollo-router | v2.16.1 | 397 | 414 | 394 | 1.6% |  |
| hive-gateway | 2.10.8 | 263 | 269 | 262 | 1.1% |  |
| apollo-gateway | 2.14.3 | 258 | 262 | 257 | 0.6% |  |
| feddi | 5ff8b6165878 | 18 | 19 | 18 | 2.4% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684948      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.38µs  min=992ns   med=2.56µs  max=4.13ms   p(90)=4.19µs   p(95)=4.93µs  p(99.9)=39.94µs
     http_req_connecting............: avg=439ns   min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.04ms min=17.43ms med=25.42ms max=302.7ms  p(90)=30.5ms   p(95)=32.39ms p(99.9)=51.61ms
       { expected_response:true }...: avg=26.04ms min=17.43ms med=25.42ms max=302.7ms  p(90)=30.5ms   p(95)=32.39ms p(99.9)=51.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228416
     http_req_receiving.............: avg=315.3µs min=51.74µs med=97.75µs max=35.27ms  p(90)=778.65µs p(95)=1.29ms  p(99.9)=8.88ms 
     http_req_sending...............: avg=35.26µs min=4.85µs  med=9.73µs  max=183.99ms p(90)=19.3µs   p(95)=54µs    p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.69ms min=17.33ms med=25.09ms max=302.01ms p(90)=30.08ms  p(95)=31.91ms p(99.9)=49.7ms 
     http_reqs......................: 228416  1873.405863/s
     iteration_duration.............: avg=26.27ms min=17.61ms med=25.63ms max=319ms    p(90)=30.71ms  p(95)=32.6ms  p(99.9)=52.06ms
     iterations.....................: 228316  1872.585691/s
     success_rate...................: 100.00% ✓ 228316      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683328      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.87µs   min=911ns   med=1.96µs  max=8.98ms   p(90)=3.52µs   p(95)=4.24µs  p(99.9)=31.95µs
     http_req_connecting............: avg=415ns    min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.11ms  min=17.51ms med=25.52ms max=309.31ms p(90)=30.58ms  p(95)=32.41ms p(99.9)=49.45ms
       { expected_response:true }...: avg=26.11ms  min=17.51ms med=25.52ms max=309.31ms p(90)=30.58ms  p(95)=32.41ms p(99.9)=49.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227876
     http_req_receiving.............: avg=325.07µs min=51.71µs med=96.97µs max=44.15ms  p(90)=825.62µs p(95)=1.31ms  p(99.9)=9ms    
     http_req_sending...............: avg=31.37µs  min=4.53µs  med=8.54µs  max=166.67ms p(90)=18.3µs   p(95)=34.3µs  p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.76ms  min=17.34ms med=25.17ms max=308.73ms p(90)=30.15ms  p(95)=31.94ms p(99.9)=47.69ms
     http_reqs......................: 227876  1868.674248/s
     iteration_duration.............: avg=26.33ms  min=17.68ms med=25.72ms max=318.4ms  p(90)=30.79ms  p(95)=32.62ms p(99.9)=49.91ms
     iterations.....................: 227776  1867.854208/s
     success_rate...................: 100.00% ✓ 227776      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 680340      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.82µs   min=801ns   med=1.94µs  max=4.75ms   p(90)=3.63µs   p(95)=4.42µs  p(99.9)=24.07µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.23ms  min=17.72ms med=25.68ms max=303.11ms p(90)=30.56ms  p(95)=32.35ms p(99.9)=49.32ms
       { expected_response:true }...: avg=26.23ms  min=17.72ms med=25.68ms max=303.11ms p(90)=30.56ms  p(95)=32.35ms p(99.9)=49.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226880
     http_req_receiving.............: avg=277.68µs min=50.5µs  med=89.81µs max=211.18ms p(90)=662.45µs p(95)=1.16ms  p(99.9)=7.55ms 
     http_req_sending...............: avg=31.25µs  min=4.4µs   med=8.16µs  max=161.27ms p(90)=17.57µs  p(95)=29.24µs p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.93ms  min=17.4ms  med=25.39ms max=302.63ms p(90)=30.2ms   p(95)=31.95ms p(99.9)=47.7ms 
     http_reqs......................: 226880  1860.902065/s
     iteration_duration.............: avg=26.44ms  min=18.05ms med=25.88ms max=313.18ms p(90)=30.76ms  p(95)=32.55ms p(99.9)=49.67ms
     iterations.....................: 226780  1860.08185/s
     success_rate...................: 100.00% ✓ 226780      ✗ 0     
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

     checks.........................: 100.00% ✓ 677280      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.82µs  min=912ns   med=2.11µs  max=2.66ms   p(90)=3.7µs   p(95)=4.41µs   p(99.9)=32.22µs
     http_req_connecting............: avg=327ns   min=0s      med=0s      max=2.62ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.35ms min=18.16ms med=25.93ms max=288.13ms p(90)=29.99ms p(95)=31.37ms  p(99.9)=45.71ms
       { expected_response:true }...: avg=26.35ms min=18.16ms med=25.93ms max=288.13ms p(90)=29.99ms p(95)=31.37ms  p(99.9)=45.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225860
     http_req_receiving.............: avg=71.47µs min=24.47µs med=49.76µs max=80.45ms  p(90)=91.14µs p(95)=114.45µs p(99.9)=1.74ms 
     http_req_sending...............: avg=29.21µs min=4.66µs  med=9.24µs  max=108.83ms p(90)=17.33µs p(95)=23.81µs  p(99.9)=1.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.25ms min=18.03ms med=25.85ms max=287.07ms p(90)=29.89ms p(95)=31.26ms  p(99.9)=44.45ms
     http_reqs......................: 225860  1852.105194/s
     iteration_duration.............: avg=26.56ms min=18.8ms  med=26.13ms max=299.02ms p(90)=30.19ms p(95)=31.57ms  p(99.9)=46.09ms
     iterations.....................: 225760  1851.285171/s
     success_rate...................: 100.00% ✓ 225760      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 659151      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=2.87µs   min=902ns   med=2.05µs  max=11ms     p(90)=3.83µs   p(95)=4.6µs   p(99.9)=32.88µs
     http_req_connecting............: avg=314ns    min=0s      med=0s      max=2.76ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.07ms  min=17.75ms med=26.52ms max=297.44ms p(90)=31.62ms  p(95)=33.46ms p(99.9)=49.02ms
       { expected_response:true }...: avg=27.07ms  min=17.75ms med=26.52ms max=297.44ms p(90)=31.62ms  p(95)=33.46ms p(99.9)=49.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219817
     http_req_receiving.............: avg=299.68µs min=51.54µs med=96.38µs max=118.76ms p(90)=753.25µs p(95)=1.24ms  p(99.9)=7.14ms 
     http_req_sending...............: avg=31.45µs  min=4.45µs  med=8.86µs  max=119.8ms  p(90)=19.57µs  p(95)=30.87µs p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.74ms  min=17.65ms med=26.19ms max=297.24ms p(90)=31.23ms  p(95)=33.03ms p(99.9)=47.59ms
     http_reqs......................: 219817  1802.173016/s
     iteration_duration.............: avg=27.29ms  min=17.9ms  med=26.72ms max=305.77ms p(90)=31.83ms  p(95)=33.66ms p(99.9)=49.31ms
     iterations.....................: 219717  1801.353164/s
     success_rate...................: 100.00% ✓ 219717      ✗ 0     
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

     checks.........................: 100.00% ✓ 468675      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=3.33µs  min=792ns   med=2.11µs  max=3.84ms   p(90)=4.52µs   p(95)=5.49µs   p(99.9)=46.43µs
     http_req_connecting............: avg=621ns   min=0s      med=0s      max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.15ms min=18.15ms med=37.92ms max=307.87ms p(90)=44.87ms  p(95)=46.94ms  p(99.9)=65.09ms
       { expected_response:true }...: avg=38.15ms min=18.15ms med=37.92ms max=307.87ms p(90)=44.87ms  p(95)=46.94ms  p(99.9)=65.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156325
     http_req_receiving.............: avg=82.43µs min=26.58µs med=52.95µs max=79.44ms  p(90)=120.34µs p(95)=167.37µs p(99.9)=2ms    
     http_req_sending...............: avg=32.55µs min=4.52µs  med=9.01µs  max=192ms    p(90)=23.91µs  p(95)=65.76µs  p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.03ms min=18.03ms med=37.82ms max=307.15ms p(90)=44.75ms  p(95)=46.81ms  p(99.9)=64.53ms
     http_reqs......................: 156325  1281.423655/s
     iteration_duration.............: avg=38.39ms min=20.48ms med=38.15ms max=334.21ms p(90)=45.09ms  p(95)=47.15ms  p(99.9)=65.64ms
     iterations.....................: 156225  1280.603937/s
     success_rate...................: 100.00% ✓ 156225      ✗ 0     
     vus............................: 9       min=0         max=50  
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

     checks.........................: 100.00% ✓ 426354      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.61µs  min=1.15µs  med=2.69µs  max=3.44ms   p(90)=4.22µs   p(95)=4.91µs   p(99.9)=36.89µs 
     http_req_connecting............: avg=604ns   min=0s      med=0s      max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.97ms min=19.01ms med=41.33ms max=315.02ms p(90)=50.78ms  p(95)=53.79ms  p(99.9)=69.33ms 
       { expected_response:true }...: avg=41.97ms min=19.01ms med=41.33ms max=315.02ms p(90)=50.78ms  p(95)=53.79ms  p(99.9)=69.33ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142218
     http_req_receiving.............: avg=83.06µs min=28.4µs  med=68.91µs max=152.18ms p(90)=109.42µs p(95)=128.15µs p(99.9)=842.58µs
     http_req_sending...............: avg=26.67µs min=5.19µs  med=11.7µs  max=209.66ms p(90)=18.06µs  p(95)=21.9µs   p(99.9)=963.11µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.86ms min=18.92ms med=41.22ms max=314.39ms p(90)=50.67ms  p(95)=53.68ms  p(99.9)=68.92ms 
     http_reqs......................: 142218  1165.912812/s
     iteration_duration.............: avg=42.21ms min=22.33ms med=41.55ms max=329.97ms p(90)=51ms     p(95)=54ms     p(99.9)=69.76ms 
     iterations.....................: 142118  1165.093005/s
     success_rate...................: 100.00% ✓ 142118      ✗ 0     
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

     checks.........................: 100.00% ✓ 205311     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   673 kB/s
     http_req_blocked...............: avg=5.19µs  min=1.33µs  med=3.33µs  max=4.08ms   p(90)=4.91µs   p(95)=5.6µs    p(99.9)=48.57µs 
     http_req_connecting............: avg=1.58µs  min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.32ms min=20.41ms med=84.49ms max=314.11ms p(90)=111.9ms  p(95)=122.31ms p(99.9)=206.49ms
       { expected_response:true }...: avg=87.32ms min=20.41ms med=84.49ms max=314.11ms p(90)=111.9ms  p(95)=122.31ms p(99.9)=206.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68537
     http_req_receiving.............: avg=87.78µs min=32.28µs med=77.54µs max=113.56ms p(90)=113.22µs p(95)=126.27µs p(99.9)=613.27µs
     http_req_sending...............: avg=27.39µs min=5.56µs  med=15.14µs max=127.59ms p(90)=21.81µs  p(95)=24.19µs  p(99.9)=630.67µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.21ms min=20.27ms med=84.39ms max=303.09ms p(90)=111.78ms p(95)=122.17ms p(99.9)=205.87ms
     http_reqs......................: 68537   560.696946/s
     iteration_duration.............: avg=87.67ms min=40.74ms med=84.75ms max=331.56ms p(90)=112.14ms p(95)=122.58ms p(99.9)=209.61ms
     iterations.....................: 68437   559.878852/s
     success_rate...................: 100.00% ✓ 68437      ✗ 0    
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

     checks.........................: 100.00% ✓ 145749     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   478 kB/s
     http_req_blocked...............: avg=5.28µs   min=1.11µs  med=3.04µs   max=4.28ms   p(90)=4.51µs   p(95)=5.08µs   p(99.9)=493.42µs
     http_req_connecting............: avg=2.02µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=469.87µs
     http_req_duration..............: avg=123.05ms min=21.19ms med=121.16ms max=346.8ms  p(90)=153.94ms p(95)=163.82ms p(99.9)=209.11ms
       { expected_response:true }...: avg=123.05ms min=21.19ms med=121.16ms max=346.8ms  p(90)=153.94ms p(95)=163.82ms p(99.9)=209.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48683
     http_req_receiving.............: avg=145.05µs min=31.53µs med=83.18µs  max=237.02ms p(90)=115.4µs  p(95)=128.28µs p(99.9)=739.13µs
     http_req_sending...............: avg=30.21µs  min=5.22µs  med=16.06µs  max=221.26ms p(90)=21.5µs   p(95)=23.49µs  p(99.9)=547.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.88ms min=21.09ms med=121.02ms max=277.9ms  p(90)=153.76ms p(95)=163.61ms p(99.9)=205.23ms
     http_reqs......................: 48683   397.897512/s
     iteration_duration.............: avg=123.53ms min=27.33ms med=121.47ms max=370.33ms p(90)=154.23ms p(95)=164.14ms p(99.9)=211.73ms
     iterations.....................: 48583   397.080189/s
     success_rate...................: 100.00% ✓ 48583      ✗ 0    
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

     checks.........................: 100.00% ✓ 96162      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=7.21µs   min=1.46µs  med=3.88µs   max=4ms      p(90)=5.48µs   p(95)=6.14µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=2.87µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=186.44ms min=18.36ms med=174.45ms max=737.67ms p(90)=219.75ms p(95)=249.63ms p(99.9)=628.7ms 
       { expected_response:true }...: avg=186.44ms min=18.36ms med=174.45ms max=737.67ms p(90)=219.75ms p(95)=249.63ms p(99.9)=628.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32154
     http_req_receiving.............: avg=101.79µs min=37.14µs med=95.68µs  max=34.28ms  p(90)=128.48µs p(95)=142.51µs p(99.9)=671.63µs
     http_req_sending...............: avg=25.78µs  min=6.84µs  med=19.44µs  max=65.21ms  p(90)=24.55µs  p(95)=26.6µs   p(99.9)=552.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.31ms min=18.21ms med=174.33ms max=737.54ms p(90)=219.64ms p(95)=249.49ms p(99.9)=628.54ms
     http_reqs......................: 32154   263.299244/s
     iteration_duration.............: avg=187.27ms min=28.08ms med=174.83ms max=737.97ms p(90)=220.15ms p(95)=250.71ms p(99.9)=629.44ms
     iterations.....................: 32054   262.480375/s
     success_rate...................: 100.00% ✓ 32054      ✗ 0    
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

     checks.........................: 100.00% ✓ 94968      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.25µs  med=3.64µs   max=3.7ms    p(90)=5.14µs   p(95)=5.74µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=3.25µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=188.82ms min=23.51ms med=201.99ms max=369.97ms p(90)=234.07ms p(95)=240.66ms p(99.9)=305.13ms
       { expected_response:true }...: avg=188.82ms min=23.51ms med=201.99ms max=369.97ms p(90)=234.07ms p(95)=240.66ms p(99.9)=305.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31756
     http_req_receiving.............: avg=99.08µs  min=36.7µs  med=91.03µs  max=50.1ms   p(90)=123.45µs p(95)=137.23µs p(99.9)=472.2µs 
     http_req_sending...............: avg=28.37µs  min=5.9µs   med=18.85µs  max=86.25ms  p(90)=23.86µs  p(95)=25.9µs   p(99.9)=500.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.69ms min=23.36ms med=201.86ms max=369.44ms p(90)=233.95ms p(95)=240.51ms p(99.9)=304.89ms
     http_reqs......................: 31756   258.818261/s
     iteration_duration.............: avg=189.65ms min=50.82ms med=202.63ms max=392.23ms p(90)=234.37ms p(95)=240.96ms p(99.9)=306.44ms
     iterations.....................: 31656   258.003239/s
     success_rate...................: 100.00% ✓ 31656      ✗ 0    
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

     checks.........................: 100.00% ✓ 6732      ✗ 0   
     data_received..................: 224 MB  1.8 MB/s
     data_sent......................: 2.8 MB  22 kB/s
     http_req_blocked...............: avg=43.36µs  min=1.54µs  med=3.76µs  max=3.61ms  p(90)=5.42µs   p(95)=6.14µs   p(99.9)=3.33ms  
     http_req_connecting............: avg=38.96µs  min=0s      med=0s      max=3.57ms  p(90)=0s       p(95)=0s       p(99.9)=3.3ms   
     http_req_duration..............: avg=2.58s    min=39.68ms med=2.66s   max=4.68s   p(90)=3.4s     p(95)=3.6s     p(99.9)=4.66s   
       { expected_response:true }...: avg=2.58s    min=39.68ms med=2.66s   max=4.68s   p(90)=3.4s     p(95)=3.6s     p(99.9)=4.66s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2344
     http_req_receiving.............: avg=111.94µs min=32.09µs med=92.17µs max=31.19ms p(90)=134.56µs p(95)=152.28µs p(99.9)=776.77µs
     http_req_sending...............: avg=59.67µs  min=6.74µs  med=19.17µs max=29.54ms p(90)=24.54µs  p(95)=28.85µs  p(99.9)=4.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.58s    min=39.58ms med=2.66s   max=4.68s   p(90)=3.4s     p(95)=3.6s     p(99.9)=4.66s   
     http_reqs......................: 2344    18.410376/s
     iteration_duration.............: avg=2.7s     min=512.2ms med=2.7s    max=4.68s   p(90)=3.41s    p(95)=3.62s    p(99.9)=4.66s   
     iterations.....................: 2244    17.62495/s
     success_rate...................: 100.00% ✓ 2244      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

