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
| hive-router | v0.0.84 | 3,068 | 3,310 | 3,016 | 3.2% |  |
| fusion-nightly-net11 | 16.7.0-p.3 | 2,718 | 2,863 | 2,663 | 2.4% |  |
| fusion-nightly | 16.7.0-p.3 | 2,641 | 2,776 | 2,623 | 2.1% |  |
| fusion | 16.6.4 | 2,543 | 2,665 | 2,523 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.3 | 2,438 | 2,530 | 2,431 | 1.4% |  |
| grafbase | 0.53.5 | 2,180 | 2,298 | 2,167 | 2.1% |  |
| cosmo | 0.334.0 | 1,287 | 1,331 | 1,274 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 612 | 631 | 611 | 1.1% |  |
| apollo-router | v2.16.1 | 481 | 501 | 478 | 1.8% |  |
| apollo-gateway | 2.14.3 | 277 | 283 | 275 | 1.2% |  |
| hive-gateway | 2.10.8 | 272 | 279 | 272 | 1.1% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% | non-compatible response (584 across 4/5 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.3 | 2,554 | 2,672 | 2,539 | 1.8% |  |
| fusion-nightly | 16.7.0-p.3 | 2,480 | 2,599 | 2,475 | 1.7% |  |
| hive-router | v0.0.84 | 2,440 | 2,700 | 2,416 | 3.9% |  |
| fusion | 16.6.4 | 2,402 | 2,508 | 2,392 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.3 | 2,333 | 2,429 | 2,326 | 1.5% |  |
| grafbase | 0.53.5 | 1,637 | 1,707 | 1,630 | 1.6% |  |
| cosmo | 0.334.0 | 1,186 | 1,230 | 1,182 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 579 | 602 | 578 | 1.6% |  |
| apollo-router | v2.16.1 | 410 | 429 | 408 | 2.0% |  |
| apollo-gateway | 2.14.3 | 261 | 265 | 260 | 0.6% |  |
| hive-gateway | 2.10.8 | 258 | 269 | 256 | 1.7% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 3.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1106109     ✗ 0     
     data_received..................: 32 GB   269 MB/s
     data_sent......................: 443 MB  3.7 MB/s
     http_req_blocked...............: avg=3.28µs  min=961ns   med=2.34µs  max=24.14ms  p(90)=3.76µs  p(95)=4.44µs   p(99.9)=36.91µs
     http_req_connecting............: avg=251ns   min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.05ms min=1.5ms   med=15.2ms  max=310.63ms p(90)=23.67ms p(95)=27.3ms   p(99.9)=48.26ms
       { expected_response:true }...: avg=16.05ms min=1.5ms   med=15.2ms  max=310.63ms p(90)=23.67ms p(95)=27.3ms   p(99.9)=48.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 368803
     http_req_receiving.............: avg=99.38µs min=26.22µs med=46.9µs  max=127.54ms p(90)=89.22µs p(95)=175.58µs p(99.9)=9.31ms 
     http_req_sending...............: avg=52.45µs min=4.52µs  med=8.69µs  max=201.39ms p(90)=15.37µs p(95)=100.86µs p(99.9)=8.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.9ms  min=1.43ms  med=15.09ms max=310.01ms p(90)=23.46ms p(95)=26.98ms  p(99.9)=46.82ms
     http_reqs......................: 368803  3068.271209/s
     iteration_duration.............: avg=16.26ms min=1.92ms  med=15.4ms  max=320.54ms p(90)=23.88ms p(95)=27.54ms  p(99.9)=49ms   
     iterations.....................: 368703  3067.439255/s
     success_rate...................: 100.00% ✓ 368703      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 980370      ✗ 0     
     data_received..................: 29 GB   238 MB/s
     data_sent......................: 393 MB  3.3 MB/s
     http_req_blocked...............: avg=2.75µs   min=902ns   med=1.93µs  max=15ms     p(90)=3.18µs  p(95)=3.78µs  p(99.9)=28.46µs
     http_req_connecting............: avg=304ns    min=0s      med=0s      max=3.57ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.13ms  min=1.9ms   med=17.22ms max=291.67ms p(90)=26.25ms p(95)=29.87ms p(99.9)=50.69ms
       { expected_response:true }...: avg=18.13ms  min=1.9ms   med=17.22ms max=291.67ms p(90)=26.25ms p(95)=29.87ms p(99.9)=50.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 326890
     http_req_receiving.............: avg=466.78µs min=50.46µs med=88.89µs max=121.98ms p(90)=1.16ms  p(95)=1.82ms  p(99.9)=18.12ms
     http_req_sending...............: avg=45.27µs  min=4.36µs  med=8.18µs  max=89.96ms  p(90)=14.76µs p(95)=86.28µs p(99.9)=5.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.62ms  min=1.81ms  med=16.71ms max=291.35ms p(90)=25.62ms p(95)=29.17ms p(99.9)=49.24ms
     http_reqs......................: 326890  2718.949003/s
     iteration_duration.............: avg=18.35ms  min=3.21ms  med=17.42ms max=304.43ms p(90)=26.47ms p(95)=30.11ms p(99.9)=51.24ms
     iterations.....................: 326790  2718.117241/s
     success_rate...................: 100.00% ✓ 326790      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 952620      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 382 MB  3.2 MB/s
     http_req_blocked...............: avg=2.76µs  min=812ns   med=2.03µs  max=17.34ms  p(90)=3.35µs  p(95)=3.93µs  p(99.9)=31.49µs 
     http_req_connecting............: avg=269ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.68ms min=2.05ms  med=16.19ms max=287.77ms p(90)=30.25ms p(95)=36.43ms p(99.9)=111.11ms
       { expected_response:true }...: avg=18.68ms min=2.05ms  med=16.19ms max=287.77ms p(90)=30.25ms p(95)=36.43ms p(99.9)=111.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317640
     http_req_receiving.............: avg=545.5µs min=49.43µs med=90.21µs max=149.17ms p(90)=1.05ms  p(95)=1.88ms  p(99.9)=24.18ms 
     http_req_sending...............: avg=43.98µs min=4.37µs  med=8.25µs  max=129.69ms p(90)=15.01µs p(95)=87.12µs p(99.9)=4.65ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.09ms min=1.9ms   med=15.67ms max=280.6ms  p(90)=29.35ms p(95)=35.39ms p(99.9)=109.61ms
     http_reqs......................: 317640  2641.194746/s
     iteration_duration.............: avg=18.88ms min=3.07ms  med=16.38ms max=302.27ms p(90)=30.46ms p(95)=36.66ms p(99.9)=111.8ms 
     iterations.....................: 317540  2640.36324/s
     success_rate...................: 100.00% ✓ 317540      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 917343      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=3.85µs   min=1.04µs  med=2.38µs  max=241.32ms p(90)=3.67µs  p(95)=4.26µs  p(99.9)=33.07µs 
     http_req_connecting............: avg=1µs      min=0s      med=0s      max=241.28ms p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.4ms   min=2ms     med=16.62ms max=301.04ms p(90)=31.67ms p(95)=38.5ms  p(99.9)=121.47ms
       { expected_response:true }...: avg=19.4ms   min=2ms     med=16.62ms max=301.04ms p(90)=31.67ms p(95)=38.5ms  p(99.9)=121.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305881
     http_req_receiving.............: avg=579.88µs min=52.68µs med=94.79µs max=143.06ms p(90)=1.09ms  p(95)=1.97ms  p(99.9)=26.32ms 
     http_req_sending...............: avg=44.21µs  min=4.7µs   med=8.93µs  max=235.59ms p(90)=14.95µs p(95)=87.22µs p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.77ms  min=1.88ms  med=16.07ms max=268.51ms p(90)=30.68ms p(95)=37.34ms p(99.9)=120.01ms
     http_reqs......................: 305881  2543.505028/s
     iteration_duration.............: avg=19.61ms  min=2.79ms  med=16.81ms max=328.36ms p(90)=31.88ms p(95)=38.74ms p(99.9)=122.12ms
     iterations.....................: 305781  2542.673494/s
     success_rate...................: 100.00% ✓ 305781      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 879165      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=3.13µs   min=941ns   med=2.35µs  max=16.65ms  p(90)=3.72µs  p(95)=4.34µs  p(99.9)=35.2µs  
     http_req_connecting............: avg=283ns    min=0s      med=0s      max=3.35ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.24ms  min=1.74ms  med=16.56ms max=342.43ms p(90)=34.15ms p(95)=43.14ms p(99.9)=154.09ms
       { expected_response:true }...: avg=20.24ms  min=1.74ms  med=16.56ms max=342.43ms p(90)=34.15ms p(95)=43.14ms p(99.9)=154.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293155
     http_req_receiving.............: avg=585.89µs min=49.99µs med=93.75µs max=178.35ms p(90)=1.06ms  p(95)=1.89ms  p(99.9)=30.47ms 
     http_req_sending...............: avg=44.15µs  min=4.64µs  med=8.96µs  max=141.37ms p(90)=15.91µs p(95)=85.44µs p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.61ms  min=1.67ms  med=16.02ms max=341.91ms p(90)=33.16ms p(95)=41.96ms p(99.9)=152.3ms 
     http_reqs......................: 293155  2438.417815/s
     iteration_duration.............: avg=20.46ms  min=2.65ms  med=16.76ms max=342.64ms p(90)=34.38ms p(95)=43.38ms p(99.9)=154.89ms
     iterations.....................: 293055  2437.586031/s
     success_rate...................: 100.00% ✓ 293055      ✗ 0     
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

     checks.........................: 100.00% ✓ 786267      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=2.89µs  min=922ns  med=2.07µs  max=11.21ms  p(90)=3.48µs  p(95)=4.21µs   p(99.9)=36.68µs
     http_req_connecting............: avg=356ns   min=0s     med=0s      max=4.12ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.67ms min=1.73ms med=22.44ms max=285.92ms p(90)=26.88ms p(95)=28.63ms  p(99.9)=47ms   
       { expected_response:true }...: avg=22.67ms min=1.73ms med=22.44ms max=285.92ms p(90)=26.88ms p(95)=28.63ms  p(99.9)=47ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 262189
     http_req_receiving.............: avg=84.13µs min=26.3µs med=53.16µs max=148.26ms p(90)=90.68µs p(95)=114.84µs p(99.9)=5.36ms 
     http_req_sending...............: avg=36.72µs min=4.62µs med=9.31µs  max=177ms    p(90)=16.42µs p(95)=24.27µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.55ms min=1.65ms med=22.34ms max=284.79ms p(90)=26.75ms p(95)=28.46ms  p(99.9)=45.71ms
     http_reqs......................: 262189  2180.769313/s
     iteration_duration.............: avg=22.88ms min=3.64ms med=22.63ms max=303.73ms p(90)=27.08ms p(95)=28.84ms  p(99.9)=47.5ms 
     iterations.....................: 262089  2179.937558/s
     success_rate...................: 100.00% ✓ 262089      ✗ 0     
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

     checks.........................: 100.00% ✓ 464388      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=3.42µs  min=990ns   med=2.49µs  max=3.76ms   p(90)=3.9µs   p(95)=4.53µs   p(99.9)=36.61µs 
     http_req_connecting............: avg=621ns   min=0s      med=0s      max=3.72ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.52ms min=1.95ms  med=38.07ms max=324.12ms p(90)=53.83ms p(95)=58.7ms   p(99.9)=81.07ms 
       { expected_response:true }...: avg=38.52ms min=1.95ms  med=38.07ms max=324.12ms p(90)=53.83ms p(95)=58.7ms   p(99.9)=81.07ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 154896
     http_req_receiving.............: avg=76.38µs min=28.59µs med=61.45µs max=106.36ms p(90)=97.13µs p(95)=113.35µs p(99.9)=967.43µs
     http_req_sending...............: avg=24.94µs min=4.82µs  med=10.83µs max=180.37ms p(90)=16.95µs p(95)=20.96µs  p(99.9)=1.02ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.42ms min=1.89ms  med=37.97ms max=324.02ms p(90)=53.72ms p(95)=58.59ms  p(99.9)=80.58ms 
     http_reqs......................: 154896  1287.769679/s
     iteration_duration.............: avg=38.75ms min=3.25ms  med=38.29ms max=335.49ms p(90)=54.04ms p(95)=58.9ms   p(99.9)=81.51ms 
     iterations.....................: 154796  1286.938302/s
     success_rate...................: 100.00% ✓ 154796      ✗ 0     
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

     checks.........................: 100.00% ✓ 220938     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   735 kB/s
     http_req_blocked...............: avg=3.78µs  min=992ns   med=2.27µs  max=3.87ms   p(90)=3.72µs  p(95)=4.28µs   p(99.9)=42.26µs 
     http_req_connecting............: avg=1.2µs   min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.14ms min=3.61ms  med=79.46ms max=324.26ms p(90)=99.56ms p(95)=109ms    p(99.9)=189.93ms
       { expected_response:true }...: avg=81.14ms min=3.61ms  med=79.46ms max=324.26ms p(90)=99.56ms p(95)=109ms    p(99.9)=189.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73746
     http_req_receiving.............: avg=71.98µs min=28.2µs  med=61.07µs max=56.81ms  p(90)=95.98µs p(95)=109.5µs  p(99.9)=618.14µs
     http_req_sending...............: avg=18.43µs min=4.93µs  med=11.29µs max=89.64ms  p(90)=18.03µs p(95)=20.15µs  p(99.9)=575.69µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.05ms min=3.53ms  med=79.37ms max=324.14ms p(90)=99.47ms p(95)=108.9ms  p(99.9)=189.79ms
     http_reqs......................: 73746   612.134877/s
     iteration_duration.............: avg=81.48ms min=20.37ms med=79.68ms max=334.24ms p(90)=99.81ms p(95)=109.28ms p(99.9)=191.97ms
     iterations.....................: 73646   611.304819/s
     success_rate...................: 100.00% ✓ 73646      ✗ 0    
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

     checks.........................: 100.00% ✓ 173784     ✗ 0    
     data_received..................: 5.1 GB  42 MB/s
     data_sent......................: 70 MB   578 kB/s
     http_req_blocked...............: avg=5.46µs   min=1.32µs  med=3.51µs   max=3.92ms   p(90)=4.97µs   p(95)=5.57µs   p(99.9)=56.08µs 
     http_req_connecting............: avg=1.7µs    min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=103.14ms min=4.55ms  med=102.88ms max=345.55ms p(90)=124.25ms p(95)=130.55ms p(99.9)=159.9ms 
       { expected_response:true }...: avg=103.14ms min=4.55ms  med=102.88ms max=345.55ms p(90)=124.25ms p(95)=130.55ms p(99.9)=159.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 58028
     http_req_receiving.............: avg=92.89µs  min=32.98µs med=81.83µs  max=91.37ms  p(90)=112.55µs p(95)=125.05µs p(99.9)=630.09µs
     http_req_sending...............: avg=27.52µs  min=6.11µs  med=17.13µs  max=134.92ms p(90)=22.4µs   p(95)=24.43µs  p(99.9)=572.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.02ms min=4.5ms   med=102.75ms max=345.15ms p(90)=124.13ms p(95)=130.44ms p(99.9)=159.6ms 
     http_reqs......................: 58028   481.207723/s
     iteration_duration.............: avg=103.59ms min=29.02ms med=103.17ms max=357.79ms p(90)=124.52ms p(95)=130.81ms p(99.9)=162.11ms
     iterations.....................: 57928   480.378455/s
     success_rate...................: 100.00% ✓ 57928      ✗ 0    
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

     checks.........................: 100.00% ✓ 100362     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   333 kB/s
     http_req_blocked...............: avg=5.94µs   min=1.15µs  med=3.26µs   max=3.43ms   p(90)=4.55µs   p(95)=5.1µs    p(99.9)=1.16ms  
     http_req_connecting............: avg=2.49µs   min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=178.65ms min=7.37ms  med=179.72ms max=389.96ms p(90)=188.41ms p(95)=193.42ms p(99.9)=264.05ms
       { expected_response:true }...: avg=178.65ms min=7.37ms  med=179.72ms max=389.96ms p(90)=188.41ms p(95)=193.42ms p(99.9)=264.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33554
     http_req_receiving.............: avg=85.69µs  min=31.3µs  med=82µs     max=6.25ms   p(90)=112.19µs p(95)=122.83µs p(99.9)=400.55µs
     http_req_sending...............: avg=28.24µs  min=5.54µs  med=16.19µs  max=101.82ms p(90)=20.79µs  p(95)=22.51µs  p(99.9)=482.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.54ms min=7.25ms  med=179.63ms max=389.4ms  p(90)=188.31ms p(95)=193.32ms p(99.9)=263.96ms
     http_reqs......................: 33554   277.460823/s
     iteration_duration.............: avg=179.44ms min=42.72ms med=180.1ms  max=399.81ms p(90)=188.68ms p(95)=193.68ms p(99.9)=265.23ms
     iterations.....................: 33454   276.633914/s
     success_rate...................: 100.00% ✓ 33454      ✗ 0    
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

     checks.........................: 100.00% ✓ 98331      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.8µs    min=1.45µs  med=3.52µs   max=3.59ms   p(90)=4.86µs   p(95)=5.46µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=182.32ms min=5.99ms  med=166.99ms max=620.89ms p(90)=211.77ms p(95)=257.21ms p(99.9)=554.06ms
       { expected_response:true }...: avg=182.32ms min=5.99ms  med=166.99ms max=620.89ms p(90)=211.77ms p(95)=257.21ms p(99.9)=554.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32877
     http_req_receiving.............: avg=91.94µs  min=33.8µs  med=86.15µs  max=20.54ms  p(90)=116.99µs p(95)=129.09µs p(99.9)=708.94µs
     http_req_sending...............: avg=39.7µs   min=6.61µs  med=17.47µs  max=85.19ms  p(90)=22.4µs   p(95)=24.27µs  p(99.9)=552.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.19ms min=5.91ms  med=166.88ms max=620.8ms  p(90)=211.65ms p(95)=257.09ms p(99.9)=553.9ms 
     http_reqs......................: 32877   272.082129/s
     iteration_duration.............: avg=183.15ms min=28.37ms med=167.35ms max=621.12ms p(90)=212.22ms p(95)=258.61ms p(99.9)=554.34ms
     iterations.....................: 32777   271.254553/s
     success_rate...................: 100.00% ✓ 32777      ✗ 0    
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
data_received..................: 8.5 MB 142 kB/s
     data_sent......................: 108 kB 1.8 kB/s
     http_req_blocked...............: avg=5.31µs   min=2.55µs  med=3.3µs    max=163.24µs p(90)=4.53µs   p(95)=4.93µs   p(99.9)=149.41µs
     http_req_connecting............: avg=1µs      min=0s      med=0s       max=89.81µs  p(90)=0s       p(95)=0s       p(99.9)=81.91µs 
     http_req_duration..............: avg=365.16ms min=22.72ms med=26.31ms  max=30.01s   p(90)=37.51ms  p(95)=40.37ms  p(99.9)=27.38s  
       { expected_response:true }...: avg=365.16ms min=22.72ms med=26.31ms  max=30.01s   p(90)=37.51ms  p(95)=40.37ms  p(99.9)=27.38s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 89  
     http_req_receiving.............: avg=140.25µs min=77.95µs med=129.77µs max=1.14ms   p(90)=148.58µs p(95)=171.32µs p(99.9)=1.07ms  
     http_req_sending...............: avg=20.54µs  min=12.65µs med=18.64µs  max=108.88µs p(90)=22.13µs  p(95)=27.84µs  p(99.9)=104.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=365ms    min=22.58ms med=26.14ms  max=30.01s   p(90)=37.17ms  p(95)=40.22ms  p(99.9)=27.38s  
     http_reqs......................: 89     1.483314/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 920814      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=2.8µs    min=842ns   med=2µs     max=17.3ms   p(90)=3.58µs  p(95)=4.33µs  p(99.9)=31.69µs
     http_req_connecting............: avg=230ns    min=0s      med=0s      max=3.65ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.32ms  min=1.49ms  med=18.49ms max=286.99ms p(90)=27.96ms p(95)=31.48ms p(99.9)=52.65ms
       { expected_response:true }...: avg=19.32ms  min=1.49ms  med=18.49ms max=286.99ms p(90)=27.96ms p(95)=31.48ms p(99.9)=52.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307038
     http_req_receiving.............: avg=540.47µs min=51.28µs med=97.71µs max=154.64ms p(90)=1.36ms  p(95)=2.13ms  p(99.9)=19.38ms
     http_req_sending...............: avg=42.24µs  min=4.54µs  med=8.48µs  max=71.59ms  p(90)=18.38µs p(95)=86.75µs p(99.9)=3.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.73ms  min=1.42ms  med=17.91ms max=286.4ms  p(90)=27.27ms p(95)=30.71ms p(99.9)=50.7ms 
     http_reqs......................: 307038  2554.453282/s
     iteration_duration.............: avg=19.53ms  min=2.75ms  med=18.69ms max=312.06ms p(90)=28.18ms p(95)=31.71ms p(99.9)=53.12ms
     iterations.....................: 306938  2553.621316/s
     success_rate...................: 100.00% ✓ 306938      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 894018      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=3.55µs   min=1.02µs  med=2.63µs  max=17.8ms   p(90)=4.23µs  p(95)=4.97µs  p(99.9)=37.49µs 
     http_req_connecting............: avg=314ns    min=0s      med=0s      max=4.14ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.89ms  min=1.55ms  med=16.63ms max=436.16ms p(90)=32.76ms p(95)=40.21ms p(99.9)=147.68ms
       { expected_response:true }...: avg=19.89ms  min=1.55ms  med=16.63ms max=436.16ms p(90)=32.76ms p(95)=40.21ms p(99.9)=147.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298106
     http_req_receiving.............: avg=571.59µs min=51.77µs med=95.7µs  max=255.51ms p(90)=1.08ms  p(95)=1.94ms  p(99.9)=26.83ms 
     http_req_sending...............: avg=49.31µs  min=5.06µs  med=10.1µs  max=217.45ms p(90)=18.84µs p(95)=97.77µs p(99.9)=4.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.27ms  min=1.46ms  med=16.09ms max=435.29ms p(90)=31.77ms p(95)=39.12ms p(99.9)=144.51ms
     http_reqs......................: 298106  2480.139487/s
     iteration_duration.............: avg=20.12ms  min=1.93ms  med=16.84ms max=436.39ms p(90)=33.02ms p(95)=40.47ms p(99.9)=148.04ms
     iterations.....................: 298006  2479.307521/s
     success_rate...................: 100.00% ✓ 298006      ✗ 0     
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

     checks.........................: 100.00% ✓ 879864      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=3.02µs  min=912ns   med=2.17µs  max=14.25ms  p(90)=3.69µs  p(95)=4.42µs   p(99.9)=33.74µs
     http_req_connecting............: avg=344ns   min=0s      med=0s      max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.24ms min=1.69ms  med=20.04ms max=280.25ms p(90)=28.07ms p(95)=30.41ms  p(99.9)=48.5ms 
       { expected_response:true }...: avg=20.24ms min=1.69ms  med=20.04ms max=280.25ms p(90)=28.07ms p(95)=30.41ms  p(99.9)=48.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 293388
     http_req_receiving.............: avg=82.6µs  min=24.86µs med=49.7µs  max=108.42ms p(90)=88.18µs p(95)=117.01µs p(99.9)=5.61ms 
     http_req_sending...............: avg=39.86µs min=4.7µs   med=9.29µs  max=180.89ms p(90)=16.3µs  p(95)=30.98µs  p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.11ms min=1.62ms  med=19.94ms max=279.72ms p(90)=27.94ms p(95)=30.24ms  p(99.9)=47.56ms
     http_reqs......................: 293388  2440.319557/s
     iteration_duration.............: avg=20.44ms min=3.33ms  med=20.24ms max=292.06ms p(90)=28.27ms p(95)=30.62ms  p(99.9)=49.07ms
     iterations.....................: 293288  2439.487784/s
     success_rate...................: 100.00% ✓ 293288      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 865974      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=2.76µs   min=821ns   med=1.91µs  max=12.73ms  p(90)=3.26µs  p(95)=3.91µs  p(99.9)=32.43µs 
     http_req_connecting............: avg=331ns    min=0s      med=0s      max=4.28ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.56ms  min=1.5ms   med=17.2ms  max=454.9ms  p(90)=33.65ms p(95)=41.34ms p(99.9)=152ms   
       { expected_response:true }...: avg=20.56ms  min=1.5ms   med=17.2ms  max=454.9ms  p(90)=33.65ms p(95)=41.34ms p(99.9)=152ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 288758
     http_req_receiving.............: avg=597.65µs min=51.76µs med=94.77µs max=191.94ms p(90)=1.12ms  p(95)=1.94ms  p(99.9)=27.22ms 
     http_req_sending...............: avg=40.91µs  min=4.49µs  med=8.22µs  max=140.84ms p(90)=15.28µs p(95)=65.25µs p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.92ms  min=1.4ms   med=16.67ms max=454.3ms  p(90)=32.66ms p(95)=40.19ms p(99.9)=149.52ms
     http_reqs......................: 288758  2402.3052/s
     iteration_duration.............: avg=20.77ms  min=2.86ms  med=17.4ms  max=455.16ms p(90)=33.87ms p(95)=41.57ms p(99.9)=153.42ms
     iterations.....................: 288658  2401.473255/s
     success_rate...................: 100.00% ✓ 288658      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 841404      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=2.99µs   min=872ns   med=2.12µs  max=16.64ms  p(90)=3.79µs  p(95)=4.54µs  p(99.9)=32.2µs  
     http_req_connecting............: avg=340ns    min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.16ms  min=1.82ms  med=17.84ms max=280.71ms p(90)=34.49ms p(95)=42.66ms p(99.9)=148.86ms
       { expected_response:true }...: avg=21.16ms  min=1.82ms  med=17.84ms max=280.71ms p(90)=34.49ms p(95)=42.66ms p(99.9)=148.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280568
     http_req_receiving.............: avg=567.77µs min=49.95µs med=96.99µs max=182.77ms p(90)=1.09ms  p(95)=1.85ms  p(99.9)=26.78ms 
     http_req_sending...............: avg=40.64µs  min=4.69µs  med=9.04µs  max=127.79ms p(90)=18.14µs p(95)=74.29µs p(99.9)=2.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.55ms  min=1.7ms   med=17.31ms max=280.39ms p(90)=33.54ms p(95)=41.57ms p(99.9)=146.11ms
     http_reqs......................: 280568  2333.588011/s
     iteration_duration.............: avg=21.38ms  min=2.68ms  med=18.04ms max=308.06ms p(90)=34.72ms p(95)=42.9ms  p(99.9)=149.91ms
     iterations.....................: 280468  2332.756274/s
     success_rate...................: 100.00% ✓ 280468      ✗ 0     
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

     checks.........................: 100.00% ✓ 590415      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=3.47µs   min=911ns   med=2.4µs   max=11.08ms  p(90)=4.75µs   p(95)=5.81µs   p(99.9)=46.07µs
     http_req_connecting............: avg=409ns    min=0s      med=0s      max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.23ms  min=2.19ms  med=29.79ms max=289.66ms p(90)=40.1ms   p(95)=43.61ms  p(99.9)=64.01ms
       { expected_response:true }...: avg=30.23ms  min=2.19ms  med=29.79ms max=289.66ms p(90)=40.1ms   p(95)=43.61ms  p(99.9)=64.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196905
     http_req_receiving.............: avg=126.99µs min=26.88µs med=55.11µs max=233.94ms p(90)=127.77µs p(95)=214.54µs p(99.9)=6.15ms 
     http_req_sending...............: avg=41.84µs  min=4.44µs  med=9.74µs  max=95.57ms  p(90)=24.34µs  p(95)=112.45µs p(99.9)=3.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.06ms  min=2.1ms   med=29.67ms max=97.7ms   p(90)=39.94ms  p(95)=43.42ms  p(99.9)=62.24ms
     http_reqs......................: 196905  1637.146749/s
     iteration_duration.............: avg=30.47ms  min=5.24ms  med=30.02ms max=321.68ms p(90)=40.32ms  p(95)=43.83ms  p(99.9)=64.51ms
     iterations.....................: 196805  1636.315309/s
     success_rate...................: 100.00% ✓ 196805      ✗ 0     
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

     checks.........................: 100.00% ✓ 427782      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.88µs  min=1.06µs  med=2.74µs  max=5.77ms   p(90)=4.24µs  p(95)=4.93µs   p(99.9)=38.1µs  
     http_req_connecting............: avg=818ns   min=0s      med=0s      max=5.75ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.82ms min=2.14ms  med=41.46ms max=299.62ms p(90)=58.23ms p(95)=63.29ms  p(99.9)=89.23ms 
       { expected_response:true }...: avg=41.82ms min=2.14ms  med=41.46ms max=299.62ms p(90)=58.23ms p(95)=63.29ms  p(99.9)=89.23ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142694
     http_req_receiving.............: avg=80µs    min=26.54µs med=65.35µs max=123.35ms p(90)=104.4µs p(95)=121.19µs p(99.9)=860.63µs
     http_req_sending...............: avg=25.15µs min=5.19µs  med=11.79µs max=153.05ms p(90)=18.08µs p(95)=21.89µs  p(99.9)=1.04ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.71ms min=2.07ms  med=41.37ms max=286.47ms p(90)=58.12ms p(95)=63.17ms  p(99.9)=88.84ms 
     http_reqs......................: 142694  1186.293155/s
     iteration_duration.............: avg=42.06ms min=3.67ms  med=41.68ms max=309.4ms  p(90)=58.44ms p(95)=63.5ms   p(99.9)=89.94ms 
     iterations.....................: 142594  1185.461801/s
     success_rate...................: 100.00% ✓ 142594      ✗ 0     
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

     checks.........................: 100.00% ✓ 209121     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   696 kB/s
     http_req_blocked...............: avg=4.94µs  min=1.32µs  med=3.33µs  max=3.84ms   p(90)=4.87µs   p(95)=5.53µs   p(99.9)=53.48µs 
     http_req_connecting............: avg=1.34µs  min=0s      med=0s      max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.71ms min=3.95ms  med=83.72ms max=324.21ms p(90)=104.55ms p(95)=115ms    p(99.9)=201.01ms
       { expected_response:true }...: avg=85.71ms min=3.95ms  med=83.72ms max=324.21ms p(90)=104.55ms p(95)=115ms    p(99.9)=201.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69807
     http_req_receiving.............: avg=87.23µs min=29.76µs med=76.58µs max=126.93ms p(90)=112.86µs p(95)=126.33µs p(99.9)=698.25µs
     http_req_sending...............: avg=31.62µs min=5.13µs  med=15µs    max=247.14ms p(90)=21.51µs  p(95)=23.75µs  p(99.9)=632.23µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.6ms  min=3.76ms  med=83.62ms max=323.62ms p(90)=104.44ms p(95)=114.9ms  p(99.9)=199.9ms 
     http_reqs......................: 69807   579.188229/s
     iteration_duration.............: avg=86.09ms min=18.44ms med=83.97ms max=333.83ms p(90)=104.81ms p(95)=115.28ms p(99.9)=203.11ms
     iterations.....................: 69707   578.358529/s
     success_rate...................: 100.00% ✓ 69707      ✗ 0    
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

     checks.........................: 100.00% ✓ 148134     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   492 kB/s
     http_req_blocked...............: avg=6.52µs   min=1.42µs  med=3.65µs   max=4.13ms   p(90)=5.15µs   p(95)=5.74µs   p(99.9)=254.17µs
     http_req_connecting............: avg=2.57µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=175.36µs
     http_req_duration..............: avg=121.03ms min=5.19ms  med=118.68ms max=327.89ms p(90)=159.82ms p(95)=171.82ms p(99.9)=219.7ms 
       { expected_response:true }...: avg=121.03ms min=5.19ms  med=118.68ms max=327.89ms p(90)=159.82ms p(95)=171.82ms p(99.9)=219.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 49478
     http_req_receiving.............: avg=91.13µs  min=30.45µs med=82.41µs  max=136.03ms p(90)=114.29µs p(95)=126.21µs p(99.9)=588.76µs
     http_req_sending...............: avg=27.43µs  min=6.09µs  med=17.1µs   max=100.17ms p(90)=22.7µs   p(95)=24.63µs  p(99.9)=960.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.91ms min=5.05ms  med=118.57ms max=307.83ms p(90)=159.69ms p(95)=171.7ms  p(99.9)=219.33ms
     http_reqs......................: 49478   410.024116/s
     iteration_duration.............: avg=121.54ms min=11.86ms med=119.05ms max=339.36ms p(90)=160.13ms p(95)=172.17ms p(99.9)=221.13ms
     iterations.....................: 49378   409.195416/s
     success_rate...................: 100.00% ✓ 49378      ✗ 0    
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

     checks.........................: 100.00% ✓ 94650      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.57µs   min=1.15µs  med=3.21µs   max=3.63ms   p(90)=4.58µs   p(95)=5.13µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=3.02µs   min=0s      med=0s       max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=189.39ms min=7.79ms  med=190.34ms max=412.1ms  p(90)=200.4ms  p(95)=205.7ms  p(99.9)=277.93ms
       { expected_response:true }...: avg=189.39ms min=7.79ms  med=190.34ms max=412.1ms  p(90)=200.4ms  p(95)=205.7ms  p(99.9)=277.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31650
     http_req_receiving.............: avg=101.42µs min=30.98µs med=87.02µs  max=120.79ms p(90)=116.57µs p(95)=127.81µs p(99.9)=502.96µs
     http_req_sending...............: avg=38.38µs  min=5.41µs  med=17.1µs   max=128.21ms p(90)=21.55µs  p(95)=23.32µs  p(99.9)=614.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.25ms min=7.7ms   med=190.22ms max=411.39ms p(90)=200.29ms p(95)=205.57ms p(99.9)=277.77ms
     http_reqs......................: 31650   261.591643/s
     iteration_duration.............: avg=190.26ms min=35.39ms med=190.71ms max=424.48ms p(90)=200.7ms  p(95)=205.99ms p(99.9)=279.17ms
     iterations.....................: 31550   260.765129/s
     success_rate...................: 100.00% ✓ 31550      ✗ 0    
     vus............................: 2       min=2        max=50 
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

     checks.........................: 100.00% ✓ 93705      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=6.18µs   min=1.12µs  med=3.03µs   max=3.78ms   p(90)=4.3µs    p(95)=4.81µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=191.35ms min=5.88ms  med=176.38ms max=629.12ms p(90)=222.49ms p(95)=274.73ms p(99.9)=552.78ms
       { expected_response:true }...: avg=191.35ms min=5.88ms  med=176.38ms max=629.12ms p(90)=222.49ms p(95)=274.73ms p(99.9)=552.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31335
     http_req_receiving.............: avg=89.41µs  min=32.54µs med=86.86µs  max=7.39ms   p(90)=116.15µs p(95)=126.9µs  p(99.9)=985.42µs
     http_req_sending...............: avg=27.02µs  min=5.13µs  med=16.67µs  max=90.67ms  p(90)=20.62µs  p(95)=22.17µs  p(99.9)=510.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.23ms min=5.73ms  med=176.27ms max=629.02ms p(90)=222.4ms  p(95)=274.64ms p(99.9)=552.68ms
     http_reqs......................: 31335   258.820977/s
     iteration_duration.............: avg=192.21ms min=42.97ms med=176.72ms max=629.34ms p(90)=222.89ms p(95)=275.99ms p(99.9)=553.01ms
     iterations.....................: 31235   257.994996/s
     success_rate...................: 100.00% ✓ 31235      ✗ 0    
     vus............................: 4       min=4        max=50 
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

     checks.........................: 100.00% ✓ 7533      ✗ 0   
     data_received..................: 250 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=106.01µs min=1.17µs   med=3.19µs  max=8.15ms  p(90)=4.7µs    p(95)=5.35µs   p(99.9)=7.48ms  
     http_req_connecting............: avg=101.06µs min=0s       med=0s      max=8.11ms  p(90)=0s       p(95)=0s       p(99.9)=7.45ms  
     http_req_duration..............: avg=2.31s    min=25.33ms  med=2.4s    max=4.33s   p(90)=3.09s    p(95)=3.32s    p(99.9)=4.3s    
       { expected_response:true }...: avg=2.31s    min=25.33ms  med=2.4s    max=4.33s   p(90)=3.09s    p(95)=3.32s    p(99.9)=4.3s    
     http_req_failed................: 0.00%   ✓ 0         ✗ 2611
     http_req_receiving.............: avg=99.07µs  min=29.51µs  med=93.9µs  max=1.11ms  p(90)=138.08µs p(95)=156.64µs p(99.9)=691.04µs
     http_req_sending...............: avg=52.69µs  min=5.41µs   med=17.86µs max=12.98ms p(90)=22.81µs  p(95)=26.7µs   p(99.9)=2.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.31s    min=25.23ms  med=2.4s    max=4.33s   p(90)=3.09s    p(95)=3.32s    p(99.9)=4.3s    
     http_reqs......................: 2611    20.814672/s
     iteration_duration.............: avg=2.4s     min=311.82ms med=2.42s   max=4.33s   p(90)=3.11s    p(95)=3.33s    p(99.9)=4.31s   
     iterations.....................: 2511    20.01748/s
     success_rate...................: 100.00% ✓ 2511      ✗ 0   
     vus............................: 19      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

