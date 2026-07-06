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
| hive-router | v0.0.74 | 1,843 | 1,915 | 1,837 | 1.5% |  |
| fusion | 16.3.0 | 1,836 | 1,875 | 1,830 | 0.8% |  |
| fusion-nightly | 16.4.0-p.14 | 1,830 | 1,879 | 1,820 | 1.1% |  |
| fusion-nightly-net11 | 16.4.0-p.14 | 1,827 | 1,872 | 1,822 | 1.0% |  |
| grafbase | 0.53.5 | 1,326 | 1,357 | 1,320 | 0.9% |  |
| cosmo | 0.326.1 | 1,246 | 1,289 | 1,240 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.0 | 564 | 581 | 553 | 1.4% |  |
| apollo-router | v2.15.1 | 420 | 438 | 414 | 2.0% |  |
| apollo-gateway | 2.14.2 | 260 | 265 | 258 | 0.8% |  |
| hive-gateway | 2.10.0 | 253 | 261 | 251 | 1.2% |  |
| feddi | 77271dc84a06 | 17 | 17 | 16 | 2.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 674268      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 270 MB  2.2 MB/s
     http_req_blocked...............: avg=3.49µs  min=1.07µs  med=2.67µs  max=3.6ms    p(90)=4.37µs  p(95)=5.12µs   p(99.9)=37.6µs 
     http_req_connecting............: avg=438ns   min=0s      med=0s      max=3.56ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.46ms min=18.16ms med=25.99ms max=304.61ms p(90)=30.28ms p(95)=31.76ms  p(99.9)=49.81ms
       { expected_response:true }...: avg=26.46ms min=18.16ms med=25.99ms max=304.61ms p(90)=30.28ms p(95)=31.76ms  p(99.9)=49.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 224856
     http_req_receiving.............: avg=78.88µs min=24.74µs med=52.17µs max=118.67ms p(90)=96.48µs p(95)=124.25µs p(99.9)=2.11ms 
     http_req_sending...............: avg=33.45µs min=4.7µs   med=10.44µs max=144.13ms p(90)=18.97µs p(95)=26.78µs  p(99.9)=1.47ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.35ms min=18.05ms med=25.89ms max=304.31ms p(90)=30.17ms p(95)=31.64ms  p(99.9)=48.3ms 
     http_reqs......................: 224856  1843.812366/s
     iteration_duration.............: avg=26.68ms min=18.32ms med=26.2ms  max=321.38ms p(90)=30.49ms p(95)=31.98ms  p(99.9)=50.12ms
     iterations.....................: 224756  1842.99237/s
     success_rate...................: 100.00% ✓ 224756      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 671622      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.88µs   min=841ns   med=2.06µs   max=4ms      p(90)=3.74µs  p(95)=4.48µs  p(99.9)=29.13µs
     http_req_connecting............: avg=411ns    min=0s      med=0s       max=3.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.58ms  min=17.69ms med=26ms     max=301.63ms p(90)=31.09ms p(95)=32.96ms p(99.9)=49.27ms
       { expected_response:true }...: avg=26.58ms  min=17.69ms med=26ms     max=301.63ms p(90)=31.09ms p(95)=32.96ms p(99.9)=49.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223974
     http_req_receiving.............: avg=340.56µs min=50.24µs med=100.67µs max=195.39ms p(90)=887µs   p(95)=1.37ms  p(99.9)=7.59ms 
     http_req_sending...............: avg=31.27µs  min=4.45µs  med=8.55µs   max=179.08ms p(90)=18.26µs p(95)=29.05µs p(99.9)=1.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.21ms  min=17.17ms med=25.65ms  max=301.32ms p(90)=30.65ms p(95)=32.48ms p(99.9)=47.72ms
     http_reqs......................: 223974  1836.711566/s
     iteration_duration.............: avg=26.79ms  min=17.87ms med=26.2ms   max=315.64ms p(90)=31.29ms p(95)=33.16ms p(99.9)=49.68ms
     iterations.....................: 223874  1835.89151/s
     success_rate...................: 100.00% ✓ 223874      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 669462      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.84µs   min=891ns   med=1.93µs   max=5.7ms    p(90)=3.56µs   p(95)=4.29µs  p(99.9)=29.86µs
     http_req_connecting............: avg=463ns    min=0s      med=0s       max=3.83ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.66ms  min=17.43ms med=26.08ms  max=297.03ms p(90)=31.16ms  p(95)=33.02ms p(99.9)=49.49ms
       { expected_response:true }...: avg=26.66ms  min=17.43ms med=26.08ms  max=297.03ms p(90)=31.16ms  p(95)=33.02ms p(99.9)=49.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223254
     http_req_receiving.............: avg=348.64µs min=50.41µs med=103.23µs max=190.53ms p(90)=885.46µs p(95)=1.36ms  p(99.9)=7.89ms 
     http_req_sending...............: avg=28.92µs  min=4.37µs  med=8.34µs   max=121.4ms  p(90)=18.38µs  p(95)=28.13µs p(99.9)=1.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.29ms  min=17.18ms med=25.73ms  max=296.5ms  p(90)=30.73ms  p(95)=32.54ms p(99.9)=47.76ms
     http_reqs......................: 223254  1830.746804/s
     iteration_duration.............: avg=26.88ms  min=17.72ms med=26.29ms  max=311.08ms p(90)=31.36ms  p(95)=33.22ms p(99.9)=49.83ms
     iterations.....................: 223154  1829.926776/s
     success_rate...................: 100.00% ✓ 223154      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 668088      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.87µs   min=882ns   med=2µs     max=4.71ms   p(90)=3.63µs   p(95)=4.38µs  p(99.9)=30.05µs
     http_req_connecting............: avg=432ns    min=0s      med=0s      max=3.39ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.71ms  min=17.23ms med=26.14ms max=299.84ms p(90)=31.07ms  p(95)=32.92ms p(99.9)=50.98ms
       { expected_response:true }...: avg=26.71ms  min=17.23ms med=26.14ms max=299.84ms p(90)=31.07ms  p(95)=32.92ms p(99.9)=50.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222796
     http_req_receiving.............: avg=341.73µs min=48.18µs med=95.28µs max=92.11ms  p(90)=916.51µs p(95)=1.44ms  p(99.9)=8.39ms 
     http_req_sending...............: avg=30.85µs  min=4.62µs  med=8.47µs  max=212.09ms p(90)=18.61µs  p(95)=29.25µs p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.34ms  min=17.15ms med=25.79ms max=299.11ms p(90)=30.64ms  p(95)=32.42ms p(99.9)=49.47ms
     http_reqs......................: 222796  1827.200616/s
     iteration_duration.............: avg=26.93ms  min=17.41ms med=26.34ms max=320ms    p(90)=31.28ms  p(95)=33.12ms p(99.9)=51.43ms
     iterations.....................: 222696  1826.380493/s
     success_rate...................: 100.00% ✓ 222696      ✗ 0     
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

     checks.........................: 100.00% ✓ 484953      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 194 MB  1.6 MB/s
     http_req_blocked...............: avg=3.26µs  min=812ns   med=2.15µs  max=3.6ms    p(90)=4.48µs   p(95)=5.41µs  p(99.9)=37.72µs
     http_req_connecting............: avg=519ns   min=0s      med=0s      max=3.56ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=36.85ms min=17.84ms med=36.63ms max=320.29ms p(90)=43.4ms   p(95)=45.37ms p(99.9)=61.5ms 
       { expected_response:true }...: avg=36.85ms min=17.84ms med=36.63ms max=320.29ms p(90)=43.4ms   p(95)=45.37ms p(99.9)=61.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 161751
     http_req_receiving.............: avg=82.82µs min=26.82µs med=53.27µs max=109.77ms p(90)=121.18µs p(95)=165.2µs p(99.9)=2.13ms 
     http_req_sending...............: avg=32.13µs min=4.27µs  med=9.03µs  max=128.97ms p(90)=23.43µs  p(95)=48.21µs p(99.9)=2.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=36.74ms min=17.74ms med=36.52ms max=319.75ms p(90)=43.28ms  p(95)=45.23ms p(99.9)=60.04ms
     http_reqs......................: 161751  1326.109185/s
     iteration_duration.............: avg=37.1ms  min=20.09ms med=36.86ms max=327.67ms p(90)=43.61ms  p(95)=45.58ms p(99.9)=62ms   
     iterations.....................: 161651  1325.289339/s
     success_rate...................: 100.00% ✓ 161651      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 456081      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.33µs  min=942ns   med=2.42µs  max=3.9ms    p(90)=4.12µs   p(95)=4.85µs   p(99.9)=37.44µs 
     http_req_connecting............: avg=562ns   min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.22ms min=18.55ms med=38.65ms max=306.14ms p(90)=47.19ms  p(95)=49.77ms  p(99.9)=63.68ms 
       { expected_response:true }...: avg=39.22ms min=18.55ms med=38.65ms max=306.14ms p(90)=47.19ms  p(95)=49.77ms  p(99.9)=63.68ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 152127
     http_req_receiving.............: avg=79.4µs  min=25.23µs med=63.24µs max=160.04ms p(90)=104.84µs p(95)=122.79µs p(99.9)=904.11µs
     http_req_sending...............: avg=28.89µs min=4.79µs  med=11.45µs max=159.74ms p(90)=20.11µs  p(95)=24.2µs   p(99.9)=1.04ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.12ms min=18.43ms med=38.56ms max=289.36ms p(90)=47.08ms  p(95)=49.66ms  p(99.9)=63.21ms 
     http_reqs......................: 152127  1246.953054/s
     iteration_duration.............: avg=39.45ms min=21.77ms med=38.87ms max=320.23ms p(90)=47.4ms   p(95)=49.97ms  p(99.9)=64.12ms 
     iterations.....................: 152027  1246.133375/s
     success_rate...................: 100.00% ✓ 152027      ✗ 0     
     vus............................: 25      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 206589     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   678 kB/s
     http_req_blocked...............: avg=5.27µs  min=1.19µs  med=3.43µs  max=4.3ms    p(90)=5.04µs   p(95)=5.75µs   p(99.9)=49.81µs 
     http_req_connecting............: avg=1.55µs  min=0s      med=0s      max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.78ms min=21.11ms med=84.29ms max=301.83ms p(90)=109.03ms p(95)=118.76ms p(99.9)=206.17ms
       { expected_response:true }...: avg=86.78ms min=21.11ms med=84.29ms max=301.83ms p(90)=109.03ms p(95)=118.76ms p(99.9)=206.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68963
     http_req_receiving.............: avg=86.87µs min=30.71µs med=77.95µs max=112.24ms p(90)=114.47µs p(95)=127.96µs p(99.9)=660.49µs
     http_req_sending...............: avg=24.25µs min=5.6µs   med=15.4µs  max=161.82ms p(90)=22.17µs  p(95)=24.53µs  p(99.9)=601.47µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.66ms min=21ms    med=84.19ms max=301.4ms  p(90)=108.91ms p(95)=118.64ms p(99.9)=205.79ms
     http_reqs......................: 68963   564.214678/s
     iteration_duration.............: avg=87.14ms min=31.98ms med=84.56ms max=327.97ms p(90)=109.31ms p(95)=119.06ms p(99.9)=207.11ms
     iterations.....................: 68863   563.396536/s
     success_rate...................: 100.00% ✓ 68863      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 154059     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   505 kB/s
     http_req_blocked...............: avg=5.83µs   min=1.28µs  med=3.64µs   max=3.85ms   p(90)=5.17µs   p(95)=5.81µs   p(99.9)=148.33µs
     http_req_connecting............: avg=1.94µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.39ms min=20.71ms med=114.54ms max=324.29ms p(90)=145.02ms p(95)=154.38ms p(99.9)=198.04ms
       { expected_response:true }...: avg=116.39ms min=20.71ms med=114.54ms max=324.29ms p(90)=145.02ms p(95)=154.38ms p(99.9)=198.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51453
     http_req_receiving.............: avg=98.85µs  min=32.48µs med=86.94µs  max=219.34ms p(90)=119.47µs p(95)=132.45µs p(99.9)=575.54µs
     http_req_sending...............: avg=35.54µs  min=5.34µs  med=18.29µs  max=210.28ms p(90)=23.98µs  p(95)=26.1µs   p(99.9)=575.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.26ms min=20.56ms med=114.43ms max=306.99ms p(90)=144.9ms  p(95)=154.25ms p(99.9)=196.62ms
     http_reqs......................: 51453   420.620515/s
     iteration_duration.............: avg=116.88ms min=38.19ms med=114.87ms max=351.74ms p(90)=145.32ms p(95)=154.69ms p(99.9)=200.63ms
     iterations.....................: 51353   419.80303/s
     success_rate...................: 100.00% ✓ 51353      ✗ 0    
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

     checks.........................: 100.00% ✓ 95667      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=9.77µs   min=1.39µs  med=3.66µs   max=8.57ms   p(90)=5.15µs   p(95)=5.74µs   p(99.9)=2.13ms  
     http_req_connecting............: avg=5.67µs   min=0s      med=0s       max=8.44ms   p(90)=0s       p(95)=0s       p(99.9)=2.06ms  
     http_req_duration..............: avg=187.46ms min=23.45ms med=181.11ms max=387.53ms p(90)=213.04ms p(95)=218.8ms  p(99.9)=287.77ms
       { expected_response:true }...: avg=187.46ms min=23.45ms med=181.11ms max=387.53ms p(90)=213.04ms p(95)=218.8ms  p(99.9)=287.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31989
     http_req_receiving.............: avg=94.92µs  min=35.92µs med=91.04µs  max=4.82ms   p(90)=123.42µs p(95)=135.43µs p(99.9)=471.74µs
     http_req_sending...............: avg=37.86µs  min=5.72µs  med=18.18µs  max=106.49ms p(90)=23.28µs  p(95)=25.23µs  p(99.9)=1.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.33ms min=23.3ms  med=180.99ms max=386.19ms p(90)=212.92ms p(95)=218.67ms p(99.9)=287.69ms
     http_reqs......................: 31989   260.74408/s
     iteration_duration.............: avg=188.28ms min=61.97ms med=181.41ms max=400.05ms p(90)=213.36ms p(95)=219.13ms p(99.9)=289.31ms
     iterations.....................: 31889   259.928974/s
     success_rate...................: 100.00% ✓ 31889      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92571      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=7.41µs   min=1.49µs  med=3.74µs   max=4.45ms   p(90)=5.22µs   p(95)=5.87µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.36µs   min=0s      med=0s       max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=193.67ms min=18.55ms med=179.37ms max=660.78ms p(90)=243.34ms p(95)=279.2ms  p(99.9)=583.35ms
       { expected_response:true }...: avg=193.67ms min=18.55ms med=179.37ms max=660.78ms p(90)=243.34ms p(95)=279.2ms  p(99.9)=583.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30957
     http_req_receiving.............: avg=98.11µs  min=36.64µs med=90.28µs  max=20.22ms  p(90)=121.7µs  p(95)=134.48µs p(99.9)=879.27µs
     http_req_sending...............: avg=25.67µs  min=6.54µs  med=18.36µs  max=33.19ms  p(90)=23.39µs  p(95)=25.33µs  p(99.9)=680.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.55ms min=18.45ms med=179.27ms max=660.67ms p(90)=243.22ms p(95)=279.11ms p(99.9)=583.24ms
     http_reqs......................: 30957   253.483198/s
     iteration_duration.............: avg=194.53ms min=35.29ms med=179.79ms max=661.06ms p(90)=243.79ms p(95)=280.37ms p(99.9)=583.81ms
     iterations.....................: 30857   252.664374/s
     success_rate...................: 100.00% ✓ 30857      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 6426      ✗ 0   
     data_received..................: 215 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=28.21µs min=1.25µs   med=2.92µs  max=2.66ms   p(90)=4.37µs  p(95)=5.15µs   p(99.9)=2.39ms  
     http_req_connecting............: avg=22.51µs min=0s       med=0s      max=2.63ms   p(90)=0s      p(95)=0s       p(99.9)=2.33ms  
     http_req_duration..............: avg=2.69s   min=45.73ms  med=2.79s   max=12.25s   p(90)=3.52s   p(95)=3.72s    p(99.9)=11.86s  
       { expected_response:true }...: avg=2.69s   min=45.73ms  med=2.79s   max=12.25s   p(90)=3.52s   p(95)=3.72s    p(99.9)=11.86s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2242
     http_req_receiving.............: avg=94.31µs min=34.96µs  med=91.74µs max=824.27µs p(90)=133.7µs p(95)=148.31µs p(99.9)=648.78µs
     http_req_sending...............: avg=47.93µs min=5.78µs   med=17.15µs max=15.26ms  p(90)=22.81µs p(95)=26.66µs  p(99.9)=4.22ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.69s   min=45.41ms  med=2.79s   max=12.25s   p(90)=3.52s   p(95)=3.72s    p(99.9)=11.86s  
     http_reqs......................: 2242    17.628377/s
     iteration_duration.............: avg=2.82s   min=554.45ms med=2.82s   max=12.25s   p(90)=3.53s   p(95)=3.74s    p(99.9)=11.97s  
     iterations.....................: 2142    16.842098/s
     success_rate...................: 100.00% ✓ 2142      ✗ 0   
     vus............................: 27      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

