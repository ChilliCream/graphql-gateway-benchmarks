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
| hive-router | v0.0.83 | 3,082 | 3,263 | 3,037 | 2.5% |  |
| fusion-nightly-net11 | 16.6.0-p.2 | 2,707 | 2,858 | 2,689 | 2.1% |  |
| fusion-nightly | 16.6.0-p.2 | 2,631 | 2,762 | 2,618 | 1.9% |  |
| fusion | 16.5.1 | 2,474 | 2,599 | 2,459 | 2.0% |  |
| grafbase | 0.53.5 | 2,158 | 2,275 | 2,140 | 2.1% |  |
| cosmo | 0.331.1 | 1,288 | 1,332 | 1,282 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.4 | 614 | 631 | 611 | 1.2% |  |
| apollo-router | v2.16.0 | 494 | 510 | 491 | 1.4% |  |
| apollo-gateway | 2.14.2 | 287 | 291 | 286 | 0.6% |  |
| hive-gateway | 2.10.4 | 278 | 287 | 277 | 1.3% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1640 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.2 | 2,427 | 2,536 | 2,419 | 1.7% |  |
| fusion | 16.5.1 | 2,424 | 2,530 | 2,414 | 1.8% |  |
| hive-router | v0.0.83 | 2,383 | 2,545 | 2,361 | 2.7% |  |
| fusion-nightly | 16.6.0-p.2 | 2,378 | 2,473 | 2,362 | 1.5% |  |
| fusion-nightly-fed | 16.6.0-p.2 | 2,191 | 2,298 | 2,183 | 1.8% |  |
| grafbase | 0.53.5 | 1,632 | 1,690 | 1,628 | 1.3% |  |
| cosmo | 0.331.1 | 1,192 | 1,238 | 1,185 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.4 | 579 | 602 | 573 | 1.7% |  |
| apollo-router | v2.16.0 | 449 | 468 | 446 | 1.8% |  |
| apollo-gateway | 2.14.2 | 271 | 276 | 269 | 0.8% |  |
| hive-gateway | 2.10.4 | 270 | 277 | 269 | 1.2% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 20 | 2.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1111026     ✗ 0     
     data_received..................: 33 GB   270 MB/s
     data_sent......................: 445 MB  3.7 MB/s
     http_req_blocked...............: avg=2.61µs  min=911ns   med=2µs     max=7.86ms   p(90)=3.19µs  p(95)=3.79µs   p(99.9)=28.99µs
     http_req_connecting............: avg=252ns   min=0s      med=0s      max=3.86ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.98ms min=1.47ms  med=15.29ms max=270.5ms  p(90)=23.4ms  p(95)=26.49ms  p(99.9)=46.2ms 
       { expected_response:true }...: avg=15.98ms min=1.47ms  med=15.29ms max=270.5ms  p(90)=23.4ms  p(95)=26.49ms  p(99.9)=46.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 370442
     http_req_receiving.............: avg=85.33µs min=24.95µs med=43.85µs max=140.68ms p(90)=80.29µs p(95)=146.21µs p(99.9)=7.49ms 
     http_req_sending...............: avg=46.48µs min=4.64µs  med=8.28µs  max=234.08ms p(90)=14.21µs p(95)=91.41µs  p(99.9)=5.92ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.85ms min=1.41ms  med=15.18ms max=269.97ms p(90)=23.23ms p(95)=26.25ms  p(99.9)=44.97ms
     http_reqs......................: 370442  3082.085834/s
     iteration_duration.............: avg=16.19ms min=2.03ms  med=15.48ms max=289.57ms p(90)=23.61ms p(95)=26.72ms  p(99.9)=46.93ms
     iterations.....................: 370342  3081.253831/s
     success_rate...................: 100.00% ✓ 370342      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 976410      ✗ 0     
     data_received..................: 29 GB   237 MB/s
     data_sent......................: 391 MB  3.3 MB/s
     http_req_blocked...............: avg=3.08µs   min=1.01µs  med=2.26µs   max=17.14ms  p(90)=3.5µs   p(95)=4.07µs  p(99.9)=30.12µs
     http_req_connecting............: avg=291ns    min=0s      med=0s       max=3.82ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.21ms  min=1.95ms  med=17.32ms  max=283.68ms p(90)=26.13ms p(95)=29.76ms p(99.9)=50.6ms 
       { expected_response:true }...: avg=18.21ms  min=1.95ms  med=17.32ms  max=283.68ms p(90)=26.13ms p(95)=29.76ms p(99.9)=50.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 325570
     http_req_receiving.............: avg=657.62µs min=52.32µs med=102.34µs max=225.83ms p(90)=1.67ms  p(95)=2.52ms  p(99.9)=19.63ms
     http_req_sending...............: avg=44.03µs  min=4.48µs  med=8.45µs   max=119.16ms p(90)=14.84µs p(95)=90.26µs p(99.9)=4.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.51ms  min=1.83ms  med=16.62ms  max=273.6ms  p(90)=25.29ms p(95)=28.85ms p(99.9)=48.97ms
     http_reqs......................: 325570  2707.524609/s
     iteration_duration.............: avg=18.42ms  min=3.08ms  med=17.51ms  max=297.89ms p(90)=26.34ms p(95)=29.99ms p(99.9)=51.19ms
     iterations.....................: 325470  2706.692983/s
     success_rate...................: 100.00% ✓ 325470      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 948912      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=2.78µs   min=931ns   med=2.02µs  max=18.07ms  p(90)=3.27µs  p(95)=3.86µs  p(99.9)=28.16µs 
     http_req_connecting............: avg=299ns    min=0s      med=0s      max=3.75ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.75ms  min=2ms     med=16.18ms max=275.88ms p(90)=30.43ms p(95)=36.9ms  p(99.9)=111.57ms
       { expected_response:true }...: avg=18.75ms  min=2ms     med=16.18ms max=275.88ms p(90)=30.43ms p(95)=36.9ms  p(99.9)=111.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 316404
     http_req_receiving.............: avg=551.37µs min=51.35µs med=89.94µs max=160.01ms p(90)=1.05ms  p(95)=1.9ms   p(99.9)=24.98ms 
     http_req_sending...............: avg=43.95µs  min=4.55µs  med=8.28µs  max=208.8ms  p(90)=14.3µs  p(95)=82.34µs p(99.9)=4.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.15ms  min=1.89ms  med=15.66ms max=275.56ms p(90)=29.49ms p(95)=35.8ms  p(99.9)=109.88ms
     http_reqs......................: 316404  2631.041338/s
     iteration_duration.............: avg=18.96ms  min=2.97ms  med=16.38ms max=304.15ms p(90)=30.66ms p(95)=37.15ms p(99.9)=112.29ms
     iterations.....................: 316304  2630.209793/s
     success_rate...................: 100.00% ✓ 316304      ✗ 0     
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

     checks.........................: 100.00% ✓ 892470      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=3.06µs   min=1.07µs  med=2.45µs  max=21.05ms  p(90)=3.68µs  p(95)=4.25µs  p(99.9)=33.44µs 
     http_req_connecting............: avg=211ns    min=0s      med=0s      max=2.68ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.94ms  min=2.14ms  med=17.1ms  max=347.55ms p(90)=32.41ms p(95)=39.31ms p(99.9)=129.59ms
       { expected_response:true }...: avg=19.94ms  min=2.14ms  med=17.1ms  max=347.55ms p(90)=32.41ms p(95)=39.31ms p(99.9)=129.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297590
     http_req_receiving.............: avg=600.72µs min=51.64µs med=95.94µs max=144.46ms p(90)=1.12ms  p(95)=2.01ms  p(99.9)=26.58ms 
     http_req_sending...............: avg=42.86µs  min=4.74µs  med=8.96µs  max=239.96ms p(90)=14.89µs p(95)=85.73µs p(99.9)=3.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.3ms   min=1.97ms  med=16.56ms max=347.42ms p(90)=31.36ms p(95)=38.13ms p(99.9)=128.37ms
     http_reqs......................: 297590  2474.485628/s
     iteration_duration.............: avg=20.16ms  min=2.66ms  med=17.3ms  max=347.76ms p(90)=32.62ms p(95)=39.54ms p(99.9)=130.36ms
     iterations.....................: 297490  2473.65412/s
     success_rate...................: 100.00% ✓ 297490      ✗ 0     
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

     checks.........................: 100.00% ✓ 778410      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=2.97µs  min=912ns   med=2.13µs  max=14.4ms   p(90)=3.72µs  p(95)=4.5µs    p(99.9)=37.48µs
     http_req_connecting............: avg=356ns   min=0s      med=0s      max=3.46ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.9ms  min=1.73ms  med=22.66ms max=304.15ms p(90)=27.23ms p(95)=29.02ms  p(99.9)=47.23ms
       { expected_response:true }...: avg=22.9ms  min=1.73ms  med=22.66ms max=304.15ms p(90)=27.23ms p(95)=29.02ms  p(99.9)=47.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259570
     http_req_receiving.............: avg=86.75µs min=27.07µs med=53.22µs max=184.06ms p(90)=92.45µs p(95)=118.22µs p(99.9)=5.51ms 
     http_req_sending...............: avg=35.02µs min=4.6µs   med=9.43µs  max=182.87ms p(90)=16.98µs p(95)=24.84µs  p(99.9)=1.64ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.78ms min=1.64ms  med=22.57ms max=295.22ms p(90)=27.1ms  p(95)=28.85ms  p(99.9)=46.27ms
     http_reqs......................: 259570  2158.952907/s
     iteration_duration.............: avg=23.11ms min=4.42ms  med=22.86ms max=321.76ms p(90)=27.44ms p(95)=29.23ms  p(99.9)=47.68ms
     iterations.....................: 259470  2158.121164/s
     success_rate...................: 100.00% ✓ 259470      ✗ 0     
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

     checks.........................: 100.00% ✓ 464553      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=3.32µs  min=1.09µs  med=2.44µs  max=3.51ms   p(90)=3.85µs  p(95)=4.49µs   p(99.9)=35.32µs 
     http_req_connecting............: avg=562ns   min=0s      med=0s      max=3.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.51ms min=2ms     med=38.07ms max=318.36ms p(90)=53.99ms p(95)=58.76ms  p(99.9)=80.9ms  
       { expected_response:true }...: avg=38.51ms min=2ms     med=38.07ms max=318.36ms p(90)=53.99ms p(95)=58.76ms  p(99.9)=80.9ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 154951
     http_req_receiving.............: avg=72.47µs min=26.98µs med=58.36µs max=231.92ms p(90)=92.95µs p(95)=108.83µs p(99.9)=894.52µs
     http_req_sending...............: avg=23.25µs min=4.6µs   med=10.15µs max=156.6ms  p(90)=15.7µs  p(95)=19.6µs   p(99.9)=986.29µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.41ms min=1.89ms  med=37.98ms max=317.21ms p(90)=53.9ms  p(95)=58.66ms  p(99.9)=80.8ms  
     http_reqs......................: 154951  1288.294325/s
     iteration_duration.............: avg=38.74ms min=3.47ms  med=38.27ms max=336.97ms p(90)=54.2ms  p(95)=58.95ms  p(99.9)=81.22ms 
     iterations.....................: 154851  1287.462904/s
     success_rate...................: 100.00% ✓ 154851      ✗ 0     
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

     checks.........................: 100.00% ✓ 221667     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   738 kB/s
     http_req_blocked...............: avg=6.38µs  min=1.09µs  med=2.99µs  max=10.03ms  p(90)=4.43µs   p(95)=5.08µs   p(99.9)=45.92µs 
     http_req_connecting............: avg=3.08µs  min=0s      med=0s      max=10.01ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.87ms min=3.59ms  med=78.35ms max=300.04ms p(90)=100.99ms p(95)=112.2ms  p(99.9)=190.36ms
       { expected_response:true }...: avg=80.87ms min=3.59ms  med=78.35ms max=300.04ms p(90)=100.99ms p(95)=112.2ms  p(99.9)=190.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73989
     http_req_receiving.............: avg=82.4µs  min=30.46µs med=71.22µs max=118.32ms p(90)=106.49µs p(95)=119.49µs p(99.9)=651.4µs 
     http_req_sending...............: avg=21.51µs min=5µs     med=13.88µs max=66.34ms  p(90)=20.76µs  p(95)=23.09µs  p(99.9)=641.16µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.76ms min=3.52ms  med=78.25ms max=289.93ms p(90)=100.87ms p(95)=112.09ms p(99.9)=190.17ms
     http_reqs......................: 73989   614.138909/s
     iteration_duration.............: avg=81.21ms min=21.09ms med=78.6ms  max=312.42ms p(90)=101.22ms p(95)=112.47ms p(99.9)=191.81ms
     iterations.....................: 73889   613.308868/s
     success_rate...................: 100.00% ✓ 73889      ✗ 0    
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

     checks.........................: 100.00% ✓ 178713     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 72 MB   594 kB/s
     http_req_blocked...............: avg=5.08µs   min=1.3µs   med=3.42µs   max=3.48ms   p(90)=4.85µs   p(95)=5.45µs   p(99.9)=48.89µs 
     http_req_connecting............: avg=1.41µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=100.31ms min=4.64ms  med=100.13ms max=338.1ms  p(90)=120.82ms p(95)=126.96ms p(99.9)=155.45ms
       { expected_response:true }...: avg=100.31ms min=4.64ms  med=100.13ms max=338.1ms  p(90)=120.82ms p(95)=126.96ms p(99.9)=155.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59671
     http_req_receiving.............: avg=84.9µs   min=33.17µs med=78.41µs  max=93.4ms   p(90)=111.29µs p(95)=124.21µs p(99.9)=572.93µs
     http_req_sending...............: avg=26.59µs  min=6.41µs  med=16.72µs  max=101.33ms p(90)=22.26µs  p(95)=24.21µs  p(99.9)=574.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.2ms  min=4.53ms  med=100.03ms max=337.56ms p(90)=120.71ms p(95)=126.83ms p(99.9)=155.3ms 
     http_reqs......................: 59671   494.869084/s
     iteration_duration.............: avg=100.73ms min=14.6ms  med=100.43ms max=347.24ms p(90)=121.09ms p(95)=127.24ms p(99.9)=156.44ms
     iterations.....................: 59571   494.039755/s
     success_rate...................: 100.00% ✓ 59571      ✗ 0    
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

     checks.........................: 100.00% ✓ 104163     ✗ 0    
     data_received..................: 3.1 GB  25 MB/s
     data_sent......................: 42 MB   346 kB/s
     http_req_blocked...............: avg=5.84µs   min=1.07µs  med=3.03µs   max=4.06ms   p(90)=4.34µs   p(95)=4.85µs   p(99.9)=1.19ms  
     http_req_connecting............: avg=2.61µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=172.17ms min=7.35ms  med=177.2ms  max=407.97ms p(90)=183.49ms p(95)=187.74ms p(99.9)=256.35ms
       { expected_response:true }...: avg=172.17ms min=7.35ms  med=177.2ms  max=407.97ms p(90)=183.49ms p(95)=187.74ms p(99.9)=256.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34821
     http_req_receiving.............: avg=94.63µs  min=30µs    med=83.15µs  max=133.74ms p(90)=113.34µs p(95)=124.77µs p(99.9)=556.15µs
     http_req_sending...............: avg=29.57µs  min=5.31µs  med=16.08µs  max=106.81ms p(90)=20.19µs  p(95)=21.86µs  p(99.9)=595.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=172.04ms min=7.22ms  med=177.09ms max=407.56ms p(90)=183.39ms p(95)=187.6ms  p(99.9)=255.16ms
     http_reqs......................: 34821   287.955927/s
     iteration_duration.............: avg=172.92ms min=48.38ms med=177.45ms max=418.54ms p(90)=183.76ms p(95)=188.02ms p(99.9)=257.22ms
     iterations.....................: 34721   287.128966/s
     success_rate...................: 100.00% ✓ 34721      ✗ 0    
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

     checks.........................: 100.00% ✓ 100617     ✗ 0    
     data_received..................: 3.0 GB  24 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=6.65µs   min=1.34µs  med=3.57µs   max=3.77ms   p(90)=5µs      p(95)=5.6µs    p(99.9)=1.34ms  
     http_req_connecting............: avg=2.79µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=178.17ms min=5.56ms  med=165.41ms max=651.1ms  p(90)=209.87ms p(95)=253.26ms p(99.9)=568.11ms
       { expected_response:true }...: avg=178.17ms min=5.56ms  med=165.41ms max=651.1ms  p(90)=209.87ms p(95)=253.26ms p(99.9)=568.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33639
     http_req_receiving.............: avg=94.65µs  min=36.63µs med=89.49µs  max=35.78ms  p(90)=118.66µs p(95)=130.18µs p(99.9)=747.94µs
     http_req_sending...............: avg=34.64µs  min=6.3µs   med=18.43µs  max=86.83ms  p(90)=22.98µs  p(95)=24.75µs  p(99.9)=473.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.04ms min=5.42ms  med=165.3ms  max=650.99ms p(90)=209.73ms p(95)=252.99ms p(99.9)=568.01ms
     http_reqs......................: 33639   278.256217/s
     iteration_duration.............: avg=178.98ms min=52.32ms med=165.76ms max=651.34ms p(90)=210.38ms p(95)=254.66ms p(99.9)=568.47ms
     iterations.....................: 33539   277.429034/s
     success_rate...................: 100.00% ✓ 33539      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 875205      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=7.42µs   min=1.03µs  med=2.64µs   max=63.45ms  p(90)=4.17µs  p(95)=4.87µs  p(99.9)=36.99µs
     http_req_connecting............: avg=4.19µs   min=0s      med=0s       max=63.43ms  p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.32ms  min=1.5ms   med=19.45ms  max=247.63ms p(90)=29.34ms p(95)=33.03ms p(99.9)=54.33ms
       { expected_response:true }...: avg=20.32ms  min=1.5ms   med=19.45ms  max=247.63ms p(90)=29.34ms p(95)=33.03ms p(99.9)=54.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291835
     http_req_receiving.............: avg=791.52µs min=53.24µs med=121.41µs max=130.78ms p(90)=2ms     p(95)=3.01ms  p(99.9)=21.75ms
     http_req_sending...............: avg=47.11µs  min=5.12µs  med=9.81µs   max=119.98ms p(90)=17.8µs  p(95)=92.82µs p(99.9)=4.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.49ms  min=1.41ms  med=18.6ms   max=202.9ms  p(90)=28.36ms p(95)=31.98ms p(99.9)=52.23ms
     http_reqs......................: 291835  2427.80191/s
     iteration_duration.............: avg=20.55ms  min=2.55ms  med=19.66ms  max=298.63ms p(90)=29.56ms p(95)=33.27ms p(99.9)=54.97ms
     iterations.....................: 291735  2426.970001/s
     success_rate...................: 100.00% ✓ 291735      ✗ 0     
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

     checks.........................: 100.00% ✓ 874005      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=2.86µs   min=852ns   med=1.98µs  max=16.4ms   p(90)=3.44µs  p(95)=4.14µs  p(99.9)=32.61µs 
     http_req_connecting............: avg=285ns    min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.37ms  min=1.58ms  med=17.24ms max=337.34ms p(90)=33.2ms  p(95)=40.54ms p(99.9)=139.59ms
       { expected_response:true }...: avg=20.37ms  min=1.58ms  med=17.24ms max=337.34ms p(90)=33.2ms  p(95)=40.54ms p(99.9)=139.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291435
     http_req_receiving.............: avg=572.92µs min=50.07µs med=92.24µs max=270.2ms  p(90)=1.09ms  p(95)=1.86ms  p(99.9)=27.45ms 
     http_req_sending...............: avg=42.14µs  min=4.53µs  med=8.66µs  max=91.64ms  p(90)=17.88µs p(95)=80.23µs p(99.9)=3.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.76ms  min=1.5ms   med=16.73ms max=331.96ms p(90)=32.24ms p(95)=39.42ms p(99.9)=136.2ms 
     http_reqs......................: 291435  2424.434451/s
     iteration_duration.............: avg=20.58ms  min=2.15ms  med=17.44ms max=340.64ms p(90)=33.42ms p(95)=40.77ms p(99.9)=140.14ms
     iterations.....................: 291335  2423.602555/s
     success_rate...................: 100.00% ✓ 291335      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 859524      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=5.84µs  min=971ns   med=2.51µs  max=91.12ms  p(90)=4.06µs  p(95)=4.76µs   p(99.9)=39.38µs
     http_req_connecting............: avg=2.84µs  min=0s      med=0s      max=90.97ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.72ms min=1.75ms  med=20.63ms max=263.64ms p(90)=28.79ms p(95)=31.12ms  p(99.9)=49.42ms
       { expected_response:true }...: avg=20.72ms min=1.75ms  med=20.63ms max=263.64ms p(90)=28.79ms p(95)=31.12ms  p(99.9)=49.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286608
     http_req_receiving.............: avg=83.58µs min=25.74µs med=51.94µs max=69.77ms  p(90)=89.8µs  p(95)=118.97µs p(99.9)=5.08ms 
     http_req_sending...............: avg=41.07µs min=4.82µs  med=10.04µs max=85.09ms  p(90)=16.57µs p(95)=43.22µs  p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.59ms min=1.66ms  med=20.52ms max=216.34ms p(90)=28.66ms p(95)=30.96ms  p(99.9)=48.38ms
     http_reqs......................: 286608  2383.991961/s
     iteration_duration.............: avg=20.93ms min=3.09ms  med=20.83ms max=305.84ms p(90)=28.99ms p(95)=31.33ms  p(99.9)=50.04ms
     iterations.....................: 286508  2383.160165/s
     success_rate...................: 100.00% ✓ 286508      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 857337      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=4.05µs   min=982ns   med=2.61µs  max=17.37ms  p(90)=4.11µs  p(95)=4.8µs   p(99.9)=38.47µs 
     http_req_connecting............: avg=850ns    min=0s      med=0s      max=7.33ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.76ms  min=1.6ms   med=17.22ms max=445.38ms p(90)=34.44ms p(95)=42.31ms p(99.9)=153.13ms
       { expected_response:true }...: avg=20.76ms  min=1.6ms   med=17.22ms max=445.38ms p(90)=34.44ms p(95)=42.31ms p(99.9)=153.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285879
     http_req_receiving.............: avg=606.82µs min=51.38µs med=99.82µs max=204.14ms p(90)=1.11ms  p(95)=1.94ms  p(99.9)=29.01ms 
     http_req_sending...............: avg=44.63µs  min=4.92µs  med=9.98µs  max=89.31ms  p(90)=17.94µs p(95)=88.99µs p(99.9)=3.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.11ms  min=1.51ms  med=16.67ms max=444.62ms p(90)=33.37ms p(95)=41.09ms p(99.9)=150.44ms
     http_reqs......................: 285879  2378.17334/s
     iteration_duration.............: avg=20.98ms  min=2.16ms  med=17.43ms max=445.69ms p(90)=34.66ms p(95)=42.55ms p(99.9)=154.1ms 
     iterations.....................: 285779  2377.341459/s
     success_rate...................: 100.00% ✓ 285779      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 790398      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 317 MB  2.6 MB/s
     http_req_blocked...............: avg=2.91µs   min=892ns  med=2.07µs   max=13ms     p(90)=3.56µs  p(95)=4.26µs  p(99.9)=32.86µs 
     http_req_connecting............: avg=335ns    min=0s     med=0s       max=3.62ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.54ms  min=1.97ms med=18.89ms  max=350.51ms p(90)=36.38ms p(95)=45.09ms p(99.9)=165.03ms
       { expected_response:true }...: avg=22.54ms  min=1.97ms med=18.89ms  max=350.51ms p(90)=36.38ms p(95)=45.09ms p(99.9)=165.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263566
     http_req_receiving.............: avg=594.66µs min=51.5µs med=102.27µs max=229.3ms  p(90)=1.12ms  p(95)=1.91ms  p(99.9)=27.88ms 
     http_req_sending...............: avg=38.06µs  min=4.62µs med=8.94µs   max=166.8ms  p(90)=18µs    p(95)=48.4µs  p(99.9)=2.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.91ms  min=1.85ms med=18.36ms  max=350.43ms p(90)=35.34ms p(95)=43.88ms p(99.9)=163.6ms 
     http_reqs......................: 263566  2191.803715/s
     iteration_duration.............: avg=22.76ms  min=2.91ms med=19.1ms   max=350.7ms  p(90)=36.59ms p(95)=45.3ms  p(99.9)=166.46ms
     iterations.....................: 263466  2190.972119/s
     success_rate...................: 100.00% ✓ 263466      ✗ 0     
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

     checks.........................: 100.00% ✓ 588678      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 236 MB  2.0 MB/s
     http_req_blocked...............: avg=3.31µs  min=872ns   med=2.25µs  max=3.89ms   p(90)=4.36µs   p(95)=5.44µs   p(99.9)=44.19µs
     http_req_connecting............: avg=494ns   min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.32ms min=2.25ms  med=29.84ms max=297.1ms  p(90)=39.99ms  p(95)=43.31ms  p(99.9)=63.32ms
       { expected_response:true }...: avg=30.32ms min=2.25ms  med=29.84ms max=297.1ms  p(90)=39.99ms  p(95)=43.31ms  p(99.9)=63.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196326
     http_req_receiving.............: avg=93.59µs min=28.37µs med=55.76µs max=196.8ms  p(90)=125.38µs p(95)=201.01µs p(99.9)=3.63ms 
     http_req_sending...............: avg=42.54µs min=4.7µs   med=9.57µs  max=166.64ms p(90)=23.97µs  p(95)=107.01µs p(99.9)=3.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.19ms min=2.13ms  med=29.72ms max=296.42ms p(90)=39.84ms  p(95)=43.14ms  p(99.9)=62.55ms
     http_reqs......................: 196326  1632.066515/s
     iteration_duration.............: avg=30.56ms min=8.09ms  med=30.06ms max=317.37ms p(90)=40.21ms  p(95)=43.53ms  p(99.9)=63.77ms
     iterations.....................: 196226  1631.23521/s
     success_rate...................: 100.00% ✓ 196226      ✗ 0     
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

     checks.........................: 100.00% ✓ 429858      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.98µs  min=1.14µs  med=2.97µs  max=4.14ms   p(90)=4.57µs   p(95)=5.29µs   p(99.9)=35.97µs 
     http_req_connecting............: avg=705ns   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.61ms min=2.2ms   med=41.24ms max=304.3ms  p(90)=57.76ms  p(95)=62.7ms   p(99.9)=85.97ms 
       { expected_response:true }...: avg=41.61ms min=2.2ms   med=41.24ms max=304.3ms  p(90)=57.76ms  p(95)=62.7ms   p(99.9)=85.97ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143386
     http_req_receiving.............: avg=87.52µs min=27.48µs med=70.42µs max=230.71ms p(90)=111.22µs p(95)=129.42µs p(99.9)=942.46µs
     http_req_sending...............: avg=26.81µs min=5.55µs  med=13.07µs max=132.28ms p(90)=19.86µs  p(95)=23.82µs  p(99.9)=1.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.49ms min=2.06ms  med=41.13ms max=284.75ms p(90)=57.64ms  p(95)=62.58ms  p(99.9)=85.69ms 
     http_reqs......................: 143386  1192.085522/s
     iteration_duration.............: avg=41.86ms min=4.68ms  med=41.47ms max=330.34ms p(90)=57.98ms  p(95)=62.93ms  p(99.9)=86.36ms 
     iterations.....................: 143286  1191.25414/s
     success_rate...................: 100.00% ✓ 143286      ✗ 0     
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

     checks.........................: 100.00% ✓ 209271     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   696 kB/s
     http_req_blocked...............: avg=4.1µs   min=1.02µs  med=2.66µs  max=3.43ms   p(90)=4.11µs   p(95)=4.74µs   p(99.9)=47.82µs 
     http_req_connecting............: avg=1.2µs   min=0s      med=0s      max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.65ms min=3.86ms  med=83.65ms max=322.15ms p(90)=105.05ms p(95)=115.89ms p(99.9)=200.18ms
       { expected_response:true }...: avg=85.65ms min=3.86ms  med=83.65ms max=322.15ms p(90)=105.05ms p(95)=115.89ms p(99.9)=200.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69857
     http_req_receiving.............: avg=80.23µs min=28.25µs med=70.36µs max=95.05ms  p(90)=106.45µs p(95)=119.03µs p(99.9)=652.09µs
     http_req_sending...............: avg=20.61µs min=5.09µs  med=13.46µs max=142.81ms p(90)=20.56µs  p(95)=22.68µs  p(99.9)=570.65µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.55ms min=3.71ms  med=83.56ms max=320.41ms p(90)=104.95ms p(95)=115.79ms p(99.9)=199.9ms 
     http_reqs......................: 69857   579.66595/s
     iteration_duration.............: avg=86.02ms min=17.06ms med=83.9ms  max=338.52ms p(90)=105.29ms p(95)=116.18ms p(99.9)=202.71ms
     iterations.....................: 69757   578.836161/s
     success_rate...................: 100.00% ✓ 69757      ✗ 0    
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

     checks.........................: 100.00% ✓ 162264     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=4.94µs   min=1.08µs  med=3.24µs   max=3.3ms    p(90)=4.72µs   p(95)=5.3µs    p(99.9)=58.56µs 
     http_req_connecting............: avg=1.5µs    min=0s      med=0s       max=3.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.5ms  min=4.96ms  med=108.26ms max=312.3ms  p(90)=146.15ms p(95)=157.48ms p(99.9)=202.79ms
       { expected_response:true }...: avg=110.5ms  min=4.96ms  med=108.26ms max=312.3ms  p(90)=146.15ms p(95)=157.48ms p(99.9)=202.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54188
     http_req_receiving.............: avg=84.78µs  min=29.2µs  med=81.44µs  max=50.63ms  p(90)=111.88µs p(95)=124.28µs p(99.9)=545.96µs
     http_req_sending...............: avg=28.13µs  min=4.74µs  med=16.89µs  max=109.27ms p(90)=21.95µs  p(95)=23.84µs  p(99.9)=567.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.38ms min=4.87ms  med=108.16ms max=311.77ms p(90)=146.02ms p(95)=157.34ms p(99.9)=202.68ms
     http_reqs......................: 54188   449.11883/s
     iteration_duration.............: avg=110.96ms min=32.64ms med=108.58ms max=328.18ms p(90)=146.47ms p(95)=157.8ms  p(99.9)=204.5ms 
     iterations.....................: 54088   448.290014/s
     success_rate...................: 100.00% ✓ 54088      ✗ 0    
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

     checks.........................: 100.00% ✓ 98043      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.74µs   min=1.3µs   med=3.47µs   max=3.86ms   p(90)=4.85µs   p(95)=5.43µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=182.86ms min=7.71ms  med=189.46ms max=377.27ms p(90)=203.07ms p(95)=207.25ms p(99.9)=272.73ms
       { expected_response:true }...: avg=182.86ms min=7.71ms  med=189.46ms max=377.27ms p(90)=203.07ms p(95)=207.25ms p(99.9)=272.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32781
     http_req_receiving.............: avg=101.18µs min=34.98µs med=90.97µs  max=109.3ms  p(90)=123.16µs p(95)=136.52µs p(99.9)=545.48µs
     http_req_sending...............: avg=30.17µs  min=5.5µs   med=17.9µs   max=60.8ms   p(90)=22.78µs  p(95)=24.69µs  p(99.9)=551.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.72ms min=7.57ms  med=189.33ms max=377.03ms p(90)=202.94ms p(95)=207.11ms p(99.9)=272.58ms
     http_reqs......................: 32781   271.009384/s
     iteration_duration.............: avg=183.68ms min=42.19ms med=189.78ms max=385.78ms p(90)=203.36ms p(95)=207.56ms p(99.9)=273.51ms
     iterations.....................: 32681   270.182657/s
     success_rate...................: 100.00% ✓ 32681      ✗ 0    
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

     checks.........................: 100.00% ✓ 97638      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=6.38µs   min=1.11µs  med=3.15µs   max=4.16ms   p(90)=4.51µs   p(95)=5.08µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=3.02µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=183.61ms min=5.9ms   med=169.01ms max=685.55ms p(90)=214.54ms p(95)=257.79ms p(99.9)=596.68ms
       { expected_response:true }...: avg=183.61ms min=5.9ms   med=169.01ms max=685.55ms p(90)=214.54ms p(95)=257.79ms p(99.9)=596.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32646
     http_req_receiving.............: avg=99.15µs  min=28.09µs med=90.24µs  max=73.34ms  p(90)=121.64µs p(95)=134.8µs  p(99.9)=768.46µs
     http_req_sending...............: avg=24.34µs  min=5.13µs  med=17.61µs  max=63.5ms   p(90)=22.09µs  p(95)=23.84µs  p(99.9)=532.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.48ms min=5.79ms  med=168.89ms max=685.48ms p(90)=214.42ms p(95)=257.57ms p(99.9)=596.57ms
     http_reqs......................: 32646   270.199035/s
     iteration_duration.............: avg=184.45ms min=29.73ms med=169.36ms max=685.7ms  p(90)=214.97ms p(95)=259.27ms p(99.9)=596.94ms
     iterations.....................: 32546   269.371372/s
     success_rate...................: 100.00% ✓ 32546      ✗ 0    
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

     checks.........................: 100.00% ✓ 7470      ✗ 0   
     data_received..................: 248 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=87.11µs min=1.27µs   med=3.16µs  max=7.77ms  p(90)=4.63µs   p(95)=5.6µs    p(99.9)=7.5ms   
     http_req_connecting............: avg=81.96µs min=0s       med=0s      max=7.75ms  p(90)=0s       p(95)=0s       p(99.9)=7.48ms  
     http_req_duration..............: avg=2.33s   min=26.95ms  med=2.4s    max=4.68s   p(90)=3.18s    p(95)=3.39s    p(99.9)=4.66s   
       { expected_response:true }...: avg=2.33s   min=26.95ms  med=2.4s    max=4.68s   p(90)=3.18s    p(95)=3.39s    p(99.9)=4.66s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2590
     http_req_receiving.............: avg=98.36µs min=34.72µs  med=91.7µs  max=7.75ms  p(90)=128.49µs p(95)=142.35µs p(99.9)=780.71µs
     http_req_sending...............: avg=77.56µs min=5.84µs   med=18.06µs max=19.64ms p(90)=23.16µs  p(95)=27.78µs  p(99.9)=3.41ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.33s   min=26.81ms  med=2.4s    max=4.68s   p(90)=3.18s    p(95)=3.39s    p(99.9)=4.66s   
     http_reqs......................: 2590    20.557894/s
     iteration_duration.............: avg=2.42s   min=584.06ms med=2.43s   max=4.68s   p(90)=3.19s    p(95)=3.4s     p(99.9)=4.66s   
     iterations.....................: 2490    19.764153/s
     success_rate...................: 100.00% ✓ 2490      ✗ 0   
     vus............................: 32      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

