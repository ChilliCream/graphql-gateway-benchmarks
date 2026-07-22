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
| hive-router | v0.0.83 | 2,992 | 3,218 | 2,940 | 3.0% |  |
| fusion | 16.5.1 | 2,536 | 2,666 | 2,506 | 2.0% |  |
| grafbase | 0.53.5 | 2,173 | 2,294 | 2,157 | 2.1% |  |
| cosmo | 0.331.1 | 1,273 | 1,326 | 1,263 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.4 | 629 | 647 | 628 | 1.0% |  |
| apollo-router | v2.16.0 | 491 | 509 | 484 | 1.4% |  |
| apollo-gateway | 2.14.2 | 287 | 289 | 286 | 0.3% |  |
| hive-gateway | 2.10.4 | 270 | 280 | 269 | 1.3% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1221 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,463 | 2,724 | 2,430 | 3.8% |  |
| fusion | 16.5.1 | 2,443 | 2,535 | 2,391 | 2.0% |  |
| grafbase | 0.53.5 | 1,666 | 1,723 | 1,657 | 1.3% |  |
| cosmo | 0.331.1 | 1,187 | 1,230 | 1,180 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.4 | 580 | 599 | 574 | 1.3% |  |
| apollo-router | v2.16.0 | 422 | 450 | 410 | 2.8% |  |
| apollo-gateway | 2.14.2 | 265 | 269 | 264 | 0.6% |  |
| hive-gateway | 2.10.4 | 260 | 269 | 259 | 1.4% |  |
| feddi | 5ff8b6165878 | 20 | 20 | 20 | 0.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1078635     ✗ 0     
     data_received..................: 32 GB   262 MB/s
     data_sent......................: 432 MB  3.6 MB/s
     http_req_blocked...............: avg=3.28µs  min=952ns   med=2.35µs  max=18.09ms  p(90)=3.71µs  p(95)=4.33µs   p(99.9)=36.69µs
     http_req_connecting............: avg=271ns   min=0s      med=0s      max=3.59ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.46ms min=1.46ms  med=15.67ms max=280.34ms p(90)=24.53ms p(95)=27.94ms  p(99.9)=48.08ms
       { expected_response:true }...: avg=16.46ms min=1.46ms  med=15.67ms max=280.34ms p(90)=24.53ms p(95)=27.94ms  p(99.9)=48.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 359645
     http_req_receiving.............: avg=93.76µs min=25.47µs med=45.69µs max=46.57ms  p(90)=84.36µs p(95)=161.22µs p(99.9)=8.63ms 
     http_req_sending...............: avg=49.19µs min=4.78µs  med=8.99µs  max=61.13ms  p(90)=15.57µs p(95)=97.87µs  p(99.9)=7.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.32ms min=1.41ms  med=15.55ms max=279.84ms p(90)=24.33ms p(95)=27.66ms  p(99.9)=46.81ms
     http_reqs......................: 359645  2992.231811/s
     iteration_duration.............: avg=16.67ms min=1.95ms  med=15.86ms max=294.43ms p(90)=24.74ms p(95)=28.17ms  p(99.9)=48.86ms
     iterations.....................: 359545  2991.399815/s
     success_rate...................: 100.00% ✓ 359545      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 914730      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 367 MB  3.0 MB/s
     http_req_blocked...............: avg=2.75µs   min=881ns   med=2µs     max=17.46ms  p(90)=3.3µs   p(95)=3.94µs  p(99.9)=28.5µs  
     http_req_connecting............: avg=283ns    min=0s      med=0s      max=3.34ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.45ms  min=2.06ms  med=16.73ms max=302.96ms p(90)=31.45ms p(95)=38.16ms p(99.9)=131.45ms
       { expected_response:true }...: avg=19.45ms  min=2.06ms  med=16.73ms max=302.96ms p(90)=31.45ms p(95)=38.16ms p(99.9)=131.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305010
     http_req_receiving.............: avg=572.97µs min=49.95µs med=90.99µs max=201.04ms p(90)=1.09ms  p(95)=1.93ms  p(99.9)=26.66ms 
     http_req_sending...............: avg=42.11µs  min=4.72µs  med=8.49µs  max=98.89ms  p(90)=15.35µs p(95)=80.89µs p(99.9)=3.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.84ms  min=1.91ms  med=16.19ms max=301.63ms p(90)=30.48ms p(95)=37ms    p(99.9)=129.62ms
     http_reqs......................: 305010  2536.003493/s
     iteration_duration.............: avg=19.66ms  min=2.9ms   med=16.93ms max=310.88ms p(90)=31.67ms p(95)=38.41ms p(99.9)=132.55ms
     iterations.....................: 304910  2535.172043/s
     success_rate...................: 100.00% ✓ 304910      ✗ 0     
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

     checks.........................: 100.00% ✓ 783708      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=2.98µs  min=922ns   med=2.21µs  max=6.25ms   p(90)=3.78µs  p(95)=4.56µs   p(99.9)=35.76µs
     http_req_connecting............: avg=338ns   min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.74ms min=1.71ms  med=22.5ms  max=285.96ms p(90)=27.02ms p(95)=28.8ms   p(99.9)=48.08ms
       { expected_response:true }...: avg=22.74ms min=1.71ms  med=22.5ms  max=285.96ms p(90)=27.02ms p(95)=28.8ms   p(99.9)=48.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261336
     http_req_receiving.............: avg=86.73µs min=28.65µs med=54.54µs max=30.49ms  p(90)=92.45µs p(95)=118.78µs p(99.9)=5.56ms 
     http_req_sending...............: avg=34.95µs min=4.99µs  med=9.43µs  max=132.59ms p(90)=15.87µs p(95)=24.9µs   p(99.9)=1.7ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.62ms min=1.66ms  med=22.4ms  max=285.51ms p(90)=26.9ms  p(95)=28.63ms  p(99.9)=46.98ms
     http_reqs......................: 261336  2173.791903/s
     iteration_duration.............: avg=22.95ms min=4.28ms  med=22.69ms max=300.33ms p(90)=27.23ms p(95)=29.01ms  p(99.9)=48.5ms 
     iterations.....................: 261236  2172.960103/s
     success_rate...................: 100.00% ✓ 261236      ✗ 0     
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

     checks.........................: 100.00% ✓ 459327      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.32µs  min=1.01µs med=2.36µs  max=3.92ms   p(90)=3.8µs   p(95)=4.42µs   p(99.9)=30.66µs 
     http_req_connecting............: avg=660ns   min=0s     med=0s      max=3.85ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.95ms min=1.95ms med=38.6ms  max=296.57ms p(90)=54.41ms p(95)=59.29ms  p(99.9)=82.86ms 
       { expected_response:true }...: avg=38.95ms min=1.95ms med=38.6ms  max=296.57ms p(90)=54.41ms p(95)=59.29ms  p(99.9)=82.86ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153209
     http_req_receiving.............: avg=73.87µs min=26.5µs med=59.37µs max=121.86ms p(90)=95.39µs p(95)=111.52µs p(99.9)=845.67µs
     http_req_sending...............: avg=25.16µs min=4.6µs  med=10.39µs max=193.96ms p(90)=16.09µs p(95)=20.03µs  p(99.9)=964.92µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.85ms min=1.9ms  med=38.5ms  max=295.94ms p(90)=54.32ms p(95)=59.2ms   p(99.9)=82.49ms 
     http_reqs......................: 153209  1273.852354/s
     iteration_duration.............: avg=39.18ms min=3.66ms med=38.8ms  max=308.01ms p(90)=54.61ms p(95)=59.5ms   p(99.9)=83.14ms 
     iterations.....................: 153109  1273.020906/s
     success_rate...................: 100.00% ✓ 153109      ✗ 0     
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

     checks.........................: 100.00% ✓ 227139     ✗ 0    
     data_received..................: 6.7 GB  55 MB/s
     data_sent......................: 91 MB   756 kB/s
     http_req_blocked...............: avg=6.38µs  min=1.23µs  med=3.22µs  max=120.02ms p(90)=4.79µs   p(95)=5.49µs   p(99.9)=44.18µs 
     http_req_connecting............: avg=2.89µs  min=0s      med=0s      max=119.95ms p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=78.89ms min=3.63ms  med=77.03ms max=342.45ms p(90)=96.58ms  p(95)=105.92ms p(99.9)=181.79ms
       { expected_response:true }...: avg=78.89ms min=3.63ms  med=77.03ms max=342.45ms p(90)=96.58ms  p(95)=105.92ms p(99.9)=181.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75813
     http_req_receiving.............: avg=83.64µs min=31.41µs med=72.56µs max=110.12ms p(90)=109.69µs p(95)=123.54µs p(99.9)=636.03µs
     http_req_sending...............: avg=25.03µs min=5.45µs  med=14.49µs max=125.64ms p(90)=21.26µs  p(95)=23.6µs   p(99.9)=646.14µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.78ms min=3.5ms   med=76.93ms max=341.81ms p(90)=96.47ms  p(95)=105.8ms  p(99.9)=181.54ms
     http_reqs......................: 75813   629.278917/s
     iteration_duration.............: avg=79.25ms min=16.07ms med=77.28ms max=349.92ms p(90)=96.85ms  p(95)=106.22ms p(99.9)=184.09ms
     iterations.....................: 75713   628.448876/s
     success_rate...................: 100.00% ✓ 75713      ✗ 0    
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

     checks.........................: 100.00% ✓ 177375     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   590 kB/s
     http_req_blocked...............: avg=4.84µs   min=1.18µs  med=3.41µs   max=3.18ms   p(90)=4.83µs   p(95)=5.4µs    p(99.9)=52.84µs 
     http_req_connecting............: avg=1.19µs   min=0s      med=0s       max=3.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.07ms min=4.75ms  med=100.81ms max=332.91ms p(90)=121.86ms p(95)=128.23ms p(99.9)=158.14ms
       { expected_response:true }...: avg=101.07ms min=4.75ms  med=100.81ms max=332.91ms p(90)=121.86ms p(95)=128.23ms p(99.9)=158.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59225
     http_req_receiving.............: avg=83.62µs  min=32.73µs med=77.74µs  max=61.96ms  p(90)=109.61µs p(95)=122.28µs p(99.9)=552.07µs
     http_req_sending...............: avg=33.44µs  min=6.16µs  med=16.84µs  max=179.72ms p(90)=22.16µs  p(95)=24.04µs  p(99.9)=709.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.95ms min=4.61ms  med=100.71ms max=332.03ms p(90)=121.75ms p(95)=128.11ms p(99.9)=157.5ms 
     http_reqs......................: 59225   491.113682/s
     iteration_duration.............: avg=101.5ms  min=20.2ms  med=101.1ms  max=341ms    p(90)=122.13ms p(95)=128.51ms p(99.9)=159.84ms
     iterations.....................: 59125   490.284449/s
     success_rate...................: 100.00% ✓ 59125      ✗ 0    
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

     checks.........................: 100.00% ✓ 104010     ✗ 0    
     data_received..................: 3.1 GB  25 MB/s
     data_sent......................: 42 MB   345 kB/s
     http_req_blocked...............: avg=8.41µs   min=1.13µs  med=2.94µs   max=7.57ms   p(90)=4.26µs   p(95)=4.79µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=4.76µs   min=0s      med=0s       max=7.44ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=172.38ms min=7.27ms  med=173.35ms max=369.22ms p(90)=181.97ms p(95)=187ms    p(99.9)=251.31ms
       { expected_response:true }...: avg=172.38ms min=7.27ms  med=173.35ms max=369.22ms p(90)=181.97ms p(95)=187ms    p(99.9)=251.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34770
     http_req_receiving.............: avg=85.19µs  min=28.21µs med=80.48µs  max=64.24ms  p(90)=111.52µs p(95)=122.93µs p(99.9)=422.16µs
     http_req_sending...............: avg=30.05µs  min=5.12µs  med=15.62µs  max=76.25ms  p(90)=20.15µs  p(95)=21.9µs   p(99.9)=2.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=172.27ms min=7.16ms  med=173.23ms max=367.24ms p(90)=181.87ms p(95)=186.87ms p(99.9)=251.2ms 
     http_reqs......................: 34770   287.607439/s
     iteration_duration.............: avg=173.14ms min=23.39ms med=173.69ms max=378.17ms p(90)=182.24ms p(95)=187.28ms p(99.9)=253.23ms
     iterations.....................: 34670   286.780268/s
     success_rate...................: 100.00% ✓ 34670      ✗ 0    
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

     checks.........................: 100.00% ✓ 97746      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.64µs   min=1.16µs  med=3.47µs   max=3.69ms   p(90)=4.81µs   p(95)=5.4µs    p(99.9)=1.54ms  
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=183.43ms min=6.13ms  med=167.99ms max=689.34ms p(90)=213.23ms p(95)=261.62ms p(99.9)=543.58ms
       { expected_response:true }...: avg=183.43ms min=6.13ms  med=167.99ms max=689.34ms p(90)=213.23ms p(95)=261.62ms p(99.9)=543.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32682
     http_req_receiving.............: avg=99.61µs  min=36.93µs med=87.97µs  max=127.58ms p(90)=118.17µs p(95)=130.27µs p(99.9)=604.86µs
     http_req_sending...............: avg=30.29µs  min=6.56µs  med=18.21µs  max=65.44ms  p(90)=22.93µs  p(95)=24.65µs  p(99.9)=485.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.3ms  min=6ms     med=167.88ms max=689.25ms p(90)=213.07ms p(95)=261.44ms p(99.9)=543.47ms
     http_reqs......................: 32682   270.388125/s
     iteration_duration.............: avg=184.26ms min=46.2ms  med=168.32ms max=689.62ms p(90)=213.63ms p(95)=262.81ms p(99.9)=543.98ms
     iterations.....................: 32582   269.560795/s
     success_rate...................: 100.00% ✓ 32582      ✗ 0    
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

     checks.........................: 100.00% ✓ 888066      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=3.23µs  min=941ns   med=2.37µs  max=12.65ms  p(90)=3.99µs  p(95)=4.72µs   p(99.9)=36.35µs
     http_req_connecting............: avg=301ns   min=0s      med=0s      max=3.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.04ms min=1.58ms  med=19.75ms max=287.38ms p(90)=27.9ms  p(95)=30.43ms  p(99.9)=49.36ms
       { expected_response:true }...: avg=20.04ms min=1.58ms  med=19.75ms max=287.38ms p(90)=27.9ms  p(95)=30.43ms  p(99.9)=49.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296122
     http_req_receiving.............: avg=88.51µs min=26.92µs med=51.68µs max=61.45ms  p(90)=93.13µs p(95)=131.91µs p(99.9)=6.47ms 
     http_req_sending...............: avg=43.54µs min=4.61µs  med=9.64µs  max=210.25ms p(90)=17.08µs p(95)=78.45µs  p(99.9)=3.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.91ms min=1.53ms  med=19.63ms max=286.72ms p(90)=27.76ms p(95)=30.24ms  p(99.9)=48.35ms
     http_reqs......................: 296122  2463.442906/s
     iteration_duration.............: avg=20.25ms min=2.99ms  med=19.95ms max=299.94ms p(90)=28.11ms p(95)=30.65ms  p(99.9)=49.82ms
     iterations.....................: 296022  2462.611004/s
     success_rate...................: 100.00% ✓ 296022      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 880770      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=3.46µs   min=952ns   med=2.5µs   max=10.51ms  p(90)=4.01µs  p(95)=4.7µs   p(99.9)=33.64µs 
     http_req_connecting............: avg=430ns    min=0s      med=0s      max=4.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.2ms   min=1.59ms  med=16.94ms max=352ms    p(90)=33.22ms p(95)=40.78ms p(99.9)=142.04ms
       { expected_response:true }...: avg=20.2ms   min=1.59ms  med=16.94ms max=352ms    p(90)=33.22ms p(95)=40.78ms p(99.9)=142.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293690
     http_req_receiving.............: avg=570.78µs min=50.93µs med=96.62µs max=191.63ms p(90)=1.09ms  p(95)=1.92ms  p(99.9)=26.99ms 
     http_req_sending...............: avg=45.76µs  min=4.7µs   med=9.47µs  max=196.47ms p(90)=17.13µs p(95)=88.61µs p(99.9)=4.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.59ms  min=1.49ms  med=16.42ms max=351.9ms  p(90)=32.19ms p(95)=39.61ms p(99.9)=139.72ms
     http_reqs......................: 293690  2443.258764/s
     iteration_duration.............: avg=20.42ms  min=2.65ms  med=17.15ms max=352.16ms p(90)=33.45ms p(95)=41.01ms p(99.9)=143.02ms
     iterations.....................: 293590  2442.426846/s
     success_rate...................: 100.00% ✓ 293590      ✗ 0     
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

     checks.........................: 100.00% ✓ 601140      ✗ 0     
     data_received..................: 18 GB   146 MB/s
     data_sent......................: 241 MB  2.0 MB/s
     http_req_blocked...............: avg=3.54µs   min=882ns   med=2.48µs  max=4.66ms   p(90)=4.79µs   p(95)=5.88µs   p(99.9)=45.96µs
     http_req_connecting............: avg=494ns    min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.68ms  min=2.29ms  med=29.14ms max=294.38ms p(90)=39.05ms  p(95)=42.45ms  p(99.9)=62ms   
       { expected_response:true }...: avg=29.68ms  min=2.29ms  med=29.14ms max=294.38ms p(90)=39.05ms  p(95)=42.45ms  p(99.9)=62ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 200480
     http_req_receiving.............: avg=102.53µs min=28.42µs med=56.9µs  max=147.52ms p(90)=129.16µs p(95)=213.21µs p(99.9)=4.34ms 
     http_req_sending...............: avg=43.01µs  min=4.66µs  med=9.92µs  max=75.77ms  p(90)=24.54µs  p(95)=110.57µs p(99.9)=3.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.54ms  min=2.17ms  med=29.01ms max=293.93ms p(90)=38.89ms  p(95)=42.25ms  p(99.9)=61.53ms
     http_reqs......................: 200480  1666.801009/s
     iteration_duration.............: avg=29.93ms  min=4.26ms  med=29.36ms max=320.51ms p(90)=39.28ms  p(95)=42.67ms  p(99.9)=62.52ms
     iterations.....................: 200380  1665.969603/s
     success_rate...................: 100.00% ✓ 200380      ✗ 0     
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

     checks.........................: 100.00% ✓ 428175      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.78µs  min=1.17µs  med=2.83µs  max=3.79ms   p(90)=4.44µs   p(95)=5.17µs   p(99.9)=39.55µs
     http_req_connecting............: avg=629ns   min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.78ms min=2.15ms  med=41.41ms max=297.19ms p(90)=58.18ms  p(95)=63.19ms  p(99.9)=87.29ms
       { expected_response:true }...: avg=41.78ms min=2.15ms  med=41.41ms max=297.19ms p(90)=58.18ms  p(95)=63.19ms  p(99.9)=87.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142825
     http_req_receiving.............: avg=81.83µs min=27.96µs med=67.47µs max=61.56ms  p(90)=106.85µs p(95)=124.06µs p(99.9)=1ms    
     http_req_sending...............: avg=25.86µs min=5.14µs  med=12.21µs max=99.53ms  p(90)=18.73µs  p(95)=22.68µs  p(99.9)=1ms    
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.67ms min=2.05ms  med=41.31ms max=297.01ms p(90)=58.07ms  p(95)=63.08ms  p(99.9)=87.03ms
     http_reqs......................: 142825  1187.381238/s
     iteration_duration.............: avg=42.03ms min=3.84ms  med=41.63ms max=304.42ms p(90)=58.4ms   p(95)=63.4ms   p(99.9)=87.67ms
     iterations.....................: 142725  1186.549884/s
     success_rate...................: 100.00% ✓ 142725      ✗ 0     
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

     checks.........................: 100.00% ✓ 209700     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   698 kB/s
     http_req_blocked...............: avg=4.21µs  min=962ns   med=2.71µs  max=3.96ms   p(90)=4.22µs   p(95)=4.81µs   p(99.9)=42.03µs 
     http_req_connecting............: avg=1.27µs  min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.49ms min=3.91ms  med=83.55ms max=321.68ms p(90)=104.56ms p(95)=114.8ms  p(99.9)=200.71ms
       { expected_response:true }...: avg=85.49ms min=3.91ms  med=83.55ms max=321.68ms p(90)=104.56ms p(95)=114.8ms  p(99.9)=200.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70000
     http_req_receiving.............: avg=79.99µs min=27.96µs med=69.97µs max=125.28ms p(90)=106.99µs p(95)=120.32µs p(99.9)=626.46µs
     http_req_sending...............: avg=24.91µs min=4.93µs  med=13.41µs max=141.22ms p(90)=20.6µs   p(95)=22.78µs  p(99.9)=577.12µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.38ms min=3.83ms  med=83.46ms max=315.69ms p(90)=104.45ms p(95)=114.67ms p(99.9)=199.94ms
     http_reqs......................: 70000   580.859924/s
     iteration_duration.............: avg=85.85ms min=17.21ms med=83.79ms max=332.7ms  p(90)=104.83ms p(95)=115.09ms p(99.9)=202.18ms
     iterations.....................: 69900   580.030125/s
     success_rate...................: 100.00% ✓ 69900      ✗ 0    
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

     checks.........................: 100.00% ✓ 152592     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 61 MB   507 kB/s
     http_req_blocked...............: avg=5.26µs   min=1.05µs  med=3.13µs   max=3.77ms   p(90)=4.54µs   p(95)=5.1µs    p(99.9)=201.49µs
     http_req_connecting............: avg=1.92µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=3.24µs  
     http_req_duration..............: avg=117.5ms  min=5.3ms   med=115.39ms max=308.57ms p(90)=155ms    p(95)=166.81ms p(99.9)=215.88ms
       { expected_response:true }...: avg=117.5ms  min=5.3ms   med=115.39ms max=308.57ms p(90)=155ms    p(95)=166.81ms p(99.9)=215.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50964
     http_req_receiving.............: avg=88.19µs  min=29.54µs med=83.97µs  max=82.73ms  p(90)=114.49µs p(95)=127.37µs p(99.9)=598.93µs
     http_req_sending...............: avg=26.18µs  min=4.98µs  med=16.81µs  max=94.58ms  p(90)=21.91µs  p(95)=23.72µs  p(99.9)=487.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.39ms min=5.16ms  med=115.28ms max=308.05ms p(90)=154.88ms p(95)=166.67ms p(99.9)=215.78ms
     http_reqs......................: 50964   422.326776/s
     iteration_duration.............: avg=117.99ms min=17.81ms med=115.71ms max=334.31ms p(90)=155.3ms  p(95)=167.13ms p(99.9)=218.76ms
     iterations.....................: 50864   421.498099/s
     success_rate...................: 100.00% ✓ 50864      ✗ 0    
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

     checks.........................: 100.00% ✓ 96033      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.44µs   min=1.28µs  med=3.45µs   max=3.61ms   p(90)=4.79µs   p(95)=5.36µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=186.66ms min=7.88ms  med=187.34ms max=401.71ms p(90)=196.55ms p(95)=200.22ms p(99.9)=273.19ms
       { expected_response:true }...: avg=186.66ms min=7.88ms  med=187.34ms max=401.71ms p(90)=196.55ms p(95)=200.22ms p(99.9)=273.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32111
     http_req_receiving.............: avg=100.02µs min=34.65µs med=89.22µs  max=114.13ms p(90)=119.97µs p(95)=132.24µs p(99.9)=514.8µs 
     http_req_sending...............: avg=37.93µs  min=5.78µs  med=17.58µs  max=148.03ms p(90)=22.23µs  p(95)=24.16µs  p(99.9)=506.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.52ms min=7.78ms  med=187.23ms max=401.07ms p(90)=196.43ms p(95)=200.1ms  p(99.9)=271.58ms
     http_reqs......................: 32111   265.439077/s
     iteration_duration.............: avg=187.53ms min=28.12ms med=187.68ms max=411.33ms p(90)=196.82ms p(95)=200.52ms p(99.9)=280.08ms
     iterations.....................: 32011   264.612447/s
     success_rate...................: 100.00% ✓ 32011      ✗ 0    
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

     checks.........................: 100.00% ✓ 94209      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=6.81µs   min=1.45µs  med=3.62µs   max=4.28ms   p(90)=5.03µs   p(95)=5.66µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=2.88µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=190.29ms min=6.36ms  med=174.87ms max=622.07ms p(90)=222.06ms p(95)=271.49ms p(99.9)=556.95ms
       { expected_response:true }...: avg=190.29ms min=6.36ms  med=174.87ms max=622.07ms p(90)=222.06ms p(95)=271.49ms p(99.9)=556.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31503
     http_req_receiving.............: avg=96.61µs  min=36.27µs med=90.38µs  max=37.61ms  p(90)=121.66µs p(95)=133.55µs p(99.9)=830.92µs
     http_req_sending...............: avg=32.5µs   min=6.59µs  med=18.25µs  max=95.78ms  p(90)=22.77µs  p(95)=24.54µs  p(99.9)=585.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.16ms min=6.27ms  med=174.75ms max=621.92ms p(90)=221.93ms p(95)=271.39ms p(99.9)=556.85ms
     http_reqs......................: 31503   260.404138/s
     iteration_duration.............: avg=191.18ms min=42.3ms  med=175.2ms  max=622.38ms p(90)=222.64ms p(95)=273.35ms p(99.9)=557.21ms
     iterations.....................: 31403   259.577537/s
     success_rate...................: 100.00% ✓ 31403      ✗ 0    
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

     checks.........................: 100.00% ✓ 7548      ✗ 0   
     data_received..................: 250 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=56.94µs  min=1.37µs   med=3.54µs  max=6.82ms  p(90)=5.13µs   p(95)=5.8µs    p(99.9)=5.72ms  
     http_req_connecting............: avg=51.62µs  min=0s       med=0s      max=6.77ms  p(90)=0s       p(95)=0s       p(99.9)=4.86ms  
     http_req_duration..............: avg=2.3s     min=29.93ms  med=2.34s   max=4.68s   p(90)=3.11s    p(95)=3.35s    p(99.9)=4.15s   
       { expected_response:true }...: avg=2.3s     min=29.93ms  med=2.34s   max=4.68s   p(90)=3.11s    p(95)=3.35s    p(99.9)=4.15s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2616
     http_req_receiving.............: avg=102.37µs min=31.4µs   med=93.99µs max=8.25ms  p(90)=138.04µs p(95)=154.67µs p(99.9)=534.12µs
     http_req_sending...............: avg=89.09µs  min=5.97µs   med=19.07µs max=65.28ms p(90)=24.02µs  p(95)=28.2µs   p(99.9)=7.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.3s     min=29.74ms  med=2.34s   max=4.68s   p(90)=3.11s    p(95)=3.35s    p(99.9)=4.15s   
     http_reqs......................: 2616    20.863463/s
     iteration_duration.............: avg=2.39s    min=325.71ms med=2.38s   max=4.68s   p(90)=3.13s    p(95)=3.36s    p(99.9)=4.15s   
     iterations.....................: 2516    20.06593/s
     success_rate...................: 100.00% ✓ 2516      ✗ 0   
     vus............................: 23      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

