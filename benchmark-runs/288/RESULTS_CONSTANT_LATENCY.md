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
| fusion-nightly-net11 | 16.5.1-p.1 | 1,881 | 1,919 | 1,878 | 0.7% |  |
| hive-router | v0.0.83 | 1,868 | 1,927 | 1,856 | 1.2% |  |
| fusion | 16.5.0 | 1,867 | 1,916 | 1,862 | 1.0% |  |
| fusion-nightly | 16.5.1-p.1 | 1,864 | 1,917 | 1,858 | 1.0% |  |
| fusion-nightly-fed | 16.5.1-p.1 | 1,753 | 1,802 | 1,746 | 1.1% |  |
| grafbase | 0.53.5 | 1,280 | 1,305 | 1,274 | 0.8% |  |
| cosmo | 0.331.1 | 1,218 | 1,260 | 1,213 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.4 | 563 | 582 | 556 | 1.5% |  |
| apollo-router | v2.16.0 | 395 | 414 | 392 | 1.8% |  |
| apollo-gateway | 2.14.2 | 258 | 262 | 257 | 0.6% |  |
| hive-gateway | 2.10.4 | 256 | 263 | 254 | 1.1% |  |
| feddi | 5ff8b6165878 | 18 | 18 | 17 | 2.4% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687753      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.71µs   min=911ns   med=1.99µs  max=2.61ms   p(90)=3.7µs    p(95)=4.46µs  p(99.9)=31.44µs
     http_req_connecting............: avg=283ns    min=0s      med=0s      max=2.59ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.94ms  min=17.32ms med=25.39ms max=275.36ms p(90)=30.11ms  p(95)=31.86ms p(99.9)=50.13ms
       { expected_response:true }...: avg=25.94ms  min=17.32ms med=25.39ms max=275.36ms p(90)=30.11ms  p(95)=31.86ms p(99.9)=50.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229351
     http_req_receiving.............: avg=317.03µs min=50.26µs med=91.76µs max=204.53ms p(90)=832.47µs p(95)=1.36ms  p(99.9)=8.07ms 
     http_req_sending...............: avg=33.12µs  min=4.29µs  med=8.43µs  max=187.65ms p(90)=18.29µs  p(95)=31.74µs p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.59ms  min=17.22ms med=25.06ms max=265.78ms p(90)=29.69ms  p(95)=31.38ms p(99.9)=48.84ms
     http_reqs......................: 229351  1881.156319/s
     iteration_duration.............: avg=26.16ms  min=17.49ms med=25.59ms max=297.56ms p(90)=30.31ms  p(95)=32.06ms p(99.9)=50.67ms
     iterations.....................: 229251  1880.33611/s
     success_rate...................: 100.00% ✓ 229251      ✗ 0     
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

     checks.........................: 100.00% ✓ 683352      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.47µs  min=972ns   med=2.68µs  max=4.13ms   p(90)=4.4µs   p(95)=5.17µs   p(99.9)=37.65µs
     http_req_connecting............: avg=416ns   min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.1ms  min=18.33ms med=25.63ms max=289.89ms p(90)=29.8ms  p(95)=31.27ms  p(99.9)=49.38ms
       { expected_response:true }...: avg=26.1ms  min=18.33ms med=25.63ms max=289.89ms p(90)=29.8ms  p(95)=31.27ms  p(99.9)=49.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227884
     http_req_receiving.............: avg=80.07µs min=26.05µs med=53.53µs max=130.4ms  p(90)=97.97µs p(95)=127.45µs p(99.9)=2.28ms 
     http_req_sending...............: avg=34.27µs min=4.7µs   med=10.61µs max=146.24ms p(90)=18.99µs p(95)=28.33µs  p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=25.99ms min=18.2ms  med=25.53ms max=289.5ms  p(90)=29.68ms p(95)=31.14ms  p(99.9)=48.09ms
     http_reqs......................: 227884  1868.721443/s
     iteration_duration.............: avg=26.33ms min=18.52ms med=25.84ms max=313.63ms p(90)=30.01ms p(95)=31.48ms  p(99.9)=49.74ms
     iterations.....................: 227784  1867.901411/s
     success_rate...................: 100.00% ✓ 227784      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682878      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.14µs   min=1.03µs  med=2.63µs   max=3.22ms   p(90)=4.2µs    p(95)=4.92µs  p(99.9)=35.79µs
     http_req_connecting............: avg=146ns    min=0s      med=0s       max=1.73ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.12ms  min=17.35ms med=25.52ms  max=304.03ms p(90)=30.51ms  p(95)=32.41ms p(99.9)=50.06ms
       { expected_response:true }...: avg=26.12ms  min=17.35ms med=25.52ms  max=304.03ms p(90)=30.51ms  p(95)=32.41ms p(99.9)=50.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227726
     http_req_receiving.............: avg=329.31µs min=52.05µs med=102.22µs max=241.39ms p(90)=821.91µs p(95)=1.31ms  p(99.9)=8.2ms  
     http_req_sending...............: avg=34.64µs  min=4.68µs  med=10.04µs  max=204.27ms p(90)=18.89µs  p(95)=40.76µs p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.76ms  min=17.19ms med=25.17ms  max=275.71ms p(90)=30.1ms   p(95)=31.95ms p(99.9)=48.73ms
     http_reqs......................: 227726  1867.775641/s
     iteration_duration.............: avg=26.35ms  min=17.52ms med=25.73ms  max=319.06ms p(90)=30.72ms  p(95)=32.62ms p(99.9)=50.47ms
     iterations.....................: 227626  1866.955456/s
     success_rate...................: 100.00% ✓ 227626      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681894      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.73µs  min=872ns   med=1.89µs  max=8.95ms   p(90)=3.47µs   p(95)=4.19µs  p(99.9)=27.63µs
     http_req_connecting............: avg=401ns   min=0s      med=0s      max=3.18ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.18ms min=17.51ms med=25.59ms max=291.48ms p(90)=30.6ms   p(95)=32.43ms p(99.9)=48.66ms
       { expected_response:true }...: avg=26.18ms min=17.51ms med=25.59ms max=291.48ms p(90)=30.6ms   p(95)=32.43ms p(99.9)=48.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227398
     http_req_receiving.............: avg=316.5µs min=51.15µs med=96.44µs max=193.11ms p(90)=806.08µs p(95)=1.27ms  p(99.9)=7.65ms 
     http_req_sending...............: avg=31.53µs min=4.4µs   med=8.17µs  max=146.94ms p(90)=17.31µs  p(95)=27.65µs p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.83ms min=17.42ms med=25.26ms max=290.99ms p(90)=30.21ms  p(95)=31.99ms p(99.9)=46.81ms
     http_reqs......................: 227398  1864.923341/s
     iteration_duration.............: avg=26.39ms min=17.66ms med=25.79ms max=307.01ms p(90)=30.8ms   p(95)=32.64ms p(99.9)=49.05ms
     iterations.....................: 227298  1864.103226/s
     success_rate...................: 100.00% ✓ 227298      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 641430      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 257 MB  2.1 MB/s
     http_req_blocked...............: avg=3.01µs   min=912ns   med=2.06µs  max=9.03ms   p(90)=3.86µs  p(95)=4.58µs  p(99.9)=33.34µs
     http_req_connecting............: avg=436ns    min=0s      med=0s      max=3.15ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.83ms  min=17.71ms med=27.28ms max=296.73ms p(90)=32.54ms p(95)=34.35ms p(99.9)=50.65ms
       { expected_response:true }...: avg=27.83ms  min=17.71ms med=27.28ms max=296.73ms p(90)=32.54ms p(95)=34.35ms p(99.9)=50.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 213910
     http_req_receiving.............: avg=318.07µs min=49.28µs med=95.86µs max=49.05ms  p(90)=828.5µs p(95)=1.35ms  p(99.9)=7.95ms 
     http_req_sending...............: avg=31.34µs  min=4.75µs  med=8.93µs  max=200.52ms p(90)=19.6µs  p(95)=30.38µs p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.48ms  min=17.62ms med=26.95ms max=296.23ms p(90)=32.12ms p(95)=33.9ms  p(99.9)=49.4ms 
     http_reqs......................: 213910  1753.364515/s
     iteration_duration.............: avg=28.05ms  min=17.93ms med=27.5ms  max=313.04ms p(90)=32.74ms p(95)=34.56ms p(99.9)=51.25ms
     iterations.....................: 213810  1752.544841/s
     success_rate...................: 100.00% ✓ 213810      ✗ 0     
     vus............................: 23      min=0         max=50  
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

     checks.........................: 100.00% ✓ 468252      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=3.08µs  min=842ns   med=2.12µs  max=2.61ms   p(90)=4.46µs  p(95)=5.41µs   p(99.9)=42.86µs
     http_req_connecting............: avg=383ns   min=0s      med=0s      max=2.57ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.18ms min=18.22ms med=37.95ms max=310.47ms p(90)=44.76ms p(95)=46.86ms  p(99.9)=61.52ms
       { expected_response:true }...: avg=38.18ms min=18.22ms med=37.95ms max=310.47ms p(90)=44.76ms p(95)=46.86ms  p(99.9)=61.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156184
     http_req_receiving.............: avg=83.68µs min=27.29µs med=54.46µs max=156.24ms p(90)=122.7µs p(95)=167.94µs p(99.9)=1.8ms  
     http_req_sending...............: avg=31.94µs min=4.33µs  med=9.15µs  max=115.36ms p(90)=23.65µs p(95)=48.94µs  p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.06ms min=18.11ms med=37.84ms max=310.07ms p(90)=44.64ms p(95)=46.73ms  p(99.9)=60.91ms
     http_reqs......................: 156184  1280.137001/s
     iteration_duration.............: avg=38.43ms min=20.62ms med=38.18ms max=318.25ms p(90)=44.97ms p(95)=47.07ms  p(99.9)=62.25ms
     iterations.....................: 156084  1279.317367/s
     success_rate...................: 100.00% ✓ 156084      ✗ 0     
     vus............................: 42      min=0         max=50  
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

     checks.........................: 100.00% ✓ 445470      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.58µs  min=1.01µs  med=2.35µs  max=42.05ms  p(90)=4.04µs   p(95)=4.75µs   p(99.9)=36.5µs  
     http_req_connecting............: avg=594ns   min=0s      med=0s      max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.17ms min=18.31ms med=39.57ms max=315.15ms p(90)=48.24ms  p(95)=51.02ms  p(99.9)=66.01ms 
       { expected_response:true }...: avg=40.17ms min=18.31ms med=39.57ms max=315.15ms p(90)=48.24ms  p(95)=51.02ms  p(99.9)=66.01ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148590
     http_req_receiving.............: avg=77.73µs min=26.59µs med=63.79µs max=42.23ms  p(90)=104.64µs p(95)=121.48µs p(99.9)=822.09µs
     http_req_sending...............: avg=25.76µs min=4.85µs  med=11.29µs max=152.89ms p(90)=18.88µs  p(95)=22.58µs  p(99.9)=897.85µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.06ms min=18.16ms med=39.47ms max=314.99ms p(90)=48.13ms  p(95)=50.92ms  p(99.9)=65.36ms 
     http_reqs......................: 148590  1218.102899/s
     iteration_duration.............: avg=40.39ms min=23.01ms med=39.78ms max=330.83ms p(90)=48.44ms  p(95)=51.22ms  p(99.9)=66.5ms  
     iterations.....................: 148490  1217.283124/s
     success_rate...................: 100.00% ✓ 148490      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 206271     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   677 kB/s
     http_req_blocked...............: avg=4.46µs  min=1.04µs  med=2.7µs   max=3.97ms   p(90)=4.29µs   p(95)=4.93µs   p(99.9)=50.16µs 
     http_req_connecting............: avg=1.47µs  min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.93ms min=20.44ms med=85.61ms max=343.05ms p(90)=102.78ms p(95)=112.17ms p(99.9)=200.6ms 
       { expected_response:true }...: avg=86.93ms min=20.44ms med=85.61ms max=343.05ms p(90)=102.78ms p(95)=112.17ms p(99.9)=200.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 68857
     http_req_receiving.............: avg=80.54µs min=29.69µs med=72.49µs max=60.46ms  p(90)=109.44µs p(95)=122.65µs p(99.9)=557.93µs
     http_req_sending...............: avg=21.52µs min=5.17µs  med=13.04µs max=124.89ms p(90)=20.12µs  p(95)=22.38µs  p(99.9)=580.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.82ms min=20.35ms med=85.51ms max=342.39ms p(90)=102.67ms p(95)=112.03ms p(99.9)=200.5ms 
     http_reqs......................: 68857   563.337282/s
     iteration_duration.............: avg=87.27ms min=28.62ms med=85.86ms max=354.67ms p(90)=103.03ms p(95)=112.43ms p(99.9)=201.96ms
     iterations.....................: 68757   562.519156/s
     success_rate...................: 100.00% ✓ 68757      ✗ 0    
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

     checks.........................: 100.00% ✓ 144963     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=5.07µs   min=1.07µs  med=3.09µs   max=3.43ms   p(90)=4.55µs   p(95)=5.13µs   p(99.9)=288.62µs
     http_req_connecting............: avg=1.77µs   min=0s      med=0s       max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=127.84µs
     http_req_duration..............: avg=123.72ms min=21.09ms med=121.9ms  max=334.62ms p(90)=154.77ms p(95)=164.77ms p(99.9)=209.09ms
       { expected_response:true }...: avg=123.72ms min=21.09ms med=121.9ms  max=334.62ms p(90)=154.77ms p(95)=164.77ms p(99.9)=209.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48421
     http_req_receiving.............: avg=85.71µs  min=29.39µs med=82.48µs  max=17.19ms  p(90)=113.87µs p(95)=126.06µs p(99.9)=575.47µs
     http_req_sending...............: avg=22.74µs  min=5.07µs  med=16.15µs  max=61.83ms  p(90)=21.64µs  p(95)=23.55µs  p(99.9)=539.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.62ms min=20.96ms med=121.79ms max=333.78ms p(90)=154.67ms p(95)=164.67ms p(99.9)=208.92ms
     http_reqs......................: 48421   395.781671/s
     iteration_duration.............: avg=124.2ms  min=38.64ms med=122.21ms max=350.37ms p(90)=155.05ms p(95)=165.07ms p(99.9)=210.41ms
     iterations.....................: 48321   394.964295/s
     success_rate...................: 100.00% ✓ 48321      ✗ 0    
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

     checks.........................: 100.00% ✓ 94803      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=7.19µs   min=1.39µs  med=3.65µs   max=4.69ms   p(90)=5.13µs   p(95)=5.73µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=3.23µs   min=0s      med=0s       max=4.6ms    p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=189.14ms min=23.65ms med=175.84ms max=364.73ms p(90)=245.19ms p(95)=250.29ms p(99.9)=327.26ms
       { expected_response:true }...: avg=189.14ms min=23.65ms med=175.84ms max=364.73ms p(90)=245.19ms p(95)=250.29ms p(99.9)=327.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31701
     http_req_receiving.............: avg=93.9µs   min=37.11µs med=89.89µs  max=1.35ms   p(90)=121.84µs p(95)=134.42µs p(99.9)=422.59µs
     http_req_sending...............: avg=31.18µs  min=5.98µs  med=18.13µs  max=79.76ms  p(90)=23.24µs  p(95)=25.24µs  p(99.9)=616.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.01ms min=23.5ms  med=175.72ms max=364.56ms p(90)=245.07ms p(95)=250.17ms p(99.9)=327.16ms
     http_reqs......................: 31701   258.409829/s
     iteration_duration.............: avg=189.95ms min=66.37ms med=176.3ms  max=379.23ms p(90)=245.48ms p(95)=250.59ms p(99.9)=327.99ms
     iterations.....................: 31601   257.594682/s
     success_rate...................: 100.00% ✓ 31601      ✗ 0    
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

     checks.........................: 100.00% ✓ 93666      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   308 kB/s
     http_req_blocked...............: avg=7.1µs    min=1.33µs  med=3.79µs   max=4.01ms   p(90)=5.31µs   p(95)=5.95µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=191.48ms min=18.64ms med=175.31ms max=620.33ms p(90)=260.33ms p(95)=311.3ms  p(99.9)=579.18ms
       { expected_response:true }...: avg=191.48ms min=18.64ms med=175.31ms max=620.33ms p(90)=260.33ms p(95)=311.3ms  p(99.9)=579.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31322
     http_req_receiving.............: avg=96.14µs  min=36.52µs med=89.37µs  max=79.9ms   p(90)=120.48µs p(95)=132.93µs p(99.9)=565.95µs
     http_req_sending...............: avg=30.08µs  min=6.74µs  med=18.66µs  max=105.71ms p(90)=23.69µs  p(95)=25.63µs  p(99.9)=646.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.35ms min=18.52ms med=175.2ms  max=620.26ms p(90)=260.18ms p(95)=310.77ms p(99.9)=579.05ms
     http_reqs......................: 31322   256.473829/s
     iteration_duration.............: avg=192.32ms min=44.02ms med=175.81ms max=620.53ms p(90)=260.7ms  p(95)=312.33ms p(99.9)=579.48ms
     iterations.....................: 31222   255.654999/s
     success_rate...................: 100.00% ✓ 31222      ✗ 0    
     vus............................: 44      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6693      ✗ 0   
     data_received..................: 223 MB  1.8 MB/s
     data_sent......................: 2.8 MB  22 kB/s
     http_req_blocked...............: avg=47.37µs  min=1.61µs   med=3.67µs  max=4.2ms   p(90)=5.34µs   p(95)=6.4µs    p(99.9)=3.85ms 
     http_req_connecting............: avg=42.54µs  min=0s       med=0s      max=4.15ms  p(90)=0s       p(95)=0s       p(99.9)=3.82ms 
     http_req_duration..............: avg=2.6s     min=41.08ms  med=2.67s   max=4.48s   p(90)=3.4s     p(95)=3.61s    p(99.9)=4.24s  
       { expected_response:true }...: avg=2.6s     min=41.08ms  med=2.67s   max=4.48s   p(90)=3.4s     p(95)=3.61s    p(99.9)=4.24s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2331
     http_req_receiving.............: avg=115.65µs min=33.66µs  med=94.8µs  max=18.27ms p(90)=139.94µs p(95)=159.38µs p(99.9)=1.09ms 
     http_req_sending...............: avg=65.88µs  min=7.79µs   med=18.99µs max=26.16ms p(90)=25.01µs  p(95)=29.51µs  p(99.9)=16.14ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.6s     min=40.96ms  med=2.67s   max=4.48s   p(90)=3.4s     p(95)=3.61s    p(99.9)=4.24s  
     http_reqs......................: 2331    18.343358/s
     iteration_duration.............: avg=2.71s    min=361.95ms med=2.71s   max=4.48s   p(90)=3.41s    p(95)=3.62s    p(99.9)=4.24s  
     iterations.....................: 2231    17.556427/s
     success_rate...................: 100.00% ✓ 2231      ✗ 0   
     vus............................: 16      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

