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
| hive-router | v0.0.84 | 2,945 | 3,217 | 2,889 | 3.8% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,783 | 2,899 | 2,774 | 1.6% |  |
| fusion-nightly | 16.7.0-p.1 | 2,642 | 2,779 | 2,619 | 2.1% |  |
| fusion | 16.6.2 | 2,640 | 2,785 | 2,616 | 2.2% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,465 | 2,552 | 2,454 | 1.4% |  |
| grafbase | 0.53.5 | 2,054 | 2,176 | 2,046 | 2.2% |  |
| cosmo | 0.334.0 | 1,289 | 1,334 | 1,275 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 623 | 642 | 621 | 1.2% |  |
| apollo-router | v2.16.1 | 487 | 504 | 486 | 1.3% |  |
| apollo-gateway | 2.14.3 | 284 | 289 | 283 | 0.7% |  |
| hive-gateway | 2.10.8 | 278 | 286 | 274 | 1.4% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1312 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,573 | 2,755 | 2,534 | 2.7% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,544 | 2,676 | 2,530 | 2.0% |  |
| fusion-nightly | 16.7.0-p.1 | 2,403 | 2,514 | 2,371 | 2.2% |  |
| fusion | 16.6.2 | 2,382 | 2,504 | 2,369 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,232 | 2,331 | 2,224 | 1.7% |  |
| grafbase | 0.53.5 | 1,649 | 1,703 | 1,645 | 1.2% |  |
| cosmo | 0.334.0 | 1,191 | 1,231 | 1,183 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 598 | 575 | 1.5% |  |
| apollo-router | v2.16.1 | 409 | 430 | 405 | 2.3% |  |
| apollo-gateway | 2.14.3 | 266 | 272 | 264 | 0.9% |  |
| hive-gateway | 2.10.8 | 262 | 269 | 261 | 1.0% |  |
| feddi | 5ff8b6165878 | 18 | 19 | 17 | 3.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1061739     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 425 MB  3.5 MB/s
     http_req_blocked...............: avg=2.46µs  min=851ns   med=1.89µs  max=3.33ms   p(90)=3.11µs  p(95)=3.71µs   p(99.9)=30.16µs
     http_req_connecting............: avg=239ns   min=0s      med=0s      max=3.29ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.74ms min=1.45ms  med=16.07ms max=294.47ms p(90)=24.56ms p(95)=27.64ms  p(99.9)=47.34ms
       { expected_response:true }...: avg=16.74ms min=1.45ms  med=16.07ms max=294.47ms p(90)=24.56ms p(95)=27.64ms  p(99.9)=47.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 354013
     http_req_receiving.............: avg=85.9µs  min=25.72µs med=46.58µs max=161.88ms p(90)=81.62µs p(95)=129.31µs p(99.9)=6.8ms  
     http_req_sending...............: avg=43.61µs min=4.56µs  med=8.07µs  max=148.82ms p(90)=13.93µs p(95)=84.52µs  p(99.9)=4.89ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.61ms min=1.35ms  med=15.96ms max=293.94ms p(90)=24.39ms p(95)=27.42ms  p(99.9)=46.11ms
     http_reqs......................: 354013  2945.688522/s
     iteration_duration.............: avg=16.94ms min=2.18ms  med=16.25ms max=306.4ms  p(90)=24.75ms p(95)=27.87ms  p(99.9)=48.08ms
     iterations.....................: 353913  2944.856437/s
     success_rate...................: 100.00% ✓ 353913      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1003833     ✗ 0     
     data_received..................: 29 GB   244 MB/s
     data_sent......................: 402 MB  3.3 MB/s
     http_req_blocked...............: avg=2.9µs    min=1µs     med=2.28µs  max=18.44ms  p(90)=3.54µs  p(95)=4.12µs  p(99.9)=32.56µs
     http_req_connecting............: avg=109ns    min=0s      med=0s      max=2.85ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.71ms  min=1.93ms  med=16.79ms max=275.01ms p(90)=25.66ms p(95)=29.31ms p(99.9)=49.83ms
       { expected_response:true }...: avg=17.71ms  min=1.93ms  med=16.79ms max=275.01ms p(90)=25.66ms p(95)=29.31ms p(99.9)=49.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 334711
     http_req_receiving.............: avg=452.41µs min=50.25µs med=89.22µs max=157.07ms p(90)=1.11ms  p(95)=1.76ms  p(99.9)=17.76ms
     http_req_sending...............: avg=47.09µs  min=4.65µs  med=8.49µs  max=161.27ms p(90)=14.72µs p(95)=91.55µs p(99.9)=5.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.21ms  min=1.81ms  med=16.3ms  max=274.47ms p(90)=25.06ms p(95)=28.62ms p(99.9)=48.6ms 
     http_reqs......................: 334711  2783.599154/s
     iteration_duration.............: avg=17.92ms  min=2.74ms  med=16.99ms max=293.74ms p(90)=25.87ms p(95)=29.54ms p(99.9)=50.36ms
     iterations.....................: 334611  2782.767512/s
     success_rate...................: 100.00% ✓ 334611      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 953208      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 382 MB  3.2 MB/s
     http_req_blocked...............: avg=2.67µs   min=832ns   med=1.84µs  max=20.78ms  p(90)=3.05µs  p(95)=3.62µs  p(99.9)=31.06µs 
     http_req_connecting............: avg=287ns    min=0s      med=0s      max=3.92ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.67ms  min=2.03ms  med=16.15ms max=313.41ms p(90)=30.22ms p(95)=36.48ms p(99.9)=109.07ms
       { expected_response:true }...: avg=18.67ms  min=2.03ms  med=16.15ms max=313.41ms p(90)=30.22ms p(95)=36.48ms p(99.9)=109.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317836
     http_req_receiving.............: avg=530.95µs min=49.92µs med=86.65µs max=222.9ms  p(90)=1.02ms  p(95)=1.84ms  p(99.9)=24.12ms 
     http_req_sending...............: avg=43.93µs  min=4.46µs  med=8.03µs  max=164.33ms p(90)=14.39µs p(95)=80.44µs p(99.9)=4.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.09ms  min=1.91ms  med=15.65ms max=313.32ms p(90)=29.33ms p(95)=35.43ms p(99.9)=107.73ms
     http_reqs......................: 317836  2642.818414/s
     iteration_duration.............: avg=18.87ms  min=3.06ms  med=16.35ms max=313.58ms p(90)=30.44ms p(95)=36.72ms p(99.9)=110.28ms
     iterations.....................: 317736  2641.98691/s
     success_rate...................: 100.00% ✓ 317736      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 952479      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 382 MB  3.2 MB/s
     http_req_blocked...............: avg=2.57µs   min=821ns   med=1.92µs  max=10.51ms  p(90)=3.07µs  p(95)=3.64µs  p(99.9)=27µs    
     http_req_connecting............: avg=261ns    min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.68ms  min=1.97ms  med=16.13ms max=278.69ms p(90)=30.27ms p(95)=36.48ms p(99.9)=115.65ms
       { expected_response:true }...: avg=18.68ms  min=1.97ms  med=16.13ms max=278.69ms p(90)=30.27ms p(95)=36.48ms p(99.9)=115.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317593
     http_req_receiving.............: avg=551.51µs min=51.93µs med=88.32µs max=158.82ms p(90)=1.06ms  p(95)=1.94ms  p(99.9)=24.19ms 
     http_req_sending...............: avg=43.27µs  min=4.55µs  med=8.04µs  max=77.13ms  p(90)=13.85µs p(95)=78.33µs p(99.9)=5.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.08ms  min=1.89ms  med=15.6ms  max=278.14ms p(90)=29.34ms p(95)=35.46ms p(99.9)=114.3ms 
     http_reqs......................: 317593  2640.706506/s
     iteration_duration.............: avg=18.89ms  min=3.01ms  med=16.32ms max=300.2ms  p(90)=30.49ms p(95)=36.73ms p(99.9)=116.35ms
     iterations.....................: 317493  2639.875031/s
     success_rate...................: 100.00% ✓ 317493      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 888933      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=2.8µs    min=841ns   med=1.91µs  max=17.69ms  p(90)=3.26µs  p(95)=3.91µs  p(99.9)=30.04µs 
     http_req_connecting............: avg=276ns    min=0s      med=0s      max=3.31ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.03ms  min=1.63ms  med=16.16ms max=514.37ms p(90)=33.7ms  p(95)=42.86ms p(99.9)=170.36ms
       { expected_response:true }...: avg=20.03ms  min=1.63ms  med=16.16ms max=514.37ms p(90)=33.7ms  p(95)=42.86ms p(99.9)=170.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296411
     http_req_receiving.............: avg=587.13µs min=50.85µs med=91.09µs max=336.56ms p(90)=1.05ms  p(95)=1.86ms  p(99.9)=29.55ms 
     http_req_sending...............: avg=39.57µs  min=4.52µs  med=8.29µs  max=91.44ms  p(90)=15.61µs p(95)=62.93µs p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.4ms   min=1.54ms  med=15.64ms max=513.45ms p(90)=32.69ms p(95)=41.6ms  p(99.9)=168.56ms
     http_reqs......................: 296411  2465.383933/s
     iteration_duration.............: avg=20.24ms  min=2.65ms  med=16.36ms max=514.57ms p(90)=33.92ms p(95)=43.09ms p(99.9)=172.41ms
     iterations.....................: 296311  2464.552188/s
     success_rate...................: 100.00% ✓ 296311      ✗ 0     
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

     checks.........................: 100.00% ✓ 740832      ✗ 0     
     data_received..................: 22 GB   181 MB/s
     data_sent......................: 297 MB  2.5 MB/s
     http_req_blocked...............: avg=3.65µs  min=1µs     med=2.7µs   max=12.3ms   p(90)=4.27µs  p(95)=5.03µs   p(99.9)=39.64µs
     http_req_connecting............: avg=376ns   min=0s      med=0s      max=4ms      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.06ms min=1.79ms  med=23.82ms max=279.84ms p(90)=28.52ms p(95)=30.31ms  p(99.9)=49.48ms
       { expected_response:true }...: avg=24.06ms min=1.79ms  med=23.82ms max=279.84ms p(90)=28.52ms p(95)=30.31ms  p(99.9)=49.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 247044
     http_req_receiving.............: avg=89.1µs  min=28.66µs med=56.98µs max=37.41ms  p(90)=95.06µs p(95)=121.21µs p(99.9)=5.5ms  
     http_req_sending...............: avg=37.33µs min=5.19µs  med=10.9µs  max=137.26ms p(90)=17.74µs p(95)=27.23µs  p(99.9)=1.93ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.94ms min=1.67ms  med=23.72ms max=279.36ms p(90)=28.39ms p(95)=30.14ms  p(99.9)=48.75ms
     http_reqs......................: 247044  2054.779528/s
     iteration_duration.............: avg=24.28ms min=4.18ms  med=24.02ms max=303.63ms p(90)=28.73ms p(95)=30.53ms  p(99.9)=49.94ms
     iterations.....................: 246944  2053.947781/s
     success_rate...................: 100.00% ✓ 246944      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 465111      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=2.88µs  min=922ns   med=2µs     max=4.01ms   p(90)=3.3µs   p(95)=3.91µs   p(99.9)=26.78µs 
     http_req_connecting............: avg=576ns   min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.47ms min=1.94ms  med=38.07ms max=288.53ms p(90)=53.76ms p(95)=58.5ms   p(99.9)=81.22ms 
       { expected_response:true }...: avg=38.47ms min=1.94ms  med=38.07ms max=288.53ms p(90)=53.76ms p(95)=58.5ms   p(99.9)=81.22ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 155137
     http_req_receiving.............: avg=68.97µs min=27.42µs med=58.49µs max=16.97ms  p(90)=92.21µs p(95)=106.85µs p(99.9)=784.65µs
     http_req_sending...............: avg=21.32µs min=4.85µs  med=9.44µs  max=113.57ms p(90)=15.07µs p(95)=18.64µs  p(99.9)=867.34µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.38ms min=1.85ms  med=37.98ms max=287.91ms p(90)=53.66ms p(95)=58.41ms  p(99.9)=80.84ms 
     http_reqs......................: 155137  1289.955605/s
     iteration_duration.............: avg=38.69ms min=3.34ms  med=38.27ms max=307.04ms p(90)=53.94ms p(95)=58.7ms   p(99.9)=81.56ms 
     iterations.....................: 155037  1289.12411/s
     success_rate...................: 100.00% ✓ 155037      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 225171     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   749 kB/s
     http_req_blocked...............: avg=4.46µs  min=1.1µs   med=2.93µs  max=3.89ms   p(90)=4.45µs   p(95)=5.13µs   p(99.9)=46.52µs 
     http_req_connecting............: avg=1.21µs  min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.6ms  min=3.45ms  med=77.75ms max=312.2ms  p(90)=99.06ms  p(95)=109.64ms p(99.9)=186.59ms
       { expected_response:true }...: avg=79.6ms  min=3.45ms  med=77.75ms max=312.2ms  p(90)=99.06ms  p(95)=109.64ms p(99.9)=186.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75157
     http_req_receiving.............: avg=79.86µs min=28.02µs med=69.34µs max=83.14ms  p(90)=105.89µs p(95)=119.18µs p(99.9)=663.91µs
     http_req_sending...............: avg=22.09µs min=5.15µs  med=13.42µs max=73.98ms  p(90)=20.09µs  p(95)=22.41µs  p(99.9)=609.3µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.5ms  min=3.38ms  med=77.65ms max=311.68ms p(90)=98.96ms  p(95)=109.52ms p(99.9)=186.33ms
     http_reqs......................: 75157   623.935145/s
     iteration_duration.............: avg=79.94ms min=28.84ms med=77.99ms max=320.74ms p(90)=99.32ms  p(95)=109.91ms p(99.9)=188.38ms
     iterations.....................: 75057   623.104969/s
     success_rate...................: 100.00% ✓ 75057      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 176211     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   586 kB/s
     http_req_blocked...............: avg=5.25µs   min=1.32µs  med=3.53µs   max=3.53ms   p(90)=4.94µs   p(95)=5.53µs   p(99.9)=52.3µs  
     http_req_connecting............: avg=1.5µs    min=0s      med=0s       max=3.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.74ms min=4.74ms  med=101.5ms  max=327.92ms p(90)=122.63ms p(95)=128.81ms p(99.9)=159.52ms
       { expected_response:true }...: avg=101.74ms min=4.74ms  med=101.5ms  max=327.92ms p(90)=122.63ms p(95)=128.81ms p(99.9)=159.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58837
     http_req_receiving.............: avg=87.47µs  min=30.98µs med=79.19µs  max=166.63ms p(90)=110.88µs p(95)=123.36µs p(99.9)=558.06µs
     http_req_sending...............: avg=26.13µs  min=5.8µs   med=16.76µs  max=159.7ms  p(90)=21.86µs  p(95)=23.78µs  p(99.9)=583.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.62ms min=4.6ms   med=101.4ms  max=319.03ms p(90)=122.52ms p(95)=128.69ms p(99.9)=158.11ms
     http_reqs......................: 58837   487.896008/s
     iteration_duration.............: avg=102.18ms min=22.93ms med=101.79ms max=341.13ms p(90)=122.9ms  p(95)=129.08ms p(99.9)=162.81ms
     iterations.....................: 58737   487.066774/s
     success_rate...................: 100.00% ✓ 58737      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103083     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=7.17µs   min=1.49µs  med=3.55µs   max=23.26ms  p(90)=4.92µs   p(95)=5.45µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.66µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=173.92ms min=7.55ms  med=187.2ms  max=377.23ms p(90)=199.65ms p(95)=203.52ms p(99.9)=268.1ms 
       { expected_response:true }...: avg=173.92ms min=7.55ms  med=187.2ms  max=377.23ms p(90)=199.65ms p(95)=203.52ms p(99.9)=268.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34461
     http_req_receiving.............: avg=99.84µs  min=33.51µs med=85.13µs  max=148.88ms p(90)=115.18µs p(95)=125.97µs p(99.9)=499.09µs
     http_req_sending...............: avg=29.33µs  min=5.78µs  med=17.42µs  max=102.07ms p(90)=21.92µs  p(95)=23.72µs  p(99.9)=488.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.79ms min=7.45ms  med=187.09ms max=358.22ms p(90)=199.54ms p(95)=203.4ms  p(99.9)=267.8ms 
     http_reqs......................: 34461   284.935812/s
     iteration_duration.............: avg=174.7ms  min=35.67ms med=187.61ms max=394.3ms  p(90)=199.95ms p(95)=203.8ms  p(99.9)=272.5ms 
     iterations.....................: 34361   284.108976/s
     success_rate...................: 100.00% ✓ 34361      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100530     ✗ 0    
     data_received..................: 3.0 GB  24 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=6.46µs   min=1.41µs  med=3.51µs   max=3.53ms   p(90)=4.89µs   p(95)=5.53µs   p(99.9)=1.18ms  
     http_req_connecting............: avg=2.71µs   min=0s      med=0s       max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=178.34ms min=5.87ms  med=162.8ms  max=623.75ms p(90)=211.59ms p(95)=250.85ms p(99.9)=552.11ms
       { expected_response:true }...: avg=178.34ms min=5.87ms  med=162.8ms  max=623.75ms p(90)=211.59ms p(95)=250.85ms p(99.9)=552.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33610
     http_req_receiving.............: avg=100.83µs min=37.65µs med=87.87µs  max=97.32ms  p(90)=118.01µs p(95)=130.18µs p(99.9)=764.67µs
     http_req_sending...............: avg=24.33µs  min=5.94µs  med=17.52µs  max=40.13ms  p(90)=22.41µs  p(95)=24.21µs  p(99.9)=569.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.21ms min=5.77ms  med=162.68ms max=623.66ms p(90)=211.47ms p(95)=250.66ms p(99.9)=551.99ms
     http_reqs......................: 33610   278.195214/s
     iteration_duration.............: avg=179.15ms min=31.16ms med=163.13ms max=623.96ms p(90)=211.98ms p(95)=252.64ms p(99.9)=552.44ms
     iterations.....................: 33510   277.367498/s
     success_rate...................: 100.00% ✓ 33510      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 927687      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=3.74µs  min=942ns   med=2.6µs   max=14.25ms  p(90)=4.22µs  p(95)=4.98µs   p(99.9)=37.94µs
     http_req_connecting............: avg=662ns   min=0s      med=0s      max=10.49ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.17ms min=1.72ms  med=18.82ms max=271.65ms p(90)=26.58ms p(95)=29.08ms  p(99.9)=48.92ms
       { expected_response:true }...: avg=19.17ms min=1.72ms  med=18.82ms max=271.65ms p(90)=26.58ms p(95)=29.08ms  p(99.9)=48.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309329
     http_req_receiving.............: avg=93.53µs min=25.76µs med=52.64µs max=102.5ms  p(90)=95.65µs p(95)=149.62µs p(99.9)=7.07ms 
     http_req_sending...............: avg=45.96µs min=4.78µs  med=10.55µs max=98.84ms  p(90)=18.87µs p(95)=99.49µs  p(99.9)=3.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.03ms min=1.61ms  med=18.7ms  max=269.14ms p(90)=26.43ms p(95)=28.88ms  p(99.9)=48.07ms
     http_reqs......................: 309329  2573.1158/s
     iteration_duration.............: avg=19.39ms min=3.36ms  med=19.02ms max=300.82ms p(90)=26.79ms p(95)=29.3ms   p(99.9)=49.37ms
     iterations.....................: 309229  2572.283962/s
     success_rate...................: 100.00% ✓ 309229      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 917316      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=2.82µs   min=872ns   med=2.01µs  max=11.48ms  p(90)=3.7µs   p(95)=4.47µs  p(99.9)=35.76µs
     http_req_connecting............: avg=320ns    min=0s      med=0s      max=3.63ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.39ms  min=1.52ms  med=18.56ms max=291.46ms p(90)=28ms    p(95)=31.55ms p(99.9)=52.62ms
       { expected_response:true }...: avg=19.39ms  min=1.52ms  med=18.56ms max=291.46ms p(90)=28ms    p(95)=31.55ms p(99.9)=52.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305872
     http_req_receiving.............: avg=538.09µs min=50.93µs med=99.03µs max=172.21ms p(90)=1.37ms  p(95)=2.13ms  p(99.9)=18.19ms
     http_req_sending...............: avg=43.88µs  min=4.32µs  med=8.56µs  max=192.58ms p(90)=18.57µs p(95)=88µs    p(99.9)=3.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.81ms  min=1.43ms  med=17.97ms max=280.51ms p(90)=27.32ms p(95)=30.8ms  p(99.9)=51.2ms 
     http_reqs......................: 305872  2544.596064/s
     iteration_duration.............: avg=19.61ms  min=2.83ms  med=18.76ms max=301.97ms p(90)=28.21ms p(95)=31.78ms p(99.9)=53.07ms
     iterations.....................: 305772  2543.764148/s
     success_rate...................: 100.00% ✓ 305772      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 866631      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=2.82µs   min=862ns  med=2.05µs  max=14.28ms  p(90)=3.68µs  p(95)=4.43µs  p(99.9)=28.94µs 
     http_req_connecting............: avg=288ns    min=0s     med=0s      max=3.41ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.54ms  min=1.67ms med=17.09ms max=336.12ms p(90)=33.54ms p(95)=41.42ms p(99.9)=161.5ms 
       { expected_response:true }...: avg=20.54ms  min=1.67ms med=17.09ms max=336.12ms p(90)=33.54ms p(95)=41.42ms p(99.9)=161.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 288977
     http_req_receiving.............: avg=605.35µs min=50.6µs med=95.44µs max=220.35ms p(90)=1.11ms  p(95)=1.94ms  p(99.9)=29.34ms 
     http_req_sending...............: avg=41.3µs   min=4.32µs med=8.59µs  max=203.12ms p(90)=16.95µs p(95)=71.38µs p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.9ms   min=1.56ms med=16.55ms max=336.05ms p(90)=32.52ms p(95)=40.23ms p(99.9)=157.68ms
     http_reqs......................: 288977  2403.808877/s
     iteration_duration.............: avg=20.76ms  min=2.64ms med=17.29ms max=336.3ms  p(90)=33.76ms p(95)=41.65ms p(99.9)=162.79ms
     iterations.....................: 288877  2402.977043/s
     success_rate...................: 100.00% ✓ 288877      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 858888      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=7.12µs   min=831ns   med=2.04µs  max=270.43ms p(90)=3.44µs  p(95)=4.12µs  p(99.9)=29.1µs  
     http_req_connecting............: avg=4.59µs   min=0s      med=0s      max=261.59ms p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.73ms  min=1.61ms  med=17.23ms max=326.21ms p(90)=34.21ms p(95)=42.13ms p(99.9)=150.34ms
       { expected_response:true }...: avg=20.73ms  min=1.61ms  med=17.23ms max=326.21ms p(90)=34.21ms p(95)=42.13ms p(99.9)=150.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286396
     http_req_receiving.............: avg=602.14µs min=50.89µs med=97.61µs max=174.33ms p(90)=1.11ms  p(95)=1.89ms  p(99.9)=29.05ms 
     http_req_sending...............: avg=39.64µs  min=4.58µs  med=8.6µs   max=165.83ms p(90)=16.27µs p(95)=53.06µs p(99.9)=3.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.09ms  min=1.53ms  med=16.68ms max=326.13ms p(90)=33.19ms p(95)=40.88ms p(99.9)=148.54ms
     http_reqs......................: 286396  2382.409122/s
     iteration_duration.............: avg=20.94ms  min=2.64ms  med=17.43ms max=326.36ms p(90)=34.44ms p(95)=42.36ms p(99.9)=152.35ms
     iterations.....................: 286296  2381.577264/s
     success_rate...................: 100.00% ✓ 286296      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 805101      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 323 MB  2.7 MB/s
     http_req_blocked...............: avg=2.89µs   min=811ns   med=2.01µs   max=21.99ms  p(90)=3.46µs  p(95)=4.15µs  p(99.9)=31.84µs 
     http_req_connecting............: avg=320ns    min=0s      med=0s       max=3.72ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.13ms  min=1.83ms  med=18.34ms  max=408.27ms p(90)=36.37ms p(95)=45.28ms p(99.9)=164.8ms 
       { expected_response:true }...: avg=22.13ms  min=1.83ms  med=18.34ms  max=408.27ms p(90)=36.37ms p(95)=45.28ms p(99.9)=164.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 268467
     http_req_receiving.............: avg=615.63µs min=51.39µs med=101.72µs max=235.1ms  p(90)=1.14ms  p(95)=1.97ms  p(99.9)=29.02ms 
     http_req_sending...............: avg=37.53µs  min=4.61µs  med=8.84µs   max=100.71ms p(90)=16.8µs  p(95)=34.02µs p(99.9)=2.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.48ms  min=1.75ms  med=17.77ms  max=408.18ms p(90)=35.29ms p(95)=44.04ms p(99.9)=163.19ms
     http_reqs......................: 268467  2232.921653/s
     iteration_duration.............: avg=22.34ms  min=2.6ms   med=18.54ms  max=408.42ms p(90)=36.58ms p(95)=45.51ms p(99.9)=165.97ms
     iterations.....................: 268367  2232.089922/s
     success_rate...................: 100.00% ✓ 268367      ✗ 0     
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

     checks.........................: 100.00% ✓ 595038      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=3.9µs   min=962ns   med=3.05µs  max=4.06ms   p(90)=5.4µs    p(95)=6.51µs   p(99.9)=46.35µs
     http_req_connecting............: avg=297ns   min=0s      med=0s      max=3.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.98ms min=2.25ms  med=29.39ms max=288.57ms p(90)=39.62ms  p(95)=43.08ms  p(99.9)=67.01ms
       { expected_response:true }...: avg=29.98ms min=2.25ms  med=29.39ms max=288.57ms p(90)=39.62ms  p(95)=43.08ms  p(99.9)=67.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 198446
     http_req_receiving.............: avg=103.4µs min=28.71µs med=61.08µs max=34.19ms  p(90)=133.51µs p(95)=229.35µs p(99.9)=4.85ms 
     http_req_sending...............: avg=47.16µs min=4.85µs  med=11.42µs max=163.11ms p(90)=26.12µs  p(95)=120.96µs p(99.9)=3.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.83ms min=2.17ms  med=29.26ms max=287.93ms p(90)=39.45ms  p(95)=42.9ms   p(99.9)=66.19ms
     http_reqs......................: 198446  1649.561824/s
     iteration_duration.............: avg=30.24ms min=5.71ms  med=29.63ms max=299.82ms p(90)=39.85ms  p(95)=43.31ms  p(99.9)=67.66ms
     iterations.....................: 198346  1648.730584/s
     success_rate...................: 100.00% ✓ 198346      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 429804      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.96µs  min=1.05µs  med=2.98µs  max=3.6ms    p(90)=4.6µs    p(95)=5.32µs   p(99.9)=36.41µs 
     http_req_connecting............: avg=680ns   min=0s      med=0s      max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.61ms min=2.19ms  med=41.21ms max=296.85ms p(90)=57.87ms  p(95)=62.8ms   p(99.9)=87.63ms 
       { expected_response:true }...: avg=41.61ms min=2.19ms  med=41.21ms max=296.85ms p(90)=57.87ms  p(95)=62.8ms   p(99.9)=87.63ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143368
     http_req_receiving.............: avg=83.76µs min=27.31µs med=70.88µs max=102.44ms p(90)=111.82µs p(95)=129.27µs p(99.9)=773.23µs
     http_req_sending...............: avg=29.25µs min=4.78µs  med=12.68µs max=257.05ms p(90)=19.21µs  p(95)=23.13µs  p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.5ms  min=2.07ms  med=41.1ms  max=296.44ms p(90)=57.76ms  p(95)=62.69ms  p(99.9)=87.16ms 
     http_reqs......................: 143368  1191.934687/s
     iteration_duration.............: avg=41.87ms min=4.38ms  med=41.45ms max=328.34ms p(90)=58.1ms   p(95)=63.02ms  p(99.9)=88.04ms 
     iterations.....................: 143268  1191.103306/s
     success_rate...................: 100.00% ✓ 143268      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 208152     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   692 kB/s
     http_req_blocked...............: avg=4.41µs  min=1.06µs  med=2.77µs  max=4.06ms   p(90)=4.26µs   p(95)=4.89µs   p(99.9)=44.71µs 
     http_req_connecting............: avg=1.41µs  min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.12ms min=3.89ms  med=82.75ms max=319.28ms p(90)=110.01ms p(95)=122.77ms p(99.9)=211.07ms
       { expected_response:true }...: avg=86.12ms min=3.89ms  med=82.75ms max=319.28ms p(90)=110.01ms p(95)=122.77ms p(99.9)=211.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69484
     http_req_receiving.............: avg=79.47µs min=28.75µs med=72.03µs max=17.34ms  p(90)=108.61µs p(95)=121.56µs p(99.9)=588.97µs
     http_req_sending...............: avg=23.33µs min=4.98µs  med=13.32µs max=148.73ms p(90)=20.27µs  p(95)=22.45µs  p(99.9)=590.42µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.02ms min=3.79ms  med=82.64ms max=318.93ms p(90)=109.9ms  p(95)=122.67ms p(99.9)=210.43ms
     http_reqs......................: 69484   576.403576/s
     iteration_duration.............: avg=86.49ms min=15.14ms med=82.99ms max=336.44ms p(90)=110.27ms p(95)=123.05ms p(99.9)=212.72ms
     iterations.....................: 69384   575.574028/s
     success_rate...................: 100.00% ✓ 69384      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 148020     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   492 kB/s
     http_req_blocked...............: avg=5.07µs   min=1.14µs  med=3.05µs   max=3.79ms   p(90)=4.45µs   p(95)=4.97µs   p(99.9)=384.89µs
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=333.12µs
     http_req_duration..............: avg=121.13ms min=5.5ms   med=118.85ms max=331.83ms p(90)=160.48ms p(95)=172.97ms p(99.9)=220.32ms
       { expected_response:true }...: avg=121.13ms min=5.5ms   med=118.85ms max=331.83ms p(90)=160.48ms p(95)=172.97ms p(99.9)=220.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49440
     http_req_receiving.............: avg=85.07µs  min=29.87µs med=82.1µs   max=52.37ms  p(90)=112.22µs p(95)=124.29µs p(99.9)=493.5µs 
     http_req_sending...............: avg=30.31µs  min=5.12µs  med=15.8µs   max=139.26ms p(90)=20.84µs  p(95)=22.55µs  p(99.9)=475.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.02ms min=5.37ms  med=118.74ms max=331.5ms  p(90)=160.34ms p(95)=172.87ms p(99.9)=220.08ms
     http_reqs......................: 49440   409.658368/s
     iteration_duration.............: avg=121.64ms min=18.13ms med=119.18ms max=341.94ms p(90)=160.77ms p(95)=173.27ms p(99.9)=222.17ms
     iterations.....................: 49340   408.829771/s
     success_rate...................: 100.00% ✓ 49340      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 96489      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.75µs   min=1.33µs  med=3.37µs   max=3.68ms   p(90)=4.76µs   p(95)=5.37µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=3.11µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=185.8ms  min=7.78ms  med=186.79ms max=377.88ms p(90)=210.16ms p(95)=215.95ms p(99.9)=290.97ms
       { expected_response:true }...: avg=185.8ms  min=7.78ms  med=186.79ms max=377.88ms p(90)=210.16ms p(95)=215.95ms p(99.9)=290.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32263
     http_req_receiving.............: avg=96.17µs  min=35.2µs  med=89.02µs  max=113.63ms p(90)=119.63µs p(95)=131.05µs p(99.9)=459.2µs 
     http_req_sending...............: avg=24.35µs  min=5.91µs  med=17.14µs  max=68.63ms  p(90)=21.95µs  p(95)=23.76µs  p(99.9)=400.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.68ms min=7.63ms  med=186.68ms max=377.42ms p(90)=210.04ms p(95)=215.84ms p(99.9)=290.8ms 
     http_reqs......................: 32263   266.698807/s
     iteration_duration.............: avg=186.65ms min=36.43ms med=187.33ms max=388.21ms p(90)=210.48ms p(95)=216.27ms p(99.9)=291.76ms
     iterations.....................: 32163   265.872167/s
     success_rate...................: 100.00% ✓ 32163      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 94686      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=6.77µs   min=1.19µs  med=3.51µs   max=3.6ms    p(90)=4.87µs   p(95)=5.49µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=3.03µs   min=0s      med=0s       max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=189.33ms min=5.62ms  med=174.74ms max=680.71ms p(90)=217.5ms  p(95)=270.29ms p(99.9)=543.64ms
       { expected_response:true }...: avg=189.33ms min=5.62ms  med=174.74ms max=680.71ms p(90)=217.5ms  p(95)=270.29ms p(99.9)=543.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31662
     http_req_receiving.............: avg=94.01µs  min=32µs    med=89.54µs  max=7.67ms   p(90)=119.28µs p(95)=130.71µs p(99.9)=723.5µs 
     http_req_sending...............: avg=28.28µs  min=5.71µs  med=18.27µs  max=60.89ms  p(90)=22.91µs  p(95)=24.74µs  p(99.9)=428.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.21ms min=5.52ms  med=174.62ms max=680.62ms p(90)=217.39ms p(95)=270.16ms p(99.9)=543.51ms
     http_reqs......................: 31662   262.046804/s
     iteration_duration.............: avg=190.21ms min=40.83ms med=175.1ms  max=680.97ms p(90)=218.01ms p(95)=271.97ms p(99.9)=543.9ms 
     iterations.....................: 31562   261.219166/s
     success_rate...................: 100.00% ✓ 31562      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 6825      ✗ 0   
     data_received..................: 227 MB  1.8 MB/s
     data_sent......................: 2.8 MB  23 kB/s
     http_req_blocked...............: avg=46.2µs   min=1.16µs   med=3.12µs  max=4.16ms  p(90)=4.53µs   p(95)=5.33µs   p(99.9)=3.93ms  
     http_req_connecting............: avg=42.37µs  min=0s       med=0s      max=4.13ms  p(90)=0s       p(95)=0s       p(99.9)=3.9ms   
     http_req_duration..............: avg=2.54s    min=33.52ms  med=2.66s   max=4.34s   p(90)=3.31s    p(95)=3.56s    p(99.9)=4.08s   
       { expected_response:true }...: avg=2.54s    min=33.52ms  med=2.66s   max=4.34s   p(90)=3.31s    p(95)=3.56s    p(99.9)=4.08s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2375
     http_req_receiving.............: avg=100.45µs min=33.1µs   med=92.12µs max=11.46ms p(90)=132.03µs p(95)=149.84µs p(99.9)=416.36µs
     http_req_sending...............: avg=52.03µs  min=5.81µs   med=17.72µs max=51.14ms p(90)=22.26µs  p(95)=26.82µs  p(99.9)=4.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.54s    min=33.37ms  med=2.66s   max=4.34s   p(90)=3.31s    p(95)=3.56s    p(99.9)=4.08s   
     http_reqs......................: 2375    18.840061/s
     iteration_duration.............: avg=2.65s    min=440.45ms med=2.68s   max=4.34s   p(90)=3.34s    p(95)=3.56s    p(99.9)=4.08s   
     iterations.....................: 2275    18.046795/s
     success_rate...................: 100.00% ✓ 2275      ✗ 0   
     vus............................: 11      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

