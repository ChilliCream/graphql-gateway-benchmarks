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
| fusion-nightly-net11 | 16.7.0-p.5 | 1,892 | 1,932 | 1,880 | 1.0% |  |
| fusion | 16.6.4 | 1,875 | 1,926 | 1,871 | 1.0% |  |
| fusion-nightly | 16.7.0-p.5 | 1,873 | 1,924 | 1,866 | 1.0% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 1,818 | 1,866 | 1,805 | 1.1% |  |
| hive-router | v0.0.84 | 1,818 | 1,905 | 1,810 | 1.9% |  |
| grafbase | 0.53.5 | 1,285 | 1,312 | 1,279 | 0.9% |  |
| cosmo | 0.334.0 | 1,214 | 1,259 | 1,210 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 546 | 567 | 543 | 1.5% |  |
| apollo-router | v2.16.1 | 426 | 432 | 412 | 1.8% |  |
| hive-gateway | 2.10.8 | 262 | 269 | 260 | 1.1% |  |
| apollo-gateway | 2.14.3 | 261 | 265 | 260 | 0.6% |  |
| feddi | 5ff8b6165878 | 16 | 17 | 15 | 3.8% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 691716      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.91µs   min=782ns   med=1.96µs  max=8.02ms   p(90)=3.57µs  p(95)=4.3µs   p(99.9)=30.93µs
     http_req_connecting............: avg=469ns    min=0s      med=0s      max=6.87ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.8ms   min=17.16ms med=25.25ms max=304.5ms  p(90)=29.9ms  p(95)=31.63ms p(99.9)=49.74ms
       { expected_response:true }...: avg=25.8ms   min=17.16ms med=25.25ms max=304.5ms  p(90)=29.9ms  p(95)=31.63ms p(99.9)=49.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230672
     http_req_receiving.............: avg=391.98µs min=49.9µs  med=89.58µs max=243.01ms p(90)=1.13ms  p(95)=1.85ms  p(99.9)=9.77ms 
     http_req_sending...............: avg=33.5µs   min=4.62µs  med=8.38µs  max=135.46ms p(90)=18.35µs p(95)=34.31µs p(99.9)=1.92ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.37ms  min=17.07ms med=24.86ms max=303.64ms p(90)=29.32ms p(95)=30.98ms p(99.9)=47.22ms
     http_reqs......................: 230672  1892.113557/s
     iteration_duration.............: avg=26.01ms  min=17.37ms med=25.45ms max=322.81ms p(90)=30.1ms  p(95)=31.84ms p(99.9)=50.12ms
     iterations.....................: 230572  1891.293295/s
     success_rate...................: 100.00% ✓ 230572      ✗ 0     
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

     checks.........................: 100.00% ✓ 685533      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.16µs   min=922ns   med=2.39µs  max=4.24ms   p(90)=4.02µs   p(95)=4.74µs  p(99.9)=33.24µs
     http_req_connecting............: avg=421ns    min=0s      med=0s      max=4.21ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.02ms  min=17.57ms med=25.43ms max=310.43ms p(90)=30.48ms  p(95)=32.32ms p(99.9)=49.18ms
       { expected_response:true }...: avg=26.02ms  min=17.57ms med=25.43ms max=310.43ms p(90)=30.48ms  p(95)=32.32ms p(99.9)=49.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228611
     http_req_receiving.............: avg=320.65µs min=51.7µs  med=97.35µs max=164.84ms p(90)=808.35µs p(95)=1.32ms  p(99.9)=8.72ms 
     http_req_sending...............: avg=34.35µs  min=4.76µs  med=9.5µs   max=164.81ms p(90)=18.85µs  p(95)=33.28µs p(99.9)=1.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.67ms  min=17.47ms med=25.09ms max=307.75ms p(90)=30.06ms  p(95)=31.85ms p(99.9)=47.85ms
     http_reqs......................: 228611  1875.207177/s
     iteration_duration.............: avg=26.24ms  min=17.72ms med=25.64ms max=320.73ms p(90)=30.69ms  p(95)=32.53ms p(99.9)=49.68ms
     iterations.....................: 228511  1874.386916/s
     success_rate...................: 100.00% ✓ 228511      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684939      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.87µs   min=892ns   med=2µs     max=3.93ms   p(90)=3.73µs   p(95)=4.47µs  p(99.9)=33.67µs
     http_req_connecting............: avg=398ns    min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.05ms  min=16.93ms med=25.47ms max=316.31ms p(90)=30.46ms  p(95)=32.28ms p(99.9)=49.76ms
       { expected_response:true }...: avg=26.05ms  min=16.93ms med=25.47ms max=316.31ms p(90)=30.46ms  p(95)=32.28ms p(99.9)=49.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228413
     http_req_receiving.............: avg=308.44µs min=49.63µs med=93.13µs max=27.86ms  p(90)=781.32µs p(95)=1.3ms   p(99.9)=8.07ms 
     http_req_sending...............: avg=31.53µs  min=4.72µs  med=8.5µs   max=154.05ms p(90)=18.24µs  p(95)=34.16µs p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.71ms  min=16.8ms  med=25.14ms max=315.7ms  p(90)=30.05ms  p(95)=31.83ms p(99.9)=47.91ms
     http_reqs......................: 228413  1873.15129/s
     iteration_duration.............: avg=26.27ms  min=17.44ms med=25.67ms max=324.76ms p(90)=30.66ms  p(95)=32.49ms p(99.9)=50.29ms
     iterations.....................: 228313  1872.331218/s
     success_rate...................: 100.00% ✓ 228313      ✗ 0     
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

     checks.........................: 100.00% ✓ 665076      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=3.1µs    min=901ns   med=2.07µs  max=9.21ms   p(90)=3.86µs   p(95)=4.64µs  p(99.9)=30.07µs
     http_req_connecting............: avg=441ns    min=0s      med=0s      max=3.37ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.83ms  min=17.15ms med=26.24ms max=315.06ms p(90)=31.35ms  p(95)=33.24ms p(99.9)=50.87ms
       { expected_response:true }...: avg=26.83ms  min=17.15ms med=26.24ms max=315.06ms p(90)=31.35ms  p(95)=33.24ms p(99.9)=50.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221792
     http_req_receiving.............: avg=290.27µs min=49.8µs  med=92.32µs max=127.03ms p(90)=707.44µs p(95)=1.2ms   p(99.9)=7.73ms 
     http_req_sending...............: avg=30.94µs  min=4.61µs  med=8.66µs  max=138.04ms p(90)=18.95µs  p(95)=33.3µs  p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.51ms  min=17.02ms med=25.94ms max=314.54ms p(90)=30.96ms  p(95)=32.84ms p(99.9)=48.96ms
     http_reqs......................: 221792  1818.538355/s
     iteration_duration.............: avg=27.05ms  min=17.34ms med=26.45ms max=323.7ms  p(90)=31.56ms  p(95)=33.45ms p(99.9)=51.38ms
     iterations.....................: 221692  1817.718425/s
     success_rate...................: 100.00% ✓ 221692      ✗ 0     
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

     checks.........................: 100.00% ✓ 665145      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.84µs  min=931ns   med=2.09µs  max=3.46ms   p(90)=3.62µs  p(95)=4.33µs  p(99.9)=27.97µs
     http_req_connecting............: avg=375ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.84ms min=18.05ms med=26.44ms max=310.23ms p(90)=30.6ms  p(95)=32.01ms p(99.9)=48.8ms 
       { expected_response:true }...: avg=26.84ms min=18.05ms med=26.44ms max=310.23ms p(90)=30.6ms  p(95)=32.01ms p(99.9)=48.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 221815
     http_req_receiving.............: avg=73.02µs min=24.99µs med=50.58µs max=82.45ms  p(90)=89.79µs p(95)=112.1µs p(99.9)=1.59ms 
     http_req_sending...............: avg=28.24µs min=4.67µs  med=9.15µs  max=102.09ms p(90)=16.75µs p(95)=22.69µs p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.74ms min=17.92ms med=26.35ms max=309.37ms p(90)=30.5ms  p(95)=31.89ms p(99.9)=47.26ms
     http_reqs......................: 221815  1818.96728/s
     iteration_duration.............: avg=27.05ms min=19.07ms med=26.63ms max=319.62ms p(90)=30.8ms  p(95)=32.21ms p(99.9)=49.35ms
     iterations.....................: 221715  1818.147242/s
     success_rate...................: 100.00% ✓ 221715      ✗ 0     
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

     checks.........................: 100.00% ✓ 470274      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=3.37µs  min=831ns   med=2.14µs  max=3.97ms   p(90)=4.56µs  p(95)=5.55µs   p(99.9)=43.43µs
     http_req_connecting............: avg=620ns   min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.02ms min=18.06ms med=37.75ms max=322.34ms p(90)=44.8ms  p(95)=46.84ms  p(99.9)=61.68ms
       { expected_response:true }...: avg=38.02ms min=18.06ms med=37.75ms max=322.34ms p(90)=44.8ms  p(95)=46.84ms  p(99.9)=61.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156858
     http_req_receiving.............: avg=86.15µs min=26.48µs med=54.34µs max=102.11ms p(90)=122.6µs p(95)=169.97µs p(99.9)=2.59ms 
     http_req_sending...............: avg=32.94µs min=4.39µs  med=9.11µs  max=215.29ms p(90)=24.47µs p(95)=62.04µs  p(99.9)=2.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.9ms  min=17.91ms med=37.64ms max=322.04ms p(90)=44.68ms p(95)=46.7ms   p(99.9)=61.26ms
     http_reqs......................: 156858  1285.867001/s
     iteration_duration.............: avg=38.26ms min=21.27ms med=37.98ms max=333.29ms p(90)=45.02ms p(95)=47.06ms  p(99.9)=62.27ms
     iterations.....................: 156758  1285.047236/s
     success_rate...................: 100.00% ✓ 156758      ✗ 0     
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

     checks.........................: 100.00% ✓ 444060      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.89µs  min=982ns   med=2.74µs  max=4.34ms   p(90)=4.43µs   p(95)=5.15µs   p(99.9)=37.64µs
     http_req_connecting............: avg=807ns   min=0s      med=0s      max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.28ms min=18.9ms  med=39.67ms max=317.41ms p(90)=48.42ms  p(95)=51.26ms  p(99.9)=65.7ms 
       { expected_response:true }...: avg=40.28ms min=18.9ms  med=39.67ms max=317.41ms p(90)=48.42ms  p(95)=51.26ms  p(99.9)=65.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148120
     http_req_receiving.............: avg=99.98µs min=26.42µs med=64.43µs max=148.65ms p(90)=107.39µs p(95)=126.81µs p(99.9)=1.19ms 
     http_req_sending...............: avg=25.66µs min=5µs     med=12.25µs max=59.98ms  p(90)=20.03µs  p(95)=24.28µs  p(99.9)=1.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.16ms min=18.77ms med=39.56ms max=194.28ms p(90)=48.31ms  p(95)=51.14ms  p(99.9)=65.16ms
     http_reqs......................: 148120  1214.148004/s
     iteration_duration.............: avg=40.52ms min=21.02ms med=39.88ms max=340.38ms p(90)=48.64ms  p(95)=51.47ms  p(99.9)=66.08ms
     iterations.....................: 148020  1213.328298/s
     success_rate...................: 100.00% ✓ 148020      ✗ 0     
     vus............................: 16      min=0         max=50  
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

     checks.........................: 100.00% ✓ 200013     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   656 kB/s
     http_req_blocked...............: avg=4.58µs  min=1.02µs  med=2.86µs  max=3.6ms    p(90)=4.33µs   p(95)=4.96µs   p(99.9)=44.85µs 
     http_req_connecting............: avg=1.47µs  min=0s      med=0s      max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.66ms min=20.82ms med=88.35ms max=321.56ms p(90)=106.31ms p(95)=114.77ms p(99.9)=204.06ms
       { expected_response:true }...: avg=89.66ms min=20.82ms med=88.35ms max=321.56ms p(90)=106.31ms p(95)=114.77ms p(99.9)=204.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66771
     http_req_receiving.............: avg=83.34µs min=30.58µs med=76.04µs max=61.52ms  p(90)=111.07µs p(95)=123.57µs p(99.9)=540.3µs 
     http_req_sending...............: avg=21.3µs  min=4.98µs  med=13.73µs max=118.7ms  p(90)=19.89µs  p(95)=21.99µs  p(99.9)=555.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.56ms min=20.63ms med=88.25ms max=321.31ms p(90)=106.2ms  p(95)=114.67ms p(99.9)=203.21ms
     http_reqs......................: 66771   546.102075/s
     iteration_duration.............: avg=90ms    min=31.11ms med=88.61ms max=350.99ms p(90)=106.55ms p(95)=115.03ms p(99.9)=205.77ms
     iterations.....................: 66671   545.284202/s
     success_rate...................: 100.00% ✓ 66671      ✗ 0    
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

     checks.........................: 100.00% ✓ 156441     ✗ 0    
     data_received..................: 4.6 GB  37 MB/s
     data_sent......................: 63 MB   513 kB/s
     http_req_blocked...............: avg=5.35µs   min=1.42µs  med=3.66µs   max=3.33ms   p(90)=5.25µs   p(95)=5.85µs   p(99.9)=92.91µs 
     http_req_connecting............: avg=1.38µs   min=0s      med=0s       max=3.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.63ms min=21.53ms med=112.65ms max=334.98ms p(90)=143.19ms p(95)=153ms    p(99.9)=195.56ms
       { expected_response:true }...: avg=114.63ms min=21.53ms med=112.65ms max=334.98ms p(90)=143.19ms p(95)=153ms    p(99.9)=195.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52247
     http_req_receiving.............: avg=92.62µs  min=32.3µs  med=86.48µs  max=123.94ms p(90)=119.15µs p(95)=132.05µs p(99.9)=633.51µs
     http_req_sending...............: avg=26.87µs  min=5.76µs  med=17.68µs  max=98.15ms  p(90)=23.4µs   p(95)=25.55µs  p(99.9)=603.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.51ms min=21.39ms med=112.54ms max=334.49ms p(90)=143.07ms p(95)=152.87ms p(99.9)=195.42ms
     http_reqs......................: 52247   426.989862/s
     iteration_duration.............: avg=115.09ms min=45.46ms med=112.97ms max=362.81ms p(90)=143.51ms p(95)=153.34ms p(99.9)=198.76ms
     iterations.....................: 52147   426.17261/s
     success_rate...................: 100.00% ✓ 52147      ✗ 0    
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

     checks.........................: 100.00% ✓ 95814      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   315 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.54µs  med=3.88µs   max=4.2ms    p(90)=5.42µs   p(95)=6.05µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=2.93µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=187.13ms min=18.24ms med=174.84ms max=620.4ms  p(90)=224.1ms  p(95)=258.38ms p(99.9)=571.56ms
       { expected_response:true }...: avg=187.13ms min=18.24ms med=174.84ms max=620.4ms  p(90)=224.1ms  p(95)=258.38ms p(99.9)=571.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32038
     http_req_receiving.............: avg=102.95µs min=35.89µs med=94.6µs   max=116.66ms p(90)=127.24µs p(95)=141.33µs p(99.9)=632.14µs
     http_req_sending...............: avg=31.1µs   min=6.35µs  med=19.22µs  max=92.79ms  p(90)=24.12µs  p(95)=26.14µs  p(99.9)=566.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187ms    min=18.1ms  med=174.71ms max=620.31ms p(90)=223.98ms p(95)=258.15ms p(99.9)=571.45ms
     http_reqs......................: 32038   262.181998/s
     iteration_duration.............: avg=187.95ms min=44.84ms med=175.27ms max=620.67ms p(90)=224.48ms p(95)=259.45ms p(99.9)=571.97ms
     iterations.....................: 31938   261.363651/s
     success_rate...................: 100.00% ✓ 31938      ✗ 0    
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

     checks.........................: 100.00% ✓ 95967      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   314 kB/s
     http_req_blocked...............: avg=6.35µs   min=1.1µs   med=3.04µs   max=4.3ms    p(90)=4.38µs   p(95)=4.94µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=3.07µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=186.9ms  min=23.23ms med=202.27ms max=374.72ms p(90)=215.52ms p(95)=219.74ms p(99.9)=286.71ms
       { expected_response:true }...: avg=186.9ms  min=23.23ms med=202.27ms max=374.72ms p(90)=215.52ms p(95)=219.74ms p(99.9)=286.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32089
     http_req_receiving.............: avg=94.07µs  min=30.98µs med=85.98µs  max=65.39ms  p(90)=117.5µs  p(95)=129.4µs  p(99.9)=544.88µs
     http_req_sending...............: avg=30.92µs  min=5.72µs  med=17.03µs  max=138.4ms  p(90)=21.95µs  p(95)=23.86µs  p(99.9)=575.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.77ms min=23.12ms med=202.16ms max=371.02ms p(90)=215.4ms  p(95)=219.63ms p(99.9)=286.52ms
     http_reqs......................: 32089   261.605887/s
     iteration_duration.............: avg=187.69ms min=54.86ms med=202.68ms max=393.95ms p(90)=215.79ms p(95)=220.02ms p(99.9)=288.92ms
     iterations.....................: 31989   260.790636/s
     success_rate...................: 100.00% ✓ 31989      ✗ 0    
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

     checks.........................: 100.00% ✓ 6030      ✗ 0   
     data_received..................: 202 MB  1.6 MB/s
     data_sent......................: 2.5 MB  20 kB/s
     http_req_blocked...............: avg=60.11µs min=1.18µs   med=3.03µs  max=7.29ms p(90)=4.48µs   p(95)=5.25µs  p(99.9)=4.82ms  
     http_req_connecting............: avg=54.09µs min=0s       med=0s      max=7.22ms p(90)=0s       p(95)=0s      p(99.9)=4.79ms  
     http_req_duration..............: avg=2.87s   min=44.24ms  med=3.01s   max=10.56s p(90)=3.69s    p(95)=3.87s   p(99.9)=7.69s   
       { expected_response:true }...: avg=2.87s   min=44.24ms  med=3.01s   max=10.56s p(90)=3.69s    p(95)=3.87s   p(99.9)=7.69s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2110
     http_req_receiving.............: avg=92.99µs min=35.44µs  med=87.13µs max=4.65ms p(90)=131.76µs p(95)=148.9µs p(99.9)=427.99µs
     http_req_sending...............: avg=50.29µs min=5.63µs   med=16.8µs  max=7.27ms p(90)=22.74µs  p(95)=26.21µs p(99.9)=2.58ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.87s   min=44.08ms  med=3.01s   max=10.56s p(90)=3.69s    p(95)=3.87s   p(99.9)=7.69s   
     http_reqs......................: 2110    16.536071/s
     iteration_duration.............: avg=3.01s   min=467.22ms med=3.05s   max=10.57s p(90)=3.7s     p(95)=3.88s   p(99.9)=7.7s    
     iterations.....................: 2010    15.752371/s
     success_rate...................: 100.00% ✓ 2010      ✗ 0   
     vus............................: 17      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

