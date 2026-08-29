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
| fusion | 16.6.2 | 1,893 | 1,936 | 1,887 | 0.9% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 1,884 | 1,935 | 1,879 | 1.0% |  |
| fusion-nightly | 16.7.0-p.1 | 1,878 | 1,923 | 1,869 | 1.0% |  |
| hive-router | v0.0.84 | 1,865 | 1,926 | 1,855 | 1.2% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 1,794 | 1,851 | 1,789 | 1.2% |  |
| grafbase | 0.53.5 | 1,316 | 1,339 | 1,310 | 0.8% |  |
| cosmo | 0.334.0 | 1,230 | 1,271 | 1,225 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 545 | 565 | 542 | 1.6% |  |
| apollo-router | v2.16.1 | 433 | 451 | 432 | 1.5% |  |
| apollo-gateway | 2.14.3 | 260 | 263 | 259 | 0.5% |  |
| hive-gateway | 2.10.8 | 258 | 264 | 257 | 1.0% |  |
| feddi | 5ff8b6165878 | 23 | 24 | 21 | 4.4% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 692448      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.87µs   min=872ns   med=2.02µs  max=4.01ms   p(90)=3.76µs   p(95)=4.52µs  p(99.9)=31.92µs
     http_req_connecting............: avg=405ns    min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.77ms  min=16.77ms med=25.19ms max=318.18ms p(90)=30.12ms  p(95)=31.92ms p(99.9)=49.25ms
       { expected_response:true }...: avg=25.77ms  min=16.77ms med=25.19ms max=318.18ms p(90)=30.12ms  p(95)=31.92ms p(99.9)=49.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230916
     http_req_receiving.............: avg=330.02µs min=48.91µs med=91.3µs  max=274.06ms p(90)=765.65µs p(95)=1.26ms  p(99.9)=9.47ms 
     http_req_sending...............: avg=30.62µs  min=4.47µs  med=8.5µs   max=29.8ms   p(90)=18.53µs  p(95)=30.06µs p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.41ms  min=16.67ms med=24.87ms max=68.36ms  p(90)=29.72ms  p(95)=31.49ms p(99.9)=46.82ms
     http_reqs......................: 230916  1893.932/s
     iteration_duration.............: avg=25.98ms  min=16.98ms med=25.39ms max=346.63ms p(90)=30.32ms  p(95)=32.13ms p(99.9)=49.67ms
     iterations.....................: 230816  1893.111818/s
     success_rate...................: 100.00% ✓ 230816      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688899      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.72µs   min=842ns   med=1.87µs  max=3.35ms   p(90)=3.53µs   p(95)=4.25µs  p(99.9)=28.47µs
     http_req_connecting............: avg=429ns    min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.91ms  min=17.64ms med=25.35ms max=304.81ms p(90)=30.19ms  p(95)=31.95ms p(99.9)=49.09ms
       { expected_response:true }...: avg=25.91ms  min=17.64ms med=25.35ms max=304.81ms p(90)=30.19ms  p(95)=31.95ms p(99.9)=49.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229733
     http_req_receiving.............: avg=250.98µs min=50.04µs med=86.12µs max=151.8ms  p(90)=594.28µs p(95)=1.08ms  p(99.9)=6.75ms 
     http_req_sending...............: avg=32.65µs  min=4.3µs   med=8.09µs  max=181.73ms p(90)=18.22µs  p(95)=31.12µs p(99.9)=1.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.62ms  min=17.46ms med=25.08ms max=304.21ms p(90)=29.86ms  p(95)=31.58ms p(99.9)=47.41ms
     http_reqs......................: 229733  1884.350566/s
     iteration_duration.............: avg=26.12ms  min=18ms    med=25.55ms max=321.95ms p(90)=30.39ms  p(95)=32.14ms p(99.9)=49.61ms
     iterations.....................: 229633  1883.530331/s
     success_rate...................: 100.00% ✓ 229633      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686931      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.79µs   min=902ns   med=2.08µs  max=8.73ms   p(90)=3.87µs   p(95)=4.59µs  p(99.9)=32.79µs
     http_req_connecting............: avg=232ns    min=0s      med=0s      max=2.67ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.97ms  min=16.98ms med=25.38ms max=312.44ms p(90)=30.35ms  p(95)=32.19ms p(99.9)=49.43ms
       { expected_response:true }...: avg=25.97ms  min=16.98ms med=25.38ms max=312.44ms p(90)=30.35ms  p(95)=32.19ms p(99.9)=49.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229077
     http_req_receiving.............: avg=293.71µs min=48.94µs med=90.42µs max=153.72ms p(90)=711.94µs p(95)=1.22ms  p(99.9)=8.08ms 
     http_req_sending...............: avg=32.85µs  min=4.68µs  med=8.7µs   max=93.19ms  p(90)=18.87µs  p(95)=36.55µs p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.65ms  min=16.72ms med=25.08ms max=277.69ms p(90)=29.96ms  p(95)=31.77ms p(99.9)=48.19ms
     http_reqs......................: 229077  1878.687948/s
     iteration_duration.............: avg=26.19ms  min=17.13ms med=25.59ms max=320.36ms p(90)=30.56ms  p(95)=32.39ms p(99.9)=49.86ms
     iterations.....................: 228977  1877.867836/s
     success_rate...................: 100.00% ✓ 228977      ✗ 0     
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

     checks.........................: 100.00% ✓ 682080      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.7µs   min=922ns   med=2.08µs  max=3.17ms   p(90)=3.72µs  p(95)=4.44µs   p(99.9)=33.8µs 
     http_req_connecting............: avg=229ns   min=0s      med=0s      max=3.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.17ms min=18.24ms med=25.74ms max=306.36ms p(90)=29.83ms p(95)=31.22ms  p(99.9)=47.37ms
       { expected_response:true }...: avg=26.17ms min=18.24ms med=25.74ms max=306.36ms p(90)=29.83ms p(95)=31.22ms  p(99.9)=47.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227460
     http_req_receiving.............: avg=71.63µs min=23.21µs med=47.7µs  max=41.11ms  p(90)=89.82µs p(95)=114.72µs p(99.9)=2.04ms 
     http_req_sending...............: avg=27.35µs min=4.45µs  med=8.99µs  max=40.21ms  p(90)=17.22µs p(95)=23.95µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.07ms min=18.08ms med=25.65ms max=306.23ms p(90)=29.73ms p(95)=31.1ms   p(99.9)=45.42ms
     http_reqs......................: 227460  1865.342174/s
     iteration_duration.............: avg=26.38ms min=18.52ms med=25.94ms max=317.14ms p(90)=30.03ms p(95)=31.42ms  p(99.9)=47.75ms
     iterations.....................: 227360  1864.522099/s
     success_rate...................: 100.00% ✓ 227360      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 656196      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 263 MB  2.2 MB/s
     http_req_blocked...............: avg=3.47µs   min=951ns   med=2.65µs  max=6.01ms   p(90)=4.46µs   p(95)=5.22µs  p(99.9)=36.69µs
     http_req_connecting............: avg=414ns    min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.19ms  min=17.33ms med=26.58ms max=315.09ms p(90)=31.88ms  p(95)=33.81ms p(99.9)=52.02ms
       { expected_response:true }...: avg=27.19ms  min=17.33ms med=26.58ms max=315.09ms p(90)=31.88ms  p(95)=33.81ms p(99.9)=52.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 218832
     http_req_receiving.............: avg=314.27µs min=50.42µs med=97.19µs max=204.97ms p(90)=774.77µs p(95)=1.32ms  p(99.9)=8.55ms 
     http_req_sending...............: avg=35.49µs  min=4.51µs  med=9.94µs  max=258.32ms p(90)=20.01µs  p(95)=40.76µs p(99.9)=1.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.84ms  min=17.25ms med=26.24ms max=314.75ms p(90)=31.45ms  p(95)=33.36ms p(99.9)=50.65ms
     http_reqs......................: 218832  1794.087737/s
     iteration_duration.............: avg=27.42ms  min=17.53ms med=26.8ms  max=336.79ms p(90)=32.09ms  p(95)=34.03ms p(99.9)=52.46ms
     iterations.....................: 218732  1793.26789/s
     success_rate...................: 100.00% ✓ 218732      ✗ 0     
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

     checks.........................: 100.00% ✓ 481296      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=3.88µs  min=1.07µs  med=3.05µs  max=2.48ms   p(90)=5.38µs   p(95)=6.38µs   p(99.9)=48.46µs
     http_req_connecting............: avg=304ns   min=0s      med=0s      max=2.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.12ms min=18.13ms med=36.81ms max=325.27ms p(90)=43.73ms  p(95)=45.81ms  p(99.9)=61.96ms
       { expected_response:true }...: avg=37.12ms min=18.13ms med=36.81ms max=325.27ms p(90)=43.73ms  p(95)=45.81ms  p(99.9)=61.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160532
     http_req_receiving.............: avg=92.73µs min=28.36µs med=61.81µs max=168.74ms p(90)=130.35µs p(95)=177.09µs p(99.9)=2.07ms 
     http_req_sending...............: avg=36.6µs  min=5µs     med=11.62µs max=233.87ms p(90)=25.6µs   p(95)=60.65µs  p(99.9)=1.99ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.99ms min=17.98ms med=36.69ms max=324.74ms p(90)=43.6ms   p(95)=45.67ms  p(99.9)=61.36ms
     http_reqs......................: 160532  1316.102552/s
     iteration_duration.............: avg=37.39ms min=21.91ms med=37.06ms max=333.39ms p(90)=43.95ms  p(95)=46.04ms  p(99.9)=62.36ms
     iterations.....................: 160432  1315.282714/s
     success_rate...................: 100.00% ✓ 160432      ✗ 0     
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

     checks.........................: 100.00% ✓ 450204      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.48µs  min=902ns   med=2.49µs  max=4.04ms   p(90)=4.22µs   p(95)=4.93µs   p(99.9)=34.39µs 
     http_req_connecting............: avg=652ns   min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.74ms min=18.6ms  med=39.14ms max=309.86ms p(90)=47.66ms  p(95)=50.41ms  p(99.9)=65.1ms  
       { expected_response:true }...: avg=39.74ms min=18.6ms  med=39.14ms max=309.86ms p(90)=47.66ms  p(95)=50.41ms  p(99.9)=65.1ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 150168
     http_req_receiving.............: avg=78.07µs min=26µs    med=62.29µs max=130.75ms p(90)=103.26µs p(95)=120.46µs p(99.9)=841.43µs
     http_req_sending...............: avg=24.06µs min=4.77µs  med=11.09µs max=145.83ms p(90)=19.37µs  p(95)=23.25µs  p(99.9)=859.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.64ms min=18.47ms med=39.04ms max=307.52ms p(90)=47.56ms  p(95)=50.31ms  p(99.9)=64.79ms 
     http_reqs......................: 150168  1230.896226/s
     iteration_duration.............: avg=39.97ms min=22.46ms med=39.35ms max=328.06ms p(90)=47.86ms  p(95)=50.63ms  p(99.9)=65.52ms 
     iterations.....................: 150068  1230.076547/s
     success_rate...................: 100.00% ✓ 150068      ✗ 0     
     vus............................: 29      min=0         max=50  
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

     checks.........................: 100.00% ✓ 199674     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   655 kB/s
     http_req_blocked...............: avg=4.37µs  min=1.09µs  med=2.82µs  max=3.04ms   p(90)=4.37µs   p(95)=5.01µs   p(99.9)=52.88µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=3ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.81ms min=20.89ms med=87.41ms max=330.53ms p(90)=111.55ms p(95)=121.7ms  p(99.9)=213.55ms
       { expected_response:true }...: avg=89.81ms min=20.89ms med=87.41ms max=330.53ms p(90)=111.55ms p(95)=121.7ms  p(99.9)=213.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66658
     http_req_receiving.............: avg=83.05µs min=28.87µs med=72.56µs max=156.01ms p(90)=108.53µs p(95)=121.75µs p(99.9)=660.66µs
     http_req_sending...............: avg=21.4µs  min=4.95µs  med=13.93µs max=127.85ms p(90)=20.48µs  p(95)=22.69µs  p(99.9)=588.05µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.7ms  min=20.74ms med=87.3ms  max=317.99ms p(90)=111.46ms p(95)=121.57ms p(99.9)=213.29ms
     http_reqs......................: 66658   545.236298/s
     iteration_duration.............: avg=90.16ms min=43.06ms med=87.67ms max=337.82ms p(90)=111.82ms p(95)=121.99ms p(99.9)=215.79ms
     iterations.....................: 66558   544.418337/s
     success_rate...................: 100.00% ✓ 66558      ✗ 0    
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

     checks.........................: 100.00% ✓ 158715     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   520 kB/s
     http_req_blocked...............: avg=4.94µs   min=1.38µs  med=3.87µs   max=2ms      p(90)=5.49µs   p(95)=6.13µs   p(99.9)=84.93µs 
     http_req_connecting............: avg=797ns    min=0s      med=0s       max=1.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.98ms min=20.52ms med=111.18ms max=339.15ms p(90)=140.8ms  p(95)=149.7ms  p(99.9)=189.15ms
       { expected_response:true }...: avg=112.98ms min=20.52ms med=111.18ms max=339.15ms p(90)=140.8ms  p(95)=149.7ms  p(99.9)=189.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53005
     http_req_receiving.............: avg=92.31µs  min=32.17µs med=84.11µs  max=98.79ms  p(90)=116.81µs p(95)=129.93µs p(99.9)=618.15µs
     http_req_sending...............: avg=30.85µs  min=5.65µs  med=17.31µs  max=103.11ms p(90)=23.17µs  p(95)=25.41µs  p(99.9)=612.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.85ms min=20.36ms med=111.07ms max=338.85ms p(90)=140.67ms p(95)=149.59ms p(99.9)=188.54ms
     http_reqs......................: 53005   433.307763/s
     iteration_duration.............: avg=113.44ms min=39.09ms med=111.5ms  max=354.96ms p(90)=141.09ms p(95)=150.02ms p(99.9)=191.12ms
     iterations.....................: 52905   432.490278/s
     success_rate...................: 100.00% ✓ 52905      ✗ 0    
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

     checks.........................: 100.00% ✓ 95694      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=6.7µs    min=1.51µs  med=3.84µs   max=3.93ms   p(90)=5.43µs   p(95)=6.05µs   p(99.9)=923.35µs
     http_req_connecting............: avg=2.55µs   min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=902.21µs
     http_req_duration..............: avg=187.37ms min=22.69ms med=187.36ms max=397.87ms p(90)=198.58ms p(95)=204.33ms p(99.9)=273.55ms
       { expected_response:true }...: avg=187.37ms min=22.69ms med=187.36ms max=397.87ms p(90)=198.58ms p(95)=204.33ms p(99.9)=273.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31998
     http_req_receiving.............: avg=98.45µs  min=33.12µs med=93.33µs  max=27.58ms  p(90)=125.83µs p(95)=139.64µs p(99.9)=574.29µs
     http_req_sending...............: avg=30.22µs  min=6.03µs  med=18.87µs  max=92.28ms  p(90)=24.03µs  p(95)=26.03µs  p(99.9)=486.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.25ms min=22.5ms  med=187.24ms max=397.71ms p(90)=198.46ms p(95)=204.18ms p(99.9)=273.08ms
     http_reqs......................: 31998   260.893221/s
     iteration_duration.............: avg=188.21ms min=54.32ms med=187.67ms max=403.57ms p(90)=198.91ms p(95)=204.73ms p(99.9)=275.3ms 
     iterations.....................: 31898   260.077879/s
     success_rate...................: 100.00% ✓ 31898      ✗ 0    
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

     checks.........................: 100.00% ✓ 94299      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=5.14µs   min=1.09µs  med=3.19µs   max=2.72ms   p(90)=4.59µs   p(95)=5.15µs   p(99.9)=601.73µs
     http_req_connecting............: avg=1.7µs    min=0s      med=0s       max=2.69ms   p(90)=0s       p(95)=0s       p(99.9)=503.68µs
     http_req_duration..............: avg=190.16ms min=18.59ms med=178.88ms max=837.58ms p(90)=222.31ms p(95)=250.54ms p(99.9)=599.92ms
       { expected_response:true }...: avg=190.16ms min=18.59ms med=178.88ms max=837.58ms p(90)=222.31ms p(95)=250.54ms p(99.9)=599.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31533
     http_req_receiving.............: avg=94.73µs  min=30.85µs med=89.15µs  max=25.54ms  p(90)=120.07µs p(95)=132.36µs p(99.9)=897.6µs 
     http_req_sending...............: avg=24.55µs  min=5.27µs  med=17.06µs  max=56.37ms  p(90)=21.67µs  p(95)=23.51µs  p(99.9)=634.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.04ms min=18.48ms med=178.74ms max=837.45ms p(90)=222.2ms  p(95)=250.45ms p(99.9)=599.83ms
     http_reqs......................: 31533   258.012485/s
     iteration_duration.............: avg=190.97ms min=41.63ms med=179.25ms max=837.87ms p(90)=222.63ms p(95)=251.58ms p(99.9)=600.81ms
     iterations.....................: 31433   257.194255/s
     success_rate...................: 100.00% ✓ 31433      ✗ 0    
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

     checks.........................: 100.00% ✓ 8661      ✗ 0   
     data_received..................: 286 MB  2.3 MB/s
     data_sent......................: 3.6 MB  28 kB/s
     http_req_blocked...............: avg=34.94µs  min=1.56µs  med=3.76µs  max=4.07ms   p(90)=5.27µs   p(95)=6.08µs   p(99.9)=3.65ms  
     http_req_connecting............: avg=30.41µs  min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=3.63ms  
     http_req_duration..............: avg=2.02s    min=37.27ms med=2.06s   max=3.64s    p(90)=2.61s    p(95)=2.75s    p(99.9)=3.45s   
       { expected_response:true }...: avg=2.02s    min=37.27ms med=2.06s   max=3.64s    p(90)=2.61s    p(95)=2.75s    p(99.9)=3.45s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2987
     http_req_receiving.............: avg=118.85µs min=33.77µs med=92.71µs max=63.58ms  p(90)=133.14µs p(95)=151.75µs p(99.9)=410.02µs
     http_req_sending...............: avg=126.12µs min=7.34µs  med=19.22µs max=128.98ms p(90)=24µs     p(95)=26.9µs   p(99.9)=34.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.02s    min=37.13ms med=2.06s   max=3.64s    p(90)=2.61s    p(95)=2.75s    p(99.9)=3.45s   
     http_reqs......................: 2987    23.676528/s
     iteration_duration.............: avg=2.09s    min=668.5ms med=2.08s   max=3.64s    p(90)=2.62s    p(95)=2.76s    p(99.9)=3.45s   
     iterations.....................: 2887    22.883876/s
     success_rate...................: 100.00% ✓ 2887      ✗ 0   
     vus............................: 20      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

