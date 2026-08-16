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
| hive-router | v0.0.84 | 3,080 | 3,305 | 3,049 | 2.9% |  |
| fusion-nightly-net11 | 16.6.1-p.3 | 2,750 | 2,882 | 2,741 | 1.7% |  |
| fusion-nightly | 16.6.1-p.3 | 2,619 | 2,736 | 2,611 | 1.6% |  |
| fusion | 16.6.0 | 2,511 | 2,645 | 2,494 | 2.1% |  |
| fusion-nightly-fed | 16.6.1-p.3 | 2,439 | 2,554 | 2,413 | 2.1% |  |
| grafbase | 0.53.5 | 2,150 | 2,257 | 2,137 | 1.9% |  |
| cosmo | 0.334.0 | 1,305 | 1,353 | 1,293 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 631 | 648 | 629 | 1.0% |  |
| apollo-router | v2.16.1 | 484 | 502 | 483 | 1.5% |  |
| apollo-gateway | 2.14.3 | 280 | 284 | 279 | 0.7% |  |
| hive-gateway | 2.10.8 | 275 | 280 | 273 | 1.0% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,538 | 2,702 | 2,508 | 2.5% |  |
| fusion-nightly-net11 | 16.6.1-p.3 | 2,451 | 2,561 | 2,430 | 1.9% |  |
| fusion-nightly | 16.6.1-p.3 | 2,366 | 2,486 | 2,357 | 1.9% |  |
| fusion | 16.6.0 | 2,358 | 2,468 | 2,344 | 1.9% |  |
| fusion-nightly-fed | 16.6.1-p.3 | 2,279 | 2,380 | 2,265 | 1.7% |  |
| grafbase | 0.53.5 | 1,676 | 1,727 | 1,667 | 1.3% |  |
| cosmo | 0.334.0 | 1,184 | 1,228 | 1,178 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 583 | 608 | 579 | 1.6% |  |
| apollo-router | v2.16.1 | 410 | 429 | 403 | 2.3% |  |
| apollo-gateway | 2.14.3 | 268 | 275 | 265 | 1.2% |  |
| hive-gateway | 2.10.8 | 260 | 266 | 258 | 1.0% |  |
| feddi | 5ff8b6165878 | 23 | 24 | 23 | 2.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1110375     ✗ 0     
     data_received..................: 33 GB   270 MB/s
     data_sent......................: 445 MB  3.7 MB/s
     http_req_blocked...............: avg=3.28µs  min=972ns   med=2.39µs  max=17.4ms   p(90)=3.78µs  p(95)=4.42µs   p(99.9)=35.74µs
     http_req_connecting............: avg=262ns   min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.98ms min=1.42ms  med=15.17ms max=278.3ms  p(90)=23.58ms p(95)=27.14ms  p(99.9)=47.64ms
       { expected_response:true }...: avg=15.98ms min=1.42ms  med=15.17ms max=278.3ms  p(90)=23.58ms p(95)=27.14ms  p(99.9)=47.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 370225
     http_req_receiving.............: avg=96.21µs min=25.26µs med=46.5µs  max=38.34ms  p(90)=88.2µs  p(95)=177.9µs  p(99.9)=8.33ms 
     http_req_sending...............: avg=51.05µs min=4.79µs  med=9.04µs  max=194.22ms p(90)=15.88µs p(95)=103.58µs p(99.9)=7.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.84ms min=1.37ms  med=15.05ms max=278.13ms p(90)=23.39ms p(95)=26.84ms  p(99.9)=46.18ms
     http_reqs......................: 370225  3080.604975/s
     iteration_duration.............: avg=16.2ms  min=2.01ms  med=15.37ms max=300.2ms  p(90)=23.79ms p(95)=27.38ms  p(99.9)=48.68ms
     iterations.....................: 370125  3079.772885/s
     success_rate...................: 100.00% ✓ 370125      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 991914      ✗ 0     
     data_received..................: 29 GB   241 MB/s
     data_sent......................: 397 MB  3.3 MB/s
     http_req_blocked...............: avg=3.24µs   min=972ns   med=2.38µs  max=11.18ms  p(90)=3.75µs  p(95)=4.4µs   p(99.9)=34.18µs
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.92ms  min=1.92ms  med=16.99ms max=284.25ms p(90)=25.97ms p(95)=29.6ms  p(99.9)=50.46ms
       { expected_response:true }...: avg=17.92ms  min=1.92ms  med=16.99ms max=284.25ms p(90)=25.97ms p(95)=29.6ms  p(99.9)=50.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 330738
     http_req_receiving.............: avg=467.18µs min=50.45µs med=92.76µs max=59.11ms  p(90)=1.14ms  p(95)=1.82ms  p(99.9)=18.28ms
     http_req_sending...............: avg=47.84µs  min=4.82µs  med=8.85µs  max=209.02ms p(90)=15.64µs p(95)=94.16µs p(99.9)=4.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.4ms   min=1.83ms  med=16.5ms  max=283.45ms p(90)=25.32ms p(95)=28.9ms  p(99.9)=48.95ms
     http_reqs......................: 330738  2750.609823/s
     iteration_duration.............: avg=18.13ms  min=3.21ms  med=17.2ms  max=309.97ms p(90)=26.18ms p(95)=29.83ms p(99.9)=51.24ms
     iterations.....................: 330638  2749.778165/s
     success_rate...................: 100.00% ✓ 330638      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 944799      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 379 MB  3.1 MB/s
     http_req_blocked...............: avg=2.85µs   min=852ns   med=2.15µs  max=12.34ms  p(90)=3.51µs  p(95)=4.13µs  p(99.9)=31.83µs 
     http_req_connecting............: avg=301ns    min=0s      med=0s      max=3.33ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.83ms  min=1.97ms  med=16.24ms max=276.17ms p(90)=30.56ms p(95)=36.88ms p(99.9)=124.25ms
       { expected_response:true }...: avg=18.83ms  min=1.97ms  med=16.24ms max=276.17ms p(90)=30.56ms p(95)=36.88ms p(99.9)=124.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315033
     http_req_receiving.............: avg=544.27µs min=50.91µs med=91.34µs max=147.14ms p(90)=1.04ms  p(95)=1.87ms  p(99.9)=24.05ms 
     http_req_sending...............: avg=45.7µs   min=4.13µs  med=8.42µs  max=126.93ms p(90)=14.78µs p(95)=89.32µs p(99.9)=5.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.24ms  min=1.88ms  med=15.73ms max=275.17ms p(90)=29.66ms p(95)=35.84ms p(99.9)=122.78ms
     http_reqs......................: 315033  2619.898063/s
     iteration_duration.............: avg=19.04ms  min=3.03ms  med=16.44ms max=294.98ms p(90)=30.78ms p(95)=37.13ms p(99.9)=125.13ms
     iterations.....................: 314933  2619.066436/s
     success_rate...................: 100.00% ✓ 314933      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 905691      ✗ 0     
     data_received..................: 27 GB   220 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=3.12µs   min=1.05µs  med=2.3µs   max=14.25ms  p(90)=3.56µs  p(95)=4.13µs  p(99.9)=33.8µs  
     http_req_connecting............: avg=312ns    min=0s      med=0s      max=4.2ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.65ms  min=2.01ms  med=16.91ms max=296.5ms  p(90)=31.92ms p(95)=38.64ms p(99.9)=120.84ms
       { expected_response:true }...: avg=19.65ms  min=2.01ms  med=16.91ms max=296.5ms  p(90)=31.92ms p(95)=38.64ms p(99.9)=120.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301997
     http_req_receiving.............: avg=583.11µs min=51.34µs med=94.74µs max=179.72ms p(90)=1.1ms   p(95)=1.97ms  p(99.9)=25.78ms 
     http_req_sending...............: avg=43.94µs  min=4.67µs  med=8.66µs  max=202.72ms p(90)=14.6µs  p(95)=85.39µs p(99.9)=4.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.02ms  min=1.89ms  med=16.37ms max=296.04ms p(90)=30.96ms p(95)=37.52ms p(99.9)=119.51ms
     http_reqs......................: 301997  2511.197211/s
     iteration_duration.............: avg=19.86ms  min=3.09ms  med=17.11ms max=307.04ms p(90)=32.14ms p(95)=38.87ms p(99.9)=122.25ms
     iterations.....................: 301897  2510.36568/s
     success_rate...................: 100.00% ✓ 301897      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 879660      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=5.05µs   min=1.05µs  med=2.3µs   max=55.64ms  p(90)=3.53µs  p(95)=4.08µs  p(99.9)=33.04µs 
     http_req_connecting............: avg=2.07µs   min=0s      med=0s      max=55.6ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.24ms  min=1.67ms  med=16.54ms max=275.44ms p(90)=34.63ms p(95)=43.5ms  p(99.9)=148.11ms
       { expected_response:true }...: avg=20.24ms  min=1.67ms  med=16.54ms max=275.44ms p(90)=34.63ms p(95)=43.5ms  p(99.9)=148.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293320
     http_req_receiving.............: avg=590.24µs min=50.68µs med=93.46µs max=143.88ms p(90)=1.07ms  p(95)=1.93ms  p(99.9)=29.11ms 
     http_req_sending...............: avg=44.8µs   min=4.4µs   med=8.71µs  max=203.03ms p(90)=14.64µs p(95)=57.05µs p(99.9)=3.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.6ms   min=1.58ms  med=16.01ms max=275.37ms p(90)=33.59ms p(95)=42.27ms p(99.9)=146.22ms
     http_reqs......................: 293320  2439.996868/s
     iteration_duration.............: avg=20.45ms  min=2.7ms   med=16.73ms max=321.73ms p(90)=34.85ms p(95)=43.73ms p(99.9)=148.95ms
     iterations.....................: 293220  2439.165013/s
     success_rate...................: 100.00% ✓ 293220      ✗ 0     
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

     checks.........................: 100.00% ✓ 775188      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=3.67µs  min=1.11µs  med=2.74µs  max=20.98ms  p(90)=4.33µs  p(95)=5.11µs   p(99.9)=39.12µs
     http_req_connecting............: avg=335ns   min=0s      med=0s      max=3.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.98ms min=1.74ms  med=22.72ms max=290.51ms p(90)=27.42ms p(95)=29.37ms  p(99.9)=50.13ms
       { expected_response:true }...: avg=22.98ms min=1.74ms  med=22.72ms max=290.51ms p(90)=27.42ms p(95)=29.37ms  p(99.9)=50.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258496
     http_req_receiving.............: avg=97.2µs  min=29.05µs med=57.93µs max=193.19ms p(90)=98.72µs p(95)=131.48µs p(99.9)=7ms    
     http_req_sending...............: avg=41.97µs min=5.06µs  med=11.28µs max=122.28ms p(90)=18.26µs p(95)=47.06µs  p(99.9)=2.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.84ms min=1.63ms  med=22.61ms max=284.42ms p(90)=27.27ms p(95)=29.17ms  p(99.9)=49.12ms
     http_reqs......................: 258496  2150.063551/s
     iteration_duration.............: avg=23.21ms min=3.06ms  med=22.92ms max=304.34ms p(90)=27.63ms p(95)=29.59ms  p(99.9)=50.74ms
     iterations.....................: 258396  2149.231792/s
     success_rate...................: 100.00% ✓ 258396      ✗ 0     
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

     checks.........................: 100.00% ✓ 470844      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 189 MB  1.6 MB/s
     http_req_blocked...............: avg=3.29µs  min=992ns   med=2.43µs  max=3.46ms   p(90)=3.91µs  p(95)=4.56µs   p(99.9)=32.66µs 
     http_req_connecting............: avg=546ns   min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.99ms min=2ms     med=37.64ms max=317.56ms p(90)=53.07ms p(95)=57.72ms  p(99.9)=78.8ms  
       { expected_response:true }...: avg=37.99ms min=2ms     med=37.64ms max=317.56ms p(90)=53.07ms p(95)=57.72ms  p(99.9)=78.8ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 157048
     http_req_receiving.............: avg=74.23µs min=25.83µs med=60.02µs max=171.19ms p(90)=95.97µs p(95)=111.99µs p(99.9)=856.22µs
     http_req_sending...............: avg=26.7µs  min=4.59µs  med=10.44µs max=192.14ms p(90)=16.84µs p(95)=20.8µs   p(99.9)=971.75µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.89ms min=1.87ms  med=37.54ms max=317.08ms p(90)=52.97ms p(95)=57.62ms  p(99.9)=78.29ms 
     http_reqs......................: 157048  1305.675631/s
     iteration_duration.............: avg=38.22ms min=3.67ms  med=37.85ms max=327.45ms p(90)=53.28ms p(95)=57.93ms  p(99.9)=79.1ms  
     iterations.....................: 156948  1304.844244/s
     success_rate...................: 100.00% ✓ 156948      ✗ 0     
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

     checks.........................: 100.00% ✓ 227727     ✗ 0    
     data_received..................: 6.7 GB  55 MB/s
     data_sent......................: 91 MB   758 kB/s
     http_req_blocked...............: avg=3.87µs   min=1.01µs  med=2.52µs  max=3.32ms   p(90)=4.01µs   p(95)=4.61µs   p(99.9)=42.81µs 
     http_req_connecting............: avg=1.07µs   min=0s      med=0s      max=3.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=78.71ms  min=3.56ms  med=77.29ms max=348.42ms p(90)=97.8ms   p(95)=107.04ms p(99.9)=186.96ms
       { expected_response:true }...: avg=78.71ms  min=3.56ms  med=77.29ms max=348.42ms p(90)=97.8ms   p(95)=107.04ms p(99.9)=186.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 76009
     http_req_receiving.............: avg=135.09µs min=29.85µs med=68.53µs max=282.49ms p(90)=106.35µs p(95)=119.91µs p(99.9)=829.72µs
     http_req_sending...............: avg=19.99µs  min=4.91µs  med=12.83µs max=58.43ms  p(90)=19.93µs  p(95)=22.12µs  p(99.9)=594.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.56ms  min=3.51ms  med=77.19ms max=239ms    p(90)=97.65ms  p(95)=106.85ms p(99.9)=184.52ms
     http_reqs......................: 76009   631.01125/s
     iteration_duration.............: avg=79.04ms  min=11.29ms med=77.53ms max=358.52ms p(90)=98.04ms  p(95)=107.32ms p(99.9)=187.76ms
     iterations.....................: 75909   630.181071/s
     success_rate...................: 100.00% ✓ 75909      ✗ 0    
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

     checks.........................: 100.00% ✓ 174810     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   581 kB/s
     http_req_blocked...............: avg=6.65µs   min=1.14µs  med=3µs      max=8.25ms   p(90)=4.47µs   p(95)=5µs      p(99.9)=56.02µs 
     http_req_connecting............: avg=3.39µs   min=0s      med=0s       max=8.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.56ms min=4.67ms  med=102.32ms max=318.79ms p(90)=123.33ms p(95)=129.42ms p(99.9)=159.85ms
       { expected_response:true }...: avg=102.56ms min=4.67ms  med=102.32ms max=318.79ms p(90)=123.33ms p(95)=129.42ms p(99.9)=159.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58370
     http_req_receiving.............: avg=86.07µs  min=29.94µs med=78.75µs  max=77.51ms  p(90)=110.26µs p(95)=123.33µs p(99.9)=550.38µs
     http_req_sending...............: avg=21.2µs   min=5.06µs  med=15.09µs  max=14.92ms  p(90)=20.47µs  p(95)=22.37µs  p(99.9)=1.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.45ms min=4.57ms  med=102.22ms max=315.82ms p(90)=123.23ms p(95)=129.3ms  p(99.9)=159.65ms
     http_reqs......................: 58370   484.060073/s
     iteration_duration.............: avg=102.99ms min=16.59ms med=102.59ms max=329.83ms p(90)=123.59ms p(95)=129.69ms p(99.9)=160.63ms
     iterations.....................: 58270   483.230777/s
     success_rate...................: 100.00% ✓ 58270      ✗ 0    
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

     checks.........................: 100.00% ✓ 101556     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.42µs   min=1.37µs  med=3.29µs   max=4.51ms   p(90)=4.57µs   p(95)=5.12µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=2.89µs   min=0s      med=0s       max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=176.57ms min=7.57ms  med=162.85ms max=401.37ms p(90)=278.46ms p(95)=287.21ms p(99.9)=347.16ms
       { expected_response:true }...: avg=176.57ms min=7.57ms  med=162.85ms max=401.37ms p(90)=278.46ms p(95)=287.21ms p(99.9)=347.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33952
     http_req_receiving.............: avg=82.69µs  min=34.95µs med=77.32µs  max=3.41ms   p(90)=109.5µs  p(95)=121.01µs p(99.9)=423.52µs
     http_req_sending...............: avg=21.72µs  min=5.86µs  med=15.54µs  max=27.08ms  p(90)=20.22µs  p(95)=22.06µs  p(99.9)=674.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.47ms min=7.42ms  med=162.59ms max=401.27ms p(90)=278.36ms p(95)=287.13ms p(99.9)=347.03ms
     http_reqs......................: 33952   280.729509/s
     iteration_duration.............: avg=177.34ms min=37.22ms med=172.35ms max=401.63ms p(90)=278.74ms p(95)=287.55ms p(99.9)=347.95ms
     iterations.....................: 33852   279.902667/s
     success_rate...................: 100.00% ✓ 33852      ✗ 0    
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

     checks.........................: 100.00% ✓ 99666      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   331 kB/s
     http_req_blocked...............: avg=5.99µs   min=1.49µs  med=3.49µs   max=3.4ms    p(90)=4.85µs   p(95)=5.47µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=2.12µs   min=0s      med=0s       max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=903.76µs
     http_req_duration..............: avg=179.92ms min=5.65ms  med=164.84ms max=624.02ms p(90)=209.36ms p(95)=251.19ms p(99.9)=548.46ms
       { expected_response:true }...: avg=179.92ms min=5.65ms  med=164.84ms max=624.02ms p(90)=209.36ms p(95)=251.19ms p(99.9)=548.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33322
     http_req_receiving.............: avg=94.04µs  min=37.78µs med=83.96µs  max=51.25ms  p(90)=114.41µs p(95)=125.97µs p(99.9)=987.99µs
     http_req_sending...............: avg=28.9µs   min=6.01µs  med=17.17µs  max=93.76ms  p(90)=21.96µs  p(95)=23.72µs  p(99.9)=511.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.79ms min=5.59ms  med=164.72ms max=623.93ms p(90)=209.2ms  p(95)=251.09ms p(99.9)=548.37ms
     http_reqs......................: 33322   275.558671/s
     iteration_duration.............: avg=180.71ms min=51.92ms med=165.17ms max=624.26ms p(90)=209.76ms p(95)=252.61ms p(99.9)=548.65ms
     iterations.....................: 33222   274.731714/s
     success_rate...................: 100.00% ✓ 33222      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
data_received..................: 957 kB 16 kB/s
     data_sent......................: 13 kB  220 B/s
     http_req_blocked...............: avg=19.11µs  min=2.97µs  med=3.91µs  max=156.76µs p(90)=20.23µs  p(95)=88.5µs   p(99.9)=155.39µs
     http_req_connecting............: avg=8.99µs   min=0s      med=0s      max=89.91µs  p(90)=8.99µs   p(95)=49.45µs  p(99.9)=89.1µs  
     http_req_duration..............: avg=3.03s    min=24.19ms med=31.8ms  max=30.03s   p(90)=3.04s    p(95)=16.53s   p(99.9)=29.76s  
       { expected_response:true }...: avg=3.03s    min=24.19ms med=31.8ms  max=30.03s   p(90)=3.04s    p(95)=16.53s   p(99.9)=29.76s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 10  
     http_req_receiving.............: avg=195.45µs min=83.23µs med=150.6µs max=367.46µs p(90)=317.13µs p(95)=342.29µs p(99.9)=366.95µs
     http_req_sending...............: avg=23.45µs  min=15.71µs med=20.02µs max=48.88µs  p(90)=31.94µs  p(95)=40.41µs  p(99.9)=48.71µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=3.03s    min=24.04ms med=31.56ms max=30.02s   p(90)=3.04s    p(95)=16.53s   p(99.9)=29.75s  
     http_reqs......................: 10     0.166664/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
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

     checks.........................: 100.00% ✓ 915153      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 367 MB  3.1 MB/s
     http_req_blocked...............: avg=3.03µs  min=902ns   med=2.22µs  max=14.85ms  p(90)=3.93µs  p(95)=4.72µs   p(99.9)=34.98µs
     http_req_connecting............: avg=318ns   min=0s      med=0s      max=3.81ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.44ms min=1.56ms  med=19.17ms max=292.88ms p(90)=26.96ms p(95)=29.31ms  p(99.9)=48.88ms
       { expected_response:true }...: avg=19.44ms min=1.56ms  med=19.17ms max=292.88ms p(90)=26.96ms p(95)=29.31ms  p(99.9)=48.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305151
     http_req_receiving.............: avg=89.35µs min=25.07µs med=50.12µs max=153.65ms p(90)=91.61µs p(95)=126.72µs p(99.9)=6.58ms 
     http_req_sending...............: avg=40.89µs min=4.59µs  med=9.34µs  max=114.61ms p(90)=17.32µs p(95)=67.11µs  p(99.9)=2.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.31ms min=1.46ms  med=19.07ms max=292.53ms p(90)=26.82ms p(95)=29.12ms  p(99.9)=47.61ms
     http_reqs......................: 305151  2538.800018/s
     iteration_duration.............: avg=19.65ms min=3.01ms  med=19.37ms max=302.72ms p(90)=27.16ms p(95)=29.52ms  p(99.9)=49.36ms
     iterations.....................: 305051  2537.968036/s
     success_rate...................: 100.00% ✓ 305051      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 883869      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 354 MB  2.9 MB/s
     http_req_blocked...............: avg=2.93µs   min=871ns   med=2.05µs  max=18.14ms  p(90)=3.57µs  p(95)=4.29µs  p(99.9)=30.66µs
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=3.6ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.13ms  min=1.58ms  med=19.35ms max=267.94ms p(90)=29.06ms p(95)=32.56ms p(99.9)=52.6ms 
       { expected_response:true }...: avg=20.13ms  min=1.58ms  med=19.35ms max=267.94ms p(90)=29.06ms p(95)=32.56ms p(99.9)=52.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 294723
     http_req_receiving.............: avg=560.89µs min=50.85µs med=104.8µs max=92.67ms  p(90)=1.4ms   p(95)=2.15ms  p(99.9)=17.84ms
     http_req_sending...............: avg=40.37µs  min=4.62µs  med=8.68µs  max=146.01ms p(90)=17.85µs p(95)=75.18µs p(99.9)=3.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.53ms  min=1.48ms  med=18.74ms max=267.07ms p(90)=28.32ms p(95)=31.8ms  p(99.9)=50.83ms
     http_reqs......................: 294723  2451.720015/s
     iteration_duration.............: avg=20.35ms  min=2.78ms  med=19.55ms max=337.29ms p(90)=29.27ms p(95)=32.79ms p(99.9)=53.4ms 
     iterations.....................: 294623  2450.888142/s
     success_rate...................: 100.00% ✓ 294623      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 853017      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=2.88µs   min=822ns   med=2.01µs  max=16.59ms  p(90)=3.32µs  p(95)=3.96µs  p(99.9)=30.81µs 
     http_req_connecting............: avg=299ns    min=0s      med=0s      max=3.46ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.87ms  min=1.64ms  med=17.24ms max=402.16ms p(90)=34.43ms p(95)=42.58ms p(99.9)=162.55ms
       { expected_response:true }...: avg=20.87ms  min=1.64ms  med=17.24ms max=402.16ms p(90)=34.43ms p(95)=42.58ms p(99.9)=162.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284439
     http_req_receiving.............: avg=604.92µs min=50.79µs med=97.05µs max=153.05ms p(90)=1.12ms  p(95)=1.92ms  p(99.9)=30.12ms 
     http_req_sending...............: avg=41.74µs  min=4.34µs  med=8.67µs  max=198.69ms p(90)=15.86µs p(95)=65.42µs p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.23ms  min=1.5ms   med=16.7ms  max=401.97ms p(90)=33.39ms p(95)=41.35ms p(99.9)=161.35ms
     http_reqs......................: 284439  2366.235162/s
     iteration_duration.............: avg=21.09ms  min=2.53ms  med=17.44ms max=402.31ms p(90)=34.65ms p(95)=42.81ms p(99.9)=163.58ms
     iterations.....................: 284339  2365.403267/s
     success_rate...................: 100.00% ✓ 284339      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 850374      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 341 MB  2.8 MB/s
     http_req_blocked...............: avg=3.38µs  min=1µs     med=2.59µs   max=7.21ms   p(90)=4.1µs   p(95)=4.8µs   p(99.9)=38.19µs 
     http_req_connecting............: avg=329ns   min=0s      med=0s       max=3.87ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.93ms min=1.6ms   med=17.35ms  max=286.66ms p(90)=34.54ms p(95)=42.65ms p(99.9)=157.09ms
       { expected_response:true }...: avg=20.93ms min=1.6ms   med=17.35ms  max=286.66ms p(90)=34.54ms p(95)=42.65ms p(99.9)=157.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 283558
     http_req_receiving.............: avg=614.9µs min=53.71µs med=101.15µs max=205.13ms p(90)=1.12ms  p(95)=1.95ms  p(99.9)=29.56ms 
     http_req_sending...............: avg=45.62µs min=4.91µs  med=10.08µs  max=91.13ms  p(90)=18.45µs p(95)=90.67µs p(99.9)=4.32ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.27ms min=1.5ms   med=16.8ms   max=286.58ms p(90)=33.45ms p(95)=41.43ms p(99.9)=153.8ms 
     http_reqs......................: 283558  2358.751999/s
     iteration_duration.............: avg=21.15ms min=2.5ms   med=17.56ms  max=292.52ms p(90)=34.76ms p(95)=42.89ms p(99.9)=158.39ms
     iterations.....................: 283458  2357.920157/s
     success_rate...................: 100.00% ✓ 283458      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 821907      ✗ 0     
     data_received..................: 24 GB   200 MB/s
     data_sent......................: 329 MB  2.7 MB/s
     http_req_blocked...............: avg=3µs      min=911ns   med=2.23µs  max=12.74ms  p(90)=3.97µs  p(95)=4.73µs  p(99.9)=34.49µs 
     http_req_connecting............: avg=255ns    min=0s      med=0s      max=3.39ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.66ms  min=1.89ms  med=18.28ms max=582.27ms p(90)=35.21ms p(95)=43.37ms p(99.9)=149.26ms
       { expected_response:true }...: avg=21.66ms  min=1.89ms  med=18.28ms max=582.27ms p(90)=35.21ms p(95)=43.37ms p(99.9)=149.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 274069
     http_req_receiving.............: avg=587.11µs min=50.35µs med=98.18µs max=189.19ms p(90)=1.1ms   p(95)=1.9ms   p(99.9)=27.52ms 
     http_req_sending...............: avg=41.87µs  min=4.83µs  med=9.36µs  max=166.52ms p(90)=18.78µs p(95)=72.85µs p(99.9)=3.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.03ms  min=1.81ms  med=17.74ms max=581.9ms  p(90)=34.24ms p(95)=42.24ms p(99.9)=144.75ms
     http_reqs......................: 274069  2279.28422/s
     iteration_duration.............: avg=21.89ms  min=3.24ms  med=18.49ms max=582.5ms  p(90)=35.43ms p(95)=43.61ms p(99.9)=149.75ms
     iterations.....................: 273969  2278.452574/s
     success_rate...................: 100.00% ✓ 273969      ✗ 0     
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

     checks.........................: 100.00% ✓ 604623      ✗ 0     
     data_received..................: 18 GB   147 MB/s
     data_sent......................: 242 MB  2.0 MB/s
     http_req_blocked...............: avg=3.36µs  min=832ns   med=2.22µs  max=3.87ms   p(90)=4.53µs   p(95)=5.65µs   p(99.9)=43.84µs
     http_req_connecting............: avg=510ns   min=0s      med=0s      max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.52ms min=2.27ms  med=29.03ms max=294.75ms p(90)=39.27ms  p(95)=42.6ms   p(99.9)=64.37ms
       { expected_response:true }...: avg=29.52ms min=2.27ms  med=29.03ms max=294.75ms p(90)=39.27ms  p(95)=42.6ms   p(99.9)=64.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 201641
     http_req_receiving.............: avg=97.48µs min=27.58µs med=53.73µs max=65.98ms  p(90)=124.87µs p(95)=210.42µs p(99.9)=5.07ms 
     http_req_sending...............: avg=43.43µs min=4.39µs  med=9.55µs  max=141.6ms  p(90)=24.67µs  p(95)=112.72µs p(99.9)=3.48ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.38ms min=2.14ms  med=28.9ms  max=294.32ms p(90)=39.11ms  p(95)=42.41ms  p(99.9)=63.88ms
     http_reqs......................: 201641  1676.361964/s
     iteration_duration.............: avg=29.76ms min=3.56ms  med=29.25ms max=312.01ms p(90)=39.49ms  p(95)=42.83ms  p(99.9)=64.89ms
     iterations.....................: 201541  1675.530604/s
     success_rate...................: 100.00% ✓ 201541      ✗ 0     
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

     checks.........................: 100.00% ✓ 427275      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.17µs  min=972ns   med=2.17µs  max=3.51ms   p(90)=3.58µs   p(95)=4.23µs   p(99.9)=35.58µs 
     http_req_connecting............: avg=669ns   min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.87ms min=2.1ms   med=41.46ms max=283.59ms p(90)=58.37ms  p(95)=63.49ms  p(99.9)=87.43ms 
       { expected_response:true }...: avg=41.87ms min=2.1ms   med=41.46ms max=283.59ms p(90)=58.37ms  p(95)=63.49ms  p(99.9)=87.43ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142525
     http_req_receiving.............: avg=76.24µs min=28.43µs med=64.53µs max=76.12ms  p(90)=102.54µs p(95)=118.89µs p(99.9)=724.74µs
     http_req_sending...............: avg=23.18µs min=4.83µs  med=10.75µs max=174.16ms p(90)=17.15µs  p(95)=20.72µs  p(99.9)=860.83µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.78ms min=2.04ms  med=41.36ms max=283.06ms p(90)=58.27ms  p(95)=63.39ms  p(99.9)=87.18ms 
     http_reqs......................: 142525  1184.867624/s
     iteration_duration.............: avg=42.12ms min=4.32ms  med=41.67ms max=305.16ms p(90)=58.58ms  p(95)=63.7ms   p(99.9)=88.11ms 
     iterations.....................: 142425  1184.036284/s
     success_rate...................: 100.00% ✓ 142425      ✗ 0     
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

     checks.........................: 100.00% ✓ 210567     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 84 MB   700 kB/s
     http_req_blocked...............: avg=4.93µs  min=1.16µs  med=3.27µs  max=3.59ms   p(90)=4.78µs   p(95)=5.44µs   p(99.9)=42.94µs 
     http_req_connecting............: avg=1.39µs  min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.11ms min=3.81ms  med=83.18ms max=325.34ms p(90)=103.9ms  p(95)=113.83ms p(99.9)=196.84ms
       { expected_response:true }...: avg=85.11ms min=3.81ms  med=83.18ms max=325.34ms p(90)=103.9ms  p(95)=113.83ms p(99.9)=196.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70289
     http_req_receiving.............: avg=86.62µs min=29.85µs med=77.46µs max=129.25ms p(90)=114.53µs p(95)=128.74µs p(99.9)=642.23µs
     http_req_sending...............: avg=29.39µs min=5.51µs  med=15.84µs max=88.7ms   p(90)=22.54µs  p(95)=24.81µs  p(99.9)=668.44µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.99ms min=3.7ms   med=83.07ms max=324.86ms p(90)=103.78ms p(95)=113.69ms p(99.9)=195.67ms
     http_reqs......................: 70289   583.185615/s
     iteration_duration.............: avg=85.49ms min=20.42ms med=83.44ms max=341.73ms p(90)=104.18ms p(95)=114.14ms p(99.9)=200.29ms
     iterations.....................: 70189   582.355918/s
     success_rate...................: 100.00% ✓ 70189      ✗ 0    
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

     checks.........................: 100.00% ✓ 148419     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   493 kB/s
     http_req_blocked...............: avg=5.85µs   min=1.38µs  med=3.68µs   max=3.83ms   p(90)=5.18µs   p(95)=5.76µs   p(99.9)=526.08µs
     http_req_connecting............: avg=1.92µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=339.53µs
     http_req_duration..............: avg=120.79ms min=5.48ms  med=118.47ms max=309.55ms p(90)=160.07ms p(95)=172.4ms  p(99.9)=224.04ms
       { expected_response:true }...: avg=120.79ms min=5.48ms  med=118.47ms max=309.55ms p(90)=160.07ms p(95)=172.4ms  p(99.9)=224.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49573
     http_req_receiving.............: avg=91.47µs  min=34.46µs med=85.43µs  max=77.93ms  p(90)=116.77µs p(95)=129.44µs p(99.9)=614.78µs
     http_req_sending...............: avg=26.8µs   min=5.74µs  med=17.72µs  max=111.36ms p(90)=22.87µs  p(95)=24.7µs   p(99.9)=588.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.67ms min=5.34ms  med=118.36ms max=308.92ms p(90)=159.97ms p(95)=172.31ms p(99.9)=223.78ms
     http_reqs......................: 49573   410.737461/s
     iteration_duration.............: avg=121.31ms min=23.46ms med=118.8ms  max=340.96ms p(90)=160.35ms p(95)=172.76ms p(99.9)=226.78ms
     iterations.....................: 49473   409.90891/s
     success_rate...................: 100.00% ✓ 49473      ✗ 0    
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

     checks.........................: 100.00% ✓ 97068      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   322 kB/s
     http_req_blocked...............: avg=6.43µs   min=1.15µs  med=3.23µs   max=3.49ms   p(90)=4.6µs    p(95)=5.17µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=2.96µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=184.66ms min=7.76ms  med=187.45ms max=405.59ms p(90)=205.85ms p(95)=210.23ms p(99.9)=280.1ms 
       { expected_response:true }...: avg=184.66ms min=7.76ms  med=187.45ms max=405.59ms p(90)=205.85ms p(95)=210.23ms p(99.9)=280.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32456
     http_req_receiving.............: avg=156.67µs min=31.98µs med=89.47µs  max=178.79ms p(90)=119.2µs  p(95)=130.86µs p(99.9)=1.08ms  
     http_req_sending...............: avg=24.23µs  min=5.08µs  med=17.22µs  max=68.13ms  p(90)=21.59µs  p(95)=23.48µs  p(99.9)=442.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.48ms min=7.66ms  med=187.34ms max=289.73ms p(90)=205.74ms p(95)=210.12ms p(99.9)=276.56ms
     http_reqs......................: 32456   268.296232/s
     iteration_duration.............: avg=185.52ms min=28.5ms  med=187.8ms  max=413.33ms p(90)=206.15ms p(95)=210.53ms p(99.9)=281.13ms
     iterations.....................: 32356   267.469586/s
     success_rate...................: 100.00% ✓ 32356      ✗ 0    
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

     checks.........................: 100.00% ✓ 94164      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=7.13µs   min=1.48µs  med=3.69µs   max=3.5ms    p(90)=5.08µs   p(95)=5.69µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=3.17µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=190.37ms min=6.21ms  med=176.8ms  max=660.89ms p(90)=212.93ms p(95)=266.19ms p(99.9)=548.05ms
       { expected_response:true }...: avg=190.37ms min=6.21ms  med=176.8ms  max=660.89ms p(90)=212.93ms p(95)=266.19ms p(99.9)=548.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31488
     http_req_receiving.............: avg=99.39µs  min=36.75µs med=90.75µs  max=147.94ms p(90)=120.71µs p(95)=132.65µs p(99.9)=604.95µs
     http_req_sending...............: avg=35.1µs   min=6.42µs  med=18.78µs  max=97.85ms  p(90)=23.47µs  p(95)=25.32µs  p(99.9)=527.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.24ms min=6.08ms  med=176.69ms max=660.81ms p(90)=212.82ms p(95)=265.9ms  p(99.9)=547.93ms
     http_reqs......................: 31488   260.530424/s
     iteration_duration.............: avg=191.25ms min=55.37ms med=177.15ms max=661.13ms p(90)=213.35ms p(95)=268.43ms p(99.9)=548.36ms
     iterations.....................: 31388   259.703028/s
     success_rate...................: 100.00% ✓ 31388      ✗ 0    
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

     checks.........................: 100.00% ✓ 8700      ✗ 0   
     data_received..................: 287 MB  2.3 MB/s
     data_sent......................: 3.6 MB  29 kB/s
     http_req_blocked...............: avg=65.91µs  min=1.22µs  med=3.73µs  max=6.95ms p(90)=5.39µs   p(95)=6.39µs   p(99.9)=6.72ms  
     http_req_connecting............: avg=58.52µs  min=0s      med=0s      max=6.92ms p(90)=0s       p(95)=0s       p(99.9)=6.56ms  
     http_req_duration..............: avg=2.01s    min=26.59ms med=2.06s   max=4.08s  p(90)=2.74s    p(95)=2.95s    p(99.9)=3.91s   
       { expected_response:true }...: avg=2.01s    min=26.59ms med=2.06s   max=4.08s  p(90)=2.74s    p(95)=2.95s    p(99.9)=3.91s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 3000
     http_req_receiving.............: avg=104.15µs min=33.91µs med=96.76µs max=3.06ms p(90)=138.59µs p(95)=158.26µs p(99.9)=782.38µs
     http_req_sending...............: avg=68.15µs  min=7.02µs  med=20.07µs max=16.3ms p(90)=25.3µs   p(95)=29.09µs  p(99.9)=3.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.01s    min=26.41ms med=2.06s   max=4.08s  p(90)=2.74s    p(95)=2.95s    p(99.9)=3.91s   
     http_reqs......................: 3000    23.895465/s
     iteration_duration.............: avg=2.08s    min=205.3ms med=2.09s   max=4.08s  p(90)=2.75s    p(95)=2.97s    p(99.9)=3.91s   
     iterations.....................: 2900    23.098949/s
     success_rate...................: 100.00% ✓ 2900      ✗ 0   
     vus............................: 39      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

