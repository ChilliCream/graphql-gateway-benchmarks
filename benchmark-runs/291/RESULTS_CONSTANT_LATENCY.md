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
| fusion | 16.5.0 | 1,868 | 1,924 | 1,855 | 1.2% |  |
| fusion-nightly | 16.5.1-p.2 | 1,864 | 1,914 | 1,858 | 1.0% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 1,858 | 1,908 | 1,847 | 1.2% |  |
| hive-router | v0.0.83 | 1,813 | 1,880 | 1,800 | 1.5% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 1,757 | 1,796 | 1,752 | 0.8% |  |
| grafbase | 0.53.5 | 1,284 | 1,312 | 1,276 | 1.0% |  |
| cosmo | 0.331.1 | 1,221 | 1,263 | 1,217 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 557 | 576 | 555 | 1.2% |  |
| apollo-router | v2.16.0 | 436 | 453 | 435 | 1.4% |  |
| apollo-gateway | 2.14.2 | 265 | 268 | 263 | 0.6% |  |
| hive-gateway | 2.10.4 | 254 | 261 | 254 | 1.1% |  |
| feddi | 5ff8b6165878 | 18 | 18 | 17 | 2.8% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683184      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.36µs   min=992ns   med=2.52µs  max=3.95ms   p(90)=4.01µs   p(95)=4.7µs   p(99.9)=37.02µs
     http_req_connecting............: avg=461ns    min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.11ms  min=17.48ms med=25.51ms max=294.33ms p(90)=30.58ms  p(95)=32.47ms p(99.9)=49.33ms
       { expected_response:true }...: avg=26.11ms  min=17.48ms med=25.51ms max=294.33ms p(90)=30.58ms  p(95)=32.47ms p(99.9)=49.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227828
     http_req_receiving.............: avg=330.58µs min=50.24µs med=97.57µs max=254.94ms p(90)=795.78µs p(95)=1.29ms  p(99.9)=8.19ms 
     http_req_sending...............: avg=34.35µs  min=4.78µs  med=9.65µs  max=202.95ms p(90)=18.29µs  p(95)=31.81µs p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.75ms  min=17.37ms med=25.18ms max=264.12ms p(90)=30.17ms  p(95)=32.02ms p(99.9)=47.39ms
     http_reqs......................: 227828  1868.470038/s
     iteration_duration.............: avg=26.34ms  min=17.73ms med=25.72ms max=320.94ms p(90)=30.79ms  p(95)=32.68ms p(99.9)=49.98ms
     iterations.....................: 227728  1867.649915/s
     success_rate...................: 100.00% ✓ 227728      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681864      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.37µs   min=831ns   med=1.88µs  max=9.11ms   p(90)=3.39µs   p(95)=4.11µs  p(99.9)=28.95µs
     http_req_connecting............: avg=971ns    min=0s      med=0s      max=8.67ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.18ms  min=16.88ms med=25.57ms max=302.24ms p(90)=30.66ms  p(95)=32.52ms p(99.9)=50.11ms
       { expected_response:true }...: avg=26.18ms  min=16.88ms med=25.57ms max=302.24ms p(90)=30.66ms  p(95)=32.52ms p(99.9)=50.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227388
     http_req_receiving.............: avg=329.86µs min=51.4µs  med=95.96µs max=259.5ms  p(90)=841.32µs p(95)=1.34ms  p(99.9)=8.19ms 
     http_req_sending...............: avg=31.64µs  min=4.45µs  med=8.12µs  max=225.78ms p(90)=17.34µs  p(95)=28µs    p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.82ms  min=16.73ms med=25.23ms max=301.57ms p(90)=30.22ms  p(95)=32.06ms p(99.9)=48.23ms
     http_reqs......................: 227388  1864.824386/s
     iteration_duration.............: avg=26.39ms  min=17.06ms med=25.77ms max=311.32ms p(90)=30.85ms  p(95)=32.72ms p(99.9)=50.41ms
     iterations.....................: 227288  1864.004279/s
     success_rate...................: 100.00% ✓ 227288      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 679479      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.47µs   min=1.04µs  med=2.63µs  max=4.06ms   p(90)=4.33µs   p(95)=5.09µs  p(99.9)=37.94µs
     http_req_connecting............: avg=403ns    min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.25ms  min=17.58ms med=25.65ms max=315.84ms p(90)=30.65ms  p(95)=32.56ms p(99.9)=50.71ms
       { expected_response:true }...: avg=26.25ms  min=17.58ms med=25.65ms max=315.84ms p(90)=30.65ms  p(95)=32.56ms p(99.9)=50.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226593
     http_req_receiving.............: avg=335.14µs min=50.47µs med=96.13µs max=183.59ms p(90)=866.24µs p(95)=1.43ms  p(99.9)=10.14ms
     http_req_sending...............: avg=36.24µs  min=4.87µs  med=9.67µs  max=186.05ms p(90)=19.16µs  p(95)=59.04µs p(99.9)=1.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.88ms  min=17.48ms med=25.3ms  max=309.99ms p(90)=30.21ms  p(95)=32.06ms p(99.9)=49.21ms
     http_reqs......................: 226593  1858.295864/s
     iteration_duration.............: avg=26.48ms  min=17.74ms med=25.86ms max=324.24ms p(90)=30.85ms  p(95)=32.78ms p(99.9)=51.08ms
     iterations.....................: 226493  1857.475761/s
     success_rate...................: 100.00% ✓ 226493      ✗ 0     
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

     checks.........................: 100.00% ✓ 663192      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=2.83µs  min=911ns   med=2.03µs  max=5.22ms   p(90)=3.47µs  p(95)=4.13µs   p(99.9)=28.48µs
     http_req_connecting............: avg=437ns   min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.93ms min=18.21ms med=26.52ms max=301.19ms p(90)=30.67ms p(95)=32.07ms  p(99.9)=45.86ms
       { expected_response:true }...: avg=26.93ms min=18.21ms med=26.52ms max=301.19ms p(90)=30.67ms p(95)=32.07ms  p(99.9)=45.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221164
     http_req_receiving.............: avg=70.13µs min=24.27µs med=48.97µs max=163.25ms p(90)=88.49µs p(95)=111.48µs p(99.9)=1.47ms 
     http_req_sending...............: avg=28.72µs min=4.63µs  med=8.94µs  max=180.82ms p(90)=16.37µs p(95)=22.52µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.83ms min=18.11ms med=26.44ms max=300.19ms p(90)=30.57ms p(95)=31.96ms  p(99.9)=44.24ms
     http_reqs......................: 221164  1813.433412/s
     iteration_duration.............: avg=27.13ms min=18.63ms med=26.71ms max=318.55ms p(90)=30.86ms p(95)=32.26ms  p(99.9)=46.26ms
     iterations.....................: 221064  1812.613462/s
     success_rate...................: 100.00% ✓ 221064      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 642726      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 258 MB  2.1 MB/s
     http_req_blocked...............: avg=2.96µs   min=852ns   med=2.1µs   max=3.51ms   p(90)=3.96µs  p(95)=4.71µs  p(99.9)=32.57µs
     http_req_connecting............: avg=405ns    min=0s      med=0s      max=3.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.77ms  min=18.22ms med=27.21ms max=312.48ms p(90)=32.51ms p(95)=34.35ms p(99.9)=51.08ms
       { expected_response:true }...: avg=27.77ms  min=18.22ms med=27.21ms max=312.48ms p(90)=32.51ms p(95)=34.35ms p(99.9)=51.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 214342
     http_req_receiving.............: avg=319.13µs min=49.4µs  med=95µs    max=113.28ms p(90)=827.1µs p(95)=1.35ms  p(99.9)=7.84ms 
     http_req_sending...............: avg=35.2µs   min=4.69µs  med=8.81µs  max=178.6ms  p(90)=19.39µs p(95)=29.09µs p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.42ms  min=17.69ms med=26.88ms max=311.36ms p(90)=32.08ms p(95)=33.87ms p(99.9)=48.71ms
     http_reqs......................: 214342  1757.168117/s
     iteration_duration.............: avg=27.99ms  min=18.39ms med=27.42ms max=328.46ms p(90)=32.71ms p(95)=34.55ms p(99.9)=51.62ms
     iterations.....................: 214242  1756.348321/s
     success_rate...................: 100.00% ✓ 214242      ✗ 0     
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

     checks.........................: 100.00% ✓ 469806      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=3.47µs  min=902ns   med=2.18µs  max=7.32ms   p(90)=4.54µs   p(95)=5.53µs   p(99.9)=40.17µs
     http_req_connecting............: avg=666ns   min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.05ms min=18.24ms med=37.77ms max=316.07ms p(90)=44.72ms  p(95)=46.8ms   p(99.9)=61.7ms 
       { expected_response:true }...: avg=38.05ms min=18.24ms med=37.77ms max=316.07ms p(90)=44.72ms  p(95)=46.8ms   p(99.9)=61.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 156702
     http_req_receiving.............: avg=81.51µs min=26.57µs med=54.53µs max=22.78ms  p(90)=121.06µs p(95)=163.72µs p(99.9)=1.92ms 
     http_req_sending...............: avg=33.52µs min=4.73µs  med=9.24µs  max=128.43ms p(90)=22.98µs  p(95)=38.01µs  p(99.9)=1.66ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.93ms min=18.1ms  med=37.66ms max=315.65ms p(90)=44.6ms   p(95)=46.67ms  p(99.9)=60.68ms
     http_reqs......................: 156702  1284.645896/s
     iteration_duration.............: avg=38.3ms  min=21.66ms med=38ms    max=324.22ms p(90)=44.94ms  p(95)=47.02ms  p(99.9)=62.34ms
     iterations.....................: 156602  1283.826094/s
     success_rate...................: 100.00% ✓ 156602      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 446886      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.89µs  min=1.09µs  med=2.98µs  max=3.6ms    p(90)=4.63µs   p(95)=5.35µs   p(99.9)=36.99µs 
     http_req_connecting............: avg=590ns   min=0s      med=0s      max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.02ms min=18.4ms  med=39.38ms max=316.19ms p(90)=48.06ms  p(95)=50.84ms  p(99.9)=65.28ms 
       { expected_response:true }...: avg=40.02ms min=18.4ms  med=39.38ms max=316.19ms p(90)=48.06ms  p(95)=50.84ms  p(99.9)=65.28ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149062
     http_req_receiving.............: avg=84.24µs min=26.96µs med=68.88µs max=134.37ms p(90)=110.25µs p(95)=128.62µs p(99.9)=988.38µs
     http_req_sending...............: avg=29.17µs min=5.08µs  med=13.09µs max=254.44ms p(90)=20.83µs  p(95)=25.05µs  p(99.9)=1.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.91ms min=18.25ms med=39.28ms max=315.24ms p(90)=47.95ms  p(95)=50.73ms  p(99.9)=64.68ms 
     http_reqs......................: 149062  1221.779816/s
     iteration_duration.............: avg=40.27ms min=22.55ms med=39.61ms max=322.72ms p(90)=48.28ms  p(95)=51.05ms  p(99.9)=65.77ms 
     iterations.....................: 148962  1220.960171/s
     success_rate...................: 100.00% ✓ 148962      ✗ 0     
     vus............................: 30      min=0         max=50  
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

     checks.........................: 100.00% ✓ 204111     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   669 kB/s
     http_req_blocked...............: avg=4.37µs  min=1.05µs  med=2.77µs  max=4.11ms   p(90)=4.27µs   p(95)=4.89µs   p(99.9)=52.2µs  
     http_req_connecting............: avg=1.35µs  min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.85ms min=20.5ms  med=86.36ms max=336.95ms p(90)=105.19ms p(95)=114.66ms p(99.9)=203.89ms
       { expected_response:true }...: avg=87.85ms min=20.5ms  med=86.36ms max=336.95ms p(90)=105.19ms p(95)=114.66ms p(99.9)=203.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68137
     http_req_receiving.............: avg=83.13µs min=28.82µs med=72.9µs  max=147.15ms p(90)=109.62µs p(95)=123.08µs p(99.9)=640.22µs
     http_req_sending...............: avg=21.65µs min=5.01µs  med=13.79µs max=55.32ms  p(90)=20.34µs  p(95)=22.5µs   p(99.9)=569.35µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.74ms min=20.39ms med=86.26ms max=336.84ms p(90)=105.08ms p(95)=114.52ms p(99.9)=203.34ms
     http_reqs......................: 68137   557.368158/s
     iteration_duration.............: avg=88.19ms min=30.32ms med=86.61ms max=346.53ms p(90)=105.43ms p(95)=114.97ms p(99.9)=205.78ms
     iterations.....................: 68037   556.550147/s
     success_rate...................: 100.00% ✓ 68037      ✗ 0    
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

     checks.........................: 100.00% ✓ 159774     ✗ 0    
     data_received..................: 4.7 GB  38 MB/s
     data_sent......................: 64 MB   524 kB/s
     http_req_blocked...............: avg=5.17µs   min=1.02µs  med=3.21µs   max=3.92ms   p(90)=4.81µs   p(95)=5.41µs   p(99.9)=119.77µs
     http_req_connecting............: avg=1.71µs   min=0s      med=0s       max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.24ms min=20.81ms med=110.4ms  max=337.35ms p(90)=139.84ms p(95)=148.81ms p(99.9)=188.67ms
       { expected_response:true }...: avg=112.24ms min=20.81ms med=110.4ms  max=337.35ms p(90)=139.84ms p(95)=148.81ms p(99.9)=188.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53358
     http_req_receiving.............: avg=89.57µs  min=27.54µs med=82.3µs   max=107.95ms p(90)=114.74µs p(95)=127.54µs p(99.9)=595.64µs
     http_req_sending...............: avg=26.52µs  min=4.9µs   med=16.89µs  max=120.03ms p(90)=22.73µs  p(95)=24.7µs   p(99.9)=559.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.13ms min=20.67ms med=110.29ms max=336.82ms p(90)=139.74ms p(95)=148.68ms p(99.9)=187.71ms
     http_reqs......................: 53358   436.167023/s
     iteration_duration.............: avg=112.69ms min=39.43ms med=110.69ms max=364.11ms p(90)=140.11ms p(95)=149.11ms p(99.9)=190.15ms
     iterations.....................: 53258   435.349588/s
     success_rate...................: 100.00% ✓ 53258      ✗ 0    
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

     checks.........................: 100.00% ✓ 97428      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.5µs    min=1.33µs  med=3.68µs   max=3.34ms   p(90)=5.21µs   p(95)=5.84µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=2.53µs   min=0s      med=0s       max=3.29ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=184.02ms min=23.35ms med=184.93ms max=398.51ms p(90)=195.39ms p(95)=199.24ms p(99.9)=262.24ms
       { expected_response:true }...: avg=184.02ms min=23.35ms med=184.93ms max=398.51ms p(90)=195.39ms p(95)=199.24ms p(99.9)=262.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32576
     http_req_receiving.............: avg=98.04µs  min=35µs    med=90.93µs  max=68.86ms  p(90)=123.49µs p(95)=137.27µs p(99.9)=672.46µs
     http_req_sending...............: avg=32.42µs  min=5.61µs  med=18.94µs  max=108.62ms p(90)=23.91µs  p(95)=25.82µs  p(99.9)=500.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.89ms min=23.21ms med=184.82ms max=398.04ms p(90)=195.26ms p(95)=199.11ms p(99.9)=261.78ms
     http_reqs......................: 32576   265.588752/s
     iteration_duration.............: avg=184.84ms min=36.56ms med=185.32ms max=413.27ms p(90)=195.71ms p(95)=199.58ms p(99.9)=273.16ms
     iterations.....................: 32476   264.773462/s
     success_rate...................: 100.00% ✓ 32476      ✗ 0    
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

     checks.........................: 100.00% ✓ 92850      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=6.5µs    min=1.19µs  med=3.15µs   max=3.62ms   p(90)=4.52µs   p(95)=5.03µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=193.11ms min=18.34ms med=180.65ms max=639.53ms p(90)=230.01ms p(95)=263.97ms p(99.9)=580.89ms
       { expected_response:true }...: avg=193.11ms min=18.34ms med=180.65ms max=639.53ms p(90)=230.01ms p(95)=263.97ms p(99.9)=580.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31050
     http_req_receiving.............: avg=138.91µs min=30.93µs med=89.04µs  max=122.1ms  p(90)=119.92µs p(95)=132.7µs  p(99.9)=1.27ms  
     http_req_sending...............: avg=22.39µs  min=5.14µs  med=17.35µs  max=24.87ms  p(90)=21.78µs  p(95)=23.56µs  p(99.9)=610.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.95ms min=18.22ms med=180.53ms max=639.43ms p(90)=229.77ms p(95)=262.45ms p(99.9)=580.79ms
     http_reqs......................: 31050   254.233844/s
     iteration_duration.............: avg=193.95ms min=31.26ms med=181.03ms max=639.77ms p(90)=230.44ms p(95)=265.93ms p(99.9)=581.13ms
     iterations.....................: 30950   253.415056/s
     success_rate...................: 100.00% ✓ 30950      ✗ 0    
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

     checks.........................: 100.00% ✓ 6714      ✗ 0   
     data_received..................: 224 MB  1.8 MB/s
     data_sent......................: 2.8 MB  22 kB/s
     http_req_blocked...............: avg=99.58µs  min=1.51µs   med=3.65µs  max=10.09ms p(90)=5.33µs   p(95)=6.08µs   p(99.9)=9.75ms  
     http_req_connecting............: avg=89.91µs  min=0s       med=0s      max=10.05ms p(90)=0s       p(95)=0s       p(99.9)=9.72ms  
     http_req_duration..............: avg=2.58s    min=41.23ms  med=2.69s   max=4.61s   p(90)=3.29s    p(95)=3.45s    p(99.9)=4.06s   
       { expected_response:true }...: avg=2.58s    min=41.23ms  med=2.69s   max=4.61s   p(90)=3.29s    p(95)=3.45s    p(99.9)=4.06s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2338
     http_req_receiving.............: avg=100.06µs min=41.76µs  med=93.94µs max=3.14ms  p(90)=138.08µs p(95)=158.71µs p(99.9)=435.81µs
     http_req_sending...............: avg=90.63µs  min=6.36µs   med=18.73µs max=24.5ms  p(90)=24.56µs  p(95)=28.05µs  p(99.9)=5.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.58s    min=40.94ms  med=2.68s   max=4.61s   p(90)=3.29s    p(95)=3.45s    p(99.9)=4.06s   
     http_reqs......................: 2338    18.357092/s
     iteration_duration.............: avg=2.7s     min=903.76ms med=2.71s   max=4.61s   p(90)=3.3s     p(95)=3.47s    p(99.9)=4.07s   
     iterations.....................: 2238    17.57193/s
     success_rate...................: 100.00% ✓ 2238      ✗ 0   
     vus............................: 14      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

