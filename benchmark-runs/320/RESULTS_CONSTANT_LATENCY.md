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
| fusion | 16.6.1 | 1,884 | 1,928 | 1,871 | 1.0% |  |
| fusion-nightly | 16.6.2-p.1 | 1,880 | 1,929 | 1,878 | 0.9% |  |
| fusion-nightly-net11 | 16.6.2-p.1 | 1,871 | 1,920 | 1,864 | 1.0% |  |
| hive-router | v0.0.84 | 1,826 | 1,883 | 1,815 | 1.3% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 1,802 | 1,868 | 1,792 | 1.5% |  |
| grafbase | 0.53.5 | 1,317 | 1,335 | 1,310 | 0.6% |  |
| cosmo | 0.334.0 | 1,218 | 1,262 | 1,212 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 562 | 580 | 558 | 1.3% |  |
| apollo-router | v2.16.1 | 392 | 411 | 390 | 1.8% |  |
| hive-gateway | 2.10.8 | 261 | 267 | 259 | 1.0% |  |
| apollo-gateway | 2.14.3 | 258 | 261 | 256 | 0.6% |  |
| feddi | 5ff8b6165878 | 16 | 17 | 15 | 3.8% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688953      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.84µs   min=852ns   med=1.98µs  max=7.51ms   p(90)=3.65µs   p(95)=4.37µs  p(99.9)=29.88µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=3.79ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.9ms   min=16.64ms med=25.32ms max=304.56ms p(90)=30.27ms  p(95)=32.06ms p(99.9)=50.12ms
       { expected_response:true }...: avg=25.9ms   min=16.64ms med=25.32ms max=304.56ms p(90)=30.27ms  p(95)=32.06ms p(99.9)=50.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229751
     http_req_receiving.............: avg=299.64µs min=50.96µs med=92.87µs max=232.93ms p(90)=738.81µs p(95)=1.22ms  p(99.9)=8.19ms 
     http_req_sending...............: avg=31.99µs  min=4.66µs  med=8.47µs  max=218.9ms  p(90)=18.76µs  p(95)=29.5µs  p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.57ms  min=16.54ms med=25.01ms max=255.24ms p(90)=29.88ms  p(95)=31.64ms p(99.9)=48.57ms
     http_reqs......................: 229751  1884.420188/s
     iteration_duration.............: avg=26.11ms  min=16.87ms med=25.52ms max=313.94ms p(90)=30.46ms  p(95)=32.26ms p(99.9)=50.59ms
     iterations.....................: 229651  1883.599987/s
     success_rate...................: 100.00% ✓ 229651      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687690      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.8µs    min=912ns   med=2µs     max=3.72ms   p(90)=3.58µs   p(95)=4.33µs  p(99.9)=30.39µs
     http_req_connecting............: avg=398ns    min=0s      med=0s      max=3.66ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.95ms  min=17.32ms med=25.36ms max=305.56ms p(90)=30.32ms  p(95)=32.11ms p(99.9)=49.27ms
       { expected_response:true }...: avg=25.95ms  min=17.32ms med=25.36ms max=305.56ms p(90)=30.32ms  p(95)=32.11ms p(99.9)=49.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229330
     http_req_receiving.............: avg=306.39µs min=49.69µs med=94.95µs max=139.9ms  p(90)=770.07µs p(95)=1.24ms  p(99.9)=7.7ms  
     http_req_sending...............: avg=34.51µs  min=4.48µs  med=8.61µs  max=193.52ms p(90)=17.69µs  p(95)=28.84µs p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.61ms  min=17.16ms med=25.04ms max=305.37ms p(90)=29.93ms  p(95)=31.7ms  p(99.9)=47.76ms
     http_reqs......................: 229330  1880.612597/s
     iteration_duration.............: avg=26.16ms  min=17.52ms med=25.56ms max=313.5ms  p(90)=30.52ms  p(95)=32.32ms p(99.9)=49.76ms
     iterations.....................: 229230  1879.792551/s
     success_rate...................: 100.00% ✓ 229230      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684372      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.79µs   min=881ns   med=1.98µs  max=3.47ms   p(90)=3.72µs   p(95)=4.49µs  p(99.9)=29.34µs
     http_req_connecting............: avg=381ns    min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.08ms  min=17.41ms med=25.53ms max=322.96ms p(90)=30.37ms  p(95)=32.14ms p(99.9)=48.74ms
       { expected_response:true }...: avg=26.08ms  min=17.41ms med=25.53ms max=322.96ms p(90)=30.37ms  p(95)=32.14ms p(99.9)=48.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228224
     http_req_receiving.............: avg=262.12µs min=51.29µs med=88.25µs max=55.08ms  p(90)=624.88µs p(95)=1.13ms  p(99.9)=7.16ms 
     http_req_sending...............: avg=29.41µs  min=4.47µs  med=8.35µs  max=113.21ms p(90)=18.52µs  p(95)=30.75µs p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.78ms  min=17.31ms med=25.25ms max=297.76ms p(90)=30.03ms  p(95)=31.76ms p(99.9)=47.34ms
     http_reqs......................: 228224  1871.658449/s
     iteration_duration.............: avg=26.29ms  min=17.66ms med=25.73ms max=331.28ms p(90)=30.58ms  p(95)=32.34ms p(99.9)=49.13ms
     iterations.....................: 228124  1870.838352/s
     success_rate...................: 100.00% ✓ 228124      ✗ 0     
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

     checks.........................: 100.00% ✓ 667848      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.89µs  min=882ns   med=2.13µs  max=3.47ms   p(90)=3.79µs  p(95)=4.49µs   p(99.9)=32.81µs
     http_req_connecting............: avg=382ns   min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.73ms min=18.09ms med=26.32ms max=291.86ms p(90)=30.45ms p(95)=31.84ms  p(99.9)=46.07ms
       { expected_response:true }...: avg=26.73ms min=18.09ms med=26.32ms max=291.86ms p(90)=30.45ms p(95)=31.84ms  p(99.9)=46.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222716
     http_req_receiving.............: avg=73.83µs min=25.42µs med=51.26µs max=128.37ms p(90)=92.63µs p(95)=116.61µs p(99.9)=1.75ms 
     http_req_sending...............: avg=29.93µs min=4.57µs  med=9.23µs  max=198.9ms  p(90)=17.42µs p(95)=23.62µs  p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.63ms min=18ms    med=26.23ms max=279.67ms p(90)=30.34ms p(95)=31.72ms  p(99.9)=44.51ms
     http_reqs......................: 222716  1826.165134/s
     iteration_duration.............: avg=26.94ms min=18.65ms med=26.52ms max=315.55ms p(90)=30.65ms p(95)=32.04ms  p(99.9)=46.61ms
     iterations.....................: 222616  1825.345182/s
     success_rate...................: 100.00% ✓ 222616      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 659202      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=3.29µs   min=912ns   med=2.46µs   max=4.05ms   p(90)=4.15µs   p(95)=4.9µs   p(99.9)=36.08µs
     http_req_connecting............: avg=447ns    min=0s      med=0s       max=3.71ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.07ms  min=17.94ms med=26.44ms  max=305.4ms  p(90)=31.72ms  p(95)=33.67ms p(99.9)=51.94ms
       { expected_response:true }...: avg=27.07ms  min=17.94ms med=26.44ms  max=305.4ms  p(90)=31.72ms  p(95)=33.67ms p(99.9)=51.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219834
     http_req_receiving.............: avg=343.21µs min=52.75µs med=103.95µs max=242.7ms  p(90)=865.86µs p(95)=1.37ms  p(99.9)=8.81ms 
     http_req_sending...............: avg=35.68µs  min=4.76µs  med=9.76µs   max=124.71ms p(90)=19.78µs  p(95)=47.55µs p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.69ms  min=17.85ms med=26.09ms  max=305.07ms p(90)=31.28ms  p(95)=33.18ms p(99.9)=50.45ms
     http_reqs......................: 219834  1802.212355/s
     iteration_duration.............: avg=27.29ms  min=18.13ms med=26.66ms  max=326.53ms p(90)=31.93ms  p(95)=33.88ms p(99.9)=52.25ms
     iterations.....................: 219734  1801.392549/s
     success_rate...................: 100.00% ✓ 219734      ✗ 0     
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

     checks.........................: 100.00% ✓ 481740      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=3.44µs  min=882ns   med=2.23µs  max=4.01ms   p(90)=4.72µs   p(95)=5.71µs   p(99.9)=41.86µs
     http_req_connecting............: avg=595ns   min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.1ms  min=17.9ms  med=36.77ms max=310.17ms p(90)=43.49ms  p(95)=45.57ms  p(99.9)=61.64ms
       { expected_response:true }...: avg=37.1ms  min=17.9ms  med=36.77ms max=310.17ms p(90)=43.49ms  p(95)=45.57ms  p(99.9)=61.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160680
     http_req_receiving.............: avg=85.23µs min=26.4µs  med=56.64µs max=84.05ms  p(90)=124.83µs p(95)=168.48µs p(99.9)=1.88ms 
     http_req_sending...............: avg=33.2µs  min=4.87µs  med=9.53µs  max=84.77ms  p(90)=23.99µs  p(95)=40.88µs  p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.98ms min=17.75ms med=36.66ms max=309.74ms p(90)=43.37ms  p(95)=45.44ms  p(99.9)=60.78ms
     http_reqs......................: 160680  1317.384135/s
     iteration_duration.............: avg=37.35ms min=20.56ms med=37.01ms max=333.59ms p(90)=43.71ms  p(95)=45.79ms  p(99.9)=62.39ms
     iterations.....................: 160580  1316.564255/s
     success_rate...................: 100.00% ✓ 160580      ✗ 0     
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

     checks.........................: 100.00% ✓ 445647      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.11µs  min=982ns   med=2.43µs  max=2.79ms   p(90)=4.14µs   p(95)=4.83µs  p(99.9)=36.93µs 
     http_req_connecting............: avg=305ns   min=0s      med=0s      max=2.37ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=40.15ms min=18.7ms  med=39.55ms max=316.08ms p(90)=48.24ms  p(95)=51.04ms p(99.9)=66.01ms 
       { expected_response:true }...: avg=40.15ms min=18.7ms  med=39.55ms max=316.08ms p(90)=48.24ms  p(95)=51.04ms p(99.9)=66.01ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148649
     http_req_receiving.............: avg=75.8µs  min=26.25µs med=62.41µs max=67.13ms  p(90)=103.37µs p(95)=121.3µs p(99.9)=855.65µs
     http_req_sending...............: avg=25.25µs min=5.02µs  med=11.4µs  max=123.74ms p(90)=19.34µs  p(95)=23.16µs p(99.9)=975.75µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=40.05ms min=18.6ms  med=39.46ms max=315.4ms  p(90)=48.14ms  p(95)=50.93ms p(99.9)=65.72ms 
     http_reqs......................: 148649  1218.52024/s
     iteration_duration.............: avg=40.38ms min=20.59ms med=39.76ms max=338.43ms p(90)=48.45ms  p(95)=51.25ms p(99.9)=66.32ms 
     iterations.....................: 148549  1217.700511/s
     success_rate...................: 100.00% ✓ 148549      ✗ 0     
     vus............................: 9       min=0         max=50  
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

     checks.........................: 100.00% ✓ 206094     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   676 kB/s
     http_req_blocked...............: avg=5.08µs  min=1.21µs  med=3.5µs   max=3.62ms   p(90)=5.17µs   p(95)=5.9µs    p(99.9)=51.02µs 
     http_req_connecting............: avg=1.29µs  min=0s      med=0s      max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.99ms min=20.11ms med=85.09ms max=305.51ms p(90)=105.68ms p(95)=115.41ms p(99.9)=202.72ms
       { expected_response:true }...: avg=86.99ms min=20.11ms med=85.09ms max=305.51ms p(90)=105.68ms p(95)=115.41ms p(99.9)=202.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68798
     http_req_receiving.............: avg=85.94µs min=30.28µs med=78.03µs max=72.35ms  p(90)=113.71µs p(95)=126.84µs p(99.9)=684.62µs
     http_req_sending...............: avg=28.86µs min=5.79µs  med=15.64µs max=234.25ms p(90)=22.38µs  p(95)=24.86µs  p(99.9)=657.93µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.88ms min=20.02ms med=84.98ms max=305.38ms p(90)=105.57ms p(95)=115.27ms p(99.9)=202.36ms
     http_reqs......................: 68798   562.797903/s
     iteration_duration.............: avg=87.35ms min=26.33ms med=85.37ms max=333.95ms p(90)=105.96ms p(95)=115.7ms  p(99.9)=203.73ms
     iterations.....................: 68698   561.979859/s
     success_rate...................: 100.00% ✓ 68698      ✗ 0    
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

     checks.........................: 100.00% ✓ 143757     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   471 kB/s
     http_req_blocked...............: avg=5.52µs   min=1.35µs  med=3.64µs   max=3.04ms   p(90)=5.18µs   p(95)=5.8µs    p(99.9)=194.72µs
     http_req_connecting............: avg=1.52µs   min=0s      med=0s       max=3.01ms   p(90)=0s       p(95)=0s       p(99.9)=66.63µs 
     http_req_duration..............: avg=124.75ms min=20.94ms med=122.57ms max=332.28ms p(90)=156.52ms p(95)=166.72ms p(99.9)=211.01ms
       { expected_response:true }...: avg=124.75ms min=20.94ms med=122.57ms max=332.28ms p(90)=156.52ms p(95)=166.72ms p(99.9)=211.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48019
     http_req_receiving.............: avg=94.32µs  min=31.37µs med=84.46µs  max=168.82ms p(90)=117.03µs p(95)=130.15µs p(99.9)=549.08µs
     http_req_sending...............: avg=28.84µs  min=6.42µs  med=17.91µs  max=96ms     p(90)=23.46µs  p(95)=25.53µs  p(99.9)=498.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.63ms min=20.78ms med=122.46ms max=331.78ms p(90)=156.42ms p(95)=166.61ms p(99.9)=210.02ms
     http_reqs......................: 48019   392.386722/s
     iteration_duration.............: avg=125.25ms min=52.34ms med=122.9ms  max=344.3ms  p(90)=156.85ms p(95)=167.06ms p(99.9)=212.3ms 
     iterations.....................: 47919   391.569573/s
     success_rate...................: 100.00% ✓ 47919      ✗ 0    
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

     checks.........................: 100.00% ✓ 95313      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=7.34µs   min=1.24µs  med=3.9µs    max=4.18ms   p(90)=5.48µs   p(95)=6.12µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=188.1ms  min=18ms    med=175.95ms max=627.44ms p(90)=226.47ms p(95)=264.82ms p(99.9)=560.18ms
       { expected_response:true }...: avg=188.1ms  min=18ms    med=175.95ms max=627.44ms p(90)=226.47ms p(95)=264.82ms p(99.9)=560.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31871
     http_req_receiving.............: avg=110.7µs  min=37.7µs  med=93.26µs  max=132.58ms p(90)=125.45µs p(95)=140.38µs p(99.9)=1.1ms   
     http_req_sending...............: avg=28.52µs  min=6.44µs  med=19.4µs   max=69.81ms  p(90)=24.64µs  p(95)=26.64µs  p(99.9)=550µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.96ms min=17.91ms med=175.82ms max=627.34ms p(90)=226.32ms p(95)=264.46ms p(99.9)=560.08ms
     http_reqs......................: 31871   261.066241/s
     iteration_duration.............: avg=188.94ms min=46.25ms med=176.33ms max=627.68ms p(90)=226.93ms p(95)=266.27ms p(99.9)=560.5ms 
     iterations.....................: 31771   260.247107/s
     success_rate...................: 100.00% ✓ 31771      ✗ 0    
     vus............................: 35      min=0        max=50 
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

     checks.........................: 100.00% ✓ 94674      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.41µs  med=3.67µs   max=3.36ms   p(90)=5.13µs   p(95)=5.76µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=2.57µs   min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=189.41ms min=23.84ms med=188.83ms max=352.2ms  p(90)=201.59ms p(95)=206.6ms  p(99.9)=271.38ms
       { expected_response:true }...: avg=189.41ms min=23.84ms med=188.83ms max=352.2ms  p(90)=201.59ms p(95)=206.6ms  p(99.9)=271.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31658
     http_req_receiving.............: avg=96.33µs  min=35.12µs med=90.23µs  max=63.69ms  p(90)=121.63µs p(95)=133.32µs p(99.9)=563.25µs
     http_req_sending...............: avg=23.4µs   min=6.34µs  med=18.56µs  max=29.96ms  p(90)=23.43µs  p(95)=25.35µs  p(99.9)=455.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.29ms min=23.65ms med=188.7ms  max=351.73ms p(90)=201.46ms p(95)=206.48ms p(99.9)=271.28ms
     http_reqs......................: 31658   258.074381/s
     iteration_duration.............: avg=190.23ms min=64.76ms med=189.19ms max=358.9ms  p(90)=201.88ms p(95)=206.91ms p(99.9)=273.73ms
     iterations.....................: 31558   257.259186/s
     success_rate...................: 100.00% ✓ 31558      ✗ 0    
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

     checks.........................: 100.00% ✓ 5973      ✗ 0   
     data_received..................: 200 MB  1.6 MB/s
     data_sent......................: 2.5 MB  20 kB/s
     http_req_blocked...............: avg=37.13µs min=1.2µs    med=3.14µs  max=7.03ms   p(90)=4.77µs   p(95)=5.79µs   p(99.9)=2.81ms  
     http_req_connecting............: avg=29µs    min=0s       med=0s      max=2.95ms   p(90)=0s       p(95)=0s       p(99.9)=2.64ms  
     http_req_duration..............: avg=2.91s   min=45.45ms  med=3.04s   max=12.29s   p(90)=3.63s    p(95)=3.86s    p(99.9)=11.19s  
       { expected_response:true }...: avg=2.91s   min=45.45ms  med=3.04s   max=12.29s   p(90)=3.63s    p(95)=3.86s    p(99.9)=11.19s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2091
     http_req_receiving.............: avg=96.58µs min=37.6µs   med=92.34µs max=490.69µs p(90)=133.76µs p(95)=150.75µs p(99.9)=344.98µs
     http_req_sending...............: avg=55.26µs min=5.82µs   med=17.96µs max=16.65ms  p(90)=23.4µs   p(95)=27.92µs  p(99.9)=4.19ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.91s   min=45.27ms  med=3.04s   max=12.29s   p(90)=3.63s    p(95)=3.86s    p(99.9)=11.19s  
     http_reqs......................: 2091    16.280643/s
     iteration_duration.............: avg=3.06s   min=632.26ms med=3.08s   max=12.29s   p(90)=3.65s    p(95)=3.88s    p(99.9)=11.29s  
     iterations.....................: 1991    15.502037/s
     success_rate...................: 100.00% ✓ 1991      ✗ 0   
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

