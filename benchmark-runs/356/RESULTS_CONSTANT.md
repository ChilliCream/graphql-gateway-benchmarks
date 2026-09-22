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
| hive-router | v0.0.84 | 2,917 | 3,227 | 2,809 | 4.6% |  |
| fusion-nightly-net11 | 16.7.0-p.9 | 2,736 | 2,859 | 2,727 | 1.7% |  |
| fusion | 16.6.6 | 2,627 | 2,761 | 2,592 | 2.2% |  |
| fusion-nightly | 16.7.0-p.9 | 2,592 | 2,715 | 2,583 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.9 | 2,396 | 2,469 | 2,379 | 1.3% |  |
| grafbase | 0.53.5 | 2,142 | 2,259 | 2,125 | 2.2% |  |
| cosmo | 0.334.0 | 1,263 | 1,315 | 1,253 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.8 | 620 | 639 | 616 | 1.1% |  |
| apollo-router | v2.16.1 | 442 | 464 | 437 | 2.1% |  |
| apollo-gateway | 2.14.3 | 285 | 287 | 283 | 0.4% |  |
| hive-gateway | 2.10.8 | 272 | 282 | 271 | 1.6% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1117 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.9 | 2,505 | 2,630 | 2,494 | 2.0% |  |
| hive-router | v0.0.84 | 2,463 | 2,669 | 2,430 | 3.6% |  |
| fusion | 16.6.6 | 2,393 | 2,501 | 2,382 | 1.7% |  |
| fusion-nightly | 16.7.0-p.9 | 2,361 | 2,479 | 2,348 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.9 | 2,210 | 2,314 | 2,199 | 1.8% |  |
| grafbase | 0.53.5 | 1,648 | 1,706 | 1,645 | 1.4% |  |
| cosmo | 0.334.0 | 1,226 | 1,272 | 1,222 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 589 | 609 | 583 | 1.4% |  |
| apollo-router | v2.16.1 | 449 | 466 | 448 | 1.6% |  |
| hive-gateway | 2.10.8 | 264 | 271 | 262 | 1.1% |  |
| apollo-gateway | 2.14.3 | 258 | 265 | 258 | 0.9% |  |
| feddi | 5ff8b6165878 | 19 | 20 | 19 | 1.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1051443     ✗ 0     
     data_received..................: 31 GB   256 MB/s
     data_sent......................: 421 MB  3.5 MB/s
     http_req_blocked...............: avg=2.96µs  min=922ns   med=2.28µs  max=17.5ms   p(90)=3.57µs  p(95)=4.15µs   p(99.9)=32.49µs
     http_req_connecting............: avg=242ns   min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.91ms min=1.46ms  med=16.39ms max=286.39ms p(90)=24.64ms p(95)=27.59ms  p(99.9)=46.63ms
       { expected_response:true }...: avg=16.91ms min=1.46ms  med=16.39ms max=286.39ms p(90)=24.64ms p(95)=27.59ms  p(99.9)=46.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 350581
     http_req_receiving.............: avg=82.69µs min=24.68µs med=46.06µs max=116.33ms p(90)=80.93µs p(95)=130.71µs p(99.9)=6.58ms 
     http_req_sending...............: avg=41.84µs min=4.52µs  med=8.46µs  max=186.09ms p(90)=14.3µs  p(95)=87.82µs  p(99.9)=2.99ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.78ms min=1.38ms  med=16.29ms max=257.83ms p(90)=24.5ms  p(95)=27.4ms   p(99.9)=45.77ms
     http_reqs......................: 350581  2917.123129/s
     iteration_duration.............: avg=17.11ms min=2.01ms  med=16.58ms max=308.19ms p(90)=24.84ms p(95)=27.8ms   p(99.9)=47.2ms 
     iterations.....................: 350481  2916.291046/s
     success_rate...................: 100.00% ✓ 350481      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 986814      ✗ 0     
     data_received..................: 29 GB   240 MB/s
     data_sent......................: 395 MB  3.3 MB/s
     http_req_blocked...............: avg=3.22µs  min=1.03µs med=2.32µs   max=17.37ms  p(90)=3.62µs  p(95)=4.25µs  p(99.9)=33.63µs
     http_req_connecting............: avg=268ns   min=0s     med=0s       max=3.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.02ms min=1.9ms  med=16.92ms  max=291.56ms p(90)=25.84ms p(95)=29.55ms p(99.9)=51.19ms
       { expected_response:true }...: avg=18.02ms min=1.9ms  med=16.92ms  max=291.56ms p(90)=25.84ms p(95)=29.55ms p(99.9)=51.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 329038
     http_req_receiving.............: avg=1.02ms  min=50.4µs med=117.03µs max=135.67ms p(90)=2.64ms  p(95)=3.68ms  p(99.9)=24.9ms 
     http_req_sending...............: avg=46.75µs min=4.63µs med=8.59µs   max=241.65ms p(90)=15.47µs p(95)=90.45µs p(99.9)=5.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=16.94ms min=1.81ms med=15.83ms  max=290.91ms p(90)=24.51ms p(95)=28.18ms p(99.9)=48.78ms
     http_reqs......................: 329038  2736.165466/s
     iteration_duration.............: avg=18.23ms min=3.32ms med=17.12ms  max=305.83ms p(90)=26.05ms p(95)=29.8ms  p(99.9)=51.85ms
     iterations.....................: 328938  2735.333901/s
     success_rate...................: 100.00% ✓ 328938      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 947772      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=2.82µs   min=902ns   med=1.91µs  max=19.53ms  p(90)=3.06µs  p(95)=3.63µs  p(99.9)=29.73µs 
     http_req_connecting............: avg=281ns    min=0s      med=0s      max=3.46ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.77ms  min=1.99ms  med=16.23ms max=290.31ms p(90)=30.43ms p(95)=36.72ms p(99.9)=112.7ms 
       { expected_response:true }...: avg=18.77ms  min=1.99ms  med=16.23ms max=290.31ms p(90)=30.43ms p(95)=36.72ms p(99.9)=112.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 316024
     http_req_receiving.............: avg=545.95µs min=50.31µs med=86.12µs max=174.65ms p(90)=1.07ms  p(95)=1.95ms  p(99.9)=24.33ms 
     http_req_sending...............: avg=43.74µs  min=4.44µs  med=8.08µs  max=82.15ms  p(90)=14.19µs p(95)=79.57µs p(99.9)=5.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.18ms  min=1.91ms  med=15.72ms max=289.66ms p(90)=29.52ms p(95)=35.7ms  p(99.9)=111.87ms
     http_reqs......................: 316024  2627.609082/s
     iteration_duration.............: avg=18.98ms  min=3.24ms  med=16.43ms max=301.29ms p(90)=30.66ms p(95)=36.97ms p(99.9)=113.5ms 
     iterations.....................: 315924  2626.777623/s
     success_rate...................: 100.00% ✓ 315924      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 934935      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=2.67µs   min=791ns   med=1.94µs  max=17ms     p(90)=3.25µs  p(95)=3.88µs  p(99.9)=29.51µs 
     http_req_connecting............: avg=278ns    min=0s      med=0s      max=3.57ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.03ms  min=2.08ms  med=16.45ms max=298.9ms  p(90)=30.69ms p(95)=37.12ms p(99.9)=120.78ms
       { expected_response:true }...: avg=19.03ms  min=2.08ms  med=16.45ms max=298.9ms  p(90)=30.69ms p(95)=37.12ms p(99.9)=120.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311745
     http_req_receiving.............: avg=550.48µs min=49.61µs med=89.81µs max=178.83ms p(90)=1.06ms  p(95)=1.89ms  p(99.9)=24.72ms 
     http_req_sending...............: avg=44.5µs   min=4.51µs  med=8.21µs  max=208.73ms p(90)=15.28µs p(95)=83.69µs p(99.9)=3.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.43ms  min=1.94ms  med=15.92ms max=298.38ms p(90)=29.77ms p(95)=36.05ms p(99.9)=119.41ms
     http_reqs......................: 311745  2592.253271/s
     iteration_duration.............: avg=19.24ms  min=3.15ms  med=16.65ms max=309.37ms p(90)=30.91ms p(95)=37.36ms p(99.9)=121.38ms
     iterations.....................: 311645  2591.421741/s
     success_rate...................: 100.00% ✓ 311645      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 864024      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.52µs   min=892ns   med=1.89µs  max=6.05ms   p(90)=2.98µs  p(95)=3.53µs  p(99.9)=30.73µs 
     http_req_connecting............: avg=316ns    min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.62ms  min=1.7ms   med=16.83ms max=348.82ms p(90)=35.11ms p(95)=44.22ms p(99.9)=156.5ms 
       { expected_response:true }...: avg=20.62ms  min=1.7ms   med=16.83ms max=348.82ms p(90)=35.11ms p(95)=44.22ms p(99.9)=156.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 288108
     http_req_receiving.............: avg=602.65µs min=50.43µs med=94.22µs max=167.78ms p(90)=1.12ms  p(95)=1.94ms  p(99.9)=29.17ms 
     http_req_sending...............: avg=37.06µs  min=4.58µs  med=8.24µs  max=156.04ms p(90)=14.3µs  p(95)=42.81µs p(99.9)=2.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.98ms  min=1.6ms   med=16.29ms max=348.73ms p(90)=34.06ms p(95)=43.06ms p(99.9)=154.95ms
     http_reqs......................: 288108  2396.520576/s
     iteration_duration.............: avg=20.82ms  min=2.65ms  med=17.02ms max=349ms    p(90)=35.31ms p(95)=44.43ms p(99.9)=157.12ms
     iterations.....................: 288008  2395.688763/s
     success_rate...................: 100.00% ✓ 288008      ✗ 0     
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

     checks.........................: 100.00% ✓ 772329      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.3µs   min=952ns   med=2.52µs  max=10.88ms  p(90)=4.2µs   p(95)=4.99µs   p(99.9)=38.55µs
     http_req_connecting............: avg=356ns   min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.07ms min=1.7ms   med=22.83ms max=296.25ms p(90)=27.48ms p(95)=29.39ms  p(99.9)=48.81ms
       { expected_response:true }...: avg=23.07ms min=1.7ms   med=22.83ms max=296.25ms p(90)=27.48ms p(95)=29.39ms  p(99.9)=48.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257543
     http_req_receiving.............: avg=93.35µs min=28.38µs med=57.43µs max=125.85ms p(90)=97.8µs  p(95)=128.61µs p(99.9)=6.45ms 
     http_req_sending...............: avg=39.13µs min=4.97µs  med=10.42µs max=142.23ms p(90)=17.89µs p(95)=35.93µs  p(99.9)=2.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.94ms min=1.65ms  med=22.73ms max=295.6ms  p(90)=27.34ms p(95)=29.2ms   p(99.9)=47.42ms
     http_reqs......................: 257543  2142.117421/s
     iteration_duration.............: avg=23.29ms min=3.61ms  med=23.03ms max=306.28ms p(90)=27.68ms p(95)=29.61ms  p(99.9)=49.43ms
     iterations.....................: 257443  2141.28567/s
     success_rate...................: 100.00% ✓ 257443      ✗ 0     
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

     checks.........................: 100.00% ✓ 455514      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.31µs  min=1.09µs  med=2.42µs  max=4.11ms   p(90)=3.72µs  p(95)=4.3µs   p(99.9)=35.26µs 
     http_req_connecting............: avg=600ns   min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=39.28ms min=1.99ms  med=38.85ms max=305.91ms p(90)=54.96ms p(95)=59.95ms p(99.9)=84.57ms 
       { expected_response:true }...: avg=39.28ms min=1.99ms  med=38.85ms max=305.91ms p(90)=54.96ms p(95)=59.95ms p(99.9)=84.57ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 151938
     http_req_receiving.............: avg=73.25µs min=27.06µs med=58.48µs max=230.42ms p(90)=93.07µs p(95)=108.6µs p(99.9)=799.61µs
     http_req_sending...............: avg=23.06µs min=4.82µs  med=10.13µs max=91.26ms  p(90)=15.27µs p(95)=18.73µs p(99.9)=885.04µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=39.18ms min=1.93ms  med=38.77ms max=280.78ms p(90)=54.86ms p(95)=59.85ms p(99.9)=84.07ms 
     http_reqs......................: 151938  1263.215657/s
     iteration_duration.............: avg=39.51ms min=3.77ms  med=39.05ms max=319.53ms p(90)=55.17ms p(95)=60.15ms p(99.9)=85.06ms 
     iterations.....................: 151838  1262.384255/s
     success_rate...................: 100.00% ✓ 151838      ✗ 0     
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

     checks.........................: 100.00% ✓ 223851     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   745 kB/s
     http_req_blocked...............: avg=4.32µs  min=1.06µs  med=2.92µs  max=3.38ms   p(90)=4.44µs   p(95)=5.1µs    p(99.9)=51.2µs  
     http_req_connecting............: avg=1.12µs  min=0s      med=0s      max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.06ms min=3.72ms  med=79.22ms max=320.1ms  p(90)=100.96ms p(95)=110.68ms p(99.9)=188.12ms
       { expected_response:true }...: avg=80.06ms min=3.72ms  med=79.22ms max=320.1ms  p(90)=100.96ms p(95)=110.68ms p(99.9)=188.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74717
     http_req_receiving.............: avg=79.97µs min=26.39µs med=69.64µs max=67.54ms  p(90)=106.27µs p(95)=119.99µs p(99.9)=655.98µs
     http_req_sending...............: avg=25.14µs min=4.99µs  med=13.45µs max=108.61ms p(90)=20.37µs  p(95)=22.66µs  p(99.9)=614.59µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.96ms min=3.6ms   med=79.12ms max=319.48ms p(90)=100.86ms p(95)=110.57ms p(99.9)=187.47ms
     http_reqs......................: 74717   620.086401/s
     iteration_duration.............: avg=80.42ms min=12.55ms med=79.47ms max=329.92ms p(90)=101.23ms p(95)=110.98ms p(99.9)=190.81ms
     iterations.....................: 74617   619.256488/s
     success_rate...................: 100.00% ✓ 74617      ✗ 0    
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

     checks.........................: 100.00% ✓ 159666     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   531 kB/s
     http_req_blocked...............: avg=5.09µs   min=1.21µs  med=3.21µs   max=3.88ms   p(90)=4.56µs   p(95)=5.1µs    p(99.9)=68.04µs 
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.3ms  min=4.56ms  med=112.04ms max=296.93ms p(90)=135.76ms p(95)=142.85ms p(99.9)=174.79ms
       { expected_response:true }...: avg=112.3ms  min=4.56ms  med=112.04ms max=296.93ms p(90)=135.76ms p(95)=142.85ms p(99.9)=174.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53322
     http_req_receiving.............: avg=79.24µs  min=30.98µs med=72.49µs  max=48.81ms  p(90)=103.58µs p(95)=115.94µs p(99.9)=517.48µs
     http_req_sending...............: avg=27.16µs  min=5.65µs  med=15.16µs  max=147.26ms p(90)=20.55µs  p(95)=22.36µs  p(99.9)=556.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.19ms min=4.5ms   med=111.94ms max=295.11ms p(90)=135.67ms p(95)=142.75ms p(99.9)=174.39ms
     http_reqs......................: 53322   442.124291/s
     iteration_duration.............: avg=112.76ms min=24.42ms med=112.32ms max=330.1ms  p(90)=136.02ms p(95)=143.16ms p(99.9)=177.72ms
     iterations.....................: 53222   441.295132/s
     success_rate...................: 100.00% ✓ 53222      ✗ 0    
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

     checks.........................: 100.00% ✓ 103149     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=6.36µs   min=1.29µs  med=3.39µs   max=3.4ms    p(90)=4.72µs   p(95)=5.26µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.66µs   min=0s      med=0s       max=3.36ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=173.85ms min=7.26ms  med=173.9ms  max=357.59ms p(90)=198.02ms p(95)=202.43ms p(99.9)=262.11ms
       { expected_response:true }...: avg=173.85ms min=7.26ms  med=173.9ms  max=357.59ms p(90)=198.02ms p(95)=202.43ms p(99.9)=262.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34483
     http_req_receiving.............: avg=93.3µs   min=33µs    med=85.92µs  max=103.32ms p(90)=117.07µs p(95)=128.79µs p(99.9)=547.74µs
     http_req_sending...............: avg=30.8µs   min=5.68µs  med=16.64µs  max=110.15ms p(90)=21.34µs  p(95)=23.05µs  p(99.9)=527.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.73ms min=7.14ms  med=173.79ms max=356.98ms p(90)=197.92ms p(95)=202.32ms p(99.9)=261.85ms
     http_reqs......................: 34483   285.094935/s
     iteration_duration.............: avg=174.62ms min=26.16ms med=174.22ms max=371.66ms p(90)=198.29ms p(95)=202.76ms p(99.9)=263.47ms
     iterations.....................: 34383   284.268165/s
     success_rate...................: 100.00% ✓ 34383      ✗ 0    
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

     checks.........................: 100.00% ✓ 98292      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.87µs   min=1.47µs  med=3.48µs   max=4.18ms   p(90)=4.81µs   p(95)=5.4µs    p(99.9)=1.6ms   
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=182.4ms  min=5.83ms  med=166.93ms max=677.47ms p(90)=208.73ms p(95)=247.43ms p(99.9)=595.7ms 
       { expected_response:true }...: avg=182.4ms  min=5.83ms  med=166.93ms max=677.47ms p(90)=208.73ms p(95)=247.43ms p(99.9)=595.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32864
     http_req_receiving.............: avg=90.16µs  min=35.95µs med=86.56µs  max=6.39ms   p(90)=116.32µs p(95)=127.38µs p(99.9)=553.56µs
     http_req_sending...............: avg=26.88µs  min=5.85µs  med=17.76µs  max=70.56ms  p(90)=22.37µs  p(95)=24.13µs  p(99.9)=536.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.28ms min=5.7ms   med=166.81ms max=677.34ms p(90)=208.62ms p(95)=247.32ms p(99.9)=595.6ms 
     http_reqs......................: 32864   272.000901/s
     iteration_duration.............: avg=183.21ms min=63.13ms med=167.26ms max=677.74ms p(90)=209.12ms p(95)=248.31ms p(99.9)=595.99ms
     iterations.....................: 32764   271.173245/s
     success_rate...................: 100.00% ✓ 32764      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 903105      ✗ 0     
     data_received..................: 26 GB   220 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=3.34µs  min=892ns  med=2.47µs  max=22.81ms  p(90)=4.25µs  p(95)=5.07µs  p(99.9)=37.74µs
     http_req_connecting............: avg=285ns   min=0s     med=0s      max=3.5ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.69ms min=1.56ms med=18.62ms max=289.08ms p(90)=28.5ms  p(95)=32.34ms p(99.9)=54.51ms
       { expected_response:true }...: avg=19.69ms min=1.56ms med=18.62ms max=289.08ms p(90)=28.5ms  p(95)=32.34ms p(99.9)=54.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301135
     http_req_receiving.............: avg=1.21ms  min=53.3µs med=157µs   max=143.2ms  p(90)=3.18ms  p(95)=4.37ms  p(99.9)=25.32ms
     http_req_sending...............: avg=46.86µs min=4.51µs med=9.2µs   max=102.43ms p(90)=19.78µs p(95)=95.75µs p(99.9)=4.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.42ms min=1.47ms med=17.3ms  max=288.44ms p(90)=26.97ms p(95)=30.78ms p(99.9)=51.99ms
     http_reqs......................: 301135  2505.1644/s
     iteration_duration.............: avg=19.92ms min=3ms    med=18.83ms max=300.73ms p(90)=28.72ms p(95)=32.59ms p(99.9)=55.02ms
     iterations.....................: 301035  2504.332493/s
     success_rate...................: 100.00% ✓ 301035      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 888144      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=2.85µs  min=852ns   med=2.07µs  max=15.01ms  p(90)=3.51µs  p(95)=4.22µs   p(99.9)=31.35µs
     http_req_connecting............: avg=220ns   min=0s      med=0s      max=2.7ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.05ms min=1.71ms  med=19.76ms max=268.35ms p(90)=28.06ms p(95)=30.44ms  p(99.9)=48.12ms
       { expected_response:true }...: avg=20.05ms min=1.71ms  med=19.76ms max=268.35ms p(90)=28.06ms p(95)=30.44ms  p(99.9)=48.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296148
     http_req_receiving.............: avg=78.18µs min=24.76µs med=47.9µs  max=34.83ms  p(90)=84.9µs  p(95)=112.62µs p(99.9)=4.94ms 
     http_req_sending...............: avg=38.13µs min=4.63µs  med=8.92µs  max=218.55ms p(90)=15.54µs p(95)=29.97µs  p(99.9)=2.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.93ms min=1.67ms  med=19.65ms max=267.92ms p(90)=27.92ms p(95)=30.28ms  p(99.9)=46.83ms
     http_reqs......................: 296148  2463.417831/s
     iteration_duration.............: avg=20.25ms min=3.12ms  med=19.95ms max=294.57ms p(90)=28.25ms p(95)=30.64ms  p(99.9)=48.67ms
     iterations.....................: 296048  2462.586012/s
     success_rate...................: 100.00% ✓ 296048      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 862959      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.71µs   min=852ns   med=2.01µs  max=15.93ms  p(90)=3.51µs  p(95)=4.22µs  p(99.9)=31.47µs 
     http_req_connecting............: avg=170ns    min=0s      med=0s      max=2.41ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.63ms  min=1.58ms  med=17.23ms max=356.49ms p(90)=33.83ms p(95)=41.75ms p(99.9)=150.69ms
       { expected_response:true }...: avg=20.63ms  min=1.58ms  med=17.23ms max=356.49ms p(90)=33.83ms p(95)=41.75ms p(99.9)=150.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287753
     http_req_receiving.............: avg=598.46µs min=51.72µs med=96.46µs max=235.8ms  p(90)=1.12ms  p(95)=1.91ms  p(99.9)=27.61ms 
     http_req_sending...............: avg=40.56µs  min=4.55µs  med=8.46µs  max=173.41ms p(90)=16.24µs p(95)=70.7µs  p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.99ms  min=1.46ms  med=16.67ms max=286.54ms p(90)=32.85ms p(95)=40.54ms p(99.9)=147.89ms
     http_reqs......................: 287753  2393.803238/s
     iteration_duration.............: avg=20.84ms  min=2.61ms  med=17.43ms max=356.68ms p(90)=34.06ms p(95)=41.99ms p(99.9)=151.5ms 
     iterations.....................: 287653  2392.971343/s
     success_rate...................: 100.00% ✓ 287653      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 851364      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 341 MB  2.8 MB/s
     http_req_blocked...............: avg=3.47µs   min=902ns   med=2.65µs  max=7.91ms   p(90)=4.17µs  p(95)=4.86µs  p(99.9)=38.41µs 
     http_req_connecting............: avg=365ns    min=0s      med=0s      max=3.79ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.9ms   min=1.61ms  med=17.45ms max=321.4ms  p(90)=34.33ms p(95)=42.18ms p(99.9)=152.08ms
       { expected_response:true }...: avg=20.9ms   min=1.61ms  med=17.45ms max=321.4ms  p(90)=34.33ms p(95)=42.18ms p(99.9)=152.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 283888
     http_req_receiving.............: avg=617.39µs min=52.77µs med=99.56µs max=224.27ms p(90)=1.14ms  p(95)=1.99ms  p(99.9)=28.25ms 
     http_req_sending...............: avg=42.28µs  min=4.86µs  med=9.77µs  max=68.45ms  p(90)=17.91µs p(95)=83.4µs  p(99.9)=3.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.24ms  min=1.53ms  med=16.88ms max=321.2ms  p(90)=33.26ms p(95)=40.85ms p(99.9)=149.57ms
     http_reqs......................: 283888  2361.647692/s
     iteration_duration.............: avg=21.13ms  min=2.49ms  med=17.66ms max=321.61ms p(90)=34.57ms p(95)=42.42ms p(99.9)=153.5ms 
     iterations.....................: 283788  2360.815798/s
     success_rate...................: 100.00% ✓ 283788      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 796932      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 319 MB  2.7 MB/s
     http_req_blocked...............: avg=3.19µs   min=942ns   med=2.23µs   max=18.69ms  p(90)=3.74µs  p(95)=4.44µs  p(99.9)=31.16µs 
     http_req_connecting............: avg=335ns    min=0s      med=0s       max=3.94ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.35ms  min=1.86ms  med=18.63ms  max=354.05ms p(90)=36.77ms p(95)=45.45ms p(99.9)=160.21ms
       { expected_response:true }...: avg=22.35ms  min=1.86ms  med=18.63ms  max=354.05ms p(90)=36.77ms p(95)=45.45ms p(99.9)=160.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 265744
     http_req_receiving.............: avg=621.74µs min=51.26µs med=100.61µs max=245.27ms p(90)=1.14ms  p(95)=2ms     p(99.9)=29.73ms 
     http_req_sending...............: avg=41.82µs  min=4.75µs  med=9.25µs   max=209.39ms p(90)=17.36µs p(95)=54.29µs p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.69ms  min=1.75ms  med=18.04ms  max=353.96ms p(90)=35.71ms p(95)=44.22ms p(99.9)=158.77ms
     http_reqs......................: 265744  2210.157688/s
     iteration_duration.............: avg=22.57ms  min=3.19ms  med=18.83ms  max=354.25ms p(90)=37ms    p(95)=45.68ms p(99.9)=161.43ms
     iterations.....................: 265644  2209.326001/s
     success_rate...................: 100.00% ✓ 265644      ✗ 0     
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

     checks.........................: 100.00% ✓ 594543      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=3.19µs  min=782ns   med=2.13µs  max=4.15ms   p(90)=4.28µs  p(95)=5.38µs   p(99.9)=41.69µs
     http_req_connecting............: avg=461ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.02ms min=2.18ms  med=29.6ms  max=308.88ms p(90)=39.73ms p(95)=43.05ms  p(99.9)=64.45ms
       { expected_response:true }...: avg=30.02ms min=2.18ms  med=29.6ms  max=308.88ms p(90)=39.73ms p(95)=43.05ms  p(99.9)=64.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 198281
     http_req_receiving.............: avg=91.33µs min=27.22µs med=53.22µs max=122.48ms p(90)=122.9µs p(95)=201.7µs  p(99.9)=3.62ms 
     http_req_sending...............: avg=39.46µs min=4.5µs   med=8.94µs  max=119.45ms p(90)=23.56µs p(95)=104.39µs p(99.9)=2.8ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.89ms min=2.06ms  med=29.49ms max=308.21ms p(90)=39.58ms p(95)=42.88ms  p(99.9)=63.61ms
     http_reqs......................: 198281  1648.470727/s
     iteration_duration.............: avg=30.26ms min=7.57ms  med=29.82ms max=317.13ms p(90)=39.95ms p(95)=43.26ms  p(99.9)=64.84ms
     iterations.....................: 198181  1647.639346/s
     success_rate...................: 100.00% ✓ 198181      ✗ 0     
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

     checks.........................: 100.00% ✓ 442146      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3.3µs   min=932ns   med=2.47µs  max=3.34ms   p(90)=4.12µs   p(95)=4.81µs   p(99.9)=37.55µs 
     http_req_connecting............: avg=505ns   min=0s      med=0s      max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.45ms min=2.14ms  med=40.1ms  max=297.41ms p(90)=56.21ms  p(95)=61.19ms  p(99.9)=83.8ms  
       { expected_response:true }...: avg=40.45ms min=2.14ms  med=40.1ms  max=297.41ms p(90)=56.21ms  p(95)=61.19ms  p(99.9)=83.8ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 147482
     http_req_receiving.............: avg=77.72µs min=25.09µs med=64.77µs max=41.79ms  p(90)=104.54µs p(95)=121.27µs p(99.9)=935.25µs
     http_req_sending...............: avg=27.67µs min=4.91µs  med=11.92µs max=258.28ms p(90)=19.25µs  p(95)=22.87µs  p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.35ms min=2.03ms  med=40ms    max=297.27ms p(90)=56.1ms   p(95)=61.08ms  p(99.9)=83.54ms 
     http_reqs......................: 147482  1226.16749/s
     iteration_duration.............: avg=40.7ms  min=4.47ms  med=40.31ms max=323.21ms p(90)=56.42ms  p(95)=61.41ms  p(99.9)=84.19ms 
     iterations.....................: 147382  1225.336088/s
     success_rate...................: 100.00% ✓ 147382      ✗ 0     
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

     checks.........................: 100.00% ✓ 212934     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 85 MB   708 kB/s
     http_req_blocked...............: avg=4.95µs  min=1.19µs  med=3.38µs  max=4.03ms   p(90)=4.94µs   p(95)=5.63µs   p(99.9)=43.77µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.17ms min=3.85ms  med=82.3ms  max=338.29ms p(90)=102.39ms p(95)=111.93ms p(99.9)=196.05ms
       { expected_response:true }...: avg=84.17ms min=3.85ms  med=82.3ms  max=338.29ms p(90)=102.39ms p(95)=111.93ms p(99.9)=196.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71078
     http_req_receiving.............: avg=89.56µs min=29.03µs med=76.74µs max=131.09ms p(90)=113.45µs p(95)=127.54µs p(99.9)=700.68µs
     http_req_sending...............: avg=27.95µs min=5.55µs  med=15.92µs max=105.66ms p(90)=22.64µs  p(95)=25.03µs  p(99.9)=694.15µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.05ms min=3.73ms  med=82.2ms  max=337.35ms p(90)=102.25ms p(95)=111.78ms p(99.9)=195.77ms
     http_reqs......................: 71078   589.806198/s
     iteration_duration.............: avg=84.54ms min=27.25ms med=82.56ms max=353.12ms p(90)=102.66ms p(95)=112.22ms p(99.9)=196.87ms
     iterations.....................: 70978   588.976397/s
     success_rate...................: 100.00% ✓ 70978      ✗ 0    
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

     checks.........................: 100.00% ✓ 162294     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=4.95µs   min=1.11µs  med=3.11µs   max=3.51ms   p(90)=4.62µs   p(95)=5.19µs   p(99.9)=75.84µs 
     http_req_connecting............: avg=1.61µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.45ms min=5.05ms  med=108.34ms max=317.19ms p(90)=145.46ms p(95)=156.12ms p(99.9)=199.61ms
       { expected_response:true }...: avg=110.45ms min=5.05ms  med=108.34ms max=317.19ms p(90)=145.46ms p(95)=156.12ms p(99.9)=199.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54198
     http_req_receiving.............: avg=85.48µs  min=27.72µs med=81.15µs  max=109.87ms p(90)=111.94µs p(95)=124.5µs  p(99.9)=564.3µs 
     http_req_sending...............: avg=22.66µs  min=5.37µs  med=17.04µs  max=45.59ms  p(90)=22.25µs  p(95)=24.11µs  p(99.9)=550.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.34ms min=4.95ms  med=108.25ms max=306.86ms p(90)=145.35ms p(95)=155.99ms p(99.9)=199.48ms
     http_reqs......................: 54198   449.23157/s
     iteration_duration.............: avg=110.93ms min=16.72ms med=108.66ms max=328.55ms p(90)=145.75ms p(95)=156.41ms p(99.9)=202.19ms
     iterations.....................: 54098   448.402699/s
     success_rate...................: 100.00% ✓ 54098      ✗ 0    
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

     checks.........................: 100.00% ✓ 95442      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.14µs  med=3.17µs   max=3.45ms   p(90)=4.51µs   p(95)=5.08µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=2.68µs   min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=187.82ms min=6.29ms  med=172.73ms max=657.03ms p(90)=218.87ms p(95)=265.66ms p(99.9)=558.3ms 
       { expected_response:true }...: avg=187.82ms min=6.29ms  med=172.73ms max=657.03ms p(90)=218.87ms p(95)=265.66ms p(99.9)=558.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31914
     http_req_receiving.............: avg=94.21µs  min=32.7µs  med=89.63µs  max=27.61ms  p(90)=119.28µs p(95)=131.32µs p(99.9)=778.24µs
     http_req_sending...............: avg=31.06µs  min=5.31µs  med=17.97µs  max=165.39ms p(90)=22.25µs  p(95)=24.04µs  p(99.9)=472.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.7ms  min=6.18ms  med=172.61ms max=656.92ms p(90)=218.76ms p(95)=265.38ms p(99.9)=558.2ms 
     http_reqs......................: 31914   264.068636/s
     iteration_duration.............: avg=188.69ms min=27.63ms med=173.07ms max=657.28ms p(90)=219.29ms p(95)=266.87ms p(99.9)=558.57ms
     iterations.....................: 31814   263.241198/s
     success_rate...................: 100.00% ✓ 31814      ✗ 0    
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

     checks.........................: 100.00% ✓ 93621      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=5.96µs   min=1.08µs  med=3.02µs   max=3.69ms   p(90)=4.31µs   p(95)=4.81µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=191.49ms min=7.89ms  med=193.09ms max=410.91ms p(90)=203.84ms p(95)=211.67ms p(99.9)=279.82ms
       { expected_response:true }...: avg=191.49ms min=7.89ms  med=193.09ms max=410.91ms p(90)=203.84ms p(95)=211.67ms p(99.9)=279.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31307
     http_req_receiving.............: avg=97.68µs  min=31.15µs med=87.96µs  max=145.2ms  p(90)=117.34µs p(95)=128.26µs p(99.9)=559.75µs
     http_req_sending...............: avg=22.28µs  min=5.3µs   med=16.7µs   max=38.75ms  p(90)=21.09µs  p(95)=22.86µs  p(99.9)=458.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.37ms min=7.77ms  med=192.99ms max=410.69ms p(90)=203.74ms p(95)=211.55ms p(99.9)=279.55ms
     http_reqs......................: 31307   258.697881/s
     iteration_duration.............: avg=192.38ms min=37.37ms med=193.48ms max=422.02ms p(90)=204.12ms p(95)=212ms    p(99.9)=285.87ms
     iterations.....................: 31207   257.871555/s
     success_rate...................: 100.00% ✓ 31207      ✗ 0    
     vus............................: 21      min=21       max=50 
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

     checks.........................: 100.00% ✓ 6897      ✗ 0   
     data_received..................: 230 MB  1.8 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=88.25µs  min=1.16µs   med=3.46µs  max=7.47ms  p(90)=5.09µs   p(95)=5.88µs   p(99.9)=7.17ms  
     http_req_connecting............: avg=82.58µs  min=0s       med=0s      max=7.44ms  p(90)=0s       p(95)=0s       p(99.9)=7.06ms  
     http_req_duration..............: avg=2.53s    min=27.99ms  med=2.62s   max=4.82s   p(90)=3.38s    p(95)=3.59s    p(99.9)=4.78s   
       { expected_response:true }...: avg=2.53s    min=27.99ms  med=2.62s   max=4.82s   p(90)=3.38s    p(95)=3.59s    p(99.9)=4.78s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2399
     http_req_receiving.............: avg=108.89µs min=42.07µs  med=92.72µs max=25.95ms p(90)=136.42µs p(95)=155.58µs p(99.9)=513.95µs
     http_req_sending...............: avg=105.29µs min=5.59µs   med=18.43µs max=64.66ms p(90)=24.28µs  p(95)=28.62µs  p(99.9)=8.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.53s    min=27.89ms  med=2.62s   max=4.81s   p(90)=3.38s    p(95)=3.59s    p(99.9)=4.77s   
     http_reqs......................: 2399    19.000026/s
     iteration_duration.............: avg=2.63s    min=381.36ms med=2.66s   max=4.82s   p(90)=3.38s    p(95)=3.6s     p(99.9)=4.78s   
     iterations.....................: 2299    18.208028/s
     success_rate...................: 100.00% ✓ 2299      ✗ 0   
     vus............................: 17      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

