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
| hive-router | v0.0.84 | 3,172 | 3,391 | 3,113 | 2.9% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,763 | 2,872 | 2,749 | 1.6% |  |
| fusion | 16.6.4 | 2,707 | 2,819 | 2,696 | 1.6% |  |
| fusion-nightly | 16.7.0-p.2 | 2,630 | 2,760 | 2,608 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,436 | 2,507 | 2,413 | 1.3% |  |
| grafbase | 0.53.5 | 2,196 | 2,336 | 2,162 | 2.7% |  |
| cosmo | 0.334.0 | 1,326 | 1,369 | 1,319 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 609 | 627 | 608 | 1.2% |  |
| apollo-router | v2.16.1 | 485 | 502 | 481 | 1.4% |  |
| apollo-gateway | 2.14.3 | 282 | 285 | 280 | 0.5% |  |
| hive-gateway | 2.10.8 | 274 | 282 | 272 | 1.3% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% | non-compatible response (174 across 1/2 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.7.0-p.2 | 2,484 | 2,599 | 2,470 | 1.8% |  |
| fusion | 16.6.4 | 2,473 | 2,580 | 2,467 | 1.6% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,469 | 2,596 | 2,453 | 2.0% |  |
| hive-router | v0.0.84 | 2,449 | 2,652 | 2,433 | 3.2% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,328 | 2,429 | 2,317 | 1.7% |  |
| grafbase | 0.53.5 | 1,603 | 1,658 | 1,597 | 1.3% |  |
| cosmo | 0.334.0 | 1,188 | 1,232 | 1,183 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 565 | 588 | 562 | 1.7% |  |
| apollo-router | v2.16.1 | 445 | 463 | 443 | 1.5% |  |
| apollo-gateway | 2.14.3 | 271 | 274 | 270 | 0.5% |  |
| hive-gateway | 2.10.8 | 266 | 275 | 264 | 1.2% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 4.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1143510     ✗ 0     
     data_received..................: 33 GB   278 MB/s
     data_sent......................: 458 MB  3.8 MB/s
     http_req_blocked...............: avg=3.23µs  min=982ns   med=2.4µs   max=27.36ms  p(90)=3.76µs  p(95)=4.41µs   p(99.9)=35.86µs
     http_req_connecting............: avg=239ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.52ms min=1.43ms  med=14.75ms max=269.29ms p(90)=22.8ms  p(95)=26.1ms   p(99.9)=46.82ms
       { expected_response:true }...: avg=15.52ms min=1.43ms  med=14.75ms max=269.29ms p(90)=22.8ms  p(95)=26.1ms   p(99.9)=46.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 381270
     http_req_receiving.............: avg=96.39µs min=25.87µs med=47.41µs max=155.21ms p(90)=88.32µs p(95)=184.99µs p(99.9)=7.77ms 
     http_req_sending...............: avg=52.03µs min=4.5µs   med=8.96µs  max=120.08ms p(90)=15.53µs p(95)=104.92µs p(99.9)=7.87ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.37ms min=1.35ms  med=14.63ms max=269.06ms p(90)=22.61ms p(95)=25.82ms  p(99.9)=45.56ms
     http_reqs......................: 381270  3172.50259/s
     iteration_duration.............: avg=15.73ms min=1.96ms  med=14.94ms max=308.17ms p(90)=23ms    p(95)=26.33ms  p(99.9)=47.48ms
     iterations.....................: 381170  3171.670502/s
     success_rate...................: 100.00% ✓ 381170      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 996582      ✗ 0     
     data_received..................: 29 GB   242 MB/s
     data_sent......................: 399 MB  3.3 MB/s
     http_req_blocked...............: avg=2.61µs  min=882ns   med=1.92µs  max=14.71ms  p(90)=3.11µs  p(95)=3.72µs  p(99.9)=27.22µs
     http_req_connecting............: avg=259ns   min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.84ms min=1.89ms  med=17.02ms max=282.21ms p(90)=25.65ms p(95)=29.06ms p(99.9)=49.55ms
       { expected_response:true }...: avg=17.84ms min=1.89ms  med=17.02ms max=282.21ms p(90)=25.65ms p(95)=29.06ms p(99.9)=49.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 332294
     http_req_receiving.............: avg=461.4µs min=50.39µs med=89.99µs max=102.42ms p(90)=1.13ms  p(95)=1.75ms  p(99.9)=17.42ms
     http_req_sending...............: avg=40.56µs min=4.5µs   med=8.21µs  max=114.05ms p(90)=14.87µs p(95)=83.83µs p(99.9)=3.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.34ms min=1.79ms  med=16.53ms max=281.3ms  p(90)=25.04ms p(95)=28.4ms  p(99.9)=48.13ms
     http_reqs......................: 332294  2763.831194/s
     iteration_duration.............: avg=18.05ms min=3.12ms  med=17.22ms max=298.72ms p(90)=25.85ms p(95)=29.28ms p(99.9)=50.34ms
     iterations.....................: 332194  2762.999451/s
     success_rate...................: 100.00% ✓ 332194      ✗ 0     
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

     checks.........................: 100.00% ✓ 976353      ✗ 0     
     data_received..................: 29 GB   237 MB/s
     data_sent......................: 391 MB  3.3 MB/s
     http_req_blocked...............: avg=2.6µs    min=892ns   med=1.92µs  max=13.88ms  p(90)=3.13µs  p(95)=3.74µs  p(99.9)=27.1µs  
     http_req_connecting............: avg=269ns    min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.22ms  min=2.01ms  med=15.8ms  max=294.23ms p(90)=29.63ms p(95)=35.76ms p(99.9)=102.26ms
       { expected_response:true }...: avg=18.22ms  min=2.01ms  med=15.8ms  max=294.23ms p(90)=29.63ms p(95)=35.76ms p(99.9)=102.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 325551
     http_req_receiving.............: avg=544.22µs min=51.03µs med=88.16µs max=161.76ms p(90)=1.06ms  p(95)=1.91ms  p(99.9)=24.18ms 
     http_req_sending...............: avg=42.88µs  min=4.64µs  med=8.11µs  max=212.19ms p(90)=13.85µs p(95)=83.56µs p(99.9)=4.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=17.63ms  min=1.87ms  med=15.3ms  max=282.8ms  p(90)=28.73ms p(95)=34.71ms p(99.9)=101.51ms
     http_reqs......................: 325551  2707.120457/s
     iteration_duration.............: avg=18.42ms  min=3.05ms  med=15.99ms max=305.17ms p(90)=29.85ms p(95)=36.01ms p(99.9)=102.86ms
     iterations.....................: 325451  2706.288907/s
     success_rate...................: 100.00% ✓ 325451      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 948870      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=2.75µs   min=912ns   med=1.97µs  max=15.88ms  p(90)=3.2µs   p(95)=3.8µs   p(99.9)=32.29µs 
     http_req_connecting............: avg=290ns    min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.75ms  min=2.03ms  med=16.2ms  max=286.56ms p(90)=30.27ms p(95)=36.73ms p(99.9)=120.2ms 
       { expected_response:true }...: avg=18.75ms  min=2.03ms  med=16.2ms  max=286.56ms p(90)=30.27ms p(95)=36.73ms p(99.9)=120.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 316390
     http_req_receiving.............: avg=550.21µs min=49.99µs med=89.56µs max=160.71ms p(90)=1.05ms  p(95)=1.87ms  p(99.9)=25.47ms 
     http_req_sending...............: avg=42.36µs  min=4.58µs  med=8.48µs  max=120.92ms p(90)=15.22µs p(95)=83.63µs p(99.9)=4.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.15ms  min=1.95ms  med=15.68ms max=286.46ms p(90)=29.33ms p(95)=35.64ms p(99.9)=117.95ms
     http_reqs......................: 316390  2630.893966/s
     iteration_duration.............: avg=18.96ms  min=2.23ms  med=16.39ms max=363.36ms p(90)=30.48ms p(95)=36.96ms p(99.9)=120.8ms 
     iterations.....................: 316290  2630.062431/s
     success_rate...................: 100.00% ✓ 316290      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 878403      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=2.65µs   min=882ns   med=1.92µs  max=13.81ms  p(90)=3.12µs  p(95)=3.68µs  p(99.9)=27.3µs  
     http_req_connecting............: avg=348ns    min=0s      med=0s      max=3.89ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.27ms  min=1.74ms  med=16.4ms  max=428.2ms  p(90)=34.2ms  p(95)=43.15ms p(99.9)=171.71ms
       { expected_response:true }...: avg=20.27ms  min=1.74ms  med=16.4ms  max=428.2ms  p(90)=34.2ms  p(95)=43.15ms p(99.9)=171.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292901
     http_req_receiving.............: avg=586.23µs min=50.07µs med=89.09µs max=311.02ms p(90)=1.06ms  p(95)=1.89ms  p(99.9)=28.68ms 
     http_req_sending...............: avg=39.44µs  min=4.71µs  med=8.14µs  max=222.91ms p(90)=13.96µs p(95)=57.13µs p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.65ms  min=1.58ms  med=15.87ms max=427.77ms p(90)=33.21ms p(95)=41.97ms p(99.9)=169.87ms
     http_reqs......................: 292901  2436.302171/s
     iteration_duration.............: avg=20.48ms  min=2.51ms  med=16.6ms  max=428.39ms p(90)=34.42ms p(95)=43.37ms p(99.9)=172.53ms
     iterations.....................: 292801  2435.470387/s
     success_rate...................: 100.00% ✓ 292801      ✗ 0     
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

     checks.........................: 100.00% ✓ 791766      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 317 MB  2.6 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.07µs  med=2.66µs  max=6.7ms    p(90)=4.21µs  p(95)=4.96µs   p(99.9)=39.1µs 
     http_req_connecting............: avg=331ns   min=0s      med=0s      max=3.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.5ms  min=1.71ms  med=22.24ms max=304.26ms p(90)=26.87ms p(95)=28.89ms  p(99.9)=48.86ms
       { expected_response:true }...: avg=22.5ms  min=1.71ms  med=22.24ms max=304.26ms p(90)=26.87ms p(95)=28.89ms  p(99.9)=48.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 264022
     http_req_receiving.............: avg=97.18µs min=28.55µs med=58.2µs  max=199.99ms p(90)=97.74µs p(95)=133.91µs p(99.9)=7.41ms 
     http_req_sending...............: avg=38.86µs min=4.88µs  med=10.67µs max=96.62ms  p(90)=17.73µs p(95)=66.84µs  p(99.9)=1.87ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.36ms min=1.62ms  med=22.14ms max=303.76ms p(90)=26.73ms p(95)=28.69ms  p(99.9)=48.06ms
     http_reqs......................: 264022  2196.061/s
     iteration_duration.............: avg=22.72ms min=4.11ms  med=22.44ms max=316.81ms p(90)=27.09ms p(95)=29.12ms  p(99.9)=49.43ms
     iterations.....................: 263922  2195.229229/s
     success_rate...................: 100.00% ✓ 263922      ✗ 0     
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

     checks.........................: 100.00% ✓ 478467      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.12µs  min=1.06µs  med=2.53µs  max=2.35ms   p(90)=3.98µs  p(95)=4.63µs   p(99.9)=33.82µs 
     http_req_connecting............: avg=293ns   min=0s      med=0s      max=2.31ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.38ms min=2ms     med=36.99ms max=306.38ms p(90)=52.21ms p(95)=56.86ms  p(99.9)=77.88ms 
       { expected_response:true }...: avg=37.38ms min=2ms     med=36.99ms max=306.38ms p(90)=52.21ms p(95)=56.86ms  p(99.9)=77.88ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159589
     http_req_receiving.............: avg=75.67µs min=26.14µs med=60.7µs  max=135.7ms  p(90)=97.43µs p(95)=113.49µs p(99.9)=994.14µs
     http_req_sending...............: avg=25.83µs min=5.06µs  med=10.96µs max=134.19ms p(90)=17.4µs  p(95)=21.57µs  p(99.9)=986.33µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.28ms min=1.93ms  med=36.9ms  max=305.59ms p(90)=52.1ms  p(95)=56.73ms  p(99.9)=77.45ms 
     http_reqs......................: 159589  1326.903203/s
     iteration_duration.............: avg=37.61ms min=3.4ms   med=37.21ms max=329.47ms p(90)=52.42ms p(95)=57.06ms  p(99.9)=78.35ms 
     iterations.....................: 159489  1326.071752/s
     success_rate...................: 100.00% ✓ 159489      ✗ 0     
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

     checks.........................: 100.00% ✓ 219831    ✗ 0    
     data_received..................: 6.4 GB  54 MB/s
     data_sent......................: 88 MB   732 kB/s
     http_req_blocked...............: avg=3.74µs  min=1.25µs  med=2.94µs  max=1.83ms   p(90)=4.4µs    p(95)=5.02µs   p(99.9)=44.09µs 
     http_req_connecting............: avg=539ns   min=0s      med=0s      max=1.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.54ms min=3.56ms  med=80.25ms max=303.1ms  p(90)=103.28ms p(95)=114.09ms p(99.9)=196.62ms
       { expected_response:true }...: avg=81.54ms min=3.56ms  med=80.25ms max=303.1ms  p(90)=103.28ms p(95)=114.09ms p(99.9)=196.62ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 73377
     http_req_receiving.............: avg=79.92µs min=30.16µs med=69.47µs max=127.65ms p(90)=104.89µs p(95)=117.89µs p(99.9)=682.7µs 
     http_req_sending...............: avg=23.53µs min=5.15µs  med=13.5µs  max=144.61ms p(90)=20.19µs  p(95)=22.43µs  p(99.9)=611.51µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.44ms min=3.46ms  med=80.15ms max=288.24ms p(90)=103.18ms p(95)=113.97ms p(99.9)=196.19ms
     http_reqs......................: 73377   609.10971/s
     iteration_duration.............: avg=81.89ms min=25.29ms med=80.49ms max=310.94ms p(90)=103.54ms p(95)=114.36ms p(99.9)=197.73ms
     iterations.....................: 73277   608.2796/s
     success_rate...................: 100.00% ✓ 73277     ✗ 0    
     vus............................: 50      min=50      max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 175284     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   583 kB/s
     http_req_blocked...............: avg=4.72µs   min=1.1µs   med=3.08µs   max=3.37ms   p(90)=4.46µs   p(95)=5µs      p(99.9)=61.58µs 
     http_req_connecting............: avg=1.45µs   min=0s      med=0s       max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.28ms min=4.56ms  med=102ms    max=327.03ms p(90)=123.46ms p(95)=129.7ms  p(99.9)=159.18ms
       { expected_response:true }...: avg=102.28ms min=4.56ms  med=102ms    max=327.03ms p(90)=123.46ms p(95)=129.7ms  p(99.9)=159.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58528
     http_req_receiving.............: avg=85.71µs  min=28.43µs med=78.8µs   max=105.67ms p(90)=109.29µs p(95)=122.59µs p(99.9)=507.61µs
     http_req_sending...............: avg=23.56µs  min=5.17µs  med=15.62µs  max=98.45ms  p(90)=20.84µs  p(95)=22.69µs  p(99.9)=503.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.17ms min=4.49ms  med=101.91ms max=326.45ms p(90)=123.35ms p(95)=129.6ms  p(99.9)=158.63ms
     http_reqs......................: 58528   485.354221/s
     iteration_duration.............: avg=102.71ms min=16.51ms med=102.28ms max=348.44ms p(90)=123.73ms p(95)=129.97ms p(99.9)=160.64ms
     iterations.....................: 58428   484.524953/s
     success_rate...................: 100.00% ✓ 58428      ✗ 0    
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

     checks.........................: 100.00% ✓ 102072     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=6.06µs   min=1.43µs med=3.29µs   max=3.36ms   p(90)=4.52µs   p(95)=5.06µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=2.58µs   min=0s     med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=175.65ms min=7.51ms med=182.29ms max=392.26ms p(90)=197.92ms p(95)=203.34ms p(99.9)=277.87ms
       { expected_response:true }...: avg=175.65ms min=7.51ms med=182.29ms max=392.26ms p(90)=197.92ms p(95)=203.34ms p(99.9)=277.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34124
     http_req_receiving.............: avg=93.33µs  min=32.4µs med=80.1µs   max=137.44ms p(90)=111.14µs p(95)=122.63µs p(99.9)=564.24µs
     http_req_sending...............: avg=27.03µs  min=6.02µs med=15.79µs  max=72.12ms  p(90)=20.74µs  p(95)=22.6µs   p(99.9)=569.17µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.53ms min=7.4ms  med=182.18ms max=391.72ms p(90)=197.81ms p(95)=203.23ms p(99.9)=276.26ms
     http_reqs......................: 34124   282.217673/s
     iteration_duration.............: avg=176.44ms min=30.8ms med=182.56ms max=401.63ms p(90)=198.2ms  p(95)=203.63ms p(99.9)=283.67ms
     iterations.....................: 34024   281.390638/s
     success_rate...................: 100.00% ✓ 34024      ✗ 0    
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

     checks.........................: 100.00% ✓ 99246      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=6.66µs   min=1.5µs   med=3.67µs   max=4.13ms   p(90)=5.04µs   p(95)=5.64µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=180.7ms  min=5.91ms  med=168.23ms max=678.78ms p(90)=223.55ms p(95)=261.88ms p(99.9)=565.01ms
       { expected_response:true }...: avg=180.7ms  min=5.91ms  med=168.23ms max=678.78ms p(90)=223.55ms p(95)=261.88ms p(99.9)=565.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33182
     http_req_receiving.............: avg=93.27µs  min=37.64µs med=88.77µs  max=10.28ms  p(90)=118.91µs p(95)=130.85µs p(99.9)=646.36µs
     http_req_sending...............: avg=33.07µs  min=5.55µs  med=18.23µs  max=107.85ms p(90)=22.7µs   p(95)=24.34µs  p(99.9)=572.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.57ms min=5.79ms  med=168.11ms max=678.67ms p(90)=223.42ms p(95)=261.76ms p(99.9)=564.92ms
     http_reqs......................: 33182   274.376884/s
     iteration_duration.............: avg=181.51ms min=41.67ms med=168.67ms max=679.04ms p(90)=223.98ms p(95)=262.94ms p(99.9)=565.26ms
     iterations.....................: 33082   273.549999/s
     success_rate...................: 100.00% ✓ 33082      ✗ 0    
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
data_received..................: 3.3 MB 54 kB/s
     data_sent......................: 42 kB  699 B/s
     http_req_blocked...............: avg=35.53µs  min=2.43µs  med=3.58µs  max=1.07ms   p(90)=5.49µs   p(95)=9.3µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=29.19µs  min=0s      med=0s      max=992.65µs p(90)=0s       p(95)=0s      p(99.9)=959.89µs
     http_req_duration..............: avg=913.72ms min=23.28ms med=32.13ms max=30.01s   p(90)=42.78ms  p(95)=44.26ms p(99.9)=29.02s  
       { expected_response:true }...: avg=913.72ms min=23.28ms med=32.13ms max=30.01s   p(90)=42.78ms  p(95)=44.26ms p(99.9)=29.02s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 34  
     http_req_receiving.............: avg=141.1µs  min=85.07µs med=127.4µs max=361.56µs p(90)=201.23µs p(95)=285µs   p(99.9)=360.15µs
     http_req_sending...............: avg=26.77µs  min=13.97µs med=19µs    max=170.41µs p(90)=23.47µs  p(95)=62.96µs p(99.9)=169.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=913.55ms min=23.18ms med=32.02ms max=30.01s   p(90)=42.41ms  p(95)=43.95ms p(99.9)=29.02s  
     http_reqs......................: 34     0.566656/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 895650      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=2.85µs   min=841ns   med=2.01µs  max=16.24ms  p(90)=3.54µs  p(95)=4.27µs  p(99.9)=33.21µs 
     http_req_connecting............: avg=306ns    min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.87ms  min=1.61ms  med=16.56ms max=350.19ms p(90)=32.67ms p(95)=40.25ms p(99.9)=151.31ms
       { expected_response:true }...: avg=19.87ms  min=1.61ms  med=16.56ms max=350.19ms p(90)=32.67ms p(95)=40.25ms p(99.9)=151.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298650
     http_req_receiving.............: avg=561.71µs min=49.83µs med=92.84µs max=159.11ms p(90)=1.07ms  p(95)=1.84ms  p(99.9)=27.73ms 
     http_req_sending...............: avg=42.49µs  min=4.72µs  med=8.63µs  max=162.26ms p(90)=17.63µs p(95)=83.5µs  p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.26ms  min=1.48ms  med=16.05ms max=350.11ms p(90)=31.68ms p(95)=39.19ms p(99.9)=149.83ms
     http_reqs......................: 298650  2484.545648/s
     iteration_duration.............: avg=20.08ms  min=2.54ms  med=16.75ms max=350.39ms p(90)=32.9ms  p(95)=40.48ms p(99.9)=152.46ms
     iterations.....................: 298550  2483.713722/s
     success_rate...................: 100.00% ✓ 298550      ✗ 0     
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

     checks.........................: 100.00% ✓ 891567      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.93µs   min=842ns  med=2.06µs  max=10.79ms  p(90)=3.68µs  p(95)=4.42µs  p(99.9)=32.83µs 
     http_req_connecting............: avg=284ns    min=0s     med=0s      max=3.39ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.96ms  min=1.58ms med=16.77ms max=299.82ms p(90)=32.78ms p(95)=39.99ms p(99.9)=140.1ms 
       { expected_response:true }...: avg=19.96ms  min=1.58ms med=16.77ms max=299.82ms p(90)=32.78ms p(95)=39.99ms p(99.9)=140.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 297289
     http_req_receiving.............: avg=573.72µs min=48.9µs med=93.85µs max=257.22ms p(90)=1.08ms  p(95)=1.88ms  p(99.9)=27.15ms 
     http_req_sending...............: avg=43.19µs  min=4.52µs med=8.93µs  max=267.91ms p(90)=18.54µs p(95)=82.45µs p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.34ms  min=1.5ms  med=16.25ms max=271.44ms p(90)=31.81ms p(95)=38.87ms p(99.9)=136.44ms
     http_reqs......................: 297289  2473.220303/s
     iteration_duration.............: avg=20.17ms  min=2.52ms med=16.97ms max=334.63ms p(90)=33ms    p(95)=40.23ms p(99.9)=141ms   
     iterations.....................: 297189  2472.388378/s
     success_rate...................: 100.00% ✓ 297189      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 890217      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.91µs   min=871ns   med=2µs      max=15.44ms  p(90)=3.46µs  p(95)=4.17µs  p(99.9)=31.56µs
     http_req_connecting............: avg=326ns    min=0s      med=0s       max=3.6ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.99ms  min=1.56ms  med=19.17ms  max=280.45ms p(90)=28.96ms p(95)=32.48ms p(99.9)=53.73ms
       { expected_response:true }...: avg=19.99ms  min=1.56ms  med=19.17ms  max=280.45ms p(90)=28.96ms p(95)=32.48ms p(99.9)=53.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296839
     http_req_receiving.............: avg=559.09µs min=52.85µs med=106.27µs max=36.14ms  p(90)=1.38ms  p(95)=2.14ms  p(99.9)=17.5ms 
     http_req_sending...............: avg=40.41µs  min=4.8µs   med=8.7µs    max=115.1ms  p(90)=17.28µs p(95)=77.85µs p(99.9)=2.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.39ms  min=1.47ms  med=18.56ms  max=280.11ms p(90)=28.24ms p(95)=31.73ms p(99.9)=51.86ms
     http_reqs......................: 296839  2469.48086/s
     iteration_duration.............: avg=20.21ms  min=2.78ms  med=19.37ms  max=294.64ms p(90)=29.17ms p(95)=32.7ms  p(99.9)=54.16ms
     iterations.....................: 296739  2468.648934/s
     success_rate...................: 100.00% ✓ 296739      ✗ 0     
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

     checks.........................: 100.00% ✓ 883035      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 354 MB  2.9 MB/s
     http_req_blocked...............: avg=3.4µs    min=1µs     med=2.54µs  max=15.47ms  p(90)=4.05µs  p(95)=4.74µs   p(99.9)=36.89µs
     http_req_connecting............: avg=305ns    min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.16ms  min=1.74ms  med=19.96ms max=322.14ms p(90)=28.09ms p(95)=30.52ms  p(99.9)=48.85ms
       { expected_response:true }...: avg=20.16ms  min=1.74ms  med=19.96ms max=322.14ms p(90)=28.09ms p(95)=30.52ms  p(99.9)=48.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 294445
     http_req_receiving.............: avg=107.97µs min=26.42µs med=52.92µs max=287.76ms p(90)=89.49µs p(95)=124.37µs p(99.9)=6.64ms 
     http_req_sending...............: avg=42.28µs  min=4.93µs  med=10.3µs  max=42.21ms  p(90)=16.98µs p(95)=79.21µs  p(99.9)=3.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.01ms  min=1.64ms  med=19.85ms max=113.41ms p(90)=27.95ms p(95)=30.34ms  p(99.9)=47.2ms 
     http_reqs......................: 294445  2449.269209/s
     iteration_duration.............: avg=20.37ms  min=2.38ms  med=20.16ms max=337.13ms p(90)=28.3ms  p(95)=30.75ms  p(99.9)=49.52ms
     iterations.....................: 294345  2448.437383/s
     success_rate...................: 100.00% ✓ 294345      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 839400      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 336 MB  2.8 MB/s
     http_req_blocked...............: avg=3.17µs   min=1.01µs  med=2.62µs   max=2.02ms   p(90)=4.22µs  p(95)=4.98µs  p(99.9)=39.74µs 
     http_req_connecting............: avg=142ns    min=0s      med=0s       max=1.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.2ms   min=1.78ms  med=17.97ms  max=341.39ms p(90)=34.62ms p(95)=42.45ms p(99.9)=141.49ms
       { expected_response:true }...: avg=21.2ms   min=1.78ms  med=17.97ms  max=341.39ms p(90)=34.62ms p(95)=42.45ms p(99.9)=141.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 279900
     http_req_receiving.............: avg=584.25µs min=51.44µs med=100.99µs max=140.39ms p(90)=1.12ms  p(95)=1.97ms  p(99.9)=28.36ms 
     http_req_sending...............: avg=47.82µs  min=4.67µs  med=10.49µs  max=137.26ms p(90)=19.56µs p(95)=95.77µs p(99.9)=3.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.56ms  min=1.7ms   med=17.41ms  max=338.64ms p(90)=33.61ms p(95)=41.31ms p(99.9)=139.93ms
     http_reqs......................: 279900  2328.045619/s
     iteration_duration.............: avg=21.43ms  min=2.86ms  med=18.18ms  max=341.62ms p(90)=34.85ms p(95)=42.7ms  p(99.9)=143.17ms
     iterations.....................: 279800  2327.213877/s
     success_rate...................: 100.00% ✓ 279800      ✗ 0     
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

     checks.........................: 100.00% ✓ 578457      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.58µs  min=862ns   med=2.74µs  max=6.23ms   p(90)=5.08µs   p(95)=6.15µs   p(99.9)=47.57µs
     http_req_connecting............: avg=246ns   min=0s      med=0s      max=2.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.85ms min=2.25ms  med=30.31ms max=306.52ms p(90)=40.93ms  p(95)=44.41ms  p(99.9)=67.91ms
       { expected_response:true }...: avg=30.85ms min=2.25ms  med=30.31ms max=306.52ms p(90)=40.93ms  p(95)=44.41ms  p(99.9)=67.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192919
     http_req_receiving.............: avg=102.8µs min=27.28µs med=59.19µs max=154.81ms p(90)=134.09µs p(95)=229.23µs p(99.9)=4.35ms 
     http_req_sending...............: avg=47.2µs  min=4.85µs  med=10.38µs max=161.81ms p(90)=25.81µs  p(95)=121.68µs p(99.9)=3.44ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.7ms  min=2.17ms  med=30.18ms max=284.98ms p(90)=40.75ms  p(95)=44.22ms  p(99.9)=67.41ms
     http_reqs......................: 192919  1603.487173/s
     iteration_duration.............: avg=31.11ms min=6.49ms  med=30.54ms max=315.75ms p(90)=41.15ms  p(95)=44.64ms  p(99.9)=68.18ms
     iterations.....................: 192819  1602.656002/s
     success_rate...................: 100.00% ✓ 192819      ✗ 0     
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

     checks.........................: 100.00% ✓ 428640      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=4.05µs  min=1.1µs  med=3.09µs  max=4.02ms   p(90)=4.72µs   p(95)=5.43µs   p(99.9)=39.51µs 
     http_req_connecting............: avg=644ns   min=0s     med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.72ms min=2.16ms med=41.34ms max=296.29ms p(90)=58.11ms  p(95)=63.33ms  p(99.9)=87.92ms 
       { expected_response:true }...: avg=41.72ms min=2.16ms med=41.34ms max=296.29ms p(90)=58.11ms  p(95)=63.33ms  p(99.9)=87.92ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142980
     http_req_receiving.............: avg=84.93µs min=26.8µs med=68.54µs max=66.5ms   p(90)=109.41µs p(95)=126.85µs p(99.9)=897.93µs
     http_req_sending...............: avg=26.57µs min=5.23µs med=12.84µs max=145.28ms p(90)=19.43µs  p(95)=23.14µs  p(99.9)=998.02µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.61ms min=2.04ms med=41.23ms max=295.8ms  p(90)=58ms     p(95)=63.21ms  p(99.9)=87.55ms 
     http_reqs......................: 142980  1188.703527/s
     iteration_duration.............: avg=41.98ms min=3.96ms med=41.57ms max=309.73ms p(90)=58.33ms  p(95)=63.56ms  p(99.9)=88.42ms 
     iterations.....................: 142880  1187.87215/s
     success_rate...................: 100.00% ✓ 142880      ✗ 0     
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

     checks.........................: 100.00% ✓ 204138     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   679 kB/s
     http_req_blocked...............: avg=4.09µs  min=1.01µs  med=2.48µs  max=3.66ms   p(90)=3.97µs   p(95)=4.57µs   p(99.9)=42.71µs 
     http_req_connecting............: avg=1.34µs  min=0s      med=0s      max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.83ms min=3.97ms  med=86.34ms max=319.23ms p(90)=109.78ms p(95)=120.86ms p(99.9)=208.97ms
       { expected_response:true }...: avg=87.83ms min=3.97ms  med=86.34ms max=319.23ms p(90)=109.78ms p(95)=120.86ms p(99.9)=208.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68146
     http_req_receiving.............: avg=80.39µs min=27.91µs med=70.18µs max=170.73ms p(90)=106.77µs p(95)=119.65µs p(99.9)=562.78µs
     http_req_sending...............: avg=24.28µs min=4.86µs  med=12.69µs max=189.35ms p(90)=19.6µs   p(95)=21.64µs  p(99.9)=560.87µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.72ms min=3.84ms  med=86.24ms max=318.87ms p(90)=109.68ms p(95)=120.71ms p(99.9)=208.58ms
     http_reqs......................: 68146   565.377683/s
     iteration_duration.............: avg=88.18ms min=24.2ms  med=86.58ms max=333.74ms p(90)=110.03ms p(95)=121.11ms p(99.9)=210.54ms
     iterations.....................: 68046   564.548026/s
     success_rate...................: 100.00% ✓ 68046      ✗ 0    
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

     checks.........................: 100.00% ✓ 160998     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   535 kB/s
     http_req_blocked...............: avg=5.01µs   min=1.16µs  med=3.22µs   max=4.36ms   p(90)=4.76µs   p(95)=5.33µs   p(99.9)=67.19µs 
     http_req_connecting............: avg=1.4µs    min=0s      med=0s       max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.35ms min=5.23ms  med=109.21ms max=323.1ms  p(90)=147.07ms p(95)=158.38ms p(99.9)=202.43ms
       { expected_response:true }...: avg=111.35ms min=5.23ms  med=109.21ms max=323.1ms  p(90)=147.07ms p(95)=158.38ms p(99.9)=202.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53766
     http_req_receiving.............: avg=84.74µs  min=28.96µs med=81.8µs   max=23.22ms  p(90)=112.14µs p(95)=124.35µs p(99.9)=496.23µs
     http_req_sending...............: avg=25.6µs   min=5.56µs  med=16.83µs  max=184.69ms p(90)=22.12µs  p(95)=24.04µs  p(99.9)=500.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.24ms min=5.11ms  med=109.11ms max=294.56ms p(90)=146.95ms p(95)=158.27ms p(99.9)=202.11ms
     http_reqs......................: 53766   445.625245/s
     iteration_duration.............: avg=111.82ms min=21.49ms med=109.54ms max=323.41ms p(90)=147.37ms p(95)=158.71ms p(99.9)=204.32ms
     iterations.....................: 53666   444.796421/s
     success_rate...................: 100.00% ✓ 53666      ✗ 0    
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

     checks.........................: 100.00% ✓ 98205      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   326 kB/s
     http_req_blocked...............: avg=5.28µs   min=1.41µs  med=3.63µs   max=2.35ms   p(90)=5.1µs    p(95)=5.68µs   p(99.9)=461.36µs
     http_req_connecting............: avg=1.37µs   min=0s      med=0s       max=2.31ms   p(90)=0s       p(95)=0s       p(99.9)=438.25µs
     http_req_duration..............: avg=182.57ms min=7.78ms  med=175.38ms max=346.64ms p(90)=220.42ms p(95)=225.47ms p(99.9)=284.17ms
       { expected_response:true }...: avg=182.57ms min=7.78ms  med=175.38ms max=346.64ms p(90)=220.42ms p(95)=225.47ms p(99.9)=284.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32835
     http_req_receiving.............: avg=95.62µs  min=34.83µs med=90.82µs  max=26.65ms  p(90)=122.17µs p(95)=134.84µs p(99.9)=492.21µs
     http_req_sending...............: avg=25.85µs  min=6.62µs  med=18.24µs  max=49.57ms  p(90)=23.14µs  p(95)=25.07µs  p(99.9)=518.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.45ms min=7.64ms  med=175.27ms max=346.37ms p(90)=220.31ms p(95)=225.35ms p(99.9)=284.06ms
     http_reqs......................: 32835   271.378577/s
     iteration_duration.............: avg=183.4ms  min=49.9ms  med=175.68ms max=354.66ms p(90)=220.74ms p(95)=225.75ms p(99.9)=284.98ms
     iterations.....................: 32735   270.552085/s
     success_rate...................: 100.00% ✓ 32735      ✗ 0    
     vus............................: 4       min=4        max=50 
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

     checks.........................: 100.00% ✓ 96273      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.6µs    min=1.21µs  med=3.27µs   max=3.85ms   p(90)=4.62µs   p(95)=5.18µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=186.22ms min=5.94ms  med=172.4ms  max=657.01ms p(90)=235.72ms p(95)=286.6ms  p(99.9)=560.45ms
       { expected_response:true }...: avg=186.22ms min=5.94ms  med=172.4ms  max=657.01ms p(90)=235.72ms p(95)=286.6ms  p(99.9)=560.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32191
     http_req_receiving.............: avg=94.36µs  min=33.09µs med=90.16µs  max=29.16ms  p(90)=120.16µs p(95)=131.96µs p(99.9)=867.53µs
     http_req_sending...............: avg=29.92µs  min=5.35µs  med=17.8µs   max=95.47ms  p(90)=22.21µs  p(95)=23.95µs  p(99.9)=548.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.09ms min=5.77ms  med=172.29ms max=656.88ms p(90)=235.59ms p(95)=286.5ms  p(99.9)=560.29ms
     http_reqs......................: 32191   266.331401/s
     iteration_duration.............: avg=187.06ms min=63.78ms med=172.88ms max=657.29ms p(90)=236.13ms p(95)=288.69ms p(99.9)=560.76ms
     iterations.....................: 32091   265.504054/s
     success_rate...................: 100.00% ✓ 32091      ✗ 0    
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

     checks.........................: 100.00% ✓ 7431      ✗ 0   
     data_received..................: 247 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=90.7µs   min=1.18µs   med=3.24µs  max=7.71ms  p(90)=4.8µs    p(95)=5.66µs   p(99.9)=6.46ms  
     http_req_connecting............: avg=83.96µs  min=0s       med=0s      max=7.67ms  p(90)=0s       p(95)=0s       p(99.9)=6.44ms  
     http_req_duration..............: avg=2.34s    min=25.68ms  med=2.35s   max=4.48s   p(90)=3.14s    p(95)=3.45s    p(99.9)=4.32s   
       { expected_response:true }...: avg=2.34s    min=25.68ms  med=2.35s   max=4.48s   p(90)=3.14s    p(95)=3.45s    p(99.9)=4.32s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2577
     http_req_receiving.............: avg=103.5µs  min=32.36µs  med=94.48µs max=11.07ms p(90)=136.76µs p(95)=154.67µs p(99.9)=354.84µs
     http_req_sending...............: avg=103.35µs min=6.05µs   med=18.8µs  max=43.05ms p(90)=23.76µs  p(95)=27.32µs  p(99.9)=8.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.34s    min=25.53ms  med=2.35s   max=4.48s   p(90)=3.14s    p(95)=3.45s    p(99.9)=4.32s   
     http_reqs......................: 2577    20.646992/s
     iteration_duration.............: avg=2.43s    min=974.86ms med=2.39s   max=4.48s   p(90)=3.16s    p(95)=3.47s    p(99.9)=4.33s   
     iterations.....................: 2477    19.845789/s
     success_rate...................: 100.00% ✓ 2477      ✗ 0   
     vus............................: 44      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

