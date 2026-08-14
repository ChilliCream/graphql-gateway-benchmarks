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
| hive-router | v0.0.84 | 2,936 | 3,181 | 2,890 | 3.5% |  |
| fusion-nightly-net11 | 16.6.1-p.2 | 2,702 | 2,837 | 2,678 | 2.0% |  |
| fusion | 16.6.0 | 2,609 | 2,724 | 2,597 | 1.6% |  |
| fusion-nightly | 16.6.1-p.2 | 2,580 | 2,718 | 2,561 | 2.1% |  |
| fusion-nightly-fed | 16.6.1-p.2 | 2,476 | 2,541 | 2,467 | 0.9% |  |
| grafbase | 0.53.5 | 2,150 | 2,258 | 2,142 | 1.9% |  |
| cosmo | 0.334.0 | 1,267 | 1,320 | 1,260 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 612 | 627 | 609 | 1.0% |  |
| apollo-router | v2.16.1 | 439 | 462 | 435 | 2.3% |  |
| apollo-gateway | 2.14.3 | 282 | 287 | 281 | 0.6% |  |
| hive-gateway | 2.10.8 | 278 | 287 | 277 | 1.2% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1591 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,579 | 2,769 | 2,560 | 2.7% |  |
| fusion-nightly-net11 | 16.6.1-p.2 | 2,518 | 2,640 | 2,488 | 1.8% |  |
| fusion | 16.6.0 | 2,468 | 2,583 | 2,459 | 1.8% |  |
| fusion-nightly | 16.6.1-p.2 | 2,380 | 2,484 | 2,334 | 1.9% |  |
| fusion-nightly-fed | 16.6.1-p.2 | 2,209 | 2,317 | 2,202 | 1.8% |  |
| grafbase | 0.53.5 | 1,655 | 1,701 | 1,653 | 1.0% |  |
| cosmo | 0.334.0 | 1,180 | 1,223 | 1,177 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 597 | 615 | 596 | 1.0% |  |
| apollo-router | v2.16.1 | 414 | 429 | 406 | 2.2% |  |
| apollo-gateway | 2.14.3 | 265 | 269 | 263 | 0.7% |  |
| hive-gateway | 2.10.8 | 260 | 269 | 259 | 1.3% |  |
| feddi | 5ff8b6165878 | 21 | 21 | 20 | 1.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1058580     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 424 MB  3.5 MB/s
     http_req_blocked...............: avg=2.66µs  min=922ns   med=1.92µs  max=17.22ms  p(90)=3.06µs  p(95)=3.61µs   p(99.9)=28.62µs
     http_req_connecting............: avg=258ns   min=0s      med=0s      max=4.14ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.79ms min=1.44ms  med=16.17ms max=290.42ms p(90)=24.46ms p(95)=27.45ms  p(99.9)=46.95ms
       { expected_response:true }...: avg=16.79ms min=1.44ms  med=16.17ms max=290.42ms p(90)=24.46ms p(95)=27.45ms  p(99.9)=46.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 352960
     http_req_receiving.............: avg=78.5µs  min=24.99µs med=44.36µs max=46.71ms  p(90)=77.31µs p(95)=124.09µs p(99.9)=6.3ms  
     http_req_sending...............: avg=45.55µs min=4.59µs  med=8.25µs  max=155.06ms p(90)=13.85µs p(95)=82.08µs  p(99.9)=5.9ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.67ms min=1.38ms  med=16.06ms max=289.74ms p(90)=24.31ms p(95)=27.23ms  p(99.9)=45.81ms
     http_reqs......................: 352960  2936.966232/s
     iteration_duration.............: avg=16.99ms min=1.99ms  med=16.35ms max=300.52ms p(90)=24.66ms p(95)=27.67ms  p(99.9)=47.52ms
     iterations.....................: 352860  2936.134136/s
     success_rate...................: 100.00% ✓ 352860      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 974490      ✗ 0     
     data_received..................: 29 GB   237 MB/s
     data_sent......................: 391 MB  3.2 MB/s
     http_req_blocked...............: avg=2.65µs   min=892ns   med=1.95µs  max=6.25ms   p(90)=3.3µs   p(95)=3.97µs  p(99.9)=26.85µs
     http_req_connecting............: avg=266ns    min=0s      med=0s      max=3.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.24ms  min=1.9ms   med=17.38ms max=293.59ms p(90)=26.36ms p(95)=29.9ms  p(99.9)=50.35ms
       { expected_response:true }...: avg=18.24ms  min=1.9ms   med=17.38ms max=293.59ms p(90)=26.36ms p(95)=29.9ms  p(99.9)=50.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 324930
     http_req_receiving.............: avg=469.52µs min=51.82µs med=92.62µs max=156.1ms  p(90)=1.16ms  p(95)=1.81ms  p(99.9)=17.2ms 
     http_req_sending...............: avg=44.41µs  min=4.41µs  med=8.31µs  max=225.65ms p(90)=15.86µs p(95)=88.49µs p(99.9)=3.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.73ms  min=1.8ms   med=16.88ms max=292.97ms p(90)=25.73ms p(95)=29.23ms p(99.9)=48.91ms
     http_reqs......................: 324930  2702.386033/s
     iteration_duration.............: avg=18.46ms  min=3.08ms  med=17.58ms max=304.87ms p(90)=26.57ms p(95)=30.12ms p(99.9)=50.97ms
     iterations.....................: 324830  2701.55435/s
     success_rate...................: 100.00% ✓ 324830      ✗ 0     
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

     checks.........................: 100.00% ✓ 940938      ✗ 0     
     data_received..................: 28 GB   229 MB/s
     data_sent......................: 377 MB  3.1 MB/s
     http_req_blocked...............: avg=3.61µs   min=912ns   med=2.37µs  max=46.07ms  p(90)=3.72µs  p(95)=4.34µs  p(99.9)=36.54µs 
     http_req_connecting............: avg=654ns    min=0s      med=0s      max=45.91ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.9ms   min=1.99ms  med=16.38ms max=295.46ms p(90)=30.66ms p(95)=37.01ms p(99.9)=110.02ms
       { expected_response:true }...: avg=18.9ms   min=1.99ms  med=16.38ms max=295.46ms p(90)=30.66ms p(95)=37.01ms p(99.9)=110.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 313746
     http_req_receiving.............: avg=543.29µs min=50.91µs med=91.02µs max=119.63ms p(90)=1.05ms  p(95)=1.88ms  p(99.9)=24.77ms 
     http_req_sending...............: avg=47.74µs  min=4.46µs  med=8.98µs  max=271.35ms p(90)=15.85µs p(95)=92.65µs p(99.9)=6.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.31ms  min=1.9ms   med=15.85ms max=284.05ms p(90)=29.77ms p(95)=35.98ms p(99.9)=108.85ms
     http_reqs......................: 313746  2609.155222/s
     iteration_duration.............: avg=19.12ms  min=3.06ms  med=16.58ms max=325.64ms p(90)=30.88ms p(95)=37.26ms p(99.9)=110.92ms
     iterations.....................: 313646  2608.323608/s
     success_rate...................: 100.00% ✓ 313646      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 930732      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.75µs   min=822ns   med=1.88µs  max=17.05ms  p(90)=3.14µs  p(95)=3.75µs  p(99.9)=27.88µs 
     http_req_connecting............: avg=300ns    min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.12ms  min=2.01ms  med=16.42ms max=304.07ms p(90)=31.05ms p(95)=37.55ms p(99.9)=120.56ms
       { expected_response:true }...: avg=19.12ms  min=2.01ms  med=16.42ms max=304.07ms p(90)=31.05ms p(95)=37.55ms p(99.9)=120.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310344
     http_req_receiving.............: avg=578.79µs min=50.24µs med=88.7µs  max=255.41ms p(90)=1.06ms  p(95)=1.96ms  p(99.9)=26.35ms 
     http_req_sending...............: avg=42.52µs  min=4.29µs  med=7.99µs  max=58.84ms  p(90)=14.43µs p(95)=82.23µs p(99.9)=4.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.5ms   min=1.89ms  med=15.89ms max=240.85ms p(90)=30.12ms p(95)=36.47ms p(99.9)=116.95ms
     http_reqs......................: 310344  2580.990024/s
     iteration_duration.............: avg=19.33ms  min=3.02ms  med=16.61ms max=313.91ms p(90)=31.26ms p(95)=37.78ms p(99.9)=121.27ms
     iterations.....................: 310244  2580.158369/s
     success_rate...................: 100.00% ✓ 310244      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 892941      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.84µs   min=862ns   med=1.97µs  max=22.59ms  p(90)=3.23µs  p(95)=3.86µs  p(99.9)=28.05µs 
     http_req_connecting............: avg=289ns    min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.94ms  min=1.7ms   med=16.31ms max=328.23ms p(90)=34ms    p(95)=42.46ms p(99.9)=154.86ms
       { expected_response:true }...: avg=19.94ms  min=1.7ms   med=16.31ms max=328.23ms p(90)=34ms    p(95)=42.46ms p(99.9)=154.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297747
     http_req_receiving.............: avg=560.86µs min=50.17µs med=89.9µs  max=144.88ms p(90)=1.04ms  p(95)=1.84ms  p(99.9)=28.21ms 
     http_req_sending...............: avg=39.52µs  min=4.61µs  med=8.39µs  max=195.26ms p(90)=14.88µs p(95)=66.33µs p(99.9)=2.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.34ms  min=1.58ms  med=15.81ms max=325.46ms p(90)=33ms    p(95)=41.37ms p(99.9)=153.73ms
     http_reqs......................: 297747  2476.496778/s
     iteration_duration.............: avg=20.15ms  min=2.68ms  med=16.5ms  max=328.41ms p(90)=34.22ms p(95)=42.71ms p(99.9)=155.92ms
     iterations.....................: 297647  2475.665033/s
     success_rate...................: 100.00% ✓ 297647      ✗ 0     
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

     checks.........................: 100.00% ✓ 775380      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=3.1µs   min=872ns   med=2.25µs  max=9.71ms   p(90)=3.81µs  p(95)=4.55µs   p(99.9)=39.05µs
     http_req_connecting............: avg=375ns   min=0s      med=0s      max=4.01ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.99ms min=1.77ms  med=22.75ms max=289.19ms p(90)=27.3ms  p(95)=29.07ms  p(99.9)=48.24ms
       { expected_response:true }...: avg=22.99ms min=1.77ms  med=22.75ms max=289.19ms p(90)=27.3ms  p(95)=29.07ms  p(99.9)=48.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258560
     http_req_receiving.............: avg=87.74µs min=27.75µs med=54.39µs max=126.19ms p(90)=93.32µs p(95)=123.92µs p(99.9)=5.34ms 
     http_req_sending...............: avg=37.28µs min=4.79µs  med=9.4µs   max=168.18ms p(90)=16.11µs p(95)=32.04µs  p(99.9)=2.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.86ms min=1.67ms  med=22.65ms max=288.81ms p(90)=27.17ms p(95)=28.89ms  p(99.9)=46.97ms
     http_reqs......................: 258560  2150.581837/s
     iteration_duration.............: avg=23.2ms  min=3.94ms  med=22.94ms max=303.58ms p(90)=27.5ms  p(95)=29.28ms  p(99.9)=48.78ms
     iterations.....................: 258460  2149.750084/s
     success_rate...................: 100.00% ✓ 258460      ✗ 0     
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

     checks.........................: 100.00% ✓ 456996      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=2.79µs  min=922ns   med=1.92µs  max=4ms      p(90)=3.15µs  p(95)=3.73µs   p(99.9)=29.83µs 
     http_req_connecting............: avg=587ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.16ms min=2ms     med=38.77ms max=300.92ms p(90)=54.63ms p(95)=59.5ms   p(99.9)=83.23ms 
       { expected_response:true }...: avg=39.16ms min=2ms     med=38.77ms max=300.92ms p(90)=54.63ms p(95)=59.5ms   p(99.9)=83.23ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 152432
     http_req_receiving.............: avg=69.29µs min=26.22µs med=55.72µs max=176.84ms p(90)=87.98µs p(95)=102.84µs p(99.9)=794.84µs
     http_req_sending...............: avg=20.19µs min=4.58µs  med=9.05µs  max=69.47ms  p(90)=14.45µs p(95)=18.26µs  p(99.9)=829.15µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.07ms min=1.89ms  med=38.69ms max=300.13ms p(90)=54.54ms p(95)=59.41ms  p(99.9)=83.1ms  
     http_reqs......................: 152432  1267.344073/s
     iteration_duration.............: avg=39.38ms min=3.43ms  med=38.97ms max=315.15ms p(90)=54.82ms p(95)=59.69ms  p(99.9)=83.91ms 
     iterations.....................: 152332  1266.512657/s
     success_rate...................: 100.00% ✓ 152332      ✗ 0     
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

     checks.........................: 100.00% ✓ 220968     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   735 kB/s
     http_req_blocked...............: avg=5.59µs  min=1.19µs  med=2.95µs  max=8.28ms   p(90)=4.4µs    p(95)=5.02µs   p(99.9)=43.08µs 
     http_req_connecting............: avg=2.31µs  min=0s      med=0s      max=7.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.12ms min=3.58ms  med=79.17ms max=282.32ms p(90)=100.93ms p(95)=111.59ms p(99.9)=190.29ms
       { expected_response:true }...: avg=81.12ms min=3.58ms  med=79.17ms max=282.32ms p(90)=100.93ms p(95)=111.59ms p(99.9)=190.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73756
     http_req_receiving.............: avg=76.78µs min=30.28µs med=67.38µs max=22.36ms  p(90)=102.99µs p(95)=116.02µs p(99.9)=614.86µs
     http_req_sending...............: avg=21.07µs min=5.22µs  med=13.01µs max=77.37ms  p(90)=19.64µs  p(95)=22.07µs  p(99.9)=725.48µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.02ms min=3.49ms  med=79.07ms max=281.02ms p(90)=100.83ms p(95)=111.45ms p(99.9)=190.22ms
     http_reqs......................: 73756   612.278058/s
     iteration_duration.............: avg=81.46ms min=18.39ms med=79.42ms max=303.63ms p(90)=101.18ms p(95)=111.86ms p(99.9)=192.11ms
     iterations.....................: 73656   611.447918/s
     success_rate...................: 100.00% ✓ 73656      ✗ 0    
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

     checks.........................: 100.00% ✓ 158814     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   528 kB/s
     http_req_blocked...............: avg=5.11µs   min=1.29µs  med=3.24µs   max=3.53ms   p(90)=4.61µs   p(95)=5.16µs   p(99.9)=101.36µs
     http_req_connecting............: avg=1.66µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.91ms min=4.61ms  med=112.68ms max=318ms    p(90)=136.51ms p(95)=143.46ms p(99.9)=177.72ms
       { expected_response:true }...: avg=112.91ms min=4.61ms  med=112.68ms max=318ms    p(90)=136.51ms p(95)=143.46ms p(99.9)=177.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53038
     http_req_receiving.............: avg=81.61µs  min=32.16µs med=76.21µs  max=41.68ms  p(90)=108.04µs p(95)=120.24µs p(99.9)=537.12µs
     http_req_sending...............: avg=28.64µs  min=5.3µs   med=15.22µs  max=123.33ms p(90)=20.55µs  p(95)=22.38µs  p(99.9)=581.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.8ms  min=4.51ms  med=112.57ms max=317.33ms p(90)=136.4ms  p(95)=143.33ms p(99.9)=177.55ms
     http_reqs......................: 53038   439.736146/s
     iteration_duration.............: avg=113.37ms min=42.28ms med=112.95ms max=339.03ms p(90)=136.78ms p(95)=143.71ms p(99.9)=179.26ms
     iterations.....................: 52938   438.90705/s
     success_rate...................: 100.00% ✓ 52938      ✗ 0    
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

     checks.........................: 100.00% ✓ 102234     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=6.12µs   min=1.04µs  med=3.01µs   max=4.24ms   p(90)=4.32µs   p(95)=4.83µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=175.39ms min=7.45ms  med=177.09ms max=344.85ms p(90)=185.75ms p(95)=190.7ms  p(99.9)=262.22ms
       { expected_response:true }...: avg=175.39ms min=7.45ms  med=177.09ms max=344.85ms p(90)=185.75ms p(95)=190.7ms  p(99.9)=262.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34178
     http_req_receiving.............: avg=89.92µs  min=29.25µs med=86.08µs  max=34.67ms  p(90)=115.06µs p(95)=125.47µs p(99.9)=464.42µs
     http_req_sending...............: avg=22.96µs  min=5.69µs  med=16.45µs  max=31.45ms  p(90)=20.45µs  p(95)=22.16µs  p(99.9)=427.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.27ms min=7.34ms  med=176.99ms max=344.43ms p(90)=185.64ms p(95)=190.59ms p(99.9)=262.13ms
     http_reqs......................: 34178   282.651597/s
     iteration_duration.............: avg=176.16ms min=31.67ms med=177.41ms max=363.42ms p(90)=186.02ms p(95)=190.97ms p(99.9)=263.02ms
     iterations.....................: 34078   281.824599/s
     success_rate...................: 100.00% ✓ 34078      ✗ 0    
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

     checks.........................: 100.00% ✓ 100737     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 40 MB   335 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.06µs  med=3.23µs   max=4.74ms   p(90)=4.58µs   p(95)=5.15µs   p(99.9)=525.01µs
     http_req_connecting............: avg=1.84µs   min=0s      med=0s       max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=452.56µs
     http_req_duration..............: avg=177.97ms min=5.74ms  med=161.82ms max=715.35ms p(90)=208.06ms p(95)=241.81ms p(99.9)=609.76ms
       { expected_response:true }...: avg=177.97ms min=5.74ms  med=161.82ms max=715.35ms p(90)=208.06ms p(95)=241.81ms p(99.9)=609.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33679
     http_req_receiving.............: avg=96.67µs  min=34.19µs med=90.32µs  max=105.17ms p(90)=119.55µs p(95)=131.56µs p(99.9)=602.4µs 
     http_req_sending...............: avg=31.88µs  min=5.6µs   med=17.33µs  max=110.19ms p(90)=21.45µs  p(95)=23.16µs  p(99.9)=461.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.85ms min=5.6ms   med=161.71ms max=715.27ms p(90)=207.94ms p(95)=241.58ms p(99.9)=609.66ms
     http_reqs......................: 33679   278.79376/s
     iteration_duration.............: avg=178.77ms min=47.11ms med=162.19ms max=715.55ms p(90)=208.47ms p(95)=242.32ms p(99.9)=610.11ms
     iterations.....................: 33579   277.965963/s
     success_rate...................: 100.00% ✓ 33579      ✗ 0    
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

     checks.........................: 100.00% ✓ 930165      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.85µs  min=942ns   med=2.16µs  max=4.15ms   p(90)=3.74µs  p(95)=4.51µs   p(99.9)=34.62µs
     http_req_connecting............: avg=289ns   min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.13ms min=1.71ms  med=18.82ms max=296.71ms p(90)=26.37ms p(95)=28.74ms  p(99.9)=47.83ms
       { expected_response:true }...: avg=19.13ms min=1.71ms  med=18.82ms max=296.71ms p(90)=26.37ms p(95)=28.74ms  p(99.9)=47.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310155
     http_req_receiving.............: avg=87.46µs min=26.89µs med=49.65µs max=161.17ms p(90)=91.3µs  p(95)=133.59µs p(99.9)=6.22ms 
     http_req_sending...............: avg=43.6µs  min=4.54µs  med=9.31µs  max=69ms     p(90)=17.12µs p(95)=85.83µs  p(99.9)=3.7ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.99ms min=1.61ms  med=18.7ms  max=277.83ms p(90)=26.22ms p(95)=28.54ms  p(99.9)=46.75ms
     http_reqs......................: 310155  2579.943167/s
     iteration_duration.............: avg=19.34ms min=3.19ms  med=19.02ms max=309.06ms p(90)=26.57ms p(95)=28.96ms  p(99.9)=48.48ms
     iterations.....................: 310055  2579.111343/s
     success_rate...................: 100.00% ✓ 310055      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 907788      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 364 MB  3.0 MB/s
     http_req_blocked...............: avg=2.67µs   min=882ns  med=1.99µs   max=3.95ms   p(90)=3.46µs  p(95)=4.2µs   p(99.9)=30.16µs
     http_req_connecting............: avg=292ns    min=0s     med=0s       max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.6ms   min=1.55ms med=18.8ms   max=290.27ms p(90)=28.28ms p(95)=31.72ms p(99.9)=52.15ms
       { expected_response:true }...: avg=19.6ms   min=1.55ms med=18.8ms   max=290.27ms p(90)=28.28ms p(95)=31.72ms p(99.9)=52.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 302696
     http_req_receiving.............: avg=544.09µs min=51.2µs med=101.24µs max=170.83ms p(90)=1.36ms  p(95)=2.13ms  p(99.9)=18ms   
     http_req_sending...............: avg=40.9µs   min=4.68µs med=8.52µs   max=166.73ms p(90)=17.52µs p(95)=81.92µs p(99.9)=2.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.01ms  min=1.47ms med=18.21ms  max=267.36ms p(90)=27.59ms p(95)=31ms    p(99.9)=50.55ms
     http_reqs......................: 302696  2518.204986/s
     iteration_duration.............: avg=19.81ms  min=2.62ms med=19ms     max=300.84ms p(90)=28.49ms p(95)=31.94ms p(99.9)=52.84ms
     iterations.....................: 302596  2517.373061/s
     success_rate...................: 100.00% ✓ 302596      ✗ 0     
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

     checks.........................: 100.00% ✓ 890118      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.98µs   min=861ns   med=2.09µs  max=14.33ms  p(90)=3.78µs  p(95)=4.52µs  p(99.9)=34.97µs 
     http_req_connecting............: avg=309ns    min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.99ms  min=1.6ms   med=16.84ms max=479.35ms p(90)=32.62ms p(95)=39.94ms p(99.9)=141.27ms
       { expected_response:true }...: avg=19.99ms  min=1.6ms   med=16.84ms max=479.35ms p(90)=32.62ms p(95)=39.94ms p(99.9)=141.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296806
     http_req_receiving.............: avg=560.68µs min=51.51µs med=94.92µs max=173.89ms p(90)=1.08ms  p(95)=1.86ms  p(99.9)=26.53ms 
     http_req_sending...............: avg=41.93µs  min=4.3µs   med=8.82µs  max=194.55ms p(90)=17.93µs p(95)=82.11µs p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.39ms  min=1.48ms  med=16.32ms max=479.24ms p(90)=31.66ms p(95)=38.86ms p(99.9)=139.12ms
     http_reqs......................: 296806  2468.948955/s
     iteration_duration.............: avg=20.21ms  min=2.74ms  med=17.04ms max=479.53ms p(90)=32.84ms p(95)=40.17ms p(99.9)=142.72ms
     iterations.....................: 296706  2468.117116/s
     success_rate...................: 100.00% ✓ 296706      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 858345      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.82µs   min=882ns   med=2.04µs  max=11.2ms   p(90)=3.54µs  p(95)=4.25µs  p(99.9)=30.68µs 
     http_req_connecting............: avg=290ns    min=0s      med=0s      max=3.35ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.74ms  min=1.63ms  med=17.31ms max=517.55ms p(90)=34.13ms p(95)=41.77ms p(99.9)=159.84ms
       { expected_response:true }...: avg=20.74ms  min=1.63ms  med=17.31ms max=517.55ms p(90)=34.13ms p(95)=41.77ms p(99.9)=159.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286215
     http_req_receiving.............: avg=592.98µs min=51.61µs med=94.34µs max=181.95ms p(90)=1.11ms  p(95)=1.94ms  p(99.9)=27.69ms 
     http_req_sending...............: avg=39.9µs   min=4.73µs  med=8.65µs  max=115.46ms p(90)=16.7µs  p(95)=60.52µs p(99.9)=2.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.11ms  min=1.51ms  med=16.76ms max=517.46ms p(90)=33.12ms p(95)=40.64ms p(99.9)=157.54ms
     http_reqs......................: 286215  2380.809441/s
     iteration_duration.............: avg=20.96ms  min=2.7ms   med=17.51ms max=517.68ms p(90)=34.35ms p(95)=42ms    p(99.9)=160.84ms
     iterations.....................: 286115  2379.977615/s
     success_rate...................: 100.00% ✓ 286115      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 796686      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 319 MB  2.7 MB/s
     http_req_blocked...............: avg=3.57µs   min=1.12µs  med=2.78µs   max=8.15ms   p(90)=4.36µs  p(95)=5.09µs  p(99.9)=37.74µs 
     http_req_connecting............: avg=371ns    min=0s      med=0s       max=3.58ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.35ms  min=1.91ms  med=18.89ms  max=307.61ms p(90)=36.48ms p(95)=44.81ms p(99.9)=153.21ms
       { expected_response:true }...: avg=22.35ms  min=1.91ms  med=18.89ms  max=307.61ms p(90)=36.48ms p(95)=44.81ms p(99.9)=153.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 265662
     http_req_receiving.............: avg=622.53µs min=53.69µs med=104.61µs max=162.14ms p(90)=1.17ms  p(95)=2.03ms  p(99.9)=28.91ms 
     http_req_sending...............: avg=42.86µs  min=4.81µs  med=10.64µs  max=98.84ms  p(90)=19.48µs p(95)=83.09µs p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.69ms  min=1.8ms   med=18.31ms  max=307.53ms p(90)=35.36ms p(95)=43.69ms p(99.9)=151.76ms
     http_reqs......................: 265662  2209.201214/s
     iteration_duration.............: avg=22.58ms  min=3.06ms  med=19.1ms   max=327.55ms p(90)=36.7ms  p(95)=45.07ms p(99.9)=154.72ms
     iterations.....................: 265562  2208.369631/s
     success_rate...................: 100.00% ✓ 265562      ✗ 0     
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

     checks.........................: 100.00% ✓ 597186      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 239 MB  2.0 MB/s
     http_req_blocked...............: avg=3.33µs  min=871ns   med=2.31µs  max=3.55ms   p(90)=4.54µs   p(95)=5.63µs   p(99.9)=45.29µs
     http_req_connecting............: avg=428ns   min=0s      med=0s      max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.88ms min=2.22ms  med=29.4ms  max=301.37ms p(90)=39.39ms  p(95)=42.63ms  p(99.9)=62.22ms
       { expected_response:true }...: avg=29.88ms min=2.22ms  med=29.4ms  max=301.37ms p(90)=39.39ms  p(95)=42.63ms  p(99.9)=62.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199162
     http_req_receiving.............: avg=97.09µs min=27.45µs med=56.68µs max=128.1ms  p(90)=127.25µs p(95)=206.16µs p(99.9)=4.21ms 
     http_req_sending...............: avg=42.9µs  min=4.88µs  med=9.82µs  max=108.43ms p(90)=24.35µs  p(95)=109.91µs p(99.9)=3.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.74ms min=2.1ms   med=29.27ms max=300.8ms  p(90)=39.24ms  p(95)=42.46ms  p(99.9)=61.39ms
     http_reqs......................: 199162  1655.854238/s
     iteration_duration.............: avg=30.13ms min=3.73ms  med=29.62ms max=323.11ms p(90)=39.61ms  p(95)=42.86ms  p(99.9)=62.98ms
     iterations.....................: 199062  1655.022827/s
     success_rate...................: 100.00% ✓ 199062      ✗ 0     
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

     checks.........................: 100.00% ✓ 425577      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.24µs  min=931ns   med=2.24µs  max=4.13ms   p(90)=3.62µs   p(95)=4.27µs   p(99.9)=31.1µs  
     http_req_connecting............: avg=679ns   min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.05ms min=2.08ms  med=41.66ms max=315.76ms p(90)=58.5ms   p(95)=63.63ms  p(99.9)=87.6ms  
       { expected_response:true }...: avg=42.05ms min=2.08ms  med=41.66ms max=315.76ms p(90)=58.5ms   p(95)=63.63ms  p(99.9)=87.6ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 141959
     http_req_receiving.............: avg=75.89µs min=27.95µs med=62.61µs max=185.33ms p(90)=100.07µs p(95)=116.45µs p(99.9)=763.59µs
     http_req_sending...............: avg=23.37µs min=4.81µs  med=10.52µs max=115.95ms p(90)=16.78µs  p(95)=20.2µs   p(99.9)=901.12µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.95ms min=1.97ms  med=41.57ms max=315.5ms  p(90)=58.4ms   p(95)=63.53ms  p(99.9)=87.26ms 
     http_reqs......................: 141959  1180.259177/s
     iteration_duration.............: avg=42.28ms min=4.01ms  med=41.88ms max=333.76ms p(90)=58.7ms   p(95)=63.83ms  p(99.9)=87.87ms 
     iterations.....................: 141859  1179.427769/s
     success_rate...................: 100.00% ✓ 141859      ✗ 0     
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

     checks.........................: 100.00% ✓ 215583     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   717 kB/s
     http_req_blocked...............: avg=4.96µs  min=1.28µs  med=3.28µs  max=3.64ms   p(90)=4.9µs    p(95)=5.62µs   p(99.9)=48.77µs 
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.13ms min=3.98ms  med=79.9ms  max=317.03ms p(90)=125.93ms p(95)=137.09ms p(99.9)=227.08ms
       { expected_response:true }...: avg=83.13ms min=3.98ms  med=79.9ms  max=317.03ms p(90)=125.93ms p(95)=137.09ms p(99.9)=227.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71961
     http_req_receiving.............: avg=87.24µs min=31.55µs med=78.71µs max=76.23ms  p(90)=115.68µs p(95)=130.61µs p(99.9)=668.49µs
     http_req_sending...............: avg=24.11µs min=5.66µs  med=15.7µs  max=73.92ms  p(90)=22.45µs  p(95)=24.78µs  p(99.9)=673.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.02ms min=3.83ms  med=79.8ms  max=316.63ms p(90)=125.82ms p(95)=136.98ms p(99.9)=226.97ms
     http_reqs......................: 71961   597.094278/s
     iteration_duration.............: avg=83.5ms  min=15.48ms med=80.35ms max=327.06ms p(90)=126.19ms p(95)=137.42ms p(99.9)=227.88ms
     iterations.....................: 71861   596.264531/s
     success_rate...................: 100.00% ✓ 71861      ✗ 0    
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

     checks.........................: 100.00% ✓ 149622     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   497 kB/s
     http_req_blocked...............: avg=4.63µs   min=1.3µs   med=3.5µs    max=2.11ms   p(90)=4.95µs   p(95)=5.53µs   p(99.9)=126.19µs
     http_req_connecting............: avg=920ns    min=0s      med=0s       max=2.09ms   p(90)=0s       p(95)=0s       p(99.9)=62.96µs 
     http_req_duration..............: avg=119.83ms min=5.05ms  med=117.42ms max=332.41ms p(90)=158.36ms p(95)=170.61ms p(99.9)=221.5ms 
       { expected_response:true }...: avg=119.83ms min=5.05ms  med=117.42ms max=332.41ms p(90)=158.36ms p(95)=170.61ms p(99.9)=221.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 49974
     http_req_receiving.............: avg=84.11µs  min=31.7µs  med=79.15µs  max=39.21ms  p(90)=111.27µs p(95)=123.72µs p(99.9)=502.78µs
     http_req_sending...............: avg=27.37µs  min=5.87µs  med=16.27µs  max=73.93ms  p(90)=22.19µs  p(95)=24.13µs  p(99.9)=572.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.72ms min=4.98ms  med=117.31ms max=331.95ms p(90)=158.25ms p(95)=170.52ms p(99.9)=221.37ms
     http_reqs......................: 49974   414.161905/s
     iteration_duration.............: avg=120.33ms min=38.88ms med=117.74ms max=346.16ms p(90)=158.66ms p(95)=170.98ms p(99.9)=224.24ms
     iterations.....................: 49874   413.33315/s
     success_rate...................: 100.00% ✓ 49874      ✗ 0    
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

     checks.........................: 100.00% ✓ 96138      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.27µs   min=1.2µs   med=3.13µs   max=3.82ms   p(90)=4.44µs   p(95)=4.99µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=3.78ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=186.47ms min=7.95ms  med=184.75ms max=404.29ms p(90)=198.29ms p(95)=203.74ms p(99.9)=269.21ms
       { expected_response:true }...: avg=186.47ms min=7.95ms  med=184.75ms max=404.29ms p(90)=198.29ms p(95)=203.74ms p(99.9)=269.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32146
     http_req_receiving.............: avg=91.92µs  min=33.35µs med=88.44µs  max=11.19ms  p(90)=118.31µs p(95)=130.11µs p(99.9)=539.61µs
     http_req_sending...............: avg=25.81µs  min=5.47µs  med=17.41µs  max=115.07ms p(90)=21.94µs  p(95)=23.75µs  p(99.9)=509.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.35ms min=7.81ms  med=184.64ms max=403.95ms p(90)=198.19ms p(95)=203.62ms p(99.9)=269.13ms
     http_reqs......................: 32146   265.665816/s
     iteration_duration.............: avg=187.33ms min=37.38ms med=185.06ms max=414.32ms p(90)=198.58ms p(95)=204.05ms p(99.9)=271.27ms
     iterations.....................: 32046   264.839381/s
     success_rate...................: 100.00% ✓ 32046      ✗ 0    
     vus............................: 13      min=13       max=50 
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

     checks.........................: 100.00% ✓ 94362      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=7.09µs   min=1.55µs  med=3.72µs   max=3.86ms   p(90)=5.15µs   p(95)=5.73µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=190.04ms min=6.34ms  med=175.64ms max=668.03ms p(90)=219.47ms p(95)=272.48ms p(99.9)=547.98ms
       { expected_response:true }...: avg=190.04ms min=6.34ms  med=175.64ms max=668.03ms p(90)=219.47ms p(95)=272.48ms p(99.9)=547.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31554
     http_req_receiving.............: avg=96.36µs  min=37.17µs med=91.9µs   max=15.77ms  p(90)=122.69µs p(95)=134.77µs p(99.9)=711.23µs
     http_req_sending...............: avg=30.86µs  min=6.9µs   med=18.12µs  max=86.53ms  p(90)=22.88µs  p(95)=24.73µs  p(99.9)=548.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.91ms min=6.2ms   med=175.5ms  max=667.93ms p(90)=219.36ms p(95)=272.37ms p(99.9)=547.85ms
     http_reqs......................: 31554   260.574135/s
     iteration_duration.............: avg=190.92ms min=27.44ms med=176.01ms max=668.3ms  p(90)=219.85ms p(95)=274.47ms p(99.9)=548.36ms
     iterations.....................: 31454   259.748331/s
     success_rate...................: 100.00% ✓ 31454      ✗ 0    
     vus............................: 17      min=17       max=50 
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

     checks.........................: 100.00% ✓ 7767      ✗ 0   
     data_received..................: 257 MB  2.1 MB/s
     data_sent......................: 3.2 MB  26 kB/s
     http_req_blocked...............: avg=86.61µs  min=1.18µs   med=3.1µs   max=8.17ms  p(90)=4.54µs   p(95)=5.42µs  p(99.9)=7.46ms
     http_req_connecting............: avg=81.03µs  min=0s       med=0s      max=8.14ms  p(90)=0s       p(95)=0s      p(99.9)=7.35ms
     http_req_duration..............: avg=2.25s    min=26.05ms  med=2.26s   max=4.18s   p(90)=3.08s    p(95)=3.32s   p(99.9)=4.15s 
       { expected_response:true }...: avg=2.25s    min=26.05ms  med=2.26s   max=4.18s   p(90)=3.08s    p(95)=3.32s   p(99.9)=4.15s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2689
     http_req_receiving.............: avg=103.34µs min=28.65µs  med=90.33µs max=24.58ms p(90)=129.82µs p(95)=149.1µs p(99.9)=1.01ms
     http_req_sending...............: avg=54.74µs  min=5.34µs   med=17.85µs max=17.77ms p(90)=22.66µs  p(95)=26.74µs p(99.9)=2.36ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=2.25s    min=25.88ms  med=2.26s   max=4.18s   p(90)=3.08s    p(95)=3.32s   p(99.9)=4.15s 
     http_reqs......................: 2689    21.418189/s
     iteration_duration.............: avg=2.33s    min=571.39ms med=2.3s    max=4.18s   p(90)=3.09s    p(95)=3.33s   p(99.9)=4.15s 
     iterations.....................: 2589    20.621678/s
     success_rate...................: 100.00% ✓ 2589      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

