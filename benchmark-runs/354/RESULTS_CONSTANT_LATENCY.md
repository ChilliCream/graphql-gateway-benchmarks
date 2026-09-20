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
| fusion-nightly | 16.7.0-p.8 | 1,886 | 1,933 | 1,876 | 1.1% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 1,872 | 1,930 | 1,867 | 1.2% |  |
| fusion | 16.6.6 | 1,867 | 1,920 | 1,862 | 1.1% |  |
| hive-router | v0.0.84 | 1,833 | 1,899 | 1,817 | 1.5% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 1,800 | 1,856 | 1,791 | 1.2% |  |
| grafbase | 0.53.5 | 1,312 | 1,327 | 1,307 | 0.7% |  |
| cosmo | 0.334.0 | 1,222 | 1,266 | 1,218 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 575 | 600 | 573 | 1.6% |  |
| apollo-router | v2.16.1 | 433 | 450 | 432 | 1.5% |  |
| apollo-gateway | 2.14.3 | 262 | 266 | 260 | 0.7% |  |
| hive-gateway | 2.10.8 | 253 | 261 | 252 | 1.2% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689895      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.93µs   min=892ns   med=1.99µs  max=8.53ms   p(90)=3.72µs   p(95)=4.46µs  p(99.9)=29.8µs 
     http_req_connecting............: avg=449ns    min=0s      med=0s      max=4.17ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.86ms  min=17.26ms med=25.28ms max=281.93ms p(90)=30.23ms  p(95)=31.99ms p(99.9)=49.31ms
       { expected_response:true }...: avg=25.86ms  min=17.26ms med=25.28ms max=281.93ms p(90)=30.23ms  p(95)=31.99ms p(99.9)=49.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230065
     http_req_receiving.............: avg=292.43µs min=48.82µs med=92.12µs max=125.12ms p(90)=717.49µs p(95)=1.21ms  p(99.9)=8.09ms 
     http_req_sending...............: avg=31.07µs  min=4.66µs  med=8.65µs  max=149.92ms p(90)=18.95µs  p(95)=28.87µs p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.54ms  min=17.16ms med=24.98ms max=281.11ms p(90)=29.83ms  p(95)=31.58ms p(99.9)=47.38ms
     http_reqs......................: 230065  1886.890043/s
     iteration_duration.............: avg=26.08ms  min=17.48ms med=25.49ms max=314.56ms p(90)=30.43ms  p(95)=32.19ms p(99.9)=49.68ms
     iterations.....................: 229965  1886.069888/s
     success_rate...................: 100.00% ✓ 229965      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684525      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.72µs   min=852ns   med=1.9µs   max=3.82ms   p(90)=3.63µs  p(95)=4.36µs  p(99.9)=29.34µs
     http_req_connecting............: avg=380ns    min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.07ms  min=17.29ms med=25.51ms max=287.27ms p(90)=30.25ms p(95)=32.04ms p(99.9)=50.13ms
       { expected_response:true }...: avg=26.07ms  min=17.29ms med=25.51ms max=287.27ms p(90)=30.25ms p(95)=32.04ms p(99.9)=50.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228275
     http_req_receiving.............: avg=413.67µs min=51µs    med=92.92µs max=135.36ms p(90)=1.21ms  p(95)=1.93ms  p(99.9)=10.94ms
     http_req_sending...............: avg=31.45µs  min=4.43µs  med=8.18µs  max=98.92ms  p(90)=18.82µs p(95)=30.3µs  p(99.9)=1.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.62ms  min=17.18ms med=25.1ms  max=286.89ms p(90)=29.63ms p(95)=31.35ms p(99.9)=48.62ms
     http_reqs......................: 228275  1872.293714/s
     iteration_duration.............: avg=26.28ms  min=17.49ms med=25.72ms max=306.45ms p(90)=30.45ms p(95)=32.23ms p(99.9)=50.44ms
     iterations.....................: 228175  1871.473522/s
     success_rate...................: 100.00% ✓ 228175      ✗ 0     
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

     checks.........................: 100.00% ✓ 682743      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.13µs   min=852ns   med=2.34µs  max=3.95ms   p(90)=4.05µs   p(95)=4.75µs  p(99.9)=32.71µs
     http_req_connecting............: avg=419ns    min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.13ms  min=17.13ms med=25.52ms max=297.29ms p(90)=30.65ms  p(95)=32.56ms p(99.9)=51.21ms
       { expected_response:true }...: avg=26.13ms  min=17.13ms med=25.52ms max=297.29ms p(90)=30.65ms  p(95)=32.56ms p(99.9)=51.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227681
     http_req_receiving.............: avg=320.56µs min=51.26µs med=96.45µs max=177.57ms p(90)=817.73µs p(95)=1.34ms  p(99.9)=8.31ms 
     http_req_sending...............: avg=32.01µs  min=4.43µs  med=9.06µs  max=57.17ms  p(90)=19.05µs  p(95)=42.59µs p(99.9)=1.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.78ms  min=17.05ms med=25.18ms max=297.02ms p(90)=30.22ms  p(95)=32.08ms p(99.9)=49.72ms
     http_reqs......................: 227681  1867.200386/s
     iteration_duration.............: avg=26.35ms  min=17.33ms med=25.72ms max=316.19ms p(90)=30.85ms  p(95)=32.77ms p(99.9)=51.54ms
     iterations.....................: 227581  1866.380291/s
     success_rate...................: 100.00% ✓ 227581      ✗ 0     
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

     checks.........................: 100.00% ✓ 670416      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=3.26µs  min=962ns   med=2.49µs  max=4.04ms   p(90)=3.96µs  p(95)=4.63µs   p(99.9)=36.82µs
     http_req_connecting............: avg=429ns   min=0s      med=0s      max=4ms      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.62ms min=18.67ms med=26.18ms max=297.03ms p(90)=30.41ms p(95)=31.85ms  p(99.9)=48.11ms
       { expected_response:true }...: avg=26.62ms min=18.67ms med=26.18ms max=297.03ms p(90)=30.41ms p(95)=31.85ms  p(99.9)=48.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223572
     http_req_receiving.............: avg=78.73µs min=26.91µs med=54.22µs max=135.38ms p(90)=95.77µs p(95)=121.74µs p(99.9)=1.97ms 
     http_req_sending...............: avg=30.3µs  min=4.52µs  med=10.2µs  max=128.14ms p(90)=17.82µs p(95)=25.13µs  p(99.9)=1.44ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.51ms min=18.59ms med=26.08ms max=296.91ms p(90)=30.29ms p(95)=31.72ms  p(99.9)=47ms   
     http_reqs......................: 223572  1833.407321/s
     iteration_duration.............: avg=26.84ms min=18.91ms med=26.38ms max=316.89ms p(90)=30.62ms p(95)=32.06ms  p(99.9)=48.6ms 
     iterations.....................: 223472  1832.587268/s
     success_rate...................: 100.00% ✓ 223472      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 658545      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=2.83µs   min=881ns   med=2.01µs  max=4.26ms   p(90)=3.64µs   p(95)=4.38µs  p(99.9)=33.28µs
     http_req_connecting............: avg=415ns    min=0s      med=0s      max=4.21ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.11ms  min=18ms    med=26.53ms max=305.8ms  p(90)=31.72ms  p(95)=33.56ms p(99.9)=50.61ms
       { expected_response:true }...: avg=27.11ms  min=18ms    med=26.53ms max=305.8ms  p(90)=31.72ms  p(95)=33.56ms p(99.9)=50.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219615
     http_req_receiving.............: avg=322.98µs min=51.96µs med=98.86µs max=104.09ms p(90)=820.09µs p(95)=1.31ms  p(99.9)=7.64ms 
     http_req_sending...............: avg=32.31µs  min=4.43µs  med=8.58µs  max=256.87ms p(90)=18.43µs  p(95)=30.44µs p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.75ms  min=17.23ms med=26.19ms max=305.25ms p(90)=31.32ms  p(95)=33.11ms p(99.9)=48.59ms
     http_reqs......................: 219615  1800.581339/s
     iteration_duration.............: avg=27.32ms  min=18.21ms med=26.74ms max=317.05ms p(90)=31.92ms  p(95)=33.77ms p(99.9)=51.02ms
     iterations.....................: 219515  1799.761458/s
     success_rate...................: 100.00% ✓ 219515      ✗ 0     
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

     checks.........................: 100.00% ✓ 480117      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.57µs  min=842ns   med=2.29µs  max=4.15ms   p(90)=4.73µs   p(95)=5.73µs   p(99.9)=41.1µs 
     http_req_connecting............: avg=677ns   min=0s      med=0s      max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.22ms min=18.26ms med=36.87ms max=292.71ms p(90)=43.69ms  p(95)=45.84ms  p(99.9)=60.73ms
       { expected_response:true }...: avg=37.22ms min=18.26ms med=36.87ms max=292.71ms p(90)=43.69ms  p(95)=45.84ms  p(99.9)=60.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160139
     http_req_receiving.............: avg=87.69µs min=27.48µs med=56.75µs max=100.91ms p(90)=126.86µs p(95)=172.19µs p(99.9)=1.92ms 
     http_req_sending...............: avg=32.16µs min=4.7µs   med=9.65µs  max=238.03ms p(90)=24.28µs  p(95)=37.59µs  p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.1ms  min=18.08ms med=36.75ms max=292.32ms p(90)=43.57ms  p(95)=45.72ms  p(99.9)=60.2ms 
     http_reqs......................: 160139  1312.64746/s
     iteration_duration.............: avg=37.48ms min=21.2ms  med=37.1ms  max=315.81ms p(90)=43.91ms  p(95)=46.07ms  p(99.9)=61.22ms
     iterations.....................: 160039  1311.827768/s
     success_rate...................: 100.00% ✓ 160039      ✗ 0     
     vus............................: 4       min=0         max=50  
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

     checks.........................: 100.00% ✓ 447174      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.95µs  min=1.17µs  med=3.04µs  max=3.62ms   p(90)=4.75µs   p(95)=5.51µs   p(99.9)=39.93µs
     http_req_connecting............: avg=591ns   min=0s      med=0s      max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40ms    min=18.26ms med=39.38ms max=315.37ms p(90)=48.08ms  p(95)=50.9ms   p(99.9)=65.3ms 
       { expected_response:true }...: avg=40ms    min=18.26ms med=39.38ms max=315.37ms p(90)=48.08ms  p(95)=50.9ms   p(99.9)=65.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149158
     http_req_receiving.............: avg=84.29µs min=27.87µs med=68.35µs max=117.44ms p(90)=110.08µs p(95)=128.94µs p(99.9)=1.01ms 
     http_req_sending...............: avg=28.04µs min=5.22µs  med=12.46µs max=165.8ms  p(90)=19.85µs  p(95)=24.22µs  p(99.9)=1.05ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.89ms min=18.16ms med=39.28ms max=297.64ms p(90)=47.96ms  p(95)=50.78ms  p(99.9)=64.71ms
     http_reqs......................: 149158  1222.736396/s
     iteration_duration.............: avg=40.24ms min=22.93ms med=39.6ms  max=322.76ms p(90)=48.3ms   p(95)=51.12ms  p(99.9)=65.59ms
     iterations.....................: 149058  1221.916636/s
     success_rate...................: 100.00% ✓ 149058      ✗ 0     
     vus............................: 4       min=0         max=50  
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

     checks.........................: 100.00% ✓ 210714     ✗ 0    
     data_received..................: 6.2 GB  50 MB/s
     data_sent......................: 85 MB   691 kB/s
     http_req_blocked...............: avg=4.66µs  min=1.14µs  med=3.38µs  max=2.8ms    p(90)=5µs      p(95)=5.72µs   p(99.9)=50.69µs 
     http_req_connecting............: avg=980ns   min=0s      med=0s      max=2.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.07ms min=20.58ms med=85.46ms max=322.71ms p(90)=109.41ms p(95)=117.69ms p(99.9)=199.49ms
       { expected_response:true }...: avg=85.07ms min=20.58ms med=85.46ms max=322.71ms p(90)=109.41ms p(95)=117.69ms p(99.9)=199.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70338
     http_req_receiving.............: avg=92.31µs min=30.87µs med=77.99µs max=213.3ms  p(90)=114.94µs p(95)=128.72µs p(99.9)=641.61µs
     http_req_sending...............: avg=24.76µs min=5.56µs  med=15.98µs max=118.86ms p(90)=22.54µs  p(95)=24.92µs  p(99.9)=669.67µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.95ms min=20.44ms med=85.36ms max=322.51ms p(90)=109.29ms p(95)=117.59ms p(99.9)=198.91ms
     http_reqs......................: 70338   575.485688/s
     iteration_duration.............: avg=85.43ms min=28.89ms med=85.74ms max=331.73ms p(90)=109.66ms p(95)=117.97ms p(99.9)=201.75ms
     iterations.....................: 70238   574.667516/s
     success_rate...................: 100.00% ✓ 70238      ✗ 0    
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

     checks.........................: 100.00% ✓ 158619     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   520 kB/s
     http_req_blocked...............: avg=5.33µs   min=1.45µs  med=3.83µs   max=3.67ms   p(90)=5.45µs   p(95)=6.12µs   p(99.9)=78.1µs  
     http_req_connecting............: avg=1.22µs   min=0s      med=0s       max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.04ms min=21.01ms med=111.29ms max=330.02ms p(90)=140.52ms p(95)=149.87ms p(99.9)=189.74ms
       { expected_response:true }...: avg=113.04ms min=21.01ms med=111.29ms max=330.02ms p(90)=140.52ms p(95)=149.87ms p(99.9)=189.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52973
     http_req_receiving.............: avg=94.59µs  min=32.59µs med=88.86µs  max=104.86ms p(90)=121.13µs p(95)=134.59µs p(99.9)=590.42µs
     http_req_sending...............: avg=25.88µs  min=6.38µs  med=18.38µs  max=83.23ms  p(90)=23.96µs  p(95)=25.99µs  p(99.9)=605.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.92ms min=20.86ms med=111.17ms max=327.74ms p(90)=140.41ms p(95)=149.75ms p(99.9)=188.88ms
     http_reqs......................: 52973   433.03005/s
     iteration_duration.............: avg=113.5ms  min=33.41ms med=111.6ms  max=359.02ms p(90)=140.84ms p(95)=150.19ms p(99.9)=190.75ms
     iterations.....................: 52873   432.212595/s
     success_rate...................: 100.00% ✓ 52873      ✗ 0    
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

     checks.........................: 100.00% ✓ 96243      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=6.91µs   min=1.09µs  med=3.18µs   max=4.43ms   p(90)=4.57µs   p(95)=5.11µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=4.39ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=186.3ms  min=23.37ms med=188.07ms max=401.44ms p(90)=201.78ms p(95)=206.93ms p(99.9)=280.77ms
       { expected_response:true }...: avg=186.3ms  min=23.37ms med=188.07ms max=401.44ms p(90)=201.78ms p(95)=206.93ms p(99.9)=280.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32181
     http_req_receiving.............: avg=110.35µs min=31.78µs med=87.94µs  max=47.65ms  p(90)=119.39µs p(95)=132.41µs p(99.9)=744.03µs
     http_req_sending...............: avg=22.84µs  min=5.63µs  med=16.93µs  max=69.89ms  p(90)=21.73µs  p(95)=23.55µs  p(99.9)=520.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.16ms min=23.24ms med=187.96ms max=381.39ms p(90)=201.67ms p(95)=206.82ms p(99.9)=280.66ms
     http_reqs......................: 32181   262.370526/s
     iteration_duration.............: avg=187.12ms min=51.36ms med=188.37ms max=424.86ms p(90)=202.07ms p(95)=207.26ms p(99.9)=294.84ms
     iterations.....................: 32081   261.555229/s
     success_rate...................: 100.00% ✓ 32081      ✗ 0    
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

     checks.........................: 100.00% ✓ 92496      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=6.67µs   min=1.15µs  med=3.22µs   max=4.15ms   p(90)=4.57µs   p(95)=5.13µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=193.89ms min=18.03ms med=179.93ms max=651.09ms p(90)=237.09ms p(95)=270.39ms p(99.9)=577.03ms
       { expected_response:true }...: avg=193.89ms min=18.03ms med=179.93ms max=651.09ms p(90)=237.09ms p(95)=270.39ms p(99.9)=577.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30932
     http_req_receiving.............: avg=92.89µs  min=32.78µs med=89.41µs  max=8.53ms   p(90)=119.23µs p(95)=130.74µs p(99.9)=809.72µs
     http_req_sending...............: avg=20.82µs  min=5.41µs  med=17.25µs  max=17.13ms  p(90)=21.49µs  p(95)=23.24µs  p(99.9)=521.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.77ms min=17.93ms med=179.81ms max=650.99ms p(90)=236.99ms p(95)=270.29ms p(99.9)=576.92ms
     http_reqs......................: 30932   253.056895/s
     iteration_duration.............: avg=194.72ms min=48.06ms med=180.35ms max=651.29ms p(90)=237.45ms p(95)=271.41ms p(99.9)=577.36ms
     iterations.....................: 30832   252.238788/s
     success_rate...................: 100.00% ✓ 30832      ✗ 0    
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

     checks.........................: 100.00% ✓ 6486      ✗ 0   
     data_received..................: 217 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=108.13µs min=1.22µs   med=3.12µs  max=8.38ms  p(90)=4.59µs   p(95)=5.54µs   p(99.9)=8.07ms  
     http_req_connecting............: avg=101.03µs min=0s       med=0s      max=8.32ms  p(90)=0s       p(95)=0s       p(99.9)=7.99ms  
     http_req_duration..............: avg=2.68s    min=39.72ms  med=2.79s   max=4.62s   p(90)=3.43s    p(95)=3.62s    p(99.9)=4.34s   
       { expected_response:true }...: avg=2.68s    min=39.72ms  med=2.79s   max=4.62s   p(90)=3.43s    p(95)=3.62s    p(99.9)=4.34s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2262
     http_req_receiving.............: avg=95.48µs  min=33.84µs  med=91.23µs max=1.32ms  p(90)=131.67µs p(95)=148.53µs p(99.9)=377.02µs
     http_req_sending...............: avg=65.09µs  min=5.74µs   med=17.54µs max=30.43ms p(90)=23.19µs  p(95)=28.8µs   p(99.9)=7.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.68s    min=39.61ms  med=2.79s   max=4.62s   p(90)=3.43s    p(95)=3.62s    p(99.9)=4.33s   
     http_reqs......................: 2262    17.746374/s
     iteration_duration.............: avg=2.8s     min=858.29ms med=2.81s   max=4.62s   p(90)=3.44s    p(95)=3.63s    p(99.9)=4.34s   
     iterations.....................: 2162    16.96183/s
     success_rate...................: 100.00% ✓ 2162      ✗ 0   
     vus............................: 21      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

