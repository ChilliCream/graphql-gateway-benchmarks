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
| fusion | 16.6.1 | 1,900 | 1,945 | 1,895 | 0.9% |  |
| fusion-nightly | 16.6.2-p.6 | 1,891 | 1,940 | 1,880 | 1.1% |  |
| fusion-nightly-net11 | 16.6.2-p.6 | 1,878 | 1,923 | 1,868 | 1.0% |  |
| hive-router | v0.0.84 | 1,823 | 1,891 | 1,808 | 1.5% |  |
| fusion-nightly-fed | 16.6.2-p.6 | 1,790 | 1,840 | 1,780 | 1.2% |  |
| grafbase | 0.53.5 | 1,285 | 1,317 | 1,274 | 1.1% |  |
| cosmo | 0.334.0 | 1,178 | 1,225 | 1,169 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 567 | 581 | 563 | 1.1% |  |
| apollo-router | v2.16.1 | 429 | 439 | 426 | 1.2% |  |
| hive-gateway | 2.10.8 | 262 | 270 | 259 | 1.4% |  |
| apollo-gateway | 2.14.3 | 260 | 263 | 258 | 0.6% |  |
| feddi | 5ff8b6165878 | 18 | 19 | 18 | 2.9% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 695070      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=2.8µs    min=862ns   med=1.93µs  max=7.85ms   p(90)=3.7µs    p(95)=4.47µs  p(99.9)=32.62µs
     http_req_connecting............: avg=377ns    min=0s      med=0s      max=3.52ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.67ms  min=17.52ms med=25.09ms max=298.52ms p(90)=29.95ms  p(95)=31.72ms p(99.9)=49.65ms
       { expected_response:true }...: avg=25.67ms  min=17.52ms med=25.09ms max=298.52ms p(90)=29.95ms  p(95)=31.72ms p(99.9)=49.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231790
     http_req_receiving.............: avg=294.27µs min=49.73µs med=91.49µs max=172.65ms p(90)=724.84µs p(95)=1.23ms  p(99.9)=8.09ms 
     http_req_sending...............: avg=32.39µs  min=4.44µs  med=8.16µs  max=181.42ms p(90)=18.71µs  p(95)=34.68µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.34ms  min=17.43ms med=24.77ms max=297.99ms p(90)=29.56ms  p(95)=31.29ms p(99.9)=48.05ms
     http_reqs......................: 231790  1900.96441/s
     iteration_duration.............: avg=25.88ms  min=17.67ms med=25.29ms max=307.23ms p(90)=30.15ms  p(95)=31.92ms p(99.9)=50.03ms
     iterations.....................: 231690  1900.144287/s
     success_rate...................: 100.00% ✓ 231690      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 691740      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=3.43µs   min=972ns   med=2.63µs  max=3.62ms   p(90)=4.45µs   p(95)=5.27µs  p(99.9)=38.3µs 
     http_req_connecting............: avg=376ns    min=0s      med=0s      max=3.58ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.78ms  min=17.22ms med=25.17ms max=309.7ms  p(90)=30.11ms  p(95)=31.98ms p(99.9)=50.1ms 
       { expected_response:true }...: avg=25.78ms  min=17.22ms med=25.17ms max=309.7ms  p(90)=30.11ms  p(95)=31.98ms p(99.9)=50.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 230680
     http_req_receiving.............: avg=304.41µs min=51.16µs med=96.83µs max=206.69ms p(90)=746.95µs p(95)=1.26ms  p(99.9)=7.94ms 
     http_req_sending...............: avg=34.17µs  min=4.58µs  med=9.71µs  max=170.91ms p(90)=19.47µs  p(95)=39.84µs p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.44ms  min=17.12ms med=24.85ms max=309.02ms p(90)=29.71ms  p(95)=31.53ms p(99.9)=48.93ms
     http_reqs......................: 230680  1891.9526/s
     iteration_duration.............: avg=26.01ms  min=17.47ms med=25.38ms max=316.81ms p(90)=30.31ms  p(95)=32.19ms p(99.9)=50.62ms
     iterations.....................: 230580  1891.132437/s
     success_rate...................: 100.00% ✓ 230580      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686631      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.04µs   min=852ns   med=2.22µs  max=4.12ms   p(90)=3.95µs   p(95)=4.65µs  p(99.9)=34.35µs
     http_req_connecting............: avg=412ns    min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.99ms  min=17.36ms med=25.42ms max=317.53ms p(90)=30.24ms  p(95)=32.03ms p(99.9)=49.25ms
       { expected_response:true }...: avg=25.99ms  min=17.36ms med=25.42ms max=317.53ms p(90)=30.24ms  p(95)=32.03ms p(99.9)=49.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228977
     http_req_receiving.............: avg=271.25µs min=50.01µs med=90.77µs max=222ms    p(90)=660.99µs p(95)=1.16ms  p(99.9)=7.1ms  
     http_req_sending...............: avg=31.16µs  min=4.5µs   med=8.75µs  max=122.39ms p(90)=18.98µs  p(95)=29.85µs p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.68ms  min=17.16ms med=25.13ms max=317.2ms  p(90)=29.89ms  p(95)=31.64ms p(99.9)=48.31ms
     http_reqs......................: 228977  1878.058839/s
     iteration_duration.............: avg=26.2ms   min=17.52ms med=25.62ms max=330.77ms p(90)=30.44ms  p(95)=32.24ms p(99.9)=49.5ms 
     iterations.....................: 228877  1877.238644/s
     success_rate...................: 100.00% ✓ 228877      ✗ 0     
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

     checks.........................: 100.00% ✓ 666669      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=3.75µs  min=1.03µs  med=2.81µs  max=29.59ms  p(90)=4.54µs  p(95)=5.29µs   p(99.9)=39.84µs
     http_req_connecting............: avg=425ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.77ms min=18.16ms med=26.31ms max=301.28ms p(90)=30.55ms p(95)=32ms     p(99.9)=48.87ms
       { expected_response:true }...: avg=26.77ms min=18.16ms med=26.31ms max=301.28ms p(90)=30.55ms p(95)=32ms     p(99.9)=48.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222323
     http_req_receiving.............: avg=80.08µs min=25.31µs med=54.07µs max=205.82ms p(90)=99.03µs p(95)=127.56µs p(99.9)=2.09ms 
     http_req_sending...............: avg=33.45µs min=4.74µs  med=10.75µs max=231.63ms p(90)=19.14µs p(95)=27.33µs  p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.65ms min=18.11ms med=26.21ms max=291.08ms p(90)=30.43ms p(95)=31.87ms  p(99.9)=47.89ms
     http_reqs......................: 222323  1823.015992/s
     iteration_duration.............: avg=26.99ms min=18.43ms med=26.52ms max=313.12ms p(90)=30.76ms p(95)=32.21ms  p(99.9)=49.34ms
     iterations.....................: 222223  1822.196007/s
     success_rate...................: 100.00% ✓ 222223      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 655071      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=2.96µs   min=901ns   med=2.07µs  max=4.2ms    p(90)=3.81µs   p(95)=4.53µs  p(99.9)=32.12µs
     http_req_connecting............: avg=456ns    min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.25ms  min=17.8ms  med=26.67ms max=296.85ms p(90)=31.85ms  p(95)=33.71ms p(99.9)=51.63ms
       { expected_response:true }...: avg=27.25ms  min=17.8ms  med=26.67ms max=296.85ms p(90)=31.85ms  p(95)=33.71ms p(99.9)=51.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 218457
     http_req_receiving.............: avg=295.14µs min=49.55µs med=93.88µs max=171.93ms p(90)=721.71µs p(95)=1.21ms  p(99.9)=7.92ms 
     http_req_sending...............: avg=31.31µs  min=4.41µs  med=8.76µs  max=133.39ms p(90)=19.58µs  p(95)=34.86µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.92ms  min=17.7ms  med=26.36ms max=296.2ms  p(90)=31.47ms  p(95)=33.29ms p(99.9)=50.06ms
     http_reqs......................: 218457  1790.925755/s
     iteration_duration.............: avg=27.47ms  min=18ms    med=26.87ms max=315.15ms p(90)=32.05ms  p(95)=33.91ms p(99.9)=52.06ms
     iterations.....................: 218357  1790.105948/s
     success_rate...................: 100.00% ✓ 218357      ✗ 0     
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

     checks.........................: 100.00% ✓ 470148      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=3.38µs   min=872ns   med=2.2µs   max=3.43ms   p(90)=4.49µs   p(95)=5.42µs   p(99.9)=40.32µs
     http_req_connecting............: avg=615ns    min=0s      med=0s      max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.03ms  min=18.15ms med=37.84ms max=308.88ms p(90)=44.71ms  p(95)=46.68ms  p(99.9)=62.61ms
       { expected_response:true }...: avg=38.03ms  min=18.15ms med=37.84ms max=308.88ms p(90)=44.71ms  p(95)=46.68ms  p(99.9)=62.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156816
     http_req_receiving.............: avg=133.42µs min=26.73µs med=53.45µs max=266.49ms p(90)=120.08µs p(95)=165.34µs p(99.9)=2.72ms 
     http_req_sending...............: avg=33.73µs  min=4.64µs  med=9.24µs  max=49.07ms  p(90)=23.64µs  p(95)=53.84µs  p(99.9)=2.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.86ms  min=18.05ms med=37.73ms max=116.94ms p(90)=44.59ms  p(95)=46.53ms  p(99.9)=59.74ms
     http_reqs......................: 156816  1285.448314/s
     iteration_duration.............: avg=38.28ms  min=20.87ms med=38.07ms max=318.93ms p(90)=44.93ms  p(95)=46.89ms  p(99.9)=62.96ms
     iterations.....................: 156716  1284.628597/s
     success_rate...................: 100.00% ✓ 156716      ✗ 0     
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

     checks.........................: 100.00% ✓ 431055      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=4.86µs  min=1.12µs  med=2.77µs  max=8.59ms   p(90)=4.31µs   p(95)=5.01µs   p(99.9)=38.63µs 
     http_req_connecting............: avg=1.71µs  min=0s      med=0s      max=8.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.51ms min=18.46ms med=40.87ms max=315.39ms p(90)=50.07ms  p(95)=53.06ms  p(99.9)=68.35ms 
       { expected_response:true }...: avg=41.51ms min=18.46ms med=40.87ms max=315.39ms p(90)=50.07ms  p(95)=53.06ms  p(99.9)=68.35ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143785
     http_req_receiving.............: avg=81.72µs min=27.79µs med=66.85µs max=141.68ms p(90)=108.82µs p(95)=127.72µs p(99.9)=976.48µs
     http_req_sending...............: avg=27.32µs min=5.31µs  med=12.46µs max=174.61ms p(90)=19.67µs  p(95)=23.67µs  p(99.9)=979.53µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.4ms  min=18.31ms med=40.77ms max=314.79ms p(90)=49.96ms  p(95)=52.94ms  p(99.9)=68.03ms 
     http_reqs......................: 143785  1178.705316/s
     iteration_duration.............: avg=41.75ms min=21.62ms med=41.09ms max=334.12ms p(90)=50.29ms  p(95)=53.28ms  p(99.9)=68.8ms  
     iterations.....................: 143685  1177.885546/s
     success_rate...................: 100.00% ✓ 143685      ✗ 0     
     vus............................: 1       min=0         max=50  
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

     checks.........................: 100.00% ✓ 207690     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   681 kB/s
     http_req_blocked...............: avg=4.66µs  min=1.04µs  med=2.97µs  max=3.61ms   p(90)=4.48µs   p(95)=5.13µs   p(99.9)=49.21µs 
     http_req_connecting............: avg=1.43µs  min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.32ms min=20.69ms med=85.15ms max=300.46ms p(90)=102.26ms p(95)=111.27ms p(99.9)=195.25ms
       { expected_response:true }...: avg=86.32ms min=20.69ms med=85.15ms max=300.46ms p(90)=102.26ms p(95)=111.27ms p(99.9)=195.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69330
     http_req_receiving.............: avg=83.98µs min=29.18µs med=75.14µs max=54.86ms  p(90)=112.26µs p(95)=126.43µs p(99.9)=660µs   
     http_req_sending...............: avg=24.23µs min=5.02µs  med=14.7µs  max=115.57ms p(90)=21.49µs  p(95)=23.76µs  p(99.9)=605.38µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.21ms min=20.51ms med=85.05ms max=300.31ms p(90)=102.16ms p(95)=111.1ms  p(99.9)=194.89ms
     http_reqs......................: 69330   567.180139/s
     iteration_duration.............: avg=86.67ms min=38.74ms med=85.41ms max=329.75ms p(90)=102.53ms p(95)=111.55ms p(99.9)=196.59ms
     iterations.....................: 69230   566.362051/s
     success_rate...................: 100.00% ✓ 69230      ✗ 0    
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

     checks.........................: 100.00% ✓ 157245     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   516 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.08µs  med=3.3µs    max=3.77ms   p(90)=4.85µs   p(95)=5.48µs   p(99.9)=105.92µs
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.03ms min=21.15ms med=112.26ms max=328.1ms  p(90)=142.2ms  p(95)=151.76ms p(99.9)=193.04ms
       { expected_response:true }...: avg=114.03ms min=21.15ms med=112.26ms max=328.1ms  p(90)=142.2ms  p(95)=151.76ms p(99.9)=193.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52515
     http_req_receiving.............: avg=96.44µs  min=26.58µs med=82.79µs  max=145.76ms p(90)=114.26µs p(95)=126.71µs p(99.9)=485.94µs
     http_req_sending...............: avg=25.47µs  min=5.45µs  med=17.12µs  max=125.46ms p(90)=22.56µs  p(95)=24.54µs  p(99.9)=481.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.91ms min=20.99ms med=112.15ms max=327.77ms p(90)=142.09ms p(95)=151.64ms p(99.9)=192.59ms
     http_reqs......................: 52515   429.305766/s
     iteration_duration.............: avg=114.49ms min=35.97ms med=112.56ms max=344.13ms p(90)=142.5ms  p(95)=152.05ms p(99.9)=195.4ms 
     iterations.....................: 52415   428.488274/s
     success_rate...................: 100.00% ✓ 52415      ✗ 0    
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

     checks.........................: 100.00% ✓ 95724      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=6.65µs   min=1.11µs  med=3.32µs   max=3.99ms   p(90)=4.68µs   p(95)=5.24µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=187.34ms min=17.96ms med=176.73ms max=628.59ms p(90)=218.88ms p(95)=253.14ms p(99.9)=546.06ms
       { expected_response:true }...: avg=187.34ms min=17.96ms med=176.73ms max=628.59ms p(90)=218.88ms p(95)=253.14ms p(99.9)=546.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32008
     http_req_receiving.............: avg=95.52µs  min=32.65µs med=92.5µs   max=11.97ms  p(90)=123.32µs p(95)=135.9µs  p(99.9)=517.21µs
     http_req_sending...............: avg=25.63µs  min=5.71µs  med=18.33µs  max=70.84ms  p(90)=23µs     p(95)=24.92µs  p(99.9)=473.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.22ms min=17.8ms  med=176.62ms max=628.49ms p(90)=218.74ms p(95)=253.06ms p(99.9)=545.98ms
     http_reqs......................: 32008   262.271433/s
     iteration_duration.............: avg=188.15ms min=66.15ms med=177.12ms max=628.78ms p(90)=219.24ms p(95)=254.32ms p(99.9)=547.67ms
     iterations.....................: 31908   261.452039/s
     success_rate...................: 100.00% ✓ 31908      ✗ 0    
     vus............................: 25      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95388      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=7.02µs   min=1.43µs  med=3.8µs    max=4.06ms   p(90)=5.32µs   p(95)=5.92µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.93µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=187.97ms min=23.69ms med=186.83ms max=387.54ms p(90)=203.71ms p(95)=209.36ms p(99.9)=276.9ms 
       { expected_response:true }...: avg=187.97ms min=23.69ms med=186.83ms max=387.54ms p(90)=203.71ms p(95)=209.36ms p(99.9)=276.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31896
     http_req_receiving.............: avg=106.48µs min=38.82µs med=90.15µs  max=168.88ms p(90)=122.55µs p(95)=135.94µs p(99.9)=595.15µs
     http_req_sending...............: avg=34.19µs  min=6.14µs  med=18.5µs   max=121.78ms p(90)=23.76µs  p(95)=25.74µs  p(99.9)=567.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.83ms min=23.58ms med=186.72ms max=378.72ms p(90)=203.57ms p(95)=209.22ms p(99.9)=276.3ms 
     http_reqs......................: 31896   260.011333/s
     iteration_duration.............: avg=188.79ms min=74.29ms med=187.23ms max=409.54ms p(90)=204ms    p(95)=209.68ms p(99.9)=282.35ms
     iterations.....................: 31796   259.196149/s
     success_rate...................: 100.00% ✓ 31796      ✗ 0    
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

     checks.........................: 100.00% ✓ 6921      ✗ 0   
     data_received..................: 230 MB  1.8 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=45.45µs  min=1.22µs  med=3.62µs  max=4.11ms  p(90)=5.16µs   p(95)=6.08µs   p(99.9)=3.7ms   
     http_req_connecting............: avg=41.11µs  min=0s      med=0s      max=4.06ms  p(90)=0s       p(95)=0s       p(99.9)=3.67ms  
     http_req_duration..............: avg=2.51s    min=38.17ms med=2.59s   max=4.59s   p(90)=3.23s    p(95)=3.47s    p(99.9)=4.12s   
       { expected_response:true }...: avg=2.51s    min=38.17ms med=2.59s   max=4.59s   p(90)=3.23s    p(95)=3.47s    p(99.9)=4.12s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2407
     http_req_receiving.............: avg=102.14µs min=32.76µs med=92.49µs max=8.04ms  p(90)=134.31µs p(95)=149.77µs p(99.9)=875.79µs
     http_req_sending...............: avg=60.97µs  min=6.53µs  med=18.67µs max=66.12ms p(90)=24.19µs  p(95)=28.45µs  p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.51s    min=38.07ms med=2.59s   max=4.59s   p(90)=3.23s    p(95)=3.47s    p(99.9)=4.12s   
     http_reqs......................: 2407    18.97689/s
     iteration_duration.............: avg=2.62s    min=917.5ms med=2.62s   max=4.59s   p(90)=3.25s    p(95)=3.48s    p(99.9)=4.12s   
     iterations.....................: 2307    18.188486/s
     success_rate...................: 100.00% ✓ 2307      ✗ 0   
     vus............................: 49      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

