## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,965 | 3,230 | 2,919 | 3.5% |  |
| fusion | 16.5.0 | 2,500 | 2,600 | 2,478 | 1.9% |  |
| grafbase | 0.53.5 | 2,233 | 2,354 | 2,220 | 2.1% |  |
| cosmo | 0.331.1 | 1,338 | 1,378 | 1,329 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 635 | 651 | 633 | 1.1% |  |
| apollo-router | v2.16.0 | 490 | 508 | 488 | 1.6% |  |
| apollo-gateway | 2.14.2 | 286 | 286 | 286 | 0.0% |  |
| hive-gateway | 2.10.4 | 273 | 282 | 270 | 1.5% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1098 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,556 | 2,743 | 2,536 | 2.7% |  |
| fusion | 16.5.0 | 2,385 | 2,487 | 2,375 | 1.7% |  |
| grafbase | 0.53.5 | 1,637 | 1,693 | 1,635 | 1.2% |  |
| cosmo | 0.331.1 | 1,247 | 1,287 | 1,242 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.4 | 588 | 605 | 586 | 1.1% |  |
| apollo-router | v2.16.0 | 412 | 434 | 404 | 2.9% |  |
| hive-gateway | 2.10.4 | 264 | 271 | 263 | 1.0% |  |
| apollo-gateway | 2.14.2 | 263 | 268 | 262 | 0.7% |  |
| feddi | 5ff8b6165878 | 19 | 20 | 19 | 1.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1068948     ✗ 0     
     data_received..................: 31 GB   260 MB/s
     data_sent......................: 428 MB  3.6 MB/s
     http_req_blocked...............: avg=2.64µs  min=902ns   med=1.91µs  max=16.47ms  p(90)=3.08µs  p(95)=3.66µs   p(99.9)=29.67µs
     http_req_connecting............: avg=232ns   min=0s      med=0s      max=3.32ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.62ms min=1.45ms  med=15.91ms max=277.64ms p(90)=24.4ms  p(95)=27.61ms  p(99.9)=47.65ms
       { expected_response:true }...: avg=16.62ms min=1.45ms  med=15.91ms max=277.64ms p(90)=24.4ms  p(95)=27.61ms  p(99.9)=47.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 356416
     http_req_receiving.............: avg=88.42µs min=24.87µs med=44.46µs max=242.46ms p(90)=80.31µs p(95)=130.69µs p(99.9)=8.44ms 
     http_req_sending...............: avg=45.6µs  min=4.04µs  med=8.29µs  max=120.54ms p(90)=14.26µs p(95)=83.47µs  p(99.9)=6.87ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.49ms min=1.37ms  med=15.8ms  max=277.13ms p(90)=24.22ms p(95)=27.36ms  p(99.9)=46.33ms
     http_reqs......................: 356416  2965.453481/s
     iteration_duration.............: avg=16.82ms min=1.95ms  med=16.09ms max=289.23ms p(90)=24.6ms  p(95)=27.84ms  p(99.9)=48.32ms
     iterations.....................: 356316  2964.621461/s
     success_rate...................: 100.00% ✓ 356316      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 901848      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=3.42µs  min=861ns   med=1.94µs  max=20.45ms  p(90)=3.2µs   p(95)=3.81µs  p(99.9)=30.73µs 
     http_req_connecting............: avg=796ns   min=0s      med=0s      max=8.61ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.74ms min=2.1ms   med=17.03ms max=303.75ms p(90)=31.86ms p(95)=38.49ms p(99.9)=126.06ms
       { expected_response:true }...: avg=19.74ms min=2.1ms   med=17.03ms max=303.75ms p(90)=31.86ms p(95)=38.49ms p(99.9)=126.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300716
     http_req_receiving.............: avg=569.6µs min=51.49µs med=92.73µs max=122.86ms p(90)=1.1ms   p(95)=1.94ms  p(99.9)=24.35ms 
     http_req_sending...............: avg=41.69µs min=4.69µs  med=8.44µs  max=273.42ms p(90)=15.28µs p(95)=81.09µs p(99.9)=3.19ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.13ms min=1.97ms  med=16.5ms  max=303.65ms p(90)=30.91ms p(95)=37.37ms p(99.9)=124.58ms
     http_reqs......................: 300716  2500.485364/s
     iteration_duration.............: avg=19.94ms min=3.07ms  med=17.23ms max=316.98ms p(90)=32.08ms p(95)=38.71ms p(99.9)=127.17ms
     iterations.....................: 300616  2499.653854/s
     success_rate...................: 100.00% ✓ 300616      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 805098      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 323 MB  2.7 MB/s
     http_req_blocked...............: avg=3.51µs  min=1.04µs  med=2.55µs  max=14.16ms  p(90)=4.08µs  p(95)=4.83µs   p(99.9)=40.96µs
     http_req_connecting............: avg=353ns   min=0s      med=0s      max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.12ms min=1.68ms  med=21.88ms max=292.08ms p(90)=26.47ms p(95)=28.55ms  p(99.9)=49.01ms
       { expected_response:true }...: avg=22.12ms min=1.68ms  med=21.88ms max=292.08ms p(90)=26.47ms p(95)=28.55ms  p(99.9)=49.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 268466
     http_req_receiving.............: avg=94.04µs min=26.86µs med=54.91µs max=108.25ms p(90)=95.75µs p(95)=130.13µs p(99.9)=7.29ms 
     http_req_sending...............: avg=40.66µs min=4.9µs   med=10.51µs max=129.12ms p(90)=17.56µs p(95)=61.02µs  p(99.9)=2.52ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.99ms min=1.59ms  med=21.77ms max=287.73ms p(90)=26.34ms p(95)=28.33ms  p(99.9)=47.97ms
     http_reqs......................: 268466  2233.215049/s
     iteration_duration.............: avg=22.34ms min=3.01ms  med=22.07ms max=300.75ms p(90)=26.68ms p(95)=28.78ms  p(99.9)=49.5ms 
     iterations.....................: 268366  2232.383207/s
     success_rate...................: 100.00% ✓ 268366      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 482805      ✗ 0     
     data_received..................: 14 GB   118 MB/s
     data_sent......................: 194 MB  1.6 MB/s
     http_req_blocked...............: avg=3.38µs  min=1.06µs  med=2.53µs  max=3.52ms   p(90)=4µs     p(95)=4.64µs   p(99.9)=34.8µs  
     http_req_connecting............: avg=552ns   min=0s      med=0s      max=3.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.05ms min=1.96ms  med=36.63ms max=300.51ms p(90)=51.81ms p(95)=56.26ms  p(99.9)=77.93ms 
       { expected_response:true }...: avg=37.05ms min=1.96ms  med=36.63ms max=300.51ms p(90)=51.81ms p(95)=56.26ms  p(99.9)=77.93ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 161035
     http_req_receiving.............: avg=72.18µs min=25.53µs med=58.23µs max=136.74ms p(90)=93.08µs p(95)=107.61µs p(99.9)=841.33µs
     http_req_sending...............: avg=24.67µs min=4.84µs  med=10.85µs max=114.47ms p(90)=16.76µs p(95)=20.67µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=36.95ms min=1.88ms  med=36.53ms max=299.55ms p(90)=51.71ms p(95)=56.16ms  p(99.9)=77.66ms 
     http_reqs......................: 161035  1338.984069/s
     iteration_duration.............: avg=37.27ms min=3.44ms  med=36.83ms max=318.77ms p(90)=52.02ms p(95)=56.46ms  p(99.9)=78.33ms 
     iterations.....................: 160935  1338.152583/s
     success_rate...................: 100.00% ✓ 160935      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 229197     ✗ 0    
     data_received..................: 6.7 GB  56 MB/s
     data_sent......................: 92 MB   763 kB/s
     http_req_blocked...............: avg=4.63µs  min=1.07µs  med=3.11µs  max=3.63ms   p(90)=4.65µs   p(95)=5.34µs   p(99.9)=42.15µs 
     http_req_connecting............: avg=1.26µs  min=0s      med=0s      max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=78.2ms  min=3.54ms  med=76.31ms max=325.55ms p(90)=96.26ms  p(95)=105.51ms p(99.9)=183.43ms
       { expected_response:true }...: avg=78.2ms  min=3.54ms  med=76.31ms max=325.55ms p(90)=96.26ms  p(95)=105.51ms p(99.9)=183.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 76499
     http_req_receiving.............: avg=80.73µs min=29.22µs med=70.56µs max=58.84ms  p(90)=108.35µs p(95)=121.72µs p(99.9)=639.08µs
     http_req_sending...............: avg=23.08µs min=4.92µs  med=13.86µs max=126.45ms p(90)=20.7µs   p(95)=23.15µs  p(99.9)=634.9µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.09ms min=3.44ms  med=76.21ms max=325.17ms p(90)=96.16ms  p(95)=105.4ms  p(99.9)=183.29ms
     http_reqs......................: 76499   635.006375/s
     iteration_duration.............: avg=78.54ms min=25.76ms med=76.56ms max=333.68ms p(90)=96.51ms  p(95)=105.79ms p(99.9)=184.62ms
     iterations.....................: 76399   634.176291/s
     success_rate...................: 100.00% ✓ 76399      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 177300     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   590 kB/s
     http_req_blocked...............: avg=5.17µs   min=1.36µs  med=3.34µs   max=4.03ms   p(90)=4.75µs   p(95)=5.35µs   p(99.9)=63.72µs 
     http_req_connecting............: avg=1.58µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.11ms min=4.61ms  med=100.86ms max=308.49ms p(90)=121.98ms p(95)=128.14ms p(99.9)=158.32ms
       { expected_response:true }...: avg=101.11ms min=4.61ms  med=100.86ms max=308.49ms p(90)=121.98ms p(95)=128.14ms p(99.9)=158.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59200
     http_req_receiving.............: avg=87.9µs   min=31.29µs med=78.21µs  max=107.92ms p(90)=111.45µs p(95)=124.64µs p(99.9)=610.15µs
     http_req_sending...............: avg=22.81µs  min=5.55µs  med=16.11µs  max=57.43ms  p(90)=21.8µs   p(95)=23.85µs  p(99.9)=582.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101ms    min=4.49ms  med=100.75ms max=307.7ms  p(90)=121.87ms p(95)=128.03ms p(99.9)=157.75ms
     http_reqs......................: 59200   490.896754/s
     iteration_duration.............: avg=101.54ms min=15.76ms med=101.13ms max=334.76ms p(90)=122.23ms p(95)=128.39ms p(99.9)=160.34ms
     iterations.....................: 59100   490.067536/s
     success_rate...................: 100.00% ✓ 59100      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103806     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   345 kB/s
     http_req_blocked...............: avg=5.54µs   min=1.07µs  med=2.64µs   max=4.03ms   p(90)=3.89µs   p(95)=4.37µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=2.71µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=172.75ms min=7.29ms  med=172.67ms max=379.74ms p(90)=185.1ms  p(95)=190.27ms p(99.9)=253.63ms
       { expected_response:true }...: avg=172.75ms min=7.29ms  med=172.67ms max=379.74ms p(90)=185.1ms  p(95)=190.27ms p(99.9)=253.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34702
     http_req_receiving.............: avg=80.28µs  min=30.23µs med=73.82µs  max=43.38ms  p(90)=104.48µs p(95)=116.24µs p(99.9)=454.92µs
     http_req_sending...............: avg=18.53µs  min=5.3µs   med=14.01µs  max=27.26ms  p(90)=18.87µs  p(95)=20.47µs  p(99.9)=467.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=172.65ms min=7.19ms  med=172.58ms max=379.63ms p(90)=185.01ms p(95)=190.16ms p(99.9)=253.43ms
     http_reqs......................: 34702   286.983443/s
     iteration_duration.............: avg=173.49ms min=21.21ms med=172.95ms max=388.21ms p(90)=185.35ms p(95)=190.55ms p(99.9)=256.83ms
     iterations.....................: 34602   286.156449/s
     success_rate...................: 100.00% ✓ 34602      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98649      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.05µs med=3.08µs   max=3.53ms   p(90)=4.38µs   p(95)=4.9µs    p(99.9)=1.29ms  
     http_req_connecting............: avg=2.62µs   min=0s     med=0s       max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=181.74ms min=5.51ms med=166.3ms  max=727.19ms p(90)=209.83ms p(95)=252.75ms p(99.9)=636ms   
       { expected_response:true }...: avg=181.74ms min=5.51ms med=166.3ms  max=727.19ms p(90)=209.83ms p(95)=252.75ms p(99.9)=636ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32983
     http_req_receiving.............: avg=93.5µs   min=32.9µs med=86.1µs   max=49.9ms   p(90)=115.51µs p(95)=126.68µs p(99.9)=666.37µs
     http_req_sending...............: avg=24.75µs  min=5.54µs med=16.1µs   max=67.46ms  p(90)=20.38µs  p(95)=22.02µs  p(99.9)=514.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.62ms min=5.4ms  med=166.2ms  max=727.07ms p(90)=209.73ms p(95)=252.58ms p(99.9)=635.9ms 
     http_reqs......................: 32983   273.026062/s
     iteration_duration.............: avg=182.56ms min=28.7ms med=166.64ms max=727.44ms p(90)=210.23ms p(95)=253.66ms p(99.9)=636.24ms
     iterations.....................: 32883   272.198284/s
     success_rate...................: 100.00% ✓ 32883      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 921654      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=3.02µs  min=862ns   med=2.21µs  max=7.99ms   p(90)=3.82µs  p(95)=4.62µs   p(99.9)=35.41µs
     http_req_connecting............: avg=345ns   min=0s      med=0s      max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.31ms min=1.8ms   med=19.02ms max=288.64ms p(90)=26.66ms p(95)=29ms     p(99.9)=48.65ms
       { expected_response:true }...: avg=19.31ms min=1.8ms   med=19.02ms max=288.64ms p(90)=26.66ms p(95)=29ms     p(99.9)=48.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307318
     http_req_receiving.............: avg=86.4µs  min=25.97µs med=50.14µs max=34.82ms  p(90)=90.62µs p(95)=126.16µs p(99.9)=6.52ms 
     http_req_sending...............: avg=40.49µs min=4.51µs  med=9.26µs  max=42.21ms  p(90)=17.08µs p(95)=77.23µs  p(99.9)=2.95ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.18ms min=1.74ms  med=18.91ms max=287.98ms p(90)=26.52ms p(95)=28.82ms  p(99.9)=47.46ms
     http_reqs......................: 307318  2556.291232/s
     iteration_duration.............: avg=19.52ms min=3.21ms  med=19.22ms max=297.62ms p(90)=26.86ms p(95)=29.21ms  p(99.9)=49.06ms
     iterations.....................: 307218  2555.459425/s
     success_rate...................: 100.00% ✓ 307218      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 860022      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=2.91µs   min=901ns   med=2.07µs  max=14.99ms  p(90)=3.65µs  p(95)=4.38µs  p(99.9)=29.02µs 
     http_req_connecting............: avg=320ns    min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.7ms   min=1.61ms  med=17.2ms  max=293.04ms p(90)=34.11ms p(95)=42.02ms p(99.9)=156.15ms
       { expected_response:true }...: avg=20.7ms   min=1.61ms  med=17.2ms  max=293.04ms p(90)=34.11ms p(95)=42.02ms p(99.9)=156.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286774
     http_req_receiving.............: avg=570.89µs min=51.39µs med=94.71µs max=155.94ms p(90)=1.07ms  p(95)=1.86ms  p(99.9)=27.17ms 
     http_req_sending...............: avg=40.8µs   min=4.67µs  med=8.82µs  max=165.23ms p(90)=17.49µs p(95)=63.77µs p(99.9)=2.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.09ms  min=1.49ms  med=16.68ms max=292.96ms p(90)=33.13ms p(95)=40.89ms p(99.9)=154.86ms
     http_reqs......................: 286774  2385.659107/s
     iteration_duration.............: avg=20.92ms  min=2.55ms  med=17.4ms  max=303.31ms p(90)=34.33ms p(95)=42.26ms p(99.9)=157.28ms
     iterations.....................: 286674  2384.827212/s
     success_rate...................: 100.00% ✓ 286674      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 590673      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=4.18µs   min=1.05µs  med=3.01µs  max=12.69ms  p(90)=5.27µs   p(95)=6.35µs   p(99.9)=47.84µs
     http_req_connecting............: avg=435ns    min=0s      med=0s      max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.2ms   min=2.27ms  med=29.64ms max=301.02ms p(90)=40.18ms  p(95)=43.74ms  p(99.9)=68.1ms 
       { expected_response:true }...: avg=30.2ms   min=2.27ms  med=29.64ms max=301.02ms p(90)=40.18ms  p(95)=43.74ms  p(99.9)=68.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 196991
     http_req_receiving.............: avg=106.08µs min=26.76µs med=59.69µs max=201.98ms p(90)=134.02µs p(95)=230.55µs p(99.9)=5.08ms 
     http_req_sending...............: avg=44.53µs  min=4.66µs  med=11.16µs max=155.51ms p(90)=25.93µs  p(95)=122.27µs p(99.9)=2.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.05ms  min=2.17ms  med=29.52ms max=300.38ms p(90)=40.01ms  p(95)=43.53ms  p(99.9)=67.3ms 
     http_reqs......................: 196991  1637.690488/s
     iteration_duration.............: avg=30.46ms  min=5.93ms  med=29.88ms max=311.75ms p(90)=40.42ms  p(95)=43.97ms  p(99.9)=68.63ms
     iterations.....................: 196891  1636.859135/s
     success_rate...................: 100.00% ✓ 196891      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 450066      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.89µs  min=1.17µs  med=2.99µs  max=3.22ms   p(90)=4.56µs   p(95)=5.27µs   p(99.9)=39.1µs  
     http_req_connecting............: avg=563ns   min=0s      med=0s      max=3.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.73ms min=2.13ms  med=39.34ms max=298.89ms p(90)=55.09ms  p(95)=59.86ms  p(99.9)=82.1ms  
       { expected_response:true }...: avg=39.73ms min=2.13ms  med=39.34ms max=298.89ms p(90)=55.09ms  p(95)=59.86ms  p(99.9)=82.1ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 150122
     http_req_receiving.............: avg=83.94µs min=27.43µs med=66.89µs max=172.48ms p(90)=106.17µs p(95)=122.62µs p(99.9)=985.76µs
     http_req_sending...............: avg=28.09µs min=5.08µs  med=13.07µs max=97.03ms  p(90)=20.33µs  p(95)=24.21µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.62ms min=2.03ms  med=39.24ms max=298.18ms p(90)=54.98ms  p(95)=59.74ms  p(99.9)=81.69ms 
     http_reqs......................: 150122  1247.943337/s
     iteration_duration.............: avg=39.98ms min=3.9ms   med=39.57ms max=309.84ms p(90)=55.31ms  p(95)=60.08ms  p(99.9)=82.4ms  
     iterations.....................: 150022  1247.112051/s
     success_rate...................: 100.00% ✓ 150022      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 212409     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 85 MB   707 kB/s
     http_req_blocked...............: avg=4.36µs  min=1.08µs  med=2.79µs  max=3.98ms   p(90)=4.28µs   p(95)=4.87µs   p(99.9)=44.33µs 
     http_req_connecting............: avg=1.34µs  min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.4ms  min=3.84ms  med=82.78ms max=314.19ms p(90)=103.47ms p(95)=113.26ms p(99.9)=193.77ms
       { expected_response:true }...: avg=84.4ms  min=3.84ms  med=82.78ms max=314.19ms p(90)=103.47ms p(95)=113.26ms p(99.9)=193.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70903
     http_req_receiving.............: avg=82.81µs min=27.32µs med=72.22µs max=184.89ms p(90)=108.85µs p(95)=122.22µs p(99.9)=638.88µs
     http_req_sending...............: avg=22.4µs  min=4.67µs  med=13.6µs  max=110.38ms p(90)=20.4µs   p(95)=22.58µs  p(99.9)=568.47µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.29ms min=3.74ms  med=82.68ms max=313.52ms p(90)=103.36ms p(95)=113.15ms p(99.9)=193.52ms
     http_reqs......................: 70903   588.314837/s
     iteration_duration.............: avg=84.75ms min=18.25ms med=83.01ms max=330.75ms p(90)=103.72ms p(95)=113.53ms p(99.9)=194.91ms
     iterations.....................: 70803   587.485091/s
     success_rate...................: 100.00% ✓ 70803      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 148983     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   495 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.32µs  med=3.46µs   max=3.59ms   p(90)=4.86µs   p(95)=5.46µs   p(99.9)=409.04µs
     http_req_connecting............: avg=1.91µs   min=0s      med=0s       max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=184.12µs
     http_req_duration..............: avg=120.33ms min=5.01ms  med=118.1ms  max=324.13ms p(90)=159.08ms p(95)=171.39ms p(99.9)=219.24ms
       { expected_response:true }...: avg=120.33ms min=5.01ms  med=118.1ms  max=324.13ms p(90)=159.08ms p(95)=171.39ms p(99.9)=219.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49761
     http_req_receiving.............: avg=88.61µs  min=30.23µs med=80.68µs  max=88.75ms  p(90)=111.99µs p(95)=124.41µs p(99.9)=534.77µs
     http_req_sending...............: avg=23.38µs  min=6.24µs  med=16.72µs  max=108.69ms p(90)=22.2µs   p(95)=24.01µs  p(99.9)=497.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.22ms min=4.88ms  med=117.99ms max=323.84ms p(90)=158.97ms p(95)=171.27ms p(99.9)=218.89ms
     http_reqs......................: 49761   412.437411/s
     iteration_duration.............: avg=120.84ms min=31.47ms med=118.42ms max=331.81ms p(90)=159.38ms p(95)=171.73ms p(99.9)=223.05ms
     iterations.....................: 49661   411.608574/s
     success_rate...................: 100.00% ✓ 49661      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 95538      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=7.02µs   min=1.28µs  med=3.66µs   max=3.82ms   p(90)=5.02µs   p(95)=5.6µs    p(99.9)=1.68ms  
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=3.78ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=187.64ms min=6.01ms  med=172.5ms  max=638.81ms p(90)=220.98ms p(95)=268.01ms p(99.9)=560.44ms
       { expected_response:true }...: avg=187.64ms min=6.01ms  med=172.5ms  max=638.81ms p(90)=220.98ms p(95)=268.01ms p(99.9)=560.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31946
     http_req_receiving.............: avg=98.96µs  min=36.81µs med=89.42µs  max=86.42ms  p(90)=119.51µs p(95)=131.58µs p(99.9)=629.41µs
     http_req_sending...............: avg=29.91µs  min=6.38µs  med=18.17µs  max=95.93ms  p(90)=22.8µs   p(95)=24.57µs  p(99.9)=452.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.52ms min=5.87ms  med=172.39ms max=638.7ms  p(90)=220.85ms p(95)=267.9ms  p(99.9)=560.34ms
     http_reqs......................: 31946   264.113925/s
     iteration_duration.............: avg=188.49ms min=41.23ms med=172.86ms max=639.07ms p(90)=221.3ms  p(95)=269.28ms p(99.9)=560.65ms
     iterations.....................: 31846   263.287174/s
     success_rate...................: 100.00% ✓ 31846      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 95331      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.72µs   min=1.33µs  med=3.62µs   max=4.05ms   p(90)=4.94µs   p(95)=5.51µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=2.84µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=188.04ms min=7.94ms  med=188.43ms max=403.73ms p(90)=199.88ms p(95)=205.22ms p(99.9)=276.51ms
       { expected_response:true }...: avg=188.04ms min=7.94ms  med=188.43ms max=403.73ms p(90)=199.88ms p(95)=205.22ms p(99.9)=276.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31877
     http_req_receiving.............: avg=101.49µs min=35.25µs med=88.58µs  max=203.14ms p(90)=119.12µs p(95)=130.4µs  p(99.9)=617.92µs
     http_req_sending...............: avg=28.03µs  min=5.88µs  med=17.43µs  max=73.92ms  p(90)=22.2µs   p(95)=24µs     p(99.9)=585.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.92ms min=7.79ms  med=188.32ms max=403.61ms p(90)=199.76ms p(95)=205.07ms p(99.9)=275.81ms
     http_reqs......................: 31877   263.46502/s
     iteration_duration.............: avg=188.91ms min=55.07ms med=188.89ms max=423.96ms p(90)=200.18ms p(95)=205.52ms p(99.9)=281.08ms
     iterations.....................: 31777   262.638515/s
     success_rate...................: 100.00% ✓ 31777      ✗ 0    
     vus............................: 3       min=3        max=50 
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

     checks.........................: 100.00% ✓ 7173      ✗ 0   
     data_received..................: 238 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=45.09µs  min=1.45µs   med=3.61µs  max=4.01ms p(90)=5.07µs   p(95)=6µs      p(99.9)=3.72ms  
     http_req_connecting............: avg=40.74µs  min=0s       med=0s      max=3.97ms p(90)=0s       p(95)=0s       p(99.9)=3.7ms   
     http_req_duration..............: avg=2.42s    min=30.12ms  med=2.51s   max=4.3s   p(90)=3.28s    p(95)=3.43s    p(99.9)=4.14s   
       { expected_response:true }...: avg=2.42s    min=30.12ms  med=2.51s   max=4.3s   p(90)=3.28s    p(95)=3.43s    p(99.9)=4.14s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2491
     http_req_receiving.............: avg=100.62µs min=32.51µs  med=92.57µs max=9.39ms p(90)=134.25µs p(95)=154.17µs p(99.9)=381.37µs
     http_req_sending...............: avg=27.38µs  min=6.38µs   med=18.95µs max=1.68ms p(90)=23.67µs  p(95)=27.02µs  p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.42s    min=30ms     med=2.51s   max=4.3s   p(90)=3.28s    p(95)=3.43s    p(99.9)=4.14s   
     http_reqs......................: 2491    19.788468/s
     iteration_duration.............: avg=2.52s    min=382.59ms med=2.55s   max=4.3s   p(90)=3.29s    p(95)=3.44s    p(99.9)=4.14s   
     iterations.....................: 2391    18.994069/s
     success_rate...................: 100.00% ✓ 2391      ✗ 0   
     vus............................: 40      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

