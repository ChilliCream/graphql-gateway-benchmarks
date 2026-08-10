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
| fusion | 16.6.0 | 1,875 | 1,933 | 1,868 | 1.3% |  |
| hive-router | v0.0.84 | 1,826 | 1,906 | 1,812 | 1.7% |  |
| grafbase | 0.53.5 | 1,292 | 1,323 | 1,283 | 1.1% |  |
| cosmo | 0.334.0 | 1,230 | 1,271 | 1,224 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 590 | 571 | 1.2% |  |
| apollo-router | v2.16.1 | 395 | 414 | 393 | 2.0% |  |
| hive-gateway | 2.10.8 | 263 | 270 | 261 | 1.0% |  |
| apollo-gateway | 2.14.3 | 259 | 264 | 256 | 0.9% |  |
| feddi | 5ff8b6165878 | 20 | 20 | 19 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685998      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.49µs   min=912ns   med=2.59µs   max=7.55ms   p(90)=4.29µs   p(95)=5.02µs  p(99.9)=38.3µs 
     http_req_connecting............: avg=410ns    min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26ms     min=17.19ms med=25.36ms  max=305.24ms p(90)=30.45ms  p(95)=32.39ms p(99.9)=51.04ms
       { expected_response:true }...: avg=26ms     min=17.19ms med=25.36ms  max=305.24ms p(90)=30.45ms  p(95)=32.39ms p(99.9)=51.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228766
     http_req_receiving.............: avg=333.43µs min=51.69µs med=101.52µs max=116.96ms p(90)=840.45µs p(95)=1.36ms  p(99.9)=8.05ms 
     http_req_sending...............: avg=34.65µs  min=4.78µs  med=9.86µs   max=147.2ms  p(90)=19.6µs   p(95)=47.85µs p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.64ms  min=17.08ms med=25.01ms  max=281.92ms p(90)=30.01ms  p(95)=31.92ms p(99.9)=49.64ms
     http_reqs......................: 228766  1875.852629/s
     iteration_duration.............: avg=26.23ms  min=17.36ms med=25.57ms  max=322.96ms p(90)=30.66ms  p(95)=32.61ms p(99.9)=51.55ms
     iterations.....................: 228666  1875.032642/s
     success_rate...................: 100.00% ✓ 228666      ✗ 0     
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

     checks.........................: 100.00% ✓ 667986      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=3.54µs  min=1.05µs  med=2.73µs  max=3.61ms   p(90)=4.46µs  p(95)=5.21µs   p(99.9)=39.14µs
     http_req_connecting............: avg=428ns   min=0s      med=0s      max=3.57ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.71ms min=18.19ms med=26.24ms max=307.83ms p(90)=30.48ms p(95)=31.98ms  p(99.9)=48.64ms
       { expected_response:true }...: avg=26.71ms min=18.19ms med=26.24ms max=307.83ms p(90)=30.48ms p(95)=31.98ms  p(99.9)=48.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222762
     http_req_receiving.............: avg=80.61µs min=25.37µs med=54.45µs max=141.41ms p(90)=99.74µs p(95)=127.75µs p(99.9)=2.24ms 
     http_req_sending...............: avg=33.82µs min=4.89µs  med=10.83µs max=153.86ms p(90)=19.6µs  p(95)=27.68µs  p(99.9)=1.5ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.59ms min=18.06ms med=26.14ms max=307.39ms p(90)=30.37ms p(95)=31.85ms  p(99.9)=47.51ms
     http_reqs......................: 222762  1826.56503/s
     iteration_duration.............: avg=26.93ms min=18.56ms med=26.45ms max=317.29ms p(90)=30.7ms  p(95)=32.2ms   p(99.9)=48.98ms
     iterations.....................: 222662  1825.745067/s
     success_rate...................: 100.00% ✓ 222662      ✗ 0     
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

     checks.........................: 100.00% ✓ 472695      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.6 MB/s
     http_req_blocked...............: avg=4.35µs   min=901ns   med=2.25µs  max=8.86ms   p(90)=4.63µs   p(95)=5.61µs   p(99.9)=40.36µs
     http_req_connecting............: avg=1.49µs   min=0s      med=0s      max=8.76ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.82ms  min=18.07ms med=37.57ms max=316.67ms p(90)=44.5ms   p(95)=46.6ms   p(99.9)=61.38ms
       { expected_response:true }...: avg=37.82ms  min=18.07ms med=37.57ms max=316.67ms p(90)=44.5ms   p(95)=46.6ms   p(99.9)=61.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157665
     http_req_receiving.............: avg=116.83µs min=26.95µs med=54.6µs  max=248.04ms p(90)=121.21µs p(95)=166.09µs p(99.9)=2.52ms 
     http_req_sending...............: avg=30.8µs   min=4.42µs  med=9.2µs   max=58.29ms  p(90)=23.34µs  p(95)=50.41µs  p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.67ms  min=17.92ms med=37.47ms max=175.38ms p(90)=44.38ms  p(95)=46.46ms  p(99.9)=60.28ms
     http_reqs......................: 157665  1292.500521/s
     iteration_duration.............: avg=38.07ms  min=21.48ms med=37.81ms max=353.94ms p(90)=44.72ms  p(95)=46.81ms  p(99.9)=61.65ms
     iterations.....................: 157565  1291.680744/s
     success_rate...................: 100.00% ✓ 157565      ✗ 0     
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

     checks.........................: 100.00% ✓ 449892      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.51µs  min=1.04µs  med=2.51µs  max=3.93ms   p(90)=4.17µs   p(95)=4.86µs   p(99.9)=36.49µs
     http_req_connecting............: avg=663ns   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.77ms min=18.66ms med=39.16ms max=302.9ms  p(90)=47.68ms  p(95)=50.45ms  p(99.9)=64.45ms
       { expected_response:true }...: avg=39.77ms min=18.66ms med=39.16ms max=302.9ms  p(90)=47.68ms  p(95)=50.45ms  p(99.9)=64.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150064
     http_req_receiving.............: avg=77.94µs min=26.02µs med=63.47µs max=147.47ms p(90)=105.31µs p(95)=123.64µs p(99.9)=866.6µs
     http_req_sending...............: avg=25.87µs min=4.72µs  med=11.14µs max=211.57ms p(90)=19.18µs  p(95)=23.19µs  p(99.9)=1.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.66ms min=18.51ms med=39.06ms max=302.18ms p(90)=47.58ms  p(95)=50.34ms  p(99.9)=64.01ms
     http_reqs......................: 150064  1230.072047/s
     iteration_duration.............: avg=40ms    min=23.08ms med=39.37ms max=312.62ms p(90)=47.89ms  p(95)=50.65ms  p(99.9)=64.83ms
     iterations.....................: 149964  1229.252349/s
     success_rate...................: 100.00% ✓ 149964      ✗ 0     
     vus............................: 30      min=0         max=50  
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

     checks.........................: 100.00% ✓ 211104     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   692 kB/s
     http_req_blocked...............: avg=4.9µs    min=1.24µs  med=3.36µs  max=4.01ms   p(90)=5µs      p(95)=5.71µs   p(99.9)=48.9µs  
     http_req_connecting............: avg=1.25µs   min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.93ms  min=19.54ms med=83.17ms max=342.42ms p(90)=103.83ms p(95)=112.72ms p(99.9)=189.8ms 
       { expected_response:true }...: avg=84.93ms  min=19.54ms med=83.17ms max=342.42ms p(90)=103.83ms p(95)=112.72ms p(99.9)=189.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 70468
     http_req_receiving.............: avg=160.19µs min=32µs    med=79.59µs max=233.7ms  p(90)=116.96µs p(95)=131.61µs p(99.9)=1.7ms   
     http_req_sending...............: avg=22.46µs  min=5.94µs  med=16.35µs max=19.91ms  p(90)=23.34µs  p(95)=25.86µs  p(99.9)=649.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.75ms  min=19.38ms med=83.06ms max=205.48ms p(90)=103.72ms p(95)=112.43ms p(99.9)=186.69ms
     http_reqs......................: 70468   576.516945/s
     iteration_duration.............: avg=85.28ms  min=24.15ms med=83.44ms max=353.38ms p(90)=104.09ms p(95)=113.01ms p(99.9)=190.23ms
     iterations.....................: 70368   575.698819/s
     success_rate...................: 100.00% ✓ 70368      ✗ 0    
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

     checks.........................: 100.00% ✓ 144741     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=6.55µs   min=1.34µs  med=3.46µs   max=48.45ms  p(90)=4.99µs   p(95)=5.61µs   p(99.9)=471.28µs
     http_req_connecting............: avg=2.82µs   min=0s      med=0s       max=48.38ms  p(90)=0s       p(95)=0s       p(99.9)=296.76µs
     http_req_duration..............: avg=123.91ms min=20.61ms med=122.05ms max=335.76ms p(90)=154.91ms p(95)=165.18ms p(99.9)=210.4ms 
       { expected_response:true }...: avg=123.91ms min=20.61ms med=122.05ms max=335.76ms p(90)=154.91ms p(95)=165.18ms p(99.9)=210.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48347
     http_req_receiving.............: avg=87.87µs  min=31.37µs med=81.51µs  max=55.6ms   p(90)=114.88µs p(95)=128.02µs p(99.9)=616.39µs
     http_req_sending...............: avg=28.09µs  min=6.25µs  med=16.86µs  max=100.44ms p(90)=22.78µs  p(95)=24.85µs  p(99.9)=563.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.79ms min=20.53ms med=121.94ms max=335.62ms p(90)=154.79ms p(95)=165.05ms p(99.9)=210.08ms
     http_reqs......................: 48347   395.181608/s
     iteration_duration.............: avg=124.39ms min=43.15ms med=122.36ms max=343.59ms p(90)=155.19ms p(95)=165.5ms  p(99.9)=212.73ms
     iterations.....................: 48247   394.364222/s
     success_rate...................: 100.00% ✓ 48247      ✗ 0    
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

     checks.........................: 100.00% ✓ 96243      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=7.42µs   min=1.63µs  med=3.88µs   max=4.23ms   p(90)=5.43µs   p(95)=6.1µs    p(99.9)=1.52ms  
     http_req_connecting............: avg=3.24µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=186.29ms min=17.99ms med=174.11ms max=591.32ms p(90)=224.27ms p(95)=255.65ms p(99.9)=549.25ms
       { expected_response:true }...: avg=186.29ms min=17.99ms med=174.11ms max=591.32ms p(90)=224.27ms p(95)=255.65ms p(99.9)=549.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32181
     http_req_receiving.............: avg=110.1µs  min=39.67µs med=93.93µs  max=106.56ms p(90)=126.59µs p(95)=140.49µs p(99.9)=978.95µs
     http_req_sending...............: avg=27.45µs  min=7.29µs  med=19.61µs  max=42.82ms  p(90)=24.67µs  p(95)=26.64µs  p(99.9)=492.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.15ms min=17.85ms med=173.98ms max=591.19ms p(90)=224.13ms p(95)=255.26ms p(99.9)=549.12ms
     http_reqs......................: 32181   263.456684/s
     iteration_duration.............: avg=187.12ms min=56.79ms med=174.53ms max=591.65ms p(90)=224.64ms p(95)=256.89ms p(99.9)=549.54ms
     iterations.....................: 32081   262.638012/s
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
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95322      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.44µs   min=1.19µs  med=3.14µs   max=4.36ms   p(90)=4.55µs   p(95)=5.1µs    p(99.9)=1.22ms  
     http_req_connecting............: avg=3.04µs   min=0s      med=0s       max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=188.14ms min=23.67ms med=186.82ms max=380.04ms p(90)=198.34ms p(95)=203.96ms p(99.9)=276.03ms
       { expected_response:true }...: avg=188.14ms min=23.67ms med=186.82ms max=380.04ms p(90)=198.34ms p(95)=203.96ms p(99.9)=276.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31874
     http_req_receiving.............: avg=95.7µs   min=31.64µs med=87.76µs  max=112.48ms p(90)=119.33µs p(95)=131.72µs p(99.9)=536.03µs
     http_req_sending...............: avg=30.01µs  min=5.24µs  med=17.04µs  max=115.86ms p(90)=21.9µs   p(95)=23.77µs  p(99.9)=600.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.02ms min=23.53ms med=186.71ms max=365.21ms p(90)=198.22ms p(95)=203.8ms  p(99.9)=274.83ms
     http_reqs......................: 31874   259.876754/s
     iteration_duration.............: avg=188.97ms min=40.83ms med=187.11ms max=396.39ms p(90)=198.62ms p(95)=204.27ms p(99.9)=282.24ms
     iterations.....................: 31774   259.061429/s
     success_rate...................: 100.00% ✓ 31774      ✗ 0    
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

     checks.........................: 100.00% ✓ 7596      ✗ 0   
     data_received..................: 252 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=113.82µs min=1.43µs   med=3.73µs  max=9.2ms   p(90)=5.33µs   p(95)=6.21µs   p(99.9)=8.31ms
     http_req_connecting............: avg=108.35µs min=0s       med=0s      max=9.16ms  p(90)=0s       p(95)=0s       p(99.9)=8.24ms
     http_req_duration..............: avg=2.29s    min=39.8ms   med=2.34s   max=4.18s   p(90)=3.07s    p(95)=3.28s    p(99.9)=4.14s 
       { expected_response:true }...: avg=2.29s    min=39.8ms   med=2.34s   max=4.18s   p(90)=3.07s    p(95)=3.28s    p(99.9)=4.14s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2632
     http_req_receiving.............: avg=117.36µs min=34.23µs  med=95.04µs max=19ms    p(90)=142.02µs p(95)=162.76µs p(99.9)=3.92ms
     http_req_sending...............: avg=60.71µs  min=6.26µs   med=19.77µs max=20.49ms p(90)=25.05µs  p(95)=29.91µs  p(99.9)=5.5ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.29s    min=39.7ms   med=2.34s   max=4.18s   p(90)=3.07s    p(95)=3.28s    p(99.9)=4.14s 
     http_reqs......................: 2632    20.814706/s
     iteration_duration.............: avg=2.38s    min=209.05ms med=2.38s   max=4.18s   p(90)=3.08s    p(95)=3.29s    p(99.9)=4.15s 
     iterations.....................: 2532    20.023873/s
     success_rate...................: 100.00% ✓ 2532      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

