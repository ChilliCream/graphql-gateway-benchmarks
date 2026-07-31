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
| fusion-nightly | 16.6.0-p.8 | 1,887 | 1,922 | 1,875 | 0.8% |  |
| fusion-nightly-net11 | 16.6.0-p.8 | 1,869 | 1,918 | 1,856 | 1.1% |  |
| fusion | 16.5.1 | 1,852 | 1,907 | 1,842 | 1.1% |  |
| hive-router | v0.0.84 | 1,825 | 1,909 | 1,815 | 1.8% |  |
| fusion-nightly-fed | 16.6.0-p.8 | 1,760 | 1,796 | 1,756 | 0.8% |  |
| grafbase | 0.53.5 | 1,288 | 1,311 | 1,278 | 0.8% |  |
| cosmo | 0.334.0 | 1,217 | 1,259 | 1,213 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 560 | 576 | 556 | 1.2% |  |
| apollo-router | v2.16.1 | 433 | 450 | 431 | 1.6% |  |
| apollo-gateway | 2.14.3 | 257 | 261 | 256 | 0.6% |  |
| hive-gateway | 2.10.8 | 257 | 266 | 256 | 1.3% |  |
| feddi | 5ff8b6165878 | 17 | 17 | 16 | 2.0% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690210      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=3.41µs   min=1.01µs  med=2.64µs  max=6ms      p(90)=4.37µs   p(95)=5.13µs  p(99.9)=40.14µs
     http_req_connecting............: avg=269ns    min=0s      med=0s      max=4.55ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.84ms  min=17.07ms med=25.24ms max=304.67ms p(90)=30.21ms  p(95)=32.05ms p(99.9)=50.89ms
       { expected_response:true }...: avg=25.84ms  min=17.07ms med=25.24ms max=304.67ms p(90)=30.21ms  p(95)=32.05ms p(99.9)=50.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230170
     http_req_receiving.............: avg=306.44µs min=50.31µs med=94.24µs max=174.17ms p(90)=760.58µs p(95)=1.3ms   p(99.9)=8.09ms 
     http_req_sending...............: avg=35.58µs  min=4.85µs  med=9.9µs   max=200.6ms  p(90)=19.75µs  p(95)=53.1µs  p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.5ms   min=16.9ms  med=24.92ms max=273.27ms p(90)=29.79ms  p(95)=31.59ms p(99.9)=49.32ms
     http_reqs......................: 230170  1887.727063/s
     iteration_duration.............: avg=26.06ms  min=17.22ms med=25.45ms max=316.76ms p(90)=30.42ms  p(95)=32.26ms p(99.9)=51.47ms
     iterations.....................: 230070  1886.906919/s
     success_rate...................: 100.00% ✓ 230070      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683415      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.43µs   min=1µs     med=2.6µs   max=5.29ms   p(90)=4.33µs   p(95)=5.08µs  p(99.9)=36.84µs
     http_req_connecting............: avg=391ns    min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.1ms   min=16.9ms  med=25.49ms max=296.53ms p(90)=30.46ms  p(95)=32.37ms p(99.9)=50.9ms 
       { expected_response:true }...: avg=26.1ms   min=16.9ms  med=25.49ms max=296.53ms p(90)=30.46ms  p(95)=32.37ms p(99.9)=50.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 227905
     http_req_receiving.............: avg=331.46µs min=51.17µs med=96.63µs max=254.33ms p(90)=859.03µs p(95)=1.44ms  p(99.9)=9.33ms 
     http_req_sending...............: avg=36.13µs  min=4.89µs  med=9.87µs  max=180.16ms p(90)=20.06µs  p(95)=62.35µs p(99.9)=2.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.73ms  min=16.82ms med=25.14ms max=283.6ms  p(90)=30ms     p(95)=31.84ms p(99.9)=49.11ms
     http_reqs......................: 227905  1869.155795/s
     iteration_duration.............: avg=26.32ms  min=17.08ms med=25.7ms  max=306.12ms p(90)=30.67ms  p(95)=32.58ms p(99.9)=51.19ms
     iterations.....................: 227805  1868.335648/s
     success_rate...................: 100.00% ✓ 227805      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 677445      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.45µs   min=962ns   med=2.65µs   max=5.19ms   p(90)=4.27µs  p(95)=4.98µs  p(99.9)=35.94µs
     http_req_connecting............: avg=415ns    min=0s      med=0s       max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.33ms  min=17.51ms med=25.71ms  max=290.58ms p(90)=30.89ms p(95)=32.85ms p(99.9)=50.9ms 
       { expected_response:true }...: avg=26.33ms  min=17.51ms med=25.71ms  max=290.58ms p(90)=30.89ms p(95)=32.85ms p(99.9)=50.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 225915
     http_req_receiving.............: avg=323.71µs min=51.83µs med=100.82µs max=146.18ms p(90)=812.1µs p(95)=1.31ms  p(99.9)=8.03ms 
     http_req_sending...............: avg=35.83µs  min=4.91µs  med=10.01µs  max=195.47ms p(90)=19.62µs p(95)=34.27µs p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.97ms  min=17.34ms med=25.37ms  max=281.52ms p(90)=30.46ms p(95)=32.39ms p(99.9)=48.98ms
     http_reqs......................: 225915  1852.71617/s
     iteration_duration.............: avg=26.56ms  min=17.75ms med=25.92ms  max=316.28ms p(90)=31.1ms  p(95)=33.06ms p(99.9)=51.24ms
     iterations.....................: 225815  1851.896075/s
     success_rate...................: 100.00% ✓ 225815      ✗ 0     
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

     checks.........................: 100.00% ✓ 667548      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=3.6µs   min=1.01µs  med=2.77µs  max=4.44ms   p(90)=4.39µs  p(95)=5.12µs   p(99.9)=39.12µs
     http_req_connecting............: avg=461ns   min=0s      med=0s      max=4.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.74ms min=17.86ms med=26.28ms max=304.5ms  p(90)=30.5ms  p(95)=32.01ms  p(99.9)=49.29ms
       { expected_response:true }...: avg=26.74ms min=17.86ms med=26.28ms max=304.5ms  p(90)=30.5ms  p(95)=32.01ms  p(99.9)=49.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222616
     http_req_receiving.............: avg=78.29µs min=25.54µs med=54.07µs max=29.21ms  p(90)=97.4µs  p(95)=123.81µs p(99.9)=1.98ms 
     http_req_sending...............: avg=32.94µs min=4.66µs  med=10.77µs max=162.07ms p(90)=18.78µs p(95)=26.04µs  p(99.9)=1.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.62ms min=17.72ms med=26.18ms max=303.62ms p(90)=30.39ms p(95)=31.88ms  p(99.9)=48.35ms
     http_reqs......................: 222616  1825.527246/s
     iteration_duration.............: avg=26.95ms min=18.36ms med=26.48ms max=324.5ms  p(90)=30.71ms p(95)=32.22ms  p(99.9)=49.74ms
     iterations.....................: 222516  1824.707212/s
     success_rate...................: 100.00% ✓ 222516      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 644100      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 258 MB  2.1 MB/s
     http_req_blocked...............: avg=3.55µs   min=1.02µs  med=2.65µs   max=6.85ms   p(90)=4.47µs   p(95)=5.28µs  p(99.9)=39.55µs
     http_req_connecting............: avg=435ns    min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.71ms  min=18.31ms med=27.13ms  max=310.69ms p(90)=32.49ms  p(95)=34.37ms p(99.9)=50.99ms
       { expected_response:true }...: avg=27.71ms  min=18.31ms med=27.13ms  max=310.69ms p(90)=32.49ms  p(95)=34.37ms p(99.9)=50.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 214800
     http_req_receiving.............: avg=328.42µs min=50.93µs med=102.09µs max=169.47ms p(90)=831.51µs p(95)=1.38ms  p(99.9)=8.25ms 
     http_req_sending...............: avg=34.45µs  min=4.69µs  med=10.17µs  max=135.08ms p(90)=20.46µs  p(95)=38.53µs p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.34ms  min=18.14ms med=26.78ms  max=310.49ms p(90)=32.06ms  p(95)=33.9ms  p(99.9)=49.28ms
     http_reqs......................: 214800  1760.676799/s
     iteration_duration.............: avg=27.93ms  min=18.7ms  med=27.35ms  max=322.93ms p(90)=32.7ms   p(95)=34.59ms p(99.9)=51.29ms
     iterations.....................: 214700  1759.857117/s
     success_rate...................: 100.00% ✓ 214700      ✗ 0     
     vus............................: 34      min=0         max=50  
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

     checks.........................: 100.00% ✓ 471309      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=4.33µs  min=1.09µs  med=3.12µs  max=5.74ms   p(90)=5.54µs   p(95)=6.52µs   p(99.9)=48.09µs
     http_req_connecting............: avg=638ns   min=0s      med=0s      max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.91ms min=17.42ms med=37.64ms max=302.16ms p(90)=44.71ms  p(95)=46.79ms  p(99.9)=65.61ms
       { expected_response:true }...: avg=37.91ms min=17.42ms med=37.64ms max=302.16ms p(90)=44.71ms  p(95)=46.79ms  p(99.9)=65.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157203
     http_req_receiving.............: avg=92.23µs min=27.58µs med=62.16µs max=50.11ms  p(90)=131.32µs p(95)=181.49µs p(99.9)=2.3ms  
     http_req_sending...............: avg=38.88µs min=4.81µs  med=11.62µs max=252.45ms p(90)=25.03µs  p(95)=59.63µs  p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.78ms min=17.23ms med=37.52ms max=301.84ms p(90)=44.57ms  p(95)=46.65ms  p(99.9)=63.59ms
     http_reqs......................: 157203  1288.844841/s
     iteration_duration.............: avg=38.18ms min=21.69ms med=37.89ms max=313.66ms p(90)=44.94ms  p(95)=47.01ms  p(99.9)=66.01ms
     iterations.....................: 157103  1288.024981/s
     success_rate...................: 100.00% ✓ 157103      ✗ 0     
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

     checks.........................: 100.00% ✓ 445140      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.49µs  min=1.04µs  med=2.91µs  max=2.31ms   p(90)=4.58µs   p(95)=5.29µs   p(99.9)=37.19µs
     http_req_connecting............: avg=285ns   min=0s      med=0s      max=2.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.19ms min=18.84ms med=39.58ms max=316.84ms p(90)=48.28ms  p(95)=51.13ms  p(99.9)=65.48ms
       { expected_response:true }...: avg=40.19ms min=18.84ms med=39.58ms max=316.84ms p(90)=48.28ms  p(95)=51.13ms  p(99.9)=65.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148480
     http_req_receiving.............: avg=80.95µs min=26.14µs med=65.21µs max=71.52ms  p(90)=106.88µs p(95)=125.39µs p(99.9)=1ms    
     http_req_sending...............: avg=27.69µs min=4.96µs  med=11.94µs max=108.02ms p(90)=19.68µs  p(95)=23.89µs  p(99.9)=1.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.08ms min=18.7ms  med=39.48ms max=316.64ms p(90)=48.17ms  p(95)=51.01ms  p(99.9)=64.98ms
     http_reqs......................: 148480  1217.185864/s
     iteration_duration.............: avg=40.43ms min=22.19ms med=39.8ms  max=331.13ms p(90)=48.49ms  p(95)=51.35ms  p(99.9)=65.88ms
     iterations.....................: 148380  1216.366099/s
     success_rate...................: 100.00% ✓ 148380      ✗ 0     
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

     checks.........................: 100.00% ✓ 205128     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   673 kB/s
     http_req_blocked...............: avg=6.5µs   min=1.25µs  med=3.45µs  max=8ms      p(90)=5.04µs   p(95)=5.74µs   p(99.9)=46.89µs 
     http_req_connecting............: avg=2.57µs  min=0s      med=0s      max=7.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.38ms min=21.36ms med=85.98ms max=323.43ms p(90)=104.32ms p(95)=113.24ms p(99.9)=199ms   
       { expected_response:true }...: avg=87.38ms min=21.36ms med=85.98ms max=323.43ms p(90)=104.32ms p(95)=113.24ms p(99.9)=199ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 68476
     http_req_receiving.............: avg=87.34µs min=30.71µs med=79µs    max=41.6ms   p(90)=114.85µs p(95)=128.77µs p(99.9)=719.75µs
     http_req_sending...............: avg=26.45µs min=5.6µs   med=15.5µs  max=168.81ms p(90)=22.13µs  p(95)=24.49µs  p(99.9)=841.12µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.27ms min=21.24ms med=85.87ms max=323.23ms p(90)=104.2ms  p(95)=113.11ms p(99.9)=198.63ms
     http_reqs......................: 68476   560.099219/s
     iteration_duration.............: avg=87.75ms min=33.02ms med=86.24ms max=342.83ms p(90)=104.57ms p(95)=113.52ms p(99.9)=200.78ms
     iterations.....................: 68376   559.281269/s
     success_rate...................: 100.00% ✓ 68376      ✗ 0    
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

     checks.........................: 100.00% ✓ 158841     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   521 kB/s
     http_req_blocked...............: avg=5.61µs   min=1.31µs  med=3.61µs   max=4.14ms   p(90)=5.19µs   p(95)=5.84µs   p(99.9)=105.94µs
     http_req_connecting............: avg=1.7µs    min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.88ms min=20.59ms med=111.01ms max=341.31ms p(90)=140.66ms p(95)=149.92ms p(99.9)=190.69ms
       { expected_response:true }...: avg=112.88ms min=20.59ms med=111.01ms max=341.31ms p(90)=140.66ms p(95)=149.92ms p(99.9)=190.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53047
     http_req_receiving.............: avg=94.72µs  min=31.33µs med=85.44µs  max=148.93ms p(90)=119.3µs  p(95)=132.97µs p(99.9)=567.73µs
     http_req_sending...............: avg=28.64µs  min=5.87µs  med=17.48µs  max=94.05ms  p(90)=23.38µs  p(95)=25.5µs   p(99.9)=638.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.76ms min=20.47ms med=110.89ms max=341.11ms p(90)=140.52ms p(95)=149.8ms  p(99.9)=190.14ms
     http_reqs......................: 53047   433.742988/s
     iteration_duration.............: avg=113.33ms min=35.67ms med=111.32ms max=352.81ms p(90)=140.94ms p(95)=150.26ms p(99.9)=192.29ms
     iterations.....................: 52947   432.92533/s
     success_rate...................: 100.00% ✓ 52947      ✗ 0    
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

     checks.........................: 100.00% ✓ 94551      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=6.51µs   min=1.33µs  med=3.74µs   max=3.39ms   p(90)=5.21µs   p(95)=5.81µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=2.35µs   min=0s      med=0s       max=3.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=189.64ms min=23.29ms med=190.65ms max=360.43ms p(90)=215.09ms p(95)=221.82ms p(99.9)=292.33ms
       { expected_response:true }...: avg=189.64ms min=23.29ms med=190.65ms max=360.43ms p(90)=215.09ms p(95)=221.82ms p(99.9)=292.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31617
     http_req_receiving.............: avg=97.73µs  min=36.44µs med=87.74µs  max=77.56ms  p(90)=119.92µs p(95)=132.13µs p(99.9)=507.94µs
     http_req_sending...............: avg=28.41µs  min=6.41µs  med=18.06µs  max=71.85ms  p(90)=23.19µs  p(95)=25.08µs  p(99.9)=847.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.52ms min=23.19ms med=190.52ms max=360.07ms p(90)=214.97ms p(95)=221.71ms p(99.9)=292.12ms
     http_reqs......................: 31617   257.779149/s
     iteration_duration.............: avg=190.47ms min=58.16ms med=191.42ms max=368.07ms p(90)=215.39ms p(95)=222.15ms p(99.9)=293.68ms
     iterations.....................: 31517   256.963831/s
     success_rate...................: 100.00% ✓ 31517      ✗ 0    
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

     checks.........................: 100.00% ✓ 94131      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=7.34µs   min=1.39µs  med=3.69µs   max=4.03ms   p(90)=5.29µs   p(95)=5.96µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=3.31µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=190.48ms min=18.4ms  med=176.38ms max=630.67ms p(90)=235.53ms p(95)=273.82ms p(99.9)=568.59ms
       { expected_response:true }...: avg=190.48ms min=18.4ms  med=176.38ms max=630.67ms p(90)=235.53ms p(95)=273.82ms p(99.9)=568.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31477
     http_req_receiving.............: avg=101.57µs min=35.56µs med=91.8µs   max=71.74ms  p(90)=124.59µs p(95)=137.92µs p(99.9)=783.74µs
     http_req_sending...............: avg=29.26µs  min=6.2µs   med=19.22µs  max=65.66ms  p(90)=24.44µs  p(95)=26.46µs  p(99.9)=515.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.35ms min=18.25ms med=176.26ms max=630.54ms p(90)=235.38ms p(95)=273.68ms p(99.9)=568.48ms
     http_reqs......................: 31477   257.793382/s
     iteration_duration.............: avg=191.34ms min=48.84ms med=176.82ms max=630.94ms p(90)=235.95ms p(95)=275.95ms p(99.9)=568.94ms
     iterations.....................: 31377   256.974392/s
     success_rate...................: 100.00% ✓ 31377      ✗ 0    
     vus............................: 41      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6363      ✗ 0   
     data_received..................: 213 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=44.56µs  min=1.56µs   med=3.7µs   max=6.12ms  p(90)=5.34µs   p(95)=6.36µs   p(99.9)=4.27ms  
     http_req_connecting............: avg=34.27µs  min=0s       med=0s      max=4.27ms  p(90)=0s       p(95)=0s       p(99.9)=3.85ms  
     http_req_duration..............: avg=2.72s    min=39.95ms  med=2.85s   max=9.79s   p(90)=3.49s    p(95)=3.66s    p(99.9)=8.74s   
       { expected_response:true }...: avg=2.72s    min=39.95ms  med=2.85s   max=9.79s   p(90)=3.49s    p(95)=3.66s    p(99.9)=8.74s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2221
     http_req_receiving.............: avg=108.48µs min=39.28µs  med=95.16µs max=16.68ms p(90)=137.22µs p(95)=157.95µs p(99.9)=748.01µs
     http_req_sending...............: avg=45.22µs  min=6.48µs   med=18.69µs max=13.78ms p(90)=24.27µs  p(95)=29.13µs  p(99.9)=1.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.72s    min=39.81ms  med=2.85s   max=9.79s   p(90)=3.49s    p(95)=3.66s    p(99.9)=8.73s   
     http_reqs......................: 2221    17.486662/s
     iteration_duration.............: avg=2.84s    min=707.03ms med=2.88s   max=9.8s    p(90)=3.5s     p(95)=3.68s    p(99.9)=8.76s   
     iterations.....................: 2121    16.699329/s
     success_rate...................: 100.00% ✓ 2121      ✗ 0   
     vus............................: 8       min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

