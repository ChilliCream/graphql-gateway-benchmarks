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
| fusion | 16.6.1 | 1,899 | 1,943 | 1,889 | 0.9% |  |
| fusion-nightly | 16.6.2-p.4 | 1,890 | 1,942 | 1,879 | 1.1% |  |
| fusion-nightly-net11 | 16.6.2-p.4 | 1,871 | 1,922 | 1,866 | 1.0% |  |
| hive-router | v0.0.84 | 1,860 | 1,927 | 1,850 | 1.4% |  |
| fusion-nightly-fed | 16.6.2-p.4 | 1,822 | 1,863 | 1,817 | 0.9% |  |
| grafbase | 0.53.5 | 1,308 | 1,336 | 1,288 | 1.2% |  |
| cosmo | 0.334.0 | 1,174 | 1,218 | 1,168 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 557 | 578 | 554 | 1.4% |  |
| apollo-router | v2.16.1 | 408 | 420 | 389 | 2.3% |  |
| hive-gateway | 2.10.8 | 265 | 273 | 263 | 1.1% |  |
| apollo-gateway | 2.14.3 | 257 | 262 | 257 | 0.7% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 694377      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.79µs   min=871ns   med=1.99µs  max=5.26ms   p(90)=3.69µs   p(95)=4.44µs  p(99.9)=28.6µs 
     http_req_connecting............: avg=355ns    min=0s      med=0s      max=3.2ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.69ms  min=17.52ms med=25.12ms max=293.99ms p(90)=29.98ms  p(95)=31.76ms p(99.9)=48.8ms 
       { expected_response:true }...: avg=25.69ms  min=17.52ms med=25.12ms max=293.99ms p(90)=29.98ms  p(95)=31.76ms p(99.9)=48.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 231559
     http_req_receiving.............: avg=302.92µs min=50.65µs med=93.7µs  max=175.28ms p(90)=762.32µs p(95)=1.25ms  p(99.9)=7.8ms  
     http_req_sending...............: avg=29.54µs  min=4.39µs  med=8.37µs  max=63.18ms  p(90)=17.93µs  p(95)=29.04µs p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.36ms  min=16.94ms med=24.8ms  max=293.25ms p(90)=29.59ms  p(95)=31.34ms p(99.9)=46.77ms
     http_reqs......................: 231559  1899.257419/s
     iteration_duration.............: avg=25.91ms  min=17.71ms med=25.33ms max=308.26ms p(90)=30.19ms  p(95)=31.97ms p(99.9)=49.09ms
     iterations.....................: 231459  1898.437215/s
     success_rate...................: 100.00% ✓ 231459      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 691086      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.81µs   min=832ns   med=1.96µs  max=8.5ms    p(90)=3.54µs   p(95)=4.26µs  p(99.9)=32.79µs
     http_req_connecting............: avg=408ns    min=0s      med=0s      max=3.31ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.82ms  min=17.15ms med=25.2ms  max=292.66ms p(90)=30.19ms  p(95)=32.07ms p(99.9)=50.23ms
       { expected_response:true }...: avg=25.82ms  min=17.15ms med=25.2ms  max=292.66ms p(90)=30.19ms  p(95)=32.07ms p(99.9)=50.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230462
     http_req_receiving.............: avg=313.17µs min=49.5µs  med=92.24µs max=203.22ms p(90)=790.71µs p(95)=1.31ms  p(99.9)=8.68ms 
     http_req_sending...............: avg=32.58µs  min=4.23µs  med=8.37µs  max=244.73ms p(90)=17.79µs  p(95)=35.31µs p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.47ms  min=17.06ms med=24.88ms max=292.44ms p(90)=29.78ms  p(95)=31.61ms p(99.9)=49.22ms
     http_reqs......................: 230462  1890.399587/s
     iteration_duration.............: avg=26.03ms  min=17.36ms med=25.4ms  max=305.06ms p(90)=30.39ms  p(95)=32.27ms p(99.9)=50.6ms 
     iterations.....................: 230362  1889.579322/s
     success_rate...................: 100.00% ✓ 230362      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684075      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.76µs   min=851ns   med=1.94µs  max=7.9ms    p(90)=3.64µs   p(95)=4.37µs  p(99.9)=34.81µs
     http_req_connecting............: avg=369ns    min=0s      med=0s      max=3.38ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.08ms  min=17.06ms med=25.53ms max=298.53ms p(90)=30.43ms  p(95)=32.19ms p(99.9)=49.99ms
       { expected_response:true }...: avg=26.08ms  min=17.06ms med=25.53ms max=298.53ms p(90)=30.43ms  p(95)=32.19ms p(99.9)=49.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228125
     http_req_receiving.............: avg=256.17µs min=49.08µs med=86.19µs max=184.24ms p(90)=580.98µs p(95)=1.1ms   p(99.9)=6.95ms 
     http_req_sending...............: avg=30.29µs  min=4.48µs  med=8.27µs  max=54.24ms  p(90)=18.92µs  p(95)=32.12µs p(99.9)=1.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.8ms   min=16.92ms med=25.26ms max=297.85ms p(90)=30.1ms   p(95)=31.82ms p(99.9)=48.86ms
     http_reqs......................: 228125  1871.19902/s
     iteration_duration.............: avg=26.3ms   min=17.24ms med=25.73ms max=319.51ms p(90)=30.63ms  p(95)=32.39ms p(99.9)=50.39ms
     iterations.....................: 228025  1870.378769/s
     success_rate...................: 100.00% ✓ 228025      ✗ 0     
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

     checks.........................: 100.00% ✓ 680073      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.15µs  min=1.03µs  med=2.6µs   max=2.23ms   p(90)=4.21µs  p(95)=4.91µs   p(99.9)=33.4µs 
     http_req_connecting............: avg=217ns   min=0s      med=0s      max=2.21ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.24ms min=17.76ms med=25.79ms max=300.43ms p(90)=29.97ms p(95)=31.4ms   p(99.9)=47.24ms
       { expected_response:true }...: avg=26.24ms min=17.76ms med=25.79ms max=300.43ms p(90)=29.97ms p(95)=31.4ms   p(99.9)=47.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226791
     http_req_receiving.............: avg=75.66µs min=25.11µs med=51.9µs  max=154.79ms p(90)=95.3µs  p(95)=123.37µs p(99.9)=1.86ms 
     http_req_sending...............: avg=30.49µs min=4.39µs  med=10.28µs max=30.47ms  p(90)=19µs    p(95)=26.32µs  p(99.9)=1.43ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.13ms min=17.67ms med=25.7ms  max=300.23ms p(90)=29.86ms p(95)=31.27ms  p(99.9)=45.78ms
     http_reqs......................: 226791  1860.21688/s
     iteration_duration.............: avg=26.45ms min=18ms    med=26ms    max=314.04ms p(90)=30.17ms p(95)=31.61ms  p(99.9)=47.57ms
     iterations.....................: 226691  1859.396646/s
     success_rate...................: 100.00% ✓ 226691      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 666717      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.88µs   min=891ns   med=2.02µs  max=4.13ms   p(90)=3.68µs  p(95)=4.43µs  p(99.9)=35.9µs 
     http_req_connecting............: avg=425ns    min=0s      med=0s      max=4.09ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.77ms  min=17.72ms med=26.19ms max=303.83ms p(90)=31.27ms p(95)=33.11ms p(99.9)=49.43ms
       { expected_response:true }...: avg=26.77ms  min=17.72ms med=26.19ms max=303.83ms p(90)=31.27ms p(95)=33.11ms p(99.9)=49.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222339
     http_req_receiving.............: avg=296.93µs min=49.33µs med=95.75µs max=241.07ms p(90)=739.9µs p(95)=1.23ms  p(99.9)=7.48ms 
     http_req_sending...............: avg=32.68µs  min=4.68µs  med=8.74µs  max=241.84ms p(90)=19.3µs  p(95)=31.7µs  p(99.9)=1.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.44ms  min=17.52ms med=25.88ms max=303.49ms p(90)=30.87ms p(95)=32.69ms p(99.9)=47.68ms
     http_reqs......................: 222339  1822.966864/s
     iteration_duration.............: avg=26.98ms  min=18.14ms med=26.4ms  max=322.98ms p(90)=31.48ms p(95)=33.32ms p(99.9)=49.81ms
     iterations.....................: 222239  1822.14696/s
     success_rate...................: 100.00% ✓ 222239      ✗ 0     
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

     checks.........................: 100.00% ✓ 478719      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=2.99µs  min=832ns   med=2.13µs  max=3.01ms   p(90)=4.62µs   p(95)=5.62µs   p(99.9)=38.53µs
     http_req_connecting............: avg=249ns   min=0s      med=0s      max=2.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.33ms min=18.34ms med=37.05ms max=325.33ms p(90)=43.8ms   p(95)=45.83ms  p(99.9)=61.04ms
       { expected_response:true }...: avg=37.33ms min=18.34ms med=37.05ms max=325.33ms p(90)=43.8ms   p(95)=45.83ms  p(99.9)=61.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159673
     http_req_receiving.............: avg=83.72µs min=27.13µs med=54.96µs max=104.14ms p(90)=122.55µs p(95)=163.81µs p(99.9)=1.91ms 
     http_req_sending...............: avg=34.47µs min=4.31µs  med=9.13µs  max=210.17ms p(90)=23.27µs  p(95)=35.83µs  p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.22ms min=18.14ms med=36.94ms max=324.92ms p(90)=43.68ms  p(95)=45.71ms  p(99.9)=59.79ms
     http_reqs......................: 159673  1308.768864/s
     iteration_duration.............: avg=37.59ms min=22.19ms med=37.28ms max=338.09ms p(90)=44.02ms  p(95)=46.04ms  p(99.9)=62.33ms
     iterations.....................: 159573  1307.949209/s
     success_rate...................: 100.00% ✓ 159573      ✗ 0     
     vus............................: 29      min=0         max=50  
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

     checks.........................: 100.00% ✓ 429363      ✗ 0     
     data_received..................: 13 GB   103 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.13µs  min=982ns   med=2.2µs   max=3.49ms   p(90)=3.77µs   p(95)=4.47µs   p(99.9)=33.86µs 
     http_req_connecting............: avg=595ns   min=0s      med=0s      max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.69ms min=18.38ms med=41.06ms max=299.34ms p(90)=50.32ms  p(95)=53.26ms  p(99.9)=68.8ms  
       { expected_response:true }...: avg=41.69ms min=18.38ms med=41.06ms max=299.34ms p(90)=50.32ms  p(95)=53.26ms  p(99.9)=68.8ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 143221
     http_req_receiving.............: avg=78.32µs min=27.48µs med=64.81µs max=126.05ms p(90)=106.38µs p(95)=124.66µs p(99.9)=720.81µs
     http_req_sending...............: avg=24.82µs min=4.84µs  med=10.4µs  max=136.64ms p(90)=17.41µs  p(95)=21.11µs  p(99.9)=814.14µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.58ms min=18.22ms med=40.96ms max=298.8ms  p(90)=50.23ms  p(95)=53.17ms  p(99.9)=68.36ms 
     http_reqs......................: 143221  1174.085865/s
     iteration_duration.............: avg=41.91ms min=23.65ms med=41.26ms max=326.4ms  p(90)=50.53ms  p(95)=53.46ms  p(99.9)=69.06ms 
     iterations.....................: 143121  1173.266093/s
     success_rate...................: 100.00% ✓ 143121      ✗ 0     
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

     checks.........................: 100.00% ✓ 204150     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   669 kB/s
     http_req_blocked...............: avg=4.84µs  min=1.02µs  med=3.12µs  max=3.98ms   p(90)=4.74µs   p(95)=5.41µs   p(99.9)=47.22µs 
     http_req_connecting............: avg=1.47µs  min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.83ms min=20.72ms med=86.25ms max=333.49ms p(90)=105.65ms p(95)=114.62ms p(99.9)=203.16ms
       { expected_response:true }...: avg=87.83ms min=20.72ms med=86.25ms max=333.49ms p(90)=105.65ms p(95)=114.62ms p(99.9)=203.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68150
     http_req_receiving.............: avg=88.18µs min=28.29µs med=75.46µs max=159.46ms p(90)=111.5µs  p(95)=124.8µs  p(99.9)=627.48µs
     http_req_sending...............: avg=32.34µs min=4.76µs  med=14.8µs  max=201.56ms p(90)=21.35µs  p(95)=23.61µs  p(99.9)=583.88µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.71ms min=20.56ms med=86.16ms max=333.07ms p(90)=105.53ms p(95)=114.45ms p(99.9)=201.9ms 
     http_reqs......................: 68150   557.338745/s
     iteration_duration.............: avg=88.18ms min=36.21ms med=86.51ms max=340.65ms p(90)=105.91ms p(95)=114.91ms p(99.9)=205.33ms
     iterations.....................: 68050   556.520933/s
     success_rate...................: 100.00% ✓ 68050      ✗ 0    
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

     checks.........................: 100.00% ✓ 149622     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   491 kB/s
     http_req_blocked...............: avg=5.02µs   min=1.05µs  med=3.11µs   max=33.62ms  p(90)=4.69µs   p(95)=5.32µs   p(99.9)=144.29µs
     http_req_connecting............: avg=1.66µs   min=0s      med=0s       max=33.54ms  p(90)=0s       p(95)=0s       p(99.9)=53.26µs 
     http_req_duration..............: avg=119.85ms min=21.55ms med=117.6ms  max=337.89ms p(90)=150.45ms p(95)=160.9ms  p(99.9)=205.37ms
       { expected_response:true }...: avg=119.85ms min=21.55ms med=117.6ms  max=337.89ms p(90)=150.45ms p(95)=160.9ms  p(99.9)=205.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49974
     http_req_receiving.............: avg=93.16µs  min=30.32µs med=81.61µs  max=170.09ms p(90)=112.62µs p(95)=124.17µs p(99.9)=544.36µs
     http_req_sending...............: avg=26.28µs  min=5.38µs  med=16.79µs  max=126.22ms p(90)=22.35µs  p(95)=24.41µs  p(99.9)=519.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.73ms min=21.41ms med=117.49ms max=337.55ms p(90)=150.35ms p(95)=160.78ms p(99.9)=204.46ms
     http_reqs......................: 49974   408.490323/s
     iteration_duration.............: avg=120.32ms min=32.46ms med=117.91ms max=352.23ms p(90)=150.74ms p(95)=161.23ms p(99.9)=207.51ms
     iterations.....................: 49874   407.672917/s
     success_rate...................: 100.00% ✓ 49874      ✗ 0    
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

     checks.........................: 100.00% ✓ 96885      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.36µs   min=1.33µs  med=3.94µs   max=3.16ms   p(90)=5.55µs   p(95)=6.2µs    p(99.9)=964.95µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=3.05ms   p(90)=0s       p(95)=0s       p(99.9)=941.65µs
     http_req_duration..............: avg=185.06ms min=17.79ms med=172.41ms max=851.01ms p(90)=220ms    p(95)=248.7ms  p(99.9)=602.56ms
       { expected_response:true }...: avg=185.06ms min=17.79ms med=172.41ms max=851.01ms p(90)=220ms    p(95)=248.7ms  p(99.9)=602.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32395
     http_req_receiving.............: avg=104.72µs min=35.7µs  med=95.03µs  max=83.24ms  p(90)=128.12µs p(95)=142.32µs p(99.9)=842.14µs
     http_req_sending...............: avg=30.45µs  min=6.65µs  med=19.89µs  max=99.82ms  p(90)=25.16µs  p(95)=27.32µs  p(99.9)=568.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.93ms min=17.64ms med=172.28ms max=850.93ms p(90)=219.86ms p(95)=248.57ms p(99.9)=602.44ms
     http_reqs......................: 32395   265.469606/s
     iteration_duration.............: avg=185.89ms min=46.28ms med=172.8ms  max=851.38ms p(90)=220.37ms p(95)=249.64ms p(99.9)=603ms   
     iterations.....................: 32295   264.650129/s
     success_rate...................: 100.00% ✓ 32295      ✗ 0    
     vus............................: 21      min=0        max=50 
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

     checks.........................: 100.00% ✓ 94428      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=6.77µs   min=1.33µs  med=3.53µs   max=4.08ms   p(90)=4.98µs   p(95)=5.55µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=189.91ms min=23.77ms med=192.96ms max=410.22ms p(90)=202.11ms p(95)=206.89ms p(99.9)=284.56ms
       { expected_response:true }...: avg=189.91ms min=23.77ms med=192.96ms max=410.22ms p(90)=202.11ms p(95)=206.89ms p(99.9)=284.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31576
     http_req_receiving.............: avg=97.71µs  min=32.41µs med=87.2µs   max=87.9ms   p(90)=119.61µs p(95)=132.22µs p(99.9)=603.61µs
     http_req_sending...............: avg=35.37µs  min=6.25µs  med=17.21µs  max=164.6ms  p(90)=22.66µs  p(95)=24.73µs  p(99.9)=557.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.78ms min=23.61ms med=192.84ms max=398.04ms p(90)=201.99ms p(95)=206.78ms p(99.9)=283.57ms
     http_reqs......................: 31576   257.37543/s
     iteration_duration.............: avg=190.74ms min=58.7ms  med=193.24ms max=417.3ms  p(90)=202.4ms  p(95)=207.21ms p(99.9)=291.91ms
     iterations.....................: 31476   256.560332/s
     success_rate...................: 100.00% ✓ 31476      ✗ 0    
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

     checks.........................: 100.00% ✓ 7095      ✗ 0   
     data_received..................: 236 MB  1.9 MB/s
     data_sent......................: 3.0 MB  23 kB/s
     http_req_blocked...............: avg=91.64µs min=1.17µs   med=3.3µs   max=8.51ms   p(90)=4.98µs   p(95)=5.9µs    p(99.9)=8.15ms  
     http_req_connecting............: avg=86.04µs min=0s       med=0s      max=8.47ms   p(90)=0s       p(95)=0s       p(99.9)=8.06ms  
     http_req_duration..............: avg=2.45s   min=38.17ms  med=2.51s   max=4.81s    p(90)=3.36s    p(95)=3.6s     p(99.9)=4.53s   
       { expected_response:true }...: avg=2.45s   min=38.17ms  med=2.51s   max=4.81s    p(90)=3.36s    p(95)=3.6s     p(99.9)=4.53s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2465
     http_req_receiving.............: avg=100.2µs min=32.5µs   med=96.16µs max=726.51µs p(90)=133.77µs p(95)=148.58µs p(99.9)=399.63µs
     http_req_sending...............: avg=93.81µs min=6.2µs    med=19.24µs max=37.36ms  p(90)=24.68µs  p(95)=30.52µs  p(99.9)=14.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.45s   min=37.98ms  med=2.51s   max=4.81s    p(90)=3.36s    p(95)=3.6s     p(99.9)=4.53s   
     http_reqs......................: 2465    19.475124/s
     iteration_duration.............: avg=2.55s   min=511.73ms med=2.55s   max=4.81s    p(90)=3.38s    p(95)=3.63s    p(99.9)=4.54s   
     iterations.....................: 2365    18.685058/s
     success_rate...................: 100.00% ✓ 2365      ✗ 0   
     vus............................: 36      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

