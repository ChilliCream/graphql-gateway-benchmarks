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
| fusion | 16.5.1 | 1,885 | 1,932 | 1,875 | 1.0% |  |
| hive-router | v0.0.83 | 1,880 | 1,936 | 1,870 | 1.2% |  |
| fusion-nightly | 16.6.0-p.2 | 1,879 | 1,928 | 1,870 | 1.0% |  |
| fusion-nightly-net11 | 16.6.0-p.2 | 1,869 | 1,920 | 1,865 | 1.0% |  |
| fusion-nightly-fed | 16.6.0-p.2 | 1,787 | 1,819 | 1,780 | 0.8% |  |
| grafbase | 0.53.5 | 1,284 | 1,319 | 1,273 | 1.2% |  |
| cosmo | 0.331.1 | 1,223 | 1,269 | 1,217 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 559 | 581 | 553 | 1.7% |  |
| apollo-router | v2.16.0 | 408 | 418 | 395 | 1.7% |  |
| apollo-gateway | 2.14.2 | 260 | 265 | 259 | 0.8% |  |
| hive-gateway | 2.10.4 | 255 | 261 | 253 | 1.0% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689274      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.65µs  min=892ns   med=2.04µs  max=2.14ms   p(90)=3.78µs   p(95)=4.48µs  p(99.9)=29.52µs
     http_req_connecting............: avg=189ns   min=0s      med=0s      max=2.12ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.88ms min=17.31ms med=25.33ms max=299.56ms p(90)=30.12ms  p(95)=31.92ms p(99.9)=49.39ms
       { expected_response:true }...: avg=25.88ms min=17.31ms med=25.33ms max=299.56ms p(90)=30.12ms  p(95)=31.92ms p(99.9)=49.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229858
     http_req_receiving.............: avg=295.7µs min=49.69µs med=92.34µs max=102.04ms p(90)=737.16µs p(95)=1.23ms  p(99.9)=7.96ms 
     http_req_sending...............: avg=31.36µs min=4.58µs  med=8.64µs  max=105.39ms p(90)=19.04µs  p(95)=29.98µs p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.56ms min=16.95ms med=25.01ms max=290.94ms p(90)=29.73ms  p(95)=31.5ms  p(99.9)=47.62ms
     http_reqs......................: 229858  1885.021741/s
     iteration_duration.............: avg=26.1ms  min=17.69ms med=25.53ms max=309.65ms p(90)=30.33ms  p(95)=32.13ms p(99.9)=49.76ms
     iterations.....................: 229758  1884.20166/s
     success_rate...................: 100.00% ✓ 229758      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687723      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.98µs  min=891ns   med=2.19µs  max=3.72ms   p(90)=3.82µs  p(95)=4.52µs   p(99.9)=33.55µs
     http_req_connecting............: avg=423ns   min=0s      med=0s      max=3.68ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.95ms min=17.96ms med=25.53ms max=303.31ms p(90)=29.57ms p(95)=30.95ms  p(99.9)=46.05ms
       { expected_response:true }...: avg=25.95ms min=17.96ms med=25.53ms max=303.31ms p(90)=29.57ms p(95)=30.95ms  p(99.9)=46.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229341
     http_req_receiving.............: avg=75.8µs  min=25.11µs med=49.79µs max=131.81ms p(90)=92.26µs p(95)=118.89µs p(99.9)=1.78ms 
     http_req_sending...............: avg=30.86µs min=4.53µs  med=9.37µs  max=170.29ms p(90)=18.14µs p(95)=25.93µs  p(99.9)=1.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=25.84ms min=17.88ms med=25.44ms max=303.14ms p(90)=29.47ms p(95)=30.82ms  p(99.9)=44.67ms
     http_reqs......................: 229341  1880.879663/s
     iteration_duration.............: avg=26.16ms min=18.1ms  med=25.73ms max=312.1ms  p(90)=29.77ms p(95)=31.15ms  p(99.9)=46.37ms
     iterations.....................: 229241  1880.05954/s
     success_rate...................: 100.00% ✓ 229241      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687162      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=882ns   med=1.98µs  max=3.94ms   p(90)=3.67µs   p(95)=4.44µs  p(99.9)=25.91µs
     http_req_connecting............: avg=433ns    min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.97ms  min=17.62ms med=25.4ms  max=306.2ms  p(90)=30.37ms  p(95)=32.17ms p(99.9)=49.47ms
       { expected_response:true }...: avg=25.97ms  min=17.62ms med=25.4ms  max=306.2ms  p(90)=30.37ms  p(95)=32.17ms p(99.9)=49.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229154
     http_req_receiving.............: avg=300.35µs min=50.08µs med=91.85µs max=36.23ms  p(90)=752.95µs p(95)=1.26ms  p(99.9)=8.01ms 
     http_req_sending...............: avg=34.05µs  min=4.48µs  med=8.35µs  max=122.05ms p(90)=17.77µs  p(95)=31.24µs p(99.9)=1.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.64ms  min=17.46ms med=25.09ms max=305.78ms p(90)=29.97ms  p(95)=31.72ms p(99.9)=47.95ms
     http_reqs......................: 229154  1879.362441/s
     iteration_duration.............: avg=26.18ms  min=17.81ms med=25.6ms  max=315.67ms p(90)=30.57ms  p(95)=32.37ms p(99.9)=49.77ms
     iterations.....................: 229054  1878.54231/s
     success_rate...................: 100.00% ✓ 229054      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683511      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.44µs   min=992ns   med=2.51µs  max=7.92ms   p(90)=4.13µs   p(95)=4.88µs  p(99.9)=33.9µs 
     http_req_connecting............: avg=492ns    min=0s      med=0s      max=4.17ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.1ms   min=17.45ms med=25.52ms max=298.62ms p(90)=30.45ms  p(95)=32.34ms p(99.9)=50.91ms
       { expected_response:true }...: avg=26.1ms   min=17.45ms med=25.52ms max=298.62ms p(90)=30.45ms  p(95)=32.34ms p(99.9)=50.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227937
     http_req_receiving.............: avg=333.85µs min=51.49µs med=96.22µs max=175.08ms p(90)=869.58µs p(95)=1.43ms  p(99.9)=9.68ms 
     http_req_sending...............: avg=32.51µs  min=4.94µs  med=9.58µs  max=120.78ms p(90)=19.14µs  p(95)=54.08µs p(99.9)=1.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.73ms  min=17.28ms med=25.17ms max=298.22ms p(90)=30.01ms  p(95)=31.84ms p(99.9)=48.99ms
     http_reqs......................: 227937  1869.504446/s
     iteration_duration.............: avg=26.32ms  min=17.66ms med=25.73ms max=311.5ms  p(90)=30.65ms  p(95)=32.55ms p(99.9)=51.18ms
     iterations.....................: 227837  1868.684261/s
     success_rate...................: 100.00% ✓ 227837      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 653571      ✗ 0     
     data_received..................: 19 GB   157 MB/s
     data_sent......................: 262 MB  2.1 MB/s
     http_req_blocked...............: avg=3.53µs   min=871ns   med=1.99µs  max=9.29ms   p(90)=3.81µs   p(95)=4.6µs   p(99.9)=30.45µs
     http_req_connecting............: avg=988ns    min=0s      med=0s      max=8.49ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.32ms  min=17.34ms med=26.75ms max=317.59ms p(90)=32ms     p(95)=33.84ms p(99.9)=51.06ms
       { expected_response:true }...: avg=27.32ms  min=17.34ms med=26.75ms max=317.59ms p(90)=32ms     p(95)=33.84ms p(99.9)=51.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 217957
     http_req_receiving.............: avg=316.14µs min=49.01µs med=93.44µs max=222.11ms p(90)=811.67µs p(95)=1.34ms  p(99.9)=8.12ms 
     http_req_sending...............: avg=30.62µs  min=4.5µs   med=8.4µs   max=141.46ms p(90)=18.32µs  p(95)=28.11µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.97ms  min=17.07ms med=26.43ms max=316.82ms p(90)=31.57ms  p(95)=33.4ms  p(99.9)=49.29ms
     http_reqs......................: 217957  1787.016392/s
     iteration_duration.............: avg=27.53ms  min=17.59ms med=26.96ms max=325.91ms p(90)=32.2ms   p(95)=34.04ms p(99.9)=51.4ms 
     iterations.....................: 217857  1786.196498/s
     success_rate...................: 100.00% ✓ 217857      ✗ 0     
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

     checks.........................: 100.00% ✓ 469890      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=4.26µs  min=1.07µs  med=3.12µs  max=3.71ms   p(90)=5.5µs    p(95)=6.53µs   p(99.9)=46.98µs
     http_req_connecting............: avg=640ns   min=0s      med=0s      max=3.67ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.03ms min=18.32ms med=37.73ms max=315.36ms p(90)=44.78ms  p(95)=46.97ms  p(99.9)=62.98ms
       { expected_response:true }...: avg=38.03ms min=18.32ms med=37.73ms max=315.36ms p(90)=44.78ms  p(95)=46.97ms  p(99.9)=62.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156730
     http_req_receiving.............: avg=93.63µs min=28.2µs  med=62.59µs max=99.36ms  p(90)=131.35µs p(95)=181.99µs p(99.9)=2.5ms  
     http_req_sending...............: avg=35.71µs min=4.98µs  med=11.77µs max=124.56ms p(90)=25.55µs  p(95)=68.38µs  p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.9ms  min=18.16ms med=37.6ms  max=314.92ms p(90)=44.65ms  p(95)=46.83ms  p(99.9)=62.24ms
     http_reqs......................: 156730  1284.635925/s
     iteration_duration.............: avg=38.29ms min=21.5ms  med=37.97ms max=332.17ms p(90)=45.01ms  p(95)=47.19ms  p(99.9)=63.46ms
     iterations.....................: 156630  1283.816276/s
     success_rate...................: 100.00% ✓ 156630      ✗ 0     
     vus............................: 35      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 447672      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.94µs  min=1.04µs  med=3.02µs  max=3.72ms   p(90)=4.72µs   p(95)=5.46µs   p(99.9)=39.83µs
     http_req_connecting............: avg=589ns   min=0s      med=0s      max=3.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.95ms min=18.72ms med=39.31ms max=315.49ms p(90)=48ms     p(95)=50.85ms  p(99.9)=66.1ms 
       { expected_response:true }...: avg=39.95ms min=18.72ms med=39.31ms max=315.49ms p(90)=48ms     p(95)=50.85ms  p(99.9)=66.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149324
     http_req_receiving.............: avg=88.37µs min=26.95µs med=69.89µs max=210.05ms p(90)=113.15µs p(95)=132.38µs p(99.9)=1.1ms  
     http_req_sending...............: avg=29.88µs min=5.21µs  med=12.96µs max=146.82ms p(90)=20.81µs  p(95)=25.28µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.83ms min=18.57ms med=39.21ms max=294.83ms p(90)=47.88ms  p(95)=50.73ms  p(99.9)=65.84ms
     http_reqs......................: 149324  1223.996536/s
     iteration_duration.............: avg=40.2ms  min=21.85ms med=39.54ms max=322.25ms p(90)=48.23ms  p(95)=51.08ms  p(99.9)=66.56ms
     iterations.....................: 149224  1223.176844/s
     success_rate...................: 100.00% ✓ 149224      ✗ 0     
     vus............................: 38      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 204912     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   672 kB/s
     http_req_blocked...............: avg=4.32µs  min=972ns   med=2.83µs  max=3.5ms    p(90)=4.33µs   p(95)=4.96µs   p(99.9)=48.25µs 
     http_req_connecting............: avg=1.25µs  min=0s      med=0s      max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.5ms  min=20.44ms med=86.18ms max=314.77ms p(90)=104.48ms p(95)=113.55ms p(99.9)=199.61ms
       { expected_response:true }...: avg=87.5ms  min=20.44ms med=86.18ms max=314.77ms p(90)=104.48ms p(95)=113.55ms p(99.9)=199.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68404
     http_req_receiving.............: avg=86.41µs min=28.95µs med=74.44µs max=161.31ms p(90)=109.95µs p(95)=122.88µs p(99.9)=645.49µs
     http_req_sending...............: avg=21.91µs min=4.97µs  med=13.52µs max=164.55ms p(90)=19.98µs  p(95)=22.1µs   p(99.9)=564.95µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.39ms min=20.34ms med=86.08ms max=314.14ms p(90)=104.36ms p(95)=113.42ms p(99.9)=198.68ms
     http_reqs......................: 68404   559.606338/s
     iteration_duration.............: avg=87.85ms min=36.63ms med=86.42ms max=330.84ms p(90)=104.73ms p(95)=113.84ms p(99.9)=201.03ms
     iterations.....................: 68304   558.788248/s
     success_rate...................: 100.00% ✓ 68304      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 149580     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   490 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.35µs  med=3.68µs   max=3.7ms    p(90)=5.22µs   p(95)=5.84µs   p(99.9)=402.62µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=82.08µs 
     http_req_duration..............: avg=119.89ms min=21.69ms med=117.95ms max=355.63ms p(90)=149.8ms  p(95)=159.98ms p(99.9)=203.38ms
       { expected_response:true }...: avg=119.89ms min=21.69ms med=117.95ms max=355.63ms p(90)=149.8ms  p(95)=159.98ms p(99.9)=203.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49960
     http_req_receiving.............: avg=92.49µs  min=30.21µs med=84.61µs  max=195.75ms p(90)=116.69µs p(95)=129.73µs p(99.9)=586.05µs
     http_req_sending...............: avg=29.16µs  min=4.94µs  med=17.47µs  max=123.35ms p(90)=23.14µs  p(95)=25.26µs  p(99.9)=580.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.77ms min=21.56ms med=117.82ms max=354.97ms p(90)=149.67ms p(95)=159.85ms p(99.9)=202.68ms
     http_reqs......................: 49960   408.252087/s
     iteration_duration.............: avg=120.38ms min=40.32ms med=118.26ms max=365.06ms p(90)=150.12ms p(95)=160.28ms p(99.9)=208.18ms
     iterations.....................: 49860   407.434929/s
     success_rate...................: 100.00% ✓ 49860      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95433      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=7.04µs   min=1.47µs  med=3.62µs   max=3.99ms   p(90)=5.11µs   p(95)=5.73µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=187.84ms min=23.05ms med=187.82ms max=398.9ms  p(90)=199.94ms p(95)=204.19ms p(99.9)=273.67ms
       { expected_response:true }...: avg=187.84ms min=23.05ms med=187.82ms max=398.9ms  p(90)=199.94ms p(95)=204.19ms p(99.9)=273.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31911
     http_req_receiving.............: avg=103.4µs  min=36.71µs med=90.16µs  max=82.55ms  p(90)=122.42µs p(95)=135.15µs p(99.9)=478.37µs
     http_req_sending...............: avg=31.45µs  min=6.76µs  med=18.33µs  max=160.69ms p(90)=23.52µs  p(95)=25.47µs  p(99.9)=520.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.71ms min=22.9ms  med=187.69ms max=394.27ms p(90)=199.82ms p(95)=204.08ms p(99.9)=273.51ms
     http_reqs......................: 31911   260.221263/s
     iteration_duration.............: avg=188.68ms min=49.71ms med=188.24ms max=410.48ms p(90)=200.25ms p(95)=204.52ms p(99.9)=275.92ms
     iterations.....................: 31811   259.405803/s
     success_rate...................: 100.00% ✓ 31811      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93180      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   306 kB/s
     http_req_blocked...............: avg=7.06µs   min=1.3µs   med=3.66µs   max=4.07ms   p(90)=5.11µs   p(95)=5.73µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=192.41ms min=18.58ms med=179.7ms  max=646.78ms p(90)=230.93ms p(95)=267.36ms p(99.9)=579.69ms
       { expected_response:true }...: avg=192.41ms min=18.58ms med=179.7ms  max=646.78ms p(90)=230.93ms p(95)=267.36ms p(99.9)=579.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31160
     http_req_receiving.............: avg=98.08µs  min=34.91µs med=93.13µs  max=16.4ms   p(90)=124.71µs p(95)=137.63µs p(99.9)=723.65µs
     http_req_sending...............: avg=29.85µs  min=6.82µs  med=18.68µs  max=78.34ms  p(90)=23.61µs  p(95)=25.6µs   p(99.9)=545.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.28ms min=18.43ms med=179.57ms max=646.66ms p(90)=230.8ms  p(95)=267.13ms p(99.9)=579.2ms 
     http_reqs......................: 31160   255.153803/s
     iteration_duration.............: avg=193.28ms min=30.61ms med=180.17ms max=647.09ms p(90)=231.28ms p(95)=269.72ms p(99.9)=580ms   
     iterations.....................: 31060   254.334952/s
     success_rate...................: 100.00% ✓ 31060      ✗ 0    
     vus............................: 49      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7032      ✗ 0   
     data_received..................: 234 MB  1.8 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=87.85µs min=1.5µs    med=3.52µs  max=7.55ms  p(90)=5.05µs   p(95)=5.96µs   p(99.9)=7.31ms
     http_req_connecting............: avg=81.72µs min=0s       med=0s      max=7.5ms   p(90)=0s       p(95)=0s       p(99.9)=7.22ms
     http_req_duration..............: avg=2.48s   min=38.92ms  med=2.54s   max=8.9s    p(90)=3.34s    p(95)=3.56s    p(99.9)=7.84s 
       { expected_response:true }...: avg=2.48s   min=38.92ms  med=2.54s   max=8.9s    p(90)=3.34s    p(95)=3.56s    p(99.9)=7.84s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2444
     http_req_receiving.............: avg=97.79µs min=35.45µs  med=91.27µs max=3.16ms  p(90)=133.07µs p(95)=151.76µs p(99.9)=1.16ms
     http_req_sending...............: avg=54.62µs min=6.2µs    med=18.61µs max=12.63ms p(90)=23.89µs  p(95)=28.28µs  p(99.9)=5.68ms
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.48s   min=38.78ms  med=2.54s   max=8.9s    p(90)=3.34s    p(95)=3.56s    p(99.9)=7.84s 
     http_reqs......................: 2444    19.200307/s
     iteration_duration.............: avg=2.58s   min=180.55ms med=2.57s   max=8.91s   p(90)=3.35s    p(95)=3.57s    p(99.9)=7.95s 
     iterations.....................: 2344    18.414697/s
     success_rate...................: 100.00% ✓ 2344      ✗ 0   
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

